/*
Navicat MySQL Data Transfer

Source Server         : 以太币
Source Server Version : 50505
Source Host           : 120.79.84.116:3306
Source Database       : yitaibi

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-09-26 14:15:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for jb_activity
-- ----------------------------
DROP TABLE IF EXISTS `jb_activity`;
CREATE TABLE `jb_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `a_name` varchar(255) DEFAULT '' COMMENT '活动名称',
  `stime` int(11) unsigned DEFAULT NULL COMMENT '活动开始时间',
  `etime` int(11) unsigned DEFAULT NULL COMMENT '活动结束时间',
  `add_time` int(11) unsigned DEFAULT NULL COMMENT '添加时间',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '0结束1开始',
  `eth` float(30,2) unsigned DEFAULT '0.00' COMMENT '奖池金额 ',
  `is_del` tinyint(1) unsigned DEFAULT '0' COMMENT '0未删除1删除',
  `reveive_num` int(10) unsigned DEFAULT NULL COMMENT '活动限制的复活次数',
  `accounts` tinyint(1) unsigned DEFAULT '0' COMMENT '0没有结算1结算',
  `msg` varchar(255) DEFAULT NULL COMMENT '结算提示语',
  `time` int(11) unsigned DEFAULT NULL COMMENT '结算时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of jb_activity
-- ----------------------------

-- ----------------------------
-- Table structure for jb_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `jb_admin_menu`;
CREATE TABLE `jb_admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父菜单id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '菜单类型;1:有界面可访问菜单,2:无界面可访问菜单,0:只作为菜单',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;1:显示,0:不显示',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `app` varchar(40) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '应用名',
  `controller` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '控制器名',
  `action` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '操作名称',
  `param` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '额外参数',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `icon` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '菜单图标',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parent_id` (`parent_id`),
  KEY `controller` (`controller`)
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=utf8mb4 COMMENT='后台菜单表';

-- ----------------------------
-- Records of jb_admin_menu
-- ----------------------------
INSERT INTO `jb_admin_menu` VALUES ('1', '0', '0', '0', '20', 'admin', 'Plugin', 'default', '', '插件中心', 'cloud', '插件中心');
INSERT INTO `jb_admin_menu` VALUES ('2', '1', '1', '1', '10000', 'admin', 'Hook', 'index', '', '钩子管理', '', '钩子管理');
INSERT INTO `jb_admin_menu` VALUES ('3', '2', '1', '0', '10000', 'admin', 'Hook', 'plugins', '', '钩子插件管理', '', '钩子插件管理');
INSERT INTO `jb_admin_menu` VALUES ('4', '2', '2', '0', '10000', 'admin', 'Hook', 'pluginListOrder', '', '钩子插件排序', '', '钩子插件排序');
INSERT INTO `jb_admin_menu` VALUES ('5', '2', '1', '0', '10000', 'admin', 'Hook', 'sync', '', '同步钩子', '', '同步钩子');
INSERT INTO `jb_admin_menu` VALUES ('6', '0', '0', '0', '0', 'admin', 'Setting', 'default', '', '设置', 'cogs', '系统设置入口');
INSERT INTO `jb_admin_menu` VALUES ('7', '6', '1', '1', '50', 'admin', 'Link', 'index', '', '友情链接', '', '友情链接管理');
INSERT INTO `jb_admin_menu` VALUES ('8', '7', '1', '0', '10000', 'admin', 'Link', 'add', '', '添加友情链接', '', '添加友情链接');
INSERT INTO `jb_admin_menu` VALUES ('9', '7', '2', '0', '10000', 'admin', 'Link', 'addPost', '', '添加友情链接提交保存', '', '添加友情链接提交保存');
INSERT INTO `jb_admin_menu` VALUES ('10', '7', '1', '0', '10000', 'admin', 'Link', 'edit', '', '编辑友情链接', '', '编辑友情链接');
INSERT INTO `jb_admin_menu` VALUES ('11', '7', '2', '0', '10000', 'admin', 'Link', 'editPost', '', '编辑友情链接提交保存', '', '编辑友情链接提交保存');
INSERT INTO `jb_admin_menu` VALUES ('12', '7', '2', '0', '10000', 'admin', 'Link', 'delete', '', '删除友情链接', '', '删除友情链接');
INSERT INTO `jb_admin_menu` VALUES ('13', '7', '2', '0', '10000', 'admin', 'Link', 'listOrder', '', '友情链接排序', '', '友情链接排序');
INSERT INTO `jb_admin_menu` VALUES ('14', '7', '2', '0', '10000', 'admin', 'Link', 'toggle', '', '友情链接显示隐藏', '', '友情链接显示隐藏');
INSERT INTO `jb_admin_menu` VALUES ('15', '6', '1', '1', '10', 'admin', 'Mailer', 'index', '', '邮箱配置', '', '邮箱配置');
INSERT INTO `jb_admin_menu` VALUES ('16', '15', '2', '0', '10000', 'admin', 'Mailer', 'indexPost', '', '邮箱配置提交保存', '', '邮箱配置提交保存');
INSERT INTO `jb_admin_menu` VALUES ('17', '15', '1', '0', '10000', 'admin', 'Mailer', 'template', '', '邮件模板', '', '邮件模板');
INSERT INTO `jb_admin_menu` VALUES ('18', '15', '2', '0', '10000', 'admin', 'Mailer', 'templatePost', '', '邮件模板提交', '', '邮件模板提交');
INSERT INTO `jb_admin_menu` VALUES ('19', '15', '1', '0', '10000', 'admin', 'Mailer', 'test', '', '邮件发送测试', '', '邮件发送测试');
INSERT INTO `jb_admin_menu` VALUES ('20', '6', '1', '1', '10000', 'admin', 'Menu', 'index', '', '后台菜单', '', '后台菜单管理');
INSERT INTO `jb_admin_menu` VALUES ('21', '20', '1', '0', '10000', 'admin', 'Menu', 'lists', '', '所有菜单', '', '后台所有菜单列表');
INSERT INTO `jb_admin_menu` VALUES ('22', '20', '1', '0', '10000', 'admin', 'Menu', 'add', '', '后台菜单添加', '', '后台菜单添加');
INSERT INTO `jb_admin_menu` VALUES ('23', '20', '2', '0', '10000', 'admin', 'Menu', 'addPost', '', '后台菜单添加提交保存', '', '后台菜单添加提交保存');
INSERT INTO `jb_admin_menu` VALUES ('24', '20', '1', '0', '10000', 'admin', 'Menu', 'edit', '', '后台菜单编辑', '', '后台菜单编辑');
INSERT INTO `jb_admin_menu` VALUES ('25', '20', '2', '0', '10000', 'admin', 'Menu', 'editPost', '', '后台菜单编辑提交保存', '', '后台菜单编辑提交保存');
INSERT INTO `jb_admin_menu` VALUES ('26', '20', '2', '0', '10000', 'admin', 'Menu', 'delete', '', '后台菜单删除', '', '后台菜单删除');
INSERT INTO `jb_admin_menu` VALUES ('27', '20', '2', '0', '10000', 'admin', 'Menu', 'listOrder', '', '后台菜单排序', '', '后台菜单排序');
INSERT INTO `jb_admin_menu` VALUES ('28', '20', '1', '0', '10000', 'admin', 'Menu', 'getActions', '', '导入新后台菜单', '', '导入新后台菜单');
INSERT INTO `jb_admin_menu` VALUES ('29', '6', '1', '1', '30', 'admin', 'Nav', 'index', '', '导航管理', '', '导航管理');
INSERT INTO `jb_admin_menu` VALUES ('30', '29', '1', '0', '10000', 'admin', 'Nav', 'add', '', '添加导航', '', '添加导航');
INSERT INTO `jb_admin_menu` VALUES ('31', '29', '2', '0', '10000', 'admin', 'Nav', 'addPost', '', '添加导航提交保存', '', '添加导航提交保存');
INSERT INTO `jb_admin_menu` VALUES ('32', '29', '1', '0', '10000', 'admin', 'Nav', 'edit', '', '编辑导航', '', '编辑导航');
INSERT INTO `jb_admin_menu` VALUES ('33', '29', '2', '0', '10000', 'admin', 'Nav', 'editPost', '', '编辑导航提交保存', '', '编辑导航提交保存');
INSERT INTO `jb_admin_menu` VALUES ('34', '29', '2', '0', '10000', 'admin', 'Nav', 'delete', '', '删除导航', '', '删除导航');
INSERT INTO `jb_admin_menu` VALUES ('35', '29', '1', '0', '10000', 'admin', 'NavMenu', 'index', '', '导航菜单', '', '导航菜单');
INSERT INTO `jb_admin_menu` VALUES ('36', '35', '1', '0', '10000', 'admin', 'NavMenu', 'add', '', '添加导航菜单', '', '添加导航菜单');
INSERT INTO `jb_admin_menu` VALUES ('37', '35', '2', '0', '10000', 'admin', 'NavMenu', 'addPost', '', '添加导航菜单提交保存', '', '添加导航菜单提交保存');
INSERT INTO `jb_admin_menu` VALUES ('38', '35', '1', '0', '10000', 'admin', 'NavMenu', 'edit', '', '编辑导航菜单', '', '编辑导航菜单');
INSERT INTO `jb_admin_menu` VALUES ('39', '35', '2', '0', '10000', 'admin', 'NavMenu', 'editPost', '', '编辑导航菜单提交保存', '', '编辑导航菜单提交保存');
INSERT INTO `jb_admin_menu` VALUES ('40', '35', '2', '0', '10000', 'admin', 'NavMenu', 'delete', '', '删除导航菜单', '', '删除导航菜单');
INSERT INTO `jb_admin_menu` VALUES ('41', '35', '2', '0', '10000', 'admin', 'NavMenu', 'listOrder', '', '导航菜单排序', '', '导航菜单排序');
INSERT INTO `jb_admin_menu` VALUES ('42', '1', '1', '1', '10000', 'admin', 'Plugin', 'index', '', '插件列表', '', '插件列表');
INSERT INTO `jb_admin_menu` VALUES ('43', '42', '2', '0', '10000', 'admin', 'Plugin', 'toggle', '', '插件启用禁用', '', '插件启用禁用');
INSERT INTO `jb_admin_menu` VALUES ('44', '42', '1', '0', '10000', 'admin', 'Plugin', 'setting', '', '插件设置', '', '插件设置');
INSERT INTO `jb_admin_menu` VALUES ('45', '42', '2', '0', '10000', 'admin', 'Plugin', 'settingPost', '', '插件设置提交', '', '插件设置提交');
INSERT INTO `jb_admin_menu` VALUES ('46', '42', '2', '0', '10000', 'admin', 'Plugin', 'install', '', '插件安装', '', '插件安装');
INSERT INTO `jb_admin_menu` VALUES ('47', '42', '2', '0', '10000', 'admin', 'Plugin', 'update', '', '插件更新', '', '插件更新');
INSERT INTO `jb_admin_menu` VALUES ('48', '42', '2', '0', '10000', 'admin', 'Plugin', 'uninstall', '', '卸载插件', '', '卸载插件');
INSERT INTO `jb_admin_menu` VALUES ('49', '109', '0', '1', '10000', 'admin', 'User', 'default', '', '门店账号管理', '', '管理组');
INSERT INTO `jb_admin_menu` VALUES ('50', '49', '1', '1', '10000', 'admin', 'Rbac', 'index', '', '权限设置', '', '角色管理');
INSERT INTO `jb_admin_menu` VALUES ('51', '50', '1', '0', '10000', 'admin', 'Rbac', 'roleAdd', '', '添加角色', '', '添加角色');
INSERT INTO `jb_admin_menu` VALUES ('52', '50', '2', '0', '10000', 'admin', 'Rbac', 'roleAddPost', '', '添加角色提交', '', '添加角色提交');
INSERT INTO `jb_admin_menu` VALUES ('53', '50', '1', '0', '10000', 'admin', 'Rbac', 'roleEdit', '', '编辑角色', '', '编辑角色');
INSERT INTO `jb_admin_menu` VALUES ('54', '50', '2', '0', '10000', 'admin', 'Rbac', 'roleEditPost', '', '编辑角色提交', '', '编辑角色提交');
INSERT INTO `jb_admin_menu` VALUES ('55', '50', '2', '0', '10000', 'admin', 'Rbac', 'roleDelete', '', '删除角色', '', '删除角色');
INSERT INTO `jb_admin_menu` VALUES ('56', '50', '1', '0', '10000', 'admin', 'Rbac', 'authorize', '', '设置角色权限', '', '设置角色权限');
INSERT INTO `jb_admin_menu` VALUES ('57', '50', '2', '0', '10000', 'admin', 'Rbac', 'authorizePost', '', '角色授权提交', '', '角色授权提交');
INSERT INTO `jb_admin_menu` VALUES ('58', '0', '1', '0', '10000', 'admin', 'RecycleBin', 'index', '', '回收站', '', '回收站');
INSERT INTO `jb_admin_menu` VALUES ('59', '58', '2', '0', '10000', 'admin', 'RecycleBin', 'restore', '', '回收站还原', '', '回收站还原');
INSERT INTO `jb_admin_menu` VALUES ('60', '58', '2', '0', '10000', 'admin', 'RecycleBin', 'delete', '', '回收站彻底删除', '', '回收站彻底删除');
INSERT INTO `jb_admin_menu` VALUES ('61', '6', '1', '1', '10000', 'admin', 'Route', 'index', '', 'URL美化', '', 'URL规则管理');
INSERT INTO `jb_admin_menu` VALUES ('62', '61', '1', '0', '10000', 'admin', 'Route', 'add', '', '添加路由规则', '', '添加路由规则');
INSERT INTO `jb_admin_menu` VALUES ('63', '61', '2', '0', '10000', 'admin', 'Route', 'addPost', '', '添加路由规则提交', '', '添加路由规则提交');
INSERT INTO `jb_admin_menu` VALUES ('64', '61', '1', '0', '10000', 'admin', 'Route', 'edit', '', '路由规则编辑', '', '路由规则编辑');
INSERT INTO `jb_admin_menu` VALUES ('65', '61', '2', '0', '10000', 'admin', 'Route', 'editPost', '', '路由规则编辑提交', '', '路由规则编辑提交');
INSERT INTO `jb_admin_menu` VALUES ('66', '61', '2', '0', '10000', 'admin', 'Route', 'delete', '', '路由规则删除', '', '路由规则删除');
INSERT INTO `jb_admin_menu` VALUES ('67', '61', '2', '0', '10000', 'admin', 'Route', 'ban', '', '路由规则禁用', '', '路由规则禁用');
INSERT INTO `jb_admin_menu` VALUES ('68', '61', '2', '0', '10000', 'admin', 'Route', 'open', '', '路由规则启用', '', '路由规则启用');
INSERT INTO `jb_admin_menu` VALUES ('69', '61', '2', '0', '10000', 'admin', 'Route', 'listOrder', '', '路由规则排序', '', '路由规则排序');
INSERT INTO `jb_admin_menu` VALUES ('70', '61', '1', '0', '10000', 'admin', 'Route', 'select', '', '选择URL', '', '选择URL');
INSERT INTO `jb_admin_menu` VALUES ('71', '6', '1', '1', '0', 'admin', 'Setting', 'site', '', '网站信息', '', '网站信息');
INSERT INTO `jb_admin_menu` VALUES ('72', '71', '2', '0', '10000', 'admin', 'Setting', 'sitePost', '', '网站信息设置提交', '', '网站信息设置提交');
INSERT INTO `jb_admin_menu` VALUES ('73', '6', '1', '0', '10000', 'admin', 'Setting', 'password', '', '密码修改', '', '密码修改');
INSERT INTO `jb_admin_menu` VALUES ('74', '73', '2', '0', '10000', 'admin', 'Setting', 'passwordPost', '', '密码修改提交', '', '密码修改提交');
INSERT INTO `jb_admin_menu` VALUES ('75', '6', '1', '1', '10000', 'admin', 'Setting', 'upload', '', '上传设置', '', '上传设置');
INSERT INTO `jb_admin_menu` VALUES ('76', '75', '2', '0', '10000', 'admin', 'Setting', 'uploadPost', '', '上传设置提交', '', '上传设置提交');
INSERT INTO `jb_admin_menu` VALUES ('77', '6', '1', '0', '10000', 'admin', 'Setting', 'clearCache', '', '清除缓存', '', '清除缓存');
INSERT INTO `jb_admin_menu` VALUES ('78', '6', '1', '1', '40', 'admin', 'Slide', 'index', '', '幻灯片管理', '', '幻灯片管理');
INSERT INTO `jb_admin_menu` VALUES ('79', '78', '1', '0', '10000', 'admin', 'Slide', 'add', '', '添加幻灯片', '', '添加幻灯片');
INSERT INTO `jb_admin_menu` VALUES ('80', '78', '2', '0', '10000', 'admin', 'Slide', 'addPost', '', '添加幻灯片提交', '', '添加幻灯片提交');
INSERT INTO `jb_admin_menu` VALUES ('81', '78', '1', '0', '10000', 'admin', 'Slide', 'edit', '', '编辑幻灯片', '', '编辑幻灯片');
INSERT INTO `jb_admin_menu` VALUES ('82', '78', '2', '0', '10000', 'admin', 'Slide', 'editPost', '', '编辑幻灯片提交', '', '编辑幻灯片提交');
INSERT INTO `jb_admin_menu` VALUES ('83', '78', '2', '0', '10000', 'admin', 'Slide', 'delete', '', '删除幻灯片', '', '删除幻灯片');
INSERT INTO `jb_admin_menu` VALUES ('84', '78', '1', '0', '10000', 'admin', 'SlideItem', 'index', '', '幻灯片页面列表', '', '幻灯片页面列表');
INSERT INTO `jb_admin_menu` VALUES ('85', '84', '1', '0', '10000', 'admin', 'SlideItem', 'add', '', '幻灯片页面添加', '', '幻灯片页面添加');
INSERT INTO `jb_admin_menu` VALUES ('86', '84', '2', '0', '10000', 'admin', 'SlideItem', 'addPost', '', '幻灯片页面添加提交', '', '幻灯片页面添加提交');
INSERT INTO `jb_admin_menu` VALUES ('87', '84', '1', '0', '10000', 'admin', 'SlideItem', 'edit', '', '幻灯片页面编辑', '', '幻灯片页面编辑');
INSERT INTO `jb_admin_menu` VALUES ('88', '84', '2', '0', '10000', 'admin', 'SlideItem', 'editPost', '', '幻灯片页面编辑提交', '', '幻灯片页面编辑提交');
INSERT INTO `jb_admin_menu` VALUES ('89', '84', '2', '0', '10000', 'admin', 'SlideItem', 'delete', '', '幻灯片页面删除', '', '幻灯片页面删除');
INSERT INTO `jb_admin_menu` VALUES ('90', '84', '2', '0', '10000', 'admin', 'SlideItem', 'ban', '', '幻灯片页面隐藏', '', '幻灯片页面隐藏');
INSERT INTO `jb_admin_menu` VALUES ('91', '84', '2', '0', '10000', 'admin', 'SlideItem', 'cancelBan', '', '幻灯片页面显示', '', '幻灯片页面显示');
INSERT INTO `jb_admin_menu` VALUES ('92', '84', '2', '0', '10000', 'admin', 'SlideItem', 'listOrder', '', '幻灯片页面排序', '', '幻灯片页面排序');
INSERT INTO `jb_admin_menu` VALUES ('93', '6', '1', '1', '10000', 'admin', 'Storage', 'index', '', '文件存储', '', '文件存储');
INSERT INTO `jb_admin_menu` VALUES ('94', '93', '2', '0', '10000', 'admin', 'Storage', 'settingPost', '', '文件存储设置提交', '', '文件存储设置提交');
INSERT INTO `jb_admin_menu` VALUES ('95', '6', '1', '1', '20', 'admin', 'Theme', 'index', '', '模板管理', '', '模板管理');
INSERT INTO `jb_admin_menu` VALUES ('96', '95', '1', '0', '10000', 'admin', 'Theme', 'install', '', '安装模板', '', '安装模板');
INSERT INTO `jb_admin_menu` VALUES ('97', '95', '2', '0', '10000', 'admin', 'Theme', 'uninstall', '', '卸载模板', '', '卸载模板');
INSERT INTO `jb_admin_menu` VALUES ('98', '95', '2', '0', '10000', 'admin', 'Theme', 'installTheme', '', '模板安装', '', '模板安装');
INSERT INTO `jb_admin_menu` VALUES ('99', '95', '2', '0', '10000', 'admin', 'Theme', 'update', '', '模板更新', '', '模板更新');
INSERT INTO `jb_admin_menu` VALUES ('100', '95', '2', '0', '10000', 'admin', 'Theme', 'active', '', '启用模板', '', '启用模板');
INSERT INTO `jb_admin_menu` VALUES ('101', '95', '1', '0', '10000', 'admin', 'Theme', 'files', '', '模板文件列表', '', '启用模板');
INSERT INTO `jb_admin_menu` VALUES ('102', '95', '1', '0', '10000', 'admin', 'Theme', 'fileSetting', '', '模板文件设置', '', '模板文件设置');
INSERT INTO `jb_admin_menu` VALUES ('103', '95', '1', '0', '10000', 'admin', 'Theme', 'fileArrayData', '', '模板文件数组数据列表', '', '模板文件数组数据列表');
INSERT INTO `jb_admin_menu` VALUES ('104', '95', '2', '0', '10000', 'admin', 'Theme', 'fileArrayDataEdit', '', '模板文件数组数据添加编辑', '', '模板文件数组数据添加编辑');
INSERT INTO `jb_admin_menu` VALUES ('105', '95', '2', '0', '10000', 'admin', 'Theme', 'fileArrayDataEditPost', '', '模板文件数组数据添加编辑提交保存', '', '模板文件数组数据添加编辑提交保存');
INSERT INTO `jb_admin_menu` VALUES ('106', '95', '2', '0', '10000', 'admin', 'Theme', 'fileArrayDataDelete', '', '模板文件数组数据删除', '', '模板文件数组数据删除');
INSERT INTO `jb_admin_menu` VALUES ('107', '95', '2', '0', '10000', 'admin', 'Theme', 'settingPost', '', '模板文件编辑提交保存', '', '模板文件编辑提交保存');
INSERT INTO `jb_admin_menu` VALUES ('108', '95', '1', '0', '10000', 'admin', 'Theme', 'dataSource', '', '模板文件设置数据源', '', '模板文件设置数据源');
INSERT INTO `jb_admin_menu` VALUES ('109', '0', '0', '0', '10', 'user', 'AdminIndex', 'default', '', '门店管理', 'group', '用户管理');
INSERT INTO `jb_admin_menu` VALUES ('110', '49', '1', '1', '10000', 'admin', 'User', 'index', '', '门店账号列表', '', '管理员管理');
INSERT INTO `jb_admin_menu` VALUES ('111', '110', '1', '0', '10000', 'admin', 'User', 'add', '', '管理员添加', '', '管理员添加');
INSERT INTO `jb_admin_menu` VALUES ('112', '110', '2', '0', '10000', 'admin', 'User', 'addPost', '', '管理员添加提交', '', '管理员添加提交');
INSERT INTO `jb_admin_menu` VALUES ('113', '110', '1', '0', '10000', 'admin', 'User', 'edit', '', '管理员编辑', '', '管理员编辑');
INSERT INTO `jb_admin_menu` VALUES ('114', '110', '2', '0', '10000', 'admin', 'User', 'editPost', '', '管理员编辑提交', '', '管理员编辑提交');
INSERT INTO `jb_admin_menu` VALUES ('115', '110', '1', '0', '10000', 'admin', 'User', 'userInfo', '', '个人信息', '', '管理员个人信息修改');
INSERT INTO `jb_admin_menu` VALUES ('116', '110', '2', '0', '10000', 'admin', 'User', 'userInfoPost', '', '管理员个人信息修改提交', '', '管理员个人信息修改提交');
INSERT INTO `jb_admin_menu` VALUES ('117', '110', '2', '0', '10000', 'admin', 'User', 'delete', '', '管理员删除', '', '管理员删除');
INSERT INTO `jb_admin_menu` VALUES ('118', '110', '2', '0', '10000', 'admin', 'User', 'ban', '', '停用管理员', '', '停用管理员');
INSERT INTO `jb_admin_menu` VALUES ('119', '110', '2', '0', '10000', 'admin', 'User', 'cancelBan', '', '启用管理员', '', '启用管理员');
INSERT INTO `jb_admin_menu` VALUES ('120', '0', '0', '0', '30', 'portal', 'AdminIndex', 'default', '', '门户管理', 'th', '门户管理');
INSERT INTO `jb_admin_menu` VALUES ('121', '120', '1', '1', '10000', 'portal', 'AdminArticle', 'index', '', '文章管理', '', '文章列表');
INSERT INTO `jb_admin_menu` VALUES ('122', '121', '1', '0', '10000', 'portal', 'AdminArticle', 'add', '', '添加文章', '', '添加文章');
INSERT INTO `jb_admin_menu` VALUES ('123', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'addPost', '', '添加文章提交', '', '添加文章提交');
INSERT INTO `jb_admin_menu` VALUES ('124', '121', '1', '0', '10000', 'portal', 'AdminArticle', 'edit', '', '编辑文章', '', '编辑文章');
INSERT INTO `jb_admin_menu` VALUES ('125', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'editPost', '', '编辑文章提交', '', '编辑文章提交');
INSERT INTO `jb_admin_menu` VALUES ('126', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'delete', '', '文章删除', '', '文章删除');
INSERT INTO `jb_admin_menu` VALUES ('127', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'publish', '', '文章发布', '', '文章发布');
INSERT INTO `jb_admin_menu` VALUES ('128', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'top', '', '文章置顶', '', '文章置顶');
INSERT INTO `jb_admin_menu` VALUES ('129', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'recommend', '', '文章推荐', '', '文章推荐');
INSERT INTO `jb_admin_menu` VALUES ('130', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'listOrder', '', '文章排序', '', '文章排序');
INSERT INTO `jb_admin_menu` VALUES ('131', '120', '1', '1', '10000', 'portal', 'AdminCategory', 'index', '', '分类管理', '', '文章分类列表');
INSERT INTO `jb_admin_menu` VALUES ('132', '131', '1', '0', '10000', 'portal', 'AdminCategory', 'add', '', '添加文章分类', '', '添加文章分类');
INSERT INTO `jb_admin_menu` VALUES ('133', '131', '2', '0', '10000', 'portal', 'AdminCategory', 'addPost', '', '添加文章分类提交', '', '添加文章分类提交');
INSERT INTO `jb_admin_menu` VALUES ('134', '131', '1', '0', '10000', 'portal', 'AdminCategory', 'edit', '', '编辑文章分类', '', '编辑文章分类');
INSERT INTO `jb_admin_menu` VALUES ('135', '131', '2', '0', '10000', 'portal', 'AdminCategory', 'editPost', '', '编辑文章分类提交', '', '编辑文章分类提交');
INSERT INTO `jb_admin_menu` VALUES ('136', '131', '1', '0', '10000', 'portal', 'AdminCategory', 'select', '', '文章分类选择对话框', '', '文章分类选择对话框');
INSERT INTO `jb_admin_menu` VALUES ('137', '131', '2', '0', '10000', 'portal', 'AdminCategory', 'listOrder', '', '文章分类排序', '', '文章分类排序');
INSERT INTO `jb_admin_menu` VALUES ('138', '131', '2', '0', '10000', 'portal', 'AdminCategory', 'delete', '', '删除文章分类', '', '删除文章分类');
INSERT INTO `jb_admin_menu` VALUES ('139', '120', '1', '1', '10000', 'portal', 'AdminPage', 'index', '', '页面管理', '', '页面管理');
INSERT INTO `jb_admin_menu` VALUES ('140', '139', '1', '0', '10000', 'portal', 'AdminPage', 'add', '', '添加页面', '', '添加页面');
INSERT INTO `jb_admin_menu` VALUES ('141', '139', '2', '0', '10000', 'portal', 'AdminPage', 'addPost', '', '添加页面提交', '', '添加页面提交');
INSERT INTO `jb_admin_menu` VALUES ('142', '139', '1', '0', '10000', 'portal', 'AdminPage', 'edit', '', '编辑页面', '', '编辑页面');
INSERT INTO `jb_admin_menu` VALUES ('143', '139', '2', '0', '10000', 'portal', 'AdminPage', 'editPost', '', '编辑页面提交', '', '编辑页面提交');
INSERT INTO `jb_admin_menu` VALUES ('144', '139', '2', '0', '10000', 'portal', 'AdminPage', 'delete', '', '删除页面', '', '删除页面');
INSERT INTO `jb_admin_menu` VALUES ('145', '120', '1', '1', '10000', 'portal', 'AdminTag', 'index', '', '文章标签', '', '文章标签');
INSERT INTO `jb_admin_menu` VALUES ('146', '145', '1', '0', '10000', 'portal', 'AdminTag', 'add', '', '添加文章标签', '', '添加文章标签');
INSERT INTO `jb_admin_menu` VALUES ('147', '145', '2', '0', '10000', 'portal', 'AdminTag', 'addPost', '', '添加文章标签提交', '', '添加文章标签提交');
INSERT INTO `jb_admin_menu` VALUES ('148', '145', '2', '0', '10000', 'portal', 'AdminTag', 'upStatus', '', '更新标签状态', '', '更新标签状态');
INSERT INTO `jb_admin_menu` VALUES ('149', '145', '2', '0', '10000', 'portal', 'AdminTag', 'delete', '', '删除文章标签', '', '删除文章标签');
INSERT INTO `jb_admin_menu` VALUES ('150', '0', '1', '0', '10000', 'user', 'AdminAsset', 'index', '', '资源管理', 'file', '资源管理列表');
INSERT INTO `jb_admin_menu` VALUES ('151', '150', '2', '0', '10000', 'user', 'AdminAsset', 'delete', '', '删除文件', '', '删除文件');
INSERT INTO `jb_admin_menu` VALUES ('152', '0', '0', '0', '10000', 'user', 'AdminIndex', 'default1', '', '用户管理', '', '用户组');
INSERT INTO `jb_admin_menu` VALUES ('153', '152', '1', '0', '10000', 'user', 'AdminIndex', 'index', '', '本站用户', '', '本站用户');
INSERT INTO `jb_admin_menu` VALUES ('154', '153', '2', '0', '10000', 'user', 'AdminIndex', 'ban', '', '本站用户拉黑', '', '本站用户拉黑');
INSERT INTO `jb_admin_menu` VALUES ('155', '153', '2', '0', '10000', 'user', 'AdminIndex', 'cancelBan', '', '本站用户启用', '', '本站用户启用');
INSERT INTO `jb_admin_menu` VALUES ('156', '152', '1', '1', '10000', 'user', 'AdminOauth', 'index', '', '小程序用户', '', '第三方用户');
INSERT INTO `jb_admin_menu` VALUES ('157', '156', '2', '0', '10000', 'user', 'AdminOauth', 'delete', '', '删除第三方用户绑定', '', '删除第三方用户绑定');
INSERT INTO `jb_admin_menu` VALUES ('158', '6', '1', '1', '10000', 'user', 'AdminUserAction', 'index', '', '用户操作管理', '', '用户操作管理');
INSERT INTO `jb_admin_menu` VALUES ('159', '158', '1', '0', '10000', 'user', 'AdminUserAction', 'edit', '', '编辑用户操作', '', '编辑用户操作');
INSERT INTO `jb_admin_menu` VALUES ('160', '158', '2', '0', '10000', 'user', 'AdminUserAction', 'editPost', '', '编辑用户操作提交', '', '编辑用户操作提交');
INSERT INTO `jb_admin_menu` VALUES ('161', '158', '1', '0', '10000', 'user', 'AdminUserAction', 'sync', '', '同步用户操作', '', '同步用户操作');
INSERT INTO `jb_admin_menu` VALUES ('162', '0', '1', '1', '10000', 'admin', 'admin', 'index', '', '订单列表', '', '');
INSERT INTO `jb_admin_menu` VALUES ('163', '1', '1', '1', '10000', 'plugin/Wxapp', 'AdminIndex', 'index', '', '小程序管理', '', '小程序管理');
INSERT INTO `jb_admin_menu` VALUES ('164', '163', '1', '0', '10000', 'plugin/Wxapp', 'AdminWxapp', 'add', '', '添加小程序', '', '添加小程序');
INSERT INTO `jb_admin_menu` VALUES ('165', '163', '2', '0', '10000', 'plugin/Wxapp', 'AdminWxapp', 'addPost', '', '添加小程序提交保存', '', '添加小程序提交保存');
INSERT INTO `jb_admin_menu` VALUES ('166', '163', '1', '0', '10000', 'plugin/Wxapp', 'AdminWxapp', 'edit', '', '编辑小程序', '', '编辑小程序');
INSERT INTO `jb_admin_menu` VALUES ('167', '163', '2', '0', '10000', 'plugin/Wxapp', 'AdminWxapp', 'editPost', '', '编辑小程序提交保存', '', '编辑小程序');
INSERT INTO `jb_admin_menu` VALUES ('168', '163', '2', '0', '10000', 'plugin/Wxapp', 'AdminWxapp', 'delete', '', '删除小程序', '', '删除小程序');
INSERT INTO `jb_admin_menu` VALUES ('169', '0', '1', '1', '10000', 'admin', 'Questions', 'defeault', '', '题库管理', 'quora', '');
INSERT INTO `jb_admin_menu` VALUES ('170', '0', '1', '1', '10000', 'admin', 'Activity', 'index', '', '活动列表', 'handshake-o', '');
INSERT INTO `jb_admin_menu` VALUES ('173', '0', '1', '1', '10000', 'admin', 'Register', 'index', '', '用户列表', '', '');
INSERT INTO `jb_admin_menu` VALUES ('174', '0', '1', '0', '10000', 'admin', 'Remark', 'index', '', '邀请码', 'address-book-o', '');
INSERT INTO `jb_admin_menu` VALUES ('176', '0', '1', '0', '10000', 'admin', 'Accusationlist', 'index', '', '举报列表', 'window-close', '');
INSERT INTO `jb_admin_menu` VALUES ('177', '169', '1', '1', '10000', 'admin', 'Questions', 'index', '', '题库列表', '', '');
INSERT INTO `jb_admin_menu` VALUES ('178', '169', '1', '0', '10000', 'admin', 'Questions', 'import', '', '题库导入', '', '');
INSERT INTO `jb_admin_menu` VALUES ('179', '0', '1', '1', '10000', 'admin', 'Challenge', 'index', '', '挑战列表', 'gamepad', '');
INSERT INTO `jb_admin_menu` VALUES ('180', '162', '1', '1', '10000', 'admin', 'admin', 'forward', '', '提现列表', '', '');
INSERT INTO `jb_admin_menu` VALUES ('181', '162', '1', '1', '10000', 'admin', 'admin', 'recharge', '', '充值列表', '', '');

-- ----------------------------
-- Table structure for jb_asset
-- ----------------------------
DROP TABLE IF EXISTS `jb_asset`;
CREATE TABLE `jb_asset` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `file_size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小,单位B',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:可用,0:不可用',
  `download_times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `file_key` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件惟一码',
  `filename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `file_path` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件路径,相对于upload目录,可以为url',
  `file_md5` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件md5值',
  `file_sha1` varchar(40) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `suffix` varchar(10) NOT NULL DEFAULT '' COMMENT '文件后缀名,不包括点',
  `more` text COMMENT '其它详细信息,JSON格式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='资源表';

-- ----------------------------
-- Records of jb_asset
-- ----------------------------

-- ----------------------------
-- Table structure for jb_auth_access
-- ----------------------------
DROP TABLE IF EXISTS `jb_auth_access`;
CREATE TABLE `jb_auth_access` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类,请加应用前缀,如admin_',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限授权表';

-- ----------------------------
-- Records of jb_auth_access
-- ----------------------------

-- ----------------------------
-- Table structure for jb_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `jb_auth_rule`;
CREATE TABLE `jb_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `app` varchar(15) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(100) NOT NULL DEFAULT '' COMMENT '额外url参数',
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '规则描述',
  `condition` varchar(200) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `module` (`app`,`status`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=utf8mb4 COMMENT='权限规则表';

-- ----------------------------
-- Records of jb_auth_rule
-- ----------------------------
INSERT INTO `jb_auth_rule` VALUES ('1', '1', 'admin', 'admin_url', 'admin/Hook/index', '', '钩子管理', '');
INSERT INTO `jb_auth_rule` VALUES ('2', '1', 'admin', 'admin_url', 'admin/Hook/plugins', '', '钩子插件管理', '');
INSERT INTO `jb_auth_rule` VALUES ('3', '1', 'admin', 'admin_url', 'admin/Hook/pluginListOrder', '', '钩子插件排序', '');
INSERT INTO `jb_auth_rule` VALUES ('4', '1', 'admin', 'admin_url', 'admin/Hook/sync', '', '同步钩子', '');
INSERT INTO `jb_auth_rule` VALUES ('5', '1', 'admin', 'admin_url', 'admin/Link/index', '', '友情链接', '');
INSERT INTO `jb_auth_rule` VALUES ('6', '1', 'admin', 'admin_url', 'admin/Link/add', '', '添加友情链接', '');
INSERT INTO `jb_auth_rule` VALUES ('7', '1', 'admin', 'admin_url', 'admin/Link/addPost', '', '添加友情链接提交保存', '');
INSERT INTO `jb_auth_rule` VALUES ('8', '1', 'admin', 'admin_url', 'admin/Link/edit', '', '编辑友情链接', '');
INSERT INTO `jb_auth_rule` VALUES ('9', '1', 'admin', 'admin_url', 'admin/Link/editPost', '', '编辑友情链接提交保存', '');
INSERT INTO `jb_auth_rule` VALUES ('10', '1', 'admin', 'admin_url', 'admin/Link/delete', '', '删除友情链接', '');
INSERT INTO `jb_auth_rule` VALUES ('11', '1', 'admin', 'admin_url', 'admin/Link/listOrder', '', '友情链接排序', '');
INSERT INTO `jb_auth_rule` VALUES ('12', '1', 'admin', 'admin_url', 'admin/Link/toggle', '', '友情链接显示隐藏', '');
INSERT INTO `jb_auth_rule` VALUES ('13', '1', 'admin', 'admin_url', 'admin/Mailer/index', '', '邮箱配置', '');
INSERT INTO `jb_auth_rule` VALUES ('14', '1', 'admin', 'admin_url', 'admin/Mailer/indexPost', '', '邮箱配置提交保存', '');
INSERT INTO `jb_auth_rule` VALUES ('15', '1', 'admin', 'admin_url', 'admin/Mailer/template', '', '邮件模板', '');
INSERT INTO `jb_auth_rule` VALUES ('16', '1', 'admin', 'admin_url', 'admin/Mailer/templatePost', '', '邮件模板提交', '');
INSERT INTO `jb_auth_rule` VALUES ('17', '1', 'admin', 'admin_url', 'admin/Mailer/test', '', '邮件发送测试', '');
INSERT INTO `jb_auth_rule` VALUES ('18', '1', 'admin', 'admin_url', 'admin/Menu/index', '', '后台菜单', '');
INSERT INTO `jb_auth_rule` VALUES ('19', '1', 'admin', 'admin_url', 'admin/Menu/lists', '', '所有菜单', '');
INSERT INTO `jb_auth_rule` VALUES ('20', '1', 'admin', 'admin_url', 'admin/Menu/add', '', '后台菜单添加', '');
INSERT INTO `jb_auth_rule` VALUES ('21', '1', 'admin', 'admin_url', 'admin/Menu/addPost', '', '后台菜单添加提交保存', '');
INSERT INTO `jb_auth_rule` VALUES ('22', '1', 'admin', 'admin_url', 'admin/Menu/edit', '', '后台菜单编辑', '');
INSERT INTO `jb_auth_rule` VALUES ('23', '1', 'admin', 'admin_url', 'admin/Menu/editPost', '', '后台菜单编辑提交保存', '');
INSERT INTO `jb_auth_rule` VALUES ('24', '1', 'admin', 'admin_url', 'admin/Menu/delete', '', '后台菜单删除', '');
INSERT INTO `jb_auth_rule` VALUES ('25', '1', 'admin', 'admin_url', 'admin/Menu/listOrder', '', '后台菜单排序', '');
INSERT INTO `jb_auth_rule` VALUES ('26', '1', 'admin', 'admin_url', 'admin/Menu/getActions', '', '导入新后台菜单', '');
INSERT INTO `jb_auth_rule` VALUES ('27', '1', 'admin', 'admin_url', 'admin/Nav/index', '', '导航管理', '');
INSERT INTO `jb_auth_rule` VALUES ('28', '1', 'admin', 'admin_url', 'admin/Nav/add', '', '添加导航', '');
INSERT INTO `jb_auth_rule` VALUES ('29', '1', 'admin', 'admin_url', 'admin/Nav/addPost', '', '添加导航提交保存', '');
INSERT INTO `jb_auth_rule` VALUES ('30', '1', 'admin', 'admin_url', 'admin/Nav/edit', '', '编辑导航', '');
INSERT INTO `jb_auth_rule` VALUES ('31', '1', 'admin', 'admin_url', 'admin/Nav/editPost', '', '编辑导航提交保存', '');
INSERT INTO `jb_auth_rule` VALUES ('32', '1', 'admin', 'admin_url', 'admin/Nav/delete', '', '删除导航', '');
INSERT INTO `jb_auth_rule` VALUES ('33', '1', 'admin', 'admin_url', 'admin/NavMenu/index', '', '导航菜单', '');
INSERT INTO `jb_auth_rule` VALUES ('34', '1', 'admin', 'admin_url', 'admin/NavMenu/add', '', '添加导航菜单', '');
INSERT INTO `jb_auth_rule` VALUES ('35', '1', 'admin', 'admin_url', 'admin/NavMenu/addPost', '', '添加导航菜单提交保存', '');
INSERT INTO `jb_auth_rule` VALUES ('36', '1', 'admin', 'admin_url', 'admin/NavMenu/edit', '', '编辑导航菜单', '');
INSERT INTO `jb_auth_rule` VALUES ('37', '1', 'admin', 'admin_url', 'admin/NavMenu/editPost', '', '编辑导航菜单提交保存', '');
INSERT INTO `jb_auth_rule` VALUES ('38', '1', 'admin', 'admin_url', 'admin/NavMenu/delete', '', '删除导航菜单', '');
INSERT INTO `jb_auth_rule` VALUES ('39', '1', 'admin', 'admin_url', 'admin/NavMenu/listOrder', '', '导航菜单排序', '');
INSERT INTO `jb_auth_rule` VALUES ('40', '1', 'admin', 'admin_url', 'admin/Plugin/default', '', '插件中心', '');
INSERT INTO `jb_auth_rule` VALUES ('41', '1', 'admin', 'admin_url', 'admin/Plugin/index', '', '插件列表', '');
INSERT INTO `jb_auth_rule` VALUES ('42', '1', 'admin', 'admin_url', 'admin/Plugin/toggle', '', '插件启用禁用', '');
INSERT INTO `jb_auth_rule` VALUES ('43', '1', 'admin', 'admin_url', 'admin/Plugin/setting', '', '插件设置', '');
INSERT INTO `jb_auth_rule` VALUES ('44', '1', 'admin', 'admin_url', 'admin/Plugin/settingPost', '', '插件设置提交', '');
INSERT INTO `jb_auth_rule` VALUES ('45', '1', 'admin', 'admin_url', 'admin/Plugin/install', '', '插件安装', '');
INSERT INTO `jb_auth_rule` VALUES ('46', '1', 'admin', 'admin_url', 'admin/Plugin/update', '', '插件更新', '');
INSERT INTO `jb_auth_rule` VALUES ('47', '1', 'admin', 'admin_url', 'admin/Plugin/uninstall', '', '卸载插件', '');
INSERT INTO `jb_auth_rule` VALUES ('48', '1', 'admin', 'admin_url', 'admin/Rbac/index', '', '权限设置', '');
INSERT INTO `jb_auth_rule` VALUES ('49', '1', 'admin', 'admin_url', 'admin/Rbac/roleAdd', '', '添加角色', '');
INSERT INTO `jb_auth_rule` VALUES ('50', '1', 'admin', 'admin_url', 'admin/Rbac/roleAddPost', '', '添加角色提交', '');
INSERT INTO `jb_auth_rule` VALUES ('51', '1', 'admin', 'admin_url', 'admin/Rbac/roleEdit', '', '编辑角色', '');
INSERT INTO `jb_auth_rule` VALUES ('52', '1', 'admin', 'admin_url', 'admin/Rbac/roleEditPost', '', '编辑角色提交', '');
INSERT INTO `jb_auth_rule` VALUES ('53', '1', 'admin', 'admin_url', 'admin/Rbac/roleDelete', '', '删除角色', '');
INSERT INTO `jb_auth_rule` VALUES ('54', '1', 'admin', 'admin_url', 'admin/Rbac/authorize', '', '设置角色权限', '');
INSERT INTO `jb_auth_rule` VALUES ('55', '1', 'admin', 'admin_url', 'admin/Rbac/authorizePost', '', '角色授权提交', '');
INSERT INTO `jb_auth_rule` VALUES ('56', '1', 'admin', 'admin_url', 'admin/RecycleBin/index', '', '回收站', '');
INSERT INTO `jb_auth_rule` VALUES ('57', '1', 'admin', 'admin_url', 'admin/RecycleBin/restore', '', '回收站还原', '');
INSERT INTO `jb_auth_rule` VALUES ('58', '1', 'admin', 'admin_url', 'admin/RecycleBin/delete', '', '回收站彻底删除', '');
INSERT INTO `jb_auth_rule` VALUES ('59', '1', 'admin', 'admin_url', 'admin/Route/index', '', 'URL美化', '');
INSERT INTO `jb_auth_rule` VALUES ('60', '1', 'admin', 'admin_url', 'admin/Route/add', '', '添加路由规则', '');
INSERT INTO `jb_auth_rule` VALUES ('61', '1', 'admin', 'admin_url', 'admin/Route/addPost', '', '添加路由规则提交', '');
INSERT INTO `jb_auth_rule` VALUES ('62', '1', 'admin', 'admin_url', 'admin/Route/edit', '', '路由规则编辑', '');
INSERT INTO `jb_auth_rule` VALUES ('63', '1', 'admin', 'admin_url', 'admin/Route/editPost', '', '路由规则编辑提交', '');
INSERT INTO `jb_auth_rule` VALUES ('64', '1', 'admin', 'admin_url', 'admin/Route/delete', '', '路由规则删除', '');
INSERT INTO `jb_auth_rule` VALUES ('65', '1', 'admin', 'admin_url', 'admin/Route/ban', '', '路由规则禁用', '');
INSERT INTO `jb_auth_rule` VALUES ('66', '1', 'admin', 'admin_url', 'admin/Route/open', '', '路由规则启用', '');
INSERT INTO `jb_auth_rule` VALUES ('67', '1', 'admin', 'admin_url', 'admin/Route/listOrder', '', '路由规则排序', '');
INSERT INTO `jb_auth_rule` VALUES ('68', '1', 'admin', 'admin_url', 'admin/Route/select', '', '选择URL', '');
INSERT INTO `jb_auth_rule` VALUES ('69', '1', 'admin', 'admin_url', 'admin/Setting/default', '', '设置', '');
INSERT INTO `jb_auth_rule` VALUES ('70', '1', 'admin', 'admin_url', 'admin/Setting/site', '', '网站信息', '');
INSERT INTO `jb_auth_rule` VALUES ('71', '1', 'admin', 'admin_url', 'admin/Setting/sitePost', '', '网站信息设置提交', '');
INSERT INTO `jb_auth_rule` VALUES ('72', '1', 'admin', 'admin_url', 'admin/Setting/password', '', '密码修改', '');
INSERT INTO `jb_auth_rule` VALUES ('73', '1', 'admin', 'admin_url', 'admin/Setting/passwordPost', '', '密码修改提交', '');
INSERT INTO `jb_auth_rule` VALUES ('74', '1', 'admin', 'admin_url', 'admin/Setting/upload', '', '上传设置', '');
INSERT INTO `jb_auth_rule` VALUES ('75', '1', 'admin', 'admin_url', 'admin/Setting/uploadPost', '', '上传设置提交', '');
INSERT INTO `jb_auth_rule` VALUES ('76', '1', 'admin', 'admin_url', 'admin/Setting/clearCache', '', '清除缓存', '');
INSERT INTO `jb_auth_rule` VALUES ('77', '1', 'admin', 'admin_url', 'admin/Slide/index', '', '幻灯片管理', '');
INSERT INTO `jb_auth_rule` VALUES ('78', '1', 'admin', 'admin_url', 'admin/Slide/add', '', '添加幻灯片', '');
INSERT INTO `jb_auth_rule` VALUES ('79', '1', 'admin', 'admin_url', 'admin/Slide/addPost', '', '添加幻灯片提交', '');
INSERT INTO `jb_auth_rule` VALUES ('80', '1', 'admin', 'admin_url', 'admin/Slide/edit', '', '编辑幻灯片', '');
INSERT INTO `jb_auth_rule` VALUES ('81', '1', 'admin', 'admin_url', 'admin/Slide/editPost', '', '编辑幻灯片提交', '');
INSERT INTO `jb_auth_rule` VALUES ('82', '1', 'admin', 'admin_url', 'admin/Slide/delete', '', '删除幻灯片', '');
INSERT INTO `jb_auth_rule` VALUES ('83', '1', 'admin', 'admin_url', 'admin/SlideItem/index', '', '幻灯片页面列表', '');
INSERT INTO `jb_auth_rule` VALUES ('84', '1', 'admin', 'admin_url', 'admin/SlideItem/add', '', '幻灯片页面添加', '');
INSERT INTO `jb_auth_rule` VALUES ('85', '1', 'admin', 'admin_url', 'admin/SlideItem/addPost', '', '幻灯片页面添加提交', '');
INSERT INTO `jb_auth_rule` VALUES ('86', '1', 'admin', 'admin_url', 'admin/SlideItem/edit', '', '幻灯片页面编辑', '');
INSERT INTO `jb_auth_rule` VALUES ('87', '1', 'admin', 'admin_url', 'admin/SlideItem/editPost', '', '幻灯片页面编辑提交', '');
INSERT INTO `jb_auth_rule` VALUES ('88', '1', 'admin', 'admin_url', 'admin/SlideItem/delete', '', '幻灯片页面删除', '');
INSERT INTO `jb_auth_rule` VALUES ('89', '1', 'admin', 'admin_url', 'admin/SlideItem/ban', '', '幻灯片页面隐藏', '');
INSERT INTO `jb_auth_rule` VALUES ('90', '1', 'admin', 'admin_url', 'admin/SlideItem/cancelBan', '', '幻灯片页面显示', '');
INSERT INTO `jb_auth_rule` VALUES ('91', '1', 'admin', 'admin_url', 'admin/SlideItem/listOrder', '', '幻灯片页面排序', '');
INSERT INTO `jb_auth_rule` VALUES ('92', '1', 'admin', 'admin_url', 'admin/Storage/index', '', '文件存储', '');
INSERT INTO `jb_auth_rule` VALUES ('93', '1', 'admin', 'admin_url', 'admin/Storage/settingPost', '', '文件存储设置提交', '');
INSERT INTO `jb_auth_rule` VALUES ('94', '1', 'admin', 'admin_url', 'admin/Theme/index', '', '模板管理', '');
INSERT INTO `jb_auth_rule` VALUES ('95', '1', 'admin', 'admin_url', 'admin/Theme/install', '', '安装模板', '');
INSERT INTO `jb_auth_rule` VALUES ('96', '1', 'admin', 'admin_url', 'admin/Theme/uninstall', '', '卸载模板', '');
INSERT INTO `jb_auth_rule` VALUES ('97', '1', 'admin', 'admin_url', 'admin/Theme/installTheme', '', '模板安装', '');
INSERT INTO `jb_auth_rule` VALUES ('98', '1', 'admin', 'admin_url', 'admin/Theme/update', '', '模板更新', '');
INSERT INTO `jb_auth_rule` VALUES ('99', '1', 'admin', 'admin_url', 'admin/Theme/active', '', '启用模板', '');
INSERT INTO `jb_auth_rule` VALUES ('100', '1', 'admin', 'admin_url', 'admin/Theme/files', '', '模板文件列表', '');
INSERT INTO `jb_auth_rule` VALUES ('101', '1', 'admin', 'admin_url', 'admin/Theme/fileSetting', '', '模板文件设置', '');
INSERT INTO `jb_auth_rule` VALUES ('102', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayData', '', '模板文件数组数据列表', '');
INSERT INTO `jb_auth_rule` VALUES ('103', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayDataEdit', '', '模板文件数组数据添加编辑', '');
INSERT INTO `jb_auth_rule` VALUES ('104', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayDataEditPost', '', '模板文件数组数据添加编辑提交保存', '');
INSERT INTO `jb_auth_rule` VALUES ('105', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayDataDelete', '', '模板文件数组数据删除', '');
INSERT INTO `jb_auth_rule` VALUES ('106', '1', 'admin', 'admin_url', 'admin/Theme/settingPost', '', '模板文件编辑提交保存', '');
INSERT INTO `jb_auth_rule` VALUES ('107', '1', 'admin', 'admin_url', 'admin/Theme/dataSource', '', '模板文件设置数据源', '');
INSERT INTO `jb_auth_rule` VALUES ('108', '1', 'admin', 'admin_url', 'admin/User/default', '', '门店账号管理', '');
INSERT INTO `jb_auth_rule` VALUES ('109', '1', 'admin', 'admin_url', 'admin/User/index', '', '门店账号列表', '');
INSERT INTO `jb_auth_rule` VALUES ('110', '1', 'admin', 'admin_url', 'admin/User/add', '', '管理员添加', '');
INSERT INTO `jb_auth_rule` VALUES ('111', '1', 'admin', 'admin_url', 'admin/User/addPost', '', '管理员添加提交', '');
INSERT INTO `jb_auth_rule` VALUES ('112', '1', 'admin', 'admin_url', 'admin/User/edit', '', '管理员编辑', '');
INSERT INTO `jb_auth_rule` VALUES ('113', '1', 'admin', 'admin_url', 'admin/User/editPost', '', '管理员编辑提交', '');
INSERT INTO `jb_auth_rule` VALUES ('114', '1', 'admin', 'admin_url', 'admin/User/userInfo', '', '个人信息', '');
INSERT INTO `jb_auth_rule` VALUES ('115', '1', 'admin', 'admin_url', 'admin/User/userInfoPost', '', '管理员个人信息修改提交', '');
INSERT INTO `jb_auth_rule` VALUES ('116', '1', 'admin', 'admin_url', 'admin/User/delete', '', '管理员删除', '');
INSERT INTO `jb_auth_rule` VALUES ('117', '1', 'admin', 'admin_url', 'admin/User/ban', '', '停用管理员', '');
INSERT INTO `jb_auth_rule` VALUES ('118', '1', 'admin', 'admin_url', 'admin/User/cancelBan', '', '启用管理员', '');
INSERT INTO `jb_auth_rule` VALUES ('119', '1', 'portal', 'admin_url', 'portal/AdminArticle/index', '', '文章管理', '');
INSERT INTO `jb_auth_rule` VALUES ('120', '1', 'portal', 'admin_url', 'portal/AdminArticle/add', '', '添加文章', '');
INSERT INTO `jb_auth_rule` VALUES ('121', '1', 'portal', 'admin_url', 'portal/AdminArticle/addPost', '', '添加文章提交', '');
INSERT INTO `jb_auth_rule` VALUES ('122', '1', 'portal', 'admin_url', 'portal/AdminArticle/edit', '', '编辑文章', '');
INSERT INTO `jb_auth_rule` VALUES ('123', '1', 'portal', 'admin_url', 'portal/AdminArticle/editPost', '', '编辑文章提交', '');
INSERT INTO `jb_auth_rule` VALUES ('124', '1', 'portal', 'admin_url', 'portal/AdminArticle/delete', '', '文章删除', '');
INSERT INTO `jb_auth_rule` VALUES ('125', '1', 'portal', 'admin_url', 'portal/AdminArticle/publish', '', '文章发布', '');
INSERT INTO `jb_auth_rule` VALUES ('126', '1', 'portal', 'admin_url', 'portal/AdminArticle/top', '', '文章置顶', '');
INSERT INTO `jb_auth_rule` VALUES ('127', '1', 'portal', 'admin_url', 'portal/AdminArticle/recommend', '', '文章推荐', '');
INSERT INTO `jb_auth_rule` VALUES ('128', '1', 'portal', 'admin_url', 'portal/AdminArticle/listOrder', '', '文章排序', '');
INSERT INTO `jb_auth_rule` VALUES ('129', '1', 'portal', 'admin_url', 'portal/AdminCategory/index', '', '分类管理', '');
INSERT INTO `jb_auth_rule` VALUES ('130', '1', 'portal', 'admin_url', 'portal/AdminCategory/add', '', '添加文章分类', '');
INSERT INTO `jb_auth_rule` VALUES ('131', '1', 'portal', 'admin_url', 'portal/AdminCategory/addPost', '', '添加文章分类提交', '');
INSERT INTO `jb_auth_rule` VALUES ('132', '1', 'portal', 'admin_url', 'portal/AdminCategory/edit', '', '编辑文章分类', '');
INSERT INTO `jb_auth_rule` VALUES ('133', '1', 'portal', 'admin_url', 'portal/AdminCategory/editPost', '', '编辑文章分类提交', '');
INSERT INTO `jb_auth_rule` VALUES ('134', '1', 'portal', 'admin_url', 'portal/AdminCategory/select', '', '文章分类选择对话框', '');
INSERT INTO `jb_auth_rule` VALUES ('135', '1', 'portal', 'admin_url', 'portal/AdminCategory/listOrder', '', '文章分类排序', '');
INSERT INTO `jb_auth_rule` VALUES ('136', '1', 'portal', 'admin_url', 'portal/AdminCategory/delete', '', '删除文章分类', '');
INSERT INTO `jb_auth_rule` VALUES ('137', '1', 'portal', 'admin_url', 'portal/AdminIndex/default', '', '门户管理', '');
INSERT INTO `jb_auth_rule` VALUES ('138', '1', 'portal', 'admin_url', 'portal/AdminPage/index', '', '页面管理', '');
INSERT INTO `jb_auth_rule` VALUES ('139', '1', 'portal', 'admin_url', 'portal/AdminPage/add', '', '添加页面', '');
INSERT INTO `jb_auth_rule` VALUES ('140', '1', 'portal', 'admin_url', 'portal/AdminPage/addPost', '', '添加页面提交', '');
INSERT INTO `jb_auth_rule` VALUES ('141', '1', 'portal', 'admin_url', 'portal/AdminPage/edit', '', '编辑页面', '');
INSERT INTO `jb_auth_rule` VALUES ('142', '1', 'portal', 'admin_url', 'portal/AdminPage/editPost', '', '编辑页面提交', '');
INSERT INTO `jb_auth_rule` VALUES ('143', '1', 'portal', 'admin_url', 'portal/AdminPage/delete', '', '删除页面', '');
INSERT INTO `jb_auth_rule` VALUES ('144', '1', 'portal', 'admin_url', 'portal/AdminTag/index', '', '文章标签', '');
INSERT INTO `jb_auth_rule` VALUES ('145', '1', 'portal', 'admin_url', 'portal/AdminTag/add', '', '添加文章标签', '');
INSERT INTO `jb_auth_rule` VALUES ('146', '1', 'portal', 'admin_url', 'portal/AdminTag/addPost', '', '添加文章标签提交', '');
INSERT INTO `jb_auth_rule` VALUES ('147', '1', 'portal', 'admin_url', 'portal/AdminTag/upStatus', '', '更新标签状态', '');
INSERT INTO `jb_auth_rule` VALUES ('148', '1', 'portal', 'admin_url', 'portal/AdminTag/delete', '', '删除文章标签', '');
INSERT INTO `jb_auth_rule` VALUES ('149', '1', 'user', 'admin_url', 'user/AdminAsset/index', '', '资源管理', '');
INSERT INTO `jb_auth_rule` VALUES ('150', '1', 'user', 'admin_url', 'user/AdminAsset/delete', '', '删除文件', '');
INSERT INTO `jb_auth_rule` VALUES ('151', '1', 'user', 'admin_url', 'user/AdminIndex/default', '', '门店管理', '');
INSERT INTO `jb_auth_rule` VALUES ('152', '1', 'user', 'admin_url', 'user/AdminIndex/default1', '', '用户管理', '');
INSERT INTO `jb_auth_rule` VALUES ('153', '1', 'user', 'admin_url', 'user/AdminIndex/index', '', '本站用户', '');
INSERT INTO `jb_auth_rule` VALUES ('154', '1', 'user', 'admin_url', 'user/AdminIndex/ban', '', '本站用户拉黑', '');
INSERT INTO `jb_auth_rule` VALUES ('155', '1', 'user', 'admin_url', 'user/AdminIndex/cancelBan', '', '本站用户启用', '');
INSERT INTO `jb_auth_rule` VALUES ('156', '1', 'user', 'admin_url', 'user/AdminOauth/index', '', '小程序用户', '');
INSERT INTO `jb_auth_rule` VALUES ('157', '1', 'user', 'admin_url', 'user/AdminOauth/delete', '', '删除第三方用户绑定', '');
INSERT INTO `jb_auth_rule` VALUES ('158', '1', 'user', 'admin_url', 'user/AdminUserAction/index', '', '用户操作管理', '');
INSERT INTO `jb_auth_rule` VALUES ('159', '1', 'user', 'admin_url', 'user/AdminUserAction/edit', '', '编辑用户操作', '');
INSERT INTO `jb_auth_rule` VALUES ('160', '1', 'user', 'admin_url', 'user/AdminUserAction/editPost', '', '编辑用户操作提交', '');
INSERT INTO `jb_auth_rule` VALUES ('161', '1', 'user', 'admin_url', 'user/AdminUserAction/sync', '', '同步用户操作', '');
INSERT INTO `jb_auth_rule` VALUES ('162', '1', 'admin', 'admin_url', 'admin/admin/index', '', '订单列表', '');
INSERT INTO `jb_auth_rule` VALUES ('163', '1', 'plugin/Wxapp', 'plugin_url', 'plugin/Wxapp/AdminIndex/index', '', '小程序管理', '');
INSERT INTO `jb_auth_rule` VALUES ('164', '1', 'plugin/Wxapp', 'plugin_url', 'plugin/Wxapp/AdminWxapp/add', '', '添加小程序', '');
INSERT INTO `jb_auth_rule` VALUES ('165', '1', 'plugin/Wxapp', 'plugin_url', 'plugin/Wxapp/AdminWxapp/addPost', '', '添加小程序提交保存', '');
INSERT INTO `jb_auth_rule` VALUES ('166', '1', 'plugin/Wxapp', 'plugin_url', 'plugin/Wxapp/AdminWxapp/edit', '', '编辑小程序', '');
INSERT INTO `jb_auth_rule` VALUES ('167', '1', 'plugin/Wxapp', 'plugin_url', 'plugin/Wxapp/AdminWxapp/editPost', '', '编辑小程序提交保存', '');
INSERT INTO `jb_auth_rule` VALUES ('168', '1', 'plugin/Wxapp', 'plugin_url', 'plugin/Wxapp/AdminWxapp/delete', '', '删除小程序', '');
INSERT INTO `jb_auth_rule` VALUES ('169', '1', 'order', 'admin_url', 'order/index /default', '', '订单管理', '');
INSERT INTO `jb_auth_rule` VALUES ('170', '1', 'order', 'admin_url', 'order/index/index', '', '订单列表', '');
INSERT INTO `jb_auth_rule` VALUES ('171', '1', 'admin', 'admin_url', 'admin/Accusationlist/index', '', '举报列表', '');
INSERT INTO `jb_auth_rule` VALUES ('172', '1', 'admin', 'admin_url', 'admin/Accusation/index', '', '演唱会价格', '');
INSERT INTO `jb_auth_rule` VALUES ('173', '1', 'admin', 'admin_url', 'admin/Remark/index', '', '邀请码', '');
INSERT INTO `jb_auth_rule` VALUES ('174', '1', 'admin', 'admin_url', 'admin/Activity/index', '', '活动列表', '');
INSERT INTO `jb_auth_rule` VALUES ('175', '1', 'admin', 'admin_url', 'admin/Register/index', '', '用户列表', '');
INSERT INTO `jb_auth_rule` VALUES ('176', '1', 'admin', 'admin_url', 'admin/Questions/defeault', '', '题库管理', '');
INSERT INTO `jb_auth_rule` VALUES ('177', '1', 'admin', 'admin_url', 'admin/Questions/index', '', '题库列表', '');
INSERT INTO `jb_auth_rule` VALUES ('178', '1', 'admin', 'admin_url', 'admin/Questions/import', '', '题库导入', '');
INSERT INTO `jb_auth_rule` VALUES ('179', '1', 'admin', 'admin_url', 'admin/Challenge/index', '', '挑战列表', '');
INSERT INTO `jb_auth_rule` VALUES ('180', '1', 'admin', 'admin_url', 'admin/admin/forward', '', '提现列表', '');
INSERT INTO `jb_auth_rule` VALUES ('181', '1', 'admin', 'admin_url', 'admin/admin/recharge', '', '充值列表', '');

-- ----------------------------
-- Table structure for jb_banner
-- ----------------------------
DROP TABLE IF EXISTS `jb_banner`;
CREATE TABLE `jb_banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `banner_name` char(30) NOT NULL,
  `banner_img` text COMMENT 'banner图片路径',
  `banner_state` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '启用状态：0未启用 1已启用',
  `u_time` char(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jb_banner
-- ----------------------------
INSERT INTO `jb_banner` VALUES ('1', 'banner第一组', '20180505\\75039fa4bd26e36c284f1eca6f6468fb.jpg,20180505\\67f1f6e95e5ac6da790c78ea787d4e92.jpg,20180505\\3a26acc4ca560bf970041ce8b9513769.jpg', '1', '1525512663');
INSERT INTO `jb_banner` VALUES ('2', 'banner第二组', '', '0', '1525512666');
INSERT INTO `jb_banner` VALUES ('3', 'banner第三组', '', '0', '1525511426');

-- ----------------------------
-- Table structure for jb_cart
-- ----------------------------
DROP TABLE IF EXISTS `jb_cart`;
CREATE TABLE `jb_cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL COMMENT '用户id',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `goods_buynum` int(10) unsigned NOT NULL COMMENT '商品购买数量',
  `goods_specifications` varchar(255) DEFAULT NULL COMMENT '商品规格',
  `c_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jb_cart
-- ----------------------------
INSERT INTO `jb_cart` VALUES ('83', '1', '31', '1', '550ml', '1523244537');

-- ----------------------------
-- Table structure for jb_category
-- ----------------------------
DROP TABLE IF EXISTS `jb_category`;
CREATE TABLE `jb_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(30) NOT NULL,
  `pid` int(10) unsigned NOT NULL,
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '显示前台菜单栏(1 显示   0 隐藏)',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jb_category
-- ----------------------------
INSERT INTO `jb_category` VALUES ('1', '人气爆款', '0', '0');
INSERT INTO `jb_category` VALUES ('2', '新品速递', '0', '0');
INSERT INTO `jb_category` VALUES ('3', '热销饮品', '0', '0');
INSERT INTO `jb_category` VALUES ('4', '秒杀专场', '0', '0');
INSERT INTO `jb_category` VALUES ('5', '推荐饮品', '0', '0');
INSERT INTO `jb_category` VALUES ('6', '推荐饮品', '0', '0');
INSERT INTO `jb_category` VALUES ('7', '推荐饮品', '0', '0');
INSERT INTO `jb_category` VALUES ('8', '推荐饮品', '0', '1');
INSERT INTO `jb_category` VALUES ('9', '推荐饮品', '0', '1');

-- ----------------------------
-- Table structure for jb_challenge
-- ----------------------------
DROP TABLE IF EXISTS `jb_challenge`;
CREATE TABLE `jb_challenge` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `phone` varchar(11) NOT NULL COMMENT '用户手机号',
  `answer_num` int(11) unsigned DEFAULT NULL COMMENT '答题数量',
  `user_num` int(10) unsigned DEFAULT '0' COMMENT '用户答对题数',
  `stime` int(11) unsigned DEFAULT NULL COMMENT '用户开始时间',
  `etime` int(11) unsigned DEFAULT NULL COMMENT '结束时间',
  `add_time` int(11) unsigned DEFAULT NULL COMMENT '添加时间',
  `reveive_num` int(11) unsigned DEFAULT '0' COMMENT '复活次数',
  `aid` int(11) unsigned DEFAULT NULL COMMENT '活动id',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '0失败1成功',
  `eth` float(30,2) unsigned DEFAULT '0.00' COMMENT '这个挑战的获得的eth',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=254 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of jb_challenge
-- ----------------------------

-- ----------------------------
-- Table structure for jb_comment
-- ----------------------------
DROP TABLE IF EXISTS `jb_comment`;
CREATE TABLE `jb_comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `like_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `dislike_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '不喜欢数',
  `floor` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '楼层数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:已审核,0:未审核',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `table_name` varchar(64) NOT NULL DEFAULT '' COMMENT '评论内容所在表，不带表前缀',
  `full_name` varchar(50) NOT NULL DEFAULT '' COMMENT '评论者昵称',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '评论者邮箱',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '层级关系',
  `url` text COMMENT '原文地址',
  `content` text CHARACTER SET utf8mb4 COMMENT '评论内容',
  `more` text CHARACTER SET utf8mb4 COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  KEY `table_id_status` (`table_name`,`object_id`,`status`),
  KEY `object_id` (`object_id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表';

-- ----------------------------
-- Records of jb_comment
-- ----------------------------

-- ----------------------------
-- Table structure for jb_goods
-- ----------------------------
DROP TABLE IF EXISTS `jb_goods`;
CREATE TABLE `jb_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL,
  `goods_name` char(30) NOT NULL COMMENT '商品名称',
  `goods_pirce` decimal(10,2) unsigned NOT NULL COMMENT '商品价格',
  `goods_member_price` decimal(10,2) unsigned NOT NULL COMMENT '商品会员价格',
  `goods_number` int(10) unsigned NOT NULL COMMENT '库存',
  `goods_content` text NOT NULL COMMENT '商品详情',
  `goods_specifications` varchar(50) NOT NULL COMMENT '商品规格',
  `goods_state` tinyint(2) unsigned DEFAULT '0' COMMENT '状态(0否 1 是)',
  `goods_img` varchar(60) DEFAULT NULL COMMENT '图片路径',
  `more_img` varchar(255) DEFAULT NULL COMMENT '多图',
  `goods_brand_name` char(30) DEFAULT NULL COMMENT '品牌名称',
  `goods_object` char(15) DEFAULT NULL COMMENT '适于对象',
  `goods_origin` char(30) DEFAULT NULL COMMENT '年产地',
  `goods_function` char(50) DEFAULT NULL COMMENT '功能',
  `goods_type` char(15) DEFAULT NULL COMMENT '规格类型',
  `goods_model` char(20) DEFAULT NULL COMMENT '型号',
  `goods_Shelf_life` char(15) DEFAULT NULL COMMENT '单品保质期',
  `goods_volume_loading` tinyint(1) unsigned DEFAULT '0' COMMENT '是否量贩装(0否 1 是)',
  `c_time` int(10) unsigned NOT NULL,
  `u_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jb_goods
-- ----------------------------
INSERT INTO `jb_goods` VALUES ('1', '4', '波霸奶茶', '19.80', '15.00', '1000', '<p>波霸奶茶</p>', '250ml,550ml,750ml', '1', '20180505\\3123ca6b816062dcdbb74ed412bd72b8.jpg', null, '波霸奶茶', '所有人', '2018', '饮品', '饮品', '奶茶', '3天', '0', '1525526942', '1525526942');
INSERT INTO `jb_goods` VALUES ('2', '4', '波霸奶茶', '19.80', '15.00', '1000', '<p>波霸奶茶</p>', '250ml,550ml,750ml', '1', '20180505\\3123ca6b816062dcdbb74ed412bd72b8.jpg', null, '波霸奶茶', '所有人', '2018', '饮品', '饮品', '奶茶', '3天', '0', '1525526942', '1525526942');
INSERT INTO `jb_goods` VALUES ('3', '4', '波霸奶茶', '19.80', '15.00', '1000', '<p>波霸奶茶</p>', '250ml,550ml,750ml', '1', '20180505\\3123ca6b816062dcdbb74ed412bd72b8.jpg', null, '波霸奶茶', '所有人', '2018', '饮品', '饮品', '奶茶', '3天', '0', '1525526942', '1525526942');
INSERT INTO `jb_goods` VALUES ('4', '4', '波霸奶茶', '19.80', '15.00', '1000', '<p>波霸奶茶</p>', '250ml,550ml,750ml', '1', '20180505\\3123ca6b816062dcdbb74ed412bd72b8.jpg', null, '波霸奶茶', '所有人', '2018', '饮品', '饮品', '奶茶', '3天', '0', '1525526942', '1525526942');
INSERT INTO `jb_goods` VALUES ('5', '1', '人气奶茶', '18.90', '14.90', '1000', '<p>人气奶茶</p>', '250ml,550ml,750ml', '1', '20180506\\31cbcad3e45579e4609a678e1fa271fd.jpg', null, '人气奶茶', '所有人', '广州', '人气奶茶', '饮品', '饮品', '3天', '0', '1525590682', '1525590682');
INSERT INTO `jb_goods` VALUES ('6', '1', '人气奶茶', '18.90', '14.90', '1000', '<p>人气奶茶</p>', '250ml,550ml,750ml', '1', '20180506\\31cbcad3e45579e4609a678e1fa271fd.jpg', null, '人气奶茶', '所有人', '广州', '人气奶茶', '饮品', '饮品', '3天', '0', '1525590682', '1525590682');
INSERT INTO `jb_goods` VALUES ('7', '1', '人气奶茶', '18.90', '14.90', '1000', '<p>人气奶茶</p>', '250ml,550ml,750ml', '1', '20180506\\31cbcad3e45579e4609a678e1fa271fd.jpg', null, '人气奶茶', '所有人', '广州', '人气奶茶', '饮品', '饮品', '3天', '0', '1525590682', '1525590682');
INSERT INTO `jb_goods` VALUES ('8', '1', '人气奶茶', '18.90', '14.90', '1000', '<p>人气奶茶</p>', '250ml,550ml,750ml', '1', '20180506\\31cbcad3e45579e4609a678e1fa271fd.jpg', null, '人气奶茶', '所有人', '广州', '人气奶茶', '饮品', '饮品', '3天', '0', '1525590682', '1525590682');
INSERT INTO `jb_goods` VALUES ('9', '2', '新品奶茶', '19.00', '12.00', '1000', '<p>新品奶茶</p>', '250ml,550ml,750ml', '1', '20180506\\684aba268eed80d944ca370a4ce46dee.jpg', null, '新品奶茶', '所有人', '广州', '新品奶茶', '新品奶茶', '新品奶茶', '3天', '0', '1525592051', '1525592051');
INSERT INTO `jb_goods` VALUES ('10', '2', '新品奶茶', '19.00', '12.00', '1000', '<p>新品奶茶</p>', '250ml,550ml,750ml', '1', '20180506\\684aba268eed80d944ca370a4ce46dee.jpg', null, '新品奶茶', '所有人', '广州', '新品奶茶', '新品奶茶', '新品奶茶', '3天', '0', '1525592051', '1525592051');
INSERT INTO `jb_goods` VALUES ('11', '2', '新品奶茶', '19.00', '12.00', '1000', '<p>新品奶茶</p>', '250ml,550ml,750ml', '1', '20180506\\684aba268eed80d944ca370a4ce46dee.jpg', null, '新品奶茶', '所有人', '广州', '新品奶茶', '新品奶茶', '新品奶茶', '3天', '0', '1525592051', '1525592051');
INSERT INTO `jb_goods` VALUES ('12', '2', '新品奶茶', '19.00', '12.00', '1000', '<p>新品奶茶</p>', '250ml,550ml,750ml', '1', '20180506\\684aba268eed80d944ca370a4ce46dee.jpg', null, '新品奶茶', '所有人', '广州', '新品奶茶', '新品奶茶', '新品奶茶', '3天', '0', '1525592051', '1525592051');
INSERT INTO `jb_goods` VALUES ('13', '2', '新品奶茶', '19.00', '12.00', '1000', '<p>新品奶茶</p>', '250ml,550ml,750ml', '1', '20180506\\684aba268eed80d944ca370a4ce46dee.jpg', null, '新品奶茶', '所有人', '广州', '新品奶茶', '新品奶茶', '新品奶茶', '3天', '0', '1525592051', '1525592051');
INSERT INTO `jb_goods` VALUES ('14', '2', '新品奶茶', '19.00', '12.00', '1000', '<p>新品奶茶</p>', '250ml,550ml,750ml', '1', '20180506\\684aba268eed80d944ca370a4ce46dee.jpg', null, '新品奶茶', '所有人', '广州', '新品奶茶', '新品奶茶', '新品奶茶', '3天', '0', '1525592051', '1525592051');
INSERT INTO `jb_goods` VALUES ('15', '2', '新品奶茶', '19.00', '12.00', '1000', '<p>新品奶茶</p>', '250ml,550ml,750ml', '1', '20180506\\684aba268eed80d944ca370a4ce46dee.jpg', null, '新品奶茶', '所有人', '广州', '新品奶茶', '新品奶茶', '新品奶茶', '3天', '0', '1525592051', '1525592051');
INSERT INTO `jb_goods` VALUES ('16', '2', '新品奶茶', '19.00', '12.00', '1000', '<p>新品奶茶</p>', '250ml,550ml,750ml', '1', '20180506\\684aba268eed80d944ca370a4ce46dee.jpg', null, '新品奶茶', '所有人', '广州', '新品奶茶', '新品奶茶', '新品奶茶', '3天', '0', '1525592051', '1525592051');

-- ----------------------------
-- Table structure for jb_hook
-- ----------------------------
DROP TABLE IF EXISTS `jb_hook`;
CREATE TABLE `jb_hook` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '钩子类型(1:系统钩子;2:应用钩子;3:模板钩子;4:后台模板钩子)',
  `once` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否只允许一个插件运行(0:多个;1:一个)',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `hook` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子',
  `app` varchar(15) NOT NULL DEFAULT '' COMMENT '应用名(只有应用钩子才用)',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COMMENT='系统钩子表';

-- ----------------------------
-- Records of jb_hook
-- ----------------------------
INSERT INTO `jb_hook` VALUES ('1', '1', '0', '应用初始化', 'app_init', 'cmf', '应用初始化');
INSERT INTO `jb_hook` VALUES ('2', '1', '0', '应用开始', 'app_begin', 'cmf', '应用开始');
INSERT INTO `jb_hook` VALUES ('3', '1', '0', '模块初始化', 'module_init', 'cmf', '模块初始化');
INSERT INTO `jb_hook` VALUES ('4', '1', '0', '控制器开始', 'action_begin', 'cmf', '控制器开始');
INSERT INTO `jb_hook` VALUES ('5', '1', '0', '视图输出过滤', 'view_filter', 'cmf', '视图输出过滤');
INSERT INTO `jb_hook` VALUES ('6', '1', '0', '应用结束', 'app_end', 'cmf', '应用结束');
INSERT INTO `jb_hook` VALUES ('7', '1', '0', '日志write方法', 'log_write', 'cmf', '日志write方法');
INSERT INTO `jb_hook` VALUES ('8', '1', '0', '输出结束', 'response_end', 'cmf', '输出结束');
INSERT INTO `jb_hook` VALUES ('9', '1', '0', '后台控制器初始化', 'admin_init', 'cmf', '后台控制器初始化');
INSERT INTO `jb_hook` VALUES ('10', '1', '0', '前台控制器初始化', 'home_init', 'cmf', '前台控制器初始化');
INSERT INTO `jb_hook` VALUES ('11', '1', '1', '发送手机验证码', 'send_mobile_verification_code', 'cmf', '发送手机验证码');
INSERT INTO `jb_hook` VALUES ('12', '3', '0', '模板 body标签开始', 'body_start', '', '模板 body标签开始');
INSERT INTO `jb_hook` VALUES ('13', '3', '0', '模板 head标签结束前', 'before_head_end', '', '模板 head标签结束前');
INSERT INTO `jb_hook` VALUES ('14', '3', '0', '模板底部开始', 'footer_start', '', '模板底部开始');
INSERT INTO `jb_hook` VALUES ('15', '3', '0', '模板底部开始之前', 'before_footer', '', '模板底部开始之前');
INSERT INTO `jb_hook` VALUES ('16', '3', '0', '模板底部结束之前', 'before_footer_end', '', '模板底部结束之前');
INSERT INTO `jb_hook` VALUES ('17', '3', '0', '模板 body 标签结束之前', 'before_body_end', '', '模板 body 标签结束之前');
INSERT INTO `jb_hook` VALUES ('18', '3', '0', '模板左边栏开始', 'left_sidebar_start', '', '模板左边栏开始');
INSERT INTO `jb_hook` VALUES ('19', '3', '0', '模板左边栏结束之前', 'before_left_sidebar_end', '', '模板左边栏结束之前');
INSERT INTO `jb_hook` VALUES ('20', '3', '0', '模板右边栏开始', 'right_sidebar_start', '', '模板右边栏开始');
INSERT INTO `jb_hook` VALUES ('21', '3', '0', '模板右边栏结束之前', 'before_right_sidebar_end', '', '模板右边栏结束之前');
INSERT INTO `jb_hook` VALUES ('22', '3', '1', '评论区', 'comment', '', '评论区');
INSERT INTO `jb_hook` VALUES ('23', '3', '1', '留言区', 'guestbook', '', '留言区');
INSERT INTO `jb_hook` VALUES ('24', '2', '0', '后台首页仪表盘', 'admin_dashboard', 'admin', '后台首页仪表盘');
INSERT INTO `jb_hook` VALUES ('25', '4', '0', '后台模板 head标签结束前', 'admin_before_head_end', '', '后台模板 head标签结束前');
INSERT INTO `jb_hook` VALUES ('26', '4', '0', '后台模板 body 标签结束之前', 'admin_before_body_end', '', '后台模板 body 标签结束之前');
INSERT INTO `jb_hook` VALUES ('27', '2', '0', '后台登录页面', 'admin_login', 'admin', '后台登录页面');
INSERT INTO `jb_hook` VALUES ('28', '1', '1', '前台模板切换', 'switch_theme', 'cmf', '前台模板切换');
INSERT INTO `jb_hook` VALUES ('29', '3', '0', '主要内容之后', 'after_content', '', '主要内容之后');
INSERT INTO `jb_hook` VALUES ('30', '2', '0', '文章显示之前', 'portal_before_assign_article', 'portal', '文章显示之前');
INSERT INTO `jb_hook` VALUES ('31', '2', '0', '后台文章保存之后', 'portal_admin_after_save_article', 'portal', '后台文章保存之后');
INSERT INTO `jb_hook` VALUES ('32', '2', '1', '获取上传界面', 'fetch_upload_view', 'user', '获取上传界面');
INSERT INTO `jb_hook` VALUES ('33', '3', '0', '主要内容之前', 'before_content', 'cmf', '主要内容之前');
INSERT INTO `jb_hook` VALUES ('34', '1', '0', '日志写入完成', 'log_write_done', 'cmf', '日志写入完成');
INSERT INTO `jb_hook` VALUES ('35', '1', '1', '后台模板切换', 'switch_admin_theme', 'cmf', '后台模板切换');

-- ----------------------------
-- Table structure for jb_hook_plugin
-- ----------------------------
DROP TABLE IF EXISTS `jb_hook_plugin`;
CREATE TABLE `jb_hook_plugin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `hook` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名',
  `plugin` varchar(50) NOT NULL DEFAULT '' COMMENT '插件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='系统钩子插件表';

-- ----------------------------
-- Records of jb_hook_plugin
-- ----------------------------

-- ----------------------------
-- Table structure for jb_invite_code
-- ----------------------------
DROP TABLE IF EXISTS `jb_invite_code`;
CREATE TABLE `jb_invite_code` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL COMMENT '邀请码',
  `is_del` tinyint(1) unsigned DEFAULT '0' COMMENT '0没有删除1删除',
  `add_time` int(11) unsigned DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '0没有绑定1已绑定',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jb_invite_code
-- ----------------------------
INSERT INTO `jb_invite_code` VALUES ('3', 'X/dWbYGBqPqDzXMF/4V8OrswIO6VRruOxzg', '1', '1536136814', '0');
INSERT INTO `jb_invite_code` VALUES ('4', '4DIUDKlG05sT', '0', '1536385159', '1');
INSERT INTO `jb_invite_code` VALUES ('5', '1XODX3ORTtjs', '0', '1536385168', '0');
INSERT INTO `jb_invite_code` VALUES ('6', 'RIk7M8goBs3b', '0', '1536385171', '0');

-- ----------------------------
-- Table structure for jb_link
-- ----------------------------
DROP TABLE IF EXISTS `jb_link`;
CREATE TABLE `jb_link` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:显示;0:不显示',
  `rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '友情链接描述',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '友情链接地址',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '友情链接名称',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '友情链接图标',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `rel` varchar(50) NOT NULL DEFAULT '' COMMENT '链接与网站的关系',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='友情链接表';

-- ----------------------------
-- Records of jb_link
-- ----------------------------
INSERT INTO `jb_link` VALUES ('1', '1', '1', '8', 'thinkcmf官网', 'http://www.thinkcmf.com', 'ThinkCMF', '', '_blank', '');

-- ----------------------------
-- Table structure for jb_menu
-- ----------------------------
DROP TABLE IF EXISTS `jb_menu`;
CREATE TABLE `jb_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(30) NOT NULL COMMENT '菜单栏名称',
  `pid` int(10) unsigned NOT NULL COMMENT '层级关系',
  `url` char(30) NOT NULL COMMENT '路由路径',
  `is_admin` tinyint(2) unsigned NOT NULL COMMENT '是否显示后台',
  `is_hide` tinyint(2) unsigned NOT NULL COMMENT '是否隐藏',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jb_menu
-- ----------------------------
INSERT INTO `jb_menu` VALUES ('1', '用户管理', '0', 'Index', '1', '1');
INSERT INTO `jb_menu` VALUES ('2', '用户列表', '1', 'Index/index', '1', '1');
INSERT INTO `jb_menu` VALUES ('3', '用户添加', '1', 'Index/add', '1', '1');
INSERT INTO `jb_menu` VALUES ('4', '分类管理', '0', 'Category', '1', '1');
INSERT INTO `jb_menu` VALUES ('5', '分类列表', '4', 'Category/index', '1', '1');
INSERT INTO `jb_menu` VALUES ('6', '分类添加', '4', 'Category/add', '1', '1');
INSERT INTO `jb_menu` VALUES ('7', '菜单栏管理', '0', 'Menu', '1', '1');
INSERT INTO `jb_menu` VALUES ('8', '菜单栏列表', '7', 'Menu/index', '1', '1');
INSERT INTO `jb_menu` VALUES ('9', '菜单栏添加', '7', 'Menu/add', '1', '1');
INSERT INTO `jb_menu` VALUES ('12', '商品管理', '0', 'Goods', '1', '1');
INSERT INTO `jb_menu` VALUES ('13', '商品列表', '12', 'Goods/index', '1', '1');
INSERT INTO `jb_menu` VALUES ('14', '商品添加', '12', 'Goods/add', '1', '1');
INSERT INTO `jb_menu` VALUES ('21', '权限管理', '0', 'Permissions', '1', '1');
INSERT INTO `jb_menu` VALUES ('22', '权限列表', '21', 'Permissions/index', '1', '1');
INSERT INTO `jb_menu` VALUES ('23', '权限添加', '21', 'Permissions/add', '1', '1');
INSERT INTO `jb_menu` VALUES ('24', 'banner管理', '0', 'Banner', '1', '1');
INSERT INTO `jb_menu` VALUES ('25', 'banner列表', '24', 'Banner/index', '1', '1');
INSERT INTO `jb_menu` VALUES ('27', 'banner添加', '24', 'Banner/add', '1', '1');
INSERT INTO `jb_menu` VALUES ('28', '订单管理', '0', 'Order', '1', '1');
INSERT INTO `jb_menu` VALUES ('29', '订单列表', '28', 'Order/index', '1', '1');

-- ----------------------------
-- Table structure for jb_message
-- ----------------------------
DROP TABLE IF EXISTS `jb_message`;
CREATE TABLE `jb_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_name` char(20) NOT NULL,
  `message_content` text NOT NULL,
  `message_time` char(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jb_message
-- ----------------------------
INSERT INTO `jb_message` VALUES ('1', 'wew', 'qwew', '2312');
INSERT INTO `jb_message` VALUES ('2', 'wwj', 'wwj', '1525280734');
INSERT INTO `jb_message` VALUES ('3', 'asd', 'qwewqe', '1525280746');
INSERT INTO `jb_message` VALUES ('4', 'asd', 'sds', '1525280781');
INSERT INTO `jb_message` VALUES ('5', '123', '艾斯德斯多', '1525280896');
INSERT INTO `jb_message` VALUES ('6', 'ads', 'asdsd', '1525280960');
INSERT INTO `jb_message` VALUES ('7', '王伟杰', '王伟杰好帅！', '1525507157');

-- ----------------------------
-- Table structure for jb_nav
-- ----------------------------
DROP TABLE IF EXISTS `jb_nav`;
CREATE TABLE `jb_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_main` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否为主导航;1:是;0:不是',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '导航位置名称',
  `remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='前台导航位置表';

-- ----------------------------
-- Records of jb_nav
-- ----------------------------
INSERT INTO `jb_nav` VALUES ('1', '1', '主导航', '主导航');
INSERT INTO `jb_nav` VALUES ('2', '0', '底部导航', '');

-- ----------------------------
-- Table structure for jb_nav_menu
-- ----------------------------
DROP TABLE IF EXISTS `jb_nav_menu`;
CREATE TABLE `jb_nav_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nav_id` int(11) NOT NULL COMMENT '导航 id',
  `parent_id` int(11) NOT NULL COMMENT '父 id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:显示;0:隐藏',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '打开方式',
  `href` varchar(100) NOT NULL DEFAULT '' COMMENT '链接',
  `icon` varchar(20) NOT NULL DEFAULT '' COMMENT '图标',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '层级关系',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='前台导航菜单表';

-- ----------------------------
-- Records of jb_nav_menu
-- ----------------------------
INSERT INTO `jb_nav_menu` VALUES ('1', '1', '0', '1', '0', '首页', '', 'home', '', '0-1');

-- ----------------------------
-- Table structure for jb_option
-- ----------------------------
DROP TABLE IF EXISTS `jb_option`;
CREATE TABLE `jb_option` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `autoload` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否自动加载;1:自动加载;0:不自动加载',
  `option_name` varchar(64) NOT NULL DEFAULT '' COMMENT '配置名',
  `option_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '配置值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='全站配置表';

-- ----------------------------
-- Records of jb_option
-- ----------------------------
INSERT INTO `jb_option` VALUES ('1', '1', 'site_info', '{\"site_name\":\"ThinkCMF\\u5185\\u5bb9\\u7ba1\\u7406\\u6846\\u67b61\",\"site_seo_title\":\"ThinkCMF\\u5185\\u5bb9\\u7ba1\\u7406\\u6846\\u67b6\",\"site_seo_keywords\":\"ThinkCMF,php,\\u5185\\u5bb9\\u7ba1\\u7406\\u6846\\u67b6,cmf,cms,\\u7b80\\u7ea6\\u98ce, simplewind,framework\",\"site_seo_description\":\"ThinkCMF\\u662f\\u7b80\\u7ea6\\u98ce\\u7f51\\u7edc\\u79d1\\u6280\\u53d1\\u5e03\\u7684\\u4e00\\u6b3e\\u7528\\u4e8e\\u5feb\\u901f\\u5f00\\u53d1\\u7684\\u5185\\u5bb9\\u7ba1\\u7406\\u6846\\u67b6\",\"C_APPID\":\"1\",\"C_APPSECRET\":\"2\"}');
INSERT INTO `jb_option` VALUES ('2', '1', 'admin_dashboard_widgets', '[{\"name\":\"MainContributors\",\"is_system\":1},{\"name\":\"CmfDocuments\",\"is_system\":1},{\"name\":\"CmfHub\",\"is_system\":1},{\"name\":\"Contributors\",\"is_system\":1},{\"name\":\"Custom1\",\"is_system\":1},{\"name\":\"Custom2\",\"is_system\":1},{\"name\":\"Custom3\",\"is_system\":1},{\"name\":\"Custom4\",\"is_system\":1},{\"name\":\"Custom5\",\"is_system\":1}]');
INSERT INTO `jb_option` VALUES ('3', '1', 'cmf_settings', '{\"open_registration\":\"0\",\"banned_usernames\":\"\"}');
INSERT INTO `jb_option` VALUES ('4', '1', 'cdn_settings', '{\"cdn_static_root\":\"\"}');

-- ----------------------------
-- Table structure for jb_order
-- ----------------------------
DROP TABLE IF EXISTS `jb_order`;
CREATE TABLE `jb_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) NOT NULL COMMENT '用户手机号',
  `eth` varchar(255) NOT NULL,
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '0失败1成功',
  `add_time` int(10) unsigned DEFAULT NULL COMMENT '充值时间',
  `order_num` varchar(100) DEFAULT NULL COMMENT '订单号码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of jb_order
-- ----------------------------

-- ----------------------------
-- Table structure for jb_permissions
-- ----------------------------
DROP TABLE IF EXISTS `jb_permissions`;
CREATE TABLE `jb_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL COMMENT '权限名',
  `private` varchar(255) DEFAULT NULL COMMENT '权限关联',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jb_permissions
-- ----------------------------
INSERT INTO `jb_permissions` VALUES ('1', '超级vip', '1,2,3,4,5,6,7,8,9,12,13,14,21,22,23,24,25,27,28,29');
INSERT INTO `jb_permissions` VALUES ('2', '普通vip', '1,2,3,12,13');
INSERT INTO `jb_permissions` VALUES ('3', '无', null);

-- ----------------------------
-- Table structure for jb_plugin
-- ----------------------------
DROP TABLE IF EXISTS `jb_plugin`;
CREATE TABLE `jb_plugin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '插件类型;1:网站;8:微信',
  `has_admin` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台管理,0:没有;1:有',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:开启;0:禁用',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '插件标识名,英文字母(惟一)',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '插件名称',
  `demo_url` varchar(50) NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `hooks` varchar(255) NOT NULL DEFAULT '' COMMENT '实现的钩子;以“,”分隔',
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '插件作者',
  `author_url` varchar(50) NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '插件版本号',
  `description` varchar(255) NOT NULL COMMENT '插件描述',
  `config` text COMMENT '插件配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='插件表';

-- ----------------------------
-- Records of jb_plugin
-- ----------------------------
INSERT INTO `jb_plugin` VALUES ('1', '1', '1', '1', '0', 'Wxapp', '微信小程序', 'http://demo.thinkcmf.com', '', 'ThinkCMF', 'http://www.thinkcmf.com', '1.0', '微信小程序管理工具', '[]');

-- ----------------------------
-- Table structure for jb_portal_category
-- ----------------------------
DROP TABLE IF EXISTS `jb_portal_category`;
CREATE TABLE `jb_portal_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类父id',
  `post_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类文章数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布,0:不发布',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '分类描述',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '分类层级关系路径',
  `seo_title` varchar(100) NOT NULL DEFAULT '',
  `seo_keywords` varchar(255) NOT NULL DEFAULT '',
  `seo_description` varchar(255) NOT NULL DEFAULT '',
  `list_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类列表模板',
  `one_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类文章页模板',
  `more` text COMMENT '扩展属性',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='portal应用 文章分类表';

-- ----------------------------
-- Records of jb_portal_category
-- ----------------------------

-- ----------------------------
-- Table structure for jb_portal_category_post
-- ----------------------------
DROP TABLE IF EXISTS `jb_portal_category_post`;
CREATE TABLE `jb_portal_category_post` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `category_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`),
  KEY `term_taxonomy_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='portal应用 分类文章对应表';

-- ----------------------------
-- Records of jb_portal_category_post
-- ----------------------------

-- ----------------------------
-- Table structure for jb_portal_post
-- ----------------------------
DROP TABLE IF EXISTS `jb_portal_post`;
CREATE TABLE `jb_portal_post` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `post_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '类型,1:文章;2:页面',
  `post_format` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '内容格式;1:html;2:md',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '发表者用户id',
  `post_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:已发布;0:未发布;',
  `comment_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '评论状态;1:允许;0:不允许',
  `is_top` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶;1:置顶;0:不置顶',
  `recommended` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐;1:推荐;0:不推荐',
  `post_hits` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '查看数',
  `post_like` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `comment_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `published_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `post_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'post标题',
  `post_keywords` varchar(150) NOT NULL DEFAULT '' COMMENT 'seo keywords',
  `post_excerpt` varchar(500) NOT NULL DEFAULT '' COMMENT 'post摘要',
  `post_source` varchar(150) NOT NULL DEFAULT '' COMMENT '转载文章的来源',
  `post_content` text COMMENT '文章内容',
  `post_content_filtered` text COMMENT '处理过的文章内容',
  `more` text COMMENT '扩展属性,如缩略图;格式为json',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`create_time`,`id`),
  KEY `parent_id` (`parent_id`),
  KEY `user_id` (`user_id`),
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='portal应用 文章表';

-- ----------------------------
-- Records of jb_portal_post
-- ----------------------------

-- ----------------------------
-- Table structure for jb_portal_tag
-- ----------------------------
DROP TABLE IF EXISTS `jb_portal_tag`;
CREATE TABLE `jb_portal_tag` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布,0:不发布',
  `recommended` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐;1:推荐;0:不推荐',
  `post_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '标签文章数',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标签名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='portal应用 文章标签表';

-- ----------------------------
-- Records of jb_portal_tag
-- ----------------------------

-- ----------------------------
-- Table structure for jb_portal_tag_post
-- ----------------------------
DROP TABLE IF EXISTS `jb_portal_tag_post`;
CREATE TABLE `jb_portal_tag_post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tag_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '标签 id',
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文章 id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='portal应用 标签文章对应表';

-- ----------------------------
-- Records of jb_portal_tag_post
-- ----------------------------

-- ----------------------------
-- Table structure for jb_questions
-- ----------------------------
DROP TABLE IF EXISTS `jb_questions`;
CREATE TABLE `jb_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contributor` varchar(20) DEFAULT NULL,
  `quiz` varchar(255) NOT NULL,
  `options` varchar(255) NOT NULL,
  `answer` varchar(250) NOT NULL,
  `school` varchar(10) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL COMMENT '问题类型',
  `tid` int(11) DEFAULT NULL COMMENT '题库分类id',
  `is_del` tinyint(1) unsigned DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1045 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of jb_questions
-- ----------------------------
INSERT INTO `jb_questions` VALUES ('1', '蓝精灵灵', '西汉文学成就中，最为突出的是？', '[\"散文、诗歌\", \"小传、传奇\", \"戏剧、传记\", \"赋和乐府诗\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('2', '杨绍芳', '东南亚地区被称为「十字路口」的海上交通要道的是？', '[\"苏伊士运河\", \"基尔运河\", \"巴拿马运河\", \"马六甲海峡\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('3', '', '「远山眉黛长，细柳腰肢袅。妆罢立春风，一笑千金少」是形容哪位绝色女子？', '[\"李师师\", \"陈圆圆\", \"柳如是\", \"苏小小\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('4', '大秦', '「生死一知己，存亡两妇人」指的是哪位历史人物？', '[\"韩信\", \"刘备\", \"项羽\", \"朱元璋\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('5', '从方圆', '下列生物中只有三对足的是？', '[\"雪蟹\", \"寄居蟹\", \"青蟹\", \"帝王蟹\"]', '1', '理科', '生物', '7', '0');
INSERT INTO `jb_questions` VALUES ('6', '小米派派', '下列选项中穿过赤道的河流是？', '[\"伏尔加河\", \"长江\", \"密西西比河\", \"尼罗河\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('7', '爱随天意', '清朝时期所指的八旗子弟中不包括下列哪一个？', '[\"镶紫\", \"镶白\", \"镶蓝\", \"镶红\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('8', '小桑葚果果', '我国发现最早的纸币使用情况，出现在哪个历史时期？', '[\"明朝\", \"元朝\", \"宋朝\", \"唐朝\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('9', 'Andy', '下列哪种气体有臭鸡蛋气味？', '[\"臭氧\", \"二氧化硫气体\", \"硫化氢气体\", \"二氧化碳气体\"]', '1', '理科', '理化', '7', '0');
INSERT INTO `jb_questions` VALUES ('10', '小楼望雨', '美国前总统奥巴马是美国历史上第几个任职的总统？', '[\"第45任\", \"第43任\", \"第44任\", \"第46任\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('11', '刘明军', '「羽扇纶巾，谈笑间、樯虏灰飞烟灭」说的哪一位三国时期人物？', '[\"诸葛亮\", \"诸葛瑾\", \"曹操\", \"周瑜\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('12', '老夫疑似强迫症', '《钢铁是怎样炼成的》是哪位作家的作品？', '[\"奥斯特洛夫斯基\", \"托尔斯泰\", \"柴可夫斯基\", \"高尔基\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('13', '思恩', '《雨霖铃/雨霖铃·寒蝉凄切》的作者是？', '[\"宋代陆游\", \"宋代苏轼\", \"宋代岳飞\", \"宋代柳永\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('14', 'WZT', '二战时期，苏德战争转折点是哪一战役？', '[\"莫斯科保卫战\", \"列宁格勒保卫战\", \"基辅会战\", \"斯大林格勒战役\"]', '1', '文科', '军事', '7', '0');
INSERT INTO `jb_questions` VALUES ('15', 'fang', '龙泉青瓷产与哪个省?', '[\"江西\", \"河北\", \"浙江\", \"河南\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('16', '红警是个大天狗', '中国主要的咖啡产地在？', '[\"贵州\", \"云南\", \"四川\", \"西藏\"]', '1', '生活', '饮食', '7', '0');
INSERT INTO `jb_questions` VALUES ('17', '小川儿', '「桃李不言，下自成蹊」这句话体现的德育方法是？', '[\"说服教育法\", \"陶冶法\", \"锻炼法\", \"榜样法\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('18', 'AA铮新行    王新荣2392779', '以下哪种物品溶于水显碱性？', '[\"食醋\", \"氯化钠\", \"苏打\", \"硫磺\"]', '1', '理科', '理化', '7', '0');
INSERT INTO `jb_questions` VALUES ('19', '', '我国士官军衔分为几个衔级？', '[\"6个\", \"8个\", \"9个\", \"7个\"]', '1', '文科', '军事', '7', '0');
INSERT INTO `jb_questions` VALUES ('20', '无名氏', '小说《大师与玛格丽特》的作者是？', '[\"库兹涅佐夫\", \"布尔加科夫\", \"勃列日涅夫\", \"果戈里\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('21', '京징', '「木芍药」指的是那种花？', '[\"芍药\", \"杜鹃花\", \"牡丹花\", \"月季花\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('22', '风间', '清华大学建筑学院的前身「清华大学建筑系」的创办人是？', '[\"梁思成\", \"蔡元培\", \"胡适\", \"金岳霖\"]', '1', '文艺', '设计', '7', '0');
INSERT INTO `jb_questions` VALUES ('23', '', '游戏《塞尔达传说》系列的主角名字是？', '[\"米珐\", \"加农\", \"塞尔达\", \"林克\"]', '1', '娱乐', '游戏', '7', '0');
INSERT INTO `jb_questions` VALUES ('24', '陈璐STELLA', '以保罗·高更的生平为素材的小说是？', '[\"高更的密码\", \"月亮与六便士\", \"星星的传说\", \"画家与六英镑\"]', '1', '文艺', '艺术', '7', '0');
INSERT INTO `jb_questions` VALUES ('25', '小奋斗', '我国第一部电视剧是？', '[\"渴望\", \"啦啦啦\", \"剪辑部的故事\", \"一口菜饼子\"]', '1', '娱乐', '电影', '7', '0');
INSERT INTO `jb_questions` VALUES ('26', '秉哲Y', '下列城市中不属于直辖市的是？', '[\"天津\", \"南京\", \"北京\", \"上海\"]', '1', '文科', '经济', '7', '0');
INSERT INTO `jb_questions` VALUES ('27', '老黄', '清朝的开国皇帝是下列哪一位？', '[\"皇太极\", \"顺治\", \"康熙\", \"努尔哈赤\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('28', '维鑫', '我国的「中华」牌香烟是哪家烟草企业生产的？', '[\"北京卷烟厂\", \"延安卷烟厂\", \"广东中烟工业\", \"上海烟草公司\"]', '1', '生活', '日常', '7', '0');
INSERT INTO `jb_questions` VALUES ('29', '芬芬', '《齐物论》的作者是我国古代哪一历史人物？', '[\"董仲舒\", \"屈平\", \"孔明\", \"庄周\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('30', '', '国家电网是属于什么性质的单位？', '[\"政府机关\", \"科研设计单位\", \"国有企业\", \"三资企业\"]', '1', '文科', '经济', '7', '0');
INSERT INTO `jb_questions` VALUES ('31', '', '下列哪个节目不是上世纪90年代热播的节目？', '[\"正大综艺\", \"综艺大观\", \"诗词大会\", \"曲苑杂坛\"]', '1', '娱乐', '电视', '7', '0');
INSERT INTO `jb_questions` VALUES ('32', '焕', '染色体中决定男性性别的基因用哪个字母表示？', '[\"Y\", \"A\", \"X\", \"B\"]', '1', '理科', '生物', '7', '0');
INSERT INTO `jb_questions` VALUES ('33', '', '从健康角度看，我们献血的间隔时间一般为多久？', '[\"一个月\", \"一年\", \"六个月\", \"三个月\"]', '1', '生活', '健康', '7', '0');
INSERT INTO `jb_questions` VALUES ('34', 'Eizo', '下列不是日本明治维新时期的维新三杰之一的是？', '[\"西乡隆盛\", \"岩仓具视\", \"大久保利通\", \"木户孝允\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('35', '', '米开朗基罗的雕塑《大卫》表现了大卫王手持什么武器的形象？', '[\"弯刀\", \"长矛\", \"投石器\", \"弩箭\"]', '1', '文艺', '艺术', '7', '0');
INSERT INTO `jb_questions` VALUES ('36', '', '电影《变形金刚II》主题曲《New Divide》是由哪支美国摇滚乐队演唱？', '[\"林肯公园\", \"林肯部落\", \"林肯派对\", \"林肯公元\"]', '1', '娱乐', '音乐', '7', '0');
INSERT INTO `jb_questions` VALUES ('37', '', '「幻影系列」战机是哪个欧洲国家的王牌战斗机？', '[\"德国\", \"英国\", \"意大利\", \"法国\"]', '1', '文科', '军事', '7', '0');
INSERT INTO `jb_questions` VALUES ('38', 'A.君', '《三国演义》中老将黄忠在「定军山」斩杀的魏国将领是？', '[\"夏侯淳\", \"夏侯霸\", \"夏侯恩\", \"夏侯渊\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('39', 'A节能热水销售.维修1568323055', '2010上海世博会是第几届世界博览会？', '[\"38届\", \"41届\", \"43届\", \"39届\"]', '1', '生活', '世界', '7', '0');
INSERT INTO `jb_questions` VALUES ('40', '__不要怂`怼回去', '「夜吟应觉月光寒」的上一句是？', '[\"黄河之水天上来\", \"晓镜但愁云鬓改\", \"蓬山此去无多路\", \"相见时难别亦难\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('41', '知乎', '娱乐节目《康熙来了》是由小S与哪位男艺人一起主持的？', '[\"陈建州\", \"蔡康永\", \"吴宗宪\", \"黄子佼\"]', '1', '娱乐', '电视', '7', '0');
INSERT INTO `jb_questions` VALUES ('42', '折子戏', '拿破仑的国籍是？', '[\"英国\", \"法国\", \"美国\", \"德国\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('43', '', '《再见，警察》是哪部刘德华主演的著名港产电影的插曲？', '[\"盲探\", \"大块头有大智慧\", \"无间道\", \"门徒\"]', '1', '娱乐', '音乐', '7', '0');
INSERT INTO `jb_questions` VALUES ('44', '轻扬', '「春风又绿江南岸」出自哪位诗人笔下？', '[\"苏轼\", \"王维\", \"白居易\", \"王安石\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('45', '✨ Mr.張', '乌贼有几个心脏？', '[\"1个\", \"4个\", \"2个\", \"3个\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('46', '', '「夕阳无限好」的下一句？', '[\"低头思故乡\", \"只是近黄昏\", \"曲项向天歌\", \"自挂东南枝\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('47', '37.2°C', '下列选项中富含铁元素的蔬菜是？', '[\"韭菜\", \"大白菜\", \"芹菜\", \"菠菜\"]', '1', '生活', '饮食', '7', '0');
INSERT INTO `jb_questions` VALUES ('48', '╭Alba', '组成细胞的基本元素为:碳、氢、氧、氮，其中在细胞干重中含量最多的是？', '[\"氮\", \"碳\", \"氧\", \"氢\"]', '1', '理科', '生物', '7', '0');
INSERT INTO `jb_questions` VALUES ('49', '独孤无忌', '下列战争发生在1894-1895年的是？', '[\"中法战争\", \"第二次鸦片战争\", \"第一次鸦片战争\", \"中日甲午战争\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('50', 'aaa欣欣', '陕北地区的主要地形是？', '[\"山脉\", \"高原\", \"海域\", \"盆地\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('51', '', '「锅庄」是哪个民族的民间舞蹈？', '[\"蒙古族\", \"傣族\", \"汉族\", \"藏族\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('52', '', '下列哪所名胜位于泰国？', '[\"卧佛寺\", \"劳德公园\", \"泰姬陵\", \"莲花寺\"]', '1', '生活', '世界', '7', '0');
INSERT INTO `jb_questions` VALUES ('53', '⑦┏ (^ω^)=☞', '蔡依林《布拉格广场》中的布拉格在哪个国家？', '[\"捷克\", \"列支敦士登\", \"奥地利\", \"波兰\"]', '1', '娱乐', '音乐', '7', '0');
INSERT INTO `jb_questions` VALUES ('54', '', '在价格机制调节下，市场中供给和需求将会自然达到均衡。这种机制常被称为？', '[\"看不见的手\", \"纳什均衡\", \"帕累托优化\", \"马太效应\"]', '1', '文科', '经济', '7', '0');
INSERT INTO `jb_questions` VALUES ('55', '克里斯蒂亚诺', '以下哪座山不属于「三山五岳」之一？', '[\"雁荡山\", \"峨眉山\", \"庐山\", \"黄山\"]', '1', '生活', '世界', '7', '0');
INSERT INTO `jb_questions` VALUES ('56', '', '歌手许冠杰年轻的时候参与过哪个乐队？', '[\"梅花乐队\", \"兰花乐队\", \"菊花乐队\", \"莲花乐队\"]', '1', '娱乐', '音乐', '7', '0');
INSERT INTO `jb_questions` VALUES ('57', '', '通常情况下，斑马线一般都是什么颜色的？', '[\"红色\", \"黄色\", \"白色\", \"绿色\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('58', '', '著名的「埃菲尔铁塔」是哪个城市的标志性景点？', '[\"伦敦\", \"梵蒂冈\", \"巴黎\", \"罗马\"]', '1', '生活', '世界', '7', '0');
INSERT INTO `jb_questions` VALUES ('59', 'HK', '下列选项中是物理学家的是？', '[\"法拉第\", \"冯诺依曼\", \"柯西\", \"伽罗瓦\"]', '1', '理科', '理化', '7', '0');
INSERT INTO `jb_questions` VALUES ('60', '斑马。', '截止2017年，获得欧冠冠军最多的是哪只球队？', '[\"拜仁慕尼黑\", \"巴塞罗那\", \"皇家马德里\", \"AC米兰\"]', '1', '流行', '体育', '7', '0');
INSERT INTO `jb_questions` VALUES ('61', '', '被太阳晒黑是因为接触到了阳光中的？', '[\"红外线\", \"蓝光\", \"紫外线\", \"紫光\"]', '1', '生活', '健康', '7', '0');
INSERT INTO `jb_questions` VALUES ('62', '', '《卑鄙的我》，又称《神偷奶爸》中，格鲁家的小跟班是？', '[\"小龙人\", \"小金人\", \"小黄人\", \"小绿人\"]', '1', '娱乐', '电影', '7', '0');
INSERT INTO `jb_questions` VALUES ('63', '初心不负', '长江、黄河都发源于哪个省？', '[\"陕西省\", \"四川省\", \"青海省\", \"西藏\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('64', '张晓伟', '「一树梨花压海棠」出自哪位诗人笔下？', '[\"李白\", \"张先\", \"杜甫\", \"苏轼\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('65', '', '中国唐代第一大画家，被尊称为「画圣」的是谁？', '[\"周昉\", \"展子虔\", \"阎立本\", \"吴道子\"]', '1', '文艺', '艺术', '7', '0');
INSERT INTO `jb_questions` VALUES ('66', 'w晓涛', '光和声哪个传播速度快？', '[\"光\", \"声\", \"两者相同\", \"不一定\"]', '1', '理科', '理化', '7', '0');
INSERT INTO `jb_questions` VALUES ('67', '', '扬州流传千年的行业「三把刀」是指厨刀、理发刀和哪种刀？', '[\"修脚刀\", \"镰刀\", \"剪刀\", \"杀猪刀\"]', '1', '生活', '日常', '7', '0');
INSERT INTO `jb_questions` VALUES ('68', '', '好莱坞演员詹妮弗·劳伦斯的代表作不包括？', '[\"同床异梦\", \"美国骗局\", \"奋斗的乔伊\", \"饥饿游戏\"]', '1', '娱乐', '电影', '7', '0');
INSERT INTO `jb_questions` VALUES ('69', '王惺', '战国时期秦国灭六国，六国中第一个被灭亡的中国古代诸侯国是？', '[\"韩国\", \"燕国\", \"魏国\", \"楚国\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('70', '黑色幽寞', '太阳光从发射需多久可到达地球？', '[\"8天\", \"8分钟\", \"8秒钟\", \"8小时\"]', '1', '理科', '天文', '7', '0');
INSERT INTO `jb_questions` VALUES ('71', '', '下列那种化妆品原料可作为保湿剂？', '[\"紫草\", \"海藻\", \"花粉\", \"当归\"]', '1', '流行', '时尚', '7', '0');
INSERT INTO `jb_questions` VALUES ('72', '周凯文', '以下哪个湖泊位于华东地区？', '[\"青海湖\", \"洞庭湖\", \"查干湖\", \"鄱阳湖\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('73', '', '世界上最大的平原是？', '[\"亚马逊平原\", \"西西伯利亚平原\", \"拉普拉塔平原\", \"东欧平原\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('74', '', '哪位中国足球运动员曾担任英超水晶宫队长？', '[\"郑智\", \"孙继海\", \"范志毅\", \"谢晖\"]', '1', '流行', '体育', '7', '0');
INSERT INTO `jb_questions` VALUES ('75', '', '「婚姻就像一座城，外面的人想进来，里面的人想出去」出自哪本小说？', '[\"梦里花落知多少\", \"围城\", \"幻城\", \"戏里戏外\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('76', '李翠', '诗句「千树万树梨花开」 的上一句是？', '[\"忽如一夜春风来\", \"胡天八月即飞雪\", \"无边落木萧萧下\", \"北风卷地百草折\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('77', '狐魅♂小妖', '日漫《蜡笔小新》中，蜡笔小新的姓氏是？', '[\"野原\", \"吉永\", \"松坂\", \"风间\"]', '1', '娱乐', '动漫', '7', '0');
INSERT INTO `jb_questions` VALUES ('78', '', '海南省属于什么气候类型？', '[\"温带季风气候\", \"亚热带季风气候\", \"热带气候\", \"热带季风气候\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('79', '坦白', '电子信息容量的量纲中，1TB等于？', '[\"1000MB\", \"1024MB\", \"1024GB\", \"1000GB\"]', '1', '理科', '理化', '7', '0');
INSERT INTO `jb_questions` VALUES ('80', '', '在经济学中，态势分析法「SWOT」中的「S」代表?', '[\"优势\", \"威胁\", \"机会\", \"劣势\"]', '1', '文科', '经济', '7', '0');
INSERT INTO `jb_questions` VALUES ('81', '尚寐无觉', '任意一个三角形的外角和是多少度？', '[\"180度\", \"270度\", \"90度\", \"360度\"]', '1', '理科', '数学', '7', '0');
INSERT INTO `jb_questions` VALUES ('82', '少帅', '「玄武门之变」发生在哪个朝代？', '[\"南宋\", \"明\", \"北宋\", \"唐\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('83', '随遇而安', '东汉开国皇帝刘秀死后葬在哪里？', '[\"西安\", \"南京\", \"洛阳\", \"北京\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('84', '', '希区柯克的影片《西北偏北》命名来源于莎士比亚的哪部著作？', '[\"李尔王\", \"奥赛罗\", \"哈姆雷特\", \"麦克白\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('85', '', '梅特林克的《青鸟》、《不速之客》等作品是哪个派别的戏剧典型之作？', '[\"写实派\", \"荒诞派\", \"象征派\", \"印象派\"]', '1', '文艺', '演艺', '7', '0');
INSERT INTO `jb_questions` VALUES ('86', '', '金庸小说《天龙八部》中，谁给了段誉「北冥神功」？', '[\"王语嫣\", \"丁春秋\", \"神仙姐姐\", \"枯荣大师\"]', '1', '文艺', '文化', '7', '0');
INSERT INTO `jb_questions` VALUES ('87', '老黄', '《名侦探柯南》中，柯南爸爸的职业是？', '[\"侦探\", \"作家\", \"警察\", \"律师\"]', '1', '娱乐', '动漫', '7', '0');
INSERT INTO `jb_questions` VALUES ('88', '妙契', '通常说的「三曹」不包括下面哪位人物？', '[\"曹丕\", \"曹操\", \"曹植\", \"曹睿\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('89', '蟹九岁', '《梦想天灯》是TFBOYS和谁合唱的歌曲？', '[\"李荣浩\", \"周杰伦\", \"羽泉\", \"林俊杰\"]', '1', '娱乐', '音乐', '7', '0');
INSERT INTO `jb_questions` VALUES ('90', '闲人', '太平道的创始人是？', '[\"张道陵\", \"张秀\", \"张角\", \"葛洪\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('91', '', '2012年伦敦奥运会董栋获得的是哪项运动的金牌？', '[\"男子双杠\", \"男子蹦床\", \"男子单杠\", \"男子跳马\"]', '1', '流行', '体育', '7', '0');
INSERT INTO `jb_questions` VALUES ('92', 'Thomas', '下列维生素C含量最高的是？', '[\"香蕉\", \"柠檬\", \"橘子\", \"苹果\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('93', '霁月清风', '雪茄其最外面一层烟叶的专业名称是什么？', '[\"茄衣\", \"茄套\", \"外裹层\", \"包叶层\"]', '1', '生活', '世界', '7', '0');
INSERT INTO `jb_questions` VALUES ('94', '忍冬', '挪威位于下列哪个半岛', '[\"斯堪的纳维亚半岛\", \"印度半岛\", \"巴尔干半岛\", \"阿拉伯半岛\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('95', '简单的爱', '成语「才高八斗」源于对哪位诗人的称赞？', '[\"曹植\", \"诸葛亮\", \"曹操\", \"曹丕\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('96', '灰色半宅', '《水浒传》中，周侗的徒弟除林冲，卢俊义，史文恭还有谁？', '[\"栾廷玉\", \"岳飞\", \"武松\", \"孙立\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('97', '', '成语「门可罗雀」用来形容？', '[\"市场繁荣\", \"门庭冷落\", \"建筑宏大\", \"门庭若市\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('98', '', '苹果公司的创始人是？', '[\"史蒂夫·乔布斯\", \"比尔·盖茨\", \"马克·扎克伯格\", \"伊隆·马斯克\"]', '1', '流行', '商业', '7', '0');
INSERT INTO `jb_questions` VALUES ('99', '犯错譕鈊', '「岂曰无衣，与子同袍」描述的是人与人之间哪种关系？', '[\"师徒\", \"战友\", \"同学\", \"情侣\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('100', '', '《火影忍者》中，木叶村的第七代火影是？', '[\"漩涡鸣人\", \"纲手\", \"旗木卡卡西\", \"猿飞蒜山\"]', '1', '娱乐', '动漫', '7', '0');
INSERT INTO `jb_questions` VALUES ('101', '林虑游士   允泫', '我国第一大地方剧种是？', '[\"京剧\", \"越剧\", \"豫剧\", \"黄梅戏\"]', '1', '文艺', '艺术', '7', '0');
INSERT INTO `jb_questions` VALUES ('102', 'AHMOH', '下列哪部作品不是列夫-托尔斯泰的作品？', '[\"战争与和平\", \"复活\", \"贵族之家\", \"安娜-卡列尼娜\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('103', '', '建安文学的代表「三曹」指的是曹氏父子的曹丕、曹植还有谁？', '[\"曹昂\", \"曹冲\", \"曹彰\", \"曹操\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('104', ' 小爽哥', '作家老舍的原名是？', '[\"舒服\", \"舒迎春\", \"舒适\", \"舒庆春\"]', '1', '流行', '名人', '7', '0');
INSERT INTO `jb_questions` VALUES ('105', '阿葵', '《浣溪沙.谁念西风独自凉》中「赌书消得泼茶香」的下句是？', '[\"今时只道是寻常\", \"只是当时已惘然\", \"当时只道是正常\", \"当时只道是寻常\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('106', '', '「大胆的假设、小心的求证」是哪位著名学者的名言？', '[\"鲁迅\", \"胡适\", \"朱自清\", \"老舍\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('107', '久雷不雨的傻瓜', '双氧水的学名是？', '[\"过氧化磷\", \"过氧化氢\", \"过氧化氟\", \"过氧化氯\"]', '1', '理科', '理化', '7', '0');
INSERT INTO `jb_questions` VALUES ('108', '', '著名的「第五大道」位于美国哪个城市？', '[\"旧金山\", \"纽约\", \"华盛顿\", \"洛杉矶\"]', '1', '生活', '世界', '7', '0');
INSERT INTO `jb_questions` VALUES ('109', '韩小晔晔', '中国第二代身份证号的位数是？', '[\"18\", \"12\", \"20\", \"16\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('110', 'A张金锋', '引发第二次世界大战的独裁者希特勒是哪国人？', '[\"奥尔兰\", \"捷克\", \"奥地利\", \"德国\"]', '1', '文科', '军事', '7', '0');
INSERT INTO `jb_questions` VALUES ('111', '', '广东话里常说的「老豆」是指？', '[\"老哥\", \"老弟\", \"老爸\", \"老妈\"]', '1', '生活', '日常', '7', '0');
INSERT INTO `jb_questions` VALUES ('112', 'L～x～军', '澳大利亚最大的城市是？', '[\"堪培拉\", \"悉尼\", \"堪得拉\", \"墨尔本\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('113', '王鹏龙', '「一行三会」不包括下列选项中的哪一个?', '[\"银监会\", \"证监会\", \"基金业协会\", \"人民银行\"]', '1', '文科', '经济', '7', '0');
INSERT INTO `jb_questions` VALUES ('114', '一梦如是', '肖申克的救赎哪个国家拍的', '[\"美国\", \"俄罗斯\", \"英国\", \"徳国\"]', '1', '娱乐', '电影', '7', '0');
INSERT INTO `jb_questions` VALUES ('115', '假象', '「茕茕白兔，东走西顾」的下两句是？', '[\"衣不如新人不如故\", \"窈窕淑女君子好逑\", \"得道多助失道寡助\", \"青青子衿悠悠我心\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('116', '左手写爱', '有「外星人」之称的足球明星是？', '[\"梅西\", \"罗纳尔多\", \"罗伯特卡洛斯\", \"罗纳尔迪奥\"]', '1', '流行', '体育', '7', '0');
INSERT INTO `jb_questions` VALUES ('117', '麦小贝', '中国四大美人中「杨贵妃」是哪位皇帝的宠妃？', '[\"唐玄宗\", \"唐高宗\", \"唐太宗\", \"唐代宗\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('118', '赖赖', '下列哪一部不是中国现代小说家老舍的作品？', '[\"雷雨\", \"茶馆\", \"四世同堂\", \"骆驼祥子\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('119', '橙子哥', '下列哪些不是高温颜色釉？', '[\"霁蓝\", \"胭脂红\", \"郎红\", \"乌金\"]', '1', '文艺', '艺术', '7', '0');
INSERT INTO `jb_questions` VALUES ('120', 'FxxkWinnie', '精酿啤酒风格 IPA 的全称是？', '[\"印度淡色艾尔\", \"意大利淡色艾尔\", \"以色列淡色艾尔\", \"爱尔兰淡色艾尔\"]', '1', '生活', '饮食', '7', '0');
INSERT INTO `jb_questions` VALUES ('121', '西野', '「落红不是无情物，化作春泥更护花」出自哪位诗人笔下？', '[\"曹雪芹\", \"纳兰性德\", \"龚自珍\", \"孟浩然\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('122', '', '周星驰电影《逃学威龙》第一部中的星女郎是谁？', '[\"梅艳芳\", \"莫文蔚\", \"张敏\", \"朱茵\"]', '1', '娱乐', '电影', '7', '0');
INSERT INTO `jb_questions` VALUES ('123', '', '在韦小宝的老婆中，年纪最小的是谁？', '[\"沐剑屏\", \"苏荃\", \"双儿\", \"方仪\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('124', '莫忘雪后有晴天@Monica', '「红茶」在英语中的「红」的正确英语表示是？', '[\"black\", \"green\", \"brown\", \"red \"]', '1', '文科', '外语', '7', '0');
INSERT INTO `jb_questions` VALUES ('125', '', '哪位葡萄牙航海家发现了非洲最南端的好望角？', '[\"布鲁诺\", \"哥布林\", \"哥布伦\", \"迪亚士\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('126', '哥，缺乏一种淡定', '足球比赛中每队人数不得多于多少人？', '[\"12\", \"9\", \"10\", \"11\"]', '1', '流行', '体育', '7', '0');
INSERT INTO `jb_questions` VALUES ('127', '李经纬', '在通常条件下，音速可达到以下哪种速度？', '[\"330m/s\", \"350m/s\", \"320m/s\", \"340m/s\"]', '1', '理科', '理化', '7', '0');
INSERT INTO `jb_questions` VALUES ('128', '郑连升', '「世事一场大梦」的下一句是？', '[\"醒来贪欢一场\", \"何必争那么多\", \"生活几度沉浮\", \"人生几度秋凉\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('129', '莫凡℡', '源自瑞典的汽车品牌是？', '[\"莲花\", \"斯柯达\", \"拉达\", \"沃尔沃\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('130', '知乎', '李尧棠是我国哪位现代文学巨匠的原名？', '[\"老舍\", \"鲁迅\", \"赵树理\", \"巴金\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('131', '', '「这是最好的时代，也是最坏的时代」是哪部世界名著的开场白？', '[\"双城记\", \"李尔王\", \"麦克白\", \"悲惨世界\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('132', '', '《最后的战役》、《半岛铁盒》都由哪位男歌手演唱？', '[\"潘玮柏\", \"林俊杰\", \"刘畊宏\", \"周杰伦\"]', '1', '娱乐', '音乐', '7', '0');
INSERT INTO `jb_questions` VALUES ('133', 'Nebel', '《魔兽世界》里，常被简称为「DZ」的职业是？', '[\"萨满\", \"术士\", \"潜行者\", \"德鲁伊\"]', '1', '娱乐', '游戏', '7', '0');
INSERT INTO `jb_questions` VALUES ('134', 'MVP旭', 'NBA比赛中，常用来代表技术犯规的是哪个字母？', '[\"C\", \"G\", \"F\", \"T\"]', '1', '流行', '体育', '7', '0');
INSERT INTO `jb_questions` VALUES ('135', '子明', '下面哪个不属于「江南三大名楼」之一？', '[\"岳阳楼\", \"鹳雀楼\", \"滕王阁\", \"黄鹤楼\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('136', 'Aurevoir、', '《长恨歌》中「后宫佳丽三千人」的后一句是？', '[\"三千宠爱在一身\", \"从此君王不早朝\", \"其中绰约多仙子\", \"铁杵磨成绣花针\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('137', 'cyj', '下列景区中是我国第一批入选世界文化遗产名录的是？', '[\"重庆大足石刻\", \"河南龙门石窟\", \"甘肃敦煌莫高窟\", \"山西云岗石窟\"]', '1', '生活', '世界', '7', '0');
INSERT INTO `jb_questions` VALUES ('138', '欠猴儿', '跑步比赛中，你超过了第二名，这时你变成了第几名？', '[\"第一名\", \"第三名\", \"第十名\", \"第二名\"]', '1', '理科', '数学', '7', '0');
INSERT INTO `jb_questions` VALUES ('139', '', '在美国上映后被赞为「中国版纸牌屋」的是哪部电视剧？', '[\"甄嬛传\", \"琅琊榜\", \"伪装者\", \"还珠格格\"]', '1', '娱乐', '电视', '7', '0');
INSERT INTO `jb_questions` VALUES ('140', '一人一半', '我国古代名桥孔数最多的连拱石桥是？', '[\"泉州洛阳桥\", \"北京卢沟桥\", \"河北赵州桥\", \"江苏宝带桥\"]', '1', '文艺', '设计', '7', '0');
INSERT INTO `jb_questions` VALUES ('141', '小拾', '下列不属于联合国四大常任理事国的国家是哪一个？', '[\"俄罗斯\", \"中国\", \"美国\", \"日本\"]', '1', '生活', '世界', '7', '0');
INSERT INTO `jb_questions` VALUES ('142', '朝夕', '《冷月葬花魂》出自下列哪部小说？', '[\"西厢记\", \"红楼梦\", \"烈女传\", \"金瓶梅\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('143', 'pcm~冰冰棒', '被形容「过着酒池肉林的奢侈生活，实行炮烙之刑的暴政」的中国古代君王是？', '[\"秦始皇\", \"夏桀\", \"商纣王\", \"隋炀帝\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('144', '', '电视剧《笑傲江湖》中，日月神教的圣姑是哪位角色？', '[\"小龙女\", \"任盈盈\", \"王语嫣\", \"殷离\"]', '1', '娱乐', '电视', '7', '0');
INSERT INTO `jb_questions` VALUES ('145', 'Sun', '人心脏的「心房」和「心室」共有几个？', '[\"6个\", \"4个\", \"2个\", \"1个\"]', '1', '理科', '生物', '7', '0');
INSERT INTO `jb_questions` VALUES ('146', '挥刀斩情丝不断', '「尿毒症」是指人体那一部分病变引起的？', '[\"肾脏\", \"肝脏\", \"脾\", \"膀胱\"]', '1', '生活', '健康', '7', '0');
INSERT INTO `jb_questions` VALUES ('147', '陆荣', '中国冬天常说的西北风是指来自哪的冷空气？', '[\"东北\", \"西伯利亚\", \"欧洲\", \"太平洋\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('148', '李润权', '「孤舟蓑笠翁，独钓寒江雪」是哪位诗人的作品？', '[\"柳宗元\", \"李商隐\", \"王维\", \"杜甫\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('149', '多肉小球', '按2005年中国国家测绘局测量珠穆朗玛峰的岩面高度是?', '[\"8835米\", \"8846.44米\", \"8844.43米\", \"8944.46米\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('150', '山川', '维吾尔语「巴扎」是什么意思？', '[\"寺庙\", \"农贸市场\", \"学校\", \"汽车站\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('151', '满满回来了', '中国东北三江平原的「三江」不包括下列哪一个？', '[\"乌苏里江\", \"图们江\", \"松花江\", \"黑龙江\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('152', '小柏', '「Ti」是什么元素的名称？', '[\"钛\", \"铊\", \"锑\", \"锝\"]', '1', '理科', '理化', '7', '0');
INSERT INTO `jb_questions` VALUES ('153', '知乎', '电视剧《青春期撞上更年期》中女主角「贺飞儿」的饰演者是哪位女星？', '[\"张歆艺\", \"唐嫣\", \"白百何\", \"马伊琍\"]', '1', '娱乐', '电视', '7', '0');
INSERT INTO `jb_questions` VALUES ('154', '随心摇摆', '我国现存最大的皇家园林是？', '[\"沈阳故宫\", \"北京故宫\", \"苏州园林\", \"避暑山庄\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('155', '蜂蜜面包', '世界上第一个授予女性外观智能机器人「索菲亚」公民身份的国家是？', '[\"俄罗斯\", \"以色列\", \"沙特阿拉伯\", \"美国\"]', '1', '流行', '科技', '7', '0');
INSERT INTO `jb_questions` VALUES ('156', '知乎', '成语「寸草春晖」出自下列哪首诗？', '[\"李清照永遇乐\", \"孟郊游子吟\", \"苏轼春夜\", \"白居易琵琶行\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('157', 'Ⅻ.贰拾叁', '美国游泳名将菲尔普斯在08年北京奥运会上一举拿下几枚金牌？', '[\"7枚\", \"6枚\", \"8枚\", \"9枚\"]', '1', '流行', '体育', '7', '0');
INSERT INTO `jb_questions` VALUES ('158', '姓霸，名罢', '下列生物细胞中不含叶绿体的是？', '[\"衣藻\", \"水绵\", \"绿眼虫\", \"草履虫\"]', '1', '理科', '生物', '7', '0');
INSERT INTO `jb_questions` VALUES ('159', '我的人生就是个大道理', '中国兵器装备集团自主设计的QBZ95式自动步枪采用的枪管口径是（）mm？', '[\"7.62\", \"5.56\", \"5.4\", \"5.8\"]', '1', '文科', '军事', '7', '0');
INSERT INTO `jb_questions` VALUES ('160', '', '太阳最外层是？', '[\"光球层\", \"日冕层\", \"色球层\", \"大气层\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('161', '永往直前', '全国文明镇中，那个镇被称为「笔都」？', '[\"广东省长安镇\", \"江西省文港镇\", \"江西省李渡镇\", \"广东省清溪镇\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('162', '我叫.MT', '《三国演义》「温酒斩华雄」中的「酒」是谁给关羽的？', '[\"刘备\", \"曹操\", \"公孙瓒\", \"袁绍\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('163', '清风悠扬', '「手谈」指的是哪种棋类对局？', '[\"五子棋\", \"围棋\", \"军旗\", \"象棋\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('164', '池静怡', '「一代天骄」成吉思汗的姓氏是？', '[\"铁木真\", \"成吉\", \"铁\", \"孛儿只斤\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('165', 'サリシノハラ', '著名实验「薛定谔的猫」是对什么概念进行的模型化？', '[\"量子破碎\", \"量子叠加\", \"量子纠缠\", \"量子通信\"]', '1', '理科', '理化', '7', '0');
INSERT INTO `jb_questions` VALUES ('166', '无名氏', '单位厘米用英文字母表示是?', '[\"m\", \"mm\", \"cm\", \"km\"]', '1', '文科', '外语', '7', '0');
INSERT INTO `jb_questions` VALUES ('167', '扎西德勒么么哒', '我国著名文学家鲁迅从文前是做什么的？', '[\"革命者\", \"教师\", \"汉奸\", \"医生\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('168', '', '著名的维也纳金色大厅位于哪个国家？', '[\"瑞士\", \"法国\", \"意大利\", \"奥地利\"]', '1', '文艺', '演艺', '7', '0');
INSERT INTO `jb_questions` VALUES ('169', '', '「海神之子」、「床单军团」是哪支西甲俱乐部的绰号？', '[\"西班牙人\", \"巴塞罗那\", \"皇家马德里\", \"马德里竞技\"]', '1', '流行', '体育', '7', '0');
INSERT INTO `jb_questions` VALUES ('170', '无名氏', '截止2017年，NBA历史上夺得总冠军最多的球员？', '[\"比尔拉塞尔\", \"乔丹\", \"科比\", \"贾巴尔\"]', '1', '流行', '体育', '7', '0');
INSERT INTO `jb_questions` VALUES ('171', '樂。', '我们使用的LED灯中文名称是？', '[\"发光二极管\", \"发光五级管\", \"发光三极管\", \"发光四机管\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('172', '', '英超历史上的第一个赛季冠军由哪支俱乐部获得？', '[\"曼彻斯特\", \"曼彻斯特联队\", \"利物浦\", \"切尔西\"]', '1', '流行', '体育', '7', '0');
INSERT INTO `jb_questions` VALUES ('173', 'Summer', '2008年2月有多少天？', '[\"31\", \"28\", \"30\", \"29\"]', '1', '理科', '数学', '7', '0');
INSERT INTO `jb_questions` VALUES ('174', '乐生啊', '成年男性血红蛋白的正常值(g/L)？', '[\"110-150g/L\", \"60-90g/L\", \"90-100g/L\", \"120-160g/L\"]', '1', '理科', '生物', '7', '0');
INSERT INTO `jb_questions` VALUES ('175', 'kizi', '长江干流没有流经下列哪个省份？', '[\"浙江省\", \"江西省\", \"安徽省\", \"湖南省\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('176', '桃李不言', '古文《醉翁亭记》的作者是？', '[\"苏轼\", \"韩愈\", \"欧阳修\", \"柳宗元\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('177', '律', '「商女不知亡国恨 」的下一句是？', '[\"隔江犹唱后庭花\", \"安得广厦千万间\", \"夜泊秦淮近酒家\", \"犹抱琵琶半遮面\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('178', '', '人们常说的「三从四德」是对哪种人的要求？', '[\"寡妇\", \"女孩\", \"妇女\", \"未出阁的女子\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('179', '♀假如♂', '斯诺克比赛中「蓝球」代表几分？', '[\"6\", \"5\", \"3\", \"4\"]', '1', '流行', '体育', '7', '0');
INSERT INTO `jb_questions` VALUES ('180', '', '距今离地球最远的人造卫星是？', '[\"先驱者11号\", \"先驱者8号\", \"先驱者9号\", \"先驱者1号\"]', '1', '理科', '天文', '7', '0');
INSERT INTO `jb_questions` VALUES ('181', '', '中国历史朝代中，隋朝之后是哪个朝代？', '[\"元朝\", \"唐代\", \"宋朝\", \"明朝\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('182', '', '当我们说一台电脑是「i5」或「i7」时，这实际上指的是什么？', '[\"CPU\", \"屏幕\", \"显卡\", \"内存\"]', '1', '流行', '科技', '7', '0');
INSERT INTO `jb_questions` VALUES ('183', '鱼老虎', '火星大气中含量最多的成分是？', '[\"氮气\", \"二氧化碳\", \"氩气\", \"氧气\"]', '1', '理科', '天文', '7', '0');
INSERT INTO `jb_questions` VALUES ('184', '周国贵', '七言绝句《山行》的作者是？', '[\"李白\", \"杜牧\", \"杜甫\", \"王维\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('185', '', '以下哪款游戏不是著名游戏工作室Id Software开发的？', '[\"重返德军总部\", \"雷神之锤\", \"半条命\", \"毁灭战士\"]', '1', '娱乐', '游戏', '7', '0');
INSERT INTO `jb_questions` VALUES ('186', '43040', '清朝的最后一位皇帝是？', '[\"爱新觉罗玄烨\", \"爱新觉罗永琪\", \"爱新觉罗溥仪\", \"爱新觉罗福临\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('187', '万能厚磊', '巴拿马运河连通的是哪两个大洋？', '[\"大西洋和印度洋\", \"印度洋和太平洋\", \"印度洋与北冰洋\", \"大西洋和太平洋\"]', '1', '生活', '世界', '7', '0');
INSERT INTO `jb_questions` VALUES ('188', '7*k', '「汉皇重色思倾国」一句中「汉皇」暗处影射的是？', '[\"唐太祖\", \"唐太宗\", \"唐高宗\", \"唐玄宗\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('189', '痞子涂', '被称为「粤语歌曲开山鼻祖」的是？', '[\"林子祥\", \"谭咏麟\", \"许冠杰\", \"泰迪罗宾\"]', '1', '娱乐', '音乐', '7', '0');
INSERT INTO `jb_questions` VALUES ('190', '死神之怒（灏）', '世界艾滋病日是每年的？', '[\"12月13日\", \"12月1日\", \"12月2日\", \"12月12日\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('191', 'Rain', '下列动物属于哺乳动物的是?', '[\"霸王龙\", \"大白鲨\", \"须鲸\", \"海马\"]', '1', '理科', '生物', '7', '0');
INSERT INTO `jb_questions` VALUES ('192', '', '「乔雅登」是以下哪个产品的品牌名称？', '[\"水光针\", \"自体脂肪填充\", \"玻尿酸\", \"超声刀\"]', '1', '流行', '时尚', '7', '0');
INSERT INTO `jb_questions` VALUES ('193', '', '我国第一个实现特殊经济政策和管理体制的经济特区城市是？', '[\"深圳\", \"南京\", \"上海\", \"重庆\"]', '1', '文科', '经济', '7', '0');
INSERT INTO `jb_questions` VALUES ('194', '', '刘备于哪一年称帝？', '[\"公元226年\", \"公元222年\", \"公元221年\", \"公元223年\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('195', 'DinosaurEatWorld', '伟大的画家梵高，来自于哪个国家？', '[\"德国\", \"法国\", \"奥地利\", \"荷兰\"]', '1', '文艺', '艺术', '7', '0');
INSERT INTO `jb_questions` VALUES ('196', '航行', '汉朝的开国皇帝是？', '[\"刘彻\", \"刘弗陵\", \"刘景\", \"刘邦\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('197', '似曾相识', '《三国演义》中身死落凤坡的人物是谁？', '[\"典韦\", \"庞统\", \"黄忠\", \"张辽\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('198', 'Schwarze Sonne', '梁斌创作小说中被誉为「一部描绘农民革命争斗的壮丽史诗」的是？', '[\"《红旗谱》\", \"《伶仃》\", \"《夜之交流》\", \"《翻身纪事》\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('199', 'DML', '中国面积第三大的省或自治区是？', '[\"内蒙古\", \"西藏\", \"青海\", \"四川\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('200', 'Hocтровский', '对我国先秦神话名作《山海经》解读做出巨大贡献的清代著名学者是？', '[\"郝懿行\", \"郭璞\", \"解缙\", \"齐白石\"]', '1', '流行', '名人', '7', '0');
INSERT INTO `jb_questions` VALUES ('201', '', '歌曲《走进新时代》、《家和万事兴》是哪位著名女高音歌唱家的代表作？', '[\"董文华\", \"张也\", \"韩红\", \"宋祖英\"]', '1', '娱乐', '音乐', '7', '0');
INSERT INTO `jb_questions` VALUES ('202', '焊生', '1101-1010=？', '[\"81\", \"91\", \"90\", \"89\"]', '1', '理科', '数学', '7', '0');
INSERT INTO `jb_questions` VALUES ('203', '李姐', '「古稀之年」是指多少岁？', '[\"60岁\", \"50岁\", \"70岁\", \"80岁\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('204', '周津津津', '通常情况下硫酸铜溶液的颜色是？', '[\"黄色\", \"红色\", \"蓝色\", \"紫色\"]', '1', '理科', '理化', '7', '0');
INSERT INTO `jb_questions` VALUES ('205', '芒果丸子是小仙女', '通常龙虾的血液是什么颜色的？', '[\"白色\", \"淡蓝色\", \"淡红色\", \"黑色\"]', '1', '理科', '生物', '7', '0');
INSERT INTO `jb_questions` VALUES ('206', 'Mocai', '下列不是be动词变形的是？', '[\"is\", \"am\", \"get\", \"are\"]', '1', '文科', '外语', '7', '0');
INSERT INTO `jb_questions` VALUES ('207', '周林', '徐志摩的诗歌《再别康桥》里的「康桥」指的是？', '[\"麻省理工大学\", \"牛津大学\", \"剑桥大学\", \"哈佛大学\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('208', '⁶⁶⁶₆₆₆666㍿', '第二个登上月球的宇航员是下列哪一位？', '[\"加加林\", \"科林斯\", \"阿姆斯特朗\", \"奥尔德林\"]', '1', '流行', '名人', '7', '0');
INSERT INTO `jb_questions` VALUES ('209', 'Gilgamesh', '被誉为「汉味小吃第一巷」的武汉小吃街是？', '[\"回民街\", \"夫子庙\", \"四方街\", \"户部巷\"]', '1', '生活', '饮食', '7', '0');
INSERT INTO `jb_questions` VALUES ('210', 'L_Seven', '现存于日本大阪市立美术馆的，宋末画家、诗人郑思肖的唯一传世画作是？', '[\"《墨菊图》\", \"《墨兰图》\", \"《墨梅图》\", \"《墨竹图》\"]', '1', '文艺', '艺术', '7', '0');
INSERT INTO `jb_questions` VALUES ('211', '威威印象', '以下省份有两个简称的省份是？', '[\"河北\", \"湖南\", \"山东\", \"云南\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('212', '', '「红丝带」是哪种疾病的防治宣传标志？', '[\"白血病\", \"心脏病\", \"癌症\", \"艾滋病\"]', '1', '生活', '健康', '7', '0');
INSERT INTO `jb_questions` VALUES ('213', '', '2的立方是？', '[\"7\", \"15\", \"8\", \"9\"]', '1', '理科', '数学', '7', '0');
INSERT INTO `jb_questions` VALUES ('214', 'Anonymous user', '《D大调卡农》的作者是?', '[\"贝多芬\", \"莫扎特\", \"帕赫贝尔\", \"莎士比亚\"]', '1', '娱乐', '音乐', '7', '0');
INSERT INTO `jb_questions` VALUES ('215', '', '1992年中国男子国家足球队的主教练是哪位德国教练？', '[\"米卢蒂诺维奇\", \"霍顿\", \"施拉普纳\", \"福拉多\"]', '1', '流行', '体育', '7', '0');
INSERT INTO `jb_questions` VALUES ('216', '༺༻', '「lucky dog」的中文意思是？', '[\"狗很幸运\", \"幸运儿\", \"幸运狗\", \"不幸的狗\"]', '1', '文科', '外语', '7', '0');
INSERT INTO `jb_questions` VALUES ('217', '', '《死亡笔记》中，「我要成为新世界的神」是下列哪位角色的名言？', '[\"黑神目泷\", \"火神大我\", \"夜神月\", \"八神庵\"]', '1', '娱乐', '动漫', '7', '0');
INSERT INTO `jb_questions` VALUES ('218', '爱随天意', '什么星体最后能演化成「红巨星」？', '[\"流星\", \"卫星\", \"恒星\", \"行星\"]', '1', '理科', '天文', '7', '0');
INSERT INTO `jb_questions` VALUES ('219', '', '以下哪种材料具有憎水性？', '[\"电瓷\", \"金属\", \"硅橡胶\", \"玻璃\"]', '1', '理科', '理化', '7', '0');
INSERT INTO `jb_questions` VALUES ('220', '祁达方', '「彩袖殷勤捧玉钟，当年拼却醉颜红」出自哪位词人》？', '[\"秦观\", \"欧阳修\", \"晏几道\", \"柳永\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('221', ' 临夏人保信用贷款~李奎宏', '「山外青山楼外楼」的下句是？', '[\"柳暗花明又一村\", \"西湖歌舞何时休\", \"西湖歌舞几时休\", \"欲抱琵琶半遮面\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('222', '', '微信中，能够发布自己的动态，也能查看朋友照片、视频和动态的功能是？', '[\"照片墙\", \"朋友圈\", \"时间线\", \"瀑布流\"]', '1', '流行', '科技', '7', '0');
INSERT INTO `jb_questions` VALUES ('223', '沅虹', '直角坐标系的发明者是？', '[\"笛卡尔\", \"牛顿\", \"薛定谔\", \"爱因斯坦\"]', '1', '理科', '数学', '7', '0');
INSERT INTO `jb_questions` VALUES ('224', '', '内马尔2017年转会到巴黎圣日耳曼队的转会费是？', '[\"5.55亿欧元\", \"2.22亿欧元\", \"1.11亿欧元\", \"3.33亿欧元\"]', '1', '流行', '体育', '7', '0');
INSERT INTO `jb_questions` VALUES ('225', '青青子衿', '美国加利福尼亚州的首府是哪座城市？', '[\"圣迭戈\", \"萨卡拉门托\", \"帕萨迪纳\", \"洛杉矶\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('226', '枫火', '糖尿病是哪个身体器官功能受损导致的？', '[\"肝脏\", \"胰腺\", \"肺\", \"脾脏\"]', '1', '生活', '健康', '7', '0');
INSERT INTO `jb_questions` VALUES ('227', '状元妈咪', '世界上第一只成功克隆的哺乳动物是？', '[\"狗\", \"牛\", \"羊\", \"猪\"]', '1', '理科', '生物', '7', '0');
INSERT INTO `jb_questions` VALUES ('228', '', '安装心脏起搏器的人在医院不能做以下哪项检查？', '[\"X光\", \"CT\", \"造影\", \"核磁共振\"]', '1', '生活', '健康', '7', '0');
INSERT INTO `jb_questions` VALUES ('229', 'hua', '伦琴射线发现于哪一年？', '[\"1893年\", \"1892年\", \"1895年\", \"1894年\"]', '1', '理科', '理化', '7', '0');
INSERT INTO `jb_questions` VALUES ('230', 'PokerFace', '勾股定理又叫什么定理？', '[\"毕达哥斯拉定理\", \"白牛定理\", \"九章定理\", \"百牛定理\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('231', '良L', '下列属于清末四大讽刺小说的是？', '[\"西游记\", \"白蛇传\", \"牡丹亭记\", \"官场现形记\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('232', '', '太阳系中拥有最大断层地形的星体是？', '[\"太阳\", \"地球\", \"火星\", \"金星\"]', '1', '理科', '天文', '7', '0');
INSERT INTO `jb_questions` VALUES ('233', 'MayHyun Zero ღ', '「最贤的妻，最才的女」是谁对著名文学家杨绛的评价？', '[\"胡适\", \"巴金\", \"林语堂\", \"钱钟书\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('234', '', '被誉为世界最美丽大学校园之一的南洋理工大学位于哪个国家？', '[\"新加坡\", \"印度尼西亚\", \"马来西亚\", \"日本\"]', '1', '生活', '世界', '7', '0');
INSERT INTO `jb_questions` VALUES ('235', '', '下列材料中，甜度最低的是？', '[\"木糖醇\", \"山梨醇\", \"阿斯巴甜\", \"蔗糖素\"]', '1', '生活', '饮食', '7', '0');
INSERT INTO `jb_questions` VALUES ('236', '张春辉', '英文「8月」的缩写是？', '[\"Oct\", \"Aug\", \"Sep\", \"Dec\"]', '1', '文科', '外语', '7', '0');
INSERT INTO `jb_questions` VALUES ('237', '', '《龙珠》中，哪位角色是赛亚人王子？', '[\"贝吉塔\", \"布罗利\", \"拿帕\", \"卡卡罗特\"]', '1', '娱乐', '动漫', '7', '0');
INSERT INTO `jb_questions` VALUES ('238', '', '下列汽车品牌中，车标图案中不包括字母的是？', '[\"林肯\", \"宾利\", \"大众\", \"本田\"]', '1', '流行', '商业', '7', '0');
INSERT INTO `jb_questions` VALUES ('239', '陈斌', '「我见青山多妩媚，料青山、见我应如是」这句词的作者是？', '[\"苏轼\", \"辛弃疾\", \"李白\", \"晏几道\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('240', '', '偶像剧《海派甜心》的插曲《匿名的好友》是哪位女歌手演唱的？', '[\"王心凌\", \"范晓萱\", \"范玮琪\", \"杨丞琳\"]', '1', '娱乐', '音乐', '7', '0');
INSERT INTO `jb_questions` VALUES ('241', '', '在分层设色地形图上，平原用绿色表示，而海洋用什么颜色表示？', '[\"白色\", \"红色\", \"黄色\", \"蓝色\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('242', '传统马奶）娜荷芽', '下列不属于传统「蒙古男儿三艺」的是？', '[\"象棋\", \"射箭\", \"骑马\", \"摔跤\"]', '1', '文艺', '文化', '7', '0');
INSERT INTO `jb_questions` VALUES ('243', 'ForrestGump', '《三国演义》中官渡之战曹操袭击袁绍粮草驻地，该地叫？', '[\"许昌\", \"濮阳\", \"乌巢\", \"官渡\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('244', '醇酒一杯', '「文景之治」出现在哪个朝代?', '[\"后汉\", \"西汉\", \"蜀汉\", \"东汉\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('245', 'WHO-AM-I~', 'cosX的平方+sinX的平方＝？', '[\"1\", \"0\", \"-1\", \"42737\"]', '1', '理科', '数学', '7', '0');
INSERT INTO `jb_questions` VALUES ('246', '笑望当年淮阴候', '汉初三杰指的是？', '[\"曹参张良刘邦\", \"樊哙韩信\", \"刘邦韩信萧何\", \"张良萧何韩信\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('247', '', '《西游记》中，派遣唐僧去西天求取真经的皇帝是谁？', '[\"唐玄宗\", \"唐高宗\", \"武则天\", \"唐太宗\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('248', 'Smile°', '目前公认的最聪明的宠物狗是哪一种？', '[\"德国牧羊犬\", \"边境牧羊犬\", \"贵宾犬\", \"中华田园犬\"]', '1', '生活', '世界', '7', '0');
INSERT INTO `jb_questions` VALUES ('249', '姚奉一', '下列国家土地面积最小的是？', '[\"美国\", \"中国\", \"巴西\", \"澳大利亚\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('250', '', '下列哪个成语典故与项羽有关？', '[\"背水一战\", \"破釜沉舟\", \"暗度陈仓\", \"隔岸观火\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('251', '', '「10086」是哪个手机运营商的客服电话？', '[\"中国联通\", \"中国铁通\", \"中国移动\", \"中国电信\"]', '1', '流行', '商业', '7', '0');
INSERT INTO `jb_questions` VALUES ('252', '明天', '索非亚教堂位于黑龙江哪个城市?', '[\"鹤岗\", \"沈阳\", \"哈尔滨\", \"长春\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('253', '全万青', '以下哪种食物是属于热性的？', '[\"香蕉\", \"梨\", \"西瓜\", \"大枣\"]', '1', '生活', '饮食', '7', '0');
INSERT INTO `jb_questions` VALUES ('254', '无名氏', '哪一年开始第二次世界大战？', '[\"1939年\", \"1936年\", \"1937年\", \"1938年\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('255', 'Travis', '《复仇者联盟2》的反派boss是？', '[\"幻视\", \"九头蛇\", \"冬兵\", \"奥创\"]', '1', '娱乐', '电影', '7', '0');
INSERT INTO `jb_questions` VALUES ('256', '', 'NBA球星、小前锋罗尔·邓的国籍是哪个欧洲国家？', '[\"法国\", \"英国\", \"匈牙利\", \"葡萄牙\"]', '1', '流行', '体育', '7', '0');
INSERT INTO `jb_questions` VALUES ('257', '', '「走在风中今天阳光突然好温柔」，这是五月天哪首歌中的歌词？', '[\"温柔\", \"倔强\", \"突然好想你\", \"恋爱ING\"]', '1', '娱乐', '音乐', '7', '0');
INSERT INTO `jb_questions` VALUES ('258', '', '小说《鲁滨逊漂流记》中，鲁滨逊救下的野人叫？', '[\"星期一\", \"星期五\", \"星期天\", \"星期六\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('259', '.Dear', '「亦余心之所善兮，虽九死其犹未悔」出自哪一部作品？', '[\"九歌\", \"离骚\", \"国殇\", \"风骚\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('260', '', '电视剧《水浒传》中，被称为「智多星」的是？', '[\"吴用\", \"朱武\", \"公孙胜\", \"花荣\"]', '1', '娱乐', '电视', '7', '0');
INSERT INTO `jb_questions` VALUES ('261', '', '马头琴是我国哪个民族的拉弦乐器？', '[\"藏族\", \"回族\", \"满族\", \"蒙古族\"]', '1', '文艺', '演艺', '7', '0');
INSERT INTO `jb_questions` VALUES ('262', 'mr梁', '《三国演义中》张飞使用的兵器是？', '[\"双股剑\", \"方天画戟\", \"丈八蛇矛\", \"青龙偃月刀\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('263', '石头', '下列不是副省级城市的是哪个？', '[\"武汉\", \"重庆\", \"青岛\", \"厦门\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('264', '', '我国的三大丘陵是辽东丘陵，东南丘陵和哪一个丘陵？', '[\"安徽丘陵\", \"山东丘陵\", \"陕西丘陵\", \"河南丘陵\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('265', '', '「人过大钟寺，寺钟大过人」一句所用的修辞手法是？', '[\"夸张\", \"回文\", \"排比\", \"比喻\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('266', '', '张杰曾在以下哪个选秀节目中获得过冠军？', '[\"我型我秀\", \"加油好男儿\", \"快乐男声\", \"超级男声\"]', '1', '娱乐', '电视', '7', '0');
INSERT INTO `jb_questions` VALUES ('267', '两张皮V', '「全开」是表示哪一变量的单位？', '[\"面积\", \"重量\", \"长度\", \"时间\"]', '1', '文艺', '设计', '7', '0');
INSERT INTO `jb_questions` VALUES ('268', '张罗丹', '「腌臢」的正确读音是？', '[\"ā zǎn\", \"ān zǎn\", \"ā zā\", \"yān zàn\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('269', '奇一小脑斧', '下面被称为「爆炸函数」的是？', '[\"y=x\", \"指数函数\", \"幂函数\", \"对数函数\"]', '1', '理科', '数学', '7', '0');
INSERT INTO `jb_questions` VALUES ('270', '書香中國', '「我自横刀向天笑」的下一句是？', '[\"去留肝胆两昆仑\", \"此恨绵绵无绝期\", \"岂因祸福避趋之\", \"人间正道是沧桑\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('271', '', '中国南宋的哪位著名女词人被称为易安居士？', '[\"蔡文姬\", \"李清照\", \"李冶\", \"卓文君\"]', '1', '文艺', '文化', '7', '0');
INSERT INTO `jb_questions` VALUES ('272', '张祥', '古称为「神都」的我国城市是？', '[\"洛阳\", \"南京\", \"北京\", \"长安\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('273', '虎虎', '细胞膜在物质通过时，具有什么性质？', '[\"半透性\", \"全透性\", \"选择透过性\", \"不允许物质通过\"]', '1', '理科', '生物', '7', '0');
INSERT INTO `jb_questions` VALUES ('274', '', '歌曲《一千年以后》是由以下哪位歌手演唱的？', '[\"王力宏\", \"曹格\", \"林俊杰\", \"陶喆\"]', '1', '娱乐', '动漫', '7', '0');
INSERT INTO `jb_questions` VALUES ('275', '雷电', '作家矛盾的本名是?', '[\"沈燕冰\", \"沈雁冰\", \"沈鸿冰\", \"沈严冰\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('276', '', '世界最大的一块大陆是什么大陆？', '[\"美洲大陆\", \"亚欧大陆\", \"非洲大陆\", \"澳洲大陆\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('277', '花糖君', '三山夹两盆，指的是中国境内哪里的地形？', '[\"新疆\", \"西藏\", \"四川\", \"内蒙\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('278', '水果篮lianne', '「鲎」是现今最古老的生物之一它的生物学分类是？', '[\"爬行动物\", \"节肢动物\", \"鱼类\", \"两栖动物\"]', '1', '理科', '生物', '7', '0');
INSERT INTO `jb_questions` VALUES ('279', '海海', '能降低血糖水平的激素是？', '[\"肾上腺素\", \"胰岛素\", \"生长激素\", \"胰高血糖素\"]', '1', '理科', '生物', '7', '0');
INSERT INTO `jb_questions` VALUES ('280', '', '东北话「你可别埋汰人了」里的「埋汰」是说？', '[\"弄脏\", \"讨厌\", \"诬陷\", \"贬低\"]', '1', '生活', '日常', '7', '0');
INSERT INTO `jb_questions` VALUES ('281', '', '动物在运动时，需要消耗体内的哪种核苷酸？', '[\"GTP\", \"ATP\", \"ADP\", \"GDP\"]', '1', '理科', '生物', '7', '0');
INSERT INTO `jb_questions` VALUES ('282', 'ℳ', '钢琴曲《匈牙利狂想曲》的作者是？', '[\"贝多芬\", \"布鲁斯\", \"肖邦\", \"李斯特\"]', '1', '娱乐', '音乐', '7', '0');
INSERT INTO `jb_questions` VALUES ('283', 'Joyfu', '天空呈现蓝色是因为太阳光在大气中发生哪种散射现象?', '[\"以上都是\", \"米散射\", \"瑞利散射\", \"康普顿散射\"]', '1', '理科', '理化', '7', '0');
INSERT INTO `jb_questions` VALUES ('284', '瓜皮', '下列书籍不属于「四书五经」中「五经」范围的是?', '[\"《诗》\", \"《礼》\", \"《乐》\", \"《春秋》\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('285', '', '「防抱死刹车系统」的英文缩写为？', '[\"ASB\", \"ABS\", \"BAS\", \"SBA\"]', '1', '生活', '日常', '7', '0');
INSERT INTO `jb_questions` VALUES ('286', '', '「破铜钱」指的是哪种常用作点缀的花卉？', '[\"风信子\", \"紫罗兰\", \"郁金香\", \"满天星\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('287', '', '地球的赤道周长的长度大约是？', '[\"2万KM\", \"3万KM\", \"4万KM\", \"5万KM\"]', '1', '理科', '天文', '7', '0');
INSERT INTO `jb_questions` VALUES ('288', '', '全盛时期的罗马帝国把哪个海域变成了自己的内湖？', '[\"地中海\", \"日本海\", \"太平洋\", \"百幕大三角地带\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('289', '', '下列哪部漫画从未在《少年JUMP》上连载过？', '[\"银魂\", \"妖精的尾巴\", \"火影忍者\", \"海贼王\"]', '1', '娱乐', '动漫', '7', '0');
INSERT INTO `jb_questions` VALUES ('290', '路寓', '下列哪个政权不属于「五代十国」？', '[\"后周\", \"后汉\", \"后唐\", \"后金\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('291', '旅行者', '下列属于注入北冰洋的河流是?', '[\"额尔齐斯河\", \"黑河\", \"澜沧江\", \"塔里木河\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('292', '梦惜沫珃', '汉字「珃」的读音是？', '[\"rang\", \"yan\", \"ran\", \"zang\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('293', '', '除了牛顿外，哪位德国著名数学家兼哲学家也创立了微积分？', '[\"莱布尼茨\", \"欧拉\", \"拉格朗日\", \"笛卡尔\"]', '1', '流行', '科技', '7', '0');
INSERT INTO `jb_questions` VALUES ('294', '少爷&逍遥宫', '「孟浩然」擅长写的诗体是？', '[\"田野诗\", \"田园诗\", \"颂花诗\", \"爱国诗\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('295', '', '正确人工呼吸吹气的频率是？', '[\"10～15次/分钟 \", \"20～25次/分钟 \", \"26～30次/分钟\", \"16～20次/分钟 \"]', '1', '生活', '健康', '7', '0');
INSERT INTO `jb_questions` VALUES ('296', '', '日本战国时代末期杰出的政治家和军事家、江户幕府的第一代将军是谁？', '[\"德川纲吉\", \"德川庆喜\", \"德川秀忠\", \"德川家康\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('297', 'P.G.D.LiCeKop', '2016年当选FIFA世界足球先生的是？', '[\"C罗\", \"梅西\", \"内马尔\", \"格列兹曼\"]', '1', '流行', '体育', '7', '0');
INSERT INTO `jb_questions` VALUES ('298', '没有樱桃的小丸子', '《我喜欢你是寂静的》出自哪位诗人？', '[\"聂鲁达\", \"洛夫\", \"阿波利奈尔\", \"西川\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('299', '', '《一夜帖》是哪位宋朝书法家的代表作之一？', '[\"蔡襄\", \"苏轼\", \"严真卿\", \"黄庭坚\"]', '1', '文艺', '艺术', '7', '0');
INSERT INTO `jb_questions` VALUES ('300', '许小可', '「忆往昔峥嵘岁月稠」的上一句是？', '[\"粪土当年万户侯\", \"望长城内外\", \"恰同学少年\", \"携来百侣曾游\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('301', '', '下列哪部电影没有沈腾出演？', '[\"一念天堂\", \"羞羞的铁拳\", \"缝纫机乐队\", \"夏洛特烦恼\"]', '1', '娱乐', '电影', '7', '0');
INSERT INTO `jb_questions` VALUES ('302', '', '著名玄幻小说《斗破苍穹》的作者是谁？', '[\"南派三叔\", \"天下霸唱\", \"唐家三少\", \"天蚕土豆\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('303', '信仰', '诗作《过零丁洋》的作者是？', '[\"岳飞\", \"文天祥\", \"辛弃疾\", \"郑成功\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('304', '大韩磊', '《三国演义》中，下列哪项与关羽有关？', '[\"火烧连营\", \"过五关斩六将\", \"草船借箭\", \"白衣过江\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('305', 'Alex', '高铁靠窗的座位号用哪两个字母表示？', '[\"AF\", \"AC\", \"CF\", \"AD\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('306', '宏君', '被称为「德国装甲兵之父」的人是？', '[\"戈培尔\", \"古德里安\", \"隆美尔\", \"龙因施泰德\"]', '1', '文科', '军事', '7', '0');
INSERT INTO `jb_questions` VALUES ('307', '小肥肥', '「离离原上草，一岁一枯荣」这句诗词的作者是？', '[\"王伦\", \"孟浩然\", \"杜甫\", \"白居易\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('308', 'WDR', '「茴香豆的各种写法」是鲁迅笔下哪位主人公提出的？', '[\"孔乙己\", \"祥林嫂\", \"闰土\", \"阿Q\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('309', 'A. 锋', '以下哪个不是广东的传统菜肴？', '[\"客家咸鸡\", \"太爷鸡\", \"白切鸡\", \"文昌鸡\"]', '1', '生活', '饮食', '7', '0');
INSERT INTO `jb_questions` VALUES ('310', '夏有乔木', '中国古代主张「兼爱 非攻」的思想家是？', '[\"墨子\", \"老子\", \"孟子\", \"孔子\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('311', '', '《武陵春》中「物是人非事事休」的下一句是？', '[\"欲语泪先流\", \"但爱鲈鱼美\", \"欲语还休\", \"思君不见君\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('312', '*花輪擇元*~', '中国最北的没有被开发过的原始村庄是？', '[\"北红村\", \"北极村\", \"北陵村\", \"漠河村\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('313', '', '被吉尼斯认证为世界最畅销书和最受欢迎字典的是哪本工具书？', '[\"新华字典\", \"现代汉语字典\", \"新华词典\", \"新世纪英汉词典\"]', '1', '生活', '世界', '7', '0');
INSERT INTO `jb_questions` VALUES ('314', '', '圆舞曲又名华尔兹是一种三拍子舞曲，它源于哪个国家？', '[\"意大利\", \"奥地利\", \"法国\", \"匈牙利\"]', '1', '文艺', '演艺', '7', '0');
INSERT INTO `jb_questions` VALUES ('315', '', '宋徽宗赵佶所发明的书法字体是？', '[\"南宫\", \"康体\", \"仿宋\", \"瘦金\"]', '1', '文艺', '艺术', '7', '0');
INSERT INTO `jb_questions` VALUES ('316', '', '下列国家与我国接壤的是？', '[\"泰国\", \"印度\", \"日本\", \"韩国\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('317', 'Mike', '「当你走近，请你细听，那颤抖的叶，是我等待的热情」自哪位诗人之手？', '[\"顾城\", \"汪国真\", \"舒婷\", \"席慕容\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('318', '云间飞羽', '东汉末年战略家、外交家鲁肃字（）？', '[\"翼德\", \"公瑾\", \"子敬\", \"玄德\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('319', '两张皮V', '下列哪位不属于明朝四大才子？', '[\"徐祯卿\", \"唐伯虎\", \"缪彤\", \"祝枝山\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('320', '无欲则刚', '以下战争，美国没有参战的是？', '[\"科索沃战争\", \"两伊战争\", \"海湾战争\", \"伊拉克战争\"]', '1', '文科', '军事', '7', '0');
INSERT INTO `jb_questions` VALUES ('321', '大格局', '我国股市代码「6」开头的股票属于以下哪个市场？', '[\"创业板\", \"中小板\", \"上海主板\", \"深圳主板\"]', '1', '文科', '经济', '7', '0');
INSERT INTO `jb_questions` VALUES ('322', '', '哪个相机品牌的标志被戏称为「可乐标」？', '[\"徕卡\", \"索尼\", \"宾得\", \"蔡司\"]', '1', '流行', '商业', '7', '0');
INSERT INTO `jb_questions` VALUES ('323', '', '英文单词「book」的复数形式是加哪个英文字母？', '[\"beek\", \"bookes\", \"beoks\", \"books\"]', '1', '文科', '外语', '7', '0');
INSERT INTO `jb_questions` VALUES ('324', '刘一江', '美剧《权力的游戏》改编自哪部小说?', '[\"《霍比特人》\", \"《哈利波特》\", \"《冰与火之歌》\", \"《魔戒》\"]', '1', '娱乐', '电视', '7', '0');
INSERT INTO `jb_questions` VALUES ('325', '', '位于美国纽约市中心的曼哈顿岛介于东河和哪条河之间？', '[\"康涅狄格河\", \"密西西比河\", \"哈得孙河\", \"我可以抱你吗\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('326', 'in  life', '以下哪种面食是陕西的特色美食？', '[\"蛋蛋面\", \"刀削面\", \"臊子面\", \"热干面\"]', '1', '生活', '饮食', '7', '0');
INSERT INTO `jb_questions` VALUES ('327', '', '曾效力于NBA火箭队，外号「勺子」的篮球运动员是哪位？', '[\"贾森·基德\", \"拉简·朗多\", \"威瑟•斯彭\", \"斯蒂芬·马布里\"]', '1', '流行', '体育', '7', '0');
INSERT INTO `jb_questions` VALUES ('328', '仙淼', '海水中含量最高的金属元素是？', '[\"氧\", \"铝\", \"氯\", \"钠\"]', '1', '理科', '理化', '7', '0');
INSERT INTO `jb_questions` VALUES ('329', '你好，明天', '北美洲和南美洲的分界线是？', '[\"巴拿马运河\", \"乌拉尔山脉\", \"乌苏里江\", \"乌拉尔河\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('330', '左右、', '被称为「数学王子」的是？', '[\"莱布尼兹\", \"高斯\", \"拉格朗日\", \"牛顿\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('331', 'Jackie', '音乐家李斯特是下列哪一音乐时期的音乐家？', '[\"浪漫主义时期\", \"近现代时期\", \"古典主义时期\", \"巴洛克时期\"]', '1', '文艺', '演艺', '7', '0');
INSERT INTO `jb_questions` VALUES ('332', 'T!tan', '三国时期东吴大都督陆逊字（）？', '[\"伯仲\", \"伯约\", \"伯伯\", \"伯言\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('333', '呦呦！', '「知之为知之」的下一句是？', '[\"不知为知之\", \"知之而为知\", \"不知为不知\", \"不知而为知\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('334', '寒冰冰', '儒家学派的奠基人孔子被后人尊称「圣人」下面哪个人物被尊为「亚圣」？', '[\"孟子\", \"墨子\", \"老子\", \"韩非子\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('335', 'Excuse_6780', '关于浓硫酸的稀释过程描述正确是？', '[\"把酸加入水中\", \"把水加入酸中\", \"无所谓谁先谁后\", \"酸和水同时混一起\"]', '1', '理科', '理化', '7', '0');
INSERT INTO `jb_questions` VALUES ('336', '', '美剧《权力的游戏》中，间谍大师瓦里斯的外号是？', '[\"小恶魔\", \"狼主\", \"小指头\", \"蜘蛛\"]', '1', '娱乐', '电视', '7', '0');
INSERT INTO `jb_questions` VALUES ('337', 'Z', '糕点沙琪玛源于哪个民族？', '[\"回族\", \"维吾尔族\", \"汉族\", \"满族\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('338', '李雅婷', '「扫帚星」的说法最初来源于？', '[\"火星\", \"天王星\", \"彗星\", \"水星\"]', '1', '理科', '天文', '7', '0');
INSERT INTO `jb_questions` VALUES ('339', '汇保车汇 靳欣 18343151555', '「魑魅魍魉」中头两个字的正确发音？', '[\"limo\", \"chimei\", \"liumo\", \"liwei\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('340', '嗨嗨嗨嗨的幸福', '下列哪项不是人体细胞的结构？', '[\"细胞膜\", \"细胞质\", \"细胞壁\", \"细胞核\"]', '1', '理科', '生物', '7', '0');
INSERT INTO `jb_questions` VALUES ('341', 'TK', '一批水泥用于修建水库后就不能再用于修建高速公路。这反映的经济学概念是？', '[\"比较优势\", \"规模经济\", \"经营利润\", \"机会成本\"]', '1', '文科', '经济', '7', '0');
INSERT INTO `jb_questions` VALUES ('342', '', '《三国演义》中，传说被诸葛亮三气而死的吴国大将是？', '[\"周瑜\", \"马谡\", \"鲁肃\", \"司马懿\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('343', '半梦半醒', '袁隆平院士培育的杂交水稻利用了哪种特性？', '[\"种类的多样性\", \"属目的多样性\", \"生态系统的多样性\", \"基因的多样性\"]', '1', '理科', '生物', '7', '0');
INSERT INTO `jb_questions` VALUES ('344', '', '我们通常用「多少步笑百步」比喻没有自知之明的人？', '[\"四十\", \"八十\", \"六十\", \"五十\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('345', '［ຂђєภﻮςђєภﻮкນเ］', '《鹿鼎记》中韦小宝的生活年代是？', '[\"明朝\", \"清朝\", \"宋朝\", \"唐朝\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('346', '凡人', '唐朝的建立时间是？', '[\"公元626年\", \"公元616年\", \"公元618年\", \"公元628年\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('347', '', '以下绘画作品不属于印象派的是？', '[\"草地上的午餐\", \"戴帽子的女人\", \"星空\", \"红磨坊的舞会\"]', '1', '文艺', '艺术', '7', '0');
INSERT INTO `jb_questions` VALUES ('348', '心有玲犀', '古希腊神话中帮人类盗取火种的是?', '[\"宙斯\", \"阿波罗\", \"盘古\", \"普罗米修斯\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('349', '无名氏', '南昌起义的时间是哪一年？', '[\"1927年\", \"1905年\", \"1921年\", \"1928年\"]', '1', '文科', '军事', '7', '0');
INSERT INTO `jb_questions` VALUES ('350', 'now is good', '中国建筑师、诗人、作家林徽音的丈夫是我国哪位著名建筑教育家?', '[\"金岳霖\", \"徐志摩\", \"梁思成\", \"沈从文\"]', '1', '流行', '名人', '7', '0');
INSERT INTO `jb_questions` VALUES ('351', '', '电视剧《泡沫之夏》中饰演欧辰的是？', '[\"周瑜明\", \"钟汉良\", \"何润东\", \"赵又廷\"]', '1', '娱乐', '电视', '7', '0');
INSERT INTO `jb_questions` VALUES ('352', 'bbh', '被曹操称之为「吾之子房」的是？', '[\"郭嘉\", \"程昱\", \"荀攸\", \"荀彧\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('353', '明天的你', '动画片《喜羊羊与灰太狼》中灰太狼的儿子是？', '[\"小灰灰\", \"淘汰狼\", \"红太狼\", \"喜羊羊\"]', '1', '娱乐', '动漫', '7', '0');
INSERT INTO `jb_questions` VALUES ('354', '', '「Feb」是几月份的英文缩写？', '[\"三月\", \"四月\", \"一月\", \"二月\"]', '1', '文科', '外语', '7', '0');
INSERT INTO `jb_questions` VALUES ('355', '', '王莽篡夺王位改国号为「新」，篡夺的是哪个朝代的王权？', '[\"清朝\", \"夏朝\", \"汉朝\", \"隋朝\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('356', '解忧杂货店', '在夏朝被成为红颜祸水的是哪位美人？', '[\"妲己\", \"虞姬\", \"昭君\", \"妹喜\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('357', 'Renata', '卖给消费者的第一种转基因食物是？', '[\"水稻\", \"大豆\", \"西红柿\", \"玉米\"]', '1', '流行', '科技', '7', '0');
INSERT INTO `jb_questions` VALUES ('358', 'Hunter哥', '《三国演义》中「辕门射戟」典故的主角是？', '[\"关羽\", \"吕布\", \"曹操\", \"刘备\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('359', '', '下列为感冒症状的是？', '[\"鼻出血\", \"流鼻涕\", \"呕吐\", \"腹胀\"]', '1', '生活', '健康', '7', '0');
INSERT INTO `jb_questions` VALUES ('360', '', '太阳系的八大行星中，人类最早观测到其光环的行星是？', '[\"土星\", \"木星\", \"金星\", \"火星\"]', '1', '理科', '天文', '7', '0');
INSERT INTO `jb_questions` VALUES ('361', '另请高明吧', '中国清代历史中，科举制度是于何时废除正式退出历史舞台？', '[\"1911年\", \"1902年\", \"1905年\", \"1898年\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('362', '风', '「老花镜」的镜片按镜片种类分类属于以下哪种镜片？', '[\"平镜\", \"凹透镜\", \"凸透镜\", \"有色镜\"]', '1', '生活', '日常', '7', '0');
INSERT INTO `jb_questions` VALUES ('363', 'Li Ruixin', '下列符合勾股定理所描述的是？', '[\"a²＋b²＜c²\", \"a³+b³＝c³\", \"a³+b³>c³\", \"a²＋b²＝c²\"]', '1', '理科', '数学', '7', '0');
INSERT INTO `jb_questions` VALUES ('364', '', '咖啡品牌「星巴克」的商品图案是？', '[\"自由女神\", \"欧洲女王\", \"美人鱼\", \"林间少女\"]', '1', '流行', '商业', '7', '0');
INSERT INTO `jb_questions` VALUES ('365', '', '2005年上映的《星球大战前传3》是由哪位美国著名导演所执导？', '[\"卡梅隆\", \"乔治•卢卡斯\", \"迈克尔\", \"斯皮尔伯格\"]', '1', '娱乐', '电影', '7', '0');
INSERT INTO `jb_questions` VALUES ('366', 'Mr.F', '已知的在中国境内生活的最古老的原始人类是？', '[\"元谋猿人\", \"北京猿人\", \"山顶洞人\", \"周家口人\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('367', '知乎', '一个棱长为3米的正方体，其体积为多少立方米？', '[\"24立方米\", \"9立方米\", \"21立方米\", \"27立方米\"]', '1', '理科', '数学', '7', '0');
INSERT INTO `jb_questions` VALUES ('368', '', '《鹿鼎记》中提到的「杀龟大会」中的「龟」指的是谁？', '[\"吴应熊\", \"鳌拜\", \"洪教主\", \"吴三桂\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('369', '', '神秘的青铜时代遗址三星堆遗址位于我国哪个省？', '[\"湖北\", \"湖南\", \"河南\", \"四川\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('370', 'ゞ璃镜', '日本动漫世界著名，下列哪部作品不是由宫崎骏创作的？', '[\"哈尔的移动城堡\", \"千与千寻\", \"东京食尸鬼\", \"天空之城\"]', '1', '娱乐', '动漫', '7', '0');
INSERT INTO `jb_questions` VALUES ('371', '金色霞光', '《游子吟》是哪个朝代哪位诗人的作品？', '[\"宋 苏轼\", \"唐 孟郊\", \"宋 李清照\", \"唐 李商隐\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('372', 'Kelvin 苏文轩²⁰¹⁷', '下列选项属于「卵生哺乳类动物」的是？', '[\"犰狳\", \"食蚁兽\", \"鸭嘴兽\", \"袋獾\"]', '1', '理科', '生物', '7', '0');
INSERT INTO `jb_questions` VALUES ('373', '水清木华', '贾岛的《题李凝幽居》中，「鸟宿池边树」的下一句是？', '[\"僧推月下门\", \"僧敲月下门\", \"僧拍月下门\", \"僧开月下门\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('374', 'ZLC', '「沉鱼落雁，闭月羞花」中「落雁」指的是？', '[\"貂蝉\", \"杨玉环\", \"王昭君\", \"西施\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('375', '', '18K金的含金量是多少？', '[\"95%\", \"85%\", \"65%\", \"75%\"]', '1', '流行', '时尚', '7', '0');
INSERT INTO `jb_questions` VALUES ('376', '', '下列哪位是2017年在任的国际奥委会主席？', '[\"托马斯巴赫  \", \"顾拜旦 \", \"罗格\", \"萨马兰奇\"]', '1', '流行', '体育', '7', '0');
INSERT INTO `jb_questions` VALUES ('377', '军ღ', '中国第一枚网球项目的奥运会金牌的是由哪两位获得的？', '[\"李婷和孙甜甜\", \"彭帅和张帅\", \"李娜和李婷\", \"郑洁和晏子\"]', '1', '流行', '体育', '7', '0');
INSERT INTO `jb_questions` VALUES ('378', '小苏', '世界最长山脉是？', '[\"喜马拉雅山脉\", \"阿尔卑斯山脉\", \"安第斯山脉\", \"昆仑山脉\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('379', 'GENIUS', '电视剧《天道》的男主角是？', '[\"陈宝国\", \"王志文\", \"孙红雷\", \"陈道明\"]', '1', '娱乐', '电视', '7', '0');
INSERT INTO `jb_questions` VALUES ('380', 'irene', '「乡为身死而不受，今为妻妾之奉为之」出自？', '[\"《后汉书隗嚣传》\", \"《道德经》\", \"《鱼我所欲也》\", \"《史记孟荀列传》\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('381', '汉彬', '曹操是哪个朝代的人？', '[\"魏晋南北朝\", \"三国\", \"东汉\", \"西汉\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('382', '', '周星驰电影《功夫》中包租婆用来对付火云邪神的是哪种武功？', '[\"金龙手\", \"狮吼功\", \"铁扫帚功\", \"柔骨功\"]', '1', '娱乐', '电影', '7', '0');
INSERT INTO `jb_questions` VALUES ('383', '以后的以后', '3的立方等于？', '[\"3\", \"18\", \"9\", \"27\"]', '1', '理科', '数学', '7', '0');
INSERT INTO `jb_questions` VALUES ('384', 'Emwa', '3⁴=？', '[\"27\", \"64\", \"81\", \"87\"]', '1', '理科', '数学', '7', '0');
INSERT INTO `jb_questions` VALUES ('385', '邵力子', '戴高乐、丘吉尔、罗斯福吉利推崇的世界名著《乌合之众》的作者是？', '[\"勒庞\", \"弗洛伊德\", \"奥尔波特\", \"荣格\"]', '1', '文艺', '文化', '7', '0');
INSERT INTO `jb_questions` VALUES ('386', '无名氏', '连通北美五大湖和大西洋的河流是？', '[\"圣劳伦斯河\", \"尼罗河\", \"密西西比河\", \"塞纳河\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('387', '向义', '「营改增」是什么的简称？', '[\"营业改增加金额\", \"营业增加税\", \"营业税改增值税\", \"营业改增加税\"]', '1', '文科', '经济', '7', '0');
INSERT INTO `jb_questions` VALUES ('388', '', '神话传说中的托塔天王是？', '[\"姬昌\", \"申公豹\", \"李靖\", \"姜子牙\"]', '1', '文艺', '文化', '7', '0');
INSERT INTO `jb_questions` VALUES ('389', '', '中国象棋棋盘上的「楚河汉界」跟那两位历史人物有关？', '[\"刘邦、项羽\", \"黄帝、蚩尤\", \"刘备、曹操\", \"李世民、宇文化及\"]', '1', '文艺', '文化', '7', '0');
INSERT INTO `jb_questions` VALUES ('390', 'JM', '三原色的光的强度均为0就是什么色？', '[\"黑色\", \"浅蓝色\", \"白色\", \"绿色\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('391', '郊区的耶稣', '啤酒瓶盖上有多少个齿？', '[\"23个\", \"21个\", \"25个\", \"19个\"]', '1', '生活', '日常', '7', '0');
INSERT INTO `jb_questions` VALUES ('392', '', '天然食品中，营养最完整和易于吸收的是？', '[\"乳类\", \"谷物\", \"水果\", \"鱼类\"]', '1', '生活', '健康', '7', '0');
INSERT INTO `jb_questions` VALUES ('393', '老炮儿', '「滕王阁序」的作者是？', '[\"王勃\", \"王安石\", \"苏东坡\", \"李白\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('394', '', '姚明曾在NBA效力的球队是？', '[\"公牛\", \"火箭\", \"小牛\", \"湖人\"]', '1', '流行', '体育', '7', '0');
INSERT INTO `jb_questions` VALUES ('395', '', '哪个诗派是我国文学史上第一个有正式名称的诗文派别？', '[\"山西诗派\", \"江南诗派\", \"江西诗派\", \"山东诗派\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('396', '凉凉', '中国第一位女皇帝武则天的故乡是？', '[\"西安\", \"文水\", \"长安\", \"洛阳\"]', '1', '文艺', '文化', '7', '0');
INSERT INTO `jb_questions` VALUES ('397', '内圣*外王', '诗句「洛阳亲友如相问」下一句是？', '[\"一片冰心在玉壶\", \"一行白鹭上青天\", \"两个黄鹂鸣翠柳\", \"轻舟已过万重山\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('398', '', '「落神香妃」是我国十大名花中哪个的别称？', '[\"水仙花\", \"月季花\", \"杜鹃花\", \"牡丹花\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('399', '平安〈招聘〉一李经理1588443087', '「锄禾日当午」出自哪一首诗？', '[\"锄禾\", \"怜农\", \"锄头\", \"悯农\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('400', 'Carol', '「牧童骑黄牛」的下一句是', '[\"遥指杏花村\", \"歌声振林樾\", \"言师采药去\", \"散学归来早\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('401', '玖', '下列哪种品牌不是口红的牌子？', '[\"VVC\", \"NARS\", \"TOMFORD\", \"MAC\"]', '1', '流行', '时尚', '7', '0');
INSERT INTO `jb_questions` VALUES ('402', '', '以下哪种运动同时在场人数最少？', '[\"篮球\", \"足球\", \"排球\", \"橄榄球\"]', '1', '流行', '体育', '7', '0');
INSERT INTO `jb_questions` VALUES ('403', '  路波', '历史上著名的官渡之战中，最终哪位军事家获得最后的胜利？', '[\"袁绍\", \"曹操\", \"刘备\", \"诸葛亮\"]', '1', '文科', '军事', '7', '0');
INSERT INTO `jb_questions` VALUES ('404', '', '故人说的「碎金饭」指的是现在的那种食物？', '[\"糯米饭\", \"蛋炒饭\", \"杂粮饭\", \"五谷饭\"]', '1', '生活', '饮食', '7', '0');
INSERT INTO `jb_questions` VALUES ('405', 'Jizzn✋', '下列哪个国家以西班牙语为通用语言？', '[\"也门\", \"莱索托\", \"巴西\", \"阿根廷\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('406', 'dyk', '康熙皇帝历史上废了几次太子？', '[\"三次\", \"一次\", \"两次\", \"四次\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('407', '忆@@昔', '「自古逢秋悲寂寥」的下一句是？', '[\"何事秋风悲画扇\", \"我言秋日胜春朝\", \"沧海月明珠有泪\", \"蓝田日暖玉生烟\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('408', '啥的钥匙', '加拿大的国名源于哪门语言？', '[\"印第安语\", \"法语\", \"英语\", \"西班牙语\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('409', 'Хүчирхэг', '二战中被德国「闪电战」最早击败的国家是？', '[\"西班牙\", \"波兰\", \"荷兰\", \"法国\"]', '1', '文科', '军事', '7', '0');
INSERT INTO `jb_questions` VALUES ('410', '南京初见', '昆虫蚂蚁有几条腿？', '[\"6条\", \"8条\", \"4条\", \"12\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('411', '王威', '「冯唐易老，李广难封」出自哪部名篇？', '[\"兰亭集序\", \"岳阳楼记\", \"赤壁赋\", \"滕王阁序\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('412', '大梦一场', '「赣」是指我国哪个省份的简称？', '[\"吉林\", \"江西\", \"安徽\", \"湖北\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('413', '嘟嘟嘟', '唐代贾岛「鸟宿池边树，僧（ ）月下门。」，括号处作为点睛之笔的字是？', '[\"立\", \"敲\", \"推\", \"开\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('414', '', '橄榄球运动起源于哪个国家？', '[\"意大利\", \"法国\", \"美国\", \"英国\"]', '1', '流行', '体育', '7', '0');
INSERT INTO `jb_questions` VALUES ('415', '孤影', '下面图形不属于圆锥曲线的是？', '[\"椭圆\", \"抛物线\", \"圆锥\", \"双曲线\"]', '1', '理科', '数学', '7', '0');
INSERT INTO `jb_questions` VALUES ('416', '', '《睡美人》中，睡美人沉睡了多少年后被王子唤醒？', '[\"100年\", \"20年\", \"10年\", \"1000年\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('417', '瘗逝年', '下列哪个成语不是出自《三国演义》？', '[\"南征北战\", \"望梅止渴\", \"欲擒故纵\", \"水淹七军\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('418', '我的姑娘叫夏天', '《红楼梦》中，宝玉的「通房丫头」是？', '[\"平儿\", \"媚人\", \"袭人\", \"秋纹\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('419', '(^_^) (^_^)', '「锅包肉」所属菜系是？', '[\"淮扬菜\", \"东北菜\", \"川菜\", \"鲁菜\"]', '1', '生活', '饮食', '7', '0');
INSERT INTO `jb_questions` VALUES ('420', '大风', '明朝「九千岁」指的是谁？', '[\"魏中恒\", \"魏忠恒\", \"魏中贤\", \"魏忠贤\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('421', '恩特螺旋钻铣挖机岩石锯', '中国科举制度从哪个朝代开始实行？', '[\"唐朝\", \"隋朝\", \"清朝\", \"明朝\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('422', '', '希腊神话中是谁从太阳神阿波罗那里为人间去偷来了火种？', '[\"宙斯\", \"波士顿\", \"休斯顿\", \"普罗米修斯\"]', '1', '文艺', '文化', '7', '0');
INSERT INTO `jb_questions` VALUES ('423', '', '哪个民族的建筑是以「吊脚楼」为主？', '[\"苗族\", \"傣族\", \"回族\", \"哈萨克族\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('424', '那个叫大笨蛋的', '以下哪个球队不属于英超？', '[\"利物浦\", \"西汉姆\", \"塞维利亚\", \"热刺\"]', '1', '流行', '体育', '7', '0');
INSERT INTO `jb_questions` VALUES ('425', '汉', '「黄鹤楼」位于哪个城市？', '[\"武汉\", \"西安\", \"郑州\", \"北京\"]', '1', '生活', '世界', '7', '0');
INSERT INTO `jb_questions` VALUES ('426', '', '俗话说「君子报仇」的下一句是？', '[\"小不忍则乱大谋\", \"十年不晚\", \"让你三招\", \"从不隔夜\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('427', '罔两', '以下哪位是唐宋八大家之一？', '[\"曾肇\", \"曾巩\", \"曾协\", \"曾布\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('428', 'GENIUS', '著名小说《达芬奇密码》剧情中最后的棺材在下列哪一处？', '[\"威斯敏斯特教堂\", \"小教堂\", \"卢浮宫\", \"英国图书馆\"]', '1', '娱乐', '电影', '7', '0');
INSERT INTO `jb_questions` VALUES ('429', '^ω^', '抛一枚质地均匀的硬币两次，两次都正面朝上的概率是多少？', '[\"一\", \"四分之一\", \"二分之一\", \"三分之一\"]', '1', '理科', '数学', '7', '0');
INSERT INTO `jb_questions` VALUES ('430', '', '「CET—4」是国家教育哪种考试的简称？', '[\"英语二级\", \"英语三级\", \"英语一级\", \"英语四级\"]', '1', '文科', '外语', '7', '0');
INSERT INTO `jb_questions` VALUES ('431', '于大川', '「长平之战」是秦国与哪个国家之间的战争？', '[\"韩国\", \"燕国\", \"楚国\", \"赵国\"]', '1', '文科', '军事', '7', '0');
INSERT INTO `jb_questions` VALUES ('432', 'vivo手机顾问梅', '我们常说女孩「二八年华」是指多少岁？', '[\"16岁\", \"20岁\", \"28岁\", \"18岁\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('433', '海弗蓝', '目前已知体型最大的鱼类是？', '[\"巨齿鲨\", \"鲸鲨\", \"蓝鲸\", \"大白鲨\"]', '1', '理科', '生物', '7', '0');
INSERT INTO `jb_questions` VALUES ('434', 'APTX4869', '日漫《名侦探柯南》的作者是?', '[\"宫崎骏\", \"毛利小五郎\", \"青山冈昌\", \"绿川幸\"]', '1', '娱乐', '动漫', '7', '0');
INSERT INTO `jb_questions` VALUES ('435', '车', '《中华人民共和国国歌》又名为？', '[\"歌唱祖国\", \"八路军进行曲\", \"义勇军进行曲\", \"爱我中华\"]', '1', '娱乐', '音乐', '7', '0');
INSERT INTO `jb_questions` VALUES ('436', '花开半夏', '下列选项中可以清除粘到衣服上的口香糖的是？', '[\"打火机烤\", \"放冰箱冷冻\", \"用水冲\", \"使劲抠下来\"]', '1', '生活', '日常', '7', '0');
INSERT INTO `jb_questions` VALUES ('437', 'Louise 66', '首席财务官的英文缩写是？', '[\"CMO\", \"CFO\", \"COO\", \"CEO\"]', '1', '文科', '外语', '7', '0');
INSERT INTO `jb_questions` VALUES ('438', '无名氏', '独奏口琴分为三大类，分别是「布鲁斯口琴」、「半音阶口琴」和什么口琴？', '[\"贝斯\", \"重音\", \"复音\", \"和弦\"]', '1', '娱乐', '音乐', '7', '0');
INSERT INTO `jb_questions` VALUES ('439', '', '「和谐」一词最早出现在我国哪部先秦学术著作中？', '[\"孔子\", \"韩非子\", \"孟子\", \"管子\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('440', '', '毛利人会客时，最常见也是最有特色的礼叫什么礼？', '[\"碰鼻礼\", \"碰额头\", \"亲吻脸颊\", \"碰脸颊\"]', '1', '生活', '世界', '7', '0');
INSERT INTO `jb_questions` VALUES ('441', 'Simon', '《火影忍者》中，佐助开启的最终写轮眼叫？', '[\"六芒星写轮眼\", \"万华镜写轮眼\", \"万花筒写轮眼\", \"直巴写轮眼\"]', '1', '娱乐', '游戏', '7', '0');
INSERT INTO `jb_questions` VALUES ('442', 'YYS', '「却道天凉好个秋」是哪位词人的作品？', '[\"李清照\", \"辛弃疾\", \"苏轼\", \"柳永\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('443', 'Pen', '被称为「中华第一牌坊」的是？', '[\"许国石坊\", \"奕世尚书坊\", \"大三巴牌坊\", \"顺峰山牌坊\"]', '1', '生活', '饮食', '7', '0');
INSERT INTO `jb_questions` VALUES ('444', '', '帝国的出现象征着王权的兴起，人类史上第一个帝国是？', '[\"亚述帝国\", \"米地亚帝国\", \"巴比伦帝国\", \"阿卡德帝国\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('445', '陈宇', '《中华小当家》是哪个国家或地区的作品？', '[\"韩国\", \"日本\", \"中国\", \"朝鲜\"]', '1', '娱乐', '动漫', '7', '0');
INSERT INTO `jb_questions` VALUES ('446', '路寓', '「出师未捷身先死，长使英雄泪满襟」，是对哪位历史人物的评价？', '[\"项羽\", \"诸葛亮\", \"霍去病\", \"岳飞\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('447', '惺忪的睡眼', '「太上，下知有之。其次，亲而誉之」出自哪部典籍？', '[\"《冲虚经》\", \"《南华经》\", \"《清静经》\", \"《道德经》\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('448', '飞翔的鱼', '清朝时期镇南关大捷打败的是哪个国家？', '[\"越南\", \"法国\", \"西班牙\", \"英国\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('449', '金维', '已知的距银河系最近的大星系是？', '[\"M31\", \"半人马\", \"阿尔法α\", \"M78\"]', '1', '理科', '天文', '7', '0');
INSERT INTO `jb_questions` VALUES ('450', '', '韩愈《师说》中，「闻道有先后」的下一句是？', '[\"已经是最后一句\", \"专业有术攻\", \"术业有专攻\", \"行行出状元\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('451', '知乎', '世界第一大岛是？', '[\"格陵兰岛\", \"巴芬岛\", \"马达加斯加岛\", \"冰岛\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('452', '', '世界上最早证明自由落体定律的人是？', '[\"笛卡尔\", \"牛顿\", \"哥白尼\", \"伽利略\"]', '1', '理科', '理化', '7', '0');
INSERT INTO `jb_questions` VALUES ('453', '临江仙', '二十四史之一的《三国志》的作者是？', '[\"范晔\", \"罗贯中\", \"毛宗岗\", \"陈寿\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('454', '冷马', '人民大会堂的巨幅国画《江山如此多娇》的作者是傅抱石和谁联合完成的？', '[\"徐悲鸿\", \"李苦禅\", \"李可染\", \"关山月\"]', '1', '流行', '名人', '7', '0');
INSERT INTO `jb_questions` VALUES ('455', '扎Zn了，老Fe', '「绔」字的正确读音是？', '[\"gu\", \"gua\", \"kua\", \"ku\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('456', '', '以下不属于世界四大平价品牌的是？', '[\"KENZO\", \"H&M\", \"ZARA\", \"GAP\"]', '1', '流行', '时尚', '7', '0');
INSERT INTO `jb_questions` VALUES ('457', '不是鱼', '以下哪种物质遇水会变成玫红色？', '[\"氢氧化钠\", \"二氧化硫\", \"高锰酸钾\", \"一氧化碳\"]', '1', '理科', '理化', '7', '0');
INSERT INTO `jb_questions` VALUES ('458', 'D上善若水', '下列哪个历史人物出生于江苏宿迁？', '[\"关羽\", \"刘备\", \"刘邦\", \"项羽\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('459', 'ChrisGoo', '下列不属于朴赞郁导演「复仇三部曲」的是？', '[\"亲切的金子\", \"杀人回忆\", \"我要复仇\", \"老男孩\"]', '1', '娱乐', '电影', '7', '0');
INSERT INTO `jb_questions` VALUES ('460', '', '「千门万户曈曈日，总把新桃换旧符」中的「新桃」是什么意思？', '[\"新年的寿桃馒头\", \"早开的桃花\", \"新年的桃花\", \"新的桃符\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('461', 'candy', '中国历史上存在时间最长的朝代是？', '[\"元\", \"周\", \"西汉\", \"宋\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('462', '', '有「交响乐之父」称号，维也纳古典音乐派第一位代表人物是谁？', '[\"李斯特\", \"瓦格纳\", \"海顿\", \"巴赫\"]', '1', '文艺', '演艺', '7', '0');
INSERT INTO `jb_questions` VALUES ('463', '无意', '《归去来兮辞》的作者是？', '[\"屈原\", \"谢灵运\", \"陶渊明\", \"曹植\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('464', '酣畅', '安史之乱后，是哪位民族英雄收复了河西走廊?', '[\"霍去病\", \"李晟\", \"张议潮\", \"郭昕\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('465', '', '豆类品种有很多，其中毛豆与黄豆的关系是？', '[\"同一物种\", \"属不同的属\", \"属不同的种\", \"属不同的科\"]', '1', '理科', '生物', '7', '0');
INSERT INTO `jb_questions` VALUES ('466', '', '植物光合作用的主要场所是？', '[\"高尔基体\", \"核糖体\", \"内质网\", \"叶绿体\"]', '1', '理科', '生物', '7', '0');
INSERT INTO `jb_questions` VALUES ('467', '那谁家那小谁', '「不见合欢花」的下一句是？', '[\"路遥知马力\", \"空倚相思树\", \"绕床弄青梅\", \"踏过樱花第几桥\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('468', '吴延飞', '希腊位于哪个半岛？', '[\"伊比利亚半岛\", \"巴尔干半岛\", \"亚平宁半岛\", \"斯堪的纳维亚半岛\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('469', 'jiujiujiu', '三套鸭属于我国哪一菜系？', '[\"淮扬菜\", \"客家菜\", \"川菜\", \"粤菜\"]', '1', '生活', '饮食', '7', '0');
INSERT INTO `jb_questions` VALUES ('470', '万里追云任逍遥', '「三氧化二铁」的外观颜色是？', '[\"红棕色\", \"铁黑色\", \"灰白色\", \"墨绿色\"]', '1', '理科', '理化', '7', '0');
INSERT INTO `jb_questions` VALUES ('471', '', '德国医生借鉴民间的吞剑表演，发明了哪种医学检查方法？', '[\"CT\", \"B超\", \"肠镜\", \"胃镜\"]', '1', '生活', '健康', '7', '0');
INSERT INTO `jb_questions` VALUES ('472', '契克', '植物细胞中可以进行光合作用的部位是？', '[\"叶绿体\", \"细胞壁\", \"细胞质\", \"内质网\"]', '1', '理科', '生物', '7', '0');
INSERT INTO `jb_questions` VALUES ('473', 'Time', '下列不被戏称为「雪橇三傻」的狗是？', '[\"拉布拉多\", \"阿拉斯加\", \"萨摩耶\", \"哈士奇\"]', '1', '生活', '日常', '7', '0');
INSERT INTO `jb_questions` VALUES ('474', '', 'EIU发布的「2017全球生活报告」指出，全球生活成本最贵的城市是？', '[\"新加坡\", \"东京\", \"苏黎世\", \"深圳\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('475', '', '通常在衬衫上，男装和女装的扣子会在哪边？', '[\"都在右边\", \"都在左边\", \"男右女左\", \"男左女右\"]', '1', '流行', '时尚', '7', '0');
INSERT INTO `jb_questions` VALUES ('476', '', '范玮琪在电影《被偷走的那五年》中演唱的主题曲叫什么名字？', '[\"最重要的决定\", \"悄悄告诉你\", \"在幸福的路上\", \"陪你\"]', '1', '娱乐', '音乐', '7', '0');
INSERT INTO `jb_questions` VALUES ('477', '夜秋楓', '下列不属于汉服款式的是？', '[\"道袍\", \"旗袍\", \"直裾深衣\", \"裋褐\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('478', 'hcy.Allison', '宋代文学家欧阳修的词作「把酒祝东风，且共从容」的词牌名是？', '[\"浪淘沙\", \"蝶恋花\", \"菩萨蛮\", \"清平乐\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('479', 'xuguoxin', '以下哪个菜是东北菜？', '[\"鱼香肉丝\", \"松鼠鳜鱼\", \"锅包肉\", \"麻婆豆腐\"]', '1', '生活', '饮食', '7', '0');
INSERT INTO `jb_questions` VALUES ('480', 'FST_____', '下列选项中，在地势上位于我国第二阶梯的是？', '[\"青藏高原\", \"闽浙丘陵\", \"云贵高原\", \"唐古拉山\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('481', '', '「耄耋」是指多少岁？', '[\"60、70\", \"50、60\", \"80、90\", \"70、80\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('482', '张不三', '电影的诞生时间是？', '[\"1862\", \"1906\", \"1895\", \"1899\"]', '1', '文艺', '艺术', '7', '0');
INSERT INTO `jb_questions` VALUES ('483', 'coshamrockla', '体毛细血管分布最丰富的部位是？', '[\"手掌\", \"头皮\", \"大腿\", \"腹部\"]', '1', '生活', '健康', '7', '0');
INSERT INTO `jb_questions` VALUES ('484', '曾聪', '以下哪个不是东南亚国家？', '[\"缅甸\", \"新加坡\", \"巴布亚新几内亚\", \"老挝\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('485', '梦伊人', '我国第一套人民币的设计者是？', '[\"叶小小\", \"刘文西\", \"毛主席\", \"周恩来\"]', '1', '文科', '经济', '7', '0');
INSERT INTO `jb_questions` VALUES ('486', '柠檬', '以下哪部电影不是导演王家卫的作品？', '[\"《春光乍泄》\", \"《重庆森林》\", \"《赵氏孤儿》\", \"《旺角卡门》\"]', '1', '娱乐', '电影', '7', '0');
INSERT INTO `jb_questions` VALUES ('487', '', '诗词中常用些险韵奇字，意境诡谲华丽，被称为「诗鬼」的诗人为谁？', '[\"孟浩然\", \"王维\", \"李白\", \"李贺\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('488', '', '《山海经》中记载的哪座山是人界唯一能够到达天界的路径？', '[\"不周山\", \"衡山\", \"五台山\", \"不二山\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('489', '', '三国时期「身高八尺，姿颜雄伟」，字子龙的蜀汉名将是？', '[\"赵云\", \"关羽\", \"黄忠\", \"张飞\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('490', '', '「江山社稷」中的「稷」在古代是指？', '[\"五谷之神\", \"黎民百姓\", \"土地之神\", \"封建官僚\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('491', '', '电视剧《天龙八部》中，星宿派三宝之一，阿紫从丁春秋处偷的王鼎叫什么？', '[\"神木王鼎\", \"神农鼎\", \"神王鼎\", \"九阴鼎\"]', '1', '娱乐', '电视', '7', '0');
INSERT INTO `jb_questions` VALUES ('492', '紫靛清霜', '世界上最大内陆国是？', '[\"哈萨克斯坦\", \"蒙古\", \"塔吉克斯坦\", \"吉尔吉斯斯坦\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('493', '李是民', '我国自主研发的「鹰击」和「霹雳」系列武器的武器类型分别是？', '[\"洲际，巡航导弹\", \"防空，巡航导弹\", \"反舰，空空导弹\", \"巡航，反舰导弹\"]', '1', '文科', '军事', '7', '0');
INSERT INTO `jb_questions` VALUES ('494', '', '位于江苏无锡市的风景名胜「鼋头渚」是哪个著名湖泊中的半岛？', '[\"阳澄湖\", \"太湖\", \"西湖\", \"洞庭湖\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('495', '', '阿基米德原理是在形容下列哪种物理现象？', '[\"引力\", \"浮力\", \"磁力\", \"内力\"]', '1', '理科', '理化', '7', '0');
INSERT INTO `jb_questions` VALUES ('496', '', '以画圣母像成名，代表作有《西斯廷圣母》的画家是谁？', '[\"拉斐尔·圣齐奥\", \"达·芬奇\", \"爱因斯坦\", \"米开朗基罗\"]', '1', '文艺', '艺术', '7', '0');
INSERT INTO `jb_questions` VALUES ('497', '小莉', '我国面积最大的平原是？', '[\"华北平原\", \"关中平原\", \"东北平原\", \"江汉平原\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('498', '轻描淡写', '我国海陆总面积是多少万平方千米？', '[\"1060\", \"1260\", \"300\", \"960\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('499', 'W_K', '8−2×3=？', '[\"0\", \"18\", \"6\", \"2\"]', '1', '理科', '数学', '7', '0');
INSERT INTO `jb_questions` VALUES ('500', '咖啡旋律', '王维写的《送元二使安西》中「渭城朝雨浥轻尘」中的「浥」是什么意思？', '[\"坑洼地\", \"湿润\", \"红润\", \"浥浥\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('501', '', '2011年，球队史上首次夺得NBA总冠军的球队是？', '[\"热火\", \"雷霆\", \"小牛\", \"火箭\"]', '1', '流行', '体育', '7', '0');
INSERT INTO `jb_questions` VALUES ('502', '', '美剧《冰血暴》是由哪家电视台播出的？', '[\"CBS\", \"ABC\", \"FX\", \"HBO\"]', '1', '娱乐', '电视', '7', '0');
INSERT INTO `jb_questions` VALUES ('503', '', '下列歌曲不由筷子兄弟原唱的是？', '[\"爱情买卖\", \"小苹果\", \"父亲\", \"老男孩\"]', '1', '娱乐', '音乐', '7', '0');
INSERT INTO `jb_questions` VALUES ('504', '軒熯陳', '0属于以下哪种数字类型?', '[\"正整数\", \"自然数\", \"无理数\", \"负整数\"]', '1', '理科', '数学', '7', '0');
INSERT INTO `jb_questions` VALUES ('505', '健力宝筒筒', '平面上五条直线相交，最多能有几个交点？', '[\"10\", \"8\", \"5\", \"15\"]', '1', '理科', '数学', '7', '0');
INSERT INTO `jb_questions` VALUES ('506', '旭日之光', '我国加入世界贸易组织是在哪一年？', '[\"2003年\", \"2004年\", \"2002年\", \"2001年\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('507', '', '在色环上，绿色的对色是？', '[\"黄色\", \"红色\", \"蓝色\", \"黑色\"]', '1', '文艺', '设计', '7', '0');
INSERT INTO `jb_questions` VALUES ('508', '刘大哈.com', '「谢耳朵」出自哪部美剧？', '[\"生活大爆炸\", \"吸血鬼日记\", \"破产姐妹\", \"邪恶力量\"]', '1', '娱乐', '电视', '7', '0');
INSERT INTO `jb_questions` VALUES ('509', '晴空', '加拿大首都是？', '[\"温哥华\", \"渥太华\", \"华盛顿\", \"加德满都\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('510', '齐敏森', '请问中国四大赏枫名山中不包含下列哪一座？', '[\"岳麓山\", \"栖霞山\", \"武夷山\", \"香山\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('511', '', '下列哪部动画电影不是由皮克斯公司制作？', '[\"蜜蜂总动员\", \"赛车总动员\", \"海底总动员\", \"玩具总动员\"]', '1', '娱乐', '电影', '7', '0');
INSERT INTO `jb_questions` VALUES ('512', '孙艺萌', '「汤姆斯杯赛事」是指哪项体育运动的比赛？', '[\"乒乓球\", \"台球\", \"网球\", \"羽毛球\"]', '1', '流行', '体育', '7', '0');
INSERT INTO `jb_questions` VALUES ('513', '', '与古力特、里杰卡尔德并称为荷兰三剑客的足球运动员是谁？', '[\"克林斯曼\", \"马特乌斯\", \"布雷默\", \"巴斯滕\"]', '1', '流行', '体育', '7', '0');
INSERT INTO `jb_questions` VALUES ('514', '兰金', '「岂不罹凝寒」的下一句是？', '[\"松柏有本性\", \"相顾无相识\", \"大漠孤烟直\", \"月下飞天镜\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('515', '李', '下列被称为花间派鼻祖的是谁？', '[\"晏殊\", \"韦庄\", \"温庭筠\", \"韦应物\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('516', '林易', '「横眉冷对千夫指」这句话的作者是？', '[\"杜甫\", \"王安石\", \"鲁迅\", \"陆游\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('517', '', '电视剧《还珠格格》中，紫薇称哪种蔬菜为「红嘴绿鹦哥」？', '[\"西红柿\", \"青菜\", \"苋菜\", \"菠菜\"]', '1', '娱乐', '电视', '7', '0');
INSERT INTO `jb_questions` VALUES ('518', '雨依悠扬', '我国第一种全天候截击机是？', '[\"歼-10B\", \"歼-8A\", \"歼-7C/D\", \"P-61\"]', '1', '文科', '军事', '7', '0');
INSERT INTO `jb_questions` VALUES ('519', 'qiqi Eva', '下面运动员中哪位是游泳运动员？', '[\"张培萌\", \"仲满\", \"孙杨\", \"张继科\"]', '1', '流行', '体育', '7', '0');
INSERT INTO `jb_questions` VALUES ('520', '', '理论上讲，太空中的宇航员在太空经过的时间与地球上的时间有什么不同？', '[\"过的慢\", \"以上都不对\", \"过的快\", \"不快不慢\"]', '1', '理科', '天文', '7', '0');
INSERT INTO `jb_questions` VALUES ('521', '', '日本著名企业松下、夏普的总部都设立在哪个城市？', '[\"京都\", \"札幌\", \"东京\", \"大阪\"]', '1', '流行', '商业', '7', '0');
INSERT INTO `jb_questions` VALUES ('522', '', '电影《人在囧途之泰囧》中，由王宝强饰演的王宝原本的工作是卖什么的？', '[\"葱油饼\", \"烤冷面\", \"煎饼果子\", \"手抓饼\"]', '1', '娱乐', '电影', '7', '0');
INSERT INTO `jb_questions` VALUES ('523', '故喂', '豇豆的「豇」的正确读音是？', '[\"gang\", \"jiang\", \"jia\", \"gan\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('524', '鑫', '遵义市位于哪个省？', '[\"云南省\", \"贵州省\", \"湖南省\", \"四川省\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('525', '', '冯小刚电影《非诚勿扰》中，梁笑笑是由哪位女演员饰演？', '[\"舒淇\", \"柳岩\", \"舒畅\", \"杨幂\"]', '1', '娱乐', '电影', '7', '0');
INSERT INTO `jb_questions` VALUES ('526', '冷伊泊幻', '炒菜时锅里着火了怎么办？', '[\"关阀门\", \"断电\", \"用锅盖扑灭\", \"用水浇灭\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('527', 'HK', '《春江花月夜》的作者是？', '[\"张若虚\", \"李煜\", \"赵佶\", \"陈后主\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('528', 'Aoxaom', '世界地球日是哪一天？', '[\"3月22日\", \"4月22日\", \"6月22日\", \"5月22日\"]', '1', '生活', '世界', '7', '0');
INSERT INTO `jb_questions` VALUES ('529', 'pipi ', '「疟疾」是由哪种动物传播的？', '[\"蜻蜓\", \"苍蝇\", \"蚊子\", \"麻雀\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('530', '无名氏', '明朝最后一位皇帝崇祯自杀殉国，他选择的自杀方式是？', '[\"投河\", \"上吊\", \"服毒\", \"切腹\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('531', '假_装斯文', '梅西在2012年打破欧洲单赛季总进球记录，梅西最终单赛季总进球记录是？', '[\"72球\", \"70球\", \"73球\", \"71球\"]', '1', '流行', '体育', '7', '0');
INSERT INTO `jb_questions` VALUES ('532', '包子', '七大洲中南极洲面积排名第几？', '[\"4\", \"7\", \"5\", \"6\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('533', '', '在坐标轴中，x轴与y轴交会的交点叫什么？', '[\"坐标原点\", \"交点\", \"O点\", \"零点\"]', '1', '理科', '数学', '7', '0');
INSERT INTO `jb_questions` VALUES ('534', '海里绿壳', '「君子一言 （si）马难追」括号中的文字是？', '[\"寺\", \"肆\", \"四\", \"驷\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('535', '', '「墙角的花，你孤芳自赏时，天地便小了」是哪位女作家的诗句？', '[\"严歌苓\", \"张爱玲\", \"冰心\", \"丁玲\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('536', 'lucifer', '中国铁路高速的简称是？', '[\"DRH\", \"DCZ\", \"HRD\", \"CRH\"]', '1', '生活', '日常', '7', '0');
INSERT INTO `jb_questions` VALUES ('537', '', '中国第一汽车集团公司总部在哪个城市？', '[\"青岛\", \"上海\", \"长春\", \"沈阳\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('538', '', '腊月是指几月？', '[\"一月\", \"十一月\", \"二月\", \"十二月\"]', '1', '生活', '日常', '7', '0');
INSERT INTO `jb_questions` VALUES ('539', '', '中国最古老的运河是？', '[\"黄河\", \"京杭大运河\", \"灵渠\", \"长江\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('540', '淳子', '被誉为「诗王」的是哪位诗人？', '[\"李白\", \"白居易\", \"杜甫\", \"王维\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('541', '夜幕下的永恒', '「月牙泉」位于中国哪个省？', '[\"西宁省\", \"甘肃省\", \"陕西省\", \"新疆省\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('542', 'Damon彦', '2017年NBA球衣的赞助商是？', '[\"耐克\", \"安德玛\", \"AND1\", \"阿迪达斯\"]', '1', '流行', '体育', '7', '0');
INSERT INTO `jb_questions` VALUES ('543', '冬冬', '字体「瘦金体」是以下哪位皇帝所创？', '[\"唐明皇\", \"宋太祖\", \"宋仁宗\", \"宋徽宗\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('544', '枪火', '世界上第一颗人造地球卫星是由哪个国家发射成功的？', '[\"前苏联\", \"俄罗斯\", \"中国\", \"美国\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('545', '嘘，羊来了！', '乙醇汽油中乙醇的添加比例是多少？', '[\"0.15\", \"0.2\", \"0.1\", \"0.05\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('546', '', '王维《鹿柴》中名句，「空山不见人」的下一句是？', '[\"却闻人语声\", \"却闻人语响\", \"但闻人语响\", \"但闻人语声\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('547', '', '《王者荣耀》中不包含的职业是？', '[\"刺客\", \"战士\", \"圣骑士\", \"法师\"]', '1', '娱乐', '游戏', '7', '0');
INSERT INTO `jb_questions` VALUES ('548', '翟雨祥樂', '下列哪个物理单位最小？', '[\"原子\", \"夸克\", \"质子\", \"分子\"]', '1', '理科', '天文', '7', '0');
INSERT INTO `jb_questions` VALUES ('549', '', '以甘蔗糖蜜为原料的朗姆酒原产自哪个国家？', '[\"伊朗\", \"古巴\", \"以色列\", \"埃及\"]', '1', '生活', '世界', '7', '0');
INSERT INTO `jb_questions` VALUES ('550', 'Pres1dent', '空气中含量第二的气体是？', '[\"氮气\", \"氧气\", \"二氧化碳\", \"氢气\"]', '1', '理科', '理化', '7', '0');
INSERT INTO `jb_questions` VALUES ('551', '', 'Windows系统下的复制操作是ctrl和什么按键的组合？', '[\"C\", \"F\", \"B\", \"K\"]', '1', '流行', '科技', '7', '0');
INSERT INTO `jb_questions` VALUES ('552', '___ 锦瑟年华、也难敌似水流年....', '四大名著《三国演义》的作者是？', '[\"吴承恩\", \"施耐庵\", \"曹雪芹\", \"罗贯中\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('553', '', '澳大利亚货币澳元的货币代码是？', '[\"AUD\", \"HKD\", \"CAD\", \"USD\"]', '1', '文科', '经济', '7', '0');
INSERT INTO `jb_questions` VALUES ('554', '爱快王希强 170-9030-3333', '具备资料存储功能的装置「网络附属存储」的英文简称是？', '[\"Jay\", \"SAL\", \"Nov\", \"Nas\"]', '1', '流行', '科技', '7', '0');
INSERT INTO `jb_questions` VALUES ('555', '^ ^', '波兰的首都是哪个城市？', '[\"新德里\", \"马德里\", \"华沙\", \"卢布林\"]', '1', '生活', '世界', '7', '0');
INSERT INTO `jb_questions` VALUES ('556', '', '《海贼王》中，路飞一行人中，在船上担任船医的是？', '[\"索隆\", \"罗宾\", \"乌索普\", \"乔巴\"]', '1', '娱乐', '动漫', '7', '0');
INSERT INTO `jb_questions` VALUES ('557', 'ゞ璃镜', '杰森斯坦森没有出演下列哪部电影？', '[\"机械师\", \"速度与激情\", \"敢死队\", \"八面埋伏\"]', '1', '娱乐', '电影', '7', '0');
INSERT INTO `jb_questions` VALUES ('558', 'Lincoln\'s Walker', '被从「行星」行列除名的冥王星现在被归类为？', '[\"卫星\", \"白矮星\", \"小行星\", \"矮行星\"]', '1', '理科', '天文', '7', '0');
INSERT INTO `jb_questions` VALUES ('559', '', 'TVB剧《法网狙击》中女主角「况天蓝」是由哪位女明星扮演的?', '[\"陈法拉\", \"杨怡\", \"佘诗曼\", \"胡杏儿\"]', '1', '娱乐', '电视', '7', '0');
INSERT INTO `jb_questions` VALUES ('560', '崔雪涛', '天文学称九大行星之外的地带为？', '[\"河外星系带\", \"太阳系边缘带\", \"小行星带\", \"柯伊伯带\"]', '1', '理科', '天文', '7', '0');
INSERT INTO `jb_questions` VALUES ('561', '陆小丢', '英语里的原音不包括？', '[\"i\", \"d\", \"u\", \"o\"]', '1', '文科', '外语', '7', '0');
INSERT INTO `jb_questions` VALUES ('562', '', '以第一台有实用价值的蒸汽机的发明者命名，「功率」的单位是？', '[\"瓦特\", \"伏特\", \"特仑苏\", \"帕斯卡\"]', '1', '理科', '理化', '7', '0');
INSERT INTO `jb_questions` VALUES ('563', '王文龙', '世界上流域面积最广的河流是？', '[\"亚马逊河\", \"密西西比河\", \"尼罗河\", \"长江\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('564', 'ScholesStar～', '下列球队中没有获得过英格兰足球超级联赛冠军的是？', '[\"曼城\", \"利物浦\", \"曼联\", \"切尔西\"]', '1', '流行', '体育', '7', '0');
INSERT INTO `jb_questions` VALUES ('565', '芬芳', '印度首任总理是以下哪一位?', '[\"莫迪\", \"安倍晋三\", \"尼赫鲁\", \"普京\"]', '1', '生活', '日常', '7', '0');
INSERT INTO `jb_questions` VALUES ('566', '翎宇', '「秦皇岛外打鱼船」的下一句是？', '[\"一片鱼船都不见\", \"一片汪洋都不见\", \"一片军舰都不见\", \"一片海鸥都不见\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('567', '', '血液的类型一般被分为A型、B型、O型和什么型，共四种?', '[\"C\", \"AB\", \"P\", \"M\"]', '1', '理科', '生物', '7', '0');
INSERT INTO `jb_questions` VALUES ('568', '宅宅少女', '《离骚》中「长太息以掩涕兮」的下一句是？', '[\"竟周容以为度\", \"虽九死其犹未悔\", \"哀民生之多艰\", \"终不察夫民心\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('569', '順子', 'Android是哪个公司所开发的操作系统？', '[\"三星\", \"小米\", \"华为\", \"Google\"]', '1', '流行', '科技', '7', '0');
INSERT INTO `jb_questions` VALUES ('570', 'Angela', '长篇小说《飘》是哪位作家写的？', '[\"泰勒·斯威夫特\", \"玛格丽特·米切尔\", \"夏洛蒂·勃朗特\", \"安·泰勒\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('571', '', '空间中，线与线相交得什么？', '[\"空间\", \"线\", \"面\", \"点\"]', '1', '理科', '数学', '7', '0');
INSERT INTO `jb_questions` VALUES ('572', '', '「山重水复疑无路，柳暗花明又一村」出自陆游的哪首诗作？', '[\"书愤\", \"游山西村\", \"浣溪沙\", \"示儿\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('573', '陈虎', '中国最大的瀑布位于哪一地区？', '[\"湖北\", \"云南\", \"贵州\", \"湖南\"]', '1', '文艺', '演艺', '7', '0');
INSERT INTO `jb_questions` VALUES ('574', '', '元稹诗句「此花开尽更无花」描写的是哪种花？', '[\"樱花\", \"桃花\", \"梅花\", \"菊花\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('575', '糖糖人生', '《三生三世十里桃花》电影版的主演是？', '[\"杨洋，刘亦菲\", \"黄晓明，刘亦菲\", \"杨洋，郑爽\", \"马天宇，郑爽\"]', '1', '娱乐', '电影', '7', '0');
INSERT INTO `jb_questions` VALUES ('576', '', '奥运会中的哪个格斗竞技项目被称为「勇敢者的运动」？', '[\"柔道\", \"拳击\", \"摔跤\", \"跆拳道\"]', '1', '流行', '体育', '7', '0');
INSERT INTO `jb_questions` VALUES ('577', '', '白果是什么树结的果子？', '[\"银杏树\", \"桦树\", \"杉树\", \"白果树\"]', '1', '理科', '生物', '7', '0');
INSERT INTO `jb_questions` VALUES ('578', '林峻宇', '有「人间仙境」之称的蓬莱市，现由我国哪个城市代管？', '[\"威海\", \"烟台\", \"青岛\", \"日照\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('579', '忍冬', '「桃李春风一杯酒」的下一句是？', '[\"柳塘新绿却温柔\", \"十年踪迹十年心\", \"西出阳关无故人\", \"江湖夜雨十年灯\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('580', '', '楼兰王国最早的发现者是哪国探险家？', '[\"荷兰\", \"法国\", \"瑞典\", \"瑞士\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('581', '覃', '《白雪公主》出自哪部童话故事？', '[\"安徒生童话\", \"格林童话\", \"小王子\", \"伊索寓言\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('582', '闹闹Rous', '南非首都「开普敦」属于哪种气候类型？', '[\"地中海气候\", \"温带海洋气候\", \"热带沙漠气候\", \"热带草原气候\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('583', 'Mr.尧涛', '《三国演义》中曹操晚年梦见「三马同槽而食」中的「三马」不包括以下谁？', '[\"司马光\", \"司马师\", \"司马昭\", \"司马懿\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('584', '', '地球大气层的分层中，位于最下层的是？', '[\"对流层\", \"热气层\", \"散逸层\", \"平流层\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('585', '曹文昭', '为天地立心，为生民立命，为往圣继绝学，为万世开太平出自哪位理学大家？', '[\"陆九渊\", \"朱熹\", \"王阳明\", \"张载\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('586', '', '以下哪项不属于人体所需的「六大营养元素」？', '[\"钙\", \"油脂\", \"蛋白质\", \"糖类\"]', '1', '生活', '健康', '7', '0');
INSERT INTO `jb_questions` VALUES ('587', '', '电视剧《西游记》中，孙悟空被压在五指山下多少年？', '[\"一千年\", \"两千年\", \"五百年\", \"五千年\"]', '1', '娱乐', '电视', '7', '0');
INSERT INTO `jb_questions` VALUES ('588', '天磊', '「五花马，千金裘，呼儿将出换美酒」的下一句是？', '[\"与尔同销万古愁\", \"此曲只应天上有\", \"人生几何\", \"把酒问青天\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('589', '路易', '「越剧」是哪个省的传统戏曲？', '[\"浙江省\", \"安徽省\", \"江苏省\", \"山东省\"]', '1', '文艺', '艺术', '7', '0');
INSERT INTO `jb_questions` VALUES ('590', '梅菜扣肉', '下列哪座湖泊位于南美洲？', '[\"青海湖\", \"苏必利尔湖\", \"贝加尔湖\", \"的的喀喀湖\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('591', '莫道桑榆晚', '《三国演义》中谁在长坂坡上一吼，吓退了曹军？', '[\"赵云\", \"关羽\", \"吕布\", \"张飞\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('592', 'CASSIOPEIA', '欧洲一个类似高跟鞋形状的半岛是？', '[\"伊比利亚半岛\", \"斯堪的纳维亚半岛\", \"亚平宁半岛\", \"伯罗奔尼撒半岛\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('593', '王驰', '满杯的水面上，漂浮硬币后，水并未溢出水杯，原因是由于什么力？', '[\"引力\", \"张力\", \"浮力\", \"重力\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('594', 'Sabrina', '名著《红楼梦》中是带病织补雀金裘的是?', '[\"颦儿\", \"鸳鸯\", \"袭人\", \"晴雯\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('595', '', '诗句「遥知不是雪，为有暗香来」歌颂的是什么花？', '[\"荷花\", \"樱花\", \"菊花\", \"梅花\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('596', '敏敏徐', '「蚕吐丝，蜂酿蜜」的下两句是？', '[\"人不物，不如学。\", \"人不学，不如物。\", \"子不教，父之过。\", \"学不物，人不如。\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('597', '个性要张扬', '「书籍是人类进步的阶梯」这句名言的作者是？', '[\"普希金\", \"欧亨利\", \"高尔基\", \"泰戈尔\"]', '1', '流行', '名人', '7', '0');
INSERT INTO `jb_questions` VALUES ('598', '', '《论语》中「有朋自远方来」的下一句是？', '[\"不亦大夫乎\", \"不亦乐乎\", \"不亦说乎\", \"不亦君子乎\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('599', '晓风残月', '下列哪个不是日本著名动画师宫崎骏的作品？', '[\"《幽灵公主》\", \"《猫的报恩》\", \"《千与千寻》\", \"《言叶之庭》\"]', '1', '娱乐', '动漫', '7', '0');
INSERT INTO `jb_questions` VALUES ('600', '黑不溜秋', '世界上第一所西餐与西点人才专业培训学校是哪所学校？', '[\"法国蓝带\", \"美国CIA\", \"瑞士DCT\", \"瑞士恺撒里兹\"]', '1', '生活', '世界', '7', '0');
INSERT INTO `jb_questions` VALUES ('601', '张瑜', '神医华佗最终是被谁所杀害？', '[\"曹操\", \"关羽\", \"刘备\", \"诸葛亮\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('602', '四哥', '下列属于红茶的是？', '[\"铁观音\", \"龙井\", \"碧螺春\", \"金骏眉\"]', '1', '生活', '饮食', '7', '0');
INSERT INTO `jb_questions` VALUES ('603', '', '清朝乾隆年间，是谁主持修订了《四库全书》？', '[\"和珅\", \"纪晓岚\", \"纳然明珠\", \"多尔衮\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('604', '【领先国际】王莉', '「有花堪折直须折」的下一句是？', '[\"劝君须惜少年时\", \"无心插柳柳成荫\", \"莫等无花空折枝\", \"莫待无花空折枝\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('605', '', '2014年诺贝尔经济学奖由哪国学者获得？', '[\"英国\", \"意大利\", \"德国\", \"法国\"]', '1', '文科', '经济', '7', '0');
INSERT INTO `jb_questions` VALUES ('606', 'จุ๊บ三月', '《四库全书》是由谁主持编辑的？', '[\"纪晓岚\", \"李白\", \"承德文\", \"河间才子\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('607', '', '杜甫《春望》中的诗句「白头搔更短」的下一句是？', '[\"浑欲不胜簪\", \"城春草木深\", \"恨别鸟惊心\", \"家书抵万金\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('608', '沉鱼', '「一首孤篇压盛唐」是指那首诗？', '[\"长恨歌\", \"将进酒\", \"春江花月夜\", \"蜀道难\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('609', '', 'OFO，摩拜都是哪种共享交通工具的应用名字？', '[\"汽车\", \"摩托车\", \"自行车\", \"电单车\"]', '1', '流行', '商业', '7', '0');
INSERT INTO `jb_questions` VALUES ('610', 'Hola Monica', '医药学著作《伤寒杂病论》的作者是？', '[\"张仲景\", \"扁鹊\", \"淳于意\", \"华佗\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('611', '郭坪松', '下列哪个人物发明了世界上第一台留声机？', '[\"贝尔\", \"爱迪生\", \"诺贝尔\", \"爱因斯坦\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('612', '边际', '元素周期表中的第26号元素是?', '[\"锰\", \"钴\", \"铁\", \"镍\"]', '1', '理科', '理化', '7', '0');
INSERT INTO `jb_questions` VALUES ('613', 'A 科旭 （凯斯盾）张静', '以下哪个字没有「黑色」的意思？', '[\"青\", \"玄\", \"苍\", \"皂\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('614', '', '我国传统节日中，在春节之后的第一个重要节日是什么节？', '[\"元宵节\", \"重阳节\", \"端午节\", \"清明节\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('615', '洪济杰', '金砖五国（BRICS）中「I」指的是哪个国家？', '[\"印度\", \"印尼\", \"南非\", \"泰国\"]', '1', '理科', '理化', '7', '0');
INSERT INTO `jb_questions` VALUES ('616', '', '河流入海口的冲积平原因为受到侵蚀和冲击作用，常呈现哪种几何形状？', '[\"正方形\", \"三角形\", \"菱形\", \"梯形\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('617', '江山畫', '「*ST」在股市中表示的意思是？', '[\"亏损2年的股票\", \"盈利3年的股票\", \"亏损3年的股票\", \"盈利2年的股票\"]', '1', '文科', '经济', '7', '0');
INSERT INTO `jb_questions` VALUES ('618', '老炮儿', '达芬奇哪部作品曾拍出4.5亿天价？', '[\"《最后的晚餐》\", \"《救世主》\", \"《岩间圣母》\", \"《蒙娜丽莎》\"]', '1', '文艺', '艺术', '7', '0');
INSERT INTO `jb_questions` VALUES ('619', '', '拿破仑惨败的地点滑铁卢位于哪个欧洲国家？', '[\"法国\", \"克罗地亚\", \"比利时\", \"匈牙利\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('620', '温馨', '德国的全称是？', '[\"德意志联邦帝国\", \"德意志民族共和国\", \"德意志联邦共和国\", \"德意志第三帝国\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('621', '猥琐文艺汪，汪', '唐代著名预言类书籍《推背图》的作者是李淳风和（）？', '[\"袁天罡\", \"袁守诚\", \"袁承志\", \"袁天君\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('622', '我不说话', '「情深不寿」的下一句是？', '[\"慧极必伤\", \"寿则深情\", \"情浅不久\", \"爱情常在\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('623', '', '国家规定，夏季公共场所室内空调温度不得低于多少度？', '[\"25\", \"38\", \"20\", \"26\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('624', '', '「红豆生南国，春来发几枝？」中红豆的故乡是当今的哪个省？', '[\"安徽省\", \"广东省\", \"福建省\", \"广西省\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('625', '缘大帅', '「蒹葭苍苍」的下一句是？', '[\"白露为霜\", \"所谓伊人\", \"窈窕淑女\", \"道阻且长\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('626', '', '热干面是我国哪个城市的传统小吃？', '[\"武汉\", \"苏州\", \"北京\", \"佛山\"]', '1', '生活', '饮食', '7', '0');
INSERT INTO `jb_questions` VALUES ('627', '锅', '宋代女词人李清照的丈夫是我国古代哪位金石学家？', '[\"赵明诚\", \"李明成\", \"赵易安\", \"董祀\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('628', '大易ZAD', '印刷四色模式（CMYK）中「C」代表什么颜色？', '[\"黄\", \"红\", \"绿\", \"青\"]', '1', '文艺', '设计', '7', '0');
INSERT INTO `jb_questions` VALUES ('629', '', '圆是以什么为对称中心的中心对称图形？', '[\"圆心\", \"切线\", \"圆内任意一点\", \"法线\"]', '1', '理科', '数学', '7', '0');
INSERT INTO `jb_questions` VALUES ('630', '', '「五卅运动」是发生在5月几日的反帝运动？', '[\"30日\", \"3日\", \"15日\", \"23日\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('631', 'Kitsch丶', '《红楼梦》中「欲洁何曾洁，云空未必空。可怜金玉质，终陷泥沼中」指的是？', '[\"妙玉\", \"黛玉\", \"湘云\", \"宝钗\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('632', '久在身旁i', '被称为「千古词帝」的是？', '[\"杜甫\", \"李煜\", \"苏轼\", \"李白\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('633', '五道杠', '关塔那摩美军基地位于哪个国家？', '[\"古巴\", \"以色列\", \"菲律宾\", \"伊拉克\"]', '1', '文科', '军事', '7', '0');
INSERT INTO `jb_questions` VALUES ('634', '米兰', '下列选项中哪个球员不是篮球运动员？', '[\"詹姆斯·哈登\", \"科比·布莱恩特\", \"迈克尔·乔丹\", \"大卫·贝克汉姆\"]', '1', '流行', '体育', '7', '0');
INSERT INTO `jb_questions` VALUES ('635', '', '代表作有《Don\'t Cry》的美国硬摇滚乐队是？', '[\"枪炮与玫瑰乐队\", \"真情马克乐队\", \"黑眼豆豆\", \"电台司令乐队\"]', '1', '娱乐', '音乐', '7', '0');
INSERT INTO `jb_questions` VALUES ('636', '', '空间中，面与面相交得什么？', '[\"体\", \"面\", \"线\", \"点\"]', '1', '理科', '数学', '7', '0');
INSERT INTO `jb_questions` VALUES ('637', '港岛妹妹', '公民下落不明满几年，利害关系人可以向人民法院申请他为失踪人？', '[\"3年\", \"4年\", \"2年\", \"1年\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('638', '', '我国唐代哪位高僧为了弘扬佛法，曾经六次尝试东渡日本并最终取得成功？', '[\"鉴真法师\", \"延参法师\", \"玄奘法师\", \"一休法师\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('639', '', '紫禁城的正门，在明代常被皇帝用来责罚大臣的是紫禁城的哪个门？', '[\"正门\", \"午门\", \"洪门\", \"前门\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('640', '我在等风也等你', '一甲子是多少年？', '[\"60年\", \"20年\", \"30年\", \"40年\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('641', '雨不眠的下', '以下历史战役不是以少胜多的是?', '[\"巨鹿之战\", \"官渡之战\", \"马铃之战\", \"赤壁之战\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('642', '黄嵩', '西汉名将霍去病去世时多少岁？', '[\"44岁\", \"24岁\", \"34岁\", \"54岁\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('643', '阡陌潇潇', '克隆羊多莉活了多少年？', '[\"6年\", \"5年\", \"7年\", \"8年\"]', '1', '理科', '生物', '7', '0');
INSERT INTO `jb_questions` VALUES ('644', '闹闹Rous', '「曾经沧海难为水 除却巫山不是云」出自哪位名家作品？', '[\"李商隐\", \"仓央嘉措\", \"纳兰性德\", \"元稹\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('645', '冰冰', '七言绝句《竹石》的作者是？', '[\"李白\", \"杜甫\", \"郑燮\", \"王安之\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('646', '小时光', '「春色满园关不住」的下一句是？', '[\"一支红杏出墙来\", \"一支桃花出墙来\", \"一株梅花出墙来\", \"一株红杏出墙来\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('647', '麦兜儿', '下列哪种讨论方法是采用「背靠背」的通讯方式讨论？', '[\"头脑风暴\", \"神仙会\", \"圆桌会议\", \"德尔菲法\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('648', '心殇', '《我折叠着我的爱》是谁的作品？', '[\"席慕容\", \"海子\", \"顾城\", \"林语堂\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('649', '', '西藏布达拉宫最初是松赞干布为了迎接谁而兴建的？', '[\"文华公主\", \"文成公主\", \"太平公主\", \"安平公主\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('650', '7日間.', '新中国成立在哪年是？', '[\"1949\", \"1948\", \"1947\", \"1950\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('651', '', '在电影《人在囧途之泰囧》中，徐朗和宝宝组成的组合叫什么名字？', '[\"泰国人妖\", \"泰国兄弟\", \"泰国二宝\", \"泰国传奇\"]', '1', '娱乐', '电影', '7', '0');
INSERT INTO `jb_questions` VALUES ('652', '衡了个水จุ๊บ', '抗日时期「晋察冀」边区，其中的「察」是指哪个省？', '[\"察哈尔\", \"内蒙古\", \"察尔哈\", \"哈察尔\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('653', '东子', '「悬空寺」位于哪座名山？', '[\"峨眉山\", \"恒山\", \"五台山\", \"九华山\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('654', '多多', '诸子百家中，提倡「兼爱」观点的是？', '[\"孔子\", \"老子\", \"庄子\", \"墨子\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('655', '', '漫画《死亡笔记》中，被写上名字的人会在多少秒过后会心脏麻痺死亡？', '[\"40秒\", \"20秒\", \"30秒\", \"10秒\"]', '1', '娱乐', '动漫', '7', '0');
INSERT INTO `jb_questions` VALUES ('656', '同音', '「清水出芙蓉」的下一句是？', '[\"疑是地上霜\", \"春风吹又生\", \"为有暗香来\", \"天然去雕饰\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('657', '', '美国国家美式足球联盟的年度冠军赛叫什么名字？', '[\"超级碗\", \"超级冠\", \"超级杯\", \"超音速\"]', '1', '流行', '体育', '7', '0');
INSERT INTO `jb_questions` VALUES ('658', '', '曾获得1994年诺贝尔和平奖，巴勒斯坦人民爱戴的政治家是谁？', '[\"查希尔\", \"沙龙\", \"阿拉法特\", \"拉宾\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('659', '', '以下哪部小说不是东野圭吾的作品？', '[\"白夜行\", \"奇怪的被告\", \"放学后\", \"嫌疑人X的献身\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('660', '✎﹏ 大象', '中国人民共和国国歌，作词的是？', '[\"聂耳\", \"田汉\", \"乔羽\", \"冼星海\"]', '1', '娱乐', '音乐', '7', '0');
INSERT INTO `jb_questions` VALUES ('661', 'I have a dream', '「渭城朝雨浥轻尘」的下一句是？', '[\"二月春风似剪刀\", \"客舍青青柳色新\", \"映日荷花别样红\", \"西出阳关无故人\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('662', '稻草人', '李晚芳对谁有「羽之神勇，千古无二」的评价？', '[\"韩信\", \"吕布\", \"卫青\", \"项羽\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('663', '那一抹微笑^_^穿透阳光', '鲁迅的第一部杂文集是？', '[\"《热风》\", \"《坟》\", \"《随感录》\", \"《野草》\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('664', '三年而已。', '奥运五环中没有下列哪种颜色？', '[\"红色\", \"橙色\", \"绿色\", \"紫色\"]', '1', '流行', '体育', '7', '0');
INSERT INTO `jb_questions` VALUES ('665', '', '微信小程序正式上线于哪年？', '[\"2017\", \"2014\", \"2015\", \"2018\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('666', '', '「天长地久有时尽，此恨绵绵无绝期」出自白居易哪首长篇叙事诗？', '[\"卖炭翁\", \"长恨歌\", \"丽人行\", \"琵琶行\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('667', '微笑:）:）:）:）', '中日甲午战争发生在哪年？', '[\"1894年\", \"1860年\", \"1895年\", \"1865年\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('668', '', '绰号「猎豹」的球星埃托奥，来自哪个非洲国家？', '[\"喀麦隆\", \"南非\", \"尼日尼亚\", \"阿尔及利亚\"]', '1', '流行', '体育', '7', '0');
INSERT INTO `jb_questions` VALUES ('669', '', '雅诗兰黛第一位华裔全球代言人是哪位超模？', '[\"何穗\", \"杜鹃\", \"刘雯\", \"奚梦瑶\"]', '1', '流行', '时尚', '7', '0');
INSERT INTO `jb_questions` VALUES ('670', '且扬尘', '王维名作《送元二使安西》中「劝君更尽一杯酒」的下一句是？', '[\"西出阳关无故人\", \"蜡炬成灰泪始干\", \"不及汪伦送我情\", \"长使英雄泪满襟\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('671', '', '2008年北京奥运会，与林跃搭档获男子双人十米台冠军的中国运动员是？', '[\"胡佳\", \"田亮\", \"陈艾森\", \"火亮\"]', '1', '流行', '体育', '7', '0');
INSERT INTO `jb_questions` VALUES ('672', 'Mc四夕（道王府）', '军人敬礼方式一共有三种，下列那种敬礼方式不正确？', '[\"注目礼\", \"常举礼\", \"举枪礼\", \"举手礼\"]', '1', '文科', '军事', '7', '0');
INSERT INTO `jb_questions` VALUES ('673', '小桥』流水『人家', '「沪宁杭工业基地」其中「宁」指的是哪个城市？', '[\"嘉兴\", \"宁波\", \"苏州\", \"南京 \"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('674', '', '去市场中经常会看到螃蟹口吐白沫，这种白沫是？', '[\"尿液\", \"消化液\", \"血液\", \"水\"]', '1', '理科', '生物', '7', '0');
INSERT INTO `jb_questions` VALUES ('675', 'Paul冯', '水电解之后能够生成哪两种气体？', '[\"氢气和氦气\", \"氧气和氮气\", \"氧气和水气\", \"氢气和氧气\"]', '1', '理科', '理化', '7', '0');
INSERT INTO `jb_questions` VALUES ('676', '小刀', '楚汉时期项羽最后被刘邦打败的地点是？', '[\"雁门关\", \"峣关\", \"陈仓\", \"垓下\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('677', '琳琳', '西安的市花是？', '[\"牡丹花\", \"石榴花\", \"桂花\", \"月季\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('678', '', '新兴的「薄荷四国」不包括？', '[\"尼日利亚\", \"墨西哥\", \"菲律宾\", \"土耳其\"]', '1', '生活', '世界', '7', '0');
INSERT INTO `jb_questions` VALUES ('679', '繁花落静', '下列不属于我国四大发明的是？', '[\"飞机\", \"造纸术\", \"火药\", \"印刷术\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('680', '丸子', '以下口红中，常被称为「星你色」的是？', '[\"雅诗兰黛420\", \"CHANEL53\", \"YSL-52\", \"Nars DV\"]', '1', '流行', '时尚', '7', '0');
INSERT INTO `jb_questions` VALUES ('681', 'Xiaoshi Wu', '二战中由美国人陈纳德创建，中国空军美国志愿援华航空队的全称是？', '[\"飞虎队\", \"打虎队\", \"小虎队\", \"飞鹰队\"]', '1', '文科', '军事', '7', '0');
INSERT INTO `jb_questions` VALUES ('682', '', '《童年》、《在人间》、《我的大学》三部曲是哪位俄国作家的作品？', '[\"契科夫\", \"托尔斯泰\", \"果戈里\", \"高尔基\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('683', '翏翏', '下面哪部作品属于「临川四梦」之一？', '[\"邯郸记\", \"红灯记\", \"西厢记\", \"狮吼记\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('684', '', '历史上的三国指的是魏国，蜀国和？', '[\"秦国\", \"燕国\", \"赵国\", \"吴国\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('685', 'SAM', '5×5+5+5＝?', '[\"35\", \"25\", \"50\", \"30\"]', '1', '理科', '数学', '7', '0');
INSERT INTO `jb_questions` VALUES ('686', '小花', '1946 年研制成功第一台电子数字计算机的国家是？', '[\"英国\", \"美国\", \"法国\", \"德国\"]', '1', '生活', '世界', '7', '0');
INSERT INTO `jb_questions` VALUES ('687', ' 正能量365', '别誉为中国「茶圣」的是？', '[\"杜甫\", \"杜康\", \"陆羽\", \"王羲之\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('688', 'sin狗', '七大洲中面积最小的是哪一个洲？', '[\"亚洲\", \"欧洲\", \"大洋洲\", \"南极洲\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('689', '', '我国少数民族分布最多的省份是？', '[\"西藏\", \"四川\", \"云南\", \"广西\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('690', 'Youth.', '平行四边形的内角和是多少度？', '[\"不一定\", \"720\", \"360\", \"180\"]', '1', '理科', '数学', '7', '0');
INSERT INTO `jb_questions` VALUES ('691', '黄兽兽', '《离骚》 「长太息以掩涕兮」的下一句是？', '[\"悔相道之不察兮\", \"终不察夫民心\", \"固前圣之所厚\", \"哀民生之多艰\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('692', '岁月静好', '「生如夏花之绚烂，死如秋叶之静美」是谁说的？', '[\"泰戈尔\", \"仓央嘉措\", \"高金\", \"普希金\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('693', '兰', '《水浒传》中「浪子」指的是？', '[\"燕青\", \"林冲\", \"卢俊义\", \"时迁\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('694', '泽轩', '韩愈的诗作「天街小雨润如酥」的下一句是？', '[\"最是一年春好处\", \"街上行人欲断魂\", \"草色遥看近却无\", \"小荷才露尖尖角\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('695', '', '欧盟的盟旗上总共有多少颗星？', '[\"十一星\", \"九星\", \"十星\", \"十二星\"]', '1', '生活', '世界', '7', '0');
INSERT INTO `jb_questions` VALUES ('696', '萬千秋葉一縷紅', '马云宣布阿里巴巴集团成立探索人类科技未来的实验室的名字是？', '[\"社科院\", \"研发院\", \"研究所\", \"达摩院\"]', '1', '流行', '商业', '7', '0');
INSERT INTO `jb_questions` VALUES ('697', '虚硕之', '下面名表品牌中不属于瑞士的是？', '[\"百达翡丽\", \"郎格\", \"江诗丹顿\", \"积家\"]', '1', '流行', '时尚', '7', '0');
INSERT INTO `jb_questions` VALUES ('698', '', 'NBA中，主场位于萨克拉门托的是哪支球队？', '[\"火箭队\", \"76人队\", \"国王队\", \"雷霆队\"]', '1', '流行', '体育', '7', '0');
INSERT INTO `jb_questions` VALUES ('699', '若希', '第一只成功克隆的哺乳动物「多利」是什么动物？', '[\"鼠\", \"牛\", \"猪\", \"羊\"]', '1', '理科', '生物', '7', '0');
INSERT INTO `jb_questions` VALUES ('700', '佳楠君', '《巴黎圣母院》中，为保护爱斯梅拉达而死守教堂的是？', '[\"弗比斯\", \"弗洛罗\", \"卡西莫多\", \"甘果瓦\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('701', 'sky', '我国古代采用天干地支纪年，一个纪年周期称为一个甲子是多少年？', '[\"60年\", \"62年\", \"64年\", \"72年\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('702', '', '美味的培根是使用哪种动物的肉制成的？', '[\"猪\", \"牛\", \"鸡\", \"鸭\"]', '1', '生活', '饮食', '7', '0');
INSERT INTO `jb_questions` VALUES ('703', '', '中国篮球运动员巴特尔效力于哪支NBA球队期间获得了一枚总冠军戒指？', '[\"湖人\", \"马刺\", \"小牛\", \"火箭\"]', '1', '流行', '体育', '7', '0');
INSERT INTO `jb_questions` VALUES ('704', '杜杜', '二十四节气中最冷的节气是？', '[\"小寒\", \"冬至\", \"霜降\", \"大寒\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('705', 'jasmine', '人工智能的英文缩写是？', '[\"IQ\", \"RGZN\", \"IA\", \"AI\"]', '1', '流行', '科技', '7', '0');
INSERT INTO `jb_questions` VALUES ('706', '抹搽嗱鐡', '2018年俄罗斯世界杯共有多少支球队参赛？', '[\"24支\", \"32支\", \"18支\", \"16支\"]', '1', '流行', '体育', '7', '0');
INSERT INTO `jb_questions` VALUES ('707', '', '在古代被称为「食铁兽」的是哪种国宝级动物？', '[\"大熊猫\", \"扬子鳄\", \"巨猪\", \"鲸鱼\"]', '1', '理科', '生物', '7', '0');
INSERT INTO `jb_questions` VALUES ('708', '卖鱼强', '新中国第一部《保险法》正式实施于哪一年？', '[\"1998年\", \"2002年\", \"1995年\", \"2005年\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('709', '', '人们常用什么神话动物的涅磐重生来形容历经考验的奋斗？', '[\"凤凰\", \"白虎\", \"青龙\", \"玄武\"]', '1', '文艺', '文化', '7', '0');
INSERT INTO `jb_questions` VALUES ('710', '', '成语「开门揖盗」用来形容？', '[\"窃贼胆大无顾忌\", \"胆小怕事\", \"引狼入室\", \"为民锄害\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('711', 'HK', '《洛神赋》的作者是？', '[\"曹丕\", \"司马相如\", \"曹植\", \"左思\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('712', '勇敢的小狼 ，，波', '下列哪部画作是著名画家莫奈的作品？', '[\"《草地上的午餐》\", \"《盲女》\", \"《桌球》\", \"《呐喊》\"]', '1', '文艺', '艺术', '7', '0');
INSERT INTO `jb_questions` VALUES ('713', '有凤来仪', '「世事洞明皆学问，人情练达即文章」出自哪本书籍？', '[\"红楼梦\", \"全唐诗\", \"北山移文\", \"西厢记\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('714', '石头', '下列湖泊中，不是淡水湖的是？', '[\"洞庭湖\", \"太湖\", \"鄱阳湖\", \"青海湖\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('715', '邱', '被称为进化论的奠基人的是？', '[\"爱迪生\", \"孟德尔\", \"达芬奇\", \"达尔文\"]', '1', '理科', '生物', '7', '0');
INSERT INTO `jb_questions` VALUES ('716', '', '巴甫洛夫的条件反射的实验中，哪种动物一看到食物就会淌口水？', '[\"狗\", \"人\", \"猫\", \"老鼠\"]', '1', '理科', '生物', '7', '0');
INSERT INTO `jb_questions` VALUES ('717', '孙晓娜', '铀（U）的原子序数是？', '[\"91\", \"238\", \"92\", \"237\"]', '1', '理科', '理化', '7', '0');
INSERT INTO `jb_questions` VALUES ('718', '', '人们常说的「贵腐酒」属于？', '[\"苹果酒\", \"蜂蜜酒\", \"梅子酒\", \"葡萄酒\"]', '1', '生活', '饮食', '7', '0');
INSERT INTO `jb_questions` VALUES ('719', '', '欧元的货币代码是？', '[\"EUR\", \"EEK\", \"ESP\", \"GSD\"]', '1', '文科', '经济', '7', '0');
INSERT INTO `jb_questions` VALUES ('720', '张安峰', '《射雕英雄传》中郭靖的「左右互搏」是跟随谁所学？', '[\"洪七公\", \"老顽童\", \"江南七怪\", \"黄药师\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('721', '昊', '「本来没有路，走的人多了也便成了路」这句话出哪位名家的作品？', '[\"冰心\", \"老舍\", \"茅盾\", \"鲁迅\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('722', '', '「欧洲之星」高速列车的三个终点站分别是巴黎、伦敦和哪个城市？', '[\"鹿特丹\", \"安德莱赫特\", \"安特卫普\", \"布鲁塞尔\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('723', '', '锡林浩特市位于？', '[\"西藏\", \"青海\", \"新疆维吾尔自治区\", \"内蒙古自治区\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('724', '', '不分年龄辈份差异而结成的好朋友被称为？', '[\"莫逆交\", \"死党\", \"好基友\", \"忘年交\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('725', '', '《水浒传》中有天罡地煞星宿，其中天罡星为36位，地煞星有多少位？', '[\"54位\", \"72位\", \"32位\", \"256位\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('726', '29', '一节普通锌锰5号电池的电压是？', '[\"1.5V\", \"2.0V\", \"1.2V\", \"2.2V\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('727', '婷儿~', '现代汉语中一共有几个声母？', '[\"20\", \"18\", \"23\", \"22\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('728', 'A海南房产-魏世康18689978687', '古时屈原投江自杀，投的是哪条江？', '[\"赣江\", \"珠江\", \"长江\", \"汨罗江\"]', '1', '文艺', '文化', '7', '0');
INSERT INTO `jb_questions` VALUES ('729', 'MOYE.', '名著《红楼梦》是什么时代的作品？', '[\"元朝\", \"宋朝\", \"唐朝\", \"清朝\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('730', '呆呆', '下列是鱼腥草别名的是？', '[\"折耳菜\", \"大布参\", \"金鱼草\", \"折耳根\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('731', '', '「凌烟阁二十四功臣」之首，长孙皇后的哥哥，叫什么名字？', '[\"长孙无忌\", \"长孙长生\", \"长孙俊杰\", \"长孙文瑞\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('732', '王威', '「世事洞明皆学问，人情练达皆文章」出自哪部文学作品？', '[\"西厢记\", \"警世恒言\", \"红楼梦\", \"桃花扇\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('733', '', '世界上唯一的一块「国际领土」位于？', '[\"纽约\", \"曼哈顿\", \"旧金山\", \"洛杉矶\"]', '1', '生活', '世界', '7', '0');
INSERT INTO `jb_questions` VALUES ('734', '游向海洋的', '诗句「岐王宅里寻常见」的下一句是？', '[\"崔九堂前几度闻\", \"崔九堂前几度文\", \"崔几堂前九度闻\", \"崔九堂前九度闻\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('735', '', '神话中，嫦娥在月亮上居住的宫殿叫？', '[\"阿房宫\", \"广寒宫\", \"冬宫\", \"天宫\"]', '1', '文艺', '文化', '7', '0');
INSERT INTO `jb_questions` VALUES ('736', 'It\'me', '幼儿的语言敏感期是几岁开始？', '[\"两岁到三岁\", \"1岁半到两岁\", \"出生开始\", \"三岁以后\"]', '1', '生活', '健康', '7', '0');
INSERT INTO `jb_questions` VALUES ('737', '候鸟依然', '下列不是意大利文艺复兴时期人物的是？', '[\"乔托\", \"彼特拉克\", \"梵高\", \"达芬奇\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('738', '誓言', '「出淤泥而不染」描述的是哪种花？', '[\"莲花\", \"梅花\", \"桃花\", \"菊花\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('739', '', '周杰伦的《晴天》属于他的哪张专辑？', '[\"范特西\", \"我很忙\", \"叶惠美\", \"八度空间\"]', '1', '娱乐', '音乐', '7', '0');
INSERT INTO `jb_questions` VALUES ('740', '', '动画《海绵宝宝》中，海绵宝宝的职业是？', '[\"艺术家\", \"警长\", \"收银员\", \"厨师\"]', '1', '娱乐', '动漫', '7', '0');
INSERT INTO `jb_questions` VALUES ('741', '。', '中国历史上最后一名状元是？', '[\"张春霖\", \"刘春霖\", \"赵春霖\", \"李春霖\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('742', '', '《飙速宅男》中，小野田在全高联的背号是？', '[\"170\", \"172\", \"174\", \"176\"]', '1', '娱乐', '动漫', '7', '0');
INSERT INTO `jb_questions` VALUES ('743', '', '下列选项中现存最完整的，中国明清时期皇家园林典范是?', '[\"颐和园\", \"避暑山庄\", \"静明园\", \"圆明园\"]', '1', '文艺', '设计', '7', '0');
INSERT INTO `jb_questions` VALUES ('744', 'YOYO', '「两岸青山相对出」的下一句是？', '[\"千里江陵一日还\", \"孤帆一片日边来\", \"飞流直下三千尺\", \"轻舟已过万重山\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('745', '', '明朝皇帝姓什么？', '[\"李\", \"爱新觉罗\", \"朱\", \"刘\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('746', '知乎', '被称为「高原大陆」的大洲是哪个？', '[\"大洋洲\", \"南极洲\", \"亚洲\", \"非洲\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('747', '', '《火影忍者》宇智波一族成员的一种特殊瞳术叫什么？', '[\"千里眼\", \"写轮眼\", \"神威\", \"顺风耳\"]', '1', '娱乐', '动漫', '7', '0');
INSERT INTO `jb_questions` VALUES ('748', '', '「不知细叶谁裁出，二月春风似剪刀」诗描绘的是哪种树？', '[\"梅树\", \"柏树\", \"桃树\", \"柳树\"]', '1', '理科', '生物', '7', '0');
INSERT INTO `jb_questions` VALUES ('749', '潘冬月', '披头士乐队是哪国的？', '[\"法国\", \"英国\", \"美国\", \"德国\"]', '1', '娱乐', '音乐', '7', '0');
INSERT INTO `jb_questions` VALUES ('750', '孔杰', '「猪龙骨」通常指猪的什么部位？', '[\"猪的肋骨\", \"猪的腿骨\", \"猪的尾巴骨\", \"猪的脊骨\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('751', '', '以下品牌中，不是以创始人命名的是？', '[\"香奈儿\", \"蔻驰\", \"范思哲\", \"迪奥\"]', '1', '流行', '时尚', '7', '0');
INSERT INTO `jb_questions` VALUES ('752', '', '有中国「铜城」之称的最哪座城市？', '[\"铜陵\", \"德兴\", \"铜仁\", \"白银\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('753', '', '传说中，「烽火戏诸侯」是为了博哪位美人一笑？', '[\"褒姒\", \"妺喜\", \"骊姬\", \"妲己\"]', '1', '文艺', '文化', '7', '0');
INSERT INTO `jb_questions` VALUES ('754', '匠者纯实木北欧家具13330138659', '动画电影《千与千寻》的导演是？', '[\"宫崎骏\", \"丘比特\", \"以上都不是\", \"本子库\"]', '1', '娱乐', '动漫', '7', '0');
INSERT INTO `jb_questions` VALUES ('755', 'monkey', '胎龄在多少周以前出生的婴儿被称为「早产儿」？', '[\"40周\", \"39周\", \"37周\", \"38周\"]', '1', '生活', '健康', '7', '0');
INSERT INTO `jb_questions` VALUES ('756', '心机boy', '下列哪个不是列夫·托尔斯泰的小说？', '[\"复活\", \"埃及的演变\", \"安娜卡列尼娜 \", \"战争与和平\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('757', '小瑶瑶瑶～', '日语发音「萨哟那拉」代表的意思是？', '[\"亲爱的\", \"再见\", \"你好\", \"我回来了\"]', '1', '文科', '外语', '7', '0');
INSERT INTO `jb_questions` VALUES ('758', '中冶沈勘王风和', '「路漫漫其修远兮，吾将上下而求索」出自哪部作品？', '[\"庄子\", \"离骚\", \"论语\", \"左传\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('759', '', '著名景点天涯海角位于我国海南省的哪个城市？', '[\"琼海\", \"三亚\", \"海口\", \"万宁\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('760', '', '「Cosplay」是哪个单词和play的合成？', '[\"Cocos\", \"Costco\", \"Costume\", \"Custom\"]', '1', '文科', '外语', '7', '0');
INSERT INTO `jb_questions` VALUES ('761', 'A芝芝', '诗句「好雨知时节」的下一句是?', '[\"当春乃时节\", \"当春就发生\", \"当春乃发生\", \"春季就发现\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('762', '倚天草', '三国时期名将张辽字（）？', '[\"文长\", \"文谦\", \"文远\", \"文台\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('763', '西野', '中国历史上科举制真正成型的是哪个朝代？', '[\"明朝\", \"汉朝\", \"唐朝\", \"秦朝\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('764', '', '被称为「海洋的耳朵」，等级按「头」数划分的是哪种名贵食材？', '[\"鲍鱼\", \"鱼翅\", \"海参\", \"白玉\"]', '1', '生活', '饮食', '7', '0');
INSERT INTO `jb_questions` VALUES ('765', 'Albert', '抗日战争时期，时任日本天皇的年号是？', '[\"昭和\", \"大化\", \"明治\", \"平成\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('766', '', '相传始建于三国孙吴时期的著名古刹「静安寺」位于我国的哪个城市？', '[\"西塘\", \"杭州\", \"上海\", \"舟山\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('767', '', '现在流通的人民币中一元硬币的背面的图案是什么花？', '[\"菊花\", \"梅花\", \"荷花\", \"牡丹花\"]', '1', '文科', '经济', '7', '0');
INSERT INTO `jb_questions` VALUES ('768', 'Albert', '「万历皇帝」是哪个朝代的皇帝？', '[\"清朝\", \"明朝\", \"唐朝\", \"宋朝\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('769', '小龙', '中国近代史上赔款数目最多的不平等条约是？', '[\"辛丑条约\", \"马关条约\", \"北京条约\", \"南京条约\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('770', '樂Better', '钢琴上一共有多少个琴键？', '[\"102\", \"88\", \"96\", \"64\"]', '1', '文艺', '演艺', '7', '0');
INSERT INTO `jb_questions` VALUES ('771', '晴天', '植物细胞的最外层是？', '[\"细胞皮\", \"细胞壁\", \"细胞膜\", \"细胞质\"]', '1', '理科', '生物', '7', '0');
INSERT INTO `jb_questions` VALUES ('772', '', '《霸王别姬》、《青蛇》、《胭脂扣》等作品都出自哪位作家之手？', '[\"冰心\", \"八月长安\", \"李碧华\", \"莫言\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('773', ' 抚笙', '「山川之美」的下一句是？', '[\"古来共谈\", \"天山共色\", \"有蕡其实\", \"任意东西\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('774', '听雨', '戏剧《威尼斯商人》的作者是？', '[\"列夫斯基\", \"莎士比亚\", \"雨果\", \"巴金\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('775', '', '名著《战争与和平》讲述的是哪场战争？', '[\"日俄战争\", \"法俄战争\", \"英法百年战争\", \"法德战争\"]', '1', '文艺', '文化', '7', '0');
INSERT INTO `jb_questions` VALUES ('776', '蓝图', '诗仙是哪位？', '[\"杜甫\", \"李白\", \"李刚\", \"白居易\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('777', '门外客', '《琵琶行》中「夜深忽梦少年事」的下一句是？', '[\"梦啼妆泪红阑干\", \"尤抱琵琶半遮面\", \"千呼万唤始出来\", \"大珠小珠落玉盘\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('778', 'heng', '科西嘉岛属于哪个国家的领土？', '[\"法国\", \"英国\", \"美国\", \"德国\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('779', 'Dawnou', '军队中，下列哪个不属于军衔称号？', '[\"元帅\", \"上校\", \"司令\", \"列兵\"]', '1', '文科', '军事', '7', '0');
INSERT INTO `jb_questions` VALUES ('780', '刘晗钰', '四大名著《水浒传》中，排名第108位的是？', '[\"林冲\", \"孙二娘\", \"段景住\", \"武松\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('781', '龙', '清朝乾隆时期主持修订了《四库全书》的是以下哪位历史人物？', '[\"乾隆\", \"纪晓岚\", \"嘉庆\", \"和珅\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('782', '', '俄罗斯的国花是什么?', '[\"郁金香\", \"玫瑰花\", \"茉莉花\", \"向日葵\"]', '1', '生活', '世界', '7', '0');
INSERT INTO `jb_questions` VALUES ('783', '', '创造出历久不衰银幕经典「007」的是哪个以狮子为标识的美国知名电影公司？', '[\"米高梅\", \"华纳\", \"环球\", \"哥伦比亚\"]', '1', '娱乐', '电影', '7', '0');
INSERT INTO `jb_questions` VALUES ('784', '爱吃鱼的小猫咪', '「中华书局」的创始人是？', '[\"陆费逵\", \"张元济\", \"舒新城\", \"夏丏尊\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('785', '源', '物理学中，质量用字母表示是？', '[\"o\", \"l\", \"t\", \"m\"]', '1', '理科', '理化', '7', '0');
INSERT INTO `jb_questions` VALUES ('786', '', '下半旗是把旗子下降到？', '[\"离杆顶1/4处\", \"离杆顶1/3处\", \"离杆顶1/5处\", \"离杆顶1/2处\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('787', '', '曾出土了「司母戊鼎」的殷墟位于河南的哪座城市？', '[\"郑州\", \"洛阳\", \"安阳\", \"开封\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('788', '无名氏', '美国最大的城市是？', '[\"纽约\", \"旧金山\", \"洛杉矶\", \"华盛顿\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('789', '', '八十年代家庭和诊所常用来消毒的高锰酸钾溶液是什么颜色？', '[\"红色\", \"黑色\", \"紫色\", \"绿色\"]', '1', '生活', '健康', '7', '0');
INSERT INTO `jb_questions` VALUES ('790', '倔.', '李商隐名句「心有灵犀一点通」的上一句是？', '[\"落红不是无情物\", \"身无彩凤双飞翼\", \"无边落木萧萧下\", \"锦瑟无端五十弦\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('791', '宁', '春秋战国时期，被称为「公子小白」的是？', '[\"秦穆公\", \"齐桓公\", \"晋献公\", \"晋文公\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('792', '孙艳娜', '「玉带林中挂，金簪雪里埋」是哪部文学作品中的描述？', '[\"水浒传\", \"金瓶梅\", \"红楼梦\", \"西厢记\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('793', '', '电影《阳光灿烂的日子》中，饰演「马小军」这一角色的是哪位明星？', '[\"张一山\", \"刘烨\", \"夏雨\", \"耿乐\"]', '1', '娱乐', '电影', '7', '0');
INSERT INTO `jb_questions` VALUES ('794', '', '统计中，一组数据中出现次数最多的数叫做这个组数据的什么？', '[\"极值\", \"众数\", \"平均数\", \"中位数\"]', '1', '理科', '数学', '7', '0');
INSERT INTO `jb_questions` VALUES ('795', 'HK', '「全真教」创始人是？', '[\"老子\", \"张道陵\", \"王重阳\", \"庄子\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('796', '', '我国第一部新歌剧是？', '[\"洪湖赤卫队\", \"刘胡兰 \", \"沙家浜\", \"白毛女\"]', '1', '文艺', '演艺', '7', '0');
INSERT INTO `jb_questions` VALUES ('797', '红枫似火', '《秋思》中「行人临发又开封」的上一句是？', '[\"宝剑锋从磨砺出\", \"白首方悔读书迟\", \"复恐匆匆说不尽\", \"家在梦中何日到\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('798', '', '程咬金是中国哪个朝代的开国名将？', '[\"隋\", \"汉\", \"唐朝\", \"晋\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('799', '可她是君.', '目前世界公认的「热极」是？', '[\"利雅得\", \"巴士拉\", \"的黎波里\", \"开罗\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('800', 'BEER部落 ', '1×2×3×4×5＝？', '[\"120\", \"125\", \"95\", \"100\"]', '1', '理科', '数学', '7', '0');
INSERT INTO `jb_questions` VALUES ('801', '执子之手', '世界上最大的沙漠', '[\"撒哈吧沙漠\", \"塔克拉玛干沙漠\", \"撒哈拉沙漠\", \"秘鲁智利沙漠\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('802', '', '原指箭术高超，后用以比喻做一件事达到两个目的的成语是？', '[\"一鸣惊人\", \"一呼百应\", \"一箭双雕\", \"异口同声\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('803', 'WF', '《红楼梦》中「金簪雪里埋」指的是？', '[\"史湘云\", \"林黛玉\", \"妙玉\", \"薛宝钗\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('804', '', '地核内部温度在多少度以上？', '[\"3000\", \"6000\", \"5000\", \"4000\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('805', 'Aimee ', '「儿童散学归来早」的下一句是？', '[\"为谁辛苦为谁甜\", \"天下谁人不识君\", \"一枝红杏出墙来\", \"忙趁东风放纸鸢\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('806', 'A我是Clear——庄清茹', '中国四大古桥在潮汕区域的是哪座桥？', '[\"卢沟桥\", \"广济桥\", \"洛阳桥\", \"赵州桥\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('807', '婷婷', '2015版100元人民币背景图案是？', '[\"杭州西湖\", \"布达拉宫\", \"人民大会堂\", \"桂林山水\"]', '1', '文科', '经济', '7', '0');
INSERT INTO `jb_questions` VALUES ('808', '', '在电影《建党伟业》中，饰演冯国璋的演员是他的曾孙，这位演员是？', '[\"冯巩\", \"冯翊纲\", \"冯绍峰\", \"冯小刚\"]', '1', '娱乐', '电影', '7', '0');
INSERT INTO `jb_questions` VALUES ('809', '楚笑笑', '最小的质数是？', '[\"-1\", \"1\", \"0\", \"2\"]', '1', '理科', '数学', '7', '0');
INSERT INTO `jb_questions` VALUES ('810', '小小彬', '自然界中「比热容」最大的物质是？', '[\"水\", \"木头\", \"石头\", \"油\"]', '1', '理科', '理化', '7', '0');
INSERT INTO `jb_questions` VALUES ('811', '', '著名漫画《火影忍者》的作者是？', '[\"久保带人\", \"青山刚昌\", \"手冢治虫\", \"岸本齐史\"]', '1', '娱乐', '动漫', '7', '0');
INSERT INTO `jb_questions` VALUES ('812', '穆瓜', '描述中国古代官吏被降职并远调的词是？', '[\"拜\", \"除\", \"谪\", \"擢\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('813', '娃哈哈', '「在天愿做比翼鸟  在地愿为连理枝」的作者是？', '[\"唐伯虎\", \"李商隐\", \"李清照\", \"白居易\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('814', '红色有角三倍速小野', '法国历史上，哪一党派主张审判并处死了法国国王路易十六？', '[\"拿破仑\", \"雅各宾派\", \"斐扬派\", \"吉伦特派\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('815', '', 'windows自带的玩家根据数字点击方块找出目标的游戏是什么？', '[\"斗地主\", \"扑克\", \"扫雷\", \"连连看\"]', '1', '娱乐', '游戏', '7', '0');
INSERT INTO `jb_questions` VALUES ('816', 'Darren', '成语「后击勃发」中哪个字是正确的？', '[\"后\", \"勃\", \"发\", \"击\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('817', '秋风扫落叶', '0度经线是什么线？', '[\"东西半球分界线\", \"本初子午线\", \"国际日期变更线\", \"南北半球分界线\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('818', '浅笑', '洋葱对于人体，具有以下哪种功效？', '[\"降血脂\", \"降体温\", \"降体重\", \"降血压\"]', '1', '生活', '饮食', '7', '0');
INSERT INTO `jb_questions` VALUES ('819', 'Januaryぃ', '愚公移山中的山指哪两座山？', '[\"王屋山和太行山\", \"苍山和黄山\", \"祁连山和太行山\", \"王屋山和祁连山\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('820', 'Z', '《送孟浩然之广陵》的作者是？', '[\"白居易\", \"王安石\", \"李白\", \"杜甫\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('821', 'Sing For My Soul', '歌曲《你不是真正的快乐》的演唱者是？', '[\"本兮\", \"邓紫棋\", \"五月天\", \"信乐团\"]', '1', '娱乐', '音乐', '7', '0');
INSERT INTO `jb_questions` VALUES ('822', '玉哥', '图书《狼图腾》的作者是？', '[\"张继原\", \"腾格尔\", \"姜戎\", \"陈阵\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('823', '土匪', '戮力同心的「戮」字的读音是？', '[\"搓\", \"廖\", \"路\", \"绿\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('824', '跳海的蜗牛', '「孰为汝多知乎？」出自哪篇古文？', '[\"桃花源记\", \"花木兰\", \"两小儿辩日\", \"周公梦蝶\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('825', '军ღ', '拥有「红土之王」之称的男子网球运动员是？', '[\"张德培\", \"费德勒\", \"阿加西\", \"纳达尔\"]', '1', '流行', '体育', '7', '0');
INSERT INTO `jb_questions` VALUES ('826', '', '「大李杜」是李白杜甫，「小李杜」是李商隐和？', '[\"杜甫\", \"杜牧\", \"杜十娘\", \"杜月笙\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('827', '', '爱国华侨陈嘉庚出资兴建的大学是吉美大学和？', '[\"深圳大学\", \"长江大学\", \"厦门大学\", \"江南大学\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('828', '别走', '中国哪个朝代的土地范围最大？', '[\"汉代\", \"唐代\", \"元代\", \"清代\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('829', '亲爱的不二', '下列选项中哪一个不属于省会城市？', '[\"福州\", \"南宁\", \"乌鲁木齐\", \"三亚\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('830', '非一般的飞', '「天无三日晴，地无三尺平」指的是我国的哪个省份？', '[\"西藏自治区\", \"贵州省\", \"重庆市\", \"云南省\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('831', '浊酒新停', '日语中的「喧哗」实际上是什么意思？', '[\"唱歌\", \"吵闹\", \"打架\", \"聚会\"]', '1', '文科', '外语', '7', '0');
INSERT INTO `jb_questions` VALUES ('832', '', '哪个学说目前已被推翻？', '[\"质量守恒\", \"惯性定律\", \"日心说\", \"相对论\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('833', '材料甜菜', '斯里兰卡位于哪个大洲？', '[\"欧洲\", \"南美洲\", \"非洲\", \"亚洲\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('834', '', '电影《致我们终将逝去的青春》改编自哪位作家的同名小说？', '[\"九把刀\", \"严歌苓\", \"辛夷坞\", \"苏有朋\"]', '1', '娱乐', '电影', '7', '0');
INSERT INTO `jb_questions` VALUES ('835', 'new', '民俗「补冬」是从中国古代哪个节气开始？', '[\"小暑\", \"春分\", \"冬至\", \"立冬\"]', '1', '生活', '饮食', '7', '0');
INSERT INTO `jb_questions` VALUES ('836', '不语', '写出「风也萧萧，雨也萧萧，瘦尽灯花又一宵」的词人是？', '[\"李清照\", \"柳永\", \"李煜\", \"纳兰性德\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('837', '对方正在输入', '戊戌变法的「六君子」其中姓谭的是？', '[\"谭咏麟\", \"谭志鑫\", \"谭志文\", \"谭嗣同\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('838', '胡嘉卿', '米开朗基罗的「圣殇」是以下哪种形式的艺术作品？', '[\"雕塑\", \"建筑\", \"油画\", \"音乐\"]', '1', '文艺', '艺术', '7', '0');
INSERT INTO `jb_questions` VALUES ('839', 'Lucky2U', '以下「地支」计时单位中代表生肖蛇的是？', '[\"巳\", \"未\", \"辰\", \"午\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('840', '鸣雀装饰~王延宝～真实', '清代「摊丁入亩」制度是哪位皇帝开始实施的？', '[\"嘉庆\", \"乾隆\", \"雍正\", \"康熙\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('841', 'midita(๑• . •๑)', '世界上最高，落差最大的瀑布是？', '[\"维多利亚瀑布\", \"伊瓜苏瀑布\", \"尼亚加拉瀑布\", \"安赫尔瀑布\"]', '1', '生活', '世界', '7', '0');
INSERT INTO `jb_questions` VALUES ('842', '向日葵', '下列哪项是保定地区特色美食？', '[\"鸡蛋灌饼\", \"驴肉火烧\", \"煎饼\", \"肉夹馍\"]', '1', '生活', '饮食', '7', '0');
INSERT INTO `jb_questions` VALUES ('843', '', '日本的「都道府县」一共有多少个？', '[\"49个\", \"43个\", \"45个\", \"47个\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('844', '', '下列哪本小说的不是由中国作家创作的？', '[\"亚细亚的孤儿\", \"穆斯林的葬礼\", \"一九八四\", \"传奇\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('845', '', '下列疾病何者为细菌感染所致？', '[\"退伍军人症\", \"流行性感冒\", \"咽喉逆流症\", \"登革热\"]', '1', '生活', '健康', '7', '0');
INSERT INTO `jb_questions` VALUES ('846', '_______卓', '福建省的省会是哪个城市？', '[\"福建\", \"福州\", \"南安\", \"厦门\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('847', '夜孤城', '世界四大博物馆之首卢浮宫位于哪个国家？', '[\"瑞士\", \"西班牙\", \"法国\", \"英国\"]', '1', '生活', '世界', '7', '0');
INSERT INTO `jb_questions` VALUES ('848', '', '英文Family Name，在中文翻译中是什么意思？', '[\"姓\", \"小名\", \"名\", \"字\"]', '1', '文科', '外语', '7', '0');
INSERT INTO `jb_questions` VALUES ('849', '朱娟', '《红楼梦》中薛宝钗脖子上挂的金锁刻着「不离不弃」和什么？', '[\"莫失莫忘\", \"仙寿永昌\", \"去邪除祸\", \"芳龄永继\"]', '1', '文艺', '文化', '7', '0');
INSERT INTO `jb_questions` VALUES ('850', '', 'ACG界常说的「CV」是什么意思？', '[\"配乐\", \"原画\", \"导演\", \"配音\"]', '1', '娱乐', '动漫', '7', '0');
INSERT INTO `jb_questions` VALUES ('851', 'wsx', '抗美援朝战争期间中国人民志愿军的总指挥是？', '[\"聂荣臻\", \"粟裕\", \"彭德怀\", \"叶向英\"]', '1', '文科', '军事', '7', '0');
INSERT INTO `jb_questions` VALUES ('852', 'Alan', '符号「Ω」是以下哪个变量的单位？', '[\"电阻\", \"电磁\", \"电流\", \"电压\"]', '1', '理科', '理化', '7', '0');
INSERT INTO `jb_questions` VALUES ('853', 'Forsake', '支持北魏孝文帝改革的太后的是？', '[\"吕后\", \"冯太后\", \"窦太后\", \"韦太后\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('854', '陈哲', '「邺城三台」,主要包括金凤台、铜雀台和？', '[\"金虎台\", \"凤凰台\", \"丛台\", \"冰井台\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('855', '', '钻石商戴比尔斯的著名广告语「钻石恒久远」的下一句是？', '[\"一颗永流传\", \"一颗永相随\", \"一颗永不变\", \"一颗永真心\"]', '1', '流行', '时尚', '7', '0');
INSERT INTO `jb_questions` VALUES ('856', '', '著名的「PLAY」系列所属的日本另类时装品牌是？', '[\"山本耀司\", \"三宅一生\", \"川久保玲\", \"草间弥生\"]', '1', '流行', '时尚', '7', '0');
INSERT INTO `jb_questions` VALUES ('857', '', '主体位于热带，有「热带海洋」之称的是哪个大洋？', '[\"印度洋\", \"北冰洋\", \"太平洋\", \"大西洋\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('858', 'inner', '「长叹息已掩涕息」出自哪位名家笔下？', '[\"李清照\", \"屈原\", \"杜甫\", \"李白\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('859', '翏翏', '下面哪项是颜真卿的书法作品？', '[\"神策军碑\", \"九成宫醴泉铭\", \"麻姑仙坛记\", \"雁塔圣教序\"]', '1', '文艺', '艺术', '7', '0');
INSERT INTO `jb_questions` VALUES ('860', 'Mr^左', 'Fe是什么元素的化学式？', '[\"铜\", \"钠\", \"铝\", \"铁\"]', '1', '理科', '理化', '7', '0');
INSERT INTO `jb_questions` VALUES ('861', '甜味拾荒者', '名著《水浒传》中绰号为「小李广」的人是？', '[\"白胜\", \"花荣\", \"李逵\", \"刘唐\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('862', '菲菲', '《清平调》中「名花倾国两相欢，长得君王带笑看」描写的是谁？', '[\"杨玉环\", \"西施\", \"王昭君\", \"貂蝉\"]', '1', '文艺', '艺术', '7', '0');
INSERT INTO `jb_questions` VALUES ('863', '叽里咕噜呱拉', '「塞下秋来风景异」的下一句是？', '[\"衡阳雁去无留意\", \"霜叶红于二月花\", \"停车坐爱枫林晚\", \"四面边声连角起\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('864', '', '中药学上，我们按药性将中草药分为哪「四气」？', '[\"寒热温凉\", \"冷热寒温\", \"春夏秋冬\", \"正斜歪倒\"]', '1', '生活', '健康', '7', '0');
INSERT INTO `jb_questions` VALUES ('865', '国', '《水浒传》中「孙二娘」的丈夫是？', '[\"武松\", \"张青\", \"林冲\", \"卢俊义\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('866', '晨曦', '人体的「五脏六腑」中「五脏」指的是？', '[\"肝脾肾心胃\", \"心肺胃胆肝\", \"肝胆脾胃肾\", \"脑心脏胃脾\"]', '1', '生活', '健康', '7', '0');
INSERT INTO `jb_questions` VALUES ('867', '惊残孤梦', '肥皂的酸碱性是？', '[\"弱碱性\", \"强酸性\", \"弱酸性\", \"中性\"]', '1', '理科', '理化', '7', '0');
INSERT INTO `jb_questions` VALUES ('868', '', '李安的电影《卧虎藏龙》是改编自哪位作家创作的同名小说？', '[\"王度卢\", \"林清玄\", \"袁腾飞\", \"张晓风\"]', '1', '娱乐', '电影', '7', '0');
INSERT INTO `jb_questions` VALUES ('869', '', '开架喷雾铺货较多的薇姿（Vichy）是哪个国家的护肤品牌？', '[\"德国\", \"中国\", \"韩国\", \"法国\"]', '1', '流行', '时尚', '7', '0');
INSERT INTO `jb_questions` VALUES ('870', '', '电影《肖申克的救赎》中，主人公安迪越狱用的小鹤嘴锄是藏在哪本书中？', '[\"圣经\", \"小说\", \"字典\", \"杂志\"]', '1', '娱乐', '电影', '7', '0');
INSERT INTO `jb_questions` VALUES ('871', 'Tea', '普洱茶原产于哪个省？', '[\"福建省\", \"湖南省\", \"云南省\", \"安徽省\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('872', '', '好莱坞著名男星哈里森福特主演的电影《夺宝奇兵》是由哪位导演执导的？', '[\"迈克尔\", \"斯皮尔伯格\", \"卡梅隆\", \"希区柯克\"]', '1', '娱乐', '电影', '7', '0');
INSERT INTO `jb_questions` VALUES ('873', '往事随风', '东汉的开国皇帝是？', '[\"刘秀\", \"刘备\", \"刘禅\", \"刘邦\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('874', 'Doctor®Xu', '新中国第一辆轿车产自哪一年？', '[\"1956年\", \"1957年\", \"1959年\", \"1958年\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('875', '', '北京话里，「跌份」是指？', '[\"缺心眼\", \"丢钱\", \"摔倒\", \"丢脸\"]', '1', '生活', '日常', '7', '0');
INSERT INTO `jb_questions` VALUES ('876', '', '加拿大的领土面积在世界上排名第几？', '[\"第三\", \"第一\", \"第四\", \"第二\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('877', '李文哲 ', '平遥古城位于我国哪个省？', '[\"浙江\", \"湖南\", \"山西\", \"江西\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('878', '', '「匈奴不灭，何以家为」是哪位历史人物的名言？', '[\"蒙恬\", \"李广\", \"卫青\", \"霍去病\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('879', '百川', '「汉皇重色思倾国，御宇多年求不得」出自哪位诗人笔下？', '[\"李白\", \"王维\", \"陆游\", \"白居易\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('880', '冷', '海里，是什么单位？', '[\"重量单位\", \"面积单位\", \"密度单位\", \"度量单位\"]', '1', '生活', '世界', '7', '0');
INSERT INTO `jb_questions` VALUES ('881', '桃家婴幼儿辅食', '下列选项中获得「奥斯卡终身成就奖」的华人是？', '[\"章子怡\", \"李连杰\", \"范冰冰\", \"成龙\"]', '1', '流行', '名人', '7', '0');
INSERT INTO `jb_questions` VALUES ('882', '但凡', '「言者无罪」的下一句是？', '[\"闻者足戒\", \"景行行止\", \"可以攻玉\", \"予忖度之\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('883', '', '《火影忍者》中，下列不属于晓组织成员的是？', '[\"宇智波鼬\", \"自来也\", \"迪达拉\", \"干柿鬼鲛\"]', '1', '娱乐', '动漫', '7', '0');
INSERT INTO `jb_questions` VALUES ('884', '༊Ᏼ࿆Ꮻ࿆Ꭶ࿆Ꮥ࿆_ 涛', '「萨尔浒战役」发生在中国历史的哪个时期？', '[\"宋朝\", \"明朝\", \"清朝\", \"唐朝\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('885', '宁静致远', '《天净沙·秋思》是谁的诗？', '[\"白朴\", \"李白\", \"李商隐\", \"马致远\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('886', 'Peter Pan', '「庖丁解牛」这个典故出自？', '[\"《庄子》\", \"《尚书》\", \"《中庸》\", \"《论语》\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('887', '', '中国第二大的内陆盆地，被誉为「塞北江南」的是什么盆地？', '[\"塔里木盆地\", \"准噶尔盆地\", \"柴达木盆地\", \"吐鲁番盆地\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('888', '李佳', '在证劵成交当天办理好证劵和价款清算交割手续的交易制度叫做？', '[\"T 0\", \"T-0\", \"T-1\", \"T 1\"]', '1', '文科', '经济', '7', '0');
INSERT INTO `jb_questions` VALUES ('889', '', '动画片《宝莲灯》的片尾曲《爱就一个字》是哪位男歌手演唱的？', '[\"周杰伦\", \"王力宏\", \"张信哲\", \"张学友\"]', '1', '娱乐', '音乐', '7', '0');
INSERT INTO `jb_questions` VALUES ('890', '夭夭', '「不敢高声语，恐惊天上人」出自哪首古诗？', '[\"风\", \"夜宿山寺\", \"登鹳雀楼\", \"八阵图\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('891', '', '能量、功、热值都使用统一的单位，这个单位是什么？', '[\"伏\", \"摩尔\", \"安培\", \"焦耳\"]', '1', '理科', '理化', '7', '0');
INSERT INTO `jb_questions` VALUES ('892', '', '冬至吃饺子的习俗是为了纪念哪位医学家？', '[\"华佗\", \"张仲景\", \"扁鹊\", \"李时珍\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('893', '婷', '我国古代汉民族最长的叙事诗是？', '[\"木兰诗\", \"石壕吏\", \"离骚\", \"孔雀东南飞\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('894', '枫叶', '排球比赛中一方在球来到本方场地最多触球几次？', '[\"5次\", \"无限制\", \"4次\", \"3次\"]', '1', '流行', '体育', '7', '0');
INSERT INTO `jb_questions` VALUES ('895', '', '描写杨贵妃「春寒赐浴华清池，温泉水滑洗凝脂」中的华清池是在哪个省？', '[\"浙江省\", \"陕西省\", \"甘萧省\", \"山东省\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('896', '·   Lian', '「停杯投箸不能食」的下一句是？', '[\"忽复乘舟梦日边\", \"径须沽取对君酌\", \"拔剑四顾心茫然\", \"笑入胡姬酒肆中\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('897', '大花', '所谓的「天狗吃月亮」是指什么天体现象？', '[\"日全食\", \"月全食\", \"月偏食\", \"日偏食\"]', '1', '理科', '天文', '7', '0');
INSERT INTO `jb_questions` VALUES ('898', '', '一般的饮料瓶盖都是向哪个方向拧开？', '[\"向上\", \"向下\", \"顺时针\", \"逆时针\"]', '1', '生活', '日常', '7', '0');
INSERT INTO `jb_questions` VALUES ('899', '斜风', '诗句「五月人倍忙」的前一句是？', '[\"田家少闲月\", \"小麦覆垄黄\", \"因思杜陵梦\", \"凫燕满回塘\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('900', '', '《红楼梦》中的「蘅芜苑」是书中哪位主要人物的住所？', '[\"王熙凤\", \"贾宝玉\", \"林黛玉\", \"薛宝钗\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('901', '三月', '「谭中鱼可百许头，皆若空游无所依」是哪个文言中的句子？', '[\"小石潭记\", \"岳阳楼记\", \"出师表\", \"滕王阁序\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('902', '濾阮阮', '柴可夫斯基的《天鹅湖》是采用那种戏剧表现形式？', '[\"话剧\", \"芭蕾舞剧\", \"歌剧\", \"戏曲\"]', '1', '文艺', '艺术', '7', '0');
INSERT INTO `jb_questions` VALUES ('903', '眼瞳╄渲染繁华', '古代人生四大喜事没有哪一个？', '[\"子孙满堂后\", \"洞房花烛夜\", \"他乡遇故知\", \"金榜题名时\"]', '1', '文艺', '文化', '7', '0');
INSERT INTO `jb_questions` VALUES ('904', '哲飞', '「少陵野老」是哪位诗人的称号？', '[\"范仲淹\", \"李贺\", \"杜甫\", \"李白\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('905', 'Evan-FPU', '文字「瞐」的正确拼音的首个字母是？', '[\"n\", \"r\", \"m\", \"j\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('906', 'Bookyes、', '下列不属于法国的城市是？', '[\"昂热\", \"亚眠\", \"图卢兹\", \"滑铁卢\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('907', '', '日本皇室的家徽纹章是？', '[\"梅花\", \"兰花\", \"葵花\", \"菊花\"]', '1', '生活', '世界', '7', '0');
INSERT INTO `jb_questions` VALUES ('908', '', '传说为关羽「刮骨疗伤」的是哪位名医？', '[\"张仲景\", \"扁鹊\", \"华佗\", \"安道全\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('909', '', '被我国车迷称为「汽车老三样」的是捷达、富康和哪种车？', '[\"甲壳虫\", \"桑塔纳\", \"奇瑞\", \"比亚迪\"]', '1', '流行', '商业', '7', '0');
INSERT INTO `jb_questions` VALUES ('910', '', '端午节龙舟上，用于控制船行驶方向的装置叫什么？', '[\"帆\", \"舵\", \"浆\", \"锚\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('911', '', '下列歌曲不由周杰伦原唱的是？', '[\"告白气球\", \"刚刚好\", \"晴天\", \"青花瓷\"]', '1', '娱乐', '音乐', '7', '0');
INSERT INTO `jb_questions` VALUES ('912', 'A 李弘扬', '《中华小当家》是哪个国家的漫画作品？', '[\"美国\", \"日本\", \"中国\", \"韩国\"]', '1', '娱乐', '动漫', '7', '0');
INSERT INTO `jb_questions` VALUES ('913', '', '「白登之围」指的是哪位汉朝皇帝被匈奴围困于白登山的事件？', '[\"刘恒\", \"刘恭\", \"刘弘\", \"刘邦\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('914', '无厘头', '「阿诗玛」的原型是我国云南哪一民族？', '[\"傣族\", \"苗族\", \"白族\", \"彝族\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('915', 'Je l\'aime', '《朝花西拾》是哪位作家的作品?', '[\"胡适\", \"鲁迅\", \"老舍\", \"邱淑贞\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('916', '', '《权力的游戏》剧集改编自什么小说？', '[\"原创剧集无原著\", \"冰与火之歌\", \"指环王\", \"霍比特人\"]', '1', '娱乐', '电视', '7', '0');
INSERT INTO `jb_questions` VALUES ('917', '印', '2016-2017赛季获得NBA总冠军的是哪支球队？', '[\"骑士队\", \"马刺队\", \"勇士队\", \"雷霆队\"]', '1', '娱乐', '电视', '7', '0');
INSERT INTO `jb_questions` VALUES ('918', 'mr梁', '新加坡的别称是？', '[\"猫城\", \"狮城\", \"马城\", \"虎城\"]', '1', '生活', '世界', '7', '0');
INSERT INTO `jb_questions` VALUES ('919', 'Jet  夏', '一般自动挡汽车的「空挡」是用哪个符号表示？', '[\"D\", \"N\", \"P\", \"R\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('920', '', '法国的国旗颜色从左到右分别是？', '[\"红，白，蓝\", \"蓝，红，白\", \"蓝，白，红\", \"红，蓝，白\"]', '1', '生活', '世界', '7', '0');
INSERT INTO `jb_questions` VALUES ('921', '张难瘦-', '通常成年人一共有多少颗牙齿？', '[\"25～28\", \"26～30\", \"30～35\", \"28～32\"]', '1', '生活', '健康', '7', '0');
INSERT INTO `jb_questions` VALUES ('922', '不喜不怒', '有丝分裂中观察染色体的最佳时期是那一时期？', '[\"间期\", \"后期\", \"中期\", \"前期\"]', '1', '理科', '生物', '7', '0');
INSERT INTO `jb_questions` VALUES ('923', '', '日元的常用硬币面值最高的是？', '[\"500日元\", \"200日元\", \"100日元\", \"50日元\"]', '1', '文科', '经济', '7', '0');
INSERT INTO `jb_questions` VALUES ('924', '', '唐朝诗人张继的《枫桥夜泊》中提到的「寒山寺」在哪座城市？', '[\"苏州\", \"扬州\", \"杭州\", \"郑州\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('925', '平平淡淡一生', '东庠岛中的「庠」的读音是？', '[\"bei\", \"yang\", \"xiang\", \"ku\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('926', '', '玻璃天花板指的是职场对下列哪种人群的歧视？', '[\"女性\", \"少年\", \"老人\", \"男性\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('927', 'tan90°', '「坦克」的发明国是？', '[\"德国\", \"英国\", \"法国\", \"美国\"]', '1', '文科', '军事', '7', '0');
INSERT INTO `jb_questions` VALUES ('928', '乔乔', '「北冥有鱼，其名为（   ）」？', '[\"鹏\", \"鲶\", \"鲫\", \"鲲\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('929', '小王', '国际象棋中黑白双方共有多少个棋子？', '[\"36个\", \"18个\", \"30个\", \"32个\"]', '1', '文艺', '文化', '7', '0');
INSERT INTO `jb_questions` VALUES ('930', '蚂蟷儿', '下列哪个选项不属于世界七大奇迹？', '[\"意大利比萨斜塔\", \"埃及吉萨金字塔\", \"亚历山大灯塔\", \"巴比伦空中花园\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('931', '', '世界第一个成功体外受精的试管婴儿，是在哪年出生？', '[\"1981年\", \"1978年\", \"1980年\", \"1979年\"]', '1', '生活', '健康', '7', '0');
INSERT INTO `jb_questions` VALUES ('932', '小时候可欢了', '中国奥林匹克运动会历史上第一块金牌得主是？', '[\"李宁\", \"刘翔\", \"邓亚萍\", \"许海峰\"]', '1', '流行', '体育', '7', '0');
INSERT INTO `jb_questions` VALUES ('933', 'Albert', '独立建国前的巴西曾是哪个国家的殖民地？', '[\"西班牙\", \"葡萄牙\", \"英国\", \"法国\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('934', '', '「谁言寸草心，报得三春晖」出自唐朝诗人孟郊的哪首诗？', '[\"游子吟\", \"送远吟\", \"苦寒吟\", \"列女操\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('935', '', '云南大理有名的「风花雪月」中「雪」指的是那一个景点？', '[\"蝴蝶泉\", \"大理古城\", \"苍山\", \"洱海\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('936', '', '我国现行的军队编制中，位于「营」以上、「旅」以下的是哪个军事单位？', '[\"团\", \"师\", \"排\", \"班\"]', '1', '文科', '军事', '7', '0');
INSERT INTO `jb_questions` VALUES ('937', '大拇指', '诗句「小时不识月」的下一句是？', '[\"低头望故乡\", \"又疑瑶台镜\", \"遥望青云山\", \"呼作白玉盘\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('938', '张瑜', '秦末楚汉争霸，刘邦采纳韩信的计策，奇兵突出，攻打三秦，此计策是？', '[\"声东击西\", \"虚张声势\", \"暗度陈仓\", \"瞒天过海\"]', '1', '文科', '军事', '7', '0');
INSERT INTO `jb_questions` VALUES ('939', '', '世界上牙齿最多的动物是什么？', '[\"章鱼\", \"蜗牛\", \"蜈蚣\", \"蟑螂\"]', '1', '理科', '生物', '7', '0');
INSERT INTO `jb_questions` VALUES ('940', '', 'CEO表示首席执行官，那么CFO的意思是？', '[\"首席运营官\", \"首席财务官\", \"首席面试官\", \"首席大弟子\"]', '1', '文科', '经济', '7', '0');
INSERT INTO `jb_questions` VALUES ('941', '', '《火影忍者》中，拥有白眼的家族为？', '[\"奈良家\", \"日向家\", \"宇智波家\", \"秋道家\"]', '1', '娱乐', '动漫', '7', '0');
INSERT INTO `jb_questions` VALUES ('942', '', '中欧国家捷克的首都是？', '[\"布达佩斯\", \"维也纳\", \"华沙\", \"布拉格\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('943', '炊烟   么么哒', '「王师北定中原日」的下一句是？', '[\"牧童遥指杏花村\", \"渭城朝雨浥轻尘\", \"柳暗花明又一村\", \"家祭无忘告乃翁\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('944', 'Seasee you', '《浮士德》的第二部分剧分几幕上演？', '[\"8幕\", \"10幕\", \"20幕\", \"5幕\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('945', '驿路梨花', '下列不属于「波罗的海三国」的是？', '[\"希腊\", \"爱沙尼亚\", \"立陶宛\", \"拉脱维亚\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('946', '刘 景 安', '四书五经中的「四书」不包括下列哪个？', '[\"大学\", \"孟子\", \"论语\", \"三字经\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('947', '北方有佳人', '「封侯非我愿，但愿海波平」是哪位历史人物说的话？', '[\"卫青\", \"霍去病\", \"陈汤\", \"戚继光\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('948', '', '「奇秀甲东南」是对哪座名山的赞美？', '[\"峨眉山\", \"张家界\", \"庐山\", \"武夷山\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('949', '无名氏', '「长太息兮将上，心低徊兮顾怀」出自屈原的哪部著作？', '[\"九歌·大司命\", \"九歌·东皇太一\", \"九歌·少司命\", \"九歌·东君\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('950', 'Chi.Yu', '不属于中国六大茶类的是？', '[\"黑茶\", \"乌龙茶\", \"花茶\", \"白茶\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('951', '微安', '汉语词汇「落花有意」的下一句是？', '[\"流水无泪\", \"流水无情\", \"流水无心\", \"流水有情\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('952', '', '成语「直接了当」中的错字是？', '[\"直\", \"接\", \"当\", \"了\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('953', 'Shawn Leung', '紫砂壶以哪个地方生产的最为盛名？', '[\"绍兴\", \"湖州\", \"嘉兴\", \"宜兴\"]', '1', '生活', '日常', '7', '0');
INSERT INTO `jb_questions` VALUES ('954', '四叶MM ^\'^', '著名的华尔兹舞曲《蓝色多瑙河》是由下列哪位德国作曲家创作的？', '[\"施特劳斯\", \"莫扎特\", \"舒伯特\", \"贝多芬\"]', '1', '娱乐', '音乐', '7', '0');
INSERT INTO `jb_questions` VALUES ('955', '', '以法国为代表的欧洲园林最早形成于公元前5世纪的哪个时期？', '[\"古希腊\", \"古埃及\", \"古罗马\", \"文艺复兴\"]', '1', '文艺', '设计', '7', '0');
INSERT INTO `jb_questions` VALUES ('956', '小黑', '兰州拉面有「一清二白三红四绿」的说法，其中「一清」指的是什么？', '[\"牛肉\", \"肉汤\", \"辣椒\", \"面\"]', '1', '生活', '饮食', '7', '0');
INSERT INTO `jb_questions` VALUES ('957', '', '地表最多的金属是？', '[\"铝\", \"铁\", \"氧\", \"铜\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('958', '', '我们通常将寺庙中僧尼们吃的没有肉、没有油的饭食称之为？', '[\"化缘\", \"香火\", \"斋饭\", \"浮屠\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('959', '东海之冰', '「独在异乡为异客」的下一句是？', '[\"遍插茱萸少一人\", \"每逢佳节倍思亲\", \"每逢家节倍思亲\", \"遥知兄弟登高处\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('960', '金金CRH²⁰¹⁷', '浙江省最大的天然湖泊是？', '[\"千岛湖\", \"西湖\", \"南湖\", \"东钱湖\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('961', '58同城杜亚波 18021169279', '《咏鹅》的作者是初唐四杰中的哪一个？', '[\"王勃\", \"杨炯\", \"卢照邻\", \"骆宾王\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('962', '', '世界上历史最为悠久的股票指数是美国的哪个指数？', '[\"纳斯达克\", \"道琼斯\", \"标准普尔\", \"华尔街\"]', '1', '文科', '经济', '7', '0');
INSERT INTO `jb_questions` VALUES ('963', '.Soul', '金骏眉属于什么茶？', '[\"红茶\", \"乌龙茶\", \"绿茶\", \"花茶\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('964', 'Sheropatra', '以下四位文学家中，哪一位所处朝代与其他三位不同？', '[\"关汉卿\", \"元稹\", \"白朴\", \"马致远\"]', '1', '文艺', '文化', '7', '0');
INSERT INTO `jb_questions` VALUES ('965', '', '哪种曲艺种类伴奏的乐器主要是琵琶和三弦？', '[\"苏州评弹\", \"河南坠子\", \"单弦牌子曲\", \"贵州琴书\"]', '1', '文艺', '演艺', '7', '0');
INSERT INTO `jb_questions` VALUES ('966', '', '金庸笔下的屠龙刀中藏有哪部绝世兵法？', '[\"孙子兵法\", \"海国图志\", \"三十六计\", \"武穆遗书\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('967', 'Kiki', '以下哪种气体是惰性气体？', '[\"氢\", \"氦\", \"氧\", \"氮\"]', '1', '理科', '理化', '7', '0');
INSERT INTO `jb_questions` VALUES ('968', '༺༻', '被称为「菊月」的是农历几月份？', '[\"7月\", \"9月\", \"8月\", \"10月\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('969', '', '04年雅典奥运会上，获得10米气步枪冠军并拿下中国首金的女运动员是？', '[\"易思玲\", \"杜丽\", \"何雯娜\", \"陶璐娜\"]', '1', '流行', '体育', '7', '0');
INSERT INTO `jb_questions` VALUES ('970', '', '截止2017年，登上维密秀最多的中国女模特是？', '[\"刘雯\", \"秦舒培\", \"何穗\", \"奚梦瑶\"]', '1', '流行', '时尚', '7', '0');
INSERT INTO `jb_questions` VALUES ('971', 'vwv', '「面朝大海，春暖花开」出自哪位诗人笔下？', '[\"拇指\", \"食指\", \"弦子\", \"海子\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('972', '那一抹微笑^_^穿透阳光', '中国古代神话传说中的「巫山神女」名叫？', '[\"甄姬\", \"乐姬\", \"瑶姬\", \"幽姬\"]', '1', '文艺', '文化', '7', '0');
INSERT INTO `jb_questions` VALUES ('973', '乖得不得了', '五台山最著名的五大禅寺有「显通寺、塔院寺、文殊寺、殊像寺、（  ）寺」？', '[\"罗睺寺\", \"南山寺\", \"慈善寺\", \"碧山寺\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('974', '以至', '「Gene」的中文意思是？', '[\"内含子\", \"染色体\", \"基因\", \"记忆\"]', '1', '理科', '生物', '7', '0');
INSERT INTO `jb_questions` VALUES ('975', '知乎', '最能反映骨骼发育的重要指标是？', '[\"牙齿数\", \"坐高\", \"身长\", \"胸围\"]', '1', '生活', '健康', '7', '0');
INSERT INTO `jb_questions` VALUES ('976', '吉姆尼 13756888193', '有「世界最小越野车」之称的越野汽车是？', '[\"铃木吉姆尼\", \"奥迪Q3\", \"路虎卫士\", \"JEEP自由侠\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('977', '', '电影《投名状》中，赵二虎一角由哪位男演员饰演？', '[\"金城武\", \"李连杰\", \"刘德华\", \"甄子丹\"]', '1', '娱乐', '电影', '7', '0');
INSERT INTO `jb_questions` VALUES ('978', '神秘人王富贵', '下列属于《水浒传》中梁山五虎将的人物是？', '[\"武松\", \"鲁智深\", \"董平\", \"杨志\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('979', '37°女人', '下列不属于山东省的城市是？', '[\"青岛\", \"烟台\", \"大连\", \"济南\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('980', '子轩', '击剑分为花剑，重剑和（）剑？', '[\"轻剑\", \"软剑\", \"硬剑\", \"佩剑\"]', '1', '流行', '体育', '7', '0');
INSERT INTO `jb_questions` VALUES ('981', 'INSIDE', '证券交易价格与市场利率呈()关系?', '[\"正相关\", \"同比\", \"正比\", \"负相关\"]', '1', '流行', '商业', '7', '0');
INSERT INTO `jb_questions` VALUES ('982', '午雎', 'SAC考试是指？', '[\"证券从业资格考试\", \"人力资源考试\", \"会计从业资格考试\", \"银行从业资格考试\"]', '1', '文科', '经济', '7', '0');
INSERT INTO `jb_questions` VALUES ('983', '', '我国神话传说中，发明农业和医药的是「三皇」中的哪位？', '[\"神农\", \"女娲\", \"伏羲\", \"燧人氏\"]', '1', '文艺', '文化', '7', '0');
INSERT INTO `jb_questions` VALUES ('984', 'Sherry.', '「PE」是下列哪门科目的缩写？', '[\"体育\", \"化学\", \"数学\", \"物理\"]', '1', '文科', '外语', '7', '0');
INSERT INTO `jb_questions` VALUES ('985', '大大大', '古巴比伦文明发源地的两条河流分别是「幼发拉底河」和？', '[\"巴拿马河\", \"尼罗河\", \"底格里斯河\", \"苏伊士河\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('986', '大将军࿓陈༙宥༙华༙࿔', '太阳系中的木星实际是一颗什么状态的行星？', '[\"玻璃态\", \"液态\", \"气态\", \"固态\"]', '1', '理科', '天文', '7', '0');
INSERT INTO `jb_questions` VALUES ('987', '蓝鲸先生', '小说《鲁滨逊漂流记》的作者「丹尼尔·笛福」的国籍是？', '[\"英国\", \"美国\", \"西班牙\", \"法国\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('988', '迷雾重重', '意大利足球甲级联赛球队，AC米兰的主场是？', '[\"威斯特法伦\", \"伯纳乌\", \"老特拉福德\", \"圣西罗\"]', '1', '流行', '体育', '7', '0');
INSERT INTO `jb_questions` VALUES ('989', '', '2013年，郭敬明的哪部作品由他自己自编自导拍成了电影？', '[\"幻城\", \"小时代\", \"悲伤逆流成河\", \"爵迹\"]', '1', '娱乐', '电影', '7', '0');
INSERT INTO `jb_questions` VALUES ('990', '', '南非的首都是？', '[\"比勒陀利亚\", \"开普敦\", \"布隆方丹\", \"所有都是\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('991', '', '一个二分音符的时值等同于多少个八分音符的时值？', '[\"两个\", \"三个\", \"五个\", \"四个\"]', '1', '娱乐', '音乐', '7', '0');
INSERT INTO `jb_questions` VALUES ('992', '', '因为四季如春而被称为「春城」的是我国哪个城市？', '[\"广州\", \"昆明\", \"长春\", \"深圳\"]', '1', '理科', '地理', '7', '0');
INSERT INTO `jb_questions` VALUES ('993', '假日心晴', '以下哪一个不属于中国古代四大才女？', '[\"蔡文姬\", \"薛涛\", \"上官婉儿\", \"李清照\"]', '1', '文科', '语文', '7', '0');
INSERT INTO `jb_questions` VALUES ('994', '彼岸在前', '「剁椒鱼头」是哪一地区的名菜？', '[\"东北\", \"湖南\", \"四川\", \"广东\"]', '1', '生活', '饮食', '7', '0');
INSERT INTO `jb_questions` VALUES ('995', '滚边啦', '大家常说的「魔都」指的是哪座城市？', '[\"上海\", \"天津\", \"广州\", \"北京\"]', '1', '生活', '常识', '7', '0');
INSERT INTO `jb_questions` VALUES ('996', '秃尾巴', '古为萧国都城的「龙城」是指我国哪个城市？', '[\"萧县\", \"昆明\", \"哈尔滨\", \"重庆\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('997', '', '《田园交响曲》是谁的作品？', '[\"贝多芬\", \"莫扎特\", \"肖邦\", \"克莱德曼\"]', '1', '文艺', '演艺', '7', '0');
INSERT INTO `jb_questions` VALUES ('998', '傻', '「心学」作为儒学学派之一，「心学」二字由哪位历史人物第一次正式提出？', '[\"欧阳修\", \"朱熹\", \"王阳明\", \"范仲淹\"]', '1', '文科', '历史', '7', '0');
INSERT INTO `jb_questions` VALUES ('999', '风为裳', '英语「busybody」是指？', '[\"大忙人\", \"忙碌的身体\", \"忙于工作的人\", \"爱管闲事的人\"]', '1', '文科', '外语', '7', '0');
INSERT INTO `jb_questions` VALUES ('1000', '', '古诗《夜泊秦淮》的作者是哪位诗人？', '[\"杜甫\", \"白居易\", \"杜牧\", \"李白\"]', '1', '文艺', '文学', '7', '0');
INSERT INTO `jb_questions` VALUES ('1025', null, '西汉文学成就中，最为突出的是？', '[\"散文、诗歌\", \"小传、传奇\", \"戏剧、传记\", \"赋和乐府诗\"]', '1', null, null, null, '1');
INSERT INTO `jb_questions` VALUES ('1026', '蓝精灵灵', '西汉文学成就中，最为突出的是？', '[\"散文、诗歌\", \"小传、传奇\", \"戏剧、传记\", \"赋和乐府诗\"]', '1', null, null, null, '1');
INSERT INTO `jb_questions` VALUES ('1039', '氢氧化钠', '王者荣耀里面那个是战士角色？', '[\"宫本武藏\",\"蔡文姬\",\"鲁班\",\"张良\"]', '1', null, null, null, '0');
INSERT INTO `jb_questions` VALUES ('1040', '氢氧化钠', '王者荣耀典韦说过那一句话？', '[\"不疯魔，不成佛\",\"告诉你一个秘密，我是无敌的\",\"快来和妲己玩耍吧\",\"燃烧的剑，燃烧的心\"]', '1', null, null, null, '0');
INSERT INTO `jb_questions` VALUES ('1041', '氢氧化钠', '谁被称为知八百年前知八百年后？', '[\"刘伯温\",\"诸葛亮\",\"凤雏\",\"张良\"]', '1', null, null, null, '0');
INSERT INTO `jb_questions` VALUES ('1042', '氢氧化钠', '四书五经中的四书不包括哪些？', '[\"尚书\",\"大学\",\"中庸\",\"孟子\"]', '1', null, null, null, '0');
INSERT INTO `jb_questions` VALUES ('1043', '蓝精灵灵', '西汉文学成就中，最为突出的是？', '[\"散文、诗歌\", \"小传、传奇\", \"戏剧、传记\", \"赋和乐府诗\"]', '4', null, null, null, '1');
INSERT INTO `jb_questions` VALUES ('1044', '氢氧化钠', '四书五经中的五经不包括哪些？', '[中庸\", \"尚书\", \"礼记\", \"周易\"]', '1', null, null, null, '0');

-- ----------------------------
-- Table structure for jb_receive
-- ----------------------------
DROP TABLE IF EXISTS `jb_receive`;
CREATE TABLE `jb_receive` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phone` varchar(11) NOT NULL COMMENT '用户手机号',
  `eth` float(20,2) unsigned DEFAULT NULL COMMENT '以太币',
  `add_time` int(11) unsigned DEFAULT NULL COMMENT '领取时间',
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '0失败1成功',
  `order_num` varchar(100) DEFAULT NULL COMMENT '提现订单号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COMMENT='提现表';

-- ----------------------------
-- Records of jb_receive
-- ----------------------------

-- ----------------------------
-- Table structure for jb_recycle_bin
-- ----------------------------
DROP TABLE IF EXISTS `jb_recycle_bin`;
CREATE TABLE `jb_recycle_bin` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(11) DEFAULT '0' COMMENT '删除内容 id',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `table_name` varchar(60) DEFAULT '' COMMENT '删除内容所在表名',
  `name` varchar(255) DEFAULT '' COMMENT '删除内容名称',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT=' 回收站';

-- ----------------------------
-- Records of jb_recycle_bin
-- ----------------------------

-- ----------------------------
-- Table structure for jb_register
-- ----------------------------
DROP TABLE IF EXISTS `jb_register`;
CREATE TABLE `jb_register` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phone` varchar(12) DEFAULT NULL COMMENT '注册手机号',
  `password` varchar(255) DEFAULT '' COMMENT '注册密码',
  `invite_code` varchar(255) DEFAULT '' COMMENT '邀请码',
  `add_time` int(11) unsigned DEFAULT NULL COMMENT '注册时间',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '1正常0冻结',
  `vcode` varchar(255) DEFAULT NULL COMMENT '验证码',
  `answer_card` int(10) unsigned DEFAULT '0' COMMENT '答题卡',
  `revive_card` int(10) unsigned DEFAULT '0' COMMENT '复活卡',
  `head_img` varchar(255) DEFAULT '' COMMENT '用户头像',
  `name` varchar(255) DEFAULT '' COMMENT '用户昵称 加密',
  `eth` float(20,2) unsigned DEFAULT '0.00' COMMENT '以太币',
  `u_name` varchar(255) DEFAULT '' COMMENT '未加密的昵称',
  `update_time` int(11) unsigned DEFAULT NULL COMMENT '登录时间',
  `randnum` int(11) unsigned DEFAULT NULL COMMENT '游戏标识 1进入游戏 2结束',
  `randcookie` varchar(255) DEFAULT '1',
  `memo` varchar(10) COMMENT '用户memo用于充值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `memo` (`memo`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- ----------------------------
-- Records of jb_register
-- ----------------------------

-- ----------------------------
-- Table structure for jb_role
-- ----------------------------
DROP TABLE IF EXISTS `jb_role`;
CREATE TABLE `jb_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父角色ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;0:禁用;1:正常',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `list_order` float NOT NULL DEFAULT '0' COMMENT '排序',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

-- ----------------------------
-- Records of jb_role
-- ----------------------------
INSERT INTO `jb_role` VALUES ('1', '0', '1', '1329633709', '1329633709', '0', '超级管理员', '拥有网站最高管理员权限！');
INSERT INTO `jb_role` VALUES ('2', '0', '1', '1329633709', '1329633709', '0', '门店账号', '门店账号的权限');

-- ----------------------------
-- Table structure for jb_role_user
-- ----------------------------
DROP TABLE IF EXISTS `jb_role_user`;
CREATE TABLE `jb_role_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '角色 id',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

-- ----------------------------
-- Records of jb_role_user
-- ----------------------------
INSERT INTO `jb_role_user` VALUES ('1', '1', '1');
INSERT INTO `jb_role_user` VALUES ('2', '2', '2');

-- ----------------------------
-- Table structure for jb_route
-- ----------------------------
DROP TABLE IF EXISTS `jb_route`;
CREATE TABLE `jb_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态;1:启用,0:不启用',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'URL规则类型;1:用户自定义;2:别名添加',
  `full_url` varchar(255) NOT NULL DEFAULT '' COMMENT '完整url',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '实际显示的url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='url路由表';

-- ----------------------------
-- Records of jb_route
-- ----------------------------

-- ----------------------------
-- Table structure for jb_slide
-- ----------------------------
DROP TABLE IF EXISTS `jb_slide`;
CREATE TABLE `jb_slide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:显示,0不显示',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `name` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片分类',
  `remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '分类备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='幻灯片表';

-- ----------------------------
-- Records of jb_slide
-- ----------------------------

-- ----------------------------
-- Table structure for jb_slide_item
-- ----------------------------
DROP TABLE IF EXISTS `jb_slide_item`;
CREATE TABLE `jb_slide_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slide_id` int(11) NOT NULL DEFAULT '0' COMMENT '幻灯片id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:显示;0:隐藏',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '幻灯片名称',
  `image` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片图片',
  `url` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片链接',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `description` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '幻灯片描述',
  `content` text CHARACTER SET utf8 COMMENT '幻灯片内容',
  `more` text COMMENT '链接打开方式',
  PRIMARY KEY (`id`),
  KEY `slide_id` (`slide_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='幻灯片子项表';

-- ----------------------------
-- Records of jb_slide_item
-- ----------------------------

-- ----------------------------
-- Table structure for jb_start
-- ----------------------------
DROP TABLE IF EXISTS `jb_start`;
CREATE TABLE `jb_start` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '明星姓名',
  `vote_num` int(50) unsigned DEFAULT '0' COMMENT '投票数量',
  `img` varchar(255) DEFAULT NULL COMMENT '明星头像',
  `add_time` int(10) unsigned DEFAULT NULL,
  `is_del` tinyint(1) unsigned DEFAULT '0' COMMENT '0没有删除1删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jb_start
-- ----------------------------
INSERT INTO `jb_start` VALUES ('1', '刘志银', '46552', '/upload/20180907/30ee943e76438433d450f69ad76bce1e.png', '1536139180', '0');
INSERT INTO `jb_start` VALUES ('2', '王菲', '710', '/upload/20180907/3198e6597441f4ff6deec65080fa4ce8.png', '1536139180', '0');
INSERT INTO `jb_start` VALUES ('3', '李建', '106', '/upload/20180907/18c82de782653cc1928eb0bdac425242.png', '1536291649', '0');
INSERT INTO `jb_start` VALUES ('4', '大张伟', '20', '/upload/20180907/49eae99a01e92d72c4ace44be711f183.png', '1536301346', '0');
INSERT INTO `jb_start` VALUES ('5', '智汇云后端大佬', '152579', '/upload/20180907/cb104f7a2f7e65aacb146165aec05061.png', '1536301364', '0');
INSERT INTO `jb_start` VALUES ('6', '商城客户', '4', '/upload/20180907/3f61315f8df2a8091377777b6205171c.png', '1536303640', '0');
INSERT INTO `jb_start` VALUES ('7', '王菲', '5', '/upload/20180907/8d239a92f8f6e839e6e6b6917e1399ac.png', '1536303650', '0');
INSERT INTO `jb_start` VALUES ('28', 'Boss', '0', '/upload/20180910/ef80003974106fcd78ec74e3e29152f1.png', '1536569108', '0');

-- ----------------------------
-- Table structure for jb_theme
-- ----------------------------
DROP TABLE IF EXISTS `jb_theme`;
CREATE TABLE `jb_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后升级时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '模板状态,1:正在使用;0:未使用',
  `is_compiled` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为已编译模板',
  `theme` varchar(20) NOT NULL DEFAULT '' COMMENT '主题目录名，用于主题的维一标识',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '主题名称',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '主题版本号',
  `demo_url` varchar(50) NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `author` varchar(20) NOT NULL DEFAULT '' COMMENT '主题作者',
  `author_url` varchar(50) NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `lang` varchar(10) NOT NULL DEFAULT '' COMMENT '支持语言',
  `keywords` varchar(50) NOT NULL DEFAULT '' COMMENT '主题关键字',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '主题描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jb_theme
-- ----------------------------
INSERT INTO `jb_theme` VALUES ('1', '0', '0', '0', '0', 'simpleboot3', 'simpleboot3', '1.0.2', 'http://demo.thinkcmf.com', '', 'ThinkCMF', 'http://www.thinkcmf.com', 'zh-cn', 'ThinkCMF模板', 'ThinkCMF默认模板');

-- ----------------------------
-- Table structure for jb_theme_file
-- ----------------------------
DROP TABLE IF EXISTS `jb_theme_file`;
CREATE TABLE `jb_theme_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_public` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否公共的模板文件',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `theme` varchar(20) NOT NULL DEFAULT '' COMMENT '模板名称',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '模板文件名',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作',
  `file` varchar(50) NOT NULL DEFAULT '' COMMENT '模板文件，相对于模板根目录，如Portal/index.html',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '模板文件描述',
  `more` text COMMENT '模板更多配置,用户自己后台设置的',
  `config_more` text COMMENT '模板更多配置,来源模板的配置文件',
  `draft_more` text COMMENT '模板更多配置,用户临时保存的配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jb_theme_file
-- ----------------------------
INSERT INTO `jb_theme_file` VALUES ('1', '0', '10', 'simpleboot3', '文章页', 'portal/Article/index', 'portal/article', '文章页模板文件', '{\"vars\":{\"hot_articles_category_id\":{\"title\":\"Hot Articles\\u5206\\u7c7bID\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', '{\"vars\":{\"hot_articles_category_id\":{\"title\":\"Hot Articles\\u5206\\u7c7bID\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', null);
INSERT INTO `jb_theme_file` VALUES ('2', '0', '10', 'simpleboot3', '联系我们页', 'portal/Page/index', 'portal/contact', '联系我们页模板文件', '{\"vars\":{\"baidu_map_info_window_text\":{\"title\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57\",\"name\":\"baidu_map_info_window_text\",\"value\":\"ThinkCMF<br\\/><span class=\'\'>\\u5730\\u5740\\uff1a\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def2601\\u53f7<\\/span>\",\"type\":\"text\",\"tip\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57,\\u652f\\u6301\\u7b80\\u5355html\\u4ee3\\u7801\",\"rule\":[]},\"company_location\":{\"title\":\"\\u516c\\u53f8\\u5750\\u6807\",\"value\":\"\",\"type\":\"location\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_cn\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\",\"value\":\"\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def0001\\u53f7\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_en\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"NO.0001 Xie Tu Road, Shanghai China\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"email\":{\"title\":\"\\u516c\\u53f8\\u90ae\\u7bb1\",\"value\":\"catman@thinkcmf.com\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_cn\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\",\"value\":\"021 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_en\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"+8621 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"qq\":{\"title\":\"\\u8054\\u7cfbQQ\",\"value\":\"478519726\",\"type\":\"text\",\"tip\":\"\\u591a\\u4e2a QQ\\u4ee5\\u82f1\\u6587\\u9017\\u53f7\\u9694\\u5f00\",\"rule\":{\"require\":true}}}}', '{\"vars\":{\"baidu_map_info_window_text\":{\"title\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57\",\"name\":\"baidu_map_info_window_text\",\"value\":\"ThinkCMF<br\\/><span class=\'\'>\\u5730\\u5740\\uff1a\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def2601\\u53f7<\\/span>\",\"type\":\"text\",\"tip\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57,\\u652f\\u6301\\u7b80\\u5355html\\u4ee3\\u7801\",\"rule\":[]},\"company_location\":{\"title\":\"\\u516c\\u53f8\\u5750\\u6807\",\"value\":\"\",\"type\":\"location\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_cn\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\",\"value\":\"\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def0001\\u53f7\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_en\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"NO.0001 Xie Tu Road, Shanghai China\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"email\":{\"title\":\"\\u516c\\u53f8\\u90ae\\u7bb1\",\"value\":\"catman@thinkcmf.com\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_cn\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\",\"value\":\"021 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_en\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"+8621 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"qq\":{\"title\":\"\\u8054\\u7cfbQQ\",\"value\":\"478519726\",\"type\":\"text\",\"tip\":\"\\u591a\\u4e2a QQ\\u4ee5\\u82f1\\u6587\\u9017\\u53f7\\u9694\\u5f00\",\"rule\":{\"require\":true}}}}', null);
INSERT INTO `jb_theme_file` VALUES ('3', '0', '5', 'simpleboot3', '首页', 'portal/Index/index', 'portal/index', '首页模板文件', '{\"vars\":{\"top_slide\":{\"title\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"admin\\/Slide\\/index\",\"multi\":false},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"tip\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"rule\":{\"require\":true}}},\"widgets\":{\"features\":{\"title\":\"\\u5feb\\u901f\\u4e86\\u89e3ThinkCMF\",\"display\":\"1\",\"vars\":{\"sub_title\":{\"title\":\"\\u526f\\u6807\\u9898\",\"value\":\"Quickly understand the ThinkCMF\",\"type\":\"text\",\"placeholder\":\"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"features\":{\"title\":\"\\u7279\\u6027\\u4ecb\\u7ecd\",\"value\":[{\"title\":\"MVC\\u5206\\u5c42\\u6a21\\u5f0f\",\"icon\":\"bars\",\"content\":\"\\u4f7f\\u7528MVC\\u5e94\\u7528\\u7a0b\\u5e8f\\u88ab\\u5206\\u6210\\u4e09\\u4e2a\\u6838\\u5fc3\\u90e8\\u4ef6\\uff1a\\u6a21\\u578b\\uff08M\\uff09\\u3001\\u89c6\\u56fe\\uff08V\\uff09\\u3001\\u63a7\\u5236\\u5668\\uff08C\\uff09\\uff0c\\u4ed6\\u4e0d\\u662f\\u4e00\\u4e2a\\u65b0\\u7684\\u6982\\u5ff5\\uff0c\\u53ea\\u662fThinkCMF\\u5c06\\u5176\\u53d1\\u6325\\u5230\\u4e86\\u6781\\u81f4\\u3002\"},{\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"group\",\"content\":\"ThinkCMF\\u5185\\u7f6e\\u4e86\\u7075\\u6d3b\\u7684\\u7528\\u6237\\u7ba1\\u7406\\u65b9\\u5f0f\\uff0c\\u5e76\\u53ef\\u76f4\\u63a5\\u4e0e\\u7b2c\\u4e09\\u65b9\\u7ad9\\u70b9\\u8fdb\\u884c\\u4e92\\u8054\\u4e92\\u901a\\uff0c\\u5982\\u679c\\u4f60\\u613f\\u610f\\u751a\\u81f3\\u53ef\\u4ee5\\u5bf9\\u5355\\u4e2a\\u7528\\u6237\\u6216\\u7fa4\\u4f53\\u7528\\u6237\\u7684\\u884c\\u4e3a\\u8fdb\\u884c\\u8bb0\\u5f55\\u53ca\\u5206\\u4eab\\uff0c\\u4e3a\\u60a8\\u7684\\u8fd0\\u8425\\u51b3\\u7b56\\u63d0\\u4f9b\\u6709\\u6548\\u53c2\\u8003\\u6570\\u636e\\u3002\"},{\"title\":\"\\u4e91\\u7aef\\u90e8\\u7f72\",\"icon\":\"cloud\",\"content\":\"\\u901a\\u8fc7\\u9a71\\u52a8\\u7684\\u65b9\\u5f0f\\u53ef\\u4ee5\\u8f7b\\u677e\\u652f\\u6301\\u4e91\\u5e73\\u53f0\\u7684\\u90e8\\u7f72\\uff0c\\u8ba9\\u4f60\\u7684\\u7f51\\u7ad9\\u65e0\\u7f1d\\u8fc1\\u79fb\\uff0c\\u5185\\u7f6e\\u5df2\\u7ecf\\u652f\\u6301SAE\\u3001BAE\\uff0c\\u6b63\\u5f0f\\u7248\\u5c06\\u5bf9\\u4e91\\u7aef\\u90e8\\u7f72\\u8fdb\\u884c\\u8fdb\\u4e00\\u6b65\\u4f18\\u5316\\u3002\"},{\"title\":\"\\u5b89\\u5168\\u7b56\\u7565\",\"icon\":\"heart\",\"content\":\"\\u63d0\\u4f9b\\u7684\\u7a33\\u5065\\u7684\\u5b89\\u5168\\u7b56\\u7565\\uff0c\\u5305\\u62ec\\u5907\\u4efd\\u6062\\u590d\\uff0c\\u5bb9\\u9519\\uff0c\\u9632\\u6cbb\\u6076\\u610f\\u653b\\u51fb\\u767b\\u9646\\uff0c\\u7f51\\u9875\\u9632\\u7be1\\u6539\\u7b49\\u591a\\u9879\\u5b89\\u5168\\u7ba1\\u7406\\u529f\\u80fd\\uff0c\\u4fdd\\u8bc1\\u7cfb\\u7edf\\u5b89\\u5168\\uff0c\\u53ef\\u9760\\uff0c\\u7a33\\u5b9a\\u7684\\u8fd0\\u884c\\u3002\"},{\"title\":\"\\u5e94\\u7528\\u6a21\\u5757\\u5316\",\"icon\":\"cubes\",\"content\":\"\\u63d0\\u51fa\\u5168\\u65b0\\u7684\\u5e94\\u7528\\u6a21\\u5f0f\\u8fdb\\u884c\\u6269\\u5c55\\uff0c\\u4e0d\\u7ba1\\u662f\\u4f60\\u5f00\\u53d1\\u4e00\\u4e2a\\u5c0f\\u529f\\u80fd\\u8fd8\\u662f\\u4e00\\u4e2a\\u5168\\u65b0\\u7684\\u7ad9\\u70b9\\uff0c\\u5728ThinkCMF\\u4e2d\\u4f60\\u53ea\\u662f\\u589e\\u52a0\\u4e86\\u4e00\\u4e2aAPP\\uff0c\\u6bcf\\u4e2a\\u72ec\\u7acb\\u8fd0\\u884c\\u4e92\\u4e0d\\u5f71\\u54cd\\uff0c\\u4fbf\\u4e8e\\u7075\\u6d3b\\u6269\\u5c55\\u548c\\u4e8c\\u6b21\\u5f00\\u53d1\\u3002\"},{\"title\":\"\\u514d\\u8d39\\u5f00\\u6e90\",\"icon\":\"certificate\",\"content\":\"\\u4ee3\\u7801\\u9075\\u5faaApache2\\u5f00\\u6e90\\u534f\\u8bae\\uff0c\\u514d\\u8d39\\u4f7f\\u7528\\uff0c\\u5bf9\\u5546\\u4e1a\\u7528\\u6237\\u4e5f\\u65e0\\u4efb\\u4f55\\u9650\\u5236\\u3002\"}],\"type\":\"array\",\"item\":{\"title\":{\"title\":\"\\u6807\\u9898\",\"value\":\"\",\"type\":\"text\",\"rule\":{\"require\":true}},\"icon\":{\"title\":\"\\u56fe\\u6807\",\"value\":\"\",\"type\":\"text\"},\"content\":{\"title\":\"\\u63cf\\u8ff0\",\"value\":\"\",\"type\":\"textarea\"}},\"tip\":\"\"}}},\"last_news\":{\"title\":\"\\u6700\\u65b0\\u8d44\\u8baf\",\"display\":\"1\",\"vars\":{\"last_news_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/Category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '{\"vars\":{\"top_slide\":{\"title\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"admin\\/Slide\\/index\",\"multi\":false},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"tip\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"rule\":{\"require\":true}}},\"widgets\":{\"features\":{\"title\":\"\\u5feb\\u901f\\u4e86\\u89e3ThinkCMF\",\"display\":\"1\",\"vars\":{\"sub_title\":{\"title\":\"\\u526f\\u6807\\u9898\",\"value\":\"Quickly understand the ThinkCMF\",\"type\":\"text\",\"placeholder\":\"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"features\":{\"title\":\"\\u7279\\u6027\\u4ecb\\u7ecd\",\"value\":[{\"title\":\"MVC\\u5206\\u5c42\\u6a21\\u5f0f\",\"icon\":\"bars\",\"content\":\"\\u4f7f\\u7528MVC\\u5e94\\u7528\\u7a0b\\u5e8f\\u88ab\\u5206\\u6210\\u4e09\\u4e2a\\u6838\\u5fc3\\u90e8\\u4ef6\\uff1a\\u6a21\\u578b\\uff08M\\uff09\\u3001\\u89c6\\u56fe\\uff08V\\uff09\\u3001\\u63a7\\u5236\\u5668\\uff08C\\uff09\\uff0c\\u4ed6\\u4e0d\\u662f\\u4e00\\u4e2a\\u65b0\\u7684\\u6982\\u5ff5\\uff0c\\u53ea\\u662fThinkCMF\\u5c06\\u5176\\u53d1\\u6325\\u5230\\u4e86\\u6781\\u81f4\\u3002\"},{\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"group\",\"content\":\"ThinkCMF\\u5185\\u7f6e\\u4e86\\u7075\\u6d3b\\u7684\\u7528\\u6237\\u7ba1\\u7406\\u65b9\\u5f0f\\uff0c\\u5e76\\u53ef\\u76f4\\u63a5\\u4e0e\\u7b2c\\u4e09\\u65b9\\u7ad9\\u70b9\\u8fdb\\u884c\\u4e92\\u8054\\u4e92\\u901a\\uff0c\\u5982\\u679c\\u4f60\\u613f\\u610f\\u751a\\u81f3\\u53ef\\u4ee5\\u5bf9\\u5355\\u4e2a\\u7528\\u6237\\u6216\\u7fa4\\u4f53\\u7528\\u6237\\u7684\\u884c\\u4e3a\\u8fdb\\u884c\\u8bb0\\u5f55\\u53ca\\u5206\\u4eab\\uff0c\\u4e3a\\u60a8\\u7684\\u8fd0\\u8425\\u51b3\\u7b56\\u63d0\\u4f9b\\u6709\\u6548\\u53c2\\u8003\\u6570\\u636e\\u3002\"},{\"title\":\"\\u4e91\\u7aef\\u90e8\\u7f72\",\"icon\":\"cloud\",\"content\":\"\\u901a\\u8fc7\\u9a71\\u52a8\\u7684\\u65b9\\u5f0f\\u53ef\\u4ee5\\u8f7b\\u677e\\u652f\\u6301\\u4e91\\u5e73\\u53f0\\u7684\\u90e8\\u7f72\\uff0c\\u8ba9\\u4f60\\u7684\\u7f51\\u7ad9\\u65e0\\u7f1d\\u8fc1\\u79fb\\uff0c\\u5185\\u7f6e\\u5df2\\u7ecf\\u652f\\u6301SAE\\u3001BAE\\uff0c\\u6b63\\u5f0f\\u7248\\u5c06\\u5bf9\\u4e91\\u7aef\\u90e8\\u7f72\\u8fdb\\u884c\\u8fdb\\u4e00\\u6b65\\u4f18\\u5316\\u3002\"},{\"title\":\"\\u5b89\\u5168\\u7b56\\u7565\",\"icon\":\"heart\",\"content\":\"\\u63d0\\u4f9b\\u7684\\u7a33\\u5065\\u7684\\u5b89\\u5168\\u7b56\\u7565\\uff0c\\u5305\\u62ec\\u5907\\u4efd\\u6062\\u590d\\uff0c\\u5bb9\\u9519\\uff0c\\u9632\\u6cbb\\u6076\\u610f\\u653b\\u51fb\\u767b\\u9646\\uff0c\\u7f51\\u9875\\u9632\\u7be1\\u6539\\u7b49\\u591a\\u9879\\u5b89\\u5168\\u7ba1\\u7406\\u529f\\u80fd\\uff0c\\u4fdd\\u8bc1\\u7cfb\\u7edf\\u5b89\\u5168\\uff0c\\u53ef\\u9760\\uff0c\\u7a33\\u5b9a\\u7684\\u8fd0\\u884c\\u3002\"},{\"title\":\"\\u5e94\\u7528\\u6a21\\u5757\\u5316\",\"icon\":\"cubes\",\"content\":\"\\u63d0\\u51fa\\u5168\\u65b0\\u7684\\u5e94\\u7528\\u6a21\\u5f0f\\u8fdb\\u884c\\u6269\\u5c55\\uff0c\\u4e0d\\u7ba1\\u662f\\u4f60\\u5f00\\u53d1\\u4e00\\u4e2a\\u5c0f\\u529f\\u80fd\\u8fd8\\u662f\\u4e00\\u4e2a\\u5168\\u65b0\\u7684\\u7ad9\\u70b9\\uff0c\\u5728ThinkCMF\\u4e2d\\u4f60\\u53ea\\u662f\\u589e\\u52a0\\u4e86\\u4e00\\u4e2aAPP\\uff0c\\u6bcf\\u4e2a\\u72ec\\u7acb\\u8fd0\\u884c\\u4e92\\u4e0d\\u5f71\\u54cd\\uff0c\\u4fbf\\u4e8e\\u7075\\u6d3b\\u6269\\u5c55\\u548c\\u4e8c\\u6b21\\u5f00\\u53d1\\u3002\"},{\"title\":\"\\u514d\\u8d39\\u5f00\\u6e90\",\"icon\":\"certificate\",\"content\":\"\\u4ee3\\u7801\\u9075\\u5faaApache2\\u5f00\\u6e90\\u534f\\u8bae\\uff0c\\u514d\\u8d39\\u4f7f\\u7528\\uff0c\\u5bf9\\u5546\\u4e1a\\u7528\\u6237\\u4e5f\\u65e0\\u4efb\\u4f55\\u9650\\u5236\\u3002\"}],\"type\":\"array\",\"item\":{\"title\":{\"title\":\"\\u6807\\u9898\",\"value\":\"\",\"type\":\"text\",\"rule\":{\"require\":true}},\"icon\":{\"title\":\"\\u56fe\\u6807\",\"value\":\"\",\"type\":\"text\"},\"content\":{\"title\":\"\\u63cf\\u8ff0\",\"value\":\"\",\"type\":\"textarea\"}},\"tip\":\"\"}}},\"last_news\":{\"title\":\"\\u6700\\u65b0\\u8d44\\u8baf\",\"display\":\"1\",\"vars\":{\"last_news_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/Category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', null);
INSERT INTO `jb_theme_file` VALUES ('4', '0', '10', 'simpleboot3', '文章列表页', 'portal/List/index', 'portal/list', '文章列表模板文件', '{\"vars\":[],\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '{\"vars\":[],\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', null);
INSERT INTO `jb_theme_file` VALUES ('5', '0', '10', 'simpleboot3', '单页面', 'portal/Page/index', 'portal/page', '单页面模板文件', '{\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '{\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', null);
INSERT INTO `jb_theme_file` VALUES ('6', '0', '10', 'simpleboot3', '搜索页面', 'portal/search/index', 'portal/search', '搜索模板文件', '{\"vars\":{\"varName1\":{\"title\":\"\\u70ed\\u95e8\\u641c\\u7d22\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\\u8fd9\\u662f\\u4e00\\u4e2atext\",\"rule\":{\"require\":true}}}}', '{\"vars\":{\"varName1\":{\"title\":\"\\u70ed\\u95e8\\u641c\\u7d22\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\\u8fd9\\u662f\\u4e00\\u4e2atext\",\"rule\":{\"require\":true}}}}', null);
INSERT INTO `jb_theme_file` VALUES ('7', '1', '0', 'simpleboot3', '模板全局配置', 'public/Config', 'public/config', '模板全局配置文件', '{\"vars\":{\"enable_mobile\":{\"title\":\"\\u624b\\u673a\\u6ce8\\u518c\",\"value\":1,\"type\":\"select\",\"options\":{\"1\":\"\\u5f00\\u542f\",\"0\":\"\\u5173\\u95ed\"},\"tip\":\"\"}}}', '{\"vars\":{\"enable_mobile\":{\"title\":\"\\u624b\\u673a\\u6ce8\\u518c\",\"value\":1,\"type\":\"select\",\"options\":{\"1\":\"\\u5f00\\u542f\",\"0\":\"\\u5173\\u95ed\"},\"tip\":\"\"}}}', null);
INSERT INTO `jb_theme_file` VALUES ('8', '1', '1', 'simpleboot3', '导航条', 'public/Nav', 'public/nav', '导航条模板文件', '{\"vars\":{\"company_name\":{\"title\":\"\\u516c\\u53f8\\u540d\\u79f0\",\"name\":\"company_name\",\"value\":\"ThinkCMF\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', '{\"vars\":{\"company_name\":{\"title\":\"\\u516c\\u53f8\\u540d\\u79f0\",\"name\":\"company_name\",\"value\":\"ThinkCMF\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', null);

-- ----------------------------
-- Table structure for jb_third_party_user
-- ----------------------------
DROP TABLE IF EXISTS `jb_third_party_user`;
CREATE TABLE `jb_third_party_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '本站用户id',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'access_token过期时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '绑定时间',
  `login_times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:正常;0:禁用',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `third_party` varchar(20) NOT NULL DEFAULT '' COMMENT '第三方惟一码',
  `app_id` varchar(64) NOT NULL DEFAULT '' COMMENT '第三方应用 id',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `access_token` varchar(512) NOT NULL DEFAULT '' COMMENT '第三方授权码',
  `openid` varchar(40) NOT NULL DEFAULT '' COMMENT '第三方用户id',
  `union_id` varchar(64) NOT NULL DEFAULT '' COMMENT '第三方用户多个产品中的惟一 id,(如:微信平台)',
  `more` text COMMENT '扩展信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='第三方用户表';

-- ----------------------------
-- Records of jb_third_party_user
-- ----------------------------

-- ----------------------------
-- Table structure for jb_user
-- ----------------------------
DROP TABLE IF EXISTS `jb_user`;
CREATE TABLE `jb_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户类型;1:admin;2:会员',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别;0:保密,1:男,2:女',
  `birthday` int(11) NOT NULL DEFAULT '0' COMMENT '生日',
  `last_login_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `coin` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '金币',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `user_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态;0:禁用,1:正常,2:未验证',
  `user_login` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码;jb_password加密',
  `user_nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '用户登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网址',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `signature` varchar(255) NOT NULL DEFAULT '' COMMENT '个性签名',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '用户手机号',
  `more` text COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  KEY `user_login` (`user_login`),
  KEY `user_nickname` (`user_nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- ----------------------------
-- Records of jb_user
-- ----------------------------
INSERT INTO `jb_user` VALUES ('1', '1', '0', '0', '1537519665', '0', '0', '0.00', '1526536440', '1', 'admin', '###c4b808d55937c1f1f4d08cb2f1bc5d78', 'admin', '1124960464@qq.com', '', '', '', '121.32.196.154', '', '', null);
INSERT INTO `jb_user` VALUES ('2', '1', '0', '0', '0', '0', '0', '0.00', '0', '1', '新门店', '###1ec3bca18ac77d57b9872db107fb0df5', '', '123@qq.com', '', '', '', '', '', '', null);

-- ----------------------------
-- Table structure for jb_user_action
-- ----------------------------
DROP TABLE IF EXISTS `jb_user_action`;
CREATE TABLE `jb_user_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '更改积分，可以为负',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '更改金币，可以为负',
  `reward_number` int(11) NOT NULL DEFAULT '0' COMMENT '奖励次数',
  `cycle_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '周期类型;0:不限;1:按天;2:按小时;3:永久',
  `cycle_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '周期时间值',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `app` varchar(50) NOT NULL DEFAULT '' COMMENT '操作所在应用名或插件名等',
  `url` text COMMENT '执行操作的url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户操作表';

-- ----------------------------
-- Records of jb_user_action
-- ----------------------------
INSERT INTO `jb_user_action` VALUES ('1', '1', '1', '1', '2', '1', '用户登录', 'login', 'user', '');

-- ----------------------------
-- Table structure for jb_user_action_log
-- ----------------------------
DROP TABLE IF EXISTS `jb_user_action_log`;
CREATE TABLE `jb_user_action_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `last_visit_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后访问时间',
  `object` varchar(100) NOT NULL DEFAULT '' COMMENT '访问对象的id,格式:不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作名称;格式:应用名+控制器+操作名,也可自己定义格式只要不发生冲突且惟一;',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '用户ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user_id`,`object`,`action`),
  KEY `user_object_action_ip` (`user_id`,`object`,`action`,`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='访问记录表';

-- ----------------------------
-- Records of jb_user_action_log
-- ----------------------------

-- ----------------------------
-- Table structure for jb_user_balance_log
-- ----------------------------
DROP TABLE IF EXISTS `jb_user_balance_log`;
CREATE TABLE `jb_user_balance_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `change` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '更改余额',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '更改后余额',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户余额变更日志表';

-- ----------------------------
-- Records of jb_user_balance_log
-- ----------------------------

-- ----------------------------
-- Table structure for jb_user_buy
-- ----------------------------
DROP TABLE IF EXISTS `jb_user_buy`;
CREATE TABLE `jb_user_buy` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `price_id` int(10) unsigned DEFAULT NULL COMMENT '价格id',
  `num` int(10) unsigned DEFAULT NULL COMMENT '购买数量',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `invite_code` varchar(255) DEFAULT NULL COMMENT '邀请码',
  `add_time` int(11) DEFAULT NULL,
  `order_num` varchar(255) DEFAULT NULL COMMENT '订单号码',
  `is_del` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jb_user_buy
-- ----------------------------
INSERT INTO `jb_user_buy` VALUES ('5', '1', '1', '1', '1', '1', '', '1536140515', null, '0');
INSERT INTO `jb_user_buy` VALUES ('6', null, '1', '1', '13148531240', '127.0.0.1', '', '1536295874', null, '0');

-- ----------------------------
-- Table structure for jb_user_favorite
-- ----------------------------
DROP TABLE IF EXISTS `jb_user_favorite`;
CREATE TABLE `jb_user_favorite` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户 id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '收藏内容的标题',
  `url` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '收藏内容的原文地址，不带域名',
  `description` varchar(500) CHARACTER SET utf8 DEFAULT '' COMMENT '收藏内容的描述',
  `table_name` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '收藏实体以前所在表,不带前缀',
  `object_id` int(10) unsigned DEFAULT '0' COMMENT '收藏内容原来的主键id',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户收藏表';

-- ----------------------------
-- Records of jb_user_favorite
-- ----------------------------

-- ----------------------------
-- Table structure for jb_user_login_attempt
-- ----------------------------
DROP TABLE IF EXISTS `jb_user_login_attempt`;
CREATE TABLE `jb_user_login_attempt` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `login_attempts` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '尝试次数',
  `attempt_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '尝试登录时间',
  `locked_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '锁定时间',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '用户 ip',
  `account` varchar(100) NOT NULL DEFAULT '' COMMENT '用户账号,手机号,邮箱或用户名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='用户登录尝试表';

-- ----------------------------
-- Records of jb_user_login_attempt
-- ----------------------------

-- ----------------------------
-- Table structure for jb_user_score_log
-- ----------------------------
DROP TABLE IF EXISTS `jb_user_score_log`;
CREATE TABLE `jb_user_score_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '更改积分，可以为负',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '更改金币，可以为负',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户操作积分等奖励日志表';

-- ----------------------------
-- Records of jb_user_score_log
-- ----------------------------

-- ----------------------------
-- Table structure for jb_user_sm
-- ----------------------------
DROP TABLE IF EXISTS `jb_user_sm`;
CREATE TABLE `jb_user_sm` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nickname` char(255) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `head_img` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0为未知 1为男 2为女',
  `country` varchar(255) NOT NULL DEFAULT '' COMMENT '国家',
  `province` varchar(255) NOT NULL DEFAULT '' COMMENT '省份',
  `city` varchar(255) NOT NULL DEFAULT '' COMMENT '城市',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '用户地址',
  `mobile` char(12) NOT NULL COMMENT '用户手机号',
  `openid` char(40) NOT NULL COMMENT 'openid',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0为否 1为是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jb_user_sm
-- ----------------------------
INSERT INTO `jb_user_sm` VALUES ('1', '', '', '0', '', '', '', '', '', 'oQWMB0eqFOdG1DH4nL84pf0UlI-o', '1527137755', '1527104275', '0');
INSERT INTO `jb_user_sm` VALUES ('2', '', '', '0', '', '', '', '', '', 'oQWMB0QBhEJcgbyoyDzj7jcYAptI', '1527106593', '1527104538', '0');
INSERT INTO `jb_user_sm` VALUES ('3', '', '', '0', '', '', '', '', '', 'oQWMB0W8Sv9MX-kbHzmfnbw6fWXg', '1527132291', '1527130234', '0');
INSERT INTO `jb_user_sm` VALUES ('4', '', '', '0', '', '', '', '', '', 'oQWMB0chzDW-WBZYZa9O9SBZdZzU', '1527138291', '1527134836', '0');

-- ----------------------------
-- Table structure for jb_user_token
-- ----------------------------
DROP TABLE IF EXISTS `jb_user_token`;
CREATE TABLE `jb_user_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT ' 过期时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'token',
  `device_type` varchar(10) NOT NULL DEFAULT '' COMMENT '设备类型;mobile,android,iphone,ipad,web,pc,mac,wxapp',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户客户端登录 token 表';

-- ----------------------------
-- Records of jb_user_token
-- ----------------------------
INSERT INTO `jb_user_token` VALUES ('1', '1', '1542696306', '1527144306', 'c48f3e1596c00fd36879ba325bd496f1c48f3e1596c00fd36879ba325bd496f1', 'web');

-- ----------------------------
-- Table structure for jb_verification_code
-- ----------------------------
DROP TABLE IF EXISTS `jb_verification_code`;
CREATE TABLE `jb_verification_code` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '当天已经发送成功的次数',
  `send_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后发送成功时间',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证码过期时间',
  `code` varchar(8) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '最后发送成功的验证码',
  `account` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '手机号或者邮箱',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='手机邮箱数字验证码表';

-- ----------------------------
-- Records of jb_verification_code
-- ----------------------------

-- ----------------------------
-- Table structure for jb_wx_user
-- ----------------------------
DROP TABLE IF EXISTS `jb_wx_user`;
CREATE TABLE `jb_wx_user` (
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
  `u_name` varchar(100) DEFAULT NULL COMMENT '未加密用户名',
  `clock_amount` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '锁定金额',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1为是',
  `invite_code1` varchar(255) DEFAULT '' COMMENT '邀请码',
  `zm_point` int(10) unsigned DEFAULT '0' COMMENT '投票次数',
  `invite_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `openId` (`openid`) USING BTREE COMMENT 'openId'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微信用户表';

-- ----------------------------
-- Records of jb_wx_user
-- ----------------------------
