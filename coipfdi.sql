/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50562
Source Host           : localhost:3307
Source Database       : coipfdi

Target Server Type    : MYSQL
Target Server Version : 50562
File Encoding         : 65001

Date: 2019-09-25 09:39:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phoneNum` varchar(11) DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `approvalPending` tinyint(1) DEFAULT NULL COMMENT '管理员注册申请待审核状态（0表示已审核，1表示待审核）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'wjx', 'dsd', '8211', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for login_ticket
-- ----------------------------
DROP TABLE IF EXISTS `login_ticket`;
CREATE TABLE `login_ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `ticket` varchar(255) DEFAULT NULL,
  `expire_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login_ticket
-- ----------------------------
INSERT INTO `login_ticket` VALUES ('1', '1', 'e0ccf58ba96e4e62abd40d901b9f5d7c', '2019-09-21 21:03:16', '0');
INSERT INTO `login_ticket` VALUES ('2', '3', '2ba1e06ab5a44aac93a4fec8e19cedc3', '2019-09-21 21:04:23', '0');
INSERT INTO `login_ticket` VALUES ('3', '4', '9fb626c7639b4ccd9526cba419b618ef', '2019-09-21 21:21:09', '0');
INSERT INTO `login_ticket` VALUES ('4', '1', 'be681b5c3d22419a95f6f746bfc0680d', '2019-09-24 18:46:22', '0');

-- ----------------------------
-- Table structure for query
-- ----------------------------
DROP TABLE IF EXISTS `query`;
CREATE TABLE `query` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `goal` double(8,4) DEFAULT NULL,
  `isPassed` tinyint(1) DEFAULT NULL,
  `feedback` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of query
-- ----------------------------
INSERT INTO `query` VALUES ('1', '127817', 'dffg', null, null, '1', 'lala');
INSERT INTO `query` VALUES ('2', '827', 'wcj', null, null, '0', 'bad');
INSERT INTO `query` VALUES ('3', '2323', 'lec', '科技园', '33.0000', '1', null);
INSERT INTO `query` VALUES ('4', '2200', 'lec', '资源园', '63.0000', '1', 'lala');
INSERT INTO `query` VALUES ('5', '2311', 'lec', '经贸合作区', '98.0000', '1', 'hah');
INSERT INTO `query` VALUES ('6', '123', 'wjx', '其他园区', '68.0000', '1', null);
INSERT INTO `query` VALUES ('7', '123', 'wjx', '农业园', '79.0000', '1', null);
INSERT INTO `query` VALUES ('9', '123', 'wjx', '资源园', '74.0000', '1', null);

-- ----------------------------
-- Table structure for standard
-- ----------------------------
DROP TABLE IF EXISTS `standard`;
CREATE TABLE `standard` (
  `type` varchar(255) NOT NULL,
  `industry` float(4,2) DEFAULT NULL,
  `market` float(4,2) DEFAULT NULL,
  `technology` float(4,2) DEFAULT NULL,
  `hr` float(4,2) DEFAULT NULL,
  `policy` float(4,2) DEFAULT NULL,
  `capital` float(4,2) DEFAULT NULL,
  `culture` float(4,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of standard
-- ----------------------------
INSERT INTO `standard` VALUES ('经贸合作区', '80.00', '80.00', '50.00', '90.00', '50.00', '75.00', '50.00');
INSERT INTO `standard` VALUES ('工业园', '60.00', '60.00', '50.00', '90.00', '60.00', '75.00', '50.00');
INSERT INTO `standard` VALUES ('科技园', '50.00', '50.00', '80.00', '80.00', '50.00', '75.00', '50.00');
INSERT INTO `standard` VALUES ('资源园', '80.00', '30.00', '30.00', '90.00', '50.00', '75.00', '50.00');
INSERT INTO `standard` VALUES ('物流园/商贸园', '50.00', '80.00', '30.00', '90.00', '60.00', '75.00', '60.00');
INSERT INTO `standard` VALUES ('农业园', '50.00', '30.00', '30.00', '90.00', '50.00', '75.00', '50.00');
INSERT INTO `standard` VALUES ('其他园区', '50.00', '50.00', '50.00', '90.00', '50.00', '75.00', '50.00');

-- ----------------------------
-- Table structure for upload
-- ----------------------------
DROP TABLE IF EXISTS `upload`;
CREATE TABLE `upload` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `quota` varchar(255) DEFAULT NULL,
  `standard` varchar(255) DEFAULT NULL,
  `criterion` varchar(255) DEFAULT NULL,
  `weight` varchar(255) DEFAULT NULL,
  `goal` double(8,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of upload
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phoneNum` varchar(11) DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'wjx', '321', '821164225@qq.com', '15205195058', '男', '东大', '中国', 'technology');
INSERT INTO `user` VALUES ('2', 'WinJacky', 'wjx821164225', '821164225@qq.com', null, null, null, null, null);
INSERT INTO `user` VALUES ('4', 'lec123', '123', '782466523@qq.com', null, null, null, null, null);

-- ----------------------------
-- Table structure for weight
-- ----------------------------
DROP TABLE IF EXISTS `weight`;
CREATE TABLE `weight` (
  `type` varchar(255) NOT NULL,
  `industry` float(4,2) DEFAULT NULL,
  `market` float(4,2) DEFAULT NULL,
  `technology` float(4,2) DEFAULT NULL,
  `hr` float(4,2) DEFAULT NULL,
  `policy` float(4,2) DEFAULT NULL,
  `capital` float(4,2) DEFAULT NULL,
  `culture` float(4,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weight
-- ----------------------------
INSERT INTO `weight` VALUES ('经贸合作区', '0.15', '0.25', '0.05', '0.15', '0.20', '0.10', '0.10');
INSERT INTO `weight` VALUES ('工业园', '0.20', '0.15', '0.10', '0.20', '0.15', '0.15', '0.05');
INSERT INTO `weight` VALUES ('科技园', '0.10', '0.10', '0.25', '0.20', '0.15', '0.15', '0.05');
INSERT INTO `weight` VALUES ('物流园/商贸园', '0.10', '0.15', '0.05', '0.20', '0.20', '0.15', '0.15');
INSERT INTO `weight` VALUES ('农业园', '0.10', '0.10', '0.10', '0.15', '0.25', '0.20', '0.10');
INSERT INTO `weight` VALUES ('其他园区', '0.15', '0.15', '0.15', '0.15', '0.15', '0.15', '0.10');
INSERT INTO `weight` VALUES ('资源园', '0.15', '0.10', '0.10', '0.20', '0.20', '0.20', '0.05');
