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

 Date: 18/08/2018 21:41:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins`  (
  `account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '管理账号',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '管理密码',
  `shetuanid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '对应权限',
  `temporarycode` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`account`, `password`, `shetuanid`) USING BTREE,
  INDEX `s`(`shetuanid`) USING BTREE,
  CONSTRAINT `s` FOREIGN KEY (`shetuanid`) REFERENCES `shetuan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('sst', 'QjNwbEl2T0s=MDBlN2RiNjdlNGRkYTE4OWY4NjAxZTNkMWQ0YTE4ZTM=', '00000001', 'sst');

-- ----------------------------
-- Table structure for apply
-- ----------------------------
DROP TABLE IF EXISTS `apply`;
CREATE TABLE `apply`  (
  `openid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请人openid',
  `shetuanid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请的社团id',
  `mobile` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '申请人手机号，可以通过user那里拿',
  `other` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注信息，可选填',
  `status` int(4) NULL DEFAULT NULL COMMENT '申请状态：1，正在等待审核，0，已经被拒绝（此时可以重新发起申请）  2，收到回复，3通过申请',
  `applytime` datetime NULL DEFAULT NULL COMMENT '申请时间',
  PRIMARY KEY (`openid`, `shetuanid`) USING BTREE,
  INDEX `wsh`(`shetuanid`) USING BTREE,
  CONSTRAINT `wop` FOREIGN KEY (`openid`) REFERENCES `user` (`openid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `wsh` FOREIGN KEY (`shetuanid`) REFERENCES `shetuan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `plID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论id',
  `plhd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '在哪个活动上发表的评论',
  `pltext` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论内容',
  `pluser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论用户',
  `pldz` int(255) NOT NULL DEFAULT 0 COMMENT '评论点赞数',
  PRIMARY KEY (`plID`) USING BTREE,
  INDEX `Wu`(`pluser`) USING BTREE,
  INDEX `Whd`(`plhd`) USING BTREE,
  CONSTRAINT `Whd` FOREIGN KEY (`plhd`) REFERENCES `huodong` (`hdID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Wu` FOREIGN KEY (`pluser`) REFERENCES `user` (`openid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for huodong
-- ----------------------------
DROP TABLE IF EXISTS `huodong`;
CREATE TABLE `huodong`  (
  `hdID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '举办活动ID',
  `shetuanID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发布活动的社团',
  `hdtime` datetime NOT NULL COMMENT '活动发布的时间',
  `hdtext` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '活动的文字介绍',
  `hddd` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '活动地点',
  `hddz` int(255) NOT NULL DEFAULT 0 COMMENT '活动的点赞数量',
  PRIMARY KEY (`hdID`) USING BTREE,
  INDEX `w`(`shetuanID`) USING BTREE,
  CONSTRAINT `w` FOREIGN KEY (`shetuanID`) REFERENCES `shetuan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of huodong
-- ----------------------------
INSERT INTO `huodong` VALUES ('h1', '00000001', '2017-12-20 19:47:59', '这是一个测试活动', '来自vscode的数据2', 20);
INSERT INTO `huodong` VALUES ('h2', '00000002', '2018-07-09 19:53:46', '测试活动2', '图书馆', 12);

-- ----------------------------
-- Table structure for photo
-- ----------------------------
DROP TABLE IF EXISTS `photo`;
CREATE TABLE `photo`  (
  `photoID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发布图片的ID',
  `huodongID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '哪个活动发布的这个图',
  `photourl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片的url',
  PRIMARY KEY (`photoID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for shetuan
-- ----------------------------
DROP TABLE IF EXISTS `shetuan`;
CREATE TABLE `shetuan`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '社团的ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '社团名',
  `brief` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '简介',
  `profile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '社团头像的URL',
  `member` int(8) NOT NULL DEFAULT 0 COMMENT '成员数量',
  `like` int(8) NOT NULL DEFAULT 0 COMMENT '关注人数',
  `kinds` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '社团种类',
  `hot` int(1) NOT NULL DEFAULT 0 COMMENT '是否为热门社团',
  `contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '社团联系方式',
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
INSERT INTO `shetuan` VALUES ('00000001', 'ACM*', '软件学院程序设计竞赛组织', '/images/commLogo/commImage1.jpg', 998, 156, '推荐', 1, 'QQ:445247721');
INSERT INTO `shetuan` VALUES ('00000002', '大学生社团联合会*', '河南大学的社团联合管理组织', '/images/commLogo/commImage2.jpg', 23, 157, '推荐&文艺', 1, 'QQ:445247721');
INSERT INTO `shetuan` VALUES ('00000003', '河大国旗班*', '一群每天都能升国旗的组织', '/images/commLogo/commImage1.jpg', 36, 33, '运动&军事', 1, 'QQ:445247721');
INSERT INTO `shetuan` VALUES ('00000004', '篮球协会', '每天都能打篮球哦', '/images/commLogo/basketball.jpg', 61, 24, '运动', 1, 'QQ:445247721');
INSERT INTO `shetuan` VALUES ('00000005', '机器人协会', '就不用去中科院写爬虫啦', '/images/commLogo/robot.jpg', 2, 59, '科技&军事', 1, 'QQ:445247721');
INSERT INTO `shetuan` VALUES ('00000006', '英语协会', 'this my own English communication', '/images/commLogo/english.jpg', 16, 126, '英语&文艺', 1, 'QQ:445247721');
INSERT INTO `shetuan` VALUES ('00000007', '哔哩哔哩协会', '怎么说，就是一个假的哔哩哔哩', '/images/commLogo/bilibili.jpg', 48, 1231, '动漫&文艺', 1, 'QQ:445247721');

-- ----------------------------
-- Table structure for stguanzhu
-- ----------------------------
DROP TABLE IF EXISTS `stguanzhu`;
CREATE TABLE `stguanzhu`  (
  `openid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `shetuanid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '社团id',
  `guanzhutime` datetime NULL DEFAULT NULL COMMENT '关注时间',
  PRIMARY KEY (`openid`, `shetuanid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of stguanzhu
-- ----------------------------
INSERT INTO `stguanzhu` VALUES ('oOj6Z5YYn2ECqt7zUWrs017TcxCU', '00000001', '2018-08-13 08:40:12');
INSERT INTO `stguanzhu` VALUES ('oOj6Z5YYn2ECqt7zUWrs017TcxCU', '00000002', '2018-08-16 22:15:10');
INSERT INTO `stguanzhu` VALUES ('oOj6Z5YYn2ECqt7zUWrs017TcxCU', '00000005', '2018-08-14 22:15:15');
INSERT INTO `stguanzhu` VALUES ('ssss11id', 'sh11etuanid', '2018-08-13 16:58:01');
INSERT INTO `stguanzhu` VALUES ('ssssid', 'shetuanid', '2018-08-13 16:53:54');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `openid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'user\'s openid',
  `sessionkey` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sessionkey',
  `xh` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学号',
  `realname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `nickName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `gender` int(4) NULL DEFAULT NULL COMMENT '用户的性别，值为1时是男性，值为2时是女性，值为0时是未知',
  `avatarUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像，最后一个数值代表正方形头像大小（有0、46、64、96、132数值可选，0代表132*132正方形头像），用户没有头像时该项为空。若用户更换头像，原有头像URL将失效。',
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户所在城市',
  `province` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户所在省份',
  `country` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户所在国家',
  `language` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户的语言，简体中文为zh_CN',
  `mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户手机号',
  PRIMARY KEY (`openid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'QZXhFchyDroU9x4B6apbgA==', NULL, NULL, '被风筝追的人🤔', 1, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erQclmTZFrRVvNXh6z8OfYxunuLKJygV0riawu8mgvvjocOzv2b5WQF88fsI6wg8FXJWS7s8icjk7lw/132', 'Shangqiu', 'Henan', 'China', 'zh_CN', NULL);
INSERT INTO `user` VALUES ('openid23333', 'sessionkey2333', NULL, NULL, '被风筝追的人🤔', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for user2shetuan
-- ----------------------------
DROP TABLE IF EXISTS `user2shetuan`;
CREATE TABLE `user2shetuan`  (
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `shetuanid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '社团ID',
  `jarushijian` datetime NOT NULL COMMENT '加入时间',
  `shenfen` int(8) NOT NULL DEFAULT 0 COMMENT '身份 0 ：普通社员，1：管理，2:社长',
  PRIMARY KEY (`openid`, `shetuanid`) USING BTREE,
  INDEX `WshetuanID`(`shetuanid`) USING BTREE,
  CONSTRAINT `WshetuanID` FOREIGN KEY (`shetuanid`) REFERENCES `shetuan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `WuserID` FOREIGN KEY (`openid`) REFERENCES `user` (`openid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user2shetuan
-- ----------------------------
INSERT INTO `user2shetuan` VALUES ('oOj6Z5YYn2ECqt7zUWrs017TcxCU', '00000001', '2018-08-14 15:20:14', 2);

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video`  (
  `videoID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发布视频的ID',
  `huodongID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '由哪个活动发布的视频',
  `videourl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '视频的url',
  PRIMARY KEY (`videoID`) USING BTREE,
  INDEX `Whuodong`(`huodongID`) USING BTREE,
  CONSTRAINT `Whuodong` FOREIGN KEY (`huodongID`) REFERENCES `huodong` (`hdID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
