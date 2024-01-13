-- phpMyAdmin SQL Dump
-- version 4.0.10.20
-- https://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2024-01-13 11:04:15
-- 服务器版本: 5.6.50-log
-- PHP 版本: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `nav_untview_top`
--

-- --------------------------------------------------------

--
-- 表的结构 `gy_admin_dict`
--

CREATE TABLE IF NOT EXISTS `gy_admin_dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `description` text,
  `sort` int(11) NOT NULL DEFAULT '100',
  `state` tinyint(1) NOT NULL,
  `pid` varchar(255) NOT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `gy_admin_dict`
--

INSERT INTO `gy_admin_dict` (`id`, `name`, `value`, `description`, `sort`, `state`, `pid`, `create_time`, `create_by`, `update_time`, `update_by`) VALUES
(1, '公司列表', 'company', '公司列表信息', 0, 1, '0', '2022-12-03 21:02:14', NULL, '2023-07-24 17:05:06', 'admin'),
(2, '公司1', 'gs1', 'gs1', 0, 1, '1', '2022-12-03 21:03:34', NULL, '2022-12-03 21:03:34', NULL),
(3, '公司2', 'gs2', NULL, 0, 1, '1', '2022-12-03 21:03:43', NULL, '2022-12-03 21:03:43', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `gy_admin_files`
--

CREATE TABLE IF NOT EXISTS `gy_admin_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `original_name` varchar(255) DEFAULT NULL,
  `url` varchar(500) NOT NULL,
  `size` int(11) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '10',
  `module` varchar(255) NOT NULL DEFAULT '10' COMMENT '10 通用',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=32 ;

--
-- 转存表中的数据 `gy_admin_files`
--

INSERT INTO `gy_admin_files` (`id`, `name`, `original_name`, `url`, `size`, `type`, `module`, `create_time`, `create_by`, `update_time`, `update_by`) VALUES
(28, 'f93d4a7c692fabfdcc229832bcfc0d49.jpg', 'f93d4a7c692fabfdcc229832bcfc0d49.jpg', '/image/2024-01-04/f93d4a7c692fabfdcc229832bcfc0d49.jpg', 26947, 10, '10', '2024-01-04 10:05:11', 'admin', '2024-01-04 10:05:11', NULL),
(29, 'c925ba73608d8ed3a99623dc9eb37870.png', 'c925ba73608d8ed3a99623dc9eb37870.png', '/image/2024-01-04/c925ba73608d8ed3a99623dc9eb37870.png', 6399, 10, '10', '2024-01-04 10:07:53', 'admin', '2024-01-04 10:07:53', NULL),
(30, 'e3a5b728dbdddac7f54ce17530b583da.png', 'gengyunplan2.png', '/image/2024-01-05/e3a5b728dbdddac7f54ce17530b583da.png', 39412, 10, '10', '2024-01-05 17:16:26', 'admin', '2024-01-05 17:16:26', NULL),
(31, 'c506a8fd1c39e14019fc30abd691eaa2.png', 'gengyunplan2 (1).png', '/image/2024-01-05/c506a8fd1c39e14019fc30abd691eaa2.png', 4153, 10, '10', '2024-01-05 17:16:46', 'admin', '2024-01-05 17:16:46', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `gy_admin_menus`
--

CREATE TABLE IF NOT EXISTS `gy_admin_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) DEFAULT NULL COMMENT '上级菜单ID',
  `type` int(11) DEFAULT NULL COMMENT '0目录1菜单2按钮',
  `name` varchar(255) DEFAULT NULL COMMENT '菜单标题',
  `component_name` varchar(255) DEFAULT NULL COMMENT '组件名称',
  `component` varchar(255) DEFAULT NULL COMMENT '组件',
  `layout` text,
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `path` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `iframe` tinyint(4) DEFAULT '0' COMMENT '是否外链',
  `hidden` tinyint(4) DEFAULT NULL COMMENT '是否可见',
  `permission` varchar(255) DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=74 ;

--
-- 转存表中的数据 `gy_admin_menus`
--

INSERT INTO `gy_admin_menus` (`id`, `pid`, `type`, `name`, `component_name`, `component`, `layout`, `sort`, `icon`, `path`, `iframe`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES
(1, 0, 0, '系统管理', '', '', 'defautl', 100, 'Options', '/system', 0, 0, '', 'admin', NULL, '2023-06-28 14:50:12', '2023-06-28 14:50:12'),
(31, 1, 1, '用户管理', 'sysUser', 'system/sysUser', 'defautl', 100, '', 'sysUser', 0, 0, '', 'admin', NULL, '2023-06-28 14:56:54', '2023-06-28 14:56:54'),
(33, 1, 1, '角色管理', 'sysRole', 'system/sysRole', 'defautl', 100, '', 'sysRole', 0, 0, '', 'admin', NULL, '2023-06-28 14:58:59', '2023-06-28 14:58:59'),
(34, 1, 1, '菜单管理', 'sysMenus', 'system/sysMenus', 'defautl', 100, '', 'sysMenus', 0, 0, '', 'admin', NULL, '2023-06-28 14:59:38', '2023-06-28 14:59:38'),
(35, 1, 1, '数据字典', 'sysDict', 'system/sysDict', 'defautl', 100, '', 'sysDict', 0, 0, '', 'admin', 'admin', '2023-06-28 15:00:27', '2023-06-29 17:45:16'),
(37, 0, 0, '导航管理', '', '', 'defautl', 99, 'LayersOutline', '/navman', 0, 0, '', 'admin', 'admin', '2023-07-26 16:29:48', '2024-01-11 08:34:51'),
(38, 37, 1, '导航菜单', 'navmenu', 'navman/navmenu', 'defautl', 100, '', 'navmenu', 0, 0, '', 'admin', NULL, '2023-07-26 16:34:55', '2023-07-26 16:34:55'),
(39, 37, 1, '链接管理', 'navlinks', 'navman/navlinks', 'defautl', 100, '', 'navlinks', 0, 0, '', 'admin', NULL, '2023-07-26 17:23:41', '2023-07-26 17:23:42'),
(40, 0, 1, '工作台', 'Dashboard', 'Dashboard/workbench', 'defautl', 1, 'SpeedometerOutline', 'Dashboard', 0, 0, '', 'admin', 'admin', '2023-11-04 11:23:46', '2024-01-11 08:32:28'),
(44, 37, 1, '网站配置', 'navConfig', 'navman/navConfig', 'defautl', 99, '', 'navConfig', 0, 0, '', 'admin', 'admin', '2023-11-30 08:22:31', '2023-11-30 14:16:57'),
(45, 31, 2, '新增', '', '', 'defautl', 100, '', '', 0, 0, 'user:add', 'admin', NULL, '2023-12-28 17:17:59', '2023-12-28 17:18:00'),
(46, 31, 2, '编辑', '', '', 'defautl', 100, '', '', 0, 0, 'user:edit', 'admin', NULL, '2023-12-29 13:53:07', '2023-12-29 13:53:08'),
(47, 31, 2, '删除', '', '', 'defautl', 100, '', '', 0, 0, 'user:delete', 'admin', NULL, '2023-12-29 13:53:37', '2023-12-29 13:53:37'),
(48, 31, 2, '密码修改', '', '', 'defautl', 100, '', '', 0, 0, 'user:password', 'admin', NULL, '2023-12-29 13:56:12', '2023-12-29 13:56:13'),
(49, 33, 2, '新增', '', '', 'defautl', 100, '', '', 0, 0, 'role:add', 'admin', NULL, '2023-12-29 15:31:28', '2023-12-29 15:31:28'),
(50, 33, 2, '编辑', '', '', 'defautl', 100, '', '', 0, 0, 'role:edit', 'admin', NULL, '2023-12-29 15:31:28', '2023-12-29 15:31:28'),
(51, 33, 2, '删除', '', '', 'defautl', 100, '', '', 0, 0, 'role:delete', 'admin', NULL, '2023-12-29 15:31:28', '2023-12-29 15:31:28'),
(52, 33, 2, '保存', '', '', 'defautl', 100, '', '', 0, 0, 'role:save', 'admin', NULL, '2023-12-29 15:31:28', '2023-12-29 15:31:28'),
(53, 34, 2, '新增', '', '', 'defautl', 100, '', '', 0, 0, 'menus:add', 'admin', NULL, '2023-12-29 15:56:54', '2023-12-29 15:56:55'),
(54, 34, 2, '编辑', '', '', 'defautl', 100, '', '', 0, 0, 'menus:edit', 'admin', NULL, '2023-12-29 16:00:07', '2023-12-29 16:00:07'),
(55, 34, 2, '删除', '', '', 'defautl', 100, '', '', 0, 0, 'menus:delete', 'admin', NULL, '2023-12-29 16:00:30', '2023-12-29 16:00:31'),
(56, 35, 2, '字典新增', '', '', 'defautl', 100, '', '', 0, 0, 'dictp:add', 'admin', NULL, '2023-12-29 16:04:45', '2023-12-29 16:04:46'),
(57, 35, 2, '字典修改', '', '', 'defautl', 100, '', '', 0, 0, 'dictp:edit', 'admin', NULL, '2023-12-29 16:05:04', '2023-12-29 16:05:04'),
(58, 35, 2, '字典删除', '', '', 'defautl', 100, '', '', 0, 0, 'dictp:delete', 'admin', NULL, '2023-12-29 16:05:26', '2023-12-29 16:05:27'),
(59, 35, 2, '字典值新增', '', '', 'defautl', 100, '', '', 0, 0, 'dictv:add', 'admin', NULL, '2023-12-29 16:05:47', '2023-12-29 16:05:48'),
(60, 35, 2, '字典值修改', '', '', 'defautl', 100, '', '', 0, 0, 'dictv:edit', 'admin', NULL, '2023-12-29 16:06:06', '2023-12-29 16:06:07'),
(61, 35, 2, '字典删除', '', '', 'defautl', 100, '', '', 0, 0, 'dictv:delete', 'admin', NULL, '2023-12-29 16:06:26', '2023-12-29 16:06:26'),
(66, 44, 2, '导航网站配置', '', '', 'defautl', 100, '', '', 0, 0, 'nweb:save', 'admin', NULL, '2023-12-29 16:23:32', '2023-12-29 16:23:33'),
(67, 38, 2, '新增', '', '', 'defautl', 100, '', '', 0, 0, 'nmenu:add', 'admin', NULL, '2023-12-29 16:25:03', '2023-12-29 16:25:03'),
(68, 38, 2, '编辑', '', '', 'defautl', 100, '', '', 0, 0, 'nmenu:edit', 'admin', NULL, '2023-12-29 16:25:45', '2023-12-29 16:25:46'),
(69, 38, 2, '删除', '', '', 'defautl', 100, '', '', 0, 0, 'nmenu:delete', 'admin', NULL, '2023-12-29 16:26:13', '2023-12-29 16:26:13'),
(70, 39, 2, '新增', '', '', 'defautl', 100, '', '', 0, 0, 'nlinks:add', 'admin', NULL, '2023-12-29 16:28:36', '2023-12-29 16:28:36'),
(71, 39, 2, '编辑', '', '', 'defautl', 100, '', '', 0, 0, 'nlinks:edit', 'admin', NULL, '2023-12-29 16:28:51', '2023-12-29 16:28:52'),
(72, 39, 2, '删除', '', '', 'defautl', 100, '', '', 0, 0, 'nlinks:delete', 'admin', NULL, '2023-12-29 16:29:08', '2023-12-29 16:29:09'),
(73, 31, 2, '状态', '', '', 'defautl', 100, '', '', 0, 0, 'user:state', 'admin123', NULL, '2024-01-13 09:25:34', '2024-01-13 09:25:35');

-- --------------------------------------------------------

--
-- 表的结构 `gy_admin_roles`
--

CREATE TABLE IF NOT EXISTS `gy_admin_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '名称',
  `level` int(255) DEFAULT NULL COMMENT '角色级别',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `data_scope` varchar(255) DEFAULT NULL COMMENT '数据权限',
  `state` tinyint(1) DEFAULT '1',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `gy_admin_roles`
--

INSERT INTO `gy_admin_roles` (`id`, `name`, `level`, `description`, `data_scope`, `state`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES
(1, '超级管理员', 1, '-', '全部', 1, 'admin', 'admin', '2022-07-27 11:04:37', '2022-12-03 16:04:09'),
(2, '普通用户', 2, '-', '自定义', 1, 'admin', 'admin', '2022-07-27 11:04:37', '2022-12-03 16:04:09'),
(4, '匿名用户', 2, '匿名用户专属', '自定义', 1, 'admin', 'admin', '2022-12-03 15:20:48', '2022-12-03 16:04:10');

-- --------------------------------------------------------

--
-- 表的结构 `gy_admin_roles_menus`
--

CREATE TABLE IF NOT EXISTS `gy_admin_roles_menus` (
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `gy_admin_roles_menus`
--

INSERT INTO `gy_admin_roles_menus` (`role_id`, `menu_id`) VALUES
(2, 31),
(2, 1),
(2, 40),
(2, 41),
(2, 42),
(2, 43),
(2, 37),
(2, 44),
(2, 38),
(2, 39),
(2, 33),
(2, 34),
(2, 35),
(1, 31),
(1, 34),
(1, 40),
(1, 44),
(1, 37),
(1, 41),
(1, 1),
(1, 45),
(1, 46),
(1, 47),
(1, 48),
(1, 33),
(1, 49),
(1, 50),
(1, 51),
(1, 52),
(1, 53),
(1, 54),
(1, 55),
(1, 35),
(1, 56),
(1, 57),
(1, 58),
(1, 59),
(1, 60),
(1, 61),
(1, 42),
(1, 43),
(1, 63),
(1, 64),
(1, 65),
(1, 66),
(1, 38),
(1, 67),
(1, 68),
(1, 69),
(1, 39),
(1, 70),
(1, 71),
(1, 72),
(1, 62),
(1, 73);

-- --------------------------------------------------------

--
-- 表的结构 `gy_admin_user`
--

CREATE TABLE IF NOT EXISTS `gy_admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `nick_name` varchar(255) DEFAULT NULL COMMENT '昵称',
  `phone` varchar(255) DEFAULT NULL COMMENT '手机号码',
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `notes` varchar(255) DEFAULT NULL,
  `avatar_name` varchar(255) DEFAULT 'default' COMMENT '头像地址',
  `avatar_path` varchar(255) DEFAULT '/image/avatar/d358260ebddedf8d0d0d90b531ae60a0.png' COMMENT '头像真实路径',
  `state` int(1) DEFAULT '0' COMMENT '状态：1启用、0禁用',
  `roles` int(11) DEFAULT '0',
  `is_delete` int(11) DEFAULT '0',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `pwd_reset_time` datetime DEFAULT NULL COMMENT '修改密码的时间',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `gy_admin_user`
--

INSERT INTO `gy_admin_user` (`id`, `username`, `nick_name`, `phone`, `password`, `email`, `notes`, `avatar_name`, `avatar_path`, `state`, `roles`, `is_delete`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES
(1, 'admin123', '管理员', '18888888666', '$2y$10$c9l79nV/TcNJ6leAsToUAeFkZSaepUprySfFaRthd2HPi9lZYwn62', 'admin@qq.com', '管理员用户', 'd358260ebddedf8d0d0d90b531ae60a0.png', '/image/avatar/d358260ebddedf8d0d0d90b531ae60a0.png', 1, 1, 0, NULL, 'admin', '2022-07-26 16:38:31', '2022-07-26 16:38:31', '2024-01-13 09:08:15'),
(5, 'test', '测试', NULL, '$2y$10$Dv5zBUgMQ9Wygbxjy5.2fehihD5HfJcyl.xt.gheuqtvQLHqOgWjW', 'test@163.com', '测试用户', 'default', '/image/avatar/d358260ebddedf8d0d0d90b531ae60a0.png', 1, 2, 0, 'admin', 'admin', NULL, '2023-07-24 17:43:12', '2024-01-13 09:33:23');

-- --------------------------------------------------------

--
-- 表的结构 `gy_nav_config`
--

CREATE TABLE IF NOT EXISTS `gy_nav_config` (
  `title` varchar(100) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(500) DEFAULT NULL,
  `keywords` varchar(500) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `logo` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `motto` varchar(255) DEFAULT NULL,
  `footer` text,
  `views` int(11) NOT NULL DEFAULT '109',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_by` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `gy_nav_config`
--

INSERT INTO `gy_nav_config` (`title`, `id`, `description`, `keywords`, `status`, `logo`, `name`, `motto`, `footer`, `views`, `create_time`, `create_by`) VALUES
('耕云导航 | 高效实用的极简导航', 1, '耕云导航- 收集国内外办公工具网站、素材资源网站、UI设计资源网站、灵感创意网站、AI导航网站，定时更新分享优质产品设计书签。', '耕云导航,综合性导航网站,设计导航,资源导航,UI设计,UI设计素材,设计导航,网址导航,设计资源,创意导航,创意网站导航,设计师网址大全,设计素材大全,设计师导航,UI设计资源', 1, 'http://nav.untview.top/public/upload/image/2024-01-05/c506a8fd1c39e14019fc30abd691eaa2.png', '耕云导航', '你坚持下来了，而别人坚持不下来，这就是你的资本。', 'Copyright © 2024 耕云导航 由 <a href="http://nav.untview.top/" class="a-none">耕云计划 </a>强力驱动', 159, '2024-01-13 09:12:31', 'test');

-- --------------------------------------------------------

--
-- 表的结构 `gy_nav_links`
--

CREATE TABLE IF NOT EXISTS `gy_nav_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '名称',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `icon` text COMMENT '图标',
  `link` varchar(255) NOT NULL,
  `menu_id` varchar(255) NOT NULL,
  `category_ids` varchar(255) DEFAULT NULL COMMENT '分类',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `views` int(11) NOT NULL DEFAULT '100',
  `likes` int(11) NOT NULL DEFAULT '100',
  `create_By` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=284 ;

--
-- 转存表中的数据 `gy_nav_links`
--

INSERT INTO `gy_nav_links` (`id`, `name`, `description`, `icon`, `link`, `menu_id`, `category_ids`, `sort`, `state`, `views`, `likes`, `create_By`, `create_time`, `update_by`, `update_time`) VALUES
(91, '哔哩哔哩 (゜-゜)つロ', '哔哩哔哩（bilibili.com)是国内知名的视频弹幕网站，这里有及时的动漫新番，活跃的ACG氛围，有创意的Up主。大家可以在这里找到许多欢乐。', 'https://static.hdslb.com/mobile/img/512.png', 'https://www.bilibili.com/', '1', NULL, 6, 1, 3268, 3419, NULL, '2023-08-05 16:41:27', 'admin', '2023-11-30 13:48:24'),
(92, '吾爱破解', '吾爱破解论坛致力于软件安全与病毒分析的前沿，丰富的技术版块交相辉映，由无数热衷于软件加密解密及反病毒爱好者共同维护 ', 'http://t3.gstatic.cn/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&size=128&url=https://www.52pojie.cn', 'https://www.52pojie.cn/', '1', NULL, 5, 1, 2289, 3191, NULL, '2023-08-05 17:00:20', 'admin', '2023-11-30 13:46:32'),
(93, 'GitHub', '各类资源网站', 'https://github.com/favicons/favicon.png', 'https://github.com/', '1', NULL, 7, 1, 4089, 2368, NULL, '2023-08-10 15:33:45', 'admin', '2023-11-30 13:48:39'),
(94, '稀土掘金', '掘金是面向全球中文开发者的技术内容分享与交流平台。我们通过技术文章、沸点、课程、直播等产品和服务，打造一个激发开发者创作灵感，激励开发者沉淀分享，陪伴开发者成长的综合类技术社区。', 'https://lf3-cdn-tos.bytescm.com/obj/static/xitu_juejin_web//static/favicons/apple-touch-icon.png', 'https://juejin.cn/', '1', NULL, 100, 1, 1574, 2768, NULL, '2023-08-10 15:35:10', NULL, '2023-08-10 15:35:11'),
(95, '163网易免费邮', '网易163免费邮箱，你的专业电子邮局，注册用户数超10亿，专业稳定安全。网易邮箱官方App“邮箱大师”帮您高效处理邮件，支持所有邮箱，并可在手机、Windows和Mac上多端协同使用。', 'https://mail.163.com/favicon.ico', 'https://mail.163.com/', '1,21', NULL, 100, 1, 4119, 3787, NULL, '2023-08-10 15:36:06', 'admin', '2023-11-30 09:52:19'),
(96, '网易云音乐', '网易云音乐是一款专注于发现与分享的音乐产品，依托专业音乐人、DJ、好友推荐及社交功能，为用户打造全新的音乐生活。', 'https://s1.music.126.net/style/favicon.ico?v20180823', 'https://music.163.com/', '1', NULL, 8, 1, 1577, 2026, NULL, '2023-08-10 15:37:18', 'admin', '2023-11-30 13:48:55'),
(97, '配色卡_色彩搭配_配色工具', '配色卡，简单好用的配色网站，专注于配色色彩领域，拥有超多经典、时尚、新锐配色组合，让色彩搭配不再难', 'https://www.peiseka.com/favicon.png', 'https://www.peiseka.com/', '1', NULL, 100, 1, 3901, 4925, NULL, '2023-08-10 15:39:27', NULL, '2023-08-10 15:39:28'),
(98, 'Gitee', '面向企业提供一站式研发管理解决方案，包括代码管理、项目管理、文档协作、测试管理、CICD、效能度量等多个模块，支持SaaS、私有化等多种部署方式，帮助企业有序规划和管理研发过程，提升研发效率和质量。', 'https://gitee.com/favicon.ico', 'https://gitee.com/', '1', NULL, 8, 1, 4422, 2336, NULL, '2023-08-10 15:41:18', 'admin', '2023-11-30 13:49:19'),
(99, 'CSDN', 'CSDN是全球知名中文IT技术交流平台,创建于1999年,包含原创博客、精品问答、职业培训、技术论坛、资源下载等产品服务,提供原创、优质、完整内容的专业IT技术开发社区.', 'http://t3.gstatic.cn/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&size=128&url=https://www.csdn.net', 'https://www.csdn.net/', '1', NULL, 100, 1, 3914, 4059, NULL, '2023-08-10 15:42:17', NULL, '2023-08-10 15:42:18'),
(100, '【在线PS】PS软件网页版', '稿定设计PS是一款专业精简的在线ps图片处理软件，免下载、免安装，直接在浏览器打开网页版就可随时随地用它修正，调整和美化您的图片。', 'https://ps.gaoding.com/favicon.ico', 'https://ps.gaoding.com/', '1,10,12,18', NULL, 100, 1, 3556, 4100, NULL, '2023-08-10 15:44:12', 'admin', '2023-11-30 08:39:51'),
(101, '在线抠图图片去除背景', 'remove.bg在线抠图软件轻松实现一键抠图，只需上传图片，无需其他操作，即可100%自动去除图片背景。', 'https://www.remove.bg/apple-touch-icon.png?v=YAXaAv7pao', 'https://www.remove.bg/zh', '1', NULL, 100, 1, 4833, 3363, NULL, '2023-08-10 15:59:22', 'admin', '2023-08-10 16:00:23'),
(104, '草料二维码生成器', '草料二维码把二维码技术变成简单实用的产品，让每个人都可以快速复用成功案例经验，自由组合内容展示、表单、批量、数据统计、美化和标签排版等功能，免费制作出能高效解决业务问题的二维码', 'https://static.clewm.net/static/images/favicon.ico', 'https://cli.im/', '1', NULL, 100, 1, 4316, 2993, NULL, '2023-08-10 17:07:49', NULL, '2023-08-10 17:07:50'),
(107, 'iconfont-阿里巴巴矢量图标库', 'iconfont-国内功能很强大且图标内容很丰富的矢量图标库，提供矢量图标下载、在线存储、格式转换等功能。阿里巴巴体验团队倾力打造，设计和前端开发的便捷工具', 'https://img.alicdn.com/imgextra/i4/O1CN01Z5paLz1O0zuCC7osS_!!6000000001644-55-tps-83-82.svg', 'https://www.iconfont.cn/', '3,1', NULL, 100, 1, 4016, 2601, NULL, '2023-08-11 09:36:14', 'admin', '2023-11-28 17:00:52'),
(108, 'xicons - Icons for Vue & React', 'xicons - Icons for Vue & React', 'https://xicons.org/favicon.svg', 'https://xicons.org/', '3', NULL, 100, 1, 2958, 1985, NULL, '2023-08-11 09:38:12', NULL, '2023-08-11 09:38:13'),
(109, 'ByteDance IconPark', 'IconPark, park your icon. Made by ByteDance', 'https://lf1-cdn2-tos.bytegoofy.com/bydesign/iconparksite/logo.svg', 'https://iconpark.oceanengine.com', '3', NULL, 100, 1, 3052, 4306, NULL, '2023-08-11 09:41:03', NULL, '2023-08-11 09:41:03'),
(110, 'Streamline Icons: The Only Icon System', 'With 170,000 icons, Streamline is the only icon system. It''s designed by one team of 8 icon designers in a consistent, harmonious style. Pair these icons with our 35,000 vector illustrations, emoji and elements for best results. ', 'http://t3.gstatic.cn/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&size=128&url=https://www.streamlinehq.com', 'https://www.streamlinehq.com/', '3', NULL, 100, 1, 3873, 4948, NULL, '2023-08-11 11:01:29', 'admin', '2023-08-11 11:01:49'),
(111, '知名品牌矢量logo ', ' logoeps知名品牌矢量logo ', 'https://logoeps.com/favicon.ico', 'https://logoeps.com', '4', NULL, 100, 1, 4618, 3247, NULL, '2023-08-14 09:23:06', NULL, '2023-08-14 09:23:06'),
(112, 'Instant Logo', '知名矢量logo下载 ', 'http://t3.gstatic.cn/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&size=128&url=http://instantlogosearch.com', 'http://instantlogosearch.com', '4', NULL, 100, 1, 4383, 3670, NULL, '2023-08-14 09:23:51', NULL, '2023-08-14 09:23:52'),
(113, '全球LOGO新闻和品牌设计趋势平台', '标志情报局24小时提供全球最新最全的新标志、新LOGO、标志新闻、标志资讯、LOGO新闻、LOGO设计欣赏、标志揭晓、国外LOGO设计欣赏等情报资讯。', 'https://www.logonews.cn/favicon-64x64.png', 'https://www.logonews.cn', '4', NULL, 100, 1, 3705, 2512, NULL, '2023-08-14 09:24:32', NULL, '2023-08-14 09:24:32'),
(114, '矢量Logo', '下载 超赞！知名Logo矢量资源下载', 'https://worldvectorlogo.com/static/img/favicon.ico', 'https://worldvectorlogo.com', '4', NULL, 100, 1, 3445, 4690, NULL, '2023-08-14 09:25:51', NULL, '2023-08-14 09:25:51'),
(115, 'Logo Design', '一家享誉全球的图形和标志设计机构，来自英国', 'http://t3.gstatic.cn/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&size=128&url=https://www.logodesign.co.uk', 'https://www.logodesign.co.uk', '4', NULL, 100, 1, 4615, 4004, NULL, '2023-08-14 09:26:54', NULL, '2023-08-14 09:26:54'),
(116, '搜UI-中国UI设计素材_UI设计图片下载_UI模板资源交易网站', '搜UI为中国UI设计师提供专业的UI设计作品交易平台。打造国内优质的UI设计作品交易，售卖，下载，学习，交流社区网站。聚合ui设计，ui素材、ui设计教程，界面设计，交互设计，网页设计，图标等UI设计模板资源，为UI设计师减少70%加班时间。', 'http://www.sooui.com/favicon.ico', 'http://www.sooui.com', '5', NULL, 100, 1, 4674, 2857, NULL, '2023-08-14 09:28:19', NULL, '2023-08-14 09:28:19'),
(117, 'UI8', '聚集世界各地优秀设计师的界面源文件', 'http://t3.gstatic.cn/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&size=128&url=https://ui8.net', 'https://ui8.net', '5', NULL, 100, 1, 2265, 4757, NULL, '2023-08-14 09:29:15', NULL, '2023-08-14 09:29:16'),
(118, 'Principle Repo', 'principle源文件资源下载 ', 'https://principlerepo.com/wp-content/themes/the-repo/images/favicon.ico', 'https://principlerepo.com', '5', NULL, 100, 1, 4986, 2156, NULL, '2023-08-14 09:30:08', NULL, '2023-08-14 09:30:09'),
(119, 'graphberry', 'UI素材、PSD素材下载 ', 'https://www.graphberry.com/favicon.ico', 'https://www.graphberry.com', '5', NULL, 100, 1, 4826, 2159, NULL, '2023-08-14 09:30:53', NULL, '2023-08-14 09:30:53'),
(120, '365psd', '兢兢业业每天更新着用户界面相关的PSD', 'http://t3.gstatic.cn/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&size=128&url=https://365psd.com', 'https://365psd.com', '5', NULL, 100, 1, 1820, 4624, NULL, '2023-08-14 09:31:30', NULL, '2023-08-14 09:31:30'),
(121, 'icon8', '91,000+ 矢量图标免费下载 ', 'https://maxst.icons8.com/vue-static/landings/primary-landings/favs/icons8_fav_32×32.png', 'https://icons8.com/icons', '3', NULL, 100, 1, 2155, 2408, NULL, '2023-08-14 09:32:22', NULL, '2023-08-14 09:32:22'),
(122, 'cc0图片网（cc0.cn） - 免费图片大全、可商业用途的图片素材网', 'CC0.CN / CC零图片网，可用于商业用途的免费图片素材聚合。CC0.CN上的图片均可用在个人及商业用途的项目中。例如：网站、自媒体等应用配图，广告及宣传册印刷设计等均可免费使用，免除版权困扰...', 'http://www.cc0.cn/apple-touch-icon.png', 'http://www.cc0.cn/', '7', NULL, 100, 1, 4074, 4645, NULL, '2023-08-14 09:33:54', NULL, '2023-08-14 09:33:55'),
(123, '免费素材图片', '免费素材图片和视频，可以在任何地方使用。✓ 高质量 ✓ 100% 免费✓ 无需注明归属', 'http://t3.gstatic.cn/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&size=128&url=https://www.pexels.com', 'https://www.pexels.com/zh-cn/', '7', NULL, 100, 1, 2500, 4069, NULL, '2023-08-14 09:35:11', NULL, '2023-08-14 09:35:11'),
(124, 'Pixabay', '一个包含数百万张照片、视频和插图的免费素材库，具有高品质和专业性。您可以访问该站点并搜索需要的内容，所有作品均可免费使用。', 'http://t3.gstatic.cn/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&size=128&url=https://pixabay.com', 'https://pixabay.com/', '7', NULL, 100, 1, 4344, 4514, NULL, '2023-08-14 09:36:30', NULL, '2023-08-14 09:36:30'),
(125, 'StockSnap', 'StockSnap 是一家美观而易于使用的免费图库，具有超过千万张高品质摄影和插画创意。每周新增照片大约700张左右。您可以根据分类、标签或颜色选择自己需要的素材。', 'data:image/png;base64,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', 'https://stocksnap.io/', '7', NULL, 100, 1, 4535, 4133, NULL, '2023-08-14 09:37:13', 'admin', '2023-11-29 14:00:42'),
(126, 'RawPixel', 'RawPixel拥有庞大的免费图像资源库，并且还向用户提供有关图像风格、配色方案等的深度内容。由设计者与摄影师打造出优雅并低调的素材集合，可满足各种创意需求。', 'http://t3.gstatic.cn/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&size=128&url=https://www.rawpixel.com', 'https://www.rawpixel.com/', '7', NULL, 100, 1, 2062, 3410, NULL, '2023-08-14 09:38:00', NULL, '2023-08-14 09:38:00'),
(127, 'Unsplash', 'Unsplash提供了数以万计的高分辨率、免费使用的照片，很适合作为博客、网站或社交媒体上的背景图和插图。每隔 10 天左右，Unsplash 向用户推送 10 张照片以供使用，也可以浏览其他用户主页获得灵感。', 'http://t3.gstatic.cn/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&size=128&url=https://unsplash.com', 'https://unsplash.com/', '7', NULL, 100, 1, 2363, 3586, NULL, '2023-08-14 09:38:55', NULL, '2023-08-14 09:38:56'),
(128, 'Visualhunt ', 'Visualhunt 是一个提供高质量免费图片下载的平台，它汇聚了许多摄影家和创作者们代表最高水准创意作品。该网站上的图片来源广泛而深入，题材涵盖自然、人物、食物、城市等。此外，它还提供了数据和图形库存，可以满足不同行业、领域有关设计和编排的需求。', 'http://t3.gstatic.cn/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&size=128&url=https://visualhunt.com', 'https://visualhunt.com/', '7', NULL, 100, 1, 2341, 2947, NULL, '2023-08-14 09:39:33', NULL, '2023-08-14 09:39:33'),
(129, 'picjumbo', 'Picjumbo 是一个提供高品质免费图片下载的平台，与其它免费照片网站相比， 具有更清晰、更多样的精美图片资源，包括自然、人物、生活、商业等，同时还有许多专业艺术摄影师的系列作品供您选择。', 'https://picjumbo.com/apple-touch-icon.png', 'https://picjumbo.com/', '7', NULL, 100, 1, 2712, 3218, NULL, '2023-08-14 09:40:10', NULL, '2023-08-14 09:40:11'),
(130, 'colorhub', ' 高清无版权图片，个人和商业用途免费', 'https://www.colorhub.me/colorhub.png', 'https://www.colorhub.me/', '7', NULL, 100, 1, 2956, 3626, NULL, '2023-08-14 09:40:43', NULL, '2023-08-14 09:40:43'),
(131, '壁纸湖网-为壁纸控攒宝藏        ', '壁纸湖，为壁纸控们挖掘宝藏手机壁纸。壁纸采集，优质壁纸获取，时刻follow最新的手机壁纸。壁纸湖唯一官网，没有APP', 'https://bizihu.com/fliee/ico.png', 'https://bizihu.com/', '8', NULL, 100, 1, 4260, 1920, NULL, '2023-08-14 09:41:39', NULL, '2023-08-14 09:41:40'),
(132, 'Wallpaper Abyss', ' 壁纸分享网站。', 'http://t3.gstatic.cn/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&size=128&url=https://wall.alphacoders.com', 'https://wall.alphacoders.com/?lang=Chinese', '8', NULL, 100, 1, 2323, 4356, NULL, '2023-08-14 09:42:46', NULL, '2023-08-14 09:42:46'),
(133, 'interfacelift ', '支持多尺寸的高清壁纸图库网站。', 'http://t3.gstatic.cn/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&size=128&url=https://interfacelift.com', 'https://interfacelift.com', '8', NULL, 100, 1, 2808, 2972, NULL, '2023-08-14 09:43:24', NULL, '2023-08-14 09:43:25'),
(134, 'WallpaperHub', '壁纸质量很高，全是精品，有不同尺寸的图片可以下载，下完能直接拿来当壁纸。', 'https://www.wallpaperhub.app/favicon.ico', 'https://www.wallpaperhub.app/', '8', NULL, 100, 1, 4938, 3773, NULL, '2023-08-14 09:46:41', NULL, '2023-08-14 09:46:42'),
(135, '极简壁纸_海量电脑桌面壁纸美图_4K超高清_最潮壁纸网站', '极简壁纸,4K高清电脑桌面壁纸图库,海量4K电脑壁纸,壁纸网站,美女,动漫,风景,4k高清,4k超清,电脑壁纸桌面', 'https://bz.zzzmh.cn/img/icons/favicon-32x32.png', 'https://bz.zzzmh.cn/index', '8', NULL, 100, 1, 2550, 3433, NULL, '2023-08-14 09:47:07', NULL, '2023-08-14 09:47:07'),
(136, '必应每日壁纸', '必应每日壁纸，提供了 1920×1080 分辨率和大尺寸原图下载。', 'http://t3.gstatic.cn/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&size=128&url=https://bing.ioliu.cn', 'https://bing.ioliu.cn/', '8', NULL, 100, 1, 4512, 3763, NULL, '2023-08-14 09:47:50', NULL, '2023-08-14 09:47:51'),
(137, '故宫壁纸', '故宫博物院官方壁纸专栏，都是历史文物的高清数字图像资源。', 'https://www.dpm.org.cn/favicon.ico', 'https://www.dpm.org.cn/lights/royal.html', '8', NULL, 100, 1, 3777, 2597, NULL, '2023-08-14 09:48:52', NULL, '2023-08-14 09:48:52'),
(138, 'pexels', '免费图片素材网站，来自全球用户上传的摄影作品。', 'http://t3.gstatic.cn/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&size=128&url=https://www.pexels.com', 'https://www.pexels.com/zh-cn/', '7', NULL, 100, 1, 3657, 1990, NULL, '2023-08-14 09:50:00', NULL, '2023-08-14 09:50:00'),
(139, 'TinyPNG', 'TinyPNG是一款WebP, PNG and JPEG 图片有损压缩工具', 'https://tinypng.com/images/favicon.ico', 'https://tinypng.com/', '10', NULL, 100, 1, 4483, 4442, NULL, '2023-11-29 08:59:35', NULL, '2023-11-29 08:59:36'),
(140, 'Remove.bg  ', '点击一下就可以在5秒钟内自动移除图像背景。不要花费数小时手动选择像素。现在上传你的照片 & 看到魔术。', 'https://www.remove.bg/apple-touch-icon.png?v=YAXaAv7pao', 'https://www.remove.bg/zh/upload', '10', NULL, 100, 1, 3761, 3981, NULL, '2023-11-29 09:01:05', NULL, '2023-11-29 09:01:05'),
(141, '聚合图床 - 免费无限图片上传', '聚合图床是一个提供高速外链的免费图床，无限流量，无限外链，全球网络加速，提供API和客户端上传图片，专业的跨境电商图片上传和托管，适合亚马逊, wish, ebay, shopify, 速卖通等电商批量上传图片', 'https://www.superbed.cn/favicon.ico', 'https://www.superbed.cn/', '10', NULL, 100, 1, 3620, 4660, NULL, '2023-11-29 09:01:36', NULL, '2023-11-29 09:01:36'),
(142, 'Squoosh', 'Squoosh 是最终的图像优化器，允许您压缩和比较图像与不同的解码器在您的浏览器。', 'https://squoosh.app/c/favicon-c9cf50ef.ico', 'https://squoosh.app/', '10', NULL, 100, 1, 3936, 4200, NULL, '2023-11-29 09:03:26', NULL, '2023-11-29 09:03:27'),
(143, '映画の图床- 极速CDN', '聚合多家大厂的免费图床', 'http://t3.gstatic.cn/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&size=128&url=https://imgs.top', 'https://imgs.top/', '10', NULL, 100, 1, 4192, 3361, NULL, '2023-11-29 09:04:02', NULL, '2023-11-29 09:04:03'),
(144, '图床 - 免费上传图片并生成链接', '免费公共图床, 提供图片上传和图片外部链接服务, 全球CDN加速.', 'https://imgloc.com/content/images/system/favicon_1694748603337_632652.png', 'https://imgloc.com/', '10', NULL, 100, 1, 2728, 2056, NULL, '2023-11-29 09:05:01', NULL, '2023-11-29 09:05:02'),
(145, 'ImgTP - 免费公共图床', '简单易操作，免费且不压缩图片画质的公共图床平台，支持对接PicGo。从本地相册选取图片上传到图床服务器快速获取图片外链。支持批量上传！', 'https://www.imgtp.com/favicon.ico', 'https://www.imgtp.com/', '10', NULL, 100, 1, 4100, 2328, NULL, '2023-11-29 09:05:50', NULL, '2023-11-29 09:05:51'),
(147, 'Baseline', '图片背景去除，颜色选择等', 'https://baseline.is/baseline-cms/media/site/e282635d53-1693091076/icon.png', 'https://baseline.is/tools/', '10', NULL, 100, 1, 4841, 1721, NULL, '2023-11-29 09:11:58', NULL, '2023-11-29 09:11:58'),
(148, 'Be JSON图片压缩工具', 'Be JSON其中的在线图片压缩工具', 'http://t3.gstatic.cn/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&size=128&url=https://www.bejson.com', 'https://www.bejson.com/ui/compress_img/', '10,12', NULL, 100, 1, 3083, 1749, NULL, '2023-11-29 09:14:00', 'admin', '2023-11-29 10:30:06'),
(149, 'docsmall', 'docsmall - 免费在线图片压缩、GIF压缩工具、PDF压缩工具、PDF合并工具、PDF分割工具', 'https://docsmall.com/favicon.png', 'https://docsmall.com/', '10', NULL, 100, 1, 1501, 4257, NULL, '2023-11-29 09:15:11', NULL, '2023-11-29 09:15:12'),
(150, '在线拼图, 图片拼接', '在线将多张图片拼接成一张图片。可用于健康码、行程码、核酸检测结果拼图等。', 'https://www.sunzhongwei.com/favicon.ico', 'https://www.sunzhongwei.com/tools2/combine-images', '10', NULL, 100, 1, 4779, 2621, NULL, '2023-11-29 09:17:23', NULL, '2023-11-29 09:17:23'),
(151, 'Online Video Editor ', '在线视频编辑器和转换器-编辑，转换和压缩视频文件', 'http://t3.gstatic.cn/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&size=128&url=https://www.video2edit.com', 'https://www.video2edit.com/', '11,12', NULL, 100, 1, 4274, 1504, NULL, '2023-11-29 09:55:47', 'admin', '2023-11-29 10:28:27'),
(152, 'Convertio — 文件转换器', 'Convertio - 在线转换文件的简单工具。支持超过309种不同的文档、图像、电子表格、电子书、文档、演示文稿、音频和视频格式。', 'http://t3.gstatic.cn/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&size=128&url=https://convertio.co', 'https://convertio.co/zh/', '12,11,10', NULL, 100, 1, 3699, 1982, NULL, '2023-11-29 10:27:43', 'admin', '2023-11-29 10:28:16'),
(153, 'ezgif 将视频转换为gif动画', '易于使用在线动画 GIF 制作器和图像编辑器。免费上传和编辑 GIF 图片。创建，裁剪，调整大小，反向，优化和分割动画 GIF，剪切和调整大小的视频，WebP 和 APNG 动画。', 'https://ezgif.com/apple-touch-icon-precomposed.png', 'https://ezgif.com/', '11', NULL, 100, 1, 4317, 3637, NULL, '2023-11-29 10:36:16', NULL, '2023-11-29 10:36:16'),
(154, 'aconvert：各种文件格式转换', 'AConvert.com 可以免费在线转换各种文档、电子书、图像、图标、视频、音频和存档文件。', 'http://t3.gstatic.cn/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&size=128&url=https://www.aconvert.com', 'https://www.aconvert.com/cn/', '12,10,11', NULL, 100, 1, 3733, 2754, NULL, '2023-11-29 10:37:36', NULL, '2023-11-29 10:37:37'),
(155, 'iLovePDF ', 'ILovePDF 是一个在线服务，可以完全免费使用 PDF 文件。合并 PDF，分割 PDF，压缩 PDF，办公室到 PDF，PDF 到 JPG 和更多！', 'https://www.ilovepdf.com/img/app-icon.png', 'https://www.ilovepdf.com/zh-cn', '12', NULL, 100, 1, 4574, 2604, NULL, '2023-11-29 10:39:52', NULL, '2023-11-29 10:39:52'),
(156, 'uni-app官网', 'uni-app,uniCloud,serverless,快速体验,看视频，10分钟了解uni-app,为什么要选择uni-app？,功能框架图,一套代码，运行到多个平台', 'https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/icon.png?v=1556263038788', 'https://uniapp.dcloud.io/', '14', NULL, 100, 1, 4800, 4185, NULL, '2023-11-29 10:57:36', NULL, '2023-11-29 10:57:37'),
(157, 'Vue.js - 渐进式 JavaScript 框架 | Vue.js', 'Vue.js - 渐进式的 JavaScript 框架', 'https://cn.vuejs.org/logo.svg', 'https://cn.vuejs.org/index.html', '14', NULL, 100, 1, 1526, 4080, NULL, '2023-11-29 10:58:33', NULL, '2023-11-29 10:58:34'),
(158, 'Docusaurus - 帮你快速构建并优化网站，让你专心于创作内容', '⚡️ Docusaurus 将帮助你交付一个 漂亮的文档网站，且不费时间。\n???? 构建定制技术堆栈非常昂贵。 而应该是，专注于你的内容 且只编写 Markdown 文件。', 'https://www.docusaurus.cn/img/docusaurus.ico', 'https://www.docusaurus.cn', '14', NULL, 100, 1, 3816, 1841, NULL, '2023-11-29 11:00:08', NULL, '2023-11-29 11:00:09'),
(159, 'Taro | 多端统一开发解决方案', 'Taro 是凹凸实验室开发的多端统一开发解决方案。', 'https://taro.jd.com/static/images/favicon.ico', 'https://taro.jd.com/', '14', NULL, 100, 1, 3259, 2271, NULL, '2023-11-29 11:01:00', NULL, '2023-11-29 11:01:01'),
(160, 'UIkit中文网 - UIkit前端框架', 'UIkit是YOOtheme团队开发的一款轻量级、模块化的前端框架，可快速构建强大的前端web界面。UIKit使用的变量基于LESS，具有体积小、模块化、可轻松地自定义主题及响应式设计可在多种环境中使用等特点。UIkit中文网为广大国内开发者提供详尽的中文文档、代码实例等，帮助开发者快速掌握并使用这一框架。', 'data:image/png;base64,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', 'http://www.uikitcss.com/', '14', NULL, 100, 1, 3578, 2576, NULL, '2023-11-29 11:09:57', 'admin', '2023-11-29 14:00:24'),
(161, 'xicons - Icons for Vue & React', 'Vue & React Icon图标库', 'https://xicons.org/favicon.svg', 'https://xicons.org', '14', NULL, 100, 1, 4146, 4503, NULL, '2023-11-29 11:12:42', NULL, '2023-11-29 11:12:42'),
(162, 'UnoCSS', 'UnoCSS一个原子化css库', 'https://unocss.dev/favicon.ico', 'https://unocss.dev/interactive/', '14,16', NULL, 100, 1, 1573, 3362, NULL, '2023-11-29 11:14:27', NULL, '2023-11-29 11:14:27'),
(163, 'thinkphp6      ', 'thinkphp6.0 API文档', 'http://t3.gstatic.cn/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&size=128&url=https://www.kancloud.cn', 'https://www.kancloud.cn/manual/thinkphp6_0/1037479', '14', NULL, 100, 1, 3588, 2852, NULL, '2023-11-29 11:15:49', NULL, '2023-11-29 11:15:49'),
(164, 'uView 2.0 - 全面兼容 nvue 的 uni-app 生态框架 - uni-app UI 框架', 'uView UI，是 uni-app 生态最优秀的 UI 框架，全面的组件和便捷的工具会让您信手拈来，如鱼得水', 'http://t3.gstatic.cn/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&size=128&url=https://www.uviewui.com', 'https://www.uviewui.com/', '14', NULL, 99, 1, 1999, 3439, NULL, '2023-11-29 11:19:28', 'admin', '2023-11-29 11:19:58'),
(165, 'Element UI 2.0', 'Element，一套为开发者、设计师和产品经理准备的基于 Vue 2.0 的桌面端组件库', 'https://element.eleme.cn/favicon.ico', 'https://element.eleme.cn/#/zh-CN', '14', NULL, 100, 1, 2699, 1677, NULL, '2023-11-29 11:20:53', NULL, '2023-11-29 11:20:53'),
(166, 'Ant Design Vue ', 'An enterprise-class UI components based on Ant Design and Vue', 'https://aliyuncdn.antdv.com/favicon.ico', 'https://www.antdv.com/components/overview', '14', NULL, 100, 1, 2289, 4914, NULL, '2023-11-29 11:22:27', NULL, '2023-11-29 11:22:27'),
(167, 'Vant 4 - 轻量、可定制的移动端组件库', 'Vant 是一个轻量、可定制的移动端组件库，于 2017 年开源。\n目前 Vant 官方提供了 Vue 2 版本、Vue 3 版本和微信小程序版本，并由社区团队维护 React 版本和支付宝小程序版本。', 'https://fastly.jsdelivr.net/npm/@vant/assets/logo.png', 'https://vant-contrib.gitee.io/vant/v4/#/zh-CN', '14', NULL, 100, 1, 2200, 1762, NULL, '2023-11-29 11:23:32', NULL, '2023-11-29 11:23:33'),
(168, 'Element Plus', 'a Vue 3 based component library for designers and developers', 'https://element-plus.gitee.io/images/element-plus-logo-small.svg', 'https://element-plus.gitee.io/zh-CN/', '14', NULL, 100, 1, 4213, 3773, NULL, '2023-11-29 11:24:03', NULL, '2023-11-29 11:24:03'),
(169, 'Vue DevUI', 'Vue DevUI 组件库', 'https://vue-devui.github.io/assets/logo.svg', 'https://vue-devui.github.io/', '14', NULL, 100, 1, 4726, 3811, NULL, '2023-11-29 11:24:34', NULL, '2023-11-29 11:24:34'),
(170, 'Tailwind CSS', 'Tailwind CSS is a utility-first CSS framework for rapidly building modern websites without ever leaving your HTML.', 'https://www.tailwindcss.cn/favicons/apple-touch-icon.png?v=3', 'https://www.tailwindcss.cn/', '14', NULL, 100, 1, 3379, 3963, NULL, '2023-11-29 11:24:53', 'admin', '2023-11-29 11:25:03'),
(171, 'Naive UI', 'Naive UI 是一个 Vue3 的组件库。', 'https://www.naiveui.com/assets/naivelogo-93278402.svg', 'https://www.naiveui.com/zh-CN/os-theme', '14', NULL, 100, 1, 4676, 2988, NULL, '2023-11-29 11:26:08', NULL, '2023-11-29 11:26:08'),
(172, 'dumi - 为组件研发而生的静态站点框架', 'dumi，中文发音嘟米，是一款为组件开发场景而生的静态站点框架，与 father 一起为开发者提供一站式的组件开发体验，father 负责组件源码构建，而 dumi 负责组件开发及组件文档生成。', 'https://gw.alipayobjects.com/zos/bmw-prod/d3e3eb39-1cd7-4aa5-827c-877deced6b7e/lalxt4g3_w256_h256.png', 'https://d.umijs.org/', '14', NULL, 100, 1, 2913, 4104, NULL, '2023-11-29 11:27:29', NULL, '2023-11-29 11:27:29'),
(173, ' OSCHINA.NET社区', 'OSCHINA.NET在线工具,ostools为开发设计人员提供在线工具，提供jsbin在线 CSS、JS 调试，在线 Java API文档,在线 PHP API文档,在线 Node.js API文档,Less CSS编译器，MarkDown编译器等其他在线工具', 'https://tool.oschina.net/img/favicon.ico', 'https://tool.oschina.net/codeformat/', '15', NULL, 100, 1, 3280, 2587, NULL, '2023-11-29 13:46:38', NULL, '2023-11-29 13:46:38'),
(174, '在线JSON校验格式化工具（Be JSON）', '在线,JSON,JSON 校验,格式化,xml转json 工具,在线工具,json视图,可视化,程序,服务器,域名注册,正则表达式,测试,在线json格式化工具,json 格式化,json格式化工具,json字符串格式化,json 在线查看器,json在线,json 在线验证,json tools online,在线文字对比工具', 'http://t3.gstatic.cn/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&size=128&url=https://www.bejson.com', 'https://www.bejson.com/runcode/javascript/', '15', NULL, 100, 1, 1595, 2216, NULL, '2023-11-29 13:47:33', NULL, '2023-11-29 13:47:33'),
(175, 'Apifox - API', 'Apifox = Postman + Swagger + Mock + JMeter。集接口文档工具、接口Mock工具、接口自动化测试工具、接口调试工具于一体，提升 10 倍研发效率。是最好用的API文档工具，API自动化测试工具，API Mock工具，接口文档管理工具，接口文档生成工具。', 'https://cdn.apifox.com/logo/apifox-logo-256.png', 'https://www.apifox.cn/', '15', NULL, 100, 1, 4796, 1829, NULL, '2023-11-29 13:48:26', NULL, '2023-11-29 13:48:26'),
(176, 'Apache ECharts', 'Apache ECharts，一款基于JavaScript的数据可视化图表库，提供直观，生动，可交互，可个性化定制的数据可视化图表。', 'https://echarts.apache.org/zh/images/favicon.png', 'https://echarts.apache.org/zh/index.html', '15', NULL, 100, 1, 3762, 4820, NULL, '2023-11-29 13:49:58', NULL, '2023-11-29 13:49:59'),
(177, 'wangEditor', '开源 Web 富文本编辑器，开箱即用，配置简单', 'https://www.wangeditor.com/favicon.ico', 'https://www.wangeditor.com/', '15,14', NULL, 100, 1, 4312, 2098, NULL, '2023-11-29 13:51:35', 'admin', '2023-11-29 13:52:07'),
(178, 'DataV', 'Vue 大屏数据展示组件库', 'http://datav.jiaminghi.com/favicon.ico', 'http://datav.jiaminghi.com/guide/', '14,15', NULL, 100, 1, 3060, 4003, NULL, '2023-11-29 13:52:01', NULL, '2023-11-29 13:52:01'),
(179, '零代码工具箱 - 专为前端打造', '零代码工具箱提供前端各种常用工具，帮助提高前端开发效率，零代码独创的在线布局工具，通过简单拖拽即可完成各种复杂的布局！', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAK4AAACACAYAAACSqlKoAAAAAXNSR0IArs4c6QAAD8dJREFUeF7tnXmMHMd1h39V3bOzN7lcLg9RlilSYgRRlqXdnuESkRASDpwYvmInchA7gWMIkP6IgsBCEjiItDscCpARwzEcJUEoIIEtOLHhS45ix5AtiTSoeI/pWfGIaOugQ5EiuTRF7kHuOdP1ghpyqN3ZObpnetk93FfAgMfUq3r16us3r193VQlwYQvUoQVEHerMKrMFwOAyBHVpAQa3LqeNlWZwmYG6tIBv4I6MjNyplEpYlvWpurQEK11XFqgZ3HQ63a+U+pmUspGIHrQs6wHbtr/NANcVB3WnbM3gDg0NWYZhvCil/JjjOH8O5G743onFYg/XnTVY4bqxQE3gDgwMbDZNc7OUchMRfR3AAIDjAH6kLWBZ1nfqxhKsaF1ZoCZwbdt+AID+6PJhABcBfAPAlBDCIKKnLcs6W1cWYWXrwgI1gZsfoW3b2tNqL3s3gG4hxN/19PQ8XRcWYCXr0gI1g3v15mwUwKSU8jeFEP+slHrVsqya265Li7LS18UCvsGVTqf/EMAdPT09e66L5tzJiraAb+BqK9q2vZFj2hXNU9nBp1KpD8VisR/7YSFfwfVDIW7jxrOAbdukRyWEeIOIbvcjjKxbcB8byOwSQmwRgrYAYgsJbLzxptz/EUngBBG9RYJOkCNOPLEzcsD/Xha3qMHNw/rKK6/c7jjO67XCWzfgJmzqVqR+i4juk8BHCGhYboOvhPYFMEmE/4TAwag0fvi3lvA1fTk0NLTTMIynLMuyFmShroFcrY1DD+5j9uxWQxmPEIR+KmfogbZGgLVRQmuE0GICzSahMfcN0GgQogbQZOR+nbgUWOBSRuBSBtB/js8LvD0lMJm5hsFZED0dNcx9fgK80OPatv0WgJOWZd1fy+SEGty+oUxCCPEoAW2rIoSbWugqsIuHLMUVUPXHlLWYY2XKnp8VOD0l8IsJmZ11hCmEGCWl9iV3RBJ+WcS27fMA1ur2ag0TcvGyX4r53U7fcPb7AD6xqoHwnpYrn2JFe9i2CMEI7Uj8tszytTedBV6fkPjlhOHMOLlft2eTcfOTy9dj9S2Hcrr7hp03Adq6oYlwb6cqOToN7eoGDgmqn/7ikhPzAgfPGdCeGBDHk3HjNr/7qLW90IHbN5y9AGBNJWhbzCuelsvyWeAnp02cns4hcjEZNzuXryfvLYcK3L7hrH5B5zNb2wjbVpX2tPpmrJ2h9T7bVUikLxg4cjF34/Dvybj5x1U0sSwioQG3fzjzJEF84eYWwvs6ODxYltmustGXzxl4Y1JCgL64Jx75myqb8VUsFOD2DWUfgMC3O6KE+FoFnSUoVvQN2Jqo4hsxXxGo3JhDwI9OmTMX5kSTNIyPJnrEDytLLW+NcIA7nP05gJ2xtQprG0vHrTqm1bEtl+tvgVNTEi+cySXL/ysZNz92/TVY3GPg4PalnM+D6O91uuuuMiGCKYDORhXe/F3QM3kd+v/pGTP79pQww+B1AwX3CwepoyHqHGkwsKm3yxH6KVipom/G9E0Zl+AsECavGyi4+dj2lhbC9jLeVk/VusbSsW9wU7nyev7BSVONzQmVMY2bnuwW+mlYICVQcPuHs/sIeEg/ZNB521KlQRLWRNnbBkJIQadD5w0cG5f6meunkzHzm0HpFCi4fcPZ41LQlt/ZVDr9pQ2jX6Zp5TAhKEYW9Ts6I/Djt00IgX/bEzMfDEqpwMBN7KdG1eLMdOoUWFd5cDujChF+eSYoRpb0+8ybEThEh5PxyD1BKRUcuMO0QcE5W+nRLse3QaFRut9n3zIxnpETyZixOijtggPXnrtDKeMXldJgWsH1TeU9clDGW6n9vnDGxKkpARkxOhL3ivEg7BAYuP2D870k5cCWNsJvlHkvQb9fuzbK4AYBR6k+8zdoEureRLzhUBC6BQauXjMmDbH/9nbCbe2lweSMQhBYlO/z0AWJVy4aUA7tvh5r1oppw+CGj4vQa8TgsscNPaTFFGRwGVwGt0oLcKhQpeFWshh7XPa4dck/g8vgMrhVWoBDhSoNt5LF2OOyx61L/hlcBpfBrdICHCpUabiVLMYelz1uXfLP4DK4DG6VFuBQoUrDrWQx9rjsceuSfwaXwWVwq7QAhwpVGm4li7HH9dnj6gXsGSWgXz6vpTR63NZ8Nlt5hcah8958xF2dlXdXv5z11qZfK6UZXB/BPTNtYHJeYF4JdERVbgORqMdzIFoiBloaDDR7XFI87yhMZxTGZ7NLrpcDb0u8eFLi5dPelilvaCHct0nhz97vLGnz3IzEZEZixiO47Q0KHQ2EVQ2VL7RyF37dgZs/r0oPqtZ9/P1cuqMn8I3Jxfs3bWx20NXobYK6WiLQ8FZTMg7h9KW5JaJ7BkxoeKst+347g20di39BXp8wMet487b5/jW0721dejF40a+uwC04OaXm4378BFd7oHMzi4HTuzpubV/qActN0ObVjV7mb0nd0cvzKAwbdn+ntlOt/vROB5/d/i5oOjz4VcFF6lXpu9dkvIosqs/g+hQqMLjeOFxR4KbT6YeIaF/eRGEKFRhcBtebBWqoXS+hwonx2aKj3NDagMLsg9tQ4Su7Mrina2nm4/MHTBw6vzgedhsqlPKiRy5Glui/ojxuDYwWFWVwGdxamKru1rSWHq/KMrgMbi0YMbgLrFcsq8ChwlK86iqrUMvVUUyWPS573FqYYo/LHtczP+xx6yCPy6EChwqLLMChAocKnl39AgEOFUIUKrx0SmLv4OJ3Lp753Qze0/Yu5KUe+XIet5bLwIMse9ylHvfX0wJPHTJyb5KtjhJ23Uz4i+7F71swuFcgY48bIo+bV+XEpMCmVip6YAuDy+Au+X0IOo/r5geLwWVwGVw3V0qROpwO43SYZ3TY47LHZY/r+bK5IsAelz3uNXQuZ4A3x9+9Vy61WJI9Lnvc0Hjcfzpk4L//z8D0gsxXqcWSDC6DGwpwXx8TePiFpS9755UrXCzJ4DK4oQD3668a+Nqx0iuLw7gC4vS0wMFRY2BSmB9/slucrzJUrkmMH0AE/ABidErgkZdMXJgtPhVhBPeqyXbf2tF0oCb6ahBmcAMGV3f/3TcMPH9CLro5y6vF4Banm8ENAbh5FeplsaTW9ydnzC89vD3y1zU4zZpEGVwG1zNAnMflPO4iaOrF4zK4DC6D69nfczosFOmwhUqwx3VPMce4HOO6p+VqTQ4VOFTgUMHzZXODhwql7KE3e+6MKqxuUCjceJy3GXVHEXvcZfS4laZgU7ODzoKNnxncSla78j2DGyC4xTZ+ZnDdgcvvKvgE7pwj8NrE4mXdlabgllYnFy4sLB1NJlZFvbWTl9c7kettRgvLviMGvvVaddvz67YKl6fr/zs+aWLK4/kPeb308QL6mAEfCr+rcFt76bMa9Ak6a6KVT9E5PW1gYl7CxQE40Id4bGpWiBSczqMPLdHgRj2eupNVhMvzTtHDS/7njMR//NLAsQveEjillqdr4PRG1mNzMndQi5fSbFLuUBc9fh8Kg+sHuHoiNN6VPJEpgMYKp/GE4bio7Z3Fl6cvBC6o46Ku6sDg+gWuD16Em3BvAQaXwXVPS4hqMrgMbohwdK8Kg8vguqclRDUZXAY3RDi6V4XBZXDd0xKimgwugxsiHN2rwuAyuO5pCVFNBpfBDRGOLlU5Nm587sO3NnzNZXXfq3l7Zuhj937uSO6jWtyUCwscG5cYOm+AlLL29jakXYj4XoXB9d2kN36D/FqjT2+H3fiohGuEDC6DGy4iXWrD4DK4LlEJVzUGl8ENF5EutWFwGVyXqISrWrXgHjx4sOP+++8f82M0gWUV+gcz95EUB7e2E7aVWQERkcityuUSHgvY7xg4OiYhlNq5p7dh0K1mIyMjH+ju7n7Rbf1y9QIDN5Gau0uRcfSWVsL21aXBlAK55SZcwmOBl84aeOuyhISxMREXo241S6fTf9XT0/Mlt/VDCW7/IN1M0jl1UzPh/WvKg7m+SQV3BKYfVr7B2vjBSRNjc2IuGTcb3Q4tnU73EJFtWZYvztKXRtwqv7BeYj+1qhbnUlcjwVpbHty10aWbd1TTJ8v4Y4Fn3ozAgXgtGTPucNPi0aNH18/Nzf0LgN8TQiR6enr2uJELpcfVSvUNZ0ebTKzbtcEpewG1Rwh6hSqX4C1wYU7guZO5JfzfS8bNPyil0eHDh2/OZDI7AfQC+CSAzQvqHgXwcv5jWdZJryMLzONqRftTmS8TiUd3rtNbIpUGU2+b1FHme6+D5vrVW0DflOmbMyJ8du8O8xm3LaVSqYQQol9K+Ufd3d3fcitXql6g4PbZtBvKeen2dkK5N8T4Bq3WafZP/vnTJs5MC0iR3ZqINf7KbcsjIyN3KqVerfsYNz/gRMo53hahW3u7HKEBLVW0x9Wel0twFrgWJhANJndEdBjgqaRSqQdjsdi/ehIqUfm6eFzbtvdblrW7mA6PD2ceExB7dS5X53RLlagkdLjY0cYPo3AbxS3w818beG1C6o1X/mRv3PyGVzsNDQ3t3LFjx4BXuWL1lxXckZGRLqXUV68G589ZlvWpQiW+aNOqWXLSBmhr7zqF1tKHLGJVA6GJva4f8+65jby3JeC5vXHz454bADA4ONje29s7WY1socyygqs7s237g0T0TQC/H4vFih7o9njKeUQQPbWxmXBPmZwuP0XzY8qra2P/WQMnLksoh3Y/sTMS2MF8ee2XHVzdUTqd7q+Uu+tPZZ8nwgdvaSFs7yid19Xbg7ZFONatDr/qpPLQAuLLybjxl9W14q/UdQHXjcqJw7ROzTlHAKy/e43eTbE0nDp1VmnjOjd9cp3KFhg+b+DV8Vxce2Bv3Cx6n1K5Ff9rhAZcPbREiu5S5OjkNLo7FdY3lYaXswz+w1DYol5XpteXAbiUjJvty9+j+x5CBe4VeOfjiuSQ/vvWNsK2VaXDBv00TT9V4+KvBS5lBOx3ZC6mhcBQMmbqp1+hKqEDNwfvMG1QcHS65QM6LLi1jbChhPfVWQYd85bLAYfK4iFXRnvYo2NSTWeFhKCvJGORR8OocijBzcG7nxqpxfkqAQ/pf+u3yN7bSkUfDRsCuXcZ9Ce0Awrj7C/Q6eSUxP+OSZybERBCjJFS/5DcEUmEVe3Qz/Pjg/M9UsqH8gA36/cWosC6Jg0qctvh6zSZ3mlc74Cvv9fb73vcDT+s8+O7XhkF6DMz5hSgQ4ITlwVGp6Uz40AfVOEI0FOOdP7xCavxuO+d+9hgVeD2D2f3KWBbXg9B9LP81Vn4nW+6kmgTAl0E6hJAk2/tckOAEJdJ0QWA3oEQl7yYZOHcL5TrT2WfVYTVldoqJV9RrlKFYt8/PpzdL4Bd18AFnt4TNx/W/y78rpr2WaZ+LCAWzH1e68TAzGZlRPYXvMpYdFDF5N2M/v8BEktQNfJsAmUAAAAASUVORK5CYII=', 'https://www.lingdaima.com/', '15', NULL, 100, 1, 2334, 1664, NULL, '2023-11-29 13:52:59', 'admin', '2023-11-29 14:00:05');
INSERT INTO `gy_nav_links` (`id`, `name`, `description`, `icon`, `link`, `menu_id`, `category_ids`, `sort`, `state`, `views`, `likes`, `create_By`, `create_time`, `update_by`, `update_time`) VALUES
(180, 'VARBook', '适合中文程序员的变量命名助手，NLP+翻译，规范变量命名，定制化变量命名规则', 'data:image/png;base64,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', 'https://varbook.uiuing.com/#/', '15', NULL, 100, 1, 3320, 3106, NULL, '2023-11-29 13:55:08', NULL, '2023-11-29 13:55:09'),
(181, 'TOOLFK工具网', 'Toolfk程序在线工具箱提供古诗智能创作,语音生成,伪原创,文字转语音,文字转视频,JavaScript/PHP/Python混淆加密,HTML/CSS/JSON格式化等在线工具,做一个有用的在线工具站', 'https://www.toolfk.com/tools/images/icon.png', 'https://www.toolfk.com/', '15', NULL, 100, 1, 4070, 2532, NULL, '2023-11-29 14:02:21', NULL, '2023-11-29 14:02:21'),
(182, 'CODELF', 'Codelf,变量命名,函数命名,方法命名,变量命名神器', 'https://unbug.github.io/codelf/images/codelf_logo.f4ae25bd.png', 'https://unbug.github.io/codelf/images/codelf_logo.f4ae25bd.png', '15', NULL, 100, 1, 2451, 3159, NULL, '2023-11-29 14:04:45', 'admin', '2023-11-29 14:05:13'),
(183, '和风天气插件 ', '和风天气插件产品，免费、跨终端。提供网页天气插件、ios天气插件SDK、android天气插件SDK、天气H5网页、公众号天气，种类包括分钟降水插件、天气预警插件、天气预报插件等。', 'https://widget.qweather.com/assets/favicon/favicon.svg?20230411', 'https://widget.qweather.com/', '15', NULL, 100, 1, 3442, 2734, NULL, '2023-11-29 14:05:51', NULL, '2023-11-29 14:05:51'),
(184, 'jsdelivr', 'Optimized for JS and ESM delivery from npm and GitHub. Works with all web formats. Serving more than 150 billion requests per month.', 'https://www.jsdelivr.com/favicon.ico', 'https://www.jsdelivr.com/', '15', NULL, 100, 1, 1843, 3016, NULL, '2023-11-29 14:06:47', NULL, '2023-11-29 14:06:48'),
(185, 'OverAPI.com', 'OverAPI.com 是一个收集所有代码语言api文档的网站！', 'https://overapi.com/favicon.ico', 'https://overapi.com', '15', NULL, 100, 1, 4551, 1703, NULL, '2023-11-29 14:09:12', NULL, '2023-11-29 14:09:13'),
(186, 'httpbin', '用于测试 HTTP库，你可以向他发送请求，然后他会按照指定的规则将你的请求返回（查看你所发送请求中的信息）。', 'http://t3.gstatic.cn/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&size=128&url=http://httpbin.org', 'http://httpbin.org/', '15', NULL, 100, 1, 3865, 2214, NULL, '2023-11-29 14:11:55', NULL, '2023-11-29 14:11:56'),
(187, 'Dashboard – Vercel', 'Vercel 提供了一种无缝的部署流程，使开发人员能够将应用程序迅速推送到生产环境。通过 Vercel 的 Git 集成，您只需将代码推送到您的 Git 存储库，Vercel 将自动构建和部署应用程序。这一过程称为 "自动部署"。', 'https://assets.vercel.com/image/upload/front/vercel/twitter-card.png', 'https://vercel.com/dashboard', '15', NULL, 100, 1, 4980, 2751, NULL, '2023-11-29 14:14:36', NULL, '2023-11-29 14:14:37'),
(188, 'TestSize.com ', '用于测试自适应网站分辨率适配', 'http://t3.gstatic.cn/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&size=128&url=http://testsize.com', 'http://testsize.com/', '15', NULL, 100, 1, 4318, 4837, NULL, '2023-11-29 14:16:54', NULL, '2023-11-29 14:16:55'),
(189, '刀客源码', '刀客源码是一个专业的网络资源分享平台,提供各种PHP源码、网站源码、游戏源码、模板插件、软件工具、网络教程、活动线报等,为中国站长提供一站式资源下载。', 'https://www.dkewl.com/statics/skin/images/favicon.ico', 'https://www.dkewl.com/', '17', NULL, 100, 1, 2730, 4642, NULL, '2023-11-29 14:18:38', NULL, '2023-11-29 14:18:39'),
(190, '小高网', '原小高教学网_精品源码下载_专注资源收集分享_最新技术QQ资源收集平台_网络技术爱好者的栖息之地_让我们的技术更上一层楼。专注于资源收集与活动分享_小高教学网精品源码_技术教程分享。', 'https://www.xgw5.com/favicon.ico', 'https://www.xgw5.com/', '17', NULL, 100, 1, 3018, 3166, NULL, '2023-11-29 14:20:23', NULL, '2023-11-29 14:20:23'),
(191, 'Bootstrap模板', 'Bootstrap模板库—汇聚国内外顶尖Bootstrap模板设计作品和Bootstrap插件，并提供网站模板在线预览及源码下载。全球顶尖网页前端设计作品，高效套用模板，尽在bootstrapmb.com', 'https://www.bootstrapmb.com/content/images/fav.png', 'https://www.bootstrapmb.com/', '17', NULL, 100, 1, 1773, 4872, NULL, '2023-11-29 14:21:37', NULL, '2023-11-29 14:21:38'),
(192, '素材下载', '站长素材是一家大型综合设计类素材网站，提供高清图片素材、PSD素材、PPT模板、网页模板、脚本素材、简历模板、矢量素材、3D素材、酷站欣赏、Flash动画等设计素材免费下载和在线预览服务。', 'https://sc.chinaz.com/favicon.ico', 'https://sc.chinaz.com/', '1,18', NULL, 100, 1, 3538, 1574, NULL, '2023-11-29 14:22:09', 'admin', '2023-11-30 08:53:31'),
(193, '人人站CMS', '人人站CMS(rrzcms)是一款开源的CMS专注于企业网站建设的免费建站系统,系统以免费、安全、易用为宗旨，可免费下载企业网站模板，各类实用的rrzcms企业网站插件.用人人站建站安全快速简单.', 'http://t3.gstatic.cn/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&size=128&url=http://www.rrzcms.com', 'http://www.rrzcms.com/', '14,17', NULL, 100, 1, 2758, 4067, NULL, '2023-11-29 14:27:26', NULL, '2023-11-29 14:27:27'),
(194, '韩小韩API接口站 - 免费API数据接口调用服务平台', '韩小韩api接口 - 一个免费的api接口网站。', 'https://api.vvhan.com/favicon.ico', 'https://api.vvhan.com/', '15', NULL, 100, 1, 3560, 4099, NULL, '2023-11-29 16:12:28', NULL, '2023-11-29 16:12:28'),
(195, 'jQuery插件库', '本站致力于收集jQuery插件和提供各种jQuery特效的详细使用方法,在线预览，jQuery插件下载及教程', 'https://www.jq22.com/favicon.ico', 'https://www.jq22.com/index.aspx', '15,17', NULL, 100, 1, 4817, 3284, NULL, '2023-11-29 16:14:02', NULL, '2023-11-29 16:14:02'),
(196, '路羽博客-收藏有价值的资源', '路羽博客_收藏有价值的资源', 'https://www.luyuz.cn/content/templates/luyu_fee/static/img/favicon.ico', 'https://www.luyuz.cn/', '17', NULL, 100, 1, 3970, 5000, NULL, '2023-11-29 16:22:03', NULL, '2023-11-29 16:22:03'),
(197, '程序员盒子-最适合初学者的免费编程工具+资源社区', '程序员盒子 (coderutil)-最适合初学者的编程工具资源社区，丰富的在线工具网址大全、高质量的技术博文分享、火爆的程序员交友讨论社区、完全免费开发API接口、海量免费程序员学习资料电子书下载网站。技术架构采用前后端分离、基于SpringBoot、SpringCloud分布式微服务架构设计、MySQL&Redis NoSQl数据高性能缓存服务架构。', 'http://coderutil.oss-cn-beijing.aliyuncs.com/bbs-image/file_bf2d601636884a37bb1d4bce32160254.png', 'https://www.coderutil.com/', '15,17', NULL, 100, 1, 4588, 2939, NULL, '2023-11-29 16:27:28', NULL, '2023-11-29 16:27:29'),
(198, '小K网-资源分享', '小K网专注于免费提供最新的QQ技术分享拥有独特领域的游戏资源,专业负责人掌控QQ活动动态,多方面性质资源分享,免费源码交流学习基地,绿色、安全、搞笑的软件基地.', 'http://t3.gstatic.cn/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&size=128&url=https://xkwo.com', 'https://xkwo.com/index.html', '17', NULL, 100, 1, 2934, 4352, NULL, '2023-11-29 16:32:53', NULL, '2023-11-29 16:32:54'),
(199, '首页 - FontAwesome 字体图标中文Icon', 'Fontawesome中文版webfont,是一款基于css框架的网页字体图标库，它完全免费', 'http://t3.gstatic.cn/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&size=128&url=https://fontawesome.com.cn', 'https://fontawesome.com.cn/', '16', NULL, 100, 1, 4456, 4225, NULL, '2023-11-29 16:37:36', NULL, '2023-11-29 16:37:36'),
(200, 'uiverse.io', 'CSS Buttons各类按钮样式', 'https://uiverse.io/favicon-32x32.png', 'https://cssbuttons.io/', '16', NULL, 100, 1, 2757, 3110, NULL, '2023-11-29 16:40:04', 'admin', '2023-11-29 16:40:37'),
(201, 'css Hover', 'CSS 鼠标悬浮动画', 'https://ianlunn.github.io/Hover/hover.jpg', 'https://ianlunn.github.io/Hover/', '16', NULL, 100, 1, 2280, 4073, NULL, '2023-11-29 16:42:27', NULL, '2023-11-29 16:42:27'),
(202, 'CSS shadow ', '拟物风格UI CSS shadow', 'https://neumorphism.io/favicon.ico', 'https://neumorphism.io/', '16', NULL, 100, 1, 1519, 4380, NULL, '2023-11-29 16:44:20', NULL, '2023-11-29 16:44:21'),
(203, 'Smooth Shadow', 'Smooth Shadow阴影生成器', 'https://shadows.brumm.af/favicon.svg', 'https://shadows.brumm.af/', '16', NULL, 100, 1, 1842, 1570, NULL, '2023-11-29 16:46:05', 'admin', '2023-11-29 16:46:33'),
(204, 'Whirl', 'css 加载动画', 'https://whirl.netlify.app/favicon.ico', 'https://whirl.netlify.app/', '16', NULL, 100, 1, 4326, 4916, NULL, '2023-11-29 16:47:48', NULL, '2023-11-29 16:47:48'),
(205, 'Layoutit Grid', '快速设计网页布局，并获取HTML和CSS代码。直观地学习CSS网格，并使用我们的交互式CSS网格生成器构建网页布局。', 'https://grid.layoutit.com/img/icons/icon-128x128.png', 'https://grid.layoutit.com/', '16', NULL, 100, 1, 3102, 2765, NULL, '2023-11-29 16:50:32', NULL, '2023-11-29 16:50:32'),
(206, 'CSS Grid Generator', 'CSS Grid Generator，在线网格布局代码生成预览', 'https://cssgrid-generator.netlify.app/favicon.ico', 'https://cssgrid-generator.netlify.app/', '16', NULL, 100, 1, 3018, 1793, NULL, '2023-11-29 16:52:00', NULL, '2023-11-29 16:52:01'),
(207, '免费的渐变背景', '欢迎来到color.oulu.me，这里有180个美丽的线性CSS3渐变样式和图片，由一流设计师策划创作，完全免费复制下载。', 'http://color.oulu.me/favicon.ico', 'http://color.oulu.me/', '16', NULL, 100, 1, 1914, 2691, NULL, '2023-11-29 16:52:51', NULL, '2023-11-29 16:52:51'),
(208, 'Fancy Border Radius Generator', '生成器生成具有CSS3边界半径的有机形状', 'https://9elements.github.io/fancy-border-radius/apple-touch-icon.png', 'https://9elements.github.io/fancy-border-radius/', '16', NULL, 100, 1, 2712, 3989, NULL, '2023-11-29 16:54:32', NULL, '2023-11-29 16:54:33'),
(209, 'Get Waves', '一个免费的SVG波形生成器，为您的下一个网页设计制作独特的SVG波形。选择一条曲线，调整复杂性，随机化！', 'https://getwaves.io/favicon-32x32.png?v=f13a1a2e88a9720e746d5561039d3f5f', 'https://getwaves.io/', '16', NULL, 100, 1, 3306, 3066, NULL, '2023-11-29 16:56:32', NULL, '2023-11-29 16:56:32'),
(210, 'Animista', 'Animista是一个CSS动画库，您可以在这里播放现成的CSS动画集，并只下载您将要使用的动画。', 'https://animista.net/favicon.ico', 'https://animista.net/play/', '16', NULL, 100, 1, 3911, 1857, NULL, '2023-11-29 16:57:36', 'admin', '2023-11-29 16:57:42'),
(211, 'animastore', 'css各种动画效果', '', 'http://guowc.github.io/animastore/', '16', NULL, 100, 1, 3053, 4692, NULL, '2023-11-29 16:58:43', NULL, '2023-11-29 16:58:44'),
(212, 'adobe调色板', '使用色轮或图像创建调色板，浏览Adobe color社区中的数千种颜色组合。', '', 'https://color.adobe.com/zh/', '19', NULL, 100, 1, 2300, 2925, NULL, '2023-11-29 17:40:54', 'admin', '2023-11-30 08:37:39'),
(213, '美叶-优质设计内容推荐平台', '美叶，优质设计内容推荐平台。向设计从业者，推介不同设计细分领域的杰出代表。收集和归类优质设计内容，为设计师创作，提供有价值的灵感参照。助力设计，提升效率，为设计师研发高效能设计工具。', 'https://icon.meiye.art/favicon.ico', 'https://www.meiye.art/', '18', NULL, 1, 1, 2726, 3357, NULL, '2023-11-30 08:24:36', 'admin', '2023-11-30 08:25:50'),
(214, 'Material Palette', '选择您最喜欢的颜色，并得到您的材质设计调色板生成和下载。', 'https://www.materialpalette.com/assets/favicon-0f3eb1b9f6d525e848b1dca6db1cabd2a3e9e843749cb9ad72222b80ab9fdf19.ico', 'https://www.materialpalette.com/', '19', NULL, 100, 1, 3605, 2955, NULL, '2023-11-30 08:26:37', 'admin', '2023-11-30 08:38:15'),
(215, '中国传统颜色手册', '中国色，中国风，中国传统颜色，设计，Chinese color cheat sheet online', 'https://colors.ichuantong.cn/apple-touch-icon.png', 'https://colors.ichuantong.cn/', '19', NULL, 100, 1, 2461, 1938, NULL, '2023-11-30 08:27:21', 'admin', '2023-11-30 08:37:26'),
(216, 'ColorSpace', '我们帮助您找到完美的配色方案为您的下一个项目！只需输入一个颜色，并生成大量的调色板，配色方案和更多！', 'https://mycolor.space/favicon5.png', 'https://mycolor.space/', '19', NULL, 100, 1, 4308, 3725, NULL, '2023-11-30 08:28:39', 'admin', '2023-11-30 08:38:03'),
(217, 'CSS Gradient', '作为一个免费的 css 渐变生成器工具，这个网站可以让你为你的网站、博客或社交媒体配置文件创建一个丰富多彩的渐变背景。', 'http://t3.gstatic.cn/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&size=128&url=https://cssgradient.io', 'https://cssgradient.io/', '16,19', NULL, 100, 1, 4200, 4827, NULL, '2023-11-30 08:29:51', 'admin', '2023-11-30 08:37:51'),
(218, 'Eva Design', '使用深度学习算法生成彩色托盘', 'https://colors.eva.design/favicon.ico', 'https://colors.eva.design/', '19', NULL, 100, 1, 3031, 2678, NULL, '2023-11-30 08:35:16', 'admin', '2023-11-30 08:37:47'),
(219, '配色卡_色彩搭配_配色工具_色彩组合', '配色卡，简单好用的配色网站，专注于配色色彩领域，拥有超多经典、时尚、新锐配色组合，让色彩搭配不再难', 'https://www.peiseka.com/favicon.png', 'https://www.peiseka.com/', '19,18', NULL, 98, 1, 2795, 4440, NULL, '2023-11-30 08:36:05', 'admin', '2023-11-30 08:37:56'),
(220, 'Haikei', '一个基于网络的设计工具，为网站，社会媒体，博客文章，桌面和移动壁纸，海报，和更多独特的 SVG 设计资产！我们的生成器允许您发现、定制、随机化和导出可生成的 SVG 设计资产，以便随时与您喜爱的设计工具一起使用。', 'https://haikei.app/haikei-cover.png', 'https://app.haikei.app/', '18', NULL, 100, 1, 1816, 4762, NULL, '2023-11-30 09:09:53', NULL, '2023-11-30 09:09:53'),
(221, 'AlteredQualia', 'WebGL 实验，计算机图形学，信息可视化，联系，推特，gitHub。', 'http://t3.gstatic.cn/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&size=128&url=https://alteredqualia.com', 'https://alteredqualia.com/', '18', NULL, 100, 1, 2858, 2007, NULL, '2023-11-30 09:12:25', NULL, '2023-11-30 09:12:25'),
(222, '即时设计 - 可实时协作的专业 UI 设计工具', '即时设计是一款支持在线协作的专业级 UI 设计工具，支持 Sketch、Figma、XD 格式导入，海量优质设计资源即拿即用。支持创建交互原型、获取设计标注，为产设研团队提供一站式协同办公体验。', 'https://img.js.design/assets/img/60c0446dfbc9478b602e15f2.png', 'https://js.design/home', '1,18', NULL, 99, 1, 3462, 2786, NULL, '2023-11-30 09:13:38', NULL, '2023-11-30 09:13:39'),
(223, '致美化 - 最专业的视觉美化交流平台', '致美化是国内最专业的视觉美化研究平台，聚集了超过50万的活跃用户，你可以在此个性化你的设备，探索及下载丰富多彩的电脑主题、壁纸、图标、皮肤等酷炫的美化素材及教程。', 'http://t3.gstatic.cn/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&size=128&url=https://zhutix.com', 'https://zhutix.com/', '18,7,8', NULL, 100, 1, 2046, 3873, NULL, '2023-11-30 09:14:17', 'admin', '2023-11-30 09:14:30'),
(224, 'Iconshock', '免费图标和优质图标包。平面图标，材质图标，字形图标，iOS 图标，字体图标，以及更多的设计样式。矢量文件，包括 PNG 和 SVG 图标。为应用程序、网络或社交媒体项目做好准备。', 'https://www.iconshock.com/img/favicon.ico', 'https://www.iconshock.com/svg-icons/', '3', NULL, 100, 1, 4724, 3500, NULL, '2023-11-30 09:15:56', NULL, '2023-11-30 09:15:57'),
(225, 'ManyPixels', '在许多像素设计画廊发现各种各样令人惊叹的插图。以视觉的光辉加强你的设计！', 'https://assets-global.website-files.com/63a9cb71c629474d4ae334b9/63ac68e5916d9b5c5a24a999_Favicon%201.png', 'https://www.manypixels.co/gallery', '20', NULL, 100, 1, 1831, 4156, NULL, '2023-11-30 09:18:49', NULL, '2023-11-30 09:18:50'),
(226, 'unDraw', '设计项目与开源插图的任何想法，你可以想象和创造。创建美丽的网站，产品和应用程序与您的颜色，免费。', 'https://undraw.co/favicon.ico', 'https://undraw.co/illustrations', '20', NULL, 100, 1, 3286, 2461, NULL, '2023-11-30 09:19:43', NULL, '2023-11-30 09:19:44'),
(227, 'IRA Design', '建立你自己的惊人的插图。', 'https://iradesign.io/assets/img/apple-icon.png', 'https://iradesign.io/', '20', NULL, 100, 1, 4448, 2854, NULL, '2023-11-30 09:20:44', NULL, '2023-11-30 09:20:44'),
(228, '3dbay', '世界上最大的免费3D 图像收集为您服务！从我们的广泛选择高品质，免版税的3D 插图和创建您的设计项目轻松。', 'http://t3.gstatic.cn/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&size=128&url=https://3dicons.co', 'https://3dbay.io/', '20', NULL, 100, 1, 2928, 4580, NULL, '2023-11-30 09:22:45', NULL, '2023-11-30 09:22:45'),
(229, 'Freepik', '数百万免费图形资源。视频。所有你需要的创意项目', 'https://fps.cdnpk.net/favicons/favicon.ico', 'https://www.freepik.com/', '7', NULL, 100, 1, 2111, 2318, NULL, '2023-11-30 09:24:14', NULL, '2023-11-30 09:24:14'),
(230, '字由-让用字更自由', '字由是为设计师量身定做的一款字体下载管理工具。这里收集了国内外上千款精选字体，不仅让你轻松、自由和高效的使用字体，还为你展示了每款字体的详细信息和精选的字体文章。字由将成为你设计中的好帮手，让你领略字体在设计中的更多精彩。', 'https://www.hellofont.cn/favicon.ico', 'https://www.hellofont.cn/home', '18', NULL, 100, 1, 3759, 3340, NULL, '2023-11-30 09:25:16', NULL, '2023-11-30 09:25:17'),
(231, '猫啃网', '猫啃网致力于与大家分享无版权问题的免费商用字体信息，欢迎大家常来逛逛。', 'https://www.maoken.com/favicon.ico', 'https://www.maoken.com/', '18', NULL, 100, 1, 3923, 4593, NULL, '2023-11-30 09:25:40', NULL, '2023-11-30 09:25:41'),
(232, '找字网', '提供中英文免费字体下载、手写字体下载、书法字体下载、艺术字体下载、手机字体下载预览服务！字体商用在线全自动授权！老牌专业字体市场、字体网站。', 'https://www.zhaozi.cn/favicon.ico', 'https://www.zhaozi.cn/s/all/ttf/', '18', NULL, 100, 1, 2695, 1698, NULL, '2023-11-30 09:26:09', NULL, '2023-11-30 09:26:09'),
(233, '字体chinaz', '字体库提供,中文字体下载,英文字体下载,书法字体下载,繁体字体下载,艺术字体下载,广告字体下载,方正字体下载,草书字体下载,毛笔字体下载,字体设计下载,书法字体下载,字体库,等字体免费下载', 'https://font.chinaz.com/favicon.ico', 'https://font.chinaz.com/', '18', NULL, 100, 1, 2406, 1934, NULL, '2023-11-30 09:27:13', NULL, '2023-11-30 09:27:14'),
(234, '语雀', '优雅高效的在线文档编辑与协同工具，让每个企业轻松拥有文档中心，阿里巴巴集团内部使用多年，众多中小企业首选。主流 Office 文件全兼容，多人协同，轻松拥有团队知识库。企业文档中心化管理，各类文档井然有序，独立域名，随时随地安全获取。语雀致力于帮助每一个个体与企业，都拥有珍贵的知识财富。写文档，就用语雀！', 'https://mdn.alipayobjects.com/huamei_0prmtq/afts/img/A*sRUdR543RjcAAAAAAAAAAAAADvuFAQ/original', 'https://www.yuque.com/', '23', NULL, 100, 1, 4454, 4466, NULL, '2023-11-30 09:33:20', NULL, '2023-11-30 09:33:21'),
(235, '第一PPT', '第一PPT模板网提供各类PPT模板免费下载，PPT背景图，PPT素材，PPT背景，免费PPT模板下载，PPT图表，精美PPT下载，PPT课件下载，PPT背景图片免费下载；', 'https://www.1ppt.com/favicon.ico', 'https://www.1ppt.com/', '23', NULL, 100, 1, 3969, 4947, NULL, '2023-11-30 09:51:55', NULL, '2023-11-30 09:51:56'),
(236, 'GitMind · 思乎', 'GitMind（思乎）是一款全平台 在线思维导图脑图架构图制作软件工具，支持手机手机思维导图，Windows/Mac/L多平台操作及内容同步。它提供有海量的架构图，流程图、思维导图模板可供用户直接使用，支持在线制作流程图、思维导图、组织结构图、类图、用例图、ER图、网络拓扑图以及UML图等十多种图形。', 'https://qncdn.aoscdn.com/astro/gitmind/_astro/favicon-32@32w.0c16987d.png', 'https://gitmind.cn/', '23', NULL, 100, 1, 4327, 1791, NULL, '2023-11-30 09:52:41', NULL, '2023-11-30 09:52:42'),
(237, 'MSDN', ' 我告诉你 - 做一个安静的工具站，Windows 镜像资源，开发工具等', 'http://t3.gstatic.cn/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&size=128&url=https://msdn.itellyou.cn', 'https://msdn.itellyou.cn/', '23', NULL, 100, 1, 4979, 4018, NULL, '2023-11-30 09:54:03', NULL, '2023-11-30 09:54:04'),
(238, '钉钉开放平台', '钉钉开放平台提供丰富的开放能力和成熟的合作伙伴合作机制，助力合作伙伴在钉钉平台上构建繁荣的企业数字化办公体系，陪伴企业共同向数字化前进。', 'https://img.alicdn.com/imgextra/i3/O1CN01WMvMRG1ks3Ixc9x1v_!!6000000004738-55-tps-32-32.svg', 'https://open.dingtalk.com/', '23', NULL, 100, 1, 3652, 4708, NULL, '2023-11-30 09:54:56', NULL, '2023-11-30 09:54:56'),
(239, '站酷ZCOOL', '站酷ZCOOL，中国设计师互动平台。深耕设计领域十五年，站酷聚集了1600万设计师、摄影师、插画师、艺术家、创意人，设计创意群体中具有较高的影响力与号召力。', 'https://static.zcool.cn/git_z/z/site/favicon.ico', 'https://www.zcool.com.cn/', '18', NULL, 99, 1, 4081, 4784, NULL, '2023-11-30 09:56:22', NULL, '2023-11-30 09:56:23'),
(240, '天行数据TianAPI', '天行数据TianAPI开发者API数据平台天聚数行，在这里您可以免费且轻松的调用各种API数据接口用于系统软件、应用App、网站、小程序开发等。', 'https://www.tianapi.com/favicon.ico', 'https://www.tianapi.com/', '12', NULL, 100, 1, 3175, 3525, NULL, '2023-11-30 09:58:16', NULL, '2023-11-30 09:58:17'),
(241, 'FlowUs 息流 - 新一代生产力工具', '以云端笔记为载体，配合在线文档、知识库、文件夹等多形态功能，为个人和团队提供数字信息管理与协同的一站式工作中心。', 'https://cdn.allflow.cn/assets/favicon.png', 'https://flowus.cn/product', '23', NULL, 100, 1, 3098, 3417, NULL, '2023-11-30 09:58:51', NULL, '2023-11-30 09:58:52'),
(242, '字节跳动静态资源公共库', '字节跳动静态资源库支持多协议、资源动态拼接、快速检索及资源的动态更新,安全、稳定、实时。', 'http://cdn.bytedance.com/src/res/favicon.png', 'http://cdn.bytedance.com/', '14,15', NULL, 100, 1, 2788, 2190, NULL, '2023-11-30 10:00:23', NULL, '2023-11-30 10:00:23'),
(243, '酷库博客 ', '酷库博客专注于活动，软件库，网站源码，教程及实用软件，总之就是网络那些事。', 'https://www.zxki.cn/content/uploadfile/tpl_options//basic-favicon.png', 'https://www.zxki.cn/', '17', NULL, 100, 1, 4590, 4376, NULL, '2023-11-30 10:01:54', NULL, '2023-11-30 10:01:54'),
(244, '五百丁简历', '五百丁创办于2014年，目前已有全球超过800万精英用户正在使用，是国内使用人数最多的免费简历制作工具，智能-高效-便捷-实用，广受求职者和专业HR喜爱，平台汇集了海量优秀行业范例，精美模板，可以满足求职者的各类简历需求，有效提升求职成功率，做好简历就上五百丁！', 'https://www.500d.me/favicon.ico', 'https://www.500d.me/', '23', NULL, 100, 1, 3110, 4425, NULL, '2023-11-30 10:12:22', NULL, '2023-11-30 10:12:22'),
(245, '即时工具', '致力开发即用即走型在线工具，无需客户端在线一键使用。拥有视频工具、音频工具、图片工具、 PDF工具、办公辅助、设计工具、文本工具、数字工具、加密工具、单位转换等等工具。同时拥有良好的用户体验，为您的工作学习提升效率！', 'https://www.67tool.com/favicon.ico', 'https://www.67tool.com/', '12,23', NULL, 100, 1, 4290, 3178, NULL, '2023-11-30 10:13:32', NULL, '2023-11-30 10:13:33'),
(246, 'SMS-Activate ', '使用SMS-Activate的虚拟号码来在线接受短信。可以在600个多服务注册的一次性号码。短信即刻送到给你，低价', 'http://t3.gstatic.cn/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&size=128&url=https://sms-activate.org', 'https://sms-activate.org/cn', '23,12', NULL, 100, 1, 1517, 3556, NULL, '2023-11-30 10:15:22', NULL, '2023-11-30 10:15:22'),
(247, '云音乐视频解析下载', '网易云音乐视频在线解析下载工具支持解析任何网易云音乐视频,包括MV、音乐短视频、好友动态视频等,并支持下载视频和视频封面到本地,手机和电脑上都适用.可谓是最简单的网易云音乐MV(视频)下载方法.', 'https://iiilab.nos-eastchina1.126.net/video/favicon.ico', 'https://yunyinyue.iiilab.com/', '12', NULL, 100, 1, 4728, 4468, NULL, '2023-11-30 10:16:06', NULL, '2023-11-30 10:16:07'),
(248, '语录网', '语录网提供最新的励志语录经典短句、个性说说心情短语以及名人名言名句大全。', 'https://www.chinansn.com/static/logo.png', 'https://www.chinansn.com/', '22', NULL, 100, 1, 3155, 4375, NULL, '2023-11-30 10:24:00', 'admin', '2023-11-30 10:24:15'),
(249, '一帧秒创官网', '一帧秒创是基于秒创AIGC引擎的智能AI内容生成平台，包含AI数字人、AI帮写、AI视频、AI作画等AIGC工具，可将百家号、公众号、头条号、搜狐号、新浪微博、小红书等文章一键转视频，一键生成数字人播报视频，为企业及自媒体提供一站式视频生产，全面提升内容创作效率。', 'https://aigc.yizhentv.com/favicon.ico', 'https://aigc.yizhentv.com/', '22', NULL, 100, 1, 3908, 4914, NULL, '2023-11-30 10:25:19', 'admin', '2023-11-30 10:25:44'),
(250, '混剪侠', '剪辑师专用的网址导航，包含高清剪辑视频素材、音效音乐素材、文案图片素材等', 'https://www.yugaopian.cn/wp-content/uploads/2023/07/hjx-favicon.png', 'https://www.yugaopian.cn/', '22', NULL, 100, 1, 4346, 1989, NULL, '2023-11-30 10:26:28', 'admin', '2023-11-30 10:31:52'),
(251, '七喵解说文案网', '七喵电影解说文案网是国内最大的电影解说文案素材库平台,每天更新大量影视解说素材资源，提供电影解说文案、电视剧解说文案、动漫解说文案、电影解说教程等类型素材，是解说创作者用户交互的地。', 'https://www.7mjs.com/favicon.ico', 'https://www.7mjs.com/', '22', NULL, 100, 1, 2407, 4567, NULL, '2023-11-30 10:27:43', NULL, '2023-11-30 10:27:43'),
(252, '剧本网', '剧本网,编剧剧本投稿，剧本供求，剧本征集，版权交易首选网站！影视剧本，话剧剧本，小品剧本，动画剧本，短剧本，微电影剧本，剧本格式，剧本范文，相声剧本，电影剧本，电视剧剧本，剧本杀剧本，剧本教程；原创剧本，剧本素材，微电影，微动漫，短视频，笑话大全。', 'https://www.juben98.com/favicon.ico', 'https://www.juben98.com/', '22', NULL, 100, 1, 3615, 2872, NULL, '2023-11-30 10:29:02', NULL, '2023-11-30 10:29:02'),
(253, '考拉新媒体导航', '考拉新媒体导航收录了100+个新媒体人必备工具，公众号排版、无版权图库、裂变增长、社群运营、抖音数据分析、创意H5；收录200+篇新媒体干货，用户增长、活动运营、抖音涨粉、数据分析、新媒体书单...', 'https://www.kaolamedia.com/favicon.ico', 'https://www.kaolamedia.com/', '22', NULL, 100, 1, 2018, 3473, NULL, '2023-11-30 10:29:45', NULL, '2023-11-30 10:29:46'),
(254, '电影天堂', 'content="最好的迅雷电影下载网，分享最新电影，高清电影、综艺、动漫、电视剧等下载！"', 'https://dytt.dytt8.net/favicon.ico', 'https://dytt.dytt8.net/', '22', NULL, 100, 1, 2809, 2128, NULL, '2023-11-30 10:30:52', NULL, '2023-11-30 10:30:53'),
(255, '33台词', '一个好用的电影字幕搜索引擎，轻松搜索台词出现的影片和时间点，是视频创作者的必备工具，是帮助英语学习的利器。', 'https://33.agilestudio.cn/favicon.ico', 'http://33.agilestudio.cn/', '22', NULL, 100, 1, 4213, 2680, NULL, '2023-11-30 10:31:14', 'admin', '2023-11-30 10:31:44'),
(256, '文案狗', '文案狗，给文案狗一点灵感。收集各种中文创意文案，广告语，让您取名，找slogan不再难。', 'http://t3.gstatic.cn/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&size=128&url=http://www.wenangou.com', 'http://www.wenangou.com/', '22', NULL, 100, 1, 2764, 4279, NULL, '2023-11-30 10:31:38', NULL, '2023-11-30 10:31:39'),
(257, '句子控', '句子控是一个随身摘抄本，在这里您可以随时发布、收藏和找到您喜欢的句子，句子控汇集众多名人名言、经典名句、电影台词和歌词。 同时，你还可以在这里找到那些与你喜欢同样句子的人，与趣味相投之士结识。', 'https://www.juzikong.com/favicon.ico', 'https://www.juzikong.com/', '22', NULL, 100, 1, 4603, 1675, NULL, '2023-11-30 10:32:51', NULL, '2023-11-30 10:32:51'),
(258, '锤子简历', '锤子简历，是全国专业的简历制作平台，拥有海量精美简历模板下载，专业简历在线制作，简历代写等一站式求职增值服务，智能-高效-便捷-实用，的满足求职者的简历制作需求，最大化提升求职成功率，做好简历就来锤子简历！', 'http://t3.gstatic.cn/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&size=128&url=https://www.100chui.com', 'https://www.100chui.com/', '23', NULL, 100, 1, 3570, 4323, NULL, '2023-11-30 10:37:05', NULL, '2023-11-30 10:37:06'),
(259, 'Text To Speech - 在线文本转语音', 'Text To Speech，文本转语音，文本朗读，让机器能够说话。构建自然说话的应用和服务，从 147 种语言和变体中选择 456 种语音。借助高表现力和类似人类的神经语音，让你的方案生动起来。', 'https://www.text-to-speech.cn/img/speech.png', 'https://www.text-to-speech.cn/', '12,22', NULL, 100, 1, 2403, 4550, NULL, '2023-11-30 10:40:52', NULL, '2023-11-30 10:40:53'),
(260, '自媒体家园', '自媒体家园，助力自媒体从业者能力提升、帮助上班族副业发展。做最懂你的自媒体导航网站！学自媒体，找素材，找灵感，找教程，就来自媒体导航网！', 'https://www.zmthome.com/wp-content/uploads/2020/05/favicon.png', 'https://www.zmthome.com/sitelist/zhishikepu/', '22', NULL, 100, 1, 3540, 2547, NULL, '2023-11-30 10:42:04', NULL, '2023-11-30 10:42:05'),
(261, 'MikuTools - 一个轻量的工具集合', '一个轻量的工具集合', 'https://okmiku.com/favicon.ico', 'https://okmiku.com/', '12,21', NULL, 100, 1, 4118, 4449, NULL, '2023-11-30 10:44:55', NULL, '2023-11-30 10:44:56'),
(262, '书签地球', '书签地球，中国首家浏览器书签搜索引擎平台。提供浏览器书签分享、在线制作、下载等，让书签动起来，全国最好用的浏览器书签共享平台', 'https://www.bookmarkearth.com/media/img/logo/favicon.ico', 'https://www.bookmarkearth.com/', '23', NULL, 100, 1, 4889, 2598, NULL, '2023-11-30 10:48:17', NULL, '2023-11-30 10:48:18'),
(263, 'AI灵感PPT', '灵感PPT用创作点睛，用AI添彩，一键生成PPT，轻松呈现精彩！', 'https://2xwe.eaglegpt1.com/favicon.ico', 'https://2xwe.eaglegpt1.com/home', '23,24', NULL, 100, 1, 3825, 2828, NULL, '2023-11-30 10:50:09', 'admin', '2023-11-30 11:14:33'),
(264, 'PearAPI', '欢迎来到PearAPI服务页面,本服务由PearNo提供技术支持,永久免费稳定提供各类API服务接口.', 'https://api.pearktrue.cn/favicon.ico', 'https://api.pearktrue.cn/', '12', NULL, 100, 1, 4669, 2859, NULL, '2023-11-30 10:52:57', NULL, '2023-11-30 10:52:57'),
(265, '全栈工具', '在线工具,开发工具,站长工具,短视频去水印,代码格式化、压缩、加密、解密,json格式化,文本比对,cron生成,代码运行,图片转base64,字数统计与排版,短网址生成、还原,正则生成、测试、可视化,中文简繁体转换,进制转换,二维码,图片转换、压缩,github加速,字符串哈希计算,emoji表情,特殊符号大全', 'https://tools.qzxdp.cn/favicon.ico', 'https://tools.qzxdp.cn/', '12,15', NULL, 100, 1, 2287, 4860, NULL, '2023-11-30 10:54:12', NULL, '2023-11-30 10:54:12'),
(266, '大山资源网', '本站资源仅供研究学习请勿商用以及产生法律纠纷本站概不负责！如果侵犯了您的权益请与我们联系', 'https://www.ccoot.com/usr/uploads/logo/basicprofile.png', 'https://www.ccoot.com/', '17,22', NULL, 100, 1, 1936, 4105, NULL, '2023-11-30 10:59:29', 'admin', '2023-11-30 10:59:40'),
(267, ' Cloud TTS', '免费的文字转语音应用程序。键入或粘贴文本，听到它在一个自然的声音发言。支持140种语言，为语言学习者提供卡拉 OK 风格的单词高亮显示功能。', 'https://cloudtts.com/assets/images/favicon.svg', 'https://cloudtts.com/', '22', NULL, 100, 1, 2712, 3246, NULL, '2023-11-30 11:00:27', NULL, '2023-11-30 11:00:28'),
(268, 'Free MP3 Download', '免费MP3下载。将真正的320kbps MP3和FLAC音乐免费下载到您的电脑或智能手机上。', 'https://free-mp3-download.net/img/icon_48.png', 'https://free-mp3-download.net/', '12,23,22', NULL, 100, 1, 3093, 4230, NULL, '2023-11-30 11:01:35', NULL, '2023-11-30 11:01:36'),
(269, 'Free Stock Video', '美丽的视频和片段剪辑，免费商业和个人使用。无版权要求', 'https://free-stock.video/public/291713-32.png', 'https://free-stock.video/', '18', NULL, 100, 1, 3366, 2644, NULL, '2023-11-30 11:02:52', NULL, '2023-11-30 11:02:53'),
(270, '远昔APi接口', '远昔APi接口文档(www.yuanxiapi.cn)旗下远昔科技成立于2021年07月04日,永久免费提供大家调用。', 'https://www.yuanxiapi.cn/favicon.ico', 'https://www.yuanxiapi.cn/', '12,15', NULL, 100, 1, 1621, 2173, NULL, '2023-11-30 11:03:43', NULL, '2023-11-30 11:03:44'),
(271, '水龙头', '每24小时可以免费领取 $1.00, 这是为 AI 开发者提供的.', 'https://faucet.openkey.cloud/favicon.ico', 'https://faucet.openkey.cloud/', '12', NULL, 100, 1, 4504, 3998, NULL, '2023-11-30 11:04:06', NULL, '2023-11-30 11:04:07'),
(272, 'ProcessOn思维导图', 'ProcessOn是一款专业在线作图工具和知识分享社区，提供AI生成思维导图流程图。支持思维导图、流程图、组织结构图、网络拓扑图、鱼骨图、UML图等多种图形，同时可实现人与人之间的实时协作和共享，提升团队工作效率。', 'https://www.processon.com/public_login/favicon.983368c6.ico', 'https://www.processon.com/diagrams', '23', NULL, 100, 1, 4977, 4389, NULL, '2023-11-30 11:04:37', NULL, '2023-11-30 11:04:38'),
(273, '奶酪清单', '各类资源、各类工具、学习教程', 'http://t3.gstatic.cn/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&size=128&url=https://www.runningcheese.cn', 'https://www.runningcheese.cn/', '12,17,23', NULL, 100, 1, 2015, 2411, NULL, '2023-11-30 11:06:01', NULL, '2023-11-30 11:06:01'),
(274, 'ChatGPT - Poe', 'AI问答ChatGPT，需要VPN', 'http://t3.gstatic.cn/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&size=128&url=https://poe.com', 'https://poe.com/ChatGPT', '24', NULL, 100, 1, 4510, 3316, NULL, '2023-11-30 11:09:23', NULL, '2023-11-30 11:09:24'),
(275, '伯乐AI', '聊天学习交流 - 伯乐AI问答', 'https://ai.199.chat/favicon.ico', 'https://ai.199.chat', '24', NULL, 100, 1, 1549, 3302, NULL, '2023-11-30 11:09:54', NULL, '2023-11-30 11:09:54'),
(276, '照夜清的AI小宇宙', '照夜清的AI小宇宙-免费 ChatGpt、国内可使用的 chatgpt镜像、chatgpt 全球可用站点、ChatGpt全球免费可用、Ai、ai 导航。', 'https://zhaoyeqing.cn/images/icon/favicon.ico', 'https://chatgpt-site.zhaoyeqing.cn/', '24', NULL, 99, 1, 3359, 1890, NULL, '2023-11-30 11:12:57', NULL, '2023-11-30 11:12:57'),
(277, '共享ChatGPT', '一些免费的共享ChatGPT账号', '', 'https://chat-shared3.zhile.io/shared.html', '24', NULL, 99, 1, 4873, 3193, NULL, '2023-11-30 11:15:54', NULL, '2023-11-30 11:15:55'),
(278, '文心一言', '百度文心一言大模型AI工具', 'https://nlp-eb.cdn.bcebos.com/logo/favicon.ico', 'https://yiyan.baidu.com/', '24', NULL, 98, 1, 3348, 2160, NULL, '2023-11-30 11:17:35', NULL, '2023-11-30 11:17:36'),
(280, '夸克网盘', '夸克网盘是夸克推出的一款云服务产品，功能包括云存储、高清看剧、文件在线解压、PDF一键转换等。通过夸克网盘可随时随地管理和使用照片、文档、手机资料，目前支持Android、iOS、PC、iPad。', 'https://pan.quark.cn/favicon.ico', 'https://pan.quark.cn/', '23,1', NULL, 1, 1, 1777, 3957, NULL, '2023-11-30 11:20:44', NULL, '2023-11-30 11:20:45'),
(281, '百度网盘-免费云盘丨文件共享软件丨超大容量丨存储安全', '百度网盘为您提供文件的网络备份、同步和分享服务。空间大、速度快、安全稳固，支持教育网加速，支持手机端。注册使用百度网盘即可享受免费存储空间', 'https://nd-static.bdstatic.com/m-static/wp-brand/favicon.ico', 'https://pan.baidu.com/', '23,1', NULL, 2, 1, 2451, 2383, NULL, '2023-11-30 11:21:15', 'admin', '2023-11-30 13:43:05'),
(282, '阿里云盘', '阿里云盘是一款速度快、不打扰、够安全、易于分享的个人网盘，欢迎你来体验。', 'https://img.alicdn.com/imgextra/i2/O1CN01DOYcs71v3B6bOemVM_!!6000000006116-2-tps-512-512.png', 'https://www.aliyundrive.com/', '1,23', NULL, 3, 1, 3065, 3175, NULL, '2023-11-30 13:45:06', NULL, '2023-11-30 13:45:07'),
(283, '蓝奏·云存储', '蓝奏, 上传, 网盘, 网络硬盘, 云盘, 云存储, 网众蓝奏', 'https://pc.woozooo.com/favicon.ico', 'https://pc.woozooo.com/', '23,1', NULL, 4, 1, 1678, 4367, NULL, '2023-11-30 13:46:15', NULL, '2023-11-30 13:46:16');

-- --------------------------------------------------------

--
-- 表的结构 `gy_nav_menus`
--

CREATE TABLE IF NOT EXISTS `gy_nav_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '名称',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `pid` int(11) NOT NULL COMMENT 'pid',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '类型',
  `state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_by` varchar(255) NOT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=25 ;

--
-- 转存表中的数据 `gy_nav_menus`
--

INSERT INTO `gy_nav_menus` (`id`, `name`, `description`, `icon`, `pid`, `type`, `state`, `sort`, `create_time`, `create_by`, `update_time`, `update_by`) VALUES
(1, '热门推荐', '', 'Balloon', 0, 0, 1, 1, '2023-07-26 16:49:27', '', '2023-11-30 09:31:33', 'admin'),
(2, '设计素材', '', 'Brush', 0, 0, 1, 100, '2023-07-26 17:10:21', 'admin', '2023-07-26 17:14:17', 'admin'),
(3, 'icon图标', '', '', 2, 1, 1, 100, '2023-07-26 17:11:03', 'admin', '2023-07-26 17:11:04', ''),
(4, 'Logo设计', '', '', 2, 1, 1, 100, '2023-07-26 17:11:34', 'admin', '2023-07-26 17:11:35', ''),
(5, 'UI设计', '', '', 2, 1, 1, 100, '2023-07-26 17:12:15', 'admin', '2023-07-26 17:12:16', ''),
(6, '高清图片', '', 'LogoCodepen', 0, 0, 1, 100, '2023-07-26 17:14:09', 'admin', '2023-07-26 17:14:22', 'admin'),
(7, '高清图库', '', '', 6, 1, 1, 100, '2023-07-26 17:15:24', 'admin', '2023-07-26 17:15:24', ''),
(8, '高清壁纸', '', '', 6, 1, 1, 100, '2023-07-26 17:15:33', 'admin', '2023-07-26 17:15:33', ''),
(9, '工具网站', '', 'Build', 0, 0, 1, 100, '2023-11-29 08:54:07', 'admin', '2023-11-29 08:54:07', ''),
(10, '图片工具', '', '', 9, 1, 1, 100, '2023-11-29 08:54:22', 'admin', '2023-11-29 08:54:22', ''),
(11, '视频工具', '', '', 9, 1, 1, 100, '2023-11-29 08:54:33', 'admin', '2023-11-29 08:54:33', ''),
(12, '综合工具', '', '', 9, 1, 1, 99, '2023-11-29 10:28:01', 'admin', '2023-11-29 10:30:37', 'admin'),
(13, '前端开发', '', 'Layers', 0, 0, 1, 100, '2023-11-29 10:53:54', 'admin', '2023-11-29 10:53:54', ''),
(14, 'UI框架', '', '', 13, 1, 1, 100, '2023-11-29 10:54:12', 'admin', '2023-11-29 10:55:27', 'admin'),
(15, '代码工具', '', '', 13, 0, 1, 100, '2023-11-29 10:55:18', 'admin', '2023-11-29 10:55:19', ''),
(16, 'CSS库', '', '', 13, 1, 1, 100, '2023-11-29 10:55:54', 'admin', '2023-11-29 10:55:55', ''),
(17, '源码网站', '', '', 13, 1, 1, 100, '2023-11-29 14:17:36', 'admin', '2023-11-29 14:17:37', ''),
(18, '素材资源', '', '', 2, 1, 1, 99, '2023-11-29 17:00:39', 'admin', '2023-11-29 17:00:49', 'admin'),
(19, '颜色搭配', '', '', 2, 1, 1, 100, '2023-11-30 08:36:46', 'admin', '2023-11-30 08:36:46', ''),
(20, '插画素材', '', '', 2, 1, 1, 100, '2023-11-30 09:04:49', 'admin', '2023-11-30 09:04:49', ''),
(21, '日常办公', '', 'HeartCircleSharp', 0, 0, 1, 99, '2023-11-30 09:31:22', 'admin', '2023-11-30 09:31:23', ''),
(22, '自媒体资源', '', '', 21, 1, 1, 100, '2023-11-30 10:18:35', 'admin', '2023-11-30 10:18:35', ''),
(23, '办公资源', '', '', 21, 1, 1, 99, '2023-11-30 10:19:03', 'admin', '2023-11-30 10:19:03', ''),
(24, 'AI工具', '', '', 21, 1, 1, 100, '2023-11-30 11:07:53', 'admin', '2023-11-30 11:07:54', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
