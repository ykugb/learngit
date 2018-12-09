/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : myblog

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 19/08/2018 12:56:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (5, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (8, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (9, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (10, 'Can add content type', 4, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (11, 'Can change content type', 4, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (12, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (13, 'Can add session', 5, 'add_session');
INSERT INTO `auth_permission` VALUES (14, 'Can change session', 5, 'change_session');
INSERT INTO `auth_permission` VALUES (15, 'Can delete session', 5, 'delete_session');
INSERT INTO `auth_permission` VALUES (16, 'Can add 用户信息', 6, 'add_userinfo');
INSERT INTO `auth_permission` VALUES (17, 'Can change 用户信息', 6, 'change_userinfo');
INSERT INTO `auth_permission` VALUES (18, 'Can delete 用户信息', 6, 'delete_userinfo');
INSERT INTO `auth_permission` VALUES (19, 'Can add 文章', 7, 'add_article');
INSERT INTO `auth_permission` VALUES (20, 'Can change 文章', 7, 'change_article');
INSERT INTO `auth_permission` VALUES (21, 'Can delete 文章', 7, 'delete_article');
INSERT INTO `auth_permission` VALUES (22, 'Can add 文章-标签', 8, 'add_article2tag');
INSERT INTO `auth_permission` VALUES (23, 'Can change 文章-标签', 8, 'change_article2tag');
INSERT INTO `auth_permission` VALUES (24, 'Can delete 文章-标签', 8, 'delete_article2tag');
INSERT INTO `auth_permission` VALUES (25, 'Can add 文章详情', 9, 'add_articledetail');
INSERT INTO `auth_permission` VALUES (26, 'Can change 文章详情', 9, 'change_articledetail');
INSERT INTO `auth_permission` VALUES (27, 'Can delete 文章详情', 9, 'delete_articledetail');
INSERT INTO `auth_permission` VALUES (28, 'Can add 点赞', 10, 'add_articleupdown');
INSERT INTO `auth_permission` VALUES (29, 'Can change 点赞', 10, 'change_articleupdown');
INSERT INTO `auth_permission` VALUES (30, 'Can delete 点赞', 10, 'delete_articleupdown');
INSERT INTO `auth_permission` VALUES (31, 'Can add 博客', 11, 'add_blog');
INSERT INTO `auth_permission` VALUES (32, 'Can change 博客', 11, 'change_blog');
INSERT INTO `auth_permission` VALUES (33, 'Can delete 博客', 11, 'delete_blog');
INSERT INTO `auth_permission` VALUES (34, 'Can add 文章分类', 12, 'add_category');
INSERT INTO `auth_permission` VALUES (35, 'Can change 文章分类', 12, 'change_category');
INSERT INTO `auth_permission` VALUES (36, 'Can delete 文章分类', 12, 'delete_category');
INSERT INTO `auth_permission` VALUES (37, 'Can add 评论', 13, 'add_comment');
INSERT INTO `auth_permission` VALUES (38, 'Can change 评论', 13, 'change_comment');
INSERT INTO `auth_permission` VALUES (39, 'Can delete 评论', 13, 'delete_comment');
INSERT INTO `auth_permission` VALUES (40, 'Can add 标签', 14, 'add_tag');
INSERT INTO `auth_permission` VALUES (41, 'Can change 标签', 14, 'change_tag');
INSERT INTO `auth_permission` VALUES (42, 'Can delete 标签', 14, 'delete_tag');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_myblog_userinfo_nid`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_myblog_userinfo_nid` FOREIGN KEY (`user_id`) REFERENCES `myblog_userinfo` (`nid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2018-08-13 22:01:11.917568', '1', 'root', 1, '[{\"added\": {}}]', 11, 2);
INSERT INTO `django_admin_log` VALUES (2, '2018-08-13 22:02:24.699643', '1', 'root-Hbase', 1, '[{\"added\": {}}]', 12, 2);
INSERT INTO `django_admin_log` VALUES (3, '2018-08-13 22:02:34.299304', '1', 'HBase（二）CentOS7.5搭建HBase1.2.6集群', 1, '[{\"added\": {}}]', 7, 2);
INSERT INTO `django_admin_log` VALUES (4, '2018-08-13 22:03:03.554234', '1', 'sy', 1, '[{\"added\": {}}]', 14, 2);
INSERT INTO `django_admin_log` VALUES (5, '2018-08-13 22:03:05.189204', '1', 'HBase（二）CentOS7.5搭建HBase1.2.6集群-sy', 1, '[{\"added\": {}}]', 8, 2);
INSERT INTO `django_admin_log` VALUES (6, '2018-08-13 22:03:45.184848', '1', 'ArticleDetail object (1)', 1, '[{\"added\": {}}]', 9, 2);
INSERT INTO `django_admin_log` VALUES (7, '2018-08-13 23:56:54.894908', '2', 'JasperReport 中踩过的坑', 1, '[{\"added\": {}}]', 7, 2);
INSERT INTO `django_admin_log` VALUES (8, '2018-08-13 23:57:30.886396', '3', 'SpringBoot简单打包部署(附工程)', 1, '[{\"added\": {}}]', 7, 2);
INSERT INTO `django_admin_log` VALUES (9, '2018-08-14 09:09:24.950406', '1', 'ArticleDetail object (1)', 2, '[]', 9, 2);
INSERT INTO `django_admin_log` VALUES (10, '2018-08-14 17:34:54.913072', '1', 'sy', 2, '[]', 14, 2);
INSERT INTO `django_admin_log` VALUES (11, '2018-08-16 21:51:58.074382', '2', 'fgf', 1, '[{\"added\": {}}]', 14, 2);
INSERT INTO `django_admin_log` VALUES (12, '2018-08-16 21:52:04.966090', '3', 'adfs', 1, '[{\"added\": {}}]', 14, 2);
INSERT INTO `django_admin_log` VALUES (13, '2018-08-16 21:52:11.501289', '4', 'weq', 1, '[{\"added\": {}}]', 14, 2);
INSERT INTO `django_admin_log` VALUES (14, '2018-08-16 21:52:52.654638', '2', 'root-zz', 1, '[{\"added\": {}}]', 12, 2);
INSERT INTO `django_admin_log` VALUES (15, '2018-08-16 21:53:01.382648', '3', 'root-xx', 1, '[{\"added\": {}}]', 12, 2);
INSERT INTO `django_admin_log` VALUES (16, '2018-08-17 09:43:28.560365', '4', 'xinxin-sf', 1, '[{\"added\": {}}]', 12, 2);
INSERT INTO `django_admin_log` VALUES (17, '2018-08-17 09:43:31.540793', '7', 'ttt', 1, '[{\"added\": {}}]', 7, 2);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (7, 'myblog', 'article');
INSERT INTO `django_content_type` VALUES (8, 'myblog', 'article2tag');
INSERT INTO `django_content_type` VALUES (9, 'myblog', 'articledetail');
INSERT INTO `django_content_type` VALUES (10, 'myblog', 'articleupdown');
INSERT INTO `django_content_type` VALUES (11, 'myblog', 'blog');
INSERT INTO `django_content_type` VALUES (12, 'myblog', 'category');
INSERT INTO `django_content_type` VALUES (13, 'myblog', 'comment');
INSERT INTO `django_content_type` VALUES (14, 'myblog', 'tag');
INSERT INTO `django_content_type` VALUES (6, 'myblog', 'userinfo');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2018-08-13 18:19:28.979732');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2018-08-13 18:19:29.248223');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2018-08-13 18:19:29.991611');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2018-08-13 18:19:30.155176');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2018-08-13 18:19:30.167585');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2018-08-13 18:19:30.179605');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2018-08-13 18:19:30.193116');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2018-08-13 18:19:30.198596');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2018-08-13 18:19:30.231598');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2018-08-13 18:19:30.244599');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2018-08-13 18:19:30.255614');
INSERT INTO `django_migrations` VALUES (12, 'myblog', '0001_initial', '2018-08-13 18:19:34.899785');
INSERT INTO `django_migrations` VALUES (13, 'admin', '0001_initial', '2018-08-13 18:19:35.394246');
INSERT INTO `django_migrations` VALUES (14, 'admin', '0002_logentry_remove_auto_add', '2018-08-13 18:19:35.451262');
INSERT INTO `django_migrations` VALUES (15, 'sessions', '0001_initial', '2018-08-13 18:19:35.652197');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('esrtuvlao9zinw5fmqurcnqqenr1rsdy', 'Mzk5OTVlZDMyNjVhZmViMGZhZmZkM2RjN2Y2Nzk5NmVlNzgzZTVmYzp7InZhbGlkX2NvZGVfc3RyIjoidUI3T0kiLCJfYXV0aF91c2VyX2lkIjoiMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMTMyZDA5YTQ1Y2Y3MGM2OGY2M2Q0OWQ4ZjcyMDRjYWE1YWVmNTM1NyJ9', '2018-09-02 11:08:50.043945');

-- ----------------------------
-- Table structure for myblog_article
-- ----------------------------
DROP TABLE IF EXISTS `myblog_article`;
CREATE TABLE `myblog_article`  (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `comment_count` int(11) NOT NULL,
  `up_count` int(11) NOT NULL,
  `down_count` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `myblog_article_category_id_c6cb4ed6_fk_myblog_category_nid`(`category_id`) USING BTREE,
  INDEX `myblog_article_user_id_7728319b_fk_myblog_userinfo_nid`(`user_id`) USING BTREE,
  CONSTRAINT `myblog_article_category_id_c6cb4ed6_fk_myblog_category_nid` FOREIGN KEY (`category_id`) REFERENCES `myblog_category` (`nid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `myblog_article_user_id_7728319b_fk_myblog_userinfo_nid` FOREIGN KEY (`user_id`) REFERENCES `myblog_userinfo` (`nid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of myblog_article
-- ----------------------------
INSERT INTO `myblog_article` VALUES (1, 'HBase（二）CentOS7.5搭建HBase1.2.6', '\r\n	一、安装前提\r\n1、HBase 依赖于 HDFS 做底层的数据存储\r\n2、HBase 依赖于 MapReduce 做数据计算\r\n3、HBase 依赖于 ZooKeeper 做服务协调\r\n4、HBase源码是java编写的，安装需要依赖JDK\r\n1、版本选择\r\n打开官方的版本说明http://h...', '2018-08-13 22:02:34.295254', 11, 1, 0, 3, 2);
INSERT INTO `myblog_article` VALUES (2, 'JasperReport 中踩过的坑', 'Mac Book Pro 10.13.6Jaspersoft Studio community version 6.6.9JDK 8 安装 Jaspersoft Studio Jasper Report 分为专业版（收费）和社区版（免费），如果只是用来设计一些 基本的报表模板，社区版就足够了。从这里 ...', '2018-08-13 23:56:54.870856', 0, 1, 0, 1, 2);
INSERT INTO `myblog_article` VALUES (3, 'SpringBoot简单打包部署(附工程)', '前言 本文主要介绍SpringBoot的一些打包事项和项目部署以及在其中遇到一些问题的解决方案。 SpringBoot打包 在SpringBoot打包这块，我们就用之前的一个web项目来进行打包。 首先需要明确的是，该项目打包的形态是可执行的 jar 包，还是在 tomcat 下运行的 war 包。 ...', '2018-08-13 23:57:30.884365', 0, 1, 0, 1, 2);
INSERT INTO `myblog_article` VALUES (5, '附上附件是老款的飞机', '发士大夫但是可能大脑思考v...', '2018-08-17 08:35:02.946371', 0, 0, 1, 1, 2);
INSERT INTO `myblog_article` VALUES (6, '对方是否', '对方是否犯得上犯得上...', '2018-08-17 08:36:19.120572', 0, 1, 0, 3, 2);
INSERT INTO `myblog_article` VALUES (7, 'ttt', 'dsfsdfs', '2018-08-17 09:43:31.537808', 1, 1, 1, 4, 7);
INSERT INTO `myblog_article` VALUES (8, 'rrrrrrrrr', '...', '2018-08-18 13:01:43.422521', 0, 0, 0, 1, 2);

-- ----------------------------
-- Table structure for myblog_article2tag
-- ----------------------------
DROP TABLE IF EXISTS `myblog_article2tag`;
CREATE TABLE `myblog_article2tag`  (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `myblog_article2tag_article_id_32c27780_fk_myblog_article_nid`(`article_id`) USING BTREE,
  INDEX `myblog_article2tag_tag_id_7622b4e5_fk_myblog_tag_nid`(`tag_id`) USING BTREE,
  CONSTRAINT `myblog_article2tag_article_id_32c27780_fk_myblog_article_nid` FOREIGN KEY (`article_id`) REFERENCES `myblog_article` (`nid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `myblog_article2tag_tag_id_7622b4e5_fk_myblog_tag_nid` FOREIGN KEY (`tag_id`) REFERENCES `myblog_tag` (`nid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of myblog_article2tag
-- ----------------------------
INSERT INTO `myblog_article2tag` VALUES (11, 1, 1);
INSERT INTO `myblog_article2tag` VALUES (12, 1, 2);
INSERT INTO `myblog_article2tag` VALUES (13, 1, 3);
INSERT INTO `myblog_article2tag` VALUES (14, 1, 4);
INSERT INTO `myblog_article2tag` VALUES (15, 5, 1);
INSERT INTO `myblog_article2tag` VALUES (16, 6, 2);
INSERT INTO `myblog_article2tag` VALUES (17, 6, 3);
INSERT INTO `myblog_article2tag` VALUES (18, 8, 3);

-- ----------------------------
-- Table structure for myblog_articledetail
-- ----------------------------
DROP TABLE IF EXISTS `myblog_articledetail`;
CREATE TABLE `myblog_articledetail`  (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `article_id` int(11) NOT NULL,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE INDEX `article_id`(`article_id`) USING BTREE,
  CONSTRAINT `myblog_articledetail_article_id_4ed94dd3_fk_myblog_article_nid` FOREIGN KEY (`article_id`) REFERENCES `myblog_article` (`nid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of myblog_articledetail
-- ----------------------------
INSERT INTO `myblog_articledetail` VALUES (1, '<p>\n 一、安装前提\r\n1、HBase 依赖于 HDFS 做底层的数据存储\r\n2、HBase 依赖于 MapReduce 做数据计算\r\n3、HBase 依赖于 ZooKeeper 做服务协调\r\n4、HBase源码是java编写的，安装需要依赖JDK\r\n1、版本选择\r\n打开官方的版本说明http://hbase.apache.org/1.2/book.html\r\nJDK的选择\n</p>\n<p>\n <span>\n  一、安装前提 1、HBase 依赖于 HDFS 做底层的数据存储 2、HBase 依赖于 MapReduce 做数据计算 3、HBase 依赖于 ZooKeeper 做服务协调 4、HBase源码是java编写的，安装需要依赖JDK 1、版本选择 打开官方的版本说明http://hbase.apache.org/1.2/book.html JDK的选择\n </span>\n</p>\n<p>\n <span>\n  一、安装前提 1、HBase 依赖于 HDFS 做底层的数据存储 2、HBase 依赖于 MapReduce 做数据计算 3、HBase 依赖于 ZooKeeper 做服务协调 4、HBase源码是java编写的，安装需要依赖JDK 1、版本选择 打开官方的版本说明http://hbase.apache.org/1.2/book.html JDK的选择\n </span>\n</p>\n<p>\n <span>\n  一、安装前提 1、HBase 依赖于 HDFS 做底层的数据存储 2、HBase 依赖于 MapReduce 做数据计算 3、HBase 依赖于 ZooKeeper 做服务协调 4、HBase源码是java编写的，安装需要依赖JDK 1、版本选择 打开官方的版本说明http://hbase.apache.org/1.2/book.html JDK的选择\n </span>\n</p>\n<p>\n <span>\n  一、安装前提 1、HBase 依赖于 HDFS 做底层的数据存储 2、HBase 依赖于 MapReduce 做数据计算 3、HBase 依赖于 ZooKeeper 做服务协调 4、HBase源码是java编写的，安装需要依赖JDK 1、版本选择 打开官方的版本说明http://hbase.apache.org/1.2/book.html JDK的选择\n </span>\n</p>\n<p>\n <span>\n </span>\n</p>\n<p>\n 一、安装前提 1、HBase 依赖于 HDFS 做底层的数据存储 2、HBase 依赖于 MapReduce 做数据计算 3、HBase 依赖于 ZooKeeper 做服务协调 4、HBase源码是java编写的，安装需要依赖JDK 1、版本选择 打开官方的版本说明http://hbase.apache.org/1.2/book.html JDK的选择\n</p>\n<p>\n 一、安装前提 1、HBase 依赖于 HDFS 做底层的数据存储 2、HBase 依赖于 MapReduce 做数据计算 3、HBase 依赖于 ZooKeeper 做服务协调 4、HBase源码是java编写的，安装需要依赖JDK 1、版本选择 打开官方的版本说明http://hbase.apache.org/1.2/book.html JDK的选择\n</p>\n<p>\n 一、安装前提 1、HBase 依赖于 HDFS 做底层的数据存储 2、HBase 依赖于 MapReduce 做数据计算 3、HBase 依赖于 ZooKeeper 做服务协调 4、HBase源码是java编写的，安装需要依赖JDK 1、版本选择 打开官方的版本说明http://hbase.apache.org/1.2/book.html JDK的选择\n</p>\n<p>\n 一、安装前提 1、HBase 依赖于 HDFS 做底层的数据存储 2、HBase 依赖于 MapReduce 做数据计算 3、HBase 依赖于 ZooKeeper 做服务协调 4、HBase源码是java编写的，安装需要依赖JDK 1、版本选择 打开官方的版本说明http://hbase.apache.org/1.2/book.html JDK的选择\n</p>\n<p>\n 一、安装前提 1、HBase 依赖于 HDFS 做底层的数据存储 2、HBase 依赖于 MapReduce 做数据计算 3、HBase 依赖于 ZooKeeper 做服务协调 4、HBase源码是java编写的，安装需要依赖JDK 1、版本选择 打开官方的版本说明http://hbase.apache.org/1.2/book.html JDK的选择\n</p>\n<p>\n <br/>\n</p>\n<p style=\'font-size:16px;font-family:\"vertical-align:baseline;color:#222222;text-align:justify;text-indent:2em;background-color:#FFFFFF;\'>\n 会议指出，这起问题疫苗案件发生以来，习近平总书记高度重视，多次作出重要指示，要求立即查清事实真相，严肃问责，依法从严处理，坚决守住安全底线，全力保障群众切身利益和社会稳定大局。在党中央坚强领导下，国务院多次召开会议研究，派出调查组进行调查，目前已基本查清案件情况和有关部门及干部履行职责情况。\n</p>\n<p style=\'font-size:16px;font-family:\"vertical-align:baseline;color:#222222;text-align:justify;text-indent:2em;background-color:#FFFFFF;\'>\n 会议强调，疫苗关系人民群众健康，关系公共卫生安全和国家安全。这起问题疫苗案件是一起疫苗生产者逐利枉法、违反国家药品标准和药品生产质量管理规范、编造虚假生产检验记录、地方政府和监管部门失职失察、个别工作人员渎职的严重违规违法生产疫苗的重大案件，情节严重，性质恶劣，造成严重不良影响，既暴露出监管不到位等诸多漏洞，也反映出疫苗生产流通使用等方面存在的制度缺陷。要深刻汲取教训，举一反三，重典治乱，去疴除弊，加快完善疫苗药品监管长效机制，坚决守住公共安全底线，坚决维护最广大人民身体健康。\n</p>\n<p style=\'font-size:16px;font-family:\"vertical-align:baseline;color:#222222;text-align:justify;text-indent:2em;background-color:#FFFFFF;\'>\n 会议强调，要完善法律法规和制度规则，明晰和落实监管责任，加强生产过程现场检查，督促企业履行主体责任义务，建立质量安全追溯体系，落实产品风险报告制度。对风险高、专业性强的疫苗药品，要明确监管事权，在地方属地管\n</p>\n<p>\n <br/>\n</p>\n<br/>\n<p>\n <br/>\n</p>', 1);
INSERT INTO `myblog_articledetail` VALUES (3, '发士大夫但是可能大脑思考v', 5);
INSERT INTO `myblog_articledetail` VALUES (4, '对方是否犯得上犯得上', 6);
INSERT INTO `myblog_articledetail` VALUES (5, '<img alt=\"\" src=\"/media/add_article_img/timg.jpg\"/>', 8);

-- ----------------------------
-- Table structure for myblog_articleupdown
-- ----------------------------
DROP TABLE IF EXISTS `myblog_articleupdown`;
CREATE TABLE `myblog_articleupdown`  (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `is_up` tinyint(1) NOT NULL,
  `article_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE INDEX `myblog_articleupdown_article_id_user_id_cb7da7a1_uniq`(`article_id`, `user_id`) USING BTREE,
  INDEX `myblog_articleupdown_user_id_3b2fb6ea_fk_myblog_userinfo_nid`(`user_id`) USING BTREE,
  CONSTRAINT `myblog_articleupdown_article_id_be2b31a5_fk_myblog_article_nid` FOREIGN KEY (`article_id`) REFERENCES `myblog_article` (`nid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `myblog_articleupdown_user_id_3b2fb6ea_fk_myblog_userinfo_nid` FOREIGN KEY (`user_id`) REFERENCES `myblog_userinfo` (`nid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of myblog_articleupdown
-- ----------------------------
INSERT INTO `myblog_articleupdown` VALUES (1, 1, 1, 2);
INSERT INTO `myblog_articleupdown` VALUES (2, 1, 7, 2);
INSERT INTO `myblog_articleupdown` VALUES (3, 0, 7, NULL);
INSERT INTO `myblog_articleupdown` VALUES (4, 1, 6, NULL);
INSERT INTO `myblog_articleupdown` VALUES (5, 1, 3, 2);
INSERT INTO `myblog_articleupdown` VALUES (6, 1, 2, 2);
INSERT INTO `myblog_articleupdown` VALUES (7, 0, 5, 2);

-- ----------------------------
-- Table structure for myblog_blog
-- ----------------------------
DROP TABLE IF EXISTS `myblog_blog`;
CREATE TABLE `myblog_blog`  (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `theme` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`nid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of myblog_blog
-- ----------------------------
INSERT INTO `myblog_blog` VALUES (1, 'root', 'root');
INSERT INTO `myblog_blog` VALUES (3, 'xinxin', 'xinxin');
INSERT INTO `myblog_blog` VALUES (4, 'we', 'we');

-- ----------------------------
-- Table structure for myblog_category
-- ----------------------------
DROP TABLE IF EXISTS `myblog_category`;
CREATE TABLE `myblog_category`  (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `blog_id` int(11) NOT NULL,
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `myblog_category_blog_id_7caa8171_fk_myblog_blog_nid`(`blog_id`) USING BTREE,
  CONSTRAINT `myblog_category_blog_id_7caa8171_fk_myblog_blog_nid` FOREIGN KEY (`blog_id`) REFERENCES `myblog_blog` (`nid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of myblog_category
-- ----------------------------
INSERT INTO `myblog_category` VALUES (1, 'Hbase', 1);
INSERT INTO `myblog_category` VALUES (2, 'zz', 1);
INSERT INTO `myblog_category` VALUES (3, 'xx', 1);
INSERT INTO `myblog_category` VALUES (4, 'sf', 3);

-- ----------------------------
-- Table structure for myblog_comment
-- ----------------------------
DROP TABLE IF EXISTS `myblog_comment`;
CREATE TABLE `myblog_comment`  (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `article_id` int(11) NOT NULL,
  `parent_comment_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `myblog_comment_article_id_44b1452c_fk_myblog_article_nid`(`article_id`) USING BTREE,
  INDEX `myblog_comment_parent_comment_id_f3a0f6a8_fk_myblog_comment_nid`(`parent_comment_id`) USING BTREE,
  INDEX `myblog_comment_user_id_1d5be68b_fk_myblog_userinfo_nid`(`user_id`) USING BTREE,
  CONSTRAINT `myblog_comment_article_id_44b1452c_fk_myblog_article_nid` FOREIGN KEY (`article_id`) REFERENCES `myblog_article` (`nid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `myblog_comment_parent_comment_id_f3a0f6a8_fk_myblog_comment_nid` FOREIGN KEY (`parent_comment_id`) REFERENCES `myblog_comment` (`nid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `myblog_comment_user_id_1d5be68b_fk_myblog_userinfo_nid` FOREIGN KEY (`user_id`) REFERENCES `myblog_userinfo` (`nid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of myblog_comment
-- ----------------------------
INSERT INTO `myblog_comment` VALUES (12, 'henhao', '2018-08-14 22:55:37.878287', 1, NULL, 2);
INSERT INTO `myblog_comment` VALUES (13, '', '2018-08-14 23:01:40.781157', 1, 12, 2);
INSERT INTO `myblog_comment` VALUES (14, 'dsfsf', '2018-08-14 23:06:25.586246', 1, NULL, 2);
INSERT INTO `myblog_comment` VALUES (15, 'vvcv', '2018-08-14 23:13:19.066630', 1, NULL, 2);
INSERT INTO `myblog_comment` VALUES (16, 'niubi', '2018-08-14 23:23:10.087013', 1, NULL, 2);
INSERT INTO `myblog_comment` VALUES (17, 'iiii', '2018-08-14 23:23:37.987265', 1, NULL, 2);
INSERT INTO `myblog_comment` VALUES (18, 'ooooo', '2018-08-14 23:24:02.828073', 1, NULL, 2);
INSERT INTO `myblog_comment` VALUES (19, 'hyyyy', '2018-08-14 23:24:25.026458', 1, 17, 2);
INSERT INTO `myblog_comment` VALUES (20, 'fcvyuhhnikjm', '2018-08-14 23:25:11.404256', 1, 17, 2);
INSERT INTO `myblog_comment` VALUES (21, '合并', '2018-08-14 23:32:59.134108', 1, NULL, 2);
INSERT INTO `myblog_comment` VALUES (22, 'haogepi', '2018-08-18 22:08:27.768155', 1, 12, 2);
INSERT INTO `myblog_comment` VALUES (23, 'www', '2018-08-19 09:23:54.123771', 7, NULL, 2);

-- ----------------------------
-- Table structure for myblog_tag
-- ----------------------------
DROP TABLE IF EXISTS `myblog_tag`;
CREATE TABLE `myblog_tag`  (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `blog_id` int(11) NOT NULL,
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `myblog_tag_blog_id_563134a1_fk_myblog_blog_nid`(`blog_id`) USING BTREE,
  CONSTRAINT `myblog_tag_blog_id_563134a1_fk_myblog_blog_nid` FOREIGN KEY (`blog_id`) REFERENCES `myblog_blog` (`nid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of myblog_tag
-- ----------------------------
INSERT INTO `myblog_tag` VALUES (1, 'sy', 1);
INSERT INTO `myblog_tag` VALUES (2, 'fgf', 1);
INSERT INTO `myblog_tag` VALUES (3, 'adfs', 1);
INSERT INTO `myblog_tag` VALUES (4, 'weq', 1);

-- ----------------------------
-- Table structure for myblog_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `myblog_userinfo`;
CREATE TABLE `myblog_userinfo`  (
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `blog_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  UNIQUE INDEX `phone`(`phone`) USING BTREE,
  UNIQUE INDEX `blog_id`(`blog_id`) USING BTREE,
  CONSTRAINT `myblog_userinfo_blog_id_18a4eb12_fk_myblog_blog_nid` FOREIGN KEY (`blog_id`) REFERENCES `myblog_blog` (`nid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of myblog_userinfo
-- ----------------------------
INSERT INTO `myblog_userinfo` VALUES ('pbkdf2_sha256$100000$vIrqM3uSZpEa$Qci5cxCYNba8pXoy+wL2QL6oWkTbH4Nx8q9FL+ZO53k=', '2018-08-19 11:08:50.039368', 1, 'root', '', '', 'root@qq.com', 1, 1, '2018-08-13 21:27:55.002915', 2, NULL, 'avatars/timg_EikaEtn.jpg', '2018-08-13 21:27:55.108928', 1);
INSERT INTO `myblog_userinfo` VALUES ('pbkdf2_sha256$100000$g3gCDREbwatC$mDHgzwwXuaG6fOVsh8xXoZr4gJpkXG0uESQVsIFPxzo=', '2018-08-14 18:11:32.258924', 0, 'xinxin', '', '', '', 0, 1, '2018-08-14 18:11:32.126069', 7, '18866666666', 'avatars/timg_EikaEtn.jpg', '2018-08-14 18:11:32.239911', 3);
INSERT INTO `myblog_userinfo` VALUES ('pbkdf2_sha256$100000$eBEkkbwPYcFg$bgghp1zCKGv50WBEHlICZ0LkUpHCo5jrrHwC3NfOX7E=', '2018-08-18 09:07:01.612133', 0, 'we', '', '', '', 0, 1, '2018-08-18 09:07:01.435859', 8, '17888888888', 'avatars/favicon.ico', '2018-08-18 09:07:01.572172', 4);

-- ----------------------------
-- Table structure for myblog_userinfo_groups
-- ----------------------------
DROP TABLE IF EXISTS `myblog_userinfo_groups`;
CREATE TABLE `myblog_userinfo_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userinfo_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `myblog_userinfo_groups_userinfo_id_group_id_64630eb9_uniq`(`userinfo_id`, `group_id`) USING BTREE,
  INDEX `myblog_userinfo_groups_group_id_8f5aba96_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `myblog_userinfo_grou_userinfo_id_6bd81185_fk_myblog_us` FOREIGN KEY (`userinfo_id`) REFERENCES `myblog_userinfo` (`nid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `myblog_userinfo_groups_group_id_8f5aba96_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for myblog_userinfo_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `myblog_userinfo_user_permissions`;
CREATE TABLE `myblog_userinfo_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userinfo_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `myblog_userinfo_user_per_userinfo_id_permission_i_31b46e93_uniq`(`userinfo_id`, `permission_id`) USING BTREE,
  INDEX `myblog_userinfo_user_permission_id_21c747fc_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `myblog_userinfo_user_permission_id_21c747fc_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `myblog_userinfo_user_userinfo_id_7e8ec257_fk_myblog_us` FOREIGN KEY (`userinfo_id`) REFERENCES `myblog_userinfo` (`nid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
