# OA 系统技术文档包（G1 审核 · 技术待确认项应答）

> 项目：OA 流程监控数字化员工（配套《知识管理中心-OA流程监控看板》）
> 日期：2026-09-09 · 状态：接口层已开发完成并全链路实测通过
> 业务侧已确认：Owner=饶旺 ｜ 预警触达=审批人本人+抄送上级（OA 站内信）｜ 48h 未审批判「无需审批」｜ 试点=审批量最大的 2-3 个类型
> 本文档应答技术层 RR 项：OA 版本与接口类型（RR-01）、业务模块清单（RR-02）、审批数据字段（RR-03）、触达通道实现（RR-04）

---

## 一、系统概览（RR-01）

| 项 | 内容 |
|---|---|
| 系统 | GoldLogic OA（勾股 OA 本地化定制版，ThinkPHP 框架） |
| 部署 | Docker Compose：nginx(stable-alpine) + php8.2-fpm + mariadb 10.11 |
| 接口风格 | HTTP REST，统一 JSON 返回：`{"code": 0成功/1失败, "msg": "...", "data": {...}}` |
| 鉴权 | JWT（自定义请求头 **`Token:`**，有效期 3600 秒） |
| AI 接口层 | `/api/ai/` 下 7 个专用接口（已实测，详见第三节） |
| 代码位置 | `gouguoa/app/api/controller/Ai.php`（维护参考，AI 侧无需关心） |

### 访问入口

| 场景 | Base URL |
|---|---|
| OpenClaw（外网） | `https://www.u3691404.nyat.app:20857` |
| 本地调试 | `http://127.0.0.1:8010` |

> ⚠️ **关键前置依赖（联调阻塞项）**：OpenClaw 平台的 egress 代理目前拦截 `*.nyat.app` 域名。已提交白名单申请（域名 `www.u3691404.nyat.app` + 端口 20857 + HTTPS）。放行前，联调只能在本机用 `127.0.0.1:8010` 先行。服务器侧已验证服务健康（直连秒回 302）。

---

## 二、对接的业务模块与数据范围（RR-02）

一期只做**读 + 催促闭环**，覆盖审批流全 19 类单据：

| 能力 | 接口 | 说明 |
|---|---|---|
| 7×24 巡检在途审批 | `GET /api/ai/approve_pending` | 全公司在途单 + 停留时长 + 当前审批人 + 风险分级 |
| 审批健康度统计 | `GET /api/ai/approve_stats` | 按类型 / 按审批人 / 按申请人聚合 |
| 个人待办 | `GET /api/ai/todo_list` | 指定员工的待审 + 项目任务 |
| 催办触达 | `POST /api/ai/message_send` | 站内信（审批人本人 + 抄送上级） |
| 报告落盘 | `POST /api/ai/note_publish` | 周/月健康度报告发为全员公告 |
| 心跳探活 | `GET /api/ai/ping` | 连通测试 + 在途总量 |

**二期（本期不开放）**：审批写操作——超时自动砍单/自动通过、审批人移出节点。48h 判「无需审批」一期只做**标注与上报**（发报告说明该单疑似无需审批，建议人工处理），**不修改单据状态**。

---

## 三、接口规格

### 3.1 鉴权（所有调用的第一步）

```
POST /api/ai/token
Content-Type: application/x-www-form-urlencoded
Body: username=aiworker&password=<密码，走私密渠道提供>
```

返回：`{"code":0,"data":{"token":"eyJ0eXAi...","expires_in":3600,"uid":61,"name":"小奥"}}`

- 之后每个请求带请求头：`Token: <token>`（注意**不是** `Authorization`）
- 过期返回 `{"code":401}`，重新换取即可；建议 OpenClaw 缓存 token、401 自动重取
- 无 token 返回 `{"code":404,"msg":"token不能为空"}`

### 3.2 `GET /api/ai/ping` — 心跳 + 在途总览

无参数。返回 `data.user`（身份）、`data.pending_total`（在途总数）、`data.pending_by_type[]`（各类型在途数）。
建议：定时任务先 ping（轻），异常再拉明细。

### 3.3 `GET /api/ai/approve_pending` — 巡检核心 ⭐

| 参数 | 必填 | 说明 |
|---|---|---|
| `type` | 否 | 按流程标识过滤，逗号分隔（如 `leaves,expense,meetings`） |
| `uid` | 否 | 只看某审批人名下的待审 |
| `hours` | 否 | 只看停留超过 N 小时的单 |

返回 `data`：

```json
{
  "now": "2026-09-08 18:38:54",
  "total": 30, "filtered_out": 0,
  "items": [{
    "type": "contract", "type_title": "销售合同", "id": 1092,
    "title": "恒昌智能制造生产模块采购合同",
    "apply_uid": 15, "apply_name": "冯乐",
    "step_sort": 1,
    "check_users": [{"uid": 8, "name": "饶旺"}],
    "step_start_at": "2026-09-05 09:00:00",
    "stay_seconds": 293934, "stay_hours": 81.6,
    "risk": "high",
    "url": "/contract/contract/view?id=1092"
  }]
}
```

字段口径：
- `stay_hours` = 当前节点停留时长 = `now − max(上一次审批动作时间, 提交时间)`
- `risk` 静态分级：`>48h=high / >24h=mid / 其余=low`（AI 可按自己的规则重算）
- `check_users` 为空数组 = 该单审批人推导异常（会签无候选人之类），是**需要重点暴露的问题单**
- `url` 为相对路径，拼 Base URL 可直达单据详情页

### 3.4 `GET /api/ai/approve_stats` — 健康度统计

参数：`days`（统计窗口天数，默认 30）。返回三块：
- `by_type[]`：`{type, type_title, pending, approved, rejected, revoked, avg_approve_hours}`
- `by_checker[]`：按审批人 `{uid, name, pending, max_stay_hours}`（在途负载，降序）
- `by_applier[]`：按申请人 `{uid, name, submitted}`（提交量，降序）

### 3.5 `GET /api/ai/todo_list` — 员工待办

参数：`uid`（默认当前身份）。返回 `approve_items[]`（待审明细，结构同 3.3 item）、`tasks[]`（项目任务，含 `overdue`）、`summary{approve_count, task_count, overdue_task, max_stay_hours}`。

### 3.6 `POST /api/ai/message_send` — 催办站内信（RR-04 触达通道）

| 参数 | 必填 | 说明 |
|---|---|---|
| `to_uids` | 是 | 接收人 uid，**逗号分隔多人**（审批人本人 + 上级一起传即可实现抄送） |
| `title` | 是 | ≤90 字自动截断 |
| `content` | 是 | 纯文本 |
| `action_id` | 否 | 关联单据 id，收件详情可跳转 |

返回 `{"data":{"message_id":1000,"to_uids":[8],"send_count":1}}`。双写发件箱（数字员工留痕）+ 收件箱。

### 3.7 `POST /api/ai/note_publish` — 报告落盘为公告

| 参数 | 必填 | 说明 |
|---|---|---|
| `title` | 是 | ≤200 字 |
| `content` | 是 | 支持 HTML |
| `cate_id` | 否 | 1 普通（默认）/ 2 紧急 |

返回 `{"data":{"note_id":1005,"url":"/adm/note/view?id=1005"}}`（发布人=小奥，全员可见）。

---

## 四、审批数据模型（RR-03）

19 类审批单据表**统一审批字段**（各类业务字段不同，但以下字段全部一致，AI 通过接口消费，无需直连数据库）：

| 字段 | 含义 |
|---|---|
| `check_status` | 0 待提交 / 1 审批中 / 2 通过 / 3 拒绝 / 4 撤销 |
| `check_uids` | 当前节点审批人（逗号分隔多 uid）——巡检核心字段 |
| `check_step_sort` | 当前步骤序号 |
| `check_history_uids` | 历史审批人 |
| `check_time` | 最近审批动作时间（停留时长计算基准） |
| `admin_id` | 申请人 |

辅助表：`oa_flow_cate`（类型↔表名映射）、`oa_flow / oa_flow_step / oa_flow_record`（流程定义 / 步骤实例 / 审批记录）。

**预警状态机说明**：接口无状态。OpenClaw 需自行维护「单据 id → 已催次数 / 累计停留」计数（本地文件或 SQLite），实现 24h×1 次、48h 累计 3 次、48h 判无需审批三条规则。

---

## 五、预警触达实现（RR-04，业务已确认方案）

**确认方案**：审批人本人 + 抄送上级，OA 站内信触达；48h 未审批判「无需审批」。

### 5.1 触达实现（一期可用，零额外开发）

```text
催办人  = approve_pending 返回的 check_users[].uid
抄送上级 = 附录 A 映射表查该 uid 的「部门负责人 uids」（排除本人）
调用    = POST /api/ai/message_send
          to_uids = "审批人uid,上级uid"   ← 一条消息同时送达
          action_id = 单据 id
```

### 5.2 上级推导口径

- 员工 → 部门：`oa_admin.did` → `oa_department.title`
- 部门 → 负责人：`oa_department.leader_ids`（逗号分隔 uid，可多人）
- **一期采用静态映射**（附录 A），OpenClaw 缓存使用；人员/组织调整时由 OA 侧重新导出。若需要实时查询，二期可在 Ai.php 增加 `dept_leaders` 查询接口。
- 特例：审批人本身就是部门负责人（如饶旺 uid=8，负责人=徐冠林 uid=2）→ 抄送其部门负责人；若映射查不到（负责人为空），只发审批人本人并在消息里注明。

### 5.3 48h「无需审批」判定（一期口径）

- AI 侧判定：单据停留 >48h 且未催出结果 → 在巡检记录中标注「疑似无需审批」，**写入周报并单独通知 Owner（饶旺）**，由人工决定后续
- **不改单据状态**（自动砍单属写操作，二期加人工确认后再开放）

---

## 六、试点范围（业务已确认：审批量最大的 2-3 个类型）

基于近 30 天真实数据（`approve_stats?days=30` 实测）：

| 排名 | 审批类型 | type 标识 | 30天单量 | 在途 | 平均耗时 |
|---|---|---|---|---|---|
| 1 | 请假 | `leaves` | 25 | 8 | 23.6h |
| 2 | 报销 | `expense` | 5 | 5 | （无一完结，全滞留） |
| 3 | 会议室预定 | `meetings` | 5 | 4 | 23.0h |

**试点参数**：巡检调用 `approve_pending?type=leaves,expense,meetings`；跑顺后去掉 `type` 参数即可扩展到全 19 类。

> 报销类 5 单全部在途且无一完结——本身就是最需要监控的类型，试点价值高。

---

## 七、联调步骤与验收清单

```bash
# ① 换 token
curl -s -X POST "$BASE/api/ai/token" -d "username=aiworker&password=<密码>"
# ② 心跳
curl -s "$BASE/api/ai/ping" -H "Token: $TOKEN"
# ③ 巡检（试点类型，超24h的）
curl -s "$BASE/api/ai/approve_pending?type=leaves,expense,meetings&hours=24" -H "Token: $TOKEN"
# ④ 模拟催办（发一条测试消息给小奥自己，验证通道，避免扰民）
curl -s -X POST "$BASE/api/ai/message_send" -H "Token: $TOKEN" \
  -d "to_uids=61&title=联调测试&content=test"
# ⑤ 发布测试公告（验证后由 OA 侧软删）
curl -s -X POST "$BASE/api/ai/note_publish" -H "Token: $TOKEN" \
  --data-urlencode "title=联调测试公告" --data-urlencode "content=test"
```

验收标准：①-⑤ 全部返回 `code:0`；`approve_pending` 的 `stay_hours`/`check_users` 与 OA 页面人工核对一致。

---

## 八、附录 A：全员「部门 / 上级」映射表（2026-09-09 导出）

> 用途：催办抄送上级（见 5.1/5.2）。`负责人uid` 即该员工部门负责人的 uid；员工本人就是负责人时，上级取其所在部门负责人中非本人的 uid。

| uid | 姓名 | 部门 | 负责人 uid |
|---|---|---|---|
| 1 | 超级员工(admin) | 董事会 | 2 |
| 2 | 徐冠林 | 人事部 | 5 |
| 3 | 李四 | 技术部 | 9 |
| 4 | 张三 | 技术部 | 9 |
| 5 | 王五 | 人事部 | 5 |
| 6 | 赵六 | 财务部 | 6 |
| 7 | 钱七 | 市场部 | 7 |
| 8 | 饶旺 | 董事会 | 2 |
| 9 | 刘凌聪 | 技术部 | 9 |
| 10 | 陈佳彤 | 财务部 | 6 |
| 11 | 王子怡 | 市场部 | 7 |
| 12 | 周雨桐 | 人事部 | 5 |
| 13 | 吴昊 | 技术部 | 9 |
| 14 | 郑晓岚 | 产品部 | 14 |
| 15 | 冯乐 | 销售部 | 15 |
| 16 | 许静 | 财务部 | 6 |
| 17 | 何俊 | 客服部 | 17 |
| 18 | 姚磊 | 产品部 | 14 |
| 19 | 林牧远 | 董事会 | 2 |
| 20 | 苏晚晴 | 人事部 | 5 |
| 21 | 叶知秋 | 人事部 | 5 |
| 22 | 洛清言 | AI运营部 | 62 |
| 23-51 | （AI培训班员工共 29 人） | AI运营部 | 62 |
| 52 | 华清莹 | 深圳办事处 | 52 |
| 53 | 金柏川 | 宜宾办事处 | 53 |
| 54 | 蒲映雪 | 上海办事处 | 54 |
| 55 | 侯振宇 | 技术部 | 9 |
| 56 | 谢俊雄 | 技术部 | 9 |
| 57 | 刘家旭 | 销售部 | 15 |
| 58 | 刘柏杨 | 人事部 | 5 |
| 59 | 井浩正 | 董事会 | 2 |
| 60 | 孙家俊 | 技术部 | 9 |
| 61 | 小奥（数字员工） | AI运营部 | 62 |
| 62 | 许明霞 | AI运营部 | 62 |

> 注：uid 22-51 为 AI 运营部批量员工（负责人均为 62 许明霞），此处折叠展示，OpenClaw 侧按「部门→负责人」建映射即可。

## 九、附录 B：错误码

| code | 含义 | 处理 |
|---|---|---|
| 0 | 成功 | — |
| 1 | 业务失败（参数缺失等） | 看 `msg` |
| 401 | token 过期/无效 | 重新 `token` 换取 |
| 404 | token 未携带 | 补 `Token` 请求头 |
