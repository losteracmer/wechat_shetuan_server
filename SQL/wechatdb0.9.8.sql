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

 Date: 03/09/2018 23:53:28
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
INSERT INTO `admins` VALUES ('lq', 'bEFhcHpvQVc=ZjUzMDAxYmI5OWExOGRlYWYzMmI4MDA4NDk4YzA0M2I=', '00000004', 'QFkx4e2FL3e0wyz0');
INSERT INTO `admins` VALUES ('lq', 'dXFNcUdLbWw=NGYxOWU3MmFjMGEwZGZjNmRiOTFmMjRiMzA3NTBjZmI=', '00000004', 'QFkx4e2FL3e0wyz0');
INSERT INTO `admins` VALUES ('lyh', 'bEFhcHpvQVc=OTU3MzZmNWI2ZjNiNzE3M2Q4MWQxYTdjZWI4ZDU5NWY=', '00000006', 'rUGCrIP3sGatdjvx');
INSERT INTO `admins` VALUES ('sst', 'NWt6ZjU1R28=ZTVlNGRkYzk5YzE0ZDU2NjdiZWEzM2E0NmMzNmExYTA=', '00000001', 'bzqTFYih8YABvJ0V');

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
INSERT INTO `huodong` VALUES ('1', '00000001', '2018-08-29 18:27:06', '第一个活动测试', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 10, '[\"/images/activity/1535538425507.jpg\",\"/images/activity/1535538425513.jpg\",\"/images/activity/1535538425561.jpg\",\"/images/activity/1535538425574.jpg\",\"/images/activity/1535538425586.jpg\",\"/images/activity/1535538425551.jpg\"]');
INSERT INTO `huodong` VALUES ('1535983012737', '00000004', '2018-09-03 21:56:52', '就一张图，不能显示大点？', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 0, '[\"/images/activity/1535983012417.jpg\"]');
INSERT INTO `huodong` VALUES ('1535983044513', '00000004', '2018-09-03 21:57:24', 'two？？？', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 0, '[\"/images/activity/1535983044181.jpg\",\"/images/activity/1535983044178.jpg\"]');
INSERT INTO `huodong` VALUES ('1535986463493', '00000006', '2018-09-03 22:54:23', 'test', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 0, '[\"/images/activity/1535986463197--.jpg\"]');
INSERT INTO `huodong` VALUES ('2', '00000006', '2018-08-29 18:27:56', '四图活动测试。。', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 40, '[\"/images/activity/1535538475865.jpg\",\"/images/activity/1535538475874.jpg\",\"/images/activity/1535538475905.jpg\",\"/images/activity/1535538475890.jpg\"]');
INSERT INTO `huodong` VALUES ('3', '00000006', '2018-08-29 18:28:29', '咦？？？', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 3, '[\"/images/activity/1535538509249.jpg\"]');
INSERT INTO `huodong` VALUES ('4', '00000004', '2018-08-30 14:54:55', '艺术考场活动正在进行中，呼呼呼呼呼', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 5, '[\"/images/activity/1535612094886.jpg\",\"/images/activity/1535612095230.jpg\",\"/images/activity/1535612095237.jpg\",\"/images/activity/1535612095233.jpg\"]');

-- ----------------------------
-- Table structure for huodongdz
-- ----------------------------
DROP TABLE IF EXISTS `huodongdz`;
CREATE TABLE `huodongdz`  (
  `hdid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动id',
  `dzuser` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '点赞的人id',
  `dztime` datetime NULL DEFAULT NULL COMMENT '点赞时间',
  `dzstatus` int(4) NULL DEFAULT 1 COMMENT '当前是否点赞，0为取消了点赞',
  PRIMARY KEY (`hdid`, `dzuser`) USING BTREE,
  INDEX `aad`(`dzuser`) USING BTREE,
  CONSTRAINT `aad` FOREIGN KEY (`dzuser`) REFERENCES `user` (`openid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `wad` FOREIGN KEY (`hdid`) REFERENCES `huodong` (`hdID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of huodongdz
-- ----------------------------
INSERT INTO `huodongdz` VALUES ('1', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-09-02 10:00:14', 0);
INSERT INTO `huodongdz` VALUES ('1535983044513', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-09-03 22:03:57', 1);
INSERT INTO `huodongdz` VALUES ('2', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-08-30 14:26:13', 0);
INSERT INTO `huodongdz` VALUES ('3', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-08-29 18:31:29', 1);
INSERT INTO `huodongdz` VALUES ('4', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-08-30 14:55:26', 1);
INSERT INTO `huodongdz` VALUES ('4', 'openid23333', '2018-09-26 09:08:04', 1);

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
INSERT INTO `shetuan` VALUES ('00000001', '河南大学学生社团联合会', '河南大学学生社团联合会（简称社联）.\n成立于2000年10月，是在中共河南大学校党委的直接领导下和共青团河南大学委员会指导下开展工作的校级学生组织，是全校各类学生社团的联合体，负责组织、管理、监督全校各学生社团在法律法规、校纪校规以及章程规定范围内开展健康向上、丰富多彩的校园文化和社会实践活动，使全校各学生社团组织切实为校园文化建设服务，为广大同学的学生生活服务，为社会的发展服务。河南大学学生社团联合会是经学校授权的我校校级、省级、国家级优秀学生团体推荐单位。\n河南大学学生社团联合会是全校各类学', '/images/commLogo/1535607755886logo.png', 998, 156, '推荐', 1, '你是没法联系我的，但是不要放弃', NULL, NULL, NULL, '金明');
INSERT INTO `shetuan` VALUES ('00000002', '大学生社团联合会*', '河南大学的社团联合管理组织', '/images/commLogo/commImage2.jpg', 23, 157, '推荐&文艺', 1, 'QQ:445247721', NULL, NULL, NULL, '金明');
INSERT INTO `shetuan` VALUES ('00000003', '河大国旗班*', '一群每天都能升国旗的组织', '/images/commLogo/commImage1.jpg', 36, 33, '运动&军事', 1, 'QQ:445247721', NULL, NULL, NULL, '金明');
INSERT INTO `shetuan` VALUES ('00000004', '篮球协会', '每天都能打篮球哦', '/images/commLogo/basketball.jpg', 61, 24, '运动', 1, 'QQ:445247721', NULL, NULL, NULL, '金明');
INSERT INTO `shetuan` VALUES ('00000005', '机器人协会', '就不用去中科院写爬虫啦', '/images/commLogo/robot.jpg', 2, 59, '科技&军事', 1, 'QQ:445247721', NULL, NULL, NULL, '明伦');
INSERT INTO `shetuan` VALUES ('00000006', '英语协会', 'this my own English communication', '/images/commLogo/1535458560061logo.png', 16, 126, '英语&文艺', 1, 'QQ:445247721', NULL, NULL, NULL, '明伦');
INSERT INTO `shetuan` VALUES ('00000007', '哔哩哔哩协会', '怎么说，就是一个假的哔哩哔哩', '/images/commLogo/bilibili.jpg', 48, 1231, '动漫&文艺', 1, 'QQ:445247721', NULL, NULL, NULL, '明伦');

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
INSERT INTO `stguanzhu` VALUES ('oOj6Z5YYn2ECqt7zUWrs017TcxCU', '00000001', '2018-08-22 13:27:48');
INSERT INTO `stguanzhu` VALUES ('oOj6Z5YYn2ECqt7zUWrs017TcxCU', '00000002', '2018-08-22 13:28:45');
INSERT INTO `stguanzhu` VALUES ('ssss11id', 'sh11etuanid', '2018-08-13 16:58:01');

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
INSERT INTO `user` VALUES ('oOj6Z5YYn2ECqt7zUWrs017TcxCU', '76RaJ+eyIScKSbe/nMVXfg==', NULL, NULL, '被风筝追的人🤔', 1, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erQclmTZFrRVvNXh6z8OfYxunuLKJygV0riawu8mgvvjocOzv2b5WQF88fsI6wg8FXJWS7s8icjk7lw/132', 'Shangqiu', 'Henan', 'China', 'zh_CN', NULL);
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

SET FOREIGN_KEY_CHECKS = 1;
