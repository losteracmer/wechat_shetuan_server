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

 Date: 20/08/2018 17:21:02
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
INSERT INTO `admins` VALUES ('sst', 'QjNwbEl2T0s=MDBlN2RiNjdlNGRkYTE4OWY4NjAxZTNkMWQ0YTE4ZTM=', '00000001', 'GRyrePAoSy59evUs');

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
  `hdID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '举办活动ID',
  `shetuanID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发布活动的社团',
  `hdtime` datetime NOT NULL COMMENT '活动发布的时间',
  `content` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '活动的文字介绍',
  `creatuser` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是谁创建了这条活动',
  `hddz` int(255) NOT NULL DEFAULT 0 COMMENT '活动的点赞数量',
  `images` varchar(511) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`hdID`) USING BTREE,
  INDEX `w`(`shetuanID`) USING BTREE,
  INDEX `h`(`creatuser`) USING BTREE,
  CONSTRAINT `h` FOREIGN KEY (`creatuser`) REFERENCES `user` (`openid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `w` FOREIGN KEY (`shetuanID`) REFERENCES `shetuan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of huodong
-- ----------------------------
INSERT INTO `huodong` VALUES ('1534685966388', '00000001', '2018-08-19 21:39:26', '非法访问范文芳安抚安慰访问而非', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 0, '[\"/images/activity/1534685966201.jpg\",\"/images/activity/1534685966227.jpg\",\"/images/activity/1534685966235.jpg\",\"/images/activity/1534685966286.jpg\"]');
INSERT INTO `huodong` VALUES ('1534688492262', '00000004', '2018-08-19 22:21:32', '动物世界。。。\n了解一下', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 0, '[\"/images/activity/1534688492032.jpg\",\"/images/activity/1534688492017.jpg\",\"/images/activity/1534688492060.jpg\",\"/images/activity/1534688492123.jpg\",\"/images/activity/1534688492166.jpg\"]');
INSERT INTO `huodong` VALUES ('1534689460867', '00000001', '2018-08-19 22:37:40', '三张图测试', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 0, '[\"/images/activity/1534689460711.jpg\",\"/images/activity/1534689460789.jpg\",\"/images/activity/1534689460704.jpg\"]');
INSERT INTO `huodong` VALUES ('1534690163292', '00000001', '2018-08-19 22:49:23', '巴黎名胜古迹', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 0, '[\"/images/activity/1534690162928.jpg\",\"/images/activity/1534690162933.jpg\",\"/images/activity/1534690163074.jpg\",\"/images/activity/1534690163095.jpg\",\"/images/activity/1534690163155.jpg\",\"/images/activity/1534690163223.jpg\",\"/images/activity/1534690163225.jpg\"]');
INSERT INTO `huodong` VALUES ('1534690189640', '00000001', '2018-08-19 22:49:49', '这动态也太好发了吧', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 0, '[\"/images/activity/1534690189187.jpg\",\"/images/activity/1534690189194.jpg\",\"/images/activity/1534690189305.jpg\",\"/images/activity/1534690189249.jpg\",\"/images/activity/1534690189344.jpg\",\"/images/activity/1534690189394.jpg\",\"/images/activity/1534690189489.jpg\",\"/images/activity/1534690189502.jpg\",\"/images/activity/1534690189543.jpg\"]');
INSERT INTO `huodong` VALUES ('1534690206233', '00000001', '2018-08-19 22:50:06', '哈哈哈，我要再发一条', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 0, '[\"/images/activity/1534690205811.jpg\",\"/images/activity/1534690205812.jpg\",\"/images/activity/1534690205939.jpg\",\"/images/activity/1534690205939.jpg\",\"/images/activity/1534690206070.jpg\",\"/images/activity/1534690206080.jpg\",\"/images/activity/1534690206123.jpg\",\"/images/activity/1534690206197.jpg\"]');
INSERT INTO `huodong` VALUES ('1534690226067', '00000001', '2018-08-19 22:50:26', '动态测试，，嘿嘿', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 0, '[\"/images/activity/1534690225664.gif\",\"/images/activity/1534690225696.gif\",\"/images/activity/1534690225801.gif\",\"/images/activity/1534690225834.gif\",\"/images/activity/1534690225899.gif\",\"/images/activity/1534690225935.gif\",\"/images/activity/1534690226022.gif\"]');

-- ----------------------------
-- Table structure for huodongdz
-- ----------------------------
DROP TABLE IF EXISTS `huodongdz`;
CREATE TABLE `huodongdz`  (
  `hdid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动id',
  `dzuser` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '点赞的人id',
  `dztime` datetime NULL DEFAULT NULL COMMENT '点赞时间',
  `is` int(4) NULL DEFAULT 1 COMMENT '当前是否点赞，0为取消了点赞',
  PRIMARY KEY (`hdid`, `dzuser`) USING BTREE,
  INDEX `aad`(`dzuser`) USING BTREE,
  CONSTRAINT `aad` FOREIGN KEY (`dzuser`) REFERENCES `user` (`openid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `wad` FOREIGN KEY (`hdid`) REFERENCES `huodong` (`hdID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of huodongdz
-- ----------------------------
INSERT INTO `huodongdz` VALUES ('1534685966388', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-08-20 00:01:17', 0);
INSERT INTO `huodongdz` VALUES ('1534688492262', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-08-20 00:01:12', 0);
INSERT INTO `huodongdz` VALUES ('1534689460867', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-08-09 23:22:40', 0);
INSERT INTO `huodongdz` VALUES ('1534690163292', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-08-20 17:11:46', 0);
INSERT INTO `huodongdz` VALUES ('1534690189640', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-08-19 23:49:09', 0);
INSERT INTO `huodongdz` VALUES ('1534690206233', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-08-19 23:49:08', 0);
INSERT INTO `huodongdz` VALUES ('1534690226067', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-08-19 23:48:20', 0);

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
INSERT INTO `user` VALUES ('oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'WCCyPBVi+Zh6h+lUAq1SYQ==', NULL, NULL, '被风筝追的人🤔', 1, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erQclmTZFrRVvNXh6z8OfYxunuLKJygV0riawu8mgvvjocOzv2b5WQF88fsI6wg8FXJWS7s8icjk7lw/132', 'Shangqiu', 'Henan', 'China', 'zh_CN', NULL);
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

-- ----------------------------
-- View structure for activities
-- ----------------------------
DROP VIEW IF EXISTS `activities`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `activities` AS SELECT
	huodong.hdID,
	shetuanID,
	hdtime,
	content,
	hddz,
	images,
	dzuser,
	`is`,
	name,
	`profile` 
FROM
	huodong
	LEFT JOIN huodongdz ON huodong.hdID = huodongdz.hdid,
	shetuan 
WHERE
	shetuan.id = huodong.shetuanID 
ORDER BY
	hdtime DESC ;

-- ----------------------------
-- View structure for muview
-- ----------------------------
DROP VIEW IF EXISTS `muview`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `muview` AS SELECT hdid,dzuser,dztime,`is`
FROM huodongdz ;

SET FOREIGN_KEY_CHECKS = 1;
