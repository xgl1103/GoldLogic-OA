# OA-AI 接口说明（OpenClaw 数字员工对接）

> 配套《知识管理中心-OA流程监控看板》——「OA 流程监控数字化员工」的前提性接口层
> 更新：2026-09-08，全部接口本机实测通过

---

## 一、定位

这组接口是给外部 AI 平台（OpenClaw 等）用的**薄 API 层**，让 AI 数字员工可以：

1. 7×24 巡检 OA 审批流（拉取在途审批单 + 停留时长 + 当前审批人）
2. 按预警规则（24h×1次 / 48h 累计3次 / 48h 判无需审批）生成催促
3. 给审批人发催促站内信
4. 统计审批健康度，生成周报/月报并落盘为 OA 公告

**AI 逻辑（巡检规则、催促话术、报告文案）全部在 OpenClaw 侧实现**，OA 只提供数据读写接口。二期若要「超时自动砍单 / 审批人移出节点」等写操作，再评估后开放。

---

## 二、鉴权（JWT 无状态）

统一返回格式：`{"code": 0成功/1失败, "msg": "...", "data": {...}}`

```
步骤1：POST http://<OA域名>/api/ai/token
       Content-Type: application/x-www-form-urlencoded
       Body: username=aiworker&password=<密码>
       ← {"code":0,"msg":"ok","data":{"token":"eyJ0eXAi...","expires_in":3600,"uid":61,"name":"小奥"}}

步骤2：其余接口统一带自定义请求头
       Token: <上一步拿到的 token>
```

- **Token 有效期 3600 秒**（1 小时，由 `oa_config` 表 `name='token'` 的 `exptime` 控制），过期返回 `{"code":401,"msg":"token已过期"}`，需重新换取。
- **注意是自定义头 `Token`，不是 `Authorization`**。
- 无 Token 访问返回 `{"code":404,"msg":"token不能为空"}`。

### 专用账号

| 项 | 值 |
|---|---|
| 账号 | `aiworker` |
| 姓名/昵称 | 小奥 / OA流程监控数字化员工 |
| 密码 | `Ai@YHLG66TqtZYg5h` |
| uid | 61 |
| 部门 | AI运营部 |
| 职位 | 数字化员工（新建） |

> ⚠️ 这组接口是**全公司管理视野**（可看任何人待办、发全员消息）。Token 务必只发给数字员工专用账号，勿分发给普通员工。

---

## 三、接口清单

Base URL：`http://<OA域名>`（本地 `http://127.0.0.1:8010`，穿透域名见内网穿透说明）

### 1. `GET /api/ai/ping` — 连通测试 + 在途总览

心跳接口，顺手返回各审批类型在途单数量，适合 OpenClaw 定时任务先 ping 一眼判断有无异常。

```bash
curl -s "http://127.0.0.1:8010/api/ai/ping" -H "Token: $TOKEN"
```

返回 `data` 关键字段：
- `user`：当前 token 身份
- `pending_total`：在途审批单总数
- `pending_by_type`：`[{type, type_title, pending}]` 各类型在途数

### 2. `GET /api/ai/approve_pending` — 在途审批巡检（核心）

拉全公司在途审批单（`check_status=1`），按停留时长降序。

| 参数 | 必填 | 说明 |
|---|---|---|
| `type` | 否 | 按流程标识过滤，逗号分隔（如 `leaves,expense,seal`） |
| `uid` | 否 | 只看某审批人名下的待审 |
| `hours` | 否 | 只看停留超过 N 小时的单（如 `hours=24`） |

```bash
curl -s "http://127.0.0.1:8010/api/ai/approve_pending?hours=24" -H "Token: $TOKEN"
```

返回 `data`：
```json
{
  "now": "2026-09-08 18:38:54",
  "total": 30,
  "filtered_out": 0,
  "items": [
    {
      "type": "contract", "type_title": "销售合同", "id": 1092,
      "title": "恒昌智能制造生产模块采购合同",
      "apply_uid": 15, "apply_name": "冯乐",
      "step_sort": 1,
      "check_users": [{"uid": 8, "name": "饶旺"}],
      "step_start_at": "2026-09-05 09:00:00",
      "stay_seconds": 293934, "stay_hours": 81.6,
      "risk": "high",
      "url": "/contract/contract/view?id=1092"
    }
  ]
}
```

字段说明：
- `stay_hours`：当前审批节点停留时长（**口径 = now − max(上一次审批动作时间, 提交时间)**）
- `risk`：静态分级提示（`>48h=high` / `>24h=mid` / 其余 `low`），与 PPT 预警阈值对齐，AI 侧可忽略自行判定
- `check_users`：当前节点审批人数组（会签时多个）；**为空说明该单审批人推导异常，是需要重点暴露的问题单**
- `url`：OA 内单据详情页相对路径（拼域名可直接跳转）

### 3. `GET /api/ai/approve_stats` — 审批健康度统计

周报/月报的数据原料。

| 参数 | 必填 | 说明 |
|---|---|---|
| `days` | 否 | 统计窗口天数，默认 30（完结单据按最后审批动作时间落在窗口内统计） |

```bash
curl -s "http://127.0.0.1:8010/api/ai/approve_stats?days=30" -H "Token: $TOKEN"
```

返回 `data` 三块：
- `by_type`：各审批类型 `{pending, approved, rejected, revoked, avg_approve_hours}`（平均审批耗时=通过单 `check_time − create_time` 均值，单位小时）
- `by_checker`：按审批人聚合的在途负载 `{uid, name, pending, max_stay_hours}`，按在途量降序
- `by_applier`：按申请人聚合的提交量 `{uid, name, submitted}`，按提交量降序

### 4. `GET /api/ai/todo_list` — 指定员工待办

| 参数 | 必填 | 说明 |
|---|---|---|
| `uid` | 否 | 目标员工，默认当前 token 身份 |

```bash
curl -s "http://127.0.0.1:8010/api/ai/todo_list?uid=19" -H "Token: $TOKEN"
```

返回 `data`：
- `approve_items`：该员工待审明细（结构与 `approve_pending` 的 item 一致，含 `stay_hours`/`url`）
- `tasks`：待办项目任务 `{id, title, project_id, end_at, overdue}`（`overdue`=是否逾期）
- `summary`：`{approve_count, task_count, overdue_task, max_stay_hours}`

### 5. `POST /api/ai/message_send` — 发送催促站内信

AI 生成催促文案后调用，双写发件箱（数字员工留痕）+ 收件箱（审批人收到）。

| 参数 | 必填 | 说明 |
|---|---|---|
| `to_uids` | 是 | 接收人 uid，逗号分隔（如 `"8,3"`） |
| `title` | 是 | 标题（≤90 字自动截断） |
| `content` | 是 | 正文纯文本（≤10 万字） |
| `action_id` | 否 | 关联单据 id（收件详情可跳转） |

```bash
curl -s -X POST "http://127.0.0.1:8010/api/ai/message_send" -H "Token: $TOKEN" \
  -d "to_uids=8&title=【AI督办】您有审批已停留超过24小时&content=林牧远提交的报销单已停留26小时，请及时处理。&action_id=1000"
```

返回：`{"data":{"message_id":1000,"to_uids":[8],"send_count":1}}`

### 6. `POST /api/ai/note_publish` — 健康度报告落盘为公告

| 参数 | 必填 | 说明 |
|---|---|---|
| `title` | 是 | 公告标题（≤200 字） |
| `content` | 是 | 正文（支持 HTML） |
| `cate_id` | 否 | 公告分类：1 普通（默认）、2 紧急 |

```bash
curl -s -X POST "http://127.0.0.1:8010/api/ai/note_publish" -H "Token: $TOKEN" \
  --data-urlencode "title=本周审批健康度周报" \
  --data-urlencode "content=<h3>本周审批健康度</h3><p>在途 30 单，高危 6 单……</p>"
```

返回：`{"data":{"note_id":1005,"url":"/adm/note/view?id=1005"}}`（发布人=数字员工，全员可见）

---

## 四、PPT 需求 → 接口映射

| PPT 功能点 | 落地接口 | 说明 |
|---|---|---|
| 7×24 巡检审批节点 | `approve_pending`（或先 `ping` 看总量） | 定时轮询 |
| 24h×1次 / 48h累计3次 预警 | `approve_pending?hours=24` + AI 侧状态机计数 | 接口无状态，计数逻辑在 OpenClaw |
| 48h 判「无需审批」 | 同上，AI 侧判定后提示 | 自动砍单属写操作，二期 |
| 连续两月高风险审批人移出节点 | `approve_stats` 的 `by_checker` | 移出节点属写操作，二期 |
| 周/月审批健康度报告 | `approve_stats` → AI 生成文案 → `note_publish` | 全链路可自动 |
| 催促审批人 | `approve_pending` 找责任人 → `message_send` | 全链路可自动 |
| 健康度看板数据 | `approve_stats` + `approve_pending` | 供看板消费 |

---

## 五、OpenClaw 使用建议

1. **鉴权缓存**：Token 有效期 1 小时，建议缓存在内存并在 401 时自动重新 `token` 换取。
2. **巡检节奏**：轻量心跳用 `ping`（快），发现 `pending_total>0` 再拉 `approve_pending` 明细；或直接 `approve_pending?hours=24` 只取需预警的单。
3. **预警状态机**：接口无状态，OpenClaw 需自行维护「谁的单、催过几次、累计停留」的计数（可存本地文件/SQLite），实现 24h×1次、48h累计3次、48h判无需审批的规则。
4. **催促文案**：用 `item` 里的 `type_title`+`title`+`apply_name`+`stay_hours` 组装自然语言，`action_id` 传单据 id 便于收件人点详情直达。
5. **报告落盘**：周报/月报用 `approve_stats` 生成数据 → LLM 写 HTML 文案 → `note_publish` 发布为全员公告。

---

## 六、二期（暂未开放，避免 AI 误操作）

以下写操作目前**未提供接口**，需要时再评估并加人工确认环节：

- `approve_auto_pass`：超时自动通过/砍单
- 审批人移出审批节点
- 自动代提审批

---

## 七、本接口层的技术实现（供维护参考）

- 文件：`gouguoa/app/api/controller/Ai.php`（继承 `app/api/BaseController`，`Auth` 中间件做 JWT 鉴权，`except=['token']`）。
- **关键点**：覆盖了 `initialize()`，不做 Session 检查（父类 `checkLogin()` 依赖浏览器会话，会拦掉服务端对服务端的调用；此前 `/api/demo/login` 纯 JWT 访问会被「请先登录」拦下，就是此原因）。
- 审批分类来自 `oa_flow_cate`（19 类），单据表统一有 `check_status`(1审批中/2通过/3拒绝/4撤销)、`check_uids`(逗号分隔当前审批人)、`check_time`、`create_time`、`admin_id`。
- 站内信双写 `oa_message`（发件箱）+ `oa_msg`（收件箱），公告写 `oa_note`。

### 本次顺带修复的 nginx 缺陷

`docker/nginx/oauth.conf` 的 `try_files $uri $uri/ /index.php?s=$uri;` 在内部重定向时会**丢失 query string**（表现为 `?days=7` 这类 GET 参数全部收不到，分页/搜索/统计过滤都会失效）。已改为：

```nginx
try_files $uri $uri/ /index.php?s=$uri&$args;
```

改后已 `nginx -s reload` 生效，简洁 URL 的 query 参数恢复正常。
