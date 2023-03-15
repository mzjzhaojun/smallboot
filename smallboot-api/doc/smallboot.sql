/*
 Navicat Premium Data Transfer

 Source Server         : localhost_mysql_3306
 Source Server Type    : MySQL
 Source Server Version : 50726 (5.7.26-log)
 Source Host           : 127.0.0.1:3306
 Source Schema         : smallboot

 Target Server Type    : MySQL
 Target Server Version : 50726 (5.7.26-log)
 File Encoding         : 65001

 Date: 15/03/2023 19:07:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_dict`;
CREATE TABLE `t_sys_dict`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `dict_type_id` int(11) UNSIGNED NOT NULL COMMENT '字典类型id',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典类型编码',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典名',
  `value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典值',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态(0->停用 1->正常)',
  `sort` int(11) NOT NULL COMMENT '排序',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` int(11) UNSIGNED NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` int(11) UNSIGNED NOT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `is_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除(1->是，0->否)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 186 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '基础模块-数据字典' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_sys_dict
-- ----------------------------
INSERT INTO `t_sys_dict` VALUES (165, 3, 'element_icon', 'AddLocation', 'AddLocation', 1, 1, '', 1, '2020-08-30 03:05:05', 1, '2022-07-22 09:57:53', 0);
INSERT INTO `t_sys_dict` VALUES (166, 3, 'element_icon', 'Aim', 'Aim', 1, 2, '', 1, '2020-08-30 03:05:24', 1, '2022-07-22 09:58:01', 0);
INSERT INTO `t_sys_dict` VALUES (167, 3, 'element_icon', 'AlarmClock', 'AlarmClock', 1, 3, '', 1, '2020-08-30 03:05:31', 1, '2022-07-22 09:58:07', 0);
INSERT INTO `t_sys_dict` VALUES (168, 3, 'element_icon', 'Apple', 'Apple', 1, 4, '', 1, '2020-08-30 03:12:30', 1, '2022-07-22 09:58:15', 0);
INSERT INTO `t_sys_dict` VALUES (169, 3, 'element_icon', 'ArrowDown', 'ArrowDown', 1, 5, '', 1, '2020-08-30 03:14:05', 1, '2022-07-22 09:58:38', 0);
INSERT INTO `t_sys_dict` VALUES (170, 3, 'element_icon', 'ArrowDownBold', 'ArrowDownBold', 1, 6, '', 1, '2020-08-30 03:14:28', 1, '2022-07-22 09:58:45', 0);
INSERT INTO `t_sys_dict` VALUES (171, 3, 'element_icon', 'ArrowLeft', 'ArrowLeft', 1, 7, '', 1, '2020-08-30 03:14:56', 1, '2022-07-22 09:58:51', 0);
INSERT INTO `t_sys_dict` VALUES (172, 3, 'element_icon', 'ArrowRight', 'ArrowRight', 1, 8, '', 1, '2020-08-30 03:15:49', 1, '2022-07-22 09:59:05', 0);
INSERT INTO `t_sys_dict` VALUES (173, 3, 'element_icon', 'ArrowRightBold', 'ArrowRightBold', 1, 9, '', 1, '2020-08-30 03:16:51', 1, '2022-07-22 09:59:13', 0);
INSERT INTO `t_sys_dict` VALUES (174, 3, 'element_icon', 'ArrowUp', 'ArrowUp', 1, 10, '', 1, '2020-08-30 03:18:32', 1, '2022-07-22 09:59:19', 0);
INSERT INTO `t_sys_dict` VALUES (181, 6, 'oauth_type', 'gitee', '1', 1, 1, '', 1, '2020-12-06 13:16:39', 0, '2023-02-13 11:17:41', 0);
INSERT INTO `t_sys_dict` VALUES (182, 6, 'oauth_type', 'github', '2', 1, 2, NULL, 1, '2020-12-06 13:16:54', 0, '2021-08-28 00:03:02', 0);
INSERT INTO `t_sys_dict` VALUES (183, 6, 'oauth_type', 'qq', '3', 1, 3, NULL, 1, '2020-12-06 13:17:03', 0, '2021-08-28 00:03:02', 0);
INSERT INTO `t_sys_dict` VALUES (184, 3, 'element_icon', 'Monitor', 'Monitor', 1, 11, NULL, 0, '2023-02-01 16:42:06', 0, '2023-02-01 16:42:06', 0);
INSERT INTO `t_sys_dict` VALUES (185, 3, 'element_icon', 'Menu', 'Menu', 1, 12, NULL, 0, '2023-02-01 16:42:33', 0, '2023-02-01 16:42:33', 0);

-- ----------------------------
-- Table structure for t_sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_dict_type`;
CREATE TABLE `t_sys_dict_type`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典类型编码',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典类型名称(展示用)',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态(0->停用 1->正常)',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '排序',
  `is_fixed` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否固定(0->否 1->是)',
  `create_by` int(11) UNSIGNED NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` int(11) UNSIGNED NOT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `is_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除(1->是，0->否)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '基础模块-数据字典类型' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_sys_dict_type
-- ----------------------------
INSERT INTO `t_sys_dict_type` VALUES (3, 'element_icon', 'Element-Icon图标', 1, 2, 0, 1, '2020-08-30 02:52:36', 1, '2020-08-30 02:52:38', 0);
INSERT INTO `t_sys_dict_type` VALUES (6, 'oauth_type', '第三方帐号授权类型', 1, 3, 0, 1, '2020-12-06 13:11:27', 1, '2020-12-06 13:21:45', 0);

-- ----------------------------
-- Table structure for t_sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_menu`;
CREATE TABLE `t_sys_menu`  (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单名称 - 英文',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单访问路径',
  `parent_id` int(11) NULL DEFAULT 0 COMMENT '父类菜单ID',
  `sort` int(11) NULL DEFAULT NULL COMMENT '菜单排序',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件名',
  `hidden` tinyint(1) NULL DEFAULT 1 COMMENT '是否隐藏(1:隐藏 0:显示)',
  `redirect` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '重定向路径',
  `breadcrumb` tinyint(1) NULL DEFAULT 1 COMMENT '面包屑是否显示(1:显示 0:隐藏)',
  `is_show_children` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否显示子菜单(1:显示 0:隐藏)',
  `create_by` int(11) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` int(11) NOT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `is_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除(1->是，0->否)',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统管理-菜单表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_sys_menu
-- ----------------------------
INSERT INTO `t_sys_menu` VALUES (1, '首页', 'dashboard', 'House', '/', 0, 1, 'Layout', 0, '/dashboard', 1, 0, 1, '2020-08-22 15:01:51', 1, '2023-02-14 17:07:35', 0);
INSERT INTO `t_sys_menu` VALUES (2, '首页', 'dashboard', '', 'dashboard', 1, 1, 'dashboard/index', 0, '', 0, 1, 1, '2020-08-22 15:01:51', 1, '2023-02-14 15:37:51', 0);
INSERT INTO `t_sys_menu` VALUES (3, '系统管理', 'system', 'Setting', '/system', 0, 2, 'Layout', 0, NULL, 1, 1, 1, '2020-08-22 15:01:51', 1, '2020-08-30 03:17:44', 0);
INSERT INTO `t_sys_menu` VALUES (4, '用户管理', 'user', '', 'user', 3, 1, 'system/user/index', 0, '', 1, 1, 1, '2020-08-22 15:01:51', 1, '2020-08-22 15:01:51', 0);
INSERT INTO `t_sys_menu` VALUES (5, '个人中心', 'personal-center', NULL, 'personal-center', 3, 2, 'system/personal-center/index', 0, NULL, 1, 1, 1, '2020-08-22 15:01:51', 1, '2020-08-22 15:01:51', 0);
INSERT INTO `t_sys_menu` VALUES (6, '角色管理', 'role', NULL, 'role', 3, 3, 'system/role/list', 0, NULL, 1, 1, 1, '2020-08-22 15:01:51', 1, '2020-08-22 15:01:51', 0);
INSERT INTO `t_sys_menu` VALUES (7, '角色权限', 'roleForm', NULL, 'roleForm', 3, 4, 'system/role/form', 1, NULL, 1, 1, 1, '2020-08-22 15:01:51', 1, '2020-08-22 15:01:51', 0);
INSERT INTO `t_sys_menu` VALUES (9, '菜单管理', 'menu', '', 'menu', 3, 5, 'system/menu/index', 0, '', 1, 1, 1, '2020-08-22 15:01:51', 1, '2023-02-14 17:13:13', 0);
INSERT INTO `t_sys_menu` VALUES (10, '数据字典', 'dict', NULL, 'dict', 3, 6, 'system/dict/index', 0, NULL, 1, 1, 1, '2020-08-22 15:01:51', 1, '2020-08-22 15:01:51', 0);
INSERT INTO `t_sys_menu` VALUES (11, '系统属性', 'property', '', 'property', 3, 7, 'system/property/index', 0, '', 1, 1, 1, '2020-08-22 15:01:51', 1, '2023-02-14 15:37:51', 0);

-- ----------------------------
-- Table structure for t_sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_permission`;
CREATE TABLE `t_sys_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  `btn_id` int(11) NULL DEFAULT NULL COMMENT '按钮ID',
  `btn_perm` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '按钮权限标识',
  `url_perm` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'URL权限标识',
  `create_by` int(11) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` int(11) NOT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统管理-菜单关联权限表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_sys_permission
-- ----------------------------
INSERT INTO `t_sys_permission` VALUES (1, '查看用户分页列表', 4, 78, 'sys:user:list:page', 'GET:/web/api/system/user/listPage', 1, '2020-08-22 15:01:51', 1, '2023-02-13 16:54:33');
INSERT INTO `t_sys_permission` VALUES (2, '编辑用户', 4, 75, 'sys:user:edit', 'PUT:/web/api/system/user', 1, '2020-08-22 15:01:51', 1, '2023-02-13 16:51:45');
INSERT INTO `t_sys_permission` VALUES (3, '新增用户', 4, 76, 'sys:user:add', 'POST:/web/api/system/user', 1, '2020-08-22 15:01:51', 1, '2023-02-13 16:13:06');
INSERT INTO `t_sys_permission` VALUES (4, '删除用户', 4, 77, 'sys:user:delete', 'DELETE:/web/api/system/user', 1, '2020-08-22 15:01:51', 1, '2023-02-13 16:13:16');

-- ----------------------------
-- Table structure for t_sys_property
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_property`;
CREATE TABLE `t_sys_property`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '属性key',
  `value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '属性value',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '备注',
  `create_by` int(10) UNSIGNED NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` int(10) UNSIGNED NOT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `is_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除(1->是，0->否)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统管理-系统属性' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_sys_property
-- ----------------------------
INSERT INTO `t_sys_property` VALUES (10, 'hello', 'world', 'hello world !', 0, '2021-09-07 10:45:45', 0, '2021-09-07 10:45:45', 0);
INSERT INTO `t_sys_property` VALUES (12, 'test', '测试', 'this is test data.', 1, '2023-02-15 11:19:46', 1, '2023-02-15 14:18:15', 0);

-- ----------------------------
-- Table structure for t_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role`;
CREATE TABLE `t_sys_role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色编号',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态(1:开启(默认) 0:禁用)',
  `create_by` int(11) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` int(11) NOT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统管理-角色管理表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_sys_role
-- ----------------------------
INSERT INTO `t_sys_role` VALUES (9, '超级管理员', 'super_admin', 1, 1, '2020-08-22 15:01:51', 1, '2023-02-14 13:58:22');
INSERT INTO `t_sys_role` VALUES (10, '测试用户', 'test', 1, 1, '2022-08-05 20:00:36', 1, '2022-08-06 15:59:10');

-- ----------------------------
-- Table structure for t_sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role_menu`;
CREATE TABLE `t_sys_role_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  `create_by` int(11) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` int(11) NOT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 197 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统管理-角色菜单关联表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_sys_role_menu
-- ----------------------------
INSERT INTO `t_sys_role_menu` VALUES (185, 10, 1, 1, '2023-02-15 09:49:12', 1, '2023-02-15 09:49:12');
INSERT INTO `t_sys_role_menu` VALUES (186, 10, 2, 1, '2023-02-15 09:49:12', 1, '2023-02-15 09:49:12');
INSERT INTO `t_sys_role_menu` VALUES (187, 9, 1, 1, '2023-02-15 09:49:20', 1, '2023-02-15 09:49:20');
INSERT INTO `t_sys_role_menu` VALUES (188, 9, 2, 1, '2023-02-15 09:49:20', 1, '2023-02-15 09:49:20');
INSERT INTO `t_sys_role_menu` VALUES (189, 9, 3, 1, '2023-02-15 09:49:20', 1, '2023-02-15 09:49:20');
INSERT INTO `t_sys_role_menu` VALUES (190, 9, 4, 1, '2023-02-15 09:49:20', 1, '2023-02-15 09:49:20');
INSERT INTO `t_sys_role_menu` VALUES (191, 9, 5, 1, '2023-02-15 09:49:20', 1, '2023-02-15 09:49:20');
INSERT INTO `t_sys_role_menu` VALUES (192, 9, 6, 1, '2023-02-15 09:49:20', 1, '2023-02-15 09:49:20');
INSERT INTO `t_sys_role_menu` VALUES (193, 9, 7, 1, '2023-02-15 09:49:20', 1, '2023-02-15 09:49:20');
INSERT INTO `t_sys_role_menu` VALUES (194, 9, 9, 1, '2023-02-15 09:49:20', 1, '2023-02-15 09:49:20');
INSERT INTO `t_sys_role_menu` VALUES (195, 9, 10, 1, '2023-02-15 09:49:20', 1, '2023-02-15 09:49:20');
INSERT INTO `t_sys_role_menu` VALUES (196, 9, 11, 1, '2023-02-15 09:49:20', 1, '2023-02-15 09:49:20');

-- ----------------------------
-- Table structure for t_sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role_permission`;
CREATE TABLE `t_sys_role_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `permission_id` int(11) NOT NULL COMMENT '权限ID',
  `create_by` int(11) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` int(11) NOT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 831 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统管理-角色关联权限表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_sys_role_permission
-- ----------------------------
INSERT INTO `t_sys_role_permission` VALUES (826, 9, 1, 1, '2022-07-21 18:08:26', 1, '2022-07-21 18:08:26');
INSERT INTO `t_sys_role_permission` VALUES (827, 9, 2, 1, '2022-07-21 18:08:26', 1, '2022-07-21 18:08:26');
INSERT INTO `t_sys_role_permission` VALUES (828, 9, 3, 1, '2022-07-21 18:08:26', 1, '2022-07-21 18:08:26');
INSERT INTO `t_sys_role_permission` VALUES (829, 9, 4, 1, '2022-07-21 18:08:26', 1, '2022-07-21 18:08:26');
INSERT INTO `t_sys_role_permission` VALUES (830, 9, 5, 1, '2022-07-21 18:08:26', 1, '2022-07-21 18:08:26');

-- ----------------------------
-- Table structure for t_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user`;
CREATE TABLE `t_sys_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账号',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录密码',
  `nickname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '昵称',
  `sex` tinyint(2) NULL DEFAULT 0 COMMENT '性别(0:未知 1:男  2:女)',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `create_by` int(11) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` int(11) NOT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `is_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除(1->是，0->否)',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统管理 - 用户基础信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_sys_user
-- ----------------------------
INSERT INTO `t_sys_user` VALUES (1, 'admin', '3014dcb9ee3639535d5d9301b32c840c', '郑清', 1, '15188888888', 'zhengqingya@it.com', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif?imageView2/1/w/80/h/80', 1, '2020-08-22 15:01:51', 0, '2023-02-10 14:30:54', 0);
INSERT INTO `t_sys_user` VALUES (2, 'test', '3014dcb9ee3639535d5d9301b32c840c', '测试号', 1, '', '', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif?imageView2/1/w/80/h/80', 1, '2020-08-22 15:01:51', 1, '2023-02-13 11:56:39', 0);

-- ----------------------------
-- Table structure for t_sys_user_re_oauth
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user_re_oauth`;
CREATE TABLE `t_sys_user_re_oauth`  (
  `user_re_oauth_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int(11) NOT NULL COMMENT '用户id（关联表`t_sys_user`字段`user_id`）',
  `open_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '三方id',
  `oauth_type` tinyint(4) NOT NULL COMMENT '第三方授权类型',
  `create_by` int(11) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` int(11) NOT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`user_re_oauth_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统管理 - 用户三方授权表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_sys_user_re_oauth
-- ----------------------------

-- ----------------------------
-- Table structure for t_sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user_role`;
CREATE TABLE `t_sys_user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `create_by` int(11) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` int(11) NOT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统管理-用户角色关联表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_sys_user_role
-- ----------------------------
INSERT INTO `t_sys_user_role` VALUES (17, 1, 9, 1, '2023-02-14 13:59:07', 1, '2023-02-14 13:59:07');
INSERT INTO `t_sys_user_role` VALUES (18, 2, 10, 1, '2023-02-14 13:59:20', 1, '2023-02-14 13:59:20');

-- ----------------------------
-- Table structure for t_wx_account
-- ----------------------------
DROP TABLE IF EXISTS `t_wx_account`;
CREATE TABLE `t_wx_account`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `type` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '账号类型（1：测试号；2：服务号；3：订阅号）',
  `account` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公众号ID',
  `app_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'AppID',
  `app_secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密钥',
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务器地址',
  `token` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '令牌',
  `aes_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息加密密钥',
  `qr_code_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '二维码地址',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` int(11) NULL DEFAULT NULL COMMENT '创建人id',
  `update_by` int(11) NULL DEFAULT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信公众号-账号' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_wx_account
-- ----------------------------

-- ----------------------------
-- Table structure for t_wx_msg_auto_reply
-- ----------------------------
DROP TABLE IF EXISTS `t_wx_msg_auto_reply`;
CREATE TABLE `t_wx_msg_auto_reply`  (
  `id` int(11) NOT NULL COMMENT '主键ID',
  `app_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'AppID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `type` tinyint(1) NOT NULL COMMENT '类型（1：关注时回复；2：关键词回复）',
  `match_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关键词',
  `is_exact_match` tinyint(1) NOT NULL COMMENT '是否精确匹配（0：否；1：是）',
  `reply_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '回复消息类型（text：文本；image：图片；voice：语音；video：视频；music：音乐；news：图文）',
  `reply_content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '回复消息内容',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` int(11) NULL DEFAULT NULL COMMENT '创建人id',
  `update_by` int(11) NULL DEFAULT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信公众号-消息自动回复' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_wx_msg_auto_reply
-- ----------------------------

-- ----------------------------
-- Table structure for t_wx_template_msg
-- ----------------------------
DROP TABLE IF EXISTS `t_wx_template_msg`;
CREATE TABLE `t_wx_template_msg`  (
  `id` int(11) NOT NULL COMMENT '主键ID',
  `app_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'AppID',
  `tpl_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模板ID',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模板标题',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模板内容',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` int(11) NULL DEFAULT NULL COMMENT '创建人id',
  `update_by` int(11) NULL DEFAULT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信公众号-模板消息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_wx_template_msg
-- ----------------------------

-- ----------------------------
-- Table structure for t_wx_user
-- ----------------------------
DROP TABLE IF EXISTS `t_wx_user`;
CREATE TABLE `t_wx_user`  (
  `id` int(11) NOT NULL COMMENT '主键ID',
  `app_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'AppID',
  `open_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '微信openid',
  `nickname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '昵称',
  `head_img_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '头像',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` int(11) NULL DEFAULT NULL COMMENT '创建人id',
  `update_by` int(11) NULL DEFAULT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信公众号-用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_wx_user
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
