/*
Navicat MySQL Data Transfer

Source Server         : 金匾（buyou）
Source Server Version : 50557
Source Host           : 111.230.15.159:3306
Source Database       : jbian

Target Server Type    : MYSQL
Target Server Version : 50557
File Encoding         : 65001

Date: 2018-07-24 10:56:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `jb_address`
-- ----------------------------
DROP TABLE IF EXISTS `jb_address`;
CREATE TABLE `jb_address` (
  `address_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '地址id',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户id',
  `name` varchar(30) NOT NULL COMMENT '收件人',
  `address_area` varchar(30) NOT NULL COMMENT '所在地区',
  `address_text` varchar(80) NOT NULL COMMENT '详细地址',
  `phone` char(12) NOT NULL COMMENT '收件人手机号码',
  `call` char(12) NOT NULL,
  `email` varchar(30) NOT NULL COMMENT '邮箱',
  `address_default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0不默认地址 1默认地址',
  `c_time` int(10) unsigned NOT NULL COMMENT '地址添加时间',
  PRIMARY KEY (`address_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jb_address
-- ----------------------------
INSERT INTO `jb_address` VALUES ('1', '1', '王伟杰', '广东省广州市', '多迪公司', '18344104429', '18344104429', '844048869@qq.com', '1', '1520943408');
INSERT INTO `jb_address` VALUES ('2', '1', '马云', '深圳市', '阿里巴巴', '18888888888', '18888888888', '88888888@qq.com', '0', '1520943503');
INSERT INTO `jb_address` VALUES ('4', '1', '马化腾', '广东省深圳市', '腾讯深圳总部', '1666666666', '1666666666', '10000@qq.com', '0', '1521365021');
INSERT INTO `jb_address` VALUES ('5', '1', '1', '1', '1', '1', '1', '1', '0', '1521373597');
INSERT INTO `jb_address` VALUES ('7', '1', '123', '23', '123', '18344104428', '18344104428', '844048869@qq.com', '0', '1521460890');

-- ----------------------------
-- Table structure for `jb_admin_menu`
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
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8mb4 COMMENT='后台菜单表';

-- ----------------------------
-- Records of jb_admin_menu
-- ----------------------------
INSERT INTO `jb_admin_menu` VALUES ('1', '0', '0', '0', '20', 'admin', 'Plugin', 'default', '', '插件中心', 'cloud', '插件中心');
INSERT INTO `jb_admin_menu` VALUES ('2', '1', '1', '1', '10000', 'admin', 'Hook', 'index', '', '钩子管理', '', '钩子管理');
INSERT INTO `jb_admin_menu` VALUES ('3', '2', '1', '0', '10000', 'admin', 'Hook', 'plugins', '', '钩子插件管理', '', '钩子插件管理');
INSERT INTO `jb_admin_menu` VALUES ('4', '2', '2', '0', '10000', 'admin', 'Hook', 'pluginListOrder', '', '钩子插件排序', '', '钩子插件排序');
INSERT INTO `jb_admin_menu` VALUES ('5', '2', '1', '0', '10000', 'admin', 'Hook', 'sync', '', '同步钩子', '', '同步钩子');
INSERT INTO `jb_admin_menu` VALUES ('6', '0', '0', '1', '0', 'admin', 'Setting', 'default', '', '设置', 'cogs', '系统设置入口');
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
INSERT INTO `jb_admin_menu` VALUES ('20', '6', '1', '0', '10000', 'admin', 'Menu', 'index', '', '后台菜单', '', '后台菜单管理');
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
INSERT INTO `jb_admin_menu` VALUES ('109', '0', '0', '1', '10', 'user', 'AdminIndex', 'default', '', '门店管理', 'group', '用户管理');
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
INSERT INTO `jb_admin_menu` VALUES ('152', '0', '2', '1', '10000', 'user', 'AdminIndex', 'default1', '', '用户管理', '', '用户组');
INSERT INTO `jb_admin_menu` VALUES ('153', '152', '1', '0', '10000', 'user', 'AdminIndex', 'index', '', '本站用户', '', '本站用户');
INSERT INTO `jb_admin_menu` VALUES ('154', '153', '2', '0', '10000', 'user', 'AdminIndex', 'ban', '', '本站用户拉黑', '', '本站用户拉黑');
INSERT INTO `jb_admin_menu` VALUES ('155', '153', '2', '0', '10000', 'user', 'AdminIndex', 'cancelBan', '', '本站用户启用', '', '本站用户启用');
INSERT INTO `jb_admin_menu` VALUES ('156', '152', '1', '1', '10000', 'user', 'AdminOauth', 'index', '', '小程序用户', '', '第三方用户');
INSERT INTO `jb_admin_menu` VALUES ('157', '156', '2', '0', '10000', 'user', 'AdminOauth', 'delete', '', '删除第三方用户绑定', '', '删除第三方用户绑定');
INSERT INTO `jb_admin_menu` VALUES ('158', '6', '1', '1', '10000', 'user', 'AdminUserAction', 'index', '', '用户操作管理', '', '用户操作管理');
INSERT INTO `jb_admin_menu` VALUES ('159', '158', '1', '0', '10000', 'user', 'AdminUserAction', 'edit', '', '编辑用户操作', '', '编辑用户操作');
INSERT INTO `jb_admin_menu` VALUES ('160', '158', '2', '0', '10000', 'user', 'AdminUserAction', 'editPost', '', '编辑用户操作提交', '', '编辑用户操作提交');
INSERT INTO `jb_admin_menu` VALUES ('161', '158', '1', '0', '10000', 'user', 'AdminUserAction', 'sync', '', '同步用户操作', '', '同步用户操作');
INSERT INTO `jb_admin_menu` VALUES ('162', '0', '1', '1', '10000', 'admin', 'admin', 'function', '', '默认', '', '');
INSERT INTO `jb_admin_menu` VALUES ('163', '1', '1', '1', '10000', 'plugin/Wxapp', 'AdminIndex', 'index', '', '小程序管理', '', '小程序管理');
INSERT INTO `jb_admin_menu` VALUES ('164', '163', '1', '0', '10000', 'plugin/Wxapp', 'AdminWxapp', 'add', '', '添加小程序', '', '添加小程序');
INSERT INTO `jb_admin_menu` VALUES ('165', '163', '2', '0', '10000', 'plugin/Wxapp', 'AdminWxapp', 'addPost', '', '添加小程序提交保存', '', '添加小程序提交保存');
INSERT INTO `jb_admin_menu` VALUES ('166', '163', '1', '0', '10000', 'plugin/Wxapp', 'AdminWxapp', 'edit', '', '编辑小程序', '', '编辑小程序');
INSERT INTO `jb_admin_menu` VALUES ('167', '163', '2', '0', '10000', 'plugin/Wxapp', 'AdminWxapp', 'editPost', '', '编辑小程序提交保存', '', '编辑小程序');
INSERT INTO `jb_admin_menu` VALUES ('168', '163', '2', '0', '10000', 'plugin/Wxapp', 'AdminWxapp', 'delete', '', '删除小程序', '', '删除小程序');

-- ----------------------------
-- Table structure for `jb_asset`
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
-- Table structure for `jb_auth_access`
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
-- Table structure for `jb_auth_rule`
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
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8mb4 COMMENT='权限规则表';

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
INSERT INTO `jb_auth_rule` VALUES ('162', '1', 'admin', 'admin_url', 'admin/admin/function', '', '默认', '');
INSERT INTO `jb_auth_rule` VALUES ('163', '1', 'plugin/Wxapp', 'plugin_url', 'plugin/Wxapp/AdminIndex/index', '', '小程序管理', '');
INSERT INTO `jb_auth_rule` VALUES ('164', '1', 'plugin/Wxapp', 'plugin_url', 'plugin/Wxapp/AdminWxapp/add', '', '添加小程序', '');
INSERT INTO `jb_auth_rule` VALUES ('165', '1', 'plugin/Wxapp', 'plugin_url', 'plugin/Wxapp/AdminWxapp/addPost', '', '添加小程序提交保存', '');
INSERT INTO `jb_auth_rule` VALUES ('166', '1', 'plugin/Wxapp', 'plugin_url', 'plugin/Wxapp/AdminWxapp/edit', '', '编辑小程序', '');
INSERT INTO `jb_auth_rule` VALUES ('167', '1', 'plugin/Wxapp', 'plugin_url', 'plugin/Wxapp/AdminWxapp/editPost', '', '编辑小程序提交保存', '');
INSERT INTO `jb_auth_rule` VALUES ('168', '1', 'plugin/Wxapp', 'plugin_url', 'plugin/Wxapp/AdminWxapp/delete', '', '删除小程序', '');
INSERT INTO `jb_auth_rule` VALUES ('169', '1', 'order', 'admin_url', 'order/index /default', '', '订单管理', '');
INSERT INTO `jb_auth_rule` VALUES ('170', '1', 'order', 'admin_url', 'order/index/index', '', '订单列表', '');

-- ----------------------------
-- Table structure for `jb_banner`
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
-- Table structure for `jb_cart`
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
-- Table structure for `jb_category`
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
-- Table structure for `jb_comment`
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
-- Table structure for `jb_fankui`
-- ----------------------------
DROP TABLE IF EXISTS `jb_fankui`;
CREATE TABLE `jb_fankui` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` char(40) NOT NULL DEFAULT '0' COMMENT '用户id',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0为否 1为是',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `content` text NOT NULL COMMENT '反馈内容',
  `score1` varchar(5) NOT NULL COMMENT '满意度',
  `score2` varchar(5) NOT NULL COMMENT '准确度',
  `state` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `order_id` int(11) DEFAULT NULL COMMENT '订单id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='意见反馈表';

-- ----------------------------
-- Records of jb_fankui
-- ----------------------------

-- ----------------------------
-- Table structure for `jb_goods`
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
-- Table structure for `jb_hook`
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
-- Table structure for `jb_hook_plugin`
-- ----------------------------
DROP TABLE IF EXISTS `jb_hook_plugin`;
CREATE TABLE `jb_hook_plugin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `hook` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名',
  `plugin` varchar(50) NOT NULL DEFAULT '' COMMENT '插件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='系统钩子插件表';

-- ----------------------------
-- Records of jb_hook_plugin
-- ----------------------------
INSERT INTO `jb_hook_plugin` VALUES ('1', '10000', '1', 'admin_login', 'CustomAdminLogin');

-- ----------------------------
-- Table structure for `jb_link`
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
-- Table structure for `jb_main_floor`
-- ----------------------------
DROP TABLE IF EXISTS `jb_main_floor`;
CREATE TABLE `jb_main_floor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '底板名称',
  `price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1为是 0为否',
  `add_time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='底板价格表';

-- ----------------------------
-- Records of jb_main_floor
-- ----------------------------

-- ----------------------------
-- Table structure for `jb_main_install`
-- ----------------------------
DROP TABLE IF EXISTS `jb_main_install`;
CREATE TABLE `jb_main_install` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `min` int(10) NOT NULL DEFAULT '0' COMMENT '安装费下限',
  `max` varchar(255) NOT NULL DEFAULT '100' COMMENT '安装费上限',
  `price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '价格说明',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `add_time` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='安装费';

-- ----------------------------
-- Records of jb_main_install
-- ----------------------------

-- ----------------------------
-- Table structure for `jb_main_show_content`
-- ----------------------------
DROP TABLE IF EXISTS `jb_main_show_content`;
CREATE TABLE `jb_main_show_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '展示标题',
  `title_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '列表展示图片路径',
  `content` varchar(5250) NOT NULL DEFAULT '' COMMENT '内容',
  `content_pic` varchar(2550) NOT NULL DEFAULT '' COMMENT '内容展示图片 用,分割',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1为删除 0为否',
  `add_time` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='案例展示详情';

-- ----------------------------
-- Records of jb_main_show_content
-- ----------------------------

-- ----------------------------
-- Table structure for `jb_main_show_type`
-- ----------------------------
DROP TABLE IF EXISTS `jb_main_show_type`;
CREATE TABLE `jb_main_show_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '0' COMMENT '案例分类名称',
  `appid` varchar(255) NOT NULL DEFAULT '' COMMENT 'appid',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1为是 0位否',
  `add_time` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='案例展示分类列表';

-- ----------------------------
-- Records of jb_main_show_type
-- ----------------------------

-- ----------------------------
-- Table structure for `jb_main_sign_price`
-- ----------------------------
DROP TABLE IF EXISTS `jb_main_sign_price`;
CREATE TABLE `jb_main_sign_price` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `min` int(10) NOT NULL DEFAULT '0' COMMENT '价格范围 下限',
  `max` varchar(255) NOT NULL DEFAULT '100' COMMENT '价格范围 上限',
  `sign_type_id` int(11) NOT NULL DEFAULT '0' COMMENT '招牌类型id',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `add_time` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `num` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '单价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='招牌字 类型价格表';

-- ----------------------------
-- Records of jb_main_sign_price
-- ----------------------------

-- ----------------------------
-- Table structure for `jb_main_sign_type`
-- ----------------------------
DROP TABLE IF EXISTS `jb_main_sign_type`;
CREATE TABLE `jb_main_sign_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '1' COMMENT '类型名',
  `word` varchar(255) NOT NULL DEFAULT '' COMMENT '类型名字',
  `is_del` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `add_time` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='招牌字类型';

-- ----------------------------
-- Records of jb_main_sign_type
-- ----------------------------

-- ----------------------------
-- Table structure for `jb_main_type_texture`
-- ----------------------------
DROP TABLE IF EXISTS `jb_main_type_texture`;
CREATE TABLE `jb_main_type_texture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '材质名称',
  `price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '需要增加的价格',
  `sign_type_id` int(10) NOT NULL DEFAULT '0' COMMENT '招牌字类型id',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1为是',
  `add_time` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='招牌字材料价格';

-- ----------------------------
-- Records of jb_main_type_texture
-- ----------------------------

-- ----------------------------
-- Table structure for `jb_menu`
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
-- Table structure for `jb_message`
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
-- Table structure for `jb_nav`
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
-- Table structure for `jb_nav_menu`
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
-- Table structure for `jb_one`
-- ----------------------------
DROP TABLE IF EXISTS `jb_one`;
CREATE TABLE `jb_one` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `money` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jb_one
-- ----------------------------

-- ----------------------------
-- Table structure for `jb_option`
-- ----------------------------
DROP TABLE IF EXISTS `jb_option`;
CREATE TABLE `jb_option` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `autoload` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否自动加载;1:自动加载;0:不自动加载',
  `option_name` varchar(64) NOT NULL DEFAULT '' COMMENT '配置名',
  `option_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '配置值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='全站配置表';

-- ----------------------------
-- Records of jb_option
-- ----------------------------
INSERT INTO `jb_option` VALUES ('1', '1', 'site_info', '{\"site_name\":\"ThinkCMF\\u5185\\u5bb9\\u7ba1\\u7406\\u6846\\u67b6\",\"site_seo_title\":\"ThinkCMF\\u5185\\u5bb9\\u7ba1\\u7406\\u6846\\u67b6\",\"site_seo_keywords\":\"ThinkCMF,php,\\u5185\\u5bb9\\u7ba1\\u7406\\u6846\\u67b6,cmf,cms,\\u7b80\\u7ea6\\u98ce, simplewind,framework\",\"site_seo_description\":\"ThinkCMF\\u662f\\u7b80\\u7ea6\\u98ce\\u7f51\\u7edc\\u79d1\\u6280\\u53d1\\u5e03\\u7684\\u4e00\\u6b3e\\u7528\\u4e8e\\u5feb\\u901f\\u5f00\\u53d1\\u7684\\u5185\\u5bb9\\u7ba1\\u7406\\u6846\\u67b6\"}');
INSERT INTO `jb_option` VALUES ('2', '1', 'admin_dashboard_widgets', '[{\"name\":\"CmfHub\",\"is_system\":1},{\"name\":\"MainContributors\",\"is_system\":1},{\"name\":\"CmfDocuments\",\"is_system\":1},{\"name\":\"Contributors\",\"is_system\":1},{\"name\":\"Custom1\",\"is_system\":1},{\"name\":\"Custom2\",\"is_system\":1},{\"name\":\"Custom3\",\"is_system\":1},{\"name\":\"Custom4\",\"is_system\":1},{\"name\":\"Custom5\",\"is_system\":1}]');

-- ----------------------------
-- Table structure for `jb_order`
-- ----------------------------
DROP TABLE IF EXISTS `jb_order`;
CREATE TABLE `jb_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_number` char(50) NOT NULL COMMENT '订单号',
  `order_state` tinyint(1) unsigned NOT NULL COMMENT '订单状态（0未支付，1已支付，2已发货）',
  `order_message` varchar(255) DEFAULT NULL COMMENT '订单留言',
  `address_id` int(10) unsigned NOT NULL COMMENT '收货地址',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户id',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `goods_buynum` int(10) unsigned NOT NULL COMMENT '商品购买数量',
  `goods_pirce` decimal(10,2) unsigned NOT NULL COMMENT '商品价格',
  `ogoods_specifications` char(30) NOT NULL COMMENT '商品规格',
  `goods_img` char(80) DEFAULT NULL COMMENT '商品图片路径',
  `c_time` char(30) NOT NULL COMMENT '订单添加时间',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jb_order
-- ----------------------------
INSERT INTO `jb_order` VALUES ('3', '2018031418054534981521021945', '1', '', '1', '1', '82', '1', '8999.00', '750ml', '20180306\\c5b7e9bfc2bddedffa7eccd579de6f2e.jpg', '1521021945');
INSERT INTO `jb_order` VALUES ('4', '2018031818494555801521370185', '1', '', '4', '1', '117', '1', '8999.00', '750ml', '20180315\\dcf45141dada1a23a70f3ea94e4cca15.jpg', '1521370185');
INSERT INTO `jb_order` VALUES ('5', '2018031918412363811521456083', '1', '', '1', '1', '101', '1', '8999.00', '750ml', '20180315\\dcf45141dada1a23a70f3ea94e4cca15.jpg', '1521456083');
INSERT INTO `jb_order` VALUES ('6', '2018032616024395721522051363', '1', '', '1', '1', '4', '1', '129.00', '750ml', '20180315\\f12f5dc7d22357de9b778257965533d8.jpg', '1522051363');
INSERT INTO `jb_order` VALUES ('7', '2018032719262593051522149985', '1', '', '1', '1', '189', '1', '299.00', '750ml', '20180316\\1c5f1ae1239c6d0f292a0c611ac5d35a.jpg', '1522149985');
INSERT INTO `jb_order` VALUES ('8', '2018040814593974351523170779', '1', '', '2', '1', '155', '1', '8999.00', '250ml', '20180315\\dcf45141dada1a23a70f3ea94e4cca15.jpg', '1523170779');
INSERT INTO `jb_order` VALUES ('9', '2018040911292716611523244567', '1', '', '2', '1', '103', '1', '8999.00', '250ml', '20180315\\dcf45141dada1a23a70f3ea94e4cca15.jpg', '1523244567');

-- ----------------------------
-- Table structure for `jb_order_lib`
-- ----------------------------
DROP TABLE IF EXISTS `jb_order_lib`;
CREATE TABLE `jb_order_lib` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `testcontent` varchar(255) DEFAULT NULL COMMENT '测算内容',
  `proposal` varchar(255) DEFAULT NULL COMMENT '建议',
  `summary` varchar(255) DEFAULT NULL COMMENT '总结',
  `disposition` varchar(255) DEFAULT NULL COMMENT '性格',
  `facescore` varchar(255) DEFAULT NULL COMMENT '颜值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jb_order_lib
-- ----------------------------
INSERT INTO `jb_order_lib` VALUES ('1', '根据你八字命局、五行属性并结合婚姻宫落地支为戌，可推断你命中的她脸型略宽，下巴长而圆润，眉毛浓而带点弯，眼神明亮有力，鼻子较高，肤色偏黄，中等体型，常常留短发，头发多细软茂密，穿着打扮非常有精英的气质，行事作风非常稳重谨慎，是个会持家的人。依照你命局中官星在八字格局中的状态，推算出她纯朴正直，诚实友善，为人忠实可靠，心性灵巧，待人和颜悦色，风趣诙谐，好打抱不平；最大的不足就是不会说好听的话，常常因此给自己造成了不小的麻烦。感情上宁可自己吃亏也不愿给爱人添麻烦，用情专一，忠于对方，是婚姻中的好伴侣。\n', '当爱情面临距离的挑战时，或许谁都觉得双方能一辈子耳鬓斯磨，彼此占有对方的生活才是对的，其实这样的想法是错误的，在感情中，一句我爱你胜过任何距离。', '蒸蒸日上 顺风顺水', '依照你命局中官星在八字格局中的状态，推算出她纯朴正直，诚实友善，为人忠实可靠，心性灵巧，待人和颜悦色，风趣诙谐，好打抱不平；最大的不足就是不会说好听的话，常常因此给自己造成了不小的麻烦。感情上宁可自己吃亏也不愿给爱人添麻烦，用情专一，忠于对方，是婚姻中的好伴侣。', '根据你八字命局、五行属性并结合婚姻宫落地支为戌，可推断你命中的她脸型略宽，下巴长而圆润，眉毛浓而带点弯，眼神明亮有力，鼻子较高，肤色偏黄，中等体型，常常留短发，头发多细软茂密，穿着打扮非常有精英的气质，行事作风非常稳重谨慎，是个会持家的人。');

-- ----------------------------
-- Table structure for `jb_orders`
-- ----------------------------
DROP TABLE IF EXISTS `jb_orders`;
CREATE TABLE `jb_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` char(12) DEFAULT NULL COMMENT '用户名',
  `order_code` varchar(255) NOT NULL COMMENT '订单列表id',
  `user_id` char(40) NOT NULL COMMENT '用户id',
  `add_time` int(13) unsigned DEFAULT NULL COMMENT '订单时间',
  `sex` tinyint(1) NOT NULL,
  `date_birth` varchar(50) NOT NULL COMMENT '出生日期',
  `out_time` varchar(50) DEFAULT NULL COMMENT '出生时辰',
  `proposal` varchar(255) DEFAULT NULL COMMENT '建议',
  `summary` varchar(255) DEFAULT NULL COMMENT '总结',
  `is_del` varchar(255) DEFAULT '0' COMMENT '是否删除',
  `title` char(32) NOT NULL COMMENT '订单名称',
  `state` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态 0未支付  1已支付 ',
  `praise` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '好评',
  `testcontent` varchar(255) DEFAULT NULL COMMENT '测算内容',
  `ten_days` char(10) NOT NULL COMMENT '古代算法年份',
  `ground_branch` char(10) NOT NULL COMMENT '古代算法时辰',
  `annual_custom` tinyint(4) NOT NULL COMMENT '出生年例（阴历 阳历） 1',
  `amount` decimal(10,2) DEFAULT '0.00' COMMENT '支付金额 元',
  `disposition` varchar(255) DEFAULT NULL COMMENT '性格',
  `facescore` varchar(255) DEFAULT NULL COMMENT '颜值',
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '商户标识',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jb_orders
-- ----------------------------
INSERT INTO `jb_orders` VALUES ('1', 'fsdsd', 'cs2018052403395026977806', '1', '1527104390', '1', '2018年05月24日', '02:00~02:59', null, null, '0', '八字揭秘命中注定的另一半', '0', '0', null, '甲丁戊己', '子丑寅卯', '1', '0.01', null, null, '0');
INSERT INTO `jb_orders` VALUES ('2', 'bbhh', 'cs2018052403420564332611', '1', '1527104525', '1', '2018年05月24日', '20:00~20:59', null, null, '0', '八字揭秘命中注定的另一半', '0', '0', null, '甲丁戊己', '子丑寅卯', '1', '0.01', null, null, '0');
INSERT INTO `jb_orders` VALUES ('3', '测试名字', 'cs2018052403423751184049', '2', '1527104557', '1', '2018年05月24日', '02:00~02:59', null, null, '0', '八字揭秘命中注定的另一半', '0', '0', null, '甲丁戊己', '子丑寅卯', '1', '0.01', null, null, '0');
INSERT INTO `jb_orders` VALUES ('29', '散热', 'cs2018052403474659833428', '1', '1527104866', '1', '2018年05月24日', '02:00~02:59', '当爱情面临距离的挑战时，或许谁都觉得双方能一辈子耳鬓斯磨，彼此占有对方的生活才是对的，其实这样的想法是错误的，在感情中，一句我爱你胜过任何距离。', '蒸蒸日上 顺风顺水', '0', '八字揭秘命中注定的另一半', '0', '0', '根据你八字命局、五行属性并结合婚姻宫落地支为戌，可推断你命中的她脸型略宽，下巴长而圆润，眉毛浓而带点弯，眼神明亮有力，鼻子较高，肤色偏黄，中等体型，常常留短发，头发多细软茂密，穿着打扮非常有精英的气质，行事作风非常稳重谨慎，是个会持家的人。依照你命局中官星在八字格局中的状态，推算出她纯朴正直，诚实友善，为人忠实可靠，心性灵巧，待人和颜悦色，风趣诙谐，好打抱不平；最大的不足就是不会说好听的话，常常因此给自己造成了不小的麻烦。感情上宁可自己吃亏也不愿给爱人添麻烦，用情专一，忠于对方，是婚姻中的好伴侣。\n', '甲丁戊己', '子丑寅卯', '1', '0.01', '依照你命局中官星在八字格局中的状态，推算出她纯朴正直，诚实友善，为人忠实可靠，心性灵巧，待人和颜悦色，风趣诙谐，好打抱不平；最大的不足就是不会说好听的话，常常因此给自己造成了不小的麻烦。感情上宁可自己吃亏也不愿给爱人添麻烦，用情专一，忠于对方，是婚姻中的好伴侣。', '根据你八字命局、五行属性并结合婚姻宫落地支为戌，可推断你命中的她脸型略宽，下巴长而圆润，眉毛浓而带点弯，眼神明亮有力，鼻子较高，肤色偏黄，中等体型，常常留短发，头发多细软茂密，穿着打扮非常有精英的气质，行事作风非常稳重谨慎，是个会持家的人。', '0');
INSERT INTO `jb_orders` VALUES ('30', '东华', 'cs2018052403494870663011', '1', '1527104988', '1', '2020年05月24日', '07:00~07:59', '当爱情面临距离的挑战时，或许谁都觉得双方能一辈子耳鬓斯磨，彼此占有对方的生活才是对的，其实这样的想法是错误的，在感情中，一句我爱你胜过任何距离。', '蒸蒸日上 顺风顺水', '0', '八字揭秘命中注定的另一半', '1', '0', '根据你八字命局、五行属性并结合婚姻宫落地支为戌，可推断你命中的她脸型略宽，下巴长而圆润，眉毛浓而带点弯，眼神明亮有力，鼻子较高，肤色偏黄，中等体型，常常留短发，头发多细软茂密，穿着打扮非常有精英的气质，行事作风非常稳重谨慎，是个会持家的人。依照你命局中官星在八字格局中的状态，推算出她纯朴正直，诚实友善，为人忠实可靠，心性灵巧，待人和颜悦色，风趣诙谐，好打抱不平；最大的不足就是不会说好听的话，常常因此给自己造成了不小的麻烦。感情上宁可自己吃亏也不愿给爱人添麻烦，用情专一，忠于对方，是婚姻中的好伴侣。\n', '甲丁戊己', '子丑寅卯', '1', '0.01', '依照你命局中官星在八字格局中的状态，推算出她纯朴正直，诚实友善，为人忠实可靠，心性灵巧，待人和颜悦色，风趣诙谐，好打抱不平；最大的不足就是不会说好听的话，常常因此给自己造成了不小的麻烦。感情上宁可自己吃亏也不愿给爱人添麻烦，用情专一，忠于对方，是婚姻中的好伴侣。', '根据你八字命局、五行属性并结合婚姻宫落地支为戌，可推断你命中的她脸型略宽，下巴长而圆润，眉毛浓而带点弯，眼神明亮有力，鼻子较高，肤色偏黄，中等体型，常常留短发，头发多细软茂密，穿着打扮非常有精英的气质，行事作风非常稳重谨慎，是个会持家的人。', '0');
INSERT INTO `jb_orders` VALUES ('31', '测力计', 'cs2018052404000966142810', '2', '1527105609', '1', '2018年05月24日', '03:00~03:59', '当爱情面临距离的挑战时，或许谁都觉得双方能一辈子耳鬓斯磨，彼此占有对方的生活才是对的，其实这样的想法是错误的，在感情中，一句我爱你胜过任何距离。', '蒸蒸日上 顺风顺水', '0', '八字揭秘命中注定的另一半', '0', '0', '根据你八字命局、五行属性并结合婚姻宫落地支为戌，可推断你命中的她脸型略宽，下巴长而圆润，眉毛浓而带点弯，眼神明亮有力，鼻子较高，肤色偏黄，中等体型，常常留短发，头发多细软茂密，穿着打扮非常有精英的气质，行事作风非常稳重谨慎，是个会持家的人。依照你命局中官星在八字格局中的状态，推算出她纯朴正直，诚实友善，为人忠实可靠，心性灵巧，待人和颜悦色，风趣诙谐，好打抱不平；最大的不足就是不会说好听的话，常常因此给自己造成了不小的麻烦。感情上宁可自己吃亏也不愿给爱人添麻烦，用情专一，忠于对方，是婚姻中的好伴侣。\n', '甲丁戊己', '子丑寅卯', '1', '0.01', '依照你命局中官星在八字格局中的状态，推算出她纯朴正直，诚实友善，为人忠实可靠，心性灵巧，待人和颜悦色，风趣诙谐，好打抱不平；最大的不足就是不会说好听的话，常常因此给自己造成了不小的麻烦。感情上宁可自己吃亏也不愿给爱人添麻烦，用情专一，忠于对方，是婚姻中的好伴侣。', '根据你八字命局、五行属性并结合婚姻宫落地支为戌，可推断你命中的她脸型略宽，下巴长而圆润，眉毛浓而带点弯，眼神明亮有力，鼻子较高，肤色偏黄，中等体型，常常留短发，头发多细软茂密，穿着打扮非常有精英的气质，行事作风非常稳重谨慎，是个会持家的人。', '0');
INSERT INTO `jb_orders` VALUES ('32', '陈建军', 'cs2018052411015846503499', '3', '1527130919', '1', '1987年06月06日', '不清楚时辰', '当爱情面临距离的挑战时，或许谁都觉得双方能一辈子耳鬓斯磨，彼此占有对方的生活才是对的，其实这样的想法是错误的，在感情中，一句我爱你胜过任何距离。', '蒸蒸日上 顺风顺水', '0', '八字揭秘命中注定的另一半', '1', '0', '根据你八字命局、五行属性并结合婚姻宫落地支为戌，可推断你命中的她脸型略宽，下巴长而圆润，眉毛浓而带点弯，眼神明亮有力，鼻子较高，肤色偏黄，中等体型，常常留短发，头发多细软茂密，穿着打扮非常有精英的气质，行事作风非常稳重谨慎，是个会持家的人。依照你命局中官星在八字格局中的状态，推算出她纯朴正直，诚实友善，为人忠实可靠，心性灵巧，待人和颜悦色，风趣诙谐，好打抱不平；最大的不足就是不会说好听的话，常常因此给自己造成了不小的麻烦。感情上宁可自己吃亏也不愿给爱人添麻烦，用情专一，忠于对方，是婚姻中的好伴侣。\n', '甲丁戊己', '子丑寅卯', '2', '0.01', '依照你命局中官星在八字格局中的状态，推算出她纯朴正直，诚实友善，为人忠实可靠，心性灵巧，待人和颜悦色，风趣诙谐，好打抱不平；最大的不足就是不会说好听的话，常常因此给自己造成了不小的麻烦。感情上宁可自己吃亏也不愿给爱人添麻烦，用情专一，忠于对方，是婚姻中的好伴侣。', '根据你八字命局、五行属性并结合婚姻宫落地支为戌，可推断你命中的她脸型略宽，下巴长而圆润，眉毛浓而带点弯，眼神明亮有力，鼻子较高，肤色偏黄，中等体型，常常留短发，头发多细软茂密，穿着打扮非常有精英的气质，行事作风非常稳重谨慎，是个会持家的人。', '0');
INSERT INTO `jb_orders` VALUES ('33', '大城', 'cs2018052412081944778066', '4', '1527134899', '1', '1975年09月15日', '14:00~14:59', '当爱情面临距离的挑战时，或许谁都觉得双方能一辈子耳鬓斯磨，彼此占有对方的生活才是对的，其实这样的想法是错误的，在感情中，一句我爱你胜过任何距离。', '蒸蒸日上 顺风顺水', '0', '八字揭秘命中注定的另一半', '1', '0', '根据你八字命局、五行属性并结合婚姻宫落地支为戌，可推断你命中的她脸型略宽，下巴长而圆润，眉毛浓而带点弯，眼神明亮有力，鼻子较高，肤色偏黄，中等体型，常常留短发，头发多细软茂密，穿着打扮非常有精英的气质，行事作风非常稳重谨慎，是个会持家的人。依照你命局中官星在八字格局中的状态，推算出她纯朴正直，诚实友善，为人忠实可靠，心性灵巧，待人和颜悦色，风趣诙谐，好打抱不平；最大的不足就是不会说好听的话，常常因此给自己造成了不小的麻烦。感情上宁可自己吃亏也不愿给爱人添麻烦，用情专一，忠于对方，是婚姻中的好伴侣。\n', '甲丁戊己', '子丑寅卯', '1', '0.01', '依照你命局中官星在八字格局中的状态，推算出她纯朴正直，诚实友善，为人忠实可靠，心性灵巧，待人和颜悦色，风趣诙谐，好打抱不平；最大的不足就是不会说好听的话，常常因此给自己造成了不小的麻烦。感情上宁可自己吃亏也不愿给爱人添麻烦，用情专一，忠于对方，是婚姻中的好伴侣。', '根据你八字命局、五行属性并结合婚姻宫落地支为戌，可推断你命中的她脸型略宽，下巴长而圆润，眉毛浓而带点弯，眼神明亮有力，鼻子较高，肤色偏黄，中等体型，常常留短发，头发多细软茂密，穿着打扮非常有精英的气质，行事作风非常稳重谨慎，是个会持家的人。', '0');
INSERT INTO `jb_orders` VALUES ('34', '大城', 'cs2018052412084770768182', '4', '1527134928', '1', '1975年09月15日', '14:00~14:59', '当爱情面临距离的挑战时，或许谁都觉得双方能一辈子耳鬓斯磨，彼此占有对方的生活才是对的，其实这样的想法是错误的，在感情中，一句我爱你胜过任何距离。', '蒸蒸日上 顺风顺水', '0', '八字揭秘命中注定的另一半', '1', '0', '根据你八字命局、五行属性并结合婚姻宫落地支为戌，可推断你命中的她脸型略宽，下巴长而圆润，眉毛浓而带点弯，眼神明亮有力，鼻子较高，肤色偏黄，中等体型，常常留短发，头发多细软茂密，穿着打扮非常有精英的气质，行事作风非常稳重谨慎，是个会持家的人。依照你命局中官星在八字格局中的状态，推算出她纯朴正直，诚实友善，为人忠实可靠，心性灵巧，待人和颜悦色，风趣诙谐，好打抱不平；最大的不足就是不会说好听的话，常常因此给自己造成了不小的麻烦。感情上宁可自己吃亏也不愿给爱人添麻烦，用情专一，忠于对方，是婚姻中的好伴侣。\n', '甲丁戊己', '子丑寅卯', '1', '0.01', '依照你命局中官星在八字格局中的状态，推算出她纯朴正直，诚实友善，为人忠实可靠，心性灵巧，待人和颜悦色，风趣诙谐，好打抱不平；最大的不足就是不会说好听的话，常常因此给自己造成了不小的麻烦。感情上宁可自己吃亏也不愿给爱人添麻烦，用情专一，忠于对方，是婚姻中的好伴侣。', '根据你八字命局、五行属性并结合婚姻宫落地支为戌，可推断你命中的她脸型略宽，下巴长而圆润，眉毛浓而带点弯，眼神明亮有力，鼻子较高，肤色偏黄，中等体型，常常留短发，头发多细软茂密，穿着打扮非常有精英的气质，行事作风非常稳重谨慎，是个会持家的人。', '0');

-- ----------------------------
-- Table structure for `jb_p1`
-- ----------------------------
DROP TABLE IF EXISTS `jb_p1`;
CREATE TABLE `jb_p1` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` char(50) DEFAULT NULL COMMENT '权限组',
  `name` char(30) NOT NULL,
  `password` char(30) NOT NULL,
  `mobile` char(12) NOT NULL,
  `email` char(30) NOT NULL,
  `sex` int(1) unsigned NOT NULL,
  `c_time` int(10) unsigned NOT NULL,
  `u_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jb_p1
-- ----------------------------
INSERT INTO `jb_p1` VALUES ('1', '1,2,3,4,5,6,7,8,9,12,13,14,21,22,23,24,25,27,28,29', '王伟杰', 's86maeO/OwCiZsE', '110', '844048869@qq.com', '1', '0', '0');
INSERT INTO `jb_p1` VALUES ('3', '', 'SKT', 's86maeO/OwCiZsE', '110', '844048869@qq.com', '1', '0', '0');
INSERT INTO `jb_p1` VALUES ('4', '', 'OMG', 's86maeO/OwCiZsE', '110', '844048869@qq.com', '1', '0', '0');
INSERT INTO `jb_p1` VALUES ('6', '', 'LGD', 's86maeO/OwCiZsE', '110', '844048869@qq.com', '1', '0', '0');
INSERT INTO `jb_p1` VALUES ('7', '', 'EDG', 's86maeO/OwCiZsE', '110', '844048869@qq.com', '1', '0', '0');
INSERT INTO `jb_p1` VALUES ('8', '', 'ROX', 's86maeO/OwCiZsE', '110', '844048869@qq.com', '1', '0', '0');

-- ----------------------------
-- Table structure for `jb_permissions`
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
-- Table structure for `jb_plugin`
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='插件表';

-- ----------------------------
-- Records of jb_plugin
-- ----------------------------
INSERT INTO `jb_plugin` VALUES ('1', '1', '1', '1', '0', 'Wxapp', '微信小程序', 'http://demo.thinkcmf.com', '', 'ThinkCMF', 'http://www.thinkcmf.com', '1.0', '微信小程序管理工具', '[]');
INSERT INTO `jb_plugin` VALUES ('2', '1', '0', '1', '0', 'CustomAdminLogin', '自定义后台登录页', '', '', 'ThinkCMF', '', '1.0', '自定义后台登录页', '[]');

-- ----------------------------
-- Table structure for `jb_portal_category`
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
-- Table structure for `jb_portal_category_post`
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
-- Table structure for `jb_portal_post`
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
-- Table structure for `jb_portal_tag`
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
-- Table structure for `jb_portal_tag_post`
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
-- Table structure for `jb_recycle_bin`
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
-- Table structure for `jb_role`
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
-- Table structure for `jb_role_user`
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
-- Table structure for `jb_route`
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
-- Table structure for `jb_slide`
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
-- Table structure for `jb_slide_item`
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
-- Table structure for `jb_theme`
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
-- Table structure for `jb_theme_file`
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
-- Table structure for `jb_third_party_user`
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
-- Table structure for `jb_two`
-- ----------------------------
DROP TABLE IF EXISTS `jb_two`;
CREATE TABLE `jb_two` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `moeny` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jb_two
-- ----------------------------

-- ----------------------------
-- Table structure for `jb_user`
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
  `has_more` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可以开账号 1为是 0为否',
  `top_id` int(11) NOT NULL DEFAULT '0' COMMENT '顶级id',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级id',
  `appid` varchar(255) NOT NULL DEFAULT '' COMMENT '小程序appid',
  `appsecret` varchar(255) NOT NULL DEFAULT '' COMMENT '小程序appscret',
  PRIMARY KEY (`id`),
  KEY `user_login` (`user_login`),
  KEY `user_nickname` (`user_nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- ----------------------------
-- Records of jb_user
-- ----------------------------
INSERT INTO `jb_user` VALUES ('1', '1', '0', '0', '1532309638', '0', '0', '0.00', '1526536440', '1', 'admin', '###c4b808d55937c1f1f4d08cb2f1bc5d78', 'admin', '1124960464@qq.com', '', '', '', '127.0.0.1', '', '', null, '0', '1', '0', '', '');
INSERT INTO `jb_user` VALUES ('2', '1', '0', '0', '0', '0', '0', '0.00', '0', '1', '新门店', '###1ec3bca18ac77d57b9872db107fb0df5', '', '123@qq.com', '', '', '', '', '', '', null, '0', '0', '0', 'wxa6df9ef3130fc214', '2f2061e5049d636fd846cf319f0c64d9');

-- ----------------------------
-- Table structure for `jb_user_action`
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
-- Table structure for `jb_user_action_log`
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
-- Table structure for `jb_user_balance_log`
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
-- Table structure for `jb_user_favorite`
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
-- Table structure for `jb_user_login_attempt`
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
-- Table structure for `jb_user_score_log`
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
-- Table structure for `jb_user_sm`
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
-- Table structure for `jb_user_token`
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
-- Table structure for `jb_verification_code`
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
-- Table structure for `jb_wx_user`
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
  `u_name` varchar(100) NOT NULL COMMENT '未加密用户名',
  `clock_amount` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '锁定金额',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1为是',
  `appid` varchar(255) NOT NULL DEFAULT '' COMMENT '所属appid',
  PRIMARY KEY (`id`),
  KEY `openId` (`openid`) USING BTREE COMMENT 'openId'
) ENGINE=InnoDB AUTO_INCREMENT=29474 DEFAULT CHARSET=utf8mb4 COMMENT='微信用户表';

-- ----------------------------
-- Records of jb_wx_user
-- ----------------------------
INSERT INTO `jb_wx_user` VALUES ('29298', '', '', '0.00', '0.00', 'cVY2L7mnmHNI9MAypbPBfQ==', '', 'o26k245L6gpDpqDsB4N7vGwbDeTE', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29299', '', '', '0.00', '0.00', 'MjeU58+uMDMA0cDG0vAELg==', '', 'o26k240OqiLjT7oDomUg6tHLIPMI', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29300', '', '', '0.00', '0.00', 'A1H9GuVFzX87IN6PI+6Qlw==', '', 'o26k242_pX7m83-CuTrp44dd-IUs', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29301', '', '', '0.00', '0.00', 'JMrYDFeAXh0kS+jyYc6JvA==', '', 'o26k24-9Z08KnvWYV7c37cUWJEpI', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29302', '', '', '0.00', '0.00', 'sbKtn9KDGACyqOlDUKr6og==', '', 'o26k248CHbG2Rc90MySM4NY3Zmko', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29303', '', '', '0.00', '0.00', 'U7IPpsndTkvp0T6ZJOpFKA==', '', 'o26k243BTgRb-IIQZrzJA69fzsQw', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29304', '', '', '0.00', '0.00', 'vNlhMpMH07f5XzXRSlLD2w==', '', 'o26k2422CYLtvUxaCh1xFEefRVI4', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29305', '', '', '0.00', '0.00', 'alAukcZ+ZcCSc0XhH7GZhQ==', '', 'o26k246acxPbzOg37STKiMJ0zYuI', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29306', '', '', '0.00', '0.00', 'dI7oPDyOVCbkZeDXoSKoSA==', '', 'o26k248GNnZ3YKrLosfwLpXHAEGw', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29307', '', '', '0.00', '0.00', 'T59/ElrECwDuatINpFU7gA==', '', 'o26k241Zv0sC-I-4Tz0fmkROrXo4', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29308', '', '', '0.00', '0.00', 'R7WUL8ndpxObFM3y8NNjVg==', '', 'o26k240B-BHMgf7yXRpfIyEK_An0', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29309', '', '', '0.00', '0.00', 'lwKXHsk3HkSMgMRhuQBrHQ==', '', 'o26k247bC0UhEoygYcAs65aPxUn4', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29310', '', '', '0.00', '0.00', '+r/pDg1L5QPOyUgjWRqj0Q==', '', 'o26k247KTbsTaF7Skr-xc5A_wFS4', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29311', '', '', '0.00', '0.00', 'b0YIyTbKcGFlzyIJRd/YQQ==', '', 'o26k244TAD_6UtyjtIbrYmv7qfsw', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29312', '', '', '0.00', '0.00', '1McE/28hDEGDjg0upej6qQ==', '', 'o26k244YJKYDX8BnVHJHC5J00Xq0', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29313', '', '', '0.00', '0.00', 'mtsGAnvpJzEn3MNffIqsdQ==', '', 'o26k24yDJEdYgUchI5pPTB1xO4lg', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29314', '', '', '0.00', '0.00', 'Sz/2hKH1mrRgAG6Bw7Vsog==', '', 'o26k242pCY9dZYJ0byBBtjNHksT0', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29315', '', '', '0.00', '0.00', 'lIB5gwuXjr6xT2cXv3dMEw==', '', 'o26k249-9R7if_47dKTKJC49_TBs', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29316', '', '', '0.00', '0.00', 'EYySgxrXhnBE7BXsF+TxrQ==', '', 'o26k2465TwltghZa8yuAnpEWOk4A', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29317', '', '', '0.00', '0.00', 'Ce9qUqv2vOPuXMfnBegieg==', '', 'o26k246JmgsdTy9k8KqqMdlKllIY', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29318', '', '', '0.00', '0.00', 'XCiS82ruyxPdUVzNJoQQoQ==', '', 'o26k242LjJyCDwxOCBqUsMzpXvlM', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29319', '', '', '0.00', '0.00', '7dvto5x0Ys0teNr3e9lrxA==', '', 'o26k249WiJPNy5OYht4JorHnIpKQ', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29320', '', '', '0.00', '0.00', 'J/76Nxf5famh+KyKPRIN4w==', '', 'o26k248pJ1jq1oeNFGb865gBP3QE', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29321', '', '', '0.00', '0.00', '5KCN709yZnqX4fBg8fHajA==', '', 'o26k24-fF9yEMOtyf8j3HN8NN5O0', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29322', '', '', '0.00', '0.00', 'VU/BJchlWei4w850od5Tug==', '', 'o26k246uHpI20la7CjvK5qC7eTNE', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29323', '', '', '0.00', '0.00', 'oRi+LuqQ3JSvich8oWkXJw==', '', 'o26k246qZTi1VtyQtX7mtR3vGJJs', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29324', '', '', '0.00', '0.00', 'nacSImeY+KgLS/UI4imjEg==', '', 'o26k24_Q5xQuwDQBn9nqOKarZzDM', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29325', '', '', '0.00', '0.00', 'GBqV4xpPHTs5fP/7UqJdTQ==', '', 'o26k24wOKClWApykLefHXSn9524A', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29326', '', '', '0.00', '0.00', 'sRMeWodRtLdJ3eBIQ0y7Ew==', '', 'o26k244YOBgo80WEcUc5gPUDSbWY', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29327', '', '', '0.00', '0.00', 'zk4PVELPHl0UmlJQ9oYeqQ==', '', 'o26k245dEifSfBljSaH41inrqvZw', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29328', '', '', '0.00', '0.00', 'LSPMFAZOTzC9r+p1LhJFlA==', '', 'o26k246FzIfv0EH2zIe7RKHrPWXU', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29329', '', '', '0.00', '0.00', 'toCTpwYchs+WZrp83sc1lw==', '', 'o26k24yZ9HyUB7TwmpASO8Kjil38', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29330', '', '', '0.00', '0.00', 'jnyoS83qZyAwEXo5JkwSLA==', '', 'o26k24w7KOZ0m8lLwrMuuo5EbXuE', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29331', '', '', '0.00', '0.00', 'KcXtyJEusKllHoti8B83/A==', '', 'o26k242OzT_EclvcR9YjzJMNPYQQ', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29332', '', '', '0.00', '0.00', 'QsG9RtQGPa/+rP66fyyxEQ==', '', 'o26k24yTwrDPnbEyw1rNaCfdB5OE', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29333', '', '', '0.00', '0.00', 'aDM9Fyfic4ThJ0/Hzs/izg==', '', 'o26k249XIU-TKJosQj5QvPlFt4O8', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29334', '', '', '0.00', '0.00', '50lQtswjCP+y2vla4+7AtQ==', '', 'o26k24z67KGPdeZdO2mBmhJLCv1k', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29335', '', '', '0.00', '0.00', 'cCJV15AMoTz0ns8Vj4jBkg==', '', 'o26k2440KDf31cVgBK559taRE3Xg', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29336', '', '', '0.00', '0.00', '4JMXx7QFjA+iH7fhRsDPpw==', '', 'o26k248zII4ui9QSUQuMraqfAw6M', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29337', '', '', '0.00', '0.00', 'w2ymelXmwNz9NUOnY33oGw==', '', 'o26k241L9x2q3iC2xBC_vJMvx2bU', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29338', '', '', '0.00', '0.00', 'F9SkbjrleN1BUg/wDu+mhw==', '', 'o26k240kdMAIKW9pWT6eHL9pUsUE', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29339', '', '', '0.00', '0.00', 'BDB0JqedKG2ar35HEJ1mxw==', '', 'o26k246HAGVhbzGWrvm71N7FyVkE', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29340', '', '', '0.00', '0.00', 'n/vXip8DjDFZLeq1oykGLg==', '', 'o26k24958uXyCbAZpFxFVE82jsTo', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29341', '', '', '0.00', '0.00', '4C78CwccPc8SWKUghGwaQw==', '', 'o26k241lM6qeRDkzozDwyQtdLVPA', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29342', '', '', '0.00', '0.00', 'zfnMp1xAlBZQ8/ooJ9o1Tw==', '', 'o26k248ZdARlyiIGJtU5In0NcGL8', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29343', '', '', '0.00', '0.00', 'lCIQZLdQMs1fcovxU2TnGg==', '', 'o26k240NsvkL4jyks3BxweubUsDc', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29344', '', '', '0.00', '0.00', '86mo13Rjxwz+qvIMPBqwNg==', '', 'o26k244AzUiDozFLlYYRpP4qTHfg', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29345', '', '', '0.00', '0.00', '06r1sHIz529tsC7hRQ2dQA==', '', 'o26k245yMgSuIvREDtlaWsOKEoWY', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29346', '', '', '0.00', '0.00', 'FREP5h/4kXfGkQjNJqz0Kw==', '', 'o26k24-dDtohrW4XNUa8VOk3_dFY', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29347', '', '', '0.00', '0.10', '6c+CsIjzD0cGW9dqEij5Tw==', '', 'o26k24zVOR0Rudogv8X6Agh4Pi6w', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29348', '', '', '0.00', '0.00', 'GAneJNOWIFgSoli6lzSs0w==', '', 'o26k247GAZC066hP1-u5Y7r8THDw', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29349', '', '', '0.00', '0.00', 'lAAXICuXqoAUkE0o5N6E6A==', '', 'o26k247Pw1G8JdCxEUdf36pgFt9I', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29350', '', '', '0.00', '0.00', 'K8WA54Mx6TQCvAYhd7X19A==', '', 'o26k24_jHHtArXiwKXKkgFaFmt6I', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29351', '', '', '0.00', '0.00', 'RoU7mkLv66K9lQ8N8R/Q1w==', '', 'o26k241LiSynWpRa12PCTSK93Ynw', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29352', '', '', '0.00', '0.00', 'ooZzasx+F1xoaLPkVTo5aA==', '', 'o26k240gXC4NH5SkSOBgsL15Bvmc', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29353', '', '', '0.00', '0.00', 'Q/A8NTABUAtZ92q28Hy1ZA==', '', 'o26k242vMB2ATiFVXl0KY2pnrQSs', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29354', '', '', '0.00', '0.00', 'bRK2KhbkjlgXHoqOoPAikg==', '', 'o26k245THvIjNHkau8sccVUHY1vY', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29355', '', '', '0.00', '0.00', '/X453ubgi2xFAXvI5oXZTA==', '', 'o26k24xMPqgSczs97XGDXdZII7Ms', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29356', '', '', '0.00', '0.00', 'uN7sf/B9Qfhw5y5wYv6YSA==', '', 'o26k248_Cdn9IyGQn5078zV38DLY', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29357', '', '', '0.00', '0.00', 'uhu3gh3rMObcM+Mb5dIC2A==', '', 'o26k24xLFtbT0DMU4ebuGkZEbZrg', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29358', '', '', '0.00', '0.00', '03BCMaku6LUw5vaLGLpCXA==', '', 'o26k24_bDONTY3_WBFagjrxaSUaY', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29359', '', '', '0.00', '0.00', 'HBbMHgQKuOLR8odeSdGhTA==', '', 'o26k24y3xppgixlG3hZai8U8gjGE', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29360', '', '', '0.00', '0.00', 'sX2hY/dA0jAw/orSlJ5nZw==', '', 'o26k24w2YjQyfZUuoxiBbsw8ERPs', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29361', '', '', '0.00', '0.00', 'wVVE+/Grcp8tvoHmO9x0Ew==', '', 'o26k24_62RiOGzLam0WMLLar6lpU', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29362', '', '', '0.00', '0.00', 'awbrJS0ki1YG5mAJEOVlqw==', '', 'o26k24_fYdYAS6gOCgEvcBscMHMQ', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29363', '', '', '0.00', '0.00', 'WtkLMyfUfNwCGTShVIQn9A==', '', 'o26k242r0dyHakokASYW1p9g7zgI', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29364', '', '', '0.00', '0.00', 'iGh1XPayUd53d2OJ5x5iFg==', '', 'o26k24_EHU018mUbiinGI9_ejrlY', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29365', '', '', '0.00', '0.00', 'WBC9pOcnAH0M2Ue6S+Y9jQ==', '', 'o26k241vnR1zVyZFiP7OJepQkss0', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29366', '', '', '0.00', '0.00', 'mw/qFc4yDfZLT3zkqgf10A==', '', 'o26k246nrss1Iyf_CUI6zH1UjsXE', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29367', '', '', '0.00', '0.00', 'ycjIuip2WSGnQZUSQKhkRw==', '', 'o26k24_lY7eU9B1Z_cz1Mo7IsmyU', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29368', '', '', '0.00', '0.00', 'B1qmbStsaaIeIayAMr8UVg==', '', 'o26k2408iKCjI4MM-967-1ZKTH6E', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29369', '', '', '0.00', '0.00', 'hx7zJaCOxsI4w6HlmW7AXA==', '', 'o26k2441lVYDUcYWUPgP5JZQDN58', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29370', '', '', '0.00', '0.00', 'vsLphaldlj8sHbGDpcRf9g==', '', 'o26k2492Htd-lWc1Kg3hXB3s-aCU', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29371', '', '', '0.00', '0.00', 'BpLRuabKwG93umqtQG0vbQ==', '', 'o26k24wHxegy-sZ8JvSaDDQMZkf0', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29372', '', '', '0.00', '0.00', 'nirw1soHGrB2VCxIKbTUiw==', '', 'o26k2457PGU_hmOI4I3xcK1cD7H4', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29373', '', '', '0.00', '0.00', '+M83P+nJl9zrrSLVOFr+iQ==', '', 'o26k24zEyREpW96UBFKBIKmydU2A', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29374', '', '', '0.00', '0.00', 'D37t4kMS95Zuoscw0zwduQ==', '', 'o26k245nagW0OMJOWkICW3uiZ75g', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29375', '', '', '0.00', '0.00', 'FBjijPNAeWSD5ooeprymHw==', '', 'o26k24wUIxDL4oB_Ts3OZRXhw7_0', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29376', '', '', '0.00', '0.00', '9q0RfdDn+Rxk6nG7BfDIgQ==', '', 'o26k24zyCesA9iL8LMbKkaWVCtws', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29377', '', '', '0.00', '0.00', 'mXHuNwLEGGQLJLWdXklLdg==', '', 'o26k24z1UQHauT_SaHcdRDJlp9K0', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29378', '', '', '0.00', '0.00', 'eoDtduoQlQiLHrvRsmOREA==', '', 'o26k249spBqTX8GwJcPfOs0VL8uA', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29379', '', '', '0.00', '0.00', 'LgsmuISozHFUpI6gYQavTw==', '', 'o26k248ekHtp1fMFqsmmzvLXqPQ0', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29380', '', '', '0.00', '0.00', 'iIGX8ffSOLoXD7ch9Q6ZZw==', '', 'o26k2411xF6qt6u5M2v9GL3hFaV0', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29381', '', '', '0.00', '0.00', 'XTUs6fbBxMuqLS51VL9jyg==', '', 'o26k24x52BxBwbscBqkRT1PaA6Ik', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29382', '', '', '0.00', '0.00', 'IHW8hfETDUNrDkwgFCJeQg==', '', 'o26k24wvqYf0U73utHBRcRcAZUes', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29383', '', '', '0.00', '0.00', 'PLWeQgzoLwZE2fl/cB8n9g==', '', 'o26k244UJ0-ie-iHggiPh9kbFOcw', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29384', '', '', '0.00', '0.00', '81wT5NJMsQstk7DCN3bziw==', '', 'o26k246ob4m2fzusalEwhRN1KF-g', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29385', '', '', '0.00', '0.00', 'hOSGkRhg9pn1mocKQke3ug==', '', 'o26k249_FI9-7qzvJsGA-yNRatcM', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29386', '', '', '0.00', '0.00', 'H7lEZ2bgV0QfKAMumZtpAw==', '', 'o26k24-mozP3ctfb-rhVDIjegF_E', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29387', '', '', '0.00', '0.00', 'RtEvE/RSYlpkZQ9JuXP1wQ==', '', 'o26k244G02P_6VGNbAGZP_2RBirQ', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29388', '', '', '0.00', '0.00', 'YxEDMQe/tcsF4BGZ6f4Rig==', '', 'o26k24wfinEaNNjanoAwJfxPy8kw', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29389', '', '', '0.00', '0.00', '8LvosreW3X97zgN1E+sj1Q==', '', 'o26k246WxtKwT-lKHA2i5ee6ce9M', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29390', '', '', '0.00', '0.00', 'gOp8n6lHzuKx01YxIdSK3Q==', '', 'o26k24-Jzr7n2essMakVxU4Uid9U', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29391', '', '', '0.00', '0.00', 'XGJOv6XYBW7qUIJpwKvb7g==', '', 'o26k242zahz-E6qUUkZn0flR3YHk', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29392', '', '', '0.00', '0.00', 'ghoRKfOLkXdCYiRyEzioSQ==', '', 'o26k24_InH-9Y7NAxo-KGsiEvLr0', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29393', '', '', '0.00', '0.00', '3LL59L0Rystf+RC12Kh8PA==', '', 'o26k240zXZ7NJXGDeHrbGIp70a7c', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29394', '', '', '0.00', '0.00', 'x3uysDeHcvstrorqZYJxfQ==', '', 'o26k243-ea3qes83Dm5oLsQlknYE', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29395', '', '', '0.00', '0.00', '1vwEuVJQ1NjTMTILDSXQjg==', '', 'o26k24xMUIivOI6RCPp6zEtQbw54', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29396', '', '', '0.00', '0.00', 'ZWBWI0vrL0fzMsejwYvWYQ==', '', 'o26k24zGxzqVaNZI9NHbdTd-4hR0', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29397', '', '', '0.00', '0.00', 'WiqopYpDLIR5OQziM8zOrQ==', '', 'o26k246rYlHmfsfsSQOtyfZh9lTc', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29398', '', '', '0.00', '0.00', '1+TzXRVbQeXLAicxJGQUdQ==', '', 'o26k243JQvgYDsRNdXlEdAgIVYOo', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29399', '', '', '0.00', '0.00', 'WUQuWhwhTkiWHcfZ6zUzJw==', '', 'o26k248h4p28gXox6SObGCFU1lvM', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29400', '', '', '0.00', '0.00', 'sLwLhu6LSAnBj6t4I6O/jw==', '', 'o26k246ydIIuLdLEncXoX6dZlg4Q', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29401', '', '', '0.00', '0.00', '9Mtb+1FoPbAGEAE3ULjx7A==', '', 'o26k240q6LBAB2mnyfUQDBBLF530', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29402', '', '', '0.00', '0.00', 'Xto9aCmlM04RKBa9ElDSPw==', '', 'o26k24xJ1woYatCuPVvj9Z_PujxY', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29403', '', '', '0.00', '0.00', 'poMJYq2i0sBL2COkpo5A7g==', '', 'o26k2408LSeKESyTiIlPiu3sgkqk', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29404', '', '', '0.00', '0.00', 'r3bNJAFVnmmGTl0LLVC8lQ==', '', 'o26k248pynkD4EUV7s3lfD8N4sXc', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29405', '', '', '0.00', '0.00', '+NZMByP2r1BbzQMnyvfiRA==', '', 'o26k24y2uFvw0pTI-sxALjl7jwds', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29406', '', '', '0.00', '0.00', '/Z+6t0oDdGXFOhuNkuSWqA==', '', 'o26k24z8_VGfALY36sfGbwnsQ-9E', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29407', '', '', '0.00', '0.00', 'ekzHGBKiuTY7E31/SlMeSg==', '', 'o26k249BvwerlWJvJ6GY2_vgEXhU', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29408', '', '', '0.00', '0.00', 'PRj2PagbZPbFwBRVrf3W4w==', '', 'o26k24-OSxOaYwBKreJ0TRl8KQrI', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29409', '', '', '0.00', '0.00', 'c+ZXcbqHTc9tSrGiSsblNQ==', '', 'o26k24zN95qwIg_XsbBUgh6U1iH8', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29410', '', '', '0.00', '0.00', 'H2NEiaExjOXXqoR5LJ20Rw==', '', 'o26k245WNIiV7An7YlTBsFwa165s', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29411', '', '', '0.00', '0.00', 'yhiCOyNSniwvA+HPIuxh8g==', '', 'o26k249u4grX4NPtnNI5Qb_1bCGs', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29412', '', '', '0.00', '0.00', '+E8c3kWXlB48+fRBYhLSMQ==', '', 'o26k24w6B_fAtEiO_U7CBN8co3UU', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29413', '', '', '0.00', '0.00', 'irf8hivIm+yn/ldpPAs4hw==', '', 'o26k248dSvU2Lo-4DCpwdxm_aU1w', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29414', '', '', '0.00', '0.00', 'Z+ibU8wdST6UF0jRucBscQ==', '', 'o26k24xqE4Ks3AFuFipyEB9sbMcM', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29415', '', '', '0.00', '0.00', 'l627FReD6k0l1zRXVV4IDQ==', '', 'o26k248iqzfbPQUx6SscWk2TrZdE', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29416', '', '', '0.00', '0.00', 'u+ge2Lf4rApEH+DnseO64A==', '', 'o26k243WU8L-hEsOy_Dk4pj46nN0', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29417', '', '', '0.00', '0.00', 'MnZ7ecEnxtUPqS9HajnW1A==', '', 'o26k24yTz7AThf23V-qoGpTXrnok', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29418', '', '', '0.00', '0.00', 'KcwX/0fybX/2Z8iU4CsGmQ==', '', 'o26k24-tJdyYLf9TTNRbztqpBfdg', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29419', '', '', '0.00', '0.00', 'mDmkuVSBL2/rdyYHOwFUEA==', '', 'o26k24189m5n6BiLtjYH5ZDfV9KA', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29420', '', '', '0.00', '0.00', 'y9rPaALh7ExAU/snT/ZF5A==', '', 'o26k244mN22FmV74mGwVDo53cRoA', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29421', '', '', '0.00', '0.00', 'dbafffRCLr+4dPRGJ0VFnw==', '', 'o26k24xtq0wJ017vuncAlBi-YgkY', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29422', '', '', '0.00', '0.00', 'TP2CLrhQdCZztPZ74aeeEg==', '', 'o26k242pWYgHMLWo4eBzwNITWn74', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29423', '', '', '0.00', '0.00', 'xJeuZPO5CcF8/KDdCUg4IA==', '', 'o26k24wC5J5FXdT_gnIh9zYHDYRc', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29424', '', '', '0.00', '0.00', 'p6nyz20gPuMwANl3KRK3pQ==', '', 'o26k24wORY34riHEI9qGpg-KCzsg', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29425', '', '', '0.00', '0.00', 'EqOaaN6kwxIKg75dMI2FLw==', '', 'o26k2401yNtWE1FSIpRWIqhI0TOI', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29426', '', '', '0.00', '0.00', '6evi+SNuw7/fBdqDDtSleQ==', '', 'o26k247wArxgdFsaeoBR7wv-2XUg', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29427', '', '', '0.00', '0.00', 'tFV6u9l/l7JU7yW7HEHR+Q==', '', 'o26k241OSyVhuU3QuI1YlRn0KLn0', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29428', '', '', '0.00', '0.00', 'kE4bgmJrxWhobOMQx0INMg==', '', 'o26k249JkuI9hhB4wVzuQ_Tj0YPk', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29429', '', '', '0.00', '0.00', 'ZqEKixSRYVHv+OQWJranUA==', '', 'o26k24-vYGeSU9YB0VIcG3wLz6Vs', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29430', '', '', '0.00', '0.00', 'sTnID3cpL6txiHxXOJgdnw==', '', 'o26k243izNsNMuw1JaaQCMrfMb0o', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29431', '', '', '0.00', '0.00', 'NoBw6kK98ot5bHrbRb3TBw==', '', 'o26k24_kWl9iesz9nYTpFFE_4UNo', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29432', '', '', '0.00', '0.00', 'U+V7JOYJvzk+Z0qhooekFg==', '', 'o26k24yYIF9kmQKh8AMcwlSwfmN4', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29433', '', '', '0.00', '0.00', 'YX61QJo71KD3V2yuWq2VOw==', '', 'o26k24wV17jBnH4Pi_OdChACg0aA', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29434', '', '', '0.00', '0.00', 'mIcbu59h8PBtyMoMhY1sWA==', '', 'o26k243uyfA4Wt6GuyNUiH0USkQU', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29435', '', '', '0.00', '0.00', 'Qr/p8zikzVYyrXlKWm6aNg==', '', 'o26k246gWyfX1QHPYX-Ks6zvKUiQ', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29436', '', '', '0.00', '0.00', 'MLmj4wpD4d7jS14UAD77Pg==', '', 'o26k249wW9gzRZQkMkGGBqHsZJ08', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29437', '', '', '0.00', '0.00', 'CwxTxD07foQjFIYkZyo+5w==', '', 'o26k24-wTNIwaRRJ7OsYD_sgQt2s', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29438', '', '', '0.00', '0.00', 'K4jvtL0bf4rtUyTGQ8vuNw==', '', 'o26k24-vcU4-vIyNqjzJbY8jJ9_g', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29439', '', '', '0.00', '0.00', 'vk1tKdO3hEQ6r4uoq1KQJQ==', '', 'o26k240MsPgAaB0IT0MmGyyvUPyE', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29440', '', '', '0.00', '0.00', '1m6iiL5aZyhdc1wAy1DtBw==', '', 'o26k248p2CO1ekoaH1IxcP9n0kMU', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29441', '', '', '0.00', '0.00', 'n+O67HIHCnXrXUO0+7g+uQ==', '', 'o26k2496Tr7YTk_tQABZ1gOPa-Hw', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29442', '', '', '0.00', '0.00', 'uAz1jgeNZ038Og9woWFLEg==', '', 'o26k24we2k2DGMj0nTAOn33bMgIA', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29443', '', '', '0.00', '0.00', 'pKtdPfbL8lH+DJl9t76ejw==', '', 'o26k248QxtYwibL4HUPI1BMSkvCQ', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29444', '', '', '0.00', '0.00', 'yf0QB9WmbwTFHr8B85Cftg==', '', 'o26k247Ah1IZ_uFupPkVfAp20DaI', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29445', '', '', '0.00', '0.00', 'obwWMALpDEVGTKsXFF4iMw==', '', 'o26k249JXqVsVqzSTpBzRhBsvq4k', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29446', '', '', '0.00', '0.00', 'X28yEL+EuC8Vy6N+uXW+pg==', '', 'o26k246Y40V-uLG1GuH9-MAu-vo8', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29447', '', '', '0.00', '0.00', 'dkjwk5Z8iBLJPROjhNitFQ==', '', 'o26k24yF4gRueJIoFubMJCuul9Xs', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29448', '', '', '0.00', '0.00', 'AokwIYPG+4TvirQhqwbtUg==', '', 'o26k242wCJuhgpN88ZNZ3BFZgjgw', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29449', '', '', '0.00', '0.00', 'NXO+/B5mbVgVUvVGr6IO4A==', '', 'o26k240rEQL5BgT7YgQGrBJ4TsNE', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29450', '', '', '0.00', '0.00', '1eBB/PRqwu4CxsOgKW1Fdg==', '', 'o26k2420NzeS7NhB1KFAAKobpTWA', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29451', '', '', '0.00', '0.00', 'gxVlL8RgarJQpYAJURnedQ==', '', 'o26k24xGSlRUDtvEvFjIW8mQhBoo', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29452', '', '', '0.00', '0.00', 'xbky+hmRuyLQ2vyeSjbNNA==', '', 'o26k24ySFk3TOpBiGcv7auII2UQA', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29453', '', '', '0.00', '0.00', '7zRGCrEw96t31vSuWyQsWg==', '', 'o26k245X2c5dGKvQQM0UfJcAd3lA', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29454', '', '', '0.00', '0.00', '+I0Usm5v3Oz2PaCOtEdjMw==', '', 'o26k24-AhtMCYsoX0MISzbewgwFk', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29455', '', '', '0.00', '0.00', 'qeQFswEkE7sLOGJ7ZO00yA==', '', 'o26k245fHFwRC0vnV9hEST7wYZbE', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29456', '', '', '0.00', '0.00', 'wxMdXK1aN5lcDI7Yrc6sEQ==', '', 'o26k247cUZUMlFDvDbADIhGE2-VY', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29457', '', '', '0.00', '0.00', 'vaSu+vG6CBj10e/x4Rp3ug==', '', 'o26k241xC8RW92gUEfZwkDFy6R7k', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29458', '', '', '0.00', '0.00', '7UqT7JNgw9IaMOemoYT7Cg==', '', 'o26k246fAvDPSski2d2l74fpXPis', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29459', '', '', '0.00', '0.00', 'uc+oKRSJW4gQBJLCNyC9ug==', '', 'o26k240Tg99R-BnXa4aOeMA7t56E', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29460', '', '', '0.00', '0.00', 'IL23aNhyM6lD4btTvqGMcg==', '', 'o26k2413JQAXH1m_qrkXjLq78z6A', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29461', '', '', '0.00', '0.00', '0QLezKAymqtfm/x8rg3Ycw==', '', 'o26k24wFSmtFgiLmJMIKflZ4jr44', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29462', '', '', '0.00', '0.00', 'z8ZpEjKd8GUkuldW6EJvJA==', '', 'o26k24141j41wvSFzmU5DB5D2qGc', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29463', '', '', '0.00', '0.00', '5uiM71w1o9PXYnS+0e/q1Q==', '', 'o26k246fMAGrvWw2va1lgiMVRT30', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29464', '', '', '0.00', '0.00', '3wnFBIzX73nDmnCvtZVAoA==', '', 'o26k24_R32wolJi6LtJbUEUCewFw', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29465', '', '', '0.00', '0.00', 'rxOYc+kMEVFQM34GDNYzNg==', '', 'o26k24_uFCOgwaSY46VrkuPVnC_8', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29466', '', '', '0.00', '0.00', 'i8/m6H1Bcx7jd7f8JByDcA==', '', 'o26k24554dIt30ZoNRR41WEAMRkQ', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29467', '', '', '0.00', '0.00', 'att2E53G3ebDG7PutMkN9w==', '', 'o26k248uTG7TDxgj5Rmbw4fjo4FU', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29468', '', '', '0.00', '0.00', 'u7FNe3LE1h679sgSP0VYhA==', '', 'o26k2492Ttdk9W8WbhBKoJeig5kU', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29469', '', '', '0.00', '0.00', '2splhcuvlPgfhxXQ5tR2Fg==', '', 'o26k243_DMfB8FFBDzzyiV8c7o9w', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', '');
INSERT INTO `jb_wx_user` VALUES ('29470', '', '', '0.00', '0.00', 'wvV+h0FaVX1sMXEU98xSEA==', '', 'o26k240OqiLjT7oDomUg6tHLIPMI', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', 'wx88f68c925e6148e0');
INSERT INTO `jb_wx_user` VALUES ('29471', 'LSDjgIIyNPCfjIM=', 'https://wx.qlogo.cn/mmopen/vi_32/12NpewMLpZqHkoz8RwRialYeTjCC2pRbib7BQgoxKajld077vfAicLDcX10AMShWpJcO0AvSCvjGQAdJosBZhIfpw/132', '0.00', '0.00', '2BOsZWGQPuTBEvAJj3lvuQ==', '', 'oQWMB0fDhOKSAWisjbQCmYW9UBHw', '0', '', '', '', '', null, '0', '0', '1', '- 。24?', '0.00', '0', 'wxa6df9ef3130fc214');
INSERT INTO `jb_wx_user` VALUES ('29472', '6IWU5qOY6bG87pSi', 'https://wx.qlogo.cn/mmopen/vi_32/YbjIHvuZ0zY9weicAITfddtr2Vgg8IT0s29JuJFeLicpsNpWVH804PkvVfcsCSKqIAaHKA9YUmfhPpWLHAjHX7Eg/132', '0.00', '0.00', 'lmwwTZTFzcWOnymnk1XrWg==', '', 'oQWMB0SI74LTjr0hRmT4SjrY8oms', '0', '', '', '', '', null, '0', '0', '1', '腔棘鱼', '0.00', '0', 'wxa6df9ef3130fc214');
INSERT INTO `jb_wx_user` VALUES ('29473', '', '', '0.00', '0.00', '/+RtocsHPAECvU3M2M6pAw==', '', 'oQWMB0SuBbjtXm5YdPi9KGwBTQNo', '0', '', '', '', '', null, '0', '0', '1', '', '0.00', '0', 'wxa6df9ef3130fc214');
