-- MySQL dump 10.14  Distrib 5.5.64-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: mytardis
-- ------------------------------------------------------
-- Server version	5.5.64-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `mytardis`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mytardis` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `mytardis`;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add topnav',7,'add_topnav'),(26,'Can change topnav',7,'change_topnav'),(27,'Can delete topnav',7,'delete_topnav'),(28,'Can view topnav',7,'view_topnav'),(29,'Can add article',8,'add_article'),(30,'Can change article',8,'change_article'),(31,'Can delete article',8,'delete_article'),(32,'Can view article',8,'view_article');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$180000$ndtLdL2t5xq1$QJhC0pNzXHZjmOXu6TSTRScVkmUfzlGj0UT47d71LRg=','2019-12-26 02:06:18.667069',1,'root','','','',1,1,'2019-12-26 02:06:04.982253');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-12-26 02:06:27.368727','1','Topnav object (1)',1,'[{\"added\": {}}]',7,1),(2,'2019-12-26 02:07:05.782564','2','Topnav object (2)',1,'[{\"added\": {}}]',7,1),(3,'2019-12-26 02:44:15.242032','1','linux服务器运维',2,'[{\"changed\": {\"fields\": [\"Url\"]}}]',7,1),(4,'2019-12-26 05:05:21.156791','1','111111',1,'[{\"added\": {}}]',8,1),(5,'2019-12-26 07:48:14.011922','1','111111',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]',8,1),(6,'2019-12-26 07:52:34.864946','1','111111',2,'[]',8,1),(7,'2019-12-26 07:59:39.765210','1','111111',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]',8,1),(8,'2019-12-26 08:03:05.841730','1','111111',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]',8,1),(9,'2019-12-27 00:05:55.967083','2','adad',1,'[{\"added\": {}}]',8,1),(10,'2019-12-27 00:06:05.164044','3','sadaca',1,'[{\"added\": {}}]',8,1),(11,'2019-12-27 00:06:13.326668','4','sdcscsdc',1,'[{\"added\": {}}]',8,1),(12,'2019-12-27 00:06:21.784993','5','csdcsxdc',1,'[{\"added\": {}}]',8,1),(13,'2019-12-27 00:06:30.204232','6','csccdc',1,'[{\"added\": {}}]',8,1),(14,'2019-12-27 00:06:38.622883','7','cdscsdcsdc',1,'[{\"added\": {}}]',8,1),(15,'2019-12-27 00:06:47.000827','8','csdcsdcdcd',1,'[{\"added\": {}}]',8,1),(16,'2019-12-27 00:06:54.341990','9','cdscsdc',1,'[{\"added\": {}}]',8,1),(17,'2019-12-27 00:07:10.931407','10','aWDWADWA',1,'[{\"added\": {}}]',8,1),(18,'2019-12-27 00:07:19.685373','11','ADWACAC',1,'[{\"added\": {}}]',8,1),(19,'2019-12-27 00:07:28.819530','12','ACACAC',1,'[{\"added\": {}}]',8,1),(20,'2019-12-27 00:07:36.162916','13','CAVCACA',1,'[{\"added\": {}}]',8,1),(21,'2019-12-27 00:07:43.673036','14','CASCSACAC',1,'[{\"added\": {}}]',8,1),(22,'2019-12-27 00:07:52.157288','15','CADSD SD',1,'[{\"added\": {}}]',8,1),(23,'2019-12-27 00:07:59.989809','16','FDSAVSAC',1,'[{\"added\": {}}]',8,1),(24,'2019-12-27 00:08:07.824547','17','vdvavsdavsac',1,'[{\"added\": {}}]',8,1),(25,'2019-12-27 00:08:17.376925','18','sdvsavcsavsd',1,'[{\"added\": {}}]',8,1),(26,'2019-12-27 00:12:05.030452','19','dsasfvdsd',1,'[{\"added\": {}}]',8,1),(27,'2019-12-27 00:12:16.150264','20','svsvfvdsd',1,'[{\"added\": {}}]',8,1),(28,'2019-12-27 00:12:26.178094','21','vsvsvdc',1,'[{\"added\": {}}]',8,1),(29,'2019-12-27 00:12:34.080675','22','fbsfc',1,'[{\"added\": {}}]',8,1),(30,'2019-12-27 03:00:16.037761','23','css样式之a标签',1,'[{\"added\": {}}]',8,1),(31,'2019-12-27 03:02:28.535242','1','111111',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]',8,1),(32,'2019-12-27 03:04:18.937801','1','111111',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]',8,1),(33,'2019-12-27 07:57:06.407784','24','《天下粮田》带给我们什么启示',1,'[{\"added\": {}}]',8,1),(34,'2019-12-31 05:01:10.163133','24','《天下粮田》带给我们什么启示环境查看环境查看',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u6807\\u9898\"]}}]',8,1),(35,'2019-12-31 05:23:57.606710','24','《天下粮田》带给我们什么启示环境查看环境查看',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]',8,1),(36,'2019-12-31 05:30:13.793976','24','《天下粮田》带给我们什么启示环境查看环境查看',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]',8,1),(37,'2019-12-31 08:56:49.907827','24','《天下粮田》带给我们什么启示环境查看环境查看',2,'[{\"changed\": {\"fields\": [\"Content\"]}}]',8,1),(38,'2019-12-31 08:57:18.200660','24','《天下粮田》带给我们什么启示环境查看环境查看',2,'[{\"changed\": {\"fields\": [\"Content\"]}}]',8,1),(39,'2020-01-02 00:28:27.996527','24','《天下粮田》带给我们什么启示环境查看环境查看',2,'[]',8,1),(40,'2020-01-02 00:28:45.333609','1','111111',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]',8,1),(41,'2020-01-02 00:34:36.274630','24','《天下粮田》带给我们什么启示环境查看环境查看',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]',8,1),(42,'2020-01-02 01:36:17.126738','1','111111',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]',8,1),(43,'2020-01-02 01:37:27.066516','1','111111',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]',8,1),(44,'2020-01-02 01:38:01.304951','1','111111',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]',8,1),(45,'2020-01-02 01:41:40.451592','1','111111',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]',8,1),(46,'2020-01-02 01:42:51.959715','1','111111',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]',8,1),(47,'2020-01-02 02:16:19.313149','1','111111',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]',8,1),(48,'2020-01-02 02:25:14.054709','1','111111',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]',8,1),(49,'2020-01-02 02:34:13.657868','24','《天下粮田》带给我们什么启示环境查看环境查看',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]',8,1),(50,'2020-01-02 03:28:56.920986','1','111111',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]',8,1),(51,'2020-01-02 03:37:11.639738','24','《天下粮田》带给我们什么启示环境查看环境查看',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]',8,1),(52,'2020-01-02 04:32:57.138118','1','使用kubeadm安装kubernetes_v1.17.x',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u6807\\u9898\", \"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]',8,1),(53,'2020-01-02 04:40:24.789538','23','css样式之a标签',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]',8,1),(54,'2020-01-02 04:42:16.772423','24','《天下粮田》带给我们什么启示环境查看环境查看',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\", \"\\u9605\\u8bfb\\u91cf\"]}}]',8,1),(55,'2020-01-02 04:42:38.434531','1','使用kubeadm安装kubernetes_v1.17.x',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]',8,1),(56,'2020-01-02 04:52:24.392181','24','《天下粮田》带给我们什么启示环境查看环境查看',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]',8,1),(57,'2020-01-02 05:11:29.023764','1','使用kubeadm安装kubernetes_v1.17.x',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]',8,1),(58,'2020-01-02 05:12:34.982430','1','使用kubeadm安装kubernetes_v1.17.x',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\", \"\\u9605\\u8bfb\\u91cf\"]}}]',8,1),(59,'2020-01-02 05:14:30.656235','1','使用kubeadm安装kubernetes_v1.17.x',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\", \"\\u9605\\u8bfb\\u91cf\"]}}]',8,1),(60,'2020-01-02 05:14:58.557080','1','使用kubeadm安装kubernetes_v1.17.x',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\", \"\\u9605\\u8bfb\\u91cf\"]}}]',8,1),(61,'2020-01-02 05:18:19.095680','1','使用kubeadm安装kubernetes_v1.17.x',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]',8,1),(62,'2020-01-02 05:20:24.087580','1','使用kubeadm安装kubernetes_v1.17.x',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]',8,1),(63,'2020-01-02 05:21:59.146671','1','使用kubeadm安装kubernetes_v1.17.x',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]',8,1),(64,'2020-01-02 05:24:10.698219','1','使用kubeadm安装kubernetes_v1.17.x',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]',8,1),(65,'2020-01-02 06:02:43.984799','1','使用kubeadm安装kubernetes_v1.17.x',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]',8,1),(66,'2020-01-02 06:04:04.395941','1','使用kubeadm安装kubernetes_v1.17.x',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]',8,1),(67,'2020-01-02 06:04:49.078172','1','使用kubeadm安装kubernetes_v1.17.x',2,'[]',8,1),(68,'2020-01-02 06:05:30.491424','1','使用kubeadm安装kubernetes_v1.17.x',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]',8,1),(69,'2020-01-02 06:07:49.713475','1','使用kubeadm安装kubernetes_v1.17.x',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]',8,1),(70,'2020-01-02 06:08:19.909422','1','使用kubeadm安装kubernetes_v1.17.x',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]',8,1),(71,'2020-01-02 06:12:12.223780','1','使用kubeadm安装kubernetes_v1.17.x',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]',8,1),(72,'2020-01-02 06:13:12.737019','1','使用kubeadm安装kubernetes_v1.17.x',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]',8,1),(73,'2020-01-02 06:18:05.349882','1','使用kubeadm安装kubernetes_v1.17.x',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]',8,1),(74,'2020-01-02 06:26:42.421801','1','使用kubeadm安装kubernetes_v1.17.x',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]',8,1),(75,'2020-01-02 07:15:36.924077','1','linux服务器运维',2,'[{\"changed\": {\"fields\": [\"\\u8bfe\\u7a0b\\u540d\\u79f0\", \"\\u7ec6\\u8282\\u8bf4\\u660e\", \"\\u9996\\u9875\\u56fe\\u7247\"]}}]',7,1),(76,'2020-01-02 07:16:28.324194','2','django3攻略',2,'[{\"changed\": {\"fields\": [\"\\u8bfe\\u7a0b\\u540d\\u79f0\", \"\\u7ec6\\u8282\\u8bf4\\u660e\", \"\\u9996\\u9875\\u56fe\\u7247\"]}}]',7,1),(77,'2020-01-02 07:23:04.842373','25','django3简介',1,'[{\"added\": {}}]',8,1),(78,'2020-01-02 07:23:35.130843','2','django3攻略',2,'[{\"changed\": {\"fields\": [\"\\u5bfc\\u822aurl\"]}}]',7,1),(79,'2020-01-02 07:23:55.969440','25','django3简介',2,'[]',8,1),(80,'2020-01-02 08:09:44.392781','24','《天下粮田》带给我们什么启示环境查看环境查看',2,'[{\"changed\": {\"fields\": [\"Order number\"]}}]',8,1),(81,'2020-01-02 08:10:12.258001','23','css样式之a标签',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\", \"Order number\"]}}]',8,1),(82,'2020-01-02 08:10:33.044678','22','3',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u6807\\u9898\", \"Order number\"]}}]',8,1),(83,'2020-01-02 08:11:14.968127','21','4',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u6807\\u9898\", \"Order number\"]}}]',8,1),(84,'2020-01-02 08:11:23.602756','20','svsvfvdsd',2,'[{\"changed\": {\"fields\": [\"Order number\"]}}]',8,1),(85,'2020-01-02 08:11:30.083618','20','4.1',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u6807\\u9898\"]}}]',8,1),(86,'2020-01-02 08:11:41.570054','19','5.0',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u6807\\u9898\", \"Order number\"]}}]',8,1),(87,'2020-01-02 08:11:51.501669','18','5.1',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u6807\\u9898\", \"Order number\"]}}]',8,1),(88,'2020-01-02 08:11:59.993025','17','5.2',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u6807\\u9898\", \"Order number\"]}}]',8,1),(89,'2020-01-02 08:12:10.443185','16','5.3',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u6807\\u9898\", \"Order number\"]}}]',8,1),(90,'2020-01-02 08:12:36.390680','15','CADSD SD',3,'',8,1),(91,'2020-01-02 08:12:36.392145','14','CASCSACAC',3,'',8,1),(92,'2020-01-02 08:12:36.393673','13','CAVCACA',3,'',8,1),(93,'2020-01-02 08:12:36.441308','12','ACACAC',3,'',8,1),(94,'2020-01-02 08:12:36.444205','11','ADWACAC',3,'',8,1),(95,'2020-01-02 08:12:36.454266','10','aWDWADWA',3,'',8,1),(96,'2020-01-02 08:12:36.460487','9','cdscsdc',3,'',8,1),(97,'2020-01-02 08:12:36.472239','8','csdcsdcdcd',3,'',8,1),(98,'2020-01-02 08:12:36.477957','7','cdscsdcsdc',3,'',8,1),(99,'2020-01-02 08:12:36.492040','6','csccdc',3,'',8,1),(100,'2020-01-02 08:12:36.500176','5','csdcsxdc',3,'',8,1),(101,'2020-01-02 08:12:36.515637','4','sdcscsdc',3,'',8,1),(102,'2020-01-02 08:12:36.520623','3','sadaca',3,'',8,1),(103,'2020-01-02 08:12:36.538358','2','adad',3,'',8,1),(104,'2020-01-02 08:12:59.368049','1','使用kubeadm安装kubernetes_v1.17.x',2,'[{\"changed\": {\"fields\": [\"Order number\"]}}]',8,1),(105,'2020-01-02 08:13:17.037032','22','1.3',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u6807\\u9898\"]}}]',8,1),(106,'2020-01-03 01:58:21.537920','1','使用kubeadm安装kubernetes_v1.17.x',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]',8,1),(107,'2020-01-03 02:00:29.657346','18','5.1',2,'[{\"changed\": {\"fields\": [\"Order number\"]}}]',8,1),(108,'2020-01-03 05:42:41.611298','23','css样式之a标签',2,'[{\"changed\": {\"fields\": [\"\\u6587\\u7ae0\\u5185\\u5bb9\"]}}]',8,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(8,'myeditor','article'),(7,'myeditor','topnav'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-12-26 02:05:51.695182'),(2,'auth','0001_initial','2019-12-26 02:05:51.890279'),(3,'admin','0001_initial','2019-12-26 02:05:52.161060'),(4,'admin','0002_logentry_remove_auto_add','2019-12-26 02:05:52.178725'),(5,'admin','0003_logentry_add_action_flag_choices','2019-12-26 02:05:52.188049'),(6,'contenttypes','0002_remove_content_type_name','2019-12-26 02:05:52.215079'),(7,'auth','0002_alter_permission_name_max_length','2019-12-26 02:05:52.224256'),(8,'auth','0003_alter_user_email_max_length','2019-12-26 02:05:52.238059'),(9,'auth','0004_alter_user_username_opts','2019-12-26 02:05:52.247266'),(10,'auth','0005_alter_user_last_login_null','2019-12-26 02:05:52.266064'),(11,'auth','0006_require_contenttypes_0002','2019-12-26 02:05:52.267731'),(12,'auth','0007_alter_validators_add_error_messages','2019-12-26 02:05:52.278921'),(13,'auth','0008_alter_user_username_max_length','2019-12-26 02:05:52.292607'),(14,'auth','0009_alter_user_last_name_max_length','2019-12-26 02:05:52.306034'),(15,'auth','0010_alter_group_name_max_length','2019-12-26 02:05:52.333642'),(16,'auth','0011_update_proxy_permissions','2019-12-26 02:05:52.341599'),(17,'myeditor','0001_initial','2019-12-26 02:05:52.360783'),(18,'sessions','0001_initial','2019-12-26 02:05:52.372901'),(19,'myeditor','0002_topnav_url','2019-12-26 02:43:15.834667'),(20,'myeditor','0003_auto_20200102_0712','2020-01-02 07:13:15.559403'),(21,'myeditor','0004_auto_20200102_0741','2020-01-02 07:42:03.096678'),(22,'myeditor','0005_article_order_number','2020-01-02 08:04:07.957931');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('mnnn3l9rowl1a5uu709854xd1lo6dfcd','M2U0Y2JiYWY2NTJjODVhZDgxNDVmZWI0MDQ4NmY5NWIwMzRjODdmMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlYTY0NzQ2MWMxOThiNTFmNTQzY2NlMTlkNWYwMTYxMWYzOGZlYWQ1In0=','2020-01-09 02:06:18.668783');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myeditor_article`
--

DROP TABLE IF EXISTS `myeditor_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myeditor_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(160) NOT NULL,
  `content` longtext NOT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `read` int(11) NOT NULL,
  `programa_id` int(11) NOT NULL,
  `order_number` decimal(4,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  KEY `myeditor_article_programa_id_05d4c653_fk_myeditor_topnav_id` (`programa_id`),
  CONSTRAINT `myeditor_article_programa_id_05d4c653_fk_myeditor_topnav_id` FOREIGN KEY (`programa_id`) REFERENCES `myeditor_topnav` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myeditor_article`
--

LOCK TABLES `myeditor_article` WRITE;
/*!40000 ALTER TABLE `myeditor_article` DISABLE KEYS */;
INSERT INTO `myeditor_article` VALUES (1,'使用kubeadm安装kubernetes_v1.17.x','## 使用kubeadm安装kubernetes_v1.17.x\r\n## 文档特点\r\n\r\n特点很好\r\n\r\n## 配置要求\r\n对于 Kubernetes 初学者，在搭建K8S集群时，推荐在阿里云或腾讯云采购如下配置：（您也可以使用自己的虚拟机、私有云等您最容易获得的 Linux 环境）\r\n\r\n- 至少2台 2核4G 的服务器\r\n- Cent OS 7.6\r\n\r\n安装后的软件版本为\r\n\r\n> - Kubernetes v1.17.x\r\n>   - calico 3.10.2\r\n>   - nginx-ingress 1.5.5\r\n> - Docker 18.09.7\r\n\r\n\r\n> ### 关于二进制安装\r\n> **kubeadm 是 Kubernetes 官方支持的安装方式，“二进制” 不是。本文档采用 kubernetes.io 官方推荐的 kubeadm 工具安装 kubernetes 集群。**\r\n\r\n![linux](http://192.168.117.131/static/img/1121.jpg)\r\n\r\n\r\n\r\nheader 1 | header 2 | 1112\r\n---|----|---- \r\nrow 1 col 1 | row 1 col 2 | 1212\r\nrow 2 col 1 | row 2 col 2 | 2323\r\n\r\n\r\n\r\n- [x] 我的任意节点 centos 版本在兼容列表中\r\n- [ ] 我的任意节点 CPU 内核数量大于等于 2\r\n- [ ] 我的任意节点 hostname 不是 - localhost，且不包含下划线、小数点、大写字母\r\n- [x] 我的任意节点都有固定的内网 IP 地址\r\n- [x] 我的任意节点上 Kubelet使用的 IP 地址 可互通（无需 NAT 映射），且没有防火墙、安全组隔离\r\n- [x] 我的任意节点不会直接使用 docker run 或 docker-compose 运行容器\r\n\r\n\r\n> <font color=\"#4590a3\" size=\"3px\">整理不易，感谢赞助支持：</font>\r\n\r\n<img src=\"/static/img/jishujiaoliu.png\"  style=\"width:226px; height:290px;\"/>\r\n<img src=\"/static/img/weixinshoukuan.png\" style=\"width:226px; height:290px;\"/>','2019-12-26 05:05:29.000000',268,1,10.10),(16,'5.3','<p>Cscsxca</p>','2019-12-27 00:08:12.000000',28,1,5.30),(17,'5.2','<p>sadvsdvsdac</p>','2019-12-27 00:08:20.000000',16,1,5.20),(18,'5.1','<p>vsdvscscsdv</p>','2019-12-27 00:08:28.000000',18,1,0.00),(19,'5.0','<p>sdsds</p>','2019-12-27 00:12:17.000000',29,1,5.00),(20,'4.1','<p>sdsdvcsdse</p>','2019-12-27 00:12:28.000000',21,1,4.10),(21,'4','<p>sxdcsdcv</p>','2019-12-27 00:12:38.000000',34,1,4.00),(22,'1.3','<p>vcsdcsc</p>','2019-12-27 00:12:46.000000',16,1,1.30),(23,'css样式之a标签','111','2019-12-27 03:00:26.000000',17,1,1.10),(24,'《天下粮田》带给我们什么启示环境查看环境查看','# 使用kubeadm安装kubernetes_v1.17.x\r\n## 文档特点\r\n\r\n特点很好\r\n\r\n## 配置要求\r\n对于 Kubernetes 初学者，在搭建K8S集群时，推荐在阿里云或腾讯云采购如下配置：（您也可以使用自己的虚拟机、私有云等您最容易获得的 Linux 环境）\r\n\r\n- 至少2台 2核4G 的服务器\r\n- Cent OS 7.6\r\n\r\n安装后的软件版本为\r\n\r\n> - Kubernetes v1.17.x\r\n>   - calico 3.10.2\r\n>   - nginx-ingress 1.5.5\r\n> - Docker 18.09.7\r\n\r\n\r\n> ### 关于二进制安装\r\n> **kubeadm 是 Kubernetes 官方支持的安装方式，“二进制” 不是。本文档采用 kubernetes.io 官方推荐的 kubeadm 工具安装 kubernetes 集群。**\r\n\r\n![linux](http://192.168.117.131/static/img/1121.jpg)\r\n\r\n\r\n\r\nheader 1 | header 2 | 1112\r\n---|----|---- \r\nrow 1 col 1 | row 1 col 2 | 1212\r\nrow 2 col 1 | row 2 col 2 | 2323\r\n\r\n\r\n\r\n- [x] 我的任意节点 centos 版本在兼容列表中\r\n- [ ] 我的任意节点 CPU 内核数量大于等于 2\r\n- [ ] 我的任意节点 hostname 不是 - localhost，且不包含下划线、小数点、大写字母\r\n- [x] 我的任意节点都有固定的内网 IP 地址\r\n- [x] 我的任意节点上 Kubelet使用的 IP 地址 可互通（无需 NAT 映射），且没有防火墙、安全组隔离\r\n- [x] 我的任意节点不会直接使用 docker run 或 docker-compose 运行容器\r\n\r\n![linux](http://pub.idqqimg.com/wpa/images/group.png)\r\n<a target=\"_blank\" href=\"//shang.qq.com/wpa/qunwpa?idkey=a16b0a61267e72ccae32d265d239661e508b581ad20a6d304724d1af23d47182\"><img border=\"0\" src=\"//pub.idqqimg.com/wpa/images/group.png\" alt=\"技术交流\" title=\"技术交流\"></a>','2019-12-27 07:57:08.000000',86,1,1.00),(25,'django3简介','##创建一个管理员账号\r\n\r\n用浏览器打开 http://127.0.0.1:8000/admin/ ，你应该会看见管理员登录界面。现在，试着使用你在上一步中创建的超级用户来登录。然后你将会看到 Django 管理页面的索引页。你将会看到几种可编辑的内容：组和用户。它们是由 django.contrib.auth 提供的，这是 Django 开发的认证框架。\r\n\r\n\r\n\r\n作者：BlueJack\r\n链接：https://www.jianshu.com/p/c9255823d3d9\r\n来源：简书\r\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。','2020-01-02 07:23:03.000000',4,2,0.00);
/*!40000 ALTER TABLE `myeditor_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myeditor_topnav`
--

DROP TABLE IF EXISTS `myeditor_topnav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myeditor_topnav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `url` varchar(60) NOT NULL,
  `detail` varchar(360) NOT NULL,
  `img` varchar(100) NOT NULL,
  `lang_name` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myeditor_topnav`
--

LOCK TABLES `myeditor_topnav` WRITE;
/*!40000 ALTER TABLE `myeditor_topnav` DISABLE KEYS */;
INSERT INTO `myeditor_topnav` VALUES (1,'linux服务器运维','linux','针对各个阶段的读者，可以从0开始学习linux技术，也可也直接查看高级阶段的内容。','assetinfo/1121.jpg','Linux服务器运维教程攻略'),(2,'django3攻略','django3','django3是python的web開發框架，因為其整合了豐富的功能，拿來即用，可以用來快速開發項目，不必重複製造輪子。','assetinfo/django3.jpg','django3教程');
/*!40000 ALTER TABLE `myeditor_topnav` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-03 13:47:58
