/*
 Navicat Premium Data Transfer

 Source Server         : jv
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : localhost:3306
 Source Schema         : quanlycuahangxe

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 18/11/2021 03:36:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_doitac
-- ----------------------------
DROP TABLE IF EXISTS `tbl_doitac`;
CREATE TABLE `tbl_doitac`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `trangthai` int(10) NULL DEFAULT NULL,
  `ten` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `diachi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dt` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ghichu` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_doitac
-- ----------------------------
INSERT INTO `tbl_doitac` VALUES (1, 1, 'Pham Quang Thu', 'Thai Binh', '0984923502', NULL);
INSERT INTO `tbl_doitac` VALUES (2, 1, 'Nguyen Van Anh', 'Thai Binh', '0123456789', NULL);
INSERT INTO `tbl_doitac` VALUES (3, 1, 'Tạ Ngọc Ánh', 'Thái Bình', '01112223334', NULL);
INSERT INTO `tbl_doitac` VALUES (4, 1, 'Phạm Quang Thịnh', 'Hà Nội', '012345566', NULL);
INSERT INTO `tbl_doitac` VALUES (5, 1, 'Phan Thanh Bình', 'Nam Định', '01234565657', NULL);
INSERT INTO `tbl_doitac` VALUES (6, 1, 'Bùi Văn Thái', 'Nam Định', '01231231231', NULL);
INSERT INTO `tbl_doitac` VALUES (7, 1, 'Đặng Văn Tú', 'Hòa Bình', '01231231237', NULL);
INSERT INTO `tbl_doitac` VALUES (8, 1, 'Đặng Văn Lâm', 'Nga', '09998887774', NULL);
INSERT INTO `tbl_doitac` VALUES (9, 1, 'Đỗ Văn Tuấn', 'Vĩnh Phúc', '07777777777', NULL);
INSERT INTO `tbl_doitac` VALUES (10, 1, 'Nguyễn Văn Đông', 'Bắc Ninh', '0666666666', NULL);
INSERT INTO `tbl_doitac` VALUES (11, 2, 'Nguyễn Thị Hồng', 'Ninh Bình', '0555555555', NULL);

-- ----------------------------
-- Table structure for tbl_hdongdoitacchothue
-- ----------------------------
DROP TABLE IF EXISTS `tbl_hdongdoitacchothue`;
CREATE TABLE `tbl_hdongdoitacchothue`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ngaybd` date NULL DEFAULT NULL,
  `ngaykt` date NULL DEFAULT NULL,
  `trangthai` int(11) NULL DEFAULT NULL,
  `dongia` float NULL DEFAULT NULL,
  `ghichu` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tbl_doitacid` int(10) NOT NULL,
  `tbl_nhanvienid` int(10) NOT NULL,
  `tbl_xeid` int(10) NOT NULL,
  `tinhtrang` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tbl_doitacid`(`tbl_doitacid`) USING BTREE,
  INDEX `tbl_nhanvienid`(`tbl_nhanvienid`) USING BTREE,
  INDEX `tbl_xeid`(`tbl_xeid`) USING BTREE,
  CONSTRAINT `tbl_hdongdoitacchothue_ibfk_1` FOREIGN KEY (`tbl_doitacid`) REFERENCES `tbl_doitac` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tbl_hdongdoitacchothue_ibfk_2` FOREIGN KEY (`tbl_nhanvienid`) REFERENCES `tbl_nhanvien` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tbl_hdongdoitacchothue_ibfk_3` FOREIGN KEY (`tbl_xeid`) REFERENCES `tbl_xe` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_hdongdoitacchothue
-- ----------------------------
INSERT INTO `tbl_hdongdoitacchothue` VALUES (1, '2021-11-01', '2021-11-11', 1, 122, 'd', 1, 1, 1, 'ok');
INSERT INTO `tbl_hdongdoitacchothue` VALUES (2, '2021-11-04', '2021-11-19', 1, 12, '', 2, 1, 2, 'jh');
INSERT INTO `tbl_hdongdoitacchothue` VALUES (3, '2021-10-31', '2021-11-27', 2, 23, '', 2, 1, 2, 'iu');
INSERT INTO `tbl_hdongdoitacchothue` VALUES (4, '2021-10-31', '2021-11-06', 1, 9999, '', 1, 1, 1, 'r');

-- ----------------------------
-- Table structure for tbl_hdongkyguidoitac
-- ----------------------------
DROP TABLE IF EXISTS `tbl_hdongkyguidoitac`;
CREATE TABLE `tbl_hdongkyguidoitac`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ngaybd` date NULL DEFAULT NULL,
  `ngaykt` date NULL DEFAULT NULL,
  `ghichu` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `trangthai` int(255) NULL DEFAULT NULL,
  `tbl_doitacid` int(10) NOT NULL,
  `tbl_nhanvienid` int(10) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tbl_hDongkyguidoitac`(`tbl_nhanvienid`) USING BTREE,
  INDEX `tbl_doitacid`(`tbl_doitacid`) USING BTREE,
  CONSTRAINT `tbl_hDongkyguidoitac` FOREIGN KEY (`tbl_nhanvienid`) REFERENCES `tbl_nhanvien` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tbl_hdongkyguidoitac_ibfk_1` FOREIGN KEY (`tbl_doitacid`) REFERENCES `tbl_doitac` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_hdongkyguidoitac
-- ----------------------------
INSERT INTO `tbl_hdongkyguidoitac` VALUES (1, '2021-11-01', '2021-11-16', NULL, 1, 1, 1);
INSERT INTO `tbl_hdongkyguidoitac` VALUES (2, '2021-11-15', '2021-11-23', NULL, 1, 2, 2);
INSERT INTO `tbl_hdongkyguidoitac` VALUES (3, '2021-11-01', '2021-12-11', NULL, 1, 3, 1);
INSERT INTO `tbl_hdongkyguidoitac` VALUES (4, '2021-11-01', '2021-11-13', NULL, 2, 2, 1);

-- ----------------------------
-- Table structure for tbl_hdonthanhlyxedoitac
-- ----------------------------
DROP TABLE IF EXISTS `tbl_hdonthanhlyxedoitac`;
CREATE TABLE `tbl_hdonthanhlyxedoitac`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ngayxuat` date NULL DEFAULT NULL,
  `thanhtien` float NULL DEFAULT NULL,
  `phuongthuc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ghichu` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tbl_honghocid` int(10) NULL DEFAULT NULL,
  `tbl_nhanvienid` int(10) NULL DEFAULT NULL,
  `tbl_hDongDoitacchothueid` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tbl_honghocid`(`tbl_honghocid`) USING BTREE,
  INDEX `tbl_nhanvienid`(`tbl_nhanvienid`) USING BTREE,
  INDEX `tbl_hDongDoitacchothueid`(`tbl_hDongDoitacchothueid`) USING BTREE,
  CONSTRAINT `tbl_hdonthanhlyxedoitac_ibfk_1` FOREIGN KEY (`tbl_honghocid`) REFERENCES `tbl_honghoc` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tbl_hdonthanhlyxedoitac_ibfk_2` FOREIGN KEY (`tbl_nhanvienid`) REFERENCES `tbl_nhanvien` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tbl_hdonthanhlyxedoitac_ibfk_3` FOREIGN KEY (`tbl_hDongDoitacchothueid`) REFERENCES `tbl_hdongkyguidoitac` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_hdonthanhlyxedoitac
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_honghoc
-- ----------------------------
DROP TABLE IF EXISTS `tbl_honghoc`;
CREATE TABLE `tbl_honghoc`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `giatien` float NULL DEFAULT NULL,
  `ghichu` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_honghoc
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_nhanvien
-- ----------------------------
DROP TABLE IF EXISTS `tbl_nhanvien`;
CREATE TABLE `tbl_nhanvien`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ngaysinh` date NULL DEFAULT NULL,
  `diachi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dt` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `vitri` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ghichu` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_nhanvien
-- ----------------------------
INSERT INTO `tbl_nhanvien` VALUES (1, 'Thuws', 'thupq', '1234', '1999-05-02', 'thai binh', 'thu2@gmail.com', '0984923502', 'nhan vien quan ly', 'moi');
INSERT INTO `tbl_nhanvien` VALUES (2, 'Thinh', 'thinh', '12345', '2000-08-20', 'ha noi', 'thinh2@gmail.com', '0868864502', 'nhan vien quan ly', 'moi');

-- ----------------------------
-- Table structure for tbl_xe
-- ----------------------------
DROP TABLE IF EXISTS `tbl_xe`;
CREATE TABLE `tbl_xe`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bienso` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dong` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `doi` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mau` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ghichu` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_xe
-- ----------------------------
INSERT INTO `tbl_xe` VALUES (1, 'Toyota Vios,', '17B-1234', 'sedan', '2019', 'xanh', NULL);
INSERT INTO `tbl_xe` VALUES (2, 'Toyota Camry', '17C-1234', 'sedan', '2019', 'xanh', NULL);
INSERT INTO `tbl_xe` VALUES (3, 'Nissan Sunny', '18B-1234', 'sedan', '2019', 'đỏ', NULL);
INSERT INTO `tbl_xe` VALUES (4, 'Kia Morning', '18C-1233', 'hatback', '2019', 'đỏ', NULL);
INSERT INTO `tbl_xe` VALUES (5, 'Toyota Yaris', '19B-1234', 'hatback', '2018', 'vàng', NULL);
INSERT INTO `tbl_xe` VALUES (6, 'Ford Fiesta', '19C-1122', 'hatback', '2017', 'vàng', NULL);
INSERT INTO `tbl_xe` VALUES (7, 'Toyota Land Cruiser', '20C-1102', 'SUV', '2020', 'vàng', NULL);
INSERT INTO `tbl_xe` VALUES (8, 'Toyota Fortuner', '22C-1234', 'SUV', '2020', 'vàng', NULL);
INSERT INTO `tbl_xe` VALUES (9, 'Honda CR-V', '29C-1234', 'Crossover', '2019', 'tím', NULL);
INSERT INTO `tbl_xe` VALUES (10, 'Honda HR-V', '30D-1234', 'Crossover', '2017', 'tím', NULL);

-- ----------------------------
-- Table structure for tbl_xedathuedoitac
-- ----------------------------
DROP TABLE IF EXISTS `tbl_xedathuedoitac`;
CREATE TABLE `tbl_xedathuedoitac`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ngaythue` date NULL DEFAULT NULL,
  `dongia` float(11, 0) NULL DEFAULT NULL,
  `soluong` int(11) NULL DEFAULT NULL,
  `tbl_xeid` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tbl_xeid`(`tbl_xeid`) USING BTREE,
  CONSTRAINT `tbl_xedathuedoitac_ibfk_1` FOREIGN KEY (`tbl_xeid`) REFERENCES `tbl_xe` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_xedathuedoitac
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_xedoitackygui
-- ----------------------------
DROP TABLE IF EXISTS `tbl_xedoitackygui`;
CREATE TABLE `tbl_xedoitackygui`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `soluong` int(11) NULL DEFAULT NULL,
  `tbl_HDongKyGuiDoitacid` int(10) NOT NULL,
  `tbl_Xeid` int(10) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tbl_Xeid`(`tbl_Xeid`) USING BTREE,
  CONSTRAINT `tbl_xedoitackygui_ibfk_1` FOREIGN KEY (`tbl_Xeid`) REFERENCES `tbl_xe` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_xedoitackygui
-- ----------------------------
INSERT INTO `tbl_xedoitackygui` VALUES (1, 2, 1, 1);
INSERT INTO `tbl_xedoitackygui` VALUES (2, 1, 1, 3);
INSERT INTO `tbl_xedoitackygui` VALUES (3, 1, 1, 4);
INSERT INTO `tbl_xedoitackygui` VALUES (4, 1, 2, 2);
INSERT INTO `tbl_xedoitackygui` VALUES (5, 2, 2, 6);
INSERT INTO `tbl_xedoitackygui` VALUES (6, 1, 3, 1);
INSERT INTO `tbl_xedoitackygui` VALUES (7, 1, 4, 4);
INSERT INTO `tbl_xedoitackygui` VALUES (8, 2, 4, 5);

-- ----------------------------
-- Procedure structure for getOneDt
-- ----------------------------
DROP PROCEDURE IF EXISTS `getOneDt`;
delimiter ;;
CREATE PROCEDURE `getOneDt`(IN doitac int(10))
BEGIN
	SELECT * FROM tbl_doitac a WHERE a.id = doitac;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for getOneNv
-- ----------------------------
DROP PROCEDURE IF EXISTS `getOneNv`;
delimiter ;;
CREATE PROCEDURE `getOneNv`(IN nv int(10))
BEGIN
	SELECT * FROM tbl_nhanvien a WHERE a.id = nv;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for getOneXe
-- ----------------------------
DROP PROCEDURE IF EXISTS `getOneXe`;
delimiter ;;
CREATE PROCEDURE `getOneXe`(IN xe int(10))
BEGIN
	SELECT * FROM tbl_xe a WHERE a.id = xe;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for kiemtraDN
-- ----------------------------
DROP PROCEDURE IF EXISTS `kiemtraDN`;
delimiter ;;
CREATE PROCEDURE `kiemtraDN`(IN usr VARCHAR(20), IN pwd VARCHAR(20))
BEGIN
    SELECT * FROM tbl_nhanvien
    WHERE username = usr AND password = pwd;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for listHD
-- ----------------------------
DROP PROCEDURE IF EXISTS `listHD`;
delimiter ;;
CREATE PROCEDURE `listHD`()
BEGIN
	SELECT a.* FROM tbl_hdongdoitacchothue a 
	JOIN tbl_xe b ON b.id=a.tbl_xeid  
	JOIN tbl_doitac c ON a.tbl_doitacid=c.id
	JOIN tbl_nhanvien d ON d.id=a.tbl_nhanvienid;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for searchDoitac
-- ----------------------------
DROP PROCEDURE IF EXISTS `searchDoitac`;
delimiter ;;
CREATE PROCEDURE `searchDoitac`(IN dong VARCHAR(255))
BEGIN
	SELECT DISTINCT a.* FROM tbl_doitac a JOIN tbl_hdongkyguidoitac b ON a.id=b.tbl_doitacid  
	JOIN tbl_xedoitackygui c ON c.tbl_HDongKyGuiDoitacid=b.id
	JOIN tbl_xe d ON d.id=c.tbl_Xeid WHERE d.dong=dong AND b.trangthai=1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for searchXetheoDt
-- ----------------------------
DROP PROCEDURE IF EXISTS `searchXetheoDt`;
delimiter ;;
CREATE PROCEDURE `searchXetheoDt`(IN doitac int(10), IN dong VARCHAR(255))
BEGIN
	SELECT a.* FROM tbl_xe a 
	JOIN tbl_xedoitackygui b ON a.id=b.tbl_Xeid
	JOIN tbl_HDongKyGuiDoitac c ON b.tbl_HDongKyGuiDoitacid=c.id WHERE c.tbl_doitacid=doitac AND a.dong=dong;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
