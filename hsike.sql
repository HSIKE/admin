# Host: 127.0.0.1  (Version 5.0.87-community-nt)
# Date: 2019-02-13 17:42:38
# Generator: MySQL-Front 6.1  (Build 1.26)


#
# Structure for table "articles"
#

DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles` (
  `Id` int(11) NOT NULL auto_increment,
  `type` varchar(255) default NULL COMMENT '文章类型（推荐？）',
  `pid` varchar(255) default NULL COMMENT '所属分类(导航)',
  `author` varchar(255) default NULL COMMENT '作者',
  `title` varchar(255) default NULL COMMENT '文章标题',
  `description` varchar(10000) default '' COMMENT '文章描述',
  `tags` varchar(255) default NULL COMMENT '文章标签',
  `thumbnail` varchar(255) default NULL COMMENT '缩略图',
  `content` longtext COMMENT '文章内容',
  `time` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='文章';

#
# Data for table "articles"
#

INSERT INTO `articles` VALUES (1,'recommend','3',NULL,'test','test des','te','test ava','test con','2019-02-13 11:37:26'),(2,'normal','js','HSIKE','sss',NULL,'sss','','<p>ssss</p>','2019-02-13 15:14:15'),(3,'recommend','css','HSIKE','CSS选择器优先级',NULL,'css，选择器，优先级','','<p>内容不重要，以后可以改</p>','2019-02-13 15:37:16');

#
# Structure for table "comments"
#

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `Id` int(11) NOT NULL auto_increment,
  `pid` varchar(255) default NULL COMMENT '所属文章的Id',
  `userName` varchar(255) default NULL COMMENT '用户名',
  `email` varchar(255) default NULL COMMENT '邮箱',
  `headPic` varchar(255) default NULL COMMENT '头像',
  `content` longtext COMMENT '内容',
  `time` timestamp NULL default NULL COMMENT '发布时间',
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论';

#
# Data for table "comments"
#


#
# Structure for table "navs"
#

DROP TABLE IF EXISTS `navs`;
CREATE TABLE `navs` (
  `Id` int(11) NOT NULL auto_increment,
  `navName` varchar(255) default NULL COMMENT '类名',
  `value` varchar(255) default NULL COMMENT '索引关键字',
  `pid` varchar(255) default NULL COMMENT '父类的Id，顶层为0',
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='文章分类导航';

#
# Data for table "navs"
#

INSERT INTO `navs` VALUES (1,'CSS','css','0'),(2,'HTML','html','0'),(3,'JavaScript','js','0'),(4,'框架',NULL,'0'),(5,'Vue','  vue','4'),(6,'React','  react','4'),(7,'Angular','  angular','4'),(8,'类库',NULL,'0'),(9,'BootStrap','  bs','8'),(10,'jQuery','  jq','8');

#
# Structure for table "users"
#

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `Id` int(11) NOT NULL auto_increment,
  `userName` varchar(255) default NULL COMMENT '用户名',
  `password` varchar(255) default NULL COMMENT '密码',
  `email` varchar(255) default NULL COMMENT '邮箱',
  `headPic` varchar(255) default NULL COMMENT '头像路径',
  `type` varchar(255) default NULL COMMENT '类型(普通？管理员？)',
  `state` varchar(255) default NULL COMMENT '状态(禁言？)',
  `time` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '资料更新时间',
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "users"
#

INSERT INTO `users` VALUES (1,'HSIKE','HS123.hsike..','893008093@qq.com','http://127.0.0.1:3000/img/avatars/1550028891612.png','admin','','2019-02-13 11:34:51');

#
# Structure for table "website"
#

DROP TABLE IF EXISTS `website`;
CREATE TABLE `website` (
  `Id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL COMMENT '网站标题',
  `keywords` varchar(255) default NULL COMMENT '网站关键字',
  `description` longtext COMMENT '网站描述',
  `logo` varchar(255) default NULL COMMENT '网站logo',
  `icon` varchar(255) default NULL COMMENT '网站图标',
  `icp` varchar(255) default NULL COMMENT '备案信息',
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='网站基本信息';

#
# Data for table "website"
#

