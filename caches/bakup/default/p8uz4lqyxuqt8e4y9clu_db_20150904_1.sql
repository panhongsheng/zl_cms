# ZLCMS bakfile
# version:ZLCMS V9
# time:2015-09-04 12:24:00
# type:ZLCMS
# ZLCMS:http://www.ZLCMS.cn
# --------------------------------------------------------


DROP TABLE IF EXISTS `v9_admin`;
CREATE TABLE `v9_admin` (
  `userid` mediumint(6) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `roleid` smallint(5) DEFAULT '0',
  `encrypt` varchar(6) DEFAULT NULL,
  `lastloginip` varchar(15) DEFAULT NULL,
  `lastlogintime` int(10) unsigned DEFAULT '0',
  `email` varchar(40) DEFAULT NULL,
  `realname` varchar(50) NOT NULL DEFAULT '',
  `card` varchar(255) NOT NULL,
  `lang` varchar(6) NOT NULL,
  PRIMARY KEY (`userid`),
  KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `v9_admin` VALUES('1','admin','62d2ff1e3d42334e6216d628a5051c08','1','7YIwnY','127.0.0.1','1441338504','847@qq.com','1112','','zh-cn');

DROP TABLE IF EXISTS `v9_admin_panel`;
CREATE TABLE `v9_admin_panel` (
  `menuid` mediumint(8) unsigned NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` char(32) DEFAULT NULL,
  `url` char(255) DEFAULT NULL,
  `datetime` int(10) unsigned DEFAULT '0',
  UNIQUE KEY `userid` (`menuid`,`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_admin_role`;
CREATE TABLE `v9_admin_role` (
  `roleid` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `rolename` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`roleid`),
  KEY `listorder` (`listorder`),
  KEY `disabled` (`disabled`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

INSERT INTO `v9_admin_role` VALUES('1','超级管理员','超级管理员','0','0');
INSERT INTO `v9_admin_role` VALUES('2','站点管理员','站点管理员','0','0');
INSERT INTO `v9_admin_role` VALUES('3','运营总监','运营总监','1','0');
INSERT INTO `v9_admin_role` VALUES('4','总编','总编','5','0');
INSERT INTO `v9_admin_role` VALUES('5','编辑','编辑','1','0');
INSERT INTO `v9_admin_role` VALUES('7','发布人员','发布人员','0','0');

DROP TABLE IF EXISTS `v9_admin_role_priv`;
CREATE TABLE `v9_admin_role_priv` (
  `roleid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(30) NOT NULL DEFAULT '',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  KEY `roleid` (`roleid`,`m`,`c`,`a`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_announce`;
CREATE TABLE `v9_announce` (
  `aid` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `content` text NOT NULL,
  `starttime` date NOT NULL DEFAULT '0000-00-00',
  `endtime` date NOT NULL DEFAULT '0000-00-00',
  `username` varchar(40) NOT NULL,
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` smallint(5) unsigned NOT NULL DEFAULT '0',
  `passed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `style` char(15) NOT NULL,
  `show_template` char(30) NOT NULL,
  PRIMARY KEY (`aid`),
  KEY `siteid` (`siteid`,`passed`,`endtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_attachment`;
CREATE TABLE `v9_attachment` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` char(15) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `filename` char(50) NOT NULL,
  `filepath` char(200) NOT NULL,
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `fileext` char(10) NOT NULL,
  `isimage` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isthumb` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `downloads` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uploadtime` int(10) unsigned NOT NULL DEFAULT '0',
  `uploadip` char(15) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `authcode` char(32) NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`),
  KEY `authcode` (`authcode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_attachment_index`;
CREATE TABLE `v9_attachment_index` (
  `keyid` char(30) NOT NULL,
  `aid` char(10) NOT NULL,
  KEY `keyid` (`keyid`),
  KEY `aid` (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_badword`;
CREATE TABLE `v9_badword` (
  `badid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `badword` char(20) NOT NULL,
  `level` tinyint(5) NOT NULL DEFAULT '1',
  `replaceword` char(20) NOT NULL DEFAULT '0',
  `lastusetime` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`badid`),
  UNIQUE KEY `badword` (`badword`),
  KEY `usetimes` (`replaceword`,`listorder`),
  KEY `hits` (`listorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_block`;
CREATE TABLE `v9_block` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `name` char(50) DEFAULT NULL,
  `pos` char(30) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '0',
  `data` text,
  `template` text,
  PRIMARY KEY (`id`),
  KEY `pos` (`pos`),
  KEY `type` (`type`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_block_history`;
CREATE TABLE `v9_block_history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `blockid` int(10) unsigned DEFAULT '0',
  `data` text,
  `creat_at` int(10) unsigned DEFAULT '0',
  `userid` mediumint(8) unsigned DEFAULT '0',
  `username` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_block_priv`;
CREATE TABLE `v9_block_priv` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleid` tinyint(3) unsigned DEFAULT '0',
  `siteid` smallint(5) unsigned DEFAULT '0',
  `blockid` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `blockid` (`blockid`),
  KEY `roleid` (`roleid`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_cache`;
CREATE TABLE `v9_cache` (
  `filename` char(50) NOT NULL,
  `path` char(50) NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`filename`,`path`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `v9_cache` VALUES('mood_program.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \n  array (\n    1 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'震惊\',\n      \'pic\' => \'mood/a1.gif\',\n    ),\n    2 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'不解\',\n      \'pic\' => \'mood/a2.gif\',\n    ),\n    3 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'愤怒\',\n      \'pic\' => \'mood/a3.gif\',\n    ),\n    4 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'杯具\',\n      \'pic\' => \'mood/a4.gif\',\n    ),\n    5 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'无聊\',\n      \'pic\' => \'mood/a5.gif\',\n    ),\n    6 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'高兴\',\n      \'pic\' => \'mood/a6.gif\',\n    ),\n    7 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'支持\',\n      \'pic\' => \'mood/a7.gif\',\n    ),\n    8 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'超赞\',\n      \'pic\' => \'mood/a8.gif\',\n    ),\n    9 => \n    array (\n      \'use\' => NULL,\n      \'name\' => \'\',\n      \'pic\' => \'\',\n    ),\n    10 => \n    array (\n      \'use\' => NULL,\n      \'name\' => \'\',\n      \'pic\' => \'\',\n    ),\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES('category_content.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \'1\',\n);\n?>');
INSERT INTO `v9_cache` VALUES('category_content_1.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \n  array (\n    \'catid\' => \'1\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'1\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'1\',\n    \'catname\' => \'qq群\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'qq\',\n    \'url\' => \'http://phpcms.local\',\n    \'items\' => \'1\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'workflowid\\\' => \\\'\\\',\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'content_ishtml\\\' => \\\'0\\\',\n  \\\'create_to_html_root\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'default\\\',\n  \\\'category_template\\\' => \\\'category\\\',\n  \\\'list_template\\\' => \\\'list\\\',\n  \\\'show_template\\\' => \\\'show\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'presentpoint\\\' => \\\'1\\\',\n  \\\'defaultchargepoint\\\' => \\\'0\\\',\n  \\\'paytype\\\' => \\\'0\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'16\\\',\n)\',\n    \'listorder\' => \'1\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'16\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES('sitelist.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \n  array (\n    \'siteid\' => \'1\',\n    \'name\' => \'默认站点\',\n    \'dirname\' => \'\',\n    \'domain\' => \'http://phpcms.local/\',\n    \'site_title\' => \'PHPCMS演示站\',\n    \'keywords\' => \'PHPCMS演示站\',\n    \'description\' => \'PHPCMS演示站\',\n    \'release_point\' => \'\',\n    \'default_style\' => \'default\',\n    \'template\' => \'default\',\n    \'setting\' => \'array (\n  \\\'upload_maxsize\\\' => \\\'2048\\\',\n  \\\'upload_allowext\\\' => \\\'jpg|jpeg|gif|bmp|png|doc|docx|xls|xlsx|ppt|pptx|pdf|txt|rar|zip|swf\\\',\n  \\\'watermark_enable\\\' => \\\'1\\\',\n  \\\'watermark_minwidth\\\' => \\\'300\\\',\n  \\\'watermark_minheight\\\' => \\\'300\\\',\n  \\\'watermark_img\\\' => \\\'statics/images/water//mark.png\\\',\n  \\\'watermark_pct\\\' => \\\'85\\\',\n  \\\'watermark_quality\\\' => \\\'80\\\',\n  \\\'watermark_pos\\\' => \\\'9\\\',\n)\',\n    \'uuid\' => \'0138bca4-aaa5-11e4-91a0-48d224d1cbf8\',\n    \'url\' => \'http://phpcms.local/\',\n  ),\n  2 => \n  array (\n    \'siteid\' => \'2\',\n    \'name\' => \'s2\',\n    \'dirname\' => \'11\',\n    \'domain\' => \'http://www.ZLCMS.cn/\',\n    \'site_title\' => \'11\',\n    \'keywords\' => \'11\',\n    \'description\' => \'11\',\n    \'release_point\' => \'\',\n    \'default_style\' => \'default\',\n    \'template\' => \'default\',\n    \'setting\' => \'array (\n  \\\'upload_maxsize\\\' => \\\'2000\\\',\n  \\\'upload_allowext\\\' => \\\'jpg|jpeg|gif|bmp|png|doc|docx|xls|xlsx|ppt|pptx|pdf|txt|rar|zip|swf\\\',\n  \\\'watermark_enable\\\' => \\\'0\\\',\n  \\\'watermark_minwidth\\\' => \\\'300\\\',\n  \\\'watermark_minheight\\\' => \\\'300\\\',\n  \\\'watermark_img\\\' => \\\'http://phpcms.local/statics/images/water/mark.gif\\\',\n  \\\'watermark_pct\\\' => \\\'100\\\',\n  \\\'watermark_quality\\\' => \\\'80\\\',\n  \\\'watermark_pos\\\' => \\\'9\\\',\n)\',\n    \'uuid\' => \'\',\n    \'url\' => \'http://www.ZLCMS.cn/\',\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES('downservers.cache.php','caches_commons/caches_data/','<?php\nreturn NULL;\n?>');
INSERT INTO `v9_cache` VALUES('badword.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES('ipbanned.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES('keylink.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES('position.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  2 => \n  array (\n    \'posid\' => \'2\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'首页头条推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'4\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  1 => \n  array (\n    \'posid\' => \'1\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'首页焦点图推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'1\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  16 => \n  array (\n    \'posid\' => \'16\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'视频首页每日热点\',\n    \'maxnum\' => \'20\',\n    \'extention\' => \'\',\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  15 => \n  array (\n    \'posid\' => \'15\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'视频首页头条推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => \'\',\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  14 => \n  array (\n    \'posid\' => \'14\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'视频首页焦点图\',\n    \'maxnum\' => \'20\',\n    \'extention\' => \'\',\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  12 => \n  array (\n    \'posid\' => \'12\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'首页图片推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  10 => \n  array (\n    \'posid\' => \'10\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'栏目首页推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  9 => \n  array (\n    \'posid\' => \'9\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'网站顶部推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  8 => \n  array (\n    \'posid\' => \'8\',\n    \'modelid\' => \'30\',\n    \'catid\' => \'54\',\n    \'name\' => \'图片频道首页焦点图\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  5 => \n  array (\n    \'posid\' => \'5\',\n    \'modelid\' => \'69\',\n    \'catid\' => \'0\',\n    \'name\' => \'推荐下载\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  13 => \n  array (\n    \'posid\' => \'13\',\n    \'modelid\' => \'82\',\n    \'catid\' => \'0\',\n    \'name\' => \'栏目页焦点图\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  17 => \n  array (\n    \'posid\' => \'17\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'视频栏目精彩推荐\',\n    \'maxnum\' => \'20\',\n    \'extention\' => \'\',\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES('role_siteid.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES('role.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \'超级管理员\',\n  2 => \'站点管理员\',\n  3 => \'运营总监\',\n  4 => \'总编\',\n  5 => \'编辑\',\n  7 => \'发布人员\',\n);\n?>');
INSERT INTO `v9_cache` VALUES('urlrules_detail.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \n  array (\n    \'urlruleid\' => \'1\',\n    \'module\' => \'content\',\n    \'file\' => \'category\',\n    \'ishtml\' => \'1\',\n    \'urlrule\' => \'{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/{$page}.html\',\n    \'example\' => \'news/china/1000.html\',\n  ),\n  6 => \n  array (\n    \'urlruleid\' => \'6\',\n    \'module\' => \'content\',\n    \'file\' => \'category\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'index.php?m=content&c=index&a=lists&catid={$catid}|index.php?m=content&c=index&a=lists&catid={$catid}&page={$page}\',\n    \'example\' => \'index.php?m=content&c=index&a=lists&catid=1&page=1\',\n  ),\n  11 => \n  array (\n    \'urlruleid\' => \'11\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'1\',\n    \'urlrule\' => \'{$year}/{$catdir}_{$month}{$day}/{$id}.html|{$year}/{$catdir}_{$month}{$day}/{$id}_{$page}.html\',\n    \'example\' => \'2010/catdir_0720/1_2.html\',\n  ),\n  12 => \n  array (\n    \'urlruleid\' => \'12\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'1\',\n    \'urlrule\' => \'{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}.html|{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}_{$page}.html\',\n    \'example\' => \'it/product/2010/0720/1_2.html\',\n  ),\n  16 => \n  array (\n    \'urlruleid\' => \'16\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'index.php?m=content&c=index&a=show&catid={$catid}&id={$id}|index.php?m=content&c=index&a=show&catid={$catid}&id={$id}&page={$page}\',\n    \'example\' => \'index.php?m=content&c=index&a=show&catid=1&id=1\',\n  ),\n  17 => \n  array (\n    \'urlruleid\' => \'17\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'show-{$catid}-{$id}-{$page}.html\',\n    \'example\' => \'show-1-2-1.html\',\n  ),\n  18 => \n  array (\n    \'urlruleid\' => \'18\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'content-{$catid}-{$id}-{$page}.html\',\n    \'example\' => \'content-1-2-1.html\',\n  ),\n  30 => \n  array (\n    \'urlruleid\' => \'30\',\n    \'module\' => \'content\',\n    \'file\' => \'category\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'list-{$catid}-{$page}.html\',\n    \'example\' => \'list-1-1.html\',\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES('urlrules.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \'{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/{$page}.html\',\n  6 => \'index.php?m=content&c=index&a=lists&catid={$catid}|index.php?m=content&c=index&a=lists&catid={$catid}&page={$page}\',\n  11 => \'{$year}/{$catdir}_{$month}{$day}/{$id}.html|{$year}/{$catdir}_{$month}{$day}/{$id}_{$page}.html\',\n  12 => \'{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}.html|{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}_{$page}.html\',\n  16 => \'index.php?m=content&c=index&a=show&catid={$catid}&id={$id}|index.php?m=content&c=index&a=show&catid={$catid}&id={$id}&page={$page}\',\n  17 => \'show-{$catid}-{$id}-{$page}.html\',\n  18 => \'content-{$catid}-{$id}-{$page}.html\',\n  30 => \'list-{$catid}-{$page}.html\',\n);\n?>');
INSERT INTO `v9_cache` VALUES('modules.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  \'zl_admin\' => \n  array (\n    \'module\' => \'zl_admin\',\n    \'name\' => \'后台\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'array (\n  \\\'admin_email\\\' => \\\'847480548@qq.com\\\',\n  \\\'adminaccessip\\\' => \\\'0\\\',\n  \\\'maxloginfailedtimes\\\' => \\\'8\\\',\n  \\\'maxiplockedtime\\\' => \\\'15\\\',\n  \\\'minrefreshtime\\\' => \\\'2\\\',\n  \\\'mail_type\\\' => \\\'1\\\',\n  \\\'mail_server\\\' => \\\'smtp.qq.com\\\',\n  \\\'mail_port\\\' => \\\'25\\\',\n  \\\'mail_user\\\' => \\\'847480548@qq.com\\\',\n  \\\'mail_auth\\\' => \\\'1\\\',\n  \\\'mail_from\\\' => \\\'847480548@qq.com\\\',\n  \\\'mail_password\\\' => \\\'\\\',\n  \\\'errorlog_size\\\' => \\\'20\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-10-18\',\n    \'updatedate\' => \'2010-10-18\',\n  ),\n  \'member\' => \n  array (\n    \'module\' => \'member\',\n    \'name\' => \'会员\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'array (\n  \\\'allowregister\\\' => \\\'1\\\',\n  \\\'choosemodel\\\' => \\\'1\\\',\n  \\\'enablemailcheck\\\' => \\\'0\\\',\n  \\\'registerverify\\\' => \\\'0\\\',\n  \\\'showapppoint\\\' => \\\'0\\\',\n  \\\'rmb_point_rate\\\' => \\\'10\\\',\n  \\\'defualtpoint\\\' => \\\'0\\\',\n  \\\'defualtamount\\\' => \\\'0\\\',\n  \\\'showregprotocol\\\' => \\\'0\\\',\n  \\\'regprotocol\\\' => \\\'		 欢迎您注册成为phpcms用户\r\n请仔细阅读下面的协议，只有接受协议才能继续进行注册。 \r\n1．服务条款的确认和接纳\r\n　　phpcms用户服务的所有权和运作权归phpcms拥有。phpcms所提供的服务将按照有关章程、服务条款和操作规则严格执行。用户通过注册程序点击“我同意” 按钮，即表示用户与phpcms达成协议并接受所有的服务条款。\r\n2． phpcms服务简介\r\n　　phpcms通过国际互联网为用户提供新闻及文章浏览、图片浏览、软件下载、网上留言和BBS论坛等服务。\r\n　　用户必须： \r\n　　1)购置设备，包括个人电脑一台、调制解调器一个及配备上网装置。 \r\n　　2)个人上网和支付与此服务有关的电话费用、网络费用。\r\n　　用户同意： \r\n　　1)提供及时、详尽及准确的个人资料。 \r\n　　2)不断更新注册资料，符合及时、详尽、准确的要求。所有原始键入的资料将引用为注册资料。 \r\n　　3)用户同意遵守《中华人民共和国保守国家秘密法》、《中华人民共和国计算机信息系统安全保护条例》、《计算机软件保护条例》等有关计算机及互联网规定的法律和法规、实施办法。在任何情况下，phpcms合理地认为用户的行为可能违反上述法律、法规，phpcms可以在任何时候，不经事先通知终止向该用户提供服务。用户应了解国际互联网的无国界性，应特别注意遵守当地所有有关的法律和法规。\r\n3． 服务条款的修改\r\n　　phpcms会不定时地修改服务条款，服务条款一旦发生变动，将会在相关页面上提示修改内容。如果您同意改动，则再一次点击“我同意”按钮。 如果您不接受，则及时取消您的用户使用服务资格。\r\n4． 服务修订\r\n　　phpcms保留随时修改或中断服务而不需知照用户的权利。phpcms行使修改或中断服务的权利，不需对用户或第三方负责。\r\n5． 用户隐私制度\r\n　　尊重用户个人隐私是phpcms的 基本政策。phpcms不会公开、编辑或透露用户的注册信息，除非有法律许可要求，或phpcms在诚信的基础上认为透露这些信息在以下三种情况是必要的： \r\n　　1)遵守有关法律规定，遵从合法服务程序。 \r\n　　2)保持维护phpcms的商标所有权。 \r\n　　3)在紧急情况下竭力维护用户个人和社会大众的隐私安全。 \r\n　　4)符合其他相关的要求。 \r\n6．用户的帐号，密码和安全性\r\n　　一旦注册成功成为phpcms用户，您将得到一个密码和帐号。如果您不保管好自己的帐号和密码安全，将对因此产生的后果负全部责任。另外，每个用户都要对其帐户中的所有活动和事件负全责。您可随时根据指示改变您的密码，也可以结束旧的帐户重开一个新帐户。用户同意若发现任何非法使用用户帐号或安全漏洞的情况，立即通知phpcms。\r\n7． 免责条款\r\n　　用户明确同意网站服务的使用由用户个人承担风险。 　　 \r\n　　phpcms不作任何类型的担保，不担保服务一定能满足用户的要求，也不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保。用户理解并接受：任何通过phpcms服务取得的信息资料的可靠性取决于用户自己，用户自己承担所有风险和责任。 \r\n8．有限责任\r\n　　phpcms对任何直接、间接、偶然、特殊及继起的损害不负责任。\r\n9． 不提供零售和商业性服务 \r\n　　用户使用网站服务的权利是个人的。用户只能是一个单独的个体而不能是一个公司或实体商业性组织。用户承诺不经phpcms同意，不能利用网站服务进行销售或其他商业用途。\r\n10．用户责任 \r\n　　用户单独承担传输内容的责任。用户必须遵循： \r\n　　1)从中国境内向外传输技术性资料时必须符合中国有关法规。 \r\n　　2)使用网站服务不作非法用途。 \r\n　　3)不干扰或混乱网络服务。 \r\n　　4)不在论坛BBS或留言簿发表任何与政治相关的信息。 \r\n　　5)遵守所有使用网站服务的网络协议、规定、程序和惯例。\r\n　　6)不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益。\r\n　　7)不得利用本站制作、复制和传播下列信息： \r\n　　　1、煽动抗拒、破坏宪法和法律、行政法规实施的；\r\n　　　2、煽动颠覆国家政权，推翻社会主义制度的；\r\n　　　3、煽动分裂国家、破坏国家统一的；\r\n　　　4、煽动民族仇恨、民族歧视，破坏民族团结的；\r\n　　　5、捏造或者歪曲事实，散布谣言，扰乱社会秩序的；\r\n　　　6、宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；\r\n　　　7、公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；\r\n　　　8、损害国家机关信誉的；\r\n　　　9、其他违反宪法和法律行政法规的；\r\n　　　10、进行商业广告行为的。\r\n　　用户不能传输任何教唆他人构成犯罪行为的资料；不能传输长国内不利条件和涉及国家安全的资料；不能传输任何不符合当地法规、国家法律和国际法 律的资料。未经许可而非法进入其它电脑系统是禁止的。若用户的行为不符合以上的条款，phpcms将取消用户服务帐号。\r\n11．网站内容的所有权\r\n　　phpcms定义的内容包括：文字、软件、声音、相片、录象、图表；在广告中全部内容；电子邮件的全部内容；phpcms为用户提供的商业信息。所有这些内容受版权、商标、标签和其它财产所有权法律的保护。所以，用户只能在phpcms和广告商授权下才能使用这些内容，而不能擅自复制、篡改这些内容、或创造与内容有关的派生产品。\r\n12．附加信息服务\r\n　　用户在享用phpcms提供的免费服务的同时，同意接受phpcms提供的各类附加信息服务。\r\n13．解释权\r\n　　本注册协议的解释权归phpcms所有。如果其中有任何条款与国家的有关法律相抵触，则以国家法律的明文规定为准。 \\\',\n  \\\'registerverifymessage\\\' => \\\' 欢迎您注册成为phpcms用户，您的账号需要邮箱认证，点击下面链接进行认证：{click}\r\n或者将网址复制到浏览器：{url}\\\',\n  \\\'forgetpassword\\\' => \\\' phpcms密码找回，请在一小时内点击下面链接进行操作：{click}\r\n或者将网址复制到浏览器：{url}\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'pay\' => \n  array (\n    \'module\' => \'pay\',\n    \'name\' => \'支付\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'digg\' => \n  array (\n    \'module\' => \'digg\',\n    \'name\' => \'顶一下\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'special\' => \n  array (\n    \'module\' => \'special\',\n    \'name\' => \'专题\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'content\' => \n  array (\n    \'module\' => \'content\',\n    \'name\' => \'内容模块\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'search\' => \n  array (\n    \'module\' => \'search\',\n    \'name\' => \'全站搜索\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'array (\n  \\\'fulltextenble\\\' => \\\'1\\\',\n  \\\'relationenble\\\' => \\\'1\\\',\n  \\\'suggestenable\\\' => \\\'1\\\',\n  \\\'sphinxenable\\\' => \\\'0\\\',\n  \\\'sphinxhost\\\' => \\\'10.228.134.102\\\',\n  \\\'sphinxport\\\' => \\\'9312\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'scan\' => \n  array (\n    \'module\' => \'scan\',\n    \'name\' => \'木马扫描\',\n    \'url\' => \'scan\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'attachment\' => \n  array (\n    \'module\' => \'attachment\',\n    \'name\' => \'附件\',\n    \'url\' => \'attachment\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'block\' => \n  array (\n    \'module\' => \'block\',\n    \'name\' => \'碎片\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'collection\' => \n  array (\n    \'module\' => \'collection\',\n    \'name\' => \'采集模块\',\n    \'url\' => \'collection\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'dbsource\' => \n  array (\n    \'module\' => \'dbsource\',\n    \'name\' => \'数据源\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'template\' => \n  array (\n    \'module\' => \'template\',\n    \'name\' => \'模板风格\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'release\' => \n  array (\n    \'module\' => \'release\',\n    \'name\' => \'发布点\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'announce\' => \n  array (\n    \'module\' => \'announce\',\n    \'name\' => \'公告\',\n    \'url\' => \'announce/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'公告\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2015-02-02\',\n    \'updatedate\' => \'2015-02-02\',\n  ),\n  \'comment\' => \n  array (\n    \'module\' => \'comment\',\n    \'name\' => \'评论\',\n    \'url\' => \'comment/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'评论\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2015-02-02\',\n    \'updatedate\' => \'2015-02-02\',\n  ),\n  \'link\' => \n  array (\n    \'module\' => \'link\',\n    \'name\' => \'友情链接\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'array (\n  1 => \n  array (\n    \\\'is_post\\\' => \\\'1\\\',\n    \\\'enablecheckcode\\\' => \\\'0\\\',\n  ),\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'message\' => \n  array (\n    \'module\' => \'message\',\n    \'name\' => \'短消息\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'poster\' => \n  array (\n    \'module\' => \'poster\',\n    \'name\' => \'广告模块\',\n    \'url\' => \'poster/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'广告模块\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2015-02-02\',\n    \'updatedate\' => \'2015-02-02\',\n  ),\n  \'formguide\' => \n  array (\n    \'module\' => \'formguide\',\n    \'name\' => \'表单向导\',\n    \'url\' => \'formguide/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'formguide\',\n    \'setting\' => \'array (\n  \\\'allowmultisubmit\\\' => \\\'1\\\',\n  \\\'interval\\\' => \\\'30\\\',\n  \\\'allowunreg\\\' => \\\'0\\\',\n  \\\'mailmessage\\\' => \\\'用户向我们提交了表单数据，赶快去看看吧。\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-10-20\',\n    \'updatedate\' => \'2010-10-20\',\n  ),\n  \'tag\' => \n  array (\n    \'module\' => \'tag\',\n    \'name\' => \'标签向导\',\n    \'url\' => \'tag/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'标签向导\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2015-02-02\',\n    \'updatedate\' => \'2015-02-02\',\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES('model.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \n  array (\n    \'modelid\' => \'1\',\n    \'siteid\' => \'1\',\n    \'name\' => \'文章模型\',\n    \'description\' => \'\',\n    \'tablename\' => \'news\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category\',\n    \'list_template\' => \'list\',\n    \'show_template\' => \'show\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  2 => \n  array (\n    \'modelid\' => \'2\',\n    \'siteid\' => \'1\',\n    \'name\' => \'下载模型\',\n    \'description\' => \'\',\n    \'tablename\' => \'download\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category_download\',\n    \'list_template\' => \'list_download\',\n    \'show_template\' => \'show_download\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  3 => \n  array (\n    \'modelid\' => \'3\',\n    \'siteid\' => \'1\',\n    \'name\' => \'图片模型\',\n    \'description\' => \'\',\n    \'tablename\' => \'picture\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category_picture\',\n    \'list_template\' => \'list_picture\',\n    \'show_template\' => \'show_picture\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  11 => \n  array (\n    \'modelid\' => \'11\',\n    \'siteid\' => \'1\',\n    \'name\' => \'视频模型\',\n    \'description\' => \'\',\n    \'tablename\' => \'video\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category_video\',\n    \'list_template\' => \'list_video\',\n    \'show_template\' => \'show_video\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES('workflow_1.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \n  array (\n    \'workflowid\' => \'1\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'1\',\n    \'workname\' => \'一级审核\',\n    \'description\' => \'审核一次\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n  2 => \n  array (\n    \'workflowid\' => \'2\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'2\',\n    \'workname\' => \'二级审核\',\n    \'description\' => \'审核两次\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n  3 => \n  array (\n    \'workflowid\' => \'3\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'3\',\n    \'workname\' => \'三级审核\',\n    \'description\' => \'审核三次\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n  4 => \n  array (\n    \'workflowid\' => \'4\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'4\',\n    \'workname\' => \'四级审核\',\n    \'description\' => \'四级审核\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES('member_model.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  10 => \n  array (\n    \'modelid\' => \'10\',\n    \'siteid\' => \'1\',\n    \'name\' => \'普通会员\',\n    \'description\' => \'普通会员\',\n    \'tablename\' => \'member_detail\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'\',\n    \'category_template\' => \'\',\n    \'list_template\' => \'\',\n    \'show_template\' => \'\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'2\',\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES('special.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES('common.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES('type_content_1.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES('category_items_1.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \'1\',\n);\n?>');
INSERT INTO `v9_cache` VALUES('category_items_2.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES('category_items_3.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES('category_items_11.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES('type_content.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES('vote.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES('bakup_tables.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  0 => \'v9_admin\',\n  1 => \'v9_admin_panel\',\n  2 => \'v9_admin_role\',\n  3 => \'v9_admin_role_priv\',\n  4 => \'v9_announce\',\n  5 => \'v9_attachment\',\n  6 => \'v9_attachment_index\',\n  7 => \'v9_badword\',\n  8 => \'v9_block\',\n  9 => \'v9_block_history\',\n  10 => \'v9_block_priv\',\n  11 => \'v9_cache\',\n  12 => \'v9_category\',\n  13 => \'v9_category_priv\',\n  14 => \'v9_collection_content\',\n  15 => \'v9_collection_history\',\n  16 => \'v9_collection_node\',\n  17 => \'v9_collection_program\',\n  18 => \'v9_comment\',\n  19 => \'v9_comment_check\',\n  20 => \'v9_comment_data_1\',\n  21 => \'v9_comment_setting\',\n  22 => \'v9_comment_table\',\n  23 => \'v9_content_check\',\n  24 => \'v9_copyfrom\',\n  25 => \'v9_datacall\',\n  26 => \'v9_dbsource\',\n  27 => \'v9_download\',\n  28 => \'v9_download_data\',\n  29 => \'v9_downservers\',\n  30 => \'v9_extend_setting\',\n  31 => \'v9_favorite\',\n  32 => \'v9_hits\',\n  33 => \'v9_ipbanned\',\n  34 => \'v9_keylink\',\n  35 => \'v9_keyword\',\n  36 => \'v9_keyword_data\',\n  37 => \'v9_link\',\n  38 => \'v9_linkage\',\n  39 => \'v9_log\',\n  40 => \'v9_member\',\n  41 => \'v9_member_detail\',\n  42 => \'v9_member_group\',\n  43 => \'v9_member_menu\',\n  44 => \'v9_member_verify\',\n  45 => \'v9_member_vip\',\n  46 => \'v9_menu\',\n  47 => \'v9_message\',\n  48 => \'v9_message_data\',\n  49 => \'v9_message_group\',\n  50 => \'v9_model\',\n  51 => \'v9_model_field\',\n  52 => \'v9_module\',\n  53 => \'v9_news\',\n  54 => \'v9_news_data\',\n  55 => \'v9_page\',\n  56 => \'v9_pay_account\',\n  57 => \'v9_pay_payment\',\n  58 => \'v9_pay_spend\',\n  59 => \'v9_picture\',\n  60 => \'v9_picture_data\',\n  61 => \'v9_position\',\n  62 => \'v9_position_data\',\n  63 => \'v9_poster\',\n  64 => \'v9_poster_201501\',\n  65 => \'v9_poster_201502\',\n  66 => \'v9_poster_201503\',\n  67 => \'v9_poster_201509\',\n  68 => \'v9_poster_space\',\n  69 => \'v9_product_cat\',\n  70 => \'v9_product_pic\',\n  71 => \'v9_queue\',\n  72 => \'v9_release_point\',\n  73 => \'v9_search\',\n  74 => \'v9_search_keyword\',\n  75 => \'v9_session\',\n  76 => \'v9_site\',\n  77 => \'v9_special\',\n  78 => \'v9_special_c_data\',\n  79 => \'v9_special_content\',\n  80 => \'v9_sphinx_counter\',\n  81 => \'v9_sso_admin\',\n  82 => \'v9_sso_applications\',\n  83 => \'v9_sso_members\',\n  84 => \'v9_sso_messagequeue\',\n  85 => \'v9_sso_session\',\n  86 => \'v9_sso_settings\',\n  87 => \'v9_tag\',\n  88 => \'v9_template_bak\',\n  89 => \'v9_times\',\n  90 => \'v9_type\',\n  91 => \'v9_urlrule\',\n  92 => \'v9_video\',\n  93 => \'v9_video_data\',\n  94 => \'v9_wap_type\',\n  95 => \'v9_workflow\',\n);\n?>');
INSERT INTO `v9_cache` VALUES('link.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \n  array (\n    \'is_post\' => \'1\',\n    \'enablecheckcode\' => \'0\',\n  ),\n);\n?>');

DROP TABLE IF EXISTS `v9_category`;
CREATE TABLE `v9_category` (
  `catid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` varchar(15) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `arrparentid` varchar(255) NOT NULL,
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `arrchildid` mediumtext NOT NULL,
  `catname` varchar(30) NOT NULL,
  `style` varchar(5) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  `parentdir` varchar(100) NOT NULL,
  `catdir` varchar(30) NOT NULL,
  `url` varchar(100) NOT NULL,
  `items` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `setting` mediumtext NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sethtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `letter` varchar(30) NOT NULL,
  `usable_type` varchar(255) NOT NULL,
  PRIMARY KEY (`catid`),
  KEY `module` (`module`,`parentid`,`listorder`,`catid`),
  KEY `siteid` (`siteid`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `v9_category` VALUES('1','1','content','0','1','0','0','0','1','qq群','','','','','qq','','1','0','array (\n  \'workflowid\' => \'\',\n  \'ishtml\' => \'0\',\n  \'content_ishtml\' => \'0\',\n  \'create_to_html_root\' => \'0\',\n  \'template_list\' => \'default\',\n  \'category_template\' => \'category\',\n  \'list_template\' => \'list\',\n  \'show_template\' => \'show\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'presentpoint\' => \'1\',\n  \'defaultchargepoint\' => \'0\',\n  \'paytype\' => \'0\',\n  \'repeatchargedays\' => \'1\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'16\',\n)','1','1','0','','');

DROP TABLE IF EXISTS `v9_category_priv`;
CREATE TABLE `v9_category_priv` (
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `roleid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `is_admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `action` char(30) NOT NULL,
  KEY `catid` (`catid`,`roleid`,`is_admin`,`action`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_collection_content`;
CREATE TABLE `v9_collection_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nodeid` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(255) NOT NULL,
  `title` char(100) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nodeid` (`nodeid`,`siteid`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_collection_history`;
CREATE TABLE `v9_collection_history` (
  `md5` char(32) NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`md5`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_collection_node`;
CREATE TABLE `v9_collection_node` (
  `nodeid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sourcecharset` varchar(8) NOT NULL,
  `sourcetype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `urlpage` text NOT NULL,
  `pagesize_start` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `pagesize_end` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `page_base` char(255) NOT NULL,
  `par_num` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `url_contain` char(100) NOT NULL,
  `url_except` char(100) NOT NULL,
  `url_start` char(100) NOT NULL DEFAULT '',
  `url_end` char(100) NOT NULL DEFAULT '',
  `title_rule` char(100) NOT NULL,
  `title_html_rule` text NOT NULL,
  `author_rule` char(100) NOT NULL,
  `author_html_rule` text NOT NULL,
  `comeform_rule` char(100) NOT NULL,
  `comeform_html_rule` text NOT NULL,
  `time_rule` char(100) NOT NULL,
  `time_html_rule` text NOT NULL,
  `content_rule` char(100) NOT NULL,
  `content_html_rule` text NOT NULL,
  `content_page_start` char(100) NOT NULL,
  `content_page_end` char(100) NOT NULL,
  `content_page_rule` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `content_page` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `content_nextpage` char(100) NOT NULL,
  `down_attachment` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `watermark` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `coll_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `customize_config` text NOT NULL,
  PRIMARY KEY (`nodeid`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_collection_program`;
CREATE TABLE `v9_collection_program` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `nodeid` int(10) unsigned NOT NULL DEFAULT '0',
  `modelid` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `config` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `nodeid` (`nodeid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_comment`;
CREATE TABLE `v9_comment` (
  `commentid` char(30) NOT NULL,
  `siteid` smallint(5) NOT NULL DEFAULT '0',
  `title` char(255) NOT NULL,
  `url` char(255) NOT NULL,
  `total` int(8) unsigned DEFAULT '0',
  `square` mediumint(8) unsigned DEFAULT '0',
  `anti` mediumint(8) unsigned DEFAULT '0',
  `neutral` mediumint(8) unsigned DEFAULT '0',
  `display_type` tinyint(1) DEFAULT '0',
  `tableid` mediumint(8) unsigned DEFAULT '0',
  `lastupdate` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`commentid`),
  KEY `lastupdate` (`lastupdate`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_comment_check`;
CREATE TABLE `v9_comment_check` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `comment_data_id` int(10) DEFAULT '0' COMMENT '论评ID号',
  `siteid` smallint(5) NOT NULL DEFAULT '0' COMMENT '站点ID',
  `tableid` mediumint(8) DEFAULT '0' COMMENT '数据存储表ID',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `comment_data_id` (`comment_data_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_comment_data_1`;
CREATE TABLE `v9_comment_data_1` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `commentid` char(30) NOT NULL DEFAULT '' COMMENT '评论ID号',
  `siteid` smallint(5) NOT NULL DEFAULT '0' COMMENT '站点ID',
  `userid` int(10) unsigned DEFAULT '0' COMMENT '用户ID',
  `username` varchar(20) DEFAULT NULL COMMENT '用户名',
  `creat_at` int(10) DEFAULT NULL COMMENT '发布时间',
  `ip` varchar(15) DEFAULT NULL COMMENT '用户IP地址',
  `status` tinyint(1) DEFAULT '0' COMMENT '评论状态{0:未审核,-1:未通过审核,1:通过审核}',
  `content` text COMMENT '评论内容',
  `direction` tinyint(1) DEFAULT '0' COMMENT '评论方向{0:无方向,1:正文,2:反方,3:中立}',
  `support` mediumint(8) unsigned DEFAULT '0' COMMENT '支持数',
  `reply` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为回复',
  PRIMARY KEY (`id`),
  KEY `commentid` (`commentid`),
  KEY `direction` (`direction`),
  KEY `siteid` (`siteid`),
  KEY `support` (`support`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_comment_setting`;
CREATE TABLE `v9_comment_setting` (
  `siteid` smallint(5) NOT NULL DEFAULT '0' COMMENT '站点ID',
  `guest` tinyint(1) DEFAULT '0' COMMENT '是否允许游客评论',
  `check` tinyint(1) DEFAULT '0' COMMENT '是否需要审核',
  `code` tinyint(1) DEFAULT '0' COMMENT '是否开启验证码',
  `add_point` tinyint(3) unsigned DEFAULT '0' COMMENT '添加的积分数',
  `del_point` tinyint(3) unsigned DEFAULT '0' COMMENT '扣除的积分数',
  PRIMARY KEY (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `v9_comment_setting` VALUES('1','0','0','0','0','0');

DROP TABLE IF EXISTS `v9_comment_table`;
CREATE TABLE `v9_comment_table` (
  `tableid` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '表ID号',
  `total` int(10) unsigned DEFAULT '0' COMMENT '数据总量',
  `creat_at` int(10) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`tableid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `v9_comment_table` VALUES('1','0','0');

DROP TABLE IF EXISTS `v9_content_check`;
CREATE TABLE `v9_content_check` (
  `checkid` char(15) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `username` (`username`),
  KEY `checkid` (`checkid`),
  KEY `status` (`status`,`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_copyfrom`;
CREATE TABLE `v9_copyfrom` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sitename` varchar(30) NOT NULL,
  `siteurl` varchar(100) NOT NULL,
  `thumb` varchar(100) NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_datacall`;
CREATE TABLE `v9_datacall` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` char(40) DEFAULT NULL,
  `dis_type` tinyint(1) unsigned DEFAULT '0',
  `type` tinyint(1) DEFAULT '0',
  `module` char(20) DEFAULT NULL,
  `action` char(20) DEFAULT NULL,
  `data` text,
  `template` text,
  `cache` mediumint(8) DEFAULT NULL,
  `num` smallint(6) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_dbsource`;
CREATE TABLE `v9_dbsource` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `host` varchar(20) NOT NULL,
  `port` int(5) NOT NULL DEFAULT '3306',
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `dbname` varchar(50) NOT NULL,
  `dbtablepre` varchar(30) NOT NULL,
  `charset` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_download`;
CREATE TABLE `v9_download` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `systems` varchar(100) NOT NULL DEFAULT 'Win2000/WinXP/Win2003',
  `copytype` varchar(15) NOT NULL DEFAULT '',
  `language` varchar(10) NOT NULL DEFAULT '',
  `classtype` varchar(20) NOT NULL DEFAULT '',
  `version` varchar(20) NOT NULL DEFAULT '',
  `filesize` varchar(10) NOT NULL DEFAULT 'Unkown',
  `stars` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_download_data`;
CREATE TABLE `v9_download_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `downfiles` mediumtext NOT NULL,
  `downfile` varchar(255) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_downservers`;
CREATE TABLE `v9_downservers` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `sitename` varchar(100) DEFAULT NULL,
  `siteurl` varchar(255) DEFAULT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_extend_setting`;
CREATE TABLE `v9_extend_setting` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `key` char(30) NOT NULL,
  `data` mediumtext,
  PRIMARY KEY (`id`),
  KEY `key` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_favorite`;
CREATE TABLE `v9_favorite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title` char(100) NOT NULL,
  `url` char(100) NOT NULL,
  `adddate` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_hits`;
CREATE TABLE `v9_hits` (
  `hitsid` char(30) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `yesterdayviews` int(10) unsigned NOT NULL DEFAULT '0',
  `dayviews` int(10) unsigned NOT NULL DEFAULT '0',
  `weekviews` int(10) unsigned NOT NULL DEFAULT '0',
  `monthviews` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`hitsid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `v9_hits` VALUES('c-1-1','1','0','0','0','0','0','1441338830');

DROP TABLE IF EXISTS `v9_ipbanned`;
CREATE TABLE `v9_ipbanned` (
  `ipbannedid` smallint(5) NOT NULL AUTO_INCREMENT,
  `ip` char(15) NOT NULL,
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ipbannedid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_keylink`;
CREATE TABLE `v9_keylink` (
  `keylinkid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `word` char(40) NOT NULL,
  `url` char(100) NOT NULL,
  PRIMARY KEY (`keylinkid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_keyword`;
CREATE TABLE `v9_keyword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `keyword` char(100) NOT NULL,
  `pinyin` char(100) NOT NULL,
  `videonum` int(11) NOT NULL DEFAULT '0',
  `searchnums` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `keyword` (`keyword`,`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `v9_keyword` VALUES('1','1','111','111','1','0');
INSERT INTO `v9_keyword` VALUES('2','1','地方','difang','6','0');

DROP TABLE IF EXISTS `v9_keyword_data`;
CREATE TABLE `v9_keyword_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tagid` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `contentid` char(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tagid` (`tagid`,`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `v9_keyword_data` VALUES('1','1','1','1-1');
INSERT INTO `v9_keyword_data` VALUES('2','2','1','1-1');

DROP TABLE IF EXISTS `v9_link`;
CREATE TABLE `v9_link` (
  `linkid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `linktype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `introduce` text NOT NULL,
  `username` varchar(30) NOT NULL DEFAULT '',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `elite` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `passed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`linkid`),
  KEY `typeid` (`typeid`,`passed`,`listorder`,`linkid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `v9_link` VALUES('1','1','0','1','PHPCMS','http://www.phpcms.cn','http://www.phpcms.cn/images/logo_88_31.gif','','','0','0','1','1422857143');
INSERT INTO `v9_link` VALUES('2','1','0','1','盛大在线','http://www.sdo.com','http://www.snda.com/cn/logo/comp_logo_sdo.gif','','','0','0','1','1422857143');

DROP TABLE IF EXISTS `v9_linkage`;
CREATE TABLE `v9_linkage` (
  `linkageid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `style` varchar(35) NOT NULL,
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `child` tinyint(1) NOT NULL,
  `arrchildid` mediumtext NOT NULL,
  `keyid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `setting` varchar(255) DEFAULT NULL,
  `siteid` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`linkageid`,`keyid`),
  KEY `parentid` (`parentid`,`listorder`)
) ENGINE=MyISAM AUTO_INCREMENT=3360 DEFAULT CHARSET=utf8;

INSERT INTO `v9_linkage` VALUES('1','中国','1','0','0','','0','0','','','0');
INSERT INTO `v9_linkage` VALUES('2','北京市','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3','上海市','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('4','天津市','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('5','重庆市','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('6','河北省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('7','山西省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('8','内蒙古','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('9','辽宁省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('10','吉林省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('11','黑龙江省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('12','江苏省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('13','浙江省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('14','安徽省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('15','福建省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('16','江西省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('17','山东省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('18','河南省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('19','湖北省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('20','湖南省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('21','广东省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('22','广西','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('23','海南省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('24','四川省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('25','贵州省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('26','云南省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('27','西藏','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('28','陕西省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('29','甘肃省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('30','青海省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('31','宁夏','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('32','新疆','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('33','台湾省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('34','香港','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('35','澳门','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('36','东城区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('37','西城区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('38','崇文区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('39','宣武区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('40','朝阳区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('41','石景山区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('42','海淀区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('43','门头沟区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('44','房山区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('45','通州区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('46','顺义区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('47','昌平区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('48','大兴区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('49','怀柔区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('50','平谷区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('51','密云县','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('52','延庆县','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('53','黄浦区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('54','卢湾区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('55','徐汇区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('56','长宁区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('57','静安区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('58','普陀区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('59','闸北区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('60','虹口区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('61','杨浦区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('62','闵行区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('63','宝山区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('64','嘉定区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('65','浦东新区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('66','金山区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('67','松江区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('68','青浦区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('69','南汇区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('70','奉贤区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('71','崇明县','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('72','和平区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('73','河东区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('74','河西区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('75','南开区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('76','河北区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('77','红桥区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('78','塘沽区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('79','汉沽区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('80','大港区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('81','东丽区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('82','西青区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('83','津南区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('84','北辰区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('85','武清区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('86','宝坻区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('87','宁河县','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('88','静海县','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('89','蓟县','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('90','万州区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('91','涪陵区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('92','渝中区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('93','大渡口区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('94','江北区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('95','沙坪坝区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('96','九龙坡区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('97','南岸区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('98','北碚区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('99','万盛区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('100','双桥区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('101','渝北区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('102','巴南区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('103','黔江区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('104','长寿区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('105','綦江县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('106','潼南县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('107','铜梁县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('108','大足县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('109','荣昌县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('110','璧山县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('111','梁平县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('112','城口县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('113','丰都县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('114','垫江县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('115','武隆县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('116','忠县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('117','开县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('118','云阳县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('119','奉节县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('120','巫山县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('121','巫溪县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('122','石柱县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('123','秀山县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('124','酉阳县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('125','彭水县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('126','江津区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('127','合川区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('128','永川区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('129','南川区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('130','石家庄市','0','6','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('131','唐山市','0','6','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('132','秦皇岛市','0','6','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('133','邯郸市','0','6','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('134','邢台市','0','6','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('135','保定市','0','6','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('136','张家口市','0','6','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('137','承德市','0','6','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('138','沧州市','0','6','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('139','廊坊市','0','6','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('140','衡水市','0','6','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('141','太原市','0','7','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('142','大同市','0','7','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('143','阳泉市','0','7','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('144','长治市','0','7','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('145','晋城市','0','7','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('146','朔州市','0','7','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('147','晋中市','0','7','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('148','运城市','0','7','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('149','忻州市','0','7','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('150','临汾市','0','7','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('151','吕梁市','0','7','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('152','呼和浩特市','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('153','包头市','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('154','乌海市','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('155','赤峰市','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('156','通辽市','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('157','鄂尔多斯市','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('158','呼伦贝尔市','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('159','巴彦淖尔市','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('160','乌兰察布市','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('161','兴安盟','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('162','锡林郭勒盟','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('163','阿拉善盟','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('164','沈阳市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('165','大连市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('166','鞍山市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('167','抚顺市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('168','本溪市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('169','丹东市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('170','锦州市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('171','营口市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('172','阜新市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('173','辽阳市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('174','盘锦市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('175','铁岭市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('176','朝阳市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('177','葫芦岛市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('178','长春市','0','10','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('179','吉林市','0','10','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('180','四平市','0','10','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('181','辽源市','0','10','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('182','通化市','0','10','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('183','白山市','0','10','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('184','松原市','0','10','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('185','白城市','0','10','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('186','延边','0','10','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('187','哈尔滨市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('188','齐齐哈尔市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('189','鸡西市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('190','鹤岗市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('191','双鸭山市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('192','大庆市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('193','伊春市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('194','佳木斯市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('195','七台河市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('196','牡丹江市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('197','黑河市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('198','绥化市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('199','大兴安岭地区','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('200','南京市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('201','无锡市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('202','徐州市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('203','常州市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('204','苏州市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('205','南通市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('206','连云港市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('207','淮安市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('208','盐城市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('209','扬州市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('210','镇江市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('211','泰州市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('212','宿迁市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('213','杭州市','0','13','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('214','宁波市','0','13','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('215','温州市','0','13','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('216','嘉兴市','0','13','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('217','湖州市','0','13','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('218','绍兴市','0','13','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('219','金华市','0','13','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('220','衢州市','0','13','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('221','舟山市','0','13','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('222','台州市','0','13','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('223','丽水市','0','13','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('224','合肥市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('225','芜湖市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('226','蚌埠市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('227','淮南市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('228','马鞍山市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('229','淮北市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('230','铜陵市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('231','安庆市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('232','黄山市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('233','滁州市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('234','阜阳市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('235','宿州市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('236','巢湖市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('237','六安市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('238','亳州市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('239','池州市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('240','宣城市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('241','福州市','0','15','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('242','厦门市','0','15','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('243','莆田市','0','15','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('244','三明市','0','15','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('245','泉州市','0','15','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('246','漳州市','0','15','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('247','南平市','0','15','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('248','龙岩市','0','15','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('249','宁德市','0','15','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('250','南昌市','0','16','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('251','景德镇市','0','16','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('252','萍乡市','0','16','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('253','九江市','0','16','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('254','新余市','0','16','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('255','鹰潭市','0','16','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('256','赣州市','0','16','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('257','吉安市','0','16','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('258','宜春市','0','16','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('259','抚州市','0','16','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('260','上饶市','0','16','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('261','济南市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('262','青岛市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('263','淄博市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('264','枣庄市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('265','东营市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('266','烟台市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('267','潍坊市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('268','济宁市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('269','泰安市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('270','威海市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('271','日照市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('272','莱芜市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('273','临沂市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('274','德州市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('275','聊城市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('276','滨州市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('277','荷泽市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('278','郑州市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('279','开封市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('280','洛阳市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('281','平顶山市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('282','安阳市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('283','鹤壁市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('284','新乡市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('285','焦作市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('286','濮阳市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('287','许昌市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('288','漯河市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('289','三门峡市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('290','南阳市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('291','商丘市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('292','信阳市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('293','周口市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('294','驻马店市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('295','武汉市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('296','黄石市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('297','十堰市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('298','宜昌市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('299','襄樊市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('300','鄂州市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('301','荆门市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('302','孝感市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('303','荆州市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('304','黄冈市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('305','咸宁市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('306','随州市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('307','恩施土家族苗族自治州','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('308','仙桃市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('309','潜江市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('310','天门市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('311','神农架林区','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('312','长沙市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('313','株洲市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('314','湘潭市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('315','衡阳市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('316','邵阳市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('317','岳阳市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('318','常德市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('319','张家界市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('320','益阳市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('321','郴州市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('322','永州市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('323','怀化市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('324','娄底市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('325','湘西土家族苗族自治州','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('326','广州市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('327','韶关市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('328','深圳市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('329','珠海市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('330','汕头市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('331','佛山市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('332','江门市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('333','湛江市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('334','茂名市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('335','肇庆市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('336','惠州市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('337','梅州市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('338','汕尾市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('339','河源市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('340','阳江市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('341','清远市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('342','东莞市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('343','中山市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('344','潮州市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('345','揭阳市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('346','云浮市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('347','南宁市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('348','柳州市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('349','桂林市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('350','梧州市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('351','北海市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('352','防城港市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('353','钦州市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('354','贵港市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('355','玉林市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('356','百色市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('357','贺州市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('358','河池市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('359','来宾市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('360','崇左市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('361','海口市','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('362','三亚市','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('363','五指山市','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('364','琼海市','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('365','儋州市','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('366','文昌市','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('367','万宁市','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('368','东方市','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('369','定安县','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('370','屯昌县','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('371','澄迈县','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('372','临高县','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('373','白沙黎族自治县','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('374','昌江黎族自治县','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('375','乐东黎族自治县','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('376','陵水黎族自治县','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('377','保亭黎族苗族自治县','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('378','琼中黎族苗族自治县','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('379','西沙群岛','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('380','南沙群岛','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('381','中沙群岛的岛礁及其海域','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('382','成都市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('383','自贡市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('384','攀枝花市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('385','泸州市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('386','德阳市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('387','绵阳市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('388','广元市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('389','遂宁市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('390','内江市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('391','乐山市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('392','南充市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('393','眉山市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('394','宜宾市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('395','广安市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('396','达州市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('397','雅安市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('398','巴中市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('399','资阳市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('400','阿坝州','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('401','甘孜州','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('402','凉山州','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('403','贵阳市','0','25','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('404','六盘水市','0','25','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('405','遵义市','0','25','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('406','安顺市','0','25','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('407','铜仁地区','0','25','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('408','黔西南州','0','25','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('409','毕节地区','0','25','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('410','黔东南州','0','25','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('411','黔南州','0','25','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('412','昆明市','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('413','曲靖市','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('414','玉溪市','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('415','保山市','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('416','昭通市','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('417','丽江市','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('418','思茅市','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('419','临沧市','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('420','楚雄州','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('421','红河州','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('422','文山州','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('423','西双版纳','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('424','大理','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('425','德宏','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('426','怒江','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('427','迪庆','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('428','拉萨市','0','27','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('429','昌都','0','27','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('430','山南','0','27','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('431','日喀则','0','27','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('432','那曲','0','27','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('433','阿里','0','27','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('434','林芝','0','27','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('435','西安市','0','28','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('436','铜川市','0','28','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('437','宝鸡市','0','28','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('438','咸阳市','0','28','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('439','渭南市','0','28','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('440','延安市','0','28','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('441','汉中市','0','28','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('442','榆林市','0','28','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('443','安康市','0','28','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('444','商洛市','0','28','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('445','兰州市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('446','嘉峪关市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('447','金昌市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('448','白银市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('449','天水市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('450','武威市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('451','张掖市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('452','平凉市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('453','酒泉市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('454','庆阳市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('455','定西市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('456','陇南市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('457','临夏州','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('458','甘州','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('459','西宁市','0','30','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('460','海东地区','0','30','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('461','海州','0','30','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('462','黄南州','0','30','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('463','海南州','0','30','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('464','果洛州','0','30','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('465','玉树州','0','30','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('466','海西州','0','30','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('467','银川市','0','31','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('468','石嘴山市','0','31','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('469','吴忠市','0','31','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('470','固原市','0','31','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('471','中卫市','0','31','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('472','乌鲁木齐市','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('473','克拉玛依市','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('474','吐鲁番地区','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('475','哈密地区','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('476','昌吉州','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('477','博尔州','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('478','巴音郭楞州','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('479','阿克苏地区','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('480','克孜勒苏柯尔克孜自治州','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('481','喀什地区','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('482','和田地区','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('483','伊犁州','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('484','塔城地区','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('485','阿勒泰地区','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('486','石河子市','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('487','阿拉尔市','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('488','图木舒克市','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('489','五家渠市','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('490','台北市','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('491','高雄市','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('492','基隆市','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('493','新竹市','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('494','台中市','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('495','嘉义市','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('496','台南市','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('497','台北县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('498','桃园县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('499','新竹县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('500','苗栗县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('501','台中县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('502','彰化县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('503','南投县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('504','云林县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('505','嘉义县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('506','台南县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('507','高雄县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('508','屏东县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('509','宜兰县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('510','花莲县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('511','台东县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('512','澎湖县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('513','金门县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('514','连江县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('515','中西区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('516','东区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('517','南区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('518','湾仔区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('519','九龙城区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('520','观塘区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('521','深水埗区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('522','黄大仙区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('523','油尖旺区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('524','离岛区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('525','葵青区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('526','北区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('527','西贡区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('528','沙田区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('529','大埔区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('530','荃湾区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('531','屯门区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('532','元朗区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('533','花地玛堂区','0','35','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('534','市圣安多尼堂区','0','35','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('535','大堂区','0','35','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('536','望德堂区','0','35','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('537','风顺堂区','0','35','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('538','嘉模堂区','0','35','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('539','圣方济各堂区','0','35','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('540','长安区','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('541','桥东区','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('542','桥西区','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('543','新华区','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('544','井陉矿区','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('545','裕华区','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('546','井陉县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('547','正定县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('548','栾城县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('549','行唐县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('550','灵寿县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('551','高邑县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('552','深泽县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('553','赞皇县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('554','无极县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('555','平山县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('556','元氏县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('557','赵县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('558','辛集市','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('559','藁城市','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('560','晋州市','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('561','新乐市','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('562','鹿泉市','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('563','路南区','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('564','路北区','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('565','古冶区','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('566','开平区','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('567','丰南区','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('568','丰润区','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('569','滦县','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('570','滦南县','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('571','乐亭县','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('572','迁西县','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('573','玉田县','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('574','唐海县','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('575','遵化市','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('576','迁安市','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('577','海港区','0','132','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('578','山海关区','0','132','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('579','北戴河区','0','132','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('580','青龙县','0','132','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('581','昌黎县','0','132','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('582','抚宁县','0','132','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('583','卢龙县','0','132','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('584','邯山区','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('585','丛台区','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('586','复兴区','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('587','峰峰矿区','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('588','邯郸县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('589','临漳县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('590','成安县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('591','大名县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('592','涉县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('593','磁县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('594','肥乡县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('595','永年县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('596','邱县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('597','鸡泽县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('598','广平县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('599','馆陶县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('600','魏县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('601','曲周县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('602','武安市','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('603','桥东区','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('604','桥西区','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('605','邢台县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('606','临城县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('607','内丘县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('608','柏乡县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('609','隆尧县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('610','任县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('611','南和县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('612','宁晋县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('613','巨鹿县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('614','新河县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('615','广宗县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('616','平乡县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('617','威县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('618','清河县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('619','临西县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('620','南宫市','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('621','沙河市','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('622','新市区','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('623','北市区','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('624','南市区','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('625','满城县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('626','清苑县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('627','涞水县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('628','阜平县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('629','徐水县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('630','定兴县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('631','唐县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('632','高阳县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('633','容城县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('634','涞源县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('635','望都县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('636','安新县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('637','易县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('638','曲阳县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('639','蠡县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('640','顺平县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('641','博野县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('642','雄县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('643','涿州市','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('644','定州市','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('645','安国市','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('646','高碑店市','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('647','桥东区','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('648','桥西区','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('649','宣化区','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('650','下花园区','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('651','宣化县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('652','张北县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('653','康保县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('654','沽源县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('655','尚义县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('656','蔚县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('657','阳原县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('658','怀安县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('659','万全县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('660','怀来县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('661','涿鹿县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('662','赤城县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('663','崇礼县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('664','双桥区','0','137','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('665','双滦区','0','137','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('666','鹰手营子矿区','0','137','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('667','承德县','0','137','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('668','兴隆县','0','137','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('669','平泉县','0','137','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('670','滦平县','0','137','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('671','隆化县','0','137','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('672','丰宁县','0','137','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('673','宽城县','0','137','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('674','围场县','0','137','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('675','新华区','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('676','运河区','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('677','沧县','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('678','青县','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('679','东光县','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('680','海兴县','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('681','盐山县','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('682','肃宁县','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('683','南皮县','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('684','吴桥县','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('685','献县','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('686','孟村县','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('687','泊头市','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('688','任丘市','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('689','黄骅市','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('690','河间市','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('691','安次区','0','139','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('692','广阳区','0','139','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('693','固安县','0','139','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('694','永清县','0','139','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('695','香河县','0','139','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('696','大城县','0','139','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('697','文安县','0','139','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('698','大厂县','0','139','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('699','霸州市','0','139','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('700','三河市','0','139','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('701','桃城区','0','140','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('702','枣强县','0','140','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('703','武邑县','0','140','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('704','武强县','0','140','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('705','饶阳县','0','140','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('706','安平县','0','140','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('707','故城县','0','140','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('708','景县','0','140','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('709','阜城县','0','140','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('710','冀州市','0','140','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('711','深州市','0','140','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('712','小店区','0','141','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('713','迎泽区','0','141','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('714','杏花岭区','0','141','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('715','尖草坪区','0','141','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('716','万柏林区','0','141','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('717','晋源区','0','141','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('718','清徐县','0','141','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('719','阳曲县','0','141','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('720','娄烦县','0','141','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('721','古交市','0','141','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('722','城区','0','142','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('723','矿区','0','142','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('724','南郊区','0','142','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('725','新荣区','0','142','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('726','阳高县','0','142','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('727','天镇县','0','142','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('728','广灵县','0','142','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('729','灵丘县','0','142','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('730','浑源县','0','142','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('731','左云县','0','142','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('732','大同县','0','142','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('733','城区','0','143','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('734','矿区','0','143','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('735','郊区','0','143','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('736','平定县','0','143','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('737','盂县','0','143','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('738','城区','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('739','郊区','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('740','长治县','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('741','襄垣县','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('742','屯留县','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('743','平顺县','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('744','黎城县','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('745','壶关县','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('746','长子县','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('747','武乡县','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('748','沁县','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('749','沁源县','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('750','潞城市','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('751','城区','0','145','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('752','沁水县','0','145','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('753','阳城县','0','145','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('754','陵川县','0','145','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('755','泽州县','0','145','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('756','高平市','0','145','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('757','朔城区','0','146','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('758','平鲁区','0','146','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('759','山阴县','0','146','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('760','应县','0','146','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('761','右玉县','0','146','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('762','怀仁县','0','146','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('763','榆次区','0','147','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('764','榆社县','0','147','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('765','左权县','0','147','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('766','和顺县','0','147','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('767','昔阳县','0','147','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('768','寿阳县','0','147','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('769','太谷县','0','147','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('770','祁县','0','147','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('771','平遥县','0','147','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('772','灵石县','0','147','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('773','介休市','0','147','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('774','盐湖区','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('775','临猗县','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('776','万荣县','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('777','闻喜县','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('778','稷山县','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('779','新绛县','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('780','绛县','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('781','垣曲县','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('782','夏县','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('783','平陆县','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('784','芮城县','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('785','永济市','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('786','河津市','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('787','忻府区','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('788','定襄县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('789','五台县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('790','代县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('791','繁峙县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('792','宁武县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('793','静乐县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('794','神池县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('795','五寨县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('796','岢岚县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('797','河曲县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('798','保德县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('799','偏关县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('800','原平市','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('801','尧都区','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('802','曲沃县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('803','翼城县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('804','襄汾县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('805','洪洞县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('806','古县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('807','安泽县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('808','浮山县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('809','吉县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('810','乡宁县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('811','大宁县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('812','隰县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('813','永和县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('814','蒲县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('815','汾西县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('816','侯马市','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('817','霍州市','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('818','离石区','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('819','文水县','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('820','交城县','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('821','兴县','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('822','临县','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('823','柳林县','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('824','石楼县','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('825','岚县','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('826','方山县','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('827','中阳县','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('828','交口县','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('829','孝义市','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('830','汾阳市','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('831','新城区','0','152','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('832','回民区','0','152','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('833','玉泉区','0','152','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('834','赛罕区','0','152','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('835','土默特左旗','0','152','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('836','托克托县','0','152','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('837','和林格尔县','0','152','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('838','清水河县','0','152','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('839','武川县','0','152','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('840','东河区','0','153','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('841','昆都仑区','0','153','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('842','青山区','0','153','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('843','石拐区','0','153','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('844','白云矿区','0','153','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('845','九原区','0','153','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('846','土默特右旗','0','153','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('847','固阳县','0','153','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('848','达尔罕茂明安联合旗','0','153','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('849','海勃湾区','0','154','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('850','海南区','0','154','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('851','乌达区','0','154','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('852','红山区','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('853','元宝山区','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('854','松山区','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('855','阿鲁科尔沁旗','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('856','巴林左旗','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('857','巴林右旗','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('858','林西县','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('859','克什克腾旗','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('860','翁牛特旗','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('861','喀喇沁旗','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('862','宁城县','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('863','敖汉旗','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('864','科尔沁区','0','156','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('865','科尔沁左翼中旗','0','156','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('866','科尔沁左翼后旗','0','156','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('867','开鲁县','0','156','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('868','库伦旗','0','156','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('869','奈曼旗','0','156','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('870','扎鲁特旗','0','156','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('871','霍林郭勒市','0','156','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('872','东胜区','0','157','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('873','达拉特旗','0','157','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('874','准格尔旗','0','157','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('875','鄂托克前旗','0','157','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('876','鄂托克旗','0','157','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('877','杭锦旗','0','157','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('878','乌审旗','0','157','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('879','伊金霍洛旗','0','157','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('880','海拉尔区','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('881','阿荣旗','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('882','莫力达瓦达斡尔族自治旗','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('883','鄂伦春自治旗','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('884','鄂温克族自治旗','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('885','陈巴尔虎旗','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('886','新巴尔虎左旗','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('887','新巴尔虎右旗','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('888','满洲里市','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('889','牙克石市','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('890','扎兰屯市','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('891','额尔古纳市','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('892','根河市','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('893','临河区','0','159','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('894','五原县','0','159','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('895','磴口县','0','159','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('896','乌拉特前旗','0','159','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('897','乌拉特中旗','0','159','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('898','乌拉特后旗','0','159','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('899','杭锦后旗','0','159','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('900','集宁区','0','160','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('901','卓资县','0','160','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('902','化德县','0','160','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('903','商都县','0','160','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('904','兴和县','0','160','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('905','凉城县','0','160','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('906','察哈尔右翼前旗','0','160','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('907','察哈尔右翼中旗','0','160','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('908','察哈尔右翼后旗','0','160','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('909','四子王旗','0','160','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('910','丰镇市','0','160','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('911','乌兰浩特市','0','161','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('912','阿尔山市','0','161','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('913','科尔沁右翼前旗','0','161','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('914','科尔沁右翼中旗','0','161','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('915','扎赉特旗','0','161','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('916','突泉县','0','161','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('917','二连浩特市','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('918','锡林浩特市','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('919','阿巴嘎旗','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('920','苏尼特左旗','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('921','苏尼特右旗','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('922','东乌珠穆沁旗','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('923','西乌珠穆沁旗','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('924','太仆寺旗','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('925','镶黄旗','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('926','正镶白旗','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('927','正蓝旗','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('928','多伦县','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('929','阿拉善左旗','0','163','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('930','阿拉善右旗','0','163','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('931','额济纳旗','0','163','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('932','和平区','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('933','沈河区','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('934','大东区','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('935','皇姑区','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('936','铁西区','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('937','苏家屯区','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('938','东陵区','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('939','新城子区','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('940','于洪区','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('941','辽中县','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('942','康平县','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('943','法库县','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('944','新民市','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('945','中山区','0','165','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('946','西岗区','0','165','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('947','沙河口区','0','165','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('948','甘井子区','0','165','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('949','旅顺口区','0','165','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('950','金州区','0','165','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('951','长海县','0','165','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('952','瓦房店市','0','165','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('953','普兰店市','0','165','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('954','庄河市','0','165','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('955','铁东区','0','166','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('956','铁西区','0','166','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('957','立山区','0','166','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('958','千山区','0','166','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('959','台安县','0','166','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('960','岫岩满族自治县','0','166','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('961','海城市','0','166','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('962','新抚区','0','167','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('963','东洲区','0','167','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('964','望花区','0','167','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('965','顺城区','0','167','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('966','抚顺县','0','167','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('967','新宾满族自治县','0','167','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('968','清原满族自治县','0','167','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('969','平山区','0','168','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('970','溪湖区','0','168','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('971','明山区','0','168','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('972','南芬区','0','168','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('973','本溪满族自治县','0','168','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('974','桓仁满族自治县','0','168','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('975','元宝区','0','169','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('976','振兴区','0','169','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('977','振安区','0','169','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('978','宽甸满族自治县','0','169','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('979','东港市','0','169','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('980','凤城市','0','169','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('981','古塔区','0','170','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('982','凌河区','0','170','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('983','太和区','0','170','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('984','黑山县','0','170','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('985','义县','0','170','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('986','凌海市','0','170','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('987','北镇市','0','170','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('988','站前区','0','171','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('989','西市区','0','171','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('990','鲅鱼圈区','0','171','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('991','老边区','0','171','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('992','盖州市','0','171','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('993','大石桥市','0','171','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('994','海州区','0','172','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('995','新邱区','0','172','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('996','太平区','0','172','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('997','清河门区','0','172','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('998','细河区','0','172','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('999','阜新蒙古族自治县','0','172','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1000','彰武县','0','172','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1001','白塔区','0','173','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1002','文圣区','0','173','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1003','宏伟区','0','173','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1004','弓长岭区','0','173','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1005','太子河区','0','173','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1006','辽阳县','0','173','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1007','灯塔市','0','173','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1008','双台子区','0','174','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1009','兴隆台区','0','174','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1010','大洼县','0','174','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1011','盘山县','0','174','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1012','银州区','0','175','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1013','清河区','0','175','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1014','铁岭县','0','175','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1015','西丰县','0','175','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1016','昌图县','0','175','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1017','调兵山市','0','175','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1018','开原市','0','175','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1019','双塔区','0','176','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1020','龙城区','0','176','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1021','朝阳县','0','176','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1022','建平县','0','176','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1023','喀喇沁左翼蒙古族自治县','0','176','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1024','北票市','0','176','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1025','凌源市','0','176','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1026','连山区','0','177','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1027','龙港区','0','177','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1028','南票区','0','177','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1029','绥中县','0','177','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1030','建昌县','0','177','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1031','兴城市','0','177','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1032','南关区','0','178','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1033','宽城区','0','178','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1034','朝阳区','0','178','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1035','二道区','0','178','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1036','绿园区','0','178','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1037','双阳区','0','178','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1038','农安县','0','178','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1039','九台市','0','178','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1040','榆树市','0','178','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1041','德惠市','0','178','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1042','昌邑区','0','179','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1043','龙潭区','0','179','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1044','船营区','0','179','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1045','丰满区','0','179','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1046','永吉县','0','179','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1047','蛟河市','0','179','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1048','桦甸市','0','179','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1049','舒兰市','0','179','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1050','磐石市','0','179','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1051','铁西区','0','180','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1052','铁东区','0','180','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1053','梨树县','0','180','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1054','伊通满族自治县','0','180','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1055','公主岭市','0','180','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1056','双辽市','0','180','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1057','龙山区','0','181','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1058','西安区','0','181','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1059','东丰县','0','181','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1060','东辽县','0','181','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1061','东昌区','0','182','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1062','二道江区','0','182','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1063','通化县','0','182','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1064','辉南县','0','182','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1065','柳河县','0','182','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1066','梅河口市','0','182','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1067','集安市','0','182','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1068','八道江区','0','183','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1069','抚松县','0','183','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1070','靖宇县','0','183','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1071','长白朝鲜族自治县','0','183','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1072','江源县','0','183','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1073','临江市','0','183','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1074','宁江区','0','184','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1075','前郭尔罗斯蒙古族自治县','0','184','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1076','长岭县','0','184','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1077','乾安县','0','184','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1078','扶余县','0','184','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1079','洮北区','0','185','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1080','镇赉县','0','185','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1081','通榆县','0','185','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1082','洮南市','0','185','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1083','大安市','0','185','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1084','延吉市','0','186','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1085','图们市','0','186','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1086','敦化市','0','186','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1087','珲春市','0','186','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1088','龙井市','0','186','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1089','和龙市','0','186','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1090','汪清县','0','186','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1091','安图县','0','186','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1092','道里区','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1093','南岗区','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1094','道外区','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1095','香坊区','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1096','动力区','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1097','平房区','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1098','松北区','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1099','呼兰区','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1100','依兰县','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1101','方正县','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1102','宾县','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1103','巴彦县','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1104','木兰县','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1105','通河县','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1106','延寿县','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1107','阿城市','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1108','双城市','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1109','尚志市','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1110','五常市','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1111','龙沙区','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1112','建华区','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1113','铁锋区','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1114','昂昂溪区','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1115','富拉尔基区','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1116','碾子山区','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1117','梅里斯达斡尔族区','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1118','龙江县','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1119','依安县','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1120','泰来县','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1121','甘南县','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1122','富裕县','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1123','克山县','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1124','克东县','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1125','拜泉县','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1126','讷河市','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1127','鸡冠区','0','189','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1128','恒山区','0','189','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1129','滴道区','0','189','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1130','梨树区','0','189','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1131','城子河区','0','189','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1132','麻山区','0','189','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1133','鸡东县','0','189','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1134','虎林市','0','189','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1135','密山市','0','189','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1136','向阳区','0','190','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1137','工农区','0','190','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1138','南山区','0','190','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1139','兴安区','0','190','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1140','东山区','0','190','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1141','兴山区','0','190','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1142','萝北县','0','190','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1143','绥滨县','0','190','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1144','尖山区','0','191','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1145','岭东区','0','191','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1146','四方台区','0','191','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1147','宝山区','0','191','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1148','集贤县','0','191','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1149','友谊县','0','191','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1150','宝清县','0','191','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1151','饶河县','0','191','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1152','萨尔图区','0','192','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1153','龙凤区','0','192','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1154','让胡路区','0','192','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1155','红岗区','0','192','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1156','大同区','0','192','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1157','肇州县','0','192','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1158','肇源县','0','192','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1159','林甸县','0','192','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1160','杜尔伯特蒙古族自治县','0','192','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1161','伊春区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1162','南岔区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1163','友好区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1164','西林区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1165','翠峦区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1166','新青区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1167','美溪区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1168','金山屯区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1169','五营区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1170','乌马河区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1171','汤旺河区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1172','带岭区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1173','乌伊岭区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1174','红星区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1175','上甘岭区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1176','嘉荫县','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1177','铁力市','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1178','永红区','0','194','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1179','向阳区','0','194','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1180','前进区','0','194','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1181','东风区','0','194','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1182','郊区','0','194','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1183','桦南县','0','194','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1184','桦川县','0','194','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1185','汤原县','0','194','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1186','抚远县','0','194','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1187','同江市','0','194','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1188','富锦市','0','194','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1189','新兴区','0','195','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1190','桃山区','0','195','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1191','茄子河区','0','195','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1192','勃利县','0','195','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1193','东安区','0','196','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1194','阳明区','0','196','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1195','爱民区','0','196','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1196','西安区','0','196','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1197','东宁县','0','196','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1198','林口县','0','196','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1199','绥芬河市','0','196','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1200','海林市','0','196','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1201','宁安市','0','196','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1202','穆棱市','0','196','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1203','爱辉区','0','197','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1204','嫩江县','0','197','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1205','逊克县','0','197','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1206','孙吴县','0','197','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1207','北安市','0','197','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1208','五大连池市','0','197','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1209','北林区','0','198','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1210','望奎县','0','198','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1211','兰西县','0','198','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1212','青冈县','0','198','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1213','庆安县','0','198','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1214','明水县','0','198','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1215','绥棱县','0','198','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1216','安达市','0','198','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1217','肇东市','0','198','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1218','海伦市','0','198','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1219','呼玛县','0','199','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1220','塔河县','0','199','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1221','漠河县','0','199','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1222','玄武区','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1223','白下区','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1224','秦淮区','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1225','建邺区','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1226','鼓楼区','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1227','下关区','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1228','浦口区','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1229','栖霞区','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1230','雨花台区','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1231','江宁区','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1232','六合区','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1233','溧水县','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1234','高淳县','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1235','崇安区','0','201','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1236','南长区','0','201','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1237','北塘区','0','201','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1238','锡山区','0','201','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1239','惠山区','0','201','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1240','滨湖区','0','201','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1241','江阴市','0','201','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1242','宜兴市','0','201','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1243','鼓楼区','0','202','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1244','云龙区','0','202','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1245','九里区','0','202','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1246','贾汪区','0','202','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1247','泉山区','0','202','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1248','丰县','0','202','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1249','沛县','0','202','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1250','铜山县','0','202','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1251','睢宁县','0','202','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1252','新沂市','0','202','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1253','邳州市','0','202','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1254','天宁区','0','203','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1255','钟楼区','0','203','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1256','戚墅堰区','0','203','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1257','新北区','0','203','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1258','武进区','0','203','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1259','溧阳市','0','203','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1260','金坛市','0','203','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1261','沧浪区','0','204','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1262','平江区','0','204','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1263','金阊区','0','204','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1264','虎丘区','0','204','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1265','吴中区','0','204','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1266','相城区','0','204','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1267','常熟市','0','204','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1268','张家港市','0','204','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1269','昆山市','0','204','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1270','吴江市','0','204','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1271','太仓市','0','204','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1272','崇川区','0','205','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1273','港闸区','0','205','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1274','海安县','0','205','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1275','如东县','0','205','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1276','启东市','0','205','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1277','如皋市','0','205','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1278','通州市','0','205','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1279','海门市','0','205','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1280','连云区','0','206','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1281','新浦区','0','206','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1282','海州区','0','206','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1283','赣榆县','0','206','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1284','东海县','0','206','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1285','灌云县','0','206','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1286','灌南县','0','206','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1287','清河区','0','207','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1288','楚州区','0','207','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1289','淮阴区','0','207','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1290','清浦区','0','207','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1291','涟水县','0','207','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1292','洪泽县','0','207','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1293','盱眙县','0','207','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1294','金湖县','0','207','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1295','亭湖区','0','208','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1296','盐都区','0','208','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1297','响水县','0','208','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1298','滨海县','0','208','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1299','阜宁县','0','208','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1300','射阳县','0','208','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1301','建湖县','0','208','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1302','东台市','0','208','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1303','大丰市','0','208','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1304','广陵区','0','209','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1305','邗江区','0','209','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1306','维扬区','0','209','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1307','宝应县','0','209','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1308','仪征市','0','209','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1309','高邮市','0','209','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1310','江都市','0','209','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1311','京口区','0','210','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1312','润州区','0','210','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1313','丹徒区','0','210','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1314','丹阳市','0','210','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1315','扬中市','0','210','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1316','句容市','0','210','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1317','海陵区','0','211','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1318','高港区','0','211','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1319','兴化市','0','211','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1320','靖江市','0','211','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1321','泰兴市','0','211','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1322','姜堰市','0','211','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1323','宿城区','0','212','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1324','宿豫区','0','212','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1325','沭阳县','0','212','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1326','泗阳县','0','212','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1327','泗洪县','0','212','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1328','上城区','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1329','下城区','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1330','江干区','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1331','拱墅区','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1332','西湖区','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1333','滨江区','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1334','萧山区','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1335','余杭区','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1336','桐庐县','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1337','淳安县','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1338','建德市','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1339','富阳市','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1340','临安市','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1341','海曙区','0','214','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1342','江东区','0','214','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1343','江北区','0','214','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1344','北仑区','0','214','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1345','镇海区','0','214','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1346','鄞州区','0','214','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1347','象山县','0','214','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1348','宁海县','0','214','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1349','余姚市','0','214','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1350','慈溪市','0','214','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1351','奉化市','0','214','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1352','鹿城区','0','215','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1353','龙湾区','0','215','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1354','瓯海区','0','215','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1355','洞头县','0','215','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1356','永嘉县','0','215','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1357','平阳县','0','215','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1358','苍南县','0','215','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1359','文成县','0','215','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1360','泰顺县','0','215','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1361','瑞安市','0','215','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1362','乐清市','0','215','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1363','秀城区','0','216','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1364','秀洲区','0','216','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1365','嘉善县','0','216','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1366','海盐县','0','216','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1367','海宁市','0','216','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1368','平湖市','0','216','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1369','桐乡市','0','216','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1370','吴兴区','0','217','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1371','南浔区','0','217','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1372','德清县','0','217','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1373','长兴县','0','217','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1374','安吉县','0','217','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1375','越城区','0','218','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1376','绍兴县','0','218','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1377','新昌县','0','218','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1378','诸暨市','0','218','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1379','上虞市','0','218','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1380','嵊州市','0','218','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1381','婺城区','0','219','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1382','金东区','0','219','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1383','武义县','0','219','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1384','浦江县','0','219','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1385','磐安县','0','219','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1386','兰溪市','0','219','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1387','义乌市','0','219','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1388','东阳市','0','219','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1389','永康市','0','219','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1390','柯城区','0','220','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1391','衢江区','0','220','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1392','常山县','0','220','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1393','开化县','0','220','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1394','龙游县','0','220','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1395','江山市','0','220','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1396','定海区','0','221','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1397','普陀区','0','221','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1398','岱山县','0','221','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1399','嵊泗县','0','221','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1400','椒江区','0','222','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1401','黄岩区','0','222','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1402','路桥区','0','222','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1403','玉环县','0','222','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1404','三门县','0','222','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1405','天台县','0','222','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1406','仙居县','0','222','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1407','温岭市','0','222','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1408','临海市','0','222','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1409','莲都区','0','223','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1410','青田县','0','223','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1411','缙云县','0','223','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1412','遂昌县','0','223','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1413','松阳县','0','223','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1414','云和县','0','223','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1415','庆元县','0','223','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1416','景宁畲族自治县','0','223','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1417','龙泉市','0','223','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1418','瑶海区','0','224','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1419','庐阳区','0','224','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1420','蜀山区','0','224','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1421','包河区','0','224','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1422','长丰县','0','224','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1423','肥东县','0','224','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1424','肥西县','0','224','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1425','镜湖区','0','225','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1426','弋江区','0','225','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1427','鸠江区','0','225','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1428','三山区','0','225','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1429','芜湖县','0','225','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1430','繁昌县','0','225','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1431','南陵县','0','225','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1432','龙子湖区','0','226','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1433','蚌山区','0','226','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1434','禹会区','0','226','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1435','淮上区','0','226','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1436','怀远县','0','226','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1437','五河县','0','226','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1438','固镇县','0','226','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1439','大通区','0','227','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1440','田家庵区','0','227','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1441','谢家集区','0','227','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1442','八公山区','0','227','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1443','潘集区','0','227','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1444','凤台县','0','227','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1445','金家庄区','0','228','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1446','花山区','0','228','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1447','雨山区','0','228','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1448','当涂县','0','228','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1449','杜集区','0','229','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1450','相山区','0','229','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1451','烈山区','0','229','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1452','濉溪县','0','229','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1453','铜官山区','0','230','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1454','狮子山区','0','230','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1455','郊区','0','230','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1456','铜陵县','0','230','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1457','迎江区','0','231','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1458','大观区','0','231','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1459','宜秀区','0','231','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1460','怀宁县','0','231','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1461','枞阳县','0','231','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1462','潜山县','0','231','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1463','太湖县','0','231','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1464','宿松县','0','231','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1465','望江县','0','231','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1466','岳西县','0','231','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1467','桐城市','0','231','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1468','屯溪区','0','232','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1469','黄山区','0','232','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1470','徽州区','0','232','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1471','歙县','0','232','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1472','休宁县','0','232','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1473','黟县','0','232','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1474','祁门县','0','232','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1475','琅琊区','0','233','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1476','南谯区','0','233','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1477','来安县','0','233','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1478','全椒县','0','233','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1479','定远县','0','233','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1480','凤阳县','0','233','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1481','天长市','0','233','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1482','明光市','0','233','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1483','颍州区','0','234','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1484','颍东区','0','234','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1485','颍泉区','0','234','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1486','临泉县','0','234','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1487','太和县','0','234','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1488','阜南县','0','234','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1489','颍上县','0','234','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1490','界首市','0','234','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1491','埇桥区','0','235','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1492','砀山县','0','235','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1493','萧县','0','235','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1494','灵璧县','0','235','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1495','泗县','0','235','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1496','居巢区','0','236','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1497','庐江县','0','236','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1498','无为县','0','236','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1499','含山县','0','236','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1500','和县','0','236','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1501','金安区','0','237','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1502','裕安区','0','237','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1503','寿县','0','237','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1504','霍邱县','0','237','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1505','舒城县','0','237','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1506','金寨县','0','237','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1507','霍山县','0','237','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1508','谯城区','0','238','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1509','涡阳县','0','238','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1510','蒙城县','0','238','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1511','利辛县','0','238','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1512','贵池区','0','239','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1513','东至县','0','239','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1514','石台县','0','239','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1515','青阳县','0','239','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1516','宣州区','0','240','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1517','郎溪县','0','240','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1518','广德县','0','240','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1519','泾县','0','240','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1520','绩溪县','0','240','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1521','旌德县','0','240','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1522','宁国市','0','240','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1523','鼓楼区','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1524','台江区','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1525','仓山区','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1526','马尾区','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1527','晋安区','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1528','闽侯县','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1529','连江县','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1530','罗源县','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1531','闽清县','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1532','永泰县','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1533','平潭县','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1534','福清市','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1535','长乐市','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1536','思明区','0','242','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1537','海沧区','0','242','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1538','湖里区','0','242','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1539','集美区','0','242','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1540','同安区','0','242','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1541','翔安区','0','242','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1542','城厢区','0','243','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1543','涵江区','0','243','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1544','荔城区','0','243','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1545','秀屿区','0','243','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1546','仙游县','0','243','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1547','梅列区','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1548','三元区','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1549','明溪县','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1550','清流县','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1551','宁化县','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1552','大田县','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1553','尤溪县','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1554','沙县','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1555','将乐县','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1556','泰宁县','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1557','建宁县','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1558','永安市','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1559','鲤城区','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1560','丰泽区','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1561','洛江区','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1562','泉港区','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1563','惠安县','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1564','安溪县','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1565','永春县','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1566','德化县','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1567','金门县','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1568','石狮市','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1569','晋江市','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1570','南安市','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1571','芗城区','0','246','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1572','龙文区','0','246','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1573','云霄县','0','246','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1574','漳浦县','0','246','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1575','诏安县','0','246','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1576','长泰县','0','246','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1577','东山县','0','246','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1578','南靖县','0','246','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1579','平和县','0','246','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1580','华安县','0','246','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1581','龙海市','0','246','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1582','延平区','0','247','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1583','顺昌县','0','247','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1584','浦城县','0','247','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1585','光泽县','0','247','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1586','松溪县','0','247','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1587','政和县','0','247','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1588','邵武市','0','247','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1589','武夷山市','0','247','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1590','建瓯市','0','247','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1591','建阳市','0','247','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1592','新罗区','0','248','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1593','长汀县','0','248','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1594','永定县','0','248','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1595','上杭县','0','248','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1596','武平县','0','248','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1597','连城县','0','248','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1598','漳平市','0','248','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1599','蕉城区','0','249','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1600','霞浦县','0','249','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1601','古田县','0','249','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1602','屏南县','0','249','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1603','寿宁县','0','249','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1604','周宁县','0','249','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1605','柘荣县','0','249','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1606','福安市','0','249','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1607','福鼎市','0','249','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1608','东湖区','0','250','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1609','西湖区','0','250','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1610','青云谱区','0','250','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1611','湾里区','0','250','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1612','青山湖区','0','250','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1613','南昌县','0','250','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1614','新建县','0','250','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1615','安义县','0','250','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1616','进贤县','0','250','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1617','昌江区','0','251','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1618','珠山区','0','251','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1619','浮梁县','0','251','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1620','乐平市','0','251','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1621','安源区','0','252','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1622','湘东区','0','252','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1623','莲花县','0','252','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1624','上栗县','0','252','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1625','芦溪县','0','252','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1626','庐山区','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1627','浔阳区','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1628','九江县','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1629','武宁县','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1630','修水县','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1631','永修县','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1632','德安县','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1633','星子县','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1634','都昌县','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1635','湖口县','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1636','彭泽县','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1637','瑞昌市','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1638','渝水区','0','254','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1639','分宜县','0','254','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1640','月湖区','0','255','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1641','余江县','0','255','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1642','贵溪市','0','255','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1643','章贡区','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1644','赣县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1645','信丰县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1646','大余县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1647','上犹县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1648','崇义县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1649','安远县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1650','龙南县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1651','定南县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1652','全南县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1653','宁都县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1654','于都县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1655','兴国县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1656','会昌县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1657','寻乌县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1658','石城县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1659','瑞金市','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1660','南康市','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1661','吉州区','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1662','青原区','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1663','吉安县','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1664','吉水县','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1665','峡江县','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1666','新干县','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1667','永丰县','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1668','泰和县','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1669','遂川县','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1670','万安县','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1671','安福县','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1672','永新县','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1673','井冈山市','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1674','袁州区','0','258','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1675','奉新县','0','258','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1676','万载县','0','258','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1677','上高县','0','258','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1678','宜丰县','0','258','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1679','靖安县','0','258','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1680','铜鼓县','0','258','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1681','丰城市','0','258','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1682','樟树市','0','258','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1683','高安市','0','258','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1684','临川区','0','259','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1685','南城县','0','259','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1686','黎川县','0','259','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1687','南丰县','0','259','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1688','崇仁县','0','259','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1689','乐安县','0','259','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1690','宜黄县','0','259','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1691','金溪县','0','259','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1692','资溪县','0','259','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1693','东乡县','0','259','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1694','广昌县','0','259','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1695','信州区','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1696','上饶县','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1697','广丰县','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1698','玉山县','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1699','铅山县','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1700','横峰县','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1701','弋阳县','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1702','余干县','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1703','鄱阳县','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1704','万年县','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1705','婺源县','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1706','德兴市','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1707','历下区','0','261','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1708','市中区','0','261','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1709','槐荫区','0','261','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1710','天桥区','0','261','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1711','历城区','0','261','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1712','长清区','0','261','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1713','平阴县','0','261','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1714','济阳县','0','261','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1715','商河县','0','261','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1716','章丘市','0','261','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1717','市南区','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1718','市北区','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1719','四方区','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1720','黄岛区','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1721','崂山区','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1722','李沧区','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1723','城阳区','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1724','胶州市','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1725','即墨市','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1726','平度市','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1727','胶南市','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1728','莱西市','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1729','淄川区','0','263','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1730','张店区','0','263','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1731','博山区','0','263','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1732','临淄区','0','263','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1733','周村区','0','263','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1734','桓台县','0','263','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1735','高青县','0','263','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1736','沂源县','0','263','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1737','市中区','0','264','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1738','薛城区','0','264','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1739','峄城区','0','264','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1740','台儿庄区','0','264','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1741','山亭区','0','264','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1742','滕州市','0','264','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1743','东营区','0','265','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1744','河口区','0','265','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1745','垦利县','0','265','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1746','利津县','0','265','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1747','广饶县','0','265','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1748','芝罘区','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1749','福山区','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1750','牟平区','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1751','莱山区','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1752','长岛县','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1753','龙口市','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1754','莱阳市','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1755','莱州市','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1756','蓬莱市','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1757','招远市','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1758','栖霞市','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1759','海阳市','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1760','潍城区','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1761','寒亭区','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1762','坊子区','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1763','奎文区','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1764','临朐县','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1765','昌乐县','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1766','青州市','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1767','诸城市','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1768','寿光市','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1769','安丘市','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1770','高密市','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1771','昌邑市','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1772','市中区','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1773','任城区','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1774','微山县','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1775','鱼台县','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1776','金乡县','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1777','嘉祥县','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1778','汶上县','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1779','泗水县','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1780','梁山县','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1781','曲阜市','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1782','兖州市','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1783','邹城市','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1784','泰山区','0','269','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1785','岱岳区','0','269','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1786','宁阳县','0','269','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1787','东平县','0','269','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1788','新泰市','0','269','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1789','肥城市','0','269','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1790','环翠区','0','270','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1791','文登市','0','270','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1792','荣成市','0','270','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1793','乳山市','0','270','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1794','东港区','0','271','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1795','岚山区','0','271','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1796','五莲县','0','271','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1797','莒县','0','271','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1798','莱城区','0','272','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1799','钢城区','0','272','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1800','兰山区','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1801','罗庄区','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1802','河东区','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1803','沂南县','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1804','郯城县','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1805','沂水县','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1806','苍山县','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1807','费县','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1808','平邑县','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1809','莒南县','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1810','蒙阴县','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1811','临沭县','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1812','德城区','0','274','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1813','陵县','0','274','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1814','宁津县','0','274','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1815','庆云县','0','274','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1816','临邑县','0','274','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1817','齐河县','0','274','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1818','平原县','0','274','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1819','夏津县','0','274','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1820','武城县','0','274','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1821','乐陵市','0','274','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1822','禹城市','0','274','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1823','东昌府区','0','275','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1824','阳谷县','0','275','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1825','莘县','0','275','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1826','茌平县','0','275','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1827','东阿县','0','275','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1828','冠县','0','275','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1829','高唐县','0','275','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1830','临清市','0','275','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1831','滨城区','0','276','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1832','惠民县','0','276','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1833','阳信县','0','276','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1834','无棣县','0','276','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1835','沾化县','0','276','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1836','博兴县','0','276','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1837','邹平县','0','276','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1838','牡丹区','0','277','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1839','曹县','0','277','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1840','单县','0','277','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1841','成武县','0','277','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1842','巨野县','0','277','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1843','郓城县','0','277','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1844','鄄城县','0','277','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1845','定陶县','0','277','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1846','东明县','0','277','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1847','中原区','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1848','二七区','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1849','管城回族区','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1850','金水区','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1851','上街区','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1852','惠济区','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1853','中牟县','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1854','巩义市','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1855','荥阳市','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1856','新密市','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1857','新郑市','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1858','登封市','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1859','龙亭区','0','279','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1860','顺河回族区','0','279','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1861','鼓楼区','0','279','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1862','禹王台区','0','279','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1863','金明区','0','279','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1864','杞县','0','279','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1865','通许县','0','279','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1866','尉氏县','0','279','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1867','开封县','0','279','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1868','兰考县','0','279','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1869','老城区','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1870','西工区','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1871','廛河回族区','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1872','涧西区','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1873','吉利区','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1874','洛龙区','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1875','孟津县','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1876','新安县','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1877','栾川县','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1878','嵩县','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1879','汝阳县','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1880','宜阳县','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1881','洛宁县','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1882','伊川县','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1883','偃师市','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1884','新华区','0','281','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1885','卫东区','0','281','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1886','石龙区','0','281','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1887','湛河区','0','281','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1888','宝丰县','0','281','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1889','叶县','0','281','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1890','鲁山县','0','281','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1891','郏县','0','281','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1892','舞钢市','0','281','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1893','汝州市','0','281','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1894','文峰区','0','282','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1895','北关区','0','282','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1896','殷都区','0','282','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1897','龙安区','0','282','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1898','安阳县','0','282','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1899','汤阴县','0','282','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1900','滑县','0','282','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1901','内黄县','0','282','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1902','林州市','0','282','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1903','鹤山区','0','283','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1904','山城区','0','283','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1905','淇滨区','0','283','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1906','浚县','0','283','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1907','淇县','0','283','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1908','红旗区','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1909','卫滨区','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1910','凤泉区','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1911','牧野区','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1912','新乡县','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1913','获嘉县','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1914','原阳县','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1915','延津县','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1916','封丘县','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1917','长垣县','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1918','卫辉市','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1919','辉县市','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1920','解放区','0','285','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1921','中站区','0','285','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1922','马村区','0','285','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1923','山阳区','0','285','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1924','修武县','0','285','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1925','博爱县','0','285','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1926','武陟县','0','285','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1927','温县','0','285','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1928','济源市','0','285','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1929','沁阳市','0','285','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1930','孟州市','0','285','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1931','华龙区','0','286','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1932','清丰县','0','286','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1933','南乐县','0','286','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1934','范县','0','286','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1935','台前县','0','286','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1936','濮阳县','0','286','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1937','魏都区','0','287','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1938','许昌县','0','287','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1939','鄢陵县','0','287','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1940','襄城县','0','287','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1941','禹州市','0','287','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1942','长葛市','0','287','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1943','源汇区','0','288','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1944','郾城区','0','288','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1945','召陵区','0','288','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1946','舞阳县','0','288','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1947','临颍县','0','288','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1948','湖滨区','0','289','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1949','渑池县','0','289','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1950','陕县','0','289','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1951','卢氏县','0','289','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1952','义马市','0','289','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1953','灵宝市','0','289','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1954','宛城区','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1955','卧龙区','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1956','南召县','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1957','方城县','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1958','西峡县','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1959','镇平县','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1960','内乡县','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1961','淅川县','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1962','社旗县','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1963','唐河县','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1964','新野县','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1965','桐柏县','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1966','邓州市','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1967','梁园区','0','291','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1968','睢阳区','0','291','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1969','民权县','0','291','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1970','睢县','0','291','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1971','宁陵县','0','291','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1972','柘城县','0','291','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1973','虞城县','0','291','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1974','夏邑县','0','291','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1975','永城市','0','291','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1976','浉河区','0','292','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1977','平桥区','0','292','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1978','罗山县','0','292','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1979','光山县','0','292','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1980','新县','0','292','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1981','商城县','0','292','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1982','固始县','0','292','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1983','潢川县','0','292','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1984','淮滨县','0','292','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1985','息县','0','292','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1986','川汇区','0','293','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1987','扶沟县','0','293','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1988','西华县','0','293','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1989','商水县','0','293','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1990','沈丘县','0','293','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1991','郸城县','0','293','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1992','淮阳县','0','293','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1993','太康县','0','293','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1994','鹿邑县','0','293','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1995','项城市','0','293','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1996','驿城区','0','294','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1997','西平县','0','294','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1998','上蔡县','0','294','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1999','平舆县','0','294','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2000','正阳县','0','294','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2001','确山县','0','294','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2002','泌阳县','0','294','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2003','汝南县','0','294','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2004','遂平县','0','294','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2005','新蔡县','0','294','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2006','江岸区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2007','江汉区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2008','硚口区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2009','汉阳区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2010','武昌区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2011','青山区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2012','洪山区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2013','东西湖区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2014','汉南区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2015','蔡甸区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2016','江夏区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2017','黄陂区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2018','新洲区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2019','黄石港区','0','296','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2020','西塞山区','0','296','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2021','下陆区','0','296','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2022','铁山区','0','296','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2023','阳新县','0','296','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2024','大冶市','0','296','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2025','茅箭区','0','297','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2026','张湾区','0','297','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2027','郧县','0','297','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2028','郧西县','0','297','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2029','竹山县','0','297','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2030','竹溪县','0','297','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2031','房县','0','297','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2032','丹江口市','0','297','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2033','西陵区','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2034','伍家岗区','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2035','点军区','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2036','猇亭区','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2037','夷陵区','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2038','远安县','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2039','兴山县','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2040','秭归县','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2041','长阳土家族自治县','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2042','五峰土家族自治县','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2043','宜都市','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2044','当阳市','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2045','枝江市','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2046','襄城区','0','299','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2047','樊城区','0','299','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2048','襄阳区','0','299','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2049','南漳县','0','299','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2050','谷城县','0','299','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2051','保康县','0','299','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2052','老河口市','0','299','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2053','枣阳市','0','299','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2054','宜城市','0','299','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2055','梁子湖区','0','300','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2056','华容区','0','300','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2057','鄂城区','0','300','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2058','东宝区','0','301','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2059','掇刀区','0','301','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2060','京山县','0','301','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2061','沙洋县','0','301','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2062','钟祥市','0','301','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2063','孝南区','0','302','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2064','孝昌县','0','302','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2065','大悟县','0','302','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2066','云梦县','0','302','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2067','应城市','0','302','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2068','安陆市','0','302','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2069','汉川市','0','302','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2070','沙市区','0','303','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2071','荆州区','0','303','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2072','公安县','0','303','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2073','监利县','0','303','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2074','江陵县','0','303','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2075','石首市','0','303','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2076','洪湖市','0','303','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2077','松滋市','0','303','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2078','黄州区','0','304','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2079','团风县','0','304','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2080','红安县','0','304','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2081','罗田县','0','304','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2082','英山县','0','304','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2083','浠水县','0','304','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2084','蕲春县','0','304','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2085','黄梅县','0','304','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2086','麻城市','0','304','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2087','武穴市','0','304','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2088','咸安区','0','305','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2089','嘉鱼县','0','305','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2090','通城县','0','305','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2091','崇阳县','0','305','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2092','通山县','0','305','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2093','赤壁市','0','305','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2094','曾都区','0','306','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2095','广水市','0','306','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2096','恩施市','0','307','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2097','利川市','0','307','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2098','建始县','0','307','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2099','巴东县','0','307','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2100','宣恩县','0','307','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2101','咸丰县','0','307','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2102','来凤县','0','307','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2103','鹤峰县','0','307','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2104','芙蓉区','0','312','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2105','天心区','0','312','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2106','岳麓区','0','312','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2107','开福区','0','312','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2108','雨花区','0','312','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2109','长沙县','0','312','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2110','望城县','0','312','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2111','宁乡县','0','312','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2112','浏阳市','0','312','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2113','荷塘区','0','313','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2114','芦淞区','0','313','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2115','石峰区','0','313','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2116','天元区','0','313','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2117','株洲县','0','313','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2118','攸县','0','313','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2119','茶陵县','0','313','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2120','炎陵县','0','313','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2121','醴陵市','0','313','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2122','雨湖区','0','314','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2123','岳塘区','0','314','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2124','湘潭县','0','314','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2125','湘乡市','0','314','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2126','韶山市','0','314','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2127','珠晖区','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2128','雁峰区','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2129','石鼓区','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2130','蒸湘区','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2131','南岳区','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2132','衡阳县','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2133','衡南县','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2134','衡山县','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2135','衡东县','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2136','祁东县','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2137','耒阳市','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2138','常宁市','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2139','双清区','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2140','大祥区','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2141','北塔区','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2142','邵东县','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2143','新邵县','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2144','邵阳县','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2145','隆回县','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2146','洞口县','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2147','绥宁县','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2148','新宁县','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2149','城步苗族自治县','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2150','武冈市','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2151','岳阳楼区','0','317','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2152','云溪区','0','317','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2153','君山区','0','317','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2154','岳阳县','0','317','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2155','华容县','0','317','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2156','湘阴县','0','317','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2157','平江县','0','317','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2158','汨罗市','0','317','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2159','临湘市','0','317','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2160','武陵区','0','318','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2161','鼎城区','0','318','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2162','安乡县','0','318','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2163','汉寿县','0','318','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2164','澧县','0','318','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2165','临澧县','0','318','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2166','桃源县','0','318','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2167','石门县','0','318','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2168','津市市','0','318','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2169','永定区','0','319','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2170','武陵源区','0','319','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2171','慈利县','0','319','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2172','桑植县','0','319','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2173','资阳区','0','320','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2174','赫山区','0','320','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2175','南县','0','320','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2176','桃江县','0','320','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2177','安化县','0','320','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2178','沅江市','0','320','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2179','北湖区','0','321','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2180','苏仙区','0','321','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2181','桂阳县','0','321','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2182','宜章县','0','321','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2183','永兴县','0','321','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2184','嘉禾县','0','321','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2185','临武县','0','321','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2186','汝城县','0','321','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2187','桂东县','0','321','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2188','安仁县','0','321','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2189','资兴市','0','321','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2190','零陵区','0','322','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2191','冷水滩区','0','322','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2192','祁阳县','0','322','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2193','东安县','0','322','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2194','双牌县','0','322','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2195','道县','0','322','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2196','江永县','0','322','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2197','宁远县','0','322','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2198','蓝山县','0','322','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2199','新田县','0','322','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2200','江华瑶族自治县','0','322','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2201','鹤城区','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2202','中方县','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2203','沅陵县','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2204','辰溪县','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2205','溆浦县','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2206','会同县','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2207','麻阳苗族自治县','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2208','新晃侗族自治县','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2209','芷江侗族自治县','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2210','靖州苗族侗族自治县','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2211','通道侗族自治县','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2212','洪江市','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2213','娄星区','0','324','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2214','双峰县','0','324','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2215','新化县','0','324','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2216','冷水江市','0','324','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2217','涟源市','0','324','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2218','吉首市','0','325','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2219','泸溪县','0','325','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2220','凤凰县','0','325','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2221','花垣县','0','325','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2222','保靖县','0','325','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2223','古丈县','0','325','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2224','永顺县','0','325','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2225','龙山县','0','325','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2226','荔湾区','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2227','越秀区','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2228','海珠区','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2229','天河区','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2230','白云区','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2231','黄埔区','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2232','番禺区','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2233','花都区','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2234','南沙区','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2235','萝岗区','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2236','增城市','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2237','从化市','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2238','武江区','0','327','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2239','浈江区','0','327','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2240','曲江区','0','327','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2241','始兴县','0','327','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2242','仁化县','0','327','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2243','翁源县','0','327','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2244','乳源瑶族自治县','0','327','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2245','新丰县','0','327','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2246','乐昌市','0','327','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2247','南雄市','0','327','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2248','罗湖区','0','328','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2249','福田区','0','328','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2250','南山区','0','328','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2251','宝安区','0','328','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2252','龙岗区','0','328','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2253','盐田区','0','328','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2254','香洲区','0','329','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2255','斗门区','0','329','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2256','金湾区','0','329','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2257','龙湖区','0','330','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2258','金平区','0','330','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2259','濠江区','0','330','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2260','潮阳区','0','330','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2261','潮南区','0','330','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2262','澄海区','0','330','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2263','南澳县','0','330','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2264','禅城区','0','331','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2265','南海区','0','331','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2266','顺德区','0','331','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2267','三水区','0','331','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2268','高明区','0','331','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2269','蓬江区','0','332','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2270','江海区','0','332','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2271','新会区','0','332','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2272','台山市','0','332','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2273','开平市','0','332','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2274','鹤山市','0','332','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2275','恩平市','0','332','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2276','赤坎区','0','333','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2277','霞山区','0','333','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2278','坡头区','0','333','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2279','麻章区','0','333','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2280','遂溪县','0','333','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2281','徐闻县','0','333','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2282','廉江市','0','333','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2283','雷州市','0','333','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2284','吴川市','0','333','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2285','茂南区','0','334','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2286','茂港区','0','334','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2287','电白县','0','334','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2288','高州市','0','334','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2289','化州市','0','334','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2290','信宜市','0','334','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2291','端州区','0','335','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2292','鼎湖区','0','335','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2293','广宁县','0','335','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2294','怀集县','0','335','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2295','封开县','0','335','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2296','德庆县','0','335','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2297','高要市','0','335','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2298','四会市','0','335','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2299','惠城区','0','336','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2300','惠阳区','0','336','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2301','博罗县','0','336','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2302','惠东县','0','336','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2303','龙门县','0','336','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2304','梅江区','0','337','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2305','梅县','0','337','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2306','大埔县','0','337','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2307','丰顺县','0','337','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2308','五华县','0','337','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2309','平远县','0','337','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2310','蕉岭县','0','337','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2311','兴宁市','0','337','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2312','城区','0','338','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2313','海丰县','0','338','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2314','陆河县','0','338','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2315','陆丰市','0','338','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2316','源城区','0','339','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2317','紫金县','0','339','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2318','龙川县','0','339','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2319','连平县','0','339','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2320','和平县','0','339','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2321','东源县','0','339','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2322','江城区','0','340','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2323','阳西县','0','340','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2324','阳东县','0','340','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2325','阳春市','0','340','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2326','清城区','0','341','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2327','佛冈县','0','341','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2328','阳山县','0','341','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2329','连山壮族瑶族自治县','0','341','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2330','连南瑶族自治县','0','341','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2331','清新县','0','341','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2332','英德市','0','341','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2333','连州市','0','341','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2334','湘桥区','0','344','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2335','潮安县','0','344','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2336','饶平县','0','344','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2337','榕城区','0','345','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2338','揭东县','0','345','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2339','揭西县','0','345','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2340','惠来县','0','345','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2341','普宁市','0','345','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2342','云城区','0','346','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2343','新兴县','0','346','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2344','郁南县','0','346','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2345','云安县','0','346','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2346','罗定市','0','346','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2347','兴宁区','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2348','青秀区','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2349','江南区','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2350','西乡塘区','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2351','良庆区','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2352','邕宁区','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2353','武鸣县','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2354','隆安县','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2355','马山县','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2356','上林县','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2357','宾阳县','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2358','横县','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2359','城中区','0','348','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2360','鱼峰区','0','348','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2361','柳南区','0','348','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2362','柳北区','0','348','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2363','柳江县','0','348','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2364','柳城县','0','348','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2365','鹿寨县','0','348','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2366','融安县','0','348','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2367','融水苗族自治县','0','348','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2368','三江侗族自治县','0','348','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2369','秀峰区','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2370','叠彩区','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2371','象山区','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2372','七星区','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2373','雁山区','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2374','阳朔县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2375','临桂县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2376','灵川县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2377','全州县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2378','兴安县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2379','永福县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2380','灌阳县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2381','龙胜各族自治县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2382','资源县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2383','平乐县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2384','荔蒲县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2385','恭城瑶族自治县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2386','万秀区','0','350','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2387','蝶山区','0','350','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2388','长洲区','0','350','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2389','苍梧县','0','350','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2390','藤县','0','350','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2391','蒙山县','0','350','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2392','岑溪市','0','350','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2393','海城区','0','351','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2394','银海区','0','351','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2395','铁山港区','0','351','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2396','合浦县','0','351','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2397','港口区','0','352','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2398','防城区','0','352','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2399','上思县','0','352','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2400','东兴市','0','352','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2401','钦南区','0','353','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2402','钦北区','0','353','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2403','灵山县','0','353','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2404','浦北县','0','353','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2405','港北区','0','354','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2406','港南区','0','354','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2407','覃塘区','0','354','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2408','平南县','0','354','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2409','桂平市','0','354','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2410','玉州区','0','355','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2411','容县','0','355','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2412','陆川县','0','355','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2413','博白县','0','355','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2414','兴业县','0','355','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2415','北流市','0','355','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2416','右江区','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2417','田阳县','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2418','田东县','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2419','平果县','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2420','德保县','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2421','靖西县','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2422','那坡县','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2423','凌云县','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2424','乐业县','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2425','田林县','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2426','西林县','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2427','隆林各族自治县','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2428','八步区','0','357','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2429','昭平县','0','357','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2430','钟山县','0','357','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2431','富川瑶族自治县','0','357','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2432','金城江区','0','358','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2433','南丹县','0','358','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2434','天峨县','0','358','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2435','凤山县','0','358','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2436','东兰县','0','358','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2437','罗城仫佬族自治县','0','358','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2438','环江毛南族自治县','0','358','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2439','巴马瑶族自治县','0','358','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2440','都安瑶族自治县','0','358','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2441','大化瑶族自治县','0','358','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2442','宜州市','0','358','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2443','兴宾区','0','359','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2444','忻城县','0','359','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2445','象州县','0','359','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2446','武宣县','0','359','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2447','金秀瑶族自治县','0','359','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2448','合山市','0','359','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2449','江洲区','0','360','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2450','扶绥县','0','360','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2451','宁明县','0','360','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2452','龙州县','0','360','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2453','大新县','0','360','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2454','天等县','0','360','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2455','凭祥市','0','360','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2456','秀英区','0','361','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2457','龙华区','0','361','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2458','琼山区','0','361','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2459','美兰区','0','361','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2460','锦江区','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2461','青羊区','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2462','金牛区','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2463','武侯区','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2464','成华区','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2465','龙泉驿区','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2466','青白江区','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2467','新都区','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2468','温江区','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2469','金堂县','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2470','双流县','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2471','郫县','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2472','大邑县','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2473','蒲江县','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2474','新津县','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2475','都江堰市','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2476','彭州市','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2477','邛崃市','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2478','崇州市','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2479','自流井区','0','383','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2480','贡井区','0','383','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2481','大安区','0','383','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2482','沿滩区','0','383','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2483','荣县','0','383','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2484','富顺县','0','383','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2485','东区','0','384','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2486','西区','0','384','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2487','仁和区','0','384','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2488','米易县','0','384','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2489','盐边县','0','384','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2490','江阳区','0','385','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2491','纳溪区','0','385','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2492','龙马潭区','0','385','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2493','泸县','0','385','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2494','合江县','0','385','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2495','叙永县','0','385','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2496','古蔺县','0','385','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2497','旌阳区','0','386','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2498','中江县','0','386','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2499','罗江县','0','386','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2500','广汉市','0','386','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2501','什邡市','0','386','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2502','绵竹市','0','386','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2503','涪城区','0','387','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2504','游仙区','0','387','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2505','三台县','0','387','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2506','盐亭县','0','387','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2507','安县','0','387','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2508','梓潼县','0','387','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2509','北川羌族自治县','0','387','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2510','平武县','0','387','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2511','江油市','0','387','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2512','市中区','0','388','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2513','元坝区','0','388','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2514','朝天区','0','388','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2515','旺苍县','0','388','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2516','青川县','0','388','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2517','剑阁县','0','388','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2518','苍溪县','0','388','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2519','船山区','0','389','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2520','安居区','0','389','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2521','蓬溪县','0','389','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2522','射洪县','0','389','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2523','大英县','0','389','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2524','市中区','0','390','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2525','东兴区','0','390','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2526','威远县','0','390','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2527','资中县','0','390','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2528','隆昌县','0','390','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2529','市中区','0','391','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2530','沙湾区','0','391','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2531','五通桥区','0','391','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2532','金口河区','0','391','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2533','犍为县','0','391','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2534','井研县','0','391','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2535','夹江县','0','391','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2536','沐川县','0','391','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2537','峨边彝族自治县','0','391','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2538','马边彝族自治县','0','391','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2539','峨眉山市','0','391','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2540','顺庆区','0','392','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2541','高坪区','0','392','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2542','嘉陵区','0','392','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2543','南部县','0','392','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2544','营山县','0','392','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2545','蓬安县','0','392','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2546','仪陇县','0','392','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2547','西充县','0','392','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2548','阆中市','0','392','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2549','东坡区','0','393','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2550','仁寿县','0','393','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2551','彭山县','0','393','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2552','洪雅县','0','393','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2553','丹棱县','0','393','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2554','青神县','0','393','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2555','翠屏区','0','394','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2556','宜宾县','0','394','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2557','南溪县','0','394','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2558','江安县','0','394','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2559','长宁县','0','394','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2560','高县','0','394','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2561','珙县','0','394','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2562','筠连县','0','394','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2563','兴文县','0','394','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2564','屏山县','0','394','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2565','广安区','0','395','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2566','岳池县','0','395','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2567','武胜县','0','395','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2568','邻水县','0','395','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2569','华蓥市','0','395','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2570','通川区','0','396','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2571','达县','0','396','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2572','宣汉县','0','396','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2573','开江县','0','396','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2574','大竹县','0','396','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2575','渠县','0','396','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2576','万源市','0','396','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2577','雨城区','0','397','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2578','名山县','0','397','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2579','荥经县','0','397','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2580','汉源县','0','397','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2581','石棉县','0','397','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2582','天全县','0','397','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2583','芦山县','0','397','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2584','宝兴县','0','397','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2585','巴州区','0','398','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2586','通江县','0','398','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2587','南江县','0','398','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2588','平昌县','0','398','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2589','雁江区','0','399','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2590','安岳县','0','399','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2591','乐至县','0','399','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2592','简阳市','0','399','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2593','汶川县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2594','理县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2595','茂县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2596','松潘县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2597','九寨沟县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2598','金川县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2599','小金县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2600','黑水县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2601','马尔康县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2602','壤塘县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2603','阿坝县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2604','若尔盖县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2605','红原县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2606','康定县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2607','泸定县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2608','丹巴县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2609','九龙县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2610','雅江县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2611','道孚县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2612','炉霍县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2613','甘孜县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2614','新龙县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2615','德格县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2616','白玉县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2617','石渠县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2618','色达县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2619','理塘县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2620','巴塘县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2621','乡城县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2622','稻城县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2623','得荣县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2624','西昌市','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2625','木里藏族自治县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2626','盐源县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2627','德昌县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2628','会理县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2629','会东县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2630','宁南县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2631','普格县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2632','布拖县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2633','金阳县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2634','昭觉县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2635','喜德县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2636','冕宁县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2637','越西县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2638','甘洛县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2639','美姑县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2640','雷波县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2641','南明区','0','403','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2642','云岩区','0','403','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2643','花溪区','0','403','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2644','乌当区','0','403','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2645','白云区','0','403','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2646','小河区','0','403','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2647','开阳县','0','403','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2648','息烽县','0','403','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2649','修文县','0','403','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2650','清镇市','0','403','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2651','钟山区','0','404','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2652','六枝特区','0','404','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2653','水城县','0','404','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2654','盘县','0','404','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2655','红花岗区','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2656','汇川区','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2657','遵义县','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2658','桐梓县','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2659','绥阳县','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2660','正安县','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2661','道真仡佬族苗族自治县','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2662','务川仡佬族苗族自治县','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2663','凤冈县','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2664','湄潭县','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2665','余庆县','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2666','习水县','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2667','赤水市','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2668','仁怀市','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2669','西秀区','0','406','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2670','平坝县','0','406','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2671','普定县','0','406','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2672','镇宁布依族苗族自治县','0','406','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2673','关岭布依族苗族自治县','0','406','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2674','紫云苗族布依族自治县','0','406','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2675','铜仁市','0','407','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2676','江口县','0','407','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2677','玉屏侗族自治县','0','407','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2678','石阡县','0','407','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2679','思南县','0','407','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2680','印江土家族苗族自治县','0','407','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2681','德江县','0','407','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2682','沿河土家族自治县','0','407','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2683','松桃苗族自治县','0','407','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2684','万山特区','0','407','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2685','兴义市','0','408','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2686','兴仁县','0','408','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2687','普安县','0','408','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2688','晴隆县','0','408','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2689','贞丰县','0','408','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2690','望谟县','0','408','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2691','册亨县','0','408','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2692','安龙县','0','408','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2693','毕节市','0','409','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2694','大方县','0','409','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2695','黔西县','0','409','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2696','金沙县','0','409','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2697','织金县','0','409','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2698','纳雍县','0','409','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2699','威宁彝族回族苗族自治县','0','409','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2700','赫章县','0','409','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2701','凯里市','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2702','黄平县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2703','施秉县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2704','三穗县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2705','镇远县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2706','岑巩县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2707','天柱县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2708','锦屏县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2709','剑河县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2710','台江县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2711','黎平县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2712','榕江县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2713','从江县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2714','雷山县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2715','麻江县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2716','丹寨县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2717','都匀市','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2718','福泉市','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2719','荔波县','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2720','贵定县','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2721','瓮安县','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2722','独山县','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2723','平塘县','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2724','罗甸县','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2725','长顺县','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2726','龙里县','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2727','惠水县','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2728','三都水族自治县','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2729','五华区','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2730','盘龙区','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2731','官渡区','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2732','西山区','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2733','东川区','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2734','呈贡县','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2735','晋宁县','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2736','富民县','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2737','宜良县','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2738','石林彝族自治县','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2739','嵩明县','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2740','禄劝彝族苗族自治县','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2741','寻甸回族彝族自治县','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2742','安宁市','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2743','麒麟区','0','413','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2744','马龙县','0','413','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2745','陆良县','0','413','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2746','师宗县','0','413','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2747','罗平县','0','413','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2748','富源县','0','413','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2749','会泽县','0','413','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2750','沾益县','0','413','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2751','宣威市','0','413','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2752','红塔区','0','414','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2753','江川县','0','414','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2754','澄江县','0','414','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2755','通海县','0','414','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2756','华宁县','0','414','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2757','易门县','0','414','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2758','峨山彝族自治县','0','414','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2759','新平彝族傣族自治县','0','414','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2760','元江哈尼族彝族傣族自治县','0','414','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2761','隆阳区','0','415','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2762','施甸县','0','415','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2763','腾冲县','0','415','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2764','龙陵县','0','415','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2765','昌宁县','0','415','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2766','昭阳区','0','416','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2767','鲁甸县','0','416','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2768','巧家县','0','416','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2769','盐津县','0','416','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2770','大关县','0','416','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2771','永善县','0','416','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2772','绥江县','0','416','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2773','镇雄县','0','416','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2774','彝良县','0','416','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2775','威信县','0','416','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2776','水富县','0','416','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2777','古城区','0','417','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2778','玉龙纳西族自治县','0','417','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2779','永胜县','0','417','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2780','华坪县','0','417','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2781','宁蒗彝族自治县','0','417','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2782','翠云区','0','418','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2783','普洱哈尼族彝族自治县','0','418','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2784','墨江哈尼族自治县','0','418','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2785','景东彝族自治县','0','418','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2786','景谷傣族彝族自治县','0','418','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2787','镇沅彝族哈尼族拉祜族自治县','0','418','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2788','江城哈尼族彝族自治县','0','418','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2789','孟连傣族拉祜族佤族自治县','0','418','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2790','澜沧拉祜族自治县','0','418','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2791','西盟佤族自治县','0','418','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2792','临翔区','0','419','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2793','凤庆县','0','419','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2794','云县','0','419','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2795','永德县','0','419','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2796','镇康县','0','419','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2797','双江拉祜族佤族布朗族傣族自治县','0','419','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2798','耿马傣族佤族自治县','0','419','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2799','沧源佤族自治县','0','420','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2800','楚雄市','0','420','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2801','双柏县','0','420','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2802','牟定县','0','420','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2803','南华县','0','420','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2804','姚安县','0','420','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2805','大姚县','0','420','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2806','永仁县','0','420','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2807','元谋县','0','420','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2808','武定县','0','420','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2809','禄丰县','0','420','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2810','个旧市','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2811','开远市','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2812','蒙自县','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2813','屏边苗族自治县','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2814','建水县','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2815','石屏县','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2816','弥勒县','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2817','泸西县','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2818','元阳县','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2819','红河县','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2820','金平苗族瑶族傣族自治县','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2821','绿春县','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2822','河口瑶族自治县','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2823','文山县','0','422','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2824','砚山县','0','422','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2825','西畴县','0','422','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2826','麻栗坡县','0','422','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2827','马关县','0','422','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2828','丘北县','0','422','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2829','广南县','0','422','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2830','富宁县','0','422','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2831','景洪市','0','423','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2832','勐海县','0','423','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2833','勐腊县','0','423','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2834','大理市','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2835','漾濞彝族自治县','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2836','祥云县','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2837','宾川县','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2838','弥渡县','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2839','南涧彝族自治县','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2840','巍山彝族回族自治县','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2841','永平县','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2842','云龙县','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2843','洱源县','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2844','剑川县','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2845','鹤庆县','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2846','瑞丽市','0','425','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2847','潞西市','0','425','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2848','梁河县','0','425','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2849','盈江县','0','425','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2850','陇川县','0','425','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2851','泸水县','0','426','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2852','福贡县','0','426','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2853','贡山独龙族怒族自治县','0','426','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2854','兰坪白族普米族自治县','0','426','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2855','香格里拉县','0','427','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2856','德钦县','0','427','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2857','维西傈僳族自治县','0','427','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2858','城关区','0','428','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2859','林周县','0','428','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2860','当雄县','0','428','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2861','尼木县','0','428','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2862','曲水县','0','428','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2863','堆龙德庆县','0','428','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2864','达孜县','0','428','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2865','墨竹工卡县','0','428','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2866','昌都县','0','429','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2867','江达县','0','429','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2868','贡觉县','0','429','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2869','类乌齐县','0','429','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2870','丁青县','0','429','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2871','察雅县','0','429','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2872','八宿县','0','429','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2873','左贡县','0','429','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2874','芒康县','0','429','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2875','洛隆县','0','429','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2876','边坝县','0','429','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2877','乃东县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2878','扎囊县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2879','贡嘎县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2880','桑日县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2881','琼结县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2882','曲松县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2883','措美县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2884','洛扎县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2885','加查县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2886','隆子县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2887','错那县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2888','浪卡子县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2889','日喀则市','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2890','南木林县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2891','江孜县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2892','定日县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2893','萨迦县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2894','拉孜县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2895','昂仁县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2896','谢通门县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2897','白朗县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2898','仁布县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2899','康马县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2900','定结县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2901','仲巴县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2902','亚东县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2903','吉隆县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2904','聂拉木县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2905','萨嘎县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2906','岗巴县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2907','那曲县','0','432','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2908','嘉黎县','0','432','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2909','比如县','0','432','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2910','聂荣县','0','432','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2911','安多县','0','432','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2912','申扎县','0','432','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2913','索县','0','432','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2914','班戈县','0','432','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2915','巴青县','0','432','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2916','尼玛县','0','432','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2917','普兰县','0','433','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2918','札达县','0','433','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2919','噶尔县','0','433','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2920','日土县','0','433','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2921','革吉县','0','433','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2922','改则县','0','433','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2923','措勤县','0','433','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2924','林芝县','0','434','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2925','工布江达县','0','434','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2926','米林县','0','434','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2927','墨脱县','0','434','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2928','波密县','0','434','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2929','察隅县','0','434','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2930','朗县','0','434','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2931','新城区','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2932','碑林区','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2933','莲湖区','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2934','灞桥区','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2935','未央区','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2936','雁塔区','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2937','阎良区','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2938','临潼区','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2939','长安区','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2940','蓝田县','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2941','周至县','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2942','户县','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2943','高陵县','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2944','王益区','0','436','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2945','印台区','0','436','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2946','耀州区','0','436','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2947','宜君县','0','436','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2948','渭滨区','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2949','金台区','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2950','陈仓区','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2951','凤翔县','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2952','岐山县','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2953','扶风县','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2954','眉县','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2955','陇县','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2956','千阳县','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2957','麟游县','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2958','凤县','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2959','太白县','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2960','秦都区','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2961','杨凌区','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2962','渭城区','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2963','三原县','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2964','泾阳县','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2965','乾县','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2966','礼泉县','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2967','永寿县','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2968','彬县','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2969','长武县','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2970','旬邑县','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2971','淳化县','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2972','武功县','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2973','兴平市','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2974','临渭区','0','439','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2975','华县','0','439','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2976','潼关县','0','439','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2977','大荔县','0','439','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2978','合阳县','0','439','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2979','澄城县','0','439','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2980','蒲城县','0','439','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2981','白水县','0','439','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2982','富平县','0','439','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2983','韩城市','0','439','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2984','华阴市','0','439','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2985','宝塔区','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2986','延长县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2987','延川县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2988','子长县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2989','安塞县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2990','志丹县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2991','吴起县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2992','甘泉县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2993','富县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2994','洛川县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2995','宜川县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2996','黄龙县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2997','黄陵县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2998','汉台区','0','441','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2999','南郑县','0','441','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3000','城固县','0','441','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3001','洋县','0','441','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3002','西乡县','0','441','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3003','勉县','0','441','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3004','宁强县','0','441','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3005','略阳县','0','441','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3006','镇巴县','0','441','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3007','留坝县','0','441','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3008','佛坪县','0','441','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3009','榆阳区','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3010','神木县','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3011','府谷县','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3012','横山县','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3013','靖边县','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3014','定边县','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3015','绥德县','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3016','米脂县','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3017','佳县','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3018','吴堡县','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3019','清涧县','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3020','子洲县','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3021','汉滨区','0','443','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3022','汉阴县','0','443','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3023','石泉县','0','443','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3024','宁陕县','0','443','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3025','紫阳县','0','443','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3026','岚皋县','0','443','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3027','平利县','0','443','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3028','镇坪县','0','443','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3029','旬阳县','0','443','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3030','白河县','0','443','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3031','商州区','0','444','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3032','洛南县','0','444','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3033','丹凤县','0','444','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3034','商南县','0','444','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3035','山阳县','0','444','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3036','镇安县','0','444','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3037','柞水县','0','444','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3038','城关区','0','445','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3039','七里河区','0','445','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3040','西固区','0','445','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3041','安宁区','0','445','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3042','红古区','0','445','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3043','永登县','0','445','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3044','皋兰县','0','445','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3045','榆中县','0','445','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3046','金川区','0','447','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3047','永昌县','0','447','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3048','白银区','0','448','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3049','平川区','0','448','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3050','靖远县','0','448','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3051','会宁县','0','448','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3052','景泰县','0','448','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3053','秦城区','0','449','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3054','北道区','0','449','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3055','清水县','0','449','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3056','秦安县','0','449','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3057','甘谷县','0','449','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3058','武山县','0','449','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3059','张家川回族自治县','0','449','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3060','凉州区','0','450','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3061','民勤县','0','450','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3062','古浪县','0','450','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3063','天祝藏族自治县','0','450','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3064','甘州区','0','451','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3065','肃南裕固族自治县','0','451','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3066','民乐县','0','451','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3067','临泽县','0','451','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3068','高台县','0','451','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3069','山丹县','0','451','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3070','崆峒区','0','452','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3071','泾川县','0','452','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3072','灵台县','0','452','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3073','崇信县','0','452','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3074','华亭县','0','452','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3075','庄浪县','0','452','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3076','静宁县','0','452','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3077','肃州区','0','453','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3078','金塔县','0','453','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3079','瓜州县','0','453','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3080','肃北蒙古族自治县','0','453','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3081','阿克塞哈萨克族自治县','0','453','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3082','玉门市','0','453','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3083','敦煌市','0','453','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3084','西峰区','0','454','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3085','庆城县','0','454','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3086','环县','0','454','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3087','华池县','0','454','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3088','合水县','0','454','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3089','正宁县','0','454','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3090','宁县','0','454','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3091','镇原县','0','454','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3092','安定区','0','455','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3093','通渭县','0','455','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3094','陇西县','0','455','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3095','渭源县','0','455','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3096','临洮县','0','455','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3097','漳县','0','455','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3098','岷县','0','455','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3099','武都区','0','456','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3100','成县','0','456','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3101','文县','0','456','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3102','宕昌县','0','456','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3103','康县','0','456','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3104','西和县','0','456','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3105','礼县','0','456','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3106','徽县','0','456','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3107','两当县','0','456','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3108','临夏市','0','457','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3109','临夏县','0','457','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3110','康乐县','0','457','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3111','永靖县','0','457','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3112','广河县','0','457','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3113','和政县','0','457','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3114','东乡族自治县','0','457','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3115','积石山保安族东乡族撒拉族自治县','0','457','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3116','合作市','0','458','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3117','临潭县','0','458','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3118','卓尼县','0','458','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3119','舟曲县','0','458','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3120','迭部县','0','458','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3121','玛曲县','0','458','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3122','碌曲县','0','458','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3123','夏河县','0','458','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3124','城东区','0','459','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3125','城中区','0','459','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3126','城西区','0','459','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3127','城北区','0','459','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3128','大通回族土族自治县','0','459','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3129','湟中县','0','459','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3130','湟源县','0','459','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3131','平安县','0','460','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3132','民和回族土族自治县','0','460','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3133','乐都县','0','460','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3134','互助土族自治县','0','460','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3135','化隆回族自治县','0','460','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3136','循化撒拉族自治县','0','460','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3137','门源回族自治县','0','461','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3138','祁连县','0','461','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3139','海晏县','0','461','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3140','刚察县','0','461','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3141','同仁县','0','462','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3142','尖扎县','0','462','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3143','泽库县','0','462','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3144','河南蒙古族自治县','0','462','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3145','共和县','0','463','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3146','同德县','0','463','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3147','贵德县','0','463','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3148','兴海县','0','463','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3149','贵南县','0','463','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3150','玛沁县','0','464','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3151','班玛县','0','464','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3152','甘德县','0','464','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3153','达日县','0','464','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3154','久治县','0','464','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3155','玛多县','0','464','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3156','玉树县','0','465','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3157','杂多县','0','465','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3158','称多县','0','465','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3159','治多县','0','465','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3160','囊谦县','0','465','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3161','曲麻莱县','0','465','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3162','格尔木市','0','466','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3163','德令哈市','0','466','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3164','乌兰县','0','466','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3165','都兰县','0','466','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3166','天峻县','0','466','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3167','兴庆区','0','467','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3168','西夏区','0','467','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3169','金凤区','0','467','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3170','永宁县','0','467','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3171','贺兰县','0','467','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3172','灵武市','0','467','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3173','大武口区','0','468','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3174','惠农区','0','468','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3175','平罗县','0','468','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3176','利通区','0','469','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3177','盐池县','0','469','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3178','同心县','0','469','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3179','青铜峡市','0','469','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3180','原州区','0','470','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3181','西吉县','0','470','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3182','隆德县','0','470','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3183','泾源县','0','470','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3184','彭阳县','0','470','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3185','沙坡头区','0','471','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3186','中宁县','0','471','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3187','海原县','0','471','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3188','天山区','0','472','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3189','沙依巴克区','0','472','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3190','新市区','0','472','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3191','水磨沟区','0','472','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3192','头屯河区','0','472','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3193','达坂城区','0','472','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3194','东山区','0','472','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3195','乌鲁木齐县','0','472','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3196','独山子区','0','473','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3197','克拉玛依区','0','473','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3198','白碱滩区','0','473','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3199','乌尔禾区','0','473','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3200','吐鲁番市','0','474','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3201','鄯善县','0','474','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3202','托克逊县','0','474','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3203','哈密市','0','475','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3204','巴里坤哈萨克自治县','0','475','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3205','伊吾县','0','475','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3206','昌吉市','0','476','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3207','阜康市','0','476','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3208','米泉市','0','476','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3209','呼图壁县','0','476','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3210','玛纳斯县','0','476','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3211','奇台县','0','476','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3212','吉木萨尔县','0','476','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3213','木垒哈萨克自治县','0','476','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3214','博乐市','0','477','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3215','精河县','0','477','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3216','温泉县','0','477','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3217','库尔勒市','0','478','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3218','轮台县','0','478','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3219','尉犁县','0','478','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3220','若羌县','0','478','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3221','且末县','0','478','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3222','焉耆回族自治县','0','478','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3223','和静县','0','478','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3224','和硕县','0','478','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3225','博湖县','0','478','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3226','阿克苏市','0','479','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3227','温宿县','0','479','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3228','库车县','0','479','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3229','沙雅县','0','479','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3230','新和县','0','479','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3231','拜城县','0','479','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3232','乌什县','0','479','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3233','阿瓦提县','0','479','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3234','柯坪县','0','479','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3235','阿图什市','0','480','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3236','阿克陶县','0','480','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3237','阿合奇县','0','480','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3238','乌恰县','0','480','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3239','喀什市','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3240','疏附县','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3241','疏勒县','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3242','英吉沙县','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3243','泽普县','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3244','莎车县','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3245','叶城县','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3246','麦盖提县','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3247','岳普湖县','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3248','伽师县','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3249','巴楚县','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3250','塔什库尔干塔吉克自治县','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3251','和田市','0','482','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3252','和田县','0','482','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3253','墨玉县','0','482','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3254','皮山县','0','482','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3255','洛浦县','0','482','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3256','策勒县','0','482','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3257','于田县','0','482','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3258','民丰县','0','482','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3259','伊宁市','0','483','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3260','奎屯市','0','483','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3261','伊宁县','0','483','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3262','察布查尔锡伯自治县','0','483','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3263','霍城县','0','483','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3264','巩留县','0','483','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3265','新源县','0','483','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3266','昭苏县','0','483','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3267','特克斯县','0','483','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3268','尼勒克县','0','483','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3269','塔城市','0','484','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3270','乌苏市','0','484','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3271','额敏县','0','484','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3272','沙湾县','0','484','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3273','托里县','0','484','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3274','裕民县','0','484','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3275','和布克赛尔蒙古自治县','0','484','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3276','阿勒泰市','0','485','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3277','布尔津县','0','485','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3278','富蕴县','0','485','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3279','福海县','0','485','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3280','哈巴河县','0','485','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3281','青河县','0','485','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3282','吉木乃县','0','485','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3358','钓鱼岛','','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3359','钓鱼岛','','3358','0','','1','0','','','0');

DROP TABLE IF EXISTS `v9_log`;
CREATE TABLE `v9_log` (
  `logid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(15) NOT NULL,
  `value` int(10) unsigned NOT NULL DEFAULT '0',
  `module` varchar(15) NOT NULL,
  `file` varchar(20) NOT NULL,
  `action` varchar(20) NOT NULL,
  `querystring` varchar(255) NOT NULL,
  `data` mediumtext NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`logid`),
  KEY `module` (`module`,`file`,`action`),
  KEY `username` (`username`,`action`)
) ENGINE=MyISAM AUTO_INCREMENT=1028 DEFAULT CHARSET=utf8;

INSERT INTO `v9_log` VALUES('1','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2015-02-02 14:05:47');
INSERT INTO `v9_log` VALUES('2','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2015-02-02 14:05:47');
INSERT INTO `v9_log` VALUES('3','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2015-02-02 14:22:31');
INSERT INTO `v9_log` VALUES('4','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2015-02-02 14:24:46');
INSERT INTO `v9_log` VALUES('5','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2015-02-02 14:25:51');
INSERT INTO `v9_log` VALUES('6','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2015-02-02 14:25:52');
INSERT INTO `v9_log` VALUES('7','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2015-02-02 14:26:23');
INSERT INTO `v9_log` VALUES('8','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2015-02-02 14:26:24');
INSERT INTO `v9_log` VALUES('9','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2015-02-02 14:28:33');
INSERT INTO `v9_log` VALUES('10','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2015-02-02 14:28:39');
INSERT INTO `v9_log` VALUES('11','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2015-02-02 14:29:34');
INSERT INTO `v9_log` VALUES('12','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2015-02-02 14:29:41');
INSERT INTO `v9_log` VALUES('13','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2015-02-02 14:30:25');
INSERT INTO `v9_log` VALUES('14','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2015-02-02 14:30:37');
INSERT INTO `v9_log` VALUES('15','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 15:45:50');
INSERT INTO `v9_log` VALUES('16','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 15:45:55');
INSERT INTO `v9_log` VALUES('17','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 15:45:59');
INSERT INTO `v9_log` VALUES('18','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 15:49:43');
INSERT INTO `v9_log` VALUES('19','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 15:49:50');
INSERT INTO `v9_log` VALUES('20','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 15:49:56');
INSERT INTO `v9_log` VALUES('21','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 15:50:03');
INSERT INTO `v9_log` VALUES('22','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 15:51:58');
INSERT INTO `v9_log` VALUES('23','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 15:53:51');
INSERT INTO `v9_log` VALUES('24','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 15:53:52');
INSERT INTO `v9_log` VALUES('25','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 15:55:17');
INSERT INTO `v9_log` VALUES('26','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 15:55:18');
INSERT INTO `v9_log` VALUES('27','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 15:58:52');
INSERT INTO `v9_log` VALUES('28','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 15:59:01');
INSERT INTO `v9_log` VALUES('29','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 15:59:12');
INSERT INTO `v9_log` VALUES('30','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 15:59:24');
INSERT INTO `v9_log` VALUES('31','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 15:59:26');
INSERT INTO `v9_log` VALUES('32','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 16:03:21');
INSERT INTO `v9_log` VALUES('33','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 16:04:53');
INSERT INTO `v9_log` VALUES('34','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 16:04:54');
INSERT INTO `v9_log` VALUES('35','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 16:05:17');
INSERT INTO `v9_log` VALUES('36','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 16:05:36');
INSERT INTO `v9_log` VALUES('37','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 16:05:41');
INSERT INTO `v9_log` VALUES('38','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 16:06:02');
INSERT INTO `v9_log` VALUES('39','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 16:06:19');
INSERT INTO `v9_log` VALUES('40','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 16:06:23');
INSERT INTO `v9_log` VALUES('41','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 16:09:28');
INSERT INTO `v9_log` VALUES('42','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 16:09:29');
INSERT INTO `v9_log` VALUES('43','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 16:09:29');
INSERT INTO `v9_log` VALUES('44','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 16:09:30');
INSERT INTO `v9_log` VALUES('45','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 16:09:30');
INSERT INTO `v9_log` VALUES('46','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 16:09:30');
INSERT INTO `v9_log` VALUES('47','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 16:09:30');
INSERT INTO `v9_log` VALUES('48','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 16:11:32');
INSERT INTO `v9_log` VALUES('49','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 16:13:35');
INSERT INTO `v9_log` VALUES('50','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 16:15:08');
INSERT INTO `v9_log` VALUES('51','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 17:11:20');
INSERT INTO `v9_log` VALUES('52','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 17:11:42');
INSERT INTO `v9_log` VALUES('53','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 17:11:54');
INSERT INTO `v9_log` VALUES('54','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 17:12:31');
INSERT INTO `v9_log` VALUES('55','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 17:12:34');
INSERT INTO `v9_log` VALUES('56','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 17:12:35');
INSERT INTO `v9_log` VALUES('57','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 17:12:43');
INSERT INTO `v9_log` VALUES('58','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 17:12:46');
INSERT INTO `v9_log` VALUES('59','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 17:12:49');
INSERT INTO `v9_log` VALUES('60','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 17:14:10');
INSERT INTO `v9_log` VALUES('61','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 17:14:13');
INSERT INTO `v9_log` VALUES('62','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 17:14:15');
INSERT INTO `v9_log` VALUES('63','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 17:14:15');
INSERT INTO `v9_log` VALUES('64','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-02 17:14:19');
INSERT INTO `v9_log` VALUES('65','','0','member','','member','?m=member&c=member&a=manage','','1','admin','127.0.0.1','2015-02-02 17:34:29');
INSERT INTO `v9_log` VALUES('66','','0','member','','member','?m=member&c=member&a=manage','','1','admin','127.0.0.1','2015-02-02 17:34:30');
INSERT INTO `v9_log` VALUES('67','','0','member','','member_verify','?m=member&c=member_verify&a=manage','','1','admin','127.0.0.1','2015-02-02 17:34:31');
INSERT INTO `v9_log` VALUES('68','','0','member','','member_group','?m=member&c=member_group&a=manage','','1','admin','127.0.0.1','2015-02-02 17:34:32');
INSERT INTO `v9_log` VALUES('69','','0','member','','member_menu','?m=member&c=member_menu&a=manage','','1','admin','127.0.0.1','2015-02-02 17:36:33');
INSERT INTO `v9_log` VALUES('70','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-02 17:44:18');
INSERT INTO `v9_log` VALUES('71','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-02 17:44:19');
INSERT INTO `v9_log` VALUES('72','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-02 18:00:23');
INSERT INTO `v9_log` VALUES('73','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-02 18:00:25');
INSERT INTO `v9_log` VALUES('74','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-02 18:00:26');
INSERT INTO `v9_log` VALUES('75','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-02 18:01:27');
INSERT INTO `v9_log` VALUES('76','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-02 18:01:28');
INSERT INTO `v9_log` VALUES('77','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-02 18:01:30');
INSERT INTO `v9_log` VALUES('78','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-02 18:01:32');
INSERT INTO `v9_log` VALUES('79','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-02 18:01:56');
INSERT INTO `v9_log` VALUES('80','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-02 18:02:04');
INSERT INTO `v9_log` VALUES('81','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-02 18:02:21');
INSERT INTO `v9_log` VALUES('82','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-02 18:02:27');
INSERT INTO `v9_log` VALUES('83','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-02 18:02:47');
INSERT INTO `v9_log` VALUES('84','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-02 18:03:01');
INSERT INTO `v9_log` VALUES('85','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-02 18:03:04');
INSERT INTO `v9_log` VALUES('86','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-02 18:03:05');
INSERT INTO `v9_log` VALUES('87','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-02 18:03:14');
INSERT INTO `v9_log` VALUES('88','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-02 18:03:23');
INSERT INTO `v9_log` VALUES('89','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-02 18:03:26');
INSERT INTO `v9_log` VALUES('90','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-02 18:03:28');
INSERT INTO `v9_log` VALUES('91','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-02 18:03:45');
INSERT INTO `v9_log` VALUES('92','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-02 18:06:59');
INSERT INTO `v9_log` VALUES('93','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-02 18:07:02');
INSERT INTO `v9_log` VALUES('94','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-02 18:07:47');
INSERT INTO `v9_log` VALUES('95','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-02 18:10:17');
INSERT INTO `v9_log` VALUES('96','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-02 18:10:39');
INSERT INTO `v9_log` VALUES('97','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-02 18:10:40');
INSERT INTO `v9_log` VALUES('98','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-02 18:10:40');
INSERT INTO `v9_log` VALUES('99','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:04:58');
INSERT INTO `v9_log` VALUES('100','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:05:01');
INSERT INTO `v9_log` VALUES('101','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:05:09');
INSERT INTO `v9_log` VALUES('102','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:08:14');
INSERT INTO `v9_log` VALUES('103','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:09:54');
INSERT INTO `v9_log` VALUES('104','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:15:52');
INSERT INTO `v9_log` VALUES('105','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:17:16');
INSERT INTO `v9_log` VALUES('106','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:17:17');
INSERT INTO `v9_log` VALUES('107','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:17:24');
INSERT INTO `v9_log` VALUES('108','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:18:50');
INSERT INTO `v9_log` VALUES('109','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:19:50');
INSERT INTO `v9_log` VALUES('110','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:22:04');
INSERT INTO `v9_log` VALUES('111','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:23:39');
INSERT INTO `v9_log` VALUES('112','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:25:05');
INSERT INTO `v9_log` VALUES('113','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:26:34');
INSERT INTO `v9_log` VALUES('114','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:26:50');
INSERT INTO `v9_log` VALUES('115','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:29:55');
INSERT INTO `v9_log` VALUES('116','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:30:59');
INSERT INTO `v9_log` VALUES('117','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:31:07');
INSERT INTO `v9_log` VALUES('118','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:31:16');
INSERT INTO `v9_log` VALUES('119','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:32:31');
INSERT INTO `v9_log` VALUES('120','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:32:37');
INSERT INTO `v9_log` VALUES('121','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:32:41');
INSERT INTO `v9_log` VALUES('122','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:33:14');
INSERT INTO `v9_log` VALUES('123','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:33:28');
INSERT INTO `v9_log` VALUES('124','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:33:33');
INSERT INTO `v9_log` VALUES('125','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:33:48');
INSERT INTO `v9_log` VALUES('126','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:35:29');
INSERT INTO `v9_log` VALUES('127','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:35:32');
INSERT INTO `v9_log` VALUES('128','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:35:38');
INSERT INTO `v9_log` VALUES('129','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:36:38');
INSERT INTO `v9_log` VALUES('130','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:37:41');
INSERT INTO `v9_log` VALUES('131','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:38:20');
INSERT INTO `v9_log` VALUES('132','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:38:27');
INSERT INTO `v9_log` VALUES('133','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:38:52');
INSERT INTO `v9_log` VALUES('134','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:38:55');
INSERT INTO `v9_log` VALUES('135','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:39:54');
INSERT INTO `v9_log` VALUES('136','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:40:08');
INSERT INTO `v9_log` VALUES('137','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:40:13');
INSERT INTO `v9_log` VALUES('138','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:42:30');
INSERT INTO `v9_log` VALUES('139','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:43:17');
INSERT INTO `v9_log` VALUES('140','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:43:45');
INSERT INTO `v9_log` VALUES('141','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:43:48');
INSERT INTO `v9_log` VALUES('142','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:44:24');
INSERT INTO `v9_log` VALUES('143','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:44:28');
INSERT INTO `v9_log` VALUES('144','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:44:48');
INSERT INTO `v9_log` VALUES('145','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:45:20');
INSERT INTO `v9_log` VALUES('146','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:46:39');
INSERT INTO `v9_log` VALUES('147','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:46:42');
INSERT INTO `v9_log` VALUES('148','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:47:33');
INSERT INTO `v9_log` VALUES('149','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:47:36');
INSERT INTO `v9_log` VALUES('150','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:47:44');
INSERT INTO `v9_log` VALUES('151','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:47:49');
INSERT INTO `v9_log` VALUES('152','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:48:24');
INSERT INTO `v9_log` VALUES('153','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:48:26');
INSERT INTO `v9_log` VALUES('154','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:48:28');
INSERT INTO `v9_log` VALUES('155','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:48:29');
INSERT INTO `v9_log` VALUES('156','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:48:30');
INSERT INTO `v9_log` VALUES('157','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:48:33');
INSERT INTO `v9_log` VALUES('158','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:48:39');
INSERT INTO `v9_log` VALUES('159','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:48:40');
INSERT INTO `v9_log` VALUES('160','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:48:41');
INSERT INTO `v9_log` VALUES('161','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:48:42');
INSERT INTO `v9_log` VALUES('162','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:49:08');
INSERT INTO `v9_log` VALUES('163','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:49:39');
INSERT INTO `v9_log` VALUES('164','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:49:54');
INSERT INTO `v9_log` VALUES('165','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:50:09');
INSERT INTO `v9_log` VALUES('166','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:50:15');
INSERT INTO `v9_log` VALUES('167','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:50:17');
INSERT INTO `v9_log` VALUES('168','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:50:20');
INSERT INTO `v9_log` VALUES('169','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:50:21');
INSERT INTO `v9_log` VALUES('170','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:50:21');
INSERT INTO `v9_log` VALUES('171','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:50:23');
INSERT INTO `v9_log` VALUES('172','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:50:24');
INSERT INTO `v9_log` VALUES('173','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:50:25');
INSERT INTO `v9_log` VALUES('174','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:54:17');
INSERT INTO `v9_log` VALUES('175','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:54:33');
INSERT INTO `v9_log` VALUES('176','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:56:06');
INSERT INTO `v9_log` VALUES('177','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:56:40');
INSERT INTO `v9_log` VALUES('178','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:58:00');
INSERT INTO `v9_log` VALUES('179','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:58:01');
INSERT INTO `v9_log` VALUES('180','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:59:23');
INSERT INTO `v9_log` VALUES('181','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:59:25');
INSERT INTO `v9_log` VALUES('182','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:59:33');
INSERT INTO `v9_log` VALUES('183','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:59:34');
INSERT INTO `v9_log` VALUES('184','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 09:59:46');
INSERT INTO `v9_log` VALUES('185','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 10:00:53');
INSERT INTO `v9_log` VALUES('186','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 10:01:10');
INSERT INTO `v9_log` VALUES('187','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 10:01:11');
INSERT INTO `v9_log` VALUES('188','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 10:01:11');
INSERT INTO `v9_log` VALUES('189','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 10:01:11');
INSERT INTO `v9_log` VALUES('190','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 10:01:18');
INSERT INTO `v9_log` VALUES('191','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 10:01:19');
INSERT INTO `v9_log` VALUES('192','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 10:01:19');
INSERT INTO `v9_log` VALUES('193','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 10:01:34');
INSERT INTO `v9_log` VALUES('194','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 10:01:36');
INSERT INTO `v9_log` VALUES('195','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 10:01:36');
INSERT INTO `v9_log` VALUES('196','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 10:01:36');
INSERT INTO `v9_log` VALUES('197','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 10:01:50');
INSERT INTO `v9_log` VALUES('198','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-03 10:15:08');
INSERT INTO `v9_log` VALUES('199','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-03 10:15:10');
INSERT INTO `v9_log` VALUES('200','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-03 10:15:18');
INSERT INTO `v9_log` VALUES('201','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 16:38:53');
INSERT INTO `v9_log` VALUES('202','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-03 16:39:00');
INSERT INTO `v9_log` VALUES('203','','0','member','','member_menu','?m=member&c=member_menu&a=manage','','1','admin','127.0.0.1','2015-02-03 16:44:31');
INSERT INTO `v9_log` VALUES('204','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-02-03 16:49:07');
INSERT INTO `v9_log` VALUES('205','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-04 08:51:29');
INSERT INTO `v9_log` VALUES('206','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-04 08:51:38');
INSERT INTO `v9_log` VALUES('207','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-04 14:42:22');
INSERT INTO `v9_log` VALUES('208','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-04 14:42:22');
INSERT INTO `v9_log` VALUES('209','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-04 14:42:34');
INSERT INTO `v9_log` VALUES('210','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','1','admin','127.0.0.1','2015-02-04 15:00:36');
INSERT INTO `v9_log` VALUES('211','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','1','admin','127.0.0.1','2015-02-04 15:00:40');
INSERT INTO `v9_log` VALUES('212','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','1','admin','127.0.0.1','2015-02-04 15:00:49');
INSERT INTO `v9_log` VALUES('213','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-04 17:15:53');
INSERT INTO `v9_log` VALUES('214','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-04 17:15:59');
INSERT INTO `v9_log` VALUES('215','','0','content','','create_html','?m=content&c=create_html&a=category','','1','admin','127.0.0.1','2015-02-04 17:16:05');
INSERT INTO `v9_log` VALUES('216','','0','content','','content','?m=content&c=content&a=clear_data','','1','admin','127.0.0.1','2015-02-04 17:16:08');
INSERT INTO `v9_log` VALUES('217','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','127.0.0.1','2015-02-04 17:16:09');
INSERT INTO `v9_log` VALUES('218','','0','content','','create_html','?m=content&c=create_html&a=show','','1','admin','127.0.0.1','2015-02-04 17:16:10');
INSERT INTO `v9_log` VALUES('219','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-02-04 17:16:21');
INSERT INTO `v9_log` VALUES('220','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-02-04 17:19:51');
INSERT INTO `v9_log` VALUES('221','','0','content','','create_html','?m=content&c=create_html&a=category','','1','admin','127.0.0.1','2015-02-04 17:21:13');
INSERT INTO `v9_log` VALUES('222','','0','content','','content','?m=content&c=content&a=clear_data','','1','admin','127.0.0.1','2015-02-04 17:21:15');
INSERT INTO `v9_log` VALUES('223','','0','content','','create_html','?m=content&c=create_html&a=category','','1','admin','127.0.0.1','2015-02-04 17:22:58');
INSERT INTO `v9_log` VALUES('224','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-02-04 17:24:00');
INSERT INTO `v9_log` VALUES('225','','0','collection','','node','?m=collection&c=node&a=manage','','1','admin','127.0.0.1','2015-02-04 17:24:22');
INSERT INTO `v9_log` VALUES('226','','0','comment','','comment_admin','?m=comment&c=comment_admin&a=listinfo','','1','admin','127.0.0.1','2015-02-04 17:24:23');
INSERT INTO `v9_log` VALUES('227','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','127.0.0.1','2015-02-04 17:24:25');
INSERT INTO `v9_log` VALUES('228','','0','content','','create_html','?m=content&c=create_html&a=show','','1','admin','127.0.0.1','2015-02-04 17:24:26');
INSERT INTO `v9_log` VALUES('229','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-02-04 17:26:10');
INSERT INTO `v9_log` VALUES('230','','0','collection','','node','?m=collection&c=node&a=manage','','1','admin','127.0.0.1','2015-02-04 17:27:22');
INSERT INTO `v9_log` VALUES('231','','0','comment','','comment_admin','?m=comment&c=comment_admin&a=listinfo','','1','admin','127.0.0.1','2015-02-04 17:27:24');
INSERT INTO `v9_log` VALUES('232','','0','collection','','node','?m=collection&c=node&a=manage','','1','admin','127.0.0.1','2015-02-04 17:27:25');
INSERT INTO `v9_log` VALUES('233','','0','collection','','node','?m=collection&c=node&a=manage','','1','admin','127.0.0.1','2015-02-04 17:51:11');
INSERT INTO `v9_log` VALUES('234','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-04 17:51:28');
INSERT INTO `v9_log` VALUES('235','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-05 09:05:10');
INSERT INTO `v9_log` VALUES('236','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-05 09:05:20');
INSERT INTO `v9_log` VALUES('237','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:17:06');
INSERT INTO `v9_log` VALUES('238','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:17:06');
INSERT INTO `v9_log` VALUES('239','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:24:01');
INSERT INTO `v9_log` VALUES('240','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:24:01');
INSERT INTO `v9_log` VALUES('241','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:24:03');
INSERT INTO `v9_log` VALUES('242','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:24:03');
INSERT INTO `v9_log` VALUES('243','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:24:04');
INSERT INTO `v9_log` VALUES('244','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:24:04');
INSERT INTO `v9_log` VALUES('245','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:24:05');
INSERT INTO `v9_log` VALUES('246','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:24:05');
INSERT INTO `v9_log` VALUES('247','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-02-05 09:27:12');
INSERT INTO `v9_log` VALUES('248','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-02-05 09:27:13');
INSERT INTO `v9_log` VALUES('249','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:27:23');
INSERT INTO `v9_log` VALUES('250','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:27:23');
INSERT INTO `v9_log` VALUES('251','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:27:24');
INSERT INTO `v9_log` VALUES('252','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:27:25');
INSERT INTO `v9_log` VALUES('253','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:27:27');
INSERT INTO `v9_log` VALUES('254','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:27:27');
INSERT INTO `v9_log` VALUES('255','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:27:27');
INSERT INTO `v9_log` VALUES('256','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:27:27');
INSERT INTO `v9_log` VALUES('257','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:29:40');
INSERT INTO `v9_log` VALUES('258','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:29:40');
INSERT INTO `v9_log` VALUES('259','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:29:43');
INSERT INTO `v9_log` VALUES('260','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:29:43');
INSERT INTO `v9_log` VALUES('261','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:29:44');
INSERT INTO `v9_log` VALUES('262','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:29:44');
INSERT INTO `v9_log` VALUES('263','','0','collection','','node','?m=collection&c=node&a=manage','','1','admin','127.0.0.1','2015-02-05 09:29:56');
INSERT INTO `v9_log` VALUES('264','','0','content','','create_html','?m=content&c=create_html&a=category','','1','admin','127.0.0.1','2015-02-05 09:38:37');
INSERT INTO `v9_log` VALUES('265','','0','content','','content','?m=content&c=content&a=clear_data','','1','admin','127.0.0.1','2015-02-05 09:38:39');
INSERT INTO `v9_log` VALUES('266','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','127.0.0.1','2015-02-05 09:38:51');
INSERT INTO `v9_log` VALUES('267','','0','member','','member_group','?m=member&c=member_group&a=manage','','1','admin','127.0.0.1','2015-02-05 09:38:59');
INSERT INTO `v9_log` VALUES('268','','0','member','','member_model','?m=member&c=member_model&a=manage','','1','admin','127.0.0.1','2015-02-05 09:39:01');
INSERT INTO `v9_log` VALUES('269','','0','member','','member','?m=member&c=member&a=manage','','1','admin','127.0.0.1','2015-02-05 09:41:07');
INSERT INTO `v9_log` VALUES('270','','0','member','','member_verify','?m=member&c=member_verify&a=manage','','1','admin','127.0.0.1','2015-02-05 09:41:09');
INSERT INTO `v9_log` VALUES('271','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:45:02');
INSERT INTO `v9_log` VALUES('272','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:45:02');
INSERT INTO `v9_log` VALUES('273','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:51:23');
INSERT INTO `v9_log` VALUES('274','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:51:23');
INSERT INTO `v9_log` VALUES('275','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:51:34');
INSERT INTO `v9_log` VALUES('276','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:51:34');
INSERT INTO `v9_log` VALUES('277','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:51:40');
INSERT INTO `v9_log` VALUES('278','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:51:40');
INSERT INTO `v9_log` VALUES('279','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:51:54');
INSERT INTO `v9_log` VALUES('280','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:52:00');
INSERT INTO `v9_log` VALUES('281','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:52:00');
INSERT INTO `v9_log` VALUES('282','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:53:23');
INSERT INTO `v9_log` VALUES('283','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:53:23');
INSERT INTO `v9_log` VALUES('284','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:53:27');
INSERT INTO `v9_log` VALUES('285','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:53:27');
INSERT INTO `v9_log` VALUES('286','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:53:28');
INSERT INTO `v9_log` VALUES('287','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:53:28');
INSERT INTO `v9_log` VALUES('288','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:53:32');
INSERT INTO `v9_log` VALUES('289','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:53:33');
INSERT INTO `v9_log` VALUES('290','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:53:35');
INSERT INTO `v9_log` VALUES('291','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:53:35');
INSERT INTO `v9_log` VALUES('292','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:53:36');
INSERT INTO `v9_log` VALUES('293','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:53:36');
INSERT INTO `v9_log` VALUES('294','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:53:37');
INSERT INTO `v9_log` VALUES('295','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 09:53:38');
INSERT INTO `v9_log` VALUES('296','','0','collection','','node','?m=collection&c=node&a=manage','','1','admin','127.0.0.1','2015-02-05 09:54:10');
INSERT INTO `v9_log` VALUES('297','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-02-05 10:09:24');
INSERT INTO `v9_log` VALUES('298','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 10:25:57');
INSERT INTO `v9_log` VALUES('299','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 10:25:57');
INSERT INTO `v9_log` VALUES('300','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 10:25:59');
INSERT INTO `v9_log` VALUES('301','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 10:25:59');
INSERT INTO `v9_log` VALUES('302','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 10:26:01');
INSERT INTO `v9_log` VALUES('303','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 10:26:01');
INSERT INTO `v9_log` VALUES('304','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 10:26:02');
INSERT INTO `v9_log` VALUES('305','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 10:26:02');
INSERT INTO `v9_log` VALUES('306','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 10:26:07');
INSERT INTO `v9_log` VALUES('307','','0','member','','member_group','?m=member&c=member_group&a=manage','','1','admin','127.0.0.1','2015-02-05 10:29:00');
INSERT INTO `v9_log` VALUES('308','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 10:31:06');
INSERT INTO `v9_log` VALUES('309','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 10:31:06');
INSERT INTO `v9_log` VALUES('310','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 10:31:08');
INSERT INTO `v9_log` VALUES('311','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 10:31:08');
INSERT INTO `v9_log` VALUES('312','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 10:32:08');
INSERT INTO `v9_log` VALUES('313','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 10:32:08');
INSERT INTO `v9_log` VALUES('314','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 10:32:10');
INSERT INTO `v9_log` VALUES('315','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 10:32:10');
INSERT INTO `v9_log` VALUES('316','','0','collection','','node','?m=collection&c=node&a=manage','','1','admin','127.0.0.1','2015-02-05 10:32:16');
INSERT INTO `v9_log` VALUES('317','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 10:34:39');
INSERT INTO `v9_log` VALUES('318','','0','content','','content','?m=content&c=content&a=add_othors','','1','admin','127.0.0.1','2015-02-05 10:34:46');
INSERT INTO `v9_log` VALUES('319','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 10:35:23');
INSERT INTO `v9_log` VALUES('320','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 10:35:23');
INSERT INTO `v9_log` VALUES('321','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 10:35:32');
INSERT INTO `v9_log` VALUES('322','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 10:35:32');
INSERT INTO `v9_log` VALUES('323','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 10:35:33');
INSERT INTO `v9_log` VALUES('324','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 10:35:33');
INSERT INTO `v9_log` VALUES('325','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 10:35:36');
INSERT INTO `v9_log` VALUES('326','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 10:35:36');
INSERT INTO `v9_log` VALUES('327','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 10:35:39');
INSERT INTO `v9_log` VALUES('328','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 10:35:39');
INSERT INTO `v9_log` VALUES('329','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 10:35:39');
INSERT INTO `v9_log` VALUES('330','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 10:35:39');
INSERT INTO `v9_log` VALUES('331','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 10:35:40');
INSERT INTO `v9_log` VALUES('332','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 10:35:40');
INSERT INTO `v9_log` VALUES('333','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 10:35:41');
INSERT INTO `v9_log` VALUES('334','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 10:35:41');
INSERT INTO `v9_log` VALUES('335','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 10:35:44');
INSERT INTO `v9_log` VALUES('336','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 10:35:44');
INSERT INTO `v9_log` VALUES('337','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 10:35:45');
INSERT INTO `v9_log` VALUES('338','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 10:35:45');
INSERT INTO `v9_log` VALUES('339','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 10:35:46');
INSERT INTO `v9_log` VALUES('340','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 10:35:46');
INSERT INTO `v9_log` VALUES('341','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 10:35:47');
INSERT INTO `v9_log` VALUES('342','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-05 10:35:47');
INSERT INTO `v9_log` VALUES('343','','0','collection','','node','?m=collection&c=node&a=manage','','1','admin','127.0.0.1','2015-02-05 10:36:08');
INSERT INTO `v9_log` VALUES('344','','0','comment','','comment_admin','?m=comment&c=comment_admin&a=listinfo','','1','admin','127.0.0.1','2015-02-05 10:36:09');
INSERT INTO `v9_log` VALUES('345','','0','content','','create_html','?m=content&c=create_html&a=category','','1','admin','127.0.0.1','2015-02-05 10:36:10');
INSERT INTO `v9_log` VALUES('346','','0','content','','content','?m=content&c=content&a=clear_data','','1','admin','127.0.0.1','2015-02-05 10:36:12');
INSERT INTO `v9_log` VALUES('347','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','127.0.0.1','2015-02-05 10:36:12');
INSERT INTO `v9_log` VALUES('348','','0','content','','create_html','?m=content&c=create_html&a=show','','1','admin','127.0.0.1','2015-02-05 10:36:13');
INSERT INTO `v9_log` VALUES('349','','0','member','','member','?m=member&c=member&a=manage','','1','admin','127.0.0.1','2015-02-05 10:36:23');
INSERT INTO `v9_log` VALUES('350','','0','member','','member_verify','?m=member&c=member_verify&a=manage','','1','admin','127.0.0.1','2015-02-05 10:36:23');
INSERT INTO `v9_log` VALUES('351','','0','member','','member_setting','?m=member&c=member_setting&a=manage','','1','admin','127.0.0.1','2015-02-05 10:36:24');
INSERT INTO `v9_log` VALUES('352','','0','member','','member_verify','?m=member&c=member_verify&a=manage','','1','admin','127.0.0.1','2015-02-05 10:36:25');
INSERT INTO `v9_log` VALUES('353','','0','member','','member','?m=member&c=member&a=manage','','1','admin','127.0.0.1','2015-02-05 10:36:25');
INSERT INTO `v9_log` VALUES('354','','0','member','','member_verify','?m=member&c=member_verify&a=manage','','1','admin','127.0.0.1','2015-02-05 10:36:26');
INSERT INTO `v9_log` VALUES('355','','0','member','','member','?m=member&c=member&a=manage','','1','admin','127.0.0.1','2015-02-05 10:36:26');
INSERT INTO `v9_log` VALUES('356','','0','member','','member_verify','?m=member&c=member_verify&a=manage','','1','admin','127.0.0.1','2015-02-05 10:36:27');
INSERT INTO `v9_log` VALUES('357','','0','member','','member_setting','?m=member&c=member_setting&a=manage','','1','admin','127.0.0.1','2015-02-05 10:36:27');
INSERT INTO `v9_log` VALUES('358','','0','member','','member_group','?m=member&c=member_group&a=manage','','1','admin','127.0.0.1','2015-02-05 10:36:29');
INSERT INTO `v9_log` VALUES('359','','0','member','','member_model','?m=member&c=member_model&a=manage','','1','admin','127.0.0.1','2015-02-05 10:36:31');
INSERT INTO `v9_log` VALUES('360','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-05 21:32:05');
INSERT INTO `v9_log` VALUES('361','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-05 21:32:22');
INSERT INTO `v9_log` VALUES('362','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-02-05 21:32:32');
INSERT INTO `v9_log` VALUES('363','','0','member','','member_menu','?m=member&c=member_menu&a=manage','','1','admin','127.0.0.1','2015-02-05 21:50:09');
INSERT INTO `v9_log` VALUES('364','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-02-05 21:50:11');
INSERT INTO `v9_log` VALUES('365','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-02-05 22:01:10');
INSERT INTO `v9_log` VALUES('366','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-02-05 22:18:53');
INSERT INTO `v9_log` VALUES('367','','0','member','','member_model','?m=member&c=member_model&a=manage','','1','admin','127.0.0.1','2015-02-05 22:54:12');
INSERT INTO `v9_log` VALUES('368','','0','member','','member','?m=member&c=member&a=manage','','1','admin','127.0.0.1','2015-02-05 23:10:59');
INSERT INTO `v9_log` VALUES('369','','0','member','','member_verify','?m=member&c=member_verify&a=manage','','1','admin','127.0.0.1','2015-02-05 23:11:00');
INSERT INTO `v9_log` VALUES('370','','0','member','','member_setting','?m=member&c=member_setting&a=manage','','1','admin','127.0.0.1','2015-02-05 23:11:01');
INSERT INTO `v9_log` VALUES('371','','0','member','','member_setting','?m=member&c=member_setting&a=manage','','1','admin','127.0.0.1','2015-02-05 23:12:23');
INSERT INTO `v9_log` VALUES('372','','0','member','','member_setting','?m=member&c=member_setting&a=manage','','1','admin','127.0.0.1','2015-02-05 23:12:23');
INSERT INTO `v9_log` VALUES('373','','0','member','','member_setting','?m=member&c=member_setting&a=manage','','1','admin','127.0.0.1','2015-02-05 23:14:21');
INSERT INTO `v9_log` VALUES('374','','0','member','','member_setting','?m=member&c=member_setting&a=manage','','1','admin','127.0.0.1','2015-02-05 23:14:23');
INSERT INTO `v9_log` VALUES('375','','0','member','','member_setting','?m=member&c=member_setting&a=manage','','1','admin','127.0.0.1','2015-02-05 23:14:29');
INSERT INTO `v9_log` VALUES('376','','0','collection','','node','?m=collection&c=node&a=manage','','1','admin','127.0.0.1','2015-02-05 23:14:49');
INSERT INTO `v9_log` VALUES('377','','0','comment','','comment_admin','?m=comment&c=comment_admin&a=listinfo','','1','admin','127.0.0.1','2015-02-05 23:14:49');
INSERT INTO `v9_log` VALUES('378','','0','member','','member','?m=member&c=member&a=manage','','1','admin','127.0.0.1','2015-02-05 23:14:55');
INSERT INTO `v9_log` VALUES('379','','0','collection','','node','?m=collection&c=node&a=manage','','1','admin','127.0.0.1','2015-02-05 23:19:05');
INSERT INTO `v9_log` VALUES('380','','0','comment','','comment_admin','?m=comment&c=comment_admin&a=listinfo','','1','admin','127.0.0.1','2015-02-05 23:19:05');
INSERT INTO `v9_log` VALUES('381','','0','content','','create_html','?m=content&c=create_html&a=category','','1','admin','127.0.0.1','2015-02-05 23:19:08');
INSERT INTO `v9_log` VALUES('382','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-02-05 23:50:13');
INSERT INTO `v9_log` VALUES('383','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-02-05 23:50:23');
INSERT INTO `v9_log` VALUES('384','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-02-06 00:09:54');
INSERT INTO `v9_log` VALUES('385','','0','member','','member_setting','?m=member&c=member_setting&a=manage','','1','admin','127.0.0.1','2015-02-06 00:09:57');
INSERT INTO `v9_log` VALUES('386','','0','member','','member_group','?m=member&c=member_group&a=manage','','1','admin','127.0.0.1','2015-02-06 00:09:59');
INSERT INTO `v9_log` VALUES('387','','0','member','','member_model','?m=member&c=member_model&a=manage','','1','admin','127.0.0.1','2015-02-06 00:10:00');
INSERT INTO `v9_log` VALUES('388','','0','comment','','comment_admin','?m=comment&c=comment_admin&a=listinfo','','1','admin','127.0.0.1','2015-02-06 00:14:44');
INSERT INTO `v9_log` VALUES('389','','0','content','','create_html','?m=content&c=create_html&a=category','','1','admin','127.0.0.1','2015-02-06 00:15:02');
INSERT INTO `v9_log` VALUES('390','','0','member','','member_menu','?m=member&c=member_menu&a=manage','','1','admin','127.0.0.1','2015-02-06 00:25:49');
INSERT INTO `v9_log` VALUES('391','','0','member','','member_menu','?m=member&c=member_menu&a=manage','','1','admin','127.0.0.1','2015-02-06 00:25:50');
INSERT INTO `v9_log` VALUES('392','','0','member','','member_menu','?m=member&c=member_menu&a=manage','','1','admin','127.0.0.1','2015-02-06 00:26:06');
INSERT INTO `v9_log` VALUES('393','','0','member','','member_menu','?m=member&c=member_menu&a=manage','','1','admin','127.0.0.1','2015-02-06 00:26:07');
INSERT INTO `v9_log` VALUES('394','','0','zl_admin','','database','?m=zl_admin&c=database&a=export','','1','admin','127.0.0.1','2015-02-06 00:26:24');
INSERT INTO `v9_log` VALUES('395','','0','zl_admin','','googlesitemap','?m=zl_admin&c=googlesitemap&a=set','','1','admin','127.0.0.1','2015-02-06 00:26:26');
INSERT INTO `v9_log` VALUES('396','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-06 00:26:48');
INSERT INTO `v9_log` VALUES('397','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-06 00:26:48');
INSERT INTO `v9_log` VALUES('398','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-02-06 00:36:32');
INSERT INTO `v9_log` VALUES('399','','0','member','','member_menu','?m=member&c=member_menu&a=manage','','1','admin','127.0.0.1','2015-02-06 00:36:35');
INSERT INTO `v9_log` VALUES('400','','0','attachment','','manage','?m=attachment&c=manage&a=dir','','1','admin','127.0.0.1','2015-02-06 00:36:42');
INSERT INTO `v9_log` VALUES('401','','0','attachment','','manage','?m=attachment&c=manage&a=dir','','1','admin','127.0.0.1','2015-02-06 00:36:42');
INSERT INTO `v9_log` VALUES('402','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-06 08:56:46');
INSERT INTO `v9_log` VALUES('403','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-06 08:56:46');
INSERT INTO `v9_log` VALUES('404','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-06 08:56:58');
INSERT INTO `v9_log` VALUES('405','','0','member','','member','?m=member&c=member&a=manage','','1','admin','127.0.0.1','2015-02-06 17:26:21');
INSERT INTO `v9_log` VALUES('406','','0','member','','member','?m=member&c=member&a=manage','','1','admin','127.0.0.1','2015-02-06 17:26:22');
INSERT INTO `v9_log` VALUES('407','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-06 17:26:38');
INSERT INTO `v9_log` VALUES('408','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-06 17:26:38');
INSERT INTO `v9_log` VALUES('409','','0','comment','','comment_admin','?m=comment&c=comment_admin&a=listinfo','','1','admin','127.0.0.1','2015-02-06 17:26:49');
INSERT INTO `v9_log` VALUES('410','','0','comment','','comment_admin','?m=comment&c=comment_admin&a=listinfo','','1','admin','127.0.0.1','2015-02-06 17:26:51');
INSERT INTO `v9_log` VALUES('411','','0','comment','','comment_admin','?m=comment&c=comment_admin&a=listinfo','','1','admin','127.0.0.1','2015-02-06 17:26:52');
INSERT INTO `v9_log` VALUES('412','','0','comment','','comment_admin','?m=comment&c=comment_admin&a=listinfo','','1','admin','127.0.0.1','2015-02-06 17:26:57');
INSERT INTO `v9_log` VALUES('413','','0','comment','','comment_admin','?m=comment&c=comment_admin&a=listinfo','','1','admin','127.0.0.1','2015-02-06 17:26:58');
INSERT INTO `v9_log` VALUES('414','','0','comment','','comment_admin','?m=comment&c=comment_admin&a=listinfo','','1','admin','127.0.0.1','2015-02-06 17:27:22');
INSERT INTO `v9_log` VALUES('415','','0','comment','','comment_admin','?m=comment&c=comment_admin&a=listinfo','','1','admin','127.0.0.1','2015-02-06 17:27:26');
INSERT INTO `v9_log` VALUES('416','','0','comment','','comment_admin','?m=comment&c=comment_admin&a=listinfo','','1','admin','127.0.0.1','2015-02-06 17:27:32');
INSERT INTO `v9_log` VALUES('417','','0','collection','','node','?m=collection&c=node&a=manage','','1','admin','127.0.0.1','2015-02-06 17:27:33');
INSERT INTO `v9_log` VALUES('418','','0','comment','','comment_admin','?m=comment&c=comment_admin&a=listinfo','','1','admin','127.0.0.1','2015-02-06 17:27:34');
INSERT INTO `v9_log` VALUES('419','','0','comment','','comment_admin','?m=comment&c=comment_admin&a=listinfo','','1','admin','127.0.0.1','2015-02-06 17:27:35');
INSERT INTO `v9_log` VALUES('420','','0','collection','','node','?m=collection&c=node&a=manage','','1','admin','127.0.0.1','2015-02-06 17:27:37');
INSERT INTO `v9_log` VALUES('421','','0','comment','','comment_admin','?m=comment&c=comment_admin&a=listinfo','','1','admin','127.0.0.1','2015-02-06 17:27:38');
INSERT INTO `v9_log` VALUES('422','','0','collection','','node','?m=collection&c=node&a=manage','','1','admin','127.0.0.1','2015-02-06 17:27:39');
INSERT INTO `v9_log` VALUES('423','','0','comment','','comment_admin','?m=comment&c=comment_admin&a=listinfo','','1','admin','127.0.0.1','2015-02-06 17:27:40');
INSERT INTO `v9_log` VALUES('424','','0','collection','','node','?m=collection&c=node&a=manage','','1','admin','127.0.0.1','2015-02-06 17:27:41');
INSERT INTO `v9_log` VALUES('425','','0','collection','','node','?m=collection&c=node&a=manage','','1','admin','127.0.0.1','2015-02-06 17:27:47');
INSERT INTO `v9_log` VALUES('426','','0','comment','','comment_admin','?m=comment&c=comment_admin&a=listinfo','','1','admin','127.0.0.1','2015-02-06 17:27:48');
INSERT INTO `v9_log` VALUES('427','','0','collection','','node','?m=collection&c=node&a=manage','','1','admin','127.0.0.1','2015-02-06 17:27:50');
INSERT INTO `v9_log` VALUES('428','','0','member','','member','?m=member&c=member&a=manage','','1','admin','127.0.0.1','2015-02-06 17:27:58');
INSERT INTO `v9_log` VALUES('429','','0','member','','member_menu','?m=member&c=member_menu&a=manage','','1','admin','127.0.0.1','2015-02-06 17:28:04');
INSERT INTO `v9_log` VALUES('430','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-02-06 17:45:08');
INSERT INTO `v9_log` VALUES('431','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-06 17:45:17');
INSERT INTO `v9_log` VALUES('432','','0','member','','member','?m=member&c=member&a=manage','','1','admin','127.0.0.1','2015-02-06 17:45:23');
INSERT INTO `v9_log` VALUES('433','','0','zl_admin','','site','?m=zl_admin&c=site&a=edit','','1','admin','127.0.0.1','2015-02-06 17:48:54');
INSERT INTO `v9_log` VALUES('434','','0','zl_admin','','site','?m=zl_admin&c=site&a=edit','','1','admin','127.0.0.1','2015-02-06 17:49:05');
INSERT INTO `v9_log` VALUES('435','','0','zl_admin','','site','?m=zl_admin&c=site&a=edit','','1','admin','127.0.0.1','2015-02-06 17:50:06');
INSERT INTO `v9_log` VALUES('436','','0','zl_admin','','site','?m=zl_admin&c=site&a=edit','','1','admin','127.0.0.1','2015-02-06 17:50:10');
INSERT INTO `v9_log` VALUES('437','','0','zl_admin','','site','?m=zl_admin&c=site&a=edit','','1','admin','127.0.0.1','2015-02-06 17:50:13');
INSERT INTO `v9_log` VALUES('438','','0','zl_admin','','site','?m=zl_admin&c=site&a=edit','','1','admin','127.0.0.1','2015-02-06 17:50:19');
INSERT INTO `v9_log` VALUES('439','','0','zl_admin','','site','?m=zl_admin&c=site&a=edit','','1','admin','127.0.0.1','2015-02-06 17:50:26');
INSERT INTO `v9_log` VALUES('440','','0','zl_admin','','site','?m=zl_admin&c=site&a=edit','','1','admin','127.0.0.1','2015-02-06 17:51:15');
INSERT INTO `v9_log` VALUES('441','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-06 17:53:29');
INSERT INTO `v9_log` VALUES('442','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-06 17:53:36');
INSERT INTO `v9_log` VALUES('443','','0','content','','content','?m=content&c=content&a=edit','','1','admin','127.0.0.1','2015-02-06 17:53:46');
INSERT INTO `v9_log` VALUES('444','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-06 17:53:52');
INSERT INTO `v9_log` VALUES('445','','0','content','','content','?m=content&c=content&a=edit','','1','admin','127.0.0.1','2015-02-06 17:53:57');
INSERT INTO `v9_log` VALUES('446','','0','collection','','node','?m=collection&c=node&a=manage','','1','admin','127.0.0.1','2015-02-06 17:56:16');
INSERT INTO `v9_log` VALUES('447','','0','comment','','comment_admin','?m=comment&c=comment_admin&a=listinfo','','1','admin','127.0.0.1','2015-02-06 17:56:17');
INSERT INTO `v9_log` VALUES('448','','0','comment','','comment_admin','?m=comment&c=comment_admin&a=listinfo','','1','admin','127.0.0.1','2015-02-06 17:56:19');
INSERT INTO `v9_log` VALUES('449','','0','comment','','comment_admin','?m=comment&c=comment_admin&a=listinfo','','1','admin','127.0.0.1','2015-02-06 17:56:20');
INSERT INTO `v9_log` VALUES('450','','0','comment','','comment_admin','?m=comment&c=comment_admin&a=listinfo','','1','admin','127.0.0.1','2015-02-06 17:56:21');
INSERT INTO `v9_log` VALUES('451','','0','collection','','node','?m=collection&c=node&a=manage','','1','admin','127.0.0.1','2015-02-06 17:56:22');
INSERT INTO `v9_log` VALUES('452','','0','comment','','comment_admin','?m=comment&c=comment_admin&a=listinfo','','1','admin','127.0.0.1','2015-02-06 17:56:23');
INSERT INTO `v9_log` VALUES('453','','0','comment','','comment_admin','?m=comment&c=comment_admin&a=listinfo','','1','admin','127.0.0.1','2015-02-06 17:56:28');
INSERT INTO `v9_log` VALUES('454','','0','collection','','node','?m=collection&c=node&a=manage','','1','admin','127.0.0.1','2015-02-06 17:56:29');
INSERT INTO `v9_log` VALUES('455','','0','comment','','comment_admin','?m=comment&c=comment_admin&a=listinfo','','1','admin','127.0.0.1','2015-02-06 17:56:32');
INSERT INTO `v9_log` VALUES('456','','0','comment','','comment_admin','?m=comment&c=comment_admin&a=listinfo','','1','admin','127.0.0.1','2015-02-06 17:56:33');
INSERT INTO `v9_log` VALUES('457','','0','comment','','comment_admin','?m=comment&c=comment_admin&a=listinfo','','1','admin','127.0.0.1','2015-02-06 17:56:34');
INSERT INTO `v9_log` VALUES('458','','0','collection','','node','?m=collection&c=node&a=manage','','1','admin','127.0.0.1','2015-02-06 17:56:36');
INSERT INTO `v9_log` VALUES('459','','0','comment','','comment_admin','?m=comment&c=comment_admin&a=listinfo','','1','admin','127.0.0.1','2015-02-06 17:56:37');
INSERT INTO `v9_log` VALUES('460','','0','comment','','comment_admin','?m=comment&c=comment_admin&a=listinfo','','1','admin','127.0.0.1','2015-02-06 17:56:38');
INSERT INTO `v9_log` VALUES('461','','0','comment','','comment_admin','?m=comment&c=comment_admin&a=listinfo','','1','admin','127.0.0.1','2015-02-06 17:56:40');
INSERT INTO `v9_log` VALUES('462','','0','collection','','node','?m=collection&c=node&a=manage','','1','admin','127.0.0.1','2015-02-06 17:56:48');
INSERT INTO `v9_log` VALUES('463','','0','content','','create_html','?m=content&c=create_html&a=category','','1','admin','127.0.0.1','2015-02-06 17:56:52');
INSERT INTO `v9_log` VALUES('464','','0','content','','create_html','?m=content&c=create_html&a=category','','1','admin','127.0.0.1','2015-02-06 17:56:54');
INSERT INTO `v9_log` VALUES('465','','0','content','','create_html','?m=content&c=create_html&a=category','','1','admin','127.0.0.1','2015-02-06 17:56:55');
INSERT INTO `v9_log` VALUES('466','','0','content','','create_html','?m=content&c=create_html&a=category','','1','admin','127.0.0.1','2015-02-06 17:56:55');
INSERT INTO `v9_log` VALUES('467','','0','content','','create_html','?m=content&c=create_html&a=category','','1','admin','127.0.0.1','2015-02-06 17:56:55');
INSERT INTO `v9_log` VALUES('468','','0','content','','create_html','?m=content&c=create_html&a=category','','1','admin','127.0.0.1','2015-02-06 17:56:56');
INSERT INTO `v9_log` VALUES('469','','0','content','','create_html','?m=content&c=create_html&a=category','','1','admin','127.0.0.1','2015-02-06 17:56:56');
INSERT INTO `v9_log` VALUES('470','','0','content','','create_html','?m=content&c=create_html&a=category','','1','admin','127.0.0.1','2015-02-06 17:56:57');
INSERT INTO `v9_log` VALUES('471','','0','content','','content','?m=content&c=content&a=clear_data','','1','admin','127.0.0.1','2015-02-06 17:57:03');
INSERT INTO `v9_log` VALUES('472','','0','content','','content','?m=content&c=content&a=clear_data','','1','admin','127.0.0.1','2015-02-06 17:57:11');
INSERT INTO `v9_log` VALUES('473','','0','content','','content','?m=content&c=content&a=clear_data','','1','admin','127.0.0.1','2015-02-06 17:57:16');
INSERT INTO `v9_log` VALUES('474','','0','content','','content','?m=content&c=content&a=clear_data','','1','admin','127.0.0.1','2015-02-06 17:57:18');
INSERT INTO `v9_log` VALUES('475','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','127.0.0.1','2015-02-06 17:57:19');
INSERT INTO `v9_log` VALUES('476','','0','content','','create_html','?m=content&c=create_html&a=show','','1','admin','127.0.0.1','2015-02-06 17:57:21');
INSERT INTO `v9_log` VALUES('477','','0','member','','member','?m=member&c=member&a=manage','','1','admin','127.0.0.1','2015-02-06 17:57:40');
INSERT INTO `v9_log` VALUES('478','','0','member','','member_verify','?m=member&c=member_verify&a=manage','','1','admin','127.0.0.1','2015-02-06 17:57:42');
INSERT INTO `v9_log` VALUES('479','','0','member','','member_setting','?m=member&c=member_setting&a=manage','','1','admin','127.0.0.1','2015-02-06 17:57:43');
INSERT INTO `v9_log` VALUES('480','','0','member','','member_group','?m=member&c=member_group&a=manage','','1','admin','127.0.0.1','2015-02-06 17:57:47');
INSERT INTO `v9_log` VALUES('481','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-06 19:41:33');
INSERT INTO `v9_log` VALUES('482','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-06 19:41:36');
INSERT INTO `v9_log` VALUES('483','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-06 19:41:59');
INSERT INTO `v9_log` VALUES('484','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-06 19:42:00');
INSERT INTO `v9_log` VALUES('485','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-06 19:42:17');
INSERT INTO `v9_log` VALUES('486','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-06 19:42:20');
INSERT INTO `v9_log` VALUES('487','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-06 19:42:25');
INSERT INTO `v9_log` VALUES('488','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-06 19:42:39');
INSERT INTO `v9_log` VALUES('489','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-06 19:43:52');
INSERT INTO `v9_log` VALUES('490','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-06 19:44:00');
INSERT INTO `v9_log` VALUES('491','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-06 19:44:03');
INSERT INTO `v9_log` VALUES('492','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-06 19:46:13');
INSERT INTO `v9_log` VALUES('493','','0','zl_admin','','setting','?m=zl_admin&c=setting&a=save','','1','admin','127.0.0.1','2015-02-06 19:50:39');
INSERT INTO `v9_log` VALUES('494','','0','collection','','node','?m=collection&c=node&a=manage','','1','admin','127.0.0.1','2015-02-06 21:01:20');
INSERT INTO `v9_log` VALUES('495','','0','collection','','node','?m=collection&c=node&a=add','','1','admin','127.0.0.1','2015-02-06 21:01:22');
INSERT INTO `v9_log` VALUES('496','','0','collection','','node','?m=collection&c=node&a=add','','1','admin','127.0.0.1','2015-02-06 21:01:22');
INSERT INTO `v9_log` VALUES('497','','0','comment','','comment_admin','?m=comment&c=comment_admin&a=listinfo','','1','admin','127.0.0.1','2015-02-06 21:01:30');
INSERT INTO `v9_log` VALUES('498','','0','content','','create_html','?m=content&c=create_html&a=category','','1','admin','127.0.0.1','2015-02-06 21:01:34');
INSERT INTO `v9_log` VALUES('499','','0','content','','content','?m=content&c=content&a=clear_data','','1','admin','127.0.0.1','2015-02-06 21:01:36');
INSERT INTO `v9_log` VALUES('500','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','127.0.0.1','2015-02-06 21:01:37');
INSERT INTO `v9_log` VALUES('501','','0','content','','content','?m=content&c=content&a=clear_data','','1','admin','127.0.0.1','2015-02-06 21:01:38');
INSERT INTO `v9_log` VALUES('502','','0','content','','create_html','?m=content&c=create_html&a=show','','1','admin','127.0.0.1','2015-02-06 21:01:39');
INSERT INTO `v9_log` VALUES('503','','0','content','','create_html','?m=content&c=create_html&a=show','','1','admin','127.0.0.1','2015-02-06 21:01:43');
INSERT INTO `v9_log` VALUES('504','','0','content','','create_html','?m=content&c=create_html&a=category','','1','admin','127.0.0.1','2015-02-06 21:03:34');
INSERT INTO `v9_log` VALUES('505','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-06 21:09:12');
INSERT INTO `v9_log` VALUES('506','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-06 21:09:22');
INSERT INTO `v9_log` VALUES('507','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-06 21:09:28');
INSERT INTO `v9_log` VALUES('508','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-06 21:09:31');
INSERT INTO `v9_log` VALUES('509','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-06 21:09:33');
INSERT INTO `v9_log` VALUES('510','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-06 21:22:09');
INSERT INTO `v9_log` VALUES('511','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-06 21:22:29');
INSERT INTO `v9_log` VALUES('512','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-06 21:22:36');
INSERT INTO `v9_log` VALUES('513','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-06 21:25:15');
INSERT INTO `v9_log` VALUES('514','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-06 21:25:54');
INSERT INTO `v9_log` VALUES('515','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-06 21:25:59');
INSERT INTO `v9_log` VALUES('516','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-06 21:26:54');
INSERT INTO `v9_log` VALUES('517','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-06 21:28:07');
INSERT INTO `v9_log` VALUES('518','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-06 21:28:22');
INSERT INTO `v9_log` VALUES('519','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-06 21:28:59');
INSERT INTO `v9_log` VALUES('520','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-06 21:29:43');
INSERT INTO `v9_log` VALUES('521','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-06 21:30:04');
INSERT INTO `v9_log` VALUES('522','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-06 21:30:09');
INSERT INTO `v9_log` VALUES('523','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-06 21:30:23');
INSERT INTO `v9_log` VALUES('524','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-06 21:32:46');
INSERT INTO `v9_log` VALUES('525','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-06 21:35:17');
INSERT INTO `v9_log` VALUES('526','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-06 21:35:19');
INSERT INTO `v9_log` VALUES('527','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-06 21:35:26');
INSERT INTO `v9_log` VALUES('528','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-06 21:36:14');
INSERT INTO `v9_log` VALUES('529','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-02-06 21:53:57');
INSERT INTO `v9_log` VALUES('530','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-02-06 21:54:07');
INSERT INTO `v9_log` VALUES('531','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-02-06 21:54:07');
INSERT INTO `v9_log` VALUES('532','','0','pay','','payment','?m=pay&c=payment&a=modify_deposit','','1','admin','127.0.0.1','2015-02-06 21:54:08');
INSERT INTO `v9_log` VALUES('533','','0','pay','','payment','?m=pay&c=payment&a=modify_deposit','','1','admin','127.0.0.1','2015-02-06 21:54:08');
INSERT INTO `v9_log` VALUES('534','','0','member','','member','?m=member&c=member&a=manage','','1','admin','127.0.0.1','2015-02-06 21:54:11');
INSERT INTO `v9_log` VALUES('535','','0','member','','member','?m=member&c=member&a=manage','','1','admin','127.0.0.1','2015-02-06 21:54:16');
INSERT INTO `v9_log` VALUES('536','','0','member','','member_verify','?m=member&c=member_verify&a=manage','','1','admin','127.0.0.1','2015-02-06 21:54:17');
INSERT INTO `v9_log` VALUES('537','','0','member','','member_setting','?m=member&c=member_setting&a=manage','','1','admin','127.0.0.1','2015-02-06 21:54:18');
INSERT INTO `v9_log` VALUES('538','','0','member','','member_verify','?m=member&c=member_verify&a=manage','','1','admin','127.0.0.1','2015-02-06 21:54:27');
INSERT INTO `v9_log` VALUES('539','','0','member','','member','?m=member&c=member&a=manage','','1','admin','127.0.0.1','2015-02-06 21:54:34');
INSERT INTO `v9_log` VALUES('540','','0','content','','create_html','?m=content&c=create_html&a=show','','1','admin','127.0.0.1','2015-02-06 22:25:55');
INSERT INTO `v9_log` VALUES('541','','0','content','','create_html','?m=content&c=create_html&a=show','','1','admin','127.0.0.1','2015-02-06 22:25:59');
INSERT INTO `v9_log` VALUES('542','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-02-06 22:27:33');
INSERT INTO `v9_log` VALUES('543','','0','member','','member','?m=member&c=member&a=manage','','1','admin','127.0.0.1','2015-02-06 22:28:12');
INSERT INTO `v9_log` VALUES('544','','0','member','','member','?m=member&c=member&a=manage','','1','admin','127.0.0.1','2015-02-06 22:28:13');
INSERT INTO `v9_log` VALUES('545','','0','member','','member_verify','?m=member&c=member_verify&a=manage','','1','admin','127.0.0.1','2015-02-06 22:28:13');
INSERT INTO `v9_log` VALUES('546','','0','member','','member_setting','?m=member&c=member_setting&a=manage','','1','admin','127.0.0.1','2015-02-06 22:28:15');
INSERT INTO `v9_log` VALUES('547','','0','member','','member_verify','?m=member&c=member_verify&a=manage','','1','admin','127.0.0.1','2015-02-06 22:28:16');
INSERT INTO `v9_log` VALUES('548','','0','member','','member_setting','?m=member&c=member_setting&a=manage','','1','admin','127.0.0.1','2015-02-06 22:28:17');
INSERT INTO `v9_log` VALUES('549','','0','content','','create_html','?m=content&c=create_html&a=category','','1','admin','127.0.0.1','2015-02-06 22:29:29');
INSERT INTO `v9_log` VALUES('550','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-06 23:28:22');
INSERT INTO `v9_log` VALUES('551','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-06 23:28:56');
INSERT INTO `v9_log` VALUES('552','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-02-06 23:29:26');
INSERT INTO `v9_log` VALUES('553','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-06 23:29:30');
INSERT INTO `v9_log` VALUES('554','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-06 23:30:00');
INSERT INTO `v9_log` VALUES('555','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-06 23:31:12');
INSERT INTO `v9_log` VALUES('556','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-06 23:32:13');
INSERT INTO `v9_log` VALUES('557','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-06 23:33:22');
INSERT INTO `v9_log` VALUES('558','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-06 23:33:26');
INSERT INTO `v9_log` VALUES('559','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-06 23:36:24');
INSERT INTO `v9_log` VALUES('560','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-06 23:40:15');
INSERT INTO `v9_log` VALUES('561','','0','content','','create_html','?m=content&c=create_html&a=category','','1','admin','127.0.0.1','2015-02-06 23:40:27');
INSERT INTO `v9_log` VALUES('562','','0','content','','create_html','?m=content&c=create_html&a=category','','1','admin','127.0.0.1','2015-02-06 23:40:34');
INSERT INTO `v9_log` VALUES('563','','0','zl_admin','','category','?m=zl_admin&c=category&a=add','','1','admin','127.0.0.1','2015-02-06 23:40:38');
INSERT INTO `v9_log` VALUES('564','','0','zl_admin','','category','?m=zl_admin&c=category&a=add','','1','admin','127.0.0.1','2015-02-06 23:40:38');
INSERT INTO `v9_log` VALUES('565','','0','zl_admin','','category','?m=zl_admin&c=category&a=add','','1','admin','127.0.0.1','2015-02-06 23:41:05');
INSERT INTO `v9_log` VALUES('566','','0','zl_admin','','category','?m=zl_admin&c=category&a=add','','1','admin','127.0.0.1','2015-02-06 23:41:05');
INSERT INTO `v9_log` VALUES('567','','0','zl_admin','','category','?m=zl_admin&c=category&a=add','','1','admin','127.0.0.1','2015-02-06 23:41:06');
INSERT INTO `v9_log` VALUES('568','','0','zl_admin','','category','?m=zl_admin&c=category&a=add','','1','admin','127.0.0.1','2015-02-06 23:41:06');
INSERT INTO `v9_log` VALUES('569','','0','zl_admin','','category','?m=zl_admin&c=category&a=add','','1','admin','127.0.0.1','2015-02-06 23:41:16');
INSERT INTO `v9_log` VALUES('570','','0','zl_admin','','category','?m=zl_admin&c=category&a=add','','1','admin','127.0.0.1','2015-02-06 23:41:16');
INSERT INTO `v9_log` VALUES('571','','0','zl_admin','','category','?m=zl_admin&c=category&a=add','','1','admin','127.0.0.1','2015-02-06 23:41:26');
INSERT INTO `v9_log` VALUES('572','','0','zl_admin','','category','?m=zl_admin&c=category&a=add','','1','admin','127.0.0.1','2015-02-06 23:41:27');
INSERT INTO `v9_log` VALUES('573','','0','attachment','','manage','?m=attachment&c=manage&a=dir','','1','admin','127.0.0.1','2015-02-06 23:41:55');
INSERT INTO `v9_log` VALUES('574','','0','attachment','','manage','?m=attachment&c=manage&a=dir','','1','admin','127.0.0.1','2015-02-06 23:41:55');
INSERT INTO `v9_log` VALUES('575','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-06 23:42:26');
INSERT INTO `v9_log` VALUES('576','','0','special','','special','?m=special&c=special&a=add','','1','admin','127.0.0.1','2015-02-06 23:42:46');
INSERT INTO `v9_log` VALUES('577','','0','special','','special','?m=special&c=special&a=add','','1','admin','127.0.0.1','2015-02-06 23:42:47');
INSERT INTO `v9_log` VALUES('578','','0','special','','album','?m=special&c=album&a=import','','1','admin','127.0.0.1','2015-02-06 23:42:48');
INSERT INTO `v9_log` VALUES('579','','0','special','','album','?m=special&c=album&a=import','','1','admin','127.0.0.1','2015-02-06 23:42:48');
INSERT INTO `v9_log` VALUES('580','','0','video','','video','?m=video&c=video&a=setting','','1','admin','127.0.0.1','2015-02-06 23:42:50');
INSERT INTO `v9_log` VALUES('581','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-06 23:43:21');
INSERT INTO `v9_log` VALUES('582','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-06 23:43:42');
INSERT INTO `v9_log` VALUES('583','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-02-06 23:44:56');
INSERT INTO `v9_log` VALUES('584','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-06 23:50:56');
INSERT INTO `v9_log` VALUES('585','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-06 23:51:45');
INSERT INTO `v9_log` VALUES('586','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-06 23:52:22');
INSERT INTO `v9_log` VALUES('587','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-06 23:53:02');
INSERT INTO `v9_log` VALUES('588','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-06 23:54:26');
INSERT INTO `v9_log` VALUES('589','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-06 23:54:56');
INSERT INTO `v9_log` VALUES('590','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-06 23:55:24');
INSERT INTO `v9_log` VALUES('591','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-06 23:55:53');
INSERT INTO `v9_log` VALUES('592','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-06 23:59:31');
INSERT INTO `v9_log` VALUES('593','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-02-07 00:04:19');
INSERT INTO `v9_log` VALUES('594','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-07 00:46:57');
INSERT INTO `v9_log` VALUES('595','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-07 00:47:19');
INSERT INTO `v9_log` VALUES('596','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-07 00:49:13');
INSERT INTO `v9_log` VALUES('597','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-07 00:49:35');
INSERT INTO `v9_log` VALUES('598','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-07 00:49:42');
INSERT INTO `v9_log` VALUES('599','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-07 00:51:05');
INSERT INTO `v9_log` VALUES('600','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-07 00:52:24');
INSERT INTO `v9_log` VALUES('601','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-07 00:52:42');
INSERT INTO `v9_log` VALUES('602','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-07 00:53:21');
INSERT INTO `v9_log` VALUES('603','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-07 00:53:25');
INSERT INTO `v9_log` VALUES('604','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-07 00:53:36');
INSERT INTO `v9_log` VALUES('605','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-07 00:53:45');
INSERT INTO `v9_log` VALUES('606','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-07 00:54:00');
INSERT INTO `v9_log` VALUES('607','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-07 00:56:17');
INSERT INTO `v9_log` VALUES('608','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-07 00:57:17');
INSERT INTO `v9_log` VALUES('609','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-07 00:58:16');
INSERT INTO `v9_log` VALUES('610','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-07 01:01:03');
INSERT INTO `v9_log` VALUES('611','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-07 01:03:42');
INSERT INTO `v9_log` VALUES('612','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-07 01:03:44');
INSERT INTO `v9_log` VALUES('613','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-07 01:03:56');
INSERT INTO `v9_log` VALUES('614','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-07 01:07:51');
INSERT INTO `v9_log` VALUES('615','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-07 01:09:38');
INSERT INTO `v9_log` VALUES('616','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-07 01:10:09');
INSERT INTO `v9_log` VALUES('617','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-07 01:13:17');
INSERT INTO `v9_log` VALUES('618','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-07 01:14:04');
INSERT INTO `v9_log` VALUES('619','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-07 01:15:47');
INSERT INTO `v9_log` VALUES('620','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-07 01:20:13');
INSERT INTO `v9_log` VALUES('621','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-07 14:50:02');
INSERT INTO `v9_log` VALUES('622','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-07 14:50:08');
INSERT INTO `v9_log` VALUES('623','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-07 14:50:13');
INSERT INTO `v9_log` VALUES('624','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-07 14:50:27');
INSERT INTO `v9_log` VALUES('625','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-02-07 14:50:44');
INSERT INTO `v9_log` VALUES('626','','0','collection','','node','?m=collection&c=node&a=manage','','1','admin','127.0.0.1','2015-02-07 14:50:55');
INSERT INTO `v9_log` VALUES('627','','0','collection','','node','?m=collection&c=node&a=manage','','1','admin','127.0.0.1','2015-02-07 14:51:06');
INSERT INTO `v9_log` VALUES('628','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-07 14:52:00');
INSERT INTO `v9_log` VALUES('629','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-07 15:21:59');
INSERT INTO `v9_log` VALUES('630','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-07 15:22:04');
INSERT INTO `v9_log` VALUES('631','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-08 10:54:06');
INSERT INTO `v9_log` VALUES('632','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-08 10:54:13');
INSERT INTO `v9_log` VALUES('633','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-08 10:54:28');
INSERT INTO `v9_log` VALUES('634','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-08 11:09:19');
INSERT INTO `v9_log` VALUES('635','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-08 11:10:27');
INSERT INTO `v9_log` VALUES('636','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-08 11:11:40');
INSERT INTO `v9_log` VALUES('637','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-08 11:39:45');
INSERT INTO `v9_log` VALUES('638','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-08 11:40:08');
INSERT INTO `v9_log` VALUES('639','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-08 11:44:48');
INSERT INTO `v9_log` VALUES('640','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-08 11:47:35');
INSERT INTO `v9_log` VALUES('641','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-08 11:51:52');
INSERT INTO `v9_log` VALUES('642','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-08 11:53:06');
INSERT INTO `v9_log` VALUES('643','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-08 11:54:38');
INSERT INTO `v9_log` VALUES('644','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-08 11:55:28');
INSERT INTO `v9_log` VALUES('645','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-08 11:55:58');
INSERT INTO `v9_log` VALUES('646','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-08 11:56:55');
INSERT INTO `v9_log` VALUES('647','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-08 11:57:15');
INSERT INTO `v9_log` VALUES('648','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-08 11:59:04');
INSERT INTO `v9_log` VALUES('649','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-08 11:59:27');
INSERT INTO `v9_log` VALUES('650','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-08 12:00:52');
INSERT INTO `v9_log` VALUES('651','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-08 12:01:09');
INSERT INTO `v9_log` VALUES('652','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-08 12:10:02');
INSERT INTO `v9_log` VALUES('653','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-08 12:15:46');
INSERT INTO `v9_log` VALUES('654','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-08 12:16:31');
INSERT INTO `v9_log` VALUES('655','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-08 12:17:20');
INSERT INTO `v9_log` VALUES('656','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-08 12:19:09');
INSERT INTO `v9_log` VALUES('657','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-08 12:20:48');
INSERT INTO `v9_log` VALUES('658','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-08 12:21:47');
INSERT INTO `v9_log` VALUES('659','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-08 12:24:22');
INSERT INTO `v9_log` VALUES('660','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-08 12:24:39');
INSERT INTO `v9_log` VALUES('661','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-08 12:25:09');
INSERT INTO `v9_log` VALUES('662','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-08 12:25:21');
INSERT INTO `v9_log` VALUES('663','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-08 12:25:30');
INSERT INTO `v9_log` VALUES('664','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-08 12:25:49');
INSERT INTO `v9_log` VALUES('665','','0','zl_admin','','role','?m=zl_admin&c=role&a=add','','1','admin','127.0.0.1','2015-02-08 12:29:55');
INSERT INTO `v9_log` VALUES('666','','0','zl_admin','','role','?m=zl_admin&c=role&a=add','','1','admin','127.0.0.1','2015-02-08 12:29:57');
INSERT INTO `v9_log` VALUES('667','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-02-08 12:30:03');
INSERT INTO `v9_log` VALUES('668','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-08 12:30:07');
INSERT INTO `v9_log` VALUES('669','','0','member','','member','?m=member&c=member&a=manage','','1','admin','127.0.0.1','2015-02-08 12:30:22');
INSERT INTO `v9_log` VALUES('670','','0','member','','member','?m=member&c=member&a=manage','','1','admin','127.0.0.1','2015-02-08 12:33:20');
INSERT INTO `v9_log` VALUES('671','','0','member','','member','?m=member&c=member&a=add','','1','admin','127.0.0.1','2015-02-08 12:33:21');
INSERT INTO `v9_log` VALUES('672','','0','member','','member','?m=member&c=member&a=add','','1','admin','127.0.0.1','2015-02-08 12:33:23');
INSERT INTO `v9_log` VALUES('673','','0','member','','member','?m=member&c=member&a=add','','1','admin','127.0.0.1','2015-02-08 12:33:26');
INSERT INTO `v9_log` VALUES('674','','0','member','','member','?m=member&c=member&a=add','','1','admin','127.0.0.1','2015-02-08 12:33:29');
INSERT INTO `v9_log` VALUES('675','','0','member','','member','?m=member&c=member&a=add','','1','admin','127.0.0.1','2015-02-08 12:33:35');
INSERT INTO `v9_log` VALUES('676','','0','member','','member','?m=member&c=member&a=add','','1','admin','127.0.0.1','2015-02-08 12:33:38');
INSERT INTO `v9_log` VALUES('677','','0','member','','member','?m=member&c=member&a=add','','1','admin','127.0.0.1','2015-02-08 12:33:41');
INSERT INTO `v9_log` VALUES('678','','0','template','','style','?m=template&c=style&a=import','','1','admin','127.0.0.1','2015-02-08 12:34:04');
INSERT INTO `v9_log` VALUES('679','','0','template','','style','?m=template&c=style&a=import','','1','admin','127.0.0.1','2015-02-08 12:34:07');
INSERT INTO `v9_log` VALUES('680','','0','template','','style','?m=template&c=style&a=import','','1','admin','127.0.0.1','2015-02-08 12:34:09');
INSERT INTO `v9_log` VALUES('681','','0','member','','member','?m=member&c=member&a=manage','','1','admin','127.0.0.1','2015-02-08 12:34:23');
INSERT INTO `v9_log` VALUES('682','','0','member','','member','?m=member&c=member&a=add','','1','admin','127.0.0.1','2015-02-08 12:34:24');
INSERT INTO `v9_log` VALUES('683','','0','member','','member','?m=member&c=member&a=add','','1','admin','127.0.0.1','2015-02-08 12:34:28');
INSERT INTO `v9_log` VALUES('684','','0','member','','member','?m=member&c=member&a=add','','1','admin','127.0.0.1','2015-02-08 12:34:31');
INSERT INTO `v9_log` VALUES('685','','0','member','','member','?m=member&c=member&a=manage','','1','admin','127.0.0.1','2015-02-08 12:34:39');
INSERT INTO `v9_log` VALUES('686','','0','member','','member_verify','?m=member&c=member_verify&a=manage','','1','admin','127.0.0.1','2015-02-08 12:34:40');
INSERT INTO `v9_log` VALUES('687','','0','member','','member_group','?m=member&c=member_group&a=manage','','1','admin','127.0.0.1','2015-02-08 12:34:42');
INSERT INTO `v9_log` VALUES('688','','0','member','','member_model','?m=member&c=member_model&a=manage','','1','admin','127.0.0.1','2015-02-08 12:34:43');
INSERT INTO `v9_log` VALUES('689','','0','member','','member','?m=member&c=member&a=manage','','1','admin','127.0.0.1','2015-02-08 12:34:45');
INSERT INTO `v9_log` VALUES('690','','0','member','','member_verify','?m=member&c=member_verify&a=manage','','1','admin','127.0.0.1','2015-02-08 12:34:45');
INSERT INTO `v9_log` VALUES('691','','0','member','','member_setting','?m=member&c=member_setting&a=manage','','1','admin','127.0.0.1','2015-02-08 12:34:45');
INSERT INTO `v9_log` VALUES('692','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-02-08 12:36:13');
INSERT INTO `v9_log` VALUES('693','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-08 12:36:16');
INSERT INTO `v9_log` VALUES('694','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-08 12:36:39');
INSERT INTO `v9_log` VALUES('695','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-08 12:36:47');
INSERT INTO `v9_log` VALUES('696','','0','zl_admin','','release_point','?m=zl_admin&c=release_point&a=add','','1','admin','127.0.0.1','2015-02-08 12:37:20');
INSERT INTO `v9_log` VALUES('697','','0','zl_admin','','release_point','?m=zl_admin&c=release_point&a=add','','1','admin','127.0.0.1','2015-02-08 12:37:24');
INSERT INTO `v9_log` VALUES('698','','0','attachment','','manage','?m=attachment&c=manage&a=dir','','1','admin','127.0.0.1','2015-02-08 17:46:59');
INSERT INTO `v9_log` VALUES('699','','0','attachment','','manage','?m=attachment&c=manage&a=dir','','1','admin','127.0.0.1','2015-02-08 17:47:02');
INSERT INTO `v9_log` VALUES('700','','0','attachment','','manage','?m=attachment&c=manage&a=dir','','1','admin','127.0.0.1','2015-02-08 17:47:04');
INSERT INTO `v9_log` VALUES('701','','0','member','','member','?m=member&c=member&a=manage','','1','admin','127.0.0.1','2015-02-08 18:12:04');
INSERT INTO `v9_log` VALUES('702','','0','member','','member_verify','?m=member&c=member_verify&a=manage','','1','admin','127.0.0.1','2015-02-08 18:12:05');
INSERT INTO `v9_log` VALUES('703','','0','member','','member_setting','?m=member&c=member_setting&a=manage','','1','admin','127.0.0.1','2015-02-08 18:12:06');
INSERT INTO `v9_log` VALUES('704','','0','member','','member_setting','?m=member&c=member_setting&a=manage','','1','admin','127.0.0.1','2015-02-08 18:12:16');
INSERT INTO `v9_log` VALUES('705','','0','member','','member','?m=member&c=member&a=manage','','1','admin','127.0.0.1','2015-02-08 18:12:18');
INSERT INTO `v9_log` VALUES('706','','0','member','','member_verify','?m=member&c=member_verify&a=manage','','1','admin','127.0.0.1','2015-02-08 18:12:20');
INSERT INTO `v9_log` VALUES('707','','0','member','','member_setting','?m=member&c=member_setting&a=manage','','1','admin','127.0.0.1','2015-02-08 18:12:21');
INSERT INTO `v9_log` VALUES('708','','0','zl_admin','','site','?m=zl_admin&c=site&a=add','','1','admin','127.0.0.1','2015-02-08 18:14:04');
INSERT INTO `v9_log` VALUES('709','','0','zl_admin','','site','?m=zl_admin&c=site&a=edit','','1','admin','127.0.0.1','2015-02-08 18:14:07');
INSERT INTO `v9_log` VALUES('710','','0','zl_admin','','release_point','?m=zl_admin&c=release_point&a=add','','1','admin','127.0.0.1','2015-02-08 18:14:12');
INSERT INTO `v9_log` VALUES('711','','0','member','','member','?m=member&c=member&a=manage','','1','admin','127.0.0.1','2015-02-08 18:14:17');
INSERT INTO `v9_log` VALUES('712','','0','member','','member_verify','?m=member&c=member_verify&a=manage','','1','admin','127.0.0.1','2015-02-08 18:14:18');
INSERT INTO `v9_log` VALUES('713','','0','member','','member_setting','?m=member&c=member_setting&a=manage','','1','admin','127.0.0.1','2015-02-08 18:14:19');
INSERT INTO `v9_log` VALUES('714','','0','member','','member','?m=member&c=member&a=manage','','1','admin','127.0.0.1','2015-02-08 18:15:46');
INSERT INTO `v9_log` VALUES('715','','0','member','','member_verify','?m=member&c=member_verify&a=manage','','1','admin','127.0.0.1','2015-02-08 18:15:47');
INSERT INTO `v9_log` VALUES('716','','0','member','','member_setting','?m=member&c=member_setting&a=manage','','1','admin','127.0.0.1','2015-02-08 18:15:48');
INSERT INTO `v9_log` VALUES('717','','0','member','','member_group','?m=member&c=member_group&a=manage','','1','admin','127.0.0.1','2015-02-08 18:15:55');
INSERT INTO `v9_log` VALUES('718','','0','member','','member_model','?m=member&c=member_model&a=manage','','1','admin','127.0.0.1','2015-02-08 18:15:57');
INSERT INTO `v9_log` VALUES('719','','0','member','','member','?m=member&c=member&a=manage','','1','admin','127.0.0.1','2015-02-08 18:16:18');
INSERT INTO `v9_log` VALUES('720','','0','member','','member','?m=member&c=member&a=manage','','1','admin','127.0.0.1','2015-02-08 18:16:38');
INSERT INTO `v9_log` VALUES('721','','0','collection','','node','?m=collection&c=node&a=manage','','1','admin','127.0.0.1','2015-02-08 18:16:47');
INSERT INTO `v9_log` VALUES('722','','0','comment','','comment_admin','?m=comment&c=comment_admin&a=listinfo','','1','admin','127.0.0.1','2015-02-08 18:16:48');
INSERT INTO `v9_log` VALUES('723','','0','collection','','node','?m=collection&c=node&a=manage','','1','admin','127.0.0.1','2015-02-08 18:16:50');
INSERT INTO `v9_log` VALUES('724','','0','collection','','node','?m=collection&c=node&a=manage','','1','admin','127.0.0.1','2015-02-08 18:16:54');
INSERT INTO `v9_log` VALUES('725','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','127.0.0.1','2015-02-08 18:16:55');
INSERT INTO `v9_log` VALUES('726','','0','content','','create_html','?m=content&c=create_html&a=show','','1','admin','127.0.0.1','2015-02-08 18:16:56');
INSERT INTO `v9_log` VALUES('727','','0','content','','create_html','?m=content&c=create_html&a=show','','1','admin','127.0.0.1','2015-02-08 18:16:58');
INSERT INTO `v9_log` VALUES('728','','0','member','','member','?m=member&c=member&a=manage','','1','admin','127.0.0.1','2015-02-08 18:17:04');
INSERT INTO `v9_log` VALUES('729','','0','zl_admin','','database','?m=zl_admin&c=database&a=export','','1','admin','127.0.0.1','2015-02-08 18:17:15');
INSERT INTO `v9_log` VALUES('730','','0','zl_admin','','googlesitemap','?m=zl_admin&c=googlesitemap&a=set','','1','admin','127.0.0.1','2015-02-08 18:17:17');
INSERT INTO `v9_log` VALUES('731','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-02-08 18:20:49');
INSERT INTO `v9_log` VALUES('732','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-02-08 18:31:26');
INSERT INTO `v9_log` VALUES('733','','0','member','','member','?m=member&c=member&a=manage','','1','admin','127.0.0.1','2015-02-08 18:52:14');
INSERT INTO `v9_log` VALUES('734','','0','member','','member','?m=member&c=member&a=manage','','1','admin','127.0.0.1','2015-02-08 18:52:16');
INSERT INTO `v9_log` VALUES('735','','0','member','','member_verify','?m=member&c=member_verify&a=manage','','1','admin','127.0.0.1','2015-02-08 18:52:17');
INSERT INTO `v9_log` VALUES('736','','0','member','','member_setting','?m=member&c=member_setting&a=manage','','1','admin','127.0.0.1','2015-02-08 18:52:18');
INSERT INTO `v9_log` VALUES('737','','0','member','','member','?m=member&c=member&a=manage','','1','admin','127.0.0.1','2015-02-08 18:52:22');
INSERT INTO `v9_log` VALUES('738','','0','member','','member','?m=member&c=member&a=manage','','1','admin','127.0.0.1','2015-02-08 18:52:26');
INSERT INTO `v9_log` VALUES('739','','0','member','','member','?m=member&c=member&a=manage','','1','admin','127.0.0.1','2015-02-08 18:52:28');
INSERT INTO `v9_log` VALUES('740','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','127.0.0.1','2015-02-08 19:25:41');
INSERT INTO `v9_log` VALUES('741','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','127.0.0.1','2015-02-08 19:30:04');
INSERT INTO `v9_log` VALUES('742','','0','member','','member_menu','?m=member&c=member_menu&a=manage','','1','admin','127.0.0.1','2015-02-08 19:31:51');
INSERT INTO `v9_log` VALUES('743','','0','member','','member_menu','?m=member&c=member_menu&a=manage','','1','admin','127.0.0.1','2015-02-08 19:32:20');
INSERT INTO `v9_log` VALUES('744','','0','zl_admin','','database','?m=zl_admin&c=database&a=export','','1','admin','127.0.0.1','2015-02-08 19:32:24');
INSERT INTO `v9_log` VALUES('745','','0','zl_admin','','googlesitemap','?m=zl_admin&c=googlesitemap&a=set','','1','admin','127.0.0.1','2015-02-08 19:32:25');
INSERT INTO `v9_log` VALUES('746','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-02-08 19:32:31');
INSERT INTO `v9_log` VALUES('747','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-02-08 20:16:15');
INSERT INTO `v9_log` VALUES('748','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-02-08 22:04:04');
INSERT INTO `v9_log` VALUES('749','','0','member','','member_menu','?m=member&c=member_menu&a=manage','','1','admin','127.0.0.1','2015-02-08 22:04:19');
INSERT INTO `v9_log` VALUES('750','','0','member','','member_menu','?m=member&c=member_menu&a=manage','','1','admin','127.0.0.1','2015-02-08 22:04:19');
INSERT INTO `v9_log` VALUES('751','','0','member','','member_menu','?m=member&c=member_menu&a=manage','','1','admin','127.0.0.1','2015-02-08 22:07:03');
INSERT INTO `v9_log` VALUES('752','','0','zl_admin','','database','?m=zl_admin&c=database&a=export','','1','admin','127.0.0.1','2015-02-08 22:07:07');
INSERT INTO `v9_log` VALUES('753','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-02-08 22:07:15');
INSERT INTO `v9_log` VALUES('754','','0','member','','member_verify','?m=member&c=member_verify&a=manage','','1','admin','127.0.0.1','2015-02-08 22:07:22');
INSERT INTO `v9_log` VALUES('755','','0','member','','member_menu','?m=member&c=member_menu&a=manage','','1','admin','127.0.0.1','2015-02-08 22:07:28');
INSERT INTO `v9_log` VALUES('756','','0','member','','member','?m=member&c=member&a=manage','','1','admin','127.0.0.1','2015-02-08 22:14:30');
INSERT INTO `v9_log` VALUES('757','','0','member','','member_menu','?m=member&c=member_menu&a=manage','','1','admin','127.0.0.1','2015-02-08 22:14:36');
INSERT INTO `v9_log` VALUES('758','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-08 22:19:30');
INSERT INTO `v9_log` VALUES('759','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-08 22:22:16');
INSERT INTO `v9_log` VALUES('760','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-08 22:22:33');
INSERT INTO `v9_log` VALUES('761','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-08 22:23:11');
INSERT INTO `v9_log` VALUES('762','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-08 22:23:15');
INSERT INTO `v9_log` VALUES('763','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-08 22:23:16');
INSERT INTO `v9_log` VALUES('764','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-08 22:23:18');
INSERT INTO `v9_log` VALUES('765','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-08 22:23:19');
INSERT INTO `v9_log` VALUES('766','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-08 22:23:25');
INSERT INTO `v9_log` VALUES('767','','0','member','','member','?m=member&c=member&a=manage','','1','admin','127.0.0.1','2015-02-08 22:23:34');
INSERT INTO `v9_log` VALUES('768','','0','member','','member_verify','?m=member&c=member_verify&a=manage','','1','admin','127.0.0.1','2015-02-08 22:23:35');
INSERT INTO `v9_log` VALUES('769','','0','member','','member_setting','?m=member&c=member_setting&a=manage','','1','admin','127.0.0.1','2015-02-08 22:23:36');
INSERT INTO `v9_log` VALUES('770','','0','member','','member','?m=member&c=member&a=manage','','1','admin','127.0.0.1','2015-02-08 22:23:41');
INSERT INTO `v9_log` VALUES('771','','0','member','','member_verify','?m=member&c=member_verify&a=manage','','1','admin','127.0.0.1','2015-02-08 22:23:41');
INSERT INTO `v9_log` VALUES('772','','0','member','','member_setting','?m=member&c=member_setting&a=manage','','1','admin','127.0.0.1','2015-02-08 22:23:42');
INSERT INTO `v9_log` VALUES('773','','0','member','','member_verify','?m=member&c=member_verify&a=manage','','1','admin','127.0.0.1','2015-02-08 22:23:53');
INSERT INTO `v9_log` VALUES('774','','0','member','','member_model','?m=member&c=member_model&a=manage','','1','admin','127.0.0.1','2015-02-08 22:23:56');
INSERT INTO `v9_log` VALUES('775','','0','member','','member_group','?m=member&c=member_group&a=manage','','1','admin','127.0.0.1','2015-02-08 22:23:58');
INSERT INTO `v9_log` VALUES('776','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-02-08 22:24:56');
INSERT INTO `v9_log` VALUES('777','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-02-08 22:25:02');
INSERT INTO `v9_log` VALUES('778','','0','member','','member','?m=member&c=member&a=manage','','1','admin','127.0.0.1','2015-02-08 23:08:28');
INSERT INTO `v9_log` VALUES('779','','0','member','','member_verify','?m=member&c=member_verify&a=manage','','1','admin','127.0.0.1','2015-02-08 23:08:29');
INSERT INTO `v9_log` VALUES('780','','0','member','','member_setting','?m=member&c=member_setting&a=manage','','1','admin','127.0.0.1','2015-02-08 23:08:29');
INSERT INTO `v9_log` VALUES('781','','0','member','','member_group','?m=member&c=member_group&a=manage','','1','admin','127.0.0.1','2015-02-08 23:08:31');
INSERT INTO `v9_log` VALUES('782','','0','member','','member_model','?m=member&c=member_model&a=manage','','1','admin','127.0.0.1','2015-02-08 23:08:33');
INSERT INTO `v9_log` VALUES('783','','0','member','','member_menu','?m=member&c=member_menu&a=manage','','1','admin','127.0.0.1','2015-02-08 23:17:44');
INSERT INTO `v9_log` VALUES('784','','0','member','','member_menu','?m=member&c=member_menu&a=manage','','1','admin','127.0.0.1','2015-02-08 23:18:16');
INSERT INTO `v9_log` VALUES('785','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-02-08 23:42:32');
INSERT INTO `v9_log` VALUES('786','','0','member','','member_menu','?m=member&c=member_menu&a=manage','','1','admin','127.0.0.1','2015-02-09 00:03:21');
INSERT INTO `v9_log` VALUES('787','','0','zl_admin','','menu','?m=zl_admin&c=menu&a=edit','','1','admin','127.0.0.1','2015-02-09 00:03:28');
INSERT INTO `v9_log` VALUES('788','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-09 09:18:39');
INSERT INTO `v9_log` VALUES('789','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-09 09:18:45');
INSERT INTO `v9_log` VALUES('790','','0','member','','member','?m=member&c=member&a=manage','','1','admin','127.0.0.1','2015-02-09 10:11:03');
INSERT INTO `v9_log` VALUES('791','','0','member','','member','?m=member&c=member&a=manage','','1','admin','127.0.0.1','2015-02-09 10:11:25');
INSERT INTO `v9_log` VALUES('792','','0','member','','member_verify','?m=member&c=member_verify&a=manage','','1','admin','127.0.0.1','2015-02-09 10:11:26');
INSERT INTO `v9_log` VALUES('793','','0','member','','member_setting','?m=member&c=member_setting&a=manage','','1','admin','127.0.0.1','2015-02-09 10:11:27');
INSERT INTO `v9_log` VALUES('794','','0','collection','','node','?m=collection&c=node&a=manage','','1','admin','127.0.0.1','2015-02-09 10:17:33');
INSERT INTO `v9_log` VALUES('795','','0','collection','','node','?m=collection&c=node&a=manage','','1','admin','127.0.0.1','2015-02-09 10:17:34');
INSERT INTO `v9_log` VALUES('796','','0','comment','','comment_admin','?m=comment&c=comment_admin&a=listinfo','','1','admin','127.0.0.1','2015-02-09 10:17:35');
INSERT INTO `v9_log` VALUES('797','','0','member','','member','?m=member&c=member&a=manage','','1','admin','127.0.0.1','2015-02-09 10:17:37');
INSERT INTO `v9_log` VALUES('798','','0','member','','member','?m=member&c=member&a=manage','','1','admin','127.0.0.1','2015-02-09 13:02:25');
INSERT INTO `v9_log` VALUES('799','','0','member','','member','?m=member&c=member&a=manage','','1','admin','127.0.0.1','2015-02-09 13:08:48');
INSERT INTO `v9_log` VALUES('800','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-12 16:58:35');
INSERT INTO `v9_log` VALUES('801','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-12 16:58:41');
INSERT INTO `v9_log` VALUES('802','','0','attachment','','manage','?m=attachment&c=manage&a=dir','','1','admin','127.0.0.1','2015-02-12 16:59:02');
INSERT INTO `v9_log` VALUES('803','','0','attachment','','manage','?m=attachment&c=manage&a=dir','','1','admin','127.0.0.1','2015-02-12 16:59:04');
INSERT INTO `v9_log` VALUES('804','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-15 09:42:49');
INSERT INTO `v9_log` VALUES('805','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-15 09:42:57');
INSERT INTO `v9_log` VALUES('806','','0','attachment','','manage','?m=attachment&c=manage&a=dir','','1','admin','127.0.0.1','2015-02-15 09:43:14');
INSERT INTO `v9_log` VALUES('807','','0','attachment','','manage','?m=attachment&c=manage&a=dir','','1','admin','127.0.0.1','2015-02-15 09:43:30');
INSERT INTO `v9_log` VALUES('808','','0','attachment','','manage','?m=attachment&c=manage&a=dir','','1','admin','127.0.0.1','2015-02-15 09:44:32');
INSERT INTO `v9_log` VALUES('809','','0','attachment','','manage','?m=attachment&c=manage&a=dir','','1','admin','127.0.0.1','2015-02-15 09:44:35');
INSERT INTO `v9_log` VALUES('810','','0','attachment','','manage','?m=attachment&c=manage&a=dir','','1','admin','127.0.0.1','2015-02-15 09:44:41');
INSERT INTO `v9_log` VALUES('811','','0','attachment','','manage','?m=attachment&c=manage&a=dir','','1','admin','127.0.0.1','2015-02-15 09:45:44');
INSERT INTO `v9_log` VALUES('812','','0','attachment','','manage','?m=attachment&c=manage&a=dir','','1','admin','127.0.0.1','2015-02-15 09:45:47');
INSERT INTO `v9_log` VALUES('813','','0','attachment','','manage','?m=attachment&c=manage&a=dir','','1','admin','127.0.0.1','2015-02-15 09:45:48');
INSERT INTO `v9_log` VALUES('814','','0','attachment','','manage','?m=attachment&c=manage&a=dir','','1','admin','127.0.0.1','2015-02-15 09:45:49');
INSERT INTO `v9_log` VALUES('815','','0','attachment','','manage','?m=attachment&c=manage&a=dir','','1','admin','127.0.0.1','2015-02-15 09:45:51');
INSERT INTO `v9_log` VALUES('816','','0','attachment','','manage','?m=attachment&c=manage&a=dir','','1','admin','127.0.0.1','2015-02-15 09:46:20');
INSERT INTO `v9_log` VALUES('817','','0','attachment','','manage','?m=attachment&c=manage&a=dir','','1','admin','127.0.0.1','2015-02-15 09:46:20');
INSERT INTO `v9_log` VALUES('818','','0','attachment','','manage','?m=attachment&c=manage&a=dir','','1','admin','127.0.0.1','2015-02-15 09:46:22');
INSERT INTO `v9_log` VALUES('819','','0','attachment','','manage','?m=attachment&c=manage&a=dir','','1','admin','127.0.0.1','2015-02-15 09:46:48');
INSERT INTO `v9_log` VALUES('820','','0','attachment','','manage','?m=attachment&c=manage&a=dir','','1','admin','127.0.0.1','2015-02-15 09:48:13');
INSERT INTO `v9_log` VALUES('821','','0','attachment','','manage','?m=attachment&c=manage&a=dir','','1','admin','127.0.0.1','2015-02-15 09:48:14');
INSERT INTO `v9_log` VALUES('822','','0','attachment','','manage','?m=attachment&c=manage&a=dir','','1','admin','127.0.0.1','2015-02-15 09:48:15');
INSERT INTO `v9_log` VALUES('823','','0','attachment','','manage','?m=attachment&c=manage&a=dir','','1','admin','127.0.0.1','2015-02-15 09:48:16');
INSERT INTO `v9_log` VALUES('824','','0','attachment','','manage','?m=attachment&c=manage&a=dir','','1','admin','127.0.0.1','2015-02-15 09:48:22');
INSERT INTO `v9_log` VALUES('825','','0','attachment','','manage','?m=attachment&c=manage&a=dir','','1','admin','127.0.0.1','2015-02-15 09:49:06');
INSERT INTO `v9_log` VALUES('826','','0','attachment','','manage','?m=attachment&c=manage&a=dir','','1','admin','127.0.0.1','2015-02-15 09:49:09');
INSERT INTO `v9_log` VALUES('827','','0','attachment','','manage','?m=attachment&c=manage&a=dir','','1','admin','127.0.0.1','2015-02-15 09:49:12');
INSERT INTO `v9_log` VALUES('828','','0','attachment','','manage','?m=attachment&c=manage&a=dir','','1','admin','127.0.0.1','2015-02-15 09:49:14');
INSERT INTO `v9_log` VALUES('829','','0','attachment','','manage','?m=attachment&c=manage&a=dir','','1','admin','127.0.0.1','2015-02-15 09:49:37');
INSERT INTO `v9_log` VALUES('830','','0','attachment','','manage','?m=attachment&c=manage&a=dir','','1','admin','127.0.0.1','2015-02-15 09:53:39');
INSERT INTO `v9_log` VALUES('831','','0','attachment','','manage','?m=attachment&c=manage&a=dir','','1','admin','127.0.0.1','2015-02-15 09:55:15');
INSERT INTO `v9_log` VALUES('832','','0','attachment','','manage','?m=attachment&c=manage&a=dir','','1','admin','127.0.0.1','2015-02-15 09:55:16');
INSERT INTO `v9_log` VALUES('833','','0','attachment','','manage','?m=attachment&c=manage&a=dir','','1','admin','127.0.0.1','2015-02-15 09:57:08');
INSERT INTO `v9_log` VALUES('834','','0','attachment','','manage','?m=attachment&c=manage&a=dir','','1','admin','127.0.0.1','2015-02-15 09:57:09');
INSERT INTO `v9_log` VALUES('835','','0','attachment','','manage','?m=attachment&c=manage&a=dir','','1','admin','127.0.0.1','2015-02-15 10:04:13');
INSERT INTO `v9_log` VALUES('836','','0','attachment','','manage','?m=attachment&c=manage&a=dir','','1','admin','127.0.0.1','2015-02-15 10:04:14');
INSERT INTO `v9_log` VALUES('837','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-15 15:27:24');
INSERT INTO `v9_log` VALUES('838','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-02-15 15:27:30');
INSERT INTO `v9_log` VALUES('839','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-02-15 15:27:54');
INSERT INTO `v9_log` VALUES('840','','0','content','','create_html','?m=content&c=create_html&a=show','','1','admin','127.0.0.1','2015-02-15 15:28:11');
INSERT INTO `v9_log` VALUES('841','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','127.0.0.1','2015-02-15 15:28:12');
INSERT INTO `v9_log` VALUES('842','','0','collection','','node','?m=collection&c=node&a=manage','','1','admin','127.0.0.1','2015-02-15 15:28:17');
INSERT INTO `v9_log` VALUES('843','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-15 15:50:51');
INSERT INTO `v9_log` VALUES('844','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-15 15:50:58');
INSERT INTO `v9_log` VALUES('845','','0','attachment','','manage','?m=attachment&c=manage&a=dir','','1','admin','127.0.0.1','2015-02-15 16:26:39');
INSERT INTO `v9_log` VALUES('846','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-15 23:45:44');
INSERT INTO `v9_log` VALUES('847','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-15 23:45:51');
INSERT INTO `v9_log` VALUES('848','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-16 09:17:33');
INSERT INTO `v9_log` VALUES('849','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-16 09:18:24');
INSERT INTO `v9_log` VALUES('850','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-02-16 14:54:21');
INSERT INTO `v9_log` VALUES('851','','0','collection','','node','?m=collection&c=node&a=manage','','1','admin','127.0.0.1','2015-02-16 15:47:15');
INSERT INTO `v9_log` VALUES('852','','0','comment','','comment_admin','?m=comment&c=comment_admin&a=listinfo','','1','admin','127.0.0.1','2015-02-16 15:47:16');
INSERT INTO `v9_log` VALUES('853','','0','collection','','node','?m=collection&c=node&a=manage','','1','admin','127.0.0.1','2015-02-16 15:47:18');
INSERT INTO `v9_log` VALUES('854','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-16 22:48:18');
INSERT INTO `v9_log` VALUES('855','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-16 22:48:25');
INSERT INTO `v9_log` VALUES('856','','0','zl_admin','','module','?m=zl_admin&c=module&a=install','','1','admin','127.0.0.1','2015-02-16 22:52:53');
INSERT INTO `v9_log` VALUES('857','','0','zl_admin','','module','?m=zl_admin&c=module&a=install','','1','admin','127.0.0.1','2015-02-16 23:02:53');
INSERT INTO `v9_log` VALUES('858','','0','zl_admin','','module','?m=zl_admin&c=module&a=install','','1','admin','127.0.0.1','2015-02-16 23:02:56');
INSERT INTO `v9_log` VALUES('859','','0','zl_admin','','module','?m=zl_admin&c=module&a=uninstall','','1','admin','127.0.0.1','2015-02-16 23:03:19');
INSERT INTO `v9_log` VALUES('860','','0','zl_admin','','module','?m=zl_admin&c=module&a=cache','','1','admin','127.0.0.1','2015-02-16 23:03:19');
INSERT INTO `v9_log` VALUES('861','','0','zl_admin','','module','?m=zl_admin&c=module&a=install','','1','admin','127.0.0.1','2015-02-16 23:04:38');
INSERT INTO `v9_log` VALUES('862','','0','zl_admin','','module','?m=zl_admin&c=module&a=install','','1','admin','127.0.0.1','2015-02-16 23:04:39');
INSERT INTO `v9_log` VALUES('863','','0','zl_admin','','module','?m=zl_admin&c=module&a=uninstall','','1','admin','127.0.0.1','2015-02-16 23:10:34');
INSERT INTO `v9_log` VALUES('864','','0','zl_admin','','module','?m=zl_admin&c=module&a=cache','','1','admin','127.0.0.1','2015-02-16 23:10:34');
INSERT INTO `v9_log` VALUES('865','','0','zl_admin','','module','?m=zl_admin&c=module&a=install','','1','admin','127.0.0.1','2015-02-16 23:10:46');
INSERT INTO `v9_log` VALUES('866','','0','zl_admin','','module','?m=zl_admin&c=module&a=install','','1','admin','127.0.0.1','2015-02-16 23:10:47');
INSERT INTO `v9_log` VALUES('867','','0','zl_admin','','module','?m=zl_admin&c=module&a=uninstall','','1','admin','127.0.0.1','2015-02-16 23:12:50');
INSERT INTO `v9_log` VALUES('868','','0','zl_admin','','module','?m=zl_admin&c=module&a=cache','','1','admin','127.0.0.1','2015-02-16 23:12:50');
INSERT INTO `v9_log` VALUES('869','','0','zl_admin','','module','?m=zl_admin&c=module&a=install','','1','admin','127.0.0.1','2015-02-16 23:12:59');
INSERT INTO `v9_log` VALUES('870','','0','zl_admin','','module','?m=zl_admin&c=module&a=install','','1','admin','127.0.0.1','2015-02-16 23:13:00');
INSERT INTO `v9_log` VALUES('871','','0','zl_admin','','module','?m=zl_admin&c=module&a=uninstall','','1','admin','127.0.0.1','2015-02-16 23:13:59');
INSERT INTO `v9_log` VALUES('872','','0','zl_admin','','module','?m=zl_admin&c=module&a=cache','','1','admin','127.0.0.1','2015-02-16 23:13:59');
INSERT INTO `v9_log` VALUES('873','','0','zl_admin','','module','?m=zl_admin&c=module&a=install','','1','admin','127.0.0.1','2015-02-16 23:14:07');
INSERT INTO `v9_log` VALUES('874','','0','zl_admin','','module','?m=zl_admin&c=module&a=install','','1','admin','127.0.0.1','2015-02-16 23:14:08');
INSERT INTO `v9_log` VALUES('875','','0','zl_admin','','module','?m=zl_admin&c=module&a=cache','','1','admin','127.0.0.1','2015-02-16 23:14:11');
INSERT INTO `v9_log` VALUES('876','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','admin','127.0.0.1','2015-02-26 16:58:44');
INSERT INTO `v9_log` VALUES('877','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-09-03 15:57:41');
INSERT INTO `v9_log` VALUES('878','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-09-03 15:58:04');
INSERT INTO `v9_log` VALUES('879','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-09-03 15:58:04');
INSERT INTO `v9_log` VALUES('880','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-09-03 15:58:11');
INSERT INTO `v9_log` VALUES('881','','0','member','','member_menu','?m=member&c=member_menu&a=manage','','1','admin','127.0.0.1','2015-09-03 15:58:27');
INSERT INTO `v9_log` VALUES('882','','0','collection','','node','?m=collection&c=node&a=manage','','1','admin','127.0.0.1','2015-09-03 15:59:47');
INSERT INTO `v9_log` VALUES('883','','0','comment','','comment_admin','?m=comment&c=comment_admin&a=listinfo','','1','admin','127.0.0.1','2015-09-03 15:59:47');
INSERT INTO `v9_log` VALUES('884','','0','member','','member','?m=member&c=member&a=manage','','1','admin','127.0.0.1','2015-09-03 15:59:51');
INSERT INTO `v9_log` VALUES('885','','0','member','','member_verify','?m=member&c=member_verify&a=manage','','1','admin','127.0.0.1','2015-09-03 15:59:52');
INSERT INTO `v9_log` VALUES('886','','0','member','','member_setting','?m=member&c=member_setting&a=manage','','1','admin','127.0.0.1','2015-09-03 15:59:53');
INSERT INTO `v9_log` VALUES('887','','0','member','','member_group','?m=member&c=member_group&a=manage','','1','admin','127.0.0.1','2015-09-03 16:00:02');
INSERT INTO `v9_log` VALUES('888','','0','member','','member_model','?m=member&c=member_model&a=manage','','1','admin','127.0.0.1','2015-09-03 16:00:04');
INSERT INTO `v9_log` VALUES('889','','0','member','','member_menu','?m=member&c=member_menu&a=manage','','1','admin','127.0.0.1','2015-09-03 16:00:13');
INSERT INTO `v9_log` VALUES('890','','0','zl_admin','','database','?m=zl_admin&c=database&a=export','','1','admin','127.0.0.1','2015-09-03 16:00:16');
INSERT INTO `v9_log` VALUES('891','','0','zl_admin','','module','?m=zl_admin&c=module&a=uninstall','','1','admin','127.0.0.1','2015-09-03 16:02:16');
INSERT INTO `v9_log` VALUES('892','','0','zl_admin','','module','?m=zl_admin&c=module&a=cache','','1','admin','127.0.0.1','2015-09-03 16:02:17');
INSERT INTO `v9_log` VALUES('893','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-09-03 16:41:01');
INSERT INTO `v9_log` VALUES('894','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-09-03 16:41:11');
INSERT INTO `v9_log` VALUES('895','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-09-03 16:44:41');
INSERT INTO `v9_log` VALUES('896','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-09-03 16:44:51');
INSERT INTO `v9_log` VALUES('897','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-09-03 16:45:11');
INSERT INTO `v9_log` VALUES('898','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-09-03 16:45:23');
INSERT INTO `v9_log` VALUES('899','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-09-03 16:46:23');
INSERT INTO `v9_log` VALUES('900','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-09-03 16:46:24');
INSERT INTO `v9_log` VALUES('901','','0','wap','','wap_admin','?m=wap&c=wap_admin&a=edit','','1','admin','127.0.0.1','2015-09-03 16:46:28');
INSERT INTO `v9_log` VALUES('902','','0','member','','member_menu','?m=member&c=member_menu&a=manage','','1','admin','127.0.0.1','2015-09-03 16:47:17');
INSERT INTO `v9_log` VALUES('903','','0','zl_admin','','database','?m=zl_admin&c=database&a=export','','1','admin','127.0.0.1','2015-09-03 16:48:11');
INSERT INTO `v9_log` VALUES('904','','0','zl_admin','','database','?m=zl_admin&c=database&a=export','','1','admin','127.0.0.1','2015-09-03 16:48:11');
INSERT INTO `v9_log` VALUES('905','','0','zl_admin','','menu','?m=zl_admin&c=menu&a=add','','1','admin','127.0.0.1','2015-09-03 16:48:20');
INSERT INTO `v9_log` VALUES('906','','0','zl_admin','','menu','?m=zl_admin&c=menu&a=add','','1','admin','127.0.0.1','2015-09-03 16:48:20');
INSERT INTO `v9_log` VALUES('907','','0','member','','member_menu','?m=member&c=member_menu&a=manage','','1','admin','127.0.0.1','2015-09-03 16:48:36');
INSERT INTO `v9_log` VALUES('908','','0','member','','member_menu','?m=member&c=member_menu&a=manage','','1','admin','127.0.0.1','2015-09-03 16:48:37');
INSERT INTO `v9_log` VALUES('909','','0','scan','','index','?m=scan&c=index&a=scan_report','','1','admin','127.0.0.1','2015-09-03 16:48:48');
INSERT INTO `v9_log` VALUES('910','','0','scan','','index','?m=scan&c=index&a=scan_report','','1','admin','127.0.0.1','2015-09-03 16:48:48');
INSERT INTO `v9_log` VALUES('911','','0','scan','','index','?m=scan&c=index&a=scan_report','','1','admin','127.0.0.1','2015-09-03 16:48:49');
INSERT INTO `v9_log` VALUES('912','','0','scan','','index','?m=scan&c=index&a=scan_report','','1','admin','127.0.0.1','2015-09-03 16:48:49');
INSERT INTO `v9_log` VALUES('913','','0','scan','','index','?m=scan&c=index&a=scan_report','','1','admin','127.0.0.1','2015-09-03 16:48:50');
INSERT INTO `v9_log` VALUES('914','','0','scan','','index','?m=scan&c=index&a=scan_report','','1','admin','127.0.0.1','2015-09-03 16:48:50');
INSERT INTO `v9_log` VALUES('915','','0','scan','','index','?m=scan&c=index&a=scan_report','','1','admin','127.0.0.1','2015-09-03 16:49:08');
INSERT INTO `v9_log` VALUES('916','','0','scan','','index','?m=scan&c=index&a=view','','1','admin','127.0.0.1','2015-09-03 16:49:18');
INSERT INTO `v9_log` VALUES('917','','0','scan','','index','?m=scan&c=index&a=view','','1','admin','127.0.0.1','2015-09-03 16:49:27');
INSERT INTO `v9_log` VALUES('918','','0','zl_admin','','menu','?m=zl_admin&c=menu&a=edit','','1','admin','127.0.0.1','2015-09-03 16:49:50');
INSERT INTO `v9_log` VALUES('919','','0','zl_admin','','menu','?m=zl_admin&c=menu&a=edit','','1','admin','127.0.0.1','2015-09-03 16:49:50');
INSERT INTO `v9_log` VALUES('920','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-09-03 16:50:10');
INSERT INTO `v9_log` VALUES('921','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-09-03 16:50:23');
INSERT INTO `v9_log` VALUES('922','','0','zl_admin','','module','?m=zl_admin&c=module&a=uninstall','','1','admin','127.0.0.1','2015-09-03 17:44:18');
INSERT INTO `v9_log` VALUES('923','','0','zl_admin','','module','?m=zl_admin&c=module&a=cache','','1','admin','127.0.0.1','2015-09-03 17:44:18');
INSERT INTO `v9_log` VALUES('924','','0','dbsource','','data','?m=dbsource&c=data&a=add','','1','admin','127.0.0.1','2015-09-03 17:46:28');
INSERT INTO `v9_log` VALUES('925','','0','dbsource','','data','?m=dbsource&c=data&a=add','','1','admin','127.0.0.1','2015-09-03 17:46:31');
INSERT INTO `v9_log` VALUES('926','','0','dbsource','','data','?m=dbsource&c=data&a=add','','1','admin','127.0.0.1','2015-09-03 17:46:33');
INSERT INTO `v9_log` VALUES('927','','0','dbsource','','data','?m=dbsource&c=data&a=add','','1','admin','127.0.0.1','2015-09-03 17:46:33');
INSERT INTO `v9_log` VALUES('928','','0','dbsource','','data','?m=dbsource&c=data&a=add','','1','admin','127.0.0.1','2015-09-03 17:46:36');
INSERT INTO `v9_log` VALUES('929','','0','dbsource','','data','?m=dbsource&c=data&a=add','','1','admin','127.0.0.1','2015-09-03 17:46:40');
INSERT INTO `v9_log` VALUES('930','','0','zl_admin','','module','?m=zl_admin&c=module&a=uninstall','','1','admin','127.0.0.1','2015-09-03 17:47:01');
INSERT INTO `v9_log` VALUES('931','','0','zl_admin','','module','?m=zl_admin&c=module&a=cache','','1','admin','127.0.0.1','2015-09-03 17:47:02');
INSERT INTO `v9_log` VALUES('932','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-09-03 17:47:31');
INSERT INTO `v9_log` VALUES('933','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-09-03 17:47:32');
INSERT INTO `v9_log` VALUES('934','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-09-03 17:47:32');
INSERT INTO `v9_log` VALUES('935','','0','zl_admin','','module','?m=zl_admin&c=module&a=uninstall','','1','admin','127.0.0.1','2015-09-03 17:48:02');
INSERT INTO `v9_log` VALUES('936','','0','zl_admin','','module','?m=zl_admin&c=module&a=cache','','1','admin','127.0.0.1','2015-09-03 17:48:03');
INSERT INTO `v9_log` VALUES('937','','0','zl_admin','','site','?m=zl_admin&c=site&a=edit','','1','admin','127.0.0.1','2015-09-03 17:49:23');
INSERT INTO `v9_log` VALUES('938','','0','zl_admin','','site','?m=zl_admin&c=site&a=edit','','1','admin','127.0.0.1','2015-09-03 17:49:25');
INSERT INTO `v9_log` VALUES('939','','0','zl_admin','','site','?m=zl_admin&c=site&a=edit','','1','admin','127.0.0.1','2015-09-03 17:49:28');
INSERT INTO `v9_log` VALUES('940','','0','zl_admin','','site','?m=zl_admin&c=site&a=edit','','1','admin','127.0.0.1','2015-09-03 17:49:32');
INSERT INTO `v9_log` VALUES('941','','0','zl_admin','','module','?m=zl_admin&c=module&a=uninstall','','1','admin','127.0.0.1','2015-09-03 17:50:00');
INSERT INTO `v9_log` VALUES('942','','0','zl_admin','','module','?m=zl_admin&c=module&a=cache','','1','admin','127.0.0.1','2015-09-03 17:50:00');
INSERT INTO `v9_log` VALUES('943','','0','member','','member_menu','?m=member&c=member_menu&a=manage','','1','admin','127.0.0.1','2015-09-03 17:50:51');
INSERT INTO `v9_log` VALUES('944','','0','member','','member_menu','?m=member&c=member_menu&a=manage','','1','admin','127.0.0.1','2015-09-03 17:50:53');
INSERT INTO `v9_log` VALUES('945','','0','zl_admin','','database','?m=zl_admin&c=database&a=export','','1','admin','127.0.0.1','2015-09-03 17:51:06');
INSERT INTO `v9_log` VALUES('946','','0','zl_admin','','database','?m=zl_admin&c=database&a=export','','1','admin','127.0.0.1','2015-09-03 17:51:07');
INSERT INTO `v9_log` VALUES('947','','0','zl_admin','','googlesitemap','?m=zl_admin&c=googlesitemap&a=set','','1','admin','127.0.0.1','2015-09-03 17:51:10');
INSERT INTO `v9_log` VALUES('948','','0','tag','','tag','?m=tag&c=tag&a=add','','1','admin','127.0.0.1','2015-09-03 17:51:23');
INSERT INTO `v9_log` VALUES('949','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','1','admin','127.0.0.1','2015-09-04 00:24:34');
INSERT INTO `v9_log` VALUES('950','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','1','admin','127.0.0.1','2015-09-04 00:24:45');
INSERT INTO `v9_log` VALUES('951','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-09-04 00:28:02');
INSERT INTO `v9_log` VALUES('952','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-09-04 00:28:10');
INSERT INTO `v9_log` VALUES('953','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-09-04 00:34:43');
INSERT INTO `v9_log` VALUES('954','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-09-04 00:44:21');
INSERT INTO `v9_log` VALUES('955','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-09-04 11:19:35');
INSERT INTO `v9_log` VALUES('956','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-09-04 11:19:59');
INSERT INTO `v9_log` VALUES('957','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-09-04 11:20:13');
INSERT INTO `v9_log` VALUES('958','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-09-04 11:20:13');
INSERT INTO `v9_log` VALUES('959','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-09-04 11:20:32');
INSERT INTO `v9_log` VALUES('960','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-09-04 11:20:33');
INSERT INTO `v9_log` VALUES('961','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-09-04 11:20:58');
INSERT INTO `v9_log` VALUES('962','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-09-04 11:20:58');
INSERT INTO `v9_log` VALUES('963','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-09-04 11:21:00');
INSERT INTO `v9_log` VALUES('964','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-09-04 11:21:00');
INSERT INTO `v9_log` VALUES('965','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-09-04 11:21:04');
INSERT INTO `v9_log` VALUES('966','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-09-04 11:21:06');
INSERT INTO `v9_log` VALUES('967','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-09-04 11:21:06');
INSERT INTO `v9_log` VALUES('968','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-09-04 11:24:04');
INSERT INTO `v9_log` VALUES('969','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-09-04 11:24:04');
INSERT INTO `v9_log` VALUES('970','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-09-04 11:24:11');
INSERT INTO `v9_log` VALUES('971','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-09-04 11:24:12');
INSERT INTO `v9_log` VALUES('972','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-09-04 11:27:30');
INSERT INTO `v9_log` VALUES('973','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-09-04 11:27:30');
INSERT INTO `v9_log` VALUES('974','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-09-04 11:27:39');
INSERT INTO `v9_log` VALUES('975','','0','zl_admin','','site','?m=zl_admin&c=site&a=edit','','1','admin','127.0.0.1','2015-09-04 11:29:37');
INSERT INTO `v9_log` VALUES('976','','0','member','','member_menu','?m=member&c=member_menu&a=manage','','1','admin','127.0.0.1','2015-09-04 11:30:08');
INSERT INTO `v9_log` VALUES('977','','0','member','','member','?m=member&c=member&a=manage','','1','admin','127.0.0.1','2015-09-04 11:39:19');
INSERT INTO `v9_log` VALUES('978','','0','member','','member_verify','?m=member&c=member_verify&a=manage','','1','admin','127.0.0.1','2015-09-04 11:39:20');
INSERT INTO `v9_log` VALUES('979','','0','member','','member_setting','?m=member&c=member_setting&a=manage','','1','admin','127.0.0.1','2015-09-04 11:39:21');
INSERT INTO `v9_log` VALUES('980','','0','member','','member_group','?m=member&c=member_group&a=manage','','1','admin','127.0.0.1','2015-09-04 11:39:24');
INSERT INTO `v9_log` VALUES('981','','0','member','','member_model','?m=member&c=member_model&a=manage','','1','admin','127.0.0.1','2015-09-04 11:39:25');
INSERT INTO `v9_log` VALUES('982','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-09-04 11:41:31');
INSERT INTO `v9_log` VALUES('983','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','0','','127.0.0.1','2015-09-04 11:41:41');
INSERT INTO `v9_log` VALUES('984','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','1','admin','127.0.0.1','2015-09-04 11:43:50');
INSERT INTO `v9_log` VALUES('985','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','1','admin','127.0.0.1','2015-09-04 11:43:57');
INSERT INTO `v9_log` VALUES('986','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','1','admin','127.0.0.1','2015-09-04 11:45:42');
INSERT INTO `v9_log` VALUES('987','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','1','admin','127.0.0.1','2015-09-04 11:45:45');
INSERT INTO `v9_log` VALUES('988','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','1','admin','127.0.0.1','2015-09-04 11:45:47');
INSERT INTO `v9_log` VALUES('989','','0','zl_admin','','index','?m=zl_admin&c=index&a=login','','1','admin','127.0.0.1','2015-09-04 11:48:24');
INSERT INTO `v9_log` VALUES('990','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-09-04 11:49:55');
INSERT INTO `v9_log` VALUES('991','','0','zl_admin','','module','?m=zl_admin&c=module&a=uninstall','','1','admin','127.0.0.1','2015-09-04 11:51:07');
INSERT INTO `v9_log` VALUES('992','','0','zl_admin','','module','?m=zl_admin&c=module&a=cache','','1','admin','127.0.0.1','2015-09-04 11:51:07');
INSERT INTO `v9_log` VALUES('993','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-09-04 11:53:40');
INSERT INTO `v9_log` VALUES('994','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-09-04 11:53:50');
INSERT INTO `v9_log` VALUES('995','','0','content','','content','?m=content&c=content&a=edit','','1','admin','127.0.0.1','2015-09-04 11:54:06');
INSERT INTO `v9_log` VALUES('996','','0','content','','content','?m=content&c=content&a=edit','','1','admin','127.0.0.1','2015-09-04 11:54:08');
INSERT INTO `v9_log` VALUES('997','','0','content','','content','?m=content&c=content&a=edit','','1','admin','127.0.0.1','2015-09-04 11:58:35');
INSERT INTO `v9_log` VALUES('998','','0','content','','content','?m=content&c=content&a=edit','','1','admin','127.0.0.1','2015-09-04 11:58:37');
INSERT INTO `v9_log` VALUES('999','','0','content','','content','?m=content&c=content&a=edit','','1','admin','127.0.0.1','2015-09-04 12:00:50');
INSERT INTO `v9_log` VALUES('1000','','0','content','','content','?m=content&c=content&a=edit','','1','admin','127.0.0.1','2015-09-04 12:00:52');
INSERT INTO `v9_log` VALUES('1001','','0','content','','content','?m=content&c=content&a=edit','','1','admin','127.0.0.1','2015-09-04 12:01:14');
INSERT INTO `v9_log` VALUES('1002','','0','content','','content','?m=content&c=content&a=edit','','1','admin','127.0.0.1','2015-09-04 12:01:16');
INSERT INTO `v9_log` VALUES('1003','','0','content','','content','?m=content&c=content&a=edit','','1','admin','127.0.0.1','2015-09-04 12:03:08');
INSERT INTO `v9_log` VALUES('1004','','0','content','','content','?m=content&c=content&a=edit','','1','admin','127.0.0.1','2015-09-04 12:03:11');
INSERT INTO `v9_log` VALUES('1005','','0','zl_admin','','category','?m=zl_admin&c=category&a=edit','','1','admin','127.0.0.1','2015-09-04 12:10:27');
INSERT INTO `v9_log` VALUES('1006','','0','zl_admin','','category','?m=zl_admin&c=category&a=edit','','1','admin','127.0.0.1','2015-09-04 12:10:27');
INSERT INTO `v9_log` VALUES('1007','','0','zl_admin','','category','?m=zl_admin&c=category&a=edit','','1','admin','127.0.0.1','2015-09-04 12:10:35');
INSERT INTO `v9_log` VALUES('1008','','0','zl_admin','','category','?m=zl_admin&c=category&a=edit','','1','admin','127.0.0.1','2015-09-04 12:11:06');
INSERT INTO `v9_log` VALUES('1009','','0','zl_admin','','category','?m=zl_admin&c=category&a=edit','','1','admin','127.0.0.1','2015-09-04 12:11:06');
INSERT INTO `v9_log` VALUES('1010','','0','zl_admin','','category','?m=zl_admin&c=category&a=edit','','1','admin','127.0.0.1','2015-09-04 12:11:09');
INSERT INTO `v9_log` VALUES('1011','','0','zl_admin','','category','?m=zl_admin&c=category&a=edit','','1','admin','127.0.0.1','2015-09-04 12:11:24');
INSERT INTO `v9_log` VALUES('1012','','0','zl_admin','','category','?m=zl_admin&c=category&a=edit','','1','admin','127.0.0.1','2015-09-04 12:11:24');
INSERT INTO `v9_log` VALUES('1013','','0','zl_admin','','category','?m=zl_admin&c=category&a=edit','','1','admin','127.0.0.1','2015-09-04 12:11:29');
INSERT INTO `v9_log` VALUES('1014','','0','content','','content','?m=content&c=content&a=edit','','1','admin','127.0.0.1','2015-09-04 12:12:06');
INSERT INTO `v9_log` VALUES('1015','','0','content','','content','?m=content&c=content&a=edit','','1','admin','127.0.0.1','2015-09-04 12:12:08');
INSERT INTO `v9_log` VALUES('1016','','0','pay','','payment','?m=pay&c=payment&a=pay_list','','1','admin','127.0.0.1','2015-09-04 12:16:34');
INSERT INTO `v9_log` VALUES('1017','','0','zl_admin','','module','?m=zl_admin&c=module&a=uninstall','','1','admin','127.0.0.1','2015-09-04 12:17:15');
INSERT INTO `v9_log` VALUES('1018','','0','zl_admin','','module','?m=zl_admin&c=module&a=uninstall','','1','admin','127.0.0.1','2015-09-04 12:17:27');
INSERT INTO `v9_log` VALUES('1019','','0','zl_admin','','module','?m=zl_admin&c=module&a=uninstall','','1','admin','127.0.0.1','2015-09-04 12:17:40');
INSERT INTO `v9_log` VALUES('1020','','0','zl_admin','','module','?m=zl_admin&c=module&a=cache','','1','admin','127.0.0.1','2015-09-04 12:17:40');
INSERT INTO `v9_log` VALUES('1021','','0','zl_admin','','module','?m=zl_admin&c=module&a=uninstall','','1','admin','127.0.0.1','2015-09-04 12:18:10');
INSERT INTO `v9_log` VALUES('1022','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2015-09-04 12:19:05');
INSERT INTO `v9_log` VALUES('1023','','0','member','','member','?m=member&c=member&a=manage','','1','admin','127.0.0.1','2015-09-04 12:23:30');
INSERT INTO `v9_log` VALUES('1024','','0','zl_admin','','database','?m=zl_admin&c=database&a=export','','1','admin','127.0.0.1','2015-09-04 12:23:51');
INSERT INTO `v9_log` VALUES('1025','','0','zl_admin','','database','?m=zl_admin&c=database&a=export','','1','admin','127.0.0.1','2015-09-04 12:23:52');
INSERT INTO `v9_log` VALUES('1026','','0','zl_admin','','database','?m=zl_admin&c=database&a=export','','1','admin','127.0.0.1','2015-09-04 12:23:54');
INSERT INTO `v9_log` VALUES('1027','','0','zl_admin','','database','?m=zl_admin&c=database&a=export','','1','admin','127.0.0.1','2015-09-04 12:23:59');

DROP TABLE IF EXISTS `v9_member`;
CREATE TABLE `v9_member` (
  `userid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `phpssouid` mediumint(8) unsigned NOT NULL,
  `username` char(20) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `encrypt` char(6) NOT NULL,
  `nickname` char(20) NOT NULL,
  `regdate` int(10) unsigned NOT NULL DEFAULT '0',
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `regip` char(15) NOT NULL DEFAULT '',
  `lastip` char(15) NOT NULL DEFAULT '',
  `loginnum` smallint(5) unsigned NOT NULL DEFAULT '0',
  `email` char(32) NOT NULL DEFAULT '',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `areaid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `amount` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `point` smallint(5) unsigned NOT NULL DEFAULT '0',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `message` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `vip` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `overduedate` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  `connectid` char(40) NOT NULL DEFAULT '',
  `from` char(10) NOT NULL DEFAULT '',
  `mobile` char(11) NOT NULL DEFAULT '',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`(20)),
  KEY `phpssouid` (`phpssouid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_member_detail`;
CREATE TABLE `v9_member_detail` (
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `birthday` date DEFAULT NULL,
  UNIQUE KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_member_group`;
CREATE TABLE `v9_member_group` (
  `groupid` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(15) NOT NULL,
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `starnum` tinyint(2) unsigned NOT NULL,
  `point` smallint(6) unsigned NOT NULL,
  `allowmessage` smallint(5) unsigned NOT NULL DEFAULT '0',
  `allowvisit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowpost` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowpostverify` tinyint(1) unsigned NOT NULL,
  `allowsearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowupgrade` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `allowsendmessage` tinyint(1) unsigned NOT NULL,
  `allowpostnum` smallint(5) unsigned NOT NULL DEFAULT '0',
  `allowattachment` tinyint(1) NOT NULL,
  `price_y` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `price_m` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `price_d` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `icon` char(30) NOT NULL,
  `usernamecolor` char(7) NOT NULL,
  `description` char(100) NOT NULL,
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupid`),
  KEY `disabled` (`disabled`),
  KEY `listorder` (`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

INSERT INTO `v9_member_group` VALUES('8','游客','1','0','0','0','0','0','0','1','0','0','0','0','0.00','0.00','0.00','','','','0','0');
INSERT INTO `v9_member_group` VALUES('2','新手上路','1','1','50','100','1','1','0','0','0','1','0','0','50.00','10.00','1.00','','','','2','0');
INSERT INTO `v9_member_group` VALUES('6','注册会员','1','2','100','150','0','1','0','0','1','1','0','0','300.00','30.00','1.00','','','','6','0');
INSERT INTO `v9_member_group` VALUES('4','中级会员','1','3','150','500','1','1','0','1','1','1','0','0','500.00','60.00','1.00','','','','4','0');
INSERT INTO `v9_member_group` VALUES('5','高级会员','1','5','300','999','1','1','0','1','1','1','0','0','360.00','90.00','5.00','','','','5','0');
INSERT INTO `v9_member_group` VALUES('1','禁止访问','1','0','0','0','1','1','0','1','0','0','0','0','0.00','0.00','0.00','','','0','0','0');
INSERT INTO `v9_member_group` VALUES('7','邮件认证','1','0','0','0','0','0','0','0','0','0','0','0','0.00','0.00','0.00','images/group/vip.jpg','#000000','','7','0');

DROP TABLE IF EXISTS `v9_member_menu`;
CREATE TABLE `v9_member_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(40) NOT NULL DEFAULT '',
  `parentid` smallint(6) NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL DEFAULT '',
  `c` char(20) NOT NULL DEFAULT '',
  `a` char(20) NOT NULL DEFAULT '',
  `data` char(100) NOT NULL DEFAULT '',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  `display` enum('1','0') NOT NULL DEFAULT '1',
  `isurl` enum('1','0') NOT NULL DEFAULT '0',
  `url` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `listorder` (`listorder`),
  KEY `parentid` (`parentid`),
  KEY `module` (`m`,`c`,`a`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `v9_member_menu` VALUES('1','member_init','0','member','index','init','t=0','0','1','','');
INSERT INTO `v9_member_menu` VALUES('2','account_manage','0','member','index','account_manage','t=1','0','1','','');
INSERT INTO `v9_member_menu` VALUES('3','favorite','0','member','index','favorite','t=2','0','1','','');

DROP TABLE IF EXISTS `v9_member_verify`;
CREATE TABLE `v9_member_verify` (
  `userid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL,
  `password` char(32) NOT NULL,
  `encrypt` char(6) NOT NULL,
  `nickname` char(20) NOT NULL,
  `regdate` int(10) unsigned NOT NULL,
  `regip` char(15) NOT NULL,
  `email` char(32) NOT NULL,
  `modelid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `point` smallint(5) unsigned NOT NULL DEFAULT '0',
  `amount` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `modelinfo` char(255) NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteid` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `message` char(100) DEFAULT NULL,
  `mobile` char(11) NOT NULL DEFAULT '',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`(20))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_member_vip`;
CREATE TABLE `v9_member_vip` (
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_menu`;
CREATE TABLE `v9_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(40) NOT NULL DEFAULT '',
  `parentid` smallint(6) NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL DEFAULT '',
  `c` char(20) NOT NULL DEFAULT '',
  `a` char(20) NOT NULL DEFAULT '',
  `data` char(100) NOT NULL DEFAULT '',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  `display` enum('1','0') NOT NULL DEFAULT '1',
  `project1` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project2` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project3` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project4` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project5` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `listorder` (`listorder`),
  KEY `parentid` (`parentid`),
  KEY `module` (`m`,`c`,`a`)
) ENGINE=MyISAM AUTO_INCREMENT=1586 DEFAULT CHARSET=utf8;

INSERT INTO `v9_menu` VALUES('1','sys_setting','0','zl_admin','setting','init','','1','1','0','1','1','1','1');
INSERT INTO `v9_menu` VALUES('2','module','0','zl_admin','module','init','','2','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('872','sync_release_point','873','release','index','init','','3','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('4','content','0','content','content','init','','4','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('5','members','0','member','member','init','','5','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('6','userinterface','0','template','style','init','','6','1','0','1','1','1','1');
INSERT INTO `v9_menu` VALUES('30','correlative_setting','1','zl_admin','admin','admin','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('31','menu_manage','977','zl_admin','menu','init','','8','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('32','posid_manage','975','zl_admin','position','init','','7','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('29','module_manage','2','zl_admin','module','','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('10','panel','0','zl_admin','index','public_main','','0','1','0','1','1','1','1');
INSERT INTO `v9_menu` VALUES('35','menu_add','31','zl_admin','menu','add','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('826','template_manager','6','','','','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('54','admin_manage','49','zl_admin','admin_manage','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('43','category_manage','975','zl_admin','category','init','module=admin','4','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('42','add_category','43','zl_admin','category','add','s=0','1','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('44','edit_category','43','zl_admin','category','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('45','badword_manage','977','zl_admin','badword','init','','10','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('46','posid_add','32','zl_admin','position','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('49','admin_setting','1','zl_admin','','','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('50','role_manage','49','zl_admin','role','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('51','role_add','50','zl_admin','role','add','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('52','category_cache','43','zl_admin','category','public_cache','module=admin','4','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('55','manage_member','5','member','member','manage','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('58','admin_add','54','zl_admin','admin_manage','add','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('59','model_manage','975','content','sitemodel','init','','5','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('64','site_management','30','zl_admin','site','init','','2','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('81','member_add','72','member','member','add','','2','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('62','add_model','59','content','sitemodel','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('65','release_point_management','30','zl_admin','release_point','init','','3','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('66','badword_export','45','zl_admin','badword','export','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('67','add_site','64','zl_admin','site','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('68','badword_import','45','zl_admin','badword','import','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('812','member_group_manage','76','member','member_group','manage','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('74','member_verify','55','member','member_verify','manage','s=0','3','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('76','manage_member_group','5','member','member_group','manage','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('77','manage_member_model','5','member','member_model','manage','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('78','member_group_add','812','member','member_group','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('79','member_model_add','813','member','member_model','add','','1','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('80','member_model_import','77','member','member_model','import','','2','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('72','member_manage','55','member','member','manage','','1','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('813','member_model_manage','77','member','member_model','manage','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('814','site_edit','64','zl_admin','site','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('815','site_del','64','zl_admin','site','del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('816','release_point_add','65','zl_admin','release_point','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('817','release_point_del','65','zl_admin','release_point','del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('818','release_point_edit','65','zl_admin','release_point','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('821','content_publish','4','content','content','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('822','content_manage','821','content','content','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('867','linkage','977','zl_admin','linkage','init','','13','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('827','template_style','826','template','style','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('828','import_style','827','template','style','import','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('831','template_export','827','template','style','export','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('830','template_file','827','template','file','init','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('832','template_onoff','827','template','style','disable','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('833','template_updatename','827','template','style','updatename','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('834','member_lock','72','member','member','lock','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('835','member_unlock','72','member','member','unlock','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('836','member_move','72','member','member','move','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('837','member_delete','72','member','member','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('842','verify_ignore','74','member','member_verify','manage','s=2','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('839','member_setting','55','member','member_setting','manage','','4','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('841','verify_pass','74','member','member_verify','manage','s=1','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('843','verify_delete','74','member','member_verify','manage','s=3','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('844','verify_deny','74','member','member_verify','manage','s=4','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('845','never_pass','74','member','member_verify','manage','s=5','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('846','template_file_list','827','template','file','init','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('847','template_file_edit','827','template','file','edit_file','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('848','file_add_file','827','template','file','add_file','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('850','listorder','76','member','member_group','sort','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('852','priv_setting','50','zl_admin','role','priv_setting','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('853','role_priv','50','zl_admin','role','role_priv','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('857','attachment_manage','821','attachment','manage','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('868','special','821','special','special','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('869','template_editor','827','template','file','edit_file','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('870','template_visualization','827','template','file','visualization','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('871','pc_tag_edit','827','template','file','edit_pc_tag','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('873','release_manage','4','release','html','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('874','type_manage','975','content','type_manage','init','','6','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('875','add_type','874','content','type_manage','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('876','linkageadd','867','zl_admin','linkage','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('877','failure_list','872','release','index','failed','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('879','member_search','72','member','member','search','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('880','queue_del','872','release','index','del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('881','member_model_delete','813','member','member_model','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('882','member_model_edit','813','member','member_model','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('885','workflow','977','content','workflow','init','','15','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('888','add_workflow','885','content','workflow','add','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('889','member_modelfield_add','813','member','member_modelfield','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('890','member_modelfield_edit','813','member','member_modelfield','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('891','member_modelfield_delete','813','member','member_modelfield','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('892','member_modelfield_manage','813','member','member_modelfield','manage','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('895','sitemodel_import','59','content','sitemodel','import','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('896','pay','29','pay','payment','pay_list','s=3','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('897','payments','896','pay','payment','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('898','paylist','896','pay','payment','pay_list','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('899','add_content','822','content','content','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('900','modify_deposit','896','pay','payment','modify_deposit','s=1','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('901','check_content','822','content','content','pass','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('902','dbsource','29','dbsource','data','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('905','create_content_html','873','content','create_html','show','','2','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('904','external_data_sources','902','dbsource','dbsource_admin','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('906','update_urls','873','content','create_html','update_urls','','1','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('960','node_add','957','collection','node','add','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('909','fulltext_search','29','search','search_type','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('910','manage_type','909','search','search_type','init','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('911','search_setting','909','search','search_admin','setting','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('912','createindex','909','search','search_admin','createindex','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('913','add_search_type','909','search','search_type','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('914','database_toos','977','zl_admin','database','export','','6','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('915','database_export','914','zl_admin','database','export','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('916','database_import','914','zl_admin','database','import','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('917','dbsource_add','902','dbsource','dbsource_admin','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('918','dbsource_edit','902','dbsource','dbsource_admin','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('919','dbsource_del','902','dbsource','dbsource_admin','del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('920','dbsource_data_add','902','dbsource','data','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('921','dbsource_data_edit','902','dbsource','data','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('922','dbsource_data_del','902','dbsource','data','del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('926','add_special','868','special','special','add','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('927','edit_special','868','special','special','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('928','special_list','868','special','special','init','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('929','special_elite','868','special','special','elite','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('930','delete_special','868','special','special','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('931','badword_add','45','zl_admin','badword','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('932','badword_edit','45','zl_admin','badword','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('933','badword_delete','45','zl_admin','badword','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('934','special_listorder','868','special','special','listorder','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('935','special_content_list','868','special','content','init','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('936','special_content_add','935','special','content','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('937','special_content_list','935','special','content','init','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('938','special_content_edit','935','special','content','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('939','special_content_delete','935','special','content','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('940','special_content_listorder','935','special','content','listorder','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('941','special_content_import','935','special','special','import','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('942','history_version','827','template','template_bak','init','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('943','restore_version','827','template','template_bak','restore','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('944','del_history_version','827','template','template_bak','del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('945','block','821','block','block_admin','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('946','block_add','945','block','block_admin','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('950','block_edit','945','block','block_admin','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('951','block_del','945','block','block_admin','del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('952','block_update','945','block','block_admin','block_update','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('953','block_restore','945','block','block_admin','history_restore','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('954','history_del','945','block','block_admin','history_del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('978','urlrule_manage','977','zl_admin','urlrule','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('957','collection_node','821','collection','node','manage','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('979','safe_config','30','zl_admin','setting','init','&tab=2','11','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('959','basic_config','30','zl_admin','setting','init','','10','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('961','position_edit','32','zl_admin','position','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('962','collection_node_edit','957','collection','node','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('963','collection_node_delete','957','collection','node','del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('990','col_url_list','957','collection','node','col_url_list','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('965','collection_node_publish','957','collection','node','publist','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('966','collection_node_import','957','collection','node','node_import','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('967','collection_node_export','957','collection','node','export','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('968','collection_node_collection_content','957','collection','node','col_content','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('969','googlesitemap','977','zl_admin','googlesitemap','set','','11','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('970','admininfo','10','zl_admin','admin_manage','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('971','editpwd','970','zl_admin','admin_manage','public_edit_pwd','','1','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('972','editinfo','970','zl_admin','admin_manage','public_edit_info','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('973','keylink','977','zl_admin','keylink','init','','12','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('974','add_keylink','973','zl_admin','keylink','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('975','content_settings','4','content','content_settings','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('7','extend','0','zl_admin','extend','init_extend','','7','1','0','1','1','1','1');
INSERT INTO `v9_menu` VALUES('977','extend_all','7','zl_admin','extend_all','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('980','sso_config','30','zl_admin','setting','init','&tab=3','12','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('981','email_config','30','zl_admin','setting','init','&tab=4','13','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('982','module_manage','29','zl_admin','module','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('983','ipbanned','977','zl_admin','ipbanned','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('984','add_ipbanned','983','zl_admin','ipbanned','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('993','collection_content_import','957','collection','node','import','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('991','copy_node','957','collection','node','copy','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('992','content_del','957','collection','node','content_del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('989','downsites','977','zl_admin','downservers','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('994','import_program_add','957','collection','node','import_program_add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('995','import_program_del','957','collection','node','import_program_del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('996','import_content','957','collection','node','import_content','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('997','log','977','zl_admin','log','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('998','add_page','43','zl_admin','category','add','s=1','2','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('999','add_cat_link','43','zl_admin','category','add','s=2','2','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1000','count_items','43','zl_admin','category','count_items','','5','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1001','cache_all','977','zl_admin','cache_all','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1002','create_list_html','873','content','create_html','category','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1003','create_html_quick','10','content','create_html_opt','index','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1004','create_index','1003','content','create_html','public_index','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1005','scan','977','scan','index','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1006','scan_report','1005','scan','index','scan_report','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1007','md5_creat','1005','scan','index','md5_creat','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1008','album_import','868','special','album','import','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('8','phpsso','0','zl_admin','phpsso','menu','','7','1','0','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1011','edit_content','822','content','content','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1012','push_to_special','822','content','push','init','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1023','delete_log','997','zl_admin','log','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1024','delete_ip','983','zl_admin','ipbanned','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1026','delete_keylink','973','zl_admin','keylink','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1027','edit_keylink','973','zl_admin','keylink','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1034','operation_pass','74','member','member_verify','pass','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1035','operation_delete','74','member','member_verify','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1039','operation_ignore','74','member','member_verify','ignore','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1038','settingsave','30','zl_admin','setting','save','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1040','admin_edit','54','zl_admin','admin_manage','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1041','operation_reject','74','member','member_verify','reject','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1042','admin_delete','54','zl_admin','admin_manage','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1043','card','54','zl_admin','admin_manage','card','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1044','creat_card','54','zl_admin','admin_manage','creat_card','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1045','remove_card','54','zl_admin','admin_manage','remove_card','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1049','member_group_edit','812','member','member_group','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1048','member_edit','72','member','member','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1050','role_edit','50','zl_admin','role','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1051','member_group_delete','812','member','member_group','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1052','member_manage','50','zl_admin','role','member_manage','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1053','role_delete','50','zl_admin','role','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1054','member_model_export','77','member','member_model','export','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1055','member_model_sort','77','member','member_model','sort','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1056','member_model_move','77','member','member_model','move','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1057','payment_add','897','pay','payment','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1058','payment_delete','897','pay','payment','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1059','payment_edit','897','pay','payment','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1060','spend_record','896','pay','spend','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1061','pay_stat','896','pay','payment','pay_stat','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1062','fields_manage','59','content','sitemodel_field','init','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1063','edit_model_content','59','content','sitemodel','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1064','disabled_model','59','content','sitemodel','disabled','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1065','delete_model','59','content','sitemodel','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1066','export_model','59','content','sitemodel','export','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1067','delete','874','content','type_manage','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1068','edit','874','content','type_manage','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1069','add_urlrule','978','zl_admin','urlrule','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1070','edit_urlrule','978','zl_admin','urlrule','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1071','delete_urlrule','978','zl_admin','urlrule','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1072','edit_menu','31','zl_admin','menu','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1073','delete_menu','31','zl_admin','menu','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1074','edit_workflow','885','content','workflow','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1075','delete_workflow','885','content','workflow','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1076','creat_html','868','special','special','html','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1093','connect_config','30','zl_admin','setting','init','&tab=5','14','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1102','view_modelinfo','74','member','member_verify','modelinfo','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1202','create_special_list','868','special','special','create_special_list','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1240','view_memberlinfo','72','member','member','memberinfo','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1239','copyfrom_manage','977','zl_admin','copyfrom','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1241','move_content','822','content','content','remove','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1242','poster_template','56','poster','space','poster_template','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1243','create_index','873','content','create_html','public_index','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1244','add_othors','822','content','content','add_othors','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1295','attachment_manager_dir','857','attachment','manage','dir','','2','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1296','attachment_manager_db','857','attachment','manage','init','','1','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1346','attachment_address_replace','857','attachment','address','init','','3','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1347','attachment_address_update','857','attachment','address','update','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1348','delete_content','822','content','content','delete','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1349','member_menu_manage','977','member','member_menu','manage','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1350','member_menu_add','1349','member','member_menu','add','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1351','member_menu_edit','1349','member','member_menu','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1352','member_menu_delete','1349','member','member_menu','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1353','batch_show','822','content','create_html','batch_show','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1354','pay_delete','898','pay','payment','pay_del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1355','pay_cancel','898','pay','payment','pay_cancel','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1356','discount','898','pay','payment','discount','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1360','category_batch_edit','43','zl_admin','category','batch_edit','','6','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1500','listorder','822','content','content','listorder','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1501','a_clean_data','873','content','content','clear_data','','0','1','0','0','0','0','0');
INSERT INTO `v9_menu` VALUES('1502','announce','29','announce','admin_announce','init','s=1','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1503','announce_add','1502','announce','admin_announce','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1504','edit_announce','1502','announce','admin_announce','edit','s=1','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1505','check_announce','1502','announce','admin_announce','init','s=2','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1506','overdue','1502','announce','admin_announce','init','s=3','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1507','del_announce','1502','announce','admin_announce','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1508','comment','29','comment','comment_admin','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1509','comment_manage','821','comment','comment_admin','listinfo','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1510','comment_check','1509','comment','check','checks','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1511','comment_list','1508','comment','comment_admin','lists','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1512','link','29','link','link','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1513','add_link','1512','link','link','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1514','edit_link','1512','link','link','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1515','delete_link','1512','link','link','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1516','link_setting','1512','link','link','setting','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1517','add_type','1512','link','link','add_type','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1518','list_type','1512','link','link','list_type','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1519','check_register','1512','link','link','check_register','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1528','message','29','message','message','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1529','send_one','1528','message','message','send_one','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1530','delete_message','1528','message','message','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1531','message_send','1528','message','message','message_send','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1532','message_group_manage','1528','message','message','message_group_manage','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1535','poster','29','poster','space','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1536','add_space','1535','poster','space','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1537','edit_space','1535','poster','space','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1538','del_space','1535','poster','space','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1539','poster_list','1535','poster','poster','init','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1540','add_poster','1535','poster','poster','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1541','edit_poster','1535','poster','poster','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1542','del_poster','1535','poster','poster','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1543','poster_stat','1535','poster','poster','stat','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1544','poster_setting','1535','poster','space','setting','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1545','create_poster_js','1535','poster','space','create_js','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1546','poster_template','1535','poster','space','poster_template','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1547','formguide','29','formguide','formguide','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1548','formguide_add','1547','formguide','formguide','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1549','formguide_edit','1547','formguide','formguide','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1550','form_info_list','1547','formguide','formguide_info','init','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1551','formguide_disabled','1547','formguide','formguide','disabled','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1552','formguide_delete','1547','formguide','formguide','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1553','formguide_stat','1547','formguide','formguide','stat','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1554','add_public_field','1547','formguide','formguide_field','add','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1555','list_public_field','1547','formguide','formguide_field','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1556','module_setting','1547','formguide','formguide','setting','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1566','tag','826','tag','tag','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1567','add_tag','1566','tag','tag','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1568','edit_tag','1566','tag','tag','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1569','delete_tag','1566','tag','tag','del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1570','tag_lists','1566','tag','tag','lists','','0','0','1','1','1','1','1');

DROP TABLE IF EXISTS `v9_message`;
CREATE TABLE `v9_message` (
  `messageid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `send_from_id` char(30) NOT NULL DEFAULT '0',
  `send_to_id` char(30) NOT NULL DEFAULT '0',
  `folder` enum('all','inbox','outbox') NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `message_time` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` char(80) DEFAULT NULL,
  `content` text NOT NULL,
  `replyid` int(10) unsigned NOT NULL DEFAULT '0',
  `del_type` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`messageid`),
  KEY `msgtoid` (`send_to_id`,`folder`),
  KEY `replyid` (`replyid`),
  KEY `folder` (`send_from_id`,`folder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_message_data`;
CREATE TABLE `v9_message_data` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) NOT NULL,
  `group_message_id` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `message` (`userid`,`group_message_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_message_group`;
CREATE TABLE `v9_message_group` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupid` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '用户组id',
  `subject` char(80) DEFAULT NULL,
  `content` text NOT NULL COMMENT '内容',
  `inputtime` int(10) unsigned DEFAULT '0',
  `status` tinyint(2) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_model`;
CREATE TABLE `v9_model` (
  `modelid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` char(30) NOT NULL,
  `description` char(100) NOT NULL,
  `tablename` char(20) NOT NULL,
  `setting` text NOT NULL,
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `items` smallint(5) unsigned NOT NULL DEFAULT '0',
  `enablesearch` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `default_style` char(30) NOT NULL,
  `category_template` char(30) NOT NULL,
  `list_template` char(30) NOT NULL,
  `show_template` char(30) NOT NULL,
  `js_template` varchar(30) NOT NULL,
  `admin_list_template` char(30) NOT NULL,
  `member_add_template` varchar(30) NOT NULL,
  `member_list_template` varchar(30) NOT NULL,
  `sort` tinyint(3) NOT NULL,
  `type` tinyint(1) NOT NULL,
  PRIMARY KEY (`modelid`),
  KEY `type` (`type`,`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

INSERT INTO `v9_model` VALUES('1','1','文章模型','','news','','0','0','1','0','default','category','list','show','','','','','0','0');
INSERT INTO `v9_model` VALUES('2','1','下载模型','','download','','0','0','1','0','default','category_download','list_download','show_download','','','','','0','0');
INSERT INTO `v9_model` VALUES('3','1','图片模型','','picture','','0','0','1','0','default','category_picture','list_picture','show_picture','','','','','0','0');
INSERT INTO `v9_model` VALUES('10','1','普通会员','普通会员','member_detail','','0','0','1','0','','','','','','','','','0','2');
INSERT INTO `v9_model` VALUES('11','1','视频模型','','video','','0','0','1','0','default','category_video','list_video','show_video','','','','','0','0');

DROP TABLE IF EXISTS `v9_model_field`;
CREATE TABLE `v9_model_field` (
  `fieldid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `field` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `tips` text NOT NULL,
  `css` varchar(30) NOT NULL,
  `minlength` int(10) unsigned NOT NULL DEFAULT '0',
  `maxlength` int(10) unsigned NOT NULL DEFAULT '0',
  `pattern` varchar(255) NOT NULL,
  `errortips` varchar(255) NOT NULL,
  `formtype` varchar(20) NOT NULL,
  `setting` mediumtext NOT NULL,
  `formattribute` varchar(255) NOT NULL,
  `unsetgroupids` varchar(255) NOT NULL,
  `unsetroleids` varchar(255) NOT NULL,
  `iscore` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isunique` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isbase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isfulltext` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isposition` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `listorder` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isomnipotent` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fieldid`),
  KEY `modelid` (`modelid`,`disabled`),
  KEY `field` (`field`,`modelid`)
) ENGINE=MyISAM AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;

INSERT INTO `v9_model_field` VALUES('1','1','1','catid','栏目','','','1','6','/^[0-9]{1,6}$/','请选择栏目','catid','array (\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','1','0','1','1','1','0','0','1','0','0');
INSERT INTO `v9_model_field` VALUES('2','1','1','typeid','类别','','','0','0','','','typeid','array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','','','0','1','0','1','1','1','0','0','2','0','0');
INSERT INTO `v9_model_field` VALUES('3','1','1','title','标题','','inputtitle','1','80','','请输入标题','title','','','','','0','1','0','1','1','1','1','1','4','0','0');
INSERT INTO `v9_model_field` VALUES('4','1','1','thumb','缩略图','','','0','100','','','image','array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)','','','','0','1','0','0','0','1','0','1','14','0','0');
INSERT INTO `v9_model_field` VALUES('5','1','1','keywords','关键词','多关键词之间用空格或者“,”隔开','','0','40','','','keyword','array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)','','-99','-99','0','1','0','1','1','1','1','0','7','0','0');
INSERT INTO `v9_model_field` VALUES('6','1','1','description','摘要','','','0','255','','','textarea','array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)','','','','0','1','0','1','0','1','1','1','10','0','0');
INSERT INTO `v9_model_field` VALUES('7','1','1','updatetime','更新时间','','','0','0','','','datetime','array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)','','','','1','1','0','1','0','0','0','0','12','0','0');
INSERT INTO `v9_model_field` VALUES('8','1','1','content','内容','<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>','','1','999999','','内容不能为空','editor','array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n)','','','','0','0','0','1','0','1','1','0','13','0','0');
INSERT INTO `v9_model_field` VALUES('9','1','1','voteid','添加投票','','','0','0','','','omnipotent','array (\n  \'formtext\' => \'<input type=\\\'text\\\' name=\\\'info[voteid]\\\' id=\\\'voteid\\\' value=\\\'{FIELD_VALUE}\\\' size=\\\'3\\\'> \r\n<input type=\\\'button\\\' value=\"选择已有投票\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=vote&c=vote&a=public_get_votelist&from_api=1\\\',\\\'选择已有投票\\\')\" class=\"button\">\r\n<input type=\\\'button\\\' value=\"新增投票\" onclick=\"omnipotent(\\\'addvote\\\',\\\'?m=vote&c=vote&a=add&from_api=1\\\',\\\'添加投票\\\',0)\" class=\"button\">\',\n  \'fieldtype\' => \'mediumint\',\n  \'minnumber\' => \'1\',\n)','','','','0','0','0','1','0','0','1','0','21','0','0');
INSERT INTO `v9_model_field` VALUES('10','1','1','pages','分页方式','','','0','0','','','pages','','','-99','-99','0','0','0','1','0','0','0','0','16','0','0');
INSERT INTO `v9_model_field` VALUES('11','1','1','inputtime','发布时间','','','0','0','','','datetime','array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)','','','','0','1','0','0','0','0','0','1','17','0','0');
INSERT INTO `v9_model_field` VALUES('12','1','1','posids','推荐位','','','0','0','','','posid','array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)','','','','0','1','0','1','0','0','0','0','18','0','0');
INSERT INTO `v9_model_field` VALUES('13','1','1','url','URL','','','0','100','','','text','','','','','1','1','0','1','0','0','0','0','50','0','0');
INSERT INTO `v9_model_field` VALUES('14','1','1','listorder','排序','','','0','6','','','number','','','','','1','1','0','1','0','0','0','0','51','0','0');
INSERT INTO `v9_model_field` VALUES('15','1','1','status','状态','','','0','2','','','box','','','','','1','1','0','1','0','0','0','0','55','0','0');
INSERT INTO `v9_model_field` VALUES('16','1','1','template','内容页模板','','','0','30','','','template','array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','53','0','0');
INSERT INTO `v9_model_field` VALUES('17','1','1','groupids_view','阅读权限','','','0','0','','','groupid','array (\n  \'groupids\' => \'\',\n)','','','','0','0','0','1','0','0','0','0','19','0','0');
INSERT INTO `v9_model_field` VALUES('18','1','1','readpoint','阅读收费','','','0','5','','','readpoint','array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','55','0','0');
INSERT INTO `v9_model_field` VALUES('19','1','1','relation','相关文章','','','0','0','','','omnipotent','array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)','','2,6,4,5,1,17,18,7','','0','0','0','0','0','0','1','0','15','0','0');
INSERT INTO `v9_model_field` VALUES('20','1','1','allow_comment','允许评论','','','0','0','','','box','array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'0\',\n)','','','','0','0','0','0','0','0','0','0','54','0','0');
INSERT INTO `v9_model_field` VALUES('21','1','1','copyfrom','来源','','','0','100','','','copyfrom','array (\n  \'defaultvalue\' => \'\',\n)','','','','0','0','0','1','0','1','0','0','8','0','0');
INSERT INTO `v9_model_field` VALUES('80','1','1','username','用户名','','','0','20','','','text','','','','','1','1','0','1','0','0','0','0','98','0','0');
INSERT INTO `v9_model_field` VALUES('22','2','1','catid','栏目','','','1','6','/^[0-9]{1,6}$/','请选择栏目','catid','array (\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','1','0','1','1','1','0','0','1','0','0');
INSERT INTO `v9_model_field` VALUES('23','2','1','typeid','类别','','','0','0','','','typeid','array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','','','0','1','0','1','1','1','0','0','2','1','0');
INSERT INTO `v9_model_field` VALUES('24','2','1','title','标题','','inputtitle','1','80','','请输入标题','title','','','','','0','1','0','1','1','1','1','1','4','0','0');
INSERT INTO `v9_model_field` VALUES('25','2','1','keywords','关键词','多关键词之间用空格或者“,”隔开','','0','40','','','keyword','array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)','','-99','-99','0','1','0','1','1','1','1','0','7','0','0');
INSERT INTO `v9_model_field` VALUES('26','2','1','description','摘要','','','0','255','','','textarea','array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)','','','','0','1','0','1','0','1','1','1','10','0','0');
INSERT INTO `v9_model_field` VALUES('27','2','1','updatetime','更新时间','','','0','0','','','datetime','array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)','','','','1','1','0','1','0','0','0','0','12','0','0');
INSERT INTO `v9_model_field` VALUES('28','2','1','content','内容','<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>','','1','999999','','内容不能为空','editor','array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n  \'height\' => \'\',\n  \'disabled_page\' => \'1\',\n)','','','','0','0','0','1','0','1','1','0','13','0','0');
INSERT INTO `v9_model_field` VALUES('29','2','1','thumb','缩略图','','','0','100','','','image','array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)','','','','0','1','0','0','0','1','0','1','14','0','0');
INSERT INTO `v9_model_field` VALUES('30','2','1','relation','相关文章','','','0','0','','','omnipotent','array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)','','2,6,4,5,1,17,18,7','','0','0','0','0','0','0','1','0','15','0','0');
INSERT INTO `v9_model_field` VALUES('31','2','1','pages','分页方式','','','0','0','','','pages','','','-99','-99','0','0','0','1','0','0','0','0','16','1','0');
INSERT INTO `v9_model_field` VALUES('32','2','1','inputtime','发布时间','','','0','0','','','datetime','array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)','','','','0','1','0','0','0','0','0','1','17','0','0');
INSERT INTO `v9_model_field` VALUES('33','2','1','posids','推荐位','','','0','0','','','posid','array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)','','','','0','1','0','1','0','0','0','0','18','0','0');
INSERT INTO `v9_model_field` VALUES('34','2','1','groupids_view','阅读权限','','','0','0','','','groupid','array (\n  \'groupids\' => \'\',\n)','','','','0','0','0','1','0','0','0','0','19','0','0');
INSERT INTO `v9_model_field` VALUES('35','2','1','url','URL','','','0','100','','','text','','','','','1','1','0','1','0','0','0','0','50','0','0');
INSERT INTO `v9_model_field` VALUES('36','2','1','listorder','排序','','','0','6','','','number','','','','','1','1','0','1','0','0','0','0','51','0','0');
INSERT INTO `v9_model_field` VALUES('37','2','1','template','内容页模板','','','0','30','','','template','array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','53','0','0');
INSERT INTO `v9_model_field` VALUES('38','2','1','allow_comment','允许评论','','','0','0','','','box','array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'0\',\n)','','','','0','0','0','0','0','0','0','0','54','0','0');
INSERT INTO `v9_model_field` VALUES('39','2','1','status','状态','','','0','2','','','box','','','','','1','1','0','1','0','0','0','0','55','0','0');
INSERT INTO `v9_model_field` VALUES('40','2','1','readpoint','阅读收费','','','0','5','','','readpoint','array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','55','0','0');
INSERT INTO `v9_model_field` VALUES('41','2','1','username','用户名','','','0','20','','','text','','','','','1','1','0','1','0','0','0','0','98','0','0');
INSERT INTO `v9_model_field` VALUES('42','2','1','downfiles','本地下载','','','0','0','','','downfiles','array (\n  \'upload_allowext\' => \'rar|zip\',\n  \'isselectimage\' => \'0\',\n  \'upload_number\' => \'10\',\n  \'downloadlink\' => \'1\',\n  \'downloadtype\' => \'1\',\n)','','','','0','0','0','1','0','1','0','0','8','0','0');
INSERT INTO `v9_model_field` VALUES('43','2','1','downfile','镜像下载','','','0','0','','','downfile','array (\n  \'downloadlink\' => \'1\',\n  \'downloadtype\' => \'1\',\n  \'upload_allowext\' => \'rar|zip\',\n  \'isselectimage\' => \'0\',\n  \'upload_number\' => \'1\',\n)','','','','0','0','0','1','0','1','0','0','9','0','0');
INSERT INTO `v9_model_field` VALUES('44','2','1','systems','软件平台','<select name=\'selectSystem\' onchange=\"ChangeInput(this,document.myform.systems,\'/\')\">\r\n	<option value=\'WinXP\'>WinXP</option>\r\n	<option value=\'Vista\'>Windows 7</option>\r\n	<option value=\'Win2000\'>Win2000</option>\r\n	<option value=\'Win2003\'>Win2003</option>\r\n	<option value=\'Unix\'>Unix</option>\r\n	<option value=\'Linux\'>Linux</option>\r\n	<option value=\'MacOS\'>MacOS</option>\r\n</select>','','0','100','','','text','array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'Win2000/WinXP/Win2003\',\n  \'ispassword\' => \'0\',\n)','','','','0','1','0','1','0','1','1','0','14','0','0');
INSERT INTO `v9_model_field` VALUES('45','2','1','copytype','软件授权形式','','','0','15','','','box','array (\n  \'options\' => \'免费版|免费版\r\n共享版|共享版\r\n试用版|试用版\r\n演示版|演示版\r\n注册版|注册版\r\n破解版|破解版\r\n零售版|零售版\r\nOEM版|OEM版\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'免费版\',\n)','','','','0','1','0','1','0','1','0','0','12','0','0');
INSERT INTO `v9_model_field` VALUES('46','2','1','language','软件语言','','','0','16','','','box','array (\n  \'options\' => \'英文|英文\r\n简体中文|简体中文\r\n繁体中文|繁体中文\r\n简繁中文|简繁中文\r\n多国语言|多国语言\r\n其他语言|其他语言\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'简体中文\',\n)','','','','0','1','0','1','0','1','0','0','13','0','0');
INSERT INTO `v9_model_field` VALUES('47','2','1','classtype','软件类型','','','0','20','','','box','array (\n  \'options\' => \'国产软件|国产软件\r\n国外软件|国外软件\r\n汉化补丁|汉化补丁\r\n程序源码|程序源码\r\n其他|其他\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'国产软件\',\n)','','','','0','1','0','1','0','1','0','0','17','0','0');
INSERT INTO `v9_model_field` VALUES('48','2','1','version','版本号','','','0','20','','','text','array (\n  \'size\' => \'10\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)','','','','0','1','0','0','0','1','1','0','13','0','0');
INSERT INTO `v9_model_field` VALUES('49','2','1','filesize','文件大小','','','0','10','','','text','array (\n  \'size\' => \'10\',\n  \'defaultvalue\' => \'未知\',\n  \'ispassword\' => \'0\',\n)','','','','0','1','0','0','0','1','1','0','14','0','0');
INSERT INTO `v9_model_field` VALUES('50','2','1','stars','评分等级','','','0','20','','','box','array (\n  \'options\' => \'★☆☆☆☆|★☆☆☆☆\r\n★★☆☆☆|★★☆☆☆\r\n★★★☆☆|★★★☆☆\r\n★★★★☆|★★★★☆\r\n★★★★★|★★★★★\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'★★★☆☆\',\n)','','','','0','1','0','1','0','1','0','0','17','0','0');
INSERT INTO `v9_model_field` VALUES('51','3','1','allow_comment','允许评论','','','0','0','','','box','array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'0\',\n)','','','','0','0','0','0','0','0','0','0','54','0','0');
INSERT INTO `v9_model_field` VALUES('52','3','1','template','内容页模板','','','0','30','','','template','array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','53','0','0');
INSERT INTO `v9_model_field` VALUES('53','3','1','url','URL','','','0','100','','','text','','','','','1','1','0','1','0','0','0','0','50','0','0');
INSERT INTO `v9_model_field` VALUES('54','3','1','listorder','排序','','','0','6','','','number','','','','','1','1','0','1','0','0','0','0','51','0','0');
INSERT INTO `v9_model_field` VALUES('55','3','1','posids','推荐位','','','0','0','','','posid','array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)','','','','0','1','0','1','0','0','0','0','18','0','0');
INSERT INTO `v9_model_field` VALUES('56','3','1','groupids_view','阅读权限','','','0','0','','','groupid','array (\n  \'groupids\' => \'\',\n)','','','','0','0','0','1','0','0','0','0','19','0','0');
INSERT INTO `v9_model_field` VALUES('57','3','1','inputtime','发布时间','','','0','0','','','datetime','array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)','','','','0','1','0','0','0','0','0','1','17','0','0');
INSERT INTO `v9_model_field` VALUES('58','3','1','pages','分页方式','','','0','0','','','pages','','','-99','-99','0','0','0','1','0','0','0','0','16','0','0');
INSERT INTO `v9_model_field` VALUES('59','3','1','relation','相关组图','','','0','0','','','omnipotent','array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)','','2,6,4,5,1,17,18,7','','0','0','0','0','0','0','1','0','15','0','0');
INSERT INTO `v9_model_field` VALUES('60','3','1','thumb','缩略图','','','0','100','','','image','array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)','','','','0','1','0','0','0','1','0','1','14','0','0');
INSERT INTO `v9_model_field` VALUES('61','3','1','content','内容','<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>','','0','999999','','','editor','array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n  \'height\' => \'\',\n  \'disabled_page\' => \'1\',\n)','','','','0','0','0','1','0','1','1','0','13','0','0');
INSERT INTO `v9_model_field` VALUES('62','3','1','updatetime','更新时间','','','0','0','','','datetime','array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)','','','','1','1','0','1','0','0','0','0','12','0','0');
INSERT INTO `v9_model_field` VALUES('63','3','1','description','摘要','','','0','255','','','textarea','array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)','','','','0','1','0','1','0','1','1','1','10','0','0');
INSERT INTO `v9_model_field` VALUES('64','3','1','title','标题','','inputtitle','1','80','','请输入标题','title','','','','','0','1','0','1','1','1','1','1','4','0','0');
INSERT INTO `v9_model_field` VALUES('65','3','1','keywords','关键词','多关键词之间用空格或者“,”隔开','','0','40','','','keyword','array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)','','-99','-99','0','1','0','1','1','1','1','0','7','0','0');
INSERT INTO `v9_model_field` VALUES('66','3','1','typeid','类别','','','0','0','','','typeid','array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','','','0','1','0','1','1','1','0','0','2','0','0');
INSERT INTO `v9_model_field` VALUES('67','3','1','catid','栏目','','','1','6','/^[0-9]{1,6}$/','请选择栏目','catid','array (\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','1','0','1','1','1','0','0','1','0','0');
INSERT INTO `v9_model_field` VALUES('68','3','1','status','状态','','','0','2','','','box','','','','','1','1','0','1','0','0','0','0','55','0','0');
INSERT INTO `v9_model_field` VALUES('69','3','1','readpoint','阅读收费','','','0','5','','','readpoint','array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','55','0','0');
INSERT INTO `v9_model_field` VALUES('70','3','1','username','用户名','','','0','20','','','text','','','','','1','1','0','1','0','0','0','0','98','0','0');
INSERT INTO `v9_model_field` VALUES('71','3','1','pictureurls','组图','','','0','0','','','images','array (\n  \'upload_allowext\' => \'gif|jpg|jpeg|png|bmp\',\n  \'isselectimage\' => \'1\',\n  \'upload_number\' => \'50\',\n)','','','','0','0','0','1','0','1','0','0','15','0','0');
INSERT INTO `v9_model_field` VALUES('72','3','1','copyfrom','来源','','','0','0','','','copyfrom','array (\n  \'defaultvalue\' => \'\',\n)','','','','0','0','0','1','0','1','0','0','8','0','0');
INSERT INTO `v9_model_field` VALUES('73','1','1','islink','转向链接','','','0','0','','','islink','','','','','0','1','0','0','0','1','0','0','30','0','0');
INSERT INTO `v9_model_field` VALUES('74','2','1','islink','转向链接','','','0','0','','','islink','','','','','0','1','0','0','0','1','0','0','30','0','0');
INSERT INTO `v9_model_field` VALUES('75','3','1','islink','转向链接','','','0','0','','','islink','','','','','0','1','0','0','0','1','0','0','30','0','0');
INSERT INTO `v9_model_field` VALUES('83','10','1','birthday','生日','','','0','0','','生日格式错误','datetime','array (\n  \'fieldtype\' => \'date\',\n  \'format\' => \'Y-m-d\',\n  \'defaulttype\' => \'0\',\n)','','','','0','0','0','0','0','1','1','0','0','0','0');
INSERT INTO `v9_model_field` VALUES('84','11','1','catid','栏目','','','1','6','/^[0-9]{1,6}$/','请选择栏目','catid','array (\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','1','0','1','1','1','0','0','1','0','0');
INSERT INTO `v9_model_field` VALUES('85','11','1','typeid','类别','','','0','0','','','typeid','array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','','','0','1','0','1','1','1','0','0','2','0','0');
INSERT INTO `v9_model_field` VALUES('86','11','1','title','标题','','inputtitle','1','80','','请输入标题','title','array (\n)','','','','0','1','0','1','1','1','1','1','4','0','0');
INSERT INTO `v9_model_field` VALUES('87','11','1','keywords','关键词','多关键词之间用空格或者“,”隔开','','0','40','','','keyword','array (\n  \'size\' => \'100\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','1','0','1','1','1','1','0','7','0','0');
INSERT INTO `v9_model_field` VALUES('88','11','1','description','摘要','','','0','255','','','textarea','array (\n  \'width\' => \'98\',\n  \'height\' => \'46\',\n  \'defaultvalue\' => \'\',\n  \'enablehtml\' => \'0\',\n)','','','','0','1','0','1','0','1','1','1','10','0','0');
INSERT INTO `v9_model_field` VALUES('89','11','1','updatetime','更新时间','','','0','0','','','datetime','array (\n  \'dateformat\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'1\',\n  \'defaultvalue\' => \'\',\n)','','','','1','1','0','1','0','0','0','0','12','0','0');
INSERT INTO `v9_model_field` VALUES('90','11','1','content','内容','<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>','','0','999999','','内容不能为空','editor','array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n  \'height\' => \'\',\n  \'disabled_page\' => \'0\',\n)','','','','0','0','0','1','0','1','1','0','13','0','0');
INSERT INTO `v9_model_field` VALUES('91','11','1','thumb','缩略图','','','0','100','','','image','array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)','','','','0','1','0','0','0','1','0','1','14','0','0');
INSERT INTO `v9_model_field` VALUES('92','11','1','relation','相关文章','','','0','0','','','omnipotent','array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)','','2,6,4,5,1,17,18,7','','0','0','0','0','0','0','1','0','15','0','0');
INSERT INTO `v9_model_field` VALUES('93','11','1','pages','分页方式','','','0','0','','','pages','array (\n)','','-99','-99','0','0','0','1','0','0','0','0','16','0','0');
INSERT INTO `v9_model_field` VALUES('94','11','1','inputtime','发布时间','','','0','0','','','datetime','array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)','','','','0','1','0','0','0','0','0','1','17','0','0');
INSERT INTO `v9_model_field` VALUES('95','11','1','posids','推荐位','','','0','0','','','posid','array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)','','','','0','1','0','1','0','0','0','0','18','0','0');
INSERT INTO `v9_model_field` VALUES('96','11','1','groupids_view','阅读权限','','','0','100','','','groupid','array (\n  \'groupids\' => \'\',\n)','','','','0','0','0','1','0','0','0','0','19','0','0');
INSERT INTO `v9_model_field` VALUES('97','11','1','url','URL','','','0','100','','','text','array (\n)','','','','1','1','0','1','0','0','0','0','50','0','0');
INSERT INTO `v9_model_field` VALUES('98','11','1','listorder','排序','','','0','6','','','number','array (\n)','','','','1','1','0','1','0','0','0','0','51','0','0');
INSERT INTO `v9_model_field` VALUES('99','11','1','template','内容页模板','','','0','30','','','template','array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','53','0','0');
INSERT INTO `v9_model_field` VALUES('100','11','1','allow_comment','允许评论','','','0','0','','','box','array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'0\',\n)','','','','0','0','0','0','0','0','0','0','54','0','0');
INSERT INTO `v9_model_field` VALUES('101','11','1','status','状态','','','0','2','','','box','array (\n)','','','','1','1','0','1','0','0','0','0','55','0','0');
INSERT INTO `v9_model_field` VALUES('102','11','1','readpoint','阅读收费','','','0','5','','','readpoint','array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','55','0','0');
INSERT INTO `v9_model_field` VALUES('103','11','1','username','用户名','','','0','20','','','text','array (\n)','','','','1','1','0','1','0','0','0','0','98','0','0');
INSERT INTO `v9_model_field` VALUES('104','11','1','islink','转向链接','','','0','0','','','islink','array (\n)','','','','0','1','0','1','0','1','0','0','20','0','0');
INSERT INTO `v9_model_field` VALUES('105','11','1','video','视频上传','','','0','0','','','video','array (\n  \'upload_allowext\' => \'flv|rm|mp4|rmv\',\n)','','','','0','0','0','1','0','1','0','0','8','0','0');
INSERT INTO `v9_model_field` VALUES('106','11','1','vision','画质','','','0','0','','','box','array (\n  \'options\' => \'高清|1\r\n普通|2\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'0\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'1\',\n)','','','','0','1','0','1','0','1','0','0','9','0','0');
INSERT INTO `v9_model_field` VALUES('107','11','1','video_category','视频分类','','','0','0','','','box','array (\n  \'options\' => \'喜剧|1\r\n爱情|2\r\n科幻|3\r\n剧情|4\r\n动作|5\r\n伦理|6\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'1\',\n)','','','','0','1','0','1','0','1','0','0','9','0','0');

DROP TABLE IF EXISTS `v9_module`;
CREATE TABLE `v9_module` (
  `module` varchar(15) NOT NULL,
  `name` varchar(20) NOT NULL,
  `url` varchar(50) NOT NULL,
  `iscore` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `version` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL,
  `setting` mediumtext NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `installdate` date NOT NULL DEFAULT '0000-00-00',
  `updatedate` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `v9_module` VALUES('zl_admin','后台','','1','1.0','','array (\n  \'admin_email\' => \'847480548@qq.com\',\n  \'adminaccessip\' => \'0\',\n  \'maxloginfailedtimes\' => \'8\',\n  \'maxiplockedtime\' => \'15\',\n  \'minrefreshtime\' => \'2\',\n  \'mail_type\' => \'1\',\n  \'mail_server\' => \'smtp.qq.com\',\n  \'mail_port\' => \'25\',\n  \'mail_user\' => \'847480548@qq.com\',\n  \'mail_auth\' => \'1\',\n  \'mail_from\' => \'847480548@qq.com\',\n  \'mail_password\' => \'\',\n  \'errorlog_size\' => \'20\',\n)','0','0','2010-10-18','2010-10-18');
INSERT INTO `v9_module` VALUES('member','会员','','1','1.0','','array (\n  \'allowregister\' => \'1\',\n  \'choosemodel\' => \'1\',\n  \'enablemailcheck\' => \'0\',\n  \'registerverify\' => \'0\',\n  \'showapppoint\' => \'0\',\n  \'rmb_point_rate\' => \'10\',\n  \'defualtpoint\' => \'0\',\n  \'defualtamount\' => \'0\',\n  \'showregprotocol\' => \'0\',\n  \'regprotocol\' => \'		 欢迎您注册成为phpcms用户\r\n请仔细阅读下面的协议，只有接受协议才能继续进行注册。 \r\n1．服务条款的确认和接纳\r\n　　phpcms用户服务的所有权和运作权归phpcms拥有。phpcms所提供的服务将按照有关章程、服务条款和操作规则严格执行。用户通过注册程序点击“我同意” 按钮，即表示用户与phpcms达成协议并接受所有的服务条款。\r\n2． phpcms服务简介\r\n　　phpcms通过国际互联网为用户提供新闻及文章浏览、图片浏览、软件下载、网上留言和BBS论坛等服务。\r\n　　用户必须： \r\n　　1)购置设备，包括个人电脑一台、调制解调器一个及配备上网装置。 \r\n　　2)个人上网和支付与此服务有关的电话费用、网络费用。\r\n　　用户同意： \r\n　　1)提供及时、详尽及准确的个人资料。 \r\n　　2)不断更新注册资料，符合及时、详尽、准确的要求。所有原始键入的资料将引用为注册资料。 \r\n　　3)用户同意遵守《中华人民共和国保守国家秘密法》、《中华人民共和国计算机信息系统安全保护条例》、《计算机软件保护条例》等有关计算机及互联网规定的法律和法规、实施办法。在任何情况下，phpcms合理地认为用户的行为可能违反上述法律、法规，phpcms可以在任何时候，不经事先通知终止向该用户提供服务。用户应了解国际互联网的无国界性，应特别注意遵守当地所有有关的法律和法规。\r\n3． 服务条款的修改\r\n　　phpcms会不定时地修改服务条款，服务条款一旦发生变动，将会在相关页面上提示修改内容。如果您同意改动，则再一次点击“我同意”按钮。 如果您不接受，则及时取消您的用户使用服务资格。\r\n4． 服务修订\r\n　　phpcms保留随时修改或中断服务而不需知照用户的权利。phpcms行使修改或中断服务的权利，不需对用户或第三方负责。\r\n5． 用户隐私制度\r\n　　尊重用户个人隐私是phpcms的 基本政策。phpcms不会公开、编辑或透露用户的注册信息，除非有法律许可要求，或phpcms在诚信的基础上认为透露这些信息在以下三种情况是必要的： \r\n　　1)遵守有关法律规定，遵从合法服务程序。 \r\n　　2)保持维护phpcms的商标所有权。 \r\n　　3)在紧急情况下竭力维护用户个人和社会大众的隐私安全。 \r\n　　4)符合其他相关的要求。 \r\n6．用户的帐号，密码和安全性\r\n　　一旦注册成功成为phpcms用户，您将得到一个密码和帐号。如果您不保管好自己的帐号和密码安全，将对因此产生的后果负全部责任。另外，每个用户都要对其帐户中的所有活动和事件负全责。您可随时根据指示改变您的密码，也可以结束旧的帐户重开一个新帐户。用户同意若发现任何非法使用用户帐号或安全漏洞的情况，立即通知phpcms。\r\n7． 免责条款\r\n　　用户明确同意网站服务的使用由用户个人承担风险。 　　 \r\n　　phpcms不作任何类型的担保，不担保服务一定能满足用户的要求，也不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保。用户理解并接受：任何通过phpcms服务取得的信息资料的可靠性取决于用户自己，用户自己承担所有风险和责任。 \r\n8．有限责任\r\n　　phpcms对任何直接、间接、偶然、特殊及继起的损害不负责任。\r\n9． 不提供零售和商业性服务 \r\n　　用户使用网站服务的权利是个人的。用户只能是一个单独的个体而不能是一个公司或实体商业性组织。用户承诺不经phpcms同意，不能利用网站服务进行销售或其他商业用途。\r\n10．用户责任 \r\n　　用户单独承担传输内容的责任。用户必须遵循： \r\n　　1)从中国境内向外传输技术性资料时必须符合中国有关法规。 \r\n　　2)使用网站服务不作非法用途。 \r\n　　3)不干扰或混乱网络服务。 \r\n　　4)不在论坛BBS或留言簿发表任何与政治相关的信息。 \r\n　　5)遵守所有使用网站服务的网络协议、规定、程序和惯例。\r\n　　6)不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益。\r\n　　7)不得利用本站制作、复制和传播下列信息： \r\n　　　1、煽动抗拒、破坏宪法和法律、行政法规实施的；\r\n　　　2、煽动颠覆国家政权，推翻社会主义制度的；\r\n　　　3、煽动分裂国家、破坏国家统一的；\r\n　　　4、煽动民族仇恨、民族歧视，破坏民族团结的；\r\n　　　5、捏造或者歪曲事实，散布谣言，扰乱社会秩序的；\r\n　　　6、宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；\r\n　　　7、公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；\r\n　　　8、损害国家机关信誉的；\r\n　　　9、其他违反宪法和法律行政法规的；\r\n　　　10、进行商业广告行为的。\r\n　　用户不能传输任何教唆他人构成犯罪行为的资料；不能传输长国内不利条件和涉及国家安全的资料；不能传输任何不符合当地法规、国家法律和国际法 律的资料。未经许可而非法进入其它电脑系统是禁止的。若用户的行为不符合以上的条款，phpcms将取消用户服务帐号。\r\n11．网站内容的所有权\r\n　　phpcms定义的内容包括：文字、软件、声音、相片、录象、图表；在广告中全部内容；电子邮件的全部内容；phpcms为用户提供的商业信息。所有这些内容受版权、商标、标签和其它财产所有权法律的保护。所以，用户只能在phpcms和广告商授权下才能使用这些内容，而不能擅自复制、篡改这些内容、或创造与内容有关的派生产品。\r\n12．附加信息服务\r\n　　用户在享用phpcms提供的免费服务的同时，同意接受phpcms提供的各类附加信息服务。\r\n13．解释权\r\n　　本注册协议的解释权归phpcms所有。如果其中有任何条款与国家的有关法律相抵触，则以国家法律的明文规定为准。 \',\n  \'registerverifymessage\' => \' 欢迎您注册成为phpcms用户，您的账号需要邮箱认证，点击下面链接进行认证：{click}\r\n或者将网址复制到浏览器：{url}\',\n  \'forgetpassword\' => \' phpcms密码找回，请在一小时内点击下面链接进行操作：{click}\r\n或者将网址复制到浏览器：{url}\',\n)','0','0','2010-09-06','2010-09-06');
INSERT INTO `v9_module` VALUES('pay','支付','','1','1.0','','','0','0','2010-09-06','2010-09-06');
INSERT INTO `v9_module` VALUES('digg','顶一下','','0','1.0','','','0','0','2010-09-06','2010-09-06');
INSERT INTO `v9_module` VALUES('special','专题','','0','1.0','','','0','0','2010-09-06','2010-09-06');
INSERT INTO `v9_module` VALUES('content','内容模块','','1','1.0','','','0','0','2010-09-06','2010-09-06');
INSERT INTO `v9_module` VALUES('search','全站搜索','','0','1.0','','array (\n  \'fulltextenble\' => \'1\',\n  \'relationenble\' => \'1\',\n  \'suggestenable\' => \'1\',\n  \'sphinxenable\' => \'0\',\n  \'sphinxhost\' => \'10.228.134.102\',\n  \'sphinxport\' => \'9312\',\n)','0','0','2010-09-06','2010-09-06');
INSERT INTO `v9_module` VALUES('scan','木马扫描','scan','0','1.0','','','0','0','2010-09-01','2010-09-06');
INSERT INTO `v9_module` VALUES('attachment','附件','attachment','1','1.0','','','0','0','2010-09-01','2010-09-06');
INSERT INTO `v9_module` VALUES('block','碎片','','1','1.0','','','0','0','2010-09-01','2010-09-06');
INSERT INTO `v9_module` VALUES('collection','采集模块','collection','1','1.0','','','0','0','2010-09-01','2010-09-06');
INSERT INTO `v9_module` VALUES('dbsource','数据源','','1','','','','0','0','2010-09-01','2010-09-06');
INSERT INTO `v9_module` VALUES('template','模板风格','','1','1.0','','','0','0','2010-09-01','2010-09-06');
INSERT INTO `v9_module` VALUES('release','发布点','','1','1.0','','','0','0','2010-09-01','2010-09-06');
INSERT INTO `v9_module` VALUES('announce','公告','announce/','0','1.0','公告','','0','0','2015-02-02','2015-02-02');
INSERT INTO `v9_module` VALUES('comment','评论','comment/','0','1.0','评论','','0','0','2015-02-02','2015-02-02');
INSERT INTO `v9_module` VALUES('link','友情链接','','0','1.0','','array (\n  1 => \n  array (\n    \'is_post\' => \'1\',\n    \'enablecheckcode\' => \'0\',\n  ),\n)','0','0','2010-09-06','2010-09-06');
INSERT INTO `v9_module` VALUES('message','短消息','','0','1.0','','','0','0','2010-09-06','2010-09-06');
INSERT INTO `v9_module` VALUES('poster','广告模块','poster/','0','1.0','广告模块','','0','0','2015-02-02','2015-02-02');
INSERT INTO `v9_module` VALUES('formguide','表单向导','formguide/','0','1.0','formguide','array (\n  \'allowmultisubmit\' => \'1\',\n  \'interval\' => \'30\',\n  \'allowunreg\' => \'0\',\n  \'mailmessage\' => \'用户向我们提交了表单数据，赶快去看看吧。\',\n)','0','0','2010-10-20','2010-10-20');
INSERT INTO `v9_module` VALUES('tag','标签向导','tag/','0','1.0','标签向导','','0','0','2015-02-02','2015-02-02');

DROP TABLE IF EXISTS `v9_news`;
CREATE TABLE `v9_news` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` varchar(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `v9_news` VALUES('1','1','0','违法','','','地方','水电费','0','http://phpcms.local/index.php?m=content&c=index&a=show&catid=1&id=1','0','99','1','0','admin','1441338820','1441339391');

DROP TABLE IF EXISTS `v9_news_data`;
CREATE TABLE `v9_news_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` mediumtext NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `voteid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `copyfrom` varchar(100) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `v9_news_data` VALUES('1','是的','0','','0','10000','','0','','0','1','水电费|0');

DROP TABLE IF EXISTS `v9_page`;
CREATE TABLE `v9_page` (
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(160) NOT NULL,
  `style` varchar(24) NOT NULL,
  `keywords` varchar(40) NOT NULL,
  `content` text NOT NULL,
  `template` varchar(30) NOT NULL,
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_pay_account`;
CREATE TABLE `v9_pay_account` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `trade_sn` char(50) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `contactname` char(50) NOT NULL,
  `email` char(40) NOT NULL,
  `telephone` char(20) NOT NULL,
  `discount` float(8,2) NOT NULL DEFAULT '0.00',
  `money` char(8) NOT NULL,
  `quantity` int(8) unsigned NOT NULL DEFAULT '1',
  `addtime` int(10) NOT NULL DEFAULT '0',
  `paytime` int(10) NOT NULL DEFAULT '0',
  `usernote` char(255) NOT NULL,
  `pay_id` tinyint(3) NOT NULL,
  `pay_type` enum('offline','recharge','selfincome','online') NOT NULL DEFAULT 'recharge',
  `payment` char(90) NOT NULL,
  `type` tinyint(3) NOT NULL DEFAULT '1',
  `ip` char(15) NOT NULL DEFAULT '0.0.0.0',
  `status` enum('succ','failed','error','progress','timeout','cancel','waitting','unpay') NOT NULL DEFAULT 'unpay',
  `adminnote` char(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `userid` (`userid`),
  KEY `trade_sn` (`trade_sn`,`money`,`status`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_pay_payment`;
CREATE TABLE `v9_pay_payment` (
  `pay_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `pay_name` varchar(120) NOT NULL,
  `pay_code` varchar(20) NOT NULL,
  `pay_desc` text NOT NULL,
  `pay_method` tinyint(1) DEFAULT NULL,
  `pay_fee` varchar(10) NOT NULL,
  `config` text NOT NULL,
  `is_cod` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_online` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pay_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `author` varchar(100) NOT NULL,
  `website` varchar(100) NOT NULL,
  `version` varchar(20) NOT NULL,
  PRIMARY KEY (`pay_id`),
  KEY `pay_code` (`pay_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_pay_spend`;
CREATE TABLE `v9_pay_spend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creat_at` int(10) unsigned NOT NULL DEFAULT '0',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `logo` varchar(20) NOT NULL,
  `value` int(5) NOT NULL,
  `op_userid` int(10) unsigned NOT NULL DEFAULT '0',
  `op_username` char(20) NOT NULL,
  `msg` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `creat_at` (`creat_at`),
  KEY `logo` (`logo`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_picture`;
CREATE TABLE `v9_picture` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_picture_data`;
CREATE TABLE `v9_picture_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `pictureurls` mediumtext NOT NULL,
  `copyfrom` varchar(255) NOT NULL DEFAULT '',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_position`;
CREATE TABLE `v9_position` (
  `posid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `modelid` smallint(5) unsigned DEFAULT '0',
  `catid` smallint(5) unsigned DEFAULT '0',
  `name` char(30) NOT NULL DEFAULT '',
  `maxnum` smallint(5) NOT NULL DEFAULT '20',
  `extention` char(100) DEFAULT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `thumb` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`posid`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

INSERT INTO `v9_position` VALUES('1','0','0','首页焦点图推荐','20','','1','1','');
INSERT INTO `v9_position` VALUES('2','0','0','首页头条推荐','20','','4','1','');
INSERT INTO `v9_position` VALUES('13','82','0','栏目页焦点图','20','','0','1','');
INSERT INTO `v9_position` VALUES('5','69','0','推荐下载','20','','0','1','');
INSERT INTO `v9_position` VALUES('8','30','54','图片频道首页焦点图','20','','0','1','');
INSERT INTO `v9_position` VALUES('9','0','0','网站顶部推荐','20','','0','1','');
INSERT INTO `v9_position` VALUES('10','0','0','栏目首页推荐','20','','0','1','');
INSERT INTO `v9_position` VALUES('12','0','0','首页图片推荐','20','','0','1','');
INSERT INTO `v9_position` VALUES('14','0','0','视频首页焦点图','20','','0','1','');
INSERT INTO `v9_position` VALUES('15','0','0','视频首页头条推荐','20','','0','1','');
INSERT INTO `v9_position` VALUES('16','0','0','视频首页每日热点','20','','0','1','');
INSERT INTO `v9_position` VALUES('17','0','0','视频栏目精彩推荐','20','','0','1','');

DROP TABLE IF EXISTS `v9_position_data`;
CREATE TABLE `v9_position_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `posid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` char(20) DEFAULT NULL,
  `modelid` smallint(6) unsigned DEFAULT '0',
  `thumb` tinyint(1) NOT NULL DEFAULT '0',
  `data` mediumtext,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  `listorder` mediumint(8) DEFAULT '0',
  `expiration` int(10) NOT NULL,
  `extention` char(30) DEFAULT NULL,
  `synedit` tinyint(1) DEFAULT '0',
  KEY `posid` (`posid`),
  KEY `listorder` (`listorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_poster`;
CREATE TABLE `v9_poster` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(40) NOT NULL,
  `spaceid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `type` varchar(10) NOT NULL,
  `setting` text NOT NULL,
  `startdate` int(10) unsigned NOT NULL DEFAULT '0',
  `enddate` int(10) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `clicks` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `spaceid` (`spaceid`,`siteid`,`disabled`,`listorder`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

INSERT INTO `v9_poster` VALUES('1','1','banner','1','images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://phpcms.local/uploadfile/poster/2.png\',\n    \'alt\' => \'\',\n  ),\n)','1285813808','1446249600','1285813833','0','1','0','0');
INSERT INTO `v9_poster` VALUES('2','1','phpcmsv9','2','images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://phpcms.local/statics/images/v9/ad_login.jpg\',\n    \'alt\' => \'phpcms专业建站系统\',\n  ),\n)','1285816298','1446249600','1285816310','0','1','0','0');
INSERT INTO `v9_poster` VALUES('3','1','phpcms下载推荐','3','images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://phpcms.local/uploadfile/poster/3.png\',\n    \'alt\' => \'phpcms官方\',\n  ),\n)','1286504815','1446249600','1286504865','0','1','0','0');
INSERT INTO `v9_poster` VALUES('4','1','phpcms广告','4','images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://phpcms.local/uploadfile/poster/4.gif\',\n    \'alt\' => \'phpcms官方\',\n  ),\n)','1286505141','1446249600','1286505178','0','0','0','0');
INSERT INTO `v9_poster` VALUES('5','1','phpcms下载','5','images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://phpcms.local/uploadfile/poster/5.gif\',\n    \'alt\' => \'官方\',\n  ),\n)','1286509363','1446249600','1286509401','0','0','0','0');
INSERT INTO `v9_poster` VALUES('6','1','phpcms下载推荐1','6','images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://phpcms.local/uploadfile/poster/5.gif\',\n    \'alt\' => \'官方\',\n  ),\n)','1286510183','1446249600','1286510227','0','0','0','0');
INSERT INTO `v9_poster` VALUES('7','1','phpcms下载详情','7','images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://phpcms.local/uploadfile/poster/5.gif\',\n    \'alt\' => \'官方\',\n  ),\n)','1286510314','1446249600','1286510341','0','0','0','0');
INSERT INTO `v9_poster` VALUES('8','1','phpcms下载页','8','images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://phpcms.local/uploadfile/poster/1.jpg\',\n    \'alt\' => \'官方站\',\n  ),\n)','1286522084','1446249600','1286522125','0','0','0','0');
INSERT INTO `v9_poster` VALUES('9','1','phpcms v9广告','9','images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://phpcms.local/uploadfile/poster/4.gif\',\n    \'alt\' => \'\',\n  ),\n)','1287041759','1446249600','1287041804','0','0','0','0');
INSERT INTO `v9_poster` VALUES('10','1','phpcms','10','images','array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://phpcms.local/uploadfile/poster/6.jpg\',\n    \'alt\' => \'phpcms官方\',\n  ),\n)','1289270509','1446249600','1289270541','1','0','0','0');

DROP TABLE IF EXISTS `v9_poster_201501`;
CREATE TABLE `v9_poster_201501` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spaceid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `area` char(40) NOT NULL,
  `ip` char(15) NOT NULL,
  `referer` char(120) NOT NULL,
  `clicktime` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`,`type`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_poster_201502`;
CREATE TABLE `v9_poster_201502` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spaceid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `area` char(40) NOT NULL,
  `ip` char(15) NOT NULL,
  `referer` char(120) NOT NULL,
  `clicktime` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`,`type`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_poster_201503`;
CREATE TABLE `v9_poster_201503` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spaceid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `area` char(40) NOT NULL,
  `ip` char(15) NOT NULL,
  `referer` char(120) NOT NULL,
  `clicktime` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`,`type`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_poster_201509`;
CREATE TABLE `v9_poster_201509` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spaceid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `area` char(40) NOT NULL,
  `ip` char(15) NOT NULL,
  `referer` char(120) NOT NULL,
  `clicktime` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`,`type`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_poster_space`;
CREATE TABLE `v9_poster_space` (
  `spaceid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` char(50) NOT NULL,
  `type` char(30) NOT NULL,
  `path` char(40) NOT NULL,
  `width` smallint(4) unsigned NOT NULL DEFAULT '0',
  `height` smallint(4) unsigned NOT NULL DEFAULT '0',
  `setting` char(100) NOT NULL,
  `description` char(100) NOT NULL,
  `items` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`spaceid`),
  KEY `disabled` (`disabled`,`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

INSERT INTO `v9_poster_space` VALUES('1','1','顶部搜索右侧广告位','banner','poster_js/1.js','430','63','array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','','1','0');
INSERT INTO `v9_poster_space` VALUES('2','1','会员登陆页广告','banner','poster_js/2.js','310','304','array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','会员登陆页广告右侧代替外部通行证广告','1','0');
INSERT INTO `v9_poster_space` VALUES('3','1','图片频道图片排行下方','banner','poster_js/3.js','249','87','array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','','1','0');
INSERT INTO `v9_poster_space` VALUES('4','1','新闻中心推荐链接左侧','banner','poster_js/4.js','748','91','array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','','1','0');
INSERT INTO `v9_poster_space` VALUES('5','1','下载列表页右侧顶部','banner','poster_js/5.js','248','162','array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','','1','0');
INSERT INTO `v9_poster_space` VALUES('6','1','下载详情页右侧顶部','banner','poster_js/6.js','248','162','array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','','1','0');
INSERT INTO `v9_poster_space` VALUES('7','1','下载详情页右侧下部','banner','poster_js/7.js','248','162','array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','','1','0');
INSERT INTO `v9_poster_space` VALUES('8','1','下载频道首页','banner','poster_js/8.js','698','80','array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','','1','0');
INSERT INTO `v9_poster_space` VALUES('9','1','下载详情页地址列表右侧','banner','poster_js/12.js','330','50','array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','','1','0');
INSERT INTO `v9_poster_space` VALUES('10','1','首页关注下方广告','banner','poster_js/10.js','307','60','array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)','','1','0');

DROP TABLE IF EXISTS `v9_product_cat`;
CREATE TABLE `v9_product_cat` (
  `cat_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '栏目id',
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '所属栏目',
  `cat_original_name` varchar(100) DEFAULT '' COMMENT '文件原始名称',
  `cat_news_name` varchar(100) DEFAULT '' COMMENT '文件名称',
  `product_serial` varchar(100) DEFAULT '' COMMENT '产品型号',
  `description` varchar(100) DEFAULT '' COMMENT '文件简要',
  `is_product` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '进货产品价格',
  `original_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '进货产品价格',
  `sell_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '销售价格',
  `product_live` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有货',
  `is_important` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐',
  PRIMARY KEY (`cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=313 DEFAULT CHARSET=utf8;

INSERT INTO `v9_product_cat` VALUES('1','0','nb574','','','','0','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('2','1','nb 574','','','','0','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('3','2','nb 574 巴西风情撞色 36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('4','2','nb 574 蓝巨人40-44-----','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('5','2','nb574阿尔卑斯系列女鞋 淡灰色35-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('6','2','nb574黑玫瑰36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('7','1','nb574阿尔卑斯系列女鞋 粉红色35-39----','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('8','1','nb574阿尔卑斯系列女鞋 蓝绿色35-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('9','1','nb574阿尔卑斯系列女鞋 紫红色35-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('10','1','nb574豹纹女鞋纯黑色36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('11','1','nb574豹纹女鞋纯红色36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('12','1','nb574豹纹女鞋纯紫色36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('13','1','nb574纯色男鞋黑色40-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('14','1','nb574纯色男鞋红色40-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('15','1','nb574纯色男鞋蓝色40-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('16','1','nb574纯色男鞋紫色40-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('17','1','nb574猪八革情侣鞋海军蓝35-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('18','1','nb574猪八革情侣鞋黑色35-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('19','1','nb574猪八革情侣鞋酒红色35-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('20','1','nb574猪八革情侣鞋咖啡色35-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('21','1','nb574猪八革情侣鞋米黄色35-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('22','1','变形金刚、蜘蛛侠、美国队长','','','','0','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('23','22','nb 574 变形金刚 大黄蜂 36-44 猪八革','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('24','22','nb 574 变形金刚 御天敌 36-44 猪八革','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('25','22','nb 574 雷神 36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('26','22','nb 574 美国队长 36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('27','22','nb 574 美国队长2代 灰黑 40-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('28','22','nb 574 美国队长2代 蓝红 40-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('29','22','nb 574 蜘蛛侠 36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('30','22','nb574 变形金刚 霸天虎 36-44 猪八革','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('31','1','常春藤系列','','','','0','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('32','31','nb 574 常春藤 暗碧蓝 36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('33','31','nb 574 常春藤 暗淡绿 36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('34','31','nb 574 常春藤 红蔷薇 36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('35','31','nb 574 常春藤 空蒙蓝 36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('36','31','nb 574 常春藤 青瓜绿 40-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('37','31','nb 574 常春藤 细钢银 36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('38','1','动漫系列、萤火虫系列','','','','0','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('39','38','nb 574 萤火虫系列 灰色 36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('40','38','nb 574 萤火虫系列 桔红色 36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('41','38','nb 574 萤火虫系列 蓝色 36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('42','38','nb 574 萤火虫系列 荧光绿 36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('43','38','nb574动漫海贼王路飞款36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('44','38','nb574动漫海贼王索隆卓洛款40-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('45','38','nb574动漫机器猫哆啦a梦款36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('46','38','nb574海贼王乔巴款36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('47','1','帆船系列','','','','0','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('48','47','nb 574 帆船系列 深蓝色 36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('49','47','nb 574 帆船系列 尾牙绿 36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('50','47','nb 574 帆船系列 仙人紫 36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('51','47','nb 574 帆船系列 校园紫 36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('52','47','nb574 帆船系列 红白 36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('53','47','nb574 帆船系列 亮绿红 36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('54','47','nb574 帆船系列 钴深蓝 36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('55','1','红绿灯系列、复古跑步鞋','','','','0','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('56','55','nb 574 复古跑步鞋 笔水蓝 36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('57','55','nb 574 复古跑步鞋 黄白 36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('58','55','nb 574 复古跑步鞋 乌沙红 36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('59','55','nb 574 红绿灯系列 红色 36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('60','55','nb 574 红绿灯系列 黄色 36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('61','55','nb 574 红绿灯系列 绿色 36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('62','1','护照系列','','','','0','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('63','62','nb 574 护照系列 宝蓝色白色 36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('64','62','nb 574 护照系列 宝兰黄 36--44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('65','62','nb 574 护照系列 粉红绿白黄 36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('66','62','nb 574 护照系列 灰兰红 36--44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('67','62','nb 574 护照系列 酒红黄 36--44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('68','62','nb 574 护照系列 浅紫色白色 36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('69','62','nb 574 护照系列 深兰红 36--44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('70','1','渐变系列、御风者系列','','','','0','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('71','70','nb 574 渐变系列 海水蓝 36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('72','70','nb 574 渐变系列 红色 36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('73','70','nb 574 渐变系列 日落黄 36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('74','70','nb 574 渐变系列 森林绿 36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('75','70','nb 574 御风者系列 黑玉紫 36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('76','70','nb 574 御风者系列 丽桃红黑 36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('77','70','nb 574 御风者系列 浅黄 36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('78','70','nb 574 御风者系列 仙人紫 36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('79','70','nb 574 御风者系列 橡果蓝 原子蓝 36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('80','1','糖果系列、夏威夷系列','','','','0','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('81','80','nb 574 糖果系列 粉月色 36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('82','80','nb 574 糖果系列 黑莓紫 36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('83','80','nb 574 糖果系列 焦炭灰 36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('84','80','nb 574 糖果系列 钴深蓝 36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('85','80','nb 574 夏威夷系列 黑水蓝 40-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('86','80','nb 574 夏威夷系列 黄橙色 40-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('87','80','nb 574 夏威夷系列 浅绿黄 40-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('88','1','五环系列、三原色','','','','0','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('89','88','nb 三原色系列 暗酒红 36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('90','88','nb 三原色系列 海军蓝 36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('91','88','nb 三原色系列 经典灰 36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('92','88','nb 五环系列 黑白 36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('93','88','nb 五环系列 红白 36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('94','88','nb 五环系列 蓝白 36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('95','1','小蛮腰系列、马尔代夫系列','','','','0','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('96','95','nb 574 马尔代夫系列 灰紫 36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('97','95','nb 574 马尔代夫系列 绿色 36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('98','95','nb 574 马尔代夫系列 天蓝绿 36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('99','95','nb 574 小蛮腰系列 红黄青蓝 36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('100','95','nb 574 小蛮腰系列 黄粉深蓝 36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('101','95','nb 574 小蛮腰系列 绿粉红 36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('102','0','nb990','','','','0','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('103','102','nb990 丛林绿 36-45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('104','102','nb990 黑 36-45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('105','102','nb990 酒红 36-45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('106','102','nb990 玫瑰红 36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('107','102','nb990 深蓝 36-45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('108','102','nb990 元祖灰 36-45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('109','102','nb990 中国兰 36-45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('110','102','nb990藏青色36-45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('111','0','nb996','','','','0','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('112','111','nb996宝兰色36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('113','111','nb996草绿色36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('114','111','nb996黑红36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('115','111','nb996灰深蓝35-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('116','111','nb996浆果蓝色36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('117','111','nb996桔色黑35-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('118','111','nb996酒红金色36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('119','111','nb996军绿深灰35-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('120','111','nb996咖啡色36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('121','111','nb996普罗旺斯浅灰色36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('122','111','nb996深红色藏青35-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('123','111','nb996余文乐黑色男鞋','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('124','111','nb996余文乐红色男鞋','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('125','111','nb996余文乐黄色男鞋','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('126','111','nb996余文乐兰色男鞋','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('127','111','nb996余文乐冷色男鞋','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('128','111','nb996余文乐深灰色男鞋','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('129','111','nb996中邦酒红深蓝36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('130','111','nb996中邦卡其色36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('131','111','nb996中邦亮黄36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('132','111','nb996中邦墨绿36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('133','111','nb996猪八革黑熊猫36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('134','111','nb996猪八革蓝灰金色36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('135','111','nb996猪八革蓝棕色36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('136','111','nb996紫罗兰36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('137','0','nb999','','','','0','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('138','137','nb999白红36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('139','137','nb999彩蓝橙40-45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('140','137','nb999多种配色','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('141','137','nb999钢铁蓝40-45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('142','137','nb999军绿色40-45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('143','137','nb999蓝玉色女鞋36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('144','137','nb999米黑粉女鞋36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('145','137','nb999男女鞋灰橘蓝36-45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('146','137','nb999青绿白40-45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('147','137','nb999猪八革kith concepts x 限量男女鞋 36-45','','','','0','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('148','147','新建文件夹','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('149','137','nb999猪八革黑红经典配色36-45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('150','137','nb999猪八革黑灰蓝40-45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('151','137','nb999猪八革红白黑40-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('152','137','nb999猪八革红玉色36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('153','137','nb999猪八革金黄色40-45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('154','137','nb999猪八革酒红,黑36-45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('155','137','nb999猪八革浅灰,蓝40-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('156','137','nb999猪八革深灰红40-45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('157','137','nb999猪八革樱花系列米白,薄荷绿,浅灰36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('158','137','nb999猪八革樱花系列米白,桔黄,浅灰36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('159','137','nb999猪八革翡翠绿36-45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('160','0','nb_996_girl','','','','0','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('161','160','nb 996系列 女鞋 白粉紫36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('162','160','nb 996系列 女鞋 白桃红36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('163','160','nb 996系列 女鞋 粉色紫色白色36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('164','160','nb 996系列 女鞋 黄生绿36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('165','160','nb 996系列 女鞋 绿棕36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('166','160','nb 996系列 女鞋 梅红紫36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('167','160','nb 996系列 女鞋 美国国旗(红白黑)36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('168','160','nb 996系列 女鞋 美国国旗(兰红白)36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('169','160','nb 996系列 女鞋 桃花36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('170','0','nike_agan','','','','0','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('171','170','耐克nike阿甘白红校园36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('172','170','耐克nike阿甘白灰黑36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('173','170','耐克nike阿甘薄荷绿亮红36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('174','170','耐克nike阿甘冰蓝荧光绿36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('175','170','耐克nike阿甘橙白36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('176','170','耐克nike阿甘飞翔蓝40-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('177','170','耐克nike阿甘粉白36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('178','170','耐克nike阿甘粉红36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('179','170','耐克nike阿甘黑白36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('180','170','耐克nike阿甘黑白绿40-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('181','170','耐克nike阿甘黑白幸运红40-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('182','170','耐克nike阿甘黑红36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('183','170','耐克nike阿甘红白36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('184','170','耐克nike阿甘红白兰36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('185','170','耐克nike阿甘红宝兰36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('186','170','耐克nike阿甘黄黑36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('187','170','耐克nike阿甘灰紫 40-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('188','170','耐克nike阿甘活力蓝36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('189','170','耐克nike阿甘蓝白橘36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('190','170','耐克nike阿甘蓝黑40-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('191','170','耐克nike阿甘蓝黑桔40-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('192','170','耐克nike阿甘浅黄36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('193','170','耐克nike阿甘浅兰白36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('194','170','耐克nike阿甘青白36--44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('195','170','耐克nike阿甘青绿白40-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('196','170','耐克nike阿甘深兰白40-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('197','170','耐克nike阿甘深兰粉36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('198','170','耐克nike阿甘深兰黑40-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('199','170','耐克nike阿甘深兰桔36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('200','170','耐克nike阿甘天蓝蓝36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('201','170','耐克nike阿甘峡谷绿40-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('202','170','耐克nike阿甘新红白36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('203','170','耐克nike阿甘荧光绿桃红36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('204','170','耐克nike阿甘宇宙红36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('205','170','耐克nike阿甘玉黄36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('206','170','耐克nike阿甘紫红 36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('207','170','耐克nike阿甘紫月36-44','','','','0','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('208','207','新建文件夹','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('209','0','nike_air_jordan_1','','','','0','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('210','209','耐克air jordan 1 白黑红40--45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('211','209','耐克air jordan 1 黑红40--45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('212','209','耐克air jordan 1 黑蓝40--45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('213','209','耐克air jordan 1 红黑40--45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('214','0','nike_air_jordan_4','','','','0','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('215','214','耐克air jordan 4代 奥利奥--男女鞋36-45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('216','214','耐克air jordan 4代 白黑红 男女鞋36-45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('217','214','耐克air jordan 4代 白灰点 男女鞋 36-45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('218','214','耐克air jordan 4代 白蓝 女鞋36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('219','214','耐克air jordan 4代 白兰 36-45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('220','214','耐克air jordan 4代 公牛大红 男女鞋 36-45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('221','214','耐克air jordan 4代 黑红 男女鞋36-45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('222','214','耐克air jordan 4代 黑红橘蓝 骑士男女款36-45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('223','214','耐克air jordan 4代 黑黄 男女鞋36-45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('224','214','耐克air jordan 4代 灰绿 男女鞋36-45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('225','214','耐克air jordan 4代 孔雀蓝 男女鞋36-45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('226','214','耐克air jordan 4代 南海岸 女鞋36-40','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('227','214','耐克air jordan 4代 女鞋 桃红黑 36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('228','214','耐克air jordan 4代 皮面黑绿女鞋36-40','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('229','214','耐克air jordan 4代 全黑 男鞋40-45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('230','0','nike_air_jordan_5','','','','0','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('231','230','耐克air jordan 5代 奥利奥36-45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('232','230','耐克air jordan 5代 白黑红火焰红36-46','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('233','230','耐克air jordan 5代 白紫葡萄36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('234','230','耐克air jordan 5代 黑粉 36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('235','230','耐克air jordan 5代 黑红爆裂纹 41-46','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('236','230','耐克air jordan 5代 黑蓝桔女鞋36-40','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('237','230','耐克air jordan 5代 黑桃红皮面 36-45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('238','230','耐克air jordan 5代 黑银36-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('239','230','耐克air jordan 5代 黑紫葡萄 36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('240','230','耐克air jordan 5代 女鞋 紫葡萄36-40','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('241','230','耐克air jordan 5代 深绿皮面41-46','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('242','230','耐克air jordan 5代 限量版 爆裂纹 40-46','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('243','230','耐克air jordan 5代 限量版 红爆裂纹40-46','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('244','230','耐克air jordan 5代 鸳鸯男女鞋36-46','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('245','0','nike_feixian','','','','0','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('246','245','耐克nike飞线彩虹全气垫黑粉红紫36-40','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('247','245','耐克nike飞线彩虹全气垫黑桔红荧光绿40-46','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('248','245','耐克nike飞线彩虹全气垫黑月黄40-46','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('249','245','耐克nike飞线彩虹全气垫黑紫月36-40','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('250','245','耐克nike飞线彩虹全气垫灰玉绿40-46','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('251','245','耐克nike飞线彩虹全气垫灰紫玉40-46','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('252','245','耐克nike飞线彩虹全气垫孔雀兰桔红40-46','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('253','245','耐克nike飞线彩虹全气垫紫桔红36-40','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('254','0','nike_maopi_shoe','','','','0','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('255','254','耐克nike反毛皮板鞋白太阳红39-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('256','254','耐克nike反毛皮板鞋冰蓝白39-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('257','254','耐克nike反毛皮板鞋黑玫红39-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('258','254','耐克nike反毛皮板鞋煤黑蓝39-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('259','254','耐克nike反毛皮板鞋米灰蓝39-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('260','254','耐克nike反毛皮板鞋日出红39-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('261','254','耐克nike反毛皮板鞋深灰桔红39-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('262','254','耐克nike皮面板鞋煤黑39-44','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('263','0','nike_max90','','','','0','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('264','263','nike耐克max90滴塑不断货宝蓝月40-45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('265','263','nike耐克max90滴塑不断货黑白40-45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('266','263','nike耐克max90滴塑不断货黑宝蓝40-45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('267','263','nike耐克max90滴塑不断货黑梅红36-40','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('268','263','nike耐克max90滴塑不断货梅红荧光绿36-40','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('269','263','nike耐克max90滴塑不断货深灰黄40-45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('270','263','nike耐克max90滴塑不断货深蓝吉红40-45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('271','263','nike耐克max90滴塑不断货五环色40-45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('272','263','nike耐克max90滴塑不断货月桃红36-40','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('273','263','nike耐克max90滴塑不断货紫月36-40','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('274','263','多配色','','','','0','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('275','274','nike耐克max90多种款式1','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('276','274','nike耐克max90多种款式2','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('277','274','nike耐克max90多种款式3','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('278','274','nike耐克max90多种款式4','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('279','274','nike耐克max90多种款式5','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('280','274','nike耐克max90多种款式6','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('281','0','nike_run_Shoe','','','','0','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('282','281','nike耐克气垫跑步鞋 白粉色36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('283','281','nike耐克气垫跑步鞋 白紫,宝蓝36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('284','281','nike耐克气垫跑步鞋 宝蓝,电黄,苹果绿40-45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('285','281','nike耐克气垫跑步鞋 电黄,黑36-45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('286','281','nike耐克气垫跑步鞋 黑,荧光绿40-45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('287','281','nike耐克气垫跑步鞋 黑,月40-45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('288','281','nike耐克气垫跑步鞋 黑灰,36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('289','281','nike耐克气垫跑步鞋 黑水蓝绿36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('290','281','nike耐克气垫跑步鞋 黑桃红36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('291','281','nike耐克气垫跑步鞋 黑橘黄36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('292','281','nike耐克气垫跑步鞋 孔雀蓝,黑40-45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('293','281','nike耐克气垫跑步鞋 浅蓝,桔红40-45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('294','281','nike耐克气垫跑步鞋 深灰,桔红,红40-45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('295','281','nike耐克气垫跑步鞋 深灰,桃红36-39','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('296','281','nike耐克气垫跑步鞋 深蓝,红40-45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('297','281','nike耐克气垫跑步鞋 深蓝,月40-45','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('298','281','滴塑气垫','','','','0','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('299','298','nike耐克滴塑气垫跑步鞋宝蓝白36-45不断货','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('300','298','nike耐克滴塑气垫跑步鞋黑白40-45不断货','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('301','298','nike耐克滴塑气垫跑步鞋黑兰40-45不断货','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('302','298','nike耐克滴塑气垫跑步鞋灰白40-45不断货','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('303','298','nike耐克滴塑气垫跑步鞋蓝黑36-45不断货','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('304','298','nike耐克滴塑气垫跑步鞋迷彩军绿40-45不断货','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('305','298','nike耐克滴塑气垫跑步鞋迷彩绿咖啡40-45不断货','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('306','298','nike耐克滴塑气垫跑步鞋迷彩墨绿卡其黑40-45不断货','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('307','298','nike耐克滴塑气垫跑步鞋深兰吉红40-45不断货','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('308','298','nike耐克滴塑气垫跑步鞋桃红黄36-40不断货','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('309','298','nike耐克滴塑气垫跑步鞋紫玉36-40不断货','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('310','298','nike耐克滴塑气垫跑步鞋炫彩宝兰40-45不断货','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('311','298','nike耐克滴塑气垫跑步鞋炫彩桔红40-45不断货','','','','1','0.00','0.00','0','0');
INSERT INTO `v9_product_cat` VALUES('312','298','nike耐克滴塑气垫跑步鞋炫彩深兰大红40-45不断货','','','','1','0.00','0.00','0','0');

DROP TABLE IF EXISTS `v9_product_pic`;
CREATE TABLE `v9_product_pic` (
  `pic_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'pic_id',
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '所属栏目',
  `original_name` varchar(100) DEFAULT '' COMMENT '图片原始名称',
  `news_name` varchar(100) DEFAULT '' COMMENT '图片名称',
  `description` varchar(100) DEFAULT '' COMMENT '图片名称',
  `img_path` varchar(100) DEFAULT '' COMMENT '图片名称',
  `img_live` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '图片名称',
  `is_thumb` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否封面',
  PRIMARY KEY (`pic_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1990 DEFAULT CHARSET=utf8;

INSERT INTO `v9_product_pic` VALUES('1','3','36-44 (10).jpeg','','','/product/nb574/nb 574/nb 574 巴西风情撞色 36-44/36-44 (10).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('2','3','36-44 (11).jpeg','','','/product/nb574/nb 574/nb 574 巴西风情撞色 36-44/36-44 (11).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('3','3','36-44 (12).jpeg','','','/product/nb574/nb 574/nb 574 巴西风情撞色 36-44/36-44 (12).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('4','3','36-44 (13).jpeg','','','/product/nb574/nb 574/nb 574 巴西风情撞色 36-44/36-44 (13).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('5','3','36-44 (14).jpeg','','','/product/nb574/nb 574/nb 574 巴西风情撞色 36-44/36-44 (14).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('6','3','36-44 (15).jpeg','','','/product/nb574/nb 574/nb 574 巴西风情撞色 36-44/36-44 (15).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('7','3','36-44 (16).jpeg','','','/product/nb574/nb 574/nb 574 巴西风情撞色 36-44/36-44 (16).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('8','3','36-44 (17).jpeg','','','/product/nb574/nb 574/nb 574 巴西风情撞色 36-44/36-44 (17).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('9','3','36-44 (18).jpeg','','','/product/nb574/nb 574/nb 574 巴西风情撞色 36-44/36-44 (18).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('10','3','36-44 (19).jpeg','','','/product/nb574/nb 574/nb 574 巴西风情撞色 36-44/36-44 (19).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('11','3','36-44 (2).jpeg','','','/product/nb574/nb 574/nb 574 巴西风情撞色 36-44/36-44 (2).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('12','3','36-44 (20).jpeg','','','/product/nb574/nb 574/nb 574 巴西风情撞色 36-44/36-44 (20).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('13','3','36-44 (21).jpeg','','','/product/nb574/nb 574/nb 574 巴西风情撞色 36-44/36-44 (21).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('14','3','36-44 (22).jpeg','','','/product/nb574/nb 574/nb 574 巴西风情撞色 36-44/36-44 (22).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('15','3','36-44 (23).jpeg','','','/product/nb574/nb 574/nb 574 巴西风情撞色 36-44/36-44 (23).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('16','3','36-44 (24).jpeg','','','/product/nb574/nb 574/nb 574 巴西风情撞色 36-44/36-44 (24).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('17','3','36-44 (25).jpeg','','','/product/nb574/nb 574/nb 574 巴西风情撞色 36-44/36-44 (25).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('18','3','36-44 (26).jpeg','','','/product/nb574/nb 574/nb 574 巴西风情撞色 36-44/36-44 (26).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('19','3','36-44 (27).jpeg','','','/product/nb574/nb 574/nb 574 巴西风情撞色 36-44/36-44 (27).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('20','3','36-44 (28).jpeg','','','/product/nb574/nb 574/nb 574 巴西风情撞色 36-44/36-44 (28).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('21','3','36-44 (29).jpeg','','','/product/nb574/nb 574/nb 574 巴西风情撞色 36-44/36-44 (29).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('22','3','36-44 (3).jpeg','','','/product/nb574/nb 574/nb 574 巴西风情撞色 36-44/36-44 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('23','3','36-44 (30).jpeg','','','/product/nb574/nb 574/nb 574 巴西风情撞色 36-44/36-44 (30).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('24','3','36-44 (31).jpeg','','','/product/nb574/nb 574/nb 574 巴西风情撞色 36-44/36-44 (31).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('25','3','36-44 (32).jpeg','','','/product/nb574/nb 574/nb 574 巴西风情撞色 36-44/36-44 (32).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('26','3','36-44 (33).jpeg','','','/product/nb574/nb 574/nb 574 巴西风情撞色 36-44/36-44 (33).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('27','3','36-44 (34).jpeg','','','/product/nb574/nb 574/nb 574 巴西风情撞色 36-44/36-44 (34).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('28','3','36-44 (35).jpeg','','','/product/nb574/nb 574/nb 574 巴西风情撞色 36-44/36-44 (35).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('29','3','36-44 (4).jpeg','','','/product/nb574/nb 574/nb 574 巴西风情撞色 36-44/36-44 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('30','3','36-44 (5).jpeg','','','/product/nb574/nb 574/nb 574 巴西风情撞色 36-44/36-44 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('31','3','36-44 (6).jpeg','','','/product/nb574/nb 574/nb 574 巴西风情撞色 36-44/36-44 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('32','3','36-44 (7).jpeg','','','/product/nb574/nb 574/nb 574 巴西风情撞色 36-44/36-44 (7).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('33','3','36-44 (8).jpeg','','','/product/nb574/nb 574/nb 574 巴西风情撞色 36-44/36-44 (8).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('34','3','36-44 (9).jpeg','','','/product/nb574/nb 574/nb 574 巴西风情撞色 36-44/36-44 (9).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('35','3','36-44.jpeg','','','/product/nb574/nb 574/nb 574 巴西风情撞色 36-44/36-44.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('36','4','蓝巨人 40-44 (2).jpeg','','','/product/nb574/nb 574/nb 574 蓝巨人40-44-----/蓝巨人 40-44 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('37','4','蓝巨人 40-44 (3).jpeg','','','/product/nb574/nb 574/nb 574 蓝巨人40-44-----/蓝巨人 40-44 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('38','4','蓝巨人 40-44 (4).jpeg','','','/product/nb574/nb 574/nb 574 蓝巨人40-44-----/蓝巨人 40-44 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('39','4','蓝巨人 40-44 (5).jpeg','','','/product/nb574/nb 574/nb 574 蓝巨人40-44-----/蓝巨人 40-44 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('40','4','蓝巨人 40-44 (6).jpeg','','','/product/nb574/nb 574/nb 574 蓝巨人40-44-----/蓝巨人 40-44 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('41','4','蓝巨人 40-44 (7).jpeg','','','/product/nb574/nb 574/nb 574 蓝巨人40-44-----/蓝巨人 40-44 (7).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('42','4','蓝巨人 40-44 (8).jpeg','','','/product/nb574/nb 574/nb 574 蓝巨人40-44-----/蓝巨人 40-44 (8).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('43','4','蓝巨人 40-44 (9).jpeg','','','/product/nb574/nb 574/nb 574 蓝巨人40-44-----/蓝巨人 40-44 (9).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('44','4','蓝巨人 40-44.jpeg','','','/product/nb574/nb 574/nb 574 蓝巨人40-44-----/蓝巨人 40-44.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('45','5','淡灰色35-39 (2).jpg','','','/product/nb574/nb 574/nb574阿尔卑斯系列女鞋 淡灰色35-39/淡灰色35-39 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('46','5','淡灰色35-39 (3).jpg','','','/product/nb574/nb 574/nb574阿尔卑斯系列女鞋 淡灰色35-39/淡灰色35-39 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('47','5','淡灰色35-39 (4).jpg','','','/product/nb574/nb 574/nb574阿尔卑斯系列女鞋 淡灰色35-39/淡灰色35-39 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('48','5','淡灰色35-39.jpg','','','/product/nb574/nb 574/nb574阿尔卑斯系列女鞋 淡灰色35-39/淡灰色35-39.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('49','6','黑玫瑰36-39 (2).jpg','','','/product/nb574/nb 574/nb574黑玫瑰36-39/黑玫瑰36-39 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('50','6','黑玫瑰36-39 (3).jpg','','','/product/nb574/nb 574/nb574黑玫瑰36-39/黑玫瑰36-39 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('51','6','黑玫瑰36-39 (4).jpg','','','/product/nb574/nb 574/nb574黑玫瑰36-39/黑玫瑰36-39 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('52','6','黑玫瑰36-39 (5).jpg','','','/product/nb574/nb 574/nb574黑玫瑰36-39/黑玫瑰36-39 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('53','6','黑玫瑰36-39 (6).jpg','','','/product/nb574/nb 574/nb574黑玫瑰36-39/黑玫瑰36-39 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('54','6','黑玫瑰36-39 (7).jpg','','','/product/nb574/nb 574/nb574黑玫瑰36-39/黑玫瑰36-39 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('55','6','黑玫瑰36-39.jpg','','','/product/nb574/nb 574/nb574黑玫瑰36-39/黑玫瑰36-39.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('56','7','粉红色35-39 (2).jpg','','','/product/nb574/nb574阿尔卑斯系列女鞋 粉红色35-39----/粉红色35-39 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('57','7','粉红色35-39 (3).jpg','','','/product/nb574/nb574阿尔卑斯系列女鞋 粉红色35-39----/粉红色35-39 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('58','7','粉红色35-39 (4).jpg','','','/product/nb574/nb574阿尔卑斯系列女鞋 粉红色35-39----/粉红色35-39 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('59','7','粉红色35-39.jpg','','','/product/nb574/nb574阿尔卑斯系列女鞋 粉红色35-39----/粉红色35-39.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('60','8','蓝绿色35-39 (2).jpg','','','/product/nb574/nb574阿尔卑斯系列女鞋 蓝绿色35-39/蓝绿色35-39 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('61','8','蓝绿色35-39 (3).jpg','','','/product/nb574/nb574阿尔卑斯系列女鞋 蓝绿色35-39/蓝绿色35-39 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('62','8','蓝绿色35-39 (4).jpg','','','/product/nb574/nb574阿尔卑斯系列女鞋 蓝绿色35-39/蓝绿色35-39 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('63','8','蓝绿色35-39.jpg','','','/product/nb574/nb574阿尔卑斯系列女鞋 蓝绿色35-39/蓝绿色35-39.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('64','9','紫红色35-39 (2).jpg','','','/product/nb574/nb574阿尔卑斯系列女鞋 紫红色35-39/紫红色35-39 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('65','9','紫红色35-39 (3).jpg','','','/product/nb574/nb574阿尔卑斯系列女鞋 紫红色35-39/紫红色35-39 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('66','9','紫红色35-39 (4).jpg','','','/product/nb574/nb574阿尔卑斯系列女鞋 紫红色35-39/紫红色35-39 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('67','9','紫红色35-39.jpg','','','/product/nb574/nb574阿尔卑斯系列女鞋 紫红色35-39/紫红色35-39.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('68','10','纯黑色36-39 (2).jpg','','','/product/nb574/nb574豹纹女鞋纯黑色36-39/纯黑色36-39 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('69','10','纯黑色36-39 (3).jpg','','','/product/nb574/nb574豹纹女鞋纯黑色36-39/纯黑色36-39 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('70','10','纯黑色36-39 (4).jpg','','','/product/nb574/nb574豹纹女鞋纯黑色36-39/纯黑色36-39 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('71','10','纯黑色36-39.jpg','','','/product/nb574/nb574豹纹女鞋纯黑色36-39/纯黑色36-39.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('72','11','纯红色36-39 (2).jpg','','','/product/nb574/nb574豹纹女鞋纯红色36-39/纯红色36-39 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('73','11','纯红色36-39 (3).jpg','','','/product/nb574/nb574豹纹女鞋纯红色36-39/纯红色36-39 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('74','11','纯红色36-39 (4).jpg','','','/product/nb574/nb574豹纹女鞋纯红色36-39/纯红色36-39 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('75','11','纯红色36-39.jpg','','','/product/nb574/nb574豹纹女鞋纯红色36-39/纯红色36-39.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('76','12','纯紫色36-39 (2).jpg','','','/product/nb574/nb574豹纹女鞋纯紫色36-39/纯紫色36-39 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('77','12','纯紫色36-39 (3).jpg','','','/product/nb574/nb574豹纹女鞋纯紫色36-39/纯紫色36-39 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('78','12','纯紫色36-39 (4).jpg','','','/product/nb574/nb574豹纹女鞋纯紫色36-39/纯紫色36-39 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('79','12','纯紫色36-39.jpg','','','/product/nb574/nb574豹纹女鞋纯紫色36-39/纯紫色36-39.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('80','13','黑色40-44 (2).jpg','','','/product/nb574/nb574纯色男鞋黑色40-44/黑色40-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('81','13','黑色40-44 (3).jpg','','','/product/nb574/nb574纯色男鞋黑色40-44/黑色40-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('82','13','黑色40-44 (4).jpg','','','/product/nb574/nb574纯色男鞋黑色40-44/黑色40-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('83','13','黑色40-44.jpg','','','/product/nb574/nb574纯色男鞋黑色40-44/黑色40-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('84','14','红色40-44 (2).jpg','','','/product/nb574/nb574纯色男鞋红色40-44/红色40-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('85','14','红色40-44 (3).jpg','','','/product/nb574/nb574纯色男鞋红色40-44/红色40-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('86','14','红色40-44 (4).jpg','','','/product/nb574/nb574纯色男鞋红色40-44/红色40-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('87','14','红色40-44.jpg','','','/product/nb574/nb574纯色男鞋红色40-44/红色40-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('88','15','蓝色40-44 (2).jpg','','','/product/nb574/nb574纯色男鞋蓝色40-44/蓝色40-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('89','15','蓝色40-44 (3).jpg','','','/product/nb574/nb574纯色男鞋蓝色40-44/蓝色40-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('90','15','蓝色40-44 (4).jpg','','','/product/nb574/nb574纯色男鞋蓝色40-44/蓝色40-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('91','15','蓝色40-44.jpg','','','/product/nb574/nb574纯色男鞋蓝色40-44/蓝色40-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('92','16','紫色40-44 (2).jpg','','','/product/nb574/nb574纯色男鞋紫色40-44/紫色40-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('93','16','紫色40-44 (3).jpg','','','/product/nb574/nb574纯色男鞋紫色40-44/紫色40-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('94','16','紫色40-44 (4).jpg','','','/product/nb574/nb574纯色男鞋紫色40-44/紫色40-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('95','16','紫色40-44.jpg','','','/product/nb574/nb574纯色男鞋紫色40-44/紫色40-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('96','17','海军蓝35-44 (2).jpg','','','/product/nb574/nb574猪八革情侣鞋海军蓝35-44/海军蓝35-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('97','17','海军蓝35-44 (3).jpg','','','/product/nb574/nb574猪八革情侣鞋海军蓝35-44/海军蓝35-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('98','17','海军蓝35-44 (4).jpg','','','/product/nb574/nb574猪八革情侣鞋海军蓝35-44/海军蓝35-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('99','17','海军蓝35-44 (5).jpg','','','/product/nb574/nb574猪八革情侣鞋海军蓝35-44/海军蓝35-44 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('100','17','海军蓝35-44.jpg','','','/product/nb574/nb574猪八革情侣鞋海军蓝35-44/海军蓝35-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('101','18','黑色35-44 (2).jpg','','','/product/nb574/nb574猪八革情侣鞋黑色35-44/黑色35-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('102','18','黑色35-44 (3).jpg','','','/product/nb574/nb574猪八革情侣鞋黑色35-44/黑色35-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('103','18','黑色35-44 (4).jpg','','','/product/nb574/nb574猪八革情侣鞋黑色35-44/黑色35-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('104','18','黑色35-44.jpg','','','/product/nb574/nb574猪八革情侣鞋黑色35-44/黑色35-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('105','19','酒红色35-44 (2).jpg','','','/product/nb574/nb574猪八革情侣鞋酒红色35-44/酒红色35-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('106','19','酒红色35-44 (3).jpg','','','/product/nb574/nb574猪八革情侣鞋酒红色35-44/酒红色35-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('107','19','酒红色35-44 (4).jpg','','','/product/nb574/nb574猪八革情侣鞋酒红色35-44/酒红色35-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('108','19','酒红色35-44 (5).jpg','','','/product/nb574/nb574猪八革情侣鞋酒红色35-44/酒红色35-44 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('109','19','酒红色35-44.jpg','','','/product/nb574/nb574猪八革情侣鞋酒红色35-44/酒红色35-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('110','20','咖啡色35-44 (2).jpg','','','/product/nb574/nb574猪八革情侣鞋咖啡色35-44/咖啡色35-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('111','20','咖啡色35-44 (3).jpg','','','/product/nb574/nb574猪八革情侣鞋咖啡色35-44/咖啡色35-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('112','20','咖啡色35-44 (4).jpg','','','/product/nb574/nb574猪八革情侣鞋咖啡色35-44/咖啡色35-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('113','20','咖啡色35-44 (5).jpg','','','/product/nb574/nb574猪八革情侣鞋咖啡色35-44/咖啡色35-44 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('114','20','咖啡色35-44.jpg','','','/product/nb574/nb574猪八革情侣鞋咖啡色35-44/咖啡色35-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('115','21','米黄色35-44 (2).jpg','','','/product/nb574/nb574猪八革情侣鞋米黄色35-44/米黄色35-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('116','21','米黄色35-44 (3).jpg','','','/product/nb574/nb574猪八革情侣鞋米黄色35-44/米黄色35-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('117','21','米黄色35-44 (4).jpg','','','/product/nb574/nb574猪八革情侣鞋米黄色35-44/米黄色35-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('118','21','米黄色35-44 (5).jpg','','','/product/nb574/nb574猪八革情侣鞋米黄色35-44/米黄色35-44 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('119','21','米黄色35-44.jpg','','','/product/nb574/nb574猪八革情侣鞋米黄色35-44/米黄色35-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('120','23','大黄蜂 36-44 (10).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 变形金刚 大黄蜂 36-44 猪八革/大黄蜂 36-44 (10).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('121','23','大黄蜂 36-44 (11).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 变形金刚 大黄蜂 36-44 猪八革/大黄蜂 36-44 (11).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('122','23','大黄蜂 36-44 (12).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 变形金刚 大黄蜂 36-44 猪八革/大黄蜂 36-44 (12).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('123','23','大黄蜂 36-44 (2).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 变形金刚 大黄蜂 36-44 猪八革/大黄蜂 36-44 (2).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('124','23','大黄蜂 36-44 (3).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 变形金刚 大黄蜂 36-44 猪八革/大黄蜂 36-44 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('125','23','大黄蜂 36-44 (4).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 变形金刚 大黄蜂 36-44 猪八革/大黄蜂 36-44 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('126','23','大黄蜂 36-44 (5).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 变形金刚 大黄蜂 36-44 猪八革/大黄蜂 36-44 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('127','23','大黄蜂 36-44 (6).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 变形金刚 大黄蜂 36-44 猪八革/大黄蜂 36-44 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('128','23','大黄蜂 36-44 (7).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 变形金刚 大黄蜂 36-44 猪八革/大黄蜂 36-44 (7).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('129','23','大黄蜂 36-44 (8).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 变形金刚 大黄蜂 36-44 猪八革/大黄蜂 36-44 (8).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('130','23','大黄蜂 36-44 (9).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 变形金刚 大黄蜂 36-44 猪八革/大黄蜂 36-44 (9).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('131','23','大黄蜂 36-44.jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 变形金刚 大黄蜂 36-44 猪八革/大黄蜂 36-44.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('132','24','御天敌 36-44 (2).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 变形金刚 御天敌 36-44 猪八革/御天敌 36-44 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('133','24','御天敌 36-44 (3).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 变形金刚 御天敌 36-44 猪八革/御天敌 36-44 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('134','24','御天敌 36-44 (4).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 变形金刚 御天敌 36-44 猪八革/御天敌 36-44 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('135','24','御天敌 36-44 (5).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 变形金刚 御天敌 36-44 猪八革/御天敌 36-44 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('136','24','御天敌 36-44 (6).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 变形金刚 御天敌 36-44 猪八革/御天敌 36-44 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('137','24','御天敌 36-44 (7).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 变形金刚 御天敌 36-44 猪八革/御天敌 36-44 (7).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('138','24','御天敌 36-44 (8).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 变形金刚 御天敌 36-44 猪八革/御天敌 36-44 (8).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('139','24','御天敌 36-44 (9).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 变形金刚 御天敌 36-44 猪八革/御天敌 36-44 (9).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('140','24','御天敌 36-44.jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 变形金刚 御天敌 36-44 猪八革/御天敌 36-44.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('141','25','雷神 36-44 (2).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 雷神 36-44/雷神 36-44 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('142','25','雷神 36-44 (3).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 雷神 36-44/雷神 36-44 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('143','25','雷神 36-44 (4).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 雷神 36-44/雷神 36-44 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('144','25','雷神 36-44 (5).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 雷神 36-44/雷神 36-44 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('145','25','雷神 36-44 (6).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 雷神 36-44/雷神 36-44 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('146','25','雷神 36-44.jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 雷神 36-44/雷神 36-44.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('147','26','美国队长 36-44 (2).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 美国队长 36-44/美国队长 36-44 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('148','26','美国队长 36-44 (3).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 美国队长 36-44/美国队长 36-44 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('149','26','美国队长 36-44 (4).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 美国队长 36-44/美国队长 36-44 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('150','26','美国队长 36-44 (5).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 美国队长 36-44/美国队长 36-44 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('151','26','美国队长 36-44 (6).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 美国队长 36-44/美国队长 36-44 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('152','26','美国队长 36-44.jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 美国队长 36-44/美国队长 36-44.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('153','27','灰黑 40-44 (2).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 美国队长2代 灰黑 40-44/灰黑 40-44 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('154','27','灰黑 40-44 (3).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 美国队长2代 灰黑 40-44/灰黑 40-44 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('155','27','灰黑 40-44 (4).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 美国队长2代 灰黑 40-44/灰黑 40-44 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('156','27','灰黑 40-44.jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 美国队长2代 灰黑 40-44/灰黑 40-44.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('157','28','蓝红 40-44 (2).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 美国队长2代 蓝红 40-44/蓝红 40-44 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('158','28','蓝红 40-44 (3).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 美国队长2代 蓝红 40-44/蓝红 40-44 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('159','28','蓝红 40-44 (4).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 美国队长2代 蓝红 40-44/蓝红 40-44 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('160','28','蓝红 40-44 (5).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 美国队长2代 蓝红 40-44/蓝红 40-44 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('161','28','蓝红 40-44 (6).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 美国队长2代 蓝红 40-44/蓝红 40-44 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('162','28','蓝红 40-44 (7).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 美国队长2代 蓝红 40-44/蓝红 40-44 (7).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('163','28','蓝红 40-44 (8).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 美国队长2代 蓝红 40-44/蓝红 40-44 (8).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('164','28','蓝红 40-44 (9).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 美国队长2代 蓝红 40-44/蓝红 40-44 (9).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('165','28','蓝红 40-44.jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 美国队长2代 蓝红 40-44/蓝红 40-44.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('166','29','蜘蛛侠 36-44 (2).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 蜘蛛侠 36-44/蜘蛛侠 36-44 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('167','29','蜘蛛侠 36-44 (3).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 蜘蛛侠 36-44/蜘蛛侠 36-44 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('168','29','蜘蛛侠 36-44 (4).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 蜘蛛侠 36-44/蜘蛛侠 36-44 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('169','29','蜘蛛侠 36-44 (5).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 蜘蛛侠 36-44/蜘蛛侠 36-44 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('170','29','蜘蛛侠 36-44 (6).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 蜘蛛侠 36-44/蜘蛛侠 36-44 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('171','29','蜘蛛侠 36-44 (7).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 蜘蛛侠 36-44/蜘蛛侠 36-44 (7).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('172','29','蜘蛛侠 36-44.jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb 574 蜘蛛侠 36-44/蜘蛛侠 36-44.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('173','30','霸天虎 36-44 (10).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb574 变形金刚 霸天虎 36-44 猪八革/霸天虎 36-44 (10).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('174','30','霸天虎 36-44 (2).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb574 变形金刚 霸天虎 36-44 猪八革/霸天虎 36-44 (2).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('175','30','霸天虎 36-44 (3).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb574 变形金刚 霸天虎 36-44 猪八革/霸天虎 36-44 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('176','30','霸天虎 36-44 (4).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb574 变形金刚 霸天虎 36-44 猪八革/霸天虎 36-44 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('177','30','霸天虎 36-44 (5).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb574 变形金刚 霸天虎 36-44 猪八革/霸天虎 36-44 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('178','30','霸天虎 36-44 (6).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb574 变形金刚 霸天虎 36-44 猪八革/霸天虎 36-44 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('179','30','霸天虎 36-44 (7).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb574 变形金刚 霸天虎 36-44 猪八革/霸天虎 36-44 (7).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('180','30','霸天虎 36-44 (8).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb574 变形金刚 霸天虎 36-44 猪八革/霸天虎 36-44 (8).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('181','30','霸天虎 36-44 (9).jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb574 变形金刚 霸天虎 36-44 猪八革/霸天虎 36-44 (9).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('182','30','霸天虎 36-44.jpeg','','','/product/nb574/变形金刚、蜘蛛侠、美国队长/nb574 变形金刚 霸天虎 36-44 猪八革/霸天虎 36-44.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('183','32','暗碧蓝 36-44 (2).jpeg','','','/product/nb574/常春藤系列/nb 574 常春藤 暗碧蓝 36-44/暗碧蓝 36-44 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('184','32','暗碧蓝 36-44 (3).jpeg','','','/product/nb574/常春藤系列/nb 574 常春藤 暗碧蓝 36-44/暗碧蓝 36-44 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('185','32','暗碧蓝 36-44 (4).jpeg','','','/product/nb574/常春藤系列/nb 574 常春藤 暗碧蓝 36-44/暗碧蓝 36-44 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('186','32','暗碧蓝 36-44 (5).jpeg','','','/product/nb574/常春藤系列/nb 574 常春藤 暗碧蓝 36-44/暗碧蓝 36-44 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('187','32','暗碧蓝 36-44 (6).jpeg','','','/product/nb574/常春藤系列/nb 574 常春藤 暗碧蓝 36-44/暗碧蓝 36-44 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('188','32','暗碧蓝 36-44 (7).jpeg','','','/product/nb574/常春藤系列/nb 574 常春藤 暗碧蓝 36-44/暗碧蓝 36-44 (7).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('189','32','暗碧蓝 36-44.jpeg','','','/product/nb574/常春藤系列/nb 574 常春藤 暗碧蓝 36-44/暗碧蓝 36-44.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('190','33','暗淡绿 36-39 (2).jpeg','','','/product/nb574/常春藤系列/nb 574 常春藤 暗淡绿 36-39/暗淡绿 36-39 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('191','33','暗淡绿 36-39 (3).jpeg','','','/product/nb574/常春藤系列/nb 574 常春藤 暗淡绿 36-39/暗淡绿 36-39 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('192','33','暗淡绿 36-39 (4).jpeg','','','/product/nb574/常春藤系列/nb 574 常春藤 暗淡绿 36-39/暗淡绿 36-39 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('193','33','暗淡绿 36-39 (5).jpeg','','','/product/nb574/常春藤系列/nb 574 常春藤 暗淡绿 36-39/暗淡绿 36-39 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('194','33','暗淡绿 36-39 (6).jpeg','','','/product/nb574/常春藤系列/nb 574 常春藤 暗淡绿 36-39/暗淡绿 36-39 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('195','33','暗淡绿 36-39 (7).jpeg','','','/product/nb574/常春藤系列/nb 574 常春藤 暗淡绿 36-39/暗淡绿 36-39 (7).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('196','33','暗淡绿 36-39.jpeg','','','/product/nb574/常春藤系列/nb 574 常春藤 暗淡绿 36-39/暗淡绿 36-39.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('197','34','红蔷薇 36-44 (2).jpeg','','','/product/nb574/常春藤系列/nb 574 常春藤 红蔷薇 36-44/红蔷薇 36-44 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('198','34','红蔷薇 36-44 (3).jpeg','','','/product/nb574/常春藤系列/nb 574 常春藤 红蔷薇 36-44/红蔷薇 36-44 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('199','34','红蔷薇 36-44 (4).jpeg','','','/product/nb574/常春藤系列/nb 574 常春藤 红蔷薇 36-44/红蔷薇 36-44 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('200','34','红蔷薇 36-44 (5).jpeg','','','/product/nb574/常春藤系列/nb 574 常春藤 红蔷薇 36-44/红蔷薇 36-44 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('201','34','红蔷薇 36-44 (6).jpeg','','','/product/nb574/常春藤系列/nb 574 常春藤 红蔷薇 36-44/红蔷薇 36-44 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('202','34','红蔷薇 36-44 (7).jpeg','','','/product/nb574/常春藤系列/nb 574 常春藤 红蔷薇 36-44/红蔷薇 36-44 (7).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('203','34','红蔷薇 36-44 (8).jpeg','','','/product/nb574/常春藤系列/nb 574 常春藤 红蔷薇 36-44/红蔷薇 36-44 (8).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('204','34','红蔷薇 36-44 (9).jpeg','','','/product/nb574/常春藤系列/nb 574 常春藤 红蔷薇 36-44/红蔷薇 36-44 (9).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('205','34','红蔷薇 36-44.jpeg','','','/product/nb574/常春藤系列/nb 574 常春藤 红蔷薇 36-44/红蔷薇 36-44.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('206','35','空蒙蓝 36-44 (2).jpeg','','','/product/nb574/常春藤系列/nb 574 常春藤 空蒙蓝 36-44/空蒙蓝 36-44 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('207','35','空蒙蓝 36-44 (3).jpeg','','','/product/nb574/常春藤系列/nb 574 常春藤 空蒙蓝 36-44/空蒙蓝 36-44 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('208','35','空蒙蓝 36-44 (4).jpeg','','','/product/nb574/常春藤系列/nb 574 常春藤 空蒙蓝 36-44/空蒙蓝 36-44 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('209','35','空蒙蓝 36-44 (5).jpeg','','','/product/nb574/常春藤系列/nb 574 常春藤 空蒙蓝 36-44/空蒙蓝 36-44 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('210','35','空蒙蓝 36-44 (6).jpeg','','','/product/nb574/常春藤系列/nb 574 常春藤 空蒙蓝 36-44/空蒙蓝 36-44 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('211','35','空蒙蓝 36-44 (7).jpeg','','','/product/nb574/常春藤系列/nb 574 常春藤 空蒙蓝 36-44/空蒙蓝 36-44 (7).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('212','35','空蒙蓝 36-44.jpeg','','','/product/nb574/常春藤系列/nb 574 常春藤 空蒙蓝 36-44/空蒙蓝 36-44.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('213','36','青瓜绿 40-44 (2).jpeg','','','/product/nb574/常春藤系列/nb 574 常春藤 青瓜绿 40-44/青瓜绿 40-44 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('214','36','青瓜绿 40-44 (3).jpeg','','','/product/nb574/常春藤系列/nb 574 常春藤 青瓜绿 40-44/青瓜绿 40-44 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('215','36','青瓜绿 40-44 (4).jpeg','','','/product/nb574/常春藤系列/nb 574 常春藤 青瓜绿 40-44/青瓜绿 40-44 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('216','36','青瓜绿 40-44 (5).jpeg','','','/product/nb574/常春藤系列/nb 574 常春藤 青瓜绿 40-44/青瓜绿 40-44 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('217','36','青瓜绿 40-44 (6).jpeg','','','/product/nb574/常春藤系列/nb 574 常春藤 青瓜绿 40-44/青瓜绿 40-44 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('218','36','青瓜绿 40-44 (7).jpeg','','','/product/nb574/常春藤系列/nb 574 常春藤 青瓜绿 40-44/青瓜绿 40-44 (7).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('219','36','青瓜绿 40-44.jpeg','','','/product/nb574/常春藤系列/nb 574 常春藤 青瓜绿 40-44/青瓜绿 40-44.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('220','37','细钢银 36-44 (2).jpeg','','','/product/nb574/常春藤系列/nb 574 常春藤 细钢银 36-44/细钢银 36-44 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('221','37','细钢银 36-44 (3).jpeg','','','/product/nb574/常春藤系列/nb 574 常春藤 细钢银 36-44/细钢银 36-44 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('222','37','细钢银 36-44 (4).jpeg','','','/product/nb574/常春藤系列/nb 574 常春藤 细钢银 36-44/细钢银 36-44 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('223','37','细钢银 36-44 (5).jpeg','','','/product/nb574/常春藤系列/nb 574 常春藤 细钢银 36-44/细钢银 36-44 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('224','37','细钢银 36-44 (6).jpeg','','','/product/nb574/常春藤系列/nb 574 常春藤 细钢银 36-44/细钢银 36-44 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('225','37','细钢银 36-44 (7).jpeg','','','/product/nb574/常春藤系列/nb 574 常春藤 细钢银 36-44/细钢银 36-44 (7).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('226','37','细钢银 36-44.jpeg','','','/product/nb574/常春藤系列/nb 574 常春藤 细钢银 36-44/细钢银 36-44.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('227','39','灰色 36-39 (2).jpeg','','','/product/nb574/动漫系列、萤火虫系列/nb 574 萤火虫系列 灰色 36-39/灰色 36-39 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('228','39','灰色 36-39 (3).jpeg','','','/product/nb574/动漫系列、萤火虫系列/nb 574 萤火虫系列 灰色 36-39/灰色 36-39 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('229','39','灰色 36-39 (4).jpeg','','','/product/nb574/动漫系列、萤火虫系列/nb 574 萤火虫系列 灰色 36-39/灰色 36-39 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('230','39','灰色 36-39 (5).jpeg','','','/product/nb574/动漫系列、萤火虫系列/nb 574 萤火虫系列 灰色 36-39/灰色 36-39 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('231','39','灰色 36-39 (6).jpeg','','','/product/nb574/动漫系列、萤火虫系列/nb 574 萤火虫系列 灰色 36-39/灰色 36-39 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('232','39','灰色 36-39 (7).jpeg','','','/product/nb574/动漫系列、萤火虫系列/nb 574 萤火虫系列 灰色 36-39/灰色 36-39 (7).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('233','39','灰色 36-39 (8).jpeg','','','/product/nb574/动漫系列、萤火虫系列/nb 574 萤火虫系列 灰色 36-39/灰色 36-39 (8).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('234','39','灰色 36-39.jpeg','','','/product/nb574/动漫系列、萤火虫系列/nb 574 萤火虫系列 灰色 36-39/灰色 36-39.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('235','40','桔红色 36-39 (2).jpeg','','','/product/nb574/动漫系列、萤火虫系列/nb 574 萤火虫系列 桔红色 36-39/桔红色 36-39 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('236','40','桔红色 36-39 (3).jpeg','','','/product/nb574/动漫系列、萤火虫系列/nb 574 萤火虫系列 桔红色 36-39/桔红色 36-39 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('237','40','桔红色 36-39 (4).jpeg','','','/product/nb574/动漫系列、萤火虫系列/nb 574 萤火虫系列 桔红色 36-39/桔红色 36-39 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('238','40','桔红色 36-39 (5).jpeg','','','/product/nb574/动漫系列、萤火虫系列/nb 574 萤火虫系列 桔红色 36-39/桔红色 36-39 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('239','40','桔红色 36-39 (6).jpeg','','','/product/nb574/动漫系列、萤火虫系列/nb 574 萤火虫系列 桔红色 36-39/桔红色 36-39 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('240','40','桔红色 36-39 (7).jpeg','','','/product/nb574/动漫系列、萤火虫系列/nb 574 萤火虫系列 桔红色 36-39/桔红色 36-39 (7).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('241','40','桔红色 36-39 (8).jpeg','','','/product/nb574/动漫系列、萤火虫系列/nb 574 萤火虫系列 桔红色 36-39/桔红色 36-39 (8).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('242','40','桔红色 36-39.jpeg','','','/product/nb574/动漫系列、萤火虫系列/nb 574 萤火虫系列 桔红色 36-39/桔红色 36-39.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('243','41','蓝色 36-39 (2).jpeg','','','/product/nb574/动漫系列、萤火虫系列/nb 574 萤火虫系列 蓝色 36-39/蓝色 36-39 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('244','41','蓝色 36-39 (3).jpeg','','','/product/nb574/动漫系列、萤火虫系列/nb 574 萤火虫系列 蓝色 36-39/蓝色 36-39 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('245','41','蓝色 36-39 (4).jpeg','','','/product/nb574/动漫系列、萤火虫系列/nb 574 萤火虫系列 蓝色 36-39/蓝色 36-39 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('246','41','蓝色 36-39 (5).jpeg','','','/product/nb574/动漫系列、萤火虫系列/nb 574 萤火虫系列 蓝色 36-39/蓝色 36-39 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('247','41','蓝色 36-39 (6).jpeg','','','/product/nb574/动漫系列、萤火虫系列/nb 574 萤火虫系列 蓝色 36-39/蓝色 36-39 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('248','41','蓝色 36-39 (7).jpeg','','','/product/nb574/动漫系列、萤火虫系列/nb 574 萤火虫系列 蓝色 36-39/蓝色 36-39 (7).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('249','41','蓝色 36-39 (8).jpeg','','','/product/nb574/动漫系列、萤火虫系列/nb 574 萤火虫系列 蓝色 36-39/蓝色 36-39 (8).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('250','41','蓝色 36-39 (9).jpeg','','','/product/nb574/动漫系列、萤火虫系列/nb 574 萤火虫系列 蓝色 36-39/蓝色 36-39 (9).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('251','41','蓝色 36-39.jpg','','','/product/nb574/动漫系列、萤火虫系列/nb 574 萤火虫系列 蓝色 36-39/蓝色 36-39.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('252','42','荧光绿 36-39 (2).jpeg','','','/product/nb574/动漫系列、萤火虫系列/nb 574 萤火虫系列 荧光绿 36-39/荧光绿 36-39 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('253','42','荧光绿 36-39 (3).jpeg','','','/product/nb574/动漫系列、萤火虫系列/nb 574 萤火虫系列 荧光绿 36-39/荧光绿 36-39 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('254','42','荧光绿 36-39 (4).jpeg','','','/product/nb574/动漫系列、萤火虫系列/nb 574 萤火虫系列 荧光绿 36-39/荧光绿 36-39 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('255','42','荧光绿 36-39 (5).jpeg','','','/product/nb574/动漫系列、萤火虫系列/nb 574 萤火虫系列 荧光绿 36-39/荧光绿 36-39 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('256','42','荧光绿 36-39 (6).jpeg','','','/product/nb574/动漫系列、萤火虫系列/nb 574 萤火虫系列 荧光绿 36-39/荧光绿 36-39 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('257','42','荧光绿 36-39 (7).jpeg','','','/product/nb574/动漫系列、萤火虫系列/nb 574 萤火虫系列 荧光绿 36-39/荧光绿 36-39 (7).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('258','42','荧光绿 36-39 (8).jpeg','','','/product/nb574/动漫系列、萤火虫系列/nb 574 萤火虫系列 荧光绿 36-39/荧光绿 36-39 (8).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('259','42','荧光绿 36-39.jpeg','','','/product/nb574/动漫系列、萤火虫系列/nb 574 萤火虫系列 荧光绿 36-39/荧光绿 36-39.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('260','43','路飞款36-44 (2).jpg','','','/product/nb574/动漫系列、萤火虫系列/nb574动漫海贼王路飞款36-44/路飞款36-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('261','43','路飞款36-44 (3).jpg','','','/product/nb574/动漫系列、萤火虫系列/nb574动漫海贼王路飞款36-44/路飞款36-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('262','43','路飞款36-44 (4).jpg','','','/product/nb574/动漫系列、萤火虫系列/nb574动漫海贼王路飞款36-44/路飞款36-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('263','43','路飞款36-44 (5).jpg','','','/product/nb574/动漫系列、萤火虫系列/nb574动漫海贼王路飞款36-44/路飞款36-44 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('264','43','路飞款36-44.jpg','','','/product/nb574/动漫系列、萤火虫系列/nb574动漫海贼王路飞款36-44/路飞款36-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('265','44','索隆卓洛款40-44 (2).jpg','','','/product/nb574/动漫系列、萤火虫系列/nb574动漫海贼王索隆卓洛款40-44/索隆卓洛款40-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('266','44','索隆卓洛款40-44 (3).jpg','','','/product/nb574/动漫系列、萤火虫系列/nb574动漫海贼王索隆卓洛款40-44/索隆卓洛款40-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('267','44','索隆卓洛款40-44 (4).jpg','','','/product/nb574/动漫系列、萤火虫系列/nb574动漫海贼王索隆卓洛款40-44/索隆卓洛款40-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('268','44','索隆卓洛款40-44 (5).jpg','','','/product/nb574/动漫系列、萤火虫系列/nb574动漫海贼王索隆卓洛款40-44/索隆卓洛款40-44 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('269','44','索隆卓洛款40-44.jpg','','','/product/nb574/动漫系列、萤火虫系列/nb574动漫海贼王索隆卓洛款40-44/索隆卓洛款40-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('270','45','哆啦a梦款36-39 (2).jpg','','','/product/nb574/动漫系列、萤火虫系列/nb574动漫机器猫哆啦a梦款36-39/哆啦a梦款36-39 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('271','45','哆啦a梦款36-39 (3).jpg','','','/product/nb574/动漫系列、萤火虫系列/nb574动漫机器猫哆啦a梦款36-39/哆啦a梦款36-39 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('272','45','哆啦a梦款36-39 (4).jpg','','','/product/nb574/动漫系列、萤火虫系列/nb574动漫机器猫哆啦a梦款36-39/哆啦a梦款36-39 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('273','45','哆啦a梦款36-39.jpg','','','/product/nb574/动漫系列、萤火虫系列/nb574动漫机器猫哆啦a梦款36-39/哆啦a梦款36-39.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('274','46','乔巴款36-39 (2).jpg','','','/product/nb574/动漫系列、萤火虫系列/nb574海贼王乔巴款36-39/乔巴款36-39 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('275','46','乔巴款36-39 (3).jpg','','','/product/nb574/动漫系列、萤火虫系列/nb574海贼王乔巴款36-39/乔巴款36-39 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('276','46','乔巴款36-39 (4).jpg','','','/product/nb574/动漫系列、萤火虫系列/nb574海贼王乔巴款36-39/乔巴款36-39 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('277','46','乔巴款36-39 (5).jpg','','','/product/nb574/动漫系列、萤火虫系列/nb574海贼王乔巴款36-39/乔巴款36-39 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('278','46','乔巴款36-39.jpg','','','/product/nb574/动漫系列、萤火虫系列/nb574海贼王乔巴款36-39/乔巴款36-39.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('279','48','深蓝色 36-39 (2).jpeg','','','/product/nb574/帆船系列/nb 574 帆船系列 深蓝色 36-39/深蓝色 36-39 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('280','48','深蓝色 36-39 (3).jpeg','','','/product/nb574/帆船系列/nb 574 帆船系列 深蓝色 36-39/深蓝色 36-39 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('281','48','深蓝色 36-39 (4).jpeg','','','/product/nb574/帆船系列/nb 574 帆船系列 深蓝色 36-39/深蓝色 36-39 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('282','48','深蓝色 36-39 (5).jpeg','','','/product/nb574/帆船系列/nb 574 帆船系列 深蓝色 36-39/深蓝色 36-39 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('283','48','深蓝色 36-39 (6).jpeg','','','/product/nb574/帆船系列/nb 574 帆船系列 深蓝色 36-39/深蓝色 36-39 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('284','48','深蓝色 36-39 (7).jpeg','','','/product/nb574/帆船系列/nb 574 帆船系列 深蓝色 36-39/深蓝色 36-39 (7).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('285','48','深蓝色 36-39 (8).jpeg','','','/product/nb574/帆船系列/nb 574 帆船系列 深蓝色 36-39/深蓝色 36-39 (8).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('286','48','深蓝色 36-39 (9).jpeg','','','/product/nb574/帆船系列/nb 574 帆船系列 深蓝色 36-39/深蓝色 36-39 (9).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('287','48','深蓝色 36-39.jpeg','','','/product/nb574/帆船系列/nb 574 帆船系列 深蓝色 36-39/深蓝色 36-39.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('288','49','尾牙绿 36-39 (2).jpeg','','','/product/nb574/帆船系列/nb 574 帆船系列 尾牙绿 36-39/尾牙绿 36-39 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('289','49','尾牙绿 36-39 (3).jpeg','','','/product/nb574/帆船系列/nb 574 帆船系列 尾牙绿 36-39/尾牙绿 36-39 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('290','49','尾牙绿 36-39 (4).jpeg','','','/product/nb574/帆船系列/nb 574 帆船系列 尾牙绿 36-39/尾牙绿 36-39 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('291','49','尾牙绿 36-39 (5).jpeg','','','/product/nb574/帆船系列/nb 574 帆船系列 尾牙绿 36-39/尾牙绿 36-39 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('292','49','尾牙绿 36-39 (6).jpeg','','','/product/nb574/帆船系列/nb 574 帆船系列 尾牙绿 36-39/尾牙绿 36-39 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('293','49','尾牙绿 36-39 (7).jpeg','','','/product/nb574/帆船系列/nb 574 帆船系列 尾牙绿 36-39/尾牙绿 36-39 (7).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('294','49','尾牙绿 36-39 (8).jpeg','','','/product/nb574/帆船系列/nb 574 帆船系列 尾牙绿 36-39/尾牙绿 36-39 (8).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('295','49','尾牙绿 36-39.jpeg','','','/product/nb574/帆船系列/nb 574 帆船系列 尾牙绿 36-39/尾牙绿 36-39.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('296','50','仙人紫 36-39 (2).jpeg','','','/product/nb574/帆船系列/nb 574 帆船系列 仙人紫 36-39/仙人紫 36-39 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('297','50','仙人紫 36-39 (3).jpeg','','','/product/nb574/帆船系列/nb 574 帆船系列 仙人紫 36-39/仙人紫 36-39 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('298','50','仙人紫 36-39 (4).jpeg','','','/product/nb574/帆船系列/nb 574 帆船系列 仙人紫 36-39/仙人紫 36-39 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('299','50','仙人紫 36-39 (5).jpeg','','','/product/nb574/帆船系列/nb 574 帆船系列 仙人紫 36-39/仙人紫 36-39 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('300','50','仙人紫 36-39 (6).jpeg','','','/product/nb574/帆船系列/nb 574 帆船系列 仙人紫 36-39/仙人紫 36-39 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('301','50','仙人紫 36-39 (7).jpeg','','','/product/nb574/帆船系列/nb 574 帆船系列 仙人紫 36-39/仙人紫 36-39 (7).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('302','50','仙人紫 36-39 (8).jpeg','','','/product/nb574/帆船系列/nb 574 帆船系列 仙人紫 36-39/仙人紫 36-39 (8).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('303','50','仙人紫 36-39.jpeg','','','/product/nb574/帆船系列/nb 574 帆船系列 仙人紫 36-39/仙人紫 36-39.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('304','51','校园紫 36-39 (3).jpeg','','','/product/nb574/帆船系列/nb 574 帆船系列 校园紫 36-39/校园紫 36-39 (3).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('305','51','校园紫 36-39 (4).jpeg','','','/product/nb574/帆船系列/nb 574 帆船系列 校园紫 36-39/校园紫 36-39 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('306','51','校园紫 36-39 (5).jpeg','','','/product/nb574/帆船系列/nb 574 帆船系列 校园紫 36-39/校园紫 36-39 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('307','51','校园紫 36-39 (6).jpeg','','','/product/nb574/帆船系列/nb 574 帆船系列 校园紫 36-39/校园紫 36-39 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('308','51','校园紫 36-39.jpeg','','','/product/nb574/帆船系列/nb 574 帆船系列 校园紫 36-39/校园紫 36-39.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('309','52','红白 36-39 (2).jpeg','','','/product/nb574/帆船系列/nb574 帆船系列 红白 36-39/红白 36-39 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('310','52','红白 36-39 (3).jpeg','','','/product/nb574/帆船系列/nb574 帆船系列 红白 36-39/红白 36-39 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('311','52','红白 36-39 (4).jpeg','','','/product/nb574/帆船系列/nb574 帆船系列 红白 36-39/红白 36-39 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('312','52','红白 36-39 (5).jpeg','','','/product/nb574/帆船系列/nb574 帆船系列 红白 36-39/红白 36-39 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('313','52','红白 36-39 (6).jpeg','','','/product/nb574/帆船系列/nb574 帆船系列 红白 36-39/红白 36-39 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('314','52','红白 36-39 (7).jpeg','','','/product/nb574/帆船系列/nb574 帆船系列 红白 36-39/红白 36-39 (7).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('315','52','红白 36-39 (8).jpeg','','','/product/nb574/帆船系列/nb574 帆船系列 红白 36-39/红白 36-39 (8).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('316','52','红白 36-39 (9).jpeg','','','/product/nb574/帆船系列/nb574 帆船系列 红白 36-39/红白 36-39 (9).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('317','52','红白 36-39.jpeg','','','/product/nb574/帆船系列/nb574 帆船系列 红白 36-39/红白 36-39.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('318','53','亮绿红 36-39 (2).jpeg','','','/product/nb574/帆船系列/nb574 帆船系列 亮绿红 36-39/亮绿红 36-39 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('319','53','亮绿红 36-39 (3).jpeg','','','/product/nb574/帆船系列/nb574 帆船系列 亮绿红 36-39/亮绿红 36-39 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('320','53','亮绿红 36-39 (4).jpeg','','','/product/nb574/帆船系列/nb574 帆船系列 亮绿红 36-39/亮绿红 36-39 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('321','53','亮绿红 36-39 (5).jpeg','','','/product/nb574/帆船系列/nb574 帆船系列 亮绿红 36-39/亮绿红 36-39 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('322','53','亮绿红 36-39 (6).jpeg','','','/product/nb574/帆船系列/nb574 帆船系列 亮绿红 36-39/亮绿红 36-39 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('323','53','亮绿红 36-39 (7).jpeg','','','/product/nb574/帆船系列/nb574 帆船系列 亮绿红 36-39/亮绿红 36-39 (7).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('324','53','亮绿红 36-39 (8).jpeg','','','/product/nb574/帆船系列/nb574 帆船系列 亮绿红 36-39/亮绿红 36-39 (8).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('325','53','亮绿红 36-39 (9).jpeg','','','/product/nb574/帆船系列/nb574 帆船系列 亮绿红 36-39/亮绿红 36-39 (9).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('326','53','亮绿红 36-39.jpeg','','','/product/nb574/帆船系列/nb574 帆船系列 亮绿红 36-39/亮绿红 36-39.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('327','54','钴深蓝 36-39 (2).jpeg','','','/product/nb574/帆船系列/nb574 帆船系列 钴深蓝 36-39/钴深蓝 36-39 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('328','54','钴深蓝 36-39 (3).jpeg','','','/product/nb574/帆船系列/nb574 帆船系列 钴深蓝 36-39/钴深蓝 36-39 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('329','54','钴深蓝 36-39 (4).jpeg','','','/product/nb574/帆船系列/nb574 帆船系列 钴深蓝 36-39/钴深蓝 36-39 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('330','54','钴深蓝 36-39 (5).jpeg','','','/product/nb574/帆船系列/nb574 帆船系列 钴深蓝 36-39/钴深蓝 36-39 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('331','54','钴深蓝 36-39 (6).jpeg','','','/product/nb574/帆船系列/nb574 帆船系列 钴深蓝 36-39/钴深蓝 36-39 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('332','54','钴深蓝 36-39 (7).jpeg','','','/product/nb574/帆船系列/nb574 帆船系列 钴深蓝 36-39/钴深蓝 36-39 (7).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('333','54','钴深蓝 36-39 (8).jpeg','','','/product/nb574/帆船系列/nb574 帆船系列 钴深蓝 36-39/钴深蓝 36-39 (8).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('334','54','钴深蓝 36-39 (9).jpeg','','','/product/nb574/帆船系列/nb574 帆船系列 钴深蓝 36-39/钴深蓝 36-39 (9).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('335','54','钴深蓝 36-39.jpeg','','','/product/nb574/帆船系列/nb574 帆船系列 钴深蓝 36-39/钴深蓝 36-39.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('336','56','笔水蓝 36-44 (2).jpeg','','','/product/nb574/红绿灯系列、复古跑步鞋/nb 574 复古跑步鞋 笔水蓝 36-44/笔水蓝 36-44 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('337','56','笔水蓝 36-44 (3).jpeg','','','/product/nb574/红绿灯系列、复古跑步鞋/nb 574 复古跑步鞋 笔水蓝 36-44/笔水蓝 36-44 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('338','56','笔水蓝 36-44 (4).jpeg','','','/product/nb574/红绿灯系列、复古跑步鞋/nb 574 复古跑步鞋 笔水蓝 36-44/笔水蓝 36-44 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('339','56','笔水蓝 36-44 (5).jpeg','','','/product/nb574/红绿灯系列、复古跑步鞋/nb 574 复古跑步鞋 笔水蓝 36-44/笔水蓝 36-44 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('340','56','笔水蓝 36-44 (6).jpeg','','','/product/nb574/红绿灯系列、复古跑步鞋/nb 574 复古跑步鞋 笔水蓝 36-44/笔水蓝 36-44 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('341','56','笔水蓝 36-44 (7).jpeg','','','/product/nb574/红绿灯系列、复古跑步鞋/nb 574 复古跑步鞋 笔水蓝 36-44/笔水蓝 36-44 (7).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('342','56','笔水蓝 36-44.jpeg','','','/product/nb574/红绿灯系列、复古跑步鞋/nb 574 复古跑步鞋 笔水蓝 36-44/笔水蓝 36-44.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('343','57','黄白 36-39 (2).jpeg','','','/product/nb574/红绿灯系列、复古跑步鞋/nb 574 复古跑步鞋 黄白 36-39/黄白 36-39 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('344','57','黄白 36-39 (3).jpeg','','','/product/nb574/红绿灯系列、复古跑步鞋/nb 574 复古跑步鞋 黄白 36-39/黄白 36-39 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('345','57','黄白 36-39 (4).jpeg','','','/product/nb574/红绿灯系列、复古跑步鞋/nb 574 复古跑步鞋 黄白 36-39/黄白 36-39 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('346','57','黄白 36-39 (5).jpeg','','','/product/nb574/红绿灯系列、复古跑步鞋/nb 574 复古跑步鞋 黄白 36-39/黄白 36-39 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('347','57','黄白 36-39 (6).jpeg','','','/product/nb574/红绿灯系列、复古跑步鞋/nb 574 复古跑步鞋 黄白 36-39/黄白 36-39 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('348','57','黄白 36-39.jpeg','','','/product/nb574/红绿灯系列、复古跑步鞋/nb 574 复古跑步鞋 黄白 36-39/黄白 36-39.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('349','58','乌沙红 36-39 (2).jpeg','','','/product/nb574/红绿灯系列、复古跑步鞋/nb 574 复古跑步鞋 乌沙红 36-39/乌沙红 36-39 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('350','58','乌沙红 36-39 (3).jpeg','','','/product/nb574/红绿灯系列、复古跑步鞋/nb 574 复古跑步鞋 乌沙红 36-39/乌沙红 36-39 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('351','58','乌沙红 36-39 (4).jpeg','','','/product/nb574/红绿灯系列、复古跑步鞋/nb 574 复古跑步鞋 乌沙红 36-39/乌沙红 36-39 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('352','58','乌沙红 36-39 (5).jpeg','','','/product/nb574/红绿灯系列、复古跑步鞋/nb 574 复古跑步鞋 乌沙红 36-39/乌沙红 36-39 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('353','58','乌沙红 36-39 (6).jpeg','','','/product/nb574/红绿灯系列、复古跑步鞋/nb 574 复古跑步鞋 乌沙红 36-39/乌沙红 36-39 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('354','58','乌沙红 36-39 (7).jpeg','','','/product/nb574/红绿灯系列、复古跑步鞋/nb 574 复古跑步鞋 乌沙红 36-39/乌沙红 36-39 (7).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('355','58','乌沙红 36-39 (8).jpeg','','','/product/nb574/红绿灯系列、复古跑步鞋/nb 574 复古跑步鞋 乌沙红 36-39/乌沙红 36-39 (8).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('356','58','乌沙红 36-39.jpeg','','','/product/nb574/红绿灯系列、复古跑步鞋/nb 574 复古跑步鞋 乌沙红 36-39/乌沙红 36-39.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('357','59','红色 36-44 (2).jpeg','','','/product/nb574/红绿灯系列、复古跑步鞋/nb 574 红绿灯系列 红色 36-44/红色 36-44 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('358','59','红色 36-44 (3).jpeg','','','/product/nb574/红绿灯系列、复古跑步鞋/nb 574 红绿灯系列 红色 36-44/红色 36-44 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('359','59','红色 36-44 (4).jpeg','','','/product/nb574/红绿灯系列、复古跑步鞋/nb 574 红绿灯系列 红色 36-44/红色 36-44 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('360','59','红色 36-44.jpeg','','','/product/nb574/红绿灯系列、复古跑步鞋/nb 574 红绿灯系列 红色 36-44/红色 36-44.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('361','60','黄色 36-44 (2).jpeg','','','/product/nb574/红绿灯系列、复古跑步鞋/nb 574 红绿灯系列 黄色 36-44/黄色 36-44 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('362','60','黄色 36-44 (3).jpeg','','','/product/nb574/红绿灯系列、复古跑步鞋/nb 574 红绿灯系列 黄色 36-44/黄色 36-44 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('363','60','黄色 36-44 (4).jpeg','','','/product/nb574/红绿灯系列、复古跑步鞋/nb 574 红绿灯系列 黄色 36-44/黄色 36-44 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('364','60','黄色 36-44 (5).jpeg','','','/product/nb574/红绿灯系列、复古跑步鞋/nb 574 红绿灯系列 黄色 36-44/黄色 36-44 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('365','60','黄色 36-44 (6).jpeg','','','/product/nb574/红绿灯系列、复古跑步鞋/nb 574 红绿灯系列 黄色 36-44/黄色 36-44 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('366','60','黄色 36-44.jpeg','','','/product/nb574/红绿灯系列、复古跑步鞋/nb 574 红绿灯系列 黄色 36-44/黄色 36-44.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('367','61','绿色 36-44 (2).jpeg','','','/product/nb574/红绿灯系列、复古跑步鞋/nb 574 红绿灯系列 绿色 36-44/绿色 36-44 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('368','61','绿色 36-44 (3).jpeg','','','/product/nb574/红绿灯系列、复古跑步鞋/nb 574 红绿灯系列 绿色 36-44/绿色 36-44 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('369','61','绿色 36-44 (4).jpeg','','','/product/nb574/红绿灯系列、复古跑步鞋/nb 574 红绿灯系列 绿色 36-44/绿色 36-44 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('370','61','绿色 36-44.jpeg','','','/product/nb574/红绿灯系列、复古跑步鞋/nb 574 红绿灯系列 绿色 36-44/绿色 36-44.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('371','63','宝蓝色白色 36-39 (2).jpeg','','','/product/nb574/护照系列/nb 574 护照系列 宝蓝色白色 36-39/宝蓝色白色 36-39 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('372','63','宝蓝色白色 36-39 (3).jpeg','','','/product/nb574/护照系列/nb 574 护照系列 宝蓝色白色 36-39/宝蓝色白色 36-39 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('373','63','宝蓝色白色 36-39 (4).jpeg','','','/product/nb574/护照系列/nb 574 护照系列 宝蓝色白色 36-39/宝蓝色白色 36-39 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('374','63','宝蓝色白色 36-39 (5).jpeg','','','/product/nb574/护照系列/nb 574 护照系列 宝蓝色白色 36-39/宝蓝色白色 36-39 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('375','63','宝蓝色白色 36-39 (6).jpeg','','','/product/nb574/护照系列/nb 574 护照系列 宝蓝色白色 36-39/宝蓝色白色 36-39 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('376','63','宝蓝色白色 36-39.jpeg','','','/product/nb574/护照系列/nb 574 护照系列 宝蓝色白色 36-39/宝蓝色白色 36-39.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('377','64','宝兰黄 36--44 (2).jpeg','','','/product/nb574/护照系列/nb 574 护照系列 宝兰黄 36--44/宝兰黄 36--44 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('378','64','宝兰黄 36--44 (3).jpeg','','','/product/nb574/护照系列/nb 574 护照系列 宝兰黄 36--44/宝兰黄 36--44 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('379','64','宝兰黄 36--44 (4).jpeg','','','/product/nb574/护照系列/nb 574 护照系列 宝兰黄 36--44/宝兰黄 36--44 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('380','64','宝兰黄 36--44.jpeg','','','/product/nb574/护照系列/nb 574 护照系列 宝兰黄 36--44/宝兰黄 36--44.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('381','65','粉红绿白黄 36-39 (2).jpeg','','','/product/nb574/护照系列/nb 574 护照系列 粉红绿白黄 36-39/粉红绿白黄 36-39 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('382','65','粉红绿白黄 36-39 (3).jpeg','','','/product/nb574/护照系列/nb 574 护照系列 粉红绿白黄 36-39/粉红绿白黄 36-39 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('383','65','粉红绿白黄 36-39 (4).jpeg','','','/product/nb574/护照系列/nb 574 护照系列 粉红绿白黄 36-39/粉红绿白黄 36-39 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('384','65','粉红绿白黄 36-39 (5).jpeg','','','/product/nb574/护照系列/nb 574 护照系列 粉红绿白黄 36-39/粉红绿白黄 36-39 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('385','65','粉红绿白黄 36-39 (6).jpeg','','','/product/nb574/护照系列/nb 574 护照系列 粉红绿白黄 36-39/粉红绿白黄 36-39 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('386','65','粉红绿白黄 36-39.jpeg','','','/product/nb574/护照系列/nb 574 护照系列 粉红绿白黄 36-39/粉红绿白黄 36-39.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('387','66','灰兰红 36--44 (2).jpeg','','','/product/nb574/护照系列/nb 574 护照系列 灰兰红 36--44/灰兰红 36--44 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('388','66','灰兰红 36--44 (3).jpeg','','','/product/nb574/护照系列/nb 574 护照系列 灰兰红 36--44/灰兰红 36--44 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('389','66','灰兰红 36--44 (4).jpeg','','','/product/nb574/护照系列/nb 574 护照系列 灰兰红 36--44/灰兰红 36--44 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('390','66','灰兰红 36--44.jpeg','','','/product/nb574/护照系列/nb 574 护照系列 灰兰红 36--44/灰兰红 36--44.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('391','67','酒红黄 36--44 (2).jpeg','','','/product/nb574/护照系列/nb 574 护照系列 酒红黄 36--44/酒红黄 36--44 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('392','67','酒红黄 36--44 (3).jpeg','','','/product/nb574/护照系列/nb 574 护照系列 酒红黄 36--44/酒红黄 36--44 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('393','67','酒红黄 36--44 (4).jpeg','','','/product/nb574/护照系列/nb 574 护照系列 酒红黄 36--44/酒红黄 36--44 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('394','67','酒红黄 36--44.jpeg','','','/product/nb574/护照系列/nb 574 护照系列 酒红黄 36--44/酒红黄 36--44.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('395','68','浅紫色白色 36-39 (2).jpeg','','','/product/nb574/护照系列/nb 574 护照系列 浅紫色白色 36-39/浅紫色白色 36-39 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('396','68','浅紫色白色 36-39 (3).jpeg','','','/product/nb574/护照系列/nb 574 护照系列 浅紫色白色 36-39/浅紫色白色 36-39 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('397','68','浅紫色白色 36-39 (4).jpeg','','','/product/nb574/护照系列/nb 574 护照系列 浅紫色白色 36-39/浅紫色白色 36-39 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('398','68','浅紫色白色 36-39 (5).jpeg','','','/product/nb574/护照系列/nb 574 护照系列 浅紫色白色 36-39/浅紫色白色 36-39 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('399','68','浅紫色白色 36-39 (6).jpeg','','','/product/nb574/护照系列/nb 574 护照系列 浅紫色白色 36-39/浅紫色白色 36-39 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('400','68','浅紫色白色 36-39.jpeg','','','/product/nb574/护照系列/nb 574 护照系列 浅紫色白色 36-39/浅紫色白色 36-39.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('401','69','2.jpeg','','','/product/nb574/护照系列/nb 574 护照系列 深兰红 36--44/2.jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('402','69','3.jpeg','','','/product/nb574/护照系列/nb 574 护照系列 深兰红 36--44/3.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('403','69','4.jpeg','','','/product/nb574/护照系列/nb 574 护照系列 深兰红 36--44/4.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('404','69','5.jpeg','','','/product/nb574/护照系列/nb 574 护照系列 深兰红 36--44/5.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('405','71','渐变海水蓝35-44 (2).jpg','','','/product/nb574/渐变系列、御风者系列/nb 574 渐变系列 海水蓝 36-44/渐变海水蓝35-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('406','71','渐变海水蓝35-44 (3).jpg','','','/product/nb574/渐变系列、御风者系列/nb 574 渐变系列 海水蓝 36-44/渐变海水蓝35-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('407','71','渐变海水蓝35-44 (4).jpg','','','/product/nb574/渐变系列、御风者系列/nb 574 渐变系列 海水蓝 36-44/渐变海水蓝35-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('408','71','渐变海水蓝35-44 (5).jpg','','','/product/nb574/渐变系列、御风者系列/nb 574 渐变系列 海水蓝 36-44/渐变海水蓝35-44 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('409','71','渐变海水蓝35-44 (6).jpg','','','/product/nb574/渐变系列、御风者系列/nb 574 渐变系列 海水蓝 36-44/渐变海水蓝35-44 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('410','71','渐变海水蓝35-44 (7).jpg','','','/product/nb574/渐变系列、御风者系列/nb 574 渐变系列 海水蓝 36-44/渐变海水蓝35-44 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('411','71','渐变海水蓝35-44.jpg','','','/product/nb574/渐变系列、御风者系列/nb 574 渐变系列 海水蓝 36-44/渐变海水蓝35-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('412','72','渐变红色35-44 (2).jpg','','','/product/nb574/渐变系列、御风者系列/nb 574 渐变系列 红色 36-44/渐变红色35-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('413','72','渐变红色35-44 (3).jpg','','','/product/nb574/渐变系列、御风者系列/nb 574 渐变系列 红色 36-44/渐变红色35-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('414','72','渐变红色35-44 (4).jpg','','','/product/nb574/渐变系列、御风者系列/nb 574 渐变系列 红色 36-44/渐变红色35-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('415','72','渐变红色35-44 (5).jpg','','','/product/nb574/渐变系列、御风者系列/nb 574 渐变系列 红色 36-44/渐变红色35-44 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('416','72','渐变红色35-44 (6).jpg','','','/product/nb574/渐变系列、御风者系列/nb 574 渐变系列 红色 36-44/渐变红色35-44 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('417','72','渐变红色35-44 (7).jpg','','','/product/nb574/渐变系列、御风者系列/nb 574 渐变系列 红色 36-44/渐变红色35-44 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('418','72','渐变红色35-44.jpg','','','/product/nb574/渐变系列、御风者系列/nb 574 渐变系列 红色 36-44/渐变红色35-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('419','73','日落黄 35-44 (2).jpeg','','','/product/nb574/渐变系列、御风者系列/nb 574 渐变系列 日落黄 36-44/日落黄 35-44 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('420','73','日落黄 35-44 (3).jpeg','','','/product/nb574/渐变系列、御风者系列/nb 574 渐变系列 日落黄 36-44/日落黄 35-44 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('421','73','日落黄 35-44 (4).jpeg','','','/product/nb574/渐变系列、御风者系列/nb 574 渐变系列 日落黄 36-44/日落黄 35-44 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('422','73','日落黄 35-44.jpeg','','','/product/nb574/渐变系列、御风者系列/nb 574 渐变系列 日落黄 36-44/日落黄 35-44.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('423','74','渐变森林绿35-44 (2).jpg','','','/product/nb574/渐变系列、御风者系列/nb 574 渐变系列 森林绿 36-44/渐变森林绿35-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('424','74','渐变森林绿35-44 (3).jpg','','','/product/nb574/渐变系列、御风者系列/nb 574 渐变系列 森林绿 36-44/渐变森林绿35-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('425','74','渐变森林绿35-44 (4).jpg','','','/product/nb574/渐变系列、御风者系列/nb 574 渐变系列 森林绿 36-44/渐变森林绿35-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('426','74','渐变森林绿35-44 (5).jpg','','','/product/nb574/渐变系列、御风者系列/nb 574 渐变系列 森林绿 36-44/渐变森林绿35-44 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('427','74','渐变森林绿35-44 (6).jpg','','','/product/nb574/渐变系列、御风者系列/nb 574 渐变系列 森林绿 36-44/渐变森林绿35-44 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('428','74','渐变森林绿35-44 (7).jpg','','','/product/nb574/渐变系列、御风者系列/nb 574 渐变系列 森林绿 36-44/渐变森林绿35-44 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('429','74','渐变森林绿35-44.jpg','','','/product/nb574/渐变系列、御风者系列/nb 574 渐变系列 森林绿 36-44/渐变森林绿35-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('430','75','黑玉紫 36-39 (2).jpeg','','','/product/nb574/渐变系列、御风者系列/nb 574 御风者系列 黑玉紫 36-39/黑玉紫 36-39 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('431','75','黑玉紫 36-39 (3).jpeg','','','/product/nb574/渐变系列、御风者系列/nb 574 御风者系列 黑玉紫 36-39/黑玉紫 36-39 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('432','75','黑玉紫 36-39 (4).jpeg','','','/product/nb574/渐变系列、御风者系列/nb 574 御风者系列 黑玉紫 36-39/黑玉紫 36-39 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('433','75','黑玉紫 36-39 (5).jpeg','','','/product/nb574/渐变系列、御风者系列/nb 574 御风者系列 黑玉紫 36-39/黑玉紫 36-39 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('434','75','黑玉紫 36-39.jpeg','','','/product/nb574/渐变系列、御风者系列/nb 574 御风者系列 黑玉紫 36-39/黑玉紫 36-39.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('435','76','丽桃红黑 36-39 (2).jpeg','','','/product/nb574/渐变系列、御风者系列/nb 574 御风者系列 丽桃红黑 36-39/丽桃红黑 36-39 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('436','76','丽桃红黑 36-39 (3).jpeg','','','/product/nb574/渐变系列、御风者系列/nb 574 御风者系列 丽桃红黑 36-39/丽桃红黑 36-39 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('437','76','丽桃红黑 36-39 (4).jpeg','','','/product/nb574/渐变系列、御风者系列/nb 574 御风者系列 丽桃红黑 36-39/丽桃红黑 36-39 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('438','76','丽桃红黑 36-39 (5).jpeg','','','/product/nb574/渐变系列、御风者系列/nb 574 御风者系列 丽桃红黑 36-39/丽桃红黑 36-39 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('439','76','丽桃红黑 36-39.jpeg','','','/product/nb574/渐变系列、御风者系列/nb 574 御风者系列 丽桃红黑 36-39/丽桃红黑 36-39.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('440','78','仙人紫 36-39 (2).jpeg','','','/product/nb574/渐变系列、御风者系列/nb 574 御风者系列 仙人紫 36-39/仙人紫 36-39 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('441','78','仙人紫 36-39 (3).jpeg','','','/product/nb574/渐变系列、御风者系列/nb 574 御风者系列 仙人紫 36-39/仙人紫 36-39 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('442','78','仙人紫 36-39 (4).jpeg','','','/product/nb574/渐变系列、御风者系列/nb 574 御风者系列 仙人紫 36-39/仙人紫 36-39 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('443','78','仙人紫 36-39 (5).jpeg','','','/product/nb574/渐变系列、御风者系列/nb 574 御风者系列 仙人紫 36-39/仙人紫 36-39 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('444','78','仙人紫 36-39.jpeg','','','/product/nb574/渐变系列、御风者系列/nb 574 御风者系列 仙人紫 36-39/仙人紫 36-39.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('445','79','橡果蓝 原子蓝 36-39 (2).jpeg','','','/product/nb574/渐变系列、御风者系列/nb 574 御风者系列 橡果蓝 原子蓝 36-39/橡果蓝 原子蓝 36-39 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('446','79','橡果蓝 原子蓝 36-39 (3).jpeg','','','/product/nb574/渐变系列、御风者系列/nb 574 御风者系列 橡果蓝 原子蓝 36-39/橡果蓝 原子蓝 36-39 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('447','79','橡果蓝 原子蓝 36-39 (4).jpeg','','','/product/nb574/渐变系列、御风者系列/nb 574 御风者系列 橡果蓝 原子蓝 36-39/橡果蓝 原子蓝 36-39 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('448','79','橡果蓝 原子蓝 36-39 (5).jpeg','','','/product/nb574/渐变系列、御风者系列/nb 574 御风者系列 橡果蓝 原子蓝 36-39/橡果蓝 原子蓝 36-39 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('449','79','橡果蓝 原子蓝 36-39.jpeg','','','/product/nb574/渐变系列、御风者系列/nb 574 御风者系列 橡果蓝 原子蓝 36-39/橡果蓝 原子蓝 36-39.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('450','81','粉月色 36-39 (2).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 糖果系列 粉月色 36-39/粉月色 36-39 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('451','81','粉月色 36-39 (3).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 糖果系列 粉月色 36-39/粉月色 36-39 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('452','81','粉月色 36-39 (4).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 糖果系列 粉月色 36-39/粉月色 36-39 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('453','81','粉月色 36-39 (5).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 糖果系列 粉月色 36-39/粉月色 36-39 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('454','81','粉月色 36-39.jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 糖果系列 粉月色 36-39/粉月色 36-39.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('455','82','黑莓紫 36-39 (2).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 糖果系列 黑莓紫 36-39/黑莓紫 36-39 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('456','82','黑莓紫 36-39 (3).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 糖果系列 黑莓紫 36-39/黑莓紫 36-39 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('457','82','黑莓紫 36-39 (4).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 糖果系列 黑莓紫 36-39/黑莓紫 36-39 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('458','82','黑莓紫 36-39 (5).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 糖果系列 黑莓紫 36-39/黑莓紫 36-39 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('459','82','黑莓紫 36-39 (6).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 糖果系列 黑莓紫 36-39/黑莓紫 36-39 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('460','82','黑莓紫 36-39 (7).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 糖果系列 黑莓紫 36-39/黑莓紫 36-39 (7).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('461','82','黑莓紫 36-39 (8).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 糖果系列 黑莓紫 36-39/黑莓紫 36-39 (8).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('462','82','黑莓紫 36-39.jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 糖果系列 黑莓紫 36-39/黑莓紫 36-39.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('463','83','焦炭灰 36-39 (2).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 糖果系列 焦炭灰 36-39/焦炭灰 36-39 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('464','83','焦炭灰 36-39 (3).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 糖果系列 焦炭灰 36-39/焦炭灰 36-39 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('465','83','焦炭灰 36-39 (4).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 糖果系列 焦炭灰 36-39/焦炭灰 36-39 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('466','83','焦炭灰 36-39 (5).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 糖果系列 焦炭灰 36-39/焦炭灰 36-39 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('467','83','焦炭灰 36-39 (6).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 糖果系列 焦炭灰 36-39/焦炭灰 36-39 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('468','83','焦炭灰 36-39 (7).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 糖果系列 焦炭灰 36-39/焦炭灰 36-39 (7).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('469','83','焦炭灰 36-39 (8).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 糖果系列 焦炭灰 36-39/焦炭灰 36-39 (8).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('470','83','焦炭灰 36-39.jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 糖果系列 焦炭灰 36-39/焦炭灰 36-39.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('471','84','钴深蓝 36-39 (2).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 糖果系列 钴深蓝 36-39/钴深蓝 36-39 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('472','84','钴深蓝 36-39 (3).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 糖果系列 钴深蓝 36-39/钴深蓝 36-39 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('473','84','钴深蓝 36-39 (4).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 糖果系列 钴深蓝 36-39/钴深蓝 36-39 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('474','84','钴深蓝 36-39 (5).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 糖果系列 钴深蓝 36-39/钴深蓝 36-39 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('475','84','钴深蓝 36-39 (6).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 糖果系列 钴深蓝 36-39/钴深蓝 36-39 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('476','84','钴深蓝 36-39 (7).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 糖果系列 钴深蓝 36-39/钴深蓝 36-39 (7).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('477','84','钴深蓝 36-39.jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 糖果系列 钴深蓝 36-39/钴深蓝 36-39.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('478','85','黑水蓝 40-44 (2).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 夏威夷系列 黑水蓝 40-44/黑水蓝 40-44 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('479','85','黑水蓝 40-44 (3).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 夏威夷系列 黑水蓝 40-44/黑水蓝 40-44 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('480','85','黑水蓝 40-44 (4).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 夏威夷系列 黑水蓝 40-44/黑水蓝 40-44 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('481','85','黑水蓝 40-44 (5).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 夏威夷系列 黑水蓝 40-44/黑水蓝 40-44 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('482','85','黑水蓝 40-44 (6).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 夏威夷系列 黑水蓝 40-44/黑水蓝 40-44 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('483','85','黑水蓝 40-44 (7).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 夏威夷系列 黑水蓝 40-44/黑水蓝 40-44 (7).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('484','85','黑水蓝 40-44 (8).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 夏威夷系列 黑水蓝 40-44/黑水蓝 40-44 (8).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('485','85','黑水蓝 40-44 (9).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 夏威夷系列 黑水蓝 40-44/黑水蓝 40-44 (9).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('486','85','黑水蓝 40-44.jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 夏威夷系列 黑水蓝 40-44/黑水蓝 40-44.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('487','86','黄橙色 40-44 (2).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 夏威夷系列 黄橙色 40-44/黄橙色 40-44 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('488','86','黄橙色 40-44 (3).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 夏威夷系列 黄橙色 40-44/黄橙色 40-44 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('489','86','黄橙色 40-44 (4).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 夏威夷系列 黄橙色 40-44/黄橙色 40-44 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('490','86','黄橙色 40-44 (5).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 夏威夷系列 黄橙色 40-44/黄橙色 40-44 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('491','86','黄橙色 40-44 (6).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 夏威夷系列 黄橙色 40-44/黄橙色 40-44 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('492','86','黄橙色 40-44 (7).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 夏威夷系列 黄橙色 40-44/黄橙色 40-44 (7).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('493','86','黄橙色 40-44 (8).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 夏威夷系列 黄橙色 40-44/黄橙色 40-44 (8).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('494','86','黄橙色 40-44 (9).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 夏威夷系列 黄橙色 40-44/黄橙色 40-44 (9).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('495','86','黄橙色 40-44.jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 夏威夷系列 黄橙色 40-44/黄橙色 40-44.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('496','87','浅绿黄 40-44 (2).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 夏威夷系列 浅绿黄 40-44/浅绿黄 40-44 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('497','87','浅绿黄 40-44 (3).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 夏威夷系列 浅绿黄 40-44/浅绿黄 40-44 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('498','87','浅绿黄 40-44 (4).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 夏威夷系列 浅绿黄 40-44/浅绿黄 40-44 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('499','87','浅绿黄 40-44 (5).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 夏威夷系列 浅绿黄 40-44/浅绿黄 40-44 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('500','87','浅绿黄 40-44 (6).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 夏威夷系列 浅绿黄 40-44/浅绿黄 40-44 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('501','87','浅绿黄 40-44 (7).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 夏威夷系列 浅绿黄 40-44/浅绿黄 40-44 (7).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('502','87','浅绿黄 40-44 (8).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 夏威夷系列 浅绿黄 40-44/浅绿黄 40-44 (8).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('503','87','浅绿黄 40-44 (9).jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 夏威夷系列 浅绿黄 40-44/浅绿黄 40-44 (9).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('504','87','浅绿黄 40-44.jpeg','','','/product/nb574/糖果系列、夏威夷系列/nb 574 夏威夷系列 浅绿黄 40-44/浅绿黄 40-44.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('505','89','暗酒红 36-44 (2).jpeg','','','/product/nb574/五环系列、三原色/nb 三原色系列 暗酒红 36-44/暗酒红 36-44 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('506','89','暗酒红 36-44 (3).jpeg','','','/product/nb574/五环系列、三原色/nb 三原色系列 暗酒红 36-44/暗酒红 36-44 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('507','89','暗酒红 36-44 (5).jpeg','','','/product/nb574/五环系列、三原色/nb 三原色系列 暗酒红 36-44/暗酒红 36-44 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('508','89','暗酒红 36-44 (6).jpeg','','','/product/nb574/五环系列、三原色/nb 三原色系列 暗酒红 36-44/暗酒红 36-44 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('509','89','暗酒红 36-44.jpeg','','','/product/nb574/五环系列、三原色/nb 三原色系列 暗酒红 36-44/暗酒红 36-44.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('510','90','海军蓝 36-44 (2).jpeg','','','/product/nb574/五环系列、三原色/nb 三原色系列 海军蓝 36-44/海军蓝 36-44 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('511','90','海军蓝 36-44 (3).jpeg','','','/product/nb574/五环系列、三原色/nb 三原色系列 海军蓝 36-44/海军蓝 36-44 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('512','90','海军蓝 36-44 (4).jpeg','','','/product/nb574/五环系列、三原色/nb 三原色系列 海军蓝 36-44/海军蓝 36-44 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('513','90','海军蓝 36-44 (5).jpeg','','','/product/nb574/五环系列、三原色/nb 三原色系列 海军蓝 36-44/海军蓝 36-44 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('514','90','海军蓝 36-44 (6).jpeg','','','/product/nb574/五环系列、三原色/nb 三原色系列 海军蓝 36-44/海军蓝 36-44 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('515','90','海军蓝 36-44.jpeg','','','/product/nb574/五环系列、三原色/nb 三原色系列 海军蓝 36-44/海军蓝 36-44.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('516','91','经典灰 36-44 (2).jpeg','','','/product/nb574/五环系列、三原色/nb 三原色系列 经典灰 36-44/经典灰 36-44 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('517','91','经典灰 36-44 (3).jpeg','','','/product/nb574/五环系列、三原色/nb 三原色系列 经典灰 36-44/经典灰 36-44 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('518','91','经典灰 36-44 (5).jpeg','','','/product/nb574/五环系列、三原色/nb 三原色系列 经典灰 36-44/经典灰 36-44 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('519','91','经典灰 36-44 (6).jpeg','','','/product/nb574/五环系列、三原色/nb 三原色系列 经典灰 36-44/经典灰 36-44 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('520','91','经典灰 36-44.jpeg','','','/product/nb574/五环系列、三原色/nb 三原色系列 经典灰 36-44/经典灰 36-44.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('521','92','黑白 36-44 (2).jpeg','','','/product/nb574/五环系列、三原色/nb 五环系列 黑白 36-44/黑白 36-44 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('522','92','黑白 36-44 (3).jpeg','','','/product/nb574/五环系列、三原色/nb 五环系列 黑白 36-44/黑白 36-44 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('523','92','黑白 36-44 (4).jpeg','','','/product/nb574/五环系列、三原色/nb 五环系列 黑白 36-44/黑白 36-44 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('524','92','黑白 36-44 (5).jpeg','','','/product/nb574/五环系列、三原色/nb 五环系列 黑白 36-44/黑白 36-44 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('525','92','黑白 36-44.jpeg','','','/product/nb574/五环系列、三原色/nb 五环系列 黑白 36-44/黑白 36-44.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('526','93','红白 36-44 (2).jpeg','','','/product/nb574/五环系列、三原色/nb 五环系列 红白 36-44/红白 36-44 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('527','93','红白 36-44 (3).jpeg','','','/product/nb574/五环系列、三原色/nb 五环系列 红白 36-44/红白 36-44 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('528','93','红白 36-44 (4).jpeg','','','/product/nb574/五环系列、三原色/nb 五环系列 红白 36-44/红白 36-44 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('529','93','红白 36-44 (5).jpeg','','','/product/nb574/五环系列、三原色/nb 五环系列 红白 36-44/红白 36-44 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('530','93','红白 36-44.jpeg','','','/product/nb574/五环系列、三原色/nb 五环系列 红白 36-44/红白 36-44.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('531','94','蓝白 36-44 (2).jpeg','','','/product/nb574/五环系列、三原色/nb 五环系列 蓝白 36-44/蓝白 36-44 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('532','94','蓝白 36-44 (3).jpeg','','','/product/nb574/五环系列、三原色/nb 五环系列 蓝白 36-44/蓝白 36-44 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('533','94','蓝白 36-44 (4).jpeg','','','/product/nb574/五环系列、三原色/nb 五环系列 蓝白 36-44/蓝白 36-44 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('534','94','蓝白 36-44 (5).jpeg','','','/product/nb574/五环系列、三原色/nb 五环系列 蓝白 36-44/蓝白 36-44 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('535','94','蓝白 36-44 (6).jpeg','','','/product/nb574/五环系列、三原色/nb 五环系列 蓝白 36-44/蓝白 36-44 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('536','94','蓝白 36-44.jpeg','','','/product/nb574/五环系列、三原色/nb 五环系列 蓝白 36-44/蓝白 36-44.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('537','96','灰紫 36-39 (2).jpg','','','/product/nb574/小蛮腰系列、马尔代夫系列/nb 574 马尔代夫系列 灰紫 36-39/灰紫 36-39 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('538','96','灰紫 36-39 (3).jpg','','','/product/nb574/小蛮腰系列、马尔代夫系列/nb 574 马尔代夫系列 灰紫 36-39/灰紫 36-39 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('539','96','灰紫 36-39 (4).jpg','','','/product/nb574/小蛮腰系列、马尔代夫系列/nb 574 马尔代夫系列 灰紫 36-39/灰紫 36-39 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('540','96','灰紫 36-39 (5).jpg','','','/product/nb574/小蛮腰系列、马尔代夫系列/nb 574 马尔代夫系列 灰紫 36-39/灰紫 36-39 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('541','96','灰紫 36-39 (6).jpg','','','/product/nb574/小蛮腰系列、马尔代夫系列/nb 574 马尔代夫系列 灰紫 36-39/灰紫 36-39 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('542','96','灰紫 36-39.jpg','','','/product/nb574/小蛮腰系列、马尔代夫系列/nb 574 马尔代夫系列 灰紫 36-39/灰紫 36-39.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('543','97','绿色 36-39 (2).jpeg','','','/product/nb574/小蛮腰系列、马尔代夫系列/nb 574 马尔代夫系列 绿色 36-39/绿色 36-39 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('544','97','绿色 36-39 (3).jpeg','','','/product/nb574/小蛮腰系列、马尔代夫系列/nb 574 马尔代夫系列 绿色 36-39/绿色 36-39 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('545','97','绿色 36-39 (4).jpeg','','','/product/nb574/小蛮腰系列、马尔代夫系列/nb 574 马尔代夫系列 绿色 36-39/绿色 36-39 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('546','97','绿色 36-39.jpeg','','','/product/nb574/小蛮腰系列、马尔代夫系列/nb 574 马尔代夫系列 绿色 36-39/绿色 36-39.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('547','98','天蓝绿 36-39 (2).jpg','','','/product/nb574/小蛮腰系列、马尔代夫系列/nb 574 马尔代夫系列 天蓝绿 36-39/天蓝绿 36-39 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('548','98','天蓝绿 36-39 (3).jpg','','','/product/nb574/小蛮腰系列、马尔代夫系列/nb 574 马尔代夫系列 天蓝绿 36-39/天蓝绿 36-39 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('549','98','天蓝绿 36-39 (4).jpg','','','/product/nb574/小蛮腰系列、马尔代夫系列/nb 574 马尔代夫系列 天蓝绿 36-39/天蓝绿 36-39 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('550','98','天蓝绿 36-39 (5).jpg','','','/product/nb574/小蛮腰系列、马尔代夫系列/nb 574 马尔代夫系列 天蓝绿 36-39/天蓝绿 36-39 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('551','98','天蓝绿 36-39.jpg','','','/product/nb574/小蛮腰系列、马尔代夫系列/nb 574 马尔代夫系列 天蓝绿 36-39/天蓝绿 36-39.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('552','99','红黄青蓝 36-39 (2).jpeg','','','/product/nb574/小蛮腰系列、马尔代夫系列/nb 574 小蛮腰系列 红黄青蓝 36-39/红黄青蓝 36-39 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('553','99','红黄青蓝 36-39 (3).jpeg','','','/product/nb574/小蛮腰系列、马尔代夫系列/nb 574 小蛮腰系列 红黄青蓝 36-39/红黄青蓝 36-39 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('554','99','红黄青蓝 36-39 (4).jpeg','','','/product/nb574/小蛮腰系列、马尔代夫系列/nb 574 小蛮腰系列 红黄青蓝 36-39/红黄青蓝 36-39 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('555','99','红黄青蓝 36-39 (5).jpeg','','','/product/nb574/小蛮腰系列、马尔代夫系列/nb 574 小蛮腰系列 红黄青蓝 36-39/红黄青蓝 36-39 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('556','99','红黄青蓝 36-39 (6).jpeg','','','/product/nb574/小蛮腰系列、马尔代夫系列/nb 574 小蛮腰系列 红黄青蓝 36-39/红黄青蓝 36-39 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('557','99','红黄青蓝 36-39 (7).jpeg','','','/product/nb574/小蛮腰系列、马尔代夫系列/nb 574 小蛮腰系列 红黄青蓝 36-39/红黄青蓝 36-39 (7).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('558','99','红黄青蓝 36-39 (8).jpeg','','','/product/nb574/小蛮腰系列、马尔代夫系列/nb 574 小蛮腰系列 红黄青蓝 36-39/红黄青蓝 36-39 (8).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('559','99','红黄青蓝 36-39 (9).jpeg','','','/product/nb574/小蛮腰系列、马尔代夫系列/nb 574 小蛮腰系列 红黄青蓝 36-39/红黄青蓝 36-39 (9).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('560','99','红黄青蓝 36-39.jpeg','','','/product/nb574/小蛮腰系列、马尔代夫系列/nb 574 小蛮腰系列 红黄青蓝 36-39/红黄青蓝 36-39.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('561','100','黄粉深蓝 36-39 (2).jpeg','','','/product/nb574/小蛮腰系列、马尔代夫系列/nb 574 小蛮腰系列 黄粉深蓝 36-39/黄粉深蓝 36-39 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('562','100','黄粉深蓝 36-39 (3).jpeg','','','/product/nb574/小蛮腰系列、马尔代夫系列/nb 574 小蛮腰系列 黄粉深蓝 36-39/黄粉深蓝 36-39 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('563','100','黄粉深蓝 36-39 (4).jpeg','','','/product/nb574/小蛮腰系列、马尔代夫系列/nb 574 小蛮腰系列 黄粉深蓝 36-39/黄粉深蓝 36-39 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('564','100','黄粉深蓝 36-39 (5).jpeg','','','/product/nb574/小蛮腰系列、马尔代夫系列/nb 574 小蛮腰系列 黄粉深蓝 36-39/黄粉深蓝 36-39 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('565','100','黄粉深蓝 36-39 (6).jpeg','','','/product/nb574/小蛮腰系列、马尔代夫系列/nb 574 小蛮腰系列 黄粉深蓝 36-39/黄粉深蓝 36-39 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('566','100','黄粉深蓝 36-39 (7).jpeg','','','/product/nb574/小蛮腰系列、马尔代夫系列/nb 574 小蛮腰系列 黄粉深蓝 36-39/黄粉深蓝 36-39 (7).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('567','100','黄粉深蓝 36-39 (8).jpeg','','','/product/nb574/小蛮腰系列、马尔代夫系列/nb 574 小蛮腰系列 黄粉深蓝 36-39/黄粉深蓝 36-39 (8).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('568','100','黄粉深蓝 36-39 (9).jpeg','','','/product/nb574/小蛮腰系列、马尔代夫系列/nb 574 小蛮腰系列 黄粉深蓝 36-39/黄粉深蓝 36-39 (9).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('569','100','黄粉深蓝 36-39.jpeg','','','/product/nb574/小蛮腰系列、马尔代夫系列/nb 574 小蛮腰系列 黄粉深蓝 36-39/黄粉深蓝 36-39.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('570','101','绿粉红 36-39 (2).jpeg','','','/product/nb574/小蛮腰系列、马尔代夫系列/nb 574 小蛮腰系列 绿粉红 36-39/绿粉红 36-39 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('571','101','绿粉红 36-39 (3).jpeg','','','/product/nb574/小蛮腰系列、马尔代夫系列/nb 574 小蛮腰系列 绿粉红 36-39/绿粉红 36-39 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('572','101','绿粉红 36-39 (4).jpeg','','','/product/nb574/小蛮腰系列、马尔代夫系列/nb 574 小蛮腰系列 绿粉红 36-39/绿粉红 36-39 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('573','101','绿粉红 36-39 (5).jpeg','','','/product/nb574/小蛮腰系列、马尔代夫系列/nb 574 小蛮腰系列 绿粉红 36-39/绿粉红 36-39 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('574','101','绿粉红 36-39 (6).jpeg','','','/product/nb574/小蛮腰系列、马尔代夫系列/nb 574 小蛮腰系列 绿粉红 36-39/绿粉红 36-39 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('575','101','绿粉红 36-39 (7).jpeg','','','/product/nb574/小蛮腰系列、马尔代夫系列/nb 574 小蛮腰系列 绿粉红 36-39/绿粉红 36-39 (7).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('576','101','绿粉红 36-39 (8).jpeg','','','/product/nb574/小蛮腰系列、马尔代夫系列/nb 574 小蛮腰系列 绿粉红 36-39/绿粉红 36-39 (8).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('577','101','绿粉红 36-39 (9).jpeg','','','/product/nb574/小蛮腰系列、马尔代夫系列/nb 574 小蛮腰系列 绿粉红 36-39/绿粉红 36-39 (9).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('578','101','绿粉红 36-39.jpeg','','','/product/nb574/小蛮腰系列、马尔代夫系列/nb 574 小蛮腰系列 绿粉红 36-39/绿粉红 36-39.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('579','103','丛林绿 36-45 (2).jpeg','','','/product/nb990/nb990 丛林绿 36-45/丛林绿 36-45 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('580','103','丛林绿 36-45 (3).jpeg','','','/product/nb990/nb990 丛林绿 36-45/丛林绿 36-45 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('581','103','丛林绿 36-45 (4).jpeg','','','/product/nb990/nb990 丛林绿 36-45/丛林绿 36-45 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('582','103','丛林绿 36-45.jpeg','','','/product/nb990/nb990 丛林绿 36-45/丛林绿 36-45.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('583','104','黑 36-45 (2).jpeg','','','/product/nb990/nb990 黑 36-45/黑 36-45 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('584','104','黑 36-45 (3).jpeg','','','/product/nb990/nb990 黑 36-45/黑 36-45 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('585','104','黑 36-45 (4).jpeg','','','/product/nb990/nb990 黑 36-45/黑 36-45 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('586','104','黑 36-45 (5).jpeg','','','/product/nb990/nb990 黑 36-45/黑 36-45 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('587','104','黑 36-45.jpeg','','','/product/nb990/nb990 黑 36-45/黑 36-45.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('588','105','酒红 36-45 (2).jpeg','','','/product/nb990/nb990 酒红 36-45/酒红 36-45 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('589','105','酒红 36-45 (3).jpeg','','','/product/nb990/nb990 酒红 36-45/酒红 36-45 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('590','105','酒红 36-45 (4).jpeg','','','/product/nb990/nb990 酒红 36-45/酒红 36-45 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('591','105','酒红 36-45 (5).jpeg','','','/product/nb990/nb990 酒红 36-45/酒红 36-45 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('592','105','酒红 36-45 (6).jpeg','','','/product/nb990/nb990 酒红 36-45/酒红 36-45 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('593','105','酒红 36-45.jpeg','','','/product/nb990/nb990 酒红 36-45/酒红 36-45.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('594','106','玫瑰红 36-39 (2).jpeg','','','/product/nb990/nb990 玫瑰红 36-39/玫瑰红 36-39 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('595','106','玫瑰红 36-39 (3).jpeg','','','/product/nb990/nb990 玫瑰红 36-39/玫瑰红 36-39 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('596','106','玫瑰红 36-39 (4).jpeg','','','/product/nb990/nb990 玫瑰红 36-39/玫瑰红 36-39 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('597','106','玫瑰红 36-39 (5).jpeg','','','/product/nb990/nb990 玫瑰红 36-39/玫瑰红 36-39 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('598','106','玫瑰红 36-39 (6).jpeg','','','/product/nb990/nb990 玫瑰红 36-39/玫瑰红 36-39 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('599','106','玫瑰红 36-39 (7).jpeg','','','/product/nb990/nb990 玫瑰红 36-39/玫瑰红 36-39 (7).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('600','106','玫瑰红 36-39 (8).jpeg','','','/product/nb990/nb990 玫瑰红 36-39/玫瑰红 36-39 (8).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('601','106','玫瑰红 36-39 (9).jpeg','','','/product/nb990/nb990 玫瑰红 36-39/玫瑰红 36-39 (9).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('602','106','玫瑰红 36-39.jpeg','','','/product/nb990/nb990 玫瑰红 36-39/玫瑰红 36-39.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('603','107','深蓝 36-45 (10).jpeg','','','/product/nb990/nb990 深蓝 36-45/深蓝 36-45 (10).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('604','107','深蓝 36-45 (2).jpeg','','','/product/nb990/nb990 深蓝 36-45/深蓝 36-45 (2).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('605','107','深蓝 36-45 (3).jpeg','','','/product/nb990/nb990 深蓝 36-45/深蓝 36-45 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('606','107','深蓝 36-45 (4).jpeg','','','/product/nb990/nb990 深蓝 36-45/深蓝 36-45 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('607','107','深蓝 36-45 (5).jpeg','','','/product/nb990/nb990 深蓝 36-45/深蓝 36-45 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('608','107','深蓝 36-45 (6).jpeg','','','/product/nb990/nb990 深蓝 36-45/深蓝 36-45 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('609','107','深蓝 36-45 (7).jpg','','','/product/nb990/nb990 深蓝 36-45/深蓝 36-45 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('610','107','深蓝 36-45 (8).jpeg','','','/product/nb990/nb990 深蓝 36-45/深蓝 36-45 (8).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('611','107','深蓝 36-45 (9).jpeg','','','/product/nb990/nb990 深蓝 36-45/深蓝 36-45 (9).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('612','107','深蓝 36-45.jpeg','','','/product/nb990/nb990 深蓝 36-45/深蓝 36-45.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('613','108','元祖灰 36-45 (2).jpeg','','','/product/nb990/nb990 元祖灰 36-45/元祖灰 36-45 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('614','108','元祖灰 36-45 (3).jpeg','','','/product/nb990/nb990 元祖灰 36-45/元祖灰 36-45 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('615','108','元祖灰 36-45 (4).jpeg','','','/product/nb990/nb990 元祖灰 36-45/元祖灰 36-45 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('616','108','元祖灰 36-45 (5).jpeg','','','/product/nb990/nb990 元祖灰 36-45/元祖灰 36-45 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('617','108','元祖灰 36-45.jpeg','','','/product/nb990/nb990 元祖灰 36-45/元祖灰 36-45.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('618','109','中国兰 36-45 (10).jpeg','','','/product/nb990/nb990 中国兰 36-45/中国兰 36-45 (10).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('619','109','中国兰 36-45 (2).jpeg','','','/product/nb990/nb990 中国兰 36-45/中国兰 36-45 (2).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('620','109','中国兰 36-45 (3).jpeg','','','/product/nb990/nb990 中国兰 36-45/中国兰 36-45 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('621','109','中国兰 36-45 (4).jpeg','','','/product/nb990/nb990 中国兰 36-45/中国兰 36-45 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('622','109','中国兰 36-45 (5).jpeg','','','/product/nb990/nb990 中国兰 36-45/中国兰 36-45 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('623','109','中国兰 36-45 (6).jpeg','','','/product/nb990/nb990 中国兰 36-45/中国兰 36-45 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('624','109','中国兰 36-45 (7).jpeg','','','/product/nb990/nb990 中国兰 36-45/中国兰 36-45 (7).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('625','109','中国兰 36-45 (8).jpeg','','','/product/nb990/nb990 中国兰 36-45/中国兰 36-45 (8).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('626','109','中国兰 36-45 (9).jpeg','','','/product/nb990/nb990 中国兰 36-45/中国兰 36-45 (9).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('627','109','中国兰 36-45.jpeg','','','/product/nb990/nb990 中国兰 36-45/中国兰 36-45.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('628','110','藏青色36-45 (2).jpg','','','/product/nb990/nb990藏青色36-45/藏青色36-45 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('629','110','藏青色36-45 (3).jpg','','','/product/nb990/nb990藏青色36-45/藏青色36-45 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('630','110','藏青色36-45 (4).jpg','','','/product/nb990/nb990藏青色36-45/藏青色36-45 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('631','110','藏青色36-45 (5).jpg','','','/product/nb990/nb990藏青色36-45/藏青色36-45 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('632','110','藏青色36-45 (6).jpg','','','/product/nb990/nb990藏青色36-45/藏青色36-45 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('633','110','藏青色36-45 (7).jpg','','','/product/nb990/nb990藏青色36-45/藏青色36-45 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('634','110','藏青色36-45.jpg','','','/product/nb990/nb990藏青色36-45/藏青色36-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('635','112','nb996宝兰色36-44 (2).jpg','','','/product/nb996/nb996宝兰色36-44/nb996宝兰色36-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('636','112','nb996宝兰色36-44 (3).jpg','','','/product/nb996/nb996宝兰色36-44/nb996宝兰色36-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('637','112','nb996宝兰色36-44 (4).jpg','','','/product/nb996/nb996宝兰色36-44/nb996宝兰色36-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('638','112','nb996宝兰色36-44.jpg','','','/product/nb996/nb996宝兰色36-44/nb996宝兰色36-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('639','113','草绿色36-44 (2).jpg','','','/product/nb996/nb996草绿色36-44/草绿色36-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('640','113','草绿色36-44 (3).jpg','','','/product/nb996/nb996草绿色36-44/草绿色36-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('641','113','草绿色36-44 (4).jpg','','','/product/nb996/nb996草绿色36-44/草绿色36-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('642','113','草绿色36-44 (5).jpg','','','/product/nb996/nb996草绿色36-44/草绿色36-44 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('643','113','草绿色36-44 (6).jpg','','','/product/nb996/nb996草绿色36-44/草绿色36-44 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('644','113','草绿色36-44 (7).jpg','','','/product/nb996/nb996草绿色36-44/草绿色36-44 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('645','113','草绿色36-44.jpg','','','/product/nb996/nb996草绿色36-44/草绿色36-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('646','114','黑红36-44 (2).jpg','','','/product/nb996/nb996黑红36-44/黑红36-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('647','114','黑红36-44 (3).jpg','','','/product/nb996/nb996黑红36-44/黑红36-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('648','114','黑红36-44 (4).jpg','','','/product/nb996/nb996黑红36-44/黑红36-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('649','114','黑红36-44 (5).jpg','','','/product/nb996/nb996黑红36-44/黑红36-44 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('650','114','黑红36-44 (6).jpg','','','/product/nb996/nb996黑红36-44/黑红36-44 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('651','114','黑红36-44 (7).jpg','','','/product/nb996/nb996黑红36-44/黑红36-44 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('652','114','黑红36-44.jpg','','','/product/nb996/nb996黑红36-44/黑红36-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('653','115','灰深蓝35-44 (2).jpg','','','/product/nb996/nb996灰深蓝35-44/灰深蓝35-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('654','115','灰深蓝35-44 (3).jpg','','','/product/nb996/nb996灰深蓝35-44/灰深蓝35-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('655','115','灰深蓝35-44.jpg','','','/product/nb996/nb996灰深蓝35-44/灰深蓝35-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('656','116','浆果蓝色36-44 (2).jpg','','','/product/nb996/nb996浆果蓝色36-44/浆果蓝色36-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('657','116','浆果蓝色36-44 (3).jpg','','','/product/nb996/nb996浆果蓝色36-44/浆果蓝色36-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('658','116','浆果蓝色36-44 (4).jpg','','','/product/nb996/nb996浆果蓝色36-44/浆果蓝色36-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('659','116','浆果蓝色36-44 (5).jpg','','','/product/nb996/nb996浆果蓝色36-44/浆果蓝色36-44 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('660','116','浆果蓝色36-44.jpg','','','/product/nb996/nb996浆果蓝色36-44/浆果蓝色36-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('661','117','桔色黑35-44 (2).jpg','','','/product/nb996/nb996桔色黑35-44/桔色黑35-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('662','117','桔色黑35-44.jpg','','','/product/nb996/nb996桔色黑35-44/桔色黑35-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('663','118','酒红金色36-44 (2).jpg','','','/product/nb996/nb996酒红金色36-44/酒红金色36-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('664','118','酒红金色36-44 (3).jpg','','','/product/nb996/nb996酒红金色36-44/酒红金色36-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('665','118','酒红金色36-44 (4).jpg','','','/product/nb996/nb996酒红金色36-44/酒红金色36-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('666','118','酒红金色36-44 (5).jpg','','','/product/nb996/nb996酒红金色36-44/酒红金色36-44 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('667','118','酒红金色36-44 (6).jpg','','','/product/nb996/nb996酒红金色36-44/酒红金色36-44 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('668','118','酒红金色36-44 (7).jpg','','','/product/nb996/nb996酒红金色36-44/酒红金色36-44 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('669','118','酒红金色36-44.jpg','','','/product/nb996/nb996酒红金色36-44/酒红金色36-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('670','119','军绿深灰35-44 (2).jpg','','','/product/nb996/nb996军绿深灰35-44/军绿深灰35-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('671','119','军绿深灰35-44.jpg','','','/product/nb996/nb996军绿深灰35-44/军绿深灰35-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('672','120','咖啡色36-44 (2).jpg','','','/product/nb996/nb996咖啡色36-44/咖啡色36-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('673','120','咖啡色36-44 (3).jpg','','','/product/nb996/nb996咖啡色36-44/咖啡色36-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('674','120','咖啡色36-44 (4).jpg','','','/product/nb996/nb996咖啡色36-44/咖啡色36-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('675','120','咖啡色36-44 (5).jpg','','','/product/nb996/nb996咖啡色36-44/咖啡色36-44 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('676','120','咖啡色36-44.jpg','','','/product/nb996/nb996咖啡色36-44/咖啡色36-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('677','121','浅灰色36-44 (2).jpg','','','/product/nb996/nb996普罗旺斯浅灰色36-44/浅灰色36-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('678','121','浅灰色36-44 (3).jpg','','','/product/nb996/nb996普罗旺斯浅灰色36-44/浅灰色36-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('679','121','浅灰色36-44 (4).jpg','','','/product/nb996/nb996普罗旺斯浅灰色36-44/浅灰色36-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('680','121','浅灰色36-44 (5).jpg','','','/product/nb996/nb996普罗旺斯浅灰色36-44/浅灰色36-44 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('681','121','浅灰色36-44 (6).jpg','','','/product/nb996/nb996普罗旺斯浅灰色36-44/浅灰色36-44 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('682','121','浅灰色36-44 (7).jpg','','','/product/nb996/nb996普罗旺斯浅灰色36-44/浅灰色36-44 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('683','121','浅灰色36-44.jpg','','','/product/nb996/nb996普罗旺斯浅灰色36-44/浅灰色36-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('684','122','深红色藏青35-44 (2).jpg','','','/product/nb996/nb996深红色藏青35-44/深红色藏青35-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('685','122','深红色藏青35-44 (3).jpg','','','/product/nb996/nb996深红色藏青35-44/深红色藏青35-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('686','122','深红色藏青35-44 (4).jpg','','','/product/nb996/nb996深红色藏青35-44/深红色藏青35-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('687','122','深红色藏青35-44.jpg','','','/product/nb996/nb996深红色藏青35-44/深红色藏青35-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('688','123','黑色男鞋 (2).jpg','','','/product/nb996/nb996余文乐黑色男鞋/黑色男鞋 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('689','123','黑色男鞋 (3).jpg','','','/product/nb996/nb996余文乐黑色男鞋/黑色男鞋 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('690','123','黑色男鞋 (4).jpg','','','/product/nb996/nb996余文乐黑色男鞋/黑色男鞋 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('691','123','黑色男鞋 (5).jpg','','','/product/nb996/nb996余文乐黑色男鞋/黑色男鞋 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('692','123','黑色男鞋 (6).jpg','','','/product/nb996/nb996余文乐黑色男鞋/黑色男鞋 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('693','123','黑色男鞋 (7).jpg','','','/product/nb996/nb996余文乐黑色男鞋/黑色男鞋 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('694','123','黑色男鞋 (8).jpg','','','/product/nb996/nb996余文乐黑色男鞋/黑色男鞋 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('695','123','黑色男鞋 (9).jpg','','','/product/nb996/nb996余文乐黑色男鞋/黑色男鞋 (9).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('696','123','黑色男鞋.jpg','','','/product/nb996/nb996余文乐黑色男鞋/黑色男鞋.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('697','124','红色男鞋 (10).jpg','','','/product/nb996/nb996余文乐红色男鞋/红色男鞋 (10).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('698','124','红色男鞋 (11).jpg','','','/product/nb996/nb996余文乐红色男鞋/红色男鞋 (11).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('699','124','红色男鞋 (2).jpg','','','/product/nb996/nb996余文乐红色男鞋/红色男鞋 (2).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('700','124','红色男鞋 (3).jpg','','','/product/nb996/nb996余文乐红色男鞋/红色男鞋 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('701','124','红色男鞋 (4).jpg','','','/product/nb996/nb996余文乐红色男鞋/红色男鞋 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('702','124','红色男鞋 (5).jpg','','','/product/nb996/nb996余文乐红色男鞋/红色男鞋 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('703','124','红色男鞋 (6).jpg','','','/product/nb996/nb996余文乐红色男鞋/红色男鞋 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('704','124','红色男鞋 (7).jpg','','','/product/nb996/nb996余文乐红色男鞋/红色男鞋 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('705','124','红色男鞋 (8).jpg','','','/product/nb996/nb996余文乐红色男鞋/红色男鞋 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('706','124','红色男鞋 (9).jpg','','','/product/nb996/nb996余文乐红色男鞋/红色男鞋 (9).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('707','124','红色男鞋.jpg','','','/product/nb996/nb996余文乐红色男鞋/红色男鞋.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('708','125','黄色男鞋 (10).jpg','','','/product/nb996/nb996余文乐黄色男鞋/黄色男鞋 (10).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('709','125','黄色男鞋 (2).jpg','','','/product/nb996/nb996余文乐黄色男鞋/黄色男鞋 (2).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('710','125','黄色男鞋 (3).jpg','','','/product/nb996/nb996余文乐黄色男鞋/黄色男鞋 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('711','125','黄色男鞋 (4).jpg','','','/product/nb996/nb996余文乐黄色男鞋/黄色男鞋 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('712','125','黄色男鞋 (5).jpg','','','/product/nb996/nb996余文乐黄色男鞋/黄色男鞋 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('713','125','黄色男鞋 (6).jpg','','','/product/nb996/nb996余文乐黄色男鞋/黄色男鞋 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('714','125','黄色男鞋 (7).jpg','','','/product/nb996/nb996余文乐黄色男鞋/黄色男鞋 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('715','125','黄色男鞋 (8).jpg','','','/product/nb996/nb996余文乐黄色男鞋/黄色男鞋 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('716','125','黄色男鞋 (9).jpg','','','/product/nb996/nb996余文乐黄色男鞋/黄色男鞋 (9).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('717','125','黄色男鞋.jpg','','','/product/nb996/nb996余文乐黄色男鞋/黄色男鞋.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('718','126','兰色男鞋 (10).jpg','','','/product/nb996/nb996余文乐兰色男鞋/兰色男鞋 (10).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('719','126','兰色男鞋 (11).jpg','','','/product/nb996/nb996余文乐兰色男鞋/兰色男鞋 (11).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('720','126','兰色男鞋 (2).jpg','','','/product/nb996/nb996余文乐兰色男鞋/兰色男鞋 (2).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('721','126','兰色男鞋 (3).jpg','','','/product/nb996/nb996余文乐兰色男鞋/兰色男鞋 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('722','126','兰色男鞋 (4).jpg','','','/product/nb996/nb996余文乐兰色男鞋/兰色男鞋 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('723','126','兰色男鞋 (5).jpg','','','/product/nb996/nb996余文乐兰色男鞋/兰色男鞋 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('724','126','兰色男鞋 (6).jpg','','','/product/nb996/nb996余文乐兰色男鞋/兰色男鞋 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('725','126','兰色男鞋 (7).jpg','','','/product/nb996/nb996余文乐兰色男鞋/兰色男鞋 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('726','126','兰色男鞋 (8).jpg','','','/product/nb996/nb996余文乐兰色男鞋/兰色男鞋 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('727','126','兰色男鞋 (9).jpg','','','/product/nb996/nb996余文乐兰色男鞋/兰色男鞋 (9).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('728','126','兰色男鞋.jpg','','','/product/nb996/nb996余文乐兰色男鞋/兰色男鞋.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('729','127','冷色男鞋 (2).jpg','','','/product/nb996/nb996余文乐冷色男鞋/冷色男鞋 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('730','127','冷色男鞋 (3).jpg','','','/product/nb996/nb996余文乐冷色男鞋/冷色男鞋 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('731','127','冷色男鞋 (4).jpg','','','/product/nb996/nb996余文乐冷色男鞋/冷色男鞋 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('732','127','冷色男鞋 (5).jpg','','','/product/nb996/nb996余文乐冷色男鞋/冷色男鞋 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('733','127','冷色男鞋 (6).jpg','','','/product/nb996/nb996余文乐冷色男鞋/冷色男鞋 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('734','127','冷色男鞋.jpg','','','/product/nb996/nb996余文乐冷色男鞋/冷色男鞋.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('735','128','深灰色男鞋 (2).jpg','','','/product/nb996/nb996余文乐深灰色男鞋/深灰色男鞋 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('736','128','深灰色男鞋 (3).jpg','','','/product/nb996/nb996余文乐深灰色男鞋/深灰色男鞋 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('737','128','深灰色男鞋 (4).jpg','','','/product/nb996/nb996余文乐深灰色男鞋/深灰色男鞋 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('738','128','深灰色男鞋 (5).jpg','','','/product/nb996/nb996余文乐深灰色男鞋/深灰色男鞋 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('739','128','深灰色男鞋 (6).jpg','','','/product/nb996/nb996余文乐深灰色男鞋/深灰色男鞋 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('740','128','深灰色男鞋 (7).jpg','','','/product/nb996/nb996余文乐深灰色男鞋/深灰色男鞋 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('741','128','深灰色男鞋.jpg','','','/product/nb996/nb996余文乐深灰色男鞋/深灰色男鞋.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('742','129','酒红深蓝36-44 (2).jpg','','','/product/nb996/nb996中邦酒红深蓝36-44/酒红深蓝36-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('743','129','酒红深蓝36-44 (3).jpg','','','/product/nb996/nb996中邦酒红深蓝36-44/酒红深蓝36-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('744','129','酒红深蓝36-44 (4).jpg','','','/product/nb996/nb996中邦酒红深蓝36-44/酒红深蓝36-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('745','129','酒红深蓝36-44.jpg','','','/product/nb996/nb996中邦酒红深蓝36-44/酒红深蓝36-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('746','130','卡其色36-44 (2).jpg','','','/product/nb996/nb996中邦卡其色36-44/卡其色36-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('747','130','卡其色36-44 (3).jpg','','','/product/nb996/nb996中邦卡其色36-44/卡其色36-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('748','130','卡其色36-44.jpg','','','/product/nb996/nb996中邦卡其色36-44/卡其色36-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('749','131','亮黄36-44 (2).jpg','','','/product/nb996/nb996中邦亮黄36-44/亮黄36-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('750','131','亮黄36-44 (3).jpg','','','/product/nb996/nb996中邦亮黄36-44/亮黄36-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('751','131','亮黄36-44 (4).jpg','','','/product/nb996/nb996中邦亮黄36-44/亮黄36-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('752','131','亮黄36-44.jpg','','','/product/nb996/nb996中邦亮黄36-44/亮黄36-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('753','132','墨绿36-44 (2).jpg','','','/product/nb996/nb996中邦墨绿36-44/墨绿36-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('754','132','墨绿36-44 (3).jpg','','','/product/nb996/nb996中邦墨绿36-44/墨绿36-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('755','132','墨绿36-44 (4).jpg','','','/product/nb996/nb996中邦墨绿36-44/墨绿36-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('756','132','墨绿36-44.jpg','','','/product/nb996/nb996中邦墨绿36-44/墨绿36-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('757','133','3.jpg','','','/product/nb996/nb996猪八革黑熊猫36-44/3.jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('758','133','36-44.jpg','','','/product/nb996/nb996猪八革黑熊猫36-44/36-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('759','133','4.jpg','','','/product/nb996/nb996猪八革黑熊猫36-44/4.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('760','134','蓝灰金色36-44 (2).jpg','','','/product/nb996/nb996猪八革蓝灰金色36-44/蓝灰金色36-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('761','134','蓝灰金色36-44 (3).jpg','','','/product/nb996/nb996猪八革蓝灰金色36-44/蓝灰金色36-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('762','134','蓝灰金色36-44 (4).jpg','','','/product/nb996/nb996猪八革蓝灰金色36-44/蓝灰金色36-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('763','134','蓝灰金色36-44 (5).jpg','','','/product/nb996/nb996猪八革蓝灰金色36-44/蓝灰金色36-44 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('764','134','蓝灰金色36-44 (6).jpg','','','/product/nb996/nb996猪八革蓝灰金色36-44/蓝灰金色36-44 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('765','134','蓝灰金色36-44 (7).jpg','','','/product/nb996/nb996猪八革蓝灰金色36-44/蓝灰金色36-44 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('766','134','蓝灰金色36-44.jpg','','','/product/nb996/nb996猪八革蓝灰金色36-44/蓝灰金色36-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('767','135','蓝棕色36-44 (2).jpg','','','/product/nb996/nb996猪八革蓝棕色36-44/蓝棕色36-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('768','135','蓝棕色36-44 (3).jpg','','','/product/nb996/nb996猪八革蓝棕色36-44/蓝棕色36-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('769','135','蓝棕色36-44 (4).jpg','','','/product/nb996/nb996猪八革蓝棕色36-44/蓝棕色36-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('770','135','蓝棕色36-44 (5).jpg','','','/product/nb996/nb996猪八革蓝棕色36-44/蓝棕色36-44 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('771','135','蓝棕色36-44.jpg','','','/product/nb996/nb996猪八革蓝棕色36-44/蓝棕色36-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('772','136','36-44 (10).jpg','','','/product/nb996/nb996紫罗兰36-44/36-44 (10).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('773','136','36-44 (11).jpg','','','/product/nb996/nb996紫罗兰36-44/36-44 (11).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('774','136','36-44 (12).jpg','','','/product/nb996/nb996紫罗兰36-44/36-44 (12).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('775','136','36-44 (13).jpg','','','/product/nb996/nb996紫罗兰36-44/36-44 (13).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('776','136','36-44 (14).jpg','','','/product/nb996/nb996紫罗兰36-44/36-44 (14).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('777','136','36-44 (15).jpg','','','/product/nb996/nb996紫罗兰36-44/36-44 (15).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('778','136','36-44 (2).jpg','','','/product/nb996/nb996紫罗兰36-44/36-44 (2).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('779','136','36-44 (3).jpg','','','/product/nb996/nb996紫罗兰36-44/36-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('780','136','36-44 (4).jpg','','','/product/nb996/nb996紫罗兰36-44/36-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('781','136','36-44 (5).jpg','','','/product/nb996/nb996紫罗兰36-44/36-44 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('782','136','36-44 (6).jpg','','','/product/nb996/nb996紫罗兰36-44/36-44 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('783','136','36-44 (7).jpg','','','/product/nb996/nb996紫罗兰36-44/36-44 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('784','136','36-44 (8).jpg','','','/product/nb996/nb996紫罗兰36-44/36-44 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('785','136','36-44 (9).jpg','','','/product/nb996/nb996紫罗兰36-44/36-44 (9).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('786','136','36-44.jpg','','','/product/nb996/nb996紫罗兰36-44/36-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('787','138','白红36-44 (10).jpg','','','/product/nb999/nb999白红36-44/白红36-44 (10).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('788','138','白红36-44 (11).jpg','','','/product/nb999/nb999白红36-44/白红36-44 (11).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('789','138','白红36-44 (2).jpg','','','/product/nb999/nb999白红36-44/白红36-44 (2).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('790','138','白红36-44 (3).jpg','','','/product/nb999/nb999白红36-44/白红36-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('791','138','白红36-44 (4).jpg','','','/product/nb999/nb999白红36-44/白红36-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('792','138','白红36-44 (5).jpg','','','/product/nb999/nb999白红36-44/白红36-44 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('793','138','白红36-44 (6).jpg','','','/product/nb999/nb999白红36-44/白红36-44 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('794','138','白红36-44 (7).jpg','','','/product/nb999/nb999白红36-44/白红36-44 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('795','138','白红36-44 (8).jpg','','','/product/nb999/nb999白红36-44/白红36-44 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('796','138','白红36-44 (9).jpg','','','/product/nb999/nb999白红36-44/白红36-44 (9).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('797','138','白红36-44.jpg','','','/product/nb999/nb999白红36-44/白红36-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('798','139','彩蓝橙40-45 (10).jpg','','','/product/nb999/nb999彩蓝橙40-45/彩蓝橙40-45 (10).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('799','139','彩蓝橙40-45 (11).jpg','','','/product/nb999/nb999彩蓝橙40-45/彩蓝橙40-45 (11).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('800','139','彩蓝橙40-45 (2).jpg','','','/product/nb999/nb999彩蓝橙40-45/彩蓝橙40-45 (2).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('801','139','彩蓝橙40-45 (3).jpg','','','/product/nb999/nb999彩蓝橙40-45/彩蓝橙40-45 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('802','139','彩蓝橙40-45 (4).jpg','','','/product/nb999/nb999彩蓝橙40-45/彩蓝橙40-45 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('803','139','彩蓝橙40-45 (5).jpg','','','/product/nb999/nb999彩蓝橙40-45/彩蓝橙40-45 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('804','139','彩蓝橙40-45 (6).jpg','','','/product/nb999/nb999彩蓝橙40-45/彩蓝橙40-45 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('805','139','彩蓝橙40-45 (7).jpg','','','/product/nb999/nb999彩蓝橙40-45/彩蓝橙40-45 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('806','139','彩蓝橙40-45 (8).jpg','','','/product/nb999/nb999彩蓝橙40-45/彩蓝橙40-45 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('807','139','彩蓝橙40-45 (9).jpg','','','/product/nb999/nb999彩蓝橙40-45/彩蓝橙40-45 (9).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('808','139','彩蓝橙40-45.jpg','','','/product/nb999/nb999彩蓝橙40-45/彩蓝橙40-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('809','140','钢铁兰40-45.jpg','','','/product/nb999/nb999多种配色/钢铁兰40-45.jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('810','140','黑灰色40-45 (6).jpg','','','/product/nb999/nb999多种配色/黑灰色40-45 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('811','140','黑灰色40-45 (9).jpg','','','/product/nb999/nb999多种配色/黑灰色40-45 (9).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('812','140','灰葡萄红36-45.jpg','','','/product/nb999/nb999多种配色/灰葡萄红36-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('813','140','深蓝,玉36-45.jpg','','','/product/nb999/nb999多种配色/深蓝,玉36-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('814','141','钢铁蓝40-45 (10).jpg','','','/product/nb999/nb999钢铁蓝40-45/钢铁蓝40-45 (10).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('815','141','钢铁蓝40-45 (11).jpg','','','/product/nb999/nb999钢铁蓝40-45/钢铁蓝40-45 (11).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('816','141','钢铁蓝40-45 (12).jpg','','','/product/nb999/nb999钢铁蓝40-45/钢铁蓝40-45 (12).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('817','141','钢铁蓝40-45 (13).jpg','','','/product/nb999/nb999钢铁蓝40-45/钢铁蓝40-45 (13).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('818','141','钢铁蓝40-45 (14).jpg','','','/product/nb999/nb999钢铁蓝40-45/钢铁蓝40-45 (14).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('819','141','钢铁蓝40-45 (15).jpg','','','/product/nb999/nb999钢铁蓝40-45/钢铁蓝40-45 (15).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('820','141','钢铁蓝40-45 (16).jpg','','','/product/nb999/nb999钢铁蓝40-45/钢铁蓝40-45 (16).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('821','141','钢铁蓝40-45 (2).jpg','','','/product/nb999/nb999钢铁蓝40-45/钢铁蓝40-45 (2).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('822','141','钢铁蓝40-45 (3).jpg','','','/product/nb999/nb999钢铁蓝40-45/钢铁蓝40-45 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('823','141','钢铁蓝40-45 (4).jpg','','','/product/nb999/nb999钢铁蓝40-45/钢铁蓝40-45 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('824','141','钢铁蓝40-45 (5).jpg','','','/product/nb999/nb999钢铁蓝40-45/钢铁蓝40-45 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('825','141','钢铁蓝40-45 (6).jpg','','','/product/nb999/nb999钢铁蓝40-45/钢铁蓝40-45 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('826','141','钢铁蓝40-45 (7).jpg','','','/product/nb999/nb999钢铁蓝40-45/钢铁蓝40-45 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('827','141','钢铁蓝40-45 (8).jpg','','','/product/nb999/nb999钢铁蓝40-45/钢铁蓝40-45 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('828','141','钢铁蓝40-45 (9).jpg','','','/product/nb999/nb999钢铁蓝40-45/钢铁蓝40-45 (9).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('829','141','钢铁蓝40-45.jpg','','','/product/nb999/nb999钢铁蓝40-45/钢铁蓝40-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('830','142','军绿色40-45 (2).jpg','','','/product/nb999/nb999军绿色40-45/军绿色40-45 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('831','142','军绿色40-45 (3).jpg','','','/product/nb999/nb999军绿色40-45/军绿色40-45 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('832','142','军绿色40-45 (4).jpg','','','/product/nb999/nb999军绿色40-45/军绿色40-45 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('833','142','军绿色40-45 (5).jpg','','','/product/nb999/nb999军绿色40-45/军绿色40-45 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('834','142','军绿色40-45 (6).jpg','','','/product/nb999/nb999军绿色40-45/军绿色40-45 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('835','142','军绿色40-45 (7).jpg','','','/product/nb999/nb999军绿色40-45/军绿色40-45 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('836','142','军绿色40-45 (8).jpg','','','/product/nb999/nb999军绿色40-45/军绿色40-45 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('837','142','军绿色40-45 (9).jpg','','','/product/nb999/nb999军绿色40-45/军绿色40-45 (9).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('838','142','军绿色40-45.jpg','','','/product/nb999/nb999军绿色40-45/军绿色40-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('839','143','蓝玉色女鞋36-39 (10).jpg','','','/product/nb999/nb999蓝玉色女鞋36-39/蓝玉色女鞋36-39 (10).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('840','143','蓝玉色女鞋36-39 (11).jpg','','','/product/nb999/nb999蓝玉色女鞋36-39/蓝玉色女鞋36-39 (11).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('841','143','蓝玉色女鞋36-39 (12).jpg','','','/product/nb999/nb999蓝玉色女鞋36-39/蓝玉色女鞋36-39 (12).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('842','143','蓝玉色女鞋36-39 (2).jpg','','','/product/nb999/nb999蓝玉色女鞋36-39/蓝玉色女鞋36-39 (2).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('843','143','蓝玉色女鞋36-39 (3).jpg','','','/product/nb999/nb999蓝玉色女鞋36-39/蓝玉色女鞋36-39 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('844','143','蓝玉色女鞋36-39 (4).jpg','','','/product/nb999/nb999蓝玉色女鞋36-39/蓝玉色女鞋36-39 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('845','143','蓝玉色女鞋36-39 (5).jpg','','','/product/nb999/nb999蓝玉色女鞋36-39/蓝玉色女鞋36-39 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('846','143','蓝玉色女鞋36-39 (6).jpg','','','/product/nb999/nb999蓝玉色女鞋36-39/蓝玉色女鞋36-39 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('847','143','蓝玉色女鞋36-39 (7).jpg','','','/product/nb999/nb999蓝玉色女鞋36-39/蓝玉色女鞋36-39 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('848','143','蓝玉色女鞋36-39 (8).jpg','','','/product/nb999/nb999蓝玉色女鞋36-39/蓝玉色女鞋36-39 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('849','143','蓝玉色女鞋36-39 (9).jpg','','','/product/nb999/nb999蓝玉色女鞋36-39/蓝玉色女鞋36-39 (9).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('850','143','蓝玉色女鞋36-39.jpg','','','/product/nb999/nb999蓝玉色女鞋36-39/蓝玉色女鞋36-39.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('851','144','米黑粉女鞋36-39 (10).jpg','','','/product/nb999/nb999米黑粉女鞋36-39/米黑粉女鞋36-39 (10).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('852','144','米黑粉女鞋36-39 (11).jpg','','','/product/nb999/nb999米黑粉女鞋36-39/米黑粉女鞋36-39 (11).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('853','144','米黑粉女鞋36-39 (12).jpg','','','/product/nb999/nb999米黑粉女鞋36-39/米黑粉女鞋36-39 (12).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('854','144','米黑粉女鞋36-39 (2).jpg','','','/product/nb999/nb999米黑粉女鞋36-39/米黑粉女鞋36-39 (2).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('855','144','米黑粉女鞋36-39 (3).jpg','','','/product/nb999/nb999米黑粉女鞋36-39/米黑粉女鞋36-39 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('856','144','米黑粉女鞋36-39 (4).jpg','','','/product/nb999/nb999米黑粉女鞋36-39/米黑粉女鞋36-39 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('857','144','米黑粉女鞋36-39 (5).jpg','','','/product/nb999/nb999米黑粉女鞋36-39/米黑粉女鞋36-39 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('858','144','米黑粉女鞋36-39 (6).jpg','','','/product/nb999/nb999米黑粉女鞋36-39/米黑粉女鞋36-39 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('859','144','米黑粉女鞋36-39 (7).jpg','','','/product/nb999/nb999米黑粉女鞋36-39/米黑粉女鞋36-39 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('860','144','米黑粉女鞋36-39 (8).jpg','','','/product/nb999/nb999米黑粉女鞋36-39/米黑粉女鞋36-39 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('861','144','米黑粉女鞋36-39 (9).jpg','','','/product/nb999/nb999米黑粉女鞋36-39/米黑粉女鞋36-39 (9).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('862','144','米黑粉女鞋36-39.jpg','','','/product/nb999/nb999米黑粉女鞋36-39/米黑粉女鞋36-39.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('863','145','灰橘蓝36-45 (12).jpg','','','/product/nb999/nb999男女鞋灰橘蓝36-45/灰橘蓝36-45 (12).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('864','145','灰橘蓝36-45 (13).jpg','','','/product/nb999/nb999男女鞋灰橘蓝36-45/灰橘蓝36-45 (13).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('865','145','灰橘蓝36-45 (14).jpg','','','/product/nb999/nb999男女鞋灰橘蓝36-45/灰橘蓝36-45 (14).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('866','145','灰橘蓝36-45 (15).jpg','','','/product/nb999/nb999男女鞋灰橘蓝36-45/灰橘蓝36-45 (15).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('867','145','灰橘蓝36-45 (6).jpg','','','/product/nb999/nb999男女鞋灰橘蓝36-45/灰橘蓝36-45 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('868','145','灰橘蓝36-45 (7).jpg','','','/product/nb999/nb999男女鞋灰橘蓝36-45/灰橘蓝36-45 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('869','145','灰橘蓝36-45 (8).jpg','','','/product/nb999/nb999男女鞋灰橘蓝36-45/灰橘蓝36-45 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('870','145','灰橘蓝36-45 (9).jpg','','','/product/nb999/nb999男女鞋灰橘蓝36-45/灰橘蓝36-45 (9).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('871','146','青绿白40-45 (2).jpg','','','/product/nb999/nb999青绿白40-45/青绿白40-45 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('872','146','青绿白40-45 (3).jpg','','','/product/nb999/nb999青绿白40-45/青绿白40-45 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('873','146','青绿白40-45 (4).jpg','','','/product/nb999/nb999青绿白40-45/青绿白40-45 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('874','146','青绿白40-45 (5).jpg','','','/product/nb999/nb999青绿白40-45/青绿白40-45 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('875','146','青绿白40-45 (6).jpg','','','/product/nb999/nb999青绿白40-45/青绿白40-45 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('876','146','青绿白40-45 (7).jpg','','','/product/nb999/nb999青绿白40-45/青绿白40-45 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('877','146','青绿白40-45.jpg','','','/product/nb999/nb999青绿白40-45/青绿白40-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('878','147','限量男女鞋 36-45 (2).jpg','','','/product/nb999/nb999猪八革kith concepts x 限量男女鞋 36-45/限量男女鞋 36-45 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('879','147','限量男女鞋 36-45 (3).jpg','','','/product/nb999/nb999猪八革kith concepts x 限量男女鞋 36-45/限量男女鞋 36-45 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('880','147','限量男女鞋 36-45 (4).jpg','','','/product/nb999/nb999猪八革kith concepts x 限量男女鞋 36-45/限量男女鞋 36-45 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('881','147','限量男女鞋 36-45 (5).jpg','','','/product/nb999/nb999猪八革kith concepts x 限量男女鞋 36-45/限量男女鞋 36-45 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('882','147','限量男女鞋 36-45 (6).jpg','','','/product/nb999/nb999猪八革kith concepts x 限量男女鞋 36-45/限量男女鞋 36-45 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('883','147','限量男女鞋 36-45 (7).jpg','','','/product/nb999/nb999猪八革kith concepts x 限量男女鞋 36-45/限量男女鞋 36-45 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('884','147','限量男女鞋 36-45 (8).jpg','','','/product/nb999/nb999猪八革kith concepts x 限量男女鞋 36-45/限量男女鞋 36-45 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('885','147','限量男女鞋 36-45 (9).jpg','','','/product/nb999/nb999猪八革kith concepts x 限量男女鞋 36-45/限量男女鞋 36-45 (9).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('886','147','限量男女鞋 36-45.jpg','','','/product/nb999/nb999猪八革kith concepts x 限量男女鞋 36-45/限量男女鞋 36-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('887','149','黑红经典配色36-45 (2).jpg','','','/product/nb999/nb999猪八革黑红经典配色36-45/黑红经典配色36-45 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('888','149','黑红经典配色36-45 (3).jpg','','','/product/nb999/nb999猪八革黑红经典配色36-45/黑红经典配色36-45 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('889','149','黑红经典配色36-45 (4).jpg','','','/product/nb999/nb999猪八革黑红经典配色36-45/黑红经典配色36-45 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('890','149','黑红经典配色36-45 (5).jpg','','','/product/nb999/nb999猪八革黑红经典配色36-45/黑红经典配色36-45 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('891','149','黑红经典配色36-45 (6).jpg','','','/product/nb999/nb999猪八革黑红经典配色36-45/黑红经典配色36-45 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('892','149','黑红经典配色36-45 (7).jpg','','','/product/nb999/nb999猪八革黑红经典配色36-45/黑红经典配色36-45 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('893','149','黑红经典配色36-45 (8).jpg','','','/product/nb999/nb999猪八革黑红经典配色36-45/黑红经典配色36-45 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('894','149','黑红经典配色36-45 (9).jpg','','','/product/nb999/nb999猪八革黑红经典配色36-45/黑红经典配色36-45 (9).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('895','149','黑红经典配色36-45.jpg','','','/product/nb999/nb999猪八革黑红经典配色36-45/黑红经典配色36-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('896','150','黑灰蓝40-45 (10).jpg','','','/product/nb999/nb999猪八革黑灰蓝40-45/黑灰蓝40-45 (10).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('897','150','黑灰蓝40-45 (11).jpg','','','/product/nb999/nb999猪八革黑灰蓝40-45/黑灰蓝40-45 (11).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('898','150','黑灰蓝40-45 (12).jpg','','','/product/nb999/nb999猪八革黑灰蓝40-45/黑灰蓝40-45 (12).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('899','150','黑灰蓝40-45 (13).jpg','','','/product/nb999/nb999猪八革黑灰蓝40-45/黑灰蓝40-45 (13).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('900','150','黑灰蓝40-45 (2).jpg','','','/product/nb999/nb999猪八革黑灰蓝40-45/黑灰蓝40-45 (2).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('901','150','黑灰蓝40-45 (3).jpg','','','/product/nb999/nb999猪八革黑灰蓝40-45/黑灰蓝40-45 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('902','150','黑灰蓝40-45 (4).jpg','','','/product/nb999/nb999猪八革黑灰蓝40-45/黑灰蓝40-45 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('903','150','黑灰蓝40-45 (5).jpg','','','/product/nb999/nb999猪八革黑灰蓝40-45/黑灰蓝40-45 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('904','150','黑灰蓝40-45 (6).jpg','','','/product/nb999/nb999猪八革黑灰蓝40-45/黑灰蓝40-45 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('905','150','黑灰蓝40-45 (7).jpg','','','/product/nb999/nb999猪八革黑灰蓝40-45/黑灰蓝40-45 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('906','150','黑灰蓝40-45 (8).jpg','','','/product/nb999/nb999猪八革黑灰蓝40-45/黑灰蓝40-45 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('907','150','黑灰蓝40-45 (9).jpg','','','/product/nb999/nb999猪八革黑灰蓝40-45/黑灰蓝40-45 (9).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('908','150','黑灰蓝40-45.jpg','','','/product/nb999/nb999猪八革黑灰蓝40-45/黑灰蓝40-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('909','151','红白黑40-44 (2).jpg','','','/product/nb999/nb999猪八革红白黑40-44/红白黑40-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('910','151','红白黑40-44 (3).jpg','','','/product/nb999/nb999猪八革红白黑40-44/红白黑40-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('911','151','红白黑40-44 (4).jpg','','','/product/nb999/nb999猪八革红白黑40-44/红白黑40-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('912','151','红白黑40-44 (5).jpg','','','/product/nb999/nb999猪八革红白黑40-44/红白黑40-44 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('913','151','红白黑40-44.jpg','','','/product/nb999/nb999猪八革红白黑40-44/红白黑40-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('914','152','红玉色36-39 (10).jpg','','','/product/nb999/nb999猪八革红玉色36-39/红玉色36-39 (10).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('915','152','红玉色36-39 (11).jpg','','','/product/nb999/nb999猪八革红玉色36-39/红玉色36-39 (11).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('916','152','红玉色36-39 (12).jpg','','','/product/nb999/nb999猪八革红玉色36-39/红玉色36-39 (12).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('917','152','红玉色36-39 (2).jpg','','','/product/nb999/nb999猪八革红玉色36-39/红玉色36-39 (2).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('918','152','红玉色36-39 (3).jpg','','','/product/nb999/nb999猪八革红玉色36-39/红玉色36-39 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('919','152','红玉色36-39 (4).jpg','','','/product/nb999/nb999猪八革红玉色36-39/红玉色36-39 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('920','152','红玉色36-39 (5).jpg','','','/product/nb999/nb999猪八革红玉色36-39/红玉色36-39 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('921','152','红玉色36-39 (6).jpg','','','/product/nb999/nb999猪八革红玉色36-39/红玉色36-39 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('922','152','红玉色36-39 (7).jpg','','','/product/nb999/nb999猪八革红玉色36-39/红玉色36-39 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('923','152','红玉色36-39 (8).jpg','','','/product/nb999/nb999猪八革红玉色36-39/红玉色36-39 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('924','152','红玉色36-39 (9).jpg','','','/product/nb999/nb999猪八革红玉色36-39/红玉色36-39 (9).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('925','152','红玉色36-39.jpg','','','/product/nb999/nb999猪八革红玉色36-39/红玉色36-39.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('926','153','金黄色40-45 (2).jpg','','','/product/nb999/nb999猪八革金黄色40-45/金黄色40-45 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('927','153','金黄色40-45 (3).jpg','','','/product/nb999/nb999猪八革金黄色40-45/金黄色40-45 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('928','153','金黄色40-45 (4).jpg','','','/product/nb999/nb999猪八革金黄色40-45/金黄色40-45 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('929','153','金黄色40-45 (5).jpg','','','/product/nb999/nb999猪八革金黄色40-45/金黄色40-45 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('930','153','金黄色40-45 (6).jpg','','','/product/nb999/nb999猪八革金黄色40-45/金黄色40-45 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('931','153','金黄色40-45 (7).jpg','','','/product/nb999/nb999猪八革金黄色40-45/金黄色40-45 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('932','153','金黄色40-45 (8).jpg','','','/product/nb999/nb999猪八革金黄色40-45/金黄色40-45 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('933','153','金黄色40-45 (9).jpg','','','/product/nb999/nb999猪八革金黄色40-45/金黄色40-45 (9).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('934','153','金黄色40-45.jpg','','','/product/nb999/nb999猪八革金黄色40-45/金黄色40-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('935','154','酒红,黑36-45 (2).jpg','','','/product/nb999/nb999猪八革酒红,黑36-45/酒红,黑36-45 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('936','154','酒红,黑36-45 (3).jpg','','','/product/nb999/nb999猪八革酒红,黑36-45/酒红,黑36-45 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('937','154','酒红,黑36-45 (4).jpg','','','/product/nb999/nb999猪八革酒红,黑36-45/酒红,黑36-45 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('938','154','酒红,黑36-45 (5).jpg','','','/product/nb999/nb999猪八革酒红,黑36-45/酒红,黑36-45 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('939','154','酒红,黑36-45 (6).jpg','','','/product/nb999/nb999猪八革酒红,黑36-45/酒红,黑36-45 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('940','154','酒红,黑36-45 (7).jpg','','','/product/nb999/nb999猪八革酒红,黑36-45/酒红,黑36-45 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('941','154','酒红,黑36-45 (8).jpg','','','/product/nb999/nb999猪八革酒红,黑36-45/酒红,黑36-45 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('942','154','酒红,黑36-45 (9).jpg','','','/product/nb999/nb999猪八革酒红,黑36-45/酒红,黑36-45 (9).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('943','154','酒红,黑36-45.jpg','','','/product/nb999/nb999猪八革酒红,黑36-45/酒红,黑36-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('944','155','浅灰,蓝40-44 (2).jpg','','','/product/nb999/nb999猪八革浅灰,蓝40-44/浅灰,蓝40-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('945','155','浅灰,蓝40-44 (3).jpg','','','/product/nb999/nb999猪八革浅灰,蓝40-44/浅灰,蓝40-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('946','155','浅灰,蓝40-44 (4).jpg','','','/product/nb999/nb999猪八革浅灰,蓝40-44/浅灰,蓝40-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('947','155','浅灰,蓝40-44 (5).jpg','','','/product/nb999/nb999猪八革浅灰,蓝40-44/浅灰,蓝40-44 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('948','155','浅灰,蓝40-44 (6).jpg','','','/product/nb999/nb999猪八革浅灰,蓝40-44/浅灰,蓝40-44 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('949','155','浅灰,蓝40-44 (7).jpg','','','/product/nb999/nb999猪八革浅灰,蓝40-44/浅灰,蓝40-44 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('950','155','浅灰,蓝40-44.jpg','','','/product/nb999/nb999猪八革浅灰,蓝40-44/浅灰,蓝40-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('951','156','深灰红40-45 (2).jpg','','','/product/nb999/nb999猪八革深灰红40-45/深灰红40-45 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('952','156','深灰红40-45 (3).jpg','','','/product/nb999/nb999猪八革深灰红40-45/深灰红40-45 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('953','156','深灰红40-45 (4).jpg','','','/product/nb999/nb999猪八革深灰红40-45/深灰红40-45 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('954','156','深灰红40-45 (5).jpg','','','/product/nb999/nb999猪八革深灰红40-45/深灰红40-45 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('955','156','深灰红40-45 (6).jpg','','','/product/nb999/nb999猪八革深灰红40-45/深灰红40-45 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('956','156','深灰红40-45 (7).jpg','','','/product/nb999/nb999猪八革深灰红40-45/深灰红40-45 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('957','156','深灰红40-45 (8).jpg','','','/product/nb999/nb999猪八革深灰红40-45/深灰红40-45 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('958','156','深灰红40-45 (9).jpg','','','/product/nb999/nb999猪八革深灰红40-45/深灰红40-45 (9).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('959','156','深灰红40-45.jpg','','','/product/nb999/nb999猪八革深灰红40-45/深灰红40-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('960','157','米白,薄荷绿,浅灰36-44 (2).jpg','','','/product/nb999/nb999猪八革樱花系列米白,薄荷绿,浅灰36-44/米白,薄荷绿,浅灰36-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('961','157','米白,薄荷绿,浅灰36-44 (3).jpg','','','/product/nb999/nb999猪八革樱花系列米白,薄荷绿,浅灰36-44/米白,薄荷绿,浅灰36-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('962','157','米白,薄荷绿,浅灰36-44 (4).jpg','','','/product/nb999/nb999猪八革樱花系列米白,薄荷绿,浅灰36-44/米白,薄荷绿,浅灰36-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('963','157','米白,薄荷绿,浅灰36-44.jpg','','','/product/nb999/nb999猪八革樱花系列米白,薄荷绿,浅灰36-44/米白,薄荷绿,浅灰36-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('964','158','米白,桔黄,浅灰36-44 (2).jpg','','','/product/nb999/nb999猪八革樱花系列米白,桔黄,浅灰36-44/米白,桔黄,浅灰36-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('965','158','米白,桔黄,浅灰36-44 (3).jpg','','','/product/nb999/nb999猪八革樱花系列米白,桔黄,浅灰36-44/米白,桔黄,浅灰36-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('966','158','米白,桔黄,浅灰36-44 (4).jpg','','','/product/nb999/nb999猪八革樱花系列米白,桔黄,浅灰36-44/米白,桔黄,浅灰36-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('967','158','米白,桔黄,浅灰36-44.jpg','','','/product/nb999/nb999猪八革樱花系列米白,桔黄,浅灰36-44/米白,桔黄,浅灰36-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('968','159','翡翠绿36-45 (2).jpg','','','/product/nb999/nb999猪八革翡翠绿36-45/翡翠绿36-45 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('969','159','翡翠绿36-45 (3).jpg','','','/product/nb999/nb999猪八革翡翠绿36-45/翡翠绿36-45 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('970','159','翡翠绿36-45.jpg','','','/product/nb999/nb999猪八革翡翠绿36-45/翡翠绿36-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('971','161','白粉紫36-39 (2).jpeg','','','/product/nb_996_girl/nb 996系列 女鞋 白粉紫36-39/白粉紫36-39 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('972','161','白粉紫36-39 (3).jpeg','','','/product/nb_996_girl/nb 996系列 女鞋 白粉紫36-39/白粉紫36-39 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('973','161','白粉紫36-39 (4).jpeg','','','/product/nb_996_girl/nb 996系列 女鞋 白粉紫36-39/白粉紫36-39 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('974','161','白粉紫36-39.jpeg','','','/product/nb_996_girl/nb 996系列 女鞋 白粉紫36-39/白粉紫36-39.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('975','162','b.png','','','/product/nb_996_girl/nb 996系列 女鞋 白桃红36-39/b.png','0','1');
INSERT INTO `v9_product_pic` VALUES('976','162','c.png','','','/product/nb_996_girl/nb 996系列 女鞋 白桃红36-39/c.png','0','0');
INSERT INTO `v9_product_pic` VALUES('977','162','d.png','','','/product/nb_996_girl/nb 996系列 女鞋 白桃红36-39/d.png','0','0');
INSERT INTO `v9_product_pic` VALUES('978','162','e.png','','','/product/nb_996_girl/nb 996系列 女鞋 白桃红36-39/e.png','0','0');
INSERT INTO `v9_product_pic` VALUES('979','162','f.png','','','/product/nb_996_girl/nb 996系列 女鞋 白桃红36-39/f.png','0','0');
INSERT INTO `v9_product_pic` VALUES('980','162','g.png','','','/product/nb_996_girl/nb 996系列 女鞋 白桃红36-39/g.png','0','0');
INSERT INTO `v9_product_pic` VALUES('981','162','h.png','','','/product/nb_996_girl/nb 996系列 女鞋 白桃红36-39/h.png','0','0');
INSERT INTO `v9_product_pic` VALUES('982','162','mg3f0g-1002-2746.exe','','','/product/nb_996_girl/nb 996系列 女鞋 白桃红36-39/mg3f0g-1002-2746.exe','0','0');
INSERT INTO `v9_product_pic` VALUES('983','162','白桃红36-39 (1).jpeg','','','/product/nb_996_girl/nb 996系列 女鞋 白桃红36-39/白桃红36-39 (1).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('984','162','白桃红36-39 (2).jpeg','','','/product/nb_996_girl/nb 996系列 女鞋 白桃红36-39/白桃红36-39 (2).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('985','162','白桃红36-39 (3).jpeg','','','/product/nb_996_girl/nb 996系列 女鞋 白桃红36-39/白桃红36-39 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('986','162','白桃红36-39.jpg','','','/product/nb_996_girl/nb 996系列 女鞋 白桃红36-39/白桃红36-39.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('987','163','粉色紫色白色36-39 (2).jpeg','','','/product/nb_996_girl/nb 996系列 女鞋 粉色紫色白色36-39/粉色紫色白色36-39 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('988','163','粉色紫色白色36-39 (3).jpeg','','','/product/nb_996_girl/nb 996系列 女鞋 粉色紫色白色36-39/粉色紫色白色36-39 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('989','163','粉色紫色白色36-39 (4).jpeg','','','/product/nb_996_girl/nb 996系列 女鞋 粉色紫色白色36-39/粉色紫色白色36-39 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('990','163','粉色紫色白色36-39.jpeg','','','/product/nb_996_girl/nb 996系列 女鞋 粉色紫色白色36-39/粉色紫色白色36-39.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('991','164','黄生绿36-39.jpg','','','/product/nb_996_girl/nb 996系列 女鞋 黄生绿36-39/黄生绿36-39.jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('992','165','绿棕36-39 (2).jpeg','','','/product/nb_996_girl/nb 996系列 女鞋 绿棕36-39/绿棕36-39 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('993','165','绿棕36-39 (3).jpeg','','','/product/nb_996_girl/nb 996系列 女鞋 绿棕36-39/绿棕36-39 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('994','165','绿棕36-39 (4).jpeg','','','/product/nb_996_girl/nb 996系列 女鞋 绿棕36-39/绿棕36-39 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('995','165','绿棕36-39 (5).jpeg','','','/product/nb_996_girl/nb 996系列 女鞋 绿棕36-39/绿棕36-39 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('996','165','绿棕36-39 (6).jpeg','','','/product/nb_996_girl/nb 996系列 女鞋 绿棕36-39/绿棕36-39 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('997','165','绿棕36-39.jpeg','','','/product/nb_996_girl/nb 996系列 女鞋 绿棕36-39/绿棕36-39.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('998','166','梅红紫36-39 (2).jpeg','','','/product/nb_996_girl/nb 996系列 女鞋 梅红紫36-39/梅红紫36-39 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('999','166','梅红紫36-39 (3).jpeg','','','/product/nb_996_girl/nb 996系列 女鞋 梅红紫36-39/梅红紫36-39 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('1000','166','梅红紫36-39.jpeg','','','/product/nb_996_girl/nb 996系列 女鞋 梅红紫36-39/梅红紫36-39.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('1001','167','红白黑36-39 (2).jpeg','','','/product/nb_996_girl/nb 996系列 女鞋 美国国旗(红白黑)36-39/红白黑36-39 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('1002','167','红白黑36-39 (3).jpeg','','','/product/nb_996_girl/nb 996系列 女鞋 美国国旗(红白黑)36-39/红白黑36-39 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('1003','167','红白黑36-39 (4).jpeg','','','/product/nb_996_girl/nb 996系列 女鞋 美国国旗(红白黑)36-39/红白黑36-39 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('1004','167','红白黑36-39 (5).jpeg','','','/product/nb_996_girl/nb 996系列 女鞋 美国国旗(红白黑)36-39/红白黑36-39 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('1005','167','红白黑36-39 (6).jpeg','','','/product/nb_996_girl/nb 996系列 女鞋 美国国旗(红白黑)36-39/红白黑36-39 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('1006','167','红白黑36-39 (7).jpeg','','','/product/nb_996_girl/nb 996系列 女鞋 美国国旗(红白黑)36-39/红白黑36-39 (7).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('1007','167','红白黑36-39 (8).jpeg','','','/product/nb_996_girl/nb 996系列 女鞋 美国国旗(红白黑)36-39/红白黑36-39 (8).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('1008','167','红白黑36-39.jpg','','','/product/nb_996_girl/nb 996系列 女鞋 美国国旗(红白黑)36-39/红白黑36-39.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1009','168','兰红白36-39 (2).jpeg','','','/product/nb_996_girl/nb 996系列 女鞋 美国国旗(兰红白)36-39/兰红白36-39 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('1010','168','兰红白36-39 (3).jpeg','','','/product/nb_996_girl/nb 996系列 女鞋 美国国旗(兰红白)36-39/兰红白36-39 (3).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('1011','168','兰红白36-39 (4).jpeg','','','/product/nb_996_girl/nb 996系列 女鞋 美国国旗(兰红白)36-39/兰红白36-39 (4).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('1012','168','兰红白36-39 (5).jpeg','','','/product/nb_996_girl/nb 996系列 女鞋 美国国旗(兰红白)36-39/兰红白36-39 (5).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('1013','168','兰红白36-39 (6).jpeg','','','/product/nb_996_girl/nb 996系列 女鞋 美国国旗(兰红白)36-39/兰红白36-39 (6).jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('1014','168','兰红白36-39.jpeg','','','/product/nb_996_girl/nb 996系列 女鞋 美国国旗(兰红白)36-39/兰红白36-39.jpeg','0','0');
INSERT INTO `v9_product_pic` VALUES('1015','169','桃花36-39 (2).jpeg','','','/product/nb_996_girl/nb 996系列 女鞋 桃花36-39/桃花36-39 (2).jpeg','0','1');
INSERT INTO `v9_product_pic` VALUES('1016','169','桃花36-39.jpg','','','/product/nb_996_girl/nb 996系列 女鞋 桃花36-39/桃花36-39.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1017','171','白红校园36-44 (2).jpg','','','/product/nike_agan/耐克nike阿甘白红校园36-44/白红校园36-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1018','171','白红校园36-44 (3).jpg','','','/product/nike_agan/耐克nike阿甘白红校园36-44/白红校园36-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1019','171','白红校园36-44 (4).jpg','','','/product/nike_agan/耐克nike阿甘白红校园36-44/白红校园36-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1020','171','白红校园36-44 (5).jpg','','','/product/nike_agan/耐克nike阿甘白红校园36-44/白红校园36-44 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1021','171','白红校园36-44 (6).jpg','','','/product/nike_agan/耐克nike阿甘白红校园36-44/白红校园36-44 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1022','171','白红校园36-44 (7).jpg','','','/product/nike_agan/耐克nike阿甘白红校园36-44/白红校园36-44 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1023','171','白红校园36-44.jpg','','','/product/nike_agan/耐克nike阿甘白红校园36-44/白红校园36-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1024','172','白灰黑36-44 (2).jpg','','','/product/nike_agan/耐克nike阿甘白灰黑36-44/白灰黑36-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1025','172','白灰黑36-44 (3).jpg','','','/product/nike_agan/耐克nike阿甘白灰黑36-44/白灰黑36-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1026','172','白灰黑36-44 (4).jpg','','','/product/nike_agan/耐克nike阿甘白灰黑36-44/白灰黑36-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1027','172','白灰黑36-44.jpg','','','/product/nike_agan/耐克nike阿甘白灰黑36-44/白灰黑36-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1028','173','薄荷绿亮红36-39 (2).jpg','','','/product/nike_agan/耐克nike阿甘薄荷绿亮红36-39/薄荷绿亮红36-39 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1029','173','薄荷绿亮红36-39 (3).jpg','','','/product/nike_agan/耐克nike阿甘薄荷绿亮红36-39/薄荷绿亮红36-39 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1030','173','薄荷绿亮红36-39 (4).jpg','','','/product/nike_agan/耐克nike阿甘薄荷绿亮红36-39/薄荷绿亮红36-39 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1031','173','薄荷绿亮红36-39 (5).jpg','','','/product/nike_agan/耐克nike阿甘薄荷绿亮红36-39/薄荷绿亮红36-39 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1032','173','薄荷绿亮红36-39 (6).jpg','','','/product/nike_agan/耐克nike阿甘薄荷绿亮红36-39/薄荷绿亮红36-39 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1033','173','薄荷绿亮红36-39.jpg','','','/product/nike_agan/耐克nike阿甘薄荷绿亮红36-39/薄荷绿亮红36-39.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1034','174','冰蓝荧光绿36-39 (2).jpg','','','/product/nike_agan/耐克nike阿甘冰蓝荧光绿36-39/冰蓝荧光绿36-39 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1035','174','冰蓝荧光绿36-39.jpg','','','/product/nike_agan/耐克nike阿甘冰蓝荧光绿36-39/冰蓝荧光绿36-39.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1036','175','橙白36-44 (2).jpg','','','/product/nike_agan/耐克nike阿甘橙白36-44/橙白36-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1037','175','橙白36-44 (3).jpg','','','/product/nike_agan/耐克nike阿甘橙白36-44/橙白36-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1038','175','橙白36-44 (4).jpg','','','/product/nike_agan/耐克nike阿甘橙白36-44/橙白36-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1039','175','橙白36-44 (5).jpg','','','/product/nike_agan/耐克nike阿甘橙白36-44/橙白36-44 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1040','175','橙白36-44 (6).jpg','','','/product/nike_agan/耐克nike阿甘橙白36-44/橙白36-44 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1041','175','橙白36-44 (7).jpg','','','/product/nike_agan/耐克nike阿甘橙白36-44/橙白36-44 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1042','175','橙白36-44 (8).jpg','','','/product/nike_agan/耐克nike阿甘橙白36-44/橙白36-44 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1043','175','橙白36-44 (9).jpg','','','/product/nike_agan/耐克nike阿甘橙白36-44/橙白36-44 (9).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1044','175','橙白36-44.jpg','','','/product/nike_agan/耐克nike阿甘橙白36-44/橙白36-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1045','176','飞翔蓝40-44 (2).jpg','','','/product/nike_agan/耐克nike阿甘飞翔蓝40-44/飞翔蓝40-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1046','176','飞翔蓝40-44 (3).jpg','','','/product/nike_agan/耐克nike阿甘飞翔蓝40-44/飞翔蓝40-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1047','176','飞翔蓝40-44 (4).jpg','','','/product/nike_agan/耐克nike阿甘飞翔蓝40-44/飞翔蓝40-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1048','176','飞翔蓝40-44 (5).jpg','','','/product/nike_agan/耐克nike阿甘飞翔蓝40-44/飞翔蓝40-44 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1049','176','飞翔蓝40-44.jpg','','','/product/nike_agan/耐克nike阿甘飞翔蓝40-44/飞翔蓝40-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1050','177','粉白36-39 (2).jpg','','','/product/nike_agan/耐克nike阿甘粉白36-39/粉白36-39 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1051','177','粉白36-39 (3).jpg','','','/product/nike_agan/耐克nike阿甘粉白36-39/粉白36-39 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1052','177','粉白36-39 (4).jpg','','','/product/nike_agan/耐克nike阿甘粉白36-39/粉白36-39 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1053','177','粉白36-39 (5).jpg','','','/product/nike_agan/耐克nike阿甘粉白36-39/粉白36-39 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1054','177','粉白36-39 (6).jpg','','','/product/nike_agan/耐克nike阿甘粉白36-39/粉白36-39 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1055','177','粉白36-39 (7).jpg','','','/product/nike_agan/耐克nike阿甘粉白36-39/粉白36-39 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1056','177','粉白36-39.jpg','','','/product/nike_agan/耐克nike阿甘粉白36-39/粉白36-39.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1057','178','粉红36-39 (2).jpg','','','/product/nike_agan/耐克nike阿甘粉红36-39/粉红36-39 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1058','178','粉红36-39 (3).jpg','','','/product/nike_agan/耐克nike阿甘粉红36-39/粉红36-39 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1059','178','粉红36-39 (4).jpg','','','/product/nike_agan/耐克nike阿甘粉红36-39/粉红36-39 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1060','178','粉红36-39.jpg','','','/product/nike_agan/耐克nike阿甘粉红36-39/粉红36-39.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1061','179','黑白36-44 (2).jpg','','','/product/nike_agan/耐克nike阿甘黑白36-44/黑白36-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1062','179','黑白36-44 (3).jpg','','','/product/nike_agan/耐克nike阿甘黑白36-44/黑白36-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1063','179','黑白36-44 (4).jpg','','','/product/nike_agan/耐克nike阿甘黑白36-44/黑白36-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1064','179','黑白36-44.jpg','','','/product/nike_agan/耐克nike阿甘黑白36-44/黑白36-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1065','180','黑白绿40-44 (2).jpg','','','/product/nike_agan/耐克nike阿甘黑白绿40-44/黑白绿40-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1066','180','黑白绿40-44 (3).jpg','','','/product/nike_agan/耐克nike阿甘黑白绿40-44/黑白绿40-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1067','180','黑白绿40-44 (4).jpg','','','/product/nike_agan/耐克nike阿甘黑白绿40-44/黑白绿40-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1068','180','黑白绿40-44.jpg','','','/product/nike_agan/耐克nike阿甘黑白绿40-44/黑白绿40-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1069','181','黑白幸运红40-44 (2).jpg','','','/product/nike_agan/耐克nike阿甘黑白幸运红40-44/黑白幸运红40-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1070','181','黑白幸运红40-44 (3).jpg','','','/product/nike_agan/耐克nike阿甘黑白幸运红40-44/黑白幸运红40-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1071','181','黑白幸运红40-44 (4).jpg','','','/product/nike_agan/耐克nike阿甘黑白幸运红40-44/黑白幸运红40-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1072','181','黑白幸运红40-44.jpg','','','/product/nike_agan/耐克nike阿甘黑白幸运红40-44/黑白幸运红40-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1073','182','黑红36-44 (2).jpg','','','/product/nike_agan/耐克nike阿甘黑红36-44/黑红36-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1074','182','黑红36-44 (3).jpg','','','/product/nike_agan/耐克nike阿甘黑红36-44/黑红36-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1075','182','黑红36-44 (4).jpg','','','/product/nike_agan/耐克nike阿甘黑红36-44/黑红36-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1076','182','黑红36-44 (5).jpg','','','/product/nike_agan/耐克nike阿甘黑红36-44/黑红36-44 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1077','182','黑红36-44.jpg','','','/product/nike_agan/耐克nike阿甘黑红36-44/黑红36-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1078','183','红白36-44 (2).jpg','','','/product/nike_agan/耐克nike阿甘红白36-44/红白36-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1079','183','红白36-44 (3).jpg','','','/product/nike_agan/耐克nike阿甘红白36-44/红白36-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1080','183','红白36-44 (4).jpg','','','/product/nike_agan/耐克nike阿甘红白36-44/红白36-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1081','183','红白36-44.jpg','','','/product/nike_agan/耐克nike阿甘红白36-44/红白36-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1082','184','红白兰36-44 (2).jpg','','','/product/nike_agan/耐克nike阿甘红白兰36-44/红白兰36-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1083','184','红白兰36-44 (3).jpg','','','/product/nike_agan/耐克nike阿甘红白兰36-44/红白兰36-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1084','184','红白兰36-44 (4).jpg','','','/product/nike_agan/耐克nike阿甘红白兰36-44/红白兰36-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1085','184','红白兰36-44 (5).jpg','','','/product/nike_agan/耐克nike阿甘红白兰36-44/红白兰36-44 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1086','184','红白兰36-44 (6).jpg','','','/product/nike_agan/耐克nike阿甘红白兰36-44/红白兰36-44 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1087','184','红白兰36-44 (7).jpg','','','/product/nike_agan/耐克nike阿甘红白兰36-44/红白兰36-44 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1088','184','红白兰36-44.jpg','','','/product/nike_agan/耐克nike阿甘红白兰36-44/红白兰36-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1089','185','红宝兰36-44 (2).jpg','','','/product/nike_agan/耐克nike阿甘红宝兰36-44/红宝兰36-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1090','185','红宝兰36-44 (3).jpg','','','/product/nike_agan/耐克nike阿甘红宝兰36-44/红宝兰36-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1091','185','红宝兰36-44 (4).jpg','','','/product/nike_agan/耐克nike阿甘红宝兰36-44/红宝兰36-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1092','185','红宝兰36-44 (5).jpg','','','/product/nike_agan/耐克nike阿甘红宝兰36-44/红宝兰36-44 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1093','185','红宝兰36-44 (6).jpg','','','/product/nike_agan/耐克nike阿甘红宝兰36-44/红宝兰36-44 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1094','185','红宝兰36-44 (7).jpg','','','/product/nike_agan/耐克nike阿甘红宝兰36-44/红宝兰36-44 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1095','185','红宝兰36-44.jpg','','','/product/nike_agan/耐克nike阿甘红宝兰36-44/红宝兰36-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1096','186','黄黑36-44 (2).jpg','','','/product/nike_agan/耐克nike阿甘黄黑36-44/黄黑36-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1097','186','黄黑36-44 (3).jpg','','','/product/nike_agan/耐克nike阿甘黄黑36-44/黄黑36-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1098','186','黄黑36-44 (4).jpg','','','/product/nike_agan/耐克nike阿甘黄黑36-44/黄黑36-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1099','186','黄黑36-44 (5).jpg','','','/product/nike_agan/耐克nike阿甘黄黑36-44/黄黑36-44 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1100','186','黄黑36-44.jpg','','','/product/nike_agan/耐克nike阿甘黄黑36-44/黄黑36-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1101','187','灰紫 40-44 (2).jpg','','','/product/nike_agan/耐克nike阿甘灰紫 40-44/灰紫 40-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1102','187','灰紫 40-44 (3).jpg','','','/product/nike_agan/耐克nike阿甘灰紫 40-44/灰紫 40-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1103','187','灰紫 40-44 (4).jpg','','','/product/nike_agan/耐克nike阿甘灰紫 40-44/灰紫 40-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1104','187','灰紫 40-44 (5).jpg','','','/product/nike_agan/耐克nike阿甘灰紫 40-44/灰紫 40-44 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1105','187','灰紫 40-44 (6).jpg','','','/product/nike_agan/耐克nike阿甘灰紫 40-44/灰紫 40-44 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1106','187','灰紫 40-44 (7).jpg','','','/product/nike_agan/耐克nike阿甘灰紫 40-44/灰紫 40-44 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1107','187','灰紫 40-44.jpg','','','/product/nike_agan/耐克nike阿甘灰紫 40-44/灰紫 40-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1108','188','活力蓝36-44 (2).jpg','','','/product/nike_agan/耐克nike阿甘活力蓝36-44/活力蓝36-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1109','188','活力蓝36-44 (3).jpg','','','/product/nike_agan/耐克nike阿甘活力蓝36-44/活力蓝36-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1110','188','活力蓝36-44 (4).jpg','','','/product/nike_agan/耐克nike阿甘活力蓝36-44/活力蓝36-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1111','188','活力蓝36-44 (5).jpg','','','/product/nike_agan/耐克nike阿甘活力蓝36-44/活力蓝36-44 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1112','188','活力蓝36-44 (6).jpg','','','/product/nike_agan/耐克nike阿甘活力蓝36-44/活力蓝36-44 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1113','188','活力蓝36-44 (7).jpg','','','/product/nike_agan/耐克nike阿甘活力蓝36-44/活力蓝36-44 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1114','188','活力蓝36-44.jpg','','','/product/nike_agan/耐克nike阿甘活力蓝36-44/活力蓝36-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1115','189','蓝白橘36-44 (2).jpg','','','/product/nike_agan/耐克nike阿甘蓝白橘36-44/蓝白橘36-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1116','189','蓝白橘36-44 (3).jpg','','','/product/nike_agan/耐克nike阿甘蓝白橘36-44/蓝白橘36-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1117','189','蓝白橘36-44 (4).jpg','','','/product/nike_agan/耐克nike阿甘蓝白橘36-44/蓝白橘36-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1118','189','蓝白橘36-44 (5).jpg','','','/product/nike_agan/耐克nike阿甘蓝白橘36-44/蓝白橘36-44 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1119','189','蓝白橘36-44 (6).jpg','','','/product/nike_agan/耐克nike阿甘蓝白橘36-44/蓝白橘36-44 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1120','189','蓝白橘36-44 (7).jpg','','','/product/nike_agan/耐克nike阿甘蓝白橘36-44/蓝白橘36-44 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1121','189','蓝白橘36-44 (8).jpg','','','/product/nike_agan/耐克nike阿甘蓝白橘36-44/蓝白橘36-44 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1122','189','蓝白橘36-44.jpg','','','/product/nike_agan/耐克nike阿甘蓝白橘36-44/蓝白橘36-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1123','190','蓝黑40-44 (2).jpg','','','/product/nike_agan/耐克nike阿甘蓝黑40-44/蓝黑40-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1124','190','蓝黑40-44 (3).jpg','','','/product/nike_agan/耐克nike阿甘蓝黑40-44/蓝黑40-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1125','190','蓝黑40-44 (4).jpg','','','/product/nike_agan/耐克nike阿甘蓝黑40-44/蓝黑40-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1126','190','蓝黑40-44 (5).jpg','','','/product/nike_agan/耐克nike阿甘蓝黑40-44/蓝黑40-44 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1127','190','蓝黑40-44 (6).jpg','','','/product/nike_agan/耐克nike阿甘蓝黑40-44/蓝黑40-44 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1128','190','蓝黑40-44 (7).jpg','','','/product/nike_agan/耐克nike阿甘蓝黑40-44/蓝黑40-44 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1129','190','蓝黑40-44 (8).jpg','','','/product/nike_agan/耐克nike阿甘蓝黑40-44/蓝黑40-44 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1130','190','蓝黑40-44.jpg','','','/product/nike_agan/耐克nike阿甘蓝黑40-44/蓝黑40-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1131','191','蓝黑桔40-44 (2).jpg','','','/product/nike_agan/耐克nike阿甘蓝黑桔40-44/蓝黑桔40-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1132','191','蓝黑桔40-44 (3).jpg','','','/product/nike_agan/耐克nike阿甘蓝黑桔40-44/蓝黑桔40-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1133','191','蓝黑桔40-44 (4).jpg','','','/product/nike_agan/耐克nike阿甘蓝黑桔40-44/蓝黑桔40-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1134','191','蓝黑桔40-44.jpg','','','/product/nike_agan/耐克nike阿甘蓝黑桔40-44/蓝黑桔40-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1135','192','浅黄36-39 (2).jpg','','','/product/nike_agan/耐克nike阿甘浅黄36-39/浅黄36-39 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1136','192','浅黄36-39 (3).jpg','','','/product/nike_agan/耐克nike阿甘浅黄36-39/浅黄36-39 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1137','192','浅黄36-39 (4).jpg','','','/product/nike_agan/耐克nike阿甘浅黄36-39/浅黄36-39 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1138','192','浅黄36-39.jpg','','','/product/nike_agan/耐克nike阿甘浅黄36-39/浅黄36-39.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1139','193','浅兰白36-44 (2).jpg','','','/product/nike_agan/耐克nike阿甘浅兰白36-44/浅兰白36-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1140','193','浅兰白36-44 (3).jpg','','','/product/nike_agan/耐克nike阿甘浅兰白36-44/浅兰白36-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1141','193','浅兰白36-44 (4).jpg','','','/product/nike_agan/耐克nike阿甘浅兰白36-44/浅兰白36-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1142','193','浅兰白36-44.jpg','','','/product/nike_agan/耐克nike阿甘浅兰白36-44/浅兰白36-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1143','194','青白36--44 (2).jpg','','','/product/nike_agan/耐克nike阿甘青白36--44/青白36--44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1144','194','青白36--44 (3).jpg','','','/product/nike_agan/耐克nike阿甘青白36--44/青白36--44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1145','194','青白36--44 (4).jpg','','','/product/nike_agan/耐克nike阿甘青白36--44/青白36--44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1146','194','青白36--44 (5).jpg','','','/product/nike_agan/耐克nike阿甘青白36--44/青白36--44 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1147','194','青白36--44.jpg','','','/product/nike_agan/耐克nike阿甘青白36--44/青白36--44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1148','195','青绿白40-44 (2).jpg','','','/product/nike_agan/耐克nike阿甘青绿白40-44/青绿白40-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1149','195','青绿白40-44 (3).jpg','','','/product/nike_agan/耐克nike阿甘青绿白40-44/青绿白40-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1150','195','青绿白40-44 (4).jpg','','','/product/nike_agan/耐克nike阿甘青绿白40-44/青绿白40-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1151','195','青绿白40-44 (5).jpg','','','/product/nike_agan/耐克nike阿甘青绿白40-44/青绿白40-44 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1152','195','青绿白40-44 (6).jpg','','','/product/nike_agan/耐克nike阿甘青绿白40-44/青绿白40-44 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1153','195','青绿白40-44 (7).jpg','','','/product/nike_agan/耐克nike阿甘青绿白40-44/青绿白40-44 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1154','195','青绿白40-44.jpg','','','/product/nike_agan/耐克nike阿甘青绿白40-44/青绿白40-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1155','196','深兰白40-44 (2).jpg','','','/product/nike_agan/耐克nike阿甘深兰白40-44/深兰白40-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1156','196','深兰白40-44 (3).jpg','','','/product/nike_agan/耐克nike阿甘深兰白40-44/深兰白40-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1157','196','深兰白40-44 (4).jpg','','','/product/nike_agan/耐克nike阿甘深兰白40-44/深兰白40-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1158','196','深兰白40-44.jpg','','','/product/nike_agan/耐克nike阿甘深兰白40-44/深兰白40-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1159','197','深兰粉 (2).jpg','','','/product/nike_agan/耐克nike阿甘深兰粉36-39/深兰粉 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1160','197','深兰粉 (3).jpg','','','/product/nike_agan/耐克nike阿甘深兰粉36-39/深兰粉 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1161','197','深兰粉.jpg','','','/product/nike_agan/耐克nike阿甘深兰粉36-39/深兰粉.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1162','198','深兰黑40-44 (2).jpg','','','/product/nike_agan/耐克nike阿甘深兰黑40-44/深兰黑40-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1163','198','深兰黑40-44 (3).jpg','','','/product/nike_agan/耐克nike阿甘深兰黑40-44/深兰黑40-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1164','198','深兰黑40-44 (4).jpg','','','/product/nike_agan/耐克nike阿甘深兰黑40-44/深兰黑40-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1165','198','深兰黑40-44.jpg','','','/product/nike_agan/耐克nike阿甘深兰黑40-44/深兰黑40-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1166','199','深兰桔36-44 (2).jpg','','','/product/nike_agan/耐克nike阿甘深兰桔36-44/深兰桔36-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1167','199','深兰桔36-44 (3).jpg','','','/product/nike_agan/耐克nike阿甘深兰桔36-44/深兰桔36-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1168','199','深兰桔36-44.jpg','','','/product/nike_agan/耐克nike阿甘深兰桔36-44/深兰桔36-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1169','200','天蓝蓝36-39 (2).jpg','','','/product/nike_agan/耐克nike阿甘天蓝蓝36-39/天蓝蓝36-39 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1170','200','天蓝蓝36-39 (3).jpg','','','/product/nike_agan/耐克nike阿甘天蓝蓝36-39/天蓝蓝36-39 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1171','200','天蓝蓝36-39 (4).jpg','','','/product/nike_agan/耐克nike阿甘天蓝蓝36-39/天蓝蓝36-39 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1172','200','天蓝蓝36-39 (5).jpg','','','/product/nike_agan/耐克nike阿甘天蓝蓝36-39/天蓝蓝36-39 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1173','200','天蓝蓝36-39 (6).jpg','','','/product/nike_agan/耐克nike阿甘天蓝蓝36-39/天蓝蓝36-39 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1174','200','天蓝蓝36-39 (7).jpg','','','/product/nike_agan/耐克nike阿甘天蓝蓝36-39/天蓝蓝36-39 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1175','200','天蓝蓝36-39 (8).jpg','','','/product/nike_agan/耐克nike阿甘天蓝蓝36-39/天蓝蓝36-39 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1176','200','天蓝蓝36-39.jpg','','','/product/nike_agan/耐克nike阿甘天蓝蓝36-39/天蓝蓝36-39.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1177','201','峡谷绿40-44 (2).jpg','','','/product/nike_agan/耐克nike阿甘峡谷绿40-44/峡谷绿40-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1178','201','峡谷绿40-44 (3).jpg','','','/product/nike_agan/耐克nike阿甘峡谷绿40-44/峡谷绿40-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1179','201','峡谷绿40-44 (4).jpg','','','/product/nike_agan/耐克nike阿甘峡谷绿40-44/峡谷绿40-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1180','201','峡谷绿40-44.jpg','','','/product/nike_agan/耐克nike阿甘峡谷绿40-44/峡谷绿40-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1181','202','新红白36-44 (2).jpg','','','/product/nike_agan/耐克nike阿甘新红白36-44/新红白36-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1182','202','新红白36-44 (3).jpg','','','/product/nike_agan/耐克nike阿甘新红白36-44/新红白36-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1183','202','新红白36-44 (4).jpg','','','/product/nike_agan/耐克nike阿甘新红白36-44/新红白36-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1184','202','新红白36-44.jpg','','','/product/nike_agan/耐克nike阿甘新红白36-44/新红白36-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1185','203','荧光绿桃红36-39 (2).jpg','','','/product/nike_agan/耐克nike阿甘荧光绿桃红36-39/荧光绿桃红36-39 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1186','203','荧光绿桃红36-39 (3).jpg','','','/product/nike_agan/耐克nike阿甘荧光绿桃红36-39/荧光绿桃红36-39 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1187','203','荧光绿桃红36-39 (4).jpg','','','/product/nike_agan/耐克nike阿甘荧光绿桃红36-39/荧光绿桃红36-39 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1188','203','荧光绿桃红36-39.jpg','','','/product/nike_agan/耐克nike阿甘荧光绿桃红36-39/荧光绿桃红36-39.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1189','204','宇宙红36-44 (2).jpg','','','/product/nike_agan/耐克nike阿甘宇宙红36-44/宇宙红36-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1190','204','宇宙红36-44 (3).jpg','','','/product/nike_agan/耐克nike阿甘宇宙红36-44/宇宙红36-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1191','204','宇宙红36-44 (4).jpg','','','/product/nike_agan/耐克nike阿甘宇宙红36-44/宇宙红36-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1192','204','宇宙红36-44.jpg','','','/product/nike_agan/耐克nike阿甘宇宙红36-44/宇宙红36-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1193','205','玉黄36-39 (2).jpg','','','/product/nike_agan/耐克nike阿甘玉黄36-39/玉黄36-39 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1194','205','玉黄36-39 (3).jpg','','','/product/nike_agan/耐克nike阿甘玉黄36-39/玉黄36-39 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1195','205','玉黄36-39 (4).jpg','','','/product/nike_agan/耐克nike阿甘玉黄36-39/玉黄36-39 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1196','205','玉黄36-39 (5).jpg','','','/product/nike_agan/耐克nike阿甘玉黄36-39/玉黄36-39 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1197','205','玉黄36-39 (6).jpg','','','/product/nike_agan/耐克nike阿甘玉黄36-39/玉黄36-39 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1198','205','玉黄36-39 (7).jpg','','','/product/nike_agan/耐克nike阿甘玉黄36-39/玉黄36-39 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1199','205','玉黄36-39.jpg','','','/product/nike_agan/耐克nike阿甘玉黄36-39/玉黄36-39.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1200','206','紫红 36-39 (2).jpg','','','/product/nike_agan/耐克nike阿甘紫红 36-39/紫红 36-39 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1201','206','紫红 36-39 (3).jpg','','','/product/nike_agan/耐克nike阿甘紫红 36-39/紫红 36-39 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1202','206','紫红 36-39.jpg','','','/product/nike_agan/耐克nike阿甘紫红 36-39/紫红 36-39.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1203','207','紫月36-44 (2).jpg','','','/product/nike_agan/耐克nike阿甘紫月36-44/紫月36-44 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1204','207','紫月36-44 (3).jpg','','','/product/nike_agan/耐克nike阿甘紫月36-44/紫月36-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1205','207','紫月36-44 (4).jpg','','','/product/nike_agan/耐克nike阿甘紫月36-44/紫月36-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1206','207','紫月36-44.jpg','','','/product/nike_agan/耐克nike阿甘紫月36-44/紫月36-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1207','210','白黑红40--45 (10).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 白黑红40--45/白黑红40--45 (10).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1208','210','白黑红40--45 (11).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 白黑红40--45/白黑红40--45 (11).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1209','210','白黑红40--45 (12).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 白黑红40--45/白黑红40--45 (12).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1210','210','白黑红40--45 (13).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 白黑红40--45/白黑红40--45 (13).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1211','210','白黑红40--45 (14).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 白黑红40--45/白黑红40--45 (14).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1212','210','白黑红40--45 (15).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 白黑红40--45/白黑红40--45 (15).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1213','210','白黑红40--45 (16).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 白黑红40--45/白黑红40--45 (16).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1214','210','白黑红40--45 (17).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 白黑红40--45/白黑红40--45 (17).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1215','210','白黑红40--45 (18).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 白黑红40--45/白黑红40--45 (18).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1216','210','白黑红40--45 (19).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 白黑红40--45/白黑红40--45 (19).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1217','210','白黑红40--45 (2).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 白黑红40--45/白黑红40--45 (2).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1218','210','白黑红40--45 (20).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 白黑红40--45/白黑红40--45 (20).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1219','210','白黑红40--45 (21).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 白黑红40--45/白黑红40--45 (21).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1220','210','白黑红40--45 (3).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 白黑红40--45/白黑红40--45 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1221','210','白黑红40--45 (4).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 白黑红40--45/白黑红40--45 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1222','210','白黑红40--45 (5).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 白黑红40--45/白黑红40--45 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1223','210','白黑红40--45 (6).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 白黑红40--45/白黑红40--45 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1224','210','白黑红40--45 (7).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 白黑红40--45/白黑红40--45 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1225','210','白黑红40--45 (8).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 白黑红40--45/白黑红40--45 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1226','210','白黑红40--45 (9).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 白黑红40--45/白黑红40--45 (9).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1227','210','白黑红40--45.jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 白黑红40--45/白黑红40--45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1228','211','黑红40--45 (2).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 黑红40--45/黑红40--45 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1229','211','黑红40--45 (3).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 黑红40--45/黑红40--45 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1230','211','黑红40--45 (4).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 黑红40--45/黑红40--45 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1231','211','黑红40--45 (5).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 黑红40--45/黑红40--45 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1232','211','黑红40--45.jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 黑红40--45/黑红40--45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1233','212','黑蓝40--45 (10).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 黑蓝40--45/黑蓝40--45 (10).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1234','212','黑蓝40--45 (11).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 黑蓝40--45/黑蓝40--45 (11).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1235','212','黑蓝40--45 (12).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 黑蓝40--45/黑蓝40--45 (12).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1236','212','黑蓝40--45 (13).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 黑蓝40--45/黑蓝40--45 (13).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1237','212','黑蓝40--45 (14).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 黑蓝40--45/黑蓝40--45 (14).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1238','212','黑蓝40--45 (15).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 黑蓝40--45/黑蓝40--45 (15).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1239','212','黑蓝40--45 (16).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 黑蓝40--45/黑蓝40--45 (16).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1240','212','黑蓝40--45 (17).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 黑蓝40--45/黑蓝40--45 (17).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1241','212','黑蓝40--45 (18).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 黑蓝40--45/黑蓝40--45 (18).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1242','212','黑蓝40--45 (19).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 黑蓝40--45/黑蓝40--45 (19).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1243','212','黑蓝40--45 (2).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 黑蓝40--45/黑蓝40--45 (2).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1244','212','黑蓝40--45 (20).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 黑蓝40--45/黑蓝40--45 (20).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1245','212','黑蓝40--45 (21).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 黑蓝40--45/黑蓝40--45 (21).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1246','212','黑蓝40--45 (3).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 黑蓝40--45/黑蓝40--45 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1247','212','黑蓝40--45 (4).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 黑蓝40--45/黑蓝40--45 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1248','212','黑蓝40--45 (5).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 黑蓝40--45/黑蓝40--45 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1249','212','黑蓝40--45 (6).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 黑蓝40--45/黑蓝40--45 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1250','212','黑蓝40--45 (7).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 黑蓝40--45/黑蓝40--45 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1251','212','黑蓝40--45 (8).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 黑蓝40--45/黑蓝40--45 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1252','212','黑蓝40--45 (9).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 黑蓝40--45/黑蓝40--45 (9).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1253','212','黑蓝40--45.jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 黑蓝40--45/黑蓝40--45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1254','213','红黑40--45 (10).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 红黑40--45/红黑40--45 (10).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1255','213','红黑40--45 (11).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 红黑40--45/红黑40--45 (11).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1256','213','红黑40--45 (12).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 红黑40--45/红黑40--45 (12).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1257','213','红黑40--45 (13).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 红黑40--45/红黑40--45 (13).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1258','213','红黑40--45 (14).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 红黑40--45/红黑40--45 (14).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1259','213','红黑40--45 (15).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 红黑40--45/红黑40--45 (15).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1260','213','红黑40--45 (16).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 红黑40--45/红黑40--45 (16).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1261','213','红黑40--45 (17).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 红黑40--45/红黑40--45 (17).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1262','213','红黑40--45 (18).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 红黑40--45/红黑40--45 (18).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1263','213','红黑40--45 (19).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 红黑40--45/红黑40--45 (19).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1264','213','红黑40--45 (2).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 红黑40--45/红黑40--45 (2).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1265','213','红黑40--45 (20).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 红黑40--45/红黑40--45 (20).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1266','213','红黑40--45 (21).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 红黑40--45/红黑40--45 (21).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1267','213','红黑40--45 (22).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 红黑40--45/红黑40--45 (22).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1268','213','红黑40--45 (23).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 红黑40--45/红黑40--45 (23).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1269','213','红黑40--45 (3).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 红黑40--45/红黑40--45 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1270','213','红黑40--45 (4).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 红黑40--45/红黑40--45 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1271','213','红黑40--45 (5).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 红黑40--45/红黑40--45 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1272','213','红黑40--45 (6).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 红黑40--45/红黑40--45 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1273','213','红黑40--45 (7).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 红黑40--45/红黑40--45 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1274','213','红黑40--45 (8).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 红黑40--45/红黑40--45 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1275','213','红黑40--45 (9).jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 红黑40--45/红黑40--45 (9).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1276','213','红黑40--45.jpg','','','/product/nike_air_jordan_1/耐克air jordan 1 红黑40--45/红黑40--45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1277','215','奥利奥 36-45 (10).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 奥利奥--男女鞋36-45/奥利奥 36-45 (10).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1278','215','奥利奥 36-45 (11).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 奥利奥--男女鞋36-45/奥利奥 36-45 (11).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1279','215','奥利奥 36-45 (12).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 奥利奥--男女鞋36-45/奥利奥 36-45 (12).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1280','215','奥利奥 36-45 (13).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 奥利奥--男女鞋36-45/奥利奥 36-45 (13).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1281','215','奥利奥 36-45 (2).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 奥利奥--男女鞋36-45/奥利奥 36-45 (2).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1282','215','奥利奥 36-45 (3).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 奥利奥--男女鞋36-45/奥利奥 36-45 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1283','215','奥利奥 36-45 (4).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 奥利奥--男女鞋36-45/奥利奥 36-45 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1284','215','奥利奥 36-45 (5).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 奥利奥--男女鞋36-45/奥利奥 36-45 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1285','215','奥利奥 36-45 (6).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 奥利奥--男女鞋36-45/奥利奥 36-45 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1286','215','奥利奥 36-45 (7).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 奥利奥--男女鞋36-45/奥利奥 36-45 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1287','215','奥利奥 36-45 (8).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 奥利奥--男女鞋36-45/奥利奥 36-45 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1288','215','奥利奥 36-45 (9).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 奥利奥--男女鞋36-45/奥利奥 36-45 (9).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1289','215','奥利奥 36-45.jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 奥利奥--男女鞋36-45/奥利奥 36-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1290','216','白黑红 36-45 (2).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 白黑红 男女鞋36-45/白黑红 36-45 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1291','216','白黑红 36-45 (3).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 白黑红 男女鞋36-45/白黑红 36-45 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1292','216','白黑红 36-45 (4).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 白黑红 男女鞋36-45/白黑红 36-45 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1293','216','白黑红 36-45 (5).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 白黑红 男女鞋36-45/白黑红 36-45 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1294','216','白黑红 36-45 (6).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 白黑红 男女鞋36-45/白黑红 36-45 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1295','216','白黑红 36-45.jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 白黑红 男女鞋36-45/白黑红 36-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1296','217','白灰点 男女鞋 36-45 (2).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 白灰点 男女鞋 36-45/白灰点 男女鞋 36-45 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1297','217','白灰点 男女鞋 36-45 (3).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 白灰点 男女鞋 36-45/白灰点 男女鞋 36-45 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1298','217','白灰点 男女鞋 36-45 (4).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 白灰点 男女鞋 36-45/白灰点 男女鞋 36-45 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1299','217','白灰点 男女鞋 36-45 (5).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 白灰点 男女鞋 36-45/白灰点 男女鞋 36-45 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1300','217','白灰点 男女鞋 36-45 (6).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 白灰点 男女鞋 36-45/白灰点 男女鞋 36-45 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1301','217','白灰点 男女鞋 36-45 (7).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 白灰点 男女鞋 36-45/白灰点 男女鞋 36-45 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1302','217','白灰点 男女鞋 36-45 (8).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 白灰点 男女鞋 36-45/白灰点 男女鞋 36-45 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1303','217','白灰点 男女鞋 36-45.jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 白灰点 男女鞋 36-45/白灰点 男女鞋 36-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1304','218','白蓝 女鞋36-39 (2).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 白蓝 女鞋36-39/白蓝 女鞋36-39 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1305','218','白蓝 女鞋36-39 (3).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 白蓝 女鞋36-39/白蓝 女鞋36-39 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1306','218','白蓝 女鞋36-39 (4).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 白蓝 女鞋36-39/白蓝 女鞋36-39 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1307','218','白蓝 女鞋36-39 (5).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 白蓝 女鞋36-39/白蓝 女鞋36-39 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1308','218','白蓝 女鞋36-39 (6).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 白蓝 女鞋36-39/白蓝 女鞋36-39 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1309','218','白蓝 女鞋36-39.jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 白蓝 女鞋36-39/白蓝 女鞋36-39.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1310','219','白兰 36-45 (2).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 白兰 36-45/白兰 36-45 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1311','219','白兰 36-45 (3).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 白兰 36-45/白兰 36-45 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1312','219','白兰 36-45 (4).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 白兰 36-45/白兰 36-45 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1313','219','白兰 36-45 (5).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 白兰 36-45/白兰 36-45 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1314','219','白兰 36-45 (6).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 白兰 36-45/白兰 36-45 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1315','219','白兰 36-45 (7).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 白兰 36-45/白兰 36-45 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1316','219','白兰 36-45.jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 白兰 36-45/白兰 36-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1317','220','公牛大红 36-45 (10).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 公牛大红 男女鞋 36-45/公牛大红 36-45 (10).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1318','220','公牛大红 36-45 (11).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 公牛大红 男女鞋 36-45/公牛大红 36-45 (11).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1319','220','公牛大红 36-45 (12).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 公牛大红 男女鞋 36-45/公牛大红 36-45 (12).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1320','220','公牛大红 36-45 (13).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 公牛大红 男女鞋 36-45/公牛大红 36-45 (13).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1321','220','公牛大红 36-45 (14).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 公牛大红 男女鞋 36-45/公牛大红 36-45 (14).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1322','220','公牛大红 36-45 (15).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 公牛大红 男女鞋 36-45/公牛大红 36-45 (15).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1323','220','公牛大红 36-45 (16).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 公牛大红 男女鞋 36-45/公牛大红 36-45 (16).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1324','220','公牛大红 36-45 (17).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 公牛大红 男女鞋 36-45/公牛大红 36-45 (17).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1325','220','公牛大红 36-45 (2).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 公牛大红 男女鞋 36-45/公牛大红 36-45 (2).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1326','220','公牛大红 36-45 (3).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 公牛大红 男女鞋 36-45/公牛大红 36-45 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1327','220','公牛大红 36-45 (4).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 公牛大红 男女鞋 36-45/公牛大红 36-45 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1328','220','公牛大红 36-45 (5).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 公牛大红 男女鞋 36-45/公牛大红 36-45 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1329','220','公牛大红 36-45 (6).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 公牛大红 男女鞋 36-45/公牛大红 36-45 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1330','220','公牛大红 36-45 (7).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 公牛大红 男女鞋 36-45/公牛大红 36-45 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1331','220','公牛大红 36-45 (8).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 公牛大红 男女鞋 36-45/公牛大红 36-45 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1332','220','公牛大红 36-45 (9).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 公牛大红 男女鞋 36-45/公牛大红 36-45 (9).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1333','220','公牛大红 36-45.jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 公牛大红 男女鞋 36-45/公牛大红 36-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1334','221','黑红 男女鞋36-45 (2).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 黑红 男女鞋36-45/黑红 男女鞋36-45 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1335','221','黑红 男女鞋36-45 (3).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 黑红 男女鞋36-45/黑红 男女鞋36-45 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1336','221','黑红 男女鞋36-45 (4).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 黑红 男女鞋36-45/黑红 男女鞋36-45 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1337','221','黑红 男女鞋36-45 (5).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 黑红 男女鞋36-45/黑红 男女鞋36-45 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1338','221','黑红 男女鞋36-45 (6).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 黑红 男女鞋36-45/黑红 男女鞋36-45 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1339','221','黑红 男女鞋36-45.jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 黑红 男女鞋36-45/黑红 男女鞋36-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1340','222','黑红橘蓝 36-45 (2).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 黑红橘蓝 骑士男女款36-45/黑红橘蓝 36-45 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1341','222','黑红橘蓝 36-45 (3).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 黑红橘蓝 骑士男女款36-45/黑红橘蓝 36-45 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1342','222','黑红橘蓝 36-45 (4).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 黑红橘蓝 骑士男女款36-45/黑红橘蓝 36-45 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1343','222','黑红橘蓝 36-45 (5).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 黑红橘蓝 骑士男女款36-45/黑红橘蓝 36-45 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1344','222','黑红橘蓝 36-45 (6).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 黑红橘蓝 骑士男女款36-45/黑红橘蓝 36-45 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1345','222','黑红橘蓝 36-45 (7).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 黑红橘蓝 骑士男女款36-45/黑红橘蓝 36-45 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1346','222','黑红橘蓝 36-45 (8).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 黑红橘蓝 骑士男女款36-45/黑红橘蓝 36-45 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1347','222','黑红橘蓝 36-45 (9).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 黑红橘蓝 骑士男女款36-45/黑红橘蓝 36-45 (9).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1348','222','黑红橘蓝 36-45.jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 黑红橘蓝 骑士男女款36-45/黑红橘蓝 36-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1349','223','黑黄 36-45 (2).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 黑黄 男女鞋36-45/黑黄 36-45 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1350','223','黑黄 36-45 (3).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 黑黄 男女鞋36-45/黑黄 36-45 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1351','223','黑黄 36-45 (4).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 黑黄 男女鞋36-45/黑黄 36-45 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1352','223','黑黄 36-45 (5).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 黑黄 男女鞋36-45/黑黄 36-45 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1353','223','黑黄 36-45 (6).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 黑黄 男女鞋36-45/黑黄 36-45 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1354','223','黑黄 36-45 (7).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 黑黄 男女鞋36-45/黑黄 36-45 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1355','223','黑黄 36-45.jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 黑黄 男女鞋36-45/黑黄 36-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1356','224','灰绿 36-45 (10).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 灰绿 男女鞋36-45/灰绿 36-45 (10).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1357','224','灰绿 36-45 (11).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 灰绿 男女鞋36-45/灰绿 36-45 (11).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1358','224','灰绿 36-45 (2).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 灰绿 男女鞋36-45/灰绿 36-45 (2).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1359','224','灰绿 36-45 (3).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 灰绿 男女鞋36-45/灰绿 36-45 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1360','224','灰绿 36-45 (4).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 灰绿 男女鞋36-45/灰绿 36-45 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1361','224','灰绿 36-45 (5).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 灰绿 男女鞋36-45/灰绿 36-45 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1362','224','灰绿 36-45 (6).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 灰绿 男女鞋36-45/灰绿 36-45 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1363','224','灰绿 36-45 (7).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 灰绿 男女鞋36-45/灰绿 36-45 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1364','224','灰绿 36-45 (8).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 灰绿 男女鞋36-45/灰绿 36-45 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1365','224','灰绿 36-45 (9).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 灰绿 男女鞋36-45/灰绿 36-45 (9).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1366','224','灰绿 36-45.jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 灰绿 男女鞋36-45/灰绿 36-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1367','225','孔雀蓝 36-45 (2).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 孔雀蓝 男女鞋36-45/孔雀蓝 36-45 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1368','225','孔雀蓝 36-45 (3).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 孔雀蓝 男女鞋36-45/孔雀蓝 36-45 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1369','225','孔雀蓝 36-45 (4).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 孔雀蓝 男女鞋36-45/孔雀蓝 36-45 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1370','225','孔雀蓝 36-45 (5).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 孔雀蓝 男女鞋36-45/孔雀蓝 36-45 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1371','225','孔雀蓝 36-45 (6).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 孔雀蓝 男女鞋36-45/孔雀蓝 36-45 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1372','225','孔雀蓝 36-45 (7).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 孔雀蓝 男女鞋36-45/孔雀蓝 36-45 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1373','225','孔雀蓝 36-45 (8).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 孔雀蓝 男女鞋36-45/孔雀蓝 36-45 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1374','225','孔雀蓝 36-45 (9).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 孔雀蓝 男女鞋36-45/孔雀蓝 36-45 (9).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1375','225','孔雀蓝 36-45.jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 孔雀蓝 男女鞋36-45/孔雀蓝 36-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1376','226','南海岸 女鞋36-40 (10).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 南海岸 女鞋36-40/南海岸 女鞋36-40 (10).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1377','226','南海岸 女鞋36-40 (11).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 南海岸 女鞋36-40/南海岸 女鞋36-40 (11).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1378','226','南海岸 女鞋36-40 (12).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 南海岸 女鞋36-40/南海岸 女鞋36-40 (12).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1379','226','南海岸 女鞋36-40 (13).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 南海岸 女鞋36-40/南海岸 女鞋36-40 (13).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1380','226','南海岸 女鞋36-40 (14).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 南海岸 女鞋36-40/南海岸 女鞋36-40 (14).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1381','226','南海岸 女鞋36-40 (15).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 南海岸 女鞋36-40/南海岸 女鞋36-40 (15).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1382','226','南海岸 女鞋36-40 (2).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 南海岸 女鞋36-40/南海岸 女鞋36-40 (2).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1383','226','南海岸 女鞋36-40 (3).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 南海岸 女鞋36-40/南海岸 女鞋36-40 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1384','226','南海岸 女鞋36-40 (4).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 南海岸 女鞋36-40/南海岸 女鞋36-40 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1385','226','南海岸 女鞋36-40 (5).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 南海岸 女鞋36-40/南海岸 女鞋36-40 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1386','226','南海岸 女鞋36-40 (6).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 南海岸 女鞋36-40/南海岸 女鞋36-40 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1387','226','南海岸 女鞋36-40 (7).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 南海岸 女鞋36-40/南海岸 女鞋36-40 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1388','226','南海岸 女鞋36-40 (8).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 南海岸 女鞋36-40/南海岸 女鞋36-40 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1389','226','南海岸 女鞋36-40 (9).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 南海岸 女鞋36-40/南海岸 女鞋36-40 (9).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1390','226','南海岸 女鞋36-40.jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 南海岸 女鞋36-40/南海岸 女鞋36-40.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1391','227','女鞋 桃红黑 36-39 (2).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 女鞋 桃红黑 36-39/女鞋 桃红黑 36-39 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1392','227','女鞋 桃红黑 36-39 (3).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 女鞋 桃红黑 36-39/女鞋 桃红黑 36-39 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1393','227','女鞋 桃红黑 36-39 (4).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 女鞋 桃红黑 36-39/女鞋 桃红黑 36-39 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1394','227','女鞋 桃红黑 36-39 (5).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 女鞋 桃红黑 36-39/女鞋 桃红黑 36-39 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1395','227','女鞋 桃红黑 36-39 (6).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 女鞋 桃红黑 36-39/女鞋 桃红黑 36-39 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1396','227','女鞋 桃红黑 36-39.jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 女鞋 桃红黑 36-39/女鞋 桃红黑 36-39.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1397','228','黑绿女鞋36-40 (2).jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 皮面黑绿女鞋36-40/黑绿女鞋36-40 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1398','228','黑绿女鞋36-40.jpg','','','/product/nike_air_jordan_4/耐克air jordan 4代 皮面黑绿女鞋36-40/黑绿女鞋36-40.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1399','231','奥利奥36-45 (10).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 奥利奥36-45/奥利奥36-45 (10).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1400','231','奥利奥36-45 (11).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 奥利奥36-45/奥利奥36-45 (11).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1401','231','奥利奥36-45 (12).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 奥利奥36-45/奥利奥36-45 (12).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1402','231','奥利奥36-45 (13).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 奥利奥36-45/奥利奥36-45 (13).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1403','231','奥利奥36-45 (14).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 奥利奥36-45/奥利奥36-45 (14).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1404','231','奥利奥36-45 (15).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 奥利奥36-45/奥利奥36-45 (15).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1405','231','奥利奥36-45 (16).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 奥利奥36-45/奥利奥36-45 (16).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1406','231','奥利奥36-45 (2).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 奥利奥36-45/奥利奥36-45 (2).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1407','231','奥利奥36-45 (3).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 奥利奥36-45/奥利奥36-45 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1408','231','奥利奥36-45 (4).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 奥利奥36-45/奥利奥36-45 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1409','231','奥利奥36-45 (5).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 奥利奥36-45/奥利奥36-45 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1410','231','奥利奥36-45 (6).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 奥利奥36-45/奥利奥36-45 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1411','231','奥利奥36-45 (7).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 奥利奥36-45/奥利奥36-45 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1412','231','奥利奥36-45 (8).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 奥利奥36-45/奥利奥36-45 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1413','231','奥利奥36-45 (9).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 奥利奥36-45/奥利奥36-45 (9).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1414','231','奥利奥36-45.jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 奥利奥36-45/奥利奥36-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1415','232','白黑红火焰红36-46 (10).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 白黑红火焰红36-46/白黑红火焰红36-46 (10).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1416','232','白黑红火焰红36-46 (11).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 白黑红火焰红36-46/白黑红火焰红36-46 (11).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1417','232','白黑红火焰红36-46 (12).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 白黑红火焰红36-46/白黑红火焰红36-46 (12).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1418','232','白黑红火焰红36-46 (13).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 白黑红火焰红36-46/白黑红火焰红36-46 (13).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1419','232','白黑红火焰红36-46 (2).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 白黑红火焰红36-46/白黑红火焰红36-46 (2).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1420','232','白黑红火焰红36-46 (3).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 白黑红火焰红36-46/白黑红火焰红36-46 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1421','232','白黑红火焰红36-46 (4).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 白黑红火焰红36-46/白黑红火焰红36-46 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1422','232','白黑红火焰红36-46 (5).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 白黑红火焰红36-46/白黑红火焰红36-46 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1423','232','白黑红火焰红36-46 (6).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 白黑红火焰红36-46/白黑红火焰红36-46 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1424','232','白黑红火焰红36-46 (7).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 白黑红火焰红36-46/白黑红火焰红36-46 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1425','232','白黑红火焰红36-46 (8).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 白黑红火焰红36-46/白黑红火焰红36-46 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1426','232','白黑红火焰红36-46 (9).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 白黑红火焰红36-46/白黑红火焰红36-46 (9).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1427','232','白黑红火焰红36-46.jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 白黑红火焰红36-46/白黑红火焰红36-46.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1428','233','白紫葡萄36-39 (10).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 白紫葡萄36-39/白紫葡萄36-39 (10).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1429','233','白紫葡萄36-39 (11).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 白紫葡萄36-39/白紫葡萄36-39 (11).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1430','233','白紫葡萄36-39 (12).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 白紫葡萄36-39/白紫葡萄36-39 (12).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1431','233','白紫葡萄36-39 (13).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 白紫葡萄36-39/白紫葡萄36-39 (13).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1432','233','白紫葡萄36-39 (14).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 白紫葡萄36-39/白紫葡萄36-39 (14).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1433','233','白紫葡萄36-39 (15).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 白紫葡萄36-39/白紫葡萄36-39 (15).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1434','233','白紫葡萄36-39 (16).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 白紫葡萄36-39/白紫葡萄36-39 (16).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1435','233','白紫葡萄36-39 (17).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 白紫葡萄36-39/白紫葡萄36-39 (17).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1436','233','白紫葡萄36-39 (2).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 白紫葡萄36-39/白紫葡萄36-39 (2).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1437','233','白紫葡萄36-39 (3).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 白紫葡萄36-39/白紫葡萄36-39 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1438','233','白紫葡萄36-39 (4).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 白紫葡萄36-39/白紫葡萄36-39 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1439','233','白紫葡萄36-39 (5).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 白紫葡萄36-39/白紫葡萄36-39 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1440','233','白紫葡萄36-39 (6).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 白紫葡萄36-39/白紫葡萄36-39 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1441','233','白紫葡萄36-39 (7).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 白紫葡萄36-39/白紫葡萄36-39 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1442','233','白紫葡萄36-39 (8).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 白紫葡萄36-39/白紫葡萄36-39 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1443','233','白紫葡萄36-39 (9).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 白紫葡萄36-39/白紫葡萄36-39 (9).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1444','233','白紫葡萄36-39.jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 白紫葡萄36-39/白紫葡萄36-39.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1445','234','黑粉 36-39 (10).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑粉 36-39/黑粉 36-39 (10).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1446','234','黑粉 36-39 (11).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑粉 36-39/黑粉 36-39 (11).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1447','234','黑粉 36-39 (12).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑粉 36-39/黑粉 36-39 (12).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1448','234','黑粉 36-39 (13).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑粉 36-39/黑粉 36-39 (13).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1449','234','黑粉 36-39 (14).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑粉 36-39/黑粉 36-39 (14).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1450','234','黑粉 36-39 (15).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑粉 36-39/黑粉 36-39 (15).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1451','234','黑粉 36-39 (16).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑粉 36-39/黑粉 36-39 (16).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1452','234','黑粉 36-39 (2).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑粉 36-39/黑粉 36-39 (2).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1453','234','黑粉 36-39 (3).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑粉 36-39/黑粉 36-39 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1454','234','黑粉 36-39 (4).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑粉 36-39/黑粉 36-39 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1455','234','黑粉 36-39 (5).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑粉 36-39/黑粉 36-39 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1456','234','黑粉 36-39 (6).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑粉 36-39/黑粉 36-39 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1457','234','黑粉 36-39 (7).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑粉 36-39/黑粉 36-39 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1458','234','黑粉 36-39 (8).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑粉 36-39/黑粉 36-39 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1459','234','黑粉 36-39 (9).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑粉 36-39/黑粉 36-39 (9).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1460','234','黑粉 36-39.jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑粉 36-39/黑粉 36-39.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1461','235','黑红爆裂纹 41-46 (2).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑红爆裂纹 41-46/黑红爆裂纹 41-46 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1462','235','黑红爆裂纹 41-46 (3).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑红爆裂纹 41-46/黑红爆裂纹 41-46 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1463','235','黑红爆裂纹 41-46 (4).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑红爆裂纹 41-46/黑红爆裂纹 41-46 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1464','235','黑红爆裂纹 41-46 (5).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑红爆裂纹 41-46/黑红爆裂纹 41-46 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1465','235','黑红爆裂纹 41-46.jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑红爆裂纹 41-46/黑红爆裂纹 41-46.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1466','236','黑蓝桔女鞋36-40 (2).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑蓝桔女鞋36-40/黑蓝桔女鞋36-40 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1467','236','黑蓝桔女鞋36-40 (3).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑蓝桔女鞋36-40/黑蓝桔女鞋36-40 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1468','236','黑蓝桔女鞋36-40 (4).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑蓝桔女鞋36-40/黑蓝桔女鞋36-40 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1469','236','黑蓝桔女鞋36-40.jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑蓝桔女鞋36-40/黑蓝桔女鞋36-40.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1470','237','黑桃红 36-45 (2).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑桃红皮面 36-45/黑桃红 36-45 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1471','237','黑桃红 36-45 (3).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑桃红皮面 36-45/黑桃红 36-45 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1472','237','黑桃红 36-45 (4).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑桃红皮面 36-45/黑桃红 36-45 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1473','237','黑桃红 36-45.jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑桃红皮面 36-45/黑桃红 36-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1474','238','黑银36-44 (10).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑银36-44/黑银36-44 (10).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1475','238','黑银36-44 (11).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑银36-44/黑银36-44 (11).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1476','238','黑银36-44 (12).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑银36-44/黑银36-44 (12).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1477','238','黑银36-44 (13).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑银36-44/黑银36-44 (13).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1478','238','黑银36-44 (14).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑银36-44/黑银36-44 (14).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1479','238','黑银36-44 (15).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑银36-44/黑银36-44 (15).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1480','238','黑银36-44 (16).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑银36-44/黑银36-44 (16).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1481','238','黑银36-44 (2).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑银36-44/黑银36-44 (2).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1482','238','黑银36-44 (3).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑银36-44/黑银36-44 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1483','238','黑银36-44 (4).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑银36-44/黑银36-44 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1484','238','黑银36-44 (5).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑银36-44/黑银36-44 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1485','238','黑银36-44 (6).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑银36-44/黑银36-44 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1486','238','黑银36-44 (7).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑银36-44/黑银36-44 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1487','238','黑银36-44 (8).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑银36-44/黑银36-44 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1488','238','黑银36-44 (9).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑银36-44/黑银36-44 (9).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1489','238','黑银36-44.jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑银36-44/黑银36-44.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1490','239','黑紫葡萄 36-39 (10).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑紫葡萄 36-39/黑紫葡萄 36-39 (10).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1491','239','黑紫葡萄 36-39 (11).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑紫葡萄 36-39/黑紫葡萄 36-39 (11).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1492','239','黑紫葡萄 36-39 (12).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑紫葡萄 36-39/黑紫葡萄 36-39 (12).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1493','239','黑紫葡萄 36-39 (13).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑紫葡萄 36-39/黑紫葡萄 36-39 (13).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1494','239','黑紫葡萄 36-39 (14).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑紫葡萄 36-39/黑紫葡萄 36-39 (14).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1495','239','黑紫葡萄 36-39 (15).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑紫葡萄 36-39/黑紫葡萄 36-39 (15).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1496','239','黑紫葡萄 36-39 (16).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑紫葡萄 36-39/黑紫葡萄 36-39 (16).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1497','239','黑紫葡萄 36-39 (2).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑紫葡萄 36-39/黑紫葡萄 36-39 (2).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1498','239','黑紫葡萄 36-39 (3).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑紫葡萄 36-39/黑紫葡萄 36-39 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1499','239','黑紫葡萄 36-39 (4).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑紫葡萄 36-39/黑紫葡萄 36-39 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1500','239','黑紫葡萄 36-39 (5).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑紫葡萄 36-39/黑紫葡萄 36-39 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1501','239','黑紫葡萄 36-39 (6).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑紫葡萄 36-39/黑紫葡萄 36-39 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1502','239','黑紫葡萄 36-39 (7).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑紫葡萄 36-39/黑紫葡萄 36-39 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1503','239','黑紫葡萄 36-39 (8).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑紫葡萄 36-39/黑紫葡萄 36-39 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1504','239','黑紫葡萄 36-39 (9).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑紫葡萄 36-39/黑紫葡萄 36-39 (9).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1505','239','黑紫葡萄 36-39.jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 黑紫葡萄 36-39/黑紫葡萄 36-39.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1506','240','女鞋 紫葡萄36-40 (2).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 女鞋 紫葡萄36-40/女鞋 紫葡萄36-40 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1507','240','女鞋 紫葡萄36-40 (3).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 女鞋 紫葡萄36-40/女鞋 紫葡萄36-40 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1508','240','女鞋 紫葡萄36-40 (4).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 女鞋 紫葡萄36-40/女鞋 紫葡萄36-40 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1509','240','女鞋 紫葡萄36-40 (5).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 女鞋 紫葡萄36-40/女鞋 紫葡萄36-40 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1510','240','女鞋 紫葡萄36-40 (6).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 女鞋 紫葡萄36-40/女鞋 紫葡萄36-40 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1511','240','女鞋 紫葡萄36-40.jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 女鞋 紫葡萄36-40/女鞋 紫葡萄36-40.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1512','241','深绿皮面41-46 (2).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 深绿皮面41-46/深绿皮面41-46 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1513','241','深绿皮面41-46 (3).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 深绿皮面41-46/深绿皮面41-46 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1514','241','深绿皮面41-46 (4).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 深绿皮面41-46/深绿皮面41-46 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1515','241','深绿皮面41-46 (5).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 深绿皮面41-46/深绿皮面41-46 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1516','241','深绿皮面41-46 (6).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 深绿皮面41-46/深绿皮面41-46 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1517','241','深绿皮面41-46 (7).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 深绿皮面41-46/深绿皮面41-46 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1518','241','深绿皮面41-46.jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 深绿皮面41-46/深绿皮面41-46.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1519','242','限量版 爆裂纹 40-46 (2).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 限量版 爆裂纹 40-46/限量版 爆裂纹 40-46 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1520','242','限量版 爆裂纹 40-46 (3).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 限量版 爆裂纹 40-46/限量版 爆裂纹 40-46 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1521','242','限量版 爆裂纹 40-46 (4).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 限量版 爆裂纹 40-46/限量版 爆裂纹 40-46 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1522','242','限量版 爆裂纹 40-46 (5).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 限量版 爆裂纹 40-46/限量版 爆裂纹 40-46 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1523','242','限量版 爆裂纹 40-46 (6).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 限量版 爆裂纹 40-46/限量版 爆裂纹 40-46 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1524','242','限量版 爆裂纹 40-46.jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 限量版 爆裂纹 40-46/限量版 爆裂纹 40-46.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1525','243','红爆裂纹40-46 (2).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 限量版 红爆裂纹40-46/红爆裂纹40-46 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1526','243','红爆裂纹40-46 (3).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 限量版 红爆裂纹40-46/红爆裂纹40-46 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1527','243','红爆裂纹40-46 (4).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 限量版 红爆裂纹40-46/红爆裂纹40-46 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1528','243','红爆裂纹40-46 (5).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 限量版 红爆裂纹40-46/红爆裂纹40-46 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1529','243','红爆裂纹40-46.jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 限量版 红爆裂纹40-46/红爆裂纹40-46.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1530','244','鸳鸯男女鞋36-46 (10).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 鸳鸯男女鞋36-46/鸳鸯男女鞋36-46 (10).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1531','244','鸳鸯男女鞋36-46 (11).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 鸳鸯男女鞋36-46/鸳鸯男女鞋36-46 (11).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1532','244','鸳鸯男女鞋36-46 (12).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 鸳鸯男女鞋36-46/鸳鸯男女鞋36-46 (12).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1533','244','鸳鸯男女鞋36-46 (13).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 鸳鸯男女鞋36-46/鸳鸯男女鞋36-46 (13).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1534','244','鸳鸯男女鞋36-46 (14).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 鸳鸯男女鞋36-46/鸳鸯男女鞋36-46 (14).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1535','244','鸳鸯男女鞋36-46 (15).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 鸳鸯男女鞋36-46/鸳鸯男女鞋36-46 (15).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1536','244','鸳鸯男女鞋36-46 (16).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 鸳鸯男女鞋36-46/鸳鸯男女鞋36-46 (16).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1537','244','鸳鸯男女鞋36-46 (2).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 鸳鸯男女鞋36-46/鸳鸯男女鞋36-46 (2).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1538','244','鸳鸯男女鞋36-46 (3).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 鸳鸯男女鞋36-46/鸳鸯男女鞋36-46 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1539','244','鸳鸯男女鞋36-46 (4).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 鸳鸯男女鞋36-46/鸳鸯男女鞋36-46 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1540','244','鸳鸯男女鞋36-46 (5).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 鸳鸯男女鞋36-46/鸳鸯男女鞋36-46 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1541','244','鸳鸯男女鞋36-46 (6).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 鸳鸯男女鞋36-46/鸳鸯男女鞋36-46 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1542','244','鸳鸯男女鞋36-46 (7).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 鸳鸯男女鞋36-46/鸳鸯男女鞋36-46 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1543','244','鸳鸯男女鞋36-46 (8).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 鸳鸯男女鞋36-46/鸳鸯男女鞋36-46 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1544','244','鸳鸯男女鞋36-46 (9).jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 鸳鸯男女鞋36-46/鸳鸯男女鞋36-46 (9).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1545','244','鸳鸯男女鞋36-46.jpg','','','/product/nike_air_jordan_5/耐克air jordan 5代 鸳鸯男女鞋36-46/鸳鸯男女鞋36-46.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1546','246','黑粉红紫36-40 (2).jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫黑粉红紫36-40/黑粉红紫36-40 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1547','246','黑粉红紫36-40 (3).jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫黑粉红紫36-40/黑粉红紫36-40 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1548','246','黑粉红紫36-40 (4).jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫黑粉红紫36-40/黑粉红紫36-40 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1549','246','黑粉红紫36-40 (5).jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫黑粉红紫36-40/黑粉红紫36-40 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1550','246','黑粉红紫36-40 (6).jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫黑粉红紫36-40/黑粉红紫36-40 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1551','246','黑粉红紫36-40 (7).jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫黑粉红紫36-40/黑粉红紫36-40 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1552','246','黑粉红紫36-40.jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫黑粉红紫36-40/黑粉红紫36-40.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1553','247','黑桔红荧光绿40-46 (2).jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫黑桔红荧光绿40-46/黑桔红荧光绿40-46 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1554','247','黑桔红荧光绿40-46 (3).jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫黑桔红荧光绿40-46/黑桔红荧光绿40-46 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1555','247','黑桔红荧光绿40-46 (4).jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫黑桔红荧光绿40-46/黑桔红荧光绿40-46 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1556','247','黑桔红荧光绿40-46 (5).jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫黑桔红荧光绿40-46/黑桔红荧光绿40-46 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1557','247','黑桔红荧光绿40-46 (6).jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫黑桔红荧光绿40-46/黑桔红荧光绿40-46 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1558','247','黑桔红荧光绿40-46 (7).jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫黑桔红荧光绿40-46/黑桔红荧光绿40-46 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1559','247','黑桔红荧光绿40-46.jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫黑桔红荧光绿40-46/黑桔红荧光绿40-46.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1560','248','黑月黄40-46 (2).jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫黑月黄40-46/黑月黄40-46 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1561','248','黑月黄40-46 (3).jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫黑月黄40-46/黑月黄40-46 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1562','248','黑月黄40-46 (4).jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫黑月黄40-46/黑月黄40-46 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1563','248','黑月黄40-46 (5).jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫黑月黄40-46/黑月黄40-46 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1564','248','黑月黄40-46 (6).jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫黑月黄40-46/黑月黄40-46 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1565','248','黑月黄40-46 (7).jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫黑月黄40-46/黑月黄40-46 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1566','248','黑月黄40-46 (8).jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫黑月黄40-46/黑月黄40-46 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1567','248','黑月黄40-46.jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫黑月黄40-46/黑月黄40-46.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1568','249','黑紫月36-40 (2).jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫黑紫月36-40/黑紫月36-40 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1569','249','黑紫月36-40.jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫黑紫月36-40/黑紫月36-40.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1570','250','灰玉绿40-46 (2).jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫灰玉绿40-46/灰玉绿40-46 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1571','250','灰玉绿40-46 (3).jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫灰玉绿40-46/灰玉绿40-46 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1572','250','灰玉绿40-46.jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫灰玉绿40-46/灰玉绿40-46.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1573','251','灰紫玉40-46 (2).jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫灰紫玉40-46/灰紫玉40-46 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1574','251','灰紫玉40-46 (3).jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫灰紫玉40-46/灰紫玉40-46 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1575','251','灰紫玉40-46 (4).jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫灰紫玉40-46/灰紫玉40-46 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1576','251','灰紫玉40-46 (5).jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫灰紫玉40-46/灰紫玉40-46 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1577','251','灰紫玉40-46 (6).jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫灰紫玉40-46/灰紫玉40-46 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1578','251','灰紫玉40-46 (7).jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫灰紫玉40-46/灰紫玉40-46 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1579','251','灰紫玉40-46.jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫灰紫玉40-46/灰紫玉40-46.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1580','252','孔雀兰桔红40-46 (2).jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫孔雀兰桔红40-46/孔雀兰桔红40-46 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1581','252','孔雀兰桔红40-46 (3).jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫孔雀兰桔红40-46/孔雀兰桔红40-46 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1582','252','孔雀兰桔红40-46 (4).jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫孔雀兰桔红40-46/孔雀兰桔红40-46 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1583','252','孔雀兰桔红40-46 (5).jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫孔雀兰桔红40-46/孔雀兰桔红40-46 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1584','252','孔雀兰桔红40-46 (6).jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫孔雀兰桔红40-46/孔雀兰桔红40-46 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1585','252','孔雀兰桔红40-46 (7).jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫孔雀兰桔红40-46/孔雀兰桔红40-46 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1586','252','孔雀兰桔红40-46.jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫孔雀兰桔红40-46/孔雀兰桔红40-46.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1587','253','紫桔红36-40 (2).jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫紫桔红36-40/紫桔红36-40 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1588','253','紫桔红36-40 (3).jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫紫桔红36-40/紫桔红36-40 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1589','253','紫桔红36-40 (4).jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫紫桔红36-40/紫桔红36-40 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1590','253','紫桔红36-40 (5).jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫紫桔红36-40/紫桔红36-40 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1591','253','紫桔红36-40 (6).jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫紫桔红36-40/紫桔红36-40 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1592','253','紫桔红36-40 (7).jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫紫桔红36-40/紫桔红36-40 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1593','253','紫桔红36-40.jpg','','','/product/nike_feixian/耐克nike飞线彩虹全气垫紫桔红36-40/紫桔红36-40.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1594','255','big(10).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋白太阳红39-44/big(10).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1595','255','big(11).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋白太阳红39-44/big(11).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1596','255','big(2).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋白太阳红39-44/big(2).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1597','255','big(3).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋白太阳红39-44/big(3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1598','255','big(4).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋白太阳红39-44/big(4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1599','255','big(5).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋白太阳红39-44/big(5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1600','255','big(6).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋白太阳红39-44/big(6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1601','255','big(7).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋白太阳红39-44/big(7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1602','255','big(8).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋白太阳红39-44/big(8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1603','255','big(9).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋白太阳红39-44/big(9).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1604','255','big.jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋白太阳红39-44/big.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1605','256','big(10).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋冰蓝白39-44/big(10).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1606','256','big(2).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋冰蓝白39-44/big(2).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1607','256','big(3).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋冰蓝白39-44/big(3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1608','256','big(4).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋冰蓝白39-44/big(4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1609','256','big(5).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋冰蓝白39-44/big(5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1610','256','big(6).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋冰蓝白39-44/big(6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1611','256','big(7).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋冰蓝白39-44/big(7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1612','256','big(8).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋冰蓝白39-44/big(8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1613','256','big(9).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋冰蓝白39-44/big(9).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1614','256','big.jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋冰蓝白39-44/big.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1615','257','big(10).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋黑玫红39-44/big(10).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1616','257','big(2).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋黑玫红39-44/big(2).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1617','257','big(3).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋黑玫红39-44/big(3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1618','257','big(4).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋黑玫红39-44/big(4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1619','257','big(5).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋黑玫红39-44/big(5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1620','257','big(6).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋黑玫红39-44/big(6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1621','257','big(7).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋黑玫红39-44/big(7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1622','257','big(8).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋黑玫红39-44/big(8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1623','257','big(9).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋黑玫红39-44/big(9).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1624','257','big.jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋黑玫红39-44/big.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1625','258','big(10).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋煤黑蓝39-44/big(10).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1626','258','big(11).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋煤黑蓝39-44/big(11).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1627','258','big(2).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋煤黑蓝39-44/big(2).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1628','258','big(3).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋煤黑蓝39-44/big(3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1629','258','big(4).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋煤黑蓝39-44/big(4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1630','258','big(5).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋煤黑蓝39-44/big(5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1631','258','big(6).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋煤黑蓝39-44/big(6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1632','258','big(7).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋煤黑蓝39-44/big(7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1633','258','big(8).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋煤黑蓝39-44/big(8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1634','258','big(9).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋煤黑蓝39-44/big(9).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1635','258','big.jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋煤黑蓝39-44/big.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1636','259','big(2).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋米灰蓝39-44/big(2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1637','259','big(3).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋米灰蓝39-44/big(3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1638','259','big(4).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋米灰蓝39-44/big(4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1639','259','big(5).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋米灰蓝39-44/big(5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1640','259','big(6).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋米灰蓝39-44/big(6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1641','259','big(7).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋米灰蓝39-44/big(7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1642','259','big(8).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋米灰蓝39-44/big(8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1643','259','big.jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋米灰蓝39-44/big.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1644','260','big(10).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋日出红39-44/big(10).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1645','260','big(11).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋日出红39-44/big(11).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1646','260','big(2).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋日出红39-44/big(2).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1647','260','big(3).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋日出红39-44/big(3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1648','260','big(4).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋日出红39-44/big(4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1649','260','big(5).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋日出红39-44/big(5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1650','260','big(6).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋日出红39-44/big(6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1651','260','big(7).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋日出红39-44/big(7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1652','260','big(8).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋日出红39-44/big(8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1653','260','big(9).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋日出红39-44/big(9).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1654','260','big.jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋日出红39-44/big.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1655','261','big(12).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋深灰桔红39-44/big(12).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1656','261','big(14).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋深灰桔红39-44/big(14).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1657','261','big(15).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋深灰桔红39-44/big(15).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1658','261','big(16).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋深灰桔红39-44/big(16).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1659','261','big(17).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋深灰桔红39-44/big(17).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1660','261','big(18).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋深灰桔红39-44/big(18).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1661','261','big(19).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋深灰桔红39-44/big(19).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1662','261','big(20).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋深灰桔红39-44/big(20).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1663','261','big(21).jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋深灰桔红39-44/big(21).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1664','261','big.jpg','','','/product/nike_maopi_shoe/耐克nike反毛皮板鞋深灰桔红39-44/big.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1665','262','big(2).jpg','','','/product/nike_maopi_shoe/耐克nike皮面板鞋煤黑39-44/big(2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1666','262','big(3).jpg','','','/product/nike_maopi_shoe/耐克nike皮面板鞋煤黑39-44/big(3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1667','262','big(4).jpg','','','/product/nike_maopi_shoe/耐克nike皮面板鞋煤黑39-44/big(4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1668','262','big(5).jpg','','','/product/nike_maopi_shoe/耐克nike皮面板鞋煤黑39-44/big(5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1669','262','big(6).jpg','','','/product/nike_maopi_shoe/耐克nike皮面板鞋煤黑39-44/big(6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1670','262','big(7).jpg','','','/product/nike_maopi_shoe/耐克nike皮面板鞋煤黑39-44/big(7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1671','262','big(8).jpg','','','/product/nike_maopi_shoe/耐克nike皮面板鞋煤黑39-44/big(8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1672','262','big(9).jpg','','','/product/nike_maopi_shoe/耐克nike皮面板鞋煤黑39-44/big(9).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1673','262','big.jpg','','','/product/nike_maopi_shoe/耐克nike皮面板鞋煤黑39-44/big.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1674','264','big(2).jpg','','','/product/nike_max90/nike耐克max90滴塑不断货宝蓝月40-45/big(2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1675','264','big(3).jpg','','','/product/nike_max90/nike耐克max90滴塑不断货宝蓝月40-45/big(3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1676','264','big(4).jpg','','','/product/nike_max90/nike耐克max90滴塑不断货宝蓝月40-45/big(4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1677','264','big(6).jpg','','','/product/nike_max90/nike耐克max90滴塑不断货宝蓝月40-45/big(6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1678','264','big(7).jpg','','','/product/nike_max90/nike耐克max90滴塑不断货宝蓝月40-45/big(7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1679','264','宝蓝月40-45 (1).jpg','','','/product/nike_max90/nike耐克max90滴塑不断货宝蓝月40-45/宝蓝月40-45 (1).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1680','264','宝蓝月40-45.jpg','','','/product/nike_max90/nike耐克max90滴塑不断货宝蓝月40-45/宝蓝月40-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1681','265','big(1).jpg','','','/product/nike_max90/nike耐克max90滴塑不断货黑白40-45/big(1).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1682','265','big(2).jpg','','','/product/nike_max90/nike耐克max90滴塑不断货黑白40-45/big(2).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1683','265','big(4).jpg','','','/product/nike_max90/nike耐克max90滴塑不断货黑白40-45/big(4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1684','265','big(5).jpg','','','/product/nike_max90/nike耐克max90滴塑不断货黑白40-45/big(5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1685','265','big.jpg','','','/product/nike_max90/nike耐克max90滴塑不断货黑白40-45/big.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1686','265','黑白40-45 (1).jpg','','','/product/nike_max90/nike耐克max90滴塑不断货黑白40-45/黑白40-45 (1).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1687','265','黑白40-45.jpg','','','/product/nike_max90/nike耐克max90滴塑不断货黑白40-45/黑白40-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1688','266','big(2).jpg','','','/product/nike_max90/nike耐克max90滴塑不断货黑宝蓝40-45/big(2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1689','266','big(3).jpg','','','/product/nike_max90/nike耐克max90滴塑不断货黑宝蓝40-45/big(3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1690','266','big(4).jpg','','','/product/nike_max90/nike耐克max90滴塑不断货黑宝蓝40-45/big(4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1691','266','big(6).jpg','','','/product/nike_max90/nike耐克max90滴塑不断货黑宝蓝40-45/big(6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1692','266','big(7).jpg','','','/product/nike_max90/nike耐克max90滴塑不断货黑宝蓝40-45/big(7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1693','266','黑宝蓝40-45 (1).jpg','','','/product/nike_max90/nike耐克max90滴塑不断货黑宝蓝40-45/黑宝蓝40-45 (1).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1694','266','黑宝蓝40-45.jpg','','','/product/nike_max90/nike耐克max90滴塑不断货黑宝蓝40-45/黑宝蓝40-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1695','267','big(3).jpg','','','/product/nike_max90/nike耐克max90滴塑不断货黑梅红36-40/big(3).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1696','267','big(4).jpg','','','/product/nike_max90/nike耐克max90滴塑不断货黑梅红36-40/big(4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1697','267','big(5).jpg','','','/product/nike_max90/nike耐克max90滴塑不断货黑梅红36-40/big(5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1698','267','big(7).jpg','','','/product/nike_max90/nike耐克max90滴塑不断货黑梅红36-40/big(7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1699','267','big.jpg','','','/product/nike_max90/nike耐克max90滴塑不断货黑梅红36-40/big.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1700','267','黑梅红36-40 (1).jpg','','','/product/nike_max90/nike耐克max90滴塑不断货黑梅红36-40/黑梅红36-40 (1).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1701','267','黑梅红36-40.jpg','','','/product/nike_max90/nike耐克max90滴塑不断货黑梅红36-40/黑梅红36-40.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1702','268','big(2).jpg','','','/product/nike_max90/nike耐克max90滴塑不断货梅红荧光绿36-40/big(2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1703','268','big(3).jpg','','','/product/nike_max90/nike耐克max90滴塑不断货梅红荧光绿36-40/big(3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1704','268','big(4).jpg','','','/product/nike_max90/nike耐克max90滴塑不断货梅红荧光绿36-40/big(4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1705','268','big(6).jpg','','','/product/nike_max90/nike耐克max90滴塑不断货梅红荧光绿36-40/big(6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1706','268','big(7).jpg','','','/product/nike_max90/nike耐克max90滴塑不断货梅红荧光绿36-40/big(7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1707','268','梅红荧光绿36-40 (1).jpg','','','/product/nike_max90/nike耐克max90滴塑不断货梅红荧光绿36-40/梅红荧光绿36-40 (1).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1708','268','梅红荧光绿36-40.jpg','','','/product/nike_max90/nike耐克max90滴塑不断货梅红荧光绿36-40/梅红荧光绿36-40.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1709','269','big(1).jpg','','','/product/nike_max90/nike耐克max90滴塑不断货深灰黄40-45/big(1).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1710','269','big(2).jpg','','','/product/nike_max90/nike耐克max90滴塑不断货深灰黄40-45/big(2).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1711','269','big(4).jpg','','','/product/nike_max90/nike耐克max90滴塑不断货深灰黄40-45/big(4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1712','269','big(5).jpg','','','/product/nike_max90/nike耐克max90滴塑不断货深灰黄40-45/big(5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1713','269','big.jpg','','','/product/nike_max90/nike耐克max90滴塑不断货深灰黄40-45/big.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1714','269','深灰黄40-45 (1).jpg','','','/product/nike_max90/nike耐克max90滴塑不断货深灰黄40-45/深灰黄40-45 (1).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1715','269','深灰黄40-45.jpg','','','/product/nike_max90/nike耐克max90滴塑不断货深灰黄40-45/深灰黄40-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1716','270','3.jpg','','','/product/nike_max90/nike耐克max90滴塑不断货深蓝吉红40-45/3.jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1717','270','4.jpg','','','/product/nike_max90/nike耐克max90滴塑不断货深蓝吉红40-45/4.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1718','270','5.jpg','','','/product/nike_max90/nike耐克max90滴塑不断货深蓝吉红40-45/5.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1719','270','7.jpg','','','/product/nike_max90/nike耐克max90滴塑不断货深蓝吉红40-45/7.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1720','270','8.jpg','','','/product/nike_max90/nike耐克max90滴塑不断货深蓝吉红40-45/8.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1721','270','深蓝吉红40-45 (1).jpg','','','/product/nike_max90/nike耐克max90滴塑不断货深蓝吉红40-45/深蓝吉红40-45 (1).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1722','270','深蓝吉红40-45.jpg','','','/product/nike_max90/nike耐克max90滴塑不断货深蓝吉红40-45/深蓝吉红40-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1723','271','2.jpg','','','/product/nike_max90/nike耐克max90滴塑不断货五环色40-45/2.jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1724','271','3.jpg','','','/product/nike_max90/nike耐克max90滴塑不断货五环色40-45/3.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1725','271','4.jpg','','','/product/nike_max90/nike耐克max90滴塑不断货五环色40-45/4.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1726','271','7.jpg','','','/product/nike_max90/nike耐克max90滴塑不断货五环色40-45/7.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1727','271','8.jpg','','','/product/nike_max90/nike耐克max90滴塑不断货五环色40-45/8.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1728','271','五环色40-45 (1).jpg','','','/product/nike_max90/nike耐克max90滴塑不断货五环色40-45/五环色40-45 (1).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1729','271','五环色40-45.jpg','','','/product/nike_max90/nike耐克max90滴塑不断货五环色40-45/五环色40-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1730','272','big(2).jpg','','','/product/nike_max90/nike耐克max90滴塑不断货月桃红36-40/big(2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1731','272','big(3).jpg','','','/product/nike_max90/nike耐克max90滴塑不断货月桃红36-40/big(3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1732','272','big(4).jpg','','','/product/nike_max90/nike耐克max90滴塑不断货月桃红36-40/big(4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1733','272','big(6).jpg','','','/product/nike_max90/nike耐克max90滴塑不断货月桃红36-40/big(6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1734','272','big(7).jpg','','','/product/nike_max90/nike耐克max90滴塑不断货月桃红36-40/big(7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1735','272','月桃红36-40 (1).jpg','','','/product/nike_max90/nike耐克max90滴塑不断货月桃红36-40/月桃红36-40 (1).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1736','272','月桃红36-40.jpg','','','/product/nike_max90/nike耐克max90滴塑不断货月桃红36-40/月桃红36-40.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1737','273','big(2).jpg','','','/product/nike_max90/nike耐克max90滴塑不断货紫月36-40/big(2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1738','273','big(3).jpg','','','/product/nike_max90/nike耐克max90滴塑不断货紫月36-40/big(3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1739','273','big(4).jpg','','','/product/nike_max90/nike耐克max90滴塑不断货紫月36-40/big(4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1740','273','big(6).jpg','','','/product/nike_max90/nike耐克max90滴塑不断货紫月36-40/big(6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1741','273','big(7).jpg','','','/product/nike_max90/nike耐克max90滴塑不断货紫月36-40/big(7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1742','273','紫月36-40 (1).jpg','','','/product/nike_max90/nike耐克max90滴塑不断货紫月36-40/紫月36-40 (1).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1743','273','紫月36-40.jpg','','','/product/nike_max90/nike耐克max90滴塑不断货紫月36-40/紫月36-40.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1744','275','黑荧光绿40-45.jpg','','','/product/nike_max90/多配色/nike耐克max90多种款式1/黑荧光绿40-45.jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1745','275','深蓝灰40-45.jpg','','','/product/nike_max90/多配色/nike耐克max90多种款式1/深蓝灰40-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1746','275','深蓝灰蓝40-45.jpg','','','/product/nike_max90/多配色/nike耐克max90多种款式1/深蓝灰蓝40-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1747','275','深蓝桃红36-45.jpg','','','/product/nike_max90/多配色/nike耐克max90多种款式1/深蓝桃红36-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1748','276','黑荧光绿36-45.jpg','','','/product/nike_max90/多配色/nike耐克max90多种款式2/黑荧光绿36-45.jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1749','276','深蓝桃红36-45 (1).jpg','','','/product/nike_max90/多配色/nike耐克max90多种款式2/深蓝桃红36-45 (1).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1750','276','炭灰紫月36-40.jpg','','','/product/nike_max90/多配色/nike耐克max90多种款式2/炭灰紫月36-40.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1751','277','白灰粉红36-40.jpg','','','/product/nike_max90/多配色/nike耐克max90多种款式3/白灰粉红36-40.jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1752','277','白灰橘红36-45.jpg','','','/product/nike_max90/多配色/nike耐克max90多种款式3/白灰橘红36-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1753','277','白银紫36-40.jpg','','','/product/nike_max90/多配色/nike耐克max90多种款式3/白银紫36-40.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1754','277','黑迷彩红36-45.jpg','','','/product/nike_max90/多配色/nike耐克max90多种款式3/黑迷彩红36-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1755','278','蓝白红40-45.jpg','','','/product/nike_max90/多配色/nike耐克max90多种款式4/蓝白红40-45.jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1756','278','青灰40-45.jpg','','','/product/nike_max90/多配色/nike耐克max90多种款式4/青灰40-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1757','278','全白二层皮36-45.jpg','','','/product/nike_max90/多配色/nike耐克max90多种款式4/全白二层皮36-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1758','278','深蓝粉红蓝36-40.jpg','','','/product/nike_max90/多配色/nike耐克max90多种款式4/深蓝粉红蓝36-40.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1759','279','灰蓝40-45.jpg','','','/product/nike_max90/多配色/nike耐克max90多种款式5/灰蓝40-45.jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1760','279','灰荧光绿40-45.jpg','','','/product/nike_max90/多配色/nike耐克max90多种款式5/灰荧光绿40-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1761','279','深蓝红40-45.jpg','','','/product/nike_max90/多配色/nike耐克max90多种款式5/深蓝红40-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1762','279','银色星空40-45.jpg','','','/product/nike_max90/多配色/nike耐克max90多种款式5/银色星空40-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1763','280','黑白40-45.jpg','','','/product/nike_max90/多配色/nike耐克max90多种款式6/黑白40-45.jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1764','280','黑灰青绿紫36-40.jpg','','','/product/nike_max90/多配色/nike耐克max90多种款式6/黑灰青绿紫36-40.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1765','280','灰黑宝蓝白40-45.jpg','','','/product/nike_max90/多配色/nike耐克max90多种款式6/灰黑宝蓝白40-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1766','280','桃红36-40.jpg','','','/product/nike_max90/多配色/nike耐克max90多种款式6/桃红36-40.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1767','282','白粉色36-39 (2).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 白粉色36-39/白粉色36-39 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1768','282','白粉色36-39 (3).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 白粉色36-39/白粉色36-39 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1769','282','白粉色36-39 (4).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 白粉色36-39/白粉色36-39 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1770','282','白粉色36-39 (5).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 白粉色36-39/白粉色36-39 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1771','282','白粉色36-39 (6).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 白粉色36-39/白粉色36-39 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1772','282','白粉色36-39 (7).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 白粉色36-39/白粉色36-39 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1773','282','白粉色36-39 (8).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 白粉色36-39/白粉色36-39 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1774','282','白粉色36-39.jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 白粉色36-39/白粉色36-39.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1775','283','白紫,宝蓝36-39 (2).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 白紫,宝蓝36-39/白紫,宝蓝36-39 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1776','283','白紫,宝蓝36-39 (3).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 白紫,宝蓝36-39/白紫,宝蓝36-39 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1777','283','白紫,宝蓝36-39 (4).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 白紫,宝蓝36-39/白紫,宝蓝36-39 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1778','283','白紫,宝蓝36-39 (5).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 白紫,宝蓝36-39/白紫,宝蓝36-39 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1779','283','白紫,宝蓝36-39.jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 白紫,宝蓝36-39/白紫,宝蓝36-39.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1780','284','宝蓝,电黄,苹果绿40-45 (2).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 宝蓝,电黄,苹果绿40-45/宝蓝,电黄,苹果绿40-45 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1781','284','宝蓝,电黄,苹果绿40-45 (3).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 宝蓝,电黄,苹果绿40-45/宝蓝,电黄,苹果绿40-45 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1782','284','宝蓝,电黄,苹果绿40-45 (4).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 宝蓝,电黄,苹果绿40-45/宝蓝,电黄,苹果绿40-45 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1783','284','宝蓝,电黄,苹果绿40-45 (5).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 宝蓝,电黄,苹果绿40-45/宝蓝,电黄,苹果绿40-45 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1784','284','宝蓝,电黄,苹果绿40-45 (6).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 宝蓝,电黄,苹果绿40-45/宝蓝,电黄,苹果绿40-45 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1785','284','宝蓝,电黄,苹果绿40-45 (7).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 宝蓝,电黄,苹果绿40-45/宝蓝,电黄,苹果绿40-45 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1786','284','宝蓝,电黄,苹果绿40-45.jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 宝蓝,电黄,苹果绿40-45/宝蓝,电黄,苹果绿40-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1787','285','电黄,黑36-45 (2).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 电黄,黑36-45/电黄,黑36-45 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1788','285','电黄,黑36-45 (3).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 电黄,黑36-45/电黄,黑36-45 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1789','285','电黄,黑36-45 (4).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 电黄,黑36-45/电黄,黑36-45 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1790','285','电黄,黑36-45 (5).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 电黄,黑36-45/电黄,黑36-45 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1791','285','电黄,黑36-45 (6).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 电黄,黑36-45/电黄,黑36-45 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1792','285','电黄,黑36-45 (7).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 电黄,黑36-45/电黄,黑36-45 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1793','285','电黄,黑36-45 (8).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 电黄,黑36-45/电黄,黑36-45 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1794','285','电黄,黑36-45.jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 电黄,黑36-45/电黄,黑36-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1795','286','黑,荧光绿40-45 (2).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑,荧光绿40-45/黑,荧光绿40-45 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1796','286','黑,荧光绿40-45 (3).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑,荧光绿40-45/黑,荧光绿40-45 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1797','286','黑,荧光绿40-45 (4).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑,荧光绿40-45/黑,荧光绿40-45 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1798','286','黑,荧光绿40-45 (5).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑,荧光绿40-45/黑,荧光绿40-45 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1799','286','黑,荧光绿40-45 (6).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑,荧光绿40-45/黑,荧光绿40-45 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1800','286','黑,荧光绿40-45 (7).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑,荧光绿40-45/黑,荧光绿40-45 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1801','286','黑,荧光绿40-45 (8).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑,荧光绿40-45/黑,荧光绿40-45 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1802','286','黑,荧光绿40-45.jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑,荧光绿40-45/黑,荧光绿40-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1803','287','黑,月40-45 (2).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑,月40-45/黑,月40-45 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1804','287','黑,月40-45 (3).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑,月40-45/黑,月40-45 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1805','287','黑,月40-45 (4).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑,月40-45/黑,月40-45 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1806','287','黑,月40-45 (5).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑,月40-45/黑,月40-45 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1807','287','黑,月40-45 (6).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑,月40-45/黑,月40-45 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1808','287','黑,月40-45 (7).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑,月40-45/黑,月40-45 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1809','287','黑,月40-45 (8).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑,月40-45/黑,月40-45 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1810','287','黑,月40-45.jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑,月40-45/黑,月40-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1811','288','黑灰,36-39 (2).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑灰,36-39/黑灰,36-39 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1812','288','黑灰,36-39 (3).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑灰,36-39/黑灰,36-39 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1813','288','黑灰,36-39 (4).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑灰,36-39/黑灰,36-39 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1814','288','黑灰,36-39 (5).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑灰,36-39/黑灰,36-39 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1815','288','黑灰,36-39 (6).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑灰,36-39/黑灰,36-39 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1816','288','黑灰,36-39 (7).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑灰,36-39/黑灰,36-39 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1817','288','黑灰,36-39 (8).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑灰,36-39/黑灰,36-39 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1818','288','黑灰,36-39.jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑灰,36-39/黑灰,36-39.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1819','289','黑水蓝绿36-39 (2).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑水蓝绿36-39/黑水蓝绿36-39 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1820','289','黑水蓝绿36-39 (3).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑水蓝绿36-39/黑水蓝绿36-39 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1821','289','黑水蓝绿36-39 (4).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑水蓝绿36-39/黑水蓝绿36-39 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1822','289','黑水蓝绿36-39 (5).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑水蓝绿36-39/黑水蓝绿36-39 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1823','289','黑水蓝绿36-39 (6).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑水蓝绿36-39/黑水蓝绿36-39 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1824','289','黑水蓝绿36-39 (7).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑水蓝绿36-39/黑水蓝绿36-39 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1825','289','黑水蓝绿36-39 (8).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑水蓝绿36-39/黑水蓝绿36-39 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1826','289','黑水蓝绿36-39.jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑水蓝绿36-39/黑水蓝绿36-39.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1827','290','黑桃红36-39 (2).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑桃红36-39/黑桃红36-39 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1828','290','黑桃红36-39 (3).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑桃红36-39/黑桃红36-39 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1829','290','黑桃红36-39 (4).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑桃红36-39/黑桃红36-39 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1830','290','黑桃红36-39 (5).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑桃红36-39/黑桃红36-39 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1831','290','黑桃红36-39 (6).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑桃红36-39/黑桃红36-39 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1832','290','黑桃红36-39 (7).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑桃红36-39/黑桃红36-39 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1833','290','黑桃红36-39 (8).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑桃红36-39/黑桃红36-39 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1834','290','黑桃红36-39.jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑桃红36-39/黑桃红36-39.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1835','291','黑橘黄36-39 (2).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑橘黄36-39/黑橘黄36-39 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1836','291','黑橘黄36-39 (3).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑橘黄36-39/黑橘黄36-39 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1837','291','黑橘黄36-39 (4).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑橘黄36-39/黑橘黄36-39 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1838','291','黑橘黄36-39 (5).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑橘黄36-39/黑橘黄36-39 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1839','291','黑橘黄36-39 (6).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑橘黄36-39/黑橘黄36-39 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1840','291','黑橘黄36-39 (7).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑橘黄36-39/黑橘黄36-39 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1841','291','黑橘黄36-39 (8).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑橘黄36-39/黑橘黄36-39 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1842','291','黑橘黄36-39.jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 黑橘黄36-39/黑橘黄36-39.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1843','292','孔雀蓝,黑40-45 (2).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 孔雀蓝,黑40-45/孔雀蓝,黑40-45 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1844','292','孔雀蓝,黑40-45 (3).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 孔雀蓝,黑40-45/孔雀蓝,黑40-45 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1845','292','孔雀蓝,黑40-45 (4).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 孔雀蓝,黑40-45/孔雀蓝,黑40-45 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1846','292','孔雀蓝,黑40-45 (5).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 孔雀蓝,黑40-45/孔雀蓝,黑40-45 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1847','292','孔雀蓝,黑40-45 (6).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 孔雀蓝,黑40-45/孔雀蓝,黑40-45 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1848','292','孔雀蓝,黑40-45 (7).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 孔雀蓝,黑40-45/孔雀蓝,黑40-45 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1849','292','孔雀蓝,黑40-45 (8).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 孔雀蓝,黑40-45/孔雀蓝,黑40-45 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1850','292','孔雀蓝,黑40-45.jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 孔雀蓝,黑40-45/孔雀蓝,黑40-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1851','293','浅蓝,桔红40-45 (2).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 浅蓝,桔红40-45/浅蓝,桔红40-45 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1852','293','浅蓝,桔红40-45 (3).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 浅蓝,桔红40-45/浅蓝,桔红40-45 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1853','293','浅蓝,桔红40-45 (4).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 浅蓝,桔红40-45/浅蓝,桔红40-45 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1854','293','浅蓝,桔红40-45 (5).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 浅蓝,桔红40-45/浅蓝,桔红40-45 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1855','293','浅蓝,桔红40-45 (6).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 浅蓝,桔红40-45/浅蓝,桔红40-45 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1856','293','浅蓝,桔红40-45 (7).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 浅蓝,桔红40-45/浅蓝,桔红40-45 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1857','293','浅蓝,桔红40-45 (8).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 浅蓝,桔红40-45/浅蓝,桔红40-45 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1858','293','浅蓝,桔红40-45.jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 浅蓝,桔红40-45/浅蓝,桔红40-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1859','294','深灰,桔红,红40-45 (2).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 深灰,桔红,红40-45/深灰,桔红,红40-45 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1860','294','深灰,桔红,红40-45 (3).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 深灰,桔红,红40-45/深灰,桔红,红40-45 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1861','294','深灰,桔红,红40-45 (4).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 深灰,桔红,红40-45/深灰,桔红,红40-45 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1862','294','深灰,桔红,红40-45 (5).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 深灰,桔红,红40-45/深灰,桔红,红40-45 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1863','294','深灰,桔红,红40-45 (6).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 深灰,桔红,红40-45/深灰,桔红,红40-45 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1864','294','深灰,桔红,红40-45 (7).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 深灰,桔红,红40-45/深灰,桔红,红40-45 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1865','294','深灰,桔红,红40-45 (8).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 深灰,桔红,红40-45/深灰,桔红,红40-45 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1866','294','深灰,桔红,红40-45.jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 深灰,桔红,红40-45/深灰,桔红,红40-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1867','295','深灰,桃红36-39 (2).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 深灰,桃红36-39/深灰,桃红36-39 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1868','295','深灰,桃红36-39 (3).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 深灰,桃红36-39/深灰,桃红36-39 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1869','295','深灰,桃红36-39 (4).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 深灰,桃红36-39/深灰,桃红36-39 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1870','295','深灰,桃红36-39 (5).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 深灰,桃红36-39/深灰,桃红36-39 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1871','295','深灰,桃红36-39 (6).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 深灰,桃红36-39/深灰,桃红36-39 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1872','295','深灰,桃红36-39 (7).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 深灰,桃红36-39/深灰,桃红36-39 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1873','295','深灰,桃红36-39 (8).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 深灰,桃红36-39/深灰,桃红36-39 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1874','295','深灰,桃红36-39.jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 深灰,桃红36-39/深灰,桃红36-39.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1875','296','深蓝,红40-45 (2).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 深蓝,红40-45/深蓝,红40-45 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1876','296','深蓝,红40-45 (3).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 深蓝,红40-45/深蓝,红40-45 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1877','296','深蓝,红40-45 (4).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 深蓝,红40-45/深蓝,红40-45 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1878','296','深蓝,红40-45 (5).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 深蓝,红40-45/深蓝,红40-45 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1879','296','深蓝,红40-45 (6).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 深蓝,红40-45/深蓝,红40-45 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1880','296','深蓝,红40-45 (7).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 深蓝,红40-45/深蓝,红40-45 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1881','296','深蓝,红40-45 (8).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 深蓝,红40-45/深蓝,红40-45 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1882','296','深蓝,红40-45.jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 深蓝,红40-45/深蓝,红40-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1883','297','深蓝,月40-45 (2).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 深蓝,月40-45/深蓝,月40-45 (2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1884','297','深蓝,月40-45 (3).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 深蓝,月40-45/深蓝,月40-45 (3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1885','297','深蓝,月40-45 (4).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 深蓝,月40-45/深蓝,月40-45 (4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1886','297','深蓝,月40-45 (5).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 深蓝,月40-45/深蓝,月40-45 (5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1887','297','深蓝,月40-45 (6).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 深蓝,月40-45/深蓝,月40-45 (6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1888','297','深蓝,月40-45 (7).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 深蓝,月40-45/深蓝,月40-45 (7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1889','297','深蓝,月40-45 (8).jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 深蓝,月40-45/深蓝,月40-45 (8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1890','297','深蓝,月40-45.jpg','','','/product/nike_run_Shoe/nike耐克气垫跑步鞋 深蓝,月40-45/深蓝,月40-45.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1891','299','big(2).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋宝蓝白36-45不断货/big(2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1892','299','big(3).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋宝蓝白36-45不断货/big(3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1893','299','big(4).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋宝蓝白36-45不断货/big(4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1894','299','big(6).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋宝蓝白36-45不断货/big(6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1895','299','big.jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋宝蓝白36-45不断货/big.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1896','299','宝蓝白36-45不断货 (1).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋宝蓝白36-45不断货/宝蓝白36-45不断货 (1).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1897','299','宝蓝白36-45不断货.jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋宝蓝白36-45不断货/宝蓝白36-45不断货.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1898','300','big(2).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋黑白40-45不断货/big(2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1899','300','big(3).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋黑白40-45不断货/big(3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1900','300','big(4).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋黑白40-45不断货/big(4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1901','300','big(6).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋黑白40-45不断货/big(6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1902','300','big(7).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋黑白40-45不断货/big(7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1903','300','黑白40-45不断货 (1).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋黑白40-45不断货/黑白40-45不断货 (1).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1904','300','黑白40-45不断货.jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋黑白40-45不断货/黑白40-45不断货.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1905','301','big(2).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋黑兰40-45不断货/big(2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1906','301','big(3).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋黑兰40-45不断货/big(3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1907','301','big(4).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋黑兰40-45不断货/big(4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1908','301','big(6).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋黑兰40-45不断货/big(6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1909','301','big(7).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋黑兰40-45不断货/big(7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1910','301','黑兰40-45不断货 (1).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋黑兰40-45不断货/黑兰40-45不断货 (1).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1911','301','黑兰40-45不断货.jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋黑兰40-45不断货/黑兰40-45不断货.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1912','302','big(2).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋灰白40-45不断货/big(2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1913','302','big(3).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋灰白40-45不断货/big(3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1914','302','big(4).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋灰白40-45不断货/big(4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1915','302','big(7).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋灰白40-45不断货/big(7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1916','302','big.jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋灰白40-45不断货/big.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1917','302','灰白40-45不断货 (1).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋灰白40-45不断货/灰白40-45不断货 (1).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1918','302','灰白40-45不断货.jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋灰白40-45不断货/灰白40-45不断货.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1919','303','big(2).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋蓝黑36-45不断货/big(2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1920','303','big(3).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋蓝黑36-45不断货/big(3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1921','303','big(5).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋蓝黑36-45不断货/big(5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1922','303','big(6).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋蓝黑36-45不断货/big(6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1923','303','big(7).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋蓝黑36-45不断货/big(7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1924','303','蓝黑36-45不断货 (1).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋蓝黑36-45不断货/蓝黑36-45不断货 (1).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1925','303','蓝黑36-45不断货.jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋蓝黑36-45不断货/蓝黑36-45不断货.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1926','304','big(2).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋迷彩军绿40-45不断货/big(2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1927','304','big(3).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋迷彩军绿40-45不断货/big(3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1928','304','big(4).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋迷彩军绿40-45不断货/big(4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1929','304','big(6).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋迷彩军绿40-45不断货/big(6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1930','304','big.jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋迷彩军绿40-45不断货/big.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1931','304','迷彩军绿40-45不断货 (1).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋迷彩军绿40-45不断货/迷彩军绿40-45不断货 (1).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1932','304','迷彩军绿40-45不断货.jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋迷彩军绿40-45不断货/迷彩军绿40-45不断货.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1933','305','big(3).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋迷彩绿咖啡40-45不断货/big(3).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1934','305','big(4).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋迷彩绿咖啡40-45不断货/big(4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1935','305','big(5).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋迷彩绿咖啡40-45不断货/big(5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1936','305','big(6).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋迷彩绿咖啡40-45不断货/big(6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1937','305','big(7).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋迷彩绿咖啡40-45不断货/big(7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1938','305','迷彩绿咖啡40-45不断货 (1).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋迷彩绿咖啡40-45不断货/迷彩绿咖啡40-45不断货 (1).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1939','305','迷彩绿咖啡40-45不断货.jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋迷彩绿咖啡40-45不断货/迷彩绿咖啡40-45不断货.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1940','306','big(2).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋迷彩墨绿卡其黑40-45不断货/big(2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1941','306','big(3).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋迷彩墨绿卡其黑40-45不断货/big(3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1942','306','big(4).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋迷彩墨绿卡其黑40-45不断货/big(4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1943','306','big(6).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋迷彩墨绿卡其黑40-45不断货/big(6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1944','306','big(7).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋迷彩墨绿卡其黑40-45不断货/big(7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1945','306','迷彩墨绿卡其黑40-45不断货 (1).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋迷彩墨绿卡其黑40-45不断货/迷彩墨绿卡其黑40-45不断货 (1).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1946','306','迷彩墨绿卡其黑40-45不断货.jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋迷彩墨绿卡其黑40-45不断货/迷彩墨绿卡其黑40-45不断货.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1947','307','big(2).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋深兰吉红40-45不断货/big(2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1948','307','big(3).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋深兰吉红40-45不断货/big(3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1949','307','big(5).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋深兰吉红40-45不断货/big(5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1950','307','big(7).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋深兰吉红40-45不断货/big(7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1951','307','big(8).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋深兰吉红40-45不断货/big(8).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1952','307','big.jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋深兰吉红40-45不断货/big.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1953','307','深兰吉红40-45不断货 (1).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋深兰吉红40-45不断货/深兰吉红40-45不断货 (1).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1954','307','深兰吉红40-45不断货.jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋深兰吉红40-45不断货/深兰吉红40-45不断货.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1955','308','big(3).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋桃红黄36-40不断货/big(3).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1956','308','big(4).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋桃红黄36-40不断货/big(4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1957','308','big(6).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋桃红黄36-40不断货/big(6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1958','308','big(7).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋桃红黄36-40不断货/big(7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1959','308','big.jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋桃红黄36-40不断货/big.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1960','308','桃红黄36-40不断货 (1).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋桃红黄36-40不断货/桃红黄36-40不断货 (1).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1961','308','桃红黄36-40不断货.jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋桃红黄36-40不断货/桃红黄36-40不断货.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1962','309','big(2).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋紫玉36-40不断货/big(2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1963','309','big(3).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋紫玉36-40不断货/big(3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1964','309','big(6).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋紫玉36-40不断货/big(6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1965','309','big(7).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋紫玉36-40不断货/big(7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1966','309','big4.jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋紫玉36-40不断货/big4.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1967','309','紫玉36-40不断货 (1).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋紫玉36-40不断货/紫玉36-40不断货 (1).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1968','309','紫玉36-40不断货.jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋紫玉36-40不断货/紫玉36-40不断货.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1969','310','big(3).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋炫彩宝兰40-45不断货/big(3).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1970','310','big(4).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋炫彩宝兰40-45不断货/big(4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1971','310','big(6).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋炫彩宝兰40-45不断货/big(6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1972','310','big(7).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋炫彩宝兰40-45不断货/big(7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1973','310','big.jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋炫彩宝兰40-45不断货/big.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1974','310','炫彩宝兰40-45不断货 (1).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋炫彩宝兰40-45不断货/炫彩宝兰40-45不断货 (1).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1975','310','炫彩宝兰40-45不断货.jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋炫彩宝兰40-45不断货/炫彩宝兰40-45不断货.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1976','311','big(3).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋炫彩桔红40-45不断货/big(3).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1977','311','big(4).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋炫彩桔红40-45不断货/big(4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1978','311','big(5).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋炫彩桔红40-45不断货/big(5).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1979','311','big(6).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋炫彩桔红40-45不断货/big(6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1980','311','big.jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋炫彩桔红40-45不断货/big.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1981','311','炫彩桔红40-45不断货 (1).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋炫彩桔红40-45不断货/炫彩桔红40-45不断货 (1).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1982','311','炫彩桔红40-45不断货.jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋炫彩桔红40-45不断货/炫彩桔红40-45不断货.jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1983','312','big(2).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋炫彩深兰大红40-45不断货/big(2).jpg','0','1');
INSERT INTO `v9_product_pic` VALUES('1984','312','big(3).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋炫彩深兰大红40-45不断货/big(3).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1985','312','big(4).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋炫彩深兰大红40-45不断货/big(4).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1986','312','big(6).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋炫彩深兰大红40-45不断货/big(6).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1987','312','big(7).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋炫彩深兰大红40-45不断货/big(7).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1988','312','炫彩深兰大红40-45不断货 (1).jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋炫彩深兰大红40-45不断货/炫彩深兰大红40-45不断货 (1).jpg','0','0');
INSERT INTO `v9_product_pic` VALUES('1989','312','炫彩深兰大红40-45不断货.jpg','','','/product/nike_run_Shoe/滴塑气垫/nike耐克滴塑气垫跑步鞋炫彩深兰大红40-45不断货/炫彩深兰大红40-45不断货.jpg','0','0');

DROP TABLE IF EXISTS `v9_queue`;
CREATE TABLE `v9_queue` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` char(5) DEFAULT NULL,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `path` varchar(100) DEFAULT NULL,
  `status1` tinyint(1) DEFAULT '0',
  `status2` tinyint(1) DEFAULT '0',
  `status3` tinyint(1) DEFAULT '0',
  `status4` tinyint(1) DEFAULT '0',
  `times` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `times` (`times`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_release_point`;
CREATE TABLE `v9_release_point` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `host` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `port` varchar(10) DEFAULT '21',
  `pasv` tinyint(1) DEFAULT '0',
  `ssl` tinyint(1) DEFAULT '0',
  `path` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_search`;
CREATE TABLE `v9_search` (
  `searchid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `adddate` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`searchid`),
  KEY `typeid` (`typeid`,`id`),
  KEY `siteid` (`siteid`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `v9_search` VALUES('2','1','1','1441338820','违法 地方 水电 地方 违法','1');

DROP TABLE IF EXISTS `v9_search_keyword`;
CREATE TABLE `v9_search_keyword` (
  `keyword` char(20) NOT NULL,
  `pinyin` char(20) NOT NULL,
  `searchnums` int(10) unsigned NOT NULL,
  `data` char(20) NOT NULL,
  UNIQUE KEY `keyword` (`keyword`),
  UNIQUE KEY `pinyin` (`pinyin`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_session`;
CREATE TABLE `v9_session` (
  `sessionid` char(32) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL,
  `lastvisit` int(10) unsigned NOT NULL DEFAULT '0',
  `roleid` tinyint(3) unsigned DEFAULT '0',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(255) NOT NULL,
  PRIMARY KEY (`sessionid`),
  KEY `lastvisit` (`lastvisit`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

INSERT INTO `v9_session` VALUES('bpipon022eultosijgr3b1l6m1','1','127.0.0.1','1441340634','1','0','zl_admin','database','export','code|s:4:\"evle\";userid|s:1:\"1\";roleid|s:1:\"1\";pc_hash|s:6:\"yrvyhm\";lock_screen|i:0;');

DROP TABLE IF EXISTS `v9_site`;
CREATE TABLE `v9_site` (
  `siteid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(30) DEFAULT '',
  `dirname` char(255) DEFAULT '',
  `domain` char(255) DEFAULT '',
  `site_title` char(255) DEFAULT '',
  `keywords` char(255) DEFAULT '',
  `description` char(255) DEFAULT '',
  `release_point` text,
  `default_style` char(50) DEFAULT NULL,
  `template` text,
  `setting` mediumtext,
  `uuid` char(40) DEFAULT '',
  PRIMARY KEY (`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `v9_site` VALUES('1','默认站点','','http://phpcms.local/','PHPCMS演示站','PHPCMS演示站','PHPCMS演示站','','default','default','array (\n  \'upload_maxsize\' => \'2048\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|bmp|png|doc|docx|xls|xlsx|ppt|pptx|pdf|txt|rar|zip|swf\',\n  \'watermark_enable\' => \'1\',\n  \'watermark_minwidth\' => \'300\',\n  \'watermark_minheight\' => \'300\',\n  \'watermark_img\' => \'statics/images/water//mark.png\',\n  \'watermark_pct\' => \'85\',\n  \'watermark_quality\' => \'80\',\n  \'watermark_pos\' => \'9\',\n)','0138bca4-aaa5-11e4-91a0-48d224d1cbf8');
INSERT INTO `v9_site` VALUES('2','s2','11','http://www.ZLCMS.cn/','11','11','11','','default','default','array (\n  \'upload_maxsize\' => \'2000\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|bmp|png|doc|docx|xls|xlsx|ppt|pptx|pdf|txt|rar|zip|swf\',\n  \'watermark_enable\' => \'0\',\n  \'watermark_minwidth\' => \'300\',\n  \'watermark_minheight\' => \'300\',\n  \'watermark_img\' => \'http://phpcms.local/statics/images/water/mark.gif\',\n  \'watermark_pct\' => \'100\',\n  \'watermark_quality\' => \'80\',\n  \'watermark_pos\' => \'9\',\n)','');

DROP TABLE IF EXISTS `v9_special`;
CREATE TABLE `v9_special` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `aid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` char(60) NOT NULL,
  `typeids` char(100) NOT NULL,
  `thumb` char(100) NOT NULL,
  `banner` char(100) NOT NULL,
  `description` char(255) NOT NULL,
  `url` char(100) NOT NULL,
  `ishtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ispage` tinyint(1) unsigned NOT NULL,
  `filename` char(40) NOT NULL,
  `pics` char(100) NOT NULL,
  `voteid` char(60) NOT NULL,
  `style` char(20) NOT NULL,
  `index_template` char(40) NOT NULL,
  `list_template` char(40) NOT NULL,
  `show_template` char(60) NOT NULL,
  `css` text NOT NULL,
  `username` char(40) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL,
  `elite` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isvideo` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `disabled` (`disabled`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_special_c_data`;
CREATE TABLE `v9_special_c_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author` varchar(40) NOT NULL,
  `content` text NOT NULL,
  `paginationtype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `maxcharperpage` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `style` char(20) NOT NULL,
  `show_template` varchar(30) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_special_content`;
CREATE TABLE `v9_special_content` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `specialid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `style` char(24) NOT NULL,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `thumb` char(100) NOT NULL,
  `keywords` char(40) NOT NULL,
  `description` char(255) NOT NULL,
  `url` char(100) NOT NULL,
  `curl` char(15) NOT NULL,
  `listorder` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `searchid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isdata` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `videoid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `specialid` (`specialid`,`typeid`,`isdata`),
  KEY `typeid` (`typeid`,`isdata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_sphinx_counter`;
CREATE TABLE `v9_sphinx_counter` (
  `counter_id` int(11) unsigned NOT NULL,
  `max_doc_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`counter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_sso_admin`;
CREATE TABLE `v9_sso_admin` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL,
  `password` char(32) NOT NULL,
  `encrypt` char(6) DEFAULT NULL,
  `issuper` tinyint(1) DEFAULT '0',
  `lastlogin` int(10) DEFAULT NULL,
  `ip` char(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `v9_sso_admin` VALUES('1','admin','a49d8d37ce2a28599eb4cf32ba143368','MQkWwz','1','0','');

DROP TABLE IF EXISTS `v9_sso_applications`;
CREATE TABLE `v9_sso_applications` (
  `appid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `type` char(16) NOT NULL DEFAULT '',
  `name` char(20) NOT NULL DEFAULT '',
  `url` char(255) NOT NULL DEFAULT '',
  `authkey` char(255) NOT NULL DEFAULT '',
  `ip` char(15) NOT NULL DEFAULT '',
  `apifilename` char(30) NOT NULL DEFAULT 'phpsso.php',
  `charset` char(8) NOT NULL DEFAULT '',
  `synlogin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`appid`),
  KEY `synlogin` (`synlogin`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `v9_sso_applications` VALUES('1','phpcms_v9','phpcms v9','http://phpcms.local/','KDLD6nThSmQU0wqGVZHIDrGZs6Q2ikmU','','api.php?op=phpsso','utf-8','1');

DROP TABLE IF EXISTS `v9_sso_members`;
CREATE TABLE `v9_sso_members` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `random` char(8) NOT NULL DEFAULT '',
  `email` char(32) NOT NULL DEFAULT '',
  `regip` char(15) NOT NULL DEFAULT '',
  `regdate` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` char(15) NOT NULL DEFAULT '0',
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `appname` char(15) NOT NULL,
  `type` enum('app','connect') DEFAULT NULL,
  `avatar` tinyint(1) NOT NULL DEFAULT '0',
  `ucuserid` mediumint(8) unsigned DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `ucuserid` (`ucuserid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_sso_messagequeue`;
CREATE TABLE `v9_sso_messagequeue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `operation` char(32) NOT NULL,
  `succeed` tinyint(1) NOT NULL DEFAULT '0',
  `totalnum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `noticedata` mediumtext NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `appstatus` mediumtext,
  PRIMARY KEY (`id`),
  KEY `dateline` (`dateline`),
  KEY `succeed` (`succeed`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_sso_session`;
CREATE TABLE `v9_sso_session` (
  `sessionid` char(32) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL,
  `lastvisit` int(10) unsigned NOT NULL DEFAULT '0',
  `roleid` tinyint(3) unsigned DEFAULT '0',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(255) NOT NULL,
  PRIMARY KEY (`sessionid`),
  KEY `lastvisit` (`lastvisit`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_sso_settings`;
CREATE TABLE `v9_sso_settings` (
  `name` varchar(32) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `v9_sso_settings` VALUES('denyemail','');
INSERT INTO `v9_sso_settings` VALUES('denyusername','');
INSERT INTO `v9_sso_settings` VALUES('creditrate','');
INSERT INTO `v9_sso_settings` VALUES('sp4','');
INSERT INTO `v9_sso_settings` VALUES('ucenter','');

DROP TABLE IF EXISTS `v9_tag`;
CREATE TABLE `v9_tag` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `tag` text NOT NULL,
  `name` char(40) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `module` char(20) NOT NULL,
  `action` char(20) NOT NULL,
  `data` text NOT NULL,
  `page` char(15) NOT NULL,
  `return` char(20) NOT NULL,
  `cache` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `num` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_template_bak`;
CREATE TABLE `v9_template_bak` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `creat_at` int(10) unsigned DEFAULT '0',
  `fileid` char(50) DEFAULT NULL,
  `userid` mediumint(8) DEFAULT NULL,
  `username` char(20) DEFAULT NULL,
  `template` text,
  PRIMARY KEY (`id`),
  KEY `fileid` (`fileid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_times`;
CREATE TABLE `v9_times` (
  `username` char(40) NOT NULL,
  `ip` char(15) NOT NULL,
  `logintime` int(10) unsigned NOT NULL DEFAULT '0',
  `isadmin` tinyint(1) NOT NULL DEFAULT '0',
  `times` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`username`,`isadmin`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_type`;
CREATE TABLE `v9_type` (
  `typeid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` char(15) NOT NULL,
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` char(30) NOT NULL,
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typedir` char(20) NOT NULL,
  `url` char(100) NOT NULL,
  `template` char(30) NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`typeid`),
  KEY `module` (`module`,`parentid`,`siteid`,`listorder`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

INSERT INTO `v9_type` VALUES('52','1','search','0','专题','0','special','','','4','专题');
INSERT INTO `v9_type` VALUES('1','1','search','1','新闻','0','','','','1','新闻模型搜索');
INSERT INTO `v9_type` VALUES('2','1','search','2','下载','0','','','','3','下载模型搜索');
INSERT INTO `v9_type` VALUES('3','1','search','3','图片','0','','','','2','图片模型搜索');

DROP TABLE IF EXISTS `v9_urlrule`;
CREATE TABLE `v9_urlrule` (
  `urlruleid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(15) NOT NULL,
  `file` varchar(20) NOT NULL,
  `ishtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `urlrule` varchar(255) NOT NULL,
  `example` varchar(255) NOT NULL,
  PRIMARY KEY (`urlruleid`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

INSERT INTO `v9_urlrule` VALUES('1','content','category','1','{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/{$page}.html','news/china/1000.html');
INSERT INTO `v9_urlrule` VALUES('6','content','category','0','index.php?m=content&c=index&a=lists&catid={$catid}|index.php?m=content&c=index&a=lists&catid={$catid}&page={$page}','index.php?m=content&c=index&a=lists&catid=1&page=1');
INSERT INTO `v9_urlrule` VALUES('11','content','show','1','{$year}/{$catdir}_{$month}{$day}/{$id}.html|{$year}/{$catdir}_{$month}{$day}/{$id}_{$page}.html','2010/catdir_0720/1_2.html');
INSERT INTO `v9_urlrule` VALUES('12','content','show','1','{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}.html|{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}_{$page}.html','it/product/2010/0720/1_2.html');
INSERT INTO `v9_urlrule` VALUES('16','content','show','0','index.php?m=content&c=index&a=show&catid={$catid}&id={$id}|index.php?m=content&c=index&a=show&catid={$catid}&id={$id}&page={$page}','index.php?m=content&c=index&a=show&catid=1&id=1');
INSERT INTO `v9_urlrule` VALUES('17','content','show','0','show-{$catid}-{$id}-{$page}.html','show-1-2-1.html');
INSERT INTO `v9_urlrule` VALUES('18','content','show','0','content-{$catid}-{$id}-{$page}.html','content-1-2-1.html');
INSERT INTO `v9_urlrule` VALUES('30','content','category','0','list-{$catid}-{$page}.html','list-1-1.html');

DROP TABLE IF EXISTS `v9_video`;
CREATE TABLE `v9_video` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `vision` varchar(255) NOT NULL DEFAULT '',
  `video_category` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_video_data`;
CREATE TABLE `v9_video_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `video` tinyint(3) unsigned NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_wap_type`;
CREATE TABLE `v9_wap_type` (
  `typeid` smallint(5) NOT NULL AUTO_INCREMENT,
  `cat` smallint(5) NOT NULL,
  `parentid` smallint(5) NOT NULL,
  `typename` varchar(30) NOT NULL,
  `siteid` smallint(5) NOT NULL,
  `listorder` smallint(5) DEFAULT '0',
  PRIMARY KEY (`typeid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_workflow`;
CREATE TABLE `v9_workflow` (
  `workflowid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `steps` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `workname` varchar(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `setting` text NOT NULL,
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`workflowid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `v9_workflow` VALUES('1','1','1','一级审核','审核一次','','0');
INSERT INTO `v9_workflow` VALUES('2','1','2','二级审核','审核两次','','0');
INSERT INTO `v9_workflow` VALUES('3','1','3','三级审核','审核三次','','0');
INSERT INTO `v9_workflow` VALUES('4','1','4','四级审核','四级审核','','0');

