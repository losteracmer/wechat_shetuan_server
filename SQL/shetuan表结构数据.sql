/*
 Navicat MySQL Data Transfer

 Source Server         : myconnection
 Source Server Type    : MySQL
 Source Server Version : 50539
 Source Host           : localhost:3306
 Source Schema         : wechatdb

 Target Server Type    : MySQL
 Target Server Version : 50539
 File Encoding         : 65001

 Date: 10/09/2018 23:23:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for shetuan
-- ----------------------------
DROP TABLE IF EXISTS `shetuan`;
CREATE TABLE `shetuan`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '社团的ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '社团名',
  `brief` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '简介',
  `profile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '社团头像的URL',
  `member` int(8) NOT NULL DEFAULT 0 COMMENT '成员数量',
  `like` int(8) NOT NULL DEFAULT 0 COMMENT '关注人数',
  `kinds` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '社团种类',
  `hot` int(1) NOT NULL DEFAULT 0 COMMENT '是否为热门社团',
  `contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '社团联系方式',
  `gkdw` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '挂靠单位',
  `zyfzr` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主要负责人',
  `zdls` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '指导老师',
  `xiaoqu` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '校区明伦金明',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `id_2`(`id`) USING BTREE,
  INDEX `id_3`(`id`) USING BTREE,
  INDEX `id_4`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of shetuan
-- ----------------------------
INSERT INTO `shetuan` VALUES ('00000001', '河南大学学生社团联合会123455', '河南大学学生社团联合会（简称社联）.\n成立于2000年10月，是在中共河南大学校党委的直接领导下和共青团河南大学委员会指导下开展工作的校级学生组织，是全校各类学生社团的联合体，负责组织、管理、监督全校各学生社团在法律法规、校纪校规以及章程规定范围内开展健康向上、丰富多彩的校园文化和社会实践活动，使全校各学生社团组织切实为校园文化建设服务，为广大同学的学生生活服务，为社会的发展服务。河南大学学生社团联合会是经学校授权的我校校级、省级、国家级优秀学生团体推荐单位。\n河南大学学生社团联合会是全校各类学', '/images/commLogo/1536160272823logo.png', 998, 1, '推荐', 1, '你是没法联系我的，但是不要放弃', NULL, NULL, NULL, '金明');
INSERT INTO `shetuan` VALUES ('00000002', '大学生社团联合会*', '河南大学的社团联合管理组织', '/images/commLogo/commImage2.jpg', 23, 1, '推荐&文艺', 1, 'QQ:445247721', NULL, NULL, NULL, '金明');
INSERT INTO `shetuan` VALUES ('00000003', '河大国旗班*', '一群每天都能升国旗的组织', '/images/commLogo/commImage1.jpg', 36, 1, '运动&军事', 1, 'QQ:445247721', NULL, NULL, NULL, '金明');
INSERT INTO `shetuan` VALUES ('00000004', '篮球协会', '每天都能打篮球哦', '/images/commLogo/basketball.jpg', 61, 1, '运动', 1, 'QQ:445247721', NULL, NULL, NULL, '金明');
INSERT INTO `shetuan` VALUES ('00000005', '机器人协会', '就不用去中科院写爬虫啦', '/images/commLogo/robot.jpg', 2, 1, '科技&军事', 1, 'QQ:445247721', NULL, NULL, NULL, '明伦');
INSERT INTO `shetuan` VALUES ('00000006', '英语协会', 'this my own English communication', '/images/commLogo/1535458560061logo.png', 16, 0, '英语&文艺', 1, 'QQ:445247721', NULL, NULL, NULL, '明伦');
INSERT INTO `shetuan` VALUES ('00000007', '哔哩哔哩协会', '怎么说，就是一个假的哔哩哔哩', '/images/commLogo/bilibili.jpg', 48, 1, '动漫&文艺', 1, 'QQ:445247721', NULL, NULL, NULL, '明伦');

SET FOREIGN_KEY_CHECKS = 1;
