# DESIGN.md —— 当 OA 遇上 AI 数字员工（Claude 编辑风）

## 1. 画布与母版（三区）

- 画布：1280×720，页面 padding：上 20 / 下 20 / 左右 70
- **A 标题块 0–120px**：页面主标题 34px bold（衬线），左侧对齐；标题下可带 16px 副题一行
- **B 内容区 120–660px**：540px 可用，一切正文/图/卡片
- **C 页脚条 660–720px**：左「当 OA 遇上 AI 数字员工 · 内部教学」14px 灰，右页码 `NN / 16` 14px 灰
- 封面(01)与结束页(16)采用自定义版式，省略 A/C 区结构但保留页码

## 2. 色彩系统（4 hex，Claude 编辑风）

| 角色 | hex | 用途 |
|---|---|---|
| 背景 | `#FAF9F5` | 全篇奶油底（面积 ~60-70%） |
| 墨色 | `#1F1E1B` | 标题、正文主色 |
| 赤陶橙（强调） | `#D97757` | 锚点数字、关键词、序号、焦点边框（≤10%，hero 页 ≤18%） |
| 暖灰 | `#A9A294` | 次要文字、页脚、分隔线、卡片描边 |

- 半透明策略：卡片底 `rgba(217,119,87,0.06)` 或 `rgba(31,30,27,0.04)`；阴影 `0 4px 20px rgba(31,30,27,0.06)`
- 不用渐变铺底；允许强调色细线（3px 左边框）做卡片引导
- hero 页（03/12/16）强调色可至 15-18%（巨型数字/金句）；supporting 页 ≤6%

## 3. 字体系统（2 家族）

| 层级 | 字体 | 字号/字重 | 行高 |
|---|---|---|---|
| 封面主标题 | 华文中宋 | 60px bold | 1.25 |
| 页面主标题 | 华文中宋 | 34px bold | 1.3 |
| 巨型锚点数字 | Georgia | 96-150px bold | 1.0 |
| 卡片小标题 | 微软雅黑 | 21px bold | 1.4 |
| 正文 | 微软雅黑 | 17-18px regular | 1.6 |
| 引文/金句 | 华文中宋 | 40-48px bold | 1.4 |
| 页脚 | 微软雅黑 | 13px | 1.4 |

- 标题衬线（编辑感）+ 正文无衬线（易读），符合 Claude 风格的 serif/sans 对比

## 4. 密度声明（编辑风·留白型）

- 常规内容页留白 25-35%；hero 页 30-45%；13 页信息高峰页留白 18%
- 内容页正文字数 ≥150（卡片组合计 ≥300）；单页图片 ≤2、总面积 ≤60%
- 每页 ≥1 个视觉锚点：巨型数字（≥72px）/ L1 图（≥40% B 区）/ 全宽图示（≥50% B 区）三选一

## 5. 配图清单（统一风格：扁平矢量插画·奶油底·赤陶橙+暖灰·圆润·无文字）

| 文件 | 生成方式 | 用途页 | 核对 |
|---|---|---|---|
| cover_hero.png | ImageGen | 01 封面右 52% | 待核 |
| pain_stack.png | ImageGen | 03 痛点右 38% | 待核 |
| sentry.png | ImageGen | 04 左 55% | 待核 |
| demo_scene.png | ImageGen | 14 右 48% | 待核 |

统一 prompt 词根：flat vector illustration, warm cream background (#FAF9F5), terracotta orange (#D97757) and warm grey accents, rounded soft shapes, editorial minimal style, no text, no letters

SVG 白名单：05 时间轴 / 06 架构图 / 09 JWT 流程 / 10 闭环时序 / 11 判定流 / 15 五步流程 / 序号大字 / 页脚。全部单色系（墨色+赤陶橙）线性风格。

## 6. 页面映射表

| # | 文件 | 类型 | 角色 | 版式 | L1/主视觉 | 字数 | 留白 | 色彩分配 | 关键约束 |
|---|---|---|---|---|---|---|---|---|---|
| 01 | 01.slide | cover | hero | 骑线文字+右图 | cover_hero.png | 30 | 45% | 背景70%+强调8% | 标题左侧骑线，右图满高 |
| 02 | 02.slide | content | supporting | 左标题+右内容 | 序号大字 72px | 120 | 30% | 强调6% | 三条目纵向，非横排卡 |
| 03 | 03.slide | content | hero | 巨型数字+洞察 | Georgia 150px「6」+ pain_stack | 180 | 30% | 强调18% | 数字 96px+，图右 38% |
| 04 | 04.slide | content | supporting | 左大图+右文字 | sentry.png 左 55% | 220 | 25% | 强调5% | 四职责纵列右栏 |
| 05 | 05.slide | content | supporting | 左标题+右时间轴 | SVG 时间轴 | 200 | 25% | 强调6% | 三闸门节点+橙点 |
| 06 | 06.slide | content | supporting | 非对称双栏 60:40 | SVG 架构图 | 160 | 25% | 强调5% | 图占宽栏，右数据 chips |
| 07 | 07.slide | content | supporting | 非对称双栏 60:40 | ❌✅对比双栏 | 200 | 25% | 强调6% | ✅ 栏宽 60% |
| 08 | 08.slide | content | supporting | 左标题+右表格 | Table 7 行 | 240 | 20% | 强调5% | 核心行橙左边框高亮 |
| 09 | 09.slide | content | supporting | 非对称双栏 60:40 | SVG JWT 流程+账号卡 | 200 | 25% | 强调5% | 左流程右账号卡 |
| 10 | 10.slide | content | supporting | 全宽流程 | SVG 时序闭环 | 180 | 25% | 强调7% | 图示占 B 区 55% |
| 11 | 11.slide | content | supporting | 非对称双栏 55:45 | 消息卡+SVG | 220 | 25% | 强调5% | 左示例右判定 |
| 12 | 12.slide | content | hero | 图表+洞察 | Table+锚点「5/5」 | 180 | 30% | 强调15% | 洞察框必须给判断 |
| 13 | 13.slide | content | supporting | 2×2 网格 | 4 内容卡 | 380 | 18% | 强调4% | 每卡 3 行实内容 |
| 14 | 14.slide | content | supporting | 左文字+右大图 | demo_scene.png 右 48% | 150 | 30% | 强调6% | 三动作列表 |
| 15 | 15.slide | content | supporting | 横向流程条 | SVG 五步 | 200 | 25% | 强调6% | 箭头连接+每步一句 |
| 16 | 16.slide | ending | hero | 居中金句 | 金句 44px+路线条 | 60 | 45% | 强调12% | 金句即锚点 |
