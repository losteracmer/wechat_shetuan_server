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

 Date: 12/09/2018 12:46:53
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
  PRIMARY KEY (`account`) USING BTREE,
  INDEX `s`(`shetuanid`) USING BTREE,
  CONSTRAINT `s` FOREIGN KEY (`shetuanid`) REFERENCES `shetuan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('00000001', 'bmNwZE5YZ1M=OTkyMmJkNmEyNTA2OThlMzA1MWNmOTVlYTVhMjEzMjE=', '00000001', NULL, 0);
INSERT INTO `admins` VALUES ('00000002', 'bmNwZE5YZ1M=MWZlZmZmNWE3M2NjMTM0ODRlY2JjZjM1MjVhYThmNjM=', '00000002', NULL, 0);
INSERT INTO `admins` VALUES ('00000003', 'bmNwZE5YZ1M=NTU5MDFhN2VjM2IxMzg2MmE0ZTMwOGJhYjA5NWNiZGM=', '00000003', NULL, 0);
INSERT INTO `admins` VALUES ('00000004', 'bmNwZE5YZ1M=OWExM2IxM2U1Zjg1MjBjYzhiOWZjNjQ1NDg2NTZkMmM=', '00000004', NULL, 0);
INSERT INTO `admins` VALUES ('00000005', 'bmNwZE5YZ1M=ODNlYzBmMjBlNDBlYzdjMjY0ZjUxZjI4NmJkZTJmNGU=', '00000005', NULL, 0);
INSERT INTO `admins` VALUES ('00000006', 'bmNwZE5YZ1M=NTlmNGI4Mjg4YTQ0ZmZhNmE3NGVhY2E5MDAyZjRmNzE=', '00000006', NULL, 0);
INSERT INTO `admins` VALUES ('00000007', 'bmNwZE5YZ1M=OTI3MDUxNDBmNjRkNTQ2OTUzMDNjMzM3YmE2ZWI4MDM=', '00000007', NULL, 0);
INSERT INTO `admins` VALUES ('00000008', 'bmNwZE5YZ1M=OGM3NjNjOWEyZTg2ZGQ3ZTViMzE2NDk2NjBkNTUxYjQ=', '00000008', NULL, 0);
INSERT INTO `admins` VALUES ('00000009', 'bmNwZE5YZ1M=ZTc3MmRhOTZhNmZiNTAzZjAyYmUyYmExMmJkNTE0N2U=', '00000009', NULL, 0);
INSERT INTO `admins` VALUES ('00000010', 'bmNwZE5YZ1M=NmM3MjNhZjg5YmMxNzc2YWIzOTcwZTE3MGFjNjA3Y2E=', '00000010', NULL, 0);
INSERT INTO `admins` VALUES ('00000011', 'bmNwZE5YZ1M=YWQ4ZjkyNTdlZjNkZWVkZWMxZTA1OTNiOTI1ZmNkZjc=', '00000011', NULL, 0);
INSERT INTO `admins` VALUES ('00000012', 'bmNwZE5YZ1M=YzU4NTc5YzI3Y2E1ZjBjNzhlNmMwZGIxODNhNzljNzg=', '00000012', NULL, 0);
INSERT INTO `admins` VALUES ('00000013', 'bmNwZE5YZ1M=MGExOTg5MGE3MDE1ZDQyOWVhNmE4NThiMjAwMzFlZGY=', '00000013', NULL, 0);
INSERT INTO `admins` VALUES ('00000014', 'bmNwZE5YZ1M=OTY2N2RkZDEzNTAwMWFkYzIyY2E2OTFlMWY3M2ExMjk=', '00000014', NULL, 0);
INSERT INTO `admins` VALUES ('00000015', 'bmNwZE5YZ1M=OGYwZGNlNTBmYzZjN2FhMDQxZTIxZWJiNDhjMmI5YTg=', '00000015', NULL, 0);
INSERT INTO `admins` VALUES ('00000016', 'bmNwZE5YZ1M=NTU3Y2JkMzkxOTE4NWUzZmI0ODAwNGFkZDU1YTJkMGY=', '00000016', NULL, 0);
INSERT INTO `admins` VALUES ('00000017', 'bmNwZE5YZ1M=MzY2M2NjMjhkYzJlMmExYjFlNmQyMzhmNjI2M2I4NjU=', '00000017', NULL, 0);
INSERT INTO `admins` VALUES ('00000018', 'bmNwZE5YZ1M=ZGEyODEzYmFkODQ0ZWZmNmM2Y2U5OTdhMDRjZGQzYmU=', '00000018', 'bWb86UJtqwhW59dj', 0);
INSERT INTO `admins` VALUES ('00000019', 'bmNwZE5YZ1M=MGEwYzM1OWRmODgxOGJhNDllYTNlZDVmNGM3NTY0ZGM=', '00000019', NULL, 0);
INSERT INTO `admins` VALUES ('00000020', 'bmNwZE5YZ1M=Y2RkZGQ5YzUzYmUxNTY5YjNmOGU3ZGE2MDA4NTk0YTM=', '00000020', NULL, 0);
INSERT INTO `admins` VALUES ('00000021', 'bmNwZE5YZ1M=ZjIwZGIyMmU0N2M5ZmY3ZmJhNDU3YzVhZWVmODc5MzU=', '00000021', NULL, 0);
INSERT INTO `admins` VALUES ('00000022', 'bmNwZE5YZ1M=NTM4NDZkODQ0OWQ4Y2FlMjUzYTBiNDQwZmE2ZjU0ZWE=', '00000022', NULL, 0);
INSERT INTO `admins` VALUES ('00000023', 'bmNwZE5YZ1M=Y2ZkYzAyZGVhYjlmZTJiZDI5YTdhNTBhZWMyMjIyYTA=', '00000023', 'f2TVOFrp7wab8bxr', 0);
INSERT INTO `admins` VALUES ('00000024', 'bmNwZE5YZ1M=ODA0ZjkwMzg1ZDU3MzgzMmE5MjI1NjQ0ZTQwNWExYTQ=', '00000024', NULL, 0);
INSERT INTO `admins` VALUES ('00000025', 'bmNwZE5YZ1M=NWMwNjljZjE3NzNmMGQ2MjE5NTJmOTA4ZGNhZjg0NzM=', '00000025', NULL, 0);
INSERT INTO `admins` VALUES ('00000026', 'bmNwZE5YZ1M=Zjg2MmM2OWQ5ZTY1NWU4Zjg5MTZlODEwZmJjMjY5ZGI=', '00000026', NULL, 0);
INSERT INTO `admins` VALUES ('00000027', 'bmNwZE5YZ1M=ZDRmNjQwMDA5Mjk2MzZiNzU3ODllNWY5NmNiOTU5MTQ=', '00000027', NULL, 0);
INSERT INTO `admins` VALUES ('00000028', 'bmNwZE5YZ1M=N2MwZGZiMjIwYjIyYmMzYTA1ZmE5Yzg0OTVmN2E5ZWM=', '00000028', NULL, 0);
INSERT INTO `admins` VALUES ('00000029', 'bmNwZE5YZ1M=YjQ4OWIyMzA4OWRmNWU5Y2U1ZWU3ODEyODg5MjI2ZmI=', '00000029', NULL, 0);
INSERT INTO `admins` VALUES ('00000030', 'bmNwZE5YZ1M=MmQzMGUxNWE1YWVkOWZmNTlmZjU4YzA2YWNiMDYzZmU=', '00000030', NULL, 0);
INSERT INTO `admins` VALUES ('00000031', 'bmNwZE5YZ1M=YzA2YjZmNmYzMTBmYzRmODM0NGRlN2QxZGRmMThkZDM=', '00000031', NULL, 0);
INSERT INTO `admins` VALUES ('00000032', 'bmNwZE5YZ1M=NjdmYTc4NzAwNDRkOGUwYjg2YmIzYzEyZWVhZjg1NDI=', '00000032', NULL, 0);
INSERT INTO `admins` VALUES ('00000033', 'bmNwZE5YZ1M=ZTlmMjNhZGJiNzc0MmFmMTA0MjU1MTQxY2U3MWY0ZTQ=', '00000033', NULL, 0);
INSERT INTO `admins` VALUES ('00000034', 'bmNwZE5YZ1M=YmQwZjk4MTQyYmM5ZjVhN2VkODhjM2ZmNTU5OTAxNGM=', '00000034', NULL, 0);
INSERT INTO `admins` VALUES ('00000035', 'bmNwZE5YZ1M=YzhlNDIxYTYxMjQ3YWJkYjg3MDUwZWNiMjlmZDljZjE=', '00000035', NULL, 0);
INSERT INTO `admins` VALUES ('00000036', 'bmNwZE5YZ1M=NjAzMGI4ZGE1MDJiNjg4NGE1ZDMyNDEwNWU4MzhjY2Q=', '00000036', NULL, 0);
INSERT INTO `admins` VALUES ('00000037', 'bmNwZE5YZ1M=NTY3MjJkMGU1YzU4YzljMGQ4NjRjNThiZjA5ZWQ4M2Q=', '00000037', NULL, 0);
INSERT INTO `admins` VALUES ('00000038', 'bmNwZE5YZ1M=MWM5NmJhN2ZkNDYzOTI2M2Q0NDM3Mjc3ODJiOTIzOWM=', '00000038', NULL, 0);
INSERT INTO `admins` VALUES ('00000039', 'bmNwZE5YZ1M=YmFmYTg0ZGEyZWVmZGE0M2Y1NTdkNTg5OWU2YzgxYmY=', '00000039', NULL, 0);
INSERT INTO `admins` VALUES ('00000040', 'bmNwZE5YZ1M=ZGMyZTVlNmI3NjI1YTgwMzIyNDQ3MTI4MmJlY2IxZmM=', '00000040', NULL, 0);
INSERT INTO `admins` VALUES ('00000041', 'bmNwZE5YZ1M=NDZjMWE0ZGU5NDY4NjYxZGNhMzRkMjA2MWNiYzYwMDE=', '00000041', NULL, 0);
INSERT INTO `admins` VALUES ('00000042', 'bmNwZE5YZ1M=MzA1MTlmZGJiZjdkYjVkNzE3ZTMyYzc1MWQ5NWJmMTU=', '00000042', NULL, 0);
INSERT INTO `admins` VALUES ('00000043', 'bmNwZE5YZ1M=NjU2N2VjODFlYjE1ZWJlMDI1N2RkYzI5YjI3Zjk1MTg=', '00000043', NULL, 0);
INSERT INTO `admins` VALUES ('00000044', 'bmNwZE5YZ1M=ZDFiOGQ2NGU5N2VjMGRlNWIyMTA5ZmZjMjA4NjViZjI=', '00000044', NULL, 0);
INSERT INTO `admins` VALUES ('00000045', 'bmNwZE5YZ1M=MzlhOWMwNGZlZmE5MjVhM2JiMTU1NTU5ZmQ0MjczNTM=', '00000045', NULL, 0);
INSERT INTO `admins` VALUES ('00000046', 'bmNwZE5YZ1M=NzM2ZWVjOTM2MTk1MzQ5MDg0ZGJhZjlhNTRlNjg3NmY=', '00000046', NULL, 0);
INSERT INTO `admins` VALUES ('00000047', 'bmNwZE5YZ1M=YWMzOGI1NGUzYmM2YTc2Y2QwMTQxYmI3ZjdhODg0MjQ=', '00000047', NULL, 0);
INSERT INTO `admins` VALUES ('00000048', 'bmNwZE5YZ1M=ZmExZjIzNjU1OGIxODhmY2Y2YzE3YTg0ZWQwOTdjYzI=', '00000048', NULL, 0);
INSERT INTO `admins` VALUES ('00000049', 'bmNwZE5YZ1M=MmI1OTcyODgxNmQyNDZlZGIyZTViNzVlMTY4MDc4ODM=', '00000049', NULL, 0);
INSERT INTO `admins` VALUES ('00000050', 'bmNwZE5YZ1M=MGI3OTc5MGU0OTExMTk1Nzc5YWUzMjA3ZTJhNjMyZTI=', '00000050', NULL, 0);
INSERT INTO `admins` VALUES ('00000051', 'bmNwZE5YZ1M=ODQ0ZDhlMzkwNWE3ZThhN2JlZjViMzcwYTJjNDBjZTA=', '00000051', NULL, 0);
INSERT INTO `admins` VALUES ('00000052', 'bmNwZE5YZ1M=MWIyYjQzMzhhMmY0MzBjY2ZlNGRhNjdjNmMyNDdlNzQ=', '00000052', NULL, 0);
INSERT INTO `admins` VALUES ('00000053', 'bmNwZE5YZ1M=ZGNlNGFhNjhhNDQwNzU0MTYzMTNhMzNlOTlhMzVhMWQ=', '00000053', NULL, 0);
INSERT INTO `admins` VALUES ('00000054', 'bmNwZE5YZ1M=NTlmMTg0OWQxOWNjY2RkMDg2MzMyZjJjMzVmYmIwNWI=', '00000054', NULL, 0);
INSERT INTO `admins` VALUES ('00000055', 'bmNwZE5YZ1M=Mzg4ZGE2MGM4NDQ2ZmRiOTczMDUwMTFmMTQ3OWU4MmU=', '00000055', NULL, 0);
INSERT INTO `admins` VALUES ('00000056', 'bmNwZE5YZ1M=YWU0OTMwZmUwMDBhMTNlMzM5MjdkOWU5NmY0YzZlZmU=', '00000056', NULL, 0);
INSERT INTO `admins` VALUES ('00000057', 'bmNwZE5YZ1M=NTA2NjU2NGEwZDZiN2QxMTZmOGNjYzZlOGVkZDY4YmI=', '00000057', NULL, 0);
INSERT INTO `admins` VALUES ('00000058', 'bmNwZE5YZ1M=Nzg3ZmRmYWE1NjQ2ZmUyNmQwNjYzMDhhOWJjNjgxZTQ=', '00000058', NULL, 0);
INSERT INTO `admins` VALUES ('00000059', 'bmNwZE5YZ1M=YTM3MWM0MGQ2NGFiZThiMWEzNmFlOGFlOTMwNWQzYmY=', '00000059', NULL, 0);
INSERT INTO `admins` VALUES ('00000060', 'bmNwZE5YZ1M=YjJjMGJhYzI1M2UzNjJiODI0YzRkNDIwNTNhYTE4YmE=', '00000060', NULL, 0);
INSERT INTO `admins` VALUES ('00000061', 'bmNwZE5YZ1M=ODQ4NTYwZmM2NTQyZGU5YjAzYzE0NmNjY2E5MDFkOTc=', '00000061', NULL, 0);
INSERT INTO `admins` VALUES ('00000062', 'bmNwZE5YZ1M=MDI2MjdiYWUyMThhYTE4ODQwNmY2NmYxNWU0ZTYzNjI=', '00000062', NULL, 0);
INSERT INTO `admins` VALUES ('00000063', 'bmNwZE5YZ1M=MzZhMWFjM2UxNDE5YzQzZWU0MDY2MDVmYzRjOWEyMmQ=', '00000063', NULL, 0);
INSERT INTO `admins` VALUES ('00000064', 'bmNwZE5YZ1M=ZDgyMzY0MjE3YzkwYzRlZDJlZjQwZmZmMDVhZWU5NjQ=', '00000064', NULL, 0);
INSERT INTO `admins` VALUES ('00000065', 'bmNwZE5YZ1M=YzI2ZTMyOWZhZjM1ZTUxYmM3NjZiNzM1MDhiNWU2MTY=', '00000065', NULL, 0);
INSERT INTO `admins` VALUES ('00000066', 'bmNwZE5YZ1M=NDE3ZmM5YzhkMDY0NDllMTllNWNhOGM1Njk2ODA4MDY=', '00000066', NULL, 0);
INSERT INTO `admins` VALUES ('00000067', 'bmNwZE5YZ1M=ZDcwMjk2MDY2YWQ1ZTg4MTIwNmZlN2U0YzIyYmE3N2Y=', '00000067', NULL, 0);
INSERT INTO `admins` VALUES ('00000068', 'bmNwZE5YZ1M=ZDllOWUyYTc4YWY4NmE4ZjUxOWIxMWY3OGE3YzFjNTI=', '00000068', NULL, 0);
INSERT INTO `admins` VALUES ('00000069', 'bmNwZE5YZ1M=NDE3OWE5YTBmYmU3YTNjMWFlNjYxNGU5YWVjODFlZTk=', '00000069', NULL, 0);
INSERT INTO `admins` VALUES ('00000070', 'bmNwZE5YZ1M=MWNlYWViNzM0MGFkYTljYTQ4Y2EzMzc2OGYxZGVkYjk=', '00000070', NULL, 0);
INSERT INTO `admins` VALUES ('00000071', 'bmNwZE5YZ1M=MDAxZWFkZWI4MGZkMjQwZmE3MjViN2IzMzBmNTA0ZTA=', '00000071', NULL, 0);
INSERT INTO `admins` VALUES ('00000072', 'bmNwZE5YZ1M=ZTk1ZTcwNmI1OTI0ZDNjMWY5MWNlNDhmZDQ4MmUwM2E=', '00000072', NULL, 0);
INSERT INTO `admins` VALUES ('00000073', 'bmNwZE5YZ1M=ZDYwYjlmOWJmMGVjZGJiMjFlMWIyYzQ4ODhmODJiOTg=', '00000073', 'vvRpuXb6JTbCu3iA', 0);
INSERT INTO `admins` VALUES ('00000074', 'bmNwZE5YZ1M=MDM1NmFhNjE3MmQ0OGNlNWIyYzA5Y2Q1NTUzNGIyZTg=', '00000074', NULL, 0);
INSERT INTO `admins` VALUES ('00000075', 'bmNwZE5YZ1M=OGI0YjljYTIyMTkzOTU4ZWI5MjMyOTJjMjUwMmQxNjg=', '00000075', NULL, 0);
INSERT INTO `admins` VALUES ('00000076', 'bmNwZE5YZ1M=M2E2OWY5ODk4Yzc5MDk1NDA2N2MxMzRkYjY0NWE4YTQ=', '00000076', NULL, 0);
INSERT INTO `admins` VALUES ('00000077', 'bmNwZE5YZ1M=MWY0MGNhYzYyZmEyODFjZTRkZWQxM2JhOGVlYTY3Y2U=', '00000077', NULL, 0);
INSERT INTO `admins` VALUES ('00000078', 'bmNwZE5YZ1M=M2MzMjViMjBiMDJmYmEwNWVmYThlYjM0NzZhZDFkZjA=', '00000078', NULL, 0);
INSERT INTO `admins` VALUES ('00000079', 'bmNwZE5YZ1M=YmZjOWMyM2VmZjUwYTM5Y2Y2ZjRmY2FmMzcxMjg3MzA=', '00000079', NULL, 0);
INSERT INTO `admins` VALUES ('00000080', 'bmNwZE5YZ1M=ZDkyY2Y5YzMxOTQ5ODFmYWY3OGI3YzljMzJkMTAzOTU=', '00000080', NULL, 0);
INSERT INTO `admins` VALUES ('00000081', 'bmNwZE5YZ1M=OWY2NmY5NGQyYjAzNzUxMGVjZDNmZmJjYzVhZmQ1ZjI=', '00000081', NULL, 0);
INSERT INTO `admins` VALUES ('00000082', 'bmNwZE5YZ1M=ZGRmYzI4MTYyZWZhYmNjODU3NDRkMmUwYjAxYTdkNDY=', '00000082', NULL, 0);
INSERT INTO `admins` VALUES ('00000083', 'bmNwZE5YZ1M=ODMxNDBlMTBhOTE5YThjMmRjNDE2OWUyOWYyODM3YTU=', '00000083', NULL, 0);
INSERT INTO `admins` VALUES ('00000084', 'bmNwZE5YZ1M=YjczODRmNjYyMzFiNWUyN2E3Y2Y1YWMxOTk2ZDYzMTg=', '00000084', NULL, 0);
INSERT INTO `admins` VALUES ('00000085', 'bmNwZE5YZ1M=ZjllM2ZiMDZlNGNkMjM5NmE0NzY0Y2YxZDU3MWJiOGQ=', '00000085', NULL, 0);
INSERT INTO `admins` VALUES ('00000086', 'bmNwZE5YZ1M=ZDJhMDAwOGZjNDkxMjM3NjVjNjQwNjI3ZjFlOGQ2ZDg=', '00000086', NULL, 0);
INSERT INTO `admins` VALUES ('00000087', 'bmNwZE5YZ1M=MDZlNmVhN2RkOWUxMDhjZDc5MDI0MGQxNmNmOGQ1Nzc=', '00000087', NULL, 0);
INSERT INTO `admins` VALUES ('00000088', 'bmNwZE5YZ1M=YWVmOWU4Y2Y3N2JiMDZkYTQ2NjEzNzU0YjcyNjdjMWM=', '00000088', NULL, 0);
INSERT INTO `admins` VALUES ('00000089', 'bmNwZE5YZ1M=NDMwZTAxNjMwMDAzMjkxYjRkYTI5YzU0YmFmZjIyZGQ=', '00000089', NULL, 0);
INSERT INTO `admins` VALUES ('00000090', 'bmNwZE5YZ1M=ZWIwNDZhYWIxOGY5OWRmMjE2ZDE4ZWY1Mzc1MTIwNDE=', '00000090', NULL, 0);
INSERT INTO `admins` VALUES ('00000091', 'bmNwZE5YZ1M=MzZlODg5ODc2YmMyNmUyNzBmNWEzODM3M2FiM2RmZTg=', '00000091', NULL, 0);
INSERT INTO `admins` VALUES ('00000092', 'bmNwZE5YZ1M=ODhmZDA2MWZjNjEzOTg3YzAwMTFiZWViNTJmY2VmNWQ=', '00000092', NULL, 0);
INSERT INTO `admins` VALUES ('00000093', 'bmNwZE5YZ1M=MTQ3YzI1YzE0MzJmYWE2NTRiNTdmODc5MjczNjZiNDE=', '00000093', NULL, 0);
INSERT INTO `admins` VALUES ('00000094', 'bmNwZE5YZ1M=NjQxZWJlMzBiMjNiOTI4MTNhNTliODdlNTQ0NGZmNTc=', '00000094', NULL, 0);
INSERT INTO `admins` VALUES ('00000095', 'bmNwZE5YZ1M=NmIzNjY3YTgyNDZmZGM2YjlhYzE3N2YzZDY0MzBkZDE=', '00000095', NULL, 0);
INSERT INTO `admins` VALUES ('00000096', 'bmNwZE5YZ1M=YWM2ZjcxNzU4M2Q3ZGI4MDM1OGExZmMzOGI2ZDYwZmY=', '00000096', NULL, 0);
INSERT INTO `admins` VALUES ('00000097', 'bmNwZE5YZ1M=NjNkYzRiMmJhMzI0N2QwZmZhN2Q0YTdhNzMzOTU3MWI=', '00000097', NULL, 0);
INSERT INTO `admins` VALUES ('00000098', 'bmNwZE5YZ1M=NTYxODI5YTNjOGM4MmZjYTVhNzQzY2RkMjZmYzU2YzM=', '00000098', NULL, 0);
INSERT INTO `admins` VALUES ('00000099', 'bmNwZE5YZ1M=ZTU2NTFkY2ZiMGMzNzZmNDllZWUxYzg0OGU3YTM3M2U=', '00000099', NULL, 0);
INSERT INTO `admins` VALUES ('00000100', 'bmNwZE5YZ1M=ZGMxYWM4NmY4NjEzNDQyYjUzMTQ0YWI2ZTVkNmQ0ZjQ=', '00000100', NULL, 0);
INSERT INTO `admins` VALUES ('00000101', 'bmNwZE5YZ1M=NmE5MzcwZGVkYjViMjdlN2ZkMDVjYjU0YTU0YWRkYTI=', '00000101', NULL, 0);
INSERT INTO `admins` VALUES ('00000102', 'bmNwZE5YZ1M=MDRmYTQyMmVmYTlhMjA1NzQ2NWY0MDdmM2IwNjIzNDE=', '00000102', NULL, 0);
INSERT INTO `admins` VALUES ('00000103', 'bmNwZE5YZ1M=ZTdlMTMwMzQyY2MwMWQzMGNhMTU4MzMxY2VhN2RlZjU=', '00000103', NULL, 0);
INSERT INTO `admins` VALUES ('00000104', 'bmNwZE5YZ1M=OWQwODA1ZWVmYzc1MmI0N2RlN2M1ZGYxZDZkODg2YTE=', '00000104', NULL, 0);
INSERT INTO `admins` VALUES ('00000105', 'bmNwZE5YZ1M=MmY0MGI2NWQ1MWRkMDI3OGVhMTQwOGUyNmI3ZWFjYTY=', '00000105', NULL, 0);
INSERT INTO `admins` VALUES ('00000106', 'bmNwZE5YZ1M=NDVkMzViNzk1YjA5YTg2ODk1ZDQ1YTI4OWUxYTVlODA=', '00000106', NULL, 0);
INSERT INTO `admins` VALUES ('00000107', 'bmNwZE5YZ1M=YWIxZWRhOWQ4YWZkYzNjZGQ2YTdhNTJkNjA2ODE1Zjk=', '00000107', NULL, 0);
INSERT INTO `admins` VALUES ('00000108', 'bmNwZE5YZ1M=MTU1OTY4ZDE1OTAzYjA1ZTdlNzQzMTNkNGYxZmUxMjk=', '00000108', NULL, 0);
INSERT INTO `admins` VALUES ('00000109', 'bmNwZE5YZ1M=MjFmYWNiZWVlOTZlNmQxNWE5MTFiNzFhYjE2MTk5ZDM=', '00000109', NULL, 0);
INSERT INTO `admins` VALUES ('00000110', 'bmNwZE5YZ1M=YzI2ZDdkYjQ3OGM0MmQ4YzRlMWFkODRhMTU5M2ZlYmY=', '00000110', NULL, 0);
INSERT INTO `admins` VALUES ('sst', 'Um1kRUwwdEE=N2RhZGM4MjhlNGFmMzkzNGIyZWUyYWVlMGE4MzNhMGU=', '00000001', 'd1ijGoU3zydOjvSw', 1);

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
INSERT INTO `huodong` VALUES ('1536656535046SkAW6s', '00000001', '2018-09-11 17:02:15', '社联第一条动态，测试', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 0, '[\"/images/activity/1536656534170-EzMbsB-.jpg\",\"/images/activity/1536656534154-aFxqJo-.jpg\",\"/images/activity/1536656534177-hG4nQL-.jpg\",\"/images/activity/1536656534129-f4ndns-.bmp\"]', 1);
INSERT INTO `huodong` VALUES ('15366821628929IHnzv', '00000023', '2018-09-12 00:09:22', '三农。。。', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 0, '[\"/images/activity/1536682162572-S2WgDi-.jpg\"]', 1);
INSERT INTO `huodong` VALUES ('1536682399833VK0wkM', '00000073', '2018-09-12 00:13:19', '为了士兵的荣耀！！！', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', 1, '[\"/images/activity/1536682399216-sVN9nL-.jpg\",\"/images/activity/1536682399224-M9cjrc-.jpg\",\"/images/activity/1536682399193-z6OyoE-.jpg\"]', 1);

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
INSERT INTO `huodongdz` VALUES ('1536682399833VK0wkM', 'oOj6Z5YYn2ECqt7zUWrs017TcxCU', '2018-09-12 12:26:21', 1);

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
  `jphd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '精品活动',
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
INSERT INTO `shetuan` VALUES ('00000001', '河南大学学生社团联合会', '河南大学学生社团联合会是在中共河南大学委员会的领导下和共青团河南大学委员会的具体指导下管理、服务、指导、监督河南大学各学生社团的学生自治组织，是建设校园精神文明、发展先进文化的重要力量。\r\n\r\n\r\n河南大学学生社团联合会设有八部一室，分别为：办公室、外联部、组织部、纪检部、策划部、宣传部、网络部、新闻编辑部和文艺部。\r\n办公室:\r\n办公室是社联的重要组成部分,在社联中起枢纽的作用,被形象地称为社联的“管家”。主要负责社联的内部财务与文件档案等事务，在具体活动中负责执行协调工作，在日常工作中负责协调社联各部门和社团的正常运转。\r\n外联部:\r\n负责争取社会各方面的支持，寻求商家的赞助合作，以及组织和\r\n协调各社团的实践活动等。\r\n组织部:\r\n作为社联重要部门的组织部,主要负责社团的成立、注销的审查，主席团日常文秘起草，社联大型活动如社团十大人物，社团巡礼，社团文化节，学年表彰文件的制定以及社联委员、社团干部培训工作，并组织开展思想教育活动。\r\n纪检部:\r\n负责社联内部各项活动的考勤和各社团活动的打分监督，保证学\r\n生社团健康有序的开展活动，负责评定“星级学生社团”、“优秀学\r\n生社团”、“学生社团优秀干部”等评优工作。\r\n策划部:\r\n策划部是社联的“智囊”,它负责各项工作与活动的策划，协助学生社团活动的整体策划安排。积极开展并推动整个学生社团之间的经验交流，审核社团活动策划方案。\r\n宣传部:\r\n宣传部作为社联的“形象大使”,主要负责社联的各项日常宣传\r\n工作，承接展板、海报设计以及活动摄影工作。   \r\n网络部\r\n通过网络开展并推动各学生社团之间的交流，负责社联网站的日\r\n常更新和管理工作，及时发布社联、社团动态，策划执行每年一届的\r\n电子竞技大赛。\r\n新闻编辑部\r\n负责社联及社团大小活动的新闻采写，及时发布在学校各个媒体，\r\n记录会议内容并整理存档备查。负责社联杂志的选稿、撰稿、印发及\r\n管理等。\r\n    文艺部\r\n负责社联大型文艺活动汇演的前期彩排和现场的幕后工作，是社\r\n联金牌活动的总策划师。\r\n', '/images/commLogo/shelian.jpg', 999, 1, '社团管理', 0, '未设置', '河南大学校团委', '王大锤', '', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000002', '明德廉风学社', '明德廉风学社取自《大学》：“大学之道，在明明德”，秉承我校校训：明德新民，止于至善。明德廉风学社是一个以“知清廉，行廉洁，知行合一”的廉政理念为指导，以廉洁诚信教育为主题，以“宣传普及廉政知识，提升大学生廉洁意识，树立大学生讲诚信秉廉洁的价值观，推动廉洁诚信校园文化建设”为宗旨，努力树立学生廉洁诚信精神，建设校园廉洁诚信文化环境的，并在中共河南大学纪律检查委员会的指导下，在中国共青团河南大学委员会的领导下，挂靠于中国共青团河南大学哲学与公共管理学院委员会的学生组织。', '/images/commLogo/none.png', 42, 0, '思想政治', 0, '未设置', '哲学与公共管理学院', 'NULL', '河南大学12•9廉洁教育系列活动月', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000003', '中国特色社会主义研究会', '中国特色社会主义研究会成立于2015年，挂靠在河南大学马克思主义学院，现任指导老师马润成，彭绪琴，张兴茂，现有会员人数184人。我们成立中国特色社会主义研究会，一方面是为了使大学生真正将中国特色社会主义道路、理论、制度内化于心，外化于形；另一方面也是为了提高大学生的综合素质，使之成为可以不断学习、自我革新、正确思考的“可持续发展”人才，让人生更出彩！我们协会主要通过研读经典、培训、宣传、热点追踪、专题讲座、课题研究、理论知识竞赛、社会调查、模拟活动、主题研讨会等形式，使大学生全面深入的掌握马克思主义的精神实质和党的路线方针政策，理性而准确的认识国史和国情，培养出有政治素养、有责任、有使命的大学生！', '/images/commLogo/none.png', 184, 1, '思想政治', 1, '未设置', '河南大学马克思主义学院', 'NULL', '读书日活动', 'NULL', '明伦');
INSERT INTO `shetuan` VALUES ('00000004', '马克思主义研究会', '河南大学马克思主义研究会成立于1989年6月，挂靠于文学院。它是全校学生积极参与的，也是我校成立最早的学生理论社团，以“宣传马克思主义、坚定理想信念、追求真理、探索人生道路”为宗旨。二十多年来，随着学校的发展，马克思主义研究会也从稚嫩走向成熟，多次被评为河南大学“马列先进集体”、“十佳社团”、“五星级社团”，是我校“学习邓小平理论‘1+1+1’教学模式实验班”；2003年，被省教育厅评为“河南省教育系统优秀社团”； 2009年4月1号，在河南大学视察的国家领导人习近平应邀参加马克思主义研究会开展的主题为“知行合一，报效祖国”的研讨会，并给予极高评价；2010年被中国共产主义青年团中央委员会评为“大学生思想引导优秀活动案例”。2013年1月，马克思主义研究会举办的“时政沙龙”系列活动，被河南省教育厅、河南省高工委授予“2012年度河南省高等学校思想政治工作优秀品牌”的荣誉称号。', '/images/commLogo/none.png', 78, 0, '思想政治', 1, '未设置', '河南大学文学院', 'NULL', '主题征文、时政沙龙、专家讲座、社会实践、新闻评选、思想交流会、两会解读', 'NULL', '明伦');
INSERT INTO `shetuan` VALUES ('00000005', '河南大学国学研究会', '河南大学国学研究会成立于2007年5月。协会宗旨是为天地立心，为生民立命，为往圣继绝学，为万世开太平。以河南大学深厚的历史文化底蕴为依托，传承国学文明、传播先进文化。我们的主要任务是通过积极正确的途径开展健康向上、丰富多彩的校园文化活动，引起广大学子对国学的兴趣和关注，不断学习、了解和领会，从而提高综合素质和各项能力。解读经典，呼唤中国传统文化精华的回归，让广大学子和社会大众树立起对传统文化的正确认识，用以解决现代人生活中的困惑和迷茫，同时不断完善自己的道德体系和价值体系，进而为构建社会主义和谐社会、实现中华民族的伟大复兴贡献力量。品牌特色活动：河南大学名家讲坛、河南大学新年诗会、河南大学大型读书交流活动、河南大学“国学之声”征文大赛、国学文明传承日、国学辩论赛、“国学之声”颁奖晚会。', '/images/commLogo/none.png', 500, 0, '学术科技', 0, '未设置', '河南大学黄河文明与可持续发展研究中心', 'NULL', '', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000006', '新天地外语学习社', '河南大学新天地外语学习社，成立于2008年5月份，挂靠于河南大学经济学院，社团贯彻享受英语--学以致用的宗旨，以 New Sky , New world 作为社团口号，为全校学生展示自己的外语水平提供一个专业的平台。社团自2008年成立以来，经过一代又一代人的努力，连续多年被评定为河南大学金明校区星级社团，在校团委、院领导以及各位老师的殷切关怀和细心指导下，社团各项工作进展顺利，真正的成为了同学们增强学习能力、娱乐身心、丰富外语知识、培养外语技能的新天地。同时，她还为大家展现自我提供了一个十分专业的平台，为同学们营造了一个良好的外语学习氛围。社团宗旨是努力提高全校学生的外语水平，创办河南大学一流社团。', '/images/commLogo/none.png', 150, 0, '学术科技', 0, '未设置', '经济学院', 'NULL', '河南大学英语风采大赛', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000007', '书评学社', '河南大学书评学社成立于1984年，隶属于图书馆，是以校图书馆为依附的学生社团组织。她以引导学生多读书、读好书，提高阅读水平为宗旨；以提高社员表达能力、辨意识和知识品格为目的，吸收了历届爱好读书的朋友，举办各种读书写作、讨论活动，并编辑印发了社刊《书苑》。多年来她一直本着务实求真的态度服务于社员，得到了学校有关领导与广大老师，特别是图书馆的关心、支持和帮助。如今，从这个书香缭绕的园地里，已走出了1600余人，包括近百名研究生，并在国家、省市、校级刊物上发表文章三百余篇。协会本着“读书，品书，感悟人生。谈书，交心，以书会友”的宗旨，致力于提高社员表达能力，思辨意识和知识品格。从书中感悟人生，在书林结交挚友，同时尽最大的努力在生活、学习中给予指引和帮助。', '/images/commLogo/none.png', 240, 0, '学术科技', 0, '未设置', '河南大学图书馆', 'NULL', '书评学社迎新晚会', 'NULL', '明伦');
INSERT INTO `shetuan` VALUES ('00000008', '英语协会', '协会自诞生以来，就时刻不忘宗旨，为提高广大同学们的英语水平，营造一个良好的英语学习的氛围开展各式各样的活动，鼓励大家说出自己的英语，SHOW出自己的风采。在保证大家英语学习的自由化和主动化的同时，通过多样化的活动，潜移默化的提高大家的英语水平，规范大家的日常英语使用，为广大的英语爱好着提供一个交流的平台，并利用网络平台优势，继续运营会员交流群，吸纳了大部分新会员，使大家可以随时随地了解英语协会的动向，认识更多的朋友。 ', '/images/commLogo/none.png', 300, 0, '学术科技', 0, '未设置', '大学外语教学部', 'NULL', '晨读，四六级模拟考试', 'NULL', '明伦');
INSERT INTO `shetuan` VALUES ('00000009', '证券研究协会 ', '自1994年成立以来，在一代代证券人的努力下，河南大学证券研究协会本着“研究证券，关注改革，思考社会，经济报国”的宗旨，在同学之间大力普及证券知识，以提高学生对理论知识的实际应用能力。在这21年的发展中，河南大学证券研究协会经历了由稚嫩到成熟的华美蜕变。这其中有辛酸也有甘甜；有坎坷崎岖也有大步向前。协会成员以自己是“证券人”而骄傲，以行动践行着证券协会的职责。我们始终紧跟时代步伐，一路走来，一路创新。2003年，一个值得一代代证券人铭记的一年，国都证券公司与证券研究协会的校企合作实现了历史性的跨越，为协会的发展添上了浓重的一笔。近年来，在证券协会的发展壮大和国都证券公司合作的日益深入的基础上，我们开办了自己的品牌活动“精英培训”和“模拟股市”。', '/images/commLogo/none.png', 112, 0, '学术科技', 0, '未设置', '共青团河南大学经济学院委员', 'NULL', '', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000010', '演说与口才协会', '协会宗旨：传播文化，传递正能量。积极，向前，热情，大方，相互学习，相互交流，共同进步，共同提高。协会精神：一切皆有可能！人的潜力是可以无限挖掘的，不断挑战，不断超越，不断突破！只要有恒心，有毅力，坚持不懈，没有不可能只要去做。互相交流，互相激励，互相提高，众人拾柴火焰高。所有人的思想，不断碰撞，就能不断擦出灵感的火花！永不言弃，发奋图强！协会目的：主要是改变想说又不敢说，敢说又不会说，会说又说不好现在大学生普遍现象。培养当代学者的表达能力、让会员们能够准确的表达出自己的观点，培养说话能力和方法，为他们在社会上走的更远，走的更高打下坚实的基础。', '/images/commLogo/none.png', 41, 0, '学术科技', 0, '未设置', '河南大学软件学院', 'NULL', '演讲比赛、演讲技巧培训活动、主题演讲等', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000011', '软件联盟协会', '协会本着“致知格物，意诚修身”的会训，以“普及软件知识，提高会员专业水平，提高同学们的综合素质，丰富课余生活，调动学生的积极性，培养软件开发创新能力和初级计算机软硬件开发能力，激发广大同学对软件设计，计算机应用的兴趣\"为宗旨。从成立至今举行了计算机二级模拟，网页工作室，电脑义诊等活动，为河南大学师生在计算机软件和硬件方面提供了大量的帮助。', '/images/commLogo/none.png', 100, 0, '学术科技', 0, '未设置', '软件学院', 'NULL', '计算机二级模拟，网页工作室，电脑义诊', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000012', '大学生经济贸易学社', '大学生经济贸易学社紧紧围绕“把握最新学术动态，关注最新经济时事，推广经济常识”的宗旨，以例会、讲座、辩论会、论坛等形式与大家分享经济要闻，讲解相关经济常识，教授理财技巧，分析就业兼职的相关问题。同时在社团内部每周例会上，在探讨学术之余，大家可以畅谈所见所闻，阐述自己的见解。此外社团每年组织圣诞晚会，春游等娱乐节目，加强社团团结，形成良好的社团文化，为经贸展现个人魅力，提高人际交往能力创造了一个理想的舞台！', '/images/commLogo/none.png', 50, 0, '学术科技', 0, '未设置', '经济学院', 'NULL', '中原经济论坛，辩论赛，时事聚焦例会，精品讲座', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000013', '建筑艺术爱好者协会', '建筑艺术爱好者协会是立足于河南大学土木建筑学院的一个学生团体。成立于2001年，在校团委和学生会的鼎立支持下，多年来，建筑艺术爱好者协会不断探索发展，力争在实践与创新中取得进步。建筑艺术爱好者协会是以培养学生专业素养，营造良好学习氛围，拓展学生建筑知识，锻炼实践及动手能力。', '/images/commLogo/none.png', 34, 0, '学术科技', 0, '未设置', '', 'NULL', '宏村写生画展、“绿色建筑中国行”专题讲座', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000014', '生物爱好者学会', '河南大学生物爱好者学会创立于 2015年5月20日，到2016年为止会员人数为85人。生物爱好者学会是在生命科学学院团委老师和领导的大力支持下由一些生物爱好者以及相关专业老师自愿结成、所成立的激发我校师生生物科学兴趣的全校性的学会组织，它是我校培养生物科学爱好的集中力量，对我校生物科学发展起推动作用。本学会将围绕生物学的学科范围从事例如“开展生物学学术交流、定期普及科学知识、定期开展校内动植物鉴别活动”等活动，旨在团结广大生物爱好者，促进科学的繁荣和发展。在这一年里学会成功举办了“梦想蓝天，与鸟相伴”的特色观鸟活动；', '/images/commLogo/none.png', 85, 0, '学术科技', 0, '未设置', '', 'NULL', '', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000015', '金融保险协会', '河南大学金融保险协会是一个旨在促进大学生全面发展、提高大学生对知识运用能力和实践能力的研究性社团。如今金融业蓬勃发展。中国金融业正处于兴起阶段，有着广阔的发展空间。金融保险协会致力于为广大师生提供一个广泛了解金融保险业的平台和更多接触保险公司进行实践操作的机会，也为我国金融保险市场培养和提供更多优秀人才。协会自成立以来，举办过一个又一个影响深远的活动， 百尺竿头，更进一步。金融保险协会在学校领导老师及同学们的支持和关注下日益蓬勃发展，期待协会继续创造辉煌佳绩。热烈绽放数八载，激荡青春又一新！', '/images/commLogo/none.png', 51, 0, '学术科技', 0, '未设置', '河南大学经济学院', 'NULL', '', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000016', '大学生心理协会', '协会自始便以以普及和宣传心理学知识、提高大学生心理素质、关注当代大学生心理健康为宗旨，以“感恩，和谐，奉献”为理念，以在丰富多彩的活动中融入心理学知识、心理健康教育等关注大学生心理的知识为特色，以提高大学生各方面的心理适应能力和承受能力为目标，以关爱身边同学、温暖他人心灵为己任，为培养当代大学生健康心理、构建和谐校园贡献她的一份力量。', '/images/commLogo/none.png', 51, 0, '学术科技', 0, '未设置', '河南大学教育科学学院', 'NULL', '校园心理测量、525心理健康宣传周', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000017', '医学研究会', '2015年之前曾办过校园义诊、西医考研讲座、英语讲座等活动。2015年5月换届以来，新一届理事会寻求社团个性发展，突破创新，举办一系列活动。正在筹办的也是我们社团的品牌活动——“河南大学应急救护知识技能文化节”。已经过校团委审批为校级活动。活动分为两部分，文化节宣传活动和文化节竞赛活动。活动日期暂定每年6月2日至7月12日。时间跨度长，内容也将会逐年丰富。联合祥符区红十字会举办第一次初级救护员培训', '/images/commLogo/none.png', 135, 0, '学术科技', 0, '未设置', '河南大学医学院团委', 'NULL', '河南大学应急救护知识技能文化节', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000018', '医学心理协会', '协会以普及心理学知识、提高会员心理素质、促进心理学发展、加强与医学联系为宗旨；以“参与、务实、奉献”为口号；以发掘会员潜能、丰富校园文化、提高会员在社会上的适应能力，加强社团自身建设为目的。在校团委、医学院团总支的正确领导下，协会活动蒸蒸日上，在2001-2002学年河南大学首次社团量化评比中，本协会在40余个社团中名列第四，被评为河南大学十佳社团，2003-2004学年仍被评为河南大学十佳社团，2004-2005学年在六十多个社团中名列前矛被评为四星级社团,2005-2006学年又顺利从四星级社团晋升为五星级社团，2009-2010学年及2010-2011学年均被评为河南大学十佳社团，2013-2014学年被评为河南大学优秀社团', '/images/commLogo/none.png', 1600, 0, '学术科技', 0, '未设置', '医学院', 'NULL', '*校园义诊', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000019', '科技创新协会', '河南大学科技创新协会旨在培养和提高同学们的创新意识和创新能力，为具有探索精神与科技创新精神的同学搭建一个平台。在这里，大家可以了解科技学术最前沿信息，感受浓厚的学术创新氛围，参与科技创新实践。科技创新协会给科技创新兴趣者提供一片沃土，为科技创新爱好者撑起一片天空。本协会以培养我校学生对学术科技的兴趣、探讨学术科研问题、展示学术科技作品，以及提高我校学生学术科技的总体水平为主要责任，同时充分挖掘和培养校园优秀的科技人才，致力于推动全校学生学术科技活动的组织和开展，为营造我校良好的学风校风，浓厚我校的学术科技氛围服务。协会会训：坚定信念与时俱进。协会口号： 积极、求实、团结、创新。真真正正的科技，实实在在的创新！', '/images/commLogo/none.png', 1600, 0, '学术科技', 0, '未设置', '物理与电子学院', 'NULL', '电子实训、成品秀、题王争霸、社团联谊晚会、集体出游', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000020', '数学建模与应用协会', '河南大学数学建模与应用协会是一个以数学为中心的理工科学术交流平台，涵盖数学、软件编程、经济、物理、机械、规划管理等等理工学科，以竞赛交流培训和学术互动为中心，为大家的专业学习提供一个互动协作的园地。同时，本社团以数学建模作为主要活动之一，宣扬数学文化，以提高数学的学习兴趣及能力为主旨，帮助同学们理解并掌握数学的逻辑智慧，协助大家建立一个坚实的理科思维基础。本协会支持同学们自由发展理工相关兴趣，让拥有共同兴趣志向的理科生聚集在一起，在成长的路上结伴同行。', '/images/commLogo/none.png', 30, 0, '学术科技', 0, '未设置', '数学与统计学院', 'NULL', '河南大学数学建模竞赛，全国大学生数学建模竞赛培训', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000021', '北辰天文社', '本社团是在河南大学校团委及社团联合会的指导和环境与规划学院组织下，以校内喜爱学习及研究天文相关学科的学生为基础而创建的兴趣社团组织，旨在为众多天文爱好者共同学习、互相探讨以提高天文知识的平台；普及浩瀚的宇宙天文知识；提高我校大学生对天文的理解能力和观赏能力；丰富校园文化活动、提高学生善于发现美好的眼力；开阔在校大学生视野、增强学生课外实践活动、激发同学们对于天文的兴趣，拓宽视野，奠定专业基础，培养综合性人才。本社团以“仰望星空 认识宇宙 探索自然 宣扬科学”为宗旨通过科普、观测、实验、模拟、演示、调研、讲座等形式，来引领更多天文爱好者知悉天文、了解天文、热爱天文、探索天文，让天文走进生活，普及生活中的天文常识。', '/images/commLogo/none.png', 30, 0, '学术科技', 0, '未设置', '环境与规划学院', 'NULL', '', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000022', '红学研究会', '河南大学红学研究会成立于2010年，挂靠于文学院。自成立以来，以“探古今以求善真，极高明而道中庸”为宗旨，坚持“让每一个会员都有收获”的原则，以《红楼梦》文化为引导，探寻古典文化的魅力，追求古典文化的现代演绎，活跃校园文化。协会除定期组织会员组员的交流外，还在学校开展红楼文化展、红楼电影巡礼、教师讲座、学生讲坛和红楼梦主题晚会等活动，营造了良好的人文氛围。兰亭雅集，岂聚曩时之少长，滕阁制序，还待我辈之新秀；奇文共赏，郑笺同析，百年河大园里，让我们相识相知在追梦的途中……', '/images/commLogo/none.png', 68, 0, '学术科技', 0, '未设置', '河南大学文学院', 'NULL', '视频点播、红学知识讲座', 'NULL', '明伦');
INSERT INTO `shetuan` VALUES ('00000023', '三农发展研究会', '三农发展研究会协会会徽以蓝色背景与河大校徽相呼应，两者都是蓝色，其次双手对立罩在三片叶子之上喻有呵护，保护的意思，同时双手也代表着“人”，是对我们人的一种期望，希望作为“人”的我们人去关注三农，为三农做些贡献。手下的三片叶子代表三农（农业，农村，农民）它们三者的颜色都不一样，绿色代表生命，活力，希望，所以它们三个的基色是绿色，但是最上面的那个叶子是黄绿（刚发芽，脆弱）左下深绿色，右下橄榄绿，两者差不多，会有一些小小的差别，2003是社团成立的时间，其中河南大学三农发展研究会几个字顺着圆的形状去写，把农字放中间，河跟会是对齐的。', '/images/commLogo/none.png', 180, 1, '学术科技', 1, '未设置', '河南大学马克思主义学院', 'NULL', '寒暑假下乡活动、周边共建项目活动、支农社团交流会 ', 'NULL', '明伦');
INSERT INTO `shetuan` VALUES ('00000024', '国学研究会', '河南大学国学研究会以“为天地立心，为生民立命，为往圣继绝学，为万世开太平”为理念，弘扬国学，传诵经典，继承中华民族的宝贵精神财富。协会以河南大学深厚的历史文化底蕴为依托，传承国学文明、传播先进文化，通过积极正确的途径开展健康向上、丰富多彩的校园文化活动，引起广大学子对国学的关注，并不断学习、了解和领会，从而提高综合素质和能力。解读经典，呼唤中国传统文化精华的回归，让广大学子和社会大众树立起对传统文化的正确认识，以解决现代人生活中的困惑和迷茫，同时不断完善自己的道德体系和价值体系，进而为构建社会主义和谐社会和实现中华民族的伟大复兴贡献力量。', '/images/commLogo/none.png', 58, 0, '学术科技', 0, '未设置', '河南大学教务处', 'NULL', '河南大学名家讲坛、昆曲传唱、座谈会、敦复书院学习', 'NULL', '明伦');
INSERT INTO `shetuan` VALUES ('00000025', '就业协会', '河南大学就业协会是在河南大学毕业生就业指导与服务中心的指导下成立的面向大学生、面向用人单位、为学生及用人单位提供优质服务的社团组织。是河南大学众多社团之中最具实力的社团之一，在河南大学多次量化评比中，协会均名列前茅，连续几年都被评为河南大学5星级社团.协会始终以自主、自立、求是、创新为准绳，服务广大同学，提供更多新的就业信息；组织运用科学的理念帮助大学生积极向上，健康成长；组织社会实践活动，提高协会成员的能力，提升整个协会的实力；自发地组织小部分同学进行创业演练为使命！', '/images/commLogo/none.png', 30, 0, '创新创业', 0, '未设置', '河南大学就业指导中心', 'NULL', '迎新晚会、平安果大派送、双选会、招聘会', 'NULL', '明伦');
INSERT INTO `shetuan` VALUES ('00000026', '管理协会', '河南大学管理协会（简称河大管协）是经河南大学党委宣传部批准于2000年4月成立的全校范围内的学生社团。协会现有注册新老会员2000余人，是河南大学规模和影响力最大的社团之一。协会以“增强管理意识，掌握管理科学，提高实践能力”为宗旨，积极开展校内外理论与实践活动。开启了学生了解企业、了解社会的大门，丰富了校园文化，并为着眼于培养大学生未来的职业素质和技能做出了不懈的努力。没有任何借口，一切全力以赴！豪迈的口号将见证我们更多的辉煌！', '/images/commLogo/none.png', 150, 0, '创新创业', 0, '未设置', '河南大学商学院', 'NULL', '模拟招聘，高端对话', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000027', '创业协会', '河南大学创业协会于2006年成立于河南大学明伦校区，2010年迁至河南大学金明校区，定于2016年9月在老校区成立分会。本会是依照《河南大学学生社团管理条理》发起组织、经由河南大学学生社团联合会和校团委批准注册并在校党委宣传部备案的、为同学提供锻炼社会实践能力，体验创业的学生团体。在国家创业政策的推进下，我们立足于大学生，旨在校内营造良好的创业氛围。一方面，培养大学生创新意识，提升创业素质和能力，激发创业热情，锻炼团队的协作能力，另一方面，促进大学生创业团体的沟通和交流，并使大学生创业管理体制和运作机制进一步规范化，专业化，制度化。与此同时邀请讲师为创业团队解决所存在的问题，邀请成功人士为会员传授创业经验，使大学生得到有效的创业培训。', '/images/commLogo/none.png', 46, 0, '创新创业', 0, '未设置', '就业创业指导中心', 'NULL', ' 彩色跑（The color run）', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000028', '联想idea精英汇', '社团概述：联想idea精英汇，简称精英汇，英文名： Lenovo idea elite club。是第一家由共青团中央指定的大学生实习基地，联想集团陆续在各地各高校成立精英汇分会，围绕着“塑造高校学子最核心的竞争力，成就国家社会最需要的精英”的宗旨开展各种各样的活动。河大idea精英汇自2012年成立以来以传承了四届，组织举办了很多具有影响力的活动。', '/images/commLogo/none.png', 36, 0, '创新创业', 0, '未设置', '河南大学生命科学学院', 'NULL', '约战吧！小Y     联想高校分享会河大站 ', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000029', '集思社团', '集思社团以创业教育为己任，以“发掘自我潜能，展示自我价值，全面培养大学生综合素质”为宗旨。以实际行动促进大学生能力的提高，锻炼其社会实践能力，以培养其知行合一，报效祖国的精神。集思人秉承“智慧机灵，团结沧桑，顽强执着，勇往直前”的集思人品质，发扬“快，准，狠“的集思人作风，在创业教育方面顽强拼搏，坚持不懈。集中人才之思，点燃创业激情。集中个人的一切注意力去办好一件事。集中很多人的思想提议去做好一件事。集中有理想有思想深度的年轻人成就一番事业。', '/images/commLogo/none.png', 18, 0, '创新创业', 0, '未设置', '化学化工学院', 'NULL', '河南大学首届茶文化节，模拟招聘，新生励志教学，集思年终交流会', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000030', '创客联盟协会', '主要为大学生提供一个自主创业的平台，我们致力于为有想法、有智慧、有行动的创客们提供技术、资金、管理方法等资源。平时也会对大学生参加挑战杯、互联网+等大赛进行培训。 ', '/images/commLogo/none.png', 18, 0, '创新创业', 0, '未设置', '经济学院', 'NULL', '', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000031', '实习联盟', '实习联盟成立于2009年，隶属于河南大学历史文化学院团委，现任指导老师谢羽飞，现有会员人数140人。该社团是一个旨在提高大学生实践能力和集志同道合中人，共同谋发展的学生社团，协会现拥有会员四百多人，涵盖河南大学16个特色专业，协会会员还包括开封大学在内的特色专业，是我市会员来自不同学校的学生社团之一。其品牌活动有模拟招聘大赛。', '/images/commLogo/none.png', 140, 0, '创新创业', 0, '未设置', '河南大学历史文化学院团委', 'NULL', '模拟招聘大赛', 'NULL', '明伦');
INSERT INTO `shetuan` VALUES ('00000032', '模拟联合国协会', '河南大学模拟联合国协会，简称河大模联（HENUMUN），2007年由外语学院付江涛老师创立，是河南大学外语学院下属的学生社团，针对全校各个院系学生开放。河南大学模拟联合国协会主要以自身学术培训和各层次模拟联合国会议和涉外性质的活动给予成员最真实的外交官体验。学生们通过亲身经历联合国会议的流程，熟悉联合国的运作方式，了解世界上的国际大事。模拟联合国的宗旨是让学生了解联合国和国际形势，展现个人能力，培养学生的团队精神，提高其综合能力。通过模拟联合国活动，学生们学习了国际政治知识，熟悉了联合国有关机构的议事规则和运作方式，提高了谈判技巧和外语表达能力，为今后走向社会、走向世界打下基础。从2010年至今，河南大学模拟联合国协会每年都积极选派队伍代表参加全国各高校的模拟联合国大会。在积极外出参加模拟联合国大会的同时，河南大学也积极筹备自己的会议，河南大学模拟联合国大会于每年四月举行。', '/images/commLogo/none.png', 275, 0, '创新创业', 0, '未设置', '河南大学外语学院', 'NULL', '模拟联合国大会', 'NULL', '明伦');
INSERT INTO `shetuan` VALUES ('00000033', '摄影协会', '社团概述：河南大学摄影协会励志为河南大学的摄影爱好者提供一个培养自己兴趣爱好的“理想国”。社团欢迎对摄影有兴趣爱好的同学加入，并会定期邀请国内一线摄影师线上或线下与同学们讨论交流，可以为各位热爱摄影的同学们提供最专业和全面的摄影指导与图片后期指导。社团还办摄影师作品征集比赛，并以影展或线上推送等方式，提高优秀作品的曝光量，鼓励热爱摄影的同学们将自己的摄影作品向我们投稿。河南大学摄影协会为所有热爱摄影的同学们提供优秀专业的建议与优质良好的沟通平台。', '/images/commLogo/none.png', 40, 0, '文化体育', 0, '未设置', '国际教育学院', 'NULL', '“ISO杯”摄影比赛', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000034', '触角动漫社', '我社是我省起步最早，规模最大，发展最全面的动漫社之一，旨在为河南大学及开封的ACG爱好者创造一个交流互动的平台。之所以名曰为触角（feeler），是希望大家能够以谦虚的态度，探索的精神去面对这片永远充满未知的广阔世界。精品活动： Cosplay演出及舞台剧参赛、触角动漫DANCE大会(周年祭)、漫画教学讲座、化妆后期讲座、动漫赏析展览（为大家提供机会一同观赏最新动画）、手办模型摄影', '/images/commLogo/none.png', 200, 0, '文化体育', 1, '未设置', '河南大学经济学院、河南大学艺术学院', 'NULL', '', 'NULL', '明伦');
INSERT INTO `shetuan` VALUES ('00000035', '创意手工发展协会', '我社团成立于2014年9月，旨在将我们手中平淡无奇的东西变成一件件精巧细致的手工艺术品。成立目的在于为大学生手工爱好者提供一个聚集，交流，学习的平台，同时继承并发扬手工艺术，传播中国传统文化。我社团第一要义是发展，努力创新，锻炼大学生的动手能力以及细心认真态度，同时这样可以开阔思路，加强实践练习，手脑并用。既锻炼了学生的动手能力，同时又提高了学生的审美意识。我社团的宗旨是‘我动手，我用脑，我创造，我快乐’，我们社员在此可以学到以后对生活有用得手工技能，也可以尽情的展示自己的才华和创意，把自己的创造才能发挥到最高，让大家充分体验到创造的快乐。 ', '/images/commLogo/none.png', 80, 0, '文化体育', 0, '未设置', '计算机与信息工程学院、河南大学国际教育学院', 'NULL', '创意手工大赛', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000036', ' 营养与健康管理协会', '营养与健康管理协会旨在给学生们传授养生保健知识，及时发现学生的健康问题，并及时改正。本协会还给学生传授一些常见的传染病预防知识，协助学校开展疾病预防工作，在传染病高发期降低对学生的影响。本协会请心理老师给同学做心灵上的洗涤，解除心中的疑惑，使同学们健康快乐成长。本协会还将带领同学们去医药企业参观，与医药行业人员零距离接触，让他们了解医药行业在未来的发展方向。', '/images/commLogo/none.png', 70, 0, '文化体育', 0, '未设置', ' 河南大学药学院B', 'NULL', '  迎新晚会、艾滋病宣传日、参观药企', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000037', '书法协会', '书法协会成立目的是为了弘扬民族文化，为热爱书法的同学提供交流的机会和展示个人的平台。社团内部管理划分为书法部、办公室、宣传部、外联部、组织部、新网部和实践部七个部门，每个部门职能不同，各司其职。书法协会从成立至今，已成功举办各种类型活动30余种，受到了广大在校师生的一致好评。书法协会的精品活动包括一元义卖春联，书法交流课，”河大杯”书法比赛和书画展等，充分结合校园文化，积极展现当代大学生的个人文化风采。多次与开封当地高校、郑州大学、信阳师范学院等书法社团合作，各高校协会共同举办活动，活动影响更为深远。', '/images/commLogo/none.png', 200, 0, '文化体育', 1, '未设置', '河南大学环境与规划学院、河南大学历史文化学院团委', 'NULL', '一元义卖春联，书法交流课，”河大杯”书法比赛，书画展', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000038', '阳光长跑协会', '把运动养成习惯，让生命更加精彩！跑步无疑是最简单的锻炼身体的方法，持之以恒，可以达到增强体质的效果，使我们摆脱亚健康状态！为认真贯彻落实全国亿万学生阳光体育运动的实施，河南大学阳光长跑协会在学校校体委和校团委的指导与支持下，于2012年12月19日在河南大学老校区成立，2014年11月10日在新校区成立分会。均挂靠于河南大学公共体育教研部，由河南大学体育运动委员会办公室主任、河南大学公共体育教研部副主任赵克强为指导老师。是一个以长跑训练，运动健身为目的运动类协会！协会提倡创新、坚持、包容、奉献的精神。创新是生存和发展的前提；坚持是长盛不衰的根本；包容是增强团结、凝心力的保证；奉献是服务同学、服务社会的动力。协会现有会员120余人，包括明伦校区70人，金明校区50余人。协会的精品活动包括：“新生杯”环校跑挑战赛、蜗牛户外徒步节、阳光长跑公开赛、组织郑开马拉松河南大学代表团、组织参加开封市元旦越野赛、校园定向越野赛。所办的比赛和活动均得到校领导和全校师生的一致好评，各大媒体纷纷报道比赛和活动讯息。精品活动：“新生杯”环校跑挑战赛、蜗牛户外徒步节、阳光长跑公开赛、组织郑开马拉松河南大学代表团、组织参加开封市元旦越野赛、校园定向越野赛。 ', '/images/commLogo/none.png', 120, 0, '文化体育', 1, '未设置', '河南大学公共体育教研部', 'NULL', '', 'NULL', '明伦');
INSERT INTO `shetuan` VALUES ('00000039', '自行车协会', '协会是一个以自行车为载体，举办以自行车比赛、骑车旅行、极限运动和社会服务等为主要内容的学生社团，本着“ 健身、参与、进步、协作”的宗旨，通过各类社会实践活动，使会员达到“锻炼、学习、服务”的目的，培养和增强大学生“坚持、创造、奋进、挑战、超越”的品质。协会下设会长副会长以及办公室，骑行团，新网部，文宣部，策划部，外联部六个部门，自2003年协会成立至今，协会总出行旅程近两万余公里，平均每星期活动高达3次之多。我们用车轮去丈量祖国的土地，北至漠河，西到拉萨，南行海南，东出胶东。河大车协历次活动均有良好的公众反映和社会影响，是河南大学最具影响力学生社团之一，同时也是省内高校学生社团中的佼佼者。', '/images/commLogo/none.png', 200, 0, '文化体育', 0, '未设置', '公共体育教研部', 'NULL', '激情南太行之旅，中原高校单车驿站年会', 'NULL', '明伦');
INSERT INTO `shetuan` VALUES ('00000040', '台球协会', '河南大学台球协会成立于2007年，曾连续5年被评为河南大学十佳优秀社团，设有办公室、技术部、女子部等9个部门，定期进行教学活动及各种比赛。随着台球运动在河大校园内的发展壮大，台球协会也渐渐成为了一个大家庭，与数家球房倾力合作，权威的教练指导，共同打造了河南大学人气社团。', '/images/commLogo/none.png', 300, 0, '文化体育', 0, '未设置', '数学与统计学院、河南大学体育学院', 'NULL', '河南省大学生台球联赛', 'NULL', '明伦');
INSERT INTO `shetuan` VALUES ('00000041', '汉服社', '《左传》有云：“中国有礼仪之大，故称夏；有章服之美，谓之华。” 对于华夏民族而言，我们的民族服饰——汉服，不只是一件衣裳，更多的是华夏文明的一个载体，是传统文化的一个重要方面。我们河南大学汉服社作为汉服复兴者的一员愿用一腔热血，社团宗旨是以汉服为载体，复兴传统文化，唤醒民族意识，使我泱泱华夏不再“赤裸”立于世界民族之林。我们始终相信，汉服——终将复兴，而我们只是在汉服复兴路上先行了一步。在此，我们必将尽我们之所能，为汉服之复兴，文化之传承铺路搭桥。华夏复兴，衣冠先行，始于衣冠，达于博远。', '/images/commLogo/none.png', 60, 0, '文化体育', 0, '未设置', '经济学院团委、河南大学历史与文化学院', 'NULL', '“乡射礼”、“宋制笄礼”', 'NULL', '明伦');
INSERT INTO `shetuan` VALUES ('00000042', '轮滑协会', '河大轮协是由课余爱好轮滑的在校大学生自发组织起来的全校性学生社团。协会以张扬个性，展现青春，挑战自我，为宗旨。采取自愿参加的原则，我们的社员充满激情，是青春的象征，喜欢挑战，热爱运动。协会以提高大学生身体素质，丰富大学生课余生活为目标，为轮滑爱好者提供交流平台，推广轮滑运动。同时促进我校社团文化的发展，提高河南大学知名度。', '/images/commLogo/none.png', 60, 0, '文化体育', 0, '未设置', '河南大学公共体育部', 'NULL', '', 'NULL', '明伦');
INSERT INTO `shetuan` VALUES ('00000043', '棋类协会', '河南大学棋类协会是1997年10月经校团委批准成立的全校范围内的学生社团组织，原名为河南大学红太阳围棋社，2001年改名为河南大学棋类协会，2003年成立新区分会，现新区分会挂号于物理与电子学院。河南大学棋类协会的宗旨是：以棋会友，丰富生活，共同提高，完善自我。协会创会的目的是丰富广大同学的课余文化生活，提高同学们的棋艺水平，增进同学们的友谊。协会现设有围棋，中国象棋，五子棋等棋类的活动和安排。', '/images/commLogo/none.png', 60, 0, '文化体育', 0, '未设置', '物理与电子学院', 'NULL', '“第七届河南省高校象棋联谊赛”、“第四届棋王争霸赛”、“象棋、围棋、五子棋友谊赛”', 'NULL', '明伦');
INSERT INTO `shetuan` VALUES ('00000044', '网球协会', '网球协会是一个旨在普及网球运动，提高大学生整体身心素质的大学生公益团体。同时，河大网协也是一个每年吸纳200余新生的超高人气大型社团。网球协会一直以来受到校团委和院领导的支持与帮助，在近几年得到了开始飞速发展并取得了可喜的成绩！协会以“我向网，我追球”为口号，致力于河南大学网球运动的推广与普及！ ', '/images/commLogo/none.png', 200, 0, '文化体育', 0, '未设置', '河南大学化学化工学院', 'NULL', ' 河南大学网球锦标赛、网球墙反手培训、网球知识讲座等', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000045', '足球协会', '河南大学足球协会成立于1995年，挂靠单位为医学院，是河南大学最早成立的协会之一。协会已经连续几年成功举办了“迎新杯”等大型足球赛事，收到了学校和同学们的一致好评。协会以“丰富课余生活，培养团队意识，增强身体素质”为宗旨，现有会员50余人，会员遍及河南大学各个院系。足球协会下设五个部门分别为办公室，宣传部，外联部，组织部，策划部。我们的口号是“以球会友，技谊共进”。我们协会主要会为会员提供踢足球的场地，器材等等，使会员们玩得更加开心，更加舒心。', '/images/commLogo/none.png', 50, 0, '文化体育', 0, '未设置', '医学院', 'NULL', '河大“迎新杯”', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000046', '乒乓球协会', '河南大学乒乓球协会创办于2001年，挂靠于数学与统计学院，十多年的风雨造就了它独具的魅力。协会自创办以来，不断发展壮大，协会拥有涉及各院系的“河大杯”乒乓球团体赛，“飞扬杯”乒乓球单打比赛，开封市三校联赛等重要赛事，并多次参加过郑州高校联赛、“华光杯”和大运会等重要活动。其中“河大杯”乒乓球团体赛于2011年成为校级活动。河南大学乒乓球协会正在向着更高的方向努力。在校团委、数学与统计学院和社联的指导与帮助之下，河南大学乒乓球协会将继续秉承“以球会友，以技交流”的理念来服务广大会员，正所谓有朋自远方来，不亦乐乎！我们相信在乒协这个广阔的舞台上，你们能够展翅翱翔，从这里创造一个不一样的大学生活。', '/images/commLogo/none.png', 169, 0, '文化体育', 0, '未设置', '医学院', 'NULL', '新生杯、河大杯团体赛、飞扬杯个人赛、高校联赛', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000047', '因素吉他协会', '河南大学因素吉他协会(英文名：Yinsu Guitar Association of Henan University),简称因素吉他协会，是一个十五年的河南大学老牌音乐协会。经校团委、社团联合协会审批的已注册的并在党委宣传部备案的合法的社团组织。创会以来，我们始终如一地坚持我们的宗旨：“丰富课余生活陶冶学生情操，加强同学交流，提高演奏水平”。她聚集了一批又一批的爱吉他，爱音乐，热血，叛逆，甚至疯狂的热血少年，这里是青春的怒放,也以此带动全校学生，奉献了多场视听盛宴。我们的付出也一直受到学校、社联的支持与肯定，鼓舞着协会往更好的方向发展，争取做更多活动，丰富同学们的大学生活。', '/images/commLogo/none.png', 441, 0, '文化体育', 0, '未设置', '河南大学医学院', 'NULL', '教学活动、大型晚会', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000048', '羽毛球协会', '今年已成功举办第二届河南大学新羽杯羽毛球三区联赛、河南大学羽毛球双打比赛等大型比赛。为河南大学广大羽毛球爱好者提供了一个展示羽毛球球技的平台。本学期招新中，羽协共招收205名会员。我们热爱羽毛球，所以我们今后努力让羽协发展得更好、更全面。在上半学期羽协成功举办了“第二届河南大学新羽杯羽毛球三区联赛”。在下学期，我们与郑州轻工业大学羽协进行交流学习。', '/images/commLogo/none.png', 205, 0, '文化体育', 0, '未设置', '河南大学公共体育教研部', 'NULL', '新羽杯羽毛球三区联赛', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000049', '鹏图篮球协会', '河南大学鹏图篮球协会是在院领导和老师的大力支持下，应我校广大篮球爱好者的要求，经由河南大学院团委批准成立的社团。本协会的会员主要是河南大学的在校大学生。协会中的所有工作人员均由各院的篮球爱好者担任。本协会是在校团委和学生会的领导和管理下，联合篮球爱好者共同参与管理的，并通过组织各项活动来增进友谊，提高竞技水平让大家共同努力共同促进篮球运动在我校更广泛普及和更健康的发展的群众性社团。本协会本着热爱篮球，推广篮球运动的宗旨，让更多的人认识篮球，了解篮球，热爱篮球，投身篮球，发展篮球，普及篮球。以“丰富同学们的课余生活,培养同学们的团队意识,增强同学身体素质”为宗旨,以“和谐,团结,拼搏,热情”为口号为大家服务。', '/images/commLogo/none.png', 182, 0, '文化体育', 0, '未设置', '河南大学医学院', 'NULL', '河南大学第一届新鸿翔杯三分球大赛 菊城杯等', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000050', '双截棍协会', '河南大学双截棍队自2006年开始发展，到如今已经成为演出场次达到百余场的学生组织，协会于2010年由热爱祖国，发扬李小龙精神的热血青年正式确立。 以“弘扬中国文化，传承中国武术”为目的，本着以服务学生的态度在学校开展各项训练和丰富精彩的活动，并被评为为数不多的四星级协会。河南大学双截棍协会融合了空翻特技、飞牌绝技，现代街舞、和传统武术以及截拳道的双节棍技法。中原武术交流会、新生考核大赛、黄河滩放生活动、河南大学春季运动会开幕式等各种表演、组织参与河南大学武术锦标赛、参与周边学校的武术交流会、大四学长学姐欢送会等。', '/images/commLogo/none.png', 86, 0, '文化体育', 0, '未设置', '河南大学数学与统计学院、河南大学校团委社团部', 'NULL', '', 'NULL', '明伦');
INSERT INTO `shetuan` VALUES ('00000051', '孙氏太极拳研究会', '河南大学孙氏太极拳研究会成立于2013年4月15日，挂靠在河南大学生命科学学院。河南大学孙氏太极拳研究会聘请开封市孙氏拳研究会秘书长兼总教练，孙氏拳第四代传人郭国成先生为名誉会长兼指导老师。协会每年会员会稳定保持在50人左右。协会本着丰富学生大学生活，宣传普及孙氏拳的宗旨。在学校内开展各项活动，每天早上在志义体育场教授孙氏太极拳和孙氏形意拳，既能促进太极拳爱好者的交流与学习，也发展和繁荣了我校太极拳文化。并且会在每年十一月份进行每年一度的孙氏太极拳比赛，对会员们的学习做出一个评估。还会定期组织社团人员赴陈家沟等地了解太极文化，学习太极知识。并且积极参加配合学校参加各项武术比赛，取得优异的成绩。', '/images/commLogo/none.png', 50, 0, '文化体育', 0, '未设置', '河南大学生命科学学院', 'NULL', '', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000052', '瑜伽研习协会	', '河南大学瑜伽研习协会，以河南大学深厚的历史文化底蕴为依托，传承古老文明、传播优良文化、丰富校园生活的研习型社团。河南大学瑜伽研习协会秉承瑜伽的传统，学习传播瑜伽文化，使更多大学生、甚至社会人士了解瑜伽，从瑜伽中受益。建立社团两年的时间吸引一大批喜欢瑜伽的同学以及老师，参与到瑜伽当中，从瑜伽中收获颇多，不仅是身体上的，更多是心灵生活中的变化。我们希望继续坚持瑜伽，学习、传播真正的瑜伽，使更多的人接触了解并从中受益。我们的宗旨就是把爱传递下去。', '/images/commLogo/none.png', 30, 0, '文化体育', 0, '未设置', '河南大学校教育科学学院', 'NULL', '', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000053', '开欣排球俱乐部', '河南大学“开欣”排球俱乐部是在校团委指导下，挂靠在河南大学公共体育教研部的一个面向全校师生的排球兴趣爱好者之类的社团，主要活动是组织校内、校外学生训练、比赛等与排球相关的体育活动。', '/images/commLogo/none.png', 3, 0, '文化体育', 0, '未设置', '河南大学公共体育教研部', 'NULL', '2016年4月6日第一届“开欣排球俱乐部杯”排球邀请赛', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000054', '四色鸽舞蹈协会', '河南大学四色鸽舞蹈协会是以舞蹈为主，歌唱、曲艺、乐演等各种文艺形式并存的学生文艺社团。协会挂靠于河南大学医学院，本着“相互交流，相互学习，丰富业余生活，提高文艺素质”的宗旨，多次举办和参加舞会，其中的舞蹈大赛为精品活动，现在的社团已经今非昔比，已经是一个具有150余人的社团，这为我们社团在以后的日子里，为社团的工作和活动打下了坚实的基础。', '/images/commLogo/none.png', 150, 0, '文化体育', 0, '未设置', '河南大学医学院', 'NULL', '舞蹈大赛', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000055', '青春摇滚社团', '河南大学青春摇滚社团是成立于2013年河南大学软件学院，隶属于河南大学的一个摇滚音乐社团。社团里有着几只致力于青春摇滚音乐的乐队比如不逃课乐队，白日梦乐队，wave乐队以及现在的Smash乐队。社团本着丰富大学生课余文化生活得思想由着每一届的会长带领着会员们展开各种丰富的课余活动，比如每一年的河南大学青春摇滚社团迎新演唱会已经连续办了三年了。在每一年的招新活动中都能拿出来像模像样的活动还有各种乐队表演以及民谣歌手的捧场。社团形成里的几年中会员们在社团中一步一步成长，社团也在不断进步，得到了老师和学校领导的赞赏。', '/images/commLogo/none.png', 100, 0, '文化体育', 0, '未设置', ' 河南大学软件学院', 'NULL', '', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000056', '漫延动漫社', '漫延动漫社，作为一个艺术娱乐性社团，挂靠于河南大学药学院，现有7年历史，社员170余人，设有办公室与cos部两大部，办公室设有网宣组，组织组，策划组，COS部90余人，同时又设有独立于社团运作体系外的兴趣小组，绘画组，摄影组，毁歌组等，兴趣小组定期组织教学与实践，课下作业也丰富了社员的校园生活。社团的特色是cosplay表演，这是一种集摄影、舞台剧、音乐等为一身的角色扮演的艺术形式。社团的宗旨是推广动漫文化，让更多的人了解、喜爱动漫。同时培养能将动漫元素、动漫文化、动漫精神与现实良好结合的能力。如今动漫文化风已经席卷全世界，社团拥有一群热爱二次元的心，我们会与时俱进，为动漫发展献上自己的一份力，提高年轻人的动漫知识。', '/images/commLogo/none.png', 170, 0, '文化体育', 0, '未设置', '河南大学药学院', 'NULL', ' 组织漫展比赛   动画电影观摩    赏花大会   万圣节cosplay游街表演   ', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000057', '微电影联盟', '    河南大学微电影联盟成立于2013年，是集拍摄摄制和后期制作于一体的专业化社团。自成立之日起，众多热爱电影朋友们都积极参与到了微电影联盟的事务中。电影吸引了越来越多的实践者，使得过去单项度的艺术殿堂回归到了真正具有互动和体验特点的、人人皆可参与的“草根秀”时代。', '/images/commLogo/none.png', 80, 0, '文化体育', 0, '未设置', '经济学院团委', 'NULL', '微电影节', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000058', '大学生盘鼓协会', '河南大学大学生盘鼓协会成立于2001年4月，它采撷了中原大地上的一支独有的奇葩－－开封盘鼓，毅然担负起\"传承祖国悠久文化\"的重任。作为全国高校界唯一一支学生盘鼓协会，成立伊始，协会就以“弘扬民族优秀文化，展现青春活力自我”为宗旨，先后组织和参加了多次校级重大活动，受到了广泛的好评，为盘鼓队伍的不断前进提供了不竭的动力。在这几年间，通过一系列与社会接轨的活动，协会初步实现了“走出去、引进来”的发展战略，成功实现了“发工资”的预期承诺，成为第一个能给会员带来实际收入的学生社团。开封市南郊汪屯乡大李庄“信合杯”民间盘鼓艺术大赛协会也荣获银奖，以及各方媒体的关注极大地鼓励了全体会员奋发图强的斗志。', '/images/commLogo/none.png', 11, 0, '文化体育', 0, '未设置', '经济学院', 'NULL', '民族文化节', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000059', '宋韵诗文学社', '河南大学宋韵诗文学社以\"以爱心熏陶文学，以文学助力爱心公益\"为办社宗旨，以“自信而始，谦卑而行，永远做最努力的宋韵人“为社训。社团坚持人性化管理和制度化管理相结合，坚持打造以宋韵杯全国高校征文系列活动、河南大学宋韵诗歌节系列活动和河南大学河你读书系列活动为核心的系列活动。社团先后被评为河南大学“十佳社团”、“河南省百佳社团”，并被中国校园作家协会授予“优秀组织奖”获得者。《宋韵》报刊被评为河南高校优秀文学期刊。', '/images/commLogo/none.png', 150, 0, '文化体育', 1, '未设置', '河南大学图书馆', 'NULL', '宋韵杯全国高校征文、重阳诗会、书香校园行、青年诗会、青年游学、读书交流会', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000060', '风象文学社（原星星草文学社）', '河南大学风象文学社前身为建于1995年的星星草文学社，建社20年来经过无数风象人的努力风象也从一颗嫩芽在河大的土壤中逐渐成长成一颗参天大树。二十年说短不短说也长不长，二十年来有心酸也有成就，一代代风象人也用自己的努力让风象的火种传递到今时今日传递到了我们的手中，特色活动如读书会，真人图书馆，诗话开封游等活动，我们将继续继承发展，对于2015级风象文学社组织结构15年将对社团进行分组，如小说组，写作组等等，充分尊重同学们的兴趣使社团更有针对性。在总体上继续保持各部尽量减少行政工作的影响。', '/images/commLogo/none.png', 8, 0, '文化体育', 0, '未设置', '药学院团委', 'NULL', '人文行走 读书会 文学之星征文', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000061', '御风配音社', '我们成立以配音（包括影视配音、网络配音、动漫配音、广播剧）为主的社团。丰富学生课余生活，活跃学校办学气氛，让更多的人了解并参与进来。展现学生社团风采，活跃氛围，增进情感，增进不同院系学生友谊。为大学生提供一个展现自我的舞台，凸显个性，张扬青春。我时也更好的为学校和同学们服务。同时会通过提供丰富的交流和实践机会，给每一位成员提供一个良好的展示自我、相互学习与交流的平台，全面促进成员的交流能力、合作能力、创造力与配音能力，培养会员们对配音艺术的热爱，并使之在社团交流中找到志同道合的朋友', '/images/commLogo/none.png', 54, 0, '文化体育', 0, '未设置', '护理学院', 'NULL', '配音课程培训、后期课程培训、YY线上欢脱会、朗诵比赛（与广播站合办）、出广播剧', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000062', '射艺协会', '社团理念为“修身 修心”。社团的精神为“崇德 尚武 重礼 弘文”', '/images/commLogo/none.png', 54, 0, '文化体育', 0, '未设置', '公共体育教研部', 'NULL', '', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000063', '两岸青年交流协会', '本会以关注两岸情势，促进青年交流为宗旨，在校国际交流处暨港澳台事务办公室的指导下开展各项工作，以期能使大家对两岸关系以及相关事项都能有一个更深的了解，以及促进两岸文化之间的传播与交流。本社团致力于关注两岸关系发展，台湾各地的各种美景、美食、风土人情，以及各种有趣的民间小故事。希望能用这些来让大家领略到一个与我们有着共通之处，但也有自己独特之美的台湾。而各位如果也与我们一样对此感兴趣的话，就快来加入我们吧！与我们一起让这个风景秀丽的地方为我们大学四年的回忆添一份别样的风采！', '/images/commLogo/none.png', 54, 0, '文化体育', 0, '未设置', '国际交流处港澳台办公室', 'NULL', '', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000064', 'TMS电竞社', '以聚集有电子竞技爱好和电子竞技特长的同学交流学习的兴趣型社团。本协会将团结我校爱好电子竞技以及有电子竞技特长的同学，给爱好者们提供一个交流切磋的平台和一个有趣活动丰富的组织。TMS是Teamwork makes splendor（团队合作创造辉煌）的简写，而团队合作也正是电子竞技的核心精神电竞社正是为了推进电子竞技文化在校园内的发扬而设立，营造良好校园氛围，引导大家端正电子竞技态度，防止单纯性的网络成瘾，倡导健康的电脑使用理念，并在电竞社这个大家庭里找到共同交流的好队友，愉快参与到电子竞技这项事业中来。', '/images/commLogo/none.png', 54, 0, '文化体育', 0, '未设置', '软件学院', 'NULL', '', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000065', '武术协会', '河南大学武术协会是河南大学社团中的后起之秀，自成立以来，以发扬中华武术精神，展现当代大学生精神面貌为己任，追求“强身健体，防身自卫”的目标。协会分为传统武术和现代搏击两部，两部各有侧重，传统武术追寻武术的艺术之美，形体之美。刀枪剑棍，舒展大方。现代搏击追求武术的勇猛刚毅，讲究实战。拳腿凶狠，膝肘无情。协会上下，均为兄弟姐妹，团结互助，互尊互爱。在强健体魄的目标中坚韧不拔，在追求武术的道路上永不停息，在为校争光，壮大协会的道路中乘风破浪。', '/images/commLogo/none.png', 54, 0, '文化体育', 0, '未设置', '计算机与信息工程学院', 'NULL', '', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000066', 'Oldschool滑板社', '宗旨在于带领河大的滑板氛围，增加滑板的人数和提高滑板的质量！随着滑板进入奥运会，了解滑板的人越来越多，所以短短的一年，本社团已经有差不多100名社员！社团共有3个部门，分别是滑手部，财务部和宣传部门。每周都会有滑手部的滑手带领新人来进行一系列的练习！滑板社，就是为了把河大一群志同道合的大学生聚集在一起玩滑板而成立的，最大的快乐可能就是一起玩滑板的时候获得的愉快与对自己能坚持下来培养的自信吧！', '/images/commLogo/none.png', 54, 0, '文化体育', 0, '未设置', '迈阿密学院', 'NULL', '', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000067', '粤语爱好者协会', '河南大学明伦校区粤语爱好者协会创建于2011年，挂靠于历史文化学院，金明校区分会创建于2017年，挂靠于环境与规划学院，由部分在校粤籍学生和广大粤语爱好者组成。本着“展示南粤文化，弘扬中华魅力”的信念，让有着共同爱好的同学聚到一起，以社团为平台，为大家打开一扇了解南粤文化的窗户，增进不同地域之间的文化交流，相互理解，相互学习。以粤语为桥梁，让大家认识彼此，粤协也还十分的年轻，在未来的发展中会也会有诸多困难，但是，粤协会在社联这个平台，及学校、学院的关怀下努力成长起来，发挥出大学社团服务同学、荣我母校的职责。', '/images/commLogo/none.png', 54, 0, '文化体育', 0, '未设置', '环境与规划学院	', 'NULL', '', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000068', '女子足球队', '女子足球队是一支刚成立的社团，目的是让热爱足球，热爱运动的人聚在一起，学踢足球，分享对足球的热爱和与足球有关的点滴。在不断的学习中一起成长，共同进步。', '/images/commLogo/none.png', 54, 0, '文化体育', 0, '未设置', '经济学院团委	', 'NULL', '', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000069', '喜剧协会', '相声 小品  脱口秀  ，没错，我们统统都有。还有个默默不说话的默剧，通过各种表演形式给您带来欢乐。打造我们自己的校园喜剧，河大喜剧，我们的宗旨就是：热爱生活，传递欢乐', '/images/commLogo/none.png', 54, 0, '文化体育', 0, '未设置', '计算机与信息工程学院	', 'NULL', '', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000070', '辩论协会', '协会通过举办辩论赛、模拟面试大赛以及辩论与口才培训等为主的丰富多彩的活动，旨在为在校大学生搭建一个锻炼口才、提高思辩能力、培养辩论人才、提高河大整体辩论水平的平台，成立至今已组织并参加了多场省级及全国性赛事。其品牌活动有新生杯辩论赛，辩题征集大赛，主题演讲比赛，辩论能力培训会，世界华语辩论锦标赛。目前，辩论协会已经成功开展了郑汴八校联赛、“励峰杯”新生辩论赛，辩论与口才培训等一系列活动，赢得了校内师生的一致好评，并得到了河南农业大学、中原工学院、河南工业大学等兄弟院校的高度评价，多次荣获河大优秀社团，星级社团称号。辩论协会秉承着“我的大学，思辨天下”的口号，传播校园辩论文化，为百年河大作出自己的一份贡献。', '/images/commLogo/none.png', 300, 0, '文化体育', 1, '未设置', '河南大学法学院', 'NULL', '辩论赛、模拟面试大赛以及辩论与口才培训', 'NULL', '明伦');
INSERT INTO `shetuan` VALUES ('00000071', '和式太极拳协会', '和式太极拳学会成立于2010年，挂靠在河南大学体育学院，现任指导老师，现有会员人数50人。该社团以“加强自身锻炼，提高身体素质”为核心，以“弘扬中华武术，陶冶大学生情操，丰富大学生生活”为宗旨，倡导“健康身体，将抗生活，健康心灵”。和式太极拳习练时以自然为准则，以圆，弧为运动形式，以太极阴阳变化之法，使身体处处分出虚实内外。视练者体质阶段不同，速度可快可慢，但均匀适宜。架势可大可小，以自然舒展为度。整个拳架朴实无华，简洁流畅。河南大学和式太极拳学会是一个冉冉升起的社团新星，凭借其拥有技术及理论优势，借其太极拳这一展现方式，参加了各类活动。', '/images/commLogo/none.png', 5, 0, '文化体育', 0, '未设置', '河南大学体育学院', 'NULL', '', 'NULL', '明伦');
INSERT INTO `shetuan` VALUES ('00000072', '体育新闻社', '体育新闻社主要负责体育新闻稿的编写与微信公众号的运营，包括河南大学所有体育赛事及各种大型体育活动。充分利用报刊、网络等手段，加强学校体育工作新闻宣传力度。将积极传播学校体育资讯，为师生提供良好的体育信息服务。招收大一、大二学生。', '/images/commLogo/none.png', 26, 0, '文化体育', 0, '未设置', '公共体育教研部', 'NULL', '春季校运会报道', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000073', '士兵协会', '社团成立于2016年4月，现有会员人数44人，挂靠于河南大学保卫处。为进一步响应习主席所提出的“军民融合式发展”的国家战略，更好的完成伟大的“中国梦、强军梦”目标，在校园文化繁荣之际，由我校退伍复学老兵、热爱军事、志愿参军报国的学生组成的河南大学大学生士兵协会以符合校规校纪，遵守校团委和校社团联合会的各项章程为原则，以宣传国防知识，搞好学校与驻地部队的友好情谊，提高大学生身体素质和国防意识为目的，同时为丰富同学们课余文化生活，活跃校园文化氛围。以各类与军事有关的活动为载体成立该社团。品牌活动有徒步拉练、进军营、大学入伍政策咨询等。', '/images/commLogo/none.png', 44, 0, '文化体育', 0, '社长QQ：234234234324\n社长电话：13148090900', '河南大学保卫处', 'NULL', '真人CS ', 'NULL', '明伦');
INSERT INTO `shetuan` VALUES ('00000074', '民俗学社', '河南大学民俗学社是由一群热爱探究中国古典文化的爱好者创建的社团，社团现有成员90人，挂靠于河南大学黄河文明与可持续发展研究中心。协会宗旨是“提高当代大学生的民俗文化知识，丰富校园文化建设，激发当代大学生深入民间、融入民间，传承民俗文化的兴趣，填补河南大学民俗类社团的空白，为建设和谐校园贡献我们的微博之力。协会重在培养学生的文化素养，综合知识，为广大民俗文化爱好者提供一个可以参与社会实践，体验民间生活，发现自己才华的舞台。', '/images/commLogo/none.png', 90, 0, '文化体育', 0, '未设置', '河南大学黄河文明与可持续发展研究中心', 'NULL', '民俗纪实作品征集大赛，中原民俗文化考察活动 ', 'NULL', '明伦');
INSERT INTO `shetuan` VALUES ('00000075', '旅游协会', '河南大学旅游协会成立于2002年，挂靠于河南大学历史文化学院，曾获得“优秀社团”称号。旅游协会是河南大学旅游爱好者组织的全校性非营利性学生社团，是依照规定在河南大学学生社团联合会注册、经校团委审批，并在党委宣传部备案的河南大学学生社团。河南大学旅游协会以“务实、创新、锻炼、发展”为指导思想，以“服务广大会员，普及旅游知识，丰富课余文化生活”为宗旨，争创高起点，高品质，高知名度，高名誉度的一流社团，以其特有的蓬勃朝气和积极向上的气质吸引着一批又一批的旅游爱好者，深受广大师生的好评。', '/images/commLogo/none.png', 115, 0, '文化体育', 0, '未设置', '河南大学历史文化学院', 'NULL', '9.27世界旅游日主题活动', 'NULL', '明伦');
INSERT INTO `shetuan` VALUES ('00000076', '粤语爱好者协会', '河南大学粤语爱好者协会创建于2011年，挂靠于历史文化学院，是一个年轻的学生社团，由部分在校粤籍学生和广大粤语爱好者组成。本课程每周开课，利用课堂教学或网络平台进行粤语文化交流。本着“展示南粤文化，弘扬中华魅力”的信念，让有着共同爱好的同学聚到一起，以社团为平台，为大家打开一扇了解南粤文化的窗户，增进不同地域之间的文化交流，相互理解，相互学习。以粤语为桥梁，让大家认识彼此，在这美丽的河大校园内收获美好的人生经历。协会采用正规的粤语教学，定期学习经典的粤语歌曲，组织原声粤语电影交流活动，举办各类趣味活动，致力于让粤语爱好者都能说流利的粤语，唱喜欢的粤语歌，了解粤语地区文化。当然，粤协也还十分的年轻，在未来的发展中会也会有诸多困难，但是，粤协一定会在学校、学院的关怀下努力成长起来，发挥出大学社团服务同学，荣我母校的职责。', '/images/commLogo/none.png', 20, 0, '文化体育', 0, '未设置', '河南大学历史文化学院', 'NULL', '粤语交流课程', 'NULL', '明伦');
INSERT INTO `shetuan` VALUES ('00000077', '考古学社 ', '河南大学考古学社是一个致力于帮助非考古专业的学生了解考古的学术研究类社团，主要活动有国际考古日考察、考古讲堂、考古工作参观等，平均每月一次活动，面向全校新生，欢迎小石器们的咨询。', '/images/commLogo/none.png', 49, 0, '文化体育', 0, '未设置', '河南大学历史与文化学院', 'NULL', '新郑遗址考察', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000078', '天文社', '河南大学天文社成立于2015年，挂靠于欧亚国际学院，现有成员62人。品牌活动有重大天象观测，路边天文学，大型天文学讲座。日常活动主要以天文望远镜相关知识科普、讲解，帮助参与者及时补充天文知识的形式，通过小知识竞赛并附赠小奖励活动让同学直观地学习天文知识，丰富大家的课外知识，调动大众探索宇宙和自然的精神，以及激发大众对天文的积极性，同时，安排观测器材的组装，让天文观测与大众近距离接触。实现趣味、科普、学习、交流的“仰望星空，触碰宇宙”的宗旨。', '/images/commLogo/none.png', 62, 0, '文化体育', 0, '未设置', '河南大学欧亚国际学院', 'NULL', '天文知识竞赛', 'NULL', '明伦');
INSERT INTO `shetuan` VALUES ('00000079', '棋类协会', '河南大学棋类协会成立于1997年10 月，挂靠于体育学院。棋者，弈也。下棋者，艺也。博弈是东方文化的结晶，至今仍放射出灼灼奇光，影响和陶冶着人们的道德观念、行为准则、审美情趣和思维方式。棋类协会以“以棋会友，丰富生活，共同提高，完善自我“为宗旨，丰富广大同学的业余文化生活，提高同学们的棋艺水平，增进同学们的友谊。协会现设有围棋、中国象棋、五子棋等棋类的活动与安排。所获荣誉：成功举办了 “开封市首届‘移动杯’大中小学生围棋比赛”等多次大型比赛和多次棋类知识讲座。在2001年6月还特聘河南省围棋冠军刘中杰（五段）为协会顾问。2016年成功举办第七届河南省象棋联赛。', '/images/commLogo/none.png', 81, 0, '文化体育', 0, '未设置', '河南大学体育学院', 'NULL', '棋牌教学、河南省高校象棋联赛               ', 'NULL', '明伦');
INSERT INTO `shetuan` VALUES ('00000080', '健美操协会', '健美操协会创办于2001年09月，挂靠于体育学院团委，现发展会员人数311人，其品牌活动有：1.健美操交流会 2.健美操带操健美操是一项深受广大群众喜爱的，普及性极强，集体操，舞蹈，音乐，健身，娱乐于一体的体育项目。本协会主要以有氧健身健美操为主。健美操协会以是团结健美操爱好者为宗旨，调动一切积极因素，推动全校的健美操运动发展，提高我们学校的健美操水平，从而增强学校全民健身氛围。协会特邀河南大学体育学院副教授刘秋玲老师作为指导，通过开展各种健身操活动，不断挑战新的高度，用顽强、无畏、积极的态度去克服所有的困难，将运动最美好的精神在各个方面展现出来，将动感十足的演出与充满自信的微笑传遍整个河南大学。', '/images/commLogo/none.png', 311, 0, '文化体育', 0, '未设置', '河南大学体育学院团委', 'NULL', '健美操交流会、健美操带操', 'NULL', '明伦');
INSERT INTO `shetuan` VALUES ('00000081', '跆拳道协会', '跆拳道协会为广大爱好跆拳道运动的同学们提供一个交流学习的平台。其品牌活动是共同学习跆拳道礼仪知识和战术技术。协会宗旨是开发校园专业技术和场馆资源，推动学校经济发展和体育事业的发展；丰富学生校园文化生活，利用课余时间提高学生的实际工作能力；普及跆拳道，学习跆拳道精神，培养学生特长促进我校学生德智体美全面发展。以健康教育为目的在全校展开普及跆拳道运动，以自我发展为宗旨，为跆拳道项目成为体育学院的特色项目、优秀团体而努力。协会成员多为体育学院在校生，都曾荣获全市全省乃至全国大大小小奖项。', '/images/commLogo/none.png', 68, 0, '文化体育', 0, '未设置', '河南大学体育学院', 'NULL', '跆拳道礼仪知识和战术技术教学', 'NULL', '明伦');
INSERT INTO `shetuan` VALUES ('00000082', '太极拳协会', '河南大学太极拳协会成立才两年时间，是一个非常年轻的社团。社团自成立开始一直以传播中华优良传统文化，提高在校大学生身体健康素质和自身协调性为中心思想，致力于提高在校大学生对于中国传统文化既太极拳及器械的兴趣培养和高质量的传播，并以此为基础进行文化的推陈出新。该社团特色活动有每周六、日进行社团活动，传授各式太极拳及器械，参与每学年的新老校区太极拳教学及比赛，并与省内其他院校太极拳协会联谊，定期举办太极拳文化交流赛事，定期传授中华武术及太极拳的文化历史和由来等。本协会太极种类多样化，太极教学多元化，太极交流深层次化。', '/images/commLogo/none.png', 100, 0, '文化体育', 0, '未设置', '河南大学体育学院', 'NULL', '太极文化之旅', 'NULL', '明伦');
INSERT INTO `shetuan` VALUES ('00000083', '街舞协会', '河南大学街舞协会成立于2013年11月，挂靠在河南大学体育学院，现任指导老师岳山，现有会员人数205人，其社团寄语为：河南大学街协会，我们是一个大家庭，成员要互帮互助，共同努力掀起街舞潮！主要涉及的活动有：舞房训练、“以舞会友”、街舞助阵等。协会宗旨：加强成员们的舞技，“以舞会友”丰富同学们的大学生活，开阔眼界；看到自己与别人的差距，提高自己的街舞水平；为大家提供与人交流的平台，增加阅历，丰富经验 ；扩大同学们的关系网，让人生之路一帆风顺。街舞助阵以“情”牵线，为各社团为学院提供文艺活动，提升各协会之间的“零距离”。', '/images/commLogo/none.png', 205, 0, '文化体育', 0, '未设置', '河南大学体育学院', 'NULL', '舞种公开课', 'NULL', '明伦');
INSERT INTO `shetuan` VALUES ('00000084', '登山户外运动协会', '登山户外运动协会创立于2014年，挂靠在河南大学体育学院，现有会员人数156人。协会是以穿越、徒步、攀岩、定向越野、骑行等户外运动为主体活动的学生社团。主要开展户外运动的普及与推广，为师生户外活动的体验（徒步、溯溪、露营、攀岩、丛林穿越、山地自行车等），让大家与大自然亲密接触。其品牌活动有校园定向越野，徒步，露营等。', '/images/commLogo/none.png', 156, 0, '文化体育', 0, '未设置', '河南大学体育学院', 'NULL', '高空拓展体验、校园定向越野', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000085', '曳步舞', '河南大学曳步舞社团协会创立于2015年9月10日，挂靠于河南大学体育学院，现任指导老师栗江豪，现有会员人数69人。这是一个热爱生命和生活，富有团队意识的集体。我们通过这个社团能让大家认识曳步舞，学习曳步舞，最后爱上曳步舞这种富有节奏，充满活力的舞蹈，丰富同学们的课余生活，陶冶情操，丰富校园文化建设。 ', '/images/commLogo/none.png', 69, 0, '文化体育', 0, '未设置', '河南大学体育学院', 'NULL', '', 'NULL', '明伦');
INSERT INTO `shetuan` VALUES ('00000086', '3C千语时空协会', '协会始终坚持“文化、交流、创新”为宗旨，丰富并培养大学生的兴趣爱好。 本协会属于爱心志愿者协会，会定期组织并参加一些爱心或者志愿者活动，我们会用手语舞的形式，将手语传播出去，让大家体会到手语的魅力。协会组织手语教学活动( 一周两次)。参加开封爱心之家，聋哑学校等的社会志愿者活动和爱心活动。欢迎任意院系的学弟学妹们加入我们。 ', '/images/commLogo/none.png', 52, 0, '文化体育', 0, '未设置', '外语学院', 'NULL', '中原手语交流会', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000087', '铁塔文学社', '河南大学铁塔文学社创立于1983年，同年社刊《铁塔湖》创刊，挂靠于河南大学文学院，现任指导老师王银辉，现有会员人数72人。是河南大学也是河南省创办最早的社团之一，拥有社刊《铁塔湖》和合创期刊《试墨》等刊物。不倦探索,无悔追求,一代代铁塔人用自己的执着与真诚耕耘着文学的土壤,编织着文学的梦想。三十载年华，在学校与广大社员的支持下，铁塔文学社不断努力，不断成长。社团先后得到陈忠实、巍巍、李准、松金伞、陈天然等人的惠泽与指导。社员多次在全国性征文比赛中取得优异成绩，作品遍及《人民日报》、《中国青年报》、《河南日报》、《诗刊》等多家著名刊物。宗旨是帮助河大学子追求文学梦想。', '/images/commLogo/none.png', 72, 0, '文化体育', 0, '未设置', '河南大学文学院', 'NULL', '读书交流会', 'NULL', '明伦');
INSERT INTO `shetuan` VALUES ('00000088', '羽帆诗社', '羽帆诗社以繁荣诗歌创作，振兴中华诗坛为己任。先后出版《羽帆诗刊》、《黄河风诗刊》，成为当时大学诗歌阵营的一支中坚力量。时至今日，我们仍能看到一代一代的羽帆人为诗歌之不死而作出的努力。从创立至今,许多优秀的校园诗人脱颖而出。现在，我们以社刊《此火》为号，在金属摇晃的今日，在莽莽平原之上，在寂寂黑夜之中，将梦高举。魏巍、田间、臧克家、端木蕻良、周启祥、张俊山、苏文魁、李允久、孔令更、陈峻峰、齐遂林等著名诗人和作家都曾先后出任羽帆诗社顾问。其品牌活动有“但为君兮”情诗大赛，羽帆诗社原创诗剧表演。社团曾多次获得河南大学三星级社团称号。 ', '/images/commLogo/none.png', 100, 0, '文化体育', 0, '未设置', '河南大学文学院', 'NULL', '“但为君兮”情诗大赛 羽帆诗社原创诗剧表演', 'NULL', '明伦');
INSERT INTO `shetuan` VALUES ('00000089', '大平原文学社', '大平原文学社创立于1986年，挂靠在河南大学文学院，现任指导老师郭伟，现有会员人数60人。是河南大学恢复校名以来最早成立的学生社团之一。大平原的办社宗旨是为广大的文学爱好者提供施展自己的园地，这是一片足够广阔的平原让热爱文学的你在这里驰骋飞扬。“丰富业余生活，提高文学气质修养”的办社初衷以各种形式开展活动尽力为大家服务，定期请文学院的名教授举行文学讲座，各式的活动都只为大家求索文学真谛的翻山路，渡河桥，唯愿大家能从中汲取营养，获得动力。文学社自成立以来，本着“以文会友，共写青春”的理念，培养了一大批文学爱好者，人才辈出。', '/images/commLogo/none.png', 60, 0, '文化体育', 0, '未设置', '河南大学文学院', 'NULL', '主题征文比赛、读书交流会', 'NULL', '明伦');
INSERT INTO `shetuan` VALUES ('00000090', '影视协会', '影视协会在十余年间的探索和改革中，也形成了一系列的品牌活动，如：周末校园电影院线、河南大学影视配音大赛、河南大学校园微电影剧本征集大赛、个人微电影拍摄与制作、FIRST青年电影展河南大学赛区作品选拔与推荐、影视专题讲座及作品展、高端微电影制作团队培养计划。自成立以来，影视协会就以传播优秀影视文化、提高广大同学影视欣赏水平为宗旨，在实践中一步步走向成熟，在河大这个伟大母亲的滋养下，他已经成长为一颗善良的心，光彩夺目。社团的宗旨是：秉承“让光影伴我成长”的理念，以小力推动中国大学生电影文化发展。遵守宪法、法律、法规和校团委、学生社团联合会的规定，遵守社会道德风尚。', '/images/commLogo/none.png', 150, 0, '文化体育', 0, '未设置', '河南大学文学院', 'NULL', '配音大赛、周末影院', 'NULL', '明伦');
INSERT INTO `shetuan` VALUES ('00000091', '魔术社', '河南大学魔术社成立于2009年，挂靠于文学院。会员数总计一百余人。魔术社以“丰富校园文化，推广魔术艺术”为宗旨，以“最大可能的培养一批魔术爱好者”为目标，以“跟我一起，创造奇迹”为口号，支撑起一片属于自己的天空。魔术社以魔术教学为特色活动，通过魔术教学，会员可以掌握基本的魔术手法，并加以扩展。会员之间广泛的交流可增加手法的熟练程度。在这里，每个人都身怀绝技，每个地方都是舞台，每位成员都是魔术达人。', '/images/commLogo/none.png', 100, 0, '文化体育', 0, '未设置', '河南大学文学院', 'NULL', '魔术教学、魔术讲座', 'NULL', '明伦');
INSERT INTO `shetuan` VALUES ('00000092', '河南大学吉他协会', '河南大学吉他协会成立于1997年，是挂靠于艺术学院的文艺性社团。协会始终围绕“弘扬吉他文化，丰富校园生活；推广吉他知识，普及大众音乐”的宗旨，通过开展交流、教学、各类演出等一系列的活动，积极营造一个轻松、休闲、愉快的音乐氛围，使会员紧张的学习气氛得到缓解和放松，丰富大学生活，结识更多对音乐有共同爱好的朋友。我们社团的目标是：以澎湃的吉他活动，丰富校园文化，普及乐器知识，活跃校园文化，促进高校娱艺文化的繁荣和发展。为学校及地方文化建设做出积极贡献！', '/images/commLogo/none.png', 147, 0, '文化体育', 0, '未设置', '河南大学艺术学院', 'NULL', '河南大学摇滚之夜', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000093', '速写与创作协会', '速写与创作协会素称爱好画画者的居所，以“互进创新”为协会宗旨，以创新协会会员思想为目的，使协会朝着良好的势头发展。本协会涉及素描、POP字体、漫画、手绘插画、模型创作、海报等艺术创作。希望让美术绘画的同学在青春画上一抹靓彩，并让美术绘画挖掘每个同学沉睡的创新潜力，开创自己独特的一面，让自己的内在更加卓越！协会不仅招收艺术学院的会员，还为广大热爱艺术的同学创造一个互相交流与学习的平台，协会积极参与学校的各项活动，以及各类专业比赛，使会员得到更多锻炼和实践的机会。还参与设计河南省开封市清明上河园卡通人物的征集活动。协会在周末常常举行社团内部的文艺比拼，让会员在比拼中得到有效的实际练习，提高艺术创作水平，也会定期展示优秀作品，激发会员的积极性，连续几年被评为三星级社团。', '/images/commLogo/none.png', 135, 0, '文化体育', 0, '未设置', '河南大学艺术学院', 'NULL', '外出采风', 'NULL', '明伦');
INSERT INTO `shetuan` VALUES ('00000094', '歌手俱乐部', '河南大学歌手俱乐部成立于2008年，挂靠于河南大学艺术学院，现有会员人数40人。该社团是一个专业性演出团体。宗旨是为每一个歌唱爱好者提供交流和自我展现的平台。活跃校园文化氛围，培养和提高同学们的音乐素质，交流飙歌经验、歌唱心得, 推广翻唱音乐，分享音乐乐趣，举行歌友交流会、专业教师辅导等活动，增进会员交流，竭力推动歌唱事业、高品位艺术的发展。歌手俱乐部为同学们提供了一个展示自己、为自己的音乐梦想而去大胆追求的一个舞台，开心快乐的唱出你我的心声。', '/images/commLogo/none.png', 40, 0, '文化体育', 0, '未设置', '河南大学艺术学院', 'NULL', '歌友交流会	', 'NULL', '明伦');
INSERT INTO `shetuan` VALUES ('00000095', '主持人协会', '主持人协会于2007年成立，挂靠在河南大学艺术学院，现有会员人数26人。协会的主要工作是为各社团、学院以及学校各类活动提供主持人，其品牌活动有主持人大赛。从2007年创办至今，协会走出了许多优秀的主持人，他们活跃在学内、校外的各个角落，为河南大学这座古老的校园增添了亮丽的色彩、注入了新鲜的血液。协会里许多优秀的人才活跃在省级电视台，如河南八套的闻祥、马慧等。', '/images/commLogo/none.png', 26, 0, '文化体育', 0, '未设置', '河南大学艺术学院', 'NULL', '主持人大赛', 'NULL', '明伦');
INSERT INTO `shetuan` VALUES ('00000096', '古琴社', '河南大学古琴社成立于2009年，挂靠于河南大学艺术学院。河南大学古琴社秉着传承中华传统之文化的宗旨，“以琴会友，以友辅仁”，让古琴“其曲仍高，其和不寡”，振千古之琴风，继往圣之绝响。琴社以文艺雅集为特色，包含了琴、瑟、箫、茶、香、诗词等传统文化，于高雅意韵之中，培养社员及友人为外而有礼、内而和乐之人，传扬中华传统文化之时，亦为传统文化之传扬育人才。古琴社自创立以来，得到了斫琴名家罗苏里、道琴社开封分社社长梅溪、开封中州琴社社长、开封古琴专业委员会常务副会长王雨轩等校内外琴友老师的关注和支持，多次受邀参加琴会、贡月等雅集活动，并获得广泛好评。', '/images/commLogo/none.png', 35, 0, '文化体育', 0, '未设置', '河南大学艺术学院', 'NULL', '中国传统化古典文化鉴赏、书法古琴服饰展', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000097', '创意美协', '为更加直接地体验到中华传统手工艺品的魅力，感受传统文化的伟大精髓，创意美协应运而生。创意美协协会是由一群热爱手工艺，崇尚自由、质朴、纯真和自然的成员组成，这里有热爱手工，喜爱创造的小伙伴。协会主要以创作和制作自身爱好或符合大众需求的物件为主，把普通物品以美的形式呈现给大众。创意美协坚持“手作”，坚持自己的“腔调”。协会将大力弘扬中华民族传统工艺，使同学们建立自强不息的生活态度，在生活中发现和创造美，实现自我价值和社会价值。', '/images/commLogo/none.png', 42, 0, '文化体育', 0, '未设置', '河南大学艺术学院', 'NULL', '', 'NULL', '明伦');
INSERT INTO `shetuan` VALUES ('00000098', 'NGU演讲与表达协会', 'NGU演讲表达协会创立于2014年，挂靠在河南大学公共体育教研部，现任指导老师李隆，现有会员人数65人。该社团的使命是帮助更多的大学生在众人面前自由表达思想。价值观是乐观；言行一致；永不放弃。他们注重通过一系列的演讲表达训练和实战使更多的大学生具备这项在以后的生活或就业中非常重要的能力。其品牌活动有演讲特训营、演讲比赛。', '/images/commLogo/none.png', 65, 0, '文化体育', 1, '未设置', '河南大学公共体育教研部', 'NULL', '五四主题演讲、演讲训练营', 'NULL', '明伦');
INSERT INTO `shetuan` VALUES ('00000099', '清风剧团', '河南大学清风剧团是一个以在河南大学传播舞台剧艺术为目的的文学艺术性剧团。本剧团将为热爱舞台剧剧本创作与舞台表演的同学提供一个展示自我的平台。日常活动及活动频率：剧团日常活动主要以对表演与剧本创作的培训为主。有节目时以排练为主。招新对象及要求：招新对象限于河南大学本科学生，无特殊要求。', '/images/commLogo/none.png', 98, 0, '文化体育', 0, '未设置', '河南大学', 'NULL', '', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000100', '金石篆刻协会', '河南大学金石篆刻协会是挂靠于河南大学艺术学院团委社团部，是一个针对金石篆刻成立的教学型兴趣社团，在初步学习和体验的基础上，进一步加深对篆刻艺术的认识，并以篆刻作品创作与评鉴为核心，逐步拓展、探索与此相关的各类艺术表现形式的内在联系，逐步提高学生对艺术的审美与鉴赏能力，旨在丰富学生一定的艺术品位，传承融高雅与朴实、稳健与奔放等为一体的中国传统文化，在实践中树立和培养学生良好的心理品质等。', '/images/commLogo/none.png', 30, 0, '文化体育', 0, '未设置', '河南大学艺术学院      ', 'NULL', '', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000101', ' 中国舞韵舞蹈协会', '河南大学中国舞韵舞蹈协会成是由热爱中华民族传统文化的学生自发组织成立的群众性社团，接受河南大学校团委管理、校社联的监督，并在其指导下开展工作。本协会以帮助有意向学习中国舞的学生为己任，不断充实舞蹈实践内容，培养学生对社会美、自然美、艺术美的感受、理解、想象和创造，以提高学生审美和人文素养为基本目标，以弘扬中华民族传统文化为最高目标，本着为学校和学生负责任的态度为广大学子提供美育教育。作为服务型社团，本协会将团结我校有意向学习中国舞的同学，为他们提供一个学习和展示中国舞的平台。现我们会定期举办各种中国舞教学活动，主办人均为河南大学舞蹈专业教师或舞蹈专业学生，也会承接学校及各个院系大型演出赛事，并且积极对接开封各企事业单位的文艺部门协助他们举办各种活动等。河南大学中国舞韵舞蹈协会将在“开放、包容、共建、共享”理念的指导下，以艺术学院舞蹈编导专业为主体，联合相关学院、演出团体、研究机构、政企部门，整合社会各方资源，搭建具有广泛影响力的学术平台，传承中国传统文化的核心价值， 为中国舞蹈文化的繁荣发展夯实研究基础。让舞蹈发出自己的声音，讲好中国故事，发挥真正作用。在交流互助中让舞蹈这条路不再漫长曲折，并享受和大家一起舞蹈的乐趣。', '/images/commLogo/none.png', 30, 0, '文化体育', 0, '未设置', '河南大学艺术学院      ', 'NULL', '', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000102', '绿色联盟协会', '河南大学绿色联盟协会成立于2005年11月8日，是在河南大学环境与规划学院团委领导下，在河南大学校团委、河南大学环境与规划学院学院团委和河南大学学生社团联合会的指导下由学生自发组织成立的协会，是以宣传环保知识，组织环保活动，探讨环境与经济谐调发展为宗旨的学生公益性组织。协会以\"尊重自然，保护环境，以人为本，和谐发展\"为口号，旨在促进环保与经济协调发展，构建和谐社会，使可持续发展思想深入全社会。自协会成立十多年以来，河南大学绿色联盟协会一直走在环保先列，多次被开封市环保局，河南省环保厅授予“低碳先锋”、“环保卫士”等光荣称号。精品活动：环保宣传系列活动、绿色单车行、低碳换购、地球日系列活动等。', '/images/commLogo/none.png', 110, 0, '志愿公益', 0, '未设置', '河南大学环境与规划学院', 'NULL', '', 'NULL', '明伦');
INSERT INTO `shetuan` VALUES ('00000103', '三农发展研究会', '河南大学三农发展研究会是河南省高等院校中最先成立的涉农社团之一，她关注农村发展，关心农业兴衰，心系农民福祉，是一个具有强烈的社会现实关注意识的团体。她以“锻炼自身才干、促进三农发展、影响周边人群、弘扬社会责任”为宗旨，坚守“求真、务实、团结、奋进、创新、有为”的行动理念，遵循“有益、有效、有为”的活动原则，注重社团自身建设和会员素质、能力的提高，通过社团文化建设团结会员、凝聚人心，增强整体行动力。社团定位为一个开放的平台、自由的讲坛、坦诚的组合、行动的团队，为广大有志向关注农村发展的同学，提供一个学习、交流、实践、提高的平台。社团活动以“学习→调查（共建）→研究→提高”为主线的学术研究和下乡支农支教调研活动、“爱心行动”（爱心助学和爱心募捐等）为其两大特色活动。先后获得河南大学“五星级社团”、省级“优秀社团”等荣誉。', '/images/commLogo/none.png', 190, 0, '志愿公益', 0, '未设置', '河南大学马克思主义学院', 'NULL', '下乡支农支教调研活动、周边共建活动', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000104', '3C千语时空', '河南大学3C千语时空协会成立于2003年9月，是一个以‘‘文化（Culture)’’、‘‘交流(Communication)’’、‘‘创新(Creativity)’’为宗旨和目标，以‘‘我们服务，我们快乐’’为口号的社团。  她是一个以手语文化为中心的优秀社团,自协会创立以来，她始终秉承立足学生，服务学生，发展学生的理念，为提高和锻炼各位会员其他方面的能力提供了一个很好的平台，受到广大师生的一致好评! 手语是3C千语时空最耀眼的一颗星，正是以她独特的魅力吸引了太多的目光。协会每年都跟开封市爱心之家、开封市康复中心等公益组织一起进行公益活动。                          我们希望通过我们的努力，能够让更多的人去关注和关心聋哑人的生活，让这些特殊群体感受到社会并没有遗忘他们。', '/images/commLogo/none.png', 120, 0, '志愿公益', 0, '未设置', '护理学院', 'NULL', '中原高校手语交流会 手语教学 手语舞表演', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000105', '护理爱心传播协会', '护理爱心传播协会隶属于河南大学护理学院，成立于2002，是护理学院最早成立的社团。我们以“奉献爱心，播种健康”为中心，积极开展各项活动，宣传普及护理健康知识，将爱洒满人间。协会设有会长，副会长，部长，委员等职位。下有人事部，宣传部，外联部，文艺部，爱心小组五个各具特色的部门。各部门紧密合作，各司其职，协调发展。在过去的十个春秋里在校党委的支持与指导下在各届领导人的带领和委员的配合下我协会亦取得一定的进步。宣传健康知识包括：血压知识讲堂、护肤知识讲堂、营养健康知识宣传等。爱心奉献方面包括：一元奉献、郑开马拉松志愿者、康复中心志愿者等。       ', '/images/commLogo/none.png', 64, 0, '志愿公益', 0, '未设置', '河南大学护理爱心传播协会', 'NULL', '一元奉献、郑开马拉松志愿者、康复中心志愿者', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000106', '社会工作协会', '河南大学社会工作协会成立于2012年5月，现有会员30人，是河南大学学生社团联合会的成员，接受共青团河南大学委员会和共青团河南大学哲学与公共管理学院委员会的领导和监督，并接受共青团河南大学哲学与公共管理学院的具体管理。本协会是集学术性、实践性为一体的非营利性社团组织，河南大学社会工作协会以“为社会分忧、为行业服务、为案主解困、助人自助、奉献社会”为宗旨，并积极传播“助人自助”的社工理念，用专业、科学、合理和润物细无声的方式帮助他人，并通过一系列的社团活动锻炼自己的实践能力，以求更加深入的理解和践行社工的“助人自助”思想，同时也在体悟“明德、新民、止于至善”的育人校训中做好本职工作，为百年河大贡献自己的一份心力。', '/images/commLogo/none.png', 30, 0, '志愿公益', 0, '未设置', '', 'NULL', '七彩阳光社会服务示范项目之橙色（养老）项目的暑期社会实践活动，', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000107', '绿芽支教团', '河南大学绿芽支教团是由河南大学校党委指导，河南大学校团委领导，隶属于河南大学社团联合会，由教育科学学院直接领导的大学生社团组织。社团以“情系城乡教育，奉献青春激情”为宗旨。主要活动以日常支教与暑期项目为主，每一个会员不断在学生与队员们的影响下践行者当代大学生应有的责任与担当。', '/images/commLogo/none.png', 116, 0, '志愿公益', 0, '未设置', '教育科学学院', 'NULL', '日常支教、暑期支教', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000108', '留学协会', '留学协会成立于2014年，挂靠在河南大学校团委，现有会员人数60人。协会以“留学，成长，海外，公益”为宗旨，致力于为每一名有留学意向的河大学子传达更全面的留学知识 寻找更多志同道合的留学同路人。河南大学前身为留学欧美预备学校，留协作为校级官方社团，毋庸置疑，能更专业地为各位河大学子提供交流经验以及沟通信息的平台，为河大学子出国深造提供更多便利。其品牌活动有雅思大赛，模拟留学沙龙，四六级讲座，美食圣诞party，菁英沙龙等。这里有丰富的国际交流和出国留学信息，有强大的海内外校友资源网络，有名师全程免费指导的雅思模拟大赛。精品活动：雅思大赛，模拟留学沙龙，四六级讲座，美食圣诞party，菁英沙龙等。', '/images/commLogo/none.png', 6, 0, '志愿公益', 0, '未设置', '河南大学校团委', 'NULL', '', 'NULL', '金明');
INSERT INTO `shetuan` VALUES ('00000109', '爱心俱乐部', '河南大学爱心俱乐部是一个公益性社团，成立于2001年，挂靠在河南大学文学院，现任指导老师周青，现有会员人数100人。其品牌活动有回收军训服，探访儿童村，养老院志愿活动，义卖大河报等。爱心俱乐部是河南大学为数不多的公益社团之一。它以“无私奉献，弘扬正气，提高素质，铸造辉煌”为宗旨，为有责任心、希望为社会增加温暖的学生提供一片天地。爱心俱乐部以其特有的道德、人文内涵和全新的理念在我校社团中独树一帜，为协助促进校园、社会精神文明建设、全方位提高学生的素质做出贡献。十年来，一代代的“爱心人”带着满腔的热情走出校门，迈入社会为其献上自己的一份力。', '/images/commLogo/none.png', 100, 0, '志愿公益', 0, '未设置', '河南大学文学院', 'NULL', '回收军训服，探访儿童村，养老院志愿活动，义卖大河报', 'NULL', '明伦');
INSERT INTO `shetuan` VALUES ('00000110', '法律服务中心', '河南大学法律服务中心品牌活动有12.4“宪法日”，3.15“消费者权益日”，模拟法庭活动，“法条竞赛”活动，案例分析活动，法律援助工作及日常接待咨询工作等。 “以我所学，服务大众”是法律服务中心的宗旨，“给法律学习者以智慧，给法律需求者以帮助”为法服目标。社团自成立以来每年都会举办模拟法庭、法制宣传日等系列活动，受到了社会一致好评。自成立以来社团多次获得河南大学“五星级社团”、“优秀社团”等荣誉称号，2010年我社团被评为河南省高校十大社团标兵，2013年我社团在中国人民大学主办的全国高校法律援助“会见当事人”比赛中获得二等奖，为河南大学赢得了荣誉。', '/images/commLogo/none.png', 40, 0, '自律互助', 1, '未设置', '河南大学法学院', 'NULL', '12.4“宪法日”，3.15“消费者权益日”，模拟法庭活动，“法条竞赛”活动，案例分析活动，法律援助工作及日常接待咨询工作', 'NULL', '明伦');

-- ----------------------------
-- Table structure for stchange
-- ----------------------------
DROP TABLE IF EXISTS `stchange`;
CREATE TABLE `stchange`  (
  `cgid` int(32) NOT NULL AUTO_INCREMENT COMMENT '修改ID',
  `shetuanid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '社团的id',
  `text` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改信息',
  `cgtime` datetime NULL DEFAULT NULL COMMENT '提交修改的时间',
  `actime` datetime NULL DEFAULT NULL COMMENT '批准修改的时间',
  `cgstatus` int(4) NULL DEFAULT 2 COMMENT '此时这条修改的状态',
  `cgtype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更改类型，brief 社团简介',
  PRIMARY KEY (`cgid`) USING BTREE,
  INDEX `11`(`shetuanid`) USING BTREE,
  CONSTRAINT `11` FOREIGN KEY (`shetuanid`) REFERENCES `shetuan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of stchange
-- ----------------------------
INSERT INTO `stchange` VALUES (13, '00000001', '河南大学学生社团联合会是在中共河南大学委员会的领导下和共青团河南大学委员会的具体指导下管理、服务、指导、监督河南大学各学生社团的学生自治组织，是建设校园精神文明、发展先进文化的重要力量。\r\n\r\n\r\n河南大学学生社团联合会设有八部一室，分别为：办公室、外联部、组织部、纪检部、策划部、宣传部、网络部、新闻编辑部和文艺部。\r\n办公室:\r\n办公室是社联的重要组成部分,在社联中起枢纽的作用,被形象地称为社联的“管家”。主要负责社联的内部财务与文件档案等事务，在具体活动中负责执行协调工作，在日常工作中负责协调社联各部门和社团的正常运转。\r\n外联部:\r\n负责争取社会各方面的支持，寻求商家的赞助合作，以及组织和\r\n协调各社团的实践活动等。\r\n组织部:\r\n作为社联重要部门的组织部,主要负责社团的成立、注销的审查，主席团日常文秘起草，社联大型活动如社团十大人物，社团巡礼，社团文化节，学年表彰文件的制定以及社联委员、社团干部培训工作，并组织开展思想教育活动。\r\n纪检部:\r\n负责社联内部各项活动的考勤和各社团活动的打分监督，保证学\r\n生社团健康有序的开展活动，负责评定“星级学生社团”、“优秀学\r\n生社团”、“学生社团优秀干部”等评优工作。\r\n策划部:\r\n策划部是社联的“智囊”,它负责各项工作与活动的策划，协助学生社团活动的整体策划安排。积极开展并推动整个学生社团之间的经验交流，审核社团活动策划方案。\r\n宣传部:\r\n宣传部作为社联的“形象大使”,主要负责社联的各项日常宣传\r\n工作，承接展板、海报设计以及活动摄影工作。   \r\n网络部\r\n通过网络开展并推动各学生社团之间的交流，负责社联网站的日\r\n常更新和管理工作，及时发布社联、社团动态，策划执行每年一届的\r\n电子竞技大赛。\r\n新闻编辑部\r\n负责社联及社团大小活动的新闻采写，及时发布在学校各个媒体，\r\n记录会议内容并整理存档备查。负责社联杂志的选稿、撰稿、印发及\r\n管理等。\r\n    文艺部\r\n负责社联大型文艺活动汇演的前期彩排和现场的幕后工作，是社\r\n联金牌活动的总策划师。\r\n', '2018-09-12 11:21:31', '2018-09-12 11:45:15', 1, 'brief');
INSERT INTO `stchange` VALUES (14, '00000001', '*河南大学学生社团联合会是在中共河南大学委员会的领导下和共青团河南大学委员会的具体指导下管理、服务、指导、监督河南大学各学生社团的学生自治组织，是建设校园精神文明、发展先进文化的重要力量。\n\n\n河南大学学生社团联合会设有八部一室，分别为：办公室、外联部、组织部、纪检部、策划部、宣传部、网络部、新闻编辑部和文艺部。\n办公室:\n办公室是社联的重要组成部分,在社联中起枢纽的作用,被形象地称为社联的“管家”。主要负责社联的内部财务与文件档案等事务，在具体活动中负责执行协调工作，在日常工作中负责协调社联各部门和社团的正常运转。\n外联部:\n负责争取社会各方面的支持，寻求商家的赞助合作，以及组织和\n协调各社团的实践活动等。\n组织部:\n作为社联重要部门的组织部,主要负责社团的成立、注销的审查，主席团日常文秘起草，社联大型活动如社团十大人物，社团巡礼，社团文化节，学年表彰文件的制定以及社联委员、社团干部培训工作，并组织开展思想教育活动。\n纪检部:\n负责社联内部各项活动的考勤和各社团活动的打分监督，保证学\n生社团健康有序的开展活动，负责评定“星级学生社团”、“优秀学\n生社团”、“学生社团优秀干部”等评优工作。\n策划部:\n策划部是社联的“智囊”,它负责各项工作与活动的策划，协助学生社团活动的整体策划安排。积极开展并推动整个学生社团之间的经验交流，审核社团活动策划方案。\n宣传部:\n宣传部作为社联的“形象大使”,主要负责社联的各项日常宣传\n工作，承接展板、海报设计以及活动摄影工作。   \n网络部\n通过网络开展并推动各学生社团之间的交流，负责社联网站的日\n常更新和管理工作，及时发布社联、社团动态，策划执行每年一届的\n电子竞技大赛。\n新闻编辑部\n负责社联及社团大小活动的新闻采写，及时发布在学校各个媒体，\n记录会议内容并整理存档备查。负责社联杂志的选稿、撰稿、印发及\n管理等。\n    文艺部\n负责社联大型文艺活动汇演的前期彩排和现场的幕后工作，是社\n联金牌活动的总策划师。\n', '2018-09-12 11:22:07', '2018-09-12 11:22:15', 1, 'brief');
INSERT INTO `stchange` VALUES (15, '00000018', '*校园义诊', '2018-09-12 11:42:55', '2018-09-12 11:43:08', 1, 'jphd');
INSERT INTO `stchange` VALUES (16, '00000001', 'NULL', '2018-09-12 12:04:10', '2018-09-12 12:04:20', 0, 'jphd');

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
INSERT INTO `stguanzhu` VALUES ('oOj6Z5YYn2ECqt7zUWrs017TcxCU', '00000001', '2018-09-11 15:57:39');
INSERT INTO `stguanzhu` VALUES ('oOj6Z5YYn2ECqt7zUWrs017TcxCU', '00000003', '2018-09-12 11:13:27');
INSERT INTO `stguanzhu` VALUES ('oOj6Z5YYn2ECqt7zUWrs017TcxCU', '00000023', '2018-09-12 12:30:07');

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
INSERT INTO `user` VALUES ('oOj6Z5YYn2ECqt7zUWrs017TcxCU', 'CogYeFyR2DZN7e1NGwcaKw==', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
	if(OLD.cgtype = 'brief')THEN
	UPDATE shetuan SET brief = OLD.text WHERE id = NEW.shetuanid;
	END IF;
	if(OLD.cgtype = 'zyfzr')THEN
	UPDATE shetuan SET zyfzr = OLD.text WHERE id = NEW.shetuanid;
	END IF;
	if(OLD.cgtype = 'jphd')THEN
	UPDATE shetuan SET jphd = OLD.text WHERE id = NEW.shetuanid;
	END IF;
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
INSERT INTO stguanzhu VALUES (NEW.openid,'00000001','2018-09-01 01:01:01');
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
