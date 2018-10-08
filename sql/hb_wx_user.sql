/*
Navicat MySQL Data Transfer

Source Server         : mp_line
Source Server Version : 50557
Source Host           : 139.199.78.111:3306
Source Database       : mp

Target Server Type    : MYSQL
Target Server Version : 50557
File Encoding         : 65001

Date: 2018-07-18 18:50:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `hb_wx_user`
-- ----------------------------
DROP TABLE IF EXISTS `hb_wx_user`;
CREATE TABLE `hb_wx_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) NOT NULL DEFAULT '' COMMENT '用户名',
  `head_img` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `amount` decimal(18,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '余额',
  `frozen_amount` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '冻结余额（领取的红包）',
  `session_key` varchar(80) DEFAULT NULL,
  `unionid` varchar(80) DEFAULT NULL,
  `openid` varchar(100) DEFAULT '' COMMENT '微信openId',
  `sex` char(1) NOT NULL DEFAULT '0' COMMENT '性别 0：未知、1：男、2：女',
  `coutry` varchar(255) NOT NULL DEFAULT '',
  `province` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `phone` char(15) NOT NULL DEFAULT '',
  `ip_addr` varchar(50) DEFAULT NULL,
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `status` char(1) NOT NULL DEFAULT '1' COMMENT '状态 1为正常 0为封禁 2为余额操作、提现限制',
  `u_name` varchar(100) NOT NULL COMMENT '未加密用户名',
  `clock_amount` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '锁定金额',
  `pay_num` int(11) NOT NULL DEFAULT '0' COMMENT '可付费创建名片次数',
  `photo_num` int(11) NOT NULL DEFAULT '0' COMMENT '可付费创建相册次数',
  `card_num` int(11) NOT NULL DEFAULT '0' COMMENT '拥有的卡片数量',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1为是',
  `group_num` int(11) NOT NULL DEFAULT '0' COMMENT '可付费创建组次数',
  PRIMARY KEY (`id`),
  KEY `openId` (`openid`) USING BTREE COMMENT 'openId'
) ENGINE=InnoDB AUTO_INCREMENT=29470 DEFAULT CHARSET=utf8mb4 COMMENT='微信用户表';

-- ----------------------------
-- Records of hb_wx_user
-- ----------------------------
INSERT INTO `hb_wx_user` VALUES ('29298', '', '', '0.00', '0.00', 'cVY2L7mnmHNI9MAypbPBfQ==', '', 'o26k245L6gpDpqDsB4N7vGwbDeTE', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '1', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29299', '', '', '0.00', '0.00', 'MjeU58+uMDMA0cDG0vAELg==', '', 'o26k240OqiLjT7oDomUg6tHLIPMI', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '2', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29300', '', '', '0.00', '0.00', 'A1H9GuVFzX87IN6PI+6Qlw==', '', 'o26k242_pX7m83-CuTrp44dd-IUs', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '1', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29301', '', '', '0.00', '0.00', 'JMrYDFeAXh0kS+jyYc6JvA==', '', 'o26k24-9Z08KnvWYV7c37cUWJEpI', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29302', '', '', '0.00', '0.00', 'sbKtn9KDGACyqOlDUKr6og==', '', 'o26k248CHbG2Rc90MySM4NY3Zmko', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29303', '', '', '0.00', '0.00', 'U7IPpsndTkvp0T6ZJOpFKA==', '', 'o26k243BTgRb-IIQZrzJA69fzsQw', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '1', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29304', '', '', '0.00', '0.00', 'vNlhMpMH07f5XzXRSlLD2w==', '', 'o26k2422CYLtvUxaCh1xFEefRVI4', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29305', '', '', '0.00', '0.00', 'alAukcZ+ZcCSc0XhH7GZhQ==', '', 'o26k246acxPbzOg37STKiMJ0zYuI', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29306', '', '', '0.00', '0.00', 'dI7oPDyOVCbkZeDXoSKoSA==', '', 'o26k248GNnZ3YKrLosfwLpXHAEGw', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '1', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29307', '', '', '0.00', '0.00', 'T59/ElrECwDuatINpFU7gA==', '', 'o26k241Zv0sC-I-4Tz0fmkROrXo4', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29308', '', '', '0.00', '0.00', 'R7WUL8ndpxObFM3y8NNjVg==', '', 'o26k240B-BHMgf7yXRpfIyEK_An0', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29309', '', '', '0.00', '0.00', 'lwKXHsk3HkSMgMRhuQBrHQ==', '', 'o26k247bC0UhEoygYcAs65aPxUn4', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29310', '', '', '0.00', '0.00', '+r/pDg1L5QPOyUgjWRqj0Q==', '', 'o26k247KTbsTaF7Skr-xc5A_wFS4', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29311', '', '', '0.00', '0.00', 'b0YIyTbKcGFlzyIJRd/YQQ==', '', 'o26k244TAD_6UtyjtIbrYmv7qfsw', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29312', '', '', '0.00', '0.00', '1McE/28hDEGDjg0upej6qQ==', '', 'o26k244YJKYDX8BnVHJHC5J00Xq0', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29313', '', '', '0.00', '0.00', 'mtsGAnvpJzEn3MNffIqsdQ==', '', 'o26k24yDJEdYgUchI5pPTB1xO4lg', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29314', '', '', '0.00', '0.00', 'Sz/2hKH1mrRgAG6Bw7Vsog==', '', 'o26k242pCY9dZYJ0byBBtjNHksT0', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '2', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29315', '', '', '0.00', '0.00', 'lIB5gwuXjr6xT2cXv3dMEw==', '', 'o26k249-9R7if_47dKTKJC49_TBs', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '1', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29316', '', '', '0.00', '0.00', 'EYySgxrXhnBE7BXsF+TxrQ==', '', 'o26k2465TwltghZa8yuAnpEWOk4A', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '1', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29317', '', '', '0.00', '0.00', 'Ce9qUqv2vOPuXMfnBegieg==', '', 'o26k246JmgsdTy9k8KqqMdlKllIY', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '1', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29318', '', '', '0.00', '0.00', 'XCiS82ruyxPdUVzNJoQQoQ==', '', 'o26k242LjJyCDwxOCBqUsMzpXvlM', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '1', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29319', '', '', '0.00', '0.00', '7dvto5x0Ys0teNr3e9lrxA==', '', 'o26k249WiJPNy5OYht4JorHnIpKQ', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '1', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29320', '', '', '0.00', '0.00', 'J/76Nxf5famh+KyKPRIN4w==', '', 'o26k248pJ1jq1oeNFGb865gBP3QE', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '1', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29321', '', '', '0.00', '0.00', '5KCN709yZnqX4fBg8fHajA==', '', 'o26k24-fF9yEMOtyf8j3HN8NN5O0', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '1', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29322', '', '', '0.00', '0.00', 'VU/BJchlWei4w850od5Tug==', '', 'o26k246uHpI20la7CjvK5qC7eTNE', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '1', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29323', '', '', '0.00', '0.00', 'oRi+LuqQ3JSvich8oWkXJw==', '', 'o26k246qZTi1VtyQtX7mtR3vGJJs', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '1', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29324', '', '', '0.00', '0.00', 'nacSImeY+KgLS/UI4imjEg==', '', 'o26k24_Q5xQuwDQBn9nqOKarZzDM', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '1', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29325', '', '', '0.00', '0.00', 'GBqV4xpPHTs5fP/7UqJdTQ==', '', 'o26k24wOKClWApykLefHXSn9524A', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29326', '', '', '0.00', '0.00', 'sRMeWodRtLdJ3eBIQ0y7Ew==', '', 'o26k244YOBgo80WEcUc5gPUDSbWY', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29327', '', '', '0.00', '0.00', 'zk4PVELPHl0UmlJQ9oYeqQ==', '', 'o26k245dEifSfBljSaH41inrqvZw', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29328', '', '', '0.00', '0.00', 'LSPMFAZOTzC9r+p1LhJFlA==', '', 'o26k246FzIfv0EH2zIe7RKHrPWXU', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29329', '', '', '0.00', '0.00', 'toCTpwYchs+WZrp83sc1lw==', '', 'o26k24yZ9HyUB7TwmpASO8Kjil38', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29330', '', '', '0.00', '0.00', 'jnyoS83qZyAwEXo5JkwSLA==', '', 'o26k24w7KOZ0m8lLwrMuuo5EbXuE', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '1', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29331', '', '', '0.00', '0.00', 'KcXtyJEusKllHoti8B83/A==', '', 'o26k242OzT_EclvcR9YjzJMNPYQQ', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29332', '', '', '0.00', '0.00', 'QsG9RtQGPa/+rP66fyyxEQ==', '', 'o26k24yTwrDPnbEyw1rNaCfdB5OE', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29333', '', '', '0.00', '0.00', 'aDM9Fyfic4ThJ0/Hzs/izg==', '', 'o26k249XIU-TKJosQj5QvPlFt4O8', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29334', '', '', '0.00', '0.00', '50lQtswjCP+y2vla4+7AtQ==', '', 'o26k24z67KGPdeZdO2mBmhJLCv1k', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29335', '', '', '0.00', '0.00', 'cCJV15AMoTz0ns8Vj4jBkg==', '', 'o26k2440KDf31cVgBK559taRE3Xg', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '1', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29336', '', '', '0.00', '0.00', '4JMXx7QFjA+iH7fhRsDPpw==', '', 'o26k248zII4ui9QSUQuMraqfAw6M', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29337', '', '', '0.00', '0.00', 'w2ymelXmwNz9NUOnY33oGw==', '', 'o26k241L9x2q3iC2xBC_vJMvx2bU', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29338', '', '', '0.00', '0.00', 'F9SkbjrleN1BUg/wDu+mhw==', '', 'o26k240kdMAIKW9pWT6eHL9pUsUE', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29339', '', '', '0.00', '0.00', 'BDB0JqedKG2ar35HEJ1mxw==', '', 'o26k246HAGVhbzGWrvm71N7FyVkE', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '2', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29340', '', '', '0.00', '0.00', 'n/vXip8DjDFZLeq1oykGLg==', '', 'o26k24958uXyCbAZpFxFVE82jsTo', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '1', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29341', '', '', '0.00', '0.00', '4C78CwccPc8SWKUghGwaQw==', '', 'o26k241lM6qeRDkzozDwyQtdLVPA', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '1', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29342', '', '', '0.00', '0.00', 'zfnMp1xAlBZQ8/ooJ9o1Tw==', '', 'o26k248ZdARlyiIGJtU5In0NcGL8', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '1', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29343', '', '', '0.00', '0.00', 'lCIQZLdQMs1fcovxU2TnGg==', '', 'o26k240NsvkL4jyks3BxweubUsDc', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '1', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29344', '', '', '0.00', '0.00', '86mo13Rjxwz+qvIMPBqwNg==', '', 'o26k244AzUiDozFLlYYRpP4qTHfg', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29345', '', '', '0.00', '0.00', '06r1sHIz529tsC7hRQ2dQA==', '', 'o26k245yMgSuIvREDtlaWsOKEoWY', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29346', '', '', '0.00', '0.00', 'FREP5h/4kXfGkQjNJqz0Kw==', '', 'o26k24-dDtohrW4XNUa8VOk3_dFY', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '1', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29347', '', '', '0.00', '0.10', '6c+CsIjzD0cGW9dqEij5Tw==', '', 'o26k24zVOR0Rudogv8X6Agh4Pi6w', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '3', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29348', '', '', '0.00', '0.00', 'GAneJNOWIFgSoli6lzSs0w==', '', 'o26k247GAZC066hP1-u5Y7r8THDw', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '1', '0', '5', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29349', '', '', '0.00', '0.00', 'lAAXICuXqoAUkE0o5N6E6A==', '', 'o26k247Pw1G8JdCxEUdf36pgFt9I', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29350', '', '', '0.00', '0.00', 'K8WA54Mx6TQCvAYhd7X19A==', '', 'o26k24_jHHtArXiwKXKkgFaFmt6I', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '1', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29351', '', '', '0.00', '0.00', 'RoU7mkLv66K9lQ8N8R/Q1w==', '', 'o26k241LiSynWpRa12PCTSK93Ynw', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29352', '', '', '0.00', '0.00', 'ooZzasx+F1xoaLPkVTo5aA==', '', 'o26k240gXC4NH5SkSOBgsL15Bvmc', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '1', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29353', '', '', '0.00', '0.00', 'Q/A8NTABUAtZ92q28Hy1ZA==', '', 'o26k242vMB2ATiFVXl0KY2pnrQSs', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29354', '', '', '0.00', '0.00', 'bRK2KhbkjlgXHoqOoPAikg==', '', 'o26k245THvIjNHkau8sccVUHY1vY', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29355', '', '', '0.00', '0.00', '/X453ubgi2xFAXvI5oXZTA==', '', 'o26k24xMPqgSczs97XGDXdZII7Ms', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '1', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29356', '', '', '0.00', '0.00', 'uN7sf/B9Qfhw5y5wYv6YSA==', '', 'o26k248_Cdn9IyGQn5078zV38DLY', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '1', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29357', '', '', '0.00', '0.00', 'uhu3gh3rMObcM+Mb5dIC2A==', '', 'o26k24xLFtbT0DMU4ebuGkZEbZrg', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29358', '', '', '0.00', '0.00', '03BCMaku6LUw5vaLGLpCXA==', '', 'o26k24_bDONTY3_WBFagjrxaSUaY', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29359', '', '', '0.00', '0.00', 'HBbMHgQKuOLR8odeSdGhTA==', '', 'o26k24y3xppgixlG3hZai8U8gjGE', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29360', '', '', '0.00', '0.00', 'sX2hY/dA0jAw/orSlJ5nZw==', '', 'o26k24w2YjQyfZUuoxiBbsw8ERPs', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29361', '', '', '0.00', '0.00', 'wVVE+/Grcp8tvoHmO9x0Ew==', '', 'o26k24_62RiOGzLam0WMLLar6lpU', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '1', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29362', '', '', '0.00', '0.00', 'awbrJS0ki1YG5mAJEOVlqw==', '', 'o26k24_fYdYAS6gOCgEvcBscMHMQ', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29363', '', '', '0.00', '0.00', 'WtkLMyfUfNwCGTShVIQn9A==', '', 'o26k242r0dyHakokASYW1p9g7zgI', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29364', '', '', '0.00', '0.00', 'iGh1XPayUd53d2OJ5x5iFg==', '', 'o26k24_EHU018mUbiinGI9_ejrlY', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29365', '', '', '0.00', '0.00', 'WBC9pOcnAH0M2Ue6S+Y9jQ==', '', 'o26k241vnR1zVyZFiP7OJepQkss0', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29366', '', '', '0.00', '0.00', 'mw/qFc4yDfZLT3zkqgf10A==', '', 'o26k246nrss1Iyf_CUI6zH1UjsXE', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29367', '', '', '0.00', '0.00', 'ycjIuip2WSGnQZUSQKhkRw==', '', 'o26k24_lY7eU9B1Z_cz1Mo7IsmyU', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29368', '', '', '0.00', '0.00', 'B1qmbStsaaIeIayAMr8UVg==', '', 'o26k2408iKCjI4MM-967-1ZKTH6E', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29369', '', '', '0.00', '0.00', 'hx7zJaCOxsI4w6HlmW7AXA==', '', 'o26k2441lVYDUcYWUPgP5JZQDN58', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29370', '', '', '0.00', '0.00', 'vsLphaldlj8sHbGDpcRf9g==', '', 'o26k2492Htd-lWc1Kg3hXB3s-aCU', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29371', '', '', '0.00', '0.00', 'BpLRuabKwG93umqtQG0vbQ==', '', 'o26k24wHxegy-sZ8JvSaDDQMZkf0', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29372', '', '', '0.00', '0.00', 'nirw1soHGrB2VCxIKbTUiw==', '', 'o26k2457PGU_hmOI4I3xcK1cD7H4', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29373', '', '', '0.00', '0.00', '+M83P+nJl9zrrSLVOFr+iQ==', '', 'o26k24zEyREpW96UBFKBIKmydU2A', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29374', '', '', '0.00', '0.00', 'D37t4kMS95Zuoscw0zwduQ==', '', 'o26k245nagW0OMJOWkICW3uiZ75g', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29375', '', '', '0.00', '0.00', 'FBjijPNAeWSD5ooeprymHw==', '', 'o26k24wUIxDL4oB_Ts3OZRXhw7_0', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '1', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29376', '', '', '0.00', '0.00', '9q0RfdDn+Rxk6nG7BfDIgQ==', '', 'o26k24zyCesA9iL8LMbKkaWVCtws', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29377', '', '', '0.00', '0.00', 'mXHuNwLEGGQLJLWdXklLdg==', '', 'o26k24z1UQHauT_SaHcdRDJlp9K0', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '1', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29378', '', '', '0.00', '0.00', 'eoDtduoQlQiLHrvRsmOREA==', '', 'o26k249spBqTX8GwJcPfOs0VL8uA', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29379', '', '', '0.00', '0.00', 'LgsmuISozHFUpI6gYQavTw==', '', 'o26k248ekHtp1fMFqsmmzvLXqPQ0', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29380', '', '', '0.00', '0.00', 'iIGX8ffSOLoXD7ch9Q6ZZw==', '', 'o26k2411xF6qt6u5M2v9GL3hFaV0', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29381', '', '', '0.00', '0.00', 'XTUs6fbBxMuqLS51VL9jyg==', '', 'o26k24x52BxBwbscBqkRT1PaA6Ik', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29382', '', '', '0.00', '0.00', 'IHW8hfETDUNrDkwgFCJeQg==', '', 'o26k24wvqYf0U73utHBRcRcAZUes', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '1', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29383', '', '', '0.00', '0.00', 'PLWeQgzoLwZE2fl/cB8n9g==', '', 'o26k244UJ0-ie-iHggiPh9kbFOcw', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29384', '', '', '0.00', '0.00', '81wT5NJMsQstk7DCN3bziw==', '', 'o26k246ob4m2fzusalEwhRN1KF-g', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29385', '', '', '0.00', '0.00', 'hOSGkRhg9pn1mocKQke3ug==', '', 'o26k249_FI9-7qzvJsGA-yNRatcM', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29386', '', '', '0.00', '0.00', 'H7lEZ2bgV0QfKAMumZtpAw==', '', 'o26k24-mozP3ctfb-rhVDIjegF_E', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29387', '', '', '0.00', '0.00', 'RtEvE/RSYlpkZQ9JuXP1wQ==', '', 'o26k244G02P_6VGNbAGZP_2RBirQ', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29388', '', '', '0.00', '0.00', 'YxEDMQe/tcsF4BGZ6f4Rig==', '', 'o26k24wfinEaNNjanoAwJfxPy8kw', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29389', '', '', '0.00', '0.00', '8LvosreW3X97zgN1E+sj1Q==', '', 'o26k246WxtKwT-lKHA2i5ee6ce9M', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29390', '', '', '0.00', '0.00', 'gOp8n6lHzuKx01YxIdSK3Q==', '', 'o26k24-Jzr7n2essMakVxU4Uid9U', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29391', '', '', '0.00', '0.00', 'XGJOv6XYBW7qUIJpwKvb7g==', '', 'o26k242zahz-E6qUUkZn0flR3YHk', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '1', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29392', '', '', '0.00', '0.00', 'ghoRKfOLkXdCYiRyEzioSQ==', '', 'o26k24_InH-9Y7NAxo-KGsiEvLr0', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29393', '', '', '0.00', '0.00', '3LL59L0Rystf+RC12Kh8PA==', '', 'o26k240zXZ7NJXGDeHrbGIp70a7c', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29394', '', '', '0.00', '0.00', 'x3uysDeHcvstrorqZYJxfQ==', '', 'o26k243-ea3qes83Dm5oLsQlknYE', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29395', '', '', '0.00', '0.00', '1vwEuVJQ1NjTMTILDSXQjg==', '', 'o26k24xMUIivOI6RCPp6zEtQbw54', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29396', '', '', '0.00', '0.00', 'ZWBWI0vrL0fzMsejwYvWYQ==', '', 'o26k24zGxzqVaNZI9NHbdTd-4hR0', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29397', '', '', '0.00', '0.00', 'WiqopYpDLIR5OQziM8zOrQ==', '', 'o26k246rYlHmfsfsSQOtyfZh9lTc', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29398', '', '', '0.00', '0.00', '1+TzXRVbQeXLAicxJGQUdQ==', '', 'o26k243JQvgYDsRNdXlEdAgIVYOo', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29399', '', '', '0.00', '0.00', 'WUQuWhwhTkiWHcfZ6zUzJw==', '', 'o26k248h4p28gXox6SObGCFU1lvM', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29400', '', '', '0.00', '0.00', 'sLwLhu6LSAnBj6t4I6O/jw==', '', 'o26k246ydIIuLdLEncXoX6dZlg4Q', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29401', '', '', '0.00', '0.00', '9Mtb+1FoPbAGEAE3ULjx7A==', '', 'o26k240q6LBAB2mnyfUQDBBLF530', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '1', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29402', '', '', '0.00', '0.00', 'Xto9aCmlM04RKBa9ElDSPw==', '', 'o26k24xJ1woYatCuPVvj9Z_PujxY', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29403', '', '', '0.00', '0.00', 'poMJYq2i0sBL2COkpo5A7g==', '', 'o26k2408LSeKESyTiIlPiu3sgkqk', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29404', '', '', '0.00', '0.00', 'r3bNJAFVnmmGTl0LLVC8lQ==', '', 'o26k248pynkD4EUV7s3lfD8N4sXc', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29405', '', '', '0.00', '0.00', '+NZMByP2r1BbzQMnyvfiRA==', '', 'o26k24y2uFvw0pTI-sxALjl7jwds', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29406', '', '', '0.00', '0.00', '/Z+6t0oDdGXFOhuNkuSWqA==', '', 'o26k24z8_VGfALY36sfGbwnsQ-9E', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29407', '', '', '0.00', '0.00', 'ekzHGBKiuTY7E31/SlMeSg==', '', 'o26k249BvwerlWJvJ6GY2_vgEXhU', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29408', '', '', '0.00', '0.00', 'PRj2PagbZPbFwBRVrf3W4w==', '', 'o26k24-OSxOaYwBKreJ0TRl8KQrI', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29409', '', '', '0.00', '0.00', 'c+ZXcbqHTc9tSrGiSsblNQ==', '', 'o26k24zN95qwIg_XsbBUgh6U1iH8', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29410', '', '', '0.00', '0.00', 'H2NEiaExjOXXqoR5LJ20Rw==', '', 'o26k245WNIiV7An7YlTBsFwa165s', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29411', '', '', '0.00', '0.00', 'yhiCOyNSniwvA+HPIuxh8g==', '', 'o26k249u4grX4NPtnNI5Qb_1bCGs', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '1', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29412', '', '', '0.00', '0.00', '+E8c3kWXlB48+fRBYhLSMQ==', '', 'o26k24w6B_fAtEiO_U7CBN8co3UU', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29413', '', '', '0.00', '0.00', 'irf8hivIm+yn/ldpPAs4hw==', '', 'o26k248dSvU2Lo-4DCpwdxm_aU1w', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29414', '', '', '0.00', '0.00', 'Z+ibU8wdST6UF0jRucBscQ==', '', 'o26k24xqE4Ks3AFuFipyEB9sbMcM', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29415', '', '', '0.00', '0.00', 'l627FReD6k0l1zRXVV4IDQ==', '', 'o26k248iqzfbPQUx6SscWk2TrZdE', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29416', '', '', '0.00', '0.00', 'u+ge2Lf4rApEH+DnseO64A==', '', 'o26k243WU8L-hEsOy_Dk4pj46nN0', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '1', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29417', '', '', '0.00', '0.00', 'MnZ7ecEnxtUPqS9HajnW1A==', '', 'o26k24yTz7AThf23V-qoGpTXrnok', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29418', '', '', '0.00', '0.00', 'KcwX/0fybX/2Z8iU4CsGmQ==', '', 'o26k24-tJdyYLf9TTNRbztqpBfdg', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29419', '', '', '0.00', '0.00', 'mDmkuVSBL2/rdyYHOwFUEA==', '', 'o26k24189m5n6BiLtjYH5ZDfV9KA', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29420', '', '', '0.00', '0.00', 'y9rPaALh7ExAU/snT/ZF5A==', '', 'o26k244mN22FmV74mGwVDo53cRoA', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29421', '', '', '0.00', '0.00', 'dbafffRCLr+4dPRGJ0VFnw==', '', 'o26k24xtq0wJ017vuncAlBi-YgkY', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29422', '', '', '0.00', '0.00', 'TP2CLrhQdCZztPZ74aeeEg==', '', 'o26k242pWYgHMLWo4eBzwNITWn74', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29423', '', '', '0.00', '0.00', 'xJeuZPO5CcF8/KDdCUg4IA==', '', 'o26k24wC5J5FXdT_gnIh9zYHDYRc', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29424', '', '', '0.00', '0.00', 'p6nyz20gPuMwANl3KRK3pQ==', '', 'o26k24wORY34riHEI9qGpg-KCzsg', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29425', '', '', '0.00', '0.00', 'EqOaaN6kwxIKg75dMI2FLw==', '', 'o26k2401yNtWE1FSIpRWIqhI0TOI', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29426', '', '', '0.00', '0.00', '6evi+SNuw7/fBdqDDtSleQ==', '', 'o26k247wArxgdFsaeoBR7wv-2XUg', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29427', '', '', '0.00', '0.00', 'tFV6u9l/l7JU7yW7HEHR+Q==', '', 'o26k241OSyVhuU3QuI1YlRn0KLn0', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29428', '', '', '0.00', '0.00', 'kE4bgmJrxWhobOMQx0INMg==', '', 'o26k249JkuI9hhB4wVzuQ_Tj0YPk', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29429', '', '', '0.00', '0.00', 'ZqEKixSRYVHv+OQWJranUA==', '', 'o26k24-vYGeSU9YB0VIcG3wLz6Vs', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29430', '', '', '0.00', '0.00', 'sTnID3cpL6txiHxXOJgdnw==', '', 'o26k243izNsNMuw1JaaQCMrfMb0o', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29431', '', '', '0.00', '0.00', 'NoBw6kK98ot5bHrbRb3TBw==', '', 'o26k24_kWl9iesz9nYTpFFE_4UNo', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29432', '', '', '0.00', '0.00', 'U+V7JOYJvzk+Z0qhooekFg==', '', 'o26k24yYIF9kmQKh8AMcwlSwfmN4', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29433', '', '', '0.00', '0.00', 'YX61QJo71KD3V2yuWq2VOw==', '', 'o26k24wV17jBnH4Pi_OdChACg0aA', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29434', '', '', '0.00', '0.00', 'mIcbu59h8PBtyMoMhY1sWA==', '', 'o26k243uyfA4Wt6GuyNUiH0USkQU', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '1', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29435', '', '', '0.00', '0.00', 'Qr/p8zikzVYyrXlKWm6aNg==', '', 'o26k246gWyfX1QHPYX-Ks6zvKUiQ', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29436', '', '', '0.00', '0.00', 'MLmj4wpD4d7jS14UAD77Pg==', '', 'o26k249wW9gzRZQkMkGGBqHsZJ08', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29437', '', '', '0.00', '0.00', 'CwxTxD07foQjFIYkZyo+5w==', '', 'o26k24-wTNIwaRRJ7OsYD_sgQt2s', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29438', '', '', '0.00', '0.00', 'K4jvtL0bf4rtUyTGQ8vuNw==', '', 'o26k24-vcU4-vIyNqjzJbY8jJ9_g', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29439', '', '', '0.00', '0.00', 'vk1tKdO3hEQ6r4uoq1KQJQ==', '', 'o26k240MsPgAaB0IT0MmGyyvUPyE', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29440', '', '', '0.00', '0.00', '1m6iiL5aZyhdc1wAy1DtBw==', '', 'o26k248p2CO1ekoaH1IxcP9n0kMU', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '1', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29441', '', '', '0.00', '0.00', 'n+O67HIHCnXrXUO0+7g+uQ==', '', 'o26k2496Tr7YTk_tQABZ1gOPa-Hw', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29442', '', '', '0.00', '0.00', 'uAz1jgeNZ038Og9woWFLEg==', '', 'o26k24we2k2DGMj0nTAOn33bMgIA', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29443', '', '', '0.00', '0.00', 'pKtdPfbL8lH+DJl9t76ejw==', '', 'o26k248QxtYwibL4HUPI1BMSkvCQ', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29444', '', '', '0.00', '0.00', 'yf0QB9WmbwTFHr8B85Cftg==', '', 'o26k247Ah1IZ_uFupPkVfAp20DaI', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29445', '', '', '0.00', '0.00', 'obwWMALpDEVGTKsXFF4iMw==', '', 'o26k249JXqVsVqzSTpBzRhBsvq4k', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29446', '', '', '0.00', '0.00', 'X28yEL+EuC8Vy6N+uXW+pg==', '', 'o26k246Y40V-uLG1GuH9-MAu-vo8', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '1', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29447', '', '', '0.00', '0.00', 'dkjwk5Z8iBLJPROjhNitFQ==', '', 'o26k24yF4gRueJIoFubMJCuul9Xs', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29448', '', '', '0.00', '0.00', 'AokwIYPG+4TvirQhqwbtUg==', '', 'o26k242wCJuhgpN88ZNZ3BFZgjgw', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29449', '', '', '0.00', '0.00', 'NXO+/B5mbVgVUvVGr6IO4A==', '', 'o26k240rEQL5BgT7YgQGrBJ4TsNE', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29450', '', '', '0.00', '0.00', '1eBB/PRqwu4CxsOgKW1Fdg==', '', 'o26k2420NzeS7NhB1KFAAKobpTWA', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29451', '', '', '0.00', '0.00', 'gxVlL8RgarJQpYAJURnedQ==', '', 'o26k24xGSlRUDtvEvFjIW8mQhBoo', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29452', '', '', '0.00', '0.00', 'xbky+hmRuyLQ2vyeSjbNNA==', '', 'o26k24ySFk3TOpBiGcv7auII2UQA', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '1', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29453', '', '', '0.00', '0.00', '7zRGCrEw96t31vSuWyQsWg==', '', 'o26k245X2c5dGKvQQM0UfJcAd3lA', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29454', '', '', '0.00', '0.00', '+I0Usm5v3Oz2PaCOtEdjMw==', '', 'o26k24-AhtMCYsoX0MISzbewgwFk', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '1', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29455', '', '', '0.00', '0.00', 'qeQFswEkE7sLOGJ7ZO00yA==', '', 'o26k245fHFwRC0vnV9hEST7wYZbE', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29456', '', '', '0.00', '0.00', 'wxMdXK1aN5lcDI7Yrc6sEQ==', '', 'o26k247cUZUMlFDvDbADIhGE2-VY', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29457', '', '', '0.00', '0.00', 'vaSu+vG6CBj10e/x4Rp3ug==', '', 'o26k241xC8RW92gUEfZwkDFy6R7k', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29458', '', '', '0.00', '0.00', '7UqT7JNgw9IaMOemoYT7Cg==', '', 'o26k246fAvDPSski2d2l74fpXPis', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29459', '', '', '0.00', '0.00', 'uc+oKRSJW4gQBJLCNyC9ug==', '', 'o26k240Tg99R-BnXa4aOeMA7t56E', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29460', '', '', '0.00', '0.00', 'IL23aNhyM6lD4btTvqGMcg==', '', 'o26k2413JQAXH1m_qrkXjLq78z6A', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29461', '', '', '0.00', '0.00', '0QLezKAymqtfm/x8rg3Ycw==', '', 'o26k24wFSmtFgiLmJMIKflZ4jr44', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29462', '', '', '0.00', '0.00', 'z8ZpEjKd8GUkuldW6EJvJA==', '', 'o26k24141j41wvSFzmU5DB5D2qGc', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '1', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29463', '', '', '0.00', '0.00', '5uiM71w1o9PXYnS+0e/q1Q==', '', 'o26k246fMAGrvWw2va1lgiMVRT30', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29464', '', '', '0.00', '0.00', '3wnFBIzX73nDmnCvtZVAoA==', '', 'o26k24_R32wolJi6LtJbUEUCewFw', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '1', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29465', '', '', '0.00', '0.00', 'rxOYc+kMEVFQM34GDNYzNg==', '', 'o26k24_uFCOgwaSY46VrkuPVnC_8', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29466', '', '', '0.00', '0.00', 'i8/m6H1Bcx7jd7f8JByDcA==', '', 'o26k24554dIt30ZoNRR41WEAMRkQ', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '1', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29467', '', '', '0.00', '0.00', 'att2E53G3ebDG7PutMkN9w==', '', 'o26k248uTG7TDxgj5Rmbw4fjo4FU', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29468', '', '', '0.00', '0.00', 'u7FNe3LE1h679sgSP0VYhA==', '', 'o26k2492Ttdk9W8WbhBKoJeig5kU', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `hb_wx_user` VALUES ('29469', '', '', '0.00', '0.00', '2splhcuvlPgfhxXQ5tR2Fg==', '', 'o26k243_DMfB8FFBDzzyiV8c7o9w', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '0', '1', '0', '0');
