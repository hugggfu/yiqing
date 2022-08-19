/*
 Navicat Premium Data Transfer

 Source Server         : dzl
 Source Server Type    : MySQL
 Source Server Version : 50558
 Source Host           : localhost:3306
 Source Schema         : demo

 Target Server Type    : MySQL
 Target Server Version : 50558
 File Encoding         : 65001

 Date: 19/08/2022 13:28:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dict
-- ----------------------------
DROP TABLE IF EXISTS `dict`;
CREATE TABLE `dict`  (
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dict
-- ----------------------------
INSERT INTO `dict` VALUES ('user', 'el-icon-user', 'icon');
INSERT INTO `dict` VALUES ('house', 'el-icon-house', 'icon');
INSERT INTO `dict` VALUES ('menu', 'el-icon-menu', 'icon');
INSERT INTO `dict` VALUES ('role', 'el-icon-s-custom', 'icon');
INSERT INTO `dict` VALUES ('grid', 'el-icon-s-grid', 'icon');

-- ----------------------------
-- Table structure for manage
-- ----------------------------
DROP TABLE IF EXISTS `manage`;
CREATE TABLE `manage`  (
  `id` int(15) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `flag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '唯一标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of manage
-- ----------------------------
INSERT INTO `manage` VALUES (5, '管理员', '管理员', 'MANAGE_ADMIN');
INSERT INTO `manage` VALUES (6, '普通用户', '普通用户', 'MANAGE_ROLE');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路径',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父级id',
  `page_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '页面路径',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (3, '用户管理', '/user', NULL, NULL, 1, NULL);
INSERT INTO `menu` VALUES (5, '角色管理', '/role', NULL, NULL, 1, NULL);
INSERT INTO `menu` VALUES (6, '主页', '/home', 'el-icon-house', NULL, NULL, 'Home');
INSERT INTO `menu` VALUES (10, '系统管理', NULL, 'el-icon-s-grid', NULL, NULL, NULL);
INSERT INTO `menu` VALUES (11, '用户管理', '/user', 'el-icon-user', NULL, 10, 'User');
INSERT INTO `menu` VALUES (12, '角色管理', '/role', 'el-icon-s-custom', NULL, 10, 'Role');
INSERT INTO `menu` VALUES (13, '菜单管理', '/menu', 'el-icon-menu', NULL, 10, 'Menu');
INSERT INTO `menu` VALUES (14, '管理信息', '/admin', 'el-icon-menu', NULL, 10, 'Admin');
INSERT INTO `menu` VALUES (20, '打卡管理', '/daka', 'el-icon-user', NULL, 19, 'Daka');
INSERT INTO `menu` VALUES (21, '定位打卡', NULL, 'el-icon-s-grid', NULL, NULL, NULL);
INSERT INTO `menu` VALUES (22, '打卡', '/sign', 'el-icon-user', NULL, 21, 'Sign');
INSERT INTO `menu` VALUES (23, '打卡管理', '/daka', 'el-icon-s-custom', NULL, 21, 'Daka');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'MANAGE_ROLE',
  PRIMARY KEY (`id`, `username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (10, '123', '123', 'MANAGE_ROLE');
INSERT INTO `role` VALUES (11, '都忠良', '123', 'MANAGE_ADMIN');
INSERT INTO `role` VALUES (16, 'admin', 'admin', 'MANAGE_ADMIN');
INSERT INTO `role` VALUES (25, '乔丹', '123', 'MANAGE_ROLE');
INSERT INTO `role` VALUES (26, '1234', '123', 'MANAGE_ROLE');
INSERT INTO `role` VALUES (27, '都新良', '123', 'MANAGE_ROLE');
INSERT INTO `role` VALUES (28, '234', '123', 'MANAGE_ROLE');
INSERT INTO `role` VALUES (29, 'qs', '1234', 'MANAGE_ROLE');
INSERT INTO `role` VALUES (32, '78', '123', 'MANAGE_ROLE');

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu`  (
  `role_id` int(15) NOT NULL COMMENT '角色id',
  `menu_id` int(15) NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES (3, 6);
INSERT INTO `role_menu` VALUES (3, 12);
INSERT INTO `role_menu` VALUES (3, 13);
INSERT INTO `role_menu` VALUES (4, 6);
INSERT INTO `role_menu` VALUES (4, 10);
INSERT INTO `role_menu` VALUES (4, 11);
INSERT INTO `role_menu` VALUES (4, 12);
INSERT INTO `role_menu` VALUES (4, 13);
INSERT INTO `role_menu` VALUES (5, 6);
INSERT INTO `role_menu` VALUES (5, 10);
INSERT INTO `role_menu` VALUES (5, 11);
INSERT INTO `role_menu` VALUES (5, 12);
INSERT INTO `role_menu` VALUES (5, 13);
INSERT INTO `role_menu` VALUES (5, 14);
INSERT INTO `role_menu` VALUES (5, 21);
INSERT INTO `role_menu` VALUES (5, 22);
INSERT INTO `role_menu` VALUES (5, 23);
INSERT INTO `role_menu` VALUES (6, 6);
INSERT INTO `role_menu` VALUES (6, 10);
INSERT INTO `role_menu` VALUES (6, 11);
INSERT INTO `role_menu` VALUES (6, 21);
INSERT INTO `role_menu` VALUES (6, 22);
INSERT INTO `role_menu` VALUES (6, 23);

-- ----------------------------
-- Table structure for sign
-- ----------------------------
DROP TABLE IF EXISTS `sign`;
CREATE TABLE `sign`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sign
-- ----------------------------
INSERT INTO `sign` VALUES (8, '123', '甘肃省庆阳市', '2022-08-18', '已打卡');
INSERT INTO `sign` VALUES (9, 'admin', '甘肃省陇南市', '2022-08-18', NULL);
INSERT INTO `sign` VALUES (10, 'admin', '甘肃省陇南市', '2022-08-19', NULL);
INSERT INTO `sign` VALUES (11, '123', '甘肃省陇南市', '2022-08-19', NULL);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('user', 'el-icon-user', 'icon');
INSERT INTO `sys_dict` VALUES ('house', 'el-icon-house', 'icon');
INSERT INTO `sys_dict` VALUES ('menu', 'el-icon-menu', 'icon');
INSERT INTO `sys_dict` VALUES ('s-custom', 'el-icon-s-custom', 'icon');
INSERT INTO `sys_dict` VALUES ('s-grid', 'el-icon-s-grid', 'icon');
INSERT INTO `sys_dict` VALUES ('document', 'el-icon-document', 'icon');
INSERT INTO `sys_dict` VALUES ('coffee', 'el-icon-coffee\r\n', 'icon');
INSERT INTO `sys_dict` VALUES ('s-marketing', 'el-icon-s-marketing', 'icon');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(15) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '确诊时间',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (33, '都忠良', '123455', '甘肃庆阳', '正常', '2022-08-18 23:36:34', '2022-08-18 23:35:02');
INSERT INTO `user` VALUES (34, '乔丹', '123456', '甘肃庆阳', '确诊', '2022-08-18 23:36:23', '2022-08-18 23:35:44');

SET FOREIGN_KEY_CHECKS = 1;
