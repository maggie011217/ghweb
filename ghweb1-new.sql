/*
Navicat MySQL Data Transfer

Source Server         : localhost new（xgllpass）
Source Server Version : 50562
Source Host           : localhost:3306
Source Database       : ghweb1

Target Server Type    : MYSQL
Target Server Version : 50562
File Encoding         : 65001

Date: 2022-06-24 16:29:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `creattime` datetime DEFAULT NULL,
  `flag` int(4) DEFAULT NULL,
  `isuse` int(4) DEFAULT NULL,
  `logintimes` int(4) DEFAULT NULL,
  `quanxian` varchar(1000) DEFAULT NULL,
  `sf` varchar(500) DEFAULT '1',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '111', '0000-00-00 00:00:00', '1', '1', '10', '1', '2');
INSERT INTO `admin` VALUES ('2', '11', '111', '2022-06-10 23:04:36', '2', '1', '0', '111', '1');
INSERT INTO `admin` VALUES ('3', '111', '111', '2022-06-10 23:04:36', '2', '1', '0', '111', '1');
INSERT INTO `admin` VALUES ('4', '22', '111', '2022-06-22 15:42:27', '2', '1', '0', '111', '1');
INSERT INTO `admin` VALUES ('5', '33', '111', '2022-06-22 15:42:32', '2', '1', '0', '111', '1');
INSERT INTO `admin` VALUES ('6', '44', '111', '2022-06-22 15:42:36', '2', '1', '0', '111', '1');
INSERT INTO `admin` VALUES ('7', '55', '111', '2022-06-22 15:42:39', '2', '1', '0', '111', '1');
INSERT INTO `admin` VALUES ('8', '66', '111', '2022-06-22 15:42:44', '2', '1', '0', '111', '1');
INSERT INTO `admin` VALUES ('9', '77', '111', '2022-06-22 15:42:49', '2', '1', '0', '111', '1');
INSERT INTO `admin` VALUES ('10', '88', '111', '2022-06-22 15:42:53', '2', '1', '0', '111', '1');
INSERT INTO `admin` VALUES ('11', '99', '111', '2022-06-22 15:42:58', '2', '1', '0', '111', '1');
INSERT INTO `admin` VALUES ('12', '222', '111', '2022-06-22 15:43:06', '2', '1', '0', '111', '1');
INSERT INTO `admin` VALUES ('13', '333', '111', '2022-06-22 15:43:10', '2', '1', '0', '111', '1');

-- ----------------------------
-- Table structure for fenlei
-- ----------------------------
DROP TABLE IF EXISTS `fenlei`;
CREATE TABLE `fenlei` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `fl` varchar(50) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fenlei
-- ----------------------------
INSERT INTO `fenlei` VALUES ('1', '美甲');

-- ----------------------------
-- Table structure for gh
-- ----------------------------
DROP TABLE IF EXISTS `gh`;
CREATE TABLE `gh` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `ysid` varchar(500) DEFAULT NULL,
  `xm` varchar(500) DEFAULT NULL,
  `ks` varchar(500) DEFAULT NULL,
  `sj` date DEFAULT NULL,
  `lxr` varchar(500) DEFAULT NULL,
  `lxfs` varchar(500) DEFAULT NULL,
  `tjsj` varchar(500) DEFAULT NULL,
  `member` varchar(500) DEFAULT NULL,
  `bh` varchar(500) DEFAULT NULL,
  `fy` float DEFAULT NULL,
  `xs` varchar(500) DEFAULT '10-11點',
  `ysbh` varchar(500) DEFAULT NULL,
  `zt` varchar(500) DEFAULT '未完成',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gh
-- ----------------------------
INSERT INTO `gh` VALUES ('10', '52', 'Remi', '美甲', '2022-06-10', '王怡情', '0987262302', '2022-04-09', '111', '1491728652331', '10', '9-10點', '4', '未完成');
INSERT INTO `gh` VALUES ('11', '38', 'April', '美甲', '2022-06-10', '陳佳葳', '0955372958', '2022-04-09', '111', '1491729038043', '10', '9-10點', '8', '已完成');
INSERT INTO `gh` VALUES ('12', '56', 'Amanda', '美甲', '2022-06-23', '李湘玲', '0', '2022-06-22', '111', '1655881065121', '10', '9-10點', '12', '已完成');

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `regtime` varchar(50) DEFAULT NULL,
  `ifuse` int(4) DEFAULT NULL,
  `logintimes` int(4) DEFAULT NULL,
  `lasttime` varchar(50) DEFAULT NULL,
  `lastip` varchar(50) DEFAULT NULL,
  `hmd` varchar(50) DEFAULT '否',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('1', '111', '111', 'person', '2022-06-08', '1', '38', '2022-06-24 12:53:12', '0:0:0:0:0:0:0:1', '否');

-- ----------------------------
-- Table structure for pmember
-- ----------------------------
DROP TABLE IF EXISTS `pmember`;
CREATE TABLE `pmember` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `mid` int(4) DEFAULT NULL,
  `realname` varchar(100) DEFAULT NULL,
  `sex` varchar(50) DEFAULT NULL,
  `bir` varchar(50) DEFAULT NULL,
  `sheng` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `telphone` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `question` varchar(100) DEFAULT NULL,
  `answer` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pmember
-- ----------------------------
INSERT INTO `pmember` VALUES ('1', '1', 'jerry', 'm', '1999-03-07', '臺灣', '臺北', '0928377465', 'jerry12345@google.com', '我是誰', '小強', 'A123456789');

-- ----------------------------
-- Table structure for system
-- ----------------------------
DROP TABLE IF EXISTS `system`;
CREATE TABLE `system` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `sitename` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `keyword` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `reasons` varchar(100) DEFAULT NULL,
  `dir` varchar(100) DEFAULT NULL,
  `record` varchar(100) DEFAULT NULL,
  `copyright` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system
-- ----------------------------
INSERT INTO `system` VALUES ('1', '美甲預約', '美甲預約', '美甲預約', '美甲預約', '美甲預約', 'open', '美甲預約管理系統', 'admin', '美甲預約管理系統', '美甲預約');

-- ----------------------------
-- Table structure for ys
-- ----------------------------
DROP TABLE IF EXISTS `ys`;
CREATE TABLE `ys` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `xm` varchar(50) DEFAULT NULL,
  `ks` varchar(200) DEFAULT NULL,
  `pic` varchar(200) DEFAULT NULL,
  `fy` varchar(200) DEFAULT NULL,
  `zc` varchar(200) DEFAULT NULL,
  `nl` varchar(50) DEFAULT NULL,
  `content` text,
  `sj` varchar(500) DEFAULT NULL,
  `bh` varchar(500) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ys
-- ----------------------------
INSERT INTO `ys` VALUES ('38', 'Apple', '美甲', '/upload_file/sale/s1.jpg', '1200', '店長', '27', '<p><img src=\"/ghweb/UserFiles/Image/111.jpg\" /></p>', '星期一到五', '11');
INSERT INTO `ys` VALUES ('47', 'Ann', '美甲', '/upload_file/sale/s2.jpg', '1200', '副店長', '23', '<p><img src=\"/ghweb/UserFiles/Image/111.jpg\" /></p>', '星期一到五', '22');
INSERT INTO `ys` VALUES ('48', 'Remi', '美甲', '/upload_file/sale/s3.jpg', '1200', '美甲師', '28', '<p><img src=\"/ghweb/UserFiles/Image/111.jpg\" /></p>', '星期一到五', '33');
INSERT INTO `ys` VALUES ('49', 'Irene', '美甲', '/upload_file/sale/s4.jpg', '1000', '美甲師', '26', '<p><img src=\"/ghweb/UserFiles/Image/111.jpg\" /></p>', '星期一到五', '44');
INSERT INTO `ys` VALUES ('50', 'Moon', '美甲', '/upload_file/sale/s5.jpg', '1000', '美甲師', '30', '<p><img src=\"/ghweb/UserFiles/Image/111.jpg\" /></p>', '星期一到五', '55');
INSERT INTO `ys` VALUES ('51', 'Yi', '美甲', '/upload_file/sale/s6.jpg', '1000', '美甲師', '33', '<p><img src=\"/ghweb/UserFiles/Image/111.jpg\" /></p>', '星期一二三六', '66');
INSERT INTO `ys` VALUES ('52', 'April', '美甲', '/upload_file/sale/s7.jpg', '1000', '美甲師', '31', '<p><img src=\"/ghweb/UserFiles/Image/111.jpg\" /></p>', '星期一三四六', '77');
INSERT INTO `ys` VALUES ('53', 'Kiki', '美甲', '/upload_file/sale/s8.jpg', '1000', '美甲師', '29', '<p><img src=\"/ghweb/UserFiles/Image/111.jpg\" /></p>', '星期一二三四日', '88');
INSERT INTO `ys` VALUES ('54', 'Vela', '美甲', '/upload_file/sale/s9.jpg', '900', '美甲師', '30', '<p><img src=\"/ghweb/UserFiles/Image/111.jpg\" /></p>', '星期一二三四日', '99');
INSERT INTO `ys` VALUES ('55', 'Dora', '美甲', '/upload_file/sale/s10.jpg', '900', '美甲師', '26', '<p><img src=\"/ghweb/UserFiles/Image/111.jpg\" /></p>', '星期五六日', '111');
INSERT INTO `ys` VALUES ('56', 'Amanda', '美甲', '/upload_file/sale/s11.jpg', '900', '美甲師', '24', '<p><img src=\"/ghweb/UserFiles/Image/111.jpg\" /></p>', '星期五六日', '222');
INSERT INTO `ys` VALUES ('57', 'Bonita', '美甲', '/upload_file/sale/s12.jpg', '900', '美甲師', '24', '<p><img src=\"/ghweb/UserFiles/Image/111.jpg\" /></p>', '星期五六日', '333');
