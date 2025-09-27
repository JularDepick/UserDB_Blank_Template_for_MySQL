-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- 主机： 192.168.137.1:2047
-- 生成日期： 2025-09-27 22:31:16
-- 服务器版本： 8.0.19
-- PHP 版本： 7.4.6

--
-- 本数据库模板版权归属1724834368@qq.com
--
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `userdb`
--
CREATE DATABASE IF NOT EXISTS `userdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `userdb`;

-- --------------------------------------------------------

--
-- 表的结构 `actinfo`
--
-- 创建时间： 2025-09-27 13:06:39
--

CREATE TABLE `actinfo` (
  `uid` bigint(16) UNSIGNED ZEROFILL NOT NULL COMMENT '用户ID标识(唯一)',
  `last_act_time` datetime DEFAULT NULL COMMENT '最后活动时间(UTC+0)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='活动信息(高频修改高频访问)';

-- --------------------------------------------------------

--
-- 表的结构 `basicinfo`
--
-- 创建时间： 2025-09-27 13:39:44
--

CREATE TABLE `basicinfo` (
  `uid` bigint(16) UNSIGNED ZEROFILL NOT NULL COMMENT '用户ID标识(唯一)',
  `nickname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '用户昵称',
  `utc_tzcode` tinyint NOT NULL DEFAULT '8' COMMENT '用户UTC时区',
  `gender` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '性别(0保密,1男,2女)',
  `mother_language` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Chinese' COMMENT '第一语言(母语)',
  `second_language` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'English' COMMENT '第二语言'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='基础信息(低频修改高频访问)';

-- --------------------------------------------------------

--
-- 表的结构 `certinfo`
--
-- 创建时间： 2025-09-27 14:19:11
--

CREATE TABLE `certinfo` (
  `uid` bigint(16) UNSIGNED ZEROFILL NOT NULL COMMENT '用户ID标识(唯一)',
  `my_cert_id` tinyint UNSIGNED NOT NULL COMMENT '认证序号(相对于用户ID唯一)',
  `cert_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '认证名称',
  `cert_nature` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '认证性质',
  `cert_profile` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '认证描述',
  `cert_start_time` datetime NOT NULL COMMENT '认证开始时间',
  `cert_deadline` datetime NOT NULL COMMENT '认证失效时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='特殊认证信息(低频修改中高频访问)';

-- --------------------------------------------------------

--
-- 表的结构 `contactinfo`
--
-- 创建时间： 2025-09-27 14:25:04
--

CREATE TABLE `contactinfo` (
  `uid` bigint(16) UNSIGNED ZEROFILL NOT NULL COMMENT '用户ID标识(唯一)',
  `contact_id` tinyint UNSIGNED NOT NULL COMMENT '联系信息序号(相对于用户ID唯一)',
  `contact_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系人姓名',
  `email` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系邮箱',
  `phonenumber` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系电话',
  `country_code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '国家/地区代码',
  `country_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '国家/地区名称',
  `address_detail` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '详细地址',
  `post_code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮政编码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='联系信息(低频修改中低频访问)';

-- --------------------------------------------------------

--
-- 表的结构 `ecardinfo`
--
-- 创建时间： 2025-09-27 14:23:37
--

CREATE TABLE `ecardinfo` (
  `uid` bigint(16) UNSIGNED ZEROFILL NOT NULL COMMENT '用户ID标识(唯一)',
  `ecard_id` tinyint UNSIGNED NOT NULL COMMENT '名片序号(相对于用户ID唯一)',
  `diy_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '自定义内容'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='电子个性名片信息(低频修改中频访问)';

-- --------------------------------------------------------

--
-- 表的结构 `identinfo`
--
-- 创建时间： 2025-09-27 14:14:15
--

CREATE TABLE `identinfo` (
  `uid` bigint(16) UNSIGNED ZEROFILL NOT NULL COMMENT '用户ID标识(唯一)',
  `my_identdoc_id` tinyint UNSIGNED NOT NULL COMMENT '证件序号(相对于用户ID唯一)',
  `identdoc_type` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '证件类型',
  `identdoc_number` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '证件号码',
  `real_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '真实姓名',
  `gender` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '性别',
  `ethnic` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '民族',
  `birthdate` date DEFAULT NULL COMMENT '出生日期',
  `country_code` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户所属国家/地区代码',
  `country_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户所属国家/地区名称',
  `residence_address` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '户籍地址'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='居民身份证件信息(低频修改低频访问)';

-- --------------------------------------------------------

--
-- 表的结构 `logininfo`
--
-- 创建时间： 2025-09-27 13:03:59
--

CREATE TABLE `logininfo` (
  `uid` bigint(16) UNSIGNED ZEROFILL NOT NULL COMMENT '用户ID标识(唯一)',
  `login_token` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '登录令牌',
  `login_token_deadline` datetime DEFAULT NULL COMMENT '登录令牌失效时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间(UTC+0)',
  `last_login_ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '最后登录IP',
  `last_login_location` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '最后登录定位',
  `last_login_device` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '最后登录终端'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='登录信息(中高频修改中高频访问)';

-- --------------------------------------------------------

--
-- 表的结构 `mediainfo`
--
-- 创建时间： 2025-09-27 13:44:25
--

CREATE TABLE `mediainfo` (
  `uid` bigint(16) UNSIGNED ZEROFILL NOT NULL COMMENT '用户ID标识(唯一)',
  `blog` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '个人博客地址',
  `bilibili` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Bilibili个人主页地址',
  `github` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Github个人主页地址',
  `qq` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'QQ号码',
  `wechat` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'WeChat号码',
  `facebook` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Facebook个人主页地址',
  `tiktok` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'TikTok个人主页地址',
  `youtube` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'YouTube个人主页地址'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='社交媒体信息(低频修改中频访问)';

-- --------------------------------------------------------

--
-- 表的结构 `mfainfo`
--
-- 创建时间： 2025-09-27 13:01:05
--

CREATE TABLE `mfainfo` (
  `uid` bigint(16) UNSIGNED ZEROFILL NOT NULL COMMENT '用户ID标识(唯一)',
  `email_vc` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱验证码',
  `email_vc_deadline` datetime DEFAULT NULL COMMENT '邮箱验证码失效时间',
  `phone_vc` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机验证码',
  `phone_vc_deadline` datetime DEFAULT NULL COMMENT '手机验证码失效时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='多因素验证信息(中频修改中频访问)';

-- --------------------------------------------------------

--
-- 表的结构 `organinfo`
--
-- 创建时间： 2025-09-27 13:48:59
--

CREATE TABLE `organinfo` (
  `uid` bigint(16) UNSIGNED ZEROFILL NOT NULL COMMENT '用户ID标识(唯一)',
  `my_organ_id` tinyint UNSIGNED DEFAULT NULL COMMENT '组织序号(相对于用户ID唯一)',
  `organ_name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组织名称',
  `organ_nature` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组织性质',
  `organ_found_time` date DEFAULT NULL COMMENT '组织成立时间',
  `organ_profile` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '组织介绍',
  `organ_country_code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组织所属国家/地区代码',
  `organ_country_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组织所属国家/地区名称',
  `organ_address` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组织所在地',
  `organ_post_code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组织所在地邮政编码',
  `organ_email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组织邮箱',
  `organ_phonenumber` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组织电话',
  `organ_official_website` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组织官方网站',
  `my_position` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组织内职位/身份'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='组织信息(低频修改低频访问)';

-- --------------------------------------------------------

--
-- 表的结构 `preferinfo`
--
-- 创建时间： 2025-09-27 14:26:29
--

CREATE TABLE `preferinfo` (
  `uid` bigint(16) UNSIGNED ZEROFILL NOT NULL COMMENT '用户ID标识(唯一)',
  `prefer_id` smallint UNSIGNED NOT NULL COMMENT '偏好序号(相对于用户ID唯一)',
  `theme` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'light' COMMENT '主题',
  `ui_language` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Chinese' COMMENT '界面语言'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='操作偏好信息(低频修改中低频访问)';

-- --------------------------------------------------------

--
-- 表的结构 `reginfo`
--
-- 创建时间： 2025-09-27 12:59:39
--

CREATE TABLE `reginfo` (
  `uid` bigint(16) UNSIGNED ZEROFILL NOT NULL COMMENT '用户ID标识(唯一)',
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名标识(唯一)',
  `register_time` datetime NOT NULL COMMENT '注册时间(UTC+0)',
  `register_ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '注册IP',
  `register_location` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '注册定位',
  `register_device` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '注册终端'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='注册信息(禁止修改低频访问)';

-- --------------------------------------------------------

--
-- 表的结构 `secinfo`
--
-- 创建时间： 2025-09-27 12:59:26
--

CREATE TABLE `secinfo` (
  `uid` bigint(16) UNSIGNED ZEROFILL NOT NULL COMMENT '用户ID标识(唯一)',
  `password` char(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户密码(SHA-256)',
  `secure_email` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '安全邮箱',
  `secure_phone_countrycode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '86' COMMENT '安全手机号国家代码',
  `secure_phonenumber` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '安全手机号号码',
  `secure_qq` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '绑定QQ(OpenID)',
  `secure_wechat` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '绑定微信(UnionID)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='账户安全信息(低频修改中频访问)';

-- --------------------------------------------------------

--
-- 表的结构 `suiteinfo`
--
-- 创建时间： 2025-09-27 14:27:14
--

CREATE TABLE `suiteinfo` (
  `uid` bigint(16) UNSIGNED ZEROFILL NOT NULL COMMENT '用户ID标识(唯一)',
  `email` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no' COMMENT '配套邮箱注册状态',
  `blog` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no' COMMENT '配套博客注册状态',
  `ai` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no' COMMENT '配套AI注册状态',
  `disk` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no' COMMENT '配套云盘注册状态',
  `music` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no' COMMENT '配套音乐平台注册状态',
  `media` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no' COMMENT '配套社交媒体注册状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='配套功能产品注册状态信息(低频修改中低频访问)';

--
-- 转储表的索引
--

--
-- 表的索引 `actinfo`
--
ALTER TABLE `actinfo`
  ADD UNIQUE KEY `uid` (`uid`);

--
-- 表的索引 `basicinfo`
--
ALTER TABLE `basicinfo`
  ADD UNIQUE KEY `uid` (`uid`);

--
-- 表的索引 `contactinfo`
--
ALTER TABLE `contactinfo`
  ADD UNIQUE KEY `uid` (`uid`);

--
-- 表的索引 `ecardinfo`
--
ALTER TABLE `ecardinfo`
  ADD UNIQUE KEY `uid` (`uid`);

--
-- 表的索引 `identinfo`
--
ALTER TABLE `identinfo`
  ADD UNIQUE KEY `uid` (`uid`);

--
-- 表的索引 `logininfo`
--
ALTER TABLE `logininfo`
  ADD UNIQUE KEY `uid` (`uid`);

--
-- 表的索引 `mediainfo`
--
ALTER TABLE `mediainfo`
  ADD UNIQUE KEY `uid` (`uid`);

--
-- 表的索引 `mfainfo`
--
ALTER TABLE `mfainfo`
  ADD UNIQUE KEY `uid` (`uid`);

--
-- 表的索引 `organinfo`
--
ALTER TABLE `organinfo`
  ADD UNIQUE KEY `uid` (`uid`);

--
-- 表的索引 `preferinfo`
--
ALTER TABLE `preferinfo`
  ADD UNIQUE KEY `uid` (`uid`);

--
-- 表的索引 `reginfo`
--
ALTER TABLE `reginfo`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `username` (`username`);

--
-- 表的索引 `secinfo`
--
ALTER TABLE `secinfo`
  ADD UNIQUE KEY `uid` (`uid`);

--
-- 表的索引 `suiteinfo`
--
ALTER TABLE `suiteinfo`
  ADD UNIQUE KEY `uid` (`uid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
