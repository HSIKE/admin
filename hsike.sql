# Host: 127.0.0.1  (Version 5.0.87-community-nt)
# Date: 2019-02-12 17:34:34
# Generator: MySQL-Front 6.1  (Build 1.26)


#
# Structure for table "articles"
#

DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles` (
  `Id` int(11) NOT NULL auto_increment,
  `type` varchar(255) default NULL COMMENT '文章类型（推荐？）',
  `pid` varchar(255) default NULL COMMENT '所属分类(导航)',
  `title` varchar(255) default NULL COMMENT '文章标题',
  `description` text COMMENT '文章描述',
  `tags` varchar(255) default NULL COMMENT '文章标签',
  `avartar` varchar(255) default NULL COMMENT '缩略图',
  `content` text COMMENT '文章内容',
  `time` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='文章';

#
# Data for table "articles"
#

INSERT INTO `articles` VALUES (1,'recommend','','test','test des','te','test ava','test con','2019-02-12 11:38:11');

#
# Structure for table "navs"
#

DROP TABLE IF EXISTS `navs`;
CREATE TABLE `navs` (
  `Id` int(11) NOT NULL auto_increment,
  `navName` varchar(255) default NULL COMMENT '类名',
  `pid` varchar(255) default NULL COMMENT '父类的Id，顶层为0',
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章分类导航';

#
# Data for table "navs"
#

INSERT INTO `navs` VALUES (1,'CSS','0'),(2,'HTML','0'),(3,'JS','0'),(4,'框架','0'),(5,'Vue','4'),(6,'React','4'),(7,'Angular','4');

#
# Structure for table "users"
#

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `Id` int(11) NOT NULL auto_increment,
  `userName` varchar(255) default NULL COMMENT '用户名',
  `password` varchar(255) default NULL COMMENT '用户密码',
  `email` varchar(255) default NULL COMMENT '用户邮箱',
  `headPic` varchar(1024) default NULL COMMENT '用户头像',
  `state` varchar(255) default NULL COMMENT '账号状态',
  `type` varchar(255) default NULL COMMENT '用户类型',
  `time` timestamp NULL default CURRENT_TIMESTAMP COMMENT '注册时间',
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='网站注册用户信息';

#
# Data for table "users"
#

INSERT INTO `users` VALUES (1,'HSIKE','HS123.hsike..','893008093@qq.com','123131.jpg',NULL,'admin','2019-01-28 09:25:07');

#
# Structure for table "website"
#

DROP TABLE IF EXISTS `website`;
CREATE TABLE `website` (
  `Id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL COMMENT '网站标题',
  `keywords` varchar(255) default NULL COMMENT '网站关键字',
  `description` text COMMENT '网站描述',
  `logo` varchar(255) default NULL COMMENT '网站logo',
  `icon` varchar(255) default NULL COMMENT '网站图标',
  `icp` varchar(255) default NULL COMMENT '备案信息',
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='网站基本信息';

#
# Data for table "website"
#

