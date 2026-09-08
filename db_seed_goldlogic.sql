/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.10-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: gouguoa
-- ------------------------------------------------------
-- Server version	10.11.10-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `oa_account`
--

DROP TABLE IF EXISTS `oa_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_account` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `enterprise_id` int(11) NOT NULL DEFAULT 0 COMMENT '企业主体id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '资金账户名称',
  `account` varchar(100) NOT NULL DEFAULT '' COMMENT '具体账号',
  `initial_amount` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '初始资金',
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '当前资金',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：-1删除 0禁用 1启用',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='资金账户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_account`
--

LOCK TABLES `oa_account` WRITE;
/*!40000 ALTER TABLE `oa_account` DISABLE KEYS */;
INSERT INTO `oa_account` VALUES
(1,1,'现金账户','',0.00,0.00,1,1764388690,0,0),
(2,1,'支付宝账户','',0.00,0.00,1,1764388722,1764388758,0),
(3,1,'微信支付账户','',0.00,0.00,1,1764388736,1764388764,0),
(4,1,'招商银行账户','',0.00,0.00,1,1764388747,0,0),
(5,1,'建设银行账户','',0.00,0.00,1,1764388777,0,0);
/*!40000 ALTER TABLE `oa_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_admin`
--

DROP TABLE IF EXISTS `oa_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(100) NOT NULL DEFAULT '' COMMENT '企业微信userid',
  `dingtalk_userid` varchar(100) NOT NULL DEFAULT '' COMMENT '钉钉用户ID',
  `username` varchar(100) NOT NULL DEFAULT '' COMMENT '登录用户名',
  `pwd` varchar(100) NOT NULL DEFAULT '' COMMENT '登录密码',
  `salt` varchar(100) NOT NULL DEFAULT '' COMMENT '密码盐',
  `reg_pwd` varchar(100) NOT NULL DEFAULT '' COMMENT '初始密码',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '员工姓名',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `mobile` bigint(11) NOT NULL DEFAULT 0 COMMENT '手机号码',
  `sex` int(1) NOT NULL DEFAULT 0 COMMENT '性别:1男,2女',
  `nickname` varchar(100) NOT NULL DEFAULT '' COMMENT '别名',
  `thumb` varchar(255) NOT NULL COMMENT '头像',
  `theme` varchar(50) NOT NULL DEFAULT 'white' COMMENT '系统主题',
  `did` int(11) NOT NULL DEFAULT 0 COMMENT '主部门id',
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '上级主管id',
  `position_id` int(11) NOT NULL DEFAULT 0 COMMENT '职位id',
  `position_name` int(11) NOT NULL DEFAULT 0 COMMENT '职务',
  `position_rank` int(11) NOT NULL DEFAULT 0 COMMENT '职级',
  `type` int(1) NOT NULL DEFAULT 0 COMMENT '员工类型:0未设置,1正式,2试用,3实习',
  `is_staff` int(1) NOT NULL DEFAULT 1 COMMENT '身份类型:1企业员工,2劳务派遣,3兼职员工',
  `job_number` varchar(255) NOT NULL DEFAULT '' COMMENT '工号',
  `birthday` varchar(255) NOT NULL DEFAULT '' COMMENT '生日',
  `age` int(11) NOT NULL DEFAULT 0 COMMENT '年龄',
  `work_date` varchar(255) NOT NULL DEFAULT '' COMMENT '开始工作时间',
  `work_location` int(11) NOT NULL DEFAULT 0 COMMENT '工作地点',
  `native_place` varchar(255) NOT NULL DEFAULT '' COMMENT '籍贯',
  `nation` varchar(255) NOT NULL DEFAULT '' COMMENT '民族',
  `home_address` varchar(255) NOT NULL DEFAULT '' COMMENT '家庭地址',
  `current_address` varchar(255) NOT NULL DEFAULT '' COMMENT '现居地址',
  `contact` varchar(255) NOT NULL DEFAULT '' COMMENT '紧急联系人',
  `contact_mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '紧急联系人电话',
  `resident_type` int(1) NOT NULL DEFAULT 0 COMMENT '户口性质:1农村户口,2城镇户口',
  `resident_place` varchar(255) NOT NULL DEFAULT '' COMMENT '户口所在地',
  `graduate_school` varchar(255) NOT NULL DEFAULT '' COMMENT '毕业学校',
  `graduate_day` varchar(255) NOT NULL DEFAULT '' COMMENT '毕业日期',
  `political` int(1) NOT NULL DEFAULT 1 COMMENT '政治面貌:1中共党员,2团员',
  `marital_status` int(1) NOT NULL DEFAULT 1 COMMENT '婚姻状况:1未婚,2已婚,3离异',
  `idcard` varchar(255) NOT NULL DEFAULT '' COMMENT '身份证',
  `education` varchar(255) NOT NULL DEFAULT '' COMMENT '学位',
  `speciality` varchar(255) NOT NULL DEFAULT '' COMMENT '专业',
  `social_account` varchar(255) NOT NULL DEFAULT '' COMMENT '社保账号',
  `medical_account` varchar(255) NOT NULL DEFAULT '' COMMENT '医保账号',
  `provident_account` varchar(255) NOT NULL DEFAULT '' COMMENT '公积金账号',
  `bank_account` varchar(255) NOT NULL DEFAULT '' COMMENT '银行卡号',
  `bank_info` varchar(255) NOT NULL DEFAULT '' COMMENT '开户行',
  `file_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '档案附件',
  `desc` mediumtext DEFAULT NULL COMMENT '员工个人简介',
  `is_hide` int(1) NOT NULL DEFAULT 0 COMMENT '是否隐藏联系方式:0否,1是',
  `entry_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '员工入职日期',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '注册时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新信息时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  `last_login_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '最后登录时间',
  `login_num` int(11) NOT NULL DEFAULT 0 COMMENT '登录次数',
  `last_login_ip` varchar(64) NOT NULL DEFAULT '' COMMENT '最后登录IP',
  `is_lock` int(1) NOT NULL DEFAULT 0 COMMENT '是否锁屏:1是0否',
  `auth_did` int(2) NOT NULL DEFAULT 0 COMMENT '数据权限类型:0仅自己关联的数据,1所属主部门的数据,2所属次部门的数据,3所属主次部门的数据,4所属主部门及其子部门数据,5所属次部门及其子部门数据,6所属主次部门及其子部门数据,7所属主部门所在顶级部门及其子部门数据,8所属次部门所在顶级部门及其子部门数据,9所属主次部门所在顶级部门及其子部门数据,10所有部门数据',
  `auth_dids` varchar(500) NOT NULL DEFAULT '' COMMENT '可见部门数据',
  `son_dids` varchar(500) NOT NULL DEFAULT '' COMMENT '可见子部门数据',
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '状态：-1待入职,0禁止登录,1正常,2离职',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='员工表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_admin`
--

LOCK TABLES `oa_admin` WRITE;
/*!40000 ALTER TABLE `oa_admin` DISABLE KEYS */;
INSERT INTO `oa_admin` VALUES
(1,'','','admin','6e2d4f93bbbdd42ef786440475386922','9f081a5z7doigbe6jwnc','','超级员工','gouguoa@gougucms.com',13800138000,1,'超级员工','42','blue',1,0,1,0,0,1,1,'','',0,'',0,'','','','','','',0,'','','',1,1,'','','','','','','','','',NULL,0,1788748474,1788748474,1788748474,0,1788837885,10,'127.0.0.1',0,10,'','',1),
(2,'','','sunba','85349ff015e47bdca1591f13aebfea19','sluj07brllsk2czs94ux','','徐冠林','2841048854@qq.com',15350519169,1,'徐冠林','43','white',2,1,1,0,0,1,1,'GL6479','20250907',0,'',0,'','','','','','',0,'','','',1,1,'','','','','','','','','','孙八，董事长',0,1788710400,1788765181,1788765181,0,0,0,'',0,0,'','2,3,4,5,8,9,10,6,11,12,13,7,14,15,1',1),
(3,'','','lisi','a35878d0ea6b1681b0f191f546b430ed','kqdt8zlkfnce94olaenk','','李四','',0,1,'李四','44','white',6,9,14,0,0,0,1,'GL9591','20250907',0,'',0,'','','','','','',0,'','','',1,1,'','','','','','','','','','李四，技术部经理',0,1788765181,1788765181,1788765181,0,0,0,'',0,0,'','',1),
(4,'','','zhangsan','276911891b6b862be34cc747bde075fe','olb9rml0oap0d5rz79tr','','张三','',0,1,'张三','45','blue',6,3,15,0,0,0,1,'GL3076','20250907',0,'',0,'','','','','','',0,'','','',1,1,'','','','','','','','','','张三，软件工程师',0,1788765181,1788765181,1788765181,0,1788775047,6,'127.0.0.1',0,0,'','',1),
(5,'','','wangwu','2b5d013b6f2ac904c0e6b03559f2e461','n82qzdj0ul342ri8kg3n','','王五','',0,2,'王五','46','white',2,12,2,0,0,0,1,'GL6532','20250907',0,'',0,'','','','','','',0,'','','',1,1,'','','','','','','','','','王五，人事专员',0,1788765181,1788765181,1788765181,0,0,0,'',0,0,'','',1),
(6,'','','zhaoliu','414ca9aee0b3158f4add4dea60294f9c','png4bv6usiy3lzxvzqf6','','赵六','',0,2,'赵六','47','white',3,10,9,0,0,0,1,'GL3765','20250907',0,'',0,'','','','','','',0,'','','',1,1,'','','','','','','','','','赵六，财务会计',0,1788765181,1788765181,1788765181,0,0,0,'',0,0,'','',1),
(7,'','','qianqi','b22caa9d38858907f4c12ae9aacaebca','qm766zuvqo66i57ciy8o','','钱七','',0,2,'钱七','48','white',4,11,10,0,0,0,1,'GL4015','20250907',0,'',0,'','','','','','',0,'','','',1,1,'','','','','','','','','','钱七，市场专员',0,1788765181,1788765181,1788765181,0,0,0,'',0,0,'','',1),
(8,'','','raowang','8de39e7cdda4c103e1b15ecfb96a91c9','xzk3hv0reunbxjdebg7v','','饶旺','lljjjhkac52u@maplcyn.shop',15350519122,1,'饶旺','/storage/202609/n0b72_dea0351b29ffa2be40e4721ce23a67ec.png','white',1,8,4,0,0,1,1,'GL2482','20210908',0,'',0,'','','','','','',0,'','','',1,1,'','','','','','','','','','饶旺，总经理',0,1788710400,1788773453,1788773453,0,1788778689,3,'127.0.0.1',0,0,'','',1),
(9,'','','liulingcong','67be2e9215114c68f906dcb193987a81','t0llpm94ph6esxib3ma8','','刘凌聪','',0,1,'刘凌聪','50','white',6,8,6,0,0,0,1,'GL1552','20210908',0,'',0,'','','','','','',0,'','','',1,1,'','','','','','','','','','刘凌聪，CTO',0,1788773453,1788773453,1788773453,0,1788778135,1,'127.0.0.1',0,0,'','',1),
(10,'','','chenjiatong','a446ce3579d8754694a702cee193dc06','l1suyuusghkri1lf9beh','','陈佳彤','',0,2,'陈佳彤','51','white',3,8,7,0,0,0,1,'GL5603','20240907',0,'',0,'','','','','','',0,'','','',1,1,'','','','','','','','','','陈佳彤，CFO',0,1788773453,1788773453,1788773453,0,0,0,'',0,0,'','',1),
(11,'','','wangziyi','3889591d5f97c6158c68ccc4eee7abdf','ic6gvo4mtxz0xk1lfkwp','','王子怡','',0,2,'王子怡','52','white',4,8,8,0,0,0,1,'GL5728','20240907',0,'',0,'','','','','','',0,'','','',1,1,'','','','','','','','','','王子怡，CMO',0,1788773453,1788773453,1788773453,0,0,0,'',0,0,'','',1),
(12,'','','zhouyutong','c161951685e72bf434ffcb854e85e0f4','fefo9m3gjl1oudqe7d4a','','周雨桐','',0,2,'周雨桐','53','white',2,8,17,0,0,0,1,'GL3392','20210908',0,'',0,'','','','','','',0,'','','',1,1,'','','','','','','','','','周雨桐，人事经理',0,1788773453,1788773453,1788773453,0,0,0,'',0,0,'','',1),
(13,'','','wuhao','e194e8d867b1b559ee8fdd352c83bd5f','ikk8n7qf0cwwursa4g5e','','吴昊','',0,1,'吴昊','54','white',6,3,16,0,0,0,1,'GL1238','20230908',0,'',0,'','','','','','',0,'','','',1,1,'','','','','','','','','','吴昊，后端工程师',0,1788773453,1788773453,1788773453,0,1788774924,2,'127.0.0.1',0,0,'','',1),
(14,'','','zhengxiaolan','6392ec75bf69c0769d3144208cd0e146','6xs5dk3sihq9yl0o8rzt','','郑晓岚','',0,2,'郑晓岚','55','white',11,9,13,0,0,0,1,'GL5008','20210908',0,'',0,'','','','','','',0,'','','',1,1,'','','','','','','','','','郑晓岚，产品经理',0,1788773453,1788773453,1788773453,0,0,0,'',0,0,'','',1),
(15,'','','fengle','f3fb077a6f5a60a02b2baab7add9f161','czal77psjbwn5aqy1n4a','','冯乐','',0,1,'冯乐','56','white',5,8,11,0,0,0,1,'GL6750','20250907',0,'',0,'','','','','','',0,'','','',1,1,'','','','','','','','','','冯乐，销售经理',0,1788773453,1788773453,1788773453,0,0,0,'',0,0,'','',1),
(16,'','','xujing','18f8ed07d87ef2c7b079f39f51ddef70','irq869ggeyr1c1dgg9i0','','许静','',0,2,'许静','57','white',3,10,18,0,0,0,1,'GL2532','20230908',0,'',0,'','','','','','',0,'','','',1,1,'','','','','','','','','','许静，财务专员',0,1788773453,1788773453,1788773453,0,0,0,'',0,0,'','',1),
(17,'','','hejun','e4b3a0a2079b9ae8f2d49921bc370085','hju0bw4njm0ddcku293j','','何俊','',0,1,'何俊','58','white',7,8,12,0,0,0,1,'GL3152','20210908',0,'',0,'','','','','','',0,'','','',1,1,'','','','','','','','','','何俊，客服主管',0,1788773453,1788773453,1788773453,0,0,0,'',0,0,'','',1),
(18,'','','yaolei','67331d0ea745b7c289630b33ce5bf729','w6347ltaomc80zby1kpu','wmscep','姚磊','',13145567865,1,'姚磊','59','white',11,9,13,4,2,2,1,'','',0,'',0,'','','','','','',0,'','','',0,1,'','','','','','','','','','',0,1788710400,1788778068,1788779135,0,0,0,'',0,0,'','',1);
/*!40000 ALTER TABLE `oa_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_admin_group`
--

DROP TABLE IF EXISTS `oa_admin_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_admin_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `status` int(1) NOT NULL DEFAULT 1,
  `rules` mediumtext DEFAULT NULL COMMENT '用户组拥有的规则id',
  `layouts` mediumtext DEFAULT NULL COMMENT '首页展示模块',
  `mobile_bar` mediumtext DEFAULT NULL COMMENT '手机端Bar',
  `mobile_menu` mediumtext DEFAULT NULL COMMENT '手机端工作台',
  `desc` mediumtext DEFAULT NULL COMMENT '备注',
  `create_time` bigint(11) NOT NULL DEFAULT 0,
  `update_time` bigint(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='员工权限分组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_admin_group`
--

LOCK TABLES `oa_admin_group` WRITE;
/*!40000 ALTER TABLE `oa_admin_group` DISABLE KEYS */;
INSERT INTO `oa_admin_group` VALUES
(1,'超级权限角色',1,'1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403,404,405,406,407,408,409,410,411,412,413,414,415,416,417,418,419,420,421,422,423,424,425,426,427,428,429,430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446,447,448,449,450,451,452,453,454,455,456,457,458,459,460,461,462,463,464,465,466,467,468,469,470,471,472,473,474,475,476,477,478,479,480,481,482,483,484,485,486,487,488,489,490,491,492,493,494,495,496','1,2,3,4,5,6,7,8,9,10,11,12,13','1,2,3,4,5','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,5,17,18,19,20,21,22,23,24','超级权限角色，拥有系统的最高权限，主要用于系统初始化数据而设，不可修改，不可删除。',0,0),
(2,'管理岗角色',1,'1,13,14,16,17,18,22,23,24,25,27,28,29,30,31,32,34,35,36,38,39,40,42,43,44,45,46,47,48,49,50,51,52,53,2,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,183,184,185,190,191,192,204,205,206,207,268,269,270,271,272,273,274,275,276,277,278,279,280,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,363,364,365,366,367,368,369,370,371,372,388,389,390,391,392,393,394,407,408,409,410,411,412,413,414,415,416,417,418,419,422,423,424,425,426,427,3,89,90,91,92,96,93,94,95,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,216,217,218,219,220,221,222,4,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,186,187,188,189,193,194,195,196,197,198,199,200,201,202,203,210,211,212,213,214,215,495,5,223,224,225,226,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,496,6,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,7,349,350,351,352,353,354,355,356,357,358,359,360,361,362,8,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,9,395,396,397,398,399,400,401,402,403,404,405,406,10,428,429,430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446,447,448,449,450,451,452,453,454,455,456,458,457,459,460,461,462,463,11,464,465,466,467,468,469,470,471,472,473,12,474,475,476,477,478,479,480,481,482,483,484,485,486,487,488,489,490,491,492,493,494','1,2,3,4,5,6,7,8,9,10,11,12,13','1,2,3,4,5','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24','管理岗角色权限，可根据公司的具体需求调整。',0,0),
(3,'业务岗角色',1,'340,4,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,186,187,188,189,193,194,195,196,197,198,199,200,201,202,203,210,211,212,213,214,215,495,5,223,224,225,226,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,496,6,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,7,349,350,351,352,353,354,355,356,357,358,359,360,361,362,8,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,9,395,396,397,398,399,400,401,402,403,404,405,406,10,428,429,430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446,447,448,449,450,451,452,453,454,455,456,458,457,459,460,461,462,463,11,464,465,466,467,468,469,470,471,472,473,12,474,475,476,477,478,479,480,481,482,483,484,485,486,487,488,489,490,491,492,493,494','1,2,3,4,5,6,7,8,9,10,11,12,13','1,2,3,4,5','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24','业务岗角色权限，可根据公司的具体需求调整。',0,0);
/*!40000 ALTER TABLE `oa_admin_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_admin_log`
--

DROP TABLE IF EXISTS `oa_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_admin_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '用户ID',
  `type` varchar(80) NOT NULL DEFAULT '' COMMENT '操作类型',
  `action` varchar(80) NOT NULL DEFAULT '' COMMENT '操作动作',
  `subject` varchar(80) NOT NULL DEFAULT '' COMMENT '操作主体',
  `module` varchar(32) NOT NULL DEFAULT '' COMMENT '模块',
  `controller` varchar(32) NOT NULL DEFAULT '' COMMENT '控制器',
  `function` varchar(32) NOT NULL DEFAULT '' COMMENT '方法',
  `ip` varchar(64) NOT NULL DEFAULT '' COMMENT '登录ip',
  `param_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '操作数据id',
  `param` mediumtext DEFAULT NULL COMMENT '参数json格式',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='员工操作日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_admin_log`
--

LOCK TABLES `oa_admin_log` WRITE;
/*!40000 ALTER TABLE `oa_admin_log` DISABLE KEYS */;
INSERT INTO `oa_admin_log` VALUES
(1,1,'login','登录','系统','','','','127.0.0.1',1,'[]',1788749085),
(2,1,'login','登录','系统','','','','127.0.0.1',1,'[]',1788749158),
(3,1,'login','登录','系统','','','','127.0.0.1',1,'[]',1788749196),
(4,1,'login','登录','系统','','','','127.0.0.1',1,'[]',1788749251),
(5,1,'login','登录','系统','','','','127.0.0.1',1,'[]',1788749354),
(6,1,'login','登录','系统','','','','127.0.0.1',1,'[]',1788751598),
(7,4,'login','登录','系统','','','','127.0.0.1',4,'[]',1788765528),
(8,4,'login','登录','系统','','','','127.0.0.1',4,'[]',1788765576),
(9,4,'login','登录','系统','','','','127.0.0.1',4,'[]',1788768327),
(10,4,'login','登录','系统','','','','127.0.0.1',4,'[]',1788769034),
(11,4,'login','登录','系统','','','','127.0.0.1',4,'[]',1788769082),
(12,4,'login','登录','系统','','','','127.0.0.1',4,'[]',1788769835),
(13,8,'login','登录','系统','','','','127.0.0.1',8,'[]',1788773537),
(14,13,'login','登录','系统','','','','127.0.0.1',13,'[]',1788774911),
(15,13,'login','登录','系统','','','','127.0.0.1',13,'[]',1788774922),
(16,8,'login','登录','系统','','','','127.0.0.1',8,'[]',1788775071),
(17,8,'add','新增','请假申请','home','leaves','add','127.0.0.1',1019,'{\"start_date\":1788883200,\"end_date\":2232547200,\"duration\":\"999\",\"types\":\"2\",\"reason\":\"\\u9976\\u603b\\u8bf7\\u5047\\u4e0d\\u9700\\u8981\\u7406\\u7531\",\"file\":\"\",\"file_ids\":\"\",\"flow_id\":\"1\",\"check_uames\":\"\\u5468\\u96e8\\u6850\",\"check_uids\":\"12\",\"check_copy_unames\":\"\",\"check_copy_uids\":\"\",\"id\":\"0\",\"admin_id\":8,\"did\":1,\"create_time\":1788775175}',1788775175),
(18,1,'login','登录','系统','','','','127.0.0.1',1,'[]',1788777376),
(19,1,'upload','上传','文件','api','index','upload','127.0.0.1',1,'{\"filepath\":\"\\/storage\\/202609\\/4sajo_76cdde4eeadb3e46282cdf540bce9c8f.png\",\"thumbpath\":\"\\/storage\\/202609\\/thumb_4sajo_76cdde4eeadb3e46282cdf540bce9c8f.png\",\"name\":\"27b0cc49e1069b6860c3e52394f73b4a.png\",\"mimetype\":\"image\\/png\",\"fileext\":\"png\",\"filesize\":609472,\"filename\":\"202609\\/4sajo_76cdde4eeadb3e46282cdf540bce9c8f.png\",\"sha1\":\"faac0a446ba8ffbc4c920265749d9b06abf896a8\",\"md5\":\"76cdde4eeadb3e46282cdf540bce9c8f\",\"module\":\"admin\",\"action\":\"upload\",\"uploadip\":\"127.0.0.1\",\"create_time\":1788778049,\"user_id\":1,\"status\":1,\"admin_id\":1,\"audit_time\":1788778049,\"use\":\"thumb\"}',1788778049),
(20,1,'add','新增','入职申请','user','talent','add','127.0.0.1',1,'{\"name\":\"\\u59da\\u78ca\",\"sex\":\"1\",\"thumb\":\"5\",\"file\":\"\",\"mobile\":\"13145567865\",\"email\":\"\",\"birthday\":\"\",\"idcard\":\"\",\"nation\":\"\",\"native_place\":\"\",\"political\":\"0\",\"marital_status\":\"1\",\"work_date\":\"\",\"resident_place\":\"\",\"home_address\":\"\",\"contact\":\"\",\"current_address\":\"\",\"contact_mobile\":\"\",\"desc\":\"\",\"graduate_school\":\"\",\"graduate_day\":\"\",\"speciality\":\"\",\"education\":\"\",\"to_did\":\"11\",\"pname\":\"\\u5218\\u51cc\\u806a\",\"pid\":\"9\",\"entry_time\":1788710400,\"position_id\":\"13\",\"position_name\":\"4\",\"position_rank\":\"2\",\"flow_id\":\"8\",\"check_uames\":\"\\u9976\\u65fa\",\"check_uids\":\"8\",\"check_copy_unames\":\"\",\"check_copy_uids\":\"\",\"id\":\"0\",\"admin_id\":1,\"did\":1,\"create_time\":1788778068}',1788778068),
(21,9,'login','登录','系统','','','','127.0.0.1',9,'[]',1788778106),
(22,8,'login','登录','系统','','','','127.0.0.1',8,'[]',1788778178),
(23,8,'check','审核通过','入职','api','check','flow_check','127.0.0.1',1,'{\"action_id\":\"1\",\"check_name\":\"talent\",\"check_flow_id\":\"8\",\"check_node\":\"1\",\"check_uids\":\"\",\"check\":\"1\",\"check_files\":\"\",\"content\":\"\",\"send_msg\":1,\"check_status\":2,\"check_history_uids\":8}',1788778642),
(24,1,'login','登录','系统','','','','127.0.0.1',1,'[]',1788779122),
(25,1,'add','新增','新员工','user','talent','set','127.0.0.1',18,'{\"mobile\":\"13145567865\",\"email\":\"\",\"to_did\":[\"11\",\"11\"],\"pname\":\"\\u5218\\u51cc\\u806a\",\"pid\":\"9\",\"entry_time\":1788710400,\"position_id\":\"13\",\"position_name\":\"4\",\"position_rank\":\"2\",\"type\":\"2\",\"is_staff\":\"1\",\"job_number\":\"\",\"remark\":\"\",\"id\":\"1\",\"reg_pwd\":\"wmscep\",\"update_time\":1788779135}',1788779135),
(26,1,'login','登录','系统','','','','127.0.0.1',1,'[]',1788832391),
(27,1,'edit','编辑','员工','user','user','add','127.0.0.1',2,'{\"name\":\"\\u5f90\\u51a0\\u6797\",\"mobile\":\"15350519169\",\"email\":\"2841048854@qq.com\",\"thumb\":\"43\",\"file\":\"\",\"sex\":\"1\",\"entry_time\":1788710400,\"did\":\"2\",\"department_ids\":\"\",\"position_id\":\"1\",\"pname\":\"\\u8d85\\u7ea7\\u5458\\u5de5\",\"pid\":\"1\",\"type\":\"1\",\"is_staff\":\"1\",\"is_hide\":\"0\",\"auth_did\":\"0\",\"id\":\"2\",\"nickname\":\"\\u5f90\\u51a0\\u6797\"}',1788832554),
(28,1,'view','查看','员工信息','user','user','view','127.0.0.1',8,'[]',1788832573),
(29,1,'upload','上传','文件','api','index','upload','127.0.0.1',1,'{\"filepath\":\"\\/storage\\/202609\\/n0b72_dea0351b29ffa2be40e4721ce23a67ec.png\",\"thumbpath\":\"\\/storage\\/202609\\/thumb_n0b72_dea0351b29ffa2be40e4721ce23a67ec.png\",\"name\":\"56a492e63e042592bc01671eed37e113.png\",\"mimetype\":\"image\\/png\",\"fileext\":\"png\",\"filesize\":278646,\"filename\":\"202609\\/n0b72_dea0351b29ffa2be40e4721ce23a67ec.png\",\"sha1\":\"dadd49e6580e36e112c5c3d64d0933b298e215f4\",\"md5\":\"dea0351b29ffa2be40e4721ce23a67ec\",\"module\":\"admin\",\"action\":\"upload\",\"uploadip\":\"127.0.0.1\",\"create_time\":1788832636,\"user_id\":1,\"status\":1,\"admin_id\":1,\"audit_time\":1788832636,\"use\":\"thumb\"}',1788832636),
(30,1,'edit','编辑','员工','user','user','add','127.0.0.1',8,'{\"name\":\"\\u9976\\u65fa\",\"mobile\":\"15350519122\",\"email\":\"lljjjhkac52u@maplcyn.shop\",\"thumb\":\"\\/storage\\/202609\\/n0b72_dea0351b29ffa2be40e4721ce23a67ec.png\",\"file\":\"\",\"sex\":\"1\",\"entry_time\":1788710400,\"did\":\"1\",\"department_ids\":\"\",\"position_id\":\"4\",\"pname\":\"\\u9976\\u65fa\",\"pid\":\"8\",\"type\":\"1\",\"is_staff\":\"1\",\"is_hide\":\"0\",\"auth_did\":\"0\",\"id\":\"8\",\"nickname\":\"\\u9976\\u65fa\"}',1788832678),
(31,1,'login','登录','系统','','','','127.0.0.1',1,'[]',1788837883);
/*!40000 ALTER TABLE `oa_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_admin_log_count`
--

DROP TABLE IF EXISTS `oa_admin_log_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_admin_log_count` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(4) NOT NULL COMMENT '年份',
  `date` date NOT NULL COMMENT '日期',
  `num` int(11) NOT NULL DEFAULT 1 COMMENT '统计数',
  `create_time` bigint(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='员工操作日志统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_admin_log_count`
--

LOCK TABLES `oa_admin_log_count` WRITE;
/*!40000 ALTER TABLE `oa_admin_log_count` DISABLE KEYS */;
INSERT INTO `oa_admin_log_count` VALUES
(1,2026,'2026-09-06',0,1788751599),
(2,2026,'2026-09-05',0,1788751599),
(3,2026,'2026-09-04',0,1788751599),
(4,2026,'2026-09-03',0,1788751599),
(5,2026,'2026-09-02',0,1788751599),
(6,2026,'2026-09-01',0,1788751599),
(7,2026,'2026-08-31',0,1788751599),
(8,2026,'2026-08-30',0,1788751599),
(9,2026,'2026-08-29',0,1788751599),
(10,2026,'2026-08-28',0,1788751599),
(11,2026,'2026-08-27',0,1788751599),
(12,2026,'2026-08-26',0,1788751599),
(13,2026,'2026-08-25',0,1788751599),
(14,2026,'2026-08-24',0,1788751599),
(15,2026,'2026-08-23',0,1788751599),
(16,2026,'2026-08-22',0,1788751599),
(17,2026,'2026-08-21',0,1788751599),
(18,2026,'2026-08-20',0,1788751599),
(19,2026,'2026-08-19',0,1788751599),
(20,2026,'2026-08-18',0,1788751599),
(21,2026,'2026-08-17',0,1788751599),
(22,2026,'2026-08-16',0,1788751599),
(23,2026,'2026-08-15',0,1788751599),
(24,2026,'2026-08-14',0,1788751599),
(25,2026,'2026-08-13',0,1788751599),
(26,2026,'2026-08-12',0,1788751599),
(27,2026,'2026-08-11',0,1788751599),
(28,2026,'2026-08-10',0,1788751599),
(29,2026,'2026-08-09',0,1788751599),
(30,2026,'2026-08-08',0,1788751599),
(31,2026,'2026-08-07',0,1788751599),
(32,2026,'2026-08-06',0,1788751599),
(33,2026,'2026-08-05',0,1788751599),
(34,2026,'2026-08-04',0,1788751599),
(35,2026,'2026-08-03',0,1788751599),
(36,2026,'2026-08-02',0,1788751599),
(37,2026,'2026-08-01',0,1788751599),
(38,2026,'2026-07-31',0,1788751599),
(39,2026,'2026-07-30',0,1788751599),
(40,2026,'2026-07-29',0,1788751599),
(41,2026,'2026-07-28',0,1788751599),
(42,2026,'2026-07-27',0,1788751599),
(43,2026,'2026-07-26',0,1788751599),
(44,2026,'2026-07-25',0,1788751599),
(45,2026,'2026-07-24',0,1788751599),
(46,2026,'2026-07-23',0,1788751599),
(47,2026,'2026-07-22',0,1788751599),
(48,2026,'2026-07-21',0,1788751599),
(49,2026,'2026-07-20',0,1788751599),
(50,2026,'2026-07-19',0,1788751599),
(51,2026,'2026-07-18',0,1788751599),
(52,2026,'2026-07-17',0,1788751599),
(53,2026,'2026-07-16',0,1788751599),
(54,2026,'2026-07-15',0,1788751599),
(55,2026,'2026-07-14',0,1788751599),
(56,2026,'2026-07-13',0,1788751599),
(57,2026,'2026-07-12',0,1788751599),
(58,2026,'2026-07-11',0,1788751599),
(59,2026,'2026-07-10',0,1788751599),
(60,2026,'2026-07-09',0,1788751599),
(61,2026,'2026-07-08',0,1788751599),
(62,2026,'2026-07-07',0,1788751599),
(63,2026,'2026-07-06',0,1788751599),
(64,2026,'2026-07-05',0,1788751599),
(65,2026,'2026-07-04',0,1788751599),
(66,2026,'2026-07-03',0,1788751599),
(67,2026,'2026-07-02',0,1788751599),
(68,2026,'2026-07-01',0,1788751599),
(69,2026,'2026-06-30',0,1788751599),
(70,2026,'2026-06-29',0,1788751599),
(71,2026,'2026-06-28',0,1788751599),
(72,2026,'2026-06-27',0,1788751599),
(73,2026,'2026-06-26',0,1788751599),
(74,2026,'2026-06-25',0,1788751599),
(75,2026,'2026-06-24',0,1788751599),
(76,2026,'2026-06-23',0,1788751599),
(77,2026,'2026-06-22',0,1788751599),
(78,2026,'2026-06-21',0,1788751599),
(79,2026,'2026-06-20',0,1788751599),
(80,2026,'2026-06-19',0,1788751599),
(81,2026,'2026-06-18',0,1788751599),
(82,2026,'2026-06-17',0,1788751599),
(83,2026,'2026-06-16',0,1788751599),
(84,2026,'2026-06-15',0,1788751599),
(85,2026,'2026-06-14',0,1788751599),
(86,2026,'2026-06-13',0,1788751599),
(87,2026,'2026-06-12',0,1788751599),
(88,2026,'2026-06-11',0,1788751599),
(89,2026,'2026-06-10',0,1788751599),
(90,2026,'2026-06-09',0,1788751599),
(91,2026,'2026-09-07',25,1788832392);
/*!40000 ALTER TABLE `oa_admin_log_count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_admin_module`
--

DROP TABLE IF EXISTS `oa_admin_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_admin_module` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '模块名称',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '模块目录，唯一，字母',
  `desc` varchar(500) NOT NULL DEFAULT '' COMMENT '模块功能描述',
  `type` int(2) NOT NULL DEFAULT 1 COMMENT '状态:1系统模块,2普通模块,3自定义模块',
  `sourse` int(2) NOT NULL DEFAULT 1 COMMENT '来源:1官方,2第三方',
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '状态:0禁用,1正常',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='功能模块表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_admin_module`
--

LOCK TABLES `oa_admin_module` WRITE;
/*!40000 ALTER TABLE `oa_admin_module` DISABLE KEYS */;
INSERT INTO `oa_admin_module` VALUES
(1,'系统模块','home','',1,1,1,1639562910,0),
(2,'人事模块','user','',1,1,1,1639562910,0),
(3,'行政模块','adm','',1,1,1,1639562910,0),
(4,'办公模块','office','',1,1,1,1639562910,0),
(5,'客户模块','customer','',2,1,1,1639562910,0),
(6,'合同模块','contract','',2,1,1,1656142368,0),
(7,'项目模块','project','',2,1,1,1656142368,0),
(8,'售后模块','service','',2,1,1,1656142368,0),
(9,'财务模块','finance','',2,1,1,1639562910,0),
(10,'网盘模块','disk','',2,1,1,1656143065,0);
/*!40000 ALTER TABLE `oa_admin_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_admin_profiles`
--

DROP TABLE IF EXISTS `oa_admin_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_admin_profiles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL DEFAULT 0 COMMENT '员工ID',
  `types` int(1) NOT NULL DEFAULT 0 COMMENT '类型:1教育经历/2工作经历/3相关证书/4计算机技能/5语言能力',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '院校/培训机构/公司名称/证书名称/技能名称/语言名称/',
  `start_time` varchar(255) NOT NULL DEFAULT '' COMMENT '开始时间',
  `end_time` varchar(255) NOT NULL DEFAULT '' COMMENT '结束时间',
  `speciality` varchar(50) NOT NULL DEFAULT '' COMMENT '所学专业',
  `education` varchar(50) NOT NULL DEFAULT '' COMMENT '所获学历',
  `authority` varchar(50) NOT NULL DEFAULT '' COMMENT '颁发机构',
  `position` varchar(50) NOT NULL DEFAULT '' COMMENT '职位',
  `know` int(11) NOT NULL DEFAULT 0 COMMENT '熟悉程度',
  `remark` mediumtext DEFAULT NULL COMMENT '备注说明',
  `sort` int(5) NOT NULL DEFAULT 0 COMMENT '排序',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '修改时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='员工档案表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_admin_profiles`
--

LOCK TABLES `oa_admin_profiles` WRITE;
/*!40000 ALTER TABLE `oa_admin_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_admin_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_admin_rule`
--

DROP TABLE IF EXISTS `oa_admin_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_admin_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '父id',
  `src` varchar(255) NOT NULL DEFAULT '' COMMENT 'url链接',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '日志操作名称',
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT '所属模块',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT '图标',
  `menu` int(1) NOT NULL DEFAULT 0 COMMENT '是否是菜单,1是,2不是',
  `sort` int(11) NOT NULL DEFAULT 1 COMMENT '越小越靠前',
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '状态,0禁用,1正常',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=497 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='菜单及权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_admin_rule`
--

LOCK TABLES `oa_admin_rule` WRITE;
/*!40000 ALTER TABLE `oa_admin_rule` DISABLE KEYS */;
INSERT INTO `oa_admin_rule` VALUES
(1,0,'','系统管理','系统管理','home','icon-jichupeizhi',1,1,1,0,0),
(2,0,'','基础数据','基础数据','base','icon-hetongshezhi',1,2,1,0,0),
(3,0,'','人事管理','人事管理','user','icon-renshishezhi',1,3,1,0,0),
(4,0,'','行政办公','行政办公','adm','icon-banjiguanli',1,4,1,0,0),
(5,0,'','日常办公','日常办公','office','icon-kaoshijihua',1,5,1,0,0),
(6,0,'','客户管理','客户管理','customer','icon-kehuguanli',1,6,1,0,0),
(7,0,'','合同管理','合同管理','contract','icon-hetongyidong',1,7,1,0,0),
(8,0,'','项目管理','项目管理','project','icon-xiangmuguanli',1,8,1,0,0),
(9,0,'','售后管理','售后管理','service','icon-biaoxingyuangong',1,9,1,0,0),
(10,0,'','财务管理','财务管理','finance','icon-yuangongtidian',1,10,1,0,0),
(11,0,'','数据分析','数据分析','analysis','icon-bingtutongji',1,11,1,0,0),
(12,0,'','知识网盘','知识网盘','disk','icon-tikuguanli',1,12,1,0,0),
(13,1,'home/conf/index','系统配置','系统配置','home','',1,1,1,0,0),
(14,13,'home/conf/add','新建/编辑','配置项','home','',2,1,1,0,0),
(15,13,'home/conf/delete','删除','配置项','home','',2,1,1,0,0),
(16,13,'home/conf/edit','编辑','配置详情','home','',2,1,1,0,0),
(17,1,'home/module/index','功能模块','功能模块','home','',1,1,1,0,0),
(18,17,'home/module/add','新建/编辑','功能模块','home','',2,1,1,0,0),
(19,17,'home/module/del','删除','功能模块','home','',2,1,1,0,0),
(20,17,'home/module/recovery','恢复','功能模块','home','',2,1,1,0,0),
(21,17,'home/module/install','安装','功能模块','home','',2,1,1,0,0),
(22,1,'home/dataauth/index','模块配置','模块配置','home','',1,1,1,0,0),
(23,22,'home/dataauth/edit','编辑','模块配置','home','',2,1,1,0,0),
(24,1,'home/rule/index','功能节点','功能节点','home','',1,1,1,0,0),
(25,24,'home/rule/add','新建/编辑','功能节点','home','',2,1,1,0,0),
(26,24,'home/rule/delete','删除','功能节点','home','',2,1,1,0,0),
(27,1,'mobile/bar/datalist','移动端配置','移动端配置','home','',1,1,1,0,0),
(28,27,'mobile/bar/datalist','BAR菜单','BAR菜单','home','',2,1,1,0,0),
(29,28,'mobile/bar/add','新建/编辑','BAR菜单','home','',2,1,1,0,0),
(30,28,'mobile/bar/set','设置','BAR菜单','home','',2,1,1,0,0),
(31,27,'mobile/types/datalist','工作台菜单类型','工作台菜单类型','home','',2,1,1,0,0),
(32,31,'mobile/types/add','新建/编辑','工作台菜单类型','home','',2,1,1,0,0),
(33,31,'mobile/types/del','删除','工作台菜单类型','home','',2,1,1,0,0),
(34,31,'mobile/types/set','设置','工作台菜单类型','home','',2,1,1,0,0),
(35,27,'mobile/menu/datalist','工作台菜单','工作台菜单','home','',2,1,1,0,0),
(36,35,'mobile/menu/add','新建/编辑','工作台菜单','home','',2,1,1,0,0),
(37,35,'mobile/menu/del','删除','工作台菜单','home','',2,1,1,0,0),
(38,35,'mobile/menu/set','设置','工作台菜单','home','',2,1,1,0,0),
(39,1,'home/role/index','角色权限','角色权限','home','',1,1,1,0,0),
(40,39,'home/role/add','新建/编辑','角色权限','home','',2,1,1,0,0),
(41,39,'home/role/delete','删除','角色权限','home','',2,1,1,0,0),
(42,1,'home/log/index','操作日志','操作日志','home','',1,1,1,0,0),
(43,1,'home/files/index','附件管理','附件管理','home','',1,1,1,0,0),
(44,43,'home/files/edit','编辑附件','附件','home','',2,1,1,0,0),
(45,43,'home/files/move','移动附件','附件','home','',2,1,1,0,0),
(46,43,'home/files/delete','删除附件','附件','home','',2,1,1,0,0),
(47,43,'home/files/get_group','附件分组','附件分组','home','',2,1,1,0,0),
(48,43,'home/files/add_group','新建/编辑','附件分组','home','',2,1,1,0,0),
(49,43,'home/files/del_group','删除附件分组','附件分组','home','',2,1,1,0,0),
(50,1,'home/database/database','备份数据','数据备份','home','',1,1,1,0,0),
(51,50,'home/database/backup','备份数据表','数据','home','',2,1,1,0,0),
(52,1,'home/task/index','定时任务','定时任务','home','',1,1,1,0,0),
(53,52,'home/task/add','新建/编辑','定时任务','home','',2,1,1,0,0),
(54,52,'home/task/delete','删除','定时任务','home','',2,1,1,0,0),
(55,2,'','公共模块','公共模块','home','',1,1,1,0,0),
(56,55,'home/template/datalist','消息模板','消息模板','home','',1,1,1,0,0),
(57,56,'home/template/add','新建/编辑','消息模板','home','',2,1,1,0,0),
(58,56,'home/template/set','设置','消息模板','home','',2,1,1,0,0),
(59,56,'home/template/view','查看','消息模板','home','',2,1,1,0,0),
(60,55,'adm/flow/modulelist','审批模块','审批模块','adm','',1,1,1,0,0),
(61,60,'adm/flow/module_add','新建/编辑','审批模块','adm','',2,1,1,0,0),
(62,60,'adm/flow/module_check','设置','审批模块','adm','',2,1,1,0,0),
(63,55,'adm/flow/catelist','审批类型','审批类型','adm','',1,1,1,0,0),
(64,63,'adm/flow/cate_add','新建/编辑','审批类型','adm','',2,1,1,0,0),
(65,63,'adm/flow/cate_check','设置','审批类型','adm','',2,1,1,0,0),
(66,55,'adm/flow/datalist','审批流程','审批流程','adm','',1,1,1,0,0),
(67,66,'adm/flow/add','新建/编辑','审批流程','adm','',2,1,1,0,0),
(68,66,'adm/flow/del','删除','审批流程','adm','',2,1,1,0,0),
(69,66,'adm/flow/check','设置','审批流程','adm','',2,1,1,0,0),
(70,55,'home/cate/enterprise','企业主体','企业主体','home','',1,1,1,0,0),
(71,70,'home/cate/enterprise_add','新建/编辑','企业主体','home','',2,1,1,0,0),
(72,70,'home/cate/enterprise_check','设置','企业主体','home','',2,1,1,0,0),
(73,55,'home/area/datalist','全国省市','全国省市','home','',1,1,1,0,0),
(74,73,'home/area/add','新建/编辑','全国省市','home','',2,1,1,0,0),
(75,73,'home/area/set','设置','全国省市','home','',2,1,1,0,0),
(76,55,'home/cate/links','办公工具','办公工具','home','',1,1,1,0,0),
(77,76,'home/cate/links_add','新建/编辑','办公工具','home','',2,1,1,0,0),
(78,76,'home/cate/links_del','删除','办公工具','home','',2,1,1,0,0),
(79,2,'','人事模块','人事模块','user','',1,1,1,0,0),
(80,79,'user/rewardscate/datalist','奖罚项目','奖罚项目','user','',1,1,1,0,0),
(81,80,'user/rewardscate/add','新建/编辑','奖罚项目','user','',2,1,1,0,0),
(82,80,'user/rewardscate/set','设置','奖罚项目','user','',2,1,1,0,0),
(83,79,'user/carecate/datalist','关怀项目','关怀项目','user','',1,1,1,0,0),
(84,83,'user/carecate/add','新建/编辑','关怀项目','user','',2,1,1,0,0),
(85,83,'user/carecate/set','设置','关怀项目','user','',2,1,1,0,0),
(86,79,'user/basic/datalist','常规数据','常规数据','user','',1,1,1,0,0),
(87,86,'user/basic/add','新建/编辑','常规数据','user','',2,1,1,0,0),
(88,86,'user/basic/set','设置','常规数据','user','',2,1,1,0,0),
(89,3,'user/department/index','部门架构','部门','user','',1,1,1,0,0),
(90,89,'user/department/add','新建/编辑','部门','user','',2,1,1,0,0),
(91,89,'user/department/delete','删除','部门','user','',2,1,1,0,0),
(92,3,'user/position/index','岗位职称','岗位职称','user','',1,1,1,0,0),
(93,92,'user/position/add','新建/编辑','岗位职称','user','',2,1,1,0,0),
(94,92,'user/position/delete','删除','岗位职称','user','',2,1,1,0,0),
(95,92,'user/position/view','查看','岗位职称','user','',2,1,1,0,0),
(96,92,'user/position/layouts','工作台布局','工作台布局','user','',2,0,1,1656143065,0),
(97,3,'user/user/index','企业员工','员工','user','',1,1,1,0,0),
(98,97,'user/user/add','新建/编辑','员工','user','',2,1,1,0,0),
(99,97,'user/user/view','查看','员工信息','user','',2,1,1,0,0),
(100,97,'user/user/set','设置','员工状态','user','',2,1,1,0,0),
(101,97,'user/user/reset_psw','重设密码','员工密码','user','',2,1,1,0,0),
(102,97,'user/user/del','删除','员工','user','',2,1,1,0,0),
(103,3,'user/files/datalist','员工档案','员工档案','user','',1,1,1,0,0),
(104,103,'user/files/add','编辑','员工档案','user','',2,1,1,0,0),
(105,103,'user/files/view','查看','员工档案','user','',2,1,1,0,0),
(106,3,'user/talent/datalist','入职申请','入职申请','user','',1,1,1,0,0),
(107,106,'user/talent/add','新增/编辑','入职申请','user','',2,1,1,0,0),
(108,106,'user/talent/view','查看','入职申请','user','',2,1,1,0,0),
(109,106,'user/talent/del','删除','入职申请','user','',2,1,1,0,0),
(110,106,'user/talent/set','入职','新员工','user','',2,1,1,0,0),
(111,3,'user/personal/change','人事调动','人事调动','user','',1,1,1,0,0),
(112,111,'user/personal/change_add','新建/编辑','人事调动','user','',2,1,1,0,0),
(113,111,'user/personal/change_view','查看','人事调动','user','',2,1,1,0,0),
(114,111,'user/personal/change_delete','删除','人事调动','user','',2,1,1,0,0),
(115,3,'user/personal/leave','离职申请','离职申请','user','',1,1,1,0,0),
(116,115,'user/personal/leave_add','新建/编辑','离职申请','user','',2,1,1,0,0),
(117,115,'user/personal/leave_delete','删除','离职申请','user','',2,1,1,0,0),
(118,115,'user/personal/leave_view','查看','离职申请','user','',2,1,1,0,0),
(119,3,'user/rewards/datalist','奖罚管理','奖罚管理','user','',1,1,1,0,0),
(120,119,'user/rewards/add','新建/编辑','奖罚管理','user','',2,1,1,0,0),
(121,119,'user/rewards/view','查看','奖罚管理','user','',2,1,1,0,0),
(122,119,'user/rewards/del','删除','奖罚管理','user','',2,1,1,0,0),
(123,3,'user/care/datalist','员工关怀','员工关怀','user','',1,1,1,0,0),
(124,123,'user/care/add','新建/编辑','员工关怀','user','',2,1,1,0,0),
(125,123,'user/care/view','查看','员工关怀','user','',2,1,1,0,0),
(126,123,'user/care/del','删除','员工关怀','user','',2,1,1,0,0),
(127,3,'user/laborcontract/datalist','员工合同','员工合同','user','',1,1,1,0,0),
(128,127,'user/laborcontract/add','新建/编辑','员工合同','user','',2,1,1,0,0),
(129,127,'user/laborcontract/add_renewal','续签','员工合同','user','',2,1,1,0,0),
(130,127,'user/laborcontract/add_change','变更','员工合同','user','',2,1,1,0,0),
(131,127,'user/laborcontract/view','查看','员工合同','user','',2,1,1,0,0),
(132,127,'user/laborcontract/del','删除','员工合同','user','',2,1,1,0,0),
(133,127,'user/laborcontract/set','设置','员工合同','user','',2,1,1,0,0),
(134,3,'user/blacklist/datalist','人员黑名单','黑名单','user','',1,1,1,0,0),
(135,134,'user/blacklist/add','编辑','黑名单','user','',2,1,1,0,0),
(136,134,'user/blacklist/del','删除','黑名单','user','',2,1,1,0,0),
(137,2,'','行政模块','行政模块','adm','',1,1,1,0,0),
(138,137,'adm/propertycate/datalist','资产分类','资产分类','adm','',1,1,1,0,0),
(139,138,'adm/propertycate/add','新建/编辑','资产分类','adm','',2,1,1,0,0),
(140,138,'adm/propertycate/del','删除','资产分类','adm','',2,1,1,0,0),
(141,137,'adm/propertybrand/datalist','资产品牌','资产品牌','adm','',1,1,1,0,0),
(142,141,'adm/propertybrand/add','新建/编辑','资产品牌','adm','',2,1,1,0,0),
(143,141,'adm/propertybrand/check','设置','资产品牌','adm','',2,1,1,0,0),
(144,137,'adm/propertyunit/datalist','资产单位','资产单位','adm','',1,1,1,0,0),
(145,144,'adm/propertyunit/add','新建/编辑','资产单位','adm','',2,1,1,0,0),
(146,144,'adm/propertyunit/check','设置','资产单位','adm','',2,1,1,0,0),
(147,137,'adm/sealcate/datalist','印章管理','印章','adm','',1,1,1,0,0),
(148,147,'adm/sealcate/add','新建/编辑','印章','adm','',2,1,1,0,0),
(149,147,'adm/sealcate/check','设置','印章','adm','',2,1,1,0,0),
(150,137,'adm/basic/datalist','常规数据','常规数据','adm','',1,1,1,0,0),
(151,150,'adm/basic/add','新建/编辑','常规数据','adm','',2,1,1,0,0),
(152,150,'adm/basic/set','设置','常规数据','adm','',2,1,1,0,0),
(153,4,'','固定资产','固定资产','adm','',1,1,1,0,0),
(154,153,'adm/property/datalist','资产信息','固定资产','adm','',1,1,1,0,0),
(155,154,'adm/property/add','新建/编辑','固定资产','adm','',2,1,1,0,0),
(156,154,'adm/property/check','设置','固定资产','adm','',2,1,1,0,0),
(157,154,'adm/property/view','查看','固定资产','adm','',2,1,1,0,0),
(158,153,'adm/property/repair_list','报修记录','资产报修记录','adm','',1,1,1,0,0),
(159,158,'adm/property/repair_add','新建/编辑','资产报修记录','adm','',2,1,1,0,0),
(160,158,'adm/property/repair_view','查看','资产报修记录','adm','',2,1,1,0,0),
(161,158,'adm/property/repair_del','删除','资产报修记录','adm','',2,1,1,0,0),
(162,4,'','车辆管理','车辆','adm','',1,1,1,0,0),
(163,162,'adm/car/datalist','车辆信息','车辆','adm','',1,1,1,0,0),
(164,163,'adm/car/add','新建/编辑','车辆','adm','',2,1,1,0,0),
(165,163,'adm/car/del','删除','车辆','adm','',2,1,1,0,0),
(166,163,'adm/car/view','查看','车辆','adm','',2,1,1,0,0),
(167,162,'adm/car/repair_list','车辆维修','车辆维修记录','adm','',1,1,1,0,0),
(168,167,'adm/car/repair_add','新建/编辑','车辆维修记录','adm','',2,1,1,0,0),
(169,167,'adm/car/repair_view','查看','车辆维修记录','adm','',2,1,1,0,0),
(170,167,'adm/car/repair_del','删除','车辆维修记录','adm','',2,1,1,0,0),
(171,162,'adm/car/protect_list','车辆保养','车辆保养记录','adm','',1,1,1,0,0),
(172,171,'adm/car/protect_add','新建/编辑','车辆保养记录','adm','',2,1,1,0,0),
(173,171,'adm/car/protect_view','查看','车辆保养记录','adm','',2,1,1,0,0),
(174,171,'adm/car/protect_del','删除','车辆保养记录','adm','',2,1,1,0,0),
(175,162,'adm/car/mileage_list','车辆里程','车辆里程记录','adm','',2,1,1,0,0),
(176,175,'adm/car/mileage_add','新建/编辑','车辆里程记录','adm','',2,1,1,0,0),
(177,175,'adm/car/mileage_del','删除','车辆里程记录','adm','',2,1,1,0,0),
(178,162,'adm/car/fee_list','车辆费用','车辆费用记录','adm','',1,1,1,0,0),
(179,178,'adm/car/fee_add','新建/编辑','车辆费用记录','adm','',2,1,1,0,0),
(180,178,'adm/car/fee_view','查看','车辆费用记录','adm','',2,1,1,0,0),
(181,178,'adm/car/fee_del','删除','车辆费用记录','adm','',2,1,1,0,0),
(182,162,'adm/car/record','用车记录','用车记录','adm','',1,1,1,0,0),
(183,137,'adm/regulationcate/datalist','制度类型','制度类型','adm','',1,1,1,0,0),
(184,183,'adm/regulationcate/add','新建/编辑','制度类型','adm','',2,1,1,0,0),
(185,183,'adm/regulationcate/set','设置','制度类型','adm','',2,1,1,0,0),
(186,4,'adm/regulation/datalist','规章制度','规章制度','adm','',1,1,1,0,0),
(187,186,'adm/regulation/add','新建/编辑','规章制度','adm','',2,1,1,0,0),
(188,186,'adm/regulation/del','删除','规章制度','adm','',2,1,1,0,0),
(189,186,'adm/regulation/view','查看','规章制度','adm','',2,1,1,0,0),
(190,137,'adm/notecate/datalist','公告类型','公告类型','adm','',1,1,1,0,0),
(191,190,'adm/notecate/add','新建/编辑','公告类型','adm','',2,1,1,0,0),
(192,190,'adm/notecate/set','设置','公告类型','adm','',2,1,1,0,0),
(193,4,'adm/note/datalist','公告列表','公告','adm','',1,1,1,0,0),
(194,193,'adm/note/add','新建/编辑','公告','adm','',2,1,1,0,0),
(195,193,'adm/note/del','删除','公告','adm','',2,1,1,0,0),
(196,193,'adm/note/view','查看','公告','adm','',2,1,1,0,0),
(197,4,'adm/news/datalist','公司新闻','公司新闻','adm','',1,1,1,0,0),
(198,197,'adm/news/add','新建/编辑','公司新闻','adm','',2,1,1,0,0),
(199,197,'adm/news/del','删除','公司新闻','adm','',2,1,1,0,0),
(200,197,'adm/news/view','查看','公司新闻','adm','',2,1,1,0,0),
(201,4,'adm/events/datalist','公司大事记','公司大事记','adm','',1,1,1,0,0),
(202,201,'adm/events/add','新建/编辑','大事记','adm','',2,1,1,0,0),
(203,201,'adm/events/del','删除','大事记','adm','',2,1,1,0,0),
(204,137,'adm/official/number_list','文号配置','文号配置','adm','',1,1,1,0,0),
(205,204,'adm/official/number_add','新增/编辑','文号配置','adm','',2,1,1,0,0),
(206,204,'adm/official/number_view','查看','文号配置','adm','',2,1,1,0,0),
(207,204,'adm/official/number_set','设置','文号配置','adm','',2,1,1,0,0),
(210,4,'adm/seal/record','用章记录','用章记录','adm','',1,1,1,0,0),
(211,4,'adm/meeting/room','会议室管理','会议室','adm','',1,1,1,0,0),
(212,211,'adm/meeting/room_add','新建/编辑','会议室','adm','',2,1,1,0,0),
(213,211,'adm/meeting/room_view','查看','会议纪要','adm','',2,1,1,0,0),
(214,211,'adm/meeting/room_check','设置','会议室','adm','',2,1,1,0,0),
(215,211,'adm/meeting/room_use','使用情况','会议室','user','',2,1,1,0,0),
(216,3,'adm/salary/datalist','员工薪资','薪资','user','',1,1,1,0,0),
(217,216,'adm/salary/add','新建/编辑','薪资','user','',2,1,1,0,0),
(218,216,'adm/salary/view','查看','薪资','user','',2,1,1,0,0),
(219,216,'adm/salary/del','删除','薪资','user','',2,1,1,0,0),
(220,216,'adm/salary/records_add','新增/编辑','员工工资','user','',2,1,1,0,0),
(221,216,'adm/salary/records_view','查看','员工工资','user','',2,1,1,0,0),
(222,216,'adm/salary/records_del','删除','员工工资','user','',2,1,1,0,0),
(223,5,'adm/car/apply_list','用车申请','用车','oa','',1,1,1,0,0),
(224,223,'adm/car/apply_add','新建/编辑','用车','oa','',2,1,1,0,0),
(225,223,'adm/car/apply_view','查看','用车','oa','',2,1,1,0,0),
(226,223,'adm/car/apply_del','删除','用车','oa','',2,1,1,0,0),
(235,5,'adm/seal/datalist','用章申请','用章申请','oa','',1,1,1,0,0),
(236,235,'adm/seal/add','新建/编辑','用章申请','oa','',2,1,1,0,0),
(237,235,'adm/seal/view','查看','用章申请','oa','',2,1,1,0,0),
(238,235,'adm/seal/del','删除','用章申请','oa','',2,1,1,0,0),
(239,5,'adm/meeting/datalist','会议室预定','会议室预定','oa','',1,1,1,0,0),
(240,239,'adm/meeting/add','新增/编辑','会议室预定','oa','',2,1,1,0,0),
(241,239,'adm/meeting/view','查看','会议室预定','oa','',2,1,1,0,0),
(242,239,'adm/meeting/del','删除','会议室预定','oa','',2,1,1,0,0),
(243,5,'adm/meeting/records','会议记录','会议记录','oa','',1,1,1,0,0),
(244,243,'adm/meeting/records_add','新建/编辑','会议记录','oa','',2,1,1,0,0),
(245,243,'adm/meeting/records_view','查看','会议纪要','oa','',2,1,1,0,0),
(246,243,'adm/meeting/records_del','删除','会议纪要','oa','',2,1,1,0,0),
(247,5,'oa/plan/calendar','日程安排','日程安排','oa','',1,1,1,0,0),
(248,247,'oa/plan/add','新建/编辑','日程安排','oa','',2,1,1,0,0),
(249,247,'oa/plan/view','查看','日程安排','oa','',2,1,1,0,0),
(250,247,'oa/plan/del','删除','日程安排','oa','',2,1,1,0,0),
(251,247,'oa/plan/datalist','日程列表','日程安排','oa','',2,1,1,0,0),
(252,5,'oa/schedule/calendar','工作日志','工作日志','oa','',1,1,1,0,0),
(253,252,'oa/schedule/add','新建/编辑','工作日志','oa','',2,1,1,0,0),
(254,252,'oa/schedule/view','查看','工作日志','oa','',2,1,1,0,0),
(255,252,'oa/schedule/del','删除','工作日志','oa','',2,1,1,0,0),
(256,252,'oa/schedule/datalist','工作日志','工作日志','oa','',2,1,1,0,0),
(257,5,'oa/work/datalist','工作汇报','工作汇报','oa','',1,1,1,0,0),
(258,257,'oa/work/add','新建/编辑','工作汇报','oa','',2,1,1,0,0),
(259,257,'oa/work/send','发送','工作汇报','oa','',2,1,1,0,0),
(260,257,'oa/work/view','查看','工作汇报','oa','',2,1,1,0,0),
(261,257,'oa/work/del','删除','工作汇报','oa','',2,1,1,0,0),
(262,5,'oa/workplan/datalist','工作计划','工作计划','oa','',1,1,1,0,0),
(263,262,'oa/workplan/add','新建/编辑','工作计划','oa','',2,1,1,0,0),
(264,262,'oa/workplan/view','查看','工作计划','oa','',2,1,1,0,0),
(265,262,'oa/workplan/del','删除','工作计划','oa','',2,1,1,0,0),
(266,5,'oa/salary/datalist','我的薪资','薪资','oa','',1,1,1,0,0),
(267,266,'oa/salary/view','详情','薪资','oa','',2,1,1,0,0),
(268,2,'','客户模块','客户模块','customer','',1,1,1,0,0),
(269,268,'customer/industry/datalist','行业类型','行业类型','home','',1,0,1,0,0),
(270,269,'customer/industry/add','新建/编辑','行业类型','home','',2,0,1,0,0),
(271,269,'customer/industry/set','设置','行业类型','home','',2,0,1,0,0),
(272,268,'customer/grade/datalist','客户等级','客户等级','customer','',1,0,1,0,0),
(273,272,'customer/grade/add','新建/编辑','客户等级','customer','',2,0,1,0,0),
(274,272,'customer/grade/set','设置','客户等级','customer','',2,0,1,0,0),
(275,268,'customer/source/datalist','客户渠道','客户渠道','customer','',1,0,1,0,0),
(276,275,'customer/source/add','新建/编辑','客户渠道','customer','',2,0,1,0,0),
(277,275,'customer/source/set','设置','客户渠道','customer','',2,0,1,0,0),
(278,268,'customer/basic/datalist','常规数据','常规数据','user','',1,1,1,0,0),
(279,278,'customer/basic/add','新建/编辑','常规数据','user','',2,1,1,0,0),
(280,278,'customer/basic/set','设置','常规数据','user','',2,1,1,0,0),
(281,6,'customer/customer/datalist','客户列表','客户列表','customer','',1,0,1,1556143065,0),
(282,281,'customer/customer/add','新建/编辑','客户','customer','',2,0,1,1556143065,0),
(283,281,'customer/customer/view','查看','客户','customer','',2,0,1,1556143065,0),
(284,281,'customer/customer/del','删除','客户','customer','',2,0,1,1556143065,0),
(285,6,'customer/index/rush','抢 客 宝','抢客宝','customer','',1,0,1,0,0),
(286,6,'customer/index/sea','公海客户','客户','customer','',1,0,1,1556143065,0),
(287,286,'customer/index/to_get','获取','客户','customer','',2,0,1,1556143065,0),
(288,286,'customer/index/to_divide','分配客户','客户','customer','',2,0,1,1556143065,0),
(289,286,'customer/index/to_sea','转入公海','客户','customer','',2,0,1,1556143065,0),
(290,286,'customer/index/to_trash','转入废弃池','客户','customer','',2,0,1,1556143065,0),
(291,286,'customer/index/to_revert','恢复客户','客户','customer','',2,0,1,1556143065,0),
(292,6,'customer/index/trash','废弃客户','客户','customer','',1,0,1,1556143065,0),
(293,6,'customer/contact/datalist','客户联系人','联系人','customer','',1,0,1,1656143065,0),
(294,293,'customer/contact/add','新建/编辑','联系人','customer','',2,0,1,1656143065,0),
(295,293,'customer/contact/del','删除','联系人','customer','',2,0,1,1656143065,0),
(296,293,'customer/contact/view','查看','客户联系人','customer','',2,1,1,0,0),
(297,6,'customer/chance/datalist','销售机会','销售机会','customer','',1,0,1,1656143065,0),
(298,297,'customer/chance/add','新建/编辑','销售机会','customer','',2,0,1,1656143065,0),
(299,297,'customer/chance/view','查看','销售机会','customer','',2,0,1,1656143065,0),
(300,297,'customer/chance/del','删除','销售机会','customer','',2,0,1,1656143065,0),
(301,6,'customer/trace/datalist','客户跟进','客户跟进','customer','',1,0,1,1656143065,0),
(302,301,'customer/trace/add','新建/编辑','客户跟进','customer','',2,0,1,1656143065,0),
(303,301,'customer/trace/view','查看','客户跟进','customer','',2,0,1,1656143065,0),
(304,301,'customer/trace/del','删除','客户跟进','customer','',2,0,1,1656143065,0),
(305,6,'customer/clue/datalist','线索列表','线索列表','customer','',1,0,1,1556143065,0),
(306,305,'customer/clue/add','新建/编辑','线索','customer','',2,0,1,1556143065,0),
(307,305,'customer/clue/view','查看','线索','customer','',2,0,1,1556143065,0),
(308,305,'customer/clue/del','删除','线索','customer','',2,0,1,1556143065,0),
(309,6,'customer/clue/sealist','公海线索','线索','customer','',1,0,1,1556143065,0),
(310,309,'customer/clue/to_get','获取','线索','customer','',2,0,1,1556143065,0),
(311,309,'customer/clue/to_sea','转出','线索','customer','',2,0,1,1556143065,0),
(312,309,'customer/clue/to_transfer','转移','线索','customer','',2,0,1,1556143065,0),
(313,309,'customer/clue/to_allot','分配','线索','customer','',2,0,1,1556143065,0),
(314,309,'customer/clue/to_customer','转为客户','线索','customer','',2,0,1,1556143065,0),
(315,6,'customer/follow/datalist','线索跟进','线索跟进','customer','',1,0,1,1656143065,0),
(316,315,'customer/follow/add','新建/编辑','线索跟进','customer','',2,0,1,1656143065,0),
(317,315,'customer/follow/view','查看','线索跟进','customer','',2,0,1,1656143065,0),
(318,315,'customer/follow/del','删除','线索跟进','customer','',2,0,1,1656143065,0),
(319,2,'','合同模块','合同模块','contract','',1,1,1,0,0),
(320,319,'contract/cate/datalist','合同分类','合同分类','contract','',1,1,1,1656143065,0),
(321,320,'contract/cate/add','新建/编辑','合同分类','contract','',2,1,1,0,1656143065),
(322,320,'contract/cate/set','设置','合同分类','contract','',2,1,1,1656143065,0),
(323,319,'contract/productcate/datalist','产品分类','产品分类','contract','',1,1,1,1656143065,0),
(324,323,'contract/productcate/add','新建/编辑','产品分类','contract','',2,1,1,1656143065,0),
(325,323,'contract/productcate/del','删除','产品分类','contract','',2,1,1,1656143065,0),
(326,319,'contract/product/datalist','产品列表','产品','contract','',1,1,1,1656143065,0),
(327,326,'contract/product/add','新建/编辑','产品','contract','',2,1,1,1656143065,0),
(328,326,'contract/product/view','查看','产品','contract','',2,1,1,1656143065,0),
(329,326,'contract/product/del','删除','产品','contract','',2,1,1,1656143065,0),
(330,326,'contract/product/set','设置','产品','contract','',2,1,1,1656143065,0),
(331,319,'contract/services/datalist','服务内容','服务内容','contract','',1,1,1,1656143065,0),
(332,331,'contract/services/add','新建/编辑','服务内容','contract','',2,1,1,1656143065,0),
(333,331,'contract/services/set','设置','服务内容','contract','',2,1,1,1656143065,0),
(334,319,'contract/supplier/datalist','供应商列表','供应商','contract','',1,1,1,1656143065,0),
(335,334,'contract/supplier/add','新建/编辑','供应商','contract','',2,1,1,1656143065,0),
(336,334,'contract/supplier/set','设置','供应商','contract','',2,1,1,1656143065,0),
(337,334,'contract/supplier/view','查看','供应商','contract','',2,1,1,1656143065,0),
(338,334,'contract/supplier/del','删除','供应商','contract','',2,1,1,1656143065,0),
(339,334,'contract/supplier/contact_add','新建/编辑','供应商联系人','contract','',2,1,1,1656143065,0),
(340,334,'contract/supplier/contact_del','删除供应商联系人','供应商联系人','contract','',2,1,1,1656143065,0),
(341,319,'contract/purchasedcate/datalist','采购品分类','采购品分类','contract','',1,1,1,1656143065,0),
(342,341,'contract/purchasedcate/add','新建/编辑','采购品分类','contract','',2,1,1,1656143065,0),
(343,341,'contract/purchasedcate/del','删除','采购品分类','contract','',2,1,1,1656143065,0),
(344,319,'contract/purchased/datalist','采购品列表','采购品','contract','',1,1,1,1656143065,0),
(345,344,'contract/purchased/add','新建/编辑','采购品','contract','',2,1,1,1656143065,0),
(346,344,'contract/purchased/view','查看','采购品','contract','',2,1,1,1656143065,0),
(347,344,'contract/purchased/del','删除','采购品','contract','',2,1,1,1656143065,0),
(348,344,'contract/purchased/set','设置','采购品','contract','',2,1,1,1656143065,0),
(349,7,'contract/contract/datalist','销售合同','销售合同','contract','',1,0,1,1656143065,0),
(350,349,'contract/contract/add','新建/编辑','合同','contract','',2,0,1,1656143065,0),
(351,349,'contract/contract/view','查看','合同','contract','',2,0,1,1656143065,0),
(352,349,'contract/contract/del','删除','合同','contract','',2,0,1,1656143065,0),
(353,7,'contract/purchase/datalist','采购合同','采购合同','contract','',1,0,1,1656143065,0),
(354,353,'contract/purchase/add','新建/编辑','合同','contract','',2,0,1,1656143065,0),
(355,353,'contract/purchase/view','查看','合同','contract','',2,0,1,1656143065,0),
(356,353,'contract/purchase/del','删除','合同','contract','',2,0,1,1656143065,0),
(357,7,'contract/contract/archivelist','合同归档','合同归档','contract','',1,0,1,1656143065,0),
(358,357,'contract/purchase/archivelist','采购合同归档','采购合同归档','contract','',2,0,1,1656143065,0),
(359,7,'contract/contract/stoplist','中止合同','中止合同','contract','',1,0,1,1656143065,0),
(360,359,'contract/purchase/stoplist','中止采购合同','中止采购合同','contract','',2,0,1,1656143065,0),
(361,7,'contract/contract/voidlist','作废合同','作废合同','contract','',1,0,1,1656143065,0),
(362,361,'contract/purchase/voidlist','作废合同归档','作废采购合同','contract','',2,0,1,1656143065,0),
(363,2,'','项目模块','项目模块','project','',1,1,1,0,0),
(364,363,'project/step/datalist','项目阶段','项目阶段','project','',1,1,1,1656143065,0),
(365,364,'project/step/add','新建/编辑','项目阶段','project','',2,1,1,1656143065,0),
(366,364,'project/step/set','设置','项目阶段','project','',2,1,1,1656143065,0),
(367,363,'project/cate/datalist','项目分类','项目分类','project','',1,1,1,1656143065,0),
(368,367,'project/cate/add','新建/编辑','项目分类','project','',2,1,1,0,1656143065),
(369,367,'project/cate/set','设置','项目分类','project','',2,1,1,1656143065,0),
(370,363,'project/work/datalist','工作类别','工作类别','project','',1,1,1,1656143065,0),
(371,370,'project/work/add','新建/编辑','工作类别','project','',2,1,1,1656143065,0),
(372,370,'project/work/set','设置','工作类别','project','',2,1,1,1656143065,0),
(373,8,'project/index/datalist','项目列表','项目','project','',1,0,1,1656142368,0),
(374,373,'project/index/add','新建','项目','project','',2,0,1,1656142368,0),
(375,373,'project/index/edit','编辑','项目','project','',2,0,1,1656142368,0),
(376,373,'project/index/view','查看','项目','project','',2,0,1,1656142368,0),
(377,373,'project/index/del','删除','项目','project','',2,0,1,1656142368,0),
(378,8,'project/task/datalist','任务列表','任务','project','',1,0,1,1656142368,0),
(379,378,'project/task/add','新建','任务','project','',2,0,1,1656142368,0),
(380,378,'project/task/edit','编辑','任务','project','',2,0,1,1656142368,0),
(381,378,'project/task/view','查看','任务','project','',2,0,1,1656142368,0),
(382,378,'project/task/del','删除','任务','project','',2,0,1,1656142368,0),
(383,8,'project/task/hour','任务工时','工时','project','',1,0,1,1656142368,0),
(384,8,'project/document/datalist','文档列表','文档','project','',1,0,1,1656142368,0),
(385,384,'project/document/add','新建/编辑','文档','project','',2,0,1,1656142368,0),
(386,384,'project/document/view','查看','文档','project','',2,0,1,1656142368,0),
(387,384,'project/document/delete','删除','文档','project','',2,0,1,1656142368,0),
(388,2,'','售后模块','售后模块','service','',1,1,1,0,0),
(389,388,'service/problemscate/datalist','问题类型','问题类型','service','',1,1,1,0,0),
(390,389,'service/problemscate/add','新建/编辑','问题类型','service','',2,1,1,0,0),
(391,389,'service/problemscate/set','设置','问题类型','service','',2,1,1,0,0),
(392,388,'service/solutionscate/datalist','方案类型','方案类型','service','',1,1,1,0,0),
(393,392,'service/solutionscate/add','新建/编辑','方案类型','service','',2,1,1,0,0),
(394,392,'service/solutionscate/set','设置','方案类型','service','',2,1,1,0,0),
(395,9,'service/problems/datalist','售后问题','售后问题','service','',1,0,1,1656143065,0),
(396,395,'service/problems/add','新建/编辑','售后问题','service','',2,0,1,1656143065,0),
(397,395,'service/problems/view','查看','售后问题','service','',2,0,1,1656143065,0),
(398,395,'service/problems/del','删除','售后问题','service','',2,0,1,1656143065,0),
(399,9,'service/solutions/datalist','解决方案','解决方案','service','',1,0,1,1656143065,0),
(400,399,'service/solutions/add','新建/编辑','解决方案','service','',2,0,1,1656143065,0),
(401,399,'service/solutions/view','查看','解决方案','service','',2,0,1,1656143065,0),
(402,399,'service/solutions/del','删除','解决方案','service','',2,0,1,1656143065,0),
(403,9,'service/problemswork/datalist','服务记录','服务记录','service','',1,0,1,1656143065,0),
(404,403,'service/problemswork/add','新建/编辑','服务记录','service','',2,0,1,1656143065,0),
(405,403,'service/problemswork/view','查看','服务记录','service','',2,0,1,1656143065,0),
(406,403,'service/problemswork/del','删除','服务记录','service','',2,0,1,1656143065,0),
(407,2,'','财务模块','财务模块','finance','',1,1,1,0,0),
(408,407,'finance/expensecate/datalist','报销类型','报销类型','finance','',1,1,1,0,0),
(409,408,'finance/expensecate/add','新建/编辑','报销类型','finance','',2,1,1,0,0),
(410,408,'finance/expensecate/set','设置','报销类型','finance','',2,1,1,0,0),
(411,407,'finance/costcate/datalist','费用类型','费用类型','finance','',1,1,1,0,0),
(412,411,'finance/costcate/add','新建/编辑','费用类型','finance','',2,1,1,0,0),
(413,411,'finance/costcate/set','设置','费用类型','finance','',2,1,1,0,0),
(414,407,'finance/account/datalist','资金账户','资金账户','finance','',1,1,1,0,0),
(415,414,'finance/account/add','新建/编辑','资金账户','finance','',2,1,1,0,0),
(416,414,'finance/account/set','设置','资金账户','finance','',2,1,1,0,0),
(417,414,'finance/account/income','收入','账户收入','finance','',2,1,1,0,0),
(418,414,'finance/account/payout','支出','账户支出','finance','',2,1,1,0,0),
(419,414,'finance/account/injection','注资','账户注资','finance','',2,1,1,0,0),
(420,419,'finance/account/injection_add','新建/编辑','账户注资','finance','',2,1,1,0,0),
(421,419,'finance/account/injection_del','删除','账户注资','finance','',2,1,1,0,0),
(422,407,'finance/fundscate/datalist','资金类型','资金类型','finance','',1,1,1,0,0),
(423,422,'finance/fundscate/add','新建/编辑','资金类型','finance','',2,1,1,0,0),
(424,422,'finance/fundscate/set','设置','资金类型','finance','',2,1,1,0,0),
(425,407,'finance/paytype/datalist','付款方式','付款方式','finance','',1,1,1,0,0),
(426,425,'finance/paytype/add','新建/编辑','付款方式','finance','',2,1,1,0,0),
(427,425,'finance/paytype/set','设置','付款方式','finance','',2,1,1,0,0),
(428,10,'finance/loan/datalist','借支管理','借支','finance','',1,1,1,0,0),
(429,428,'finance/loan/add','新建/编辑','借支','finance','',2,1,1,0,0),
(430,428,'finance/loan/del','删除','借支','finance','',2,1,1,0,0),
(431,428,'finance/loan/view','查看','借支','finance','',2,1,1,0,0),
(432,10,'finance/expense/datalist','报销管理','报销','finance','',1,1,1,0,0),
(433,432,'finance/expense/add','新建/编辑','报销','finance','',2,1,1,0,0),
(434,432,'finance/expense/del','删除','报销','finance','',2,1,1,0,0),
(435,432,'finance/expense/view','查看','报销','finance','',2,1,1,0,0),
(436,10,'finance/invoice/datalist','销项发票','发票','finance','',1,1,1,0,0),
(437,436,'finance/invoice/add','新建/编辑','发票','finance','',2,1,1,0,0),
(438,436,'finance/invoice/del','删除','发票','finance','',2,1,1,0,0),
(439,436,'finance/invoice/view','查看','发票','finance','',2,1,1,0,0),
(440,10,'finance/ticket/datalist','进项发票','发票','finance','',1,1,1,0,0),
(441,440,'finance/ticket/add','新建/编辑','发票','finance','',2,1,1,0,0),
(442,440,'finance/ticket/del','删除','发票','finance','',2,1,1,0,0),
(443,440,'finance/ticket/view','查看','发票','finance','',2,1,1,0,0),
(444,10,'finance/income/datalist','收款管理','收款记录','finance','',1,1,1,0,0),
(445,444,'finance/income/add','新建/编辑','收款记录','finance','',2,1,1,0,0),
(446,444,'finance/income/view','查看','收款记录','finance','',2,1,1,0,0),
(447,444,'finance/income/del','删除','收款记录','finance','',2,1,1,0,0),
(448,10,'finance/payment/datalist','付款管理','付款记录','finance','',1,1,1,0,0),
(449,448,'finance/payment/add','新建/编辑','付款记录','finance','',2,1,1,0,0),
(450,448,'finance/payment/view','查看','付款记录','finance','',2,1,1,0,0),
(451,448,'finance/payment/del','删除','付款记录','finance','',2,1,1,0,0),
(452,10,'finance/refund/datalist','退款管理','退款','finance','',1,1,1,0,0),
(453,452,'finance/refund/add','新建/编辑','退款','finance','',2,1,1,0,0),
(454,452,'finance/refund/view','查看','退款','finance','',2,1,1,0,0),
(455,452,'finance/refund/del','删除','退款','finance','',2,1,1,0,0),
(456,10,'','财务统计','财务统计','finance','',1,1,1,0,0),
(457,456,'finance/expense/record','报销记录','报销记录','finance','',1,1,1,0,0),
(458,456,'finance/loan/record','借支记录','借支记录','finance','',1,0,1,0,0),
(459,456,'finance/invoice/record','销项发票记录','开票记录','finance','',1,1,1,0,0),
(460,456,'finance/ticket/record','进项发票记录','收票记录','finance','',1,1,1,0,0),
(461,456,'finance/income/record','收款记录','收款记录','finance','',1,1,1,0,0),
(462,456,'finance/payment/record','付款记录','付款记录','finance','',1,1,1,0,0),
(463,456,'finance/refund/record','退款记录','退款记录','finance','',1,1,1,0,0),
(464,11,'analysis/customer/datalist','客户属性分析','客户属性分析','analysis','',1,1,1,0,0),
(465,11,'analysis/customer/followlist','客户跟进分析','客户跟进分析','analysis','',1,1,1,0,0),
(466,11,'analysis/order/datalist','销售订单分析','销售订单分析','analysis','',1,1,1,0,0),
(467,11,'analysis/order/salelist','销售订单排行','销售订单排行','analysis','',1,1,1,0,0),
(468,11,'analysis/order/incomelist','销售收款排行','销售收款排行','analysis','',1,1,1,0,0),
(469,11,'analysis/finance/invoicelist','发票数据分析','发票数据分析','analysis','',1,1,1,0,0),
(470,11,'analysis/finance/paymentlist','收付款数据分析','收付款数据分析','analysis','',1,1,1,0,0),
(471,11,'analysis/finance/accountlist','财务台账分析','财务台账分析','analysis','',1,1,1,0,0),
(472,471,'analysis/finance/incomelist','财务收入流水','财务收入流水','analysis','',2,1,1,0,0),
(473,471,'analysis/finance/payoutlist','财务支出流水','财务支出流水','analysis','',2,1,1,0,0),
(474,12,'disk/index/datalist','个人空间','个人空间','disk','',1,0,1,1656143065,0),
(475,474,'disk/index/add_upload','新增','文件','disk','',2,0,1,1656143065,0),
(476,474,'disk/index/add_folder','新增','文件夹','disk','',2,0,1,1656143065,0),
(477,474,'disk/index/add_article','新增/编辑','在线文档','disk','',2,0,1,1656143065,0),
(478,474,'disk/index/view_article','查看','在线文档','disk','',2,0,1,1656143065,0),
(479,474,'disk/index/del','删除','文件/文件夹/在线文档','disk','',2,0,1,1656143065,0),
(480,474,'disk/index/rename','重命名','文件','disk','',2,0,1,1656143065,0),
(481,474,'disk/index/move','移动','文件','disk','',2,0,1,1656143065,0),
(482,474,'disk/index/star','标星','文件','disk','',2,0,1,1656143065,0),
(483,474,'disk/index/unstar','取消标星','文件','disk','',2,0,1,1656143065,0),
(484,474,'disk/index/back','还原','文件','disk','',2,0,1,1656143065,0),
(485,474,'disk/index/clear','清除','文件','disk','',2,0,1,1656143065,0),
(486,474,'disk/index/share','分享','文件','disk','',2,0,1,1656143065,0),
(487,474,'disk/index/unshare','取消分享','文件','disk','',2,0,1,1656143065,0),
(488,474,'disk/index/starlist','标星文件','文件','disk','',2,0,1,1656143065,0),
(489,474,'disk/index/mysharelist','我分享的文件','文件','disk','',2,0,1,1656143065,0),
(490,474,'disk/index/tosharelist','别人分享的文件','文件','disk','',2,0,1,1656143065,0),
(491,12,'disk/index/sharelist','共享空间','共享空间','disk','',1,0,1,1656143065,0),
(492,491,'disk/index/add_group','新建/编辑','共享空间','disk','',2,1,1,0,0),
(493,491,'disk/index/del_group','删除','共享空间','disk','',2,1,1,0,0),
(494,12,'disk/index/clearlist','回 收 站','回收站文件','disk','',1,0,1,1656143065,0),
(495,4,'adm/attendance/datalist','假勤记录','假勤记录','adm','',1,1,1,0,0),
(496,5,'oa/attendance/datalist','我的假勤','我的假勤','oa','',1,1,1,0,0);
/*!40000 ALTER TABLE `oa_admin_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_approve`
--

DROP TABLE IF EXISTS `oa_approve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_approve` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '审批标识',
  `content` text NOT NULL COMMENT '内容/说明/理由',
  `types` varchar(255) NOT NULL DEFAULT '' COMMENT '审批类型',
  `str_1` varchar(255) NOT NULL DEFAULT '' COMMENT '字符串1',
  `str_2` varchar(255) NOT NULL DEFAULT '' COMMENT '字符串2',
  `str_3` varchar(255) NOT NULL DEFAULT '' COMMENT '字符串3',
  `str_4` varchar(255) NOT NULL DEFAULT '' COMMENT '字符串4',
  `str_5` varchar(255) NOT NULL DEFAULT '' COMMENT '字符串5',
  `str_6` varchar(255) NOT NULL DEFAULT '' COMMENT '字符串6',
  `str_7` varchar(255) NOT NULL DEFAULT '' COMMENT '字符串7',
  `str_8` varchar(255) NOT NULL DEFAULT '' COMMENT '字符串8',
  `str_9` varchar(255) NOT NULL DEFAULT '' COMMENT '字符串9',
  `str_10` varchar(255) NOT NULL DEFAULT '' COMMENT '字符串10',
  `str_11` varchar(255) NOT NULL DEFAULT '' COMMENT '字符串11',
  `str_12` varchar(255) NOT NULL DEFAULT '' COMMENT '字符串12',
  `str_13` varchar(255) NOT NULL DEFAULT '' COMMENT '字符串13',
  `str_14` varchar(255) NOT NULL DEFAULT '' COMMENT '字符串14',
  `str_15` varchar(255) NOT NULL DEFAULT '' COMMENT '字符串15',
  `str_16` varchar(255) NOT NULL DEFAULT '' COMMENT '字符串16',
  `int_1` int(11) NOT NULL DEFAULT 0 COMMENT '整数1',
  `int_2` int(11) NOT NULL DEFAULT 0 COMMENT '整数2',
  `int_3` int(11) NOT NULL DEFAULT 0 COMMENT '整数3',
  `int_4` int(11) NOT NULL DEFAULT 0 COMMENT '整数4',
  `int_5` int(11) NOT NULL DEFAULT 0 COMMENT '整数5',
  `int_6` int(11) NOT NULL DEFAULT 0 COMMENT '整数6',
  `int_7` int(11) NOT NULL DEFAULT 0 COMMENT '整数7',
  `int_8` int(11) NOT NULL DEFAULT 0 COMMENT '整数8',
  `int_9` int(11) NOT NULL DEFAULT 0 COMMENT '整数9',
  `int_10` int(11) NOT NULL DEFAULT 0 COMMENT '整数10',
  `float_1` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '浮点数1(2位小数)',
  `float_2` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '浮点数2(2位小数)',
  `float_3` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '浮点数3(2位小数)',
  `float_4` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '浮点数4(2位小数)',
  `float_5` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '浮点数5(2位小数)',
  `float_6` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '浮点数6(2位小数)',
  `float_7` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '浮点数7(2位小数)',
  `float_8` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '浮点数8(2位小数)',
  `float_9` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '浮点数9(2位小数)',
  `float_10` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '浮点数10(2位小数)',
  `time_1` bigint(11) NOT NULL DEFAULT 0 COMMENT '时间1',
  `time_2` bigint(11) NOT NULL DEFAULT 0 COMMENT '时间2',
  `time_3` bigint(11) NOT NULL DEFAULT 0 COMMENT '时间3',
  `time_4` bigint(11) NOT NULL DEFAULT 0 COMMENT '时间4',
  `time_5` bigint(11) NOT NULL DEFAULT 0 COMMENT '时间5',
  `time_6` bigint(11) NOT NULL DEFAULT 0 COMMENT '时间6',
  `time_7` bigint(11) NOT NULL DEFAULT 0 COMMENT '时间7',
  `time_8` bigint(11) NOT NULL DEFAULT 0 COMMENT '时间8',
  `time_9` bigint(11) NOT NULL DEFAULT 0 COMMENT '时间9',
  `time_10` bigint(11) NOT NULL DEFAULT 0 COMMENT '时间10',
  `file_1` varchar(500) NOT NULL DEFAULT '' COMMENT '附件1，如:1,2,3',
  `file_2` varchar(500) NOT NULL DEFAULT '' COMMENT '附件2，如:1,2,3',
  `file_3` varchar(500) NOT NULL DEFAULT '' COMMENT '附件3，如:1,2,3',
  `file_4` varchar(500) NOT NULL DEFAULT '' COMMENT '附件4，如:1,2,3',
  `file_5` varchar(500) NOT NULL DEFAULT '' COMMENT '附件5，如:1,2,3',
  `file_6` varchar(500) NOT NULL DEFAULT '' COMMENT '附件6，如:1,2,3',
  `text_1` text NOT NULL COMMENT '文本1',
  `text_2` text NOT NULL COMMENT '文本2',
  `text_3` text NOT NULL COMMENT '文本3',
  `text_4` text NOT NULL COMMENT '文本4',
  `text_5` text NOT NULL COMMENT '文本5',
  `text_6` text NOT NULL COMMENT '文本6',
  `check_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '审核状态:0待审核,1审核中,2审核通过,3审核不通过,4撤销审核',
  `check_flow_id` int(11) NOT NULL DEFAULT 0 COMMENT '审核流程id',
  `check_step_sort` int(11) NOT NULL DEFAULT 0 COMMENT '当前审批步骤',
  `check_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '当前审批人ID，如:1,2,3',
  `check_last_uid` varchar(500) NOT NULL DEFAULT '' COMMENT '上一审批人',
  `check_history_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '历史审批人ID，如:1,2,3',
  `check_copy_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '抄送人ID，如:1,2,3',
  `check_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '审核通过时间',
  `admin_id` int(11) NOT NULL DEFAULT 0 COMMENT '创建人ID',
  `did` int(11) NOT NULL DEFAULT 0 COMMENT '创建人部门ID',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='日常审批表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_approve`
--

LOCK TABLES `oa_approve` WRITE;
/*!40000 ALTER TABLE `oa_approve` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_approve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_article`
--

DROP TABLE IF EXISTS `oa_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '文档标题',
  `origin_url` varchar(255) NOT NULL DEFAULT '' COMMENT '来源地址',
  `file_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '相关附件',
  `content` text NOT NULL COMMENT '文章内容',
  `admin_id` int(11) NOT NULL DEFAULT 0 COMMENT '作者',
  `create_time` bigint(11) NOT NULL DEFAULT 0,
  `update_time` bigint(11) NOT NULL DEFAULT 0,
  `delete_time` bigint(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='文档表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_article`
--

LOCK TABLES `oa_article` WRITE;
/*!40000 ALTER TABLE `oa_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_attendance`
--

DROP TABLE IF EXISTS `oa_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL COMMENT '员工ID',
  `did` int(11) NOT NULL COMMENT '创建人部门ID',
  `day_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '考勤日期',
  `time_in_1` bigint(11) NOT NULL DEFAULT 0 COMMENT '第一次打卡上班时间',
  `time_in_2` bigint(11) NOT NULL DEFAULT 0 COMMENT '第二次打卡上班时间',
  `time_out_1` bigint(11) NOT NULL DEFAULT 0 COMMENT '第一次打卡下班时间',
  `time_out_2` bigint(11) NOT NULL DEFAULT 0 COMMENT '第二次打卡下班时间',
  `late_min` int(10) NOT NULL DEFAULT 0 COMMENT '迟到分钟数',
  `leave_min` int(10) NOT NULL DEFAULT 0 COMMENT '早退分钟数',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='日常考勤表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_attendance`
--

LOCK TABLES `oa_attendance` WRITE;
/*!40000 ALTER TABLE `oa_attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_basic_adm`
--

DROP TABLE IF EXISTS `oa_basic_adm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_basic_adm` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `types` varchar(100) NOT NULL DEFAULT '' COMMENT '数据类型:1车辆费用类型,2',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：-1删除 0禁用 1启用',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='行政模块常规数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_basic_adm`
--

LOCK TABLES `oa_basic_adm` WRITE;
/*!40000 ALTER TABLE `oa_basic_adm` DISABLE KEYS */;
INSERT INTO `oa_basic_adm` VALUES
(1,'1','燃油费',1,1706840194,0),
(2,'1','停车费',1,1706840194,0),
(3,'1','洗车费',1,1706840194,0),
(4,'1','保养费',1,1706840194,0),
(5,'1','维修费',1,1706840194,0),
(6,'1','过路费',1,1706840194,0),
(7,'1','过桥费',1,1706840194,0),
(8,'1','养路费',1,1706840194,0),
(9,'1','保险费',1,1706840194,0),
(10,'1','年检费',1,1706840194,0),
(11,'1','违章费',1,1706840194,0),
(12,'1','其他费',1,1706840194,0),
(13,'2','工作计划',1,1758584244,0),
(14,'2','项目计划',1,1758584244,0),
(15,'2','销售计划',1,1758584244,0),
(16,'2','采购计划',1,1758584244,0),
(17,'2','经营计划',1,1758584244,0),
(18,'2','生产计划',1,1758584244,0),
(19,'3','投影背景',1,1758584263,0),
(20,'3','电脑',1,1758584272,0),
(21,'3','视频',1,1758584287,1758584291),
(22,'3','购买水果',1,1758584305,0),
(23,'3','订餐',1,1758584312,0);
/*!40000 ALTER TABLE `oa_basic_adm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_basic_customer`
--

DROP TABLE IF EXISTS `oa_basic_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_basic_customer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `types` varchar(100) NOT NULL DEFAULT '' COMMENT '数据类型:1客户状态,2客户意向,3跟进方式,4销售阶段，5看后期增加',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：-1删除 0禁用 1启用',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='客户常规数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_basic_customer`
--

LOCK TABLES `oa_basic_customer` WRITE;
/*!40000 ALTER TABLE `oa_basic_customer` DISABLE KEYS */;
INSERT INTO `oa_basic_customer` VALUES
(1,'1','新进客户',1,1732606239,0),
(2,'1','跟进客户',1,1732606269,0),
(3,'1','正式客户',1,1732606279,0),
(4,'1','流失客户',1,1732606303,0),
(5,'1','成交客户',1,1732606311,0),
(6,'2','意向不明',1,1732606331,0),
(7,'2','意向一般',1,1732606346,0),
(8,'2','意向强烈',1,1732606354,0),
(9,'3','上门拜访',1,1732606405,0),
(10,'3','电话沟通',1,1732606409,0),
(11,'3','微信联系',1,1732606413,0),
(12,'3','发送邮件',1,1732606418,0),
(13,'3','其他',1,1732606418,0),
(14,'4','立项评估',1,1732606467,0),
(15,'4','初期沟通',1,1732606475,0),
(16,'4','需求分析',1,1732606483,0),
(17,'4','商务谈判',1,1732606490,0),
(18,'4','方案制定',1,1732606499,0),
(19,'4','合同签订',1,1732606506,0),
(20,'4','丢单失单',1,1732607018,0);
/*!40000 ALTER TABLE `oa_basic_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_basic_user`
--

DROP TABLE IF EXISTS `oa_basic_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_basic_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `types` varchar(100) NOT NULL DEFAULT '' COMMENT '数据类型:1职务,2职级,3看后期增加',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：-1删除 0禁用 1启用',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='人事模块常规数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_basic_user`
--

LOCK TABLES `oa_basic_user` WRITE;
/*!40000 ALTER TABLE `oa_basic_user` DISABLE KEYS */;
INSERT INTO `oa_basic_user` VALUES
(1,'2','初级',1,1733384661,0),
(2,'2','中级',1,1733384671,0),
(3,'2','高级',1,1733384675,0),
(4,'1','总经理',1,1733384651,0),
(5,'1','工程师',1,1733384651,0);
/*!40000 ALTER TABLE `oa_basic_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_blacklist`
--

DROP TABLE IF EXISTS `oa_blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_blacklist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '姓名',
  `mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '手机号码',
  `idcard` varchar(255) NOT NULL DEFAULT '' COMMENT '身份证',
  `remark` text DEFAULT NULL COMMENT '备注信息',
  `admin_id` int(11) NOT NULL DEFAULT 0 COMMENT '创建人',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '申请时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新信息时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='黑名单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_blacklist`
--

LOCK TABLES `oa_blacklist` WRITE;
/*!40000 ALTER TABLE `oa_blacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_blacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_car`
--

DROP TABLE IF EXISTS `oa_car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_car` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '车辆名称',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '车辆牌号',
  `oil` varchar(100) NOT NULL DEFAULT '' COMMENT '油耗',
  `mileage` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '开始里程数',
  `seats` int(11) NOT NULL DEFAULT 5 COMMENT '座位数',
  `color` varchar(100) NOT NULL DEFAULT '' COMMENT '车身颜色',
  `vin` varchar(100) NOT NULL DEFAULT '' COMMENT '车架号',
  `engine` varchar(100) NOT NULL DEFAULT '' COMMENT '发动机号',
  `buy_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '购买日期',
  `price` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '购买价格',
  `thumb` int(11) NOT NULL DEFAULT 0 COMMENT '车辆照片',
  `types` int(11) NOT NULL DEFAULT 0 COMMENT '车辆类型:0公车,1专车',
  `driver` int(11) NOT NULL DEFAULT 0 COMMENT '驾驶员',
  `insure_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '保险到期时间',
  `review_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '年审到期时间',
  `file_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '附件ID，如:1,2,3',
  `remark` varchar(1000) DEFAULT '' COMMENT '备注',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '当前状态:1可用,停用,维修,报废',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1008 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='车辆管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_car`
--

LOCK TABLES `oa_car` WRITE;
/*!40000 ALTER TABLE `oa_car` DISABLE KEYS */;
INSERT INTO `oa_car` VALUES
(1006,'冠林 1 号','别克 GL8','92# 汽油',42000.00,7,'黑色','','',1716134400,0.00,0,1,16,0,0,'','',1,1788836881,1788836881,0),
(1007,'冠林 2 号','大众帕萨特','92# 汽油',42000.00,5,'黑色','','',1716134400,0.00,0,1,16,0,0,'','',1,1788836881,1788836881,0);
/*!40000 ALTER TABLE `oa_car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_car_fee`
--

DROP TABLE IF EXISTS `oa_car_fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_car_fee` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '费用主题',
  `types` int(1) NOT NULL DEFAULT 1 COMMENT '费用类型id',
  `car_id` int(11) NOT NULL DEFAULT 0 COMMENT '车id',
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '金额',
  `fee_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '费用日期',
  `handled` int(11) NOT NULL DEFAULT 0 COMMENT '经手人',
  `file_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '附件ID，如:1,2,3',
  `content` varchar(1000) DEFAULT '' COMMENT '费用内容',
  `admin_id` int(11) NOT NULL DEFAULT 0 COMMENT '创建人',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='车辆费用明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_car_fee`
--

LOCK TABLES `oa_car_fee` WRITE;
/*!40000 ALTER TABLE `oa_car_fee` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_car_fee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_car_mileage`
--

DROP TABLE IF EXISTS `oa_car_mileage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_car_mileage` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `car_id` int(11) NOT NULL DEFAULT 0 COMMENT '车id',
  `mileage` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '里程数',
  `handled` int(11) NOT NULL DEFAULT 0 COMMENT '经手人',
  `mileage_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '里程月份',
  `remark` varchar(1000) DEFAULT '' COMMENT '备注信息',
  `admin_id` int(11) NOT NULL DEFAULT 0 COMMENT '创建人',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='车辆里程明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_car_mileage`
--

LOCK TABLES `oa_car_mileage` WRITE;
/*!40000 ALTER TABLE `oa_car_mileage` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_car_mileage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_car_repair`
--

DROP TABLE IF EXISTS `oa_car_repair`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_car_repair` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `types` int(1) NOT NULL DEFAULT 1 COMMENT '类型:1维修,2保养',
  `car_id` int(11) NOT NULL DEFAULT 0 COMMENT '车id',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '维修(保养)地点',
  `content` varchar(1000) DEFAULT '' COMMENT '维修(保养)原因&内容',
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '维修(保养)金额',
  `handled` int(11) NOT NULL DEFAULT 0 COMMENT '经手人',
  `repair_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '维修(保养)时间',
  `file_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '附件ID，如:1,2,3',
  `remark` varchar(1000) DEFAULT '' COMMENT '备注信息',
  `admin_id` int(11) NOT NULL DEFAULT 0 COMMENT '创建人',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='车辆维修(保养)记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_car_repair`
--

LOCK TABLES `oa_car_repair` WRITE;
/*!40000 ALTER TABLE `oa_car_repair` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_car_repair` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_car_use`
--

DROP TABLE IF EXISTS `oa_car_use`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_car_use` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '申请主题',
  `car_id` int(11) NOT NULL DEFAULT 0 COMMENT '车辆id',
  `content` mediumtext DEFAULT NULL COMMENT '内容',
  `file_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '附件ids,如:1,2,3',
  `use_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '预期用车日期',
  `out_admin` int(11) NOT NULL DEFAULT 0 COMMENT '交车经手人',
  `out_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '交车日期',
  `back_admin` int(11) NOT NULL DEFAULT 0 COMMENT '还车经手人',
  `back_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '还车日期',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态:0待使用,1已使用,2已归还',
  `admin_id` int(11) NOT NULL DEFAULT 0 COMMENT '创建人',
  `did` int(11) NOT NULL DEFAULT 0 COMMENT '用车部门',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  `check_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '审核状态:0待审核,1审核中,2审核通过,3审核不通过,4撤销审核',
  `check_flow_id` int(11) NOT NULL DEFAULT 0 COMMENT '审核流程id',
  `check_step_sort` int(11) NOT NULL DEFAULT 0 COMMENT '当前审批步骤',
  `check_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '当前审批人ID，如:1,2,3',
  `check_last_uid` varchar(500) NOT NULL DEFAULT '' COMMENT '上一审批人',
  `check_history_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '历史审批人ID，如:1,2,3',
  `check_copy_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '抄送人ID，如:1,2,3',
  `check_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '审核通过时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1009 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用车申请表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_car_use`
--

LOCK TABLES `oa_car_use` WRITE;
/*!40000 ALTER TABLE `oa_car_use` DISABLE KEYS */;
INSERT INTO `oa_car_use` VALUES
(1006,'接华信集团客户至公司会谈',1006,'','',1788913800,0,0,0,0,1,11,4,1788906600,1788906600,0,1,6,0,'8','','','',0),
(1007,'市场部物料运送至活动现场',1007,'','',1788757200,0,0,0,0,2,7,4,1788750000,1788750000,0,2,6,2,'','','8','',0),
(1008,'研发部服务器设备取送',1007,'','',1789002000,0,0,0,0,0,13,6,1788994800,1788994800,0,1,6,1,'8','','','',0);
/*!40000 ALTER TABLE `oa_car_use` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_care`
--

DROP TABLE IF EXISTS `oa_care`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_care` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '员工ID',
  `care_cate` int(11) NOT NULL DEFAULT 0 COMMENT '关怀项目',
  `care_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '关怀日期',
  `vacation` int(11) NOT NULL DEFAULT 0 COMMENT '休假天数',
  `cost` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '金额',
  `thing` varchar(255) NOT NULL DEFAULT '' COMMENT '物品',
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '状态:1未执行2已执行',
  `file_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '附件',
  `remark` mediumtext DEFAULT NULL COMMENT '备注说明',
  `admin_id` int(11) NOT NULL DEFAULT 0 COMMENT '创建人',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '修改时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='员工关怀表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_care`
--

LOCK TABLES `oa_care` WRITE;
/*!40000 ALTER TABLE `oa_care` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_care` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_care_cate`
--

DROP TABLE IF EXISTS `oa_care_cate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_care_cate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '关怀项目名称',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：-1删除 0禁用 1启用',
  `create_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='关怀项目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_care_cate`
--

LOCK TABLES `oa_care_cate` WRITE;
/*!40000 ALTER TABLE `oa_care_cate` DISABLE KEYS */;
INSERT INTO `oa_care_cate` VALUES
(1,'礼品',1,1637987189,0),
(2,'节日',1,1637987199,0),
(3,'生日',1,1638088518,0),
(4,'其他',1,1637987199,0);
/*!40000 ALTER TABLE `oa_care_cate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_comment`
--

DROP TABLE IF EXISTS `oa_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(100) NOT NULL DEFAULT '' COMMENT '模块',
  `topic_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '关联主题id',
  `pid` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '回复内容id',
  `admin_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '创建人',
  `to_uids` varchar(100) NOT NULL DEFAULT '' COMMENT '@用户id',
  `content` mediumtext DEFAULT NULL COMMENT '评论内容',
  `md_content` mediumtext DEFAULT NULL COMMENT 'markdown评论内容',
  `create_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '修改时间',
  `delete_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_comment`
--

LOCK TABLES `oa_comment` WRITE;
/*!40000 ALTER TABLE `oa_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_comment_read`
--

DROP TABLE IF EXISTS `oa_comment_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_comment_read` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '关联评论id',
  `admin_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '已读人',
  `create_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='评论已读回执表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_comment_read`
--

LOCK TABLES `oa_comment_read` WRITE;
/*!40000 ALTER TABLE `oa_comment_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_comment_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_config`
--

DROP TABLE IF EXISTS `oa_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '配置名称',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '配置标识',
  `content` mediumtext DEFAULT NULL COMMENT '配置内容',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：-1删除 0禁用 1启用',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='系统配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_config`
--

LOCK TABLES `oa_config` WRITE;
/*!40000 ALTER TABLE `oa_config` DISABLE KEYS */;
INSERT INTO `oa_config` VALUES
(1,'信息配置','web','a:10:{s:2:\"id\";s:1:\"1\";s:11:\"admin_title\";s:24:\"冠林集团办公平台\";s:6:\"domain\";s:21:\"http://127.0.0.1:8010\";s:3:\"icp\";s:0:\"\";s:4:\"logo\";s:31:\"/static/home/images/syslogo.png\";s:4:\"file\";s:1:\"0\";s:10:\"small_logo\";s:37:\"/static/home/images/syslogo_small.png\";s:5:\"beian\";s:0:\"\";s:8:\"keywords\";s:28:\"冠林集团,OA,办公平台\";s:4:\"desc\";s:132:\"冠林集团内部数字化办公平台，提供审批流转、公告通知、人事管理、日程协作等一站式办公服务。\";}',1,1612514630,1724823769),
(2,'系统配置','system','a:8:{s:9:\"menu_mode\";s:9:\"classical\";s:19:\"upload_max_filesize\";s:2:\"50\";s:9:\"msg_sound\";s:1:\"1\";s:9:\"watermark\";s:1:\"1\";s:6:\"qrcode\";s:1:\"2\";s:7:\"version\";s:5:\"6.0.1\";s:9:\"copyright\";s:24:\"© 2022-2026 gouguoa.com\";s:2:\"id\";s:1:\"2\";}',1,1612514630,1724824879),
(3,'邮箱配置','email','a:8:{s:2:\"id\";s:1:\"2\";s:4:\"smtp\";s:11:\"smtp.qq.com\";s:9:\"smtp_port\";s:3:\"465\";s:9:\"smtp_user\";s:15:\"gougucms@qq.com\";s:8:\"smtp_pwd\";s:6:\"123456\";s:4:\"from\";s:24:\"勾股CMS系统管理员\";s:5:\"email\";s:18:\"admin@gougucms.com\";s:8:\"template\";s:485:\"<p>勾股办公是一款基于ThinkPHP8 + Layui + MySql打造的，简单实用的开源免费的企业办公系统框架。系统集成了系统设置、人事管理模块、消息管理模块、日常办公、财务管理等基础模块。系统简约，易于功能扩展，方便二次开发，让开发者更专注于业务深度需求的开发，帮助开发者简单高效降低二次开发成本，通过二次开发之后可以用来做CRM，ERP，业务管理等系统。</p>\";}',1,1612521657,1637075205),
(4,'Api Token配置','token','a:5:{s:2:\"id\";s:1:\"3\";s:3:\"iss\";s:15:\"oa.gougucms.com\";s:3:\"aud\";s:7:\"gouguoa\";s:7:\"secrect\";s:35:\"gouguoa_local_debug_secret_2026_key\";s:7:\"exptime\";s:4:\"3600\";}',1,1627313142,1638010233),
(5,'其他配置','other','a:3:{s:2:\"id\";s:1:\"5\";s:6:\"author\";s:15:\"勾股工作室\";s:7:\"version\";s:13:\"v1.2025.06.06\";}',1,1613725791,1724824410);
/*!40000 ALTER TABLE `oa_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_contract`
--

DROP TABLE IF EXISTS `oa_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_contract` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '父协议id',
  `code` varchar(255) NOT NULL DEFAULT '' COMMENT '合同编号',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '合同名称',
  `cate_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '分类id',
  `types` tinyint(1) NOT NULL DEFAULT 1 COMMENT '合同性质:1普通合同2商品合同3服务合同',
  `subject_id` varchar(255) NOT NULL DEFAULT '' COMMENT '签约主体',
  `customer_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '关联客户ID,预设数据',
  `chance_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '销售机会id',
  `customer` varchar(255) NOT NULL DEFAULT '' COMMENT '客户名称',
  `contact_name` varchar(255) NOT NULL DEFAULT '' COMMENT '客户代表',
  `contact_mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '客户电话',
  `contact_address` varchar(255) NOT NULL DEFAULT '' COMMENT '客户地址',
  `start_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '合同开始时间',
  `end_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '合同结束时间',
  `admin_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '创建人',
  `prepared_uid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '合同制定人',
  `sign_uid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '合同签订人',
  `keeper_uid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '合同保管人',
  `share_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '共享人员，如:1,2,3',
  `file_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '相关附件，如:1,2,3',
  `seal_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '盖章合同附件，如:1,2,3',
  `sign_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '合同签订时间',
  `did` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '合同所属部门',
  `cost` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '合同金额',
  `content` mediumtext DEFAULT NULL COMMENT '合同内容',
  `is_tax` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否含税：0未含税,1含税',
  `tax` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '税点',
  `stop_uid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '中止人',
  `stop_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '中止时间',
  `stop_remark` mediumtext DEFAULT NULL COMMENT '中止备注信息',
  `void_uid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '作废人',
  `void_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '作废时间',
  `void_remark` mediumtext DEFAULT NULL COMMENT '作废备注信息',
  `archive_uid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '归档人',
  `archive_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '归档时间',
  `remark` mediumtext DEFAULT NULL COMMENT '备注信息',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '修改时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  `check_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '审核状态:0待审核,1审核中,2审核通过,3审核不通过,4撤销审核',
  `check_flow_id` int(11) NOT NULL DEFAULT 0 COMMENT '审核流程id',
  `check_step_sort` int(11) NOT NULL DEFAULT 0 COMMENT '当前审批步骤',
  `check_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '当前审批人ID，如:1,2,3',
  `check_last_uid` varchar(500) NOT NULL DEFAULT '' COMMENT '上一审批人',
  `check_history_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '历史审批人ID，如:1,2,3',
  `check_copy_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '抄送人ID，如:1,2,3',
  `check_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '审核通过时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1095 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='销售合同表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_contract`
--

LOCK TABLES `oa_contract` WRITE;
/*!40000 ALTER TABLE `oa_contract` DISABLE KEYS */;
INSERT INTO `oa_contract` VALUES
(1090,0,'HT2026-001','华信集团数字化服务年度框架合同',1,1,'0',1152,0,'','','','',1784080800,1790956800,15,0,0,0,'','','',1784080800,8,860000.00,'',1,6.00,0,0,NULL,0,0,NULL,0,0,'',1784073600,1784073600,0,2,11,0,'','','3,8','',0),
(1091,0,'HT2026-002','云帆网络冠林云 2.0 升级服务合同',1,1,'0',1156,0,'','','','',1787896800,1789833600,3,0,0,0,'','','',1787896800,8,128000.00,'',1,6.00,0,0,NULL,0,0,NULL,0,0,'',1787889600,1787889600,0,2,11,0,'','','3,8','',0),
(1092,0,'HT2026-003','恒昌智能制造生产模块采购合同',1,1,'0',1153,0,'','','','',1788577200,1817434800,15,0,0,0,'','','',1788577200,8,96000.00,'',1,6.00,0,0,NULL,0,0,NULL,0,0,'',1788570000,1788570000,0,1,11,1,'8','','3','',0),
(1093,0,'HT2026-004','蓝海教育智慧校园一期建设合同',1,1,'0',1154,0,'','','','',1788768000,1817625600,4,0,0,0,'','','',1788768000,8,356000.00,'',1,6.00,0,0,NULL,0,0,NULL,0,0,'',1788760800,1788760800,0,1,11,0,'3','','','',0),
(1094,0,'HT2026-005','中科慧眼办公自动化服务合同',1,1,'0',1155,0,'','','','',1788399000,1817256600,4,0,0,0,'','','',1788399000,8,58000.00,'',1,6.00,0,0,NULL,0,0,NULL,0,0,'',1788391800,1788391800,0,3,11,1,'','','3','',0);
/*!40000 ALTER TABLE `oa_contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_contract_cate`
--

DROP TABLE IF EXISTS `oa_contract_cate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_contract_cate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '合同类别名称',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：-1删除 0禁用 1启用',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='合同类别';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_contract_cate`
--

LOCK TABLES `oa_contract_cate` WRITE;
/*!40000 ALTER TABLE `oa_contract_cate` DISABLE KEYS */;
INSERT INTO `oa_contract_cate` VALUES
(1,'合同分类一',1,1637987189,0,0),
(2,'合同分类二',1,1637987199,0,0);
/*!40000 ALTER TABLE `oa_contract_cate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_contract_product`
--

DROP TABLE IF EXISTS `oa_contract_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_contract_product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `contract_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '合同id',
  `product_price_type` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '执行价格方式',
  `product_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '商品id',
  `product_price` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '商品单价',
  `product_num` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '商品数量',
  `product_total` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '商品小计',
  `product_remark` varchar(500) NOT NULL DEFAULT '' COMMENT '商品备注',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='销售合同产品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_contract_product`
--

LOCK TABLES `oa_contract_product` WRITE;
/*!40000 ALTER TABLE `oa_contract_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_contract_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_contract_service`
--

DROP TABLE IF EXISTS `oa_contract_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_contract_service` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `contract_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '合同id',
  `service_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '服务id',
  `service_price` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '服务单价',
  `service_num` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '服务次数',
  `service_total` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '服务小计',
  `service_remark` varchar(500) NOT NULL DEFAULT '' COMMENT '服务备注',
  `start_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '服务开始时间',
  `end_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '服务结束时间',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='销售合同服务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_contract_service`
--

LOCK TABLES `oa_contract_service` WRITE;
/*!40000 ALTER TABLE `oa_contract_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_contract_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_cost_cate`
--

DROP TABLE IF EXISTS `oa_cost_cate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_cost_cate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '费用类型名称',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：-1删除 0禁用 1启用',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='费用类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_cost_cate`
--

LOCK TABLES `oa_cost_cate` WRITE;
/*!40000 ALTER TABLE `oa_cost_cate` DISABLE KEYS */;
INSERT INTO `oa_cost_cate` VALUES
(1,'差旅费',1,1639898199,0,0),
(2,'办公费',1,1639898434,0,0),
(3,'招待费',1,1639898564,0,0),
(4,'交通费',1,1639898564,0,0),
(5,'通讯费',1,1639898564,0,0),
(6,'其他',1,1639898564,0,0);
/*!40000 ALTER TABLE `oa_cost_cate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_customer`
--

DROP TABLE IF EXISTS `oa_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_customer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '客户名称',
  `source_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '客户来源id',
  `grade_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '客户等级id',
  `industry_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '所属行业id',
  `services_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '客户意向id',
  `provinceid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '省份id',
  `cityid` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '城市id',
  `distid` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '区县id',
  `townid` bigint(20) NOT NULL DEFAULT 0 COMMENT '城镇id',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '客户联系地址',
  `customer_status` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '客户状态：0未设置',
  `intent_status` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '意向状态：0未设置',
  `admin_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '录入人',
  `belong_uid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '所属人',
  `belong_did` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '所属部门',
  `belong_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '获取时间',
  `distribute_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '最新分配时间',
  `follow_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '最新跟进时间',
  `next_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '下次跟进时间',
  `discard_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '废弃时间',
  `share_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '共享人员，如:1,2,3',
  `content` mediumtext DEFAULT NULL COMMENT '客户描述',
  `market` mediumtext DEFAULT NULL COMMENT '主要经营业务',
  `remark` mediumtext DEFAULT NULL COMMENT '备注信息',
  `tax_bank` varchar(100) NOT NULL DEFAULT '' COMMENT '开户银行',
  `tax_banksn` varchar(100) NOT NULL DEFAULT '' COMMENT '银行帐号',
  `tax_num` varchar(100) NOT NULL DEFAULT '' COMMENT '纳税人识别号',
  `tax_mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '开票电话',
  `tax_address` varchar(200) NOT NULL DEFAULT '' COMMENT '开票地址',
  `is_lock` tinyint(1) NOT NULL DEFAULT 0 COMMENT '锁定状态：0未锁,1已锁',
  `is_clue` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否是线索：0否,1是',
  `clue_name` varchar(255) NOT NULL DEFAULT '' COMMENT '线索联系人',
  `clue_mobile` char(20) NOT NULL DEFAULT '' COMMENT '线索手机号码',
  `customer_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '转成时间',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '修改时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1160 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='客户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_customer`
--

LOCK TABLES `oa_customer` WRITE;
/*!40000 ALTER TABLE `oa_customer` DISABLE KEYS */;
INSERT INTO `oa_customer` VALUES
(1152,'华信集团',7,2,1,0,0,0,0,0,'',1,2,15,15,8,1788491281,0,1788491281,1789096081,0,'','战略大客户，区域数字化服务商合作，年框协议客户。',NULL,'','','','','','',0,0,'','',1788491281,1788491281,1788491281,0),
(1153,'恒昌智能制造',4,1,1,0,0,0,0,0,'',1,1,15,15,8,1788750481,0,1788750481,1789096081,0,'','制造业客户，采购冠林云生产模块。',NULL,'','','','','','',0,0,'','',1788750481,1788750481,1788750481,0),
(1154,'蓝海教育集团',5,2,1,0,0,0,0,0,'',1,2,4,4,8,1788664081,0,1788664081,1789096081,0,'','教育行业，智慧校园意向强烈，已进入商务谈判。',NULL,'','','','','','',0,0,'','',1788664081,1788664081,1788664081,0),
(1155,'中科慧眼科技',1,1,1,0,0,0,0,0,'',1,1,4,4,8,1788664081,0,1788664081,1789096081,0,'','AI 独角兽企业，办公自动化潜在客户。',NULL,'','','','','','',0,0,'','',1788664081,1788664081,1788664081,0),
(1156,'云帆网络',2,2,1,0,0,0,0,0,'',1,2,3,3,8,1788404881,0,1788404881,1789096081,0,'','互联网公司，已签约冠林云 2.0 升级。',NULL,'','','','','','',0,0,'','',1788404881,1788404881,1788404881,0),
(1157,'康宁医药',6,1,1,0,0,0,0,0,'',1,1,3,3,8,1788491281,0,1788491281,1789096081,0,'','医药流通企业，初次接触阶段。',NULL,'','','','','','',0,0,'','',1788491281,1788491281,1788491281,0),
(1158,'万象传媒',7,1,1,0,0,0,0,0,'',1,1,7,7,4,1788577681,0,1788577681,1789096081,0,'','广告传媒公司，市场部联合跟进。',NULL,'','','','','','',0,0,'','',1788577681,1788577681,1788577681,0),
(1159,'启航物流',4,1,1,0,0,0,0,0,'',1,1,18,18,11,1788491281,0,1788491281,1789096081,0,'','物流企业， TMS 对接需求调研中。',NULL,'','','','','','',0,0,'','',1788491281,1788491281,1788491281,0);
/*!40000 ALTER TABLE `oa_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_customer_chance`
--

DROP TABLE IF EXISTS `oa_customer_chance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_customer_chance` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '销售机会主题',
  `cid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '客户ID',
  `contact_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '联系人id',
  `services_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '需求服务id',
  `stage` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '当前阶段',
  `content` mediumtext DEFAULT NULL COMMENT '需求描述',
  `discovery_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '发现时间',
  `expected_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '预计签单时间',
  `expected_amount` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '预计签单金额',
  `admin_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '创建人',
  `belong_uid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '所属人',
  `belong_did` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '所属部门',
  `assist_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '协助人员，如:1,2,3',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='客户销售机会表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_customer_chance`
--

LOCK TABLES `oa_customer_chance` WRITE;
/*!40000 ALTER TABLE `oa_customer_chance` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_customer_chance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_customer_contact`
--

DROP TABLE IF EXISTS `oa_customer_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_customer_contact` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '客户ID',
  `is_default` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '是否是第一联系人',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '姓名',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '用户性别:0未知,1男,2女',
  `mobile` char(20) NOT NULL DEFAULT '' COMMENT '手机号码',
  `qq` char(20) NOT NULL DEFAULT '' COMMENT 'QQ号',
  `wechat` char(20) NOT NULL DEFAULT '' COMMENT '微信号',
  `email` char(100) NOT NULL DEFAULT '' COMMENT '邮件地址',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '称谓',
  `department` varchar(50) NOT NULL DEFAULT '' COMMENT '部门',
  `position` varchar(50) NOT NULL DEFAULT '' COMMENT '职位',
  `birthday` varchar(50) NOT NULL DEFAULT '' COMMENT '生日',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '家庭住址',
  `admin_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '创建人',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='客户联系人表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_customer_contact`
--

LOCK TABLES `oa_customer_contact` WRITE;
/*!40000 ALTER TABLE `oa_customer_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_customer_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_customer_file`
--

DROP TABLE IF EXISTS `oa_customer_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_customer_file` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) unsigned NOT NULL COMMENT '关联客户id',
  `file_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '相关联附件id',
  `admin_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '创建人',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '修改时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='客户附件关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_customer_file`
--

LOCK TABLES `oa_customer_file` WRITE;
/*!40000 ALTER TABLE `oa_customer_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_customer_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_customer_grade`
--

DROP TABLE IF EXISTS `oa_customer_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_customer_grade` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '客户等级名称',
  `sort` int(1) NOT NULL DEFAULT 0 COMMENT '排序，越大越靠前',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态: 0禁用 1启用',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='客户等级';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_customer_grade`
--

LOCK TABLES `oa_customer_grade` WRITE;
/*!40000 ALTER TABLE `oa_customer_grade` DISABLE KEYS */;
INSERT INTO `oa_customer_grade` VALUES
(1,'普通客户',0,1,1637987189,0,0),
(2,'VIP客户',0,1,1637987199,0,0);
/*!40000 ALTER TABLE `oa_customer_grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_customer_source`
--

DROP TABLE IF EXISTS `oa_customer_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_customer_source` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '客户渠道名称',
  `sort` int(1) NOT NULL DEFAULT 0 COMMENT '排序，越大越靠前',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：0禁用 1启用',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='客户来源';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_customer_source`
--

LOCK TABLES `oa_customer_source` WRITE;
/*!40000 ALTER TABLE `oa_customer_source` DISABLE KEYS */;
INSERT INTO `oa_customer_source` VALUES
(1,'独立开发',0,1,1637987189,0,0),
(2,'微信公众号',0,1,1637987199,0,0),
(3,'今日头条',0,1,1637987199,0,0),
(4,'百度搜索',0,1,1637987199,0,0),
(5,'销售活动',0,1,1637987199,0,0),
(6,'电话来访',0,1,1637987199,0,0),
(7,'客户介绍',0,1,1637987199,0,0),
(8,'其他来源',0,1,1637987199,0,0);
/*!40000 ALTER TABLE `oa_customer_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_customer_trace`
--

DROP TABLE IF EXISTS `oa_customer_trace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_customer_trace` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '客户ID',
  `is_clue` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否是线索：0否,1是',
  `contact_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '联系人id',
  `chance_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '销售机会id',
  `types` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '跟进方式',
  `stage` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '当前阶段',
  `content` mediumtext DEFAULT NULL COMMENT '跟进内容',
  `follow_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '跟进时间',
  `next_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '下次跟进时间',
  `file_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '共享人员，如:1,2,3',
  `admin_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '创建人',
  `did` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '创建部门',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='客户跟进记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_customer_trace`
--

LOCK TABLES `oa_customer_trace` WRITE;
/*!40000 ALTER TABLE `oa_customer_trace` DISABLE KEYS */;
INSERT INTO `oa_customer_trace` VALUES
(1095,1152,0,0,0,1,0,'与华信信息中心王总面谈，确认二期范围包含移动审批与数据看板，报价流程已启动。',1788750481,1789096081,'',15,0,1788750481,1788750481,0),
(1096,1153,0,0,0,1,0,'恒昌生产模块 POC 部署完成，客户测试反馈良好，等待采购流程。',1788491281,1789096081,'',15,0,1788491281,1788491281,0),
(1097,1154,0,0,0,1,0,'蓝海教育商务条款三轮谈判，分歧集中在付款节奏，约定下周高层会面。',1788577681,1789096081,'',4,0,1788577681,1788577681,0),
(1098,1156,0,0,0,1,0,'云帆网络 2.0 升级合同已签署回传，安排实施排期。',1788750481,1789096081,'',3,0,1788750481,1788750481,0),
(1099,1159,0,0,0,1,0,'启航物流 TMS 需求调研完成，输出解决方案初稿。',1788491281,1789096081,'',18,0,1788491281,1788491281,0);
/*!40000 ALTER TABLE `oa_customer_trace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_data_auth`
--

DROP TABLE IF EXISTS `oa_data_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_data_auth` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '权限名称',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '权限标识唯一，字母',
  `desc` mediumtext DEFAULT NULL COMMENT '备注描述',
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT '所属模块，唯一，字母',
  `uids` mediumtext DEFAULT NULL COMMENT '权限用户，1,2,3',
  `conf_1` mediumtext DEFAULT NULL COMMENT '配置字段1，可作为预配置内容',
  `conf_2` mediumtext DEFAULT NULL COMMENT '配置字段2，可作为预配置内容',
  `conf_3` mediumtext DEFAULT NULL COMMENT '配置字段3，可作为预配置内容',
  `conf_4` mediumtext DEFAULT NULL COMMENT '配置字段4，可作为预配置内容',
  `conf_5` mediumtext DEFAULT NULL COMMENT '配置字段5，可作为预配置内容',
  `conf_6` mediumtext DEFAULT NULL COMMENT '配置字段6，可作为预配置内容',
  `conf_7` mediumtext DEFAULT NULL COMMENT '配置字段7，可作为预配置内容',
  `conf_8` mediumtext DEFAULT NULL COMMENT '配置字段8，可作为预配置内容',
  `conf_9` mediumtext DEFAULT NULL COMMENT '配置字段9，可作为预配置内容',
  `conf_10` mediumtext DEFAULT NULL COMMENT '配置字段9，可作为预配置内容',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='数据权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_data_auth`
--

LOCK TABLES `oa_data_auth` WRITE;
/*!40000 ALTER TABLE `oa_data_auth` DISABLE KEYS */;
INSERT INTO `oa_data_auth` VALUES
(1,'办公模块','office_admin','办公模块相关数据权限配置。','office','','2,8','3','','','','','','','','',1656143065,1724830718),
(2,'人事模块','human_admin','人事模块相关数据权限配置。','human','','','','','','','','','','','',1656143065,1724830718),
(3,'客户模块','customer_admin','客户模块相关数据权限配置。','customer','','','10','1000','100','','','','','','',1656143065,1724830738),
(4,'合同模块','contract_admin','合同模块相关数据权限配置。','contract','','','1','1','1','1','1','1','','','30',1656143065,1724830772),
(5,'项目模块','project_admin','项目模块相关数据权限配置。','project','','','','','','','','','','','3',1656143065,0),
(6,'售后模块','service_admin','售后模块相关数据权限配置。','service','','','','','','','','','','','3',1656143065,0),
(7,'财务模块','finance_admin','财务到账相关数据权限配置。','finance','','','','','','','','','','','',1656143065,0),
(8,'网盘模块','disk_admin','网盘模块相关数据权限配置。','disk','','','','','','','','','','','',1656143065,0);
/*!40000 ALTER TABLE `oa_data_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_department`
--

DROP TABLE IF EXISTS `oa_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_department` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '部门名称',
  `pid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '上级部门id',
  `leader_ids` varchar(500) DEFAULT '' COMMENT '部门负责人ids',
  `phone` varchar(60) NOT NULL DEFAULT '' COMMENT '部门联系电话',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序：越大越靠前',
  `remark` varchar(1000) DEFAULT '' COMMENT '备注',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：-1删除 0禁用 1启用',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='部门组织';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_department`
--

LOCK TABLES `oa_department` WRITE;
/*!40000 ALTER TABLE `oa_department` DISABLE KEYS */;
INSERT INTO `oa_department` VALUES
(1,'董事会',0,'2','',0,'',1,0,0),
(2,'人事部',1,'5','',0,'',1,0,0),
(3,'财务部',1,'6','',0,'',1,0,0),
(4,'市场部',1,'7','',0,'',1,0,0),
(5,'销售部',1,'15','',0,'',1,0,0),
(6,'技术部',1,'9','',0,'',1,0,0),
(7,'客服部',1,'17','',0,'',1,0,0),
(8,'销售一部',5,'15','',0,'',1,0,0),
(9,'销售二部',5,'15','',0,'',1,0,0),
(10,'销售三部',5,'15','',0,'',1,0,0),
(11,'产品部',6,'14','',0,'',1,0,0),
(12,'设计部',6,'9','',0,'',1,0,0),
(13,'研发部',6,'9','',0,'',1,0,0),
(14,'客服一部',7,'17','',0,'',1,0,0),
(15,'客服二部',7,'17','',0,'',1,0,0);
/*!40000 ALTER TABLE `oa_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_department_admin`
--

DROP TABLE IF EXISTS `oa_department_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_department_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '员工ID',
  `department_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '部门ID',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='次要部门人员关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_department_admin`
--

LOCK TABLES `oa_department_admin` WRITE;
/*!40000 ALTER TABLE `oa_department_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_department_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_department_change`
--

DROP TABLE IF EXISTS `oa_department_change`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_department_change` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '员工ID',
  `from_did` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '原部门id',
  `to_did` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '调到部门id',
  `connect_id` int(11) NOT NULL DEFAULT 0 COMMENT '资料交接人',
  `connect_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '资料交接时间',
  `connect_uids` varchar(100) NOT NULL DEFAULT '' COMMENT '参与交接人,可多个',
  `file_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '档案附件',
  `move_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '调动时间',
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '状态:1未调动,2已交接调动',
  `remark` varchar(1000) DEFAULT '' COMMENT '备注信息',
  `admin_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '创建人',
  `did` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '创建人所在部门',
  `check_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '审核状态:0待审核,1审核中,2审核通过,3审核不通过,4撤销审核',
  `check_flow_id` int(11) NOT NULL DEFAULT 0 COMMENT '审核流程id',
  `check_step_sort` int(11) NOT NULL DEFAULT 0 COMMENT '当前审批步骤',
  `check_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '当前审批人ID，如:1,2,3',
  `check_last_uid` varchar(500) NOT NULL DEFAULT '' COMMENT '上一审批人',
  `check_history_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '历史审批人ID，如:1,2,3',
  `check_copy_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '抄送人ID，如:1,2,3',
  `check_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '审核通过时间',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='人事调动申请表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_department_change`
--

LOCK TABLES `oa_department_change` WRITE;
/*!40000 ALTER TABLE `oa_department_change` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_department_change` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_disk`
--

DROP TABLE IF EXISTS `oa_disk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_disk` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '所在文件夹目录ID',
  `did` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '所属部门',
  `types` tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '类型:0文件,1在线文档,2文件夹',
  `action_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '相关联id',
  `group_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '分享空间id',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT '文件名称',
  `file_ext` varchar(200) NOT NULL DEFAULT '' COMMENT '文件后缀名称',
  `file_size` bigint(11) NOT NULL DEFAULT 0 COMMENT '文件大小',
  `is_star` tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否标星',
  `share_types` tinyint(1) NOT NULL DEFAULT 0 COMMENT '分享对象：0不分享,1所有人,2部门,3岗位,4人员',
  `share_dids` varchar(255) NOT NULL DEFAULT '' COMMENT '分享部门',
  `share_pids` varchar(255) NOT NULL DEFAULT '' COMMENT '分享岗位',
  `share_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '分享学员',
  `share_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '分享截止时间',
  `admin_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '创建人',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '修改时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  `clear_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '清除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='网盘文件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_disk`
--

LOCK TABLES `oa_disk` WRITE;
/*!40000 ALTER TABLE `oa_disk` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_disk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_disk_group`
--

DROP TABLE IF EXISTS `oa_disk_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_disk_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '分享空间名称',
  `admin_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '创建人',
  `director_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '管理人员',
  `group_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '群组成员',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='网盘分享空间表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_disk_group`
--

LOCK TABLES `oa_disk_group` WRITE;
/*!40000 ALTER TABLE `oa_disk_group` DISABLE KEYS */;
INSERT INTO `oa_disk_group` VALUES
(1000,'入职培训',1,'','',1749030795,1749031338,0),
(1001,'项目文件',1,'','',1749030795,1749031338,0),
(1002,'常用软件',1,'','',1749030795,1749031338,0),
(1003,'团建照片',1,'','',1749030795,1749031338,0);
/*!40000 ALTER TABLE `oa_disk_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_doc_base`
--

DROP TABLE IF EXISTS `oa_doc_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_doc_base` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '类型名称',
  `code` varchar(255) NOT NULL DEFAULT '' COMMENT '类型编号',
  `prefix` varchar(255) NOT NULL DEFAULT '' COMMENT '文号规则前缀名称',
  `prefix_num` int(3) unsigned NOT NULL DEFAULT 0 COMMENT '文号规则前缀数字',
  `types` int(3) unsigned NOT NULL DEFAULT 0 COMMENT '类目类型',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：0禁用 1启用',
  `admin_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '创建人',
  `create_time` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '修改时间',
  `delete_time` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='文号基础表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_doc_base`
--

LOCK TABLES `oa_doc_base` WRITE;
/*!40000 ALTER TABLE `oa_doc_base` DISABLE KEYS */;
INSERT INTO `oa_doc_base` VALUES
(1000,'集团正式发文','PR','勾股发',1,1,1,0,1783758820,1783760121,0);
/*!40000 ALTER TABLE `oa_doc_base` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_doc_number`
--

DROP TABLE IF EXISTS `oa_doc_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_doc_number` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `base_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '关联基础id',
  `year` int(3) unsigned NOT NULL DEFAULT 0 COMMENT '年份',
  `num` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '字号索引',
  `num_str` varchar(255) NOT NULL DEFAULT '' COMMENT '字号补零',
  `code` varchar(255) NOT NULL DEFAULT '' COMMENT '文号',
  `official_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '收文id',
  `received_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '发文id',
  `admin_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '创建人',
  `create_time` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '修改时间',
  `delete_time` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='文号项目关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_doc_number`
--

LOCK TABLES `oa_doc_number` WRITE;
/*!40000 ALTER TABLE `oa_doc_number` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_doc_number` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_edit_log`
--

DROP TABLE IF EXISTS `oa_edit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_edit_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '标识',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段',
  `action_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '关联id',
  `second_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '第二关联id',
  `admin_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '操作人',
  `old_content` mediumtext DEFAULT NULL COMMENT '修改前的内容',
  `new_content` mediumtext DEFAULT NULL COMMENT '修改后的内容',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='修改记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_edit_log`
--

LOCK TABLES `oa_edit_log` WRITE;
/*!40000 ALTER TABLE `oa_edit_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_edit_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_enterprise`
--

DROP TABLE IF EXISTS `oa_enterprise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_enterprise` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '企业名称',
  `city` varchar(60) NOT NULL DEFAULT '' COMMENT '所在城市',
  `bank` varchar(60) NOT NULL DEFAULT '' COMMENT '开户银行',
  `bank_sn` varchar(60) NOT NULL DEFAULT '' COMMENT '银行帐号',
  `tax_num` varchar(100) NOT NULL DEFAULT '' COMMENT '纳税人识别号',
  `phone` varchar(20) NOT NULL DEFAULT '' COMMENT '开票电话',
  `address` varchar(200) NOT NULL DEFAULT '' COMMENT '开票地址',
  `remark` varchar(500) NOT NULL DEFAULT '' COMMENT '备注说明',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：-1删除 0禁用 1启用',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='企业主体';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_enterprise`
--

LOCK TABLES `oa_enterprise` WRITE;
/*!40000 ALTER TABLE `oa_enterprise` DISABLE KEYS */;
INSERT INTO `oa_enterprise` VALUES
(1,'勾股信息科技有限公司','广州','','','','','','',1,1638006751,0);
/*!40000 ALTER TABLE `oa_enterprise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_events`
--

DROP TABLE IF EXISTS `oa_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_events` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '事件标题',
  `content` mediumtext DEFAULT NULL COMMENT '事件描述',
  `event_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '事件日期',
  `importance` int(1) NOT NULL DEFAULT 0 COMMENT '重要程度',
  `admin_id` int(10) NOT NULL DEFAULT 0 COMMENT '创建人',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1024 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='企业大事件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_events`
--

LOCK TABLES `oa_events` WRITE;
/*!40000 ALTER TABLE `oa_events` DISABLE KEYS */;
INSERT INTO `oa_events` VALUES
(1012,'冠林集团正式成立','公司注册成立，聚焦企业数字化服务领域，创始团队 5 人开始创业征程。',1710723600,2,1,1710723600,1710723600,0),
(1013,'总部入驻高新区科技园','办公面积 800 平米，第一个正式办公点启用，研发、市场团队集中办公。',1717207200,1,1,1717207200,1717207200,0),
(1014,'「冠林云」项目立项','启动自研 SaaS 产品「冠林云」，定位中小企业一体化办公平台。',1725948000,2,1,1725948000,1725948000,0),
(1015,'年度供应商答谢会','与 30 余家供应商建立长期合作关系，供应链体系初步成型。',1734688800,0,1,1734688800,1734688800,0),
(1016,'冠林云 1.0 正式发布','首个商业化版本上线，签约首批 12 家客户，实现营收零的突破。',1743127200,2,1,1743127200,1743127200,0),
(1017,'与华信集团签署战略合作','成为华信集团区域数字化服务商，打开行业大客户市场。',1750230000,2,1,1750230000,1750230000,0),
(1018,'获评「高新技术企业」','通过国家高新技术企业认定，研发投入与专利成果获得官方认可。',1757041200,1,1,1757041200,1757041200,0),
(1019,'2025 年度总结表彰大会','全年营收同比增长 180%，评选年度优秀员工 6 名、优秀团队 2 支。',1768473000,1,1,1768473000,1768473000,0),
(1020,'冠林云 2.0 发布会','新增智能审批与数据看板模块，客户续约率达 92%。',1774144800,2,1,1774144800,1774144800,0),
(1021,'组织架构升级：六大中心成立','设立研发、产品、市场、销售、客服、职能六大中心，管理走向精细化。',1778376600,1,1,1778376600,1778376600,0),
(1022,'中标市智慧社区一期项目','合同金额 860 万元，公司首个千万级潜力的政企项目落地。',1783497600,2,1,1783497600,1783497600,0),
(1023,'新版数字化办公平台上线','全新 OA 办公平台投入使用，审批、日志、会议室管理全面线上化。',1788224400,1,1,1788224400,1788224400,0);
/*!40000 ALTER TABLE `oa_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_expense`
--

DROP TABLE IF EXISTS `oa_expense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_expense` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `enterprise_id` int(11) NOT NULL DEFAULT 0 COMMENT '报销企业主体',
  `account_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '资金账户ID',
  `paytype_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '支付方式',
  `code` varchar(100) NOT NULL DEFAULT '' COMMENT '报销编码',
  `cost` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '报销总金额',
  `income_month` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '入账月份',
  `expense_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '原始单据日期',
  `admin_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '报销人',
  `did` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '报销部门ID',
  `loan_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '关联借支ID',
  `balance_cost` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '冲账金额',
  `pay_amount` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '需打款金额',
  `project_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '关联项目ID',
  `contract_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '关联合同ID',
  `file_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '附件ID，如:1,2,3',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '打款状态 1待打款,2已打款',
  `confirm_uid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '打款人ID',
  `confirm_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '打款时间',
  `remark` varchar(1000) DEFAULT '' COMMENT '备注',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  `check_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '审核状态:0待审核,1审核中,2审核通过,3审核不通过,4撤销审核',
  `check_flow_id` int(11) NOT NULL DEFAULT 0 COMMENT '审核流程id',
  `check_step_sort` int(11) NOT NULL DEFAULT 0 COMMENT '当前审批步骤',
  `check_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '当前审批人ID，如:1,2,3',
  `check_last_uid` varchar(500) NOT NULL DEFAULT '' COMMENT '上一审批人',
  `check_history_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '历史审批人ID，如:1,2,3',
  `check_copy_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '抄送人ID，如:1,2,3',
  `check_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '审核通过时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1008 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='报销表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_expense`
--

LOCK TABLES `oa_expense` WRITE;
/*!40000 ALTER TABLE `oa_expense` DISABLE KEYS */;
INSERT INTO `oa_expense` VALUES
(1000,1,1,1,'BX20260907001',2380.00,1788192000,1788746400,9,6,0,0.00,0.00,0,0,'',0,0,0,'研发部新技术分享会场地及资料费',1788742800,1788742800,0,1,14,3,'','','','',0),
(1001,1,1,1,'BX20260906001',1860.00,1788192000,1788678000,15,8,0,0.00,0.00,0,0,'',1,0,0,'销售一部杭州客户出差差旅费',1788674400,1788674400,0,1,14,10,'3','','','',0),
(1002,1,1,1,'BX20260907001',2380.00,1788192000,1788746400,9,6,0,0.00,0.00,0,0,'',1,0,0,'研发部新技术分享会场地及资料费',1788742800,1788742800,0,1,14,0,'3','','','',0),
(1003,1,1,1,'BX20260906001',1860.00,1788192000,1788678000,15,8,0,0.00,0.00,0,0,'',1,0,0,'销售一部杭州客户出差差旅费',1788674400,1788674400,0,1,14,1,'10','','3','',0),
(1004,1,1,1,'BX20260905001',5680.00,1788192000,1788577200,11,4,0,0.00,0.00,0,0,'',2,0,0,'Q3 市场推广物料制作费',1788573600,1788573600,0,2,14,2,'','','3,10,8','',0),
(1005,1,1,1,'BX20260903001',1240.00,1788192000,1788422400,14,11,0,0.00,0.00,0,0,'',3,0,0,'重点客户方案沟通招待费',1788418800,1788418800,0,3,14,2,'','','3,10','',0),
(1006,1,1,1,'BX20260908001',456.00,1788192000,1788831000,7,4,0,0.00,0.00,0,0,'',1,0,0,'市场部办公用品采购',1788827400,1788827400,0,1,14,0,'3','','','',0),
(1007,1,1,1,'BX20260902001',3200.00,1788192000,1788328800,10,3,0,0.00,0.00,0,0,'',2,0,0,'财务系统年费续费',1788325200,1788325200,0,2,14,2,'','','3,10,8','',0);
/*!40000 ALTER TABLE `oa_expense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_expense_cate`
--

DROP TABLE IF EXISTS `oa_expense_cate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_expense_cate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '报销类型名称',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：-1删除 0禁用 1启用',
  `create_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='报销类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_expense_cate`
--

LOCK TABLES `oa_expense_cate` WRITE;
/*!40000 ALTER TABLE `oa_expense_cate` DISABLE KEYS */;
INSERT INTO `oa_expense_cate` VALUES
(1,'交通费',1,1637987189,0,0),
(2,'住宿费',1,1637987199,0,0),
(3,'餐补费',1,1638088518,0,0),
(4,'招待费',1,1637987199,0,0),
(5,'汽油费',1,1637987199,0,0),
(6,'其他费',1,1637987199,0,0);
/*!40000 ALTER TABLE `oa_expense_cate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_expense_interfix`
--

DROP TABLE IF EXISTS `oa_expense_interfix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_expense_interfix` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `exid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '报销ID',
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '金额',
  `cate_id` tinyint(1) unsigned DEFAULT 1 COMMENT '报销类型ID',
  `remarks` mediumtext DEFAULT NULL COMMENT '备注',
  `admin_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '登记人',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='报销关联数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_expense_interfix`
--

LOCK TABLES `oa_expense_interfix` WRITE;
/*!40000 ALTER TABLE `oa_expense_interfix` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_expense_interfix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_file`
--

DROP TABLE IF EXISTS `oa_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_file` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(20) NOT NULL DEFAULT '' COMMENT '所属模块',
  `sha1` varchar(60) NOT NULL COMMENT 'sha1',
  `md5` varchar(60) NOT NULL COMMENT 'md5',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名',
  `filepath` varchar(255) NOT NULL DEFAULT '' COMMENT '文件路径+文件名',
  `thumbpath` varchar(255) NOT NULL DEFAULT '' COMMENT '缩略图路径',
  `filesize` int(10) NOT NULL DEFAULT 0 COMMENT '文件大小',
  `fileext` varchar(10) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mimetype` varchar(100) NOT NULL DEFAULT '' COMMENT '文件类型',
  `group_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '文件分组ID',
  `user_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '上传会员ID',
  `uploadip` varchar(64) NOT NULL DEFAULT '' COMMENT '上传IP',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0未审核1已审核-1不通过',
  `create_time` bigint(11) NOT NULL DEFAULT 0,
  `admin_id` int(11) NOT NULL COMMENT '审核者id',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  `audit_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '审核时间',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '来源模块功能',
  `use` varchar(255) DEFAULT NULL COMMENT '用处',
  `download` int(11) NOT NULL DEFAULT 0 COMMENT '下载量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='文件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_file`
--

LOCK TABLES `oa_file` WRITE;
/*!40000 ALTER TABLE `oa_file` DISABLE KEYS */;
INSERT INTO `oa_file` VALUES
(1,'admin','5125347886f07f48f7003825660117039eb8784f','563e5e8f48e607ed54461796b0cb4844','f95982689eb222b84e999122a50b3780.jpg.jpg','f95982689eb222b84e999122a50b3780.jpg','https://blog.gougucms.com/storage/202202/f95982689eb222b84e999122a50b3780.jpg','',62609,'jpg','image/jpeg',0,1,'127.0.0.1',1,1645057433,1,0,1645057433,'upload','thumb',0),
(2,'admin','5125347886f07f48f7003825660117039eb8784f','563e5e8f48e607ed54461796b0cb4844','e729477de18e3be7e7eb4ec7fe2f821e.jpg','e729477de18e3be7e7eb4ec7fe2f821e.jpg','https://blog.gougucms.com/storage/202202/e729477de18e3be7e7eb4ec7fe2f821e.jpg','',62609,'jpg','image/jpeg',0,1,'127.0.0.1',1,1645057433,1,0,1645057433,'upload','thumb',0),
(3,'admin','5125347886f07f48f7003825660117039eb8784f','563e5e8f48e607ed54461796b0cb4844','1193f7a1585b9f6e8a97ae17718018b3.jpg','images/1193f7a1585b9f6e8a97ae17718018b3.jpg','https://blog.gougucms.com/storage/202204/1193f7a1585b9f6e8a97ae17718018b3.jpg','',62609,'jpg','image/jpeg',0,1,'127.0.0.1',1,1645057433,1,0,1645057433,'upload','thumb',0),
(4,'admin','5125347886f07f48f7003825660117039eb8784f','563e5e8f48e607ed54461796b0cb4844','0f22a5ba4797b2fa22049ea73e6f779c.jpg','images/0f22a5ba4797b2fa22049ea73e6f779c.jpg','https://blog.gougucms.com/storage/202202/0f22a5ba4797b2fa22049ea73e6f779c.jpg','',62609,'jpg','image/jpeg',0,1,'127.0.0.1',1,1645057433,1,0,1645057433,'upload','thumb',0),
(5,'admin','faac0a446ba8ffbc4c920265749d9b06abf896a8','76cdde4eeadb3e46282cdf540bce9c8f','27b0cc49e1069b6860c3e52394f73b4a.png','202609/4sajo_76cdde4eeadb3e46282cdf540bce9c8f.png','/storage/202609/4sajo_76cdde4eeadb3e46282cdf540bce9c8f.png','/storage/202609/thumb_4sajo_76cdde4eeadb3e46282cdf540bce9c8f.png',609472,'png','image/png',0,1,'127.0.0.1',1,1788778049,1,0,1788778049,'upload','thumb',0),
(42,'admin','3fd32052acccccaef5c576f2a43abb3c2e967528','d588ef47888c4525a9122f4d79bb45ee','头像_超级员工.png','avatar_7c99c_1.png','/storage/avatars/avatar_7c99c_1.png','/storage/avatars/avatar_7c99c_1.png',2649,'png','image/png',0,1,'127.0.0.1',1,1788780983,1,0,1788780983,'',NULL,0),
(43,'admin','3f49768962ac08be78695e5c658ca3429e225c6d','c0e5a411bcbbe7b34239069532e79fde','头像_孙八.png','avatar_b48f9_2.png','/storage/avatars/avatar_b48f9_2.png','/storage/avatars/avatar_b48f9_2.png',1967,'png','image/png',0,1,'127.0.0.1',1,1788780983,2,0,1788780983,'',NULL,0),
(44,'admin','957f33ff2d64e2bc3e116fd51ccec935b3330a01','f27a937287dd3d78af9589b0ab918b18','头像_李四.png','avatar_37d63_3.png','/storage/avatars/avatar_37d63_3.png','/storage/avatars/avatar_37d63_3.png',2129,'png','image/png',0,1,'127.0.0.1',1,1788780983,3,0,1788780983,'',NULL,0),
(45,'admin','0de721aa5a1d27793486350a9a7656692a6631ba','b77aa4fce1a314736902313205790dd5','头像_张三.png','avatar_215cf_4.png','/storage/avatars/avatar_215cf_4.png','/storage/avatars/avatar_215cf_4.png',2151,'png','image/png',0,1,'127.0.0.1',1,1788780983,4,0,1788780983,'',NULL,0),
(46,'admin','0b3531f56b0450e03ce645723dba7da93c86e9cd','5793edfefe4e2f3c4848befd07a9d2e1','头像_王五.png','avatar_5fc90_5.png','/storage/avatars/avatar_5fc90_5.png','/storage/avatars/avatar_5fc90_5.png',774,'png','image/png',0,1,'127.0.0.1',1,1788780983,5,0,1788780983,'',NULL,0),
(47,'admin','6d15714e32d668d9a79e9c844181e03d8dddf136','85dc0f1aeaa76f4e83ab811df814ce8d','头像_赵六.png','avatar_24980_6.png','/storage/avatars/avatar_24980_6.png','/storage/avatars/avatar_24980_6.png',2968,'png','image/png',0,1,'127.0.0.1',1,1788780983,6,0,1788780983,'',NULL,0),
(48,'admin','1fb9696c8e6701d7db662f24a6635bc2bf5932d1','1f3f3b7fbf7129146f250c33815fbc72','头像_钱七.png','avatar_e3d74_7.png','/storage/avatars/avatar_e3d74_7.png','/storage/avatars/avatar_e3d74_7.png',2784,'png','image/png',0,1,'127.0.0.1',1,1788780983,7,0,1788780983,'',NULL,0),
(49,'admin','78a959eb3490edb06d53477a24827de01446f0c1','697bea4eb701f1d723b22fa2dfd41e15','头像_饶旺.png','avatar_dbac1_8.png','/storage/avatars/avatar_dbac1_8.png','/storage/avatars/avatar_dbac1_8.png',3245,'png','image/png',0,1,'127.0.0.1',1,1788780983,8,0,1788780983,'',NULL,0),
(50,'admin','a5074625bce039bd25a4f3ef9e543da266f3743e','c7274a2c13b81963df8b495c092f01eb','头像_刘凌聪.png','avatar_5538b_9.png','/storage/avatars/avatar_5538b_9.png','/storage/avatars/avatar_5538b_9.png',2232,'png','image/png',0,1,'127.0.0.1',1,1788780983,9,0,1788780983,'',NULL,0),
(51,'admin','4c8e4ebe8be02011982842e171544840ed201981','eb59c0cad91e94041792ba9a19c3258c','头像_陈佳彤.png','avatar_faba6_10.png','/storage/avatars/avatar_faba6_10.png','/storage/avatars/avatar_faba6_10.png',2346,'png','image/png',0,1,'127.0.0.1',1,1788780983,10,0,1788780983,'',NULL,0),
(52,'admin','30725020f2d502072cdac3f36d7dbc5a24525fc7','54a2e3543c6ff284b9c7b93ee197b4f4','头像_王子怡.png','avatar_8c7fc_11.png','/storage/avatars/avatar_8c7fc_11.png','/storage/avatars/avatar_8c7fc_11.png',767,'png','image/png',0,1,'127.0.0.1',1,1788780983,11,0,1788780983,'',NULL,0),
(53,'admin','be81cded0c020449efd6212730d3a1021978b778','83fd55f4590bd9d6005f0779895b27bd','头像_周雨桐.png','avatar_df1a2_12.png','/storage/avatars/avatar_df1a2_12.png','/storage/avatars/avatar_df1a2_12.png',1560,'png','image/png',0,1,'127.0.0.1',1,1788780983,12,0,1788780983,'',NULL,0),
(54,'admin','f36f1c0e426e6cb8f822174bc58e2d60d63679ba','11255c54039d8ccfd83da21a96083ef9','头像_吴昊.png','avatar_24da7_13.png','/storage/avatars/avatar_24da7_13.png','/storage/avatars/avatar_24da7_13.png',1709,'png','image/png',0,1,'127.0.0.1',1,1788780983,13,0,1788780983,'',NULL,0),
(55,'admin','bf027f4288e21ea77d8a86d3ede94e5675e59ecd','6e66e8bacec5ed7a1d776218503cb255','头像_郑晓岚.png','avatar_e1335_14.png','/storage/avatars/avatar_e1335_14.png','/storage/avatars/avatar_e1335_14.png',2691,'png','image/png',0,1,'127.0.0.1',1,1788780983,14,0,1788780983,'',NULL,0),
(56,'admin','8114ea2a478d2e52ddb60024d66e363c5bc002ec','79dfed8b68756c8a7cd23070b4c68869','头像_冯乐.png','avatar_6261d_15.png','/storage/avatars/avatar_6261d_15.png','/storage/avatars/avatar_6261d_15.png',1775,'png','image/png',0,1,'127.0.0.1',1,1788780983,15,0,1788780983,'',NULL,0),
(57,'admin','b097630c31741beaa7e54e096223e3ed5340f887','916dc9ffe023514cce86207d13a76ad7','头像_许静.png','avatar_16323_16.png','/storage/avatars/avatar_16323_16.png','/storage/avatars/avatar_16323_16.png',1873,'png','image/png',0,1,'127.0.0.1',1,1788780983,16,0,1788780983,'',NULL,0),
(58,'admin','4cc0c7dc910ba930d1380115140c7b43d5e3c97f','da85d4654939d445a79bbf07f8a4df16','头像_何俊.png','avatar_eede9_17.png','/storage/avatars/avatar_eede9_17.png','/storage/avatars/avatar_eede9_17.png',1583,'png','image/png',0,1,'127.0.0.1',1,1788780983,17,0,1788780983,'',NULL,0),
(59,'admin','8f04a27ffa82f01ad09c3534ce29db1170d6f084','c432794f66740c01c891249205e4e5fa','头像_姚磊.png','avatar_20cc5_18.png','/storage/avatars/avatar_20cc5_18.png','/storage/avatars/avatar_20cc5_18.png',2893,'png','image/png',0,1,'127.0.0.1',1,1788780983,18,0,1788780983,'',NULL,0),
(60,'admin','dadd49e6580e36e112c5c3d64d0933b298e215f4','dea0351b29ffa2be40e4721ce23a67ec','56a492e63e042592bc01671eed37e113.png','202609/n0b72_dea0351b29ffa2be40e4721ce23a67ec.png','/storage/202609/n0b72_dea0351b29ffa2be40e4721ce23a67ec.png','/storage/202609/thumb_n0b72_dea0351b29ffa2be40e4721ce23a67ec.png',278646,'png','image/png',0,1,'127.0.0.1',1,1788832636,1,0,1788832636,'upload','thumb',0);
/*!40000 ALTER TABLE `oa_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_file_group`
--

DROP TABLE IF EXISTS `oa_file_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_file_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '分组名',
  `admin_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '创建人',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='文件分组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_file_group`
--

LOCK TABLES `oa_file_group` WRITE;
/*!40000 ALTER TABLE `oa_file_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_file_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_finance_injection`
--

DROP TABLE IF EXISTS `oa_finance_injection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_finance_injection` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '金额',
  `enterprise_id` int(11) NOT NULL DEFAULT 0 COMMENT '企业主体id',
  `account_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '资金账户ID',
  `content` mediumtext DEFAULT NULL COMMENT '注资说明',
  `handler_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '经手人ID，如:1,2,3',
  `income_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '到账日期',
  `admin_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '创建人',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='财务注资表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_finance_injection`
--

LOCK TABLES `oa_finance_injection` WRITE;
/*!40000 ALTER TABLE `oa_finance_injection` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_finance_injection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_finance_log`
--

DROP TABLE IF EXISTS `oa_finance_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_finance_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT '交易标识',
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '交易金额',
  `types` tinyint(4) NOT NULL DEFAULT 0 COMMENT '流水类型 1收入,2支出',
  `action_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '业务ID',
  `action_time` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '业务发生日期',
  `transaction_no` varchar(32) NOT NULL COMMENT '交易流水编号',
  `enterprise_id` int(11) NOT NULL DEFAULT 0 COMMENT '企业主体id',
  `account_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '资金账户ID',
  `fundscate_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '款项类型',
  `paytype_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '支付方式',
  `admin_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '创建人',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `transaction_no` (`transaction_no`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='财务流水表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_finance_log`
--

LOCK TABLES `oa_finance_log` WRITE;
/*!40000 ALTER TABLE `oa_finance_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_finance_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_flow`
--

DROP TABLE IF EXISTS `oa_flow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_flow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '审批流程名称',
  `cate_id` tinyint(11) NOT NULL DEFAULT 0 COMMENT '关联审批类型id',
  `check_type` tinyint(4) NOT NULL COMMENT '1自由审批流,2固定审批流,3固定可回退的审批流,4固定条件审批流',
  `department_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '应用部门ID（0为全部）1,2,3',
  `copy_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '抄送人ID',
  `flow_list` varchar(1000) DEFAULT '' COMMENT '流程数据序列化',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态 1启用，0禁用',
  `remark` varchar(500) NOT NULL DEFAULT '' COMMENT '流程说明',
  `admin_id` int(11) NOT NULL COMMENT '创建人ID',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='审批流程表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_flow`
--

LOCK TABLES `oa_flow` WRITE;
/*!40000 ALTER TABLE `oa_flow` DISABLE KEYS */;
INSERT INTO `oa_flow` VALUES
(1,'请假审批',1,1,'','','a:2:{i:0;a:5:{s:10:\"check_role\";i:4;s:17:\"check_position_id\";i:0;s:10:\"check_uids\";s:1:\"3\";s:11:\"check_types\";i:2;s:9:\"flow_name\";s:12:\"部门经理\";}i:1;a:5:{s:10:\"check_role\";i:4;s:17:\"check_position_id\";i:0;s:10:\"check_uids\";s:1:\"8\";s:11:\"check_types\";i:2;s:9:\"flow_name\";s:9:\"总经理\";}}',1,'',1,1723791655,1788773494,0),
(2,'出差审批',2,1,'','','',1,'',1,1723799665,0,0),
(3,'外出审批',3,1,'','','',1,'',1,1723800434,0,0),
(4,'加班审批',4,1,'','','',1,'',1,1723800446,0,0),
(5,'用章审批',5,1,'','','',1,'',1,1723470400,0,0),
(6,'用车审批',19,1,'','','',1,'',1,1723470419,1784819697,0),
(7,'会议室预定审批',18,1,'','','',1,'',1,1758550919,0,0),
(8,'入职审批',15,1,'','','',1,'',1,1723470501,0,0),
(9,'离职审批',16,1,'','','',1,'',1,1723470501,0,0),
(10,'人事调动审批',17,1,'','','',1,'',1,1723470501,1784819850,0),
(11,'销售合同审批',13,1,'','','',1,'',1,1723470490,1784819779,0),
(12,'采购合同审批',14,1,'','','',1,'',1,1723470501,1784819791,0),
(13,'借支审批',6,1,'','','',1,'',1,1723470501,1784819806,0),
(14,'报销审批',7,1,'','','a:3:{i:0;a:5:{s:10:\"check_role\";i:4;s:17:\"check_position_id\";i:0;s:10:\"check_uids\";s:1:\"3\";s:11:\"check_types\";i:2;s:9:\"flow_name\";s:12:\"部门经理\";}i:1;a:5:{s:10:\"check_role\";i:4;s:17:\"check_position_id\";i:0;s:10:\"check_uids\";s:2:\"10\";s:11:\"check_types\";i:2;s:9:\"flow_name\";s:3:\"CFO\";}i:2;a:5:{s:10:\"check_role\";i:4;s:17:\"check_position_id\";i:0;s:10:\"check_uids\";s:1:\"8\";s:11:\"check_types\";i:2;s:9:\"flow_name\";s:9:\"总经理\";}}',1,'',1,1723470468,1788773494,0),
(15,'销项发票审批',8,1,'','','',1,'',1,1723470482,1784819727,0),
(16,'进项发票审批',9,1,'','','',1,'',1,1723470482,1784819741,0),
(17,'收款审批',10,1,'','','',1,'',1,1725935073,0,0),
(18,'付款审批',11,1,'','','',1,'',1,1725935159,0,0),
(19,'退款审批',12,1,'','','',1,'',1,1723470482,1784819871,0);
/*!40000 ALTER TABLE `oa_flow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_flow_cate`
--

DROP TABLE IF EXISTS `oa_flow_cate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_flow_cate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '审批类型名称',
  `name` varchar(100) NOT NULL COMMENT '审批类型标识,唯一',
  `module_id` int(11) NOT NULL DEFAULT 0 COMMENT '关联审批模块id',
  `check_table` varchar(100) NOT NULL DEFAULT '' COMMENT '关联数据库表名',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT '图标',
  `department_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '应用部门ID（空为全部）1,2,3',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序：越大越靠前',
  `is_copy` int(11) NOT NULL DEFAULT 1 COMMENT '是否支持抄送人',
  `is_file` int(11) NOT NULL DEFAULT 0 COMMENT '审批过程是否支持上传附件',
  `is_export` int(11) NOT NULL DEFAULT 0 COMMENT '审批通过后是否支持导出PDF打印',
  `is_back` int(11) NOT NULL DEFAULT 1 COMMENT '是否支持撤回',
  `is_reversed` int(11) NOT NULL DEFAULT 0 COMMENT '是否支持反确认',
  `form` tinyint(1) NOT NULL DEFAULT 1 COMMENT '预设字段，表单模式：1固定表单,2自定义表单',
  `add_url` varchar(255) NOT NULL DEFAULT '' COMMENT '新建链接：固定表单模式必填',
  `view_url` varchar(255) NOT NULL DEFAULT '' COMMENT '查看链接：固定表单模式必填',
  `form_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '表单id：自定义表单模式必填',
  `is_list` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否列表页显示：0不显示 1显示',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：-1删除 0禁用 1启用',
  `template_id` int(11) NOT NULL DEFAULT 0 COMMENT '审批消息模板id',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='审批类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_flow_cate`
--

LOCK TABLES `oa_flow_cate` WRITE;
/*!40000 ALTER TABLE `oa_flow_cate` DISABLE KEYS */;
INSERT INTO `oa_flow_cate` VALUES
(1,'请假','leaves',1,'leaves','icon-kechengziyuanguanli','',0,1,0,0,1,0,1,'/home/leaves/add','/home/leaves/view',0,1,1,20,1723604674,1784818567),
(2,'出差','trips',1,'trips','icon-jiaoshiguanli','',0,1,0,0,1,0,1,'/home/trips/add','/home/trips/view',0,1,1,21,1723799422,1784818582),
(3,'外出','outs',1,'outs','icon-tuiguangguanli','',0,1,0,0,1,0,1,'/home/outs/add','/home/outs/view',0,1,1,22,1723800336,1784818609),
(4,'加班','overtimes',1,'overtimes','icon-xueshengchengji','',0,1,0,0,1,0,1,'/home/overtimes/add','/home/overtimes/view',0,1,1,23,1723800393,1784818694),
(5,'用章','seal',2,'seal','icon-shenpishezhi','',0,1,0,0,1,0,1,'/adm/seal/add','/adm/seal/view',0,1,1,18,1723469451,1784818908),
(6,'借支','loan',4,'loan','icon-zhangbuguanli','',0,1,0,1,1,0,1,'/finance/loan/add','/finance/loan/view',0,1,1,26,1723470017,1784818933),
(7,'报销','expense',4,'expense','icon-jizhang','',0,1,0,0,1,0,1,'/finance/expense/add','/finance/expense/view',0,1,1,27,1723469732,1784819066),
(8,'销项发票','invoice',4,'invoice','icon-duizhangdan','',0,1,0,0,1,0,1,'/finance/invoice/add','/finance/invoice/view',0,1,1,28,1723469814,1784819054),
(9,'进项发票','ticket',4,'ticket','icon-yingjiaoqingdan','',0,1,0,0,1,0,1,'/finance/ticket/add','/finance/ticket/view',0,1,1,29,1724749856,1784819042),
(10,'收款','income',4,'invoice_income','icon-shoufeipeizhi','',0,1,0,0,1,0,1,'/finance/income/add','/finance/income/view',0,1,1,30,1725856435,1784819032),
(11,'付款','payment',4,'ticket_payment','icon-bulujiesuan','',0,1,0,0,1,0,1,'/finance/payment/add','/finance/payment/view',0,1,1,31,1725856613,1784819020),
(12,'退款','income_refund',4,'income_refund','icon-shoufeipeizhi','',0,1,0,0,1,0,1,'/finance/refund/add','/finance/refund/view',0,0,1,32,1725856435,1784819013),
(13,'销售合同','contract',3,'contract','icon-hetongguanli','',0,0,0,0,1,0,1,'/contract/contract/add','/contract/contract/view',0,1,1,24,1723469917,1784819003),
(14,'采购合同','purchase',3,'purchase','icon-dianshang','',0,0,0,0,1,0,1,'/contract/purchase/add','/contract/purchase/view',0,1,1,25,1723470017,1784818995),
(15,'入职','talent',5,'talent','icon-yuangongdaoru','',0,1,0,1,1,0,1,'/user/talent/add','/user/talent/view',0,1,1,14,1729490152,1784818979),
(16,'离职','personal_quit',5,'personal_quit','icon-yuangongtongji2','',0,1,0,1,1,0,1,'/user/personal/leave_add','/user/personal/leave_view',0,1,1,15,1729490152,1784818971),
(17,'人事调动','department_change',5,'department_change','icon-yuangongbiandong','',0,1,0,1,1,0,1,'/user/personal/change_add','/user/personal/change_view',0,1,1,16,1729490152,1784818963),
(18,'会议室预定','meeting_order',2,'meeting_order','icon-xuetangguanli','',0,1,0,1,1,0,1,'/adm/meeting/add','/adm/meeting/view',0,1,1,17,1758544152,1784818948),
(19,'用车审批','car_use',2,'car_use','icon-daqiajilu','',0,1,0,1,1,0,1,'/adm/car/apply_add','/adm/car/apply_view',0,1,1,19,1784819434,1784819560);
/*!40000 ALTER TABLE `oa_flow_cate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_flow_module`
--

DROP TABLE IF EXISTS `oa_flow_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_flow_module` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '审批模块名称',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT '预设字段，图标',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序：越大越靠前',
  `department_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '应用部门ID（空为全部）1,2,3',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：-1删除 0禁用 1启用',
  `create_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='审批模块';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_flow_module`
--

LOCK TABLES `oa_flow_module` WRITE;
/*!40000 ALTER TABLE `oa_flow_module` DISABLE KEYS */;
INSERT INTO `oa_flow_module` VALUES
(1,'假勤','',0,'',1,1723277295,0),
(2,'行政','',0,'',1,1723277311,0),
(3,'业务','',0,'',1,1723277351,0),
(4,'财务','',0,'',1,1723277356,0),
(5,'人事','',0,'',1,1723277368,0),
(6,'其他','',0,'',1,1723277374,0);
/*!40000 ALTER TABLE `oa_flow_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_flow_record`
--

DROP TABLE IF EXISTS `oa_flow_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_flow_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_id` int(11) NOT NULL DEFAULT 0 COMMENT '审批内容ID',
  `check_table` varchar(255) NOT NULL DEFAULT '审批数据表',
  `flow_id` int(11) NOT NULL COMMENT '审批模版流程id',
  `step_id` int(11) NOT NULL DEFAULT 0 COMMENT '审批步骤ID',
  `check_files` varchar(500) NOT NULL DEFAULT '' COMMENT '审批附件',
  `check_uid` int(11) NOT NULL DEFAULT 0 COMMENT '审批人ID',
  `check_time` bigint(11) NOT NULL COMMENT '审批时间',
  `check_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '审批状态:0发起,1通过,2拒绝,3撤销',
  `content` varchar(500) NOT NULL DEFAULT '' COMMENT '审批意见',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='审批记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_flow_record`
--

LOCK TABLES `oa_flow_record` WRITE;
/*!40000 ALTER TABLE `oa_flow_record` DISABLE KEYS */;
INSERT INTO `oa_flow_record` VALUES
(2,1004,'leaves',1,0,'',4,1786173441,0,'提交申请',0),
(3,1004,'leaves',1,9,'',3,1786191441,1,'同意，注意安排好工作交接。',0),
(4,1004,'leaves',1,10,'',2,1786205841,1,'同意。',0),
(5,1005,'leaves',1,0,'',4,1786346241,0,'提交申请',0),
(6,1005,'leaves',1,11,'',3,1786364241,1,'同意，注意安排好工作交接。',0),
(7,1005,'leaves',1,12,'',2,1786378641,1,'同意。',0),
(8,1006,'leaves',1,0,'',4,1786519041,0,'提交申请',0),
(9,1006,'leaves',1,13,'',3,1786537041,1,'同意，注意安排好工作交接。',0),
(10,1006,'leaves',1,14,'',2,1786551441,1,'同意。',0),
(11,1007,'leaves',1,0,'',3,1786691841,0,'提交申请',0),
(12,1007,'leaves',1,15,'',3,1786709841,1,'同意，注意安排好工作交接。',0),
(13,1007,'leaves',1,16,'',2,1786724241,1,'同意。',0),
(14,1008,'leaves',1,0,'',3,1786864641,0,'提交申请',0),
(15,1008,'leaves',1,17,'',3,1786882641,1,'同意，注意安排好工作交接。',0),
(16,1008,'leaves',1,18,'',2,1786897041,1,'同意。',0),
(17,1009,'leaves',1,0,'',7,1787037441,0,'提交申请',0),
(18,1009,'leaves',1,19,'',3,1787055441,1,'同意，注意安排好工作交接。',0),
(19,1009,'leaves',1,20,'',2,1787069841,1,'同意。',0),
(20,1010,'leaves',1,0,'',7,1787210241,0,'提交申请',0),
(21,1010,'leaves',1,21,'',3,1787228241,1,'同意，注意安排好工作交接。',0),
(22,1010,'leaves',1,22,'',2,1787242641,1,'同意。',0),
(23,1011,'leaves',1,0,'',5,1787383041,0,'提交申请',0),
(24,1011,'leaves',1,23,'',3,1787401041,1,'同意，注意安排好工作交接。',0),
(25,1011,'leaves',1,24,'',2,1787415441,1,'同意。',0),
(26,1012,'leaves',1,0,'',6,1787555841,0,'提交申请',0),
(27,1012,'leaves',1,25,'',3,1787573841,1,'同意，注意安排好工作交接。',0),
(28,1012,'leaves',1,26,'',2,1787588241,1,'同意。',0),
(29,1013,'leaves',1,0,'',4,1787728641,0,'提交申请',0),
(30,1013,'leaves',1,27,'',3,1787746641,1,'同意，注意安排好工作交接。',0),
(31,1013,'leaves',1,28,'',2,1787761041,1,'同意。',0),
(32,1014,'leaves',1,0,'',3,1787901441,0,'提交申请',0),
(33,1014,'leaves',1,29,'',3,1787919441,1,'同意，注意安排好工作交接。',0),
(34,1014,'leaves',1,30,'',2,1787933841,1,'同意。',0),
(35,1015,'leaves',1,0,'',7,1788074241,0,'提交申请',0),
(36,1015,'leaves',1,31,'',3,1788092241,1,'同意，注意安排好工作交接。',0),
(37,1015,'leaves',1,32,'',2,1788106641,1,'同意。',0),
(38,1016,'leaves',1,0,'',4,1788765441,0,'提交申请',0),
(39,1017,'leaves',1,0,'',7,1788765441,0,'提交申请',0),
(40,1018,'leaves',1,0,'',3,1788765441,0,'提交申请',0),
(41,1019,'leaves',1,0,'',8,1788775175,0,'提交申请',0),
(42,1,'talent',8,0,'',1,1788778068,0,'提交申请',0),
(43,1,'talent',8,40,'',8,1788778642,1,'',0);
/*!40000 ALTER TABLE `oa_flow_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_flow_step`
--

DROP TABLE IF EXISTS `oa_flow_step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_flow_step` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flow_name` varchar(255) NOT NULL DEFAULT '' COMMENT '流程步骤名称',
  `action_id` int(11) NOT NULL COMMENT '审批内容ID',
  `flow_id` int(11) NOT NULL COMMENT '审批流程id',
  `check_role` tinyint(4) NOT NULL DEFAULT 0 COMMENT '审批角色:0自由指定,1当前部门负责人,2上一级部门负责人,3指定职位,4指定用户,5可回退审批',
  `check_position_id` int(11) NOT NULL DEFAULT 0 COMMENT '审批角色id',
  `check_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '审批人ids(1,2,3)',
  `check_types` tinyint(4) NOT NULL DEFAULT 1 COMMENT '审批方式:1会签2或签',
  `sort` tinyint(4) NOT NULL DEFAULT 0 COMMENT '排序ID',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='审批步骤表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_flow_step`
--

LOCK TABLES `oa_flow_step` WRITE;
/*!40000 ALTER TABLE `oa_flow_step` DISABLE KEYS */;
INSERT INTO `oa_flow_step` VALUES
(9,'部门经理',1004,1,4,0,'3',2,0,1786173441,0),
(10,'总经理',1004,1,4,0,'2',2,1,1786173441,0),
(11,'部门经理',1005,1,4,0,'3',2,0,1786346241,0),
(12,'总经理',1005,1,4,0,'2',2,1,1786346241,0),
(13,'部门经理',1006,1,4,0,'3',2,0,1786519041,0),
(14,'总经理',1006,1,4,0,'2',2,1,1786519041,0),
(15,'部门经理',1007,1,4,0,'3',2,0,1786691841,0),
(16,'总经理',1007,1,4,0,'2',2,1,1786691841,0),
(17,'部门经理',1008,1,4,0,'3',2,0,1786864641,0),
(18,'总经理',1008,1,4,0,'2',2,1,1786864641,0),
(19,'部门经理',1009,1,4,0,'3',2,0,1787037441,0),
(20,'总经理',1009,1,4,0,'2',2,1,1787037441,0),
(21,'部门经理',1010,1,4,0,'3',2,0,1787210241,0),
(22,'总经理',1010,1,4,0,'2',2,1,1787210241,0),
(23,'部门经理',1011,1,4,0,'3',2,0,1787383041,0),
(24,'总经理',1011,1,4,0,'2',2,1,1787383041,0),
(25,'部门经理',1012,1,4,0,'3',2,0,1787555841,0),
(26,'总经理',1012,1,4,0,'2',2,1,1787555841,0),
(27,'部门经理',1013,1,4,0,'3',2,0,1787728641,0),
(28,'总经理',1013,1,4,0,'2',2,1,1787728641,0),
(29,'部门经理',1014,1,4,0,'3',2,0,1787901441,0),
(30,'总经理',1014,1,4,0,'2',2,1,1787901441,0),
(31,'部门经理',1015,1,4,0,'3',2,0,1788074241,0),
(32,'总经理',1015,1,4,0,'2',2,1,1788074241,0),
(33,'部门经理',1016,1,4,0,'3',2,0,1788765441,0),
(34,'总经理',1016,1,4,0,'8',2,1,1788765441,0),
(35,'部门经理',1017,1,4,0,'3',2,0,1788765441,0),
(36,'总经理',1017,1,4,0,'8',2,1,1788765441,0),
(37,'部门经理',1018,1,4,0,'3',2,0,1788765441,0),
(38,'总经理',1018,1,4,0,'8',2,1,1788765441,0),
(39,'自由审批',1019,1,0,0,'12',1,0,1788775175,0),
(40,'自由审批',1,8,0,0,'8',1,0,1788778068,0);
/*!40000 ALTER TABLE `oa_flow_step` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_funds_cate`
--

DROP TABLE IF EXISTS `oa_funds_cate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_funds_cate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '资金类型名称',
  `pid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '分类id',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序：越大越靠前',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：-1删除 0禁用 1启用',
  `admin_id` int(11) NOT NULL DEFAULT 0 COMMENT '创建人',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='资金类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_funds_cate`
--

LOCK TABLES `oa_funds_cate` WRITE;
/*!40000 ALTER TABLE `oa_funds_cate` DISABLE KEYS */;
INSERT INTO `oa_funds_cate` VALUES
(1,'意向金',0,0,1,0,1779630684,1779630778,0),
(2,'定金',0,0,1,0,1779630690,1779630782,0),
(3,'分期款',0,0,1,0,1779630823,0,0),
(4,'尾款',0,0,1,0,1779630699,1779630820,0),
(5,'全款',0,0,1,0,1779630823,0,0);
/*!40000 ALTER TABLE `oa_funds_cate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_income_refund`
--

DROP TABLE IF EXISTS `oa_income_refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_income_refund` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '金额',
  `income_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '收款ID',
  `customer_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '关联客户ID',
  `enterprise_id` int(11) NOT NULL DEFAULT 0 COMMENT '企业主体id',
  `account_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '资金账户ID',
  `fundscate_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '款项类型',
  `paytype_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '支付方式',
  `back_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '退还时间',
  `file_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '附件ID，如:1,2,3',
  `remarks` mediumtext DEFAULT NULL COMMENT '备注',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '退款打款状态 1待打款,2已打款',
  `confirm_uid` bigint(11) NOT NULL DEFAULT 0 COMMENT '打款确认人',
  `confirm_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '打款确认时间',
  `admin_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '退款登记人',
  `did` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '所属部门',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  `check_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '审核状态:0待审核,1审核中,2审核通过,3审核不通过,4撤销审核',
  `check_flow_id` int(11) NOT NULL DEFAULT 0 COMMENT '审核流程id',
  `check_step_sort` int(11) NOT NULL DEFAULT 0 COMMENT '当前审批步骤',
  `check_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '当前审批人ID，如:1,2,3',
  `check_last_uid` varchar(500) NOT NULL DEFAULT '' COMMENT '上一审批人',
  `check_history_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '历史审批人ID，如:1,2,3',
  `check_copy_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '抄送人ID，如:1,2,3',
  `check_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '审核通过时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='到账退还记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_income_refund`
--

LOCK TABLES `oa_income_refund` WRITE;
/*!40000 ALTER TABLE `oa_income_refund` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_income_refund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_industry`
--

DROP TABLE IF EXISTS `oa_industry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_industry` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '行业名称',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：-1删除 0禁用 1启用',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='行业';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_industry`
--

LOCK TABLES `oa_industry` WRITE;
/*!40000 ALTER TABLE `oa_industry` DISABLE KEYS */;
INSERT INTO `oa_industry` VALUES
(1,'工业品企业',1,1637987189,0),
(2,'互联网企业',1,1637987199,0),
(3,'服务行业',1,1637987199,0),
(4,'消费品企业',1,1637987199,0),
(5,'原材料企业',1,1637987199,0),
(6,'农业企业',1,1637987199,0),
(7,'科技企业',1,1637987199,0),
(8,'其他行业',1,1637987199,0);
/*!40000 ALTER TABLE `oa_industry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_invoice`
--

DROP TABLE IF EXISTS `oa_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_invoice` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(100) NOT NULL DEFAULT '' COMMENT '发票号码',
  `customer_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '关联客户ID',
  `contract_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '关联合同协议ID',
  `project_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '关联项目ID',
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '发票金额',
  `did` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '发票申请部门',
  `admin_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '发票申请人',
  `open_status` tinyint(1) unsigned DEFAULT 0 COMMENT '开票状态：0未开票 1已开票 2已作废',
  `open_admin_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '发票开具人',
  `open_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '发票开具时间',
  `delivery` varchar(100) NOT NULL DEFAULT '' COMMENT '快递单号',
  `types` tinyint(1) unsigned DEFAULT 0 COMMENT '抬头类型：1企业2个人',
  `invoice_type` tinyint(1) unsigned DEFAULT 0 COMMENT '发票类型：1增值税专用发票,2普通发票,3专用发票',
  `invoice_subject` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '关联发票主体ID',
  `invoice_title` varchar(100) NOT NULL DEFAULT '' COMMENT '开票抬头',
  `invoice_tax` varchar(100) NOT NULL DEFAULT '' COMMENT '纳税人识别号',
  `invoice_phone` varchar(100) NOT NULL DEFAULT '' COMMENT '电话号码',
  `invoice_address` varchar(100) NOT NULL DEFAULT '' COMMENT '地址',
  `invoice_bank` varchar(100) NOT NULL DEFAULT '' COMMENT '开户银行',
  `invoice_account` varchar(100) NOT NULL DEFAULT '' COMMENT '银行账号',
  `invoice_banking` varchar(100) NOT NULL DEFAULT '' COMMENT '银行营业网点',
  `file_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '附件ID，如:1,2,3',
  `other_file_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '其他附件ID，如:1,2,3',
  `remark` mediumtext DEFAULT NULL COMMENT '备注',
  `enter_amount` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '已到账金额',
  `enter_status` tinyint(1) unsigned DEFAULT 0 COMMENT '收款状态：0未收款 1部分收款 2全部收款',
  `enter_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '最新收款时间',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  `check_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '审核状态:0待审核,1审核中,2审核通过,3审核不通过,4撤销审核',
  `check_flow_id` int(11) NOT NULL DEFAULT 0 COMMENT '审核流程id',
  `check_step_sort` int(11) NOT NULL DEFAULT 0 COMMENT '当前审批步骤',
  `check_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '当前审批人ID，如:1,2,3',
  `check_last_uid` varchar(500) NOT NULL DEFAULT '' COMMENT '上一审批人',
  `check_history_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '历史审批人ID，如:1,2,3',
  `check_copy_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '抄送人ID，如:1,2,3',
  `check_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '审核通过时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1072 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='发票表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_invoice`
--

LOCK TABLES `oa_invoice` WRITE;
/*!40000 ALTER TABLE `oa_invoice` DISABLE KEYS */;
INSERT INTO `oa_invoice` VALUES
(1068,'INV2026-0091',1152,1090,0,172000.00,8,15,1,0,0,'0',1,8,1,'','','','','','','','','','',172000.00,0,0,1788055200,1788055200,0,2,15,0,'1','','','',0),
(1069,'INV2026-0092',1156,1091,0,64000.00,8,3,1,0,0,'0',1,8,1,'','','','','','','','','','',64000.00,0,0,1788242400,1788242400,0,2,15,0,'1','','3,8','',0),
(1070,'INV2026-0093',1153,1092,0,48000.00,8,15,1,0,0,'0',1,8,1,'','','','','','','','','','',48000.00,0,0,1788663600,1788663600,0,1,15,0,'3','','3','',0),
(1071,'INV2026-0094',1154,1093,0,178000.00,8,4,1,0,0,'0',1,8,1,'','','','','','','','','','',178000.00,0,0,1788831000,1788831000,0,1,15,0,'1','','8','',0);
/*!40000 ALTER TABLE `oa_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_invoice_income`
--

DROP TABLE IF EXISTS `oa_invoice_income`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_invoice_income` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '发票ID',
  `customer_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '关联客户ID',
  `contract_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '关联销售合同ID',
  `project_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '关联项目ID',
  `enterprise_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '收款主体ID',
  `account_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '收款账户ID',
  `fundscate_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '款项类型',
  `paytype_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '支付方式',
  `transaction_code` varchar(100) NOT NULL DEFAULT '' COMMENT '交易单号',
  `file_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '附件ID，如:1,2,3',
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '收款金额',
  `enter_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '收款时间',
  `confirm_uid` bigint(11) NOT NULL DEFAULT 0 COMMENT '到账确认人',
  `confirm_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '到账确认时间',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：0无效,1未确认,2已确认',
  `back_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '退款状态：0未退款,1部分退款,2已退款',
  `back_amount` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '退款金额',
  `remarks` mediumtext DEFAULT NULL COMMENT '备注',
  `admin_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '申请人',
  `did` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '申请部门',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  `check_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '审核状态:0待审核,1审核中,2审核通过,3审核不通过,4撤销审核',
  `check_flow_id` int(11) NOT NULL DEFAULT 0 COMMENT '审核流程id',
  `check_step_sort` int(11) NOT NULL DEFAULT 0 COMMENT '当前审批步骤',
  `check_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '当前审批人ID，如:1,2,3',
  `check_last_uid` varchar(500) NOT NULL DEFAULT '' COMMENT '上一审批人',
  `check_history_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '历史审批人ID，如:1,2,3',
  `check_copy_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '抄送人ID，如:1,2,3',
  `check_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '审核通过时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1050 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='收款记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_invoice_income`
--

LOCK TABLES `oa_invoice_income` WRITE;
/*!40000 ALTER TABLE `oa_invoice_income` DISABLE KEYS */;
INSERT INTO `oa_invoice_income` VALUES
(1047,1068,0,0,0,1,1,1,2,'','',86000.00,1788141600,0,0,2,0,0.00,'15',15,8,1788138000,1788138000,0,2,17,0,'','','3,6','',0),
(1048,1069,0,0,0,1,1,1,2,'','',32000.00,1788418800,0,0,2,0,0.00,'3',3,8,1788415200,1788415200,0,2,17,0,'','','3,6','',0),
(1049,1070,0,0,0,1,1,1,1,'','',24000.00,1788768000,0,0,1,0,0.00,'15',15,8,1788764400,1788764400,0,1,17,0,'6','','','',0);
/*!40000 ALTER TABLE `oa_invoice_income` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_labor_contract`
--

DROP TABLE IF EXISTS `oa_labor_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_labor_contract` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `renewal_pid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '续签母合同',
  `change_pid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '变更母合同',
  `uid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '员工ID',
  `cate` int(1) NOT NULL DEFAULT 1 COMMENT '合同类别:1劳动合同,2劳务合同,3保密协议',
  `types` int(1) NOT NULL DEFAULT 1 COMMENT '合同类型:1新签合同,2续签合同,2变更合同',
  `enterprise_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '关联企业主体ID',
  `properties` int(1) NOT NULL DEFAULT 1 COMMENT '合同属性:1初级职称,2中级职称,3高级职称',
  `code` varchar(255) NOT NULL DEFAULT '' COMMENT '合同编号',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '合同名称',
  `sign_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '签订时间',
  `start_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '生效时间',
  `end_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '失效时间',
  `secure_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '解除时间',
  `trial_months` int(5) NOT NULL DEFAULT 0 COMMENT '试用月数',
  `trial_end_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '试用结束时间',
  `trial_salary` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '试用工资',
  `worker_salary` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '转正工资',
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '合同状态:1正常,2已到期,3已解除',
  `file_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '附件',
  `remark` mediumtext DEFAULT NULL COMMENT '备注说明',
  `admin_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '创建人ID',
  `create_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '修改时间',
  `delete_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='员工合同表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_labor_contract`
--

LOCK TABLES `oa_labor_contract` WRITE;
/*!40000 ALTER TABLE `oa_labor_contract` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_labor_contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_leaves`
--

DROP TABLE IF EXISTS `oa_leaves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_leaves` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `types` int(2) NOT NULL DEFAULT 0 COMMENT '请假类型:1事假,2年假,3调休假,4病假,5婚假,6丧假,7产假,8陪产假,9其他',
  `start_date` bigint(11) NOT NULL DEFAULT 0 COMMENT '开始日期',
  `end_date` bigint(11) NOT NULL DEFAULT 0 COMMENT '结束日期',
  `start_span` int(10) NOT NULL DEFAULT 0 COMMENT '时间段:1上午,2下午',
  `end_span` int(10) NOT NULL DEFAULT 0 COMMENT '时间段:1上午,2下午',
  `duration` decimal(10,1) NOT NULL DEFAULT 0.0 COMMENT '时长(工作日)',
  `reason` text NOT NULL COMMENT '请假原因',
  `file_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '附件，如:1,2,3',
  `check_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '审核状态:0待审核,1审核中,2审核通过,3审核不通过,4撤销审核',
  `check_flow_id` int(11) NOT NULL DEFAULT 0 COMMENT '审核流程id',
  `check_step_sort` int(11) NOT NULL DEFAULT 0 COMMENT '当前审批步骤',
  `check_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '当前审批人ID，如:1,2,3',
  `check_last_uid` varchar(500) NOT NULL DEFAULT '' COMMENT '上一审批人',
  `check_history_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '历史审批人ID，如:1,2,3',
  `check_copy_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '抄送人ID，如:1,2,3',
  `check_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '审核通过时间',
  `admin_id` int(11) NOT NULL COMMENT '创建人ID',
  `did` int(11) NOT NULL COMMENT '创建人部门ID',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1032 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='请假表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_leaves`
--

LOCK TABLES `oa_leaves` WRITE;
/*!40000 ALTER TABLE `oa_leaves` DISABLE KEYS */;
INSERT INTO `oa_leaves` VALUES
(1004,1,1786346241,1786432641,1,2,1.0,'家中有事需要处理','',2,1,1,'','','3,2','',1786259841,4,6,1786173441,1786173441,0),
(1005,2,1786519041,1786691841,1,2,2.0,'感冒发烧，去医院就诊','',2,1,1,'','','3,2','',1786432641,4,6,1786346241,1786346241,0),
(1006,1,1786691841,1786778241,1,2,1.0,'陪家人体检','',2,1,1,'','','3,2','',1786605441,4,6,1786519041,1786519041,0),
(1007,3,1786864641,1787123841,1,2,3.0,'回老家处理房产事务','',2,1,1,'','','3,2','',1786778241,3,6,1786691841,1786691841,0),
(1008,1,1787037441,1787123841,1,2,1.0,'参加孩子家长会','',2,1,1,'','','3,2','',1786951041,3,6,1786864641,1786864641,0),
(1009,2,1787210241,1787383041,1,2,2.0,'客户来访需要陪同接待后的调休','',2,1,1,'','','3,2','',1787123841,7,4,1787037441,1787037441,0),
(1010,1,1787383041,1787469441,1,2,1.0,'年假出行','',2,1,1,'','','3,2','',1787296641,7,4,1787210241,1787210241,0),
(1011,1,1787555841,1787642241,1,2,1.0,'办理个人证件','',2,1,1,'','','3,2','',1787469441,5,2,1787383041,1787383041,0),
(1012,2,1787728641,1787901441,1,2,2.0,'身体不适需要休息','',2,1,1,'','','3,2','',1787642241,6,3,1787555841,1787555841,0),
(1013,5,1787901441,1788333441,1,2,5.0,'十一假期提前回家','',2,1,1,'','','3,2','',1787815041,4,6,1787728641,1787728641,0),
(1014,1,1788074241,1788160641,1,2,1.0,'牙齿治疗复诊','',2,1,1,'','','3,2','',1787987841,3,6,1787901441,1787901441,0),
(1015,3,1788247041,1788506241,1,2,3.0,'出差归来调休','',2,1,1,'','','3,2','',1788160641,7,4,1788074241,1788074241,0),
(1016,1,1788938241,1789024641,1,2,1.0,'明天家中水管维修需要在家等候','',1,1,0,'3','','','',1788765441,4,6,1788765441,0,0),
(1017,2,1788938241,1789111041,1,2,2.0,'下周一陪同客户参观工厂，申请调休','',1,1,0,'3','','','',1788765441,7,4,1788765441,0,0),
(1018,1,1788938241,1789024641,1,2,1.0,'下周五参加行业技术交流会','',1,1,0,'3','','','',1788765441,3,6,1788765441,0,0),
(1019,2,1788883200,2232547200,0,0,999.0,'饶总请假不需要理由','',1,1,0,'12','','','',0,8,1,1788775175,0,0),
(1020,3,1788915600,1789034400,0,1,2.0,'年假出行，已提前与产品组排期确认。','',1,1,0,'3','','','',0,12,11,1788829200,1788829200,0),
(1021,2,1788829200,1788840000,0,0,0.5,'感冒发烧，上午去医院就诊。','',2,1,1,'','','3,8','',1788825600,4,6,1788742800,1788742800,0),
(1022,4,1789365600,1789380000,1,1,0.5,'上周末加班调休。','',1,1,1,'8','','3','',0,16,2,1789279200,1789279200,0),
(1023,1,1789106400,1789120800,1,1,0.5,'下午办理房产过户手续。','',3,1,1,'','','3','',0,17,7,1789020000,1789020000,0),
(1024,2,1788483600,1788516000,0,1,1.0,'肠胃炎就医，附诊断证明。','',2,1,1,'','','3,8','',1788480000,18,11,1788397200,1788397200,0),
(1025,1,1788328800,1788343200,1,1,0.5,'下午银行办理贷款面签。','',2,1,1,'','','3','',1788325200,12,11,1788242400,1788242400,0),
(1026,3,1788915600,1789034400,0,1,2.0,'年假出行，已提前与产品组排期确认。','',1,1,0,'3','','','',0,12,11,1788829200,1788829200,0),
(1027,2,1788829200,1788840000,0,0,0.5,'感冒发烧，上午去医院就诊。','',2,1,1,'','','3,8','',1788825600,4,6,1788742800,1788742800,0),
(1028,4,1789365600,1789380000,1,1,0.5,'上周末加班调休。','',1,1,1,'8','','3','',0,16,2,1789279200,1789279200,0),
(1029,1,1789106400,1789120800,1,1,0.5,'下午办理房产过户手续。','',3,1,1,'','','3','',0,17,7,1789020000,1789020000,0),
(1030,2,1788483600,1788516000,0,1,1.0,'肠胃炎就医，附诊断证明。','',2,1,1,'','','3,8','',1788480000,18,11,1788397200,1788397200,0),
(1031,1,1788328800,1788343200,1,1,0.5,'下午银行办理贷款面签。','',2,1,1,'','','3','',1788325200,12,11,1788242400,1788242400,0);
/*!40000 ALTER TABLE `oa_leaves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_links`
--

DROP TABLE IF EXISTS `oa_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_links` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '小工具名称',
  `logo` int(11) NOT NULL DEFAULT 0 COMMENT 'logo',
  `url` varchar(255) DEFAULT NULL COMMENT '链接',
  `target` int(1) NOT NULL DEFAULT 1 COMMENT '是否新窗口打开，1是,0否',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `create_time` int(11) NOT NULL DEFAULT 0,
  `update_time` int(11) NOT NULL DEFAULT 0,
  `delete_time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='办公工具';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_links`
--

LOCK TABLES `oa_links` WRITE;
/*!40000 ALTER TABLE `oa_links` DISABLE KEYS */;
INSERT INTO `oa_links` VALUES
(1,'DeepSeek',0,'https://chat.deepseek.com/',1,0,1757759036,1760144979,0),
(2,'豆包助手',0,'https://www.doubao.com/chat/',1,0,1757759226,1760141689,0),
(3,'通义千问',0,'https://www.tongyi.com/',1,0,1760141705,0,0),
(4,'腾讯混元',0,'https://aistudio.tencent.com/',1,0,1760141705,0,0),
(5,'文心一言',0,'https://yiyan.baidu.com/',1,0,1760141394,0,0),
(6,'KIMI',0,'https://www.kimi.com/',1,0,1760141394,0,0),
(7,'AIPPT',0,'https://www.aippt.cn/',1,0,1760144331,0,0),
(8,'ProcessOn',0,'https://www.processon.com/',1,0,1760144601,0,0),
(9,'知犀',0,'https://www.zhixi.com/',1,0,1760144601,0,0);
/*!40000 ALTER TABLE `oa_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_loan`
--

DROP TABLE IF EXISTS `oa_loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_loan` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `enterprise_id` int(11) NOT NULL DEFAULT 0 COMMENT '借支企业主体',
  `account_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '资金账户ID',
  `paytype_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '支付方式',
  `code` varchar(100) NOT NULL DEFAULT '' COMMENT '借支编码',
  `title` varchar(500) NOT NULL DEFAULT '' COMMENT '借款主题',
  `cost` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '借支金额',
  `types` tinyint(4) NOT NULL DEFAULT 1 COMMENT '借支类型：1日常备用金,2项目预支款',
  `loan_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '预期借支日期',
  `plan_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '预计还款日期',
  `content` varchar(1000) DEFAULT '' COMMENT '借支理由',
  `admin_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '借支人',
  `did` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '借支部门ID',
  `balance_cost` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '已冲账金额',
  `balance_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '冲账状态 0待冲账,1部分冲账,2已冲账',
  `project_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '关联项目ID',
  `file_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '附件ID，如:1,2,3',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '打款状态 1待打款,2已打款',
  `confirm_uid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '打款人ID',
  `confirm_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '最后打款时间',
  `back_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '还款状态 0待还款,1已还款',
  `back_admin_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '还款操作人ID',
  `back_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '最后还款时间',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  `check_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '审核状态:0待审核,1审核中,2审核通过,3审核不通过,4撤销审核',
  `check_flow_id` int(11) NOT NULL DEFAULT 0 COMMENT '审核流程id',
  `check_step_sort` int(11) NOT NULL DEFAULT 0 COMMENT '当前审批步骤',
  `check_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '当前审批人ID，如:1,2,3',
  `check_last_uid` varchar(500) NOT NULL DEFAULT '' COMMENT '上一审批人',
  `check_history_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '历史审批人ID，如:1,2,3',
  `check_copy_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '抄送人ID，如:1,2,3',
  `check_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '审核通过时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1016 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='借支表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_loan`
--

LOCK TABLES `oa_loan` WRITE;
/*!40000 ALTER TABLE `oa_loan` DISABLE KEYS */;
INSERT INTO `oa_loan` VALUES
(1014,1,1,1,'','差旅借支-杭州客户拜访',3000.00,1,1788656400,1789952400,'',15,8,0.00,0,0,'',1,0,0,0,0,0,1788656400,1788656400,0,2,13,0,'','','3,8','',0),
(1015,1,1,1,'','展会物料借支',5000.00,1,1788832800,1790128800,'',7,4,0.00,0,0,'',1,0,0,0,0,0,1788832800,1788832800,0,1,13,0,'3','','','',0);
/*!40000 ALTER TABLE `oa_loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_meeting_order`
--

DROP TABLE IF EXISTS `oa_meeting_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_meeting_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(225) DEFAULT NULL COMMENT '会议主题',
  `start_date` int(11) NOT NULL DEFAULT 0 COMMENT '会议开始时间',
  `end_date` int(11) NOT NULL DEFAULT 0 COMMENT '会议结束时间',
  `requirements` varchar(500) NOT NULL DEFAULT '' COMMENT '会议需求',
  `room_id` int(11) NOT NULL DEFAULT 0 COMMENT '会议室',
  `num` int(11) NOT NULL DEFAULT 0 COMMENT '人数',
  `remark` varchar(225) DEFAULT NULL COMMENT '备注信息',
  `file_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '相关附件',
  `join_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '与会人员',
  `anchor_id` int(11) NOT NULL DEFAULT 0 COMMENT '主持人id',
  `admin_id` int(11) NOT NULL DEFAULT 0 COMMENT '发布人id',
  `did` int(11) NOT NULL DEFAULT 0 COMMENT '主办部门',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '申请时间',
  `check_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '审核状态:0待审核,1审核中,2审核通过,3审核不通过,4撤销审核',
  `check_flow_id` int(11) NOT NULL DEFAULT 0 COMMENT '审核流程id',
  `check_step_sort` int(11) NOT NULL DEFAULT 0 COMMENT '当前审批步骤',
  `check_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '当前审批人ID，如:1,2,3',
  `check_last_uid` varchar(500) NOT NULL DEFAULT '' COMMENT '上一审批人',
  `check_history_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '历史审批人ID，如:1,2,3',
  `check_copy_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '抄送人ID，如:1,2,3',
  `check_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '审核通过时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新信息时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1012 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='会议室预定';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_meeting_order`
--

LOCK TABLES `oa_meeting_order` WRITE;
/*!40000 ALTER TABLE `oa_meeting_order` DISABLE KEYS */;
INSERT INTO `oa_meeting_order` VALUES
(1006,'销售部周例会',1788744600,1788748200,'',5,0,'','','15,16,18',0,15,5,1788658200,2,7,0,'','','8','',1788741000,1788658200,0),
(1007,'冠林云 2.0 迭代评审会',1788847200,1788852600,'',4,0,'','','9,14,18',0,9,6,1788760800,1,7,0,'8','','','',0,1788760800,0),
(1008,'客服月度质量分析会',1788919200,1788922800,'',6,0,'','','17',0,17,7,1788832800,1,7,0,'8','','','',0,1788832800,0),
(1009,'新员工入职欢迎会',1789027200,1789030800,'',6,0,'','','5,12,18',0,5,2,1788940800,1,7,0,'3','','','',0,1788940800,0),
(1010,'销售三部 Q4 策略会',1789110000,1789115400,'',5,0,'','','15,18',0,15,8,1789023600,1,7,0,'8','','','',0,1789023600,0),
(1011,'华信集团项目对接会',1789176600,1789182000,'',4,0,'','','2,8,10,11',0,11,4,1789090200,0,7,0,'','','','',0,1789090200,0);
/*!40000 ALTER TABLE `oa_meeting_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_meeting_records`
--

DROP TABLE IF EXISTS `oa_meeting_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_meeting_records` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(225) DEFAULT NULL COMMENT '会议主题',
  `meeting_date` int(11) NOT NULL DEFAULT 0 COMMENT '会议时间',
  `room_id` int(11) NOT NULL DEFAULT 0 COMMENT '会议室',
  `did` int(11) NOT NULL DEFAULT 0 COMMENT '主办部门',
  `content` text NOT NULL COMMENT '会议内容',
  `plans` text NOT NULL COMMENT '下一步实施计划',
  `file_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '相关附件',
  `join_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '与会人员',
  `sign_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '签到人员',
  `share_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '共享给谁',
  `anchor_id` int(11) NOT NULL DEFAULT 0 COMMENT '主持人id',
  `recorder_id` int(11) NOT NULL DEFAULT 0 COMMENT '记录人id',
  `remarks` text NOT NULL COMMENT '备注内容',
  `admin_id` int(11) NOT NULL DEFAULT 0 COMMENT '发布人id',
  `create_time` bigint(11) NOT NULL DEFAULT 0,
  `update_time` bigint(11) NOT NULL DEFAULT 0,
  `delete_time` bigint(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='会议纪要';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_meeting_records`
--

LOCK TABLES `oa_meeting_records` WRITE;
/*!40000 ALTER TABLE `oa_meeting_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_meeting_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_meeting_room`
--

DROP TABLE IF EXISTS `oa_meeting_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_meeting_room` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '会议室名称',
  `keep_uid` int(11) NOT NULL DEFAULT 0 COMMENT '会议室管理员',
  `address` varchar(100) NOT NULL DEFAULT '' COMMENT '地址楼层',
  `device` varchar(255) NOT NULL DEFAULT '' COMMENT '会议室设备',
  `num` int(10) NOT NULL DEFAULT 10 COMMENT '可容纳人数',
  `remark` varchar(1000) DEFAULT '' COMMENT '会议室描述',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：-1删除 0禁用 1启用',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='会议室';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_meeting_room`
--

LOCK TABLES `oa_meeting_room` WRITE;
/*!40000 ALTER TABLE `oa_meeting_room` DISABLE KEYS */;
INSERT INTO `oa_meeting_room` VALUES
(4,'冠林厅',16,'总部 10F','投屏、视频会议系统、音响',30,'大型会议、全员大会、客户接待',1,1788834087,1788834087),
(5,'望山室',16,'总部 8F-801','白板、投屏',12,'部门例会、项目评审',1,1788834087,1788834087),
(6,'临溪室',16,'总部 8F-802','白板',6,'小组讨论、面试',1,1788834087,1788834087);
/*!40000 ALTER TABLE `oa_meeting_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_message`
--

DROP TABLE IF EXISTS `oa_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_message` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '消息主题',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '消息模板,默认是空私人消息,其他则在配置文件查看消息模板',
  `content` mediumtext DEFAULT NULL COMMENT '消息内容',
  `file_ids` mediumtext DEFAULT NULL COMMENT '消息附件',
  `from_uid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '发送人id，0为系统消息',
  `types` tinyint(1) unsigned DEFAULT 0 COMMENT '接收人类型：1人员,2部门,3岗位,4全部',
  `uids` varchar(500) NOT NULL DEFAULT '' COMMENT '人员ids',
  `dids` varchar(500) NOT NULL DEFAULT '' COMMENT '部门ids',
  `pids` varchar(500) NOT NULL DEFAULT '' COMMENT '岗位ids',
  `copy_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '操送人员ids',
  `msg_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '转发、回复关联消息id',
  `is_draft` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否是草稿：1正常消息 2草稿消息',
  `send_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '发送日期',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  `clear_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '清除时间',
  `action_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '操作模块数据的id（针对系统消息）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='发消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_message`
--

LOCK TABLES `oa_message` WRITE;
/*!40000 ALTER TABLE `oa_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_mobile_bar`
--

DROP TABLE IF EXISTS `oa_mobile_bar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_mobile_bar` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT '图标',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序：越大越靠前',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：-1删除 0禁用 1启用',
  `create_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='手机端Bar表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_mobile_bar`
--

LOCK TABLES `oa_mobile_bar` WRITE;
/*!40000 ALTER TABLE `oa_mobile_bar` DISABLE KEYS */;
INSERT INTO `oa_mobile_bar` VALUES
(1,'工作台','icon-gongzuotai1','/qiye/index/index',0,1,1723277311,1733147213),
(2,'客户','icon-kehu','/qiye/customer/index',0,1,1723277311,1733147238),
(3,'合同','icon-hetong2','/qiye/contract/index',0,1,1723277351,1733147266),
(4,'项目','icon-xiangmu1','/qiye/project/index',0,1,1723277356,1733147298),
(5,'消息','icon-xiaoxi1','/qiye/msg/index',0,1,1723277368,1733147331);
/*!40000 ALTER TABLE `oa_mobile_bar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_mobile_menu`
--

DROP TABLE IF EXISTS `oa_mobile_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_mobile_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT '图标',
  `bgcolor` varchar(255) NOT NULL DEFAULT '' COMMENT '背景颜色',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接',
  `types` int(11) NOT NULL DEFAULT 0 COMMENT '关联菜单类型',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序：越大越靠前',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：-1删除 0禁用 1启用',
  `create_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='手机端菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_mobile_menu`
--

LOCK TABLES `oa_mobile_menu` WRITE;
/*!40000 ALTER TABLE `oa_mobile_menu` DISABLE KEYS */;
INSERT INTO `oa_mobile_menu` VALUES
(1,'审批申请','icon-shenpi','blue','/qiye/approve/apply',1,0,1,1733146294,1733152760,0),
(2,'我申请的','icon-wodeshenpi1','blue','/qiye/approve/mylist',1,0,1,1733152749,0,0),
(3,'我处理的','icon-chulishenpi','blue','/qiye/approve/checklist',1,0,1,1733152798,0,0),
(4,'抄送给我','icon-chaosong','blue','/qiye/approve/copylist',1,0,1,1733152823,0,0),
(5,'工作计划','icon-xiangmurenwu','green','/qiye/index/workplan',2,0,1,1733152855,0,0),
(6,'日程安排','icon-richeng','green','/qiye/index/calendar',2,0,1,1733152855,0,0),
(7,'工作日志','icon-jilu','green','/qiye/index/schedule',2,0,1,1733152878,0,0),
(8,'工作汇报','icon-huibao','green','/qiye/index/work',2,0,1,1733152906,0,0),
(9,'公告通知','icon-gonggaotongzhi','yellow','/qiye/index/note',3,0,1,1733152965,0,0),
(10,'公司新闻','icon-gongsixinwen','yellow','/qiye/index/news',3,0,1,1733152993,0,0),
(11,'规章制度','icon-guidanghetong','yellow','/qiye/index/regulation',3,0,1,1733152993,0,0),
(12,'会议记录','icon-huiyijiyao','yellow','/qiye/index/meeting',3,0,1,1733152993,0,0),
(13,'借支管理','icon-a-baoxiao2','purple','/qiye/finance/loan',4,0,1,1733153131,0,0),
(14,'报销管理','icon-a-baoxiao3','purple','/qiye/finance/expense',4,0,1,1733153019,0,0),
(15,'销项发票','icon-kaipiao','purple','/qiye/finance/invoice',4,0,1,1733153047,0,0),
(16,'进项管理','icon-shoupiao','purple','/qiye/finance/ticket',4,0,1,1733153077,0,0),
(17,'收款管理','icon-huikuan','purple','/qiye/finance/income',4,0,1,1733153106,0,0),
(18,'付款管理','icon-fukuan','purple','/qiye/finance/payment',4,0,1,1733153131,0,0),
(19,'退款管理','icon-shoukuanzuofei','purple','/qiye/finance/refund',4,0,1,1733153131,0,0),
(20,'企业人员','icon-kehu','cyan','/qiye/index/admin',5,0,1,1754539422,0,0),
(21,'入职管理','icon-wodeshenpi1','cyan','/qiye/approve/talentlist',5,0,1,1754539501,0,0),
(22,'离职管理','icon-zuofeibaoming','cyan','/qiye/approve/leavelist',5,0,1,1754539544,0,0),
(23,'人事调动','icon-qiangke','cyan','/qiye/approve/changelist',5,0,1,1754539578,0,0),
(24,'我的薪资','icon-fukuanshenqing','cyan','/qiye/index/salary',5,0,1,1754539578,0,0);
/*!40000 ALTER TABLE `oa_mobile_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_mobile_types`
--

DROP TABLE IF EXISTS `oa_mobile_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_mobile_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT '图标',
  `bgcolor` varchar(255) NOT NULL DEFAULT '' COMMENT '背景颜色',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序：越大越靠前',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：-1删除 0禁用 1启用',
  `create_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='手机端工作台菜单类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_mobile_types`
--

LOCK TABLES `oa_mobile_types` WRITE;
/*!40000 ALTER TABLE `oa_mobile_types` DISABLE KEYS */;
INSERT INTO `oa_mobile_types` VALUES
(1,'办公审批','','blue',0,1,1723277311,0),
(2,'效率工具','','green',0,1,1723277311,0),
(3,'内部管理','','yellow',0,1,1723277351,0),
(4,'财务管理','','purple',0,1,1723277356,0),
(5,'人事管理','','red',0,1,1754539327,0);
/*!40000 ALTER TABLE `oa_mobile_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_msg`
--

DROP TABLE IF EXISTS `oa_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_msg` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '消息主题',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '消息模板,默认是私人文本消息,其他则在配置文件查看消息模板',
  `content` mediumtext DEFAULT NULL COMMENT '消息内容',
  `file_ids` mediumtext DEFAULT NULL COMMENT '消息附件',
  `from_uid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '发送人id，0为系统消息',
  `to_uid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '接收人id',
  `message_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '来源发件消息id,0为系统消息',
  `msg_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '转发、回复关联消息id',
  `is_star` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否星标信息：1是 0不是',
  `read_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '阅读时间',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  `clear_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '清除时间',
  `action_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '操作模块数据的id（针对系统消息）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_msg`
--

LOCK TABLES `oa_msg` WRITE;
/*!40000 ALTER TABLE `oa_msg` DISABLE KEYS */;
INSERT INTO `oa_msg` VALUES
(1000,'饶旺提交了一个『请假申请』，请及时审批','20','您有一个新的『请假申请』需要处理。',NULL,0,12,0,0,0,0,1788775175,0,0,0,1019),
(1001,'超级员工提交了一个『入职审批』，请及时审批','14','您有一个新的『入职审批』需要处理。',NULL,0,8,0,0,0,1788778643,1788778068,0,0,0,1),
(1002,'您提交的『入职审批』已被审批通过','14','您在2026-09-07 18:47:48提交的『入职审批』已于2026-09-07被审批通过。',NULL,0,1,0,0,0,0,1788778642,0,0,0,1);
/*!40000 ALTER TABLE `oa_msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_news`
--

DROP TABLE IF EXISTS `oa_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_news` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(225) DEFAULT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '新闻内容',
  `src` varchar(100) DEFAULT NULL COMMENT '关联链接',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `file_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '相关附件',
  `admin_id` int(11) NOT NULL DEFAULT 0 COMMENT '发布人id',
  `create_time` bigint(11) NOT NULL DEFAULT 0,
  `update_time` bigint(11) NOT NULL DEFAULT 0,
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1014 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='公司新闻表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_news`
--

LOCK TABLES `oa_news` WRITE;
/*!40000 ALTER TABLE `oa_news` DISABLE KEYS */;
INSERT INTO `oa_news` VALUES
(1000,'关于2026年中秋节放假安排的通知','各部门、各位同事：<br>根据国务院办公厅通知精神，结合公司实际情况，现将2026年中秋节放假安排通知如下：<br><br>一、放假时间：9月25日（周五）至9月27日（周日）放假，共3天。<br>二、9月28日（周一）正常上班。<br>三、请各部门在放假前做好安全检查，关好门窗、切断电源。<br>四、值班安排：假期期间行政部安排专人值班，紧急事务请联系值班电话。<br><br>祝大家中秋快乐，阖家团圆！','冠林集团',0,'',5,1788601686,1788765441,0),
(1001,'冠林集团报销制度（2026年修订版）','为规范费用报销流程，现将报销制度要点公布如下：<br><br>一、报销范围：差旅费、业务招待费、办公用品采购等。<br>二、报销流程：OA系统提交报销申请 → 部门经理审批 → 财务审核 → 总经理批准 → 财务打款。<br>三、时限要求：费用发生后30天内提交报销，逾期不予受理。<br>四、发票要求：发票抬头必须为公司全称，增值税专用发票请同时提供开票信息。<br>五、单笔超过5000元的报销需提前申请，附事前审批单。<br><br>本制度自发布之日起执行，解释权归财务部所有。','冠林集团',0,'',6,1788465878,1788765441,0),
(1002,'欢迎张三、钱七加入冠林集团','大家好！<br>本周我们迎来了两位新同事：<br><br>张三，技术部软件工程师，负责后端系统开发，办公位在3楼东区。<br>钱七，市场部市场专员，负责华东区市场拓展，办公位在2楼西区。<br><br>让我们欢迎新同事的加入，也请大家工作中多多关照、互相支持！','冠林集团',0,'',5,1788091053,1788765441,0),
(1003,'关于启用新版本《员工考勤管理办法》的通知','各位同事：<br>为进一步规范考勤管理，公司对原考勤办法进行了修订，新版《员工考勤管理办法》已于本月起正式执行，重点变化如下：<br><br>一、上下班时间调整为9:00-18:00，午休1小时。<br>二、请假一律通过OA系统提交，紧急情况可先口头报备后补单。<br>三、当月全勤奖励上调至300元。<br>四、迟到早退当月累计3次以上，取消当月全勤奖。<br><br>详情请查看附件或咨询人事部王五。','冠林集团',0,'',5,1787185949,1788765441,0),
(1004,'公司三季度经营分析会会议纪要','三季度经营分析会于上周五召开，纪要如下：<br><br>一、前三季度整体营收完成年度目标的72%，进度符合预期。<br>二、技术部交付的项目按期率提升至95%，得到客户书面表扬2次。<br>三、市场部华东区新签客户11家，创单季新高。<br>四、四季度重点：推进数字化转型项目，全员推行OA无纸化办公。<br><br>请各部门对照目标查漏补缺，冲刺全年任务。','冠林集团',0,'',2,1788635229,1788765441,0),
(1005,'冠林集团管理层调整暨新高管欢迎公告','各位同事：<br>经董事会研究决定，自本月起公司管理层调整如下：<br><br>一、任命<b>饶旺</b>为集团总经理，全面主持公司经营管理工作；<br>二、任命<b>刘凌聪</b>为首席技术官（CTO），分管技术部、产品部；<br>三、任命<b>陈佳彤</b>为首席财务官（CFO），分管财务部；<br>四、任命<b>王子怡</b>为首席营销官（CMO），分管市场部、销售部；<br>五、任命<b>周雨桐</b>为人事经理，主持人事部工作。<br><br>原总经理孙八先生升任集团董事长，聚焦集团战略与董事会事务。<br><br>让我们欢迎新同事的加入，祝各位高管工作顺利，带领公司再创佳绩！<br><br>冠林集团董事会','冠林集团董事会',0,'',1,1788773494,1788773494,0),
(1006,'关于 2026 年中秋、国庆放假安排的通知','今年中秋节与国庆节相邻，9 月 26 日（周六）至 10 月 8 日（周四）放假调休共 11 天，9 月 26 日、10 月 9 日（周五）……即 10 月 10 日（周六）上班。请各部门提前安排好节前工作交接与值班表。','',0,'',1,1788831000,1788831000,0),
(1007,'9 月全员大会定于 9 月 26 日召开','全员大会将同步上半年经营数据回顾、智慧社区项目进展汇报及 Q4 目标发布，地点：总部 10F 冠林厅，请全体同事预留时间。','',0,'',1,1788772800,1788772800,0),
(1008,'公司新版 OA 办公平台正式启用','即日起全面使用新版 OA 平台处理审批、请假、报销、会议室预订等事务，旧纸质流程同步停用。使用问题请联系人事部王五。','',0,'',1,1788224400,1788224400,0),
(1009,'智慧社区一期项目组正式成立','项目组由刘凌聪（CTO）挂帅，抽调研发部、产品部骨干 8 人，目标 12 月底完成一期交付。','',0,'',1,1783562400,1783562400,0),
(1010,'关于 2026 年中秋、国庆放假安排的通知','今年中秋节与国庆节相邻，9 月 26 日（周六）至 10 月 8 日（周四）放假调休共 11 天，9 月 26 日、10 月 9 日（周五）……即 10 月 10 日（周六）上班。请各部门提前安排好节前工作交接与值班表。','',0,'',1,1788831000,1788831000,0),
(1011,'9 月全员大会定于 9 月 26 日召开','全员大会将同步上半年经营数据回顾、智慧社区项目进展汇报及 Q4 目标发布，地点：总部 10F 冠林厅，请全体同事预留时间。','',0,'',1,1788772800,1788772800,0),
(1012,'公司新版 OA 办公平台正式启用','即日起全面使用新版 OA 平台处理审批、请假、报销、会议室预订等事务，旧纸质流程同步停用。使用问题请联系人事部王五。','',0,'',1,1788224400,1788224400,0),
(1013,'智慧社区一期项目组正式成立','项目组由刘凌聪（CTO）挂帅，抽调研发部、产品部骨干 8 人，目标 12 月底完成一期交付。','',0,'',1,1783562400,1783562400,0);
/*!40000 ALTER TABLE `oa_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_note`
--

DROP TABLE IF EXISTS `oa_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_note` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` int(11) NOT NULL DEFAULT 0 COMMENT '公告分类ID',
  `sourse` tinyint(1) NOT NULL DEFAULT 1 COMMENT '发布平台:1PC,2手机',
  `title` varchar(225) DEFAULT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '公告内容',
  `src` varchar(100) DEFAULT NULL COMMENT '关联链接',
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '1可用-1禁用',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `file_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '相关附件',
  `role_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '查看权限，0所有人,1部门,2人员',
  `role_dids` varchar(500) NOT NULL DEFAULT '' COMMENT '可查看部门',
  `role_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '可查看用户',
  `start_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '展示开始时间',
  `end_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '展示结束时间',
  `admin_id` int(11) NOT NULL DEFAULT 0 COMMENT '发布人id',
  `create_time` bigint(11) NOT NULL DEFAULT 0,
  `update_time` bigint(11) NOT NULL DEFAULT 0,
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1005 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_note`
--

LOCK TABLES `oa_note` WRITE;
/*!40000 ALTER TABLE `oa_note` DISABLE KEYS */;
INSERT INTO `oa_note` VALUES
(1000,1,0,'关于2026年中秋节放假安排的通知','各部门、各位同事：\n根据国务院办公厅通知精神，结合公司实际情况，现将2026年中秋节放假安排通知如下：\n\n一、放假时间：9月25日（周五）至9月27日（周日）放假，共3天。\n二、9月28日（周一）正常上班。\n三、请各部门在放假前做好安全检查，关好门窗、切断电源。\n四、假期期间行政部安排专人值班，紧急事务请联系值班电话。\n\n祝大家中秋快乐，阖家团圆！','冠林集团',1,0,'',0,'','',0,0,1,1788683081,1788683081,0),
(1001,1,0,'冠林集团报销制度（2026年修订版）','为规范费用报销流程，现将报销制度要点公布如下：\n\n一、报销范围：差旅费、业务招待费、办公用品采购等。\n二、报销流程：OA系统提交报销申请 → 部门经理审批 → 财务审核 → 总经理批准 → 财务打款。\n三、时限要求：费用发生后30天内提交报销，逾期不予受理。\n四、发票要求：发票抬头必须为公司全称。\n五、单笔超过5000元的报销需提前申请，附事前审批单。\n\n本制度自发布之日起执行，解释权归财务部所有。','冠林集团',1,0,'',0,'','',0,0,1,1788423881,1788423881,0),
(1002,1,0,'欢迎张三、钱七加入冠林集团','大家好！\n本周我们迎来了两位新同事：\n\n张三，技术部软件工程师，负责后端系统开发，办公位在3楼东区。\n钱七，市场部市场专员，负责华东区市场拓展，办公位在2楼西区。\n\n让我们欢迎新同事的加入，也请大家工作中多多关照、互相支持！','冠林集团',1,0,'',0,'','',0,0,1,1788164681,1788164681,0),
(1003,1,0,'关于启用新版本《员工考勤管理办法》的通知','各位同事：\n为进一步规范考勤管理，公司对原考勤办法进行了修订，新版《员工考勤管理办法》已于本月起正式执行，重点变化如下：\n\n一、上下班时间调整为9:00-18:00，午休1小时。\n二、请假一律通过OA系统提交，紧急情况可先口头报备后补单。\n三、当月全勤奖励上调至300元。\n\n详情请咨询人事部王五。','冠林集团',1,0,'',0,'','',0,0,1,1787732681,1787732681,0),
(1004,2,0,'公司三季度经营分析会会议纪要','三季度经营分析会于上周五召开，纪要如下：\n\n一、前三季度整体营收完成年度目标的72%，进度符合预期。\n二、技术部交付的项目按期率提升至95%，得到客户书面表扬2次。\n三、市场部华东区新签客户11家，创单季新高。\n四、四季度重点：推进数字化转型项目，全员推行OA无纸化办公。\n\n请各部门对照目标查漏补缺，冲刺全年任务。','冠林集团',1,0,'',0,'','',0,0,1,1787214281,1787214281,0);
/*!40000 ALTER TABLE `oa_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_note_cate`
--

DROP TABLE IF EXISTS `oa_note_cate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_note_cate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '父类ID',
  `sort` int(5) NOT NULL DEFAULT 0 COMMENT '排序',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '1可用-1禁用',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '修改时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='公告分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_note_cate`
--

LOCK TABLES `oa_note_cate` WRITE;
/*!40000 ALTER TABLE `oa_note_cate` DISABLE KEYS */;
INSERT INTO `oa_note_cate` VALUES
(1,0,1,'普通公告',1,1637984265,1637984299,0),
(2,0,2,'紧急公告',1,1637984283,1637984310,0);
/*!40000 ALTER TABLE `oa_note_cate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_outs`
--

DROP TABLE IF EXISTS `oa_outs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_outs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` bigint(11) NOT NULL DEFAULT 0 COMMENT '开始日期',
  `end_date` bigint(11) NOT NULL DEFAULT 0 COMMENT '结束日期',
  `start_span` int(10) NOT NULL DEFAULT 0 COMMENT '时间段:1上午,2下午',
  `end_span` int(10) NOT NULL DEFAULT 0 COMMENT '时间段:1上午,2下午',
  `duration` decimal(10,1) NOT NULL DEFAULT 0.0 COMMENT '时长(工作日)',
  `reason` text NOT NULL COMMENT '出差原因',
  `file_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '附件，如:1,2,3',
  `check_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '审核状态:0待审核,1审核中,2审核通过,3审核不通过,4撤销审核',
  `check_flow_id` int(11) NOT NULL DEFAULT 0 COMMENT '审核流程id',
  `check_step_sort` int(11) NOT NULL DEFAULT 0 COMMENT '当前审批步骤',
  `check_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '当前审批人ID，如:1,2,3',
  `check_last_uid` varchar(500) NOT NULL DEFAULT '' COMMENT '上一审批人',
  `check_history_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '历史审批人ID，如:1,2,3',
  `check_copy_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '抄送人ID，如:1,2,3',
  `check_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '审核通过时间',
  `admin_id` int(11) NOT NULL COMMENT '创建人ID',
  `did` int(11) NOT NULL COMMENT '创建人部门ID',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='外出表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_outs`
--

LOCK TABLES `oa_outs` WRITE;
/*!40000 ALTER TABLE `oa_outs` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_outs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_overtimes`
--

DROP TABLE IF EXISTS `oa_overtimes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_overtimes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` bigint(11) NOT NULL DEFAULT 0 COMMENT '开始日期',
  `end_date` bigint(11) NOT NULL DEFAULT 0 COMMENT '结束日期',
  `start_span` int(10) NOT NULL DEFAULT 0 COMMENT '时间段:1上午,2下午',
  `end_span` int(10) NOT NULL DEFAULT 0 COMMENT '时间段:1上午,2下午',
  `duration` decimal(10,1) NOT NULL DEFAULT 0.0 COMMENT '时长(工作日)',
  `reason` text NOT NULL COMMENT '出差原因',
  `file_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '附件，如:1,2,3',
  `check_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '审核状态:0待审核,1审核中,2审核通过,3审核不通过,4撤销审核',
  `check_flow_id` int(11) NOT NULL DEFAULT 0 COMMENT '审核流程id',
  `check_step_sort` int(11) NOT NULL DEFAULT 0 COMMENT '当前审批步骤',
  `check_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '当前审批人ID，如:1,2,3',
  `check_last_uid` varchar(500) NOT NULL DEFAULT '' COMMENT '上一审批人',
  `check_history_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '历史审批人ID，如:1,2,3',
  `check_copy_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '抄送人ID，如:1,2,3',
  `check_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '审核通过时间',
  `admin_id` int(11) NOT NULL COMMENT '创建人ID',
  `did` int(11) NOT NULL COMMENT '创建人部门ID',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='加班表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_overtimes`
--

LOCK TABLES `oa_overtimes` WRITE;
/*!40000 ALTER TABLE `oa_overtimes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_overtimes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_pay_type`
--

DROP TABLE IF EXISTS `oa_pay_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_pay_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '付款方式名称',
  `pid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '分类id',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序：越大越靠前',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：-1删除 0禁用 1启用',
  `admin_id` int(11) NOT NULL DEFAULT 0 COMMENT '创建人',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='付款方式';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_pay_type`
--

LOCK TABLES `oa_pay_type` WRITE;
/*!40000 ALTER TABLE `oa_pay_type` DISABLE KEYS */;
INSERT INTO `oa_pay_type` VALUES
(1,'银行转账',0,0,1,0,1779631152,1779631180,0),
(2,'现金交易',0,0,1,0,1779631159,1779631185,0),
(3,'支付宝',0,0,1,0,1779631165,0,0),
(4,'微信支付',0,0,1,0,1779631173,0,0),
(5,'汇票交易',0,0,1,0,1779631200,0,0),
(6,'支票交易',0,0,1,0,1779631205,1779631211,0),
(7,'托收',0,0,1,0,1779631216,0,0),
(8,'其他',0,0,1,0,1779631219,0,0);
/*!40000 ALTER TABLE `oa_pay_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_personal_quit`
--

DROP TABLE IF EXISTS `oa_personal_quit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_personal_quit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '用户ID',
  `lead_admin_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '上级领导',
  `connect_id` int(11) NOT NULL DEFAULT 0 COMMENT '资料交接人',
  `connect_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '资料交接时间',
  `connect_uids` varchar(100) NOT NULL DEFAULT '' COMMENT '参与交接人,可多个',
  `file_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '档案附件',
  `quit_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '离职时间',
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '状态:1未交接,2已交接离职',
  `remark` varchar(1000) DEFAULT '' COMMENT '备注信息',
  `admin_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '创建人',
  `did` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '创建人所在部门',
  `check_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '审核状态:0待审核,1审核中,2审核通过,3审核不通过,4撤销审核',
  `check_flow_id` int(11) NOT NULL DEFAULT 0 COMMENT '审核流程id',
  `check_step_sort` int(11) NOT NULL DEFAULT 0 COMMENT '当前审批步骤',
  `check_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '当前审批人ID，如:1,2,3',
  `check_last_uid` varchar(500) NOT NULL DEFAULT '' COMMENT '上一审批人',
  `check_history_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '历史审批人ID，如:1,2,3',
  `check_copy_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '抄送人ID，如:1,2,3',
  `check_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '审核通过时间',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='离职申请表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_personal_quit`
--

LOCK TABLES `oa_personal_quit` WRITE;
/*!40000 ALTER TABLE `oa_personal_quit` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_personal_quit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_plan`
--

DROP TABLE IF EXISTS `oa_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_plan` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '工作安排主题',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '日程优先级',
  `customer_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '预设字段:关联客户ID',
  `project_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '预设字段:关联项目ID',
  `start_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '开始时间',
  `end_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '结束时间',
  `remind_type` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '提醒类型',
  `remind_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '提醒时间',
  `uids` varchar(255) NOT NULL DEFAULT '' COMMENT '参与人',
  `remark` text NOT NULL COMMENT '描述',
  `file_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '相关附件',
  `admin_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '创建员工ID',
  `did` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '所属部门',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='日程安排';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_plan`
--

LOCK TABLES `oa_plan` WRITE;
/*!40000 ALTER TABLE `oa_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_position`
--

DROP TABLE IF EXISTS `oa_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_position` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '岗位名称',
  `layouts` mediumtext DEFAULT NULL COMMENT '首页展示模块',
  `work_price` int(10) NOT NULL DEFAULT 0 COMMENT '工时单价',
  `remark` varchar(1000) DEFAULT '' COMMENT '备注',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：-1删除 0禁用 1启用',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='岗位职称';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_position`
--

LOCK TABLES `oa_position` WRITE;
/*!40000 ALTER TABLE `oa_position` DISABLE KEYS */;
INSERT INTO `oa_position` VALUES
(1,'超级岗位','',1000,'超级岗位，不能轻易修改权限',1,0,0),
(2,'人事总监','',1000,'人事部的最大领导',1,0,0),
(3,'普通员工','',500,'普通员工',1,0,0),
(4,'董事长','',800,'董事会最高领导',1,1788776088,1788776088),
(5,'总经理','',800,'公司日常经营负责人',1,1788776088,1788776088),
(6,'CTO','',800,'首席技术官',1,1788776088,1788776088),
(7,'CFO','',800,'首席财务官',1,1788776088,1788776088),
(8,'CMO','',800,'首席营销官',1,1788776088,1788776088),
(9,'财务总监','',800,'财务部负责人',1,1788776088,1788776088),
(10,'市场总监','',800,'市场部负责人',1,1788776088,1788776088),
(11,'销售总监','',800,'销售部负责人',1,1788776088,1788776088),
(12,'客服总监','',800,'客服部负责人',1,1788776088,1788776088),
(13,'产品经理','',800,'产品负责人',1,1788776088,1788776088),
(14,'后端开发工程师','',800,'负责服务端开发',1,1788776088,1788776088),
(15,'前端开发工程师','',800,'负责前端页面开发',1,1788776088,1788776088),
(16,'测试工程师','',800,'负责质量保障与测试',1,1788776088,1788776088),
(17,'人事专员','',800,'人事日常事务',1,1788776088,1788776088),
(18,'会计','',800,'财务核算',1,1788776088,1788776088);
/*!40000 ALTER TABLE `oa_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_position_group`
--

DROP TABLE IF EXISTS `oa_position_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_position_group` (
  `pid` int(11) unsigned DEFAULT NULL COMMENT '岗位id',
  `group_id` int(11) DEFAULT NULL COMMENT '权限id',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  UNIQUE KEY `pid_group_id` (`pid`,`group_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='权限分组和岗位的关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_position_group`
--

LOCK TABLES `oa_position_group` WRITE;
/*!40000 ALTER TABLE `oa_position_group` DISABLE KEYS */;
INSERT INTO `oa_position_group` VALUES
(1,1,1635755739,0),
(2,2,1638007427,0),
(3,3,1638007427,0),
(4,1,0,0),
(5,1,0,0),
(6,2,0,0),
(7,2,0,0),
(8,2,0,0),
(9,2,0,0),
(10,2,0,0),
(11,2,0,0),
(12,2,0,0),
(13,2,0,0),
(14,3,0,0),
(15,3,0,0),
(16,3,0,0),
(17,3,0,0),
(18,3,0,0);
/*!40000 ALTER TABLE `oa_position_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_problems`
--

DROP TABLE IF EXISTS `oa_problems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_problems` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '问题主题',
  `cate_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '所属分类ID',
  `project_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '关联项目ID',
  `contract_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '关联合同ID',
  `customer_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '关联客户ID',
  `problem_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '问题日期',
  `finish_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '完成日期',
  `over_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '关闭日期',
  `admin_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '创建人员',
  `director_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '负责人员',
  `did` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '负责人部门',
  `emergent` tinyint(1) NOT NULL DEFAULT 1 COMMENT '紧急度：1低,2中,3高',
  `priority` tinyint(1) NOT NULL DEFAULT 1 COMMENT '优先级：1低,2中,3高',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：1进行中,2已分配,3已解决,4已关闭',
  `file_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '附件ids',
  `content` mediumtext DEFAULT NULL COMMENT '问题描述',
  `create_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '修改时间',
  `delete_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='问题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_problems`
--

LOCK TABLES `oa_problems` WRITE;
/*!40000 ALTER TABLE `oa_problems` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_problems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_problems_cate`
--

DROP TABLE IF EXISTS `oa_problems_cate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_problems_cate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '类别名称',
  `pid` int(10) NOT NULL DEFAULT 0 COMMENT '父ID',
  `sort` int(10) NOT NULL DEFAULT 0 COMMENT '排序',
  `content` mediumtext DEFAULT NULL COMMENT '描述',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：-1删除 0禁用 1启用',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='问题类别';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_problems_cate`
--

LOCK TABLES `oa_problems_cate` WRITE;
/*!40000 ALTER TABLE `oa_problems_cate` DISABLE KEYS */;
INSERT INTO `oa_problems_cate` VALUES
(1,'产品问题',0,0,NULL,1,1782783484,0,0),
(2,'服务问题',0,0,NULL,1,1782783491,0,0);
/*!40000 ALTER TABLE `oa_problems_cate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_problems_work`
--

DROP TABLE IF EXISTS `oa_problems_work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_problems_work` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '服务记录主题',
  `problems_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '关联问题',
  `task_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '关联任务',
  `director_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '负责人员',
  `did` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '负责人部门',
  `admin_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '创建员工ID',
  `start_time` int(11) NOT NULL DEFAULT 0 COMMENT '开始时间',
  `end_time` int(11) NOT NULL DEFAULT 0 COMMENT '结束时间',
  `hours` decimal(15,1) NOT NULL DEFAULT 0.0 COMMENT '工时',
  `work_price` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '所有者的每小时费用',
  `work_total` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '工时总费用',
  `fee` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '其他费用',
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '总费用',
  `content` mediumtext NOT NULL COMMENT '描述',
  `delete_time` int(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='问题服务记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_problems_work`
--

LOCK TABLES `oa_problems_work` WRITE;
/*!40000 ALTER TABLE `oa_problems_work` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_problems_work` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_product`
--

DROP TABLE IF EXISTS `oa_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '产品名称',
  `cate_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '产品分类id',
  `thumb` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '缩略图id',
  `code` varchar(255) NOT NULL DEFAULT '' COMMENT '产品编码',
  `barcode` varchar(255) NOT NULL DEFAULT '' COMMENT '条形码',
  `unit` varchar(100) NOT NULL DEFAULT '' COMMENT '单位',
  `specs` varchar(100) NOT NULL DEFAULT '' COMMENT '规格',
  `brand` varchar(100) NOT NULL DEFAULT '' COMMENT '品牌',
  `producer` varchar(100) NOT NULL DEFAULT '' COMMENT '生产商',
  `base_price` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '成本价',
  `purchase_price` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '采购价',
  `sale_price` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '销售价',
  `content` text DEFAULT NULL COMMENT '产品描述',
  `album_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '产品相册ids,如:1,2,3',
  `file_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '产品附件ids,如:1,2,3',
  `stock` int(11) NOT NULL DEFAULT 0 COMMENT '库存',
  `is_object` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否是实物,1是2不是',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：0禁用 1启用',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='产品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_product`
--

LOCK TABLES `oa_product` WRITE;
/*!40000 ALTER TABLE `oa_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_product_cate`
--

DROP TABLE IF EXISTS `oa_product_cate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_product_cate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '分类名称',
  `pid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '分类id',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序：越大越靠前',
  `desc` varchar(1000) DEFAULT '' COMMENT '分类说明',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：-1删除 0禁用 1启用',
  `admin_id` int(11) NOT NULL DEFAULT 0 COMMENT '创建人',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='产品分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_product_cate`
--

LOCK TABLES `oa_product_cate` WRITE;
/*!40000 ALTER TABLE `oa_product_cate` DISABLE KEYS */;
INSERT INTO `oa_product_cate` VALUES
(1,'产品分类一',0,0,'',1,0,1733385454,0),
(2,'产品分类二',0,0,'',1,0,1733385467,0);
/*!40000 ALTER TABLE `oa_product_cate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_project`
--

DROP TABLE IF EXISTS `oa_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_project` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '项目名称',
  `code` varchar(255) NOT NULL DEFAULT '' COMMENT '项目编号',
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '项目金额',
  `score` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '项目评分',
  `importance` int(2) unsigned NOT NULL DEFAULT 0 COMMENT '项目重要程度:1一般,2重要,3非常重要',
  `cate_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '分类ID',
  `customer_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '关联客户ID',
  `contract_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '关联合同协议ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '创建人',
  `director_uid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '项目负责人',
  `did` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '项目所属部门',
  `uids` varchar(500) NOT NULL DEFAULT '' COMMENT '项目参与人',
  `start_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '项目开始时间',
  `end_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '项目结束时间',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：0未设置,1未开始,2进行中,3已完成,4已关闭',
  `content` mediumtext DEFAULT NULL COMMENT '项目描述',
  `create_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '修改时间',
  `delete_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1072 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='项目表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_project`
--

LOCK TABLES `oa_project` WRITE;
/*!40000 ALTER TABLE `oa_project` DISABLE KEYS */;
INSERT INTO `oa_project` VALUES
(1068,'智慧社区一期建设','PRJ2026-01',860000.00,0,1,1,0,0,1,9,6,'9,14,18',1784476800,1798560000,2,'',1784476800,1784476800,0),
(1069,'冠林云 2.1 迭代研发','PRJ2026-02',0.00,0,1,1,0,0,1,9,6,'9,12,13',1785513600,1789142400,1,'',1785513600,1785513600,0),
(1070,'华信集团二期（移动审批）','PRJ2026-03',320000.00,0,0,1,1152,1090,1,14,11,'14,12,18',1788969600,1799942400,2,'',1788969600,1788969600,0),
(1071,'官网品牌站改版','PRJ2026-04',60000.00,0,1,1,0,0,1,11,4,'11,12',1786723200,1788969600,0,'',1786723200,1786723200,0);
/*!40000 ALTER TABLE `oa_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_project_cate`
--

DROP TABLE IF EXISTS `oa_project_cate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_project_cate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '项目类别名称',
  `sort` int(10) NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：-1删除 0禁用 1启用',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='项目类别';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_project_cate`
--

LOCK TABLES `oa_project_cate` WRITE;
/*!40000 ALTER TABLE `oa_project_cate` DISABLE KEYS */;
INSERT INTO `oa_project_cate` VALUES
(1,'项目分类一',0,1,1733385561,0,0),
(2,'项目分类二',0,1,1733385567,0,0);
/*!40000 ALTER TABLE `oa_project_cate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_project_document`
--

DROP TABLE IF EXISTS `oa_project_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_project_document` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '关联项目id',
  `admin_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '创建人',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `did` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '所属部门',
  `file_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '附件ids',
  `content` mediumtext DEFAULT NULL COMMENT '文档内容',
  `md_content` mediumtext DEFAULT NULL COMMENT 'markdown文档内容',
  `create_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '修改时间',
  `delete_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='项目文档表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_project_document`
--

LOCK TABLES `oa_project_document` WRITE;
/*!40000 ALTER TABLE `oa_project_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_project_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_project_file`
--

DROP TABLE IF EXISTS `oa_project_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_project_file` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(100) NOT NULL DEFAULT '' COMMENT '模块',
  `topic_id` int(11) unsigned NOT NULL COMMENT '关联主题id',
  `file_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '相关联附件id',
  `admin_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '创建人',
  `create_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '修改时间',
  `delete_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='项目附件关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_project_file`
--

LOCK TABLES `oa_project_file` WRITE;
/*!40000 ALTER TABLE `oa_project_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_project_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_project_step`
--

DROP TABLE IF EXISTS `oa_project_step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_project_step` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL COMMENT '关联ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '阶段名称',
  `director_uid` int(11) NOT NULL DEFAULT 0 COMMENT '阶段负责人ID',
  `uids` varchar(500) NOT NULL DEFAULT '' COMMENT '阶段成员ID (使用逗号隔开) 1,2,3',
  `sort` tinyint(4) NOT NULL DEFAULT 0 COMMENT '排序ID',
  `is_current` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否是当前阶段',
  `start_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '开始时间',
  `end_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '结束时间',
  `remark` varchar(500) NOT NULL DEFAULT '' COMMENT '阶段说明',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '修改时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='项目阶段步骤表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_project_step`
--

LOCK TABLES `oa_project_step` WRITE;
/*!40000 ALTER TABLE `oa_project_step` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_project_step` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_project_step_record`
--

DROP TABLE IF EXISTS `oa_project_step_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_project_step_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT 0 COMMENT '关联项目ID',
  `step_id` int(11) NOT NULL DEFAULT 0 COMMENT '阶段步骤ID',
  `check_uid` int(11) NOT NULL DEFAULT 0 COMMENT '确认人ID',
  `check_time` bigint(11) NOT NULL COMMENT '确认时间',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1审核通过2审核拒绝3撤销',
  `content` varchar(500) NOT NULL DEFAULT '' COMMENT '操作意见',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='项目阶段步骤记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_project_step_record`
--

LOCK TABLES `oa_project_step_record` WRITE;
/*!40000 ALTER TABLE `oa_project_step_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_project_step_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_project_task`
--

DROP TABLE IF EXISTS `oa_project_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_project_task` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '主题',
  `pid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '父级任务id',
  `before_task` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '前置任务id',
  `project_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '关联项目id',
  `work_id` int(1) NOT NULL DEFAULT 0 COMMENT '关联工作类型',
  `step_id` int(1) NOT NULL DEFAULT 0 COMMENT '关联项目阶段',
  `plan_hours` decimal(10,1) NOT NULL DEFAULT 0.0 COMMENT '预估工时',
  `end_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '预计结束时间',
  `over_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '实际结束时间',
  `admin_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '创建人',
  `director_uid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '指派给(负责人)',
  `did` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '所属部门',
  `assist_admin_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '协助人员，如:1,2,3',
  `priority` tinyint(1) NOT NULL DEFAULT 1 COMMENT '优先级:1低,2中,3高,4紧急',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '任务状态：1待办的,2进行中,3已完成,4已拒绝,5已关闭',
  `done_ratio` int(2) NOT NULL DEFAULT 0 COMMENT '完成进度：0,20,40,50,60,80',
  `content` mediumtext DEFAULT NULL COMMENT '任务描述',
  `create_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '修改时间',
  `delete_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='项目任务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_project_task`
--

LOCK TABLES `oa_project_task` WRITE;
/*!40000 ALTER TABLE `oa_project_task` DISABLE KEYS */;
INSERT INTO `oa_project_task` VALUES
(1153,'门禁子系统接口开发',0,0,1068,0,0,16.0,1788883200,0,13,13,0,'',2,1,60,'',1789142400,1789142400,0),
(1154,'访客模块交互设计定稿',0,0,1068,0,0,16.0,1788969600,0,12,12,0,'',1,1,80,'',1788969600,1788969600,0),
(1155,'智慧社区项目 WBS 分解确认',0,0,1068,0,0,16.0,1788537600,0,14,14,0,'',2,2,100,'',1788537600,1788537600,0),
(1156,'智能审批规则引擎联调',0,0,1069,0,0,16.0,1788969600,0,13,13,0,'',2,1,40,'',1789401600,1789401600,0),
(1157,'2.1 移动端 UI 走查',0,0,1069,0,0,16.0,1789660800,0,12,12,0,'',1,0,0,'',1789660800,1789660800,0),
(1158,'二期需求规格说明书编写',0,0,1070,0,0,16.0,1789747200,0,14,14,0,'',2,1,30,'',1789747200,1789747200,0),
(1159,'华信二期实施计划排期',0,0,1070,0,0,16.0,1789488000,0,18,18,0,'',1,0,0,'',1789488000,1789488000,0),
(1160,'官网首页视觉稿第二版',0,0,1071,0,0,16.0,1788883200,0,12,12,0,'',1,1,70,'',1788883200,1788883200,0),
(1161,'官网 CMS 后台配置',0,0,1071,0,0,16.0,1789574400,0,13,13,0,'',0,0,0,'',1789574400,1789574400,0);
/*!40000 ALTER TABLE `oa_project_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_project_user`
--

DROP TABLE IF EXISTS `oa_project_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_project_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '项目成员id',
  `project_id` int(11) unsigned NOT NULL COMMENT '关联项目id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '成员姓名',
  `role` varchar(255) NOT NULL DEFAULT '' COMMENT '担任项目角色',
  `mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '手机号码',
  `company` varchar(255) NOT NULL DEFAULT '' COMMENT '所在公司',
  `enter_time` varchar(255) NOT NULL DEFAULT '' COMMENT '入驻项目日期',
  `admin_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '创建人',
  `create_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '创建时间',
  `delete_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '移除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='项目成员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_project_user`
--

LOCK TABLES `oa_project_user` WRITE;
/*!40000 ALTER TABLE `oa_project_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_project_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_property`
--

DROP TABLE IF EXISTS `oa_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_property` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `code` varchar(100) NOT NULL DEFAULT '' COMMENT '编号',
  `thumb` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '缩略图',
  `cate_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '资产分类id',
  `brand_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '品牌名称',
  `unit_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '单位',
  `quality_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '质保到期日期',
  `buy_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '购进日期',
  `price` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '价格',
  `rate` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '年折旧率',
  `model` varchar(255) NOT NULL DEFAULT '' COMMENT '规格型号',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '所放位置',
  `user_dids` varchar(255) NOT NULL DEFAULT '' COMMENT '使用部门',
  `user_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '使用人员',
  `content` mediumtext DEFAULT NULL COMMENT '资产描述',
  `file_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '资产附件ids,如:1,2,3',
  `source` tinyint(1) NOT NULL DEFAULT 1 COMMENT '来源：1采购,2赠与,3自产,4其他',
  `purchase_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '采购单ID',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态：0闲置,1在用,2维修,3报废,4丢失',
  `admin_id` int(11) NOT NULL DEFAULT 0 COMMENT '创建人',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_id` int(11) NOT NULL DEFAULT 0 COMMENT '编辑人',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='资产表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_property`
--

LOCK TABLES `oa_property` WRITE;
/*!40000 ALTER TABLE `oa_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_property_brand`
--

DROP TABLE IF EXISTS `oa_property_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_property_brand` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '品牌名称',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序：越大越靠前',
  `desc` varchar(1000) DEFAULT '' COMMENT '描述',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：-1删除 0禁用 1启用',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='资产品牌';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_property_brand`
--

LOCK TABLES `oa_property_brand` WRITE;
/*!40000 ALTER TABLE `oa_property_brand` DISABLE KEYS */;
INSERT INTO `oa_property_brand` VALUES
(1,'品牌一',0,'',1,1733385289,0),
(2,'品牌二',0,'',1,1733385289,0);
/*!40000 ALTER TABLE `oa_property_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_property_cate`
--

DROP TABLE IF EXISTS `oa_property_cate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_property_cate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '分类名称',
  `pid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '分类id',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序：越大越靠前',
  `desc` varchar(1000) DEFAULT '' COMMENT '分类说明',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：-1删除 0禁用 1启用',
  `admin_id` int(11) NOT NULL DEFAULT 0 COMMENT '创建人',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='资产分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_property_cate`
--

LOCK TABLES `oa_property_cate` WRITE;
/*!40000 ALTER TABLE `oa_property_cate` DISABLE KEYS */;
INSERT INTO `oa_property_cate` VALUES
(1,'计算机',0,0,'',1,0,1733384708,1733385234),
(2,'网络设备',0,0,'',1,0,1733385274,0);
/*!40000 ALTER TABLE `oa_property_cate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_property_repair`
--

DROP TABLE IF EXISTS `oa_property_repair`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_property_repair` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `property_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '资产id',
  `repair_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '维修日期',
  `cost` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '维修费用',
  `content` mediumtext DEFAULT NULL COMMENT '维修原因',
  `file_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '附件ids,如:1,2,3',
  `director_id` int(11) NOT NULL DEFAULT 0 COMMENT '跟进人',
  `admin_id` int(11) NOT NULL DEFAULT 0 COMMENT '创建人',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='资产维修记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_property_repair`
--

LOCK TABLES `oa_property_repair` WRITE;
/*!40000 ALTER TABLE `oa_property_repair` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_property_repair` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_property_unit`
--

DROP TABLE IF EXISTS `oa_property_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_property_unit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '单位名称',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序：越大越靠前',
  `desc` varchar(1000) DEFAULT '' COMMENT '描述',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：-1删除 0禁用 1启用',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='资产单位';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_property_unit`
--

LOCK TABLES `oa_property_unit` WRITE;
/*!40000 ALTER TABLE `oa_property_unit` DISABLE KEYS */;
INSERT INTO `oa_property_unit` VALUES
(1,'台',0,'',1,1733385300,0),
(2,'只',0,'',1,1733385307,0),
(3,'个',0,'',1,1733385313,0),
(4,'瓶',0,'',1,1733385321,0),
(5,'盒',0,'',1,1733385328,0),
(6,'箱',0,'',1,1733385333,0);
/*!40000 ALTER TABLE `oa_property_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_purchase`
--

DROP TABLE IF EXISTS `oa_purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_purchase` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '父协议id',
  `code` varchar(255) NOT NULL DEFAULT '' COMMENT '合同编号',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '合同名称',
  `cate_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '分类id',
  `types` tinyint(1) NOT NULL DEFAULT 1 COMMENT '合同性质:1普通采购2物品采购3服务采购',
  `subject_id` varchar(255) NOT NULL DEFAULT '' COMMENT '签约主体',
  `supplier_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '关联供应商ID',
  `supplier` varchar(255) NOT NULL DEFAULT '' COMMENT '供应商名称',
  `contact_name` varchar(255) NOT NULL DEFAULT '' COMMENT '供应商代表',
  `contact_mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '供应商电话',
  `contact_address` varchar(255) NOT NULL DEFAULT '' COMMENT '供应商地址',
  `start_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '合同开始时间',
  `end_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '合同结束时间',
  `admin_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '创建人',
  `prepared_uid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '合同制定人',
  `sign_uid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '合同签订人',
  `keeper_uid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '合同保管人',
  `share_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '共享人员，如:1,2,3',
  `file_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '相关附件，如:1,2,3',
  `seal_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '盖章合同附件，如:1,2,3',
  `sign_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '合同签订时间',
  `did` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '合同所属部门',
  `cost` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '合同金额',
  `content` mediumtext DEFAULT NULL COMMENT '合同内容',
  `stop_uid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '中止人',
  `stop_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '中止时间',
  `stop_remark` mediumtext DEFAULT NULL COMMENT '中止备注信息',
  `void_uid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '作废人',
  `void_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '作废时间',
  `void_remark` mediumtext DEFAULT NULL COMMENT '作废备注信息',
  `archive_uid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '归档人',
  `archive_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '归档时间',
  `remark` mediumtext DEFAULT NULL COMMENT '备注信息',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '修改时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  `check_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '审核状态:0待审核,1审核中,2审核通过,3审核不通过,4撤销审核',
  `check_flow_id` int(11) NOT NULL DEFAULT 0 COMMENT '审核流程id',
  `check_step_sort` int(11) NOT NULL DEFAULT 0 COMMENT '当前审批步骤',
  `check_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '当前审批人ID，如:1,2,3',
  `check_last_uid` varchar(500) NOT NULL DEFAULT '' COMMENT '上一审批人',
  `check_history_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '历史审批人ID，如:1,2,3',
  `check_copy_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '抄送人ID，如:1,2,3',
  `check_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '审核通过时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1054 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='采购合同表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_purchase`
--

LOCK TABLES `oa_purchase` WRITE;
/*!40000 ALTER TABLE `oa_purchase` DISABLE KEYS */;
INSERT INTO `oa_purchase` VALUES
(1051,0,'CG2026-001','用友财务软件年度授权采购',2,1,'0',0,'用友网络科技股份有限公司','','','',1787191200,1790524800,6,0,0,0,'','','',1787191200,3,42000.00,'',0,0,NULL,0,0,NULL,0,0,'',1787184000,1787184000,0,2,12,0,'','','3,8','',0),
(1052,0,'CG2026-002','研发部开发笔记本采购（8台）',2,1,'0',0,'联想（北京）信息技术有限公司','','','',1788674400,1820210400,9,0,0,0,'','','',1788674400,6,56000.00,'',0,0,NULL,0,0,NULL,0,0,'',1788667200,1788667200,0,1,12,1,'8','','3','',0),
(1053,0,'CG2026-003','办公楼宇物业管理服务续约',2,1,'0',0,'万科物业服务有限公司','','','',1788829200,1820365200,5,0,0,0,'','','',1788829200,1,156000.00,'',0,0,NULL,0,0,NULL,0,0,'',1788822000,1788822000,0,1,12,0,'3','','','',0);
/*!40000 ALTER TABLE `oa_purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_purchase_product`
--

DROP TABLE IF EXISTS `oa_purchase_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_purchase_product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '合同id',
  `product_price_type` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '执行价格方式',
  `product_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '商品id',
  `product_price` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '商品单价',
  `product_num` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '商品数量',
  `product_total` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '商品小计',
  `product_remark` varchar(500) NOT NULL DEFAULT '' COMMENT '商品备注',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='采购合同产品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_purchase_product`
--

LOCK TABLES `oa_purchase_product` WRITE;
/*!40000 ALTER TABLE `oa_purchase_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_purchase_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_purchase_service`
--

DROP TABLE IF EXISTS `oa_purchase_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_purchase_service` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '合同id',
  `service_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '服务id',
  `service_price` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '服务单价',
  `service_num` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '服务次数',
  `service_total` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '服务小计',
  `service_remark` varchar(500) NOT NULL DEFAULT '' COMMENT '服务备注',
  `start_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '服务开始时间',
  `end_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '服务结束时间',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='采购合同服务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_purchase_service`
--

LOCK TABLES `oa_purchase_service` WRITE;
/*!40000 ALTER TABLE `oa_purchase_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_purchase_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_purchased`
--

DROP TABLE IF EXISTS `oa_purchased`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_purchased` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '采购品名称',
  `cate_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '采购分类id',
  `thumb` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '缩略图id',
  `code` varchar(255) NOT NULL DEFAULT '' COMMENT '产品编码',
  `barcode` varchar(255) NOT NULL DEFAULT '' COMMENT '条形码',
  `unit` varchar(100) NOT NULL DEFAULT '' COMMENT '单位',
  `specs` varchar(100) NOT NULL DEFAULT '' COMMENT '规格',
  `brand` varchar(100) NOT NULL DEFAULT '' COMMENT '品牌',
  `producer` varchar(100) NOT NULL DEFAULT '' COMMENT '生产商',
  `purchase_price` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '采购价',
  `sale_price` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '销售价',
  `content` text DEFAULT NULL COMMENT '商品描述',
  `album_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '采购品相册ids,如:1,2,3',
  `file_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '采购品附件ids,如:1,2,3',
  `stock` int(11) NOT NULL DEFAULT 0 COMMENT '库存',
  `is_object` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否是实物,1是2不是',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：0禁用 1启用',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='采购品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_purchased`
--

LOCK TABLES `oa_purchased` WRITE;
/*!40000 ALTER TABLE `oa_purchased` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_purchased` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_purchased_cate`
--

DROP TABLE IF EXISTS `oa_purchased_cate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_purchased_cate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '分类名称',
  `pid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '分类id',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序：越大越靠前',
  `desc` varchar(1000) DEFAULT '' COMMENT '分类说明',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：-1删除 0禁用 1启用',
  `admin_id` int(11) NOT NULL DEFAULT 0 COMMENT '创建人',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='采购品分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_purchased_cate`
--

LOCK TABLES `oa_purchased_cate` WRITE;
/*!40000 ALTER TABLE `oa_purchased_cate` DISABLE KEYS */;
INSERT INTO `oa_purchased_cate` VALUES
(1,'采购品分类一',0,0,'',1,0,1733385535,0),
(2,'采购品分类二',0,0,'',1,0,1733385542,0);
/*!40000 ALTER TABLE `oa_purchased_cate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_receive_docs`
--

DROP TABLE IF EXISTS `oa_receive_docs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_receive_docs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '收文主题',
  `number_id` int(11) NOT NULL DEFAULT 0 COMMENT '收文字号',
  `code` varchar(100) NOT NULL DEFAULT '' COMMENT '收文编号',
  `secrets` int(2) NOT NULL DEFAULT 1 COMMENT '密级程度:1公开,2秘密,3机密',
  `urgency` int(2) NOT NULL DEFAULT 1 COMMENT '紧急程度:1普通,2紧急,3加急',
  `send_dids` varchar(255) NOT NULL DEFAULT '' COMMENT '来文单位',
  `receive_dids` varchar(255) NOT NULL DEFAULT '' COMMENT '接受单位',
  `share_uids` varchar(255) NOT NULL DEFAULT '' COMMENT '分享查阅uid',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '主题关键词',
  `content` mediumtext DEFAULT NULL COMMENT '公文内容',
  `file_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '公文文件ids,如:1,2,3',
  `receive_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '来文日期',
  `admin_id` int(11) NOT NULL DEFAULT 0 COMMENT '登记人',
  `did` int(11) NOT NULL DEFAULT 0 COMMENT '接受单位',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  `check_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '审核状态:0待审核,1审核中,2审核通过,3审核不通过,4撤销审核',
  `check_flow_id` int(11) NOT NULL DEFAULT 0 COMMENT '审核流程id',
  `check_step_sort` int(11) NOT NULL DEFAULT 0 COMMENT '当前审批步骤',
  `check_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '当前审批人ID，如:1,2,3',
  `check_last_uid` varchar(500) NOT NULL DEFAULT '' COMMENT '上一审批人',
  `check_history_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '历史审批人ID，如:1,2,3',
  `check_copy_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '抄送人ID，如:1,2,3',
  `check_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '审核通过时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='收文表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_receive_docs`
--

LOCK TABLES `oa_receive_docs` WRITE;
/*!40000 ALTER TABLE `oa_receive_docs` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_receive_docs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_regulation`
--

DROP TABLE IF EXISTS `oa_regulation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_regulation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '制度名称',
  `cate_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '制度分类id',
  `use_dids` varchar(500) NOT NULL DEFAULT '' COMMENT '试用部门',
  `content` text DEFAULT NULL COMMENT '制度内容',
  `file_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '产品附件ids,如:1,2,3',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：0禁用 1启用',
  `admin_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '创建人',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='制度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_regulation`
--

LOCK TABLES `oa_regulation` WRITE;
/*!40000 ALTER TABLE `oa_regulation` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_regulation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_regulation_cate`
--

DROP TABLE IF EXISTS `oa_regulation_cate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_regulation_cate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '分类名称',
  `pid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '分类id',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序：越大越靠前',
  `desc` varchar(1000) DEFAULT '' COMMENT '分类说明',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：-1删除 0禁用 1启用',
  `admin_id` int(11) NOT NULL DEFAULT 0 COMMENT '创建人',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='制度分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_regulation_cate`
--

LOCK TABLES `oa_regulation_cate` WRITE;
/*!40000 ALTER TABLE `oa_regulation_cate` DISABLE KEYS */;
INSERT INTO `oa_regulation_cate` VALUES
(1,'治理类',0,0,'',1,0,1733384708,1733385234),
(2,'人事类',0,0,'',1,0,1733385274,0),
(3,'行政类',0,0,'',1,0,1733385274,0),
(4,'财务类',0,0,'',1,0,1733385274,0),
(5,'信息安全',0,0,'',1,0,1733385274,0),
(6,'业务销售',0,0,'',1,0,1733385274,0),
(7,'采购仓储',0,0,'',1,0,1733385274,0),
(8,'生产研发',0,0,'',1,0,1733385274,0);
/*!40000 ALTER TABLE `oa_regulation_cate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_rewards`
--

DROP TABLE IF EXISTS `oa_rewards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_rewards` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '员工ID',
  `types` int(1) NOT NULL DEFAULT 0 COMMENT '奖罚类型:1奖励2惩罚',
  `rewards_cate` int(11) NOT NULL DEFAULT 0 COMMENT '奖罚项目',
  `rewards_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '奖罚日期',
  `cost` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '金额',
  `thing` varchar(255) NOT NULL DEFAULT '' COMMENT '物品',
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '状态:1未执行2已执行',
  `file_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '附件',
  `remark` mediumtext DEFAULT NULL COMMENT '备注说明',
  `admin_id` int(11) NOT NULL DEFAULT 0 COMMENT '创建人',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '修改时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='员工奖罚表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_rewards`
--

LOCK TABLES `oa_rewards` WRITE;
/*!40000 ALTER TABLE `oa_rewards` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_rewards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_rewards_cate`
--

DROP TABLE IF EXISTS `oa_rewards_cate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_rewards_cate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '奖罚项目名称',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：-1删除 0禁用 1启用',
  `create_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='奖罚项目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_rewards_cate`
--

LOCK TABLES `oa_rewards_cate` WRITE;
/*!40000 ALTER TABLE `oa_rewards_cate` DISABLE KEYS */;
INSERT INTO `oa_rewards_cate` VALUES
(1,'生日福利',1,1637987189,0),
(2,'节日福利',1,1637987199,0),
(3,'迟到扣款',1,1638088518,0),
(4,'全勤奖励',1,1637987199,0),
(5,'表现优秀',1,1637987199,0),
(6,'违规操作',1,1637987199,0);
/*!40000 ALTER TABLE `oa_rewards_cate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_salary`
--

DROP TABLE IF EXISTS `oa_salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_salary` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `month_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '工资月份',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '工资单标题',
  `exclude_uids` varchar(255) NOT NULL DEFAULT '' COMMENT '排除人员',
  `enterprise_id` int(11) NOT NULL DEFAULT 0 COMMENT '发放工资企业主体id',
  `account_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '资金账户ID',
  `paytype_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '支付方式',
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '总金额',
  `salary` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '总工资',
  `social` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '总社保',
  `gongjijin` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '总公积金',
  `tax` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '总个税',
  `status` int(1) NOT NULL DEFAULT 0 COMMENT '状态:0待发放,1已发放',
  `pay_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '发放时间',
  `pay_uid` int(11) NOT NULL DEFAULT 0 COMMENT '发放人',
  `admin_id` int(11) NOT NULL DEFAULT 0 COMMENT '创建人',
  `check_uid` int(11) NOT NULL DEFAULT 0 COMMENT '工资审核人',
  `check_time` bigint(11) NOT NULL DEFAULT 0,
  `create_time` bigint(11) NOT NULL DEFAULT 0,
  `update_time` bigint(11) NOT NULL DEFAULT 0,
  `delete_time` bigint(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='薪资单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_salary`
--

LOCK TABLES `oa_salary` WRITE;
/*!40000 ALTER TABLE `oa_salary` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_salary_records`
--

DROP TABLE IF EXISTS `oa_salary_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_salary_records` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `salary_id` int(11) NOT NULL DEFAULT 0 COMMENT '工资单id',
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '关联员工id',
  `bank` varchar(255) NOT NULL DEFAULT '' COMMENT '银行卡所属银行',
  `bank_no` varchar(255) NOT NULL DEFAULT '' COMMENT '银行卡号',
  `month_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '工资月份',
  `salary_basic` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '基本工资',
  `salary_position` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '岗位工资',
  `salary_performance` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '绩效工资',
  `salary_quanqin` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '全勤奖金',
  `salary_overwork` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '加班工资',
  `salary_meal` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '用餐补贴',
  `salary_phone` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '话费补贴',
  `salary_traffic` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '交通补贴',
  `salary_house` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '住房补贴',
  `salary_fuli` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '节假福利',
  `salary_protecting` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '保竞津贴',
  `salary_bonus` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '奖金',
  `deduct_belate` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '迟到扣除',
  `deduct_leave` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '事假扣除',
  `deduct_absenteeism` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '旷工扣除',
  `deduct_social` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '社保',
  `deduct_gongjijin` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '公积金',
  `deduct_tax` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '个税',
  `total_payable` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '应发工资',
  `total_deduction` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '应扣工资',
  `total_statutory` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '代扣代缴',
  `total_payment` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '实发工资',
  `remark` text DEFAULT NULL COMMENT '备注信息',
  `status` int(1) NOT NULL DEFAULT 0 COMMENT '状态:0待发放,1已发放',
  `pay_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '发放时间',
  `check_uid` int(11) NOT NULL DEFAULT 0 COMMENT '确认人id',
  `check_time` bigint(11) NOT NULL DEFAULT 0,
  `create_time` bigint(11) NOT NULL DEFAULT 0,
  `update_time` bigint(11) NOT NULL DEFAULT 0,
  `delete_time` bigint(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='员工月工资表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_salary_records`
--

LOCK TABLES `oa_salary_records` WRITE;
/*!40000 ALTER TABLE `oa_salary_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_salary_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_schedule`
--

DROP TABLE IF EXISTS `oa_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_schedule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '工作日志主题',
  `cid` int(11) unsigned NOT NULL DEFAULT 1 COMMENT '预设字段:关联工作内容类型ID',
  `cmid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '预设字段:关联客户ID',
  `ptid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '预设字段:关联项目ID',
  `tid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '预设字段:关联任务ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '关联创建员工ID',
  `did` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '所属部门',
  `start_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '开始时间',
  `end_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '结束时间',
  `labor_time` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '工时',
  `labor_type` int(1) NOT NULL DEFAULT 0 COMMENT '工作类型:1案头2外勤',
  `remark` text NOT NULL COMMENT '描述',
  `file_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '相关附件',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1012 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='工作日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_schedule`
--

LOCK TABLES `oa_schedule` WRITE;
/*!40000 ALTER TABLE `oa_schedule` DISABLE KEYS */;
INSERT INTO `oa_schedule` VALUES
(1000,'冠林云 2.0 迭代需求评审',1,0,0,0,9,6,1788744600,1788753600,2.50,1,'与产品组过 v2.1 需求清单，明确智能审批模块排期。','',0,1788744600,1788744600),
(1001,'智慧社区项目原型细化',1,0,0,0,14,11,1788760800,1788775200,4.00,1,'完成门禁与访客模块交互原型 v0.3。','',0,1788760800,1788760800),
(1002,'客户拜访：华信集团',1,0,0,0,15,8,1788760800,1788773400,3.50,2,'洽谈 Q4 续约与新模块试用，客户意向积极。','',0,1788760800,1788760800),
(1003,'客服工单周度复盘',1,0,0,0,17,7,1788829200,1788832800,1.00,1,'上周工单 214 单，满意度 96.2%，重点跟进 3 单超时。','',0,1788829200,1788829200),
(1004,'移动端审批页联调',1,0,0,0,12,11,1788832800,1788840000,2.00,1,'与前端对齐消息推送格式，修复 2 个展示缺陷。','',0,1788832800,1788832800),
(1005,'技术部内部培训：代码规范',1,0,0,0,9,6,1788854400,1788859800,1.50,1,'主讲 PHP 编码规范与 Code Review 流程。','',0,1788854400,1788854400),
(1006,'Q4 推广方案初稿',1,0,0,0,11,4,1788915600,1788926400,3.00,1,'输出双 11 活动框架，预算初估 8 万元。','',0,1788915600,1788915600),
(1007,'9 月招聘专场协调',1,0,0,0,5,2,1788933600,1788940800,2.00,1,'对接猎头与内推奖励方案，重点补前端与销售岗。','',0,1788933600,1788933600),
(1008,'8 月费用账务复核',1,0,0,0,6,3,1789002000,1789012800,3.00,1,'完成 87 笔凭证复核，2 笔待补充发票。','',0,1789002000,1789002000),
(1009,'员工体检机构对接',1,0,0,0,16,2,1789020000,1789027200,2.00,2,'比价两家机构，拟定年度体检方案报 CFO 审批。','',0,1789020000,1789020000),
(1010,'客户反馈整理与归类',1,0,0,0,18,11,1789088400,1789095600,2.00,1,'汇总 9 月上旬客户反馈 42 条，输出优化清单给产品组。','',0,1789088400,1789088400),
(1011,'接口性能优化',1,0,0,0,13,13,1789106400,1789120800,4.00,1,'审批列表接口 P95 从 1.8s 优化至 420ms。','',0,1789106400,1789106400);
/*!40000 ALTER TABLE `oa_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_seal`
--

DROP TABLE IF EXISTS `oa_seal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_seal` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '用章申请主题',
  `seal_cate_id` int(11) NOT NULL DEFAULT 0 COMMENT '印章类型',
  `content` mediumtext DEFAULT NULL COMMENT '盖章内容',
  `file_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '附件ids,如:1,2,3',
  `did` int(11) NOT NULL DEFAULT 0 COMMENT '用印部门',
  `num` int(11) NOT NULL DEFAULT 0 COMMENT '盖章次数',
  `use_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '预期用印日期',
  `is_borrow` int(1) NOT NULL DEFAULT 0 COMMENT '印章是否外借:0,1',
  `start_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '印章借用日期',
  `end_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '结束借用日期',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态:0待使用,1已使用(已外借),2已结束归还',
  `admin_id` int(11) NOT NULL DEFAULT 0 COMMENT '创建人',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  `check_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '审核状态:0待审核,1审核中,2审核通过,3审核不通过,4撤销审核',
  `check_flow_id` int(11) NOT NULL DEFAULT 0 COMMENT '审核流程id',
  `check_step_sort` int(11) NOT NULL DEFAULT 0 COMMENT '当前审批步骤',
  `check_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '当前审批人ID，如:1,2,3',
  `check_last_uid` varchar(500) NOT NULL DEFAULT '' COMMENT '上一审批人',
  `check_history_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '历史审批人ID，如:1,2,3',
  `check_copy_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '抄送人ID，如:1,2,3',
  `check_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '审核通过时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1006 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用章申请表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_seal`
--

LOCK TABLES `oa_seal` WRITE;
/*!40000 ALTER TABLE `oa_seal` DISABLE KEYS */;
INSERT INTO `oa_seal` VALUES
(1003,'蓝海教育合同用章',1,'','',8,1,1788850800,0,1788850800,0,0,4,1788850800,1788850800,0,1,5,0,'3','','','',0),
(1004,'云帆网络合同用章',1,'','',8,1,1787886000,0,1787886000,0,0,3,1787886000,1787886000,0,2,5,0,'','','3,8','',0),
(1005,'招投标文件用章',1,'','',8,1,1788573600,0,1788573600,0,0,15,1788573600,1788573600,0,2,5,0,'','','3,8','',0);
/*!40000 ALTER TABLE `oa_seal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_seal_cate`
--

DROP TABLE IF EXISTS `oa_seal_cate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_seal_cate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '印章名称',
  `dids` varchar(255) NOT NULL DEFAULT '' COMMENT '应用部门',
  `keep_uid` int(11) NOT NULL DEFAULT 0 COMMENT '保管人',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：-1删除 0禁用 1启用',
  `remark` varchar(1000) DEFAULT '' COMMENT '用途简述',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='印章类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_seal_cate`
--

LOCK TABLES `oa_seal_cate` WRITE;
/*!40000 ALTER TABLE `oa_seal_cate` DISABLE KEYS */;
INSERT INTO `oa_seal_cate` VALUES
(1,'合同章','',2,1,'',1733385406,0);
/*!40000 ALTER TABLE `oa_seal_cate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_send_docs`
--

DROP TABLE IF EXISTS `oa_send_docs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_send_docs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '发文主题',
  `number_id` int(11) NOT NULL DEFAULT 0 COMMENT '发文字号',
  `code` varchar(100) NOT NULL DEFAULT '' COMMENT '发文编号',
  `secrets` int(2) NOT NULL DEFAULT 1 COMMENT '密级程度:1公开,2秘密,3机密',
  `urgency` int(2) NOT NULL DEFAULT 1 COMMENT '紧急程度:1普通,2紧急,3加急',
  `types` int(2) NOT NULL DEFAULT 1 COMMENT '类型:1内部发文,2外部发文',
  `send_dids` varchar(255) NOT NULL DEFAULT '' COMMENT '主送单位',
  `copy_dids` varchar(255) NOT NULL DEFAULT '' COMMENT '抄送单位',
  `share_uids` varchar(255) NOT NULL DEFAULT '' COMMENT '分享查阅uid',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '主题关键词',
  `desc` varchar(500) NOT NULL DEFAULT '' COMMENT '拟办意见',
  `content` mediumtext DEFAULT NULL COMMENT '发文内容',
  `file_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '公文文件ids,如:1,2,3',
  `draft_uid` int(11) NOT NULL DEFAULT 0 COMMENT '拟稿人',
  `did` int(11) NOT NULL DEFAULT 0 COMMENT '拟稿部门',
  `draft_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '拟稿日期',
  `admin_id` int(11) NOT NULL DEFAULT 0 COMMENT '创建人',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  `check_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '审核状态:0待审核,1审核中,2审核通过,3审核不通过,4撤销审核',
  `check_flow_id` int(11) NOT NULL DEFAULT 0 COMMENT '审核流程id',
  `check_step_sort` int(11) NOT NULL DEFAULT 0 COMMENT '当前审批步骤',
  `check_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '当前审批人ID，如:1,2,3',
  `check_last_uid` varchar(500) NOT NULL DEFAULT '' COMMENT '上一审批人',
  `check_history_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '历史审批人ID，如:1,2,3',
  `check_copy_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '抄送人ID，如:1,2,3',
  `check_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '审核通过时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='发文表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_send_docs`
--

LOCK TABLES `oa_send_docs` WRITE;
/*!40000 ALTER TABLE `oa_send_docs` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_send_docs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_services`
--

DROP TABLE IF EXISTS `oa_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_services` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '服务名称',
  `cate_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '服务分类id',
  `price` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '服务费用',
  `content` text DEFAULT NULL COMMENT '服务描述',
  `sort` int(10) NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：0禁用 1启用',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='服务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_services`
--

LOCK TABLES `oa_services` WRITE;
/*!40000 ALTER TABLE `oa_services` DISABLE KEYS */;
INSERT INTO `oa_services` VALUES
(1,'定制服务',0,999.00,NULL,0,1,1733385487,1733385493,0),
(2,'咨询服务',0,99.00,NULL,0,1,1733385500,0,0);
/*!40000 ALTER TABLE `oa_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_solutions`
--

DROP TABLE IF EXISTS `oa_solutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_solutions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '方案标题',
  `types` int(1) unsigned NOT NULL DEFAULT 1 COMMENT '类型:1解决方案,2变通方法',
  `cate_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '所属分类ID',
  `problems_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '关联问题',
  `director_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '所有者	',
  `hours` decimal(15,1) NOT NULL DEFAULT 0.0 COMMENT '所需工时',
  `cost` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '所需费用',
  `content` mediumtext DEFAULT NULL COMMENT '方案内容',
  `file_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '附件ids',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：1待批准,2已批准,3未批准',
  `status_remark` mediumtext DEFAULT NULL COMMENT '批准备注',
  `check_id` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '批准人',
  `check_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '批准时间',
  `admin_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '创建人',
  `update_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '最后编辑人',
  `create_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '修改时间',
  `delete_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='解决方案表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_solutions`
--

LOCK TABLES `oa_solutions` WRITE;
/*!40000 ALTER TABLE `oa_solutions` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_solutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_solutions_cate`
--

DROP TABLE IF EXISTS `oa_solutions_cate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_solutions_cate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '方案类别名称',
  `pid` int(10) NOT NULL DEFAULT 0 COMMENT '父ID',
  `sort` int(10) NOT NULL DEFAULT 0 COMMENT '排序',
  `content` mediumtext DEFAULT NULL COMMENT '描述',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：-1删除 0禁用 1启用',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='方案类别表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_solutions_cate`
--

LOCK TABLES `oa_solutions_cate` WRITE;
/*!40000 ALTER TABLE `oa_solutions_cate` DISABLE KEYS */;
INSERT INTO `oa_solutions_cate` VALUES
(1,'修复',0,0,NULL,1,1782783546,0,0),
(2,'退换',0,0,NULL,1,1782783554,0,0),
(3,'赔偿',0,0,NULL,1,1782783559,0,0),
(4,'解析说明',0,0,NULL,1,1782783580,0,0),
(5,'道歉安抚',0,0,NULL,1,1782783598,0,0);
/*!40000 ALTER TABLE `oa_solutions_cate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_step`
--

DROP TABLE IF EXISTS `oa_step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_step` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '步骤名称',
  `sort` int(10) NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：-1删除 0禁用 1启用',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='步骤表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_step`
--

LOCK TABLES `oa_step` WRITE;
/*!40000 ALTER TABLE `oa_step` DISABLE KEYS */;
INSERT INTO `oa_step` VALUES
(1,'立项阶段',0,1,1637987189,0,0),
(2,'规划阶段',0,1,1637987189,0,0),
(3,'执行阶段',0,1,1637987189,0,0),
(4,'监控与控制阶段',0,1,1637987189,0,0),
(5,'收尾阶段',0,1,1637987189,0,0);
/*!40000 ALTER TABLE `oa_step` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_supplier`
--

DROP TABLE IF EXISTS `oa_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_supplier` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '供应商名称',
  `code` varchar(255) NOT NULL DEFAULT '' COMMENT '供应商编号',
  `phone` varchar(255) NOT NULL DEFAULT '' COMMENT '供应商电话',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '供应商邮箱',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '供应商联系地址',
  `file_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '附件ids,如:1,2,3',
  `products` varchar(500) NOT NULL DEFAULT '' COMMENT '供应商商品',
  `content` text DEFAULT NULL COMMENT '供应商描述',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '供应商状态：0禁用,1启用',
  `tax_num` varchar(100) NOT NULL DEFAULT '' COMMENT '纳税人识别号',
  `tax_mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '开票电话',
  `tax_address` varchar(200) NOT NULL DEFAULT '' COMMENT '开票地址',
  `tax_bank` varchar(60) NOT NULL DEFAULT '' COMMENT '开户银行',
  `tax_banksn` varchar(60) NOT NULL DEFAULT '' COMMENT '银行帐号',
  `file_license_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '营业执照附件，如:1,2,3',
  `file_idcard_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '身份证附件，如:1,2,3',
  `file_bankcard_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '银行卡附件，如:1,2,3',
  `file_openbank_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '开户行附件，如:1,2,3',
  `tax_rate` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '税率',
  `admin_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '录入人',
  `sort` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '排序',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '修改时间',
  `delete_time` int(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='供应商表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_supplier`
--

LOCK TABLES `oa_supplier` WRITE;
/*!40000 ALTER TABLE `oa_supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_supplier_contact`
--

DROP TABLE IF EXISTS `oa_supplier_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_supplier_contact` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '供应商ID',
  `is_default` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '是否是第一联系人',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '姓名',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '用户性别:0未知,1男,2女',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号码',
  `qq` varchar(20) NOT NULL DEFAULT '' COMMENT 'QQ号',
  `wechat` varchar(100) NOT NULL DEFAULT '' COMMENT '微信号',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '邮件地址',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '称谓',
  `department` varchar(50) NOT NULL DEFAULT '' COMMENT '部门',
  `position` varchar(50) NOT NULL DEFAULT '' COMMENT '职务',
  `admin_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '创建人',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` int(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='供应商联系人表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_supplier_contact`
--

LOCK TABLES `oa_supplier_contact` WRITE;
/*!40000 ALTER TABLE `oa_supplier_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_supplier_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_talent`
--

DROP TABLE IF EXISTS `oa_talent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_talent` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '姓名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `mobile` bigint(11) NOT NULL DEFAULT 0 COMMENT '手机号码',
  `sex` int(255) NOT NULL DEFAULT 0 COMMENT '性别:1男,2女',
  `to_did` int(11) NOT NULL DEFAULT 0 COMMENT '所属部门',
  `to_dids` varchar(500) NOT NULL DEFAULT '' COMMENT '次部门',
  `thumb` varchar(255) NOT NULL COMMENT '头像',
  `position_id` int(11) NOT NULL DEFAULT 0 COMMENT '职位id',
  `type` int(1) NOT NULL DEFAULT 0 COMMENT '员工类型:0未设置,1正式,2试用,3实习',
  `position_name` int(11) NOT NULL DEFAULT 0 COMMENT '应聘职务',
  `position_rank` int(11) NOT NULL DEFAULT 0 COMMENT '应聘职级',
  `job_number` varchar(255) NOT NULL DEFAULT '' COMMENT '工号',
  `birthday` varchar(255) NOT NULL DEFAULT '' COMMENT '生日',
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '上级领导',
  `work_date` varchar(255) NOT NULL DEFAULT '' COMMENT '开始工作时间',
  `work_location` int(11) NOT NULL DEFAULT 0 COMMENT '工作地点',
  `native_place` varchar(255) NOT NULL DEFAULT '' COMMENT '籍贯',
  `nation` varchar(255) NOT NULL DEFAULT '' COMMENT '民族',
  `home_address` varchar(255) NOT NULL DEFAULT '' COMMENT '家庭地址',
  `current_address` varchar(255) NOT NULL DEFAULT '' COMMENT '现居地址',
  `contact` varchar(255) NOT NULL DEFAULT '' COMMENT '紧急联系人',
  `contact_mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '紧急联系人电话',
  `resident_type` int(1) NOT NULL DEFAULT 0 COMMENT '户口性质:1农村户口,2城镇户口',
  `resident_place` varchar(255) NOT NULL DEFAULT '' COMMENT '户口所在地',
  `graduate_school` varchar(255) NOT NULL DEFAULT '' COMMENT '毕业学校',
  `graduate_day` varchar(255) NOT NULL DEFAULT '毕业日期',
  `political` int(1) NOT NULL DEFAULT 1 COMMENT '政治面貌:1中共党员,2团员',
  `marital_status` int(1) NOT NULL DEFAULT 1 COMMENT '婚姻状况:1未婚,2已婚,3离异',
  `idcard` varchar(255) NOT NULL DEFAULT '' COMMENT '身份证',
  `education` varchar(255) NOT NULL DEFAULT '' COMMENT '学位',
  `speciality` varchar(255) NOT NULL DEFAULT '' COMMENT '专业',
  `bank_account` varchar(255) NOT NULL DEFAULT '' COMMENT '银行卡号',
  `social_account` varchar(255) NOT NULL DEFAULT '' COMMENT '社保账号',
  `salary` int(11) NOT NULL DEFAULT 0 COMMENT '期望薪资',
  `salary_remark` varchar(255) NOT NULL DEFAULT '' COMMENT '薪资备注',
  `reference_name` varchar(255) NOT NULL DEFAULT '' COMMENT '推荐人姓名',
  `reference_rel` varchar(255) NOT NULL DEFAULT '' COMMENT '推荐人关系',
  `reference_mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '推荐人联系方式',
  `file_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '档案附件',
  `desc` mediumtext DEFAULT NULL COMMENT '个人简介',
  `remark` varchar(1000) DEFAULT '' COMMENT '入职评语',
  `entry_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '入职时间',
  `is_staff` int(1) NOT NULL DEFAULT 1 COMMENT '身份类型:1普通员工,2劳务派遣',
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '状态:1正常,2已入职',
  `admin_id` int(11) NOT NULL DEFAULT 0 COMMENT '创建人',
  `did` int(11) NOT NULL DEFAULT 0 COMMENT '创建部门',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '申请时间',
  `check_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '审核状态:0待审核,1审核中,2审核通过,3审核不通过,4撤销审核',
  `check_flow_id` int(11) NOT NULL DEFAULT 0 COMMENT '审核流程id',
  `check_step_sort` int(11) NOT NULL DEFAULT 0 COMMENT '当前审批步骤',
  `check_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '当前审批人ID，如:1,2,3',
  `check_last_uid` varchar(500) NOT NULL DEFAULT '' COMMENT '上一审批人',
  `check_history_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '历史审批人ID，如:1,2,3',
  `check_copy_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '抄送人ID，如:1,2,3',
  `check_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '审核通过时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新信息时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  `talent_id` int(11) NOT NULL DEFAULT 0 COMMENT '入职申请id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='入职申请表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_talent`
--

LOCK TABLES `oa_talent` WRITE;
/*!40000 ALTER TABLE `oa_talent` DISABLE KEYS */;
INSERT INTO `oa_talent` VALUES
(1,'姚磊','',13145567865,1,11,'','5',13,2,4,2,'','',9,'',0,'','','','','','',0,'','','',0,1,'','','','','',0,'','','','','','','',1788710400,1,2,1,1,1788778068,2,8,0,'','','8','',0,1788779135,0,0);
/*!40000 ALTER TABLE `oa_talent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_template`
--

DROP TABLE IF EXISTS `oa_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_template` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '消息模板名称',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '权限标识唯一，字母',
  `types` tinyint(1) NOT NULL DEFAULT 1 COMMENT '类型:1普通消息,2审批消息',
  `check_types` int(11) NOT NULL DEFAULT 0 COMMENT '审批类型:0',
  `remark` varchar(500) NOT NULL DEFAULT '' COMMENT '备注描述，使用场景等',
  `msg_link` varchar(255) NOT NULL DEFAULT '' COMMENT '消息模板链接(审批申请)',
  `msg_title_0` varchar(255) NOT NULL DEFAULT '' COMMENT '消息模板标题(审批申请发审批人)',
  `msg_content_0` varchar(500) NOT NULL DEFAULT '' COMMENT '消息模板内容(审批申请发审批人)',
  `msg_title_1` varchar(255) NOT NULL DEFAULT '' COMMENT '消息模板标题(审批通过发申请人)',
  `msg_content_1` varchar(500) NOT NULL DEFAULT '' COMMENT '消息模板内容(审批通过发申请人)',
  `msg_title_2` varchar(255) NOT NULL DEFAULT '' COMMENT '消息模板标题(审批拒绝发申请人)',
  `msg_content_2` varchar(500) NOT NULL DEFAULT '' COMMENT '消息模板内容(审批拒绝发申请人)',
  `msg_title_3` varchar(255) NOT NULL DEFAULT '' COMMENT '消息模板标题(审批通过发抄送人)',
  `msg_content_3` varchar(500) NOT NULL DEFAULT '' COMMENT '消息模板内容(审批通过发抄送人)',
  `email_link` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱消息模板链接',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：-1删除 0禁用 1启用',
  `admin_id` int(11) NOT NULL DEFAULT 0 COMMENT '创建人',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='消息模板表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_template`
--

LOCK TABLES `oa_template` WRITE;
/*!40000 ALTER TABLE `oa_template` DISABLE KEYS */;
INSERT INTO `oa_template` VALUES
(1,'公告通知','note',1,0,'','/home/note/view/id/{action_id}','{from_user}发了一个新『公告』，请及时查看','您有一个新公告：{title}。','','','','','','','',1,1,1733312491,1733314809,0),
(2,'工作汇报通知','work',1,0,'','/oa/work/view/id/{action_id}','{from_user}给您发了一份『工作汇报』，请及时查看','您有一份新的工作汇报待查看。','','','','','','','',1,1,1760576534,1760577087,0),
(3,'工资发放通知','salary',1,0,'','/oa/salary/view/id/{action_id}','您有一个『{title}』新通知，请及时查看','您有一个『{title}』新通知，金额：{amount}。','','','','','','','',1,1,1784533901,0,0),
(4,'会议记录通知','meeting_records',1,0,'','/adm/meeting/records_view/id/{action_id}','{from_user}给您发了一份『会议记录』，请及时查看','您有一份新的会议记录待查看。\n会议日期：{meeting_date}\n会议主题：{title}','','','','','','','',1,1,1783437950,1783438952,0),
(5,'售后问题指派通知','problems',1,0,'','/service/problems/view/id/{action_id}','您有一个售后问题指派通知，请及时查看','有一个新的售后问题指派给你。\n问题标题：{title}\n创建时间：{create_time}','','','','','','','',1,1,1783496789,1783517290,0),
(6,'项目通知','project',1,0,'','/project/index/view/id/{action_id}','您有一个{title}通知，请及时查看','{text}\n项目名称：{name}\n项目负责人：{director_name}','','','','','','','',1,1,1783439468,1783495568,0),
(7,'任务通知','task',1,0,'','/project/task/view/id/{action_id}','您有一个{title}通知，请及时查看','{text}\n任务标题：{name}\n任务负责人：{director_name}','','','','','','','',1,1,1783482937,1783495573,0),
(8,'借支打款通知','loan_payment',1,0,'','/finance/loan/view/id/{action_id}','您有一个『{title}』新通知，请及时查看','您有一个『{title}』新通知，状态：{status}，金额：{amount}。','','','','','','','',1,1,1783050818,1783168252,0),
(9,'报销打款通知','expense_payment',1,0,'','/finance/expense/view/id/{action_id}','您有一个『{title}』新通知，请及时查看','您有一个『{title}』新通知，状态：{status}，金额：{amount}。','','','','','','','',1,1,1783048307,1783051598,0),
(10,'业务付款通知','ticket_payment',1,0,'','/finance/payment/view/id/{action_id}','您有一个『{title}』新通知，请及时查看','您有一个『{title}』新通知，状态：{status}，金额：{amount}。','','','','','','','',1,1,1783050857,1783051619,0),
(11,'业务退款通知','refund_payment',1,0,'','/finance/refund/view/id/{action_id}','您有一个『{title}』新通知，请及时查看','您有一个『{title}』新通知，状态：{status}，金额：{amount}。','','','','','','','',1,1,1783050957,1783051610,0),
(12,'业务到账通知','invoice_income',1,0,'','/finance/income/view/id/{action_id}','您有一个『{title}』新通知，请及时查看','您有一个『{title}』新通知，状态：{status}，金额：{amount}。','','','','','','','',1,1,1783053471,0,0),
(13,'借支还款通知','loan_back',1,0,'','/finance/loan/view/id/{action_id}','您有一个『{title}』新通知，请及时查看','您有一个『{title}』新通知，状态：还款确认，金额：{amount}。','','','','','','','',1,1,1783167711,0,0),
(14,'入职审批','talent',2,0,'','/user/talent/view/id/{action_id}','{from_user}提交了一个『入职审批』，请及时审批','您有一个新的『入职审批』需要处理。','您提交的『入职审批』已被审批通过','您在{create_time}提交的『入职审批』已于{date}被审批通过。','您提交的『入职审批』已被驳回拒绝','您在{create_time}提交的『入职审批』已于{date}被驳回拒绝。','{from_user}提交的『入职审批』已被审批通过并抄送给你','{from_user}在{create_time}提交的『入职审批』已被审批通过并抄送给你，请及时查看详情。','',1,1,1733314789,1753284351,0),
(15,'离职审批','personal_quit',2,0,'','/user/personal/leave_view/id/{action_id}','{from_user}提交了一个『离职审批』，请及时审批','您有一个新的『离职审批』需要处理。','您提交的『离职审批』已被审批通过','您在{create_time}提交的『离职审批』已于{date}被审批通过。','您提交的『离职审批』已被驳回拒绝','您在{create_time}提交的『离职审批』已于{date}被驳回拒绝。','{from_user}提交的『离职审批』已被审批通过并抄送给你','{from_user}在{create_time}提交的『离职审批』已被审批通过并抄送给你，请及时查看详情。','',1,1,1733314789,1753284351,0),
(16,'人事调动审批','department_change',2,0,'','/user/personal/change_view/id/{action_id}','{from_user}提交了一个『人事调动审批』，请及时审批','您有一个新的『人事调动审批』需要处理。','您提交的『人事调动审批』已被审批通过','您在{create_time}提交的『人事调动审批』已于{date}被审批通过。','您提交的『人事调动审批』已被驳回拒绝','您在{create_time}提交的『人事调动审批』已于{date}被驳回拒绝。','{from_user}提交的『人事调动审批』已被审批通过并抄送给你','{from_user}在{create_time}提交的『人事调动审批』已被审批通过并抄送给你，请及时查看详情。','',1,1,1733314789,1753284351,0),
(17,'会议室预定审批','meeting_order',2,0,'','/adm/meeting/view/id/{action_id}','{from_user}提交了一个『会议室预定审批』，请及时审批','您有一个新的『会议室预定审批』需要处理。','您提交的『会议室预定审批』已被审批通过','您在{create_time}提交的『会议室预定审批』已于{date}被审批通过。','您提交的『会议室预定审批』已被驳回拒绝','您在{create_time}提交的『会议室预定审批』已于{date}被驳回拒绝。','{from_user}提交的『会议室预定审批』已被审批通过并抄送给你','{from_user}在{create_time}提交的『会议室预定审批』已被审批通过并抄送给你，请及时查看详情。','',1,1,1758550842,1758582833,0),
(18,'用章审批','seal',2,0,'','/adm/seal/view/id/{action_id}','{from_user}提交了一个『用章申请』，请及时审批','您有一个新的『用章申请』需要处理。','您提交的『用章申请』已被审批通过。','您在{create_time}提交的『用章申请』已于{date}被审批通过。','您提交的『用章申请』已被驳回拒绝。','您在{create_time}提交的『用章申请』已于{date}被驳回拒绝。','{from_user}提交的『用章审批』已被审批通过并抄送给你','{from_user}在{create_time}提交的『用章审批』已被审批通过并抄送给你，请及时查看详情。','',1,1,1733313018,1733314834,0),
(19,'用车审批','car_use',2,0,'','/adm/car/apply_view/id/{action_id}','{from_user}提交了一个『用车申请』，请及时审批','您有一个新的『用车申请』需要处理。','您提交的『公文申请』已被审批通过。','您在{create_time}提交的『用车申请』已于{date}被审批通过。','您提交的『用车申请』已被驳回拒绝。','您在{create_time}提交的『用车申请』已于{date}被驳回拒绝。','{from_user}提交的『用车审批』已被审批通过并抄送给你','{from_user}在{create_time}提交的『用车审批』已被审批通过并抄送给你，请及时查看详情。','',1,1,1784218415,1784533828,0),
(20,'请假审批','leaves',2,0,'','/home/leaves/view/id/{action_id}','{from_user}提交了一个『请假申请』，请及时审批','您有一个新的『请假申请』需要处理。','您提交的『请假申请』已被审批通过。','您在{create_time}提交的『请假申请』已于{date}被审批通过。','您提交的『请假申请』已被驳回拒绝。','您在{create_time}提交的『请假申请』已于{date}被驳回拒绝。','{from_user}提交的『请假审批』已被审批通过并抄送给你','{from_user}在{create_time}提交的『请假审批』已被审批通过并抄送给你，请及时查看详情。','',1,1,1733312616,1733314814,0),
(21,'出差审批','trips',2,0,'','/home/trips/view/id/{action_id}','{from_user}提交了一个『出差申请』，请及时审批','您有一个新的『出差申请』需要处理。','您提交的『出差申请』已被审批通过。','您在{create_time}提交的『出差申请』已于{date}被审批通过。','您提交的『出差申请』已被驳回拒绝。','您在{create_time}提交的『出差申请』已于{date}被驳回拒绝。','{from_user}提交的『出差审批』已被审批通过并抄送给你','{from_user}在{create_time}提交的『出差审批』已被审批通过并抄送给你，请及时查看详情。','',1,1,1733312725,1733314819,0),
(22,'外出审批','outs',2,0,'','/home/outs/view/id/{action_id}','{from_user}提交了一个『外出申请』，请及时审批','您有一个新的『外出申请』需要处理。','您提交的『外出申请』已被审批通过。','您在{create_time}提交的『外出申请』已于{date}被审批通过。','您提交的『外出申请』已被驳回拒绝。','您在{create_time}提交的『外出申请』已于{date}被驳回拒绝。','{from_user}提交的『外出审批』已被审批通过并抄送给你','{from_user}在{create_time}提交的『外出审批』已被审批通过并抄送给你，请及时查看详情。','',1,1,1733312801,1733314824,0),
(23,'加班审批','overtimes',2,0,'','/home/overtimes/view/id/{action_id}','{from_user}提交了一个『加班申请』，请及时审批','您有一个新的『加班申请』需要处理。','您提交的『加班申请』已被审批通过。','您在{create_time}提交的『加班申请』已于{date}被审批通过。','您提交的『加班申请』已被驳回拒绝。','您在{create_time}提交的『加班申请』已于{date}被驳回拒绝。','{from_user}提交的『加班审批』已被审批通过并抄送给你','{from_user}在{create_time}提交的『加班审批』已被审批通过并抄送给你，请及时查看详情。','',1,1,1733312801,1733314828,0),
(24,'销售合同审批','contract',2,0,'','/contract/contract/view/id/{action_id}','{from_user}提交了一个『销售合同审批』，请及时审批','您有一个新的『销售合同审批』需要处理。','您提交的『销售合同审批』已被审批通过','您在{create_time}提交的『销售合同审批』已于{date}被审批通过。','您提交的『销售合同审批』已被驳回拒绝','您在{create_time}提交的『销售合同审批』已于{date}被驳回拒绝。','{from_user}提交的『销售合同审批』已被审批通过并抄送给你','{from_user}在{create_time}提交的『销售合同审批』已被审批通过并抄送给你，请及时查看详情。','',1,1,1733314701,0,0),
(25,'采购合同审批','purchase',2,0,'','/contract/purchase/view/id/{action_id}','{from_user}提交了一个『采购合同审批』，请及时审批','您有一个新的『采购合同审批』需要处理。','您提交的『采购合同审批』已被审批通过','您在{create_time}提交的『采购合同审批』已于{date}被审批通过。','您提交的『采购合同审批』已被驳回拒绝','您在{create_time}提交的『采购合同审批』已于{date}被驳回拒绝。','{from_user}提交的『采购合同审批』已被审批通过并抄送给你','{from_user}在{create_time}提交的『采购合同审批』已被审批通过并抄送给你，请及时查看详情。','',1,1,1733314789,1753284351,0),
(26,'借支审批','loan',2,0,'','/finance/loan/view/id/{action_id}','{from_user}提交了一个『借支审批』，请及时审批','您有一个新的『借支审批』需要处理。','您提交的『借支审批』已被审批通过','您在{create_time}提交的『借支审批』已于{date}被审批通过。','您提交的『借支审批』已被驳回拒绝','您在{create_time}提交的『借支审批』已于{date}被驳回拒绝。','{from_user}提交的『借支审批』已被审批通过并抄送给你','{from_user}在{create_time}提交的『借支审批』已被审批通过并抄送给你，请及时查看详情。','',1,1,1733314789,1753284351,0),
(27,'报销审批','expense',2,0,'','/finance/expense/view/id/{action_id}','{from_user}提交了一个『报销申请』，请及时审批','您有一个新的『报销申请』需要处理。','您提交的『报销申请』已被审批通过','您在{create_time}提交的『报销申请』已于{date}被审批通过。','您提交的『报销申请』已被驳回拒绝','您在{create_time}提交的『报销申请』已于{date}被驳回拒绝。','{from_user}提交的『报销审批』已被审批通过并抄送给你','{from_user}在{create_time}提交的『报销审批』已被审批通过并抄送给你，请及时查看详情。','',1,1,1733313169,1733313253,0),
(28,'销项发票审批','invoice',2,0,'','/finance/invoice/view/id/{action_id}','{from_user}提交了一个『销项发票申请』，请及时审批','您有一个新的『销项发票申请』需要处理。','您提交的『发票申请』已被审批通过','您在{create_time}提交的『销项发票申请』已于{date}被审批通过。','您提交的『销项发票申请』已被驳回拒绝','您在{create_time}提交的『销项发票申请』已于{date}被驳回拒绝。','{from_user}提交的『销项发票审批』已被审批通过并抄送给你','{from_user}在{create_time}提交的『销项发票审批』已被审批通过并抄送给你，请及时查看详情。','',1,1,1733313245,0,0),
(29,'进项发票审批','ticket',2,0,'','/finance/ticket/view/id/{action_id}','{from_user}提交了一个『进项发票申请』，请及时审批','您有一个新的『进项发票申请』需要处理。','您提交的『进项发票申请』已被审批通过','您在{create_time}提交的『进项发票申请』已于{date}被审批通过。','您提交的『进项发票申请』已被驳回拒绝','您在{create_time}提交的『进项发票申请』已于{date}被驳回拒绝。','{from_user}提交的『进项发票审批』已被审批通过并抄送给你','{from_user}在{create_time}提交的『进项发票审批』已被审批通过并抄送给你，请及时查看详情。','',1,1,1733313341,0,0),
(30,'收款审批','income',2,0,'','/finance/income/view/id/{action_id}','{from_user}提交了一个『收款申请』，请及时审批','您有一个新的『收款申请』需要处理。','您提交的『收款申请』已被审批通过','您在{create_time}提交的『收款申请』已于{date}被审批通过。','您提交的『收款申请』已被驳回拒绝','您在{create_time}提交的『无发票收款申请』已于{date}被驳回拒绝。','{from_user}提交的『收款审批』已被审批通过并抄送给你','{from_user}在{create_time}提交的『收款审批』已被审批通过并抄送给你，请及时查看详情。','',1,1,1733314549,0,0),
(31,'付款审批','payment',2,0,'','/finance/payment/view/id/{action_id}','{from_user}提交了一个『付款申请』，请及时审批','您有一个新的『付款申请』需要处理。','您提交的『付款申请』已被审批通过','您在{create_time}提交的『付款申请』已于{date}被审批通过。','您提交的『付款申请』已被驳回拒绝','您在{create_time}提交的『付款申请』已于{date}被驳回拒绝。','{from_user}提交的『付款审批』已被审批通过并抄送给你','{from_user}在{create_time}提交的『付款审批』已被审批通过并抄送给你，请及时查看详情。','',1,1,1733314607,0,0),
(32,'退款审批','income_refund',2,0,'','/finance/refund/view_a/id/{action_id}','{from_user}提交了一个『退款申请』，请及时审批','您有一个新的『退款申请』需要处理。','您提交的『退款申请』已被审批通过','您在{create_time}提交的『退款申请』已于{date}被审批通过。','您提交的『退款申请』已被驳回拒绝','您在{create_time}提交的『退款申请』已于{date}被驳回拒绝。','{from_user}提交的『退款申请』已被审批通过并抄送给你','{from_user}在{create_time}提交的『退款申请』已被审批通过并抄送给你，请及时查看详情。','',1,1,1733314607,0,0);
/*!40000 ALTER TABLE `oa_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_third_message`
--

DROP TABLE IF EXISTS `oa_third_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_third_message` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `msgtype` varchar(100) NOT NULL DEFAULT '' COMMENT '消息类型,email,weixin,mobile',
  `types` tinyint(1) unsigned DEFAULT 0 COMMENT '接收人类型：1人员,2部门,3岗位,4全部',
  `uids` varchar(500) NOT NULL DEFAULT '' COMMENT '人员ids',
  `dids` varchar(500) NOT NULL DEFAULT '' COMMENT '部门ids',
  `pids` varchar(500) NOT NULL DEFAULT '' COMMENT '岗位ids',
  `content` mediumtext DEFAULT NULL COMMENT '消息内容',
  `send_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '发送日期',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='第三方发消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_third_message`
--

LOCK TABLES `oa_third_message` WRITE;
/*!40000 ALTER TABLE `oa_third_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_third_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_ticket`
--

DROP TABLE IF EXISTS `oa_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_ticket` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(100) NOT NULL DEFAULT '' COMMENT '发票号码',
  `supplier_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '关联供应商ID',
  `purchase_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '关联采购合同协议ID',
  `customer_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '关联客户ID',
  `project_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '关联项目ID',
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '发票金额',
  `did` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '发票接受部门',
  `admin_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '发票接受人',
  `open_status` tinyint(1) unsigned DEFAULT 1 COMMENT '开票状态：1正常 2已作废',
  `open_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '发票开具时间',
  `invoice_type` tinyint(1) unsigned DEFAULT 0 COMMENT '发票类型：1增值税专用发票,2普通发票,3专用发票',
  `invoice_subject` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '关联发票主体ID',
  `invoice_title` varchar(100) NOT NULL DEFAULT '' COMMENT '开票抬头',
  `invoice_tax` varchar(100) NOT NULL DEFAULT '' COMMENT '纳税人识别号',
  `invoice_phone` varchar(100) NOT NULL DEFAULT '' COMMENT '电话号码',
  `invoice_address` varchar(100) NOT NULL DEFAULT '' COMMENT '地址',
  `invoice_bank` varchar(100) NOT NULL DEFAULT '' COMMENT '开户银行',
  `invoice_account` varchar(100) NOT NULL DEFAULT '' COMMENT '银行账号',
  `invoice_banking` varchar(100) NOT NULL DEFAULT '' COMMENT '银行营业网点',
  `file_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '附件ID，如:1,2,3',
  `other_file_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '其他附件ID，如:1,2,3',
  `remark` mediumtext DEFAULT NULL COMMENT '备注',
  `pay_amount` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '已付款金额',
  `pay_status` tinyint(1) unsigned DEFAULT 0 COMMENT '付款状态：0未付款 1部分付款 2全部付款',
  `pay_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '最新付款时间',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  `check_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '审核状态:0待审核,1审核中,2审核通过,3审核不通过,4撤销审核',
  `check_flow_id` int(11) NOT NULL DEFAULT 0 COMMENT '审核流程id',
  `check_step_sort` int(11) NOT NULL DEFAULT 0 COMMENT '当前审批步骤',
  `check_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '当前审批人ID，如:1,2,3',
  `check_last_uid` varchar(500) NOT NULL DEFAULT '' COMMENT '上一审批人',
  `check_history_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '历史审批人ID，如:1,2,3',
  `check_copy_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '抄送人ID，如:1,2,3',
  `check_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '审核通过时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1027 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='收票表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_ticket`
--

LOCK TABLES `oa_ticket` WRITE;
/*!40000 ALTER TABLE `oa_ticket` DISABLE KEYS */;
INSERT INTO `oa_ticket` VALUES
(1024,'TKT2026-0031',0,0,0,0,21000.00,3,6,1,0,1,1,'','','','','','','','','','',0.00,0,0,1787623200,1787623200,0,2,16,0,'0','','3,6','',0),
(1025,'TKT2026-0032',0,0,0,0,56000.00,3,9,6,0,1,1,'','','','','','','','','','',0.00,0,0,1788681600,1788681600,0,1,16,0,'3','','3','',0),
(1026,'TKT2026-0033',0,0,0,0,7800.00,3,6,3,0,1,1,'','','','','','','','','','',0.00,0,0,1788231600,1788231600,0,2,16,0,'0','','3,6','',0);
/*!40000 ALTER TABLE `oa_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_ticket_payment`
--

DROP TABLE IF EXISTS `oa_ticket_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_ticket_payment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '发票ID',
  `supplier_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '关联供应商ID',
  `purchase_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '关联采购合同ID',
  `project_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '关联项目ID',
  `enterprise_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '付款主体ID',
  `account_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '付款账户ID',
  `fundscate_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '款项类型',
  `paytype_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '支付方式',
  `transaction_code` varchar(100) NOT NULL DEFAULT '' COMMENT '交易单号',
  `file_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '附件ID，如:1,2,3',
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00 COMMENT '付款金额',
  `pay_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '付款时间',
  `confirm_uid` bigint(11) NOT NULL DEFAULT 0 COMMENT '付款确认人',
  `confirm_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '付款确认时间',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：0无效,1未确认,2已确认',
  `remarks` mediumtext DEFAULT NULL COMMENT '备注',
  `admin_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '付款登记人',
  `did` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '申请部门',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  `check_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '审核状态:0待审核,1审核中,2审核通过,3审核不通过,4撤销审核',
  `check_flow_id` int(11) NOT NULL DEFAULT 0 COMMENT '审核流程id',
  `check_step_sort` int(11) NOT NULL DEFAULT 0 COMMENT '当前审批步骤',
  `check_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '当前审批人ID，如:1,2,3',
  `check_last_uid` varchar(500) NOT NULL DEFAULT '' COMMENT '上一审批人',
  `check_history_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '历史审批人ID，如:1,2,3',
  `check_copy_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '抄送人ID，如:1,2,3',
  `check_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '审核通过时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1017 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='付款记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_ticket_payment`
--

LOCK TABLES `oa_ticket_payment` WRITE;
/*!40000 ALTER TABLE `oa_ticket_payment` DISABLE KEYS */;
INSERT INTO `oa_ticket_payment` VALUES
(1015,1024,0,0,0,1,1,1,2,'','',21000.00,1787882400,0,0,2,'',6,3,1787878800,1787878800,0,2,18,0,'','','3,6','',0),
(1016,1025,0,0,0,1,1,1,2,'','',28000.00,1788760800,0,0,1,'',9,3,1788757200,1788757200,0,1,18,0,'6','','','',0);
/*!40000 ALTER TABLE `oa_ticket_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_timing_task`
--

DROP TABLE IF EXISTS `oa_timing_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_timing_task` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '任务名称',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '任务标识，唯一',
  `link` varchar(255) NOT NULL DEFAULT '' COMMENT '执行链接',
  `types` int(2) NOT NULL DEFAULT 3 COMMENT '状态:1系统任务,2普通任务,3自定义任务',
  `desc` varchar(500) NOT NULL DEFAULT '' COMMENT '任务描述',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='定时任务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_timing_task`
--

LOCK TABLES `oa_timing_task` WRITE;
/*!40000 ALTER TABLE `oa_timing_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_timing_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_trips`
--

DROP TABLE IF EXISTS `oa_trips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_trips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` bigint(11) NOT NULL DEFAULT 0 COMMENT '开始日期',
  `end_date` bigint(11) NOT NULL DEFAULT 0 COMMENT '结束日期',
  `start_span` int(10) NOT NULL DEFAULT 0 COMMENT '时间段:1上午,2下午',
  `end_span` int(10) NOT NULL DEFAULT 0 COMMENT '时间段:1上午,2下午',
  `duration` decimal(10,1) NOT NULL DEFAULT 0.0 COMMENT '时长(工作日)',
  `reason` text NOT NULL COMMENT '出差原因',
  `file_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '附件，如:1,2,3',
  `check_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '审核状态:0待审核,1审核中,2审核通过,3审核不通过,4撤销审核',
  `check_flow_id` int(11) NOT NULL DEFAULT 0 COMMENT '审核流程id',
  `check_step_sort` int(11) NOT NULL DEFAULT 0 COMMENT '当前审批步骤',
  `check_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '当前审批人ID，如:1,2,3',
  `check_last_uid` varchar(500) NOT NULL DEFAULT '' COMMENT '上一审批人',
  `check_history_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '历史审批人ID，如:1,2,3',
  `check_copy_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '抄送人ID，如:1,2,3',
  `check_time` bigint(11) unsigned NOT NULL DEFAULT 0 COMMENT '审核通过时间',
  `admin_id` int(11) NOT NULL COMMENT '创建人ID',
  `did` int(11) NOT NULL COMMENT '创建人部门ID',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='出差表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_trips`
--

LOCK TABLES `oa_trips` WRITE;
/*!40000 ALTER TABLE `oa_trips` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_trips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_work`
--

DROP TABLE IF EXISTS `oa_work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_work` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `types` tinyint(1) unsigned DEFAULT 0 COMMENT '类型：1 日报 2周报 3月报',
  `start_date` bigint(11) NOT NULL DEFAULT 0 COMMENT '开始日期',
  `end_date` bigint(11) NOT NULL DEFAULT 0 COMMENT '结束日期',
  `to_uids` mediumtext DEFAULT NULL COMMENT '接受人员ID',
  `works` mediumtext DEFAULT NULL COMMENT '汇报工作内容',
  `plans` mediumtext DEFAULT NULL COMMENT '计划工作内容',
  `remark` mediumtext DEFAULT NULL COMMENT '其他事项',
  `file_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '附件，如:1,2,3',
  `send_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '发送时间',
  `admin_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '创建人id',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='汇报工作表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_work`
--

LOCK TABLES `oa_work` WRITE;
/*!40000 ALTER TABLE `oa_work` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_work` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_work_cate`
--

DROP TABLE IF EXISTS `oa_work_cate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_work_cate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '工作类型名称',
  `sort` int(10) NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：-1删除 0禁用 1启用',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='工作类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_work_cate`
--

LOCK TABLES `oa_work_cate` WRITE;
/*!40000 ALTER TABLE `oa_work_cate` DISABLE KEYS */;
INSERT INTO `oa_work_cate` VALUES
(1,'其他',0,1,1637987189,0),
(2,'方案策划',0,1,1637987199,0),
(3,'撰写文档',0,1,1637987199,0),
(4,'需求调研',0,1,1637987199,0),
(5,'需求沟通',0,1,1637987199,0),
(6,'参加会议',0,1,1637987199,0),
(7,'拜访客户',0,1,1637987199,0),
(8,'接待客户',0,1,1637987199,0);
/*!40000 ALTER TABLE `oa_work_cate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_work_plan`
--

DROP TABLE IF EXISTS `oa_work_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_work_plan` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '计划主题',
  `content` mediumtext DEFAULT NULL COMMENT '计划内容',
  `file_ids` varchar(500) NOT NULL DEFAULT '计划附件',
  `start_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '开始时间',
  `end_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '结束时间',
  `cate_id` tinyint(1) unsigned DEFAULT 0 COMMENT '计划类型ID',
  `types` tinyint(1) unsigned DEFAULT 0 COMMENT '参与人类型：1人员,2部门,3岗位,4全部',
  `uids` varchar(500) NOT NULL DEFAULT '' COMMENT '人员ids',
  `dids` varchar(500) NOT NULL DEFAULT '' COMMENT '部门ids',
  `pids` varchar(500) NOT NULL DEFAULT '' COMMENT '岗位ids',
  `director_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '负责人ids',
  `endorse_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '批注领导ids',
  `copy_uids` varchar(500) NOT NULL DEFAULT '' COMMENT '操送人员ids',
  `send_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '发送日期',
  `admin_id` int(10) NOT NULL DEFAULT 0 COMMENT '创建人',
  `create_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='工作计划表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_work_plan`
--

LOCK TABLES `oa_work_plan` WRITE;
/*!40000 ALTER TABLE `oa_work_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_work_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_work_record`
--

DROP TABLE IF EXISTS `oa_work_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_work_record` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `work_id` int(11) unsigned NOT NULL COMMENT '汇报工作id',
  `from_uid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '发送人id',
  `to_uid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '接收人id',
  `send_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '发送日期',
  `read_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '阅读时间',
  `delete_time` bigint(11) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='汇报工作发送记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_work_record`
--

LOCK TABLES `oa_work_record` WRITE;
/*!40000 ALTER TABLE `oa_work_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_work_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'gouguoa'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-08 11:36:39
