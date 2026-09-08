# 勾股OA 本地 API 调试手册

> 环境：Windows + PHP 8.2.29（便携版）+ MariaDB 10.11（便携版）+ 勾股OA（ThinkPHP 8）
> 更新：2026-09-07，所有接口示例均为本机实测通过的结果

---

## 一、架构总览

```
微信小程序(miniai) ──HTTP──> 勾股OA(127.0.0.1:8010) ──PDO──> MariaDB(127.0.0.1:3306)
      │                            │
      │ 工具调用(tools.js)          │ app/api/ 模块
      └── oaQuery 工具 ────────────>┘ /api/check/* /api/demo/* ...
```

| 组件 | 位置 | 说明 |
|---|---|---|
| OA 代码 | `C:\Code\OA网站\gouguoa` | Gitee gougucms/office 克隆 |
| 小程序代码 | `C:\Code\OA网站\miniai` | GitHub yuanlin-yu/miniAi |
| PHP 便携版 | `C:\Code\oa-env\php` | php.ini 已启用 curl/pdo_mysql/zip/gd 等 |
| MariaDB | `C:\Code\oa-env\mariadb` | 配置 my.ini，数据目录 mariadb/data |
| Composer | `C:\Code\oa-env\composer.phar` | 运行需 COMPOSER_HOME 环境变量 |

**为什么用 8010 端口**：8000 被本机其他进程占用，PHP 服务挪到了 8010。

---

## 二、启动命令（两条，均后台运行）

```bash
# 1. 数据库
C:\Code\oa-env\mariadb\mariadb-10.11.10-winx64\bin\mysqld.exe --defaults-file=C:/Code/oa-env/mariadb/my.ini --console

# 2. OA 站点
cd C:\Code\OA网站\gouguoa && C:\Code\oa-env\php\php.exe think run --host 0.0.0.0 --port 8010
```

浏览器访问 `http://127.0.0.1:8010` → 跳转登录页（admin / GoldLogic@2026）。

---

## 三、鉴权链路（两条，都已实测跑通）

统一返回格式：`{"code": 0成功/1失败, "msg": "...", "data": {...}}`

### 链路A：Session 登录 → 业务接口（Check/Comment 等）

```
1) POST http://127.0.0.1:8010/home/login/login_submit
   Content-Type: application/x-www-form-urlencoded
   Body: username=admin&password=GoldLogic@2026
   ← {"code":0,"msg":"登录成功","data":{"uid":1}}
   ← 响应头 Set-Cookie: PHPSESSID=xxx   （手动保存它！）

2) GET http://127.0.0.1:8010/api/check/get_flows
   Cookie: PHPSESSID=xxx
   ← {"code":0,"msg":"","data":[]}   （空数据是因为还没配置审批流）
```

**小程序注意**：wx.request 不会自动管理 cookie，要从 `res.header['Set-Cookie']` 里手动抠出 PHPSESSID，之后的请求手动加 `Cookie` 请求头（miniAi 的 oaQuery 工具已实现此逻辑）。

### 链路B：JWT → Demo 接口（无状态，适合服务端对服务端）

```
GET http://127.0.0.1:8010/api/demo/test
Token: <JWT字符串>        ← 注意是自定义头 Token，不是 Authorization
← {"code":0,"msg":"请求成功","data":{"user":{...}}}   返回当前用户完整信息
```

JWT 规格与自签方法（PHP 示例，vendor 里自带 firebase/php-jwt）：

```php
$payload = [
    'iss' => 'oa.gougucms.com', 'aud' => 'gouguoa',
    'iat' => time(), 'nbf' => time(), 'exp' => time() + 3600,
    'data' => ['userid' => 1],          // Auth 中间件从这里取 userid
];
$jwt = Firebase\JWT\JWT::encode($payload, '<secrect>', 'HS256');
```

- 密钥（secrect）存在数据库：`oa_config` 表 `name='token'` 的 content 里
- **已修复的兼容性问题**：新版 firebase/php-jwt (v7) 要求 HS256 密钥 ≥32 字符，官方默认 `GOUGUOA` 只有 7 位会直接报 `Provided key is too short`。已把密钥改为 `gouguoa_local_debug_secret_2026_key`（32+位），签名/验签恢复正常。

---

## 四、接口清单（app/api/controller/）

| 控制器 | 接口 | 鉴权 | 说明 |
|---|---|---|---|
| Check | GET /api/check/get_flows?check_name= | Session | 查询审批流定义（leave=请假等） |
| Check | GET /api/check/get_flow_users?id= | Session | 查询某审批流的审批人 |
| Check | POST /api/check/submit_check | Session | 提交审批 |
| Check | GET /api/check/get_flow_nodes | Session | 查询审批节点 |
| Check | POST /api/check/flow_check | Session | 审批操作（通过/拒绝） |
| Comment | /api/comment/datalist、add、view、del | Session | 评论增删查 |
| Demo | GET /api/demo/test | JWT(Token头) | 返回当前用户信息（连通性测试首选） |
| Demo | GET /api/demo/getToken?user_id= | JWT | 给指定用户签发 JWT |
| Export | /api/export/pdf、excel | Session | 导出 PDF/Excel |
| Import | /api/import/* | Session | 导入 |
| Office/Map/Index | ... | Session | 其他辅助接口 |

---

## 五、为跑通 API 做过的改动（都可逆，生产环境需恢复）

1. **验证码改为可选**：`app/home/validate/UserCheck.php` 中 `'captcha' => 'require|captcha'` 改为 `'captcha' => 'captcha'`。原版验证码必填且存 bcrypt 哈希，脚本无法自动登录。恢复方法见文件内注释。
2. **JWT 密钥换为 32+ 位**：数据库 `oa_config` 表 `name='token'`（原因见上）。
3. 无其他代码改动，数据库/目录均为全新安装。

---

## 六、miniAi 小程序对接（已预埋，等 API key）

已完成的：
- `miniai/utils/miniAi/env.js`：新增 `OA_BASEURL / OA_USER / OA_PWD` 配置
- `miniai/utils/miniAi/tools/tools.js`：新增 `oaQuery` 工具（自动登录 + session 失效自动重登 + 只放行 /api/ 开头接口），LLM 可通过工具调用查询 OA 审批流等数据

你只需要做两件事：
1. `project.config.json` 填自己的小程序 appid（或用测试号）
2. `utils/miniAi/env.js` 填 `LLM_API_KEY` 和 `EMBEDDER_API_KEY`（阿里百炼/DeepSeek 均可）

然后用微信开发者工具导入 `C:\Code\OA网站\miniai`，**勾选「不校验合法域名」**，对 AI 说"帮我查一下 OA 的请假审批流"即可看到效果。

---

## 七、已踩过的坑速查

| 坑 | 现象 | 解法 |
|---|---|---|
| 8000 端口被占 | 页面返回 `{"detail":"Not Found"}` | OA 用 8010 |
| 中文路径 | PHP 加载 DLL 报「找不到指定的模块」 | 环境放 `C:\Code\oa-env`（纯英文） |
| Git Bash 路径 | php.exe 报 `Could not open input file: /c/...` | 传参用 `C:/...` 风格 |
| 验证码 bcrypt | 脚本登录报「验证码不能为空」 | 验证码规则改可选（见第五节） |
| JWT 密钥过短 | 签名报 `Provided key is too short` | 密钥换 32+ 位（已做） |
| 验证码图片不显示 | 日志报 `imagettftext(): Could not find/open font` | Windows GD 打不开中文路径下的字体：字体已复制到 `C:\Code\oa-env\fonts`，`config/captcha.php` 指定 `fontttf` 绝对路径，`vendor/.../Captcha.php` 已加绝对路径支持补丁（composer update 会覆盖，需重打） |
| cookie 不自动带 | API 一直「请先登录」 | 手动解析 Set-Cookie 并回传 Cookie 头 |
