<?php
/**
+-----------------------------------------------------------------------------------------------
* GouGuOPEN [ 左手研发，右手开源，未来可期！]
+-----------------------------------------------------------------------------------------------
* @Copyright (c) http://www.gouguoa.com All rights reserved.
+-----------------------------------------------------------------------------------------------
* @Licensed 勾股OA，开源且可免费使用，但并不是自由软件，未经授权许可不能去除勾股OA的相关版权信息
+-----------------------------------------------------------------------------------------------
* @Author 勾股工作室 <hdm58@qq.com>
+-----------------------------------------------------------------------------------------------
*/

declare (strict_types = 1);

namespace app\api\controller;

use app\api\BaseController;
use app\api\middleware\Auth;
use Firebase\JWT\JWT;
use think\facade\Db;
use think\facade\Request;

/**
 * AI 数字员工接口层（《OA流程监控数字化员工》配套薄 API）
 *
 * 用途：供 OpenClaw 等外部 AI 平台以 JWT 轮询方式读写 OA：
 *   - token          账号密码换 JWT（唯一免鉴权接口）
 *   - ping           连通性测试 + 在途审批总览
 *   - approve_pending 全公司在途审批单巡检（停留时长/当前审批人）→ AI 侧实现 24h/48h 分级预警
 *   - approve_stats  审批健康度统计（按类型/按审批人/按申请人）→ AI 侧生成周报月报
 *   - todo_list      指定员工的待办（待审明细 + 待办任务）
 *   - message_send   催促站内信（AI 生成文案后调用，双写发件箱+收件箱）
 *   - note_publish   审批健康度报告落盘为公告
 *
 * 鉴权：POST /api/ai/token 换取 JWT；其余接口带请求头 Token: <jwt>
 * 安全：本组接口为全公司管理视野（可见所有人待办），Token 务必只发放给数字员工专用账号
 * 备注：二期如需「超时自动砍单 / 审批人移出节点」等写操作，另行评估后再开放
 */
class Ai extends BaseController
{
	/**
	 * 控制器中间件：除 token 外全部走 JWT 鉴权（Auth 中间件注入 JWT_UID 常量）
	 */
	protected $middleware = [
		Auth::class => ['except' => ['token']]
	];

	/**
	 * 覆盖父类初始化：本控制器走 JWT 无状态鉴权。
	 * 父类 initialize() 的 checkLogin() 依赖浏览器 Session，会拦掉服务端对服务端调用，
	 * 因此这里不做 Session 检查，身份完全由 Auth 中间件校验 Token 头后注入 JWT_UID。
	 */
	protected function initialize()
	{
		$this->pageSize = (int)Request::param('limit', \think\facade\Config::get('app.page_size'));
	}

	// =====================================================================
	// 1) POST /api/ai/token  账号密码换取 JWT
	//    参数：username, password
	// =====================================================================
	public function token()
	{
		$param = get_params();
		if (empty($param['username']) || empty($param['password'])) {
			$this->apiError('参数错误：需要 username 和 password');
		}
		$user = Db::name('Admin')->where(['username' => $param['username']])->find();
		if (empty($user) || set_password($param['password'], $user['salt']) !== $user['pwd']) {
			$this->apiError('帐号或密码错误');
		}
		if ((int)$user['status'] !== 1 || (int)$user['delete_time'] !== 0) {
			$this->apiError('该用户不可用');
		}
		$time = time();
		$conf = $this->jwt_conf;
		$payload = [
			'iss' => $conf['iss'],
			'aud' => $conf['aud'],
			'iat' => $time,
			'nbf' => $time - 1,
			'exp' => $time + $conf['exptime'],
			'data' => ['userid' => $user['id']],
		];
		$token = JWT::encode($payload, $conf['secrect'], 'HS256');
		Db::name('Admin')->where(['id' => $user['id']])->update([
			'last_login_time' => $time,
			'last_login_ip' => request()->ip(),
		]);
		$this->apiSuccess('ok', [
			'token' => $token,
			'expires_in' => (int)$conf['exptime'],
			'uid' => (int)$user['id'],
			'name' => $user['name'],
		]);
	}

	// =====================================================================
	// 2) GET /api/ai/ping  连通性测试（心跳）+ 在途审批总览
	// =====================================================================
	public function ping()
	{
		$uid = (int)JWT_UID;
		$user = Db::name('Admin')
			->field('id,username,name,nickname,did,position_id,status')
			->where(['id' => $uid])
			->find();
		// 顺手带一版轻量总览：各类型在途数（供巡检心跳快速判断是否需要深入拉取明细）
		$pendingByType = [];
		$total = 0;
		foreach ($this->getFlowCates() as $cate) {
			$cnt = $this->countPending($cate);
			if ($cnt > 0) {
				$pendingByType[] = ['type' => $cate['name'], 'type_title' => $cate['title'], 'pending' => $cnt];
				$total += $cnt;
			}
		}
		$this->apiSuccess('pong', [
			'server_time' => date('Y-m-d H:i:s'),
			'timestamp' => time(),
			'user' => $user,
			'pending_total' => $total,
			'pending_by_type' => $pendingByType,
		]);
	}

	// =====================================================================
	// 3) GET /api/ai/approve_pending  全公司在途审批单巡检（核心）
	//    参数（均可选）：
	//      type  按流程标识过滤，逗号分隔（如 leaves,expense,seal）
	//      uid   只看某审批人名下的待审（FIND_IN_SET 匹配 check_uids）
	//      hours 只返回停留超过 N 小时的单据（风险过滤，如 hours=24）
	//    停留时长口径：now - GREATEST(check_time, create_time)
	//    即当前审批节点的开始时间 = 上一次审批动作时间（首节点为提交时间）
	// =====================================================================
	public function approve_pending()
	{
		$param = get_params();
		$typeFilter = [];
		if (!empty($param['type'])) {
			$typeFilter = array_filter(explode(',', (string)$param['type']));
		}
		$uid = !empty($param['uid']) ? (int)$param['uid'] : 0;
		$minHours = isset($param['hours']) && $param['hours'] !== '' ? max(0, (float)$param['hours']) : 0;

		$cates = $this->getFlowCates($typeFilter);
		$adminMap = $this->getAdminMap();
		$titleCols = $this->getTitleCols();
		$now = time();

		$items = [];
		$skipped = 0;
		foreach ($cates as $cate) {
			$model = $this->snakeToCamel($cate['check_table']);
			$fields = ['id', 'admin_id', 'check_uids', 'check_step_sort', 'check_time', 'create_time'];
			$tableKey = 'oa_' . $cate['check_table'];
			if (!empty($titleCols[$tableKey])) {
				$fields[] = $titleCols[$tableKey];
			}
			$where = [['check_status', '=', 1], ['delete_time', '=', 0]];
			if ($uid > 0) {
				$where[] = ['', 'exp', Db::raw("FIND_IN_SET('{$uid}',check_uids)")];
			}
			$rows = Db::name($model)
				->field($fields)
				->where($where)
				->orderRaw('GREATEST(IFNULL(check_time,0),create_time) ASC')
				->limit(500)
				->select()
				->toArray();
			foreach ($rows as $row) {
				$stepStart = max((int)$row['check_time'], (int)$row['create_time']);
				$staySeconds = max(0, $now - $stepStart);
				$stayHours = round($staySeconds / 3600, 1);
				if ($minHours > 0 && $stayHours < $minHours) {
					$skipped++;
					continue;
				}
				$checkUsers = [];
				foreach (array_filter(explode(',', (string)$row['check_uids'])) as $cuid) {
					$cuid = (int)$cuid;
					$checkUsers[] = ['uid' => $cuid, 'name' => $adminMap[$cuid] ?? ('uid:' . $cuid)];
				}
				$titleCol = $titleCols[$tableKey] ?? '';
				$itemTitle = $titleCol ? trim(mb_substr((string)($row[$titleCol] ?? ''), 0, 60)) : '';
				if ($itemTitle === '') {
					$itemTitle = '单据#' . $row['id'];
				}
				$items[] = [
					'type' => $cate['name'],
					'type_title' => $cate['title'],
					'id' => (int)$row['id'],
					'title' => $itemTitle,
					'apply_uid' => (int)$row['admin_id'],
					'apply_name' => $adminMap[(int)$row['admin_id']] ?? ('uid:' . $row['admin_id']),
					'step_sort' => (int)$row['check_step_sort'],
					'check_users' => $checkUsers,
					'step_start_at' => date('Y-m-d H:i:s', $stepStart),
					'stay_seconds' => $staySeconds,
					'stay_hours' => $stayHours,
					// 与 PPT 预警规则对齐的静态分级提示（AI 侧可忽略自行判定）：>48h 高危，>24h 中危
					'risk' => $stayHours > 48 ? 'high' : ($stayHours > 24 ? 'mid' : 'low'),
					'url' => $cate['view_url'] . '?id=' . $row['id'],
				];
			}
		}
		// 停留最久的排前面
		usort($items, function ($a, $b) {
			return $b['stay_seconds'] <=> $a['stay_seconds'];
		});
		$this->apiSuccess('ok', [
			'now' => date('Y-m-d H:i:s', $now),
			'total' => count($items),
			'filtered_out' => $skipped,
			'items' => $items,
		]);
	}

	// =====================================================================
	// 4) GET /api/ai/approve_stats  审批健康度统计（周报/月报原料）
	//    参数（可选）：days 统计窗口天数，默认 30
	//    已完结单据按最后审批动作时间(check_time)落在窗口内统计
	// =====================================================================
	public function approve_stats()
	{
		$param = get_params();
		$days = !empty($param['days']) ? min(365, max(1, (int)$param['days'])) : 30;
		$startTime = time() - $days * 86400;

		$cates = $this->getFlowCates();
		$adminMap = $this->getAdminMap();

		$byType = [];
		$checkerLoad = [];   // 审批人在途负载
		$applierCount = [];  // 申请人提交量

		foreach ($cates as $cate) {
			$model = $this->snakeToCamel($cate['check_table']);
			// 按状态聚合：在途全量 + 窗口内完结
			$rows = Db::name($model)
				->field('check_status, COUNT(*) AS cnt, AVG(CASE WHEN check_status=2 THEN check_time-create_time END) AS avg_cost')
				->where([['delete_time', '=', 0]])
				->where(function ($query) use ($startTime) {
					$query->where('check_status', 1)->whereOr(function ($q2) use ($startTime) {
						$q2->where('check_time', '>=', $startTime)->whereIn('check_status', [2, 3, 4]);
					});
				})
				->group('check_status')
				->select()
				->toArray();
			$stat = ['type' => $cate['name'], 'type_title' => $cate['title'], 'pending' => 0, 'approved' => 0, 'rejected' => 0, 'revoked' => 0, 'avg_approve_hours' => null];
			foreach ($rows as $r) {
				switch ((int)$r['check_status']) {
					case 1:
						$stat['pending'] = (int)$r['cnt'];
						break;
					case 2:
						$stat['approved'] = (int)$r['cnt'];
						if ($r['avg_cost'] !== null) {
							$stat['avg_approve_hours'] = round((float)$r['avg_cost'] / 3600, 1);
						}
						break;
					case 3:
						$stat['rejected'] = (int)$r['cnt'];
						break;
					case 4:
						$stat['revoked'] = (int)$r['cnt'];
						break;
				}
			}
			// 在途负载（按当前审批人 PHP 端聚合，check_uids 为逗号分隔）
			if ($stat['pending'] > 0) {
				$pendRows = Db::name($model)
					->field('id,check_uids,check_time,create_time')
					->where([['check_status', '=', 1], ['delete_time', '=', 0]])
					->select()
					->toArray();
				$now = time();
				foreach ($pendRows as $p) {
					$stayHours = round(max(0, $now - max((int)$p['check_time'], (int)$p['create_time'])) / 3600, 1);
					foreach (array_filter(explode(',', (string)$p['check_uids'])) as $cuid) {
						$cuid = (int)$cuid;
						if (!isset($checkerLoad[$cuid])) {
							$checkerLoad[$cuid] = ['uid' => $cuid, 'name' => $adminMap[$cuid] ?? ('uid:' . $cuid), 'pending' => 0, 'max_stay_hours' => 0];
						}
						$checkerLoad[$cuid]['pending']++;
						$checkerLoad[$cuid]['max_stay_hours'] = max($checkerLoad[$cuid]['max_stay_hours'], $stayHours);
					}
				}
			}
			// 申请人提交量（窗口内）
			$apRows = Db::name($model)
				->field('admin_id, COUNT(*) AS cnt')
				->where([['delete_time', '=', 0], ['create_time', '>=', $startTime]])
				->group('admin_id')
				->select()
				->toArray();
			foreach ($apRows as $a) {
				$auid = (int)$a['admin_id'];
				if (!isset($applierCount[$auid])) {
					$applierCount[$auid] = ['uid' => $auid, 'name' => $adminMap[$auid] ?? ('uid:' . $auid), 'submitted' => 0];
				}
				$applierCount[$auid]['submitted'] += (int)$a['cnt'];
			}
			if ($stat['pending'] > 0 || $stat['approved'] > 0 || $stat['rejected'] > 0 || $stat['revoked'] > 0) {
				$byType[] = $stat;
			}
		}
		// 审批人按在途量降序；申请人按提交量降序
		usort($checkerLoad, function ($a, $b) {
			return $b['pending'] <=> $a['pending'];
		});
		usort($applierCount, function ($a, $b) {
			return $b['submitted'] <=> $a['submitted'];
		});
		$this->apiSuccess('ok', [
			'days' => $days,
			'since' => date('Y-m-d H:i:s', $startTime),
			'until' => date('Y-m-d H:i:s'),
			'by_type' => $byType,
			'by_checker' => array_values($checkerLoad),
			'by_applier' => array_values($applierCount),
		]);
	}

	// =====================================================================
	// 5) GET /api/ai/todo_list  指定员工待办（待审明细 + 待办任务）
	//    参数（可选）：uid 目标员工，默认当前 Token 身份
	// =====================================================================
	public function todo_list()
	{
		$param = get_params();
		$uid = !empty($param['uid']) ? (int)$param['uid'] : (int)JWT_UID;
		if ($uid <= 0) {
			$this->apiError('参数错误：uid');
		}
		$adminMap = $this->getAdminMap();
		if (!isset($adminMap[$uid])) {
			$this->apiError('员工不存在：uid=' . $uid);
		}
		// —— 待审明细（与 approve_pending 同构，按该审批人过滤）——
		$cates = $this->getFlowCates();
		$titleCols = $this->getTitleCols();
		$now = time();
		$approveItems = [];
		foreach ($cates as $cate) {
			$model = $this->snakeToCamel($cate['check_table']);
			$fields = ['id', 'admin_id', 'check_uids', 'check_step_sort', 'check_time', 'create_time'];
			$tableKey = 'oa_' . $cate['check_table'];
			if (!empty($titleCols[$tableKey])) {
				$fields[] = $titleCols[$tableKey];
			}
			$rows = Db::name($model)
				->field($fields)
				->where([['check_status', '=', 1], ['delete_time', '=', 0]])
				->whereRaw("FIND_IN_SET('{$uid}',check_uids)")
				->limit(200)
				->select()
				->toArray();
			foreach ($rows as $row) {
				$stepStart = max((int)$row['check_time'], (int)$row['create_time']);
				$stayHours = round(max(0, $now - $stepStart) / 3600, 1);
				$titleCol = $titleCols[$tableKey] ?? '';
				$itemTitle = $titleCol ? trim(mb_substr((string)($row[$titleCol] ?? ''), 0, 60)) : '';
				if ($itemTitle === '') {
					$itemTitle = '单据#' . $row['id'];
				}
				$approveItems[] = [
					'type' => $cate['name'],
					'type_title' => $cate['title'],
					'id' => (int)$row['id'],
					'title' => $itemTitle,
					'apply_uid' => (int)$row['admin_id'],
					'apply_name' => $adminMap[(int)$row['admin_id']] ?? ('uid:' . $row['admin_id']),
					'stay_hours' => $stayHours,
					'url' => $cate['view_url'] . '?id=' . $row['id'],
				];
			}
		}
		usort($approveItems, function ($a, $b) {
			return $b['stay_hours'] <=> $a['stay_hours'];
		});
		// —— 待办任务（项目任务，未完成）——
		$tasks = [];
		try {
			$taskRows = Db::name('ProjectTask')
				->field('id,title,project_id,end_time')
				->where([['director_uid', '=', $uid], ['status', '<', 3], ['delete_time', '=', 0]])
				->order('end_time asc')
				->limit(100)
				->select()
				->toArray();
			foreach ($taskRows as $t) {
				$tasks[] = [
					'id' => (int)$t['id'],
					'title' => mb_substr((string)$t['title'], 0, 60),
					'project_id' => (int)$t['project_id'],
					'end_at' => $t['end_time'] > 0 ? date('Y-m-d', (int)$t['end_time']) : '',
					'overdue' => $t['end_time'] > 0 && $t['end_time'] < $now,
				];
			}
		} catch (\Throwable $e) {
			// 任务表结构异常不影响待审部分
		}
		$maxStay = 0;
		foreach ($approveItems as $it) {
			$maxStay = max($maxStay, $it['stay_hours']);
		}
		$this->apiSuccess('ok', [
			'uid' => $uid,
			'name' => $adminMap[$uid],
			'now' => date('Y-m-d H:i:s', $now),
			'approve_items' => $approveItems,
			'tasks' => $tasks,
			'summary' => [
				'approve_count' => count($approveItems),
				'task_count' => count($tasks),
				'overdue_task' => count(array_filter($tasks, function ($t) {
					return $t['overdue'];
				})),
				'max_stay_hours' => $maxStay,
			],
		]);
	}

	// =====================================================================
	// 6) POST /api/ai/message_send  发送催促站内信（AI 生成文案后调用）
	//    参数：
	//      to_uids   接收人 uid，逗号分隔（如 "19,21"）
	//      title     标题（≤100 字）
	//      content   正文（纯文本，≤100000 字）
	//      action_id 可选，关联单据 id（用于收件详情跳转）
	//    行为：双写 oa_message（发件箱留痕，发送人=Token 身份）+ oa_msg（每人一条收件）
	// =====================================================================
	public function message_send()
	{
		if (!Request::isPost()) {
			$this->apiError('请使用 POST');
		}
		$param = get_params();
		$toUids = array_values(array_unique(array_filter(array_map('intval', explode(',', (string)($param['to_uids'] ?? ''))))));
		if (empty($toUids)) {
			$this->apiError('参数错误：to_uids 不能为空（逗号分隔的 uid）');
		}
		$title = trim((string)($param['title'] ?? ''));
		$content = trim((string)($param['content'] ?? ''));
		if ($title === '' || $content === '') {
			$this->apiError('参数错误：title 和 content 不能为空');
		}
		if (mb_strlen($title) > 90) {
			$title = mb_substr($title, 0, 90);
		}
		if (mb_strlen($content) > 100000) {
			$content = mb_substr($content, 0, 100000);
		}
		$actionId = !empty($param['action_id']) ? (int)$param['action_id'] : 0;
		$fromUid = (int)JWT_UID;
		// 校验收件人全部存在且在职
		$validUids = Db::name('Admin')
			->where([['status', '=', 1], ['delete_time', '=', 0]])
			->whereIn('id', $toUids)
			->column('id');
		$invalid = array_diff($toUids, $validUids);
		if (!empty($invalid)) {
			$this->apiError('接收人不存在或不可用：' . implode(',', $invalid));
		}
		// 不给发送者本人发
		$validUids = array_values(array_diff($validUids, [$fromUid]));
		if (empty($validUids)) {
			$this->apiError('无有效接收人');
		}
		$now = time();
		Db::startTrans();
		try {
			// 发件箱留痕
			$messageId = Db::name('Message')->strict(false)->insertGetId([
				'title' => $title,
				'template' => 0,
				'content' => $content,
				'from_uid' => $fromUid,
				'types' => 1,
				'uids' => implode(',', $validUids),
				'is_draft' => 1,
				'action_id' => $actionId,
				'send_time' => $now,
				'create_time' => $now,
				'update_time' => $now,
			]);
			// 收件箱逐人投递
			$sendData = [];
			foreach ($validUids as $tuid) {
				$sendData[] = [
					'message_id' => $messageId,
					'to_uid' => $tuid,
					'title' => $title,
					'template' => 0,
					'content' => $content,
					'from_uid' => $fromUid,
					'action_id' => $actionId,
					'create_time' => $now,
				];
			}
			Db::name('Msg')->strict(false)->insertAll($sendData);
			Db::commit();
		} catch (\Throwable $e) {
			Db::rollback();
			$this->apiError('发送失败：' . $e->getMessage());
		}
		add_log('send', $messageId, ['to_uids' => $validUids], 'AI催促消息');
		$this->apiSuccess('发送成功', [
			'message_id' => (int)$messageId,
			'to_uids' => $validUids,
			'send_count' => count($validUids),
		]);
	}

	// =====================================================================
	// 7) POST /api/ai/note_publish  审批健康度报告落盘为公告
	//    参数：
	//      title   公告标题（≤200 字）
	//      content 公告正文（支持 HTML）
	//      cate_id 可选，公告分类：1 普通公告（默认）、2 紧急公告
	//    发布人=Token 身份，全员可见
	// =====================================================================
	public function note_publish()
	{
		if (!Request::isPost()) {
			$this->apiError('请使用 POST');
		}
		$param = get_params();
		$title = trim((string)($param['title'] ?? ''));
		$content = trim((string)($param['content'] ?? ''));
		if ($title === '' || $content === '') {
			$this->apiError('参数错误：title 和 content 不能为空');
		}
		if (mb_strlen($title) > 200) {
			$title = mb_substr($title, 0, 200);
		}
		$cateId = !empty($param['cate_id']) ? (int)$param['cate_id'] : 1;
		if (!in_array($cateId, [1, 2])) {
			$cateId = 1;
		}
		$now = time();
		$noteId = Db::name('Note')->strict(false)->insertGetId([
			'cate_id' => $cateId,
			'sourse' => 0,
			'title' => $title,
			'content' => $content,
			'status' => 1,
			'role_type' => 0,
			'admin_id' => (int)JWT_UID,
			'create_time' => $now,
			'update_time' => $now,
		]);
		if (!$noteId) {
			$this->apiError('发布失败');
		}
		add_log('add', $noteId, ['title' => $title], 'AI健康度报告');
		$this->apiSuccess('发布成功', [
			'note_id' => (int)$noteId,
			'url' => '/adm/note/view?id=' . $noteId,
		]);
	}

	// =====================================================================
	// 私有辅助
	// =====================================================================

	/**
	 * 审批流分类（oa_flow_cate，status=1 全量；可按 name 过滤）
	 * 返回：[{name, title, check_table, view_url}]
	 */
	private function getFlowCates(array $typeFilter = []): array
	{
		$cates = Db::name('FlowCate')
			->field('name,title,check_table,view_url')
			->where(['status' => 1])
			->select()
			->toArray();
		if (!empty($typeFilter)) {
			$cates = array_values(array_filter($cates, function ($c) use ($typeFilter) {
				return in_array($c['name'], $typeFilter);
			}));
		}
		return $cates;
	}

	/**
	 * 某分类下的在途单数
	 */
	private function countPending(array $cate): int
	{
		return (int)Db::name($this->snakeToCamel($cate['check_table']))
			->where([['check_status', '=', 1], ['delete_time', '=', 0]])
			->count();
	}

	/**
	 * 员工 id => 姓名 映射（在职）
	 */
	private function getAdminMap(): array
	{
		$rows = Db::name('Admin')
			->field('id,name')
			->where([['status', '=', 1], ['delete_time', '=', 0]])
			->select()
			->toArray();
		$map = [];
		foreach ($rows as $r) {
			$map[(int)$r['id']] = $r['name'];
		}
		return $map;
	}

	/**
	 * 各审批业务表的标题字段（优先 name，其次 title，都没有则空）
	 * 返回：['oa_leaves'=>'', 'oa_contract'=>'name', 'oa_seal'=>'title', ...]
	 */
	private function getTitleCols(): array
	{
		// 候选标题列按优先级：name > title > reason > remark
		$prio = array_flip(['name', 'title', 'reason', 'remark']);
		$rows = Db::query(
			"SELECT table_name AS t, column_name AS c FROM information_schema.columns " .
			"WHERE table_schema=DATABASE() AND column_name IN ('name','title','reason','remark')"
		);
		$cols = [];
		foreach ($rows as $r) {
			$t = $r['t'];
			$c = $r['c'];
			// 取优先级最高（prio 值最小）的候选列
			if (!isset($cols[$t]) || $prio[$c] < $prio[$cols[$t]]) {
				$cols[$t] = $c;
			}
		}
		return $cols;
	}

	/**
	 * snake_case 转 CamelCase（car_use → CarUse，供 Db::name 映射 oa_car_use）
	 */
	private function snakeToCamel(string $s): string
	{
		return str_replace(' ', '', ucwords(str_replace('_', ' ', $s)));
	}
}
