/*
 Navicat Premium Data Transfer

 Source Server         : ThuPQ
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : testdb

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 31/12/2021 00:20:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_department
-- ----------------------------
DROP TABLE IF EXISTS `tbl_department`;
CREATE TABLE `tbl_department`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modified_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modify_date` datetime(0) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_department
-- ----------------------------
INSERT INTO `tbl_department` VALUES (1, '2021-12-29 16:43:44', 'admin', NULL, '2021-12-29 16:43:44', 'p01', 'nhan su');
INSERT INTO `tbl_department` VALUES (2, '2021-12-29 16:44:01', 'admin', NULL, '2021-12-29 16:44:01', 'p02', 'it');
INSERT INTO `tbl_department` VALUES (3, '2021-12-29 16:44:15', 'admin', 'admin', '2021-12-29 16:45:14', 'p03', 'mang may tinh');

-- ----------------------------
-- Table structure for tbl_employee
-- ----------------------------
DROP TABLE IF EXISTS `tbl_employee`;
CREATE TABLE `tbl_employee`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `created_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modified_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modify_date` datetime(0) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_employee
-- ----------------------------
INSERT INTO `tbl_employee` VALUES (1, '2021-12-29 11:44:10', NULL, NULL, NULL, 'em01', 'a@gmail.com', 'nguyen van a', 'a@123', 'nhan vien', 'a@123');
INSERT INTO `tbl_employee` VALUES (2, NULL, NULL, NULL, NULL, 'em02', 'a1@gmail.com', 'nguyen van a', 'a@124', 'nhan vien', 'a@124');
INSERT INTO `tbl_employee` VALUES (3, NULL, NULL, NULL, NULL, 'em03', 'a1@gmail.com', 'nguyen van a', 'a@124', 'nhan vien', 'a@124');
INSERT INTO `tbl_employee` VALUES (4, NULL, NULL, NULL, NULL, 'em04', 'a1@gmail.com', 'nguyen van a4', 'a@124', 'nhan vien', 'a@124');
INSERT INTO `tbl_employee` VALUES (5, NULL, NULL, NULL, NULL, 'em05', 'a1@gmail.com', 'nguyen van a5', 'a@124', 'nhan vien', 'a@124');
INSERT INTO `tbl_employee` VALUES (6, NULL, NULL, NULL, NULL, 'em06', 'a6@gmail.com', 'pham quang thu 6', 'a@1264', 'manager', 'a@1264');
INSERT INTO `tbl_employee` VALUES (7, NULL, NULL, NULL, NULL, 'em06', 'a6@gmail.com', 'nguyen van Anh 6', 'a@1264', 'manager', 'a@1264');
INSERT INTO `tbl_employee` VALUES (8, '2021-12-29 15:49:34', 'admin', NULL, '2021-12-29 15:49:34', 'em10', 'a10@gmail.com', 'nguyen van 10', 'a@124', 'manager', 'a10@124');

-- ----------------------------
-- Table structure for tbl_employee_department
-- ----------------------------
DROP TABLE IF EXISTS `tbl_employee_department`;
CREATE TABLE `tbl_employee_department`  (
  `employee_id` bigint(20) NOT NULL,
  `department_id` bigint(20) NOT NULL,
  PRIMARY KEY (`employee_id`, `department_id`) USING BTREE,
  INDEX `FKb9x7rikpnh1i8j3b8pbb8of8p`(`department_id`) USING BTREE,
  CONSTRAINT `FKb9x7rikpnh1i8j3b8pbb8of8p` FOREIGN KEY (`department_id`) REFERENCES `tbl_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKg3mfgwp8v0dcn2xioqeshk2ic` FOREIGN KEY (`employee_id`) REFERENCES `tbl_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_employee_department
-- ----------------------------

-- ----------------------------
-- Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles`  (
  `user_id` bigint(20) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  INDEX `FKh8ciramu9cc9q3qcqiv4ue8a6`(`role_id`) USING BTREE,
  CONSTRAINT `FKh8ciramu9cc9q3qcqiv4ue8a6` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKhfh9dx7w3ubf1co1vdev94g3f` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_roles
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKr43af9ap4edm43mmtq01oddj6`(`username`) USING BTREE,
  UNIQUE INDEX `UK6dotkott2kjsp8vw4d0m25fb7`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'thu2@gmail.com', '$2a$10$rt2nzMXxRMQp/E7u4DeY2utWMrmqohSLY1LnHT5tyEZoq4mSBDnYa', 'thupq');

SET FOREIGN_KEY_CHECKS = 1;
