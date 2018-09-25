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

 Date: 11/09/2018 09:26:19
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
  `issuper` int(4) NOT NULL DEFAULT 0 COMMENT '是否为超级管理',
  PRIMARY KEY (`account`, `password`, `shetuanid`) USING BTREE,
  INDEX `s`(`shetuanid`) USING BTREE,
  CONSTRAINT `s` FOREIGN KEY (`shetuanid`) REFERENCES `shetuan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('lq', 'bEFhcHpvQVc=ZjUzMDAxYmI5OWExOGRlYWYzMmI4MDA4NDk4YzA0M2I=', '00000004', 'Xk0FyuKk6IhULYeN', 0);
INSERT INTO `admins` VALUES ('lq', 'dXFNcUdLbWw=NGYxOWU3MmFjMGEwZGZjNmRiOTFmMjRiMzA3NTBjZmI=', '00000004', 'Xk0FyuKk6IhULYeN', 0);
INSERT INTO `admins` VALUES ('lyh', 'UGtiTWRwWUU=OTQ1Y2I4MGJlZjRjMDQzOGQyM2Y5ZjUwYTZmY2NmNzM=', '00000006', '7ImSCAVjHitt81yF', 0);
INSERT INTO `admins` VALUES ('sst', 'NWt6ZjU1R28=ZTVlNGRkYzk5YzE0ZDU2NjdiZWEzM2E0NmMzNmExYTA=', '00000001', 'pwgePkxqeLritxwj', 1);
INSERT INTO `admins` VALUES ('superadmin', 'UGtiTWRwWUU=Y2EzYjAzZjRhN2VjYzBkYTJhYWE2ZTA0MGI5ZjE4ZWQ=', '00000004', '1a5OOvyaFcz1mcy5', 1);

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
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback`  (
  `openid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提交人id',
  `text` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '这才是重点',
  `subtime` datetime NULL DEFAULT NULL COMMENT '提交时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of feedback
-- ----------------------------
INSERT INTO `feedback` VALUES ('aaa', 'aaaaaaaa', '2018-09-08 01:16:25');
INSERT INTO `feedback` VALUES ('oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'aaaaaaaaaaaaaa', '2018-09-08 01:23:59');
INSERT INTO `feedback` VALUES ('oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'aaaaaaaaaavvvvvvv', '2018-09-08 01:27:41');

-- ----------------------------
-- Table structure for huodong
-- ----------------------------
DROP TABLE IF EXISTS `huodong`;
CREATE TABLE `huodong`  (
  `hdID` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '举办活动ID',
  `shetuanID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发布活动的社团',
  `hdtime` datetime NOT NULL COMMENT '活动发布的时间',
  `content` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '活动的文字介绍',
  `creatuser` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是谁创建了这条活动',
  `hddz` int(255) NOT NULL DEFAULT 0 COMMENT '活动的点赞数量',
  `images` varchar(511) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hdstatus` int(4) NULL DEFAULT 0 COMMENT '这条活动的展示状态，1 正常展示   0 等待审核 2 不可用状态',
  PRIMARY KEY (`hdID`) USING BTREE,
  INDEX `w`(`shetuanID`) USING BTREE,
  INDEX `h`(`creatuser`) USING BTREE,
  CONSTRAINT `h` FOREIGN KEY (`creatuser`) REFERENCES `user` (`openid`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `w` FOREIGN KEY (`shetuanID`) REFERENCES `shetuan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of huodong
-- ----------------------------
INSERT INTO `huodong` VALUES ('1536371764899', '00000001', '2018-09-08 09:56:04', 'aaaaaa', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 0, '[\"/images/activity/1536371764619-sMvuBA-.jpg\"]', 1);
INSERT INTO `huodong` VALUES ('1536371777737', '00000001', '2018-09-08 09:56:17', 'bbbbbb', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 0, '[\"/images/activity/1536371777345-1PbjrC-.jpg\",\"/images/activity/1536371777463-cjRFmH-.jpg\",\"/images/activity/1536371777466-VShmMC-.jpg\"]', 1);
INSERT INTO `huodong` VALUES ('1536372074050', '00000001', '2018-09-08 10:01:14', 'aaaaaaaaa', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 0, '[]', 2);
INSERT INTO `huodong` VALUES ('1536394330752exRNxI', '00000001', '2018-09-08 16:12:10', 'android', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 1, '[\"/images/activity/1536394330429-LLPNmc-.png\"]', 0);
INSERT INTO `huodong` VALUES ('1536481706859zt2TMp', '00000001', '2018-09-09 16:28:26', '测试动态。状态2', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 0, '[\"/images/activity/1536481706576-oNjuoq-.jpg\"]', 1);
INSERT INTO `huodong` VALUES ('1536481935052EfgXaC', '00000004', '2018-09-09 16:32:15', '当然要自己给自己授权啦', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 0, '[\"/images/activity/1536481934904-mzXsJR-.jpg\"]', 0);

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
INSERT INTO `huodongdz` VALUES ('1536371777737', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-09-08 09:56:27', 0);
INSERT INTO `huodongdz` VALUES ('1536394330752exRNxI', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-09-09 16:09:50', 1);

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
INSERT INTO `shetuan` VALUES ('00000001', '河南大学学生社团联合会123455', 'ooooooo', '/images/commLogo/1536160272823logo.png', 998, 1, '推荐', 1, '你是没法联系我的，但是不要放弃', '0', NULL, NULL, '金明');
INSERT INTO `shetuan` VALUES ('00000002', '大学生社团联合会*', '河南大学的社团联合管理组织', '/images/commLogo/commImage2.jpg', 23, 1, '推荐&文艺', 1, 'QQ:445247721', NULL, NULL, NULL, '金明');
INSERT INTO `shetuan` VALUES ('00000003', '河大国旗班*', '一群每天都能升国旗的组织', '/images/commLogo/commImage1.jpg', 36, 1, '运动&军事', 1, 'QQ:445247721', NULL, NULL, NULL, '金明');
INSERT INTO `shetuan` VALUES ('00000004', '篮球协会', '每天都能打篮球哦', '/images/commLogo/basketball.jpg', 61, 1, '运动', 1, 'QQ:445247721', NULL, NULL, NULL, '金明');
INSERT INTO `shetuan` VALUES ('00000005', '机器人协会', '就不用去中科院写爬虫啦', '/images/commLogo/robot.jpg', 2, 1, '科技&军事', 1, 'QQ:445247721', NULL, NULL, NULL, '明伦');
INSERT INTO `shetuan` VALUES ('00000006', '英语协会', '212121this my own English communication', '/images/commLogo/1535458560061logo.png', 16, 0, '英语&文艺', 1, 'QQ:445247721', '1', NULL, NULL, '明伦');
INSERT INTO `shetuan` VALUES ('00000007', '哔哩哔哩协会', '怎么说，就是一个假的哔哩哔哩', '/images/commLogo/bilibili.jpg', 48, 1, '动漫&文艺', 1, 'QQ:445247721', NULL, NULL, NULL, '明伦');

-- ----------------------------
-- Table structure for stchange
-- ----------------------------
DROP TABLE IF EXISTS `stchange`;
CREATE TABLE `stchange`  (
  `cgid` int(32) NOT NULL AUTO_INCREMENT COMMENT '修改ID',
  `shetuanid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `text` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改信息',
  `cgtime` datetime NULL DEFAULT NULL COMMENT '提交修改的时间',
  `actime` datetime NULL DEFAULT NULL COMMENT '批准修改的时间',
  `cgstatus` int(4) NULL DEFAULT 2 COMMENT '此时这条修改的状态',
  PRIMARY KEY (`cgid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of stchange
-- ----------------------------
INSERT INTO `stchange` VALUES (1, 'adad', 'text', '2018-09-10 21:52:25', NULL, 2);
INSERT INTO `stchange` VALUES (2, '00000001', '河南大学学生社团联合会（简称社联）.\n成立于2000年10月，是在中共河南大学校党委的直接领导下和共青团河南大学委员会指导下开展工作的校级学生组织，是全校各类学生社团的联合体，负责组织、管理、监督全校各学生社团在法律法规、校纪校规以及章程规定范围内开展健康向上、丰富多彩的校园文化和社会实践活动，使全校各学生社团组织切实为校园文化建设服务，为广大同学的学生生活服务，为社会的发展服务。河南大学学生社团联合会是经学校授权的我校校级、省级、国家级优秀学生团体推荐单位。\n河南大学学生社团联合会是全校各类学', '2018-09-10 21:56:10', NULL, 2);
INSERT INTO `stchange` VALUES (3, '00000001', '河南大学学生社团联合会（简称社联）.\n成立于2000年10月，是在中共河南大学校党委的直接领导下和共青团河南大学委员会指导下开展工作的校级学生组织，是全校各类学生社团的联合体，负责组织、管理、监督全校各学生社团在法律法规、校纪校规以及章程规定范围内开展健康向上、丰富多彩的校园文化和社会实践活动，使全校各学生社团组织切实为校园文化建设服务，为广大同学的学生生活服务，为社会的发展服务。河南大学学生社团联合会是经学校授权的我校校级、省级、国家级优秀学生团体推荐单位。\n河南大学学生社团联合会是全校各类学', '2018-09-10 21:59:18', NULL, 1);
INSERT INTO `stchange` VALUES (4, '00000001', '河南大学学生社团联合会（简称社联）.\n成立于2000年10月，是在中共河南大学校党委的直接领导下和共青团河南大学委员会指导下开展工作的校级学生组织，是全校各类学生社团的联合体，负责组织、管理、监督全校各学生社团在法律法规、校纪校规以及章程规定范围内开展健康向上、丰富多彩的校园文化和社会实践活动，使全校各学生社团组织切实为校园文化建设服务，为广大同学的学生生活服务，为社会的发展服务。河南大学学生社团联合会是经学校授权的我校校级、省级、国家级优秀学生团体推荐单位。\n河南大学学生社团联合会是全校各类学', '2018-09-10 21:59:27', NULL, 1);
INSERT INTO `stchange` VALUES (5, '00000006', '212121this my own English communication', '2018-09-10 23:08:14', NULL, 1);
INSERT INTO `stchange` VALUES (6, '00000004', '每天都能打篮球哦', '2018-09-10 23:08:38', '2018-09-10 23:53:09', 1);
INSERT INTO `stchange` VALUES (7, '00000001', '河南大学学生社团联合会（简称社联）.\n成立于2000年10月', '2018-09-10 23:46:17', '2018-09-10 23:48:40', 1);
INSERT INTO `stchange` VALUES (8, '00000001', '1111111111111河南大学学生社团联合会（简称社联）.\n成立于2000年10月，是在中共河南大学校党委的直接领导下和共青团河南大学委员会指导下开展工作的校级学生组织，是全校各类学生社团的联合体，负责组织、管理、监督全校各学生社团在法律法规、校纪校规以及章程规定范围内开展健康向上、丰富多彩的校园文化和社会实践活动，使全校各学生社团组织切实为校园文化建设服务，为广大同学的学生生活服务，为社会的发展服务。河南大学学生社团联合会是经学校授权的我校校级、省级、国家级优秀学生团体推荐单位。\n河南大学学生社团联合会是全校各类学', '2018-09-10 23:53:48', '2018-09-10 23:53:55', 1);
INSERT INTO `stchange` VALUES (9, '00000001', '河南大学学生社团联合会（简称社联）.\n成立于2000年10月，是在中共河南大学校党委的直接领导下和共青团河南大学委员会指导下开展工作的校级学生组织，是全校各类学生社团的联合体，负责组织、管理、监督全校各学生社团在法律法规、校纪校规以及章程规定范围内开展健康向上、丰富多彩的校园文化和社会实践活动，使全校各学生社团组织切实为校园文化建设服务，为广大同学的学生生活服务，为社会的发展服务。河南大学学生社团联合会是经学校授权的我校校级、省级、国家级优秀学生团体推荐单位。\n河南大学学生社团联合会是全校各类学', '2018-09-10 23:57:47', '2018-09-11 00:16:51', 1);
INSERT INTO `stchange` VALUES (10, '00000001', '河南大学学生社团联合会（简称社联）.\n成立于2000年10月，是在中共河南大学校党委的直接领导下和共青团河南大学委员会指导下开展工作的校级学生组织，全校各类学生社团的联合体，负责组织、管理、监督全校各学生社团在法律法规、校纪校规以及章程规定范围内开展健康向上、丰富多彩的校园文化和社会实践活动，使全校各学生社团组织切实为校园文化建设服务，为广大同学的学生生活服务，为社会的发展服务。河南大学学生社团联合会是经学校授权的我校校级、省级、国家级优秀学生团体推荐单位.', '2018-09-10 23:58:16', '2018-09-10 23:58:32', 0);
INSERT INTO `stchange` VALUES (11, '00000001', 'ha ?', '2018-09-11 00:00:17', '2018-09-11 00:00:23', 0);
INSERT INTO `stchange` VALUES (12, '00000001', 'ooooooo', '2018-09-11 00:02:48', '2018-09-11 00:02:54', 0);

-- ----------------------------
-- Table structure for stguanzhu
-- ----------------------------
DROP TABLE IF EXISTS `stguanzhu`;
CREATE TABLE `stguanzhu`  (
  `openid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `shetuanid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '社团id',
  `guanzhutime` datetime NULL DEFAULT NULL COMMENT '关注时间',
  PRIMARY KEY (`openid`, `shetuanid`) USING BTREE,
  INDEX `ws`(`shetuanid`) USING BTREE,
  CONSTRAINT `wo` FOREIGN KEY (`openid`) REFERENCES `user` (`openid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ws` FOREIGN KEY (`shetuanid`) REFERENCES `shetuan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of stguanzhu
-- ----------------------------
INSERT INTO `stguanzhu` VALUES ('oOj6Z5YYn2ECqt7zUWrs017TcxCU', '00000001', '2018-09-09 16:58:50');
INSERT INTO `stguanzhu` VALUES ('oOj6Z5YYn2ECqt7zUWrs017TcxCU', '00000002', '2018-09-09 16:50:24');
INSERT INTO `stguanzhu` VALUES ('oOj6Z5YYn2ECqt7zUWrs017TcxCU', '00000003', '2018-09-09 16:50:35');
INSERT INTO `stguanzhu` VALUES ('oOj6Z5YYn2ECqt7zUWrs017TcxCU', '00000004', '2018-09-08 09:21:49');
INSERT INTO `stguanzhu` VALUES ('oOj6Z5YYn2ECqt7zUWrs017TcxCU', '00000005', '2018-09-09 16:50:29');
INSERT INTO `stguanzhu` VALUES ('oOj6Z5YYn2ECqt7zUWrs017TcxCU', '00000007', '2018-09-09 16:50:09');

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
INSERT INTO `user` VALUES ('oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'pqBL1TKVQE2duy3Ug9r6sg==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Triggers structure for table huodongdz
-- ----------------------------
DROP TRIGGER IF EXISTS `dzadd`;
delimiter ;;
CREATE TRIGGER `dzadd` AFTER INSERT ON `huodongdz` FOR EACH ROW BEGIN
UPDATE huodong SET hddz = (SELECT SUM(dzstatus) FROM huodongdz WHERE hdID = NEW.hdid) WHERE hdID = NEW.hdid;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table huodongdz
-- ----------------------------
DROP TRIGGER IF EXISTS `dzupdate`;
delimiter ;;
CREATE TRIGGER `dzupdate` AFTER UPDATE ON `huodongdz` FOR EACH ROW BEGIN

UPDATE huodong SET hddz = (SELECT SUM(dzstatus) FROM huodongdz WHERE hdID = NEW.hdid) WHERE hdID = NEW.hdid;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table stchange
-- ----------------------------
DROP TRIGGER IF EXISTS `cg`;
delimiter ;;
CREATE TRIGGER `cg` AFTER UPDATE ON `stchange` FOR EACH ROW BEGIN
if(NEW.cgstatus = 1 AND OLD.cgstatus = 2) THEN
UPDATE shetuan SET brief = OLD.text WHERE id = NEW.shetuanid;
END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table stguanzhu
-- ----------------------------
DROP TRIGGER IF EXISTS `gz_ist`;
delimiter ;;
CREATE TRIGGER `gz_ist` AFTER INSERT ON `stguanzhu` FOR EACH ROW BEGIN
UPDATE shetuan SET `like` = (SELECT COUNT(openid) FROM stguanzhu WHERE shetuanid = NEW.shetuanid) WHERE id = NEW.shetuanid;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table stguanzhu
-- ----------------------------
DROP TRIGGER IF EXISTS `gz_dlt`;
delimiter ;;
CREATE TRIGGER `gz_dlt` AFTER DELETE ON `stguanzhu` FOR EACH ROW BEGIN
UPDATE shetuan SET `like` = (SELECT COUNT(openid) FROM stguanzhu WHERE shetuanid = OLD.shetuanid) WHERE id = OLD.shetuanid;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table user
-- ----------------------------
DROP TRIGGER IF EXISTS `auto_gzsl`;
delimiter ;;
CREATE TRIGGER `auto_gzsl` AFTER INSERT ON `user` FOR EACH ROW BEGIN
INSERT INTO stguanzhu VALUES (NEW.openid,'00000001','2018-08-13 16:58:01');
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
