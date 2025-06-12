/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80036 (8.0.36)
 Source Host           : localhost:3306
 Source Schema         : jcdg

 Target Server Type    : MySQL
 Target Server Version : 80036 (8.0.36)
 File Encoding         : 65001

 Date: 14/04/2024 23:11:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-03-25 17:16:00', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-03-25 17:16:00', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-03-25 17:16:00', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2024-03-25 17:16:00', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-03-25 17:16:00', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-03-25 17:16:00', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '地球村大学', 0, '', '15888888888', 'abc@qq.com', '0', '0', 'admin', '2024-03-25 17:15:59', 'admin', '2024-04-14 16:22:36');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '信息工程学院', 1, '张三', '15888888888', 'zhangsan@qq.com', '0', '0', 'admin', '2024-03-25 17:15:59', 'admin', '2024-04-14 22:01:07');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '张三', '15888888888', 'zhangsan@qq.com', '0', '2', 'admin', '2024-03-25 17:15:59', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '教务处', 1, '张三', '15888888888', 'zhangsan@qq.com', '0', '0', 'admin', '2024-03-25 17:15:59', 'admin', '2024-04-14 22:01:14');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '张三', '15888888888', 'zhangsan@qq.com', '0', '2', 'admin', '2024-03-25 17:15:59', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '张三', '15888888888', 'zhangsan@qq.com', '0', '2', 'admin', '2024-03-25 17:15:59', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '张三', '15888888888', 'zhangsan@qq.com', '0', '2', 'admin', '2024-03-25 17:15:59', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '张三', '15888888888', 'zhangsan@qq.com', '0', '2', 'admin', '2024-03-25 17:15:59', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '张三', '15888888888', 'zhangsan@qq.com', '0', '2', 'admin', '2024-03-25 17:15:59', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '张三', '15888888888', 'zhangsan@qq.com', '0', '2', 'admin', '2024-03-25 17:15:59', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 106 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-03-25 17:16:00', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-03-25 17:16:00', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-03-25 17:16:00', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-03-25 17:16:00', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-03-25 17:16:00', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-03-25 17:16:00', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-03-25 17:16:00', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-03-25 17:16:00', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-03-25 17:16:00', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-03-25 17:16:00', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-03-25 17:16:00', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-03-25 17:16:00', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-03-25 17:16:00', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-03-25 17:16:00', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-03-25 17:16:00', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-03-25 17:16:00', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-03-25 17:16:00', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-03-25 17:16:00', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-03-25 17:16:00', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-03-25 17:16:00', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-03-25 17:16:00', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-03-25 17:16:00', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-03-25 17:16:00', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-03-25 17:16:00', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-03-25 17:16:00', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-03-25 17:16:00', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-03-25 17:16:00', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-03-25 17:16:00', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-03-25 17:16:00', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 1, '未审核', '0', 'audit_status', NULL, 'warning', 'N', '0', 'admin', '2024-03-30 15:35:08', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 2, '审核通过', '1', 'audit_status', NULL, 'primary', 'N', '0', 'admin', '2024-03-30 15:35:25', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (102, 3, '审核不通过', '2', 'audit_status', NULL, 'danger', 'N', '0', 'admin', '2024-03-30 15:35:45', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 4, '无需审核', '3', 'audit_status', NULL, 'success', 'N', '0', 'admin', '2024-03-30 15:36:03', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (104, 0, '未支付', '0', 'pay_status', NULL, 'danger', 'N', '0', 'admin', '2024-04-06 15:24:51', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (105, 0, '已支付', '1', 'pay_status', NULL, 'success', 'N', '0', 'admin', '2024-04-06 15:25:03', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-03-25 17:16:00', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-03-25 17:16:00', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-03-25 17:16:00', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-03-25 17:16:00', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-03-25 17:16:00', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-03-25 17:16:00', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-03-25 17:16:00', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-03-25 17:16:00', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-03-25 17:16:00', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-03-25 17:16:00', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '审核状态', 'audit_status', '0', 'admin', '2024-03-30 15:34:19', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (101, '是否支付', 'pay_status', '0', 'admin', '2024-04-06 15:24:37', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 196 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-03-25 17:28:43');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-03-25 17:28:53');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-25 17:29:05');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-03-26 14:18:44');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-26 14:18:52');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-27 13:11:49');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-27 13:42:07');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-27 13:59:04');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-27 15:03:47');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-27 15:08:55');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-27 16:10:17');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-27 16:20:36');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-27 16:23:27');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-27 16:29:24');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-27 16:39:19');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-03-27 16:54:11');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-03-27 16:56:57');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-27 16:57:02');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-27 17:01:12');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-27 17:08:16');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-27 17:58:30');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-27 18:10:24');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-28 14:02:50');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-28 14:12:22');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-28 14:44:09');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-28 14:45:40');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-30 10:52:59');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-30 11:50:04');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-30 11:50:10');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-30 13:08:54');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-30 13:58:04');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-30 14:45:07');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-30 14:45:14');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-30 14:46:45');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-30 15:24:00');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-03-31 10:11:38');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-31 10:11:47');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-31 11:12:54');
INSERT INTO `sys_logininfor` VALUES (138, 'lijingli', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-04-06 15:10:08');
INSERT INTO `sys_logininfor` VALUES (139, 'lijingli', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-04-06 15:10:20');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-04-06 15:10:26');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-06 15:10:30');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-04-14 14:27:39');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 14:27:48');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-04-14 16:20:20');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 16:20:29');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 16:33:53');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 16:44:38');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 16:50:23');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 16:51:52');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 16:58:17');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 21:59:33');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-14 22:06:57');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 22:07:18');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-14 22:09:59');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 22:10:14');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-14 22:12:18');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 22:12:39');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-14 22:13:16');
INSERT INTO `sys_logininfor` VALUES (159, 'shushang', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 22:15:09');
INSERT INTO `sys_logininfor` VALUES (160, 'shushang', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-14 22:15:46');
INSERT INTO `sys_logininfor` VALUES (161, 'shushang', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 22:16:07');
INSERT INTO `sys_logininfor` VALUES (162, 'shushang', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-14 22:16:34');
INSERT INTO `sys_logininfor` VALUES (163, 'kcfzr', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 22:16:44');
INSERT INTO `sys_logininfor` VALUES (164, 'kcfzr', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-14 22:17:12');
INSERT INTO `sys_logininfor` VALUES (165, 'xuesheng', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 22:17:19');
INSERT INTO `sys_logininfor` VALUES (166, 'xuesheng', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-14 22:31:30');
INSERT INTO `sys_logininfor` VALUES (167, 'kcfzr', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 22:31:42');
INSERT INTO `sys_logininfor` VALUES (168, 'kcfzr', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-14 22:32:43');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 22:32:50');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-14 22:36:29');
INSERT INTO `sys_logininfor` VALUES (171, 'kcfzr', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 22:36:39');
INSERT INTO `sys_logininfor` VALUES (172, 'kcfzr', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-14 22:37:59');
INSERT INTO `sys_logininfor` VALUES (173, 'xuesheng', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 22:38:15');
INSERT INTO `sys_logininfor` VALUES (174, 'xuesheng', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-14 22:38:35');
INSERT INTO `sys_logininfor` VALUES (175, 'zyfzr', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 22:38:46');
INSERT INTO `sys_logininfor` VALUES (176, 'zyfzr', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-14 22:38:58');
INSERT INTO `sys_logininfor` VALUES (177, 'xuesheng', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 22:39:06');
INSERT INTO `sys_logininfor` VALUES (178, 'xuesheng', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-14 22:39:52');
INSERT INTO `sys_logininfor` VALUES (179, 'kcfzr', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 22:40:05');
INSERT INTO `sys_logininfor` VALUES (180, 'kcfzr', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-14 22:40:20');
INSERT INTO `sys_logininfor` VALUES (181, 'zyfzr', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 22:40:32');
INSERT INTO `sys_logininfor` VALUES (182, 'zyfzr', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-14 22:41:15');
INSERT INTO `sys_logininfor` VALUES (183, 'xuesheng', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 22:41:30');
INSERT INTO `sys_logininfor` VALUES (184, 'xuesheng', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-14 22:42:15');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 22:42:23');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-14 22:44:45');
INSERT INTO `sys_logininfor` VALUES (187, 'xuesheng', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 22:44:55');
INSERT INTO `sys_logininfor` VALUES (188, 'xuesheng', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-14 22:45:10');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 22:45:20');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-14 22:49:31');
INSERT INTO `sys_logininfor` VALUES (191, 'xuesheng', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 22:49:47');
INSERT INTO `sys_logininfor` VALUES (192, 'xuesheng', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-14 22:50:18');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 22:50:26');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-14 22:52:00');
INSERT INTO `sys_logininfor` VALUES (195, 'xuesheng', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 22:52:30');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2028 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2024-03-25 17:15:59', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 99, 'monitor', NULL, '', 1, 0, 'M', '1', '0', '', 'monitor', 'admin', '2024-03-25 17:15:59', 'admin', '2024-03-26 14:24:48', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 98, 'tool', NULL, '', 1, 0, 'M', '1', '0', '', 'tool', 'admin', '2024-03-25 17:15:59', 'admin', '2024-03-31 11:39:26', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-03-25 17:15:59', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-03-25 17:15:59', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-03-25 17:15:59', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '1', '0', 'system:dept:list', 'tree', 'admin', '2024-03-25 17:15:59', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '1', '0', 'system:post:list', 'post', 'admin', '2024-03-25 17:15:59', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '1', '0', 'system:dict:list', 'dict', 'admin', '2024-03-25 17:15:59', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '1', '0', 'system:config:list', 'edit', 'admin', '2024-03-25 17:15:59', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-03-25 17:15:59', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '1', '0', '', 'log', 'admin', '2024-03-25 17:15:59', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '1', '0', 'monitor:online:list', 'online', 'admin', '2024-03-25 17:15:59', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '1', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-03-25 17:15:59', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2024-03-25 17:15:59', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-03-25 17:15:59', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '书目管理', 0, 1, 'sm', NULL, NULL, 1, 0, 'M', '0', '0', '', 'education', 'admin', '2024-03-25 17:49:30', 'admin', '2024-03-25 17:50:17', '');
INSERT INTO `sys_menu` VALUES (2002, '书目列表', 2000, 1, 'sm', 'system/sm/index', NULL, 1, 0, 'C', '0', '0', 'system:sm:list', '#', 'admin', '2024-03-25 17:52:30', 'admin', '2024-03-31 11:38:51', '书目菜单');
INSERT INTO `sys_menu` VALUES (2003, '书目查询', 2002, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:sm:query', '#', 'admin', '2024-03-25 17:52:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '书目新增', 2002, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:sm:add', '#', 'admin', '2024-03-25 17:52:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '书目修改', 2002, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:sm:edit', '#', 'admin', '2024-03-25 17:52:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '书目删除', 2002, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:sm:remove', '#', 'admin', '2024-03-25 17:52:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '书目导出', 2002, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:sm:export', '#', 'admin', '2024-03-25 17:52:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '教材管理', 0, 2, 'jc', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'icon', 'admin', '2024-03-26 14:24:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '教材列表', 2008, 1, 'jc', 'system/jc/index', NULL, 1, 0, 'C', '0', '0', 'system:jc:list', '#', 'admin', '2024-03-26 14:29:21', 'admin', '2024-03-31 11:38:59', '教材菜单');
INSERT INTO `sys_menu` VALUES (2010, '教材查询', 2009, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:jc:query', '#', 'admin', '2024-03-26 14:29:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '教材新增', 2009, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:jc:add', '#', 'admin', '2024-03-26 14:29:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '教材修改', 2009, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:jc:edit', '#', 'admin', '2024-03-26 14:29:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '教材删除', 2009, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:jc:remove', '#', 'admin', '2024-03-26 14:29:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '教材导出', 2009, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:jc:export', '#', 'admin', '2024-03-26 14:29:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '教材审核', 2008, 1, 'jcSelect', 'system/jcSelect/index', NULL, 1, 0, 'C', '0', '0', 'system:jcSelect:list', '#', 'admin', '2024-03-30 11:29:31', 'admin', '2024-03-30 15:24:47', '教材选择菜单');
INSERT INTO `sys_menu` VALUES (2016, '教材选择查询', 2015, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:jcSelect:query', '#', 'admin', '2024-03-30 11:29:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '教材选择新增', 2015, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:jcSelect:add', '#', 'admin', '2024-03-30 11:29:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '教材选择修改', 2015, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:jcSelect:edit', '#', 'admin', '2024-03-30 11:29:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '教材选择删除', 2015, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:jcSelect:remove', '#', 'admin', '2024-03-30 11:29:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2020, '教材选择导出', 2015, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:jcSelect:export', '#', 'admin', '2024-03-30 11:29:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '教材采购', 2022, 1, 'a', 'system/jcCg/index', NULL, 1, 0, 'C', '0', '0', 'system:jcSelect:listAudit', '#', 'admin', '2024-03-31 10:16:50', 'admin', '2024-04-14 22:44:39', '');
INSERT INTO `sys_menu` VALUES (2022, '采购管理', 0, 4, 'cggl', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'shopping', 'admin', '2024-03-31 11:30:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '采购单', 2022, 2, 'b', 'system/cgd/index', NULL, 1, 0, 'C', '0', '0', 'system:cgd:list', '#', 'admin', '2024-03-31 11:32:04', 'admin', '2024-03-31 11:37:56', '');
INSERT INTO `sys_menu` VALUES (2024, '我的采购单', 2022, 3, 'c', 'system/myCgd/index', '', 1, 0, 'C', '0', '0', 'system:cgd:index', '#', 'admin', '2024-03-31 11:34:56', 'admin', '2024-04-06 15:38:27', '');
INSERT INTO `sys_menu` VALUES (2025, '选择教材', 2009, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:jcSelect:add', '#', 'admin', '2024-04-14 16:48:39', 'admin', '2024-04-14 16:52:44', '');
INSERT INTO `sys_menu` VALUES (2026, '审核', 2015, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:jcSelect:audit', '#', 'admin', '2024-04-14 16:59:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '加入采购单', 2021, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:jcCg:add', '#', 'admin', '2024-04-14 17:01:58', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2024-04-01 教材新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2024-04-01 17:16:00', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2024-04-14 教材采购系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-04-13 17:16:00', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 278 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, 'admin', '研发部门', '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-25 17:29:28', 242);
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"t_sm\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-25 17:47:42', 88);
INSERT INTO `sys_oper_log` VALUES (102, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"sm\",\"className\":\"Sm\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-03-25 17:47:42\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Smmc\",\"columnId\":2,\"columnName\":\"smmc\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-25 17:47:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"smmc\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnId\":3,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-03-25 17:47:42\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"Date\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UpdateTime\",\"columnId\":4,\"columnName\":\"update_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-03-25 17:47:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"updateTime\",\"javaType\":\"Date\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":4,\"superColumn\":true,\"tableId\":1,\"updateBy\":\"\",\"usa', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-25 17:48:00', 31);
INSERT INTO `sys_oper_log` VALUES (103, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"书目管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"1\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-25 17:49:30', 13);
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-03-25 17:49:30\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"书目管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"sm\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-25 17:50:17', 24);
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"书目管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"system/sm/index\",\"perms\":\"system:sm:index\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-25 17:51:06', 6);
INSERT INTO `sys_oper_log` VALUES (106, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2001', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-25 17:51:18', 15);
INSERT INTO `sys_oper_log` VALUES (107, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"sm\",\"className\":\"Sm\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-03-25 17:47:42\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-03-25 17:48:00\",\"usableColumn\":false},{\"capJavaField\":\"Smmc\",\"columnId\":2,\"columnName\":\"smmc\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-25 17:47:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"smmc\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-03-25 17:48:00\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnId\":3,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-03-25 17:47:42\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"Date\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-03-25 17:48:00\",\"usableColumn\":false},{\"capJavaField\":\"UpdateTime\",\"columnId\":4,\"columnName\":\"update_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-03-25 17:47:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"updateTime\",\"javaType\":\"Date\",\"list\":false,\"params\":{},\"pk\":false,\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-25 17:51:43', 17);
INSERT INTO `sys_oper_log` VALUES (108, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"t_sm\"}', NULL, 0, NULL, '2024-03-25 17:51:45', 333);
INSERT INTO `sys_oper_log` VALUES (109, '书目', 1, 'com.ruoyi.web.controller.system.SmController.add()', 'POST', 1, 'admin', '研发部门', '/system/sm', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-03-25 18:02:22\",\"params\":{},\"smmc\":\"Java教程\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-25 18:02:22', 35);
INSERT INTO `sys_oper_log` VALUES (110, '书目', 1, 'com.ruoyi.web.controller.system.SmController.add()', 'POST', 1, 'admin', '研发部门', '/system/sm', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-03-25 18:02:36\",\"params\":{},\"smmc\":\"C++教材\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-25 18:02:36', 5);
INSERT INTO `sys_oper_log` VALUES (111, '书目', 1, 'com.ruoyi.web.controller.system.SmController.add()', 'POST', 1, 'admin', '研发部门', '/system/sm', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-03-25 18:02:51\",\"params\":{},\"smmc\":\"C语言编程教材\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-25 18:02:51', 5);
INSERT INTO `sys_oper_log` VALUES (112, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"t_jc\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 14:23:20', 92);
INSERT INTO `sys_oper_log` VALUES (113, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"jc\",\"className\":\"Jc\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键id\",\"columnId\":5,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-03-26 14:23:20\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SmId\",\"columnComment\":\"书目id\",\"columnId\":6,\"columnName\":\"sm_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-03-26 14:23:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"smId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"JcMc\",\"columnComment\":\"教材名称\",\"columnId\":7,\"columnName\":\"jc_mc\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-26 14:23:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"jcMc\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"JcJj\",\"columnComment\":\"教材简介\",\"columnId\":8,\"columnName\":\"jc_jj\",\"columnType\":\"varchar(2000)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-26 14:23:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"jcJj\",\"javaType\":\"String\",\"list\":true,\"params\":{', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 14:23:30', 50);
INSERT INTO `sys_oper_log` VALUES (114, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"icon\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"教材管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"jc\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 14:24:34', 13);
INSERT INTO `sys_oper_log` VALUES (115, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-03-25 17:15:59\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":99,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 14:24:48', 8);
INSERT INTO `sys_oper_log` VALUES (116, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-03-25 17:15:59\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":100,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 14:24:59', 7);
INSERT INTO `sys_oper_log` VALUES (117, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"t_jc\"}', NULL, 0, NULL, '2024-03-26 14:25:13', 323);
INSERT INTO `sys_oper_log` VALUES (118, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"jc\",\"className\":\"Jc\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键id\",\"columnId\":5,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-03-26 14:23:20\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-03-26 14:23:30\",\"usableColumn\":false},{\"capJavaField\":\"SmId\",\"columnComment\":\"书目id\",\"columnId\":6,\"columnName\":\"sm_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-03-26 14:23:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"smId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-03-26 14:23:30\",\"usableColumn\":false},{\"capJavaField\":\"JcMc\",\"columnComment\":\"教材名称\",\"columnId\":7,\"columnName\":\"jc_mc\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-26 14:23:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"jcMc\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-03-26 14:23:30\",\"usableColumn\":false},{\"capJavaField\":\"JcJj\",\"columnComment\":\"教材简介\",\"columnId\":8,\"columnName\":\"jc_jj\",\"columnType\":\"varchar(2000)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-26 14:23:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 14:25:47', 29);
INSERT INTO `sys_oper_log` VALUES (119, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"t_jc\"}', NULL, 0, NULL, '2024-03-26 14:25:49', 87);
INSERT INTO `sys_oper_log` VALUES (120, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/t_jc', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 14:26:32', 40);
INSERT INTO `sys_oper_log` VALUES (121, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"jc\",\"className\":\"Jc\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键id\",\"columnId\":5,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-03-26 14:23:20\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-03-26 14:26:31\",\"usableColumn\":false},{\"capJavaField\":\"SmId\",\"columnComment\":\"书目id\",\"columnId\":6,\"columnName\":\"sm_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-03-26 14:23:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"smId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-03-26 14:26:31\",\"usableColumn\":false},{\"capJavaField\":\"JcMc\",\"columnComment\":\"教材名称\",\"columnId\":7,\"columnName\":\"jc_mc\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-26 14:23:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"jcMc\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-03-26 14:26:31\",\"usableColumn\":false},{\"capJavaField\":\"JcJj\",\"columnComment\":\"教材简介\",\"columnId\":8,\"columnName\":\"jc_jj\",\"columnType\":\"varchar(2000)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-26 14:23:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 14:28:41', 72);
INSERT INTO `sys_oper_log` VALUES (122, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"t_jc\"}', NULL, 0, NULL, '2024-03-26 14:28:43', 89);
INSERT INTO `sys_oper_log` VALUES (123, '教材', 1, 'com.ruoyi.web.controller.system.JcController.add()', 'POST', 1, 'admin', '研发部门', '/system/jc', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-03-27 13:12:07\",\"id\":1,\"img\":\"dfd\",\"jcJj\":\"dafd\",\"jcMc\":\"fdf\",\"params\":{},\"smId\":111}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-27 13:12:07', 20);
INSERT INTO `sys_oper_log` VALUES (124, '教材', 1, 'com.ruoyi.web.controller.system.JcController.add()', 'POST', 1, 'admin', '研发部门', '/system/jc', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-03-27 13:59:22\",\"id\":2,\"img\":\"1\",\"jcJj\":\"1\",\"jcMc\":\"1\",\"params\":{},\"smId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-27 13:59:22', 6107);
INSERT INTO `sys_oper_log` VALUES (125, '教材', 1, 'com.ruoyi.web.controller.system.JcController.add()', 'POST', 1, 'admin', '研发部门', '/system/jc', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-03-28 14:03:07\",\"id\":3,\"img\":\"http://localhost:8080/71a82a67-419b-4a2e-8343-bf5f5cabc4b9.jpg\",\"jcJj\":\"111\",\"jcMc\":\"111\",\"params\":{},\"smId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-28 14:03:07', 19);
INSERT INTO `sys_oper_log` VALUES (126, '教材', 3, 'com.ruoyi.web.controller.system.JcController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/jc/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-28 14:12:29', 17);
INSERT INTO `sys_oper_log` VALUES (127, '教材', 3, 'com.ruoyi.web.controller.system.JcController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/jc/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-28 14:12:31', 6);
INSERT INTO `sys_oper_log` VALUES (128, '教材', 1, 'com.ruoyi.web.controller.system.JcController.add()', 'POST', 1, 'admin', '研发部门', '/system/jc', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-03-28 14:12:36\",\"id\":4,\"jcJj\":\"1\",\"jcMc\":\"1\",\"params\":{},\"smId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-28 14:12:36', 12);
INSERT INTO `sys_oper_log` VALUES (129, '教材', 2, 'com.ruoyi.web.controller.system.JcController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/jc', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-03-28 14:12:36\",\"id\":4,\"img\":\"http://localhost:8080/微信截图_20240108152548.png\",\"jcJj\":\"1\",\"jcMc\":\"1\",\"params\":{},\"smId\":1,\"updateTime\":\"2024-03-28 14:12:41\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-28 14:12:41', 4);
INSERT INTO `sys_oper_log` VALUES (130, '教材', 1, 'com.ruoyi.web.controller.system.JcController.add()', 'POST', 1, 'admin', '研发部门', '/system/jc', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-03-28 14:13:03\",\"id\":5,\"img\":\"http://localhost:8080/微信截图_20240108152548.png\",\"jcJj\":\"2\",\"jcMc\":\"1\",\"params\":{},\"smId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-28 14:13:03', 5);
INSERT INTO `sys_oper_log` VALUES (131, '教材', 1, 'com.ruoyi.web.controller.system.JcController.add()', 'POST', 1, 'admin', '研发部门', '/system/jc', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-03-28 14:13:14\",\"id\":6,\"img\":\"http://localhost:8080/71a82a67-419b-4a2e-8343-bf5f5cabc4b9.jpg\",\"jcJj\":\"1\",\"jcMc\":\"1\",\"params\":{},\"smId\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-28 14:13:14', 5);
INSERT INTO `sys_oper_log` VALUES (132, '教材', 3, 'com.ruoyi.web.controller.system.JcController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/jc/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-28 14:13:18', 4);
INSERT INTO `sys_oper_log` VALUES (133, '教材', 3, 'com.ruoyi.web.controller.system.JcController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/jc/5', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-28 14:13:20', 5);
INSERT INTO `sys_oper_log` VALUES (134, '教材', 1, 'com.ruoyi.web.controller.system.JcController.add()', 'POST', 1, 'admin', '研发部门', '/system/jc', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-03-28 14:14:03\",\"id\":7,\"img\":\"http://localhost:8080/教材发行业务模型.png\",\"jcJj\":\"2\",\"jcMc\":\"2\",\"params\":{},\"smId\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-28 14:14:03', 6);
INSERT INTO `sys_oper_log` VALUES (135, '教材', 3, 'com.ruoyi.web.controller.system.JcController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/jc/7', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-28 14:14:14', 48);
INSERT INTO `sys_oper_log` VALUES (136, '教材', 1, 'com.ruoyi.web.controller.system.JcController.add()', 'POST', 1, 'admin', '研发部门', '/system/jc', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-03-28 14:14:56\",\"id\":8,\"img\":\"http://localhost:8080/20240328141441.png\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-28 14:14:56', 6);
INSERT INTO `sys_oper_log` VALUES (137, '教材', 3, 'com.ruoyi.web.controller.system.JcController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/jc/8', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-28 14:14:59', 5);
INSERT INTO `sys_oper_log` VALUES (138, '教材', 1, 'com.ruoyi.web.controller.system.JcController.add()', 'POST', 1, 'admin', '研发部门', '/system/jc', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-03-28 14:16:17\",\"id\":9,\"img\":\"http://localhost:8080/20240328141441.png\",\"jcJj\":\"3\",\"jcMc\":\"3\",\"params\":{},\"smId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-28 14:16:17', 5);
INSERT INTO `sys_oper_log` VALUES (139, '教材', 2, 'com.ruoyi.web.controller.system.JcController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/jc', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-03-28 14:16:17\",\"id\":9,\"img\":\"http://localhost:8080/教材发行业务模型.png\",\"jcJj\":\"3\",\"jcMc\":\"3\",\"params\":{},\"smId\":2,\"updateTime\":\"2024-03-28 14:16:28\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-28 14:16:28', 5);
INSERT INTO `sys_oper_log` VALUES (140, '教材', 2, 'com.ruoyi.web.controller.system.JcController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/jc', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-03-28 14:03:08\",\"id\":3,\"img\":\"http://localhost:8080/71a82a67-419b-4a2e-8343-bf5f5cabc4b9.jpg\",\"jcJj\":\"从0到1学习c++\",\"jcMc\":\"从0到1学习c++\",\"params\":{},\"smId\":2,\"updateTime\":\"2024-03-28 14:17:10\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-28 14:17:10', 5);
INSERT INTO `sys_oper_log` VALUES (141, '教材', 2, 'com.ruoyi.web.controller.system.JcController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/jc', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-03-28 14:13:15\",\"id\":6,\"img\":\"http://localhost:8080/71a82a67-419b-4a2e-8343-bf5f5cabc4b9.jpg\",\"jcJj\":\"《深入理解Java虚拟机：JVM高级特性与最佳实践》。作者是周志明，这本书是国内关于Java虚拟机讲得非常好的书，适合对Java虚拟机有深入了解需求的读者。\",\"jcMc\":\"深入理解Java虚拟机：JVM高级特性与最佳实践\",\"params\":{},\"smId\":1,\"updateTime\":\"2024-03-28 14:18:02\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-28 14:18:02', 4);
INSERT INTO `sys_oper_log` VALUES (142, '教材', 2, 'com.ruoyi.web.controller.system.JcController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/jc', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-03-28 14:16:17\",\"id\":9,\"img\":\"http://localhost:8080/教材发行业务模型.png\",\"jcJj\":\"《Java编程思想》。作者是Bruce Eckel，这本书是Java程序员人手必备的一本书，几乎囊括了所有的Java知识点，适合作为Java编程的入门书籍。\",\"jcMc\":\"Java编程思想\",\"params\":{},\"smId\":1,\"updateTime\":\"2024-03-28 14:18:37\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-28 14:18:37', 4);
INSERT INTO `sys_oper_log` VALUES (143, '教材', 1, 'com.ruoyi.web.controller.system.JcController.add()', 'POST', 1, 'admin', '研发部门', '/system/jc', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-03-28 14:19:08\",\"id\":10,\"jcJj\":\"《Java核心技术卷1、2》。作者是Cay S. Horstmann，这本书系统介绍了Java的主要包和类，适合有一定Java基础的读者深入学习。\",\"jcMc\":\"Java核心技术卷1\",\"params\":{},\"smId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-28 14:19:08', 6);
INSERT INTO `sys_oper_log` VALUES (144, '教材', 1, 'com.ruoyi.web.controller.system.JcController.add()', 'POST', 1, 'admin', '研发部门', '/system/jc', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-03-28 14:19:28\",\"id\":11,\"jcJj\":\"《Java核心技术卷1、2》。作者是Cay S. Horstmann，这本书系统介绍了Java的主要包和类，适合有一定Java基础的读者深入学习。\",\"jcMc\":\"Java核心技术卷2\",\"params\":{},\"smId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-28 14:19:28', 5);
INSERT INTO `sys_oper_log` VALUES (145, '教材', 1, 'com.ruoyi.web.controller.system.JcController.add()', 'POST', 1, 'admin', '研发部门', '/system/jc', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-03-28 14:19:55\",\"id\":12,\"jcJj\":\"《Java并发编程实战》。这本书介绍了Java并发编程的相关知识，包括多线程和并发工具的使用，适合对Java并发编程有兴趣的读者。\",\"jcMc\":\"Java并发编程实战\",\"params\":{},\"smId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-28 14:19:55', 5);
INSERT INTO `sys_oper_log` VALUES (146, '教材', 1, 'com.ruoyi.web.controller.system.JcController.add()', 'POST', 1, 'admin', '研发部门', '/system/jc', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-03-28 14:20:09\",\"id\":13,\"jcJj\":\"《重构：改善既有代码的设计》。作者是Martin Fowler，这本书讲述了如何通过重构改善既有代码的设计，适合有一定编程经验的读者。\",\"jcMc\":\"重构：改善既有代码的设计\",\"params\":{},\"smId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-28 14:20:09', 4);
INSERT INTO `sys_oper_log` VALUES (147, '教材', 1, 'com.ruoyi.web.controller.system.JcController.add()', 'POST', 1, 'admin', '研发部门', '/system/jc', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-03-28 14:20:30\",\"id\":14,\"jcJj\":\"《Head First Java》。这本书是面向对象程序设计和Java的学习指导，以一种轻松有趣的方式讲解Java编程，适合初学者。\",\"jcMc\":\"Head First Java\",\"params\":{},\"smId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-28 14:20:30', 9);
INSERT INTO `sys_oper_log` VALUES (148, '教材', 2, 'com.ruoyi.web.controller.system.JcController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/jc', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-03-28 14:13:15\",\"id\":6,\"img\":\"http://localhost:8080/微信截图_20240328142113.png\",\"jcJj\":\"《深入理解Java虚拟机：JVM高级特性与最佳实践》。作者是周志明，这本书是国内关于Java虚拟机讲得非常好的书，适合对Java虚拟机有深入了解需求的读者。\",\"jcMc\":\"深入理解Java虚拟机：JVM高级特性与最佳实践\",\"params\":{},\"smId\":1,\"updateTime\":\"2024-03-28 14:21:50\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-28 14:21:50', 8);
INSERT INTO `sys_oper_log` VALUES (149, '教材', 2, 'com.ruoyi.web.controller.system.JcController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/jc', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-03-28 14:13:15\",\"id\":6,\"img\":\"http://localhost:8080/微信截图_20240328142113.png\",\"jcJj\":\"《深入理解Java虚拟机：JVM高级特性与最佳实践》。作者是周志明，这本书是国内关于Java虚拟机讲得非常好的书，适合对Java虚拟机有深入了解需求的读者。\",\"jcMc\":\"深入理解Java虚拟机：JVM高级特性与最佳实践\",\"params\":{},\"smId\":1,\"updateTime\":\"2024-03-28 14:21:55\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-28 14:21:55', 5);
INSERT INTO `sys_oper_log` VALUES (150, '教材', 1, 'com.ruoyi.web.controller.system.JcController.add()', 'POST', 1, 'admin', '研发部门', '/system/jc', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-03-28 14:23:21\",\"id\":15,\"img\":\"http://localhost:8080/微信截图_20240328142226.png\",\"jcJj\":\"《Effective Java》。作者是Joshua Bloch，这本书介绍了在Java编程中78条极具实用价值的经验规则，涵盖了大多数开发人员每天所面临的问题的解决方案，内容全面，结构清晰，讲解详细。\",\"jcMc\":\"Effective Java\",\"params\":{},\"smId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-28 14:23:21', 9);
INSERT INTO `sys_oper_log` VALUES (151, '教材', 2, 'com.ruoyi.web.controller.system.JcController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/jc', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-03-28 14:23:22\",\"id\":15,\"img\":\"http://localhost:8080/微信截图_20240328142226.png\",\"jcJj\":\"《Effective Java》。作者是Joshua Bloch，这本书介绍了在Java编程中78条极具实用价值的经验规则，涵盖了大多数开发人员每天所面临的问题的解决方案，内容全面，结构清晰，讲解详细。\",\"jcMc\":\"Effective Java\",\"params\":{},\"smId\":1,\"updateTime\":\"2024-03-28 14:23:29\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-28 14:23:29', 5);
INSERT INTO `sys_oper_log` VALUES (152, '教材', 2, 'com.ruoyi.web.controller.system.JcController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/jc', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-03-28 14:23:22\",\"id\":15,\"img\":\"http://localhost:8080/微信截图_20240328142226.png\",\"jcJj\":\"《Effective Java》。作者是Joshua Bloch，这本书介绍了在Java编程中78条极具实用价值的经验规则，涵盖了大多数开发人员每天所面临的问题的解决方案，内容全面，结构清晰，讲解详细。\",\"jcMc\":\"Effective Java\",\"params\":{},\"smId\":1,\"updateTime\":\"2024-03-28 14:23:36\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-28 14:23:36', 4);
INSERT INTO `sys_oper_log` VALUES (153, '教材', 2, 'com.ruoyi.web.controller.system.JcController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/jc', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-03-28 14:19:08\",\"id\":10,\"img\":\"http://localhost:8080/微信截图_20240328142433.png\",\"jcJj\":\"《Java核心技术卷1、2》。作者是Cay S. Horstmann，这本书系统介绍了Java的主要包和类，适合有一定Java基础的读者深入学习。\",\"jcMc\":\"Java核心技术卷1\",\"params\":{},\"smId\":1,\"updateTime\":\"2024-03-28 14:24:44\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-28 14:24:44', 4);
INSERT INTO `sys_oper_log` VALUES (154, '教材', 2, 'com.ruoyi.web.controller.system.JcController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/jc', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-03-28 14:19:08\",\"id\":10,\"img\":\"http://localhost:8080/微信截图_20240328142433.png\",\"jcJj\":\"《Java核心技术卷1、2》。作者是Cay S. Horstmann，这本书系统介绍了Java的主要包和类，适合有一定Java基础的读者深入学习。\",\"jcMc\":\"Java核心技术卷1\",\"params\":{},\"smId\":1,\"updateTime\":\"2024-03-28 14:25:04\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-28 14:25:04', 102);
INSERT INTO `sys_oper_log` VALUES (155, '教材', 2, 'com.ruoyi.web.controller.system.JcController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/jc', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-03-28 14:19:08\",\"id\":10,\"img\":\"http://localhost:8080/微信截图_20240328142433.png\",\"jcJj\":\"《Java核心技术卷1、2》。作者是Cay S. Horstmann，这本书系统介绍了Java的主要包和类，适合有一定Java基础的读者深入学习。\",\"jcMc\":\"Java核心技术卷1\",\"params\":{},\"smId\":1,\"updateTime\":\"2024-03-28 14:25:17\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-28 14:25:17', 20);
INSERT INTO `sys_oper_log` VALUES (156, '教材', 2, 'com.ruoyi.web.controller.system.JcController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/jc', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-03-28 14:19:29\",\"id\":11,\"img\":\"http://localhost:8080/微信截图_20240328142433.png\",\"jcJj\":\"《Java核心技术卷1、2》。作者是Cay S. Horstmann，这本书系统介绍了Java的主要包和类，适合有一定Java基础的读者深入学习。\",\"jcMc\":\"Java核心技术卷2\",\"params\":{},\"smId\":1,\"updateTime\":\"2024-03-28 14:25:27\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-28 14:25:27', 5);
INSERT INTO `sys_oper_log` VALUES (157, '教材', 2, 'com.ruoyi.web.controller.system.JcController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/jc', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-03-28 14:19:55\",\"id\":12,\"img\":\"http://localhost:8080/微信截图_20240328142557.png\",\"jcJj\":\"《Java并发编程实战》。这本书介绍了Java并发编程的相关知识，包括多线程和并发工具的使用，适合对Java并发编程有兴趣的读者。\",\"jcMc\":\"Java并发编程实战\",\"params\":{},\"smId\":1,\"updateTime\":\"2024-03-28 14:26:07\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-28 14:26:07', 7);
INSERT INTO `sys_oper_log` VALUES (158, '教材', 2, 'com.ruoyi.web.controller.system.JcController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/jc', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-03-28 14:19:55\",\"id\":12,\"img\":\"http://localhost:8080/微信截图_20240328142557.png\",\"jcJj\":\"《Java并发编程实战》。这本书介绍了Java并发编程的相关知识，包括多线程和并发工具的使用，适合对Java并发编程有兴趣的读者。\",\"jcMc\":\"Java并发编程实战\",\"params\":{},\"smId\":1,\"updateTime\":\"2024-03-28 14:26:54\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-28 14:26:54', 5);
INSERT INTO `sys_oper_log` VALUES (159, '教材', 2, 'com.ruoyi.web.controller.system.JcController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/jc', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-03-28 14:20:10\",\"id\":13,\"img\":\"http://localhost:8080/微信截图_20240328142721.png\",\"jcJj\":\"《重构：改善既有代码的设计》。作者是Martin Fowler，这本书讲述了如何通过重构改善既有代码的设计，适合有一定编程经验的读者。\",\"jcMc\":\"重构：改善既有代码的设计\",\"params\":{},\"smId\":1,\"updateTime\":\"2024-03-28 14:27:33\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-28 14:27:33', 24);
INSERT INTO `sys_oper_log` VALUES (160, '教材', 2, 'com.ruoyi.web.controller.system.JcController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/jc', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-03-28 14:20:31\",\"id\":14,\"img\":\"http://localhost:8080/微信截图_20240328142757.png\",\"jcJj\":\"《Head First Java》。这本书是面向对象程序设计和Java的学习指导，以一种轻松有趣的方式讲解Java编程，适合初学者。\",\"jcMc\":\"Head First Java\",\"params\":{},\"smId\":1,\"updateTime\":\"2024-03-28 14:28:09\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-28 14:28:09', 5);
INSERT INTO `sys_oper_log` VALUES (161, '教材', 2, 'com.ruoyi.web.controller.system.JcController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/jc', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-03-28 14:20:10\",\"id\":13,\"img\":\"http://localhost:8080/微信截图_20240328142721.png\",\"jcJj\":\"《重构：改善既有代码的设计》。作者是Martin Fowler，这本书讲述了如何通过重构改善既有代码的设计，适合有一定编程经验的读者。\",\"jcMc\":\"重构：改善既有代码的设计\",\"params\":{},\"smId\":1,\"updateTime\":\"2024-03-28 14:29:16\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-28 14:29:16', 4);
INSERT INTO `sys_oper_log` VALUES (162, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014],\"params\":{},\"roleId\":100,\"roleKey\":\"shushang\",\"roleName\":\"书商\",\"roleSort\":3,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 10:54:40', 78);
INSERT INTO `sys_oper_log` VALUES (163, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014],\"params\":{},\"roleId\":101,\"roleKey\":\"kechengfuzeren\",\"roleName\":\"课程负责人\",\"roleSort\":4,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 10:57:54', 15);
INSERT INTO `sys_oper_log` VALUES (164, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"oa_jc_select\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 11:25:53', 852);
INSERT INTO `sys_oper_log` VALUES (165, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/oa_jc_select', '127.0.0.1', '内网IP', '{}', NULL, 1, '同步数据失败，原表结构不存在', '2024-03-30 11:26:22', 10);
INSERT INTO `sys_oper_log` VALUES (166, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 11:26:25', 11);
INSERT INTO `sys_oper_log` VALUES (167, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"t_jc_select\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 11:26:29', 29);
INSERT INTO `sys_oper_log` VALUES (168, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"select\",\"className\":\"JcSelect\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":21,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-03-30 11:26:29\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"JcId\",\"columnComment\":\"教材ID\",\"columnId\":22,\"columnName\":\"jc_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-03-30 11:26:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"jcId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"课程负责人\",\"columnId\":23,\"columnName\":\"create_by\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-30 11:26:29\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":24,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-03-30 11:26:29\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"Date\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"quer', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 11:26:37', 29);
INSERT INTO `sys_oper_log` VALUES (169, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"jcSelect\",\"className\":\"JcSelect\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":21,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-03-30 11:26:29\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-03-30 11:26:37\",\"usableColumn\":false},{\"capJavaField\":\"JcId\",\"columnComment\":\"教材ID\",\"columnId\":22,\"columnName\":\"jc_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-03-30 11:26:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"jcId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-03-30 11:26:37\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"课程负责人\",\"columnId\":23,\"columnName\":\"create_by\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-30 11:26:29\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-03-30 11:26:37\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":24,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-03-30 11:26:29\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequi', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 11:27:06', 22);
INSERT INTO `sys_oper_log` VALUES (170, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"jcSelect\",\"className\":\"JcSelect\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":21,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-03-30 11:26:29\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-03-30 11:27:06\",\"usableColumn\":false},{\"capJavaField\":\"JcId\",\"columnComment\":\"教材ID\",\"columnId\":22,\"columnName\":\"jc_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-03-30 11:26:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"jcId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-03-30 11:27:06\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"课程负责人\",\"columnId\":23,\"columnName\":\"create_by\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-30 11:26:29\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-03-30 11:27:06\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":24,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-03-30 11:26:29\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequi', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 11:28:08', 23);
INSERT INTO `sys_oper_log` VALUES (171, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"t_jc_select\"}', NULL, 0, NULL, '2024-03-30 11:28:11', 350);
INSERT INTO `sys_oper_log` VALUES (172, '教材选择', 1, 'com.ruoyi.web.controller.system.JcSelectController.add()', 'POST', 1, 'admin', '研发部门', '/system/jcSelect/', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-03-30 13:11:25\",\"jcId\":3,\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\Admin\\Desktop\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\JcSelectMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.JcSelectMapper.insertJcSelect-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_jc_select          ( jc_id,                          create_time )           values ( ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2024-03-30 13:11:25', 19642);
INSERT INTO `sys_oper_log` VALUES (173, '教材选择', 1, 'com.ruoyi.web.controller.system.JcSelectController.add()', 'POST', 1, 'admin', '研发部门', '/system/jcSelect/', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-03-30 13:12:50\",\"jcId\":3,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 13:12:50', 39);
INSERT INTO `sys_oper_log` VALUES (174, '教材选择', 1, 'com.ruoyi.web.controller.system.JcSelectController.add()', 'POST', 1, 'admin', '研发部门', '/system/jcSelect/', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-03-30 14:05:05\",\"jcId\":6,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 14:05:05', 47);
INSERT INTO `sys_oper_log` VALUES (175, '教材选择', 1, 'com.ruoyi.web.controller.system.JcSelectController.add()', 'POST', 1, 'admin', '研发部门', '/system/jcSelect/', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-03-30 14:16:24\",\"jcId\":11,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 14:16:24', 32);
INSERT INTO `sys_oper_log` VALUES (176, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/jcSelect/index\",\"createTime\":\"2024-03-30 11:29:31\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2015,\"menuName\":\"教材审核\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2008,\"path\":\"jcSelect\",\"perms\":\"system:jcSelect:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 15:24:47', 27);
INSERT INTO `sys_oper_log` VALUES (177, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"审核状态\",\"dictType\":\"audit_status\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 15:34:19', 45);
INSERT INTO `sys_oper_log` VALUES (178, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"未审核\",\"dictSort\":1,\"dictType\":\"audit_status\",\"dictValue\":\"0\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 15:35:08', 23);
INSERT INTO `sys_oper_log` VALUES (179, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"审核通过\",\"dictSort\":2,\"dictType\":\"audit_status\",\"dictValue\":\"1\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 15:35:25', 18);
INSERT INTO `sys_oper_log` VALUES (180, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"审核不通过\",\"dictSort\":3,\"dictType\":\"audit_status\",\"dictValue\":\"2\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 15:35:45', 18);
INSERT INTO `sys_oper_log` VALUES (181, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"无需审核\",\"dictSort\":4,\"dictType\":\"audit_status\",\"dictValue\":\"3\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 15:36:03', 18);
INSERT INTO `sys_oper_log` VALUES (182, '教材审核', 2, 'com.ruoyi.web.controller.system.JcSelectController.audit()', 'POST', 1, 'admin', '研发部门', '/system/jcSelect/audit', '127.0.0.1', '内网IP', '{\"auditBy\":\"admin\",\"auditStatus\":1,\"auditTime\":\"2024-03-30\",\"id\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 15:47:36', 54);
INSERT INTO `sys_oper_log` VALUES (183, '教材审核', 2, 'com.ruoyi.web.controller.system.JcSelectController.audit()', 'POST', 1, 'admin', '研发部门', '/system/jcSelect/audit', '127.0.0.1', '内网IP', '{\"auditBy\":\"admin\",\"auditStatus\":1,\"auditTime\":\"2024-03-30\",\"id\":2,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 15:48:22', 5);
INSERT INTO `sys_oper_log` VALUES (184, '教材审核', 2, 'com.ruoyi.web.controller.system.JcSelectController.audit()', 'POST', 1, 'admin', '研发部门', '/system/jcSelect/audit', '127.0.0.1', '内网IP', '{\"auditBy\":\"admin\",\"auditStatus\":2,\"auditTime\":\"2024-03-30\",\"id\":3,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 15:51:23', 5);
INSERT INTO `sys_oper_log` VALUES (185, '教材审核', 2, 'com.ruoyi.web.controller.system.JcSelectController.audit()', 'POST', 1, 'admin', '研发部门', '/system/jcSelect/audit', '127.0.0.1', '内网IP', '{\"auditBy\":\"admin\",\"auditStatus\":1,\"auditTime\":\"2024-03-30\",\"id\":3,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-30 15:54:38', 5);
INSERT INTO `sys_oper_log` VALUES (186, '教材选择', 1, 'com.ruoyi.web.controller.system.JcSelectController.add()', 'POST', 1, 'admin', '研发部门', '/system/jcSelect/', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-03-31 10:11:58\",\"jcId\":12,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-31 10:11:58', 39);
INSERT INTO `sys_oper_log` VALUES (187, '教材审核', 2, 'com.ruoyi.web.controller.system.JcSelectController.audit()', 'POST', 1, 'admin', '研发部门', '/system/jcSelect/audit', '127.0.0.1', '内网IP', '{\"auditBy\":\"admin\",\"auditStatus\":2,\"auditTime\":\"2024-03-31\",\"id\":4,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-31 10:12:28', 7);
INSERT INTO `sys_oper_log` VALUES (188, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"教材采购\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"a\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-31 10:16:50', 16);
INSERT INTO `sys_oper_log` VALUES (189, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-03-31 10:16:50\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2021,\"menuName\":\"教材采购\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2008,\"path\":\"a\",\"perms\":\"system:jcCg:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-31 10:17:37', 9);
INSERT INTO `sys_oper_log` VALUES (190, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/jcCg/index\",\"createTime\":\"2024-03-31 10:16:50\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2021,\"menuName\":\"教材采购\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2008,\"path\":\"a\",\"perms\":\"system:jcCg:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-31 10:18:01', 8);
INSERT INTO `sys_oper_log` VALUES (191, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"t_jc_cg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-31 10:43:32', 87);
INSERT INTO `sys_oper_log` VALUES (192, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"cg\",\"className\":\"JcCg\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":28,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-03-31 10:43:32\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"JcId\",\"columnComment\":\"教材ID\",\"columnId\":29,\"columnName\":\"jc_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-03-31 10:43:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"jcId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Count\",\"columnComment\":\"采购数量 \",\"columnId\":30,\"columnName\":\"count\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-03-31 10:43:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"count\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"采购人\",\"columnId\":31,\"columnName\":\"create_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-31 10:43:32\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createBy\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-31 10:43:51', 92);
INSERT INTO `sys_oper_log` VALUES (193, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"jcCg\",\"className\":\"JcCg\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":28,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-03-31 10:43:32\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2024-03-31 10:43:51\",\"usableColumn\":false},{\"capJavaField\":\"JcId\",\"columnComment\":\"教材ID\",\"columnId\":29,\"columnName\":\"jc_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-03-31 10:43:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"jcId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2024-03-31 10:43:51\",\"usableColumn\":false},{\"capJavaField\":\"Count\",\"columnComment\":\"采购数量 \",\"columnId\":30,\"columnName\":\"count\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-03-31 10:43:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"count\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2024-03-31 10:43:51\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"采购人\",\"columnId\":31,\"columnName\":\"create_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-31 10:43:32\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"is', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-31 10:44:09', 28);
INSERT INTO `sys_oper_log` VALUES (194, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"t_jc_cg\"}', NULL, 0, NULL, '2024-03-31 10:44:13', 274);
INSERT INTO `sys_oper_log` VALUES (195, '教材审核', 2, 'com.ruoyi.web.controller.system.JcSelectController.audit()', 'POST', 1, 'admin', '研发部门', '/system/jcSelect/audit', '127.0.0.1', '内网IP', '{\"auditBy\":\"admin\",\"auditTime\":\"2024-03-31\",\"id\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-31 10:52:44', 27);
INSERT INTO `sys_oper_log` VALUES (196, '采购单', 1, 'com.ruoyi.web.controller.system.JcCgController.add()', 'POST', 1, 'admin', '研发部门', '/system/jcCg', '127.0.0.1', '内网IP', '{\"count\":2,\"createBy\":\"admin\",\"createTime\":\"2024-03-31 11:14:03\",\"id\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-31 11:14:03', 5343);
INSERT INTO `sys_oper_log` VALUES (197, '采购单', 1, 'com.ruoyi.web.controller.system.JcCgController.add()', 'POST', 1, 'admin', '研发部门', '/system/jcCg', '127.0.0.1', '内网IP', '{\"count\":1,\"createBy\":\"admin\",\"createTime\":\"2024-03-31 11:15:16\",\"id\":2,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-31 11:15:16', 10);
INSERT INTO `sys_oper_log` VALUES (198, '采购单', 1, 'com.ruoyi.web.controller.system.JcCgController.add()', 'POST', 1, 'admin', '研发部门', '/system/jcCg', '127.0.0.1', '内网IP', '{\"count\":1,\"createBy\":\"admin\",\"createTime\":\"2024-03-31 11:18:26\",\"id\":3,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-31 11:18:26', 177409);
INSERT INTO `sys_oper_log` VALUES (199, '采购单', 1, 'com.ruoyi.web.controller.system.JcCgController.add()', 'POST', 1, 'admin', '研发部门', '/system/jcCg', '127.0.0.1', '内网IP', '{\"count\":2,\"createBy\":\"admin\",\"createTime\":\"2024-03-31 11:18:54\",\"id\":4,\"jcId\":6,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-31 11:18:54', 40);
INSERT INTO `sys_oper_log` VALUES (200, '采购单', 1, 'com.ruoyi.web.controller.system.JcCgController.add()', 'POST', 1, 'admin', '研发部门', '/system/jcCg', '127.0.0.1', '内网IP', '{\"count\":11,\"createBy\":\"admin\",\"createTime\":\"2024-03-31 11:19:20\",\"id\":5,\"jcId\":11,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-31 11:19:20', 19);
INSERT INTO `sys_oper_log` VALUES (201, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"shopping\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"采购管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"cggl\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-31 11:30:42', 45);
INSERT INTO `sys_oper_log` VALUES (202, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/jcCg/index\",\"createTime\":\"2024-03-31 10:16:50\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2021,\"menuName\":\"教材采购\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2022,\"path\":\"a\",\"perms\":\"system:jcCg:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-31 11:30:59', 13);
INSERT INTO `sys_oper_log` VALUES (203, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"采购单\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"system\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-31 11:32:04', 8);
INSERT INTO `sys_oper_log` VALUES (204, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system:cgd:index\",\"createTime\":\"2024-03-31 11:32:04\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2023,\"menuName\":\"采购单\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2022,\"path\":\"system/cgd/index\",\"perms\":\"system\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-31 11:32:51', 7);
INSERT INTO `sys_oper_log` VALUES (205, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system:cgd:index\",\"createTime\":\"2024-03-31 11:32:04\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2023,\"menuName\":\"采购单\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2022,\"path\":\"system/cgd/index\",\"perms\":\"system\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-31 11:33:04', 8);
INSERT INTO `sys_oper_log` VALUES (206, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"我的采购单\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2022,\"path\":\"1\",\"perms\":\"1\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-31 11:34:56', 48);
INSERT INTO `sys_oper_log` VALUES (207, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system:cgd:index\",\"createTime\":\"2024-03-31 11:32:04\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2023,\"menuName\":\"采购单\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2022,\"path\":\"system/cgd/index\",\"perms\":\"system\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-31 11:35:11', 12);
INSERT INTO `sys_oper_log` VALUES (208, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/jcCg/index\",\"createTime\":\"2024-03-31 10:16:50\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2021,\"menuName\":\"教材采购\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2022,\"path\":\"a\",\"perms\":\"system:jcCg:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-31 11:35:30', 9);
INSERT INTO `sys_oper_log` VALUES (209, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system:cgd:index\",\"createTime\":\"2024-03-31 11:32:04\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2023,\"menuName\":\"采购单\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2022,\"path\":\"system/cgd/index\",\"perms\":\"system\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-31 11:35:36', 9);
INSERT INTO `sys_oper_log` VALUES (210, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-03-31 11:34:56\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2024,\"menuName\":\"我的采购单\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2022,\"path\":\"system:cgd:index\",\"perms\":\"system:mycgd:index\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-31 11:36:02', 8);
INSERT INTO `sys_oper_log` VALUES (211, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-03-31 11:32:04\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2023,\"menuName\":\"采购单\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2022,\"path\":\"system/cgd/index\",\"perms\":\"system:cgd:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-31 11:37:08', 7);
INSERT INTO `sys_oper_log` VALUES (212, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/cgd/index\",\"createTime\":\"2024-03-31 11:32:04\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2023,\"menuName\":\"采购单\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2022,\"path\":\"b\",\"perms\":\"system:cgd:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-31 11:37:56', 9);
INSERT INTO `sys_oper_log` VALUES (213, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system:cgd:index\",\"createTime\":\"2024-03-31 11:34:56\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2024,\"menuName\":\"我的采购单\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2022,\"path\":\"c\",\"perms\":\"system:mycgd:index\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-31 11:38:05', 7);
INSERT INTO `sys_oper_log` VALUES (214, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/sm/index\",\"createTime\":\"2024-03-25 17:52:30\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"书目列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"sm\",\"perms\":\"system:sm:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-31 11:38:51', 8);
INSERT INTO `sys_oper_log` VALUES (215, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/jc/index\",\"createTime\":\"2024-03-26 14:29:21\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"教材列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2008,\"path\":\"jc\",\"perms\":\"system:jc:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-31 11:38:59', 7);
INSERT INTO `sys_oper_log` VALUES (216, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-03-25 17:15:59\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":98,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-31 11:39:26', 6);
INSERT INTO `sys_oper_log` VALUES (217, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"是否支付\",\"dictType\":\"pay_status\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-06 15:24:37', 36);
INSERT INTO `sys_oper_log` VALUES (218, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"未支付\",\"dictSort\":0,\"dictType\":\"pay_status\",\"dictValue\":\"0\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-06 15:24:51', 17);
INSERT INTO `sys_oper_log` VALUES (219, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已支付\",\"dictSort\":0,\"dictType\":\"pay_status\",\"dictValue\":\"1\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-06 15:25:03', 14);
INSERT INTO `sys_oper_log` VALUES (220, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-03-31 11:34:56\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2024,\"menuName\":\"我的采购单\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2022,\"path\":\"c\",\"perms\":\"system:cgd:index\",\"query\":\"system:mycgd:index\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-06 15:37:55', 21);
INSERT INTO `sys_oper_log` VALUES (221, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/myCgd/index\",\"createTime\":\"2024-03-31 11:34:56\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2024,\"menuName\":\"我的采购单\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2022,\"path\":\"c\",\"perms\":\"system:cgd:index\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-06 15:38:27', 9);
INSERT INTO `sys_oper_log` VALUES (222, '部门管理', 2, 'com.jcdg.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"地球村大学\",\"email\":\"abc@qq.com\",\"leader\":\"\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 16:22:37', 47);
INSERT INTO `sys_oper_log` VALUES (223, '用户管理', 3, 'com.jcdg.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/user/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 16:22:58', 310);
INSERT INTO `sys_oper_log` VALUES (224, '角色管理', 1, 'com.jcdg.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":102,\"roleKey\":\"zyfzr\",\"roleName\":\"专业负责人\",\"roleSort\":5,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 16:35:06', 54);
INSERT INTO `sys_oper_log` VALUES (225, '角色管理', 1, 'com.jcdg.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":103,\"roleKey\":\"xuesheng\",\"roleName\":\"学生\",\"roleSort\":6,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 16:35:36', 16);
INSERT INTO `sys_oper_log` VALUES (226, '角色管理', 1, 'com.jcdg.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":104,\"roleKey\":\"jwry\",\"roleName\":\"教务人员\",\"roleSort\":7,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 16:35:51', 11);
INSERT INTO `sys_oper_log` VALUES (227, '角色管理', 1, 'com.jcdg.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":105,\"roleKey\":\"8\",\"roleName\":\"图书代办\",\"roleSort\":0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 16:36:09', 12);
INSERT INTO `sys_oper_log` VALUES (228, '角色管理', 2, 'com.jcdg.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-04-14 16:36:09\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":105,\"roleKey\":\"tushudaiban\",\"roleName\":\"图书代办\",\"roleSort\":8,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 16:36:23', 39);
INSERT INTO `sys_oper_log` VALUES (229, '角色管理', 2, 'com.jcdg.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-03-30 10:54:40\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2008,2000,2002,2003,2004,2005,2006,2007,2009,2010,2011,2012,2013,2014],\"params\":{},\"roleId\":100,\"roleKey\":\"shushang\",\"roleName\":\"书商\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 16:37:23', 55);
INSERT INTO `sys_oper_log` VALUES (230, '角色管理', 2, 'com.jcdg.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-03-30 10:57:54\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2002,2008,2003,2007,2009,2010,2011,2012,2013,2014],\"params\":{},\"roleId\":101,\"roleKey\":\"kechengfuzeren\",\"roleName\":\"课程负责人\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 16:38:23', 15);
INSERT INTO `sys_oper_log` VALUES (231, '菜单管理', 1, 'com.jcdg.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"选择教材\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2008,\"perms\":\"system:jc:select\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 16:48:39', 44);
INSERT INTO `sys_oper_log` VALUES (232, '角色管理', 2, 'com.jcdg.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-03-30 10:57:54\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2002,2008,2003,2007,2009,2010,2011,2012,2013,2014,2025],\"params\":{},\"roleId\":101,\"roleKey\":\"kechengfuzeren\",\"roleName\":\"课程负责人\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 16:49:21', 84);
INSERT INTO `sys_oper_log` VALUES (233, '菜单管理', 2, 'com.jcdg.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-04-14 16:48:39\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2025,\"menuName\":\"选择教材\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2009,\"path\":\"\",\"perms\":\"system:jc:select\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 16:52:20', 20);
INSERT INTO `sys_oper_log` VALUES (234, '菜单管理', 2, 'com.jcdg.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-04-14 16:48:39\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2025,\"menuName\":\"选择教材\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":2009,\"path\":\"\",\"perms\":\"system:jc:select\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 16:52:44', 22);
INSERT INTO `sys_oper_log` VALUES (235, '角色管理', 2, 'com.jcdg.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-03-30 10:57:54\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2002,2008,2003,2007,2009,2010,2011,2012,2013,2014,2025,2022,2021,2023,2024],\"params\":{},\"roleId\":101,\"roleKey\":\"kechengfuzeren\",\"roleName\":\"课程负责人\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 16:53:27', 29);
INSERT INTO `sys_oper_log` VALUES (236, '角色管理', 2, 'com.jcdg.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-03-30 10:54:40\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2008,2009,2000,2002,2003,2004,2005,2006,2007,2010,2011,2012,2013,2014,2022,2021,2023,2024],\"params\":{},\"roleId\":100,\"roleKey\":\"shushang\",\"roleName\":\"书商\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 16:53:35', 26);
INSERT INTO `sys_oper_log` VALUES (237, '角色管理', 2, 'com.jcdg.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-04-14 16:35:06\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2002,2008,2009,2003,2007,2010,2014,2015,2016,2017,2018,2019,2020],\"params\":{},\"roleId\":102,\"roleKey\":\"zyfzr\",\"roleName\":\"专业负责人\",\"roleSort\":5,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 16:55:12', 27);
INSERT INTO `sys_oper_log` VALUES (238, '菜单管理', 1, 'com.jcdg.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"审核\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":2015,\"perms\":\"system:jcSelect:audit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 16:59:51', 10);
INSERT INTO `sys_oper_log` VALUES (239, '角色管理', 2, 'com.jcdg.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-04-14 16:35:06\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2002,2008,2009,2015,2003,2007,2010,2014,2016,2020,2026,2022,2021,2023,2024],\"params\":{},\"roleId\":102,\"roleKey\":\"zyfzr\",\"roleName\":\"专业负责人\",\"roleSort\":5,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 17:00:31', 54);
INSERT INTO `sys_oper_log` VALUES (240, '菜单管理', 1, 'com.jcdg.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"加入采购单\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2021,\"perms\":\"system:jcSelect:addCg\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 17:01:58', 6);
INSERT INTO `sys_oper_log` VALUES (241, '角色管理', 2, 'com.jcdg.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-04-14 16:35:36\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2002,2008,2009,2015,2003,2007,2010,2014,2016,2020,2022,2021,2027,2023,2024],\"params\":{},\"roleId\":103,\"roleKey\":\"xuesheng\",\"roleName\":\"学生\",\"roleSort\":6,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 17:02:55', 13);
INSERT INTO `sys_oper_log` VALUES (242, '角色管理', 2, 'com.jcdg.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-04-14 16:35:51\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2002,2008,2009,2015,2003,2007,2010,2014,2016,2020,2022,2021,2027,2023,2024],\"params\":{},\"roleId\":104,\"roleKey\":\"jwry\",\"roleName\":\"教务人员\",\"roleSort\":7,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 17:04:24', 54);
INSERT INTO `sys_oper_log` VALUES (243, '部门管理', 3, 'com.jcdg.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/108', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 22:00:40', 39);
INSERT INTO `sys_oper_log` VALUES (244, '部门管理', 3, 'com.jcdg.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/109', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 22:00:43', 26);
INSERT INTO `sys_oper_log` VALUES (245, '部门管理', 3, 'com.jcdg.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/102', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 22:00:45', 21);
INSERT INTO `sys_oper_log` VALUES (246, '部门管理', 3, 'com.jcdg.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/107', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 22:00:49', 23);
INSERT INTO `sys_oper_log` VALUES (247, '部门管理', 3, 'com.jcdg.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/106', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 22:00:51', 21);
INSERT INTO `sys_oper_log` VALUES (248, '部门管理', 3, 'com.jcdg.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/105', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 22:00:52', 20);
INSERT INTO `sys_oper_log` VALUES (249, '部门管理', 3, 'com.jcdg.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/104', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 22:00:54', 21);
INSERT INTO `sys_oper_log` VALUES (250, '部门管理', 3, 'com.jcdg.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2024-04-14 22:00:56', 10);
INSERT INTO `sys_oper_log` VALUES (251, '部门管理', 2, 'com.jcdg.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"信息工程学院\",\"email\":\"zhangsan@qq.com\",\"leader\":\"张三\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"地球村大学\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 22:01:07', 41);
INSERT INTO `sys_oper_log` VALUES (252, '部门管理', 2, 'com.jcdg.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"教务处\",\"email\":\"zhangsan@qq.com\",\"leader\":\"张三\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"parentName\":\"信息工程学院\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 22:01:14', 26);
INSERT INTO `sys_oper_log` VALUES (253, '用户管理', 1, 'com.jcdg.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":103,\"nickName\":\"shushang\",\"params\":{},\"postIds\":[],\"roleIds\":[100],\"status\":\"0\",\"userId\":100,\"userName\":\"书商\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 22:02:00', 136);
INSERT INTO `sys_oper_log` VALUES (254, '用户管理', 1, 'com.jcdg.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":103,\"nickName\":\"kcfzr\",\"params\":{},\"postIds\":[],\"roleIds\":[101],\"status\":\"0\",\"userId\":101,\"userName\":\"课程负责人\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 22:02:30', 123);
INSERT INTO `sys_oper_log` VALUES (255, '用户管理', 1, 'com.jcdg.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":103,\"nickName\":\"zyfzr\",\"params\":{},\"postIds\":[],\"roleIds\":[102],\"status\":\"0\",\"userId\":102,\"userName\":\"专业负责人\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 22:02:46', 119);
INSERT INTO `sys_oper_log` VALUES (256, '用户管理', 1, 'com.jcdg.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"学生\",\"params\":{},\"postIds\":[],\"roleIds\":[103],\"status\":\"0\",\"userId\":103,\"userName\":\"xuesheng\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 22:03:12', 114);
INSERT INTO `sys_oper_log` VALUES (257, '用户管理', 3, 'com.jcdg.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/user/100', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 22:03:25', 26);
INSERT INTO `sys_oper_log` VALUES (258, '用户管理', 1, 'com.jcdg.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"nickName\":\"ss\",\"params\":{},\"postIds\":[],\"roleIds\":[100],\"status\":\"0\",\"userId\":104,\"userName\":\"书商\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 22:03:41', 117);
INSERT INTO `sys_oper_log` VALUES (259, '用户管理', 3, 'com.jcdg.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/user/104', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 22:03:47', 18);
INSERT INTO `sys_oper_log` VALUES (260, '用户管理', 3, 'com.jcdg.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/user/101', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 22:03:51', 25);
INSERT INTO `sys_oper_log` VALUES (261, '用户管理', 3, 'com.jcdg.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/user/102', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 22:03:53', 14);
INSERT INTO `sys_oper_log` VALUES (262, '用户管理', 1, 'com.jcdg.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"nickName\":\"书商\",\"params\":{},\"postIds\":[],\"roleIds\":[100],\"status\":\"0\",\"userId\":105,\"userName\":\"shushang\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 22:04:08', 119);
INSERT INTO `sys_oper_log` VALUES (263, '用户管理', 1, 'com.jcdg.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":103,\"nickName\":\"课程负责人\",\"params\":{},\"postIds\":[],\"roleIds\":[101],\"status\":\"0\",\"userId\":106,\"userName\":\"kcfzr\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 22:04:23', 117);
INSERT INTO `sys_oper_log` VALUES (264, '用户管理', 1, 'com.jcdg.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":103,\"nickName\":\"专业负责人\",\"params\":{},\"postIds\":[],\"roleIds\":[102],\"status\":\"0\",\"userId\":107,\"userName\":\"zyfzr\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 22:04:48', 113);
INSERT INTO `sys_oper_log` VALUES (265, '用户管理', 1, 'com.jcdg.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":103,\"nickName\":\"教务人员\",\"params\":{},\"postIds\":[],\"roleIds\":[104],\"status\":\"0\",\"userId\":108,\"userName\":\"jwry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 22:05:05', 117);
INSERT INTO `sys_oper_log` VALUES (266, '用户管理', 1, 'com.jcdg.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":103,\"nickName\":\"图书代办\",\"params\":{},\"postIds\":[],\"roleIds\":[105],\"status\":\"0\",\"userId\":109,\"userName\":\"tsdb\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 22:05:23', 125);
INSERT INTO `sys_oper_log` VALUES (267, '菜单管理', 3, 'com.jcdg.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '教务处', '/system/menu/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2024-04-14 22:10:31', 7);
INSERT INTO `sys_oper_log` VALUES (268, '菜单管理', 3, 'com.jcdg.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '教务处', '/system/menu/117', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2024-04-14 22:10:51', 9);
INSERT INTO `sys_oper_log` VALUES (269, '书目', 1, 'com.jcdg.web.controller.system.SmController.add()', 'POST', 1, 'shushang', '地球村大学', '/system/sm', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-04-14 22:15:19\",\"params\":{},\"smmc\":\"11\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 22:15:19', 22);
INSERT INTO `sys_oper_log` VALUES (270, '教材选择', 1, 'com.jcdg.web.controller.system.JcSelectController.add()', 'POST', 1, 'kcfzr', '教务处', '/system/jcSelect/', '127.0.0.1', '内网IP', '{\"createBy\":\"kcfzr\",\"createTime\":\"2024-04-14 22:36:49\",\"jcId\":9,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 22:36:49', 38);
INSERT INTO `sys_oper_log` VALUES (271, '教材选择', 1, 'com.jcdg.web.controller.system.JcSelectController.add()', 'POST', 1, 'kcfzr', '教务处', '/system/jcSelect/', '127.0.0.1', '内网IP', '{\"createBy\":\"kcfzr\",\"createTime\":\"2024-04-14 22:37:00\",\"jcId\":15,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 22:37:00', 15);
INSERT INTO `sys_oper_log` VALUES (272, '教材审核', 2, 'com.jcdg.web.controller.system.JcSelectController.audit()', 'POST', 1, 'zyfzr', '教务处', '/system/jcSelect/audit', '127.0.0.1', '内网IP', '{\"auditBy\":\"zyfzr\",\"auditStatus\":1,\"auditTime\":\"2024-04-14\",\"id\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 22:38:54', 15);
INSERT INTO `sys_oper_log` VALUES (273, '教材选择', 1, 'com.jcdg.web.controller.system.JcSelectController.add()', 'POST', 1, 'kcfzr', '教务处', '/system/jcSelect/', '127.0.0.1', '内网IP', '{\"createBy\":\"kcfzr\",\"createTime\":\"2024-04-14 22:40:15\",\"jcId\":14,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 22:40:15', 24);
INSERT INTO `sys_oper_log` VALUES (274, '教材审核', 2, 'com.jcdg.web.controller.system.JcSelectController.audit()', 'POST', 1, 'zyfzr', '教务处', '/system/jcSelect/audit', '127.0.0.1', '内网IP', '{\"auditBy\":\"zyfzr\",\"auditStatus\":1,\"auditTime\":\"2024-04-14\",\"id\":7,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 22:40:45', 15);
INSERT INTO `sys_oper_log` VALUES (275, '菜单管理', 2, 'com.jcdg.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '教务处', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/jcCg/index\",\"createTime\":\"2024-03-31 10:16:50\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2021,\"menuName\":\"教材采购\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2022,\"path\":\"a\",\"perms\":\"system:jcSelect:listAudit\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 22:44:39', 27);
INSERT INTO `sys_oper_log` VALUES (276, '采购单', 1, 'com.jcdg.web.controller.system.JcCgController.add()', 'POST', 1, 'admin', '教务处', '/system/jcCg', '127.0.0.1', '内网IP', '{\"count\":1,\"createBy\":\"admin\",\"createTime\":\"2024-04-14 22:47:11\",\"id\":6,\"jcId\":3,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 22:47:11', 27);
INSERT INTO `sys_oper_log` VALUES (277, '采购单', 1, 'com.jcdg.web.controller.system.JcCgController.add()', 'POST', 1, 'xuesheng', NULL, '/system/jcCg', '127.0.0.1', '内网IP', '{\"count\":2,\"createBy\":\"xuesheng\",\"createTime\":\"2024-04-14 22:52:42\",\"id\":7,\"jcId\":11,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-14 22:52:42', 24);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-03-25 17:15:59', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-03-25 17:15:59', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 106 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-03-25 17:15:59', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2024-03-25 17:15:59', '', NULL, '普通角色');
INSERT INTO `sys_role` VALUES (100, '书商', 'shushang', 3, '1', 1, 1, '0', '0', 'admin', '2024-03-30 10:54:40', 'admin', '2024-04-14 16:53:35', NULL);
INSERT INTO `sys_role` VALUES (101, '课程负责人', 'kechengfuzeren', 4, '1', 1, 1, '0', '0', 'admin', '2024-03-30 10:57:54', 'admin', '2024-04-14 16:53:27', NULL);
INSERT INTO `sys_role` VALUES (102, '专业负责人', 'zyfzr', 5, '1', 1, 1, '0', '0', 'admin', '2024-04-14 16:35:06', 'admin', '2024-04-14 17:00:31', NULL);
INSERT INTO `sys_role` VALUES (103, '学生', 'xuesheng', 6, '1', 1, 1, '0', '0', 'admin', '2024-04-14 16:35:36', 'admin', '2024-04-14 17:02:55', NULL);
INSERT INTO `sys_role` VALUES (104, '教务人员', 'jwry', 7, '1', 1, 1, '0', '0', 'admin', '2024-04-14 16:35:51', 'admin', '2024-04-14 17:04:24', NULL);
INSERT INTO `sys_role` VALUES (105, '图书代办', 'tushudaiban', 8, '1', 1, 1, '0', '0', 'admin', '2024-04-14 16:36:09', 'admin', '2024-04-14 16:36:23', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (100, 2000);
INSERT INTO `sys_role_menu` VALUES (100, 2002);
INSERT INTO `sys_role_menu` VALUES (100, 2003);
INSERT INTO `sys_role_menu` VALUES (100, 2004);
INSERT INTO `sys_role_menu` VALUES (100, 2005);
INSERT INTO `sys_role_menu` VALUES (100, 2006);
INSERT INTO `sys_role_menu` VALUES (100, 2007);
INSERT INTO `sys_role_menu` VALUES (100, 2008);
INSERT INTO `sys_role_menu` VALUES (100, 2009);
INSERT INTO `sys_role_menu` VALUES (100, 2010);
INSERT INTO `sys_role_menu` VALUES (100, 2011);
INSERT INTO `sys_role_menu` VALUES (100, 2012);
INSERT INTO `sys_role_menu` VALUES (100, 2013);
INSERT INTO `sys_role_menu` VALUES (100, 2014);
INSERT INTO `sys_role_menu` VALUES (100, 2021);
INSERT INTO `sys_role_menu` VALUES (100, 2022);
INSERT INTO `sys_role_menu` VALUES (100, 2023);
INSERT INTO `sys_role_menu` VALUES (100, 2024);
INSERT INTO `sys_role_menu` VALUES (101, 2000);
INSERT INTO `sys_role_menu` VALUES (101, 2002);
INSERT INTO `sys_role_menu` VALUES (101, 2003);
INSERT INTO `sys_role_menu` VALUES (101, 2007);
INSERT INTO `sys_role_menu` VALUES (101, 2008);
INSERT INTO `sys_role_menu` VALUES (101, 2009);
INSERT INTO `sys_role_menu` VALUES (101, 2010);
INSERT INTO `sys_role_menu` VALUES (101, 2011);
INSERT INTO `sys_role_menu` VALUES (101, 2012);
INSERT INTO `sys_role_menu` VALUES (101, 2013);
INSERT INTO `sys_role_menu` VALUES (101, 2014);
INSERT INTO `sys_role_menu` VALUES (101, 2021);
INSERT INTO `sys_role_menu` VALUES (101, 2022);
INSERT INTO `sys_role_menu` VALUES (101, 2023);
INSERT INTO `sys_role_menu` VALUES (101, 2024);
INSERT INTO `sys_role_menu` VALUES (101, 2025);
INSERT INTO `sys_role_menu` VALUES (102, 2000);
INSERT INTO `sys_role_menu` VALUES (102, 2002);
INSERT INTO `sys_role_menu` VALUES (102, 2003);
INSERT INTO `sys_role_menu` VALUES (102, 2007);
INSERT INTO `sys_role_menu` VALUES (102, 2008);
INSERT INTO `sys_role_menu` VALUES (102, 2009);
INSERT INTO `sys_role_menu` VALUES (102, 2010);
INSERT INTO `sys_role_menu` VALUES (102, 2014);
INSERT INTO `sys_role_menu` VALUES (102, 2015);
INSERT INTO `sys_role_menu` VALUES (102, 2016);
INSERT INTO `sys_role_menu` VALUES (102, 2020);
INSERT INTO `sys_role_menu` VALUES (102, 2021);
INSERT INTO `sys_role_menu` VALUES (102, 2022);
INSERT INTO `sys_role_menu` VALUES (102, 2023);
INSERT INTO `sys_role_menu` VALUES (102, 2024);
INSERT INTO `sys_role_menu` VALUES (102, 2026);
INSERT INTO `sys_role_menu` VALUES (103, 2000);
INSERT INTO `sys_role_menu` VALUES (103, 2002);
INSERT INTO `sys_role_menu` VALUES (103, 2003);
INSERT INTO `sys_role_menu` VALUES (103, 2007);
INSERT INTO `sys_role_menu` VALUES (103, 2008);
INSERT INTO `sys_role_menu` VALUES (103, 2009);
INSERT INTO `sys_role_menu` VALUES (103, 2010);
INSERT INTO `sys_role_menu` VALUES (103, 2014);
INSERT INTO `sys_role_menu` VALUES (103, 2015);
INSERT INTO `sys_role_menu` VALUES (103, 2016);
INSERT INTO `sys_role_menu` VALUES (103, 2020);
INSERT INTO `sys_role_menu` VALUES (103, 2021);
INSERT INTO `sys_role_menu` VALUES (103, 2022);
INSERT INTO `sys_role_menu` VALUES (103, 2023);
INSERT INTO `sys_role_menu` VALUES (103, 2024);
INSERT INTO `sys_role_menu` VALUES (103, 2027);
INSERT INTO `sys_role_menu` VALUES (104, 2000);
INSERT INTO `sys_role_menu` VALUES (104, 2002);
INSERT INTO `sys_role_menu` VALUES (104, 2003);
INSERT INTO `sys_role_menu` VALUES (104, 2007);
INSERT INTO `sys_role_menu` VALUES (104, 2008);
INSERT INTO `sys_role_menu` VALUES (104, 2009);
INSERT INTO `sys_role_menu` VALUES (104, 2010);
INSERT INTO `sys_role_menu` VALUES (104, 2014);
INSERT INTO `sys_role_menu` VALUES (104, 2015);
INSERT INTO `sys_role_menu` VALUES (104, 2016);
INSERT INTO `sys_role_menu` VALUES (104, 2020);
INSERT INTO `sys_role_menu` VALUES (104, 2021);
INSERT INTO `sys_role_menu` VALUES (104, 2022);
INSERT INTO `sys_role_menu` VALUES (104, 2023);
INSERT INTO `sys_role_menu` VALUES (104, 2024);
INSERT INTO `sys_role_menu` VALUES (104, 2027);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '管理员', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$kIAtsa3sq.sEexs87TcNWuc.4RhSprQVxcgyA4qomqMGfnPHxszfa', '0', '0', '127.0.0.1', '2024-04-14 22:50:26', 'admin', '2024-03-25 17:15:59', '', '2024-04-14 22:50:26', '管理员');
INSERT INTO `sys_user` VALUES (100, 103, '书商', 'shushang', '00', '', '', '0', '', '$2a$10$Gmp8sF4uVKVWZ4KnqqiUReiRGqAM3SkD6TFywYTP8djxuuJcgiYA.', '0', '2', '', NULL, 'admin', '2024-04-14 22:02:00', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (101, 103, '课程负责人', 'kcfzr', '00', '', '', '0', '', '$2a$10$y6neBnpvmxHZT.pmdcRih.LAna78I61rw40rtLFqnXyz73x5IW2MO', '0', '2', '', NULL, 'admin', '2024-04-14 22:02:30', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (102, 103, '专业负责人', 'zyfzr', '00', '', '', '0', '', '$2a$10$qASjX6EFdMDIb2mruoPvfeOZ5PO5BICDu64xmXuh.348WOJsf/p22', '0', '2', '', NULL, 'admin', '2024-04-14 22:02:46', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (103, NULL, 'xuesheng', '学生', '00', '', '', '0', '', '$2a$10$Fc8rSGvDhlbOAk3jx1OZZ.W.hi7KEBJsFr5qteQy1y1sGTN4uQwiK', '0', '0', '127.0.0.1', '2024-04-14 22:52:30', 'admin', '2024-04-14 22:03:12', '', '2024-04-14 22:52:30', NULL);
INSERT INTO `sys_user` VALUES (104, 100, '书商', 'ss', '00', '', '', '0', '', '$2a$10$i8i2W6DuOyhhllwpgTNgVuyxeIkeegIgEa1Nszax58qMPw.qXlePu', '0', '2', '', NULL, 'admin', '2024-04-14 22:03:41', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (105, 100, 'shushang', '书商', '00', '', '', '0', '', '$2a$10$TIIpSKdi4zlUnT15Cu/yfuNQEcPZBn8xo61YfMj5YPXoqJTp0lYIC', '0', '0', '127.0.0.1', '2024-04-14 22:16:08', 'admin', '2024-04-14 22:04:08', '', '2024-04-14 22:16:07', NULL);
INSERT INTO `sys_user` VALUES (106, 103, 'kcfzr', '课程负责人', '00', '', '', '0', '', '$2a$10$q/G1XldRw.ZLkUHj8Z3rWeAwOpYplNcbICR7coj/eA2ZgY4HYTdVq', '0', '0', '127.0.0.1', '2024-04-14 22:40:06', 'admin', '2024-04-14 22:04:23', '', '2024-04-14 22:40:05', NULL);
INSERT INTO `sys_user` VALUES (107, 103, 'zyfzr', '专业负责人', '00', '', '', '0', '', '$2a$10$IZz0BsHS8pBKu.Mjk2x4NuP3r83oULSjIRNWDyEff93grgdq1r9Bm', '0', '0', '127.0.0.1', '2024-04-14 22:40:32', 'admin', '2024-04-14 22:04:48', '', '2024-04-14 22:40:32', NULL);
INSERT INTO `sys_user` VALUES (108, 103, 'jwry', '教务人员', '00', '', '', '0', '', '$2a$10$o6jA0LSYbVFooKZ9v3u.Aug5nKLjyFseIh0VMGNz2mE808YBMrEUy', '0', '0', '', NULL, 'admin', '2024-04-14 22:05:05', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (109, 103, 'tsdb', '图书代办', '00', '', '', '0', '', '$2a$10$iW.hkSFW4Ad1dTTBihPFmu3WXGFlyKr7QkkweAcnl3F7CnsfL4tzG', '0', '0', '', NULL, 'admin', '2024-04-14 22:05:23', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (103, 103);
INSERT INTO `sys_user_role` VALUES (105, 100);
INSERT INTO `sys_user_role` VALUES (106, 101);
INSERT INTO `sys_user_role` VALUES (107, 102);
INSERT INTO `sys_user_role` VALUES (108, 104);
INSERT INTO `sys_user_role` VALUES (109, 105);

-- ----------------------------
-- Table structure for t_jc
-- ----------------------------
DROP TABLE IF EXISTS `t_jc`;
CREATE TABLE `t_jc`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `sm_id` int NULL DEFAULT NULL COMMENT '书目id',
  `jc_mc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '教材名称',
  `jc_jj` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '教材简介',
  `img` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `audit_status` int NULL DEFAULT NULL COMMENT '1审核通过2审核不通过',
  `audit_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审核备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '教材' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_jc
-- ----------------------------
INSERT INTO `t_jc` VALUES (3, 2, '从0到1学习c++', '从0到1学习c++', 'http://localhost:8080/71a82a67-419b-4a2e-8343-bf5f5cabc4b9.jpg', NULL, '2024-03-28 14:03:08', NULL, '2024-03-28 14:17:11', NULL, NULL);
INSERT INTO `t_jc` VALUES (6, 1, '深入理解Java虚拟机：JVM高级特性与最佳实践', '《深入理解Java虚拟机：JVM高级特性与最佳实践》。作者是周志明，这本书是国内关于Java虚拟机讲得非常好的书，适合对Java虚拟机有深入了解需求的读者。', 'http://localhost:8080/微信截图_20240328142113.png', NULL, '2024-03-28 14:13:15', NULL, '2024-03-28 14:21:55', NULL, NULL);
INSERT INTO `t_jc` VALUES (9, 1, 'Java编程思想', '《Java编程思想》。作者是Bruce Eckel，这本书是Java程序员人手必备的一本书，几乎囊括了所有的Java知识点，适合作为Java编程的入门书籍。', 'http://localhost:8080/教材发行业务模型.png', NULL, '2024-03-28 14:16:17', NULL, '2024-03-28 14:18:38', NULL, NULL);
INSERT INTO `t_jc` VALUES (10, 1, 'Java核心技术卷1', '《Java核心技术卷1、2》。作者是Cay S. Horstmann，这本书系统介绍了Java的主要包和类，适合有一定Java基础的读者深入学习。', 'http://localhost:8080/微信截图_20240328142433.png', NULL, '2024-03-28 14:19:08', NULL, '2024-03-28 14:25:17', NULL, NULL);
INSERT INTO `t_jc` VALUES (11, 1, 'Java核心技术卷2', '《Java核心技术卷1、2》。作者是Cay S. Horstmann，这本书系统介绍了Java的主要包和类，适合有一定Java基础的读者深入学习。', 'http://localhost:8080/微信截图_20240328142433.png', NULL, '2024-03-28 14:19:29', NULL, '2024-03-28 14:25:27', NULL, NULL);
INSERT INTO `t_jc` VALUES (12, 1, 'Java并发编程实战', '《Java并发编程实战》。这本书介绍了Java并发编程的相关知识，包括多线程和并发工具的使用，适合对Java并发编程有兴趣的读者。', 'http://localhost:8080/微信截图_20240328142557.png', NULL, '2024-03-28 14:19:55', NULL, '2024-03-28 14:26:55', NULL, NULL);
INSERT INTO `t_jc` VALUES (13, 1, '重构：改善既有代码的设计', '《重构：改善既有代码的设计》。作者是Martin Fowler，这本书讲述了如何通过重构改善既有代码的设计，适合有一定编程经验的读者。', 'http://localhost:8080/微信截图_20240328142721.png', NULL, '2024-03-28 14:20:10', NULL, '2024-03-28 14:29:17', NULL, NULL);
INSERT INTO `t_jc` VALUES (14, 1, 'Head First Java', '《Head First Java》。这本书是面向对象程序设计和Java的学习指导，以一种轻松有趣的方式讲解Java编程，适合初学者。', 'http://localhost:8080/微信截图_20240328142757.png', NULL, '2024-03-28 14:20:31', NULL, '2024-03-28 14:28:10', NULL, NULL);
INSERT INTO `t_jc` VALUES (15, 1, 'Effective Java', '《Effective Java》。作者是Joshua Bloch，这本书介绍了在Java编程中78条极具实用价值的经验规则，涵盖了大多数开发人员每天所面临的问题的解决方案，内容全面，结构清晰，讲解详细。', 'http://localhost:8080/微信截图_20240328142226.png', NULL, '2024-03-28 14:23:22', NULL, '2024-03-28 14:23:37', NULL, NULL);

-- ----------------------------
-- Table structure for t_jc_cg
-- ----------------------------
DROP TABLE IF EXISTS `t_jc_cg`;
CREATE TABLE `t_jc_cg`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `jc_id` bigint NULL DEFAULT NULL COMMENT '教材ID',
  `count` int NULL DEFAULT NULL COMMENT '采购数量 ',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '采购人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `is_pay` int NULL DEFAULT 0 COMMENT '是否支付',
  `pay_time` datetime NULL DEFAULT NULL COMMENT '付款时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '采购单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_jc_cg
-- ----------------------------
INSERT INTO `t_jc_cg` VALUES (4, 6, 2, 'admin', '2024-03-31 11:18:54', 1, '2024-04-06 16:18:22');
INSERT INTO `t_jc_cg` VALUES (5, 11, 11, 'admin', '2024-03-31 11:19:21', 1, '2024-04-06 16:18:22');
INSERT INTO `t_jc_cg` VALUES (6, 3, 1, 'admin', '2024-04-14 22:47:11', 0, NULL);
INSERT INTO `t_jc_cg` VALUES (7, 11, 2, 'xuesheng', '2024-04-14 22:52:42', 0, NULL);

-- ----------------------------
-- Table structure for t_jc_select
-- ----------------------------
DROP TABLE IF EXISTS `t_jc_select`;
CREATE TABLE `t_jc_select`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `jc_id` bigint NULL DEFAULT NULL COMMENT '教材ID',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '课程负责人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `audit_status` int NULL DEFAULT NULL COMMENT '审核状态',
  `audit_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审核人',
  `audit_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '教材选择表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_jc_select
-- ----------------------------
INSERT INTO `t_jc_select` VALUES (1, 3, 'admin', '2024-03-30 13:12:51', 1, 'zyfzr', '2024-04-14 22:38:55');
INSERT INTO `t_jc_select` VALUES (2, 6, 'admin', '2024-03-30 14:05:06', 1, 'admin', '2024-03-30 15:48:22');
INSERT INTO `t_jc_select` VALUES (3, 11, 'admin', '2024-03-30 14:16:25', 1, 'admin', '2024-03-30 15:54:39');
INSERT INTO `t_jc_select` VALUES (4, 12, 'admin', '2024-03-31 10:11:59', 2, 'admin', '2024-03-31 10:12:29');
INSERT INTO `t_jc_select` VALUES (5, 9, 'kcfzr', '2024-04-14 22:36:49', NULL, NULL, NULL);
INSERT INTO `t_jc_select` VALUES (6, 15, 'kcfzr', '2024-04-14 22:37:00', NULL, NULL, NULL);
INSERT INTO `t_jc_select` VALUES (7, 14, 'kcfzr', '2024-04-14 22:40:15', 1, 'zyfzr', '2024-04-14 22:40:46');

-- ----------------------------
-- Table structure for t_sm
-- ----------------------------
DROP TABLE IF EXISTS `t_sm`;
CREATE TABLE `t_sm`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `smmc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '书目表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_sm
-- ----------------------------
INSERT INTO `t_sm` VALUES (1, 'Java教程', '2024-03-25 18:02:22', NULL);
INSERT INTO `t_sm` VALUES (2, 'C++教材', '2024-03-25 18:02:36', NULL);
INSERT INTO `t_sm` VALUES (3, 'C语言编程教材', '2024-03-25 18:02:51', NULL);
INSERT INTO `t_sm` VALUES (4, '11', '2024-04-14 22:15:19', NULL);

SET FOREIGN_KEY_CHECKS = 1;
