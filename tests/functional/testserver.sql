-- MySQL dump 10.13  Distrib 5.1.49, for debian-linux-gnu (i486)
--
-- Host: localhost    Database: ojs_dev
-- ------------------------------------------------------
-- Server version	5.1.49-3

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
-- Table structure for table `access_keys`
--

DROP TABLE IF EXISTS `access_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_keys` (
  `access_key_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context` varchar(40) NOT NULL,
  `key_hash` varchar(40) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `expiry_date` datetime NOT NULL,
  PRIMARY KEY (`access_key_id`),
  KEY `access_keys_hash` (`key_hash`,`user_id`,`context`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_keys`
--

LOCK TABLES `access_keys` WRITE;
/*!40000 ALTER TABLE `access_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `access_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement_settings`
--

DROP TABLE IF EXISTS `announcement_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcement_settings` (
  `announcement_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `announcement_settings_pkey` (`announcement_id`,`locale`,`setting_name`),
  KEY `announcement_settings_announcement_id` (`announcement_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement_settings`
--

LOCK TABLES `announcement_settings` WRITE;
/*!40000 ALTER TABLE `announcement_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement_type_settings`
--

DROP TABLE IF EXISTS `announcement_type_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcement_type_settings` (
  `type_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `announcement_type_settings_pkey` (`type_id`,`locale`,`setting_name`),
  KEY `announcement_type_settings_type_id` (`type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement_type_settings`
--

LOCK TABLES `announcement_type_settings` WRITE;
/*!40000 ALTER TABLE `announcement_type_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement_type_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement_types`
--

DROP TABLE IF EXISTS `announcement_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcement_types` (
  `type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` smallint(6) DEFAULT NULL,
  `assoc_id` bigint(20) NOT NULL,
  PRIMARY KEY (`type_id`),
  KEY `announcement_types_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement_types`
--

LOCK TABLES `announcement_types` WRITE;
/*!40000 ALTER TABLE `announcement_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `announcement_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` smallint(6) DEFAULT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `date_expire` datetime DEFAULT NULL,
  `date_posted` datetime NOT NULL,
  PRIMARY KEY (`announcement_id`),
  KEY `announcements_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_comments`
--

DROP TABLE IF EXISTS `article_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_comments` (
  `comment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment_type` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) NOT NULL,
  `article_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `comment_title` varchar(255) NOT NULL,
  `comments` text,
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `viewable` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `article_comments_article_id` (`article_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_comments`
--

LOCK TABLES `article_comments` WRITE;
/*!40000 ALTER TABLE `article_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_email_log`
--

DROP TABLE IF EXISTS `article_email_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_email_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `article_id` bigint(20) NOT NULL,
  `sender_id` bigint(20) NOT NULL,
  `date_sent` datetime NOT NULL,
  `ip_address` varchar(15) DEFAULT NULL,
  `event_type` bigint(20) DEFAULT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `from_address` varchar(255) DEFAULT NULL,
  `recipients` text,
  `cc_recipients` text,
  `bcc_recipients` text,
  `subject` varchar(255) DEFAULT NULL,
  `body` text,
  PRIMARY KEY (`log_id`),
  KEY `article_email_log_article_id` (`article_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_email_log`
--

LOCK TABLES `article_email_log` WRITE;
/*!40000 ALTER TABLE `article_email_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_email_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_event_log`
--

DROP TABLE IF EXISTS `article_event_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_event_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `article_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_logged` datetime NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `log_level` varchar(1) DEFAULT NULL,
  `event_type` bigint(20) DEFAULT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `message` text,
  PRIMARY KEY (`log_id`),
  KEY `article_event_log_article_id` (`article_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_event_log`
--

LOCK TABLES `article_event_log` WRITE;
/*!40000 ALTER TABLE `article_event_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_event_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_files`
--

DROP TABLE IF EXISTS `article_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_files` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `revision` bigint(20) NOT NULL,
  `source_file_id` bigint(20) DEFAULT NULL,
  `source_revision` bigint(20) DEFAULT NULL,
  `article_id` bigint(20) NOT NULL,
  `file_name` varchar(90) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `file_stage` bigint(20) NOT NULL,
  `viewable` tinyint(4) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `round` tinyint(4) NOT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`file_id`,`revision`),
  KEY `article_files_article_id` (`article_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_files`
--

LOCK TABLES `article_files` WRITE;
/*!40000 ALTER TABLE `article_files` DISABLE KEYS */;
INSERT INTO `article_files` VALUES (1,1,NULL,NULL,1,'1-1-1-PB.pdf','application/pdf',15951,'DOI Test Galley.pdf',7,NULL,'2011-10-17 20:28:22','2011-10-17 20:28:22',1,NULL),(2,1,NULL,NULL,1,'1-2-1-SP.pdf','application/pdf',15951,'DOI Test Galley.pdf',6,NULL,'2011-10-17 20:28:52','2011-10-17 20:28:52',1,NULL),(3,1,NULL,NULL,1,'1-3-1-PB.pdf','application/pdf',15951,'DOI Test Galley.pdf',7,NULL,'2011-11-14 19:28:37','2011-11-14 19:28:37',1,NULL),(4,1,NULL,NULL,1,'1-4-1-PB.htm','text/html',4170,'onix-codelist-1.htm',7,NULL,'2011-11-14 19:29:54','2011-11-14 19:29:54',1,NULL);
/*!40000 ALTER TABLE `article_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_galley_settings`
--

DROP TABLE IF EXISTS `article_galley_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_galley_settings` (
  `galley_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `article_galley_settings_pkey` (`galley_id`,`locale`,`setting_name`),
  KEY `article_galley_settings_galley_id` (`galley_id`),
  KEY `article_galley_settings_name_value` (`setting_name`(50),`setting_value`(150))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_galley_settings`
--

LOCK TABLES `article_galley_settings` WRITE;
/*!40000 ALTER TABLE `article_galley_settings` DISABLE KEYS */;
INSERT INTO `article_galley_settings` VALUES (1,'','pub-id::publisher-id','','string'),(1,'','doiSuffix','custom_galley_doi','string'),(1,'','pub-id::doi','10.1234/t.v1i1.1.g1','string'),(1,'','pub-id::other::urn','urn:nbn:de:0000-t.v1i1.1.g17','string'),(2,'','pub-id::doi','10.1234/t.v1i1.1.g2','string'),(2,'','pub-id::other::urn','urn:nbn:de:0000-t.v1i1.1.g20','string'),(3,'','pub-id::doi','10.1234/t.v1i1.1.g3','string'),(3,'','pub-id::other::urn','urn:nbn:de:0000-t.v1i1.1.g36','string');
/*!40000 ALTER TABLE `article_galley_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_galleys`
--

DROP TABLE IF EXISTS `article_galleys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_galleys` (
  `galley_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `locale` varchar(5) DEFAULT NULL,
  `article_id` bigint(20) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `label` varchar(32) DEFAULT NULL,
  `html_galley` tinyint(4) NOT NULL,
  `style_file_id` bigint(20) DEFAULT NULL,
  `seq` double NOT NULL,
  `views` int(11) NOT NULL,
  `remote_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`galley_id`),
  KEY `article_galleys_article_id` (`article_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_galleys`
--

LOCK TABLES `article_galleys` WRITE;
/*!40000 ALTER TABLE `article_galleys` DISABLE KEYS */;
INSERT INTO `article_galleys` VALUES (1,'en_US',1,1,'PDF',0,NULL,0,0,NULL),(2,'de_DE',1,3,'PDF',0,NULL,1,0,NULL),(3,'en_US',1,4,'HTML',1,0,3,4,NULL);
/*!40000 ALTER TABLE `article_galleys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_html_galley_images`
--

DROP TABLE IF EXISTS `article_html_galley_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_html_galley_images` (
  `galley_id` bigint(20) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  UNIQUE KEY `article_html_galley_images_pkey` (`galley_id`,`file_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_html_galley_images`
--

LOCK TABLES `article_html_galley_images` WRITE;
/*!40000 ALTER TABLE `article_html_galley_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_html_galley_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_notes`
--

DROP TABLE IF EXISTS `article_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_notes` (
  `note_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `article_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `title` varchar(255) NOT NULL,
  `note` text,
  `file_id` bigint(20) NOT NULL,
  PRIMARY KEY (`note_id`),
  KEY `article_notes_article_id` (`article_id`),
  KEY `article_notes_user_id` (`user_id`),
  KEY `article_notes_file_id` (`file_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_notes`
--

LOCK TABLES `article_notes` WRITE;
/*!40000 ALTER TABLE `article_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_search_keyword_list`
--

DROP TABLE IF EXISTS `article_search_keyword_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_search_keyword_list` (
  `keyword_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `keyword_text` varchar(60) NOT NULL,
  PRIMARY KEY (`keyword_id`),
  UNIQUE KEY `article_search_keyword_text` (`keyword_text`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_search_keyword_list`
--

LOCK TABLES `article_search_keyword_list` WRITE;
/*!40000 ALTER TABLE `article_search_keyword_list` DISABLE KEYS */;
INSERT INTO `article_search_keyword_list` VALUES (1,'doi'),(2,'tester'),(3,'test'),(4,'submission'),(5,'untitled'),(6,'article'),(7,'supp'),(8,'file'),(9,'affiliation'),(10,'bio'),(11,'statement'),(12,'22a10'),(13,'general'),(14,'topological'),(15,'groups'),(16,'institution'),(17,'angaben'),(18,'zum'),(19,'lebenslauf'),(20,'generelle'),(21,'topologische'),(22,'gruppen'),(23,'testartikel'),(24,'ein'),(25,'artikel'),(26,'testen'),(27,'von'),(28,'dois'),(29,'suppfile'),(30,'creator'),(31,'subject'),(32,'description');
/*!40000 ALTER TABLE `article_search_keyword_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_search_object_keywords`
--

DROP TABLE IF EXISTS `article_search_object_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_search_object_keywords` (
  `object_id` bigint(20) NOT NULL,
  `keyword_id` bigint(20) NOT NULL,
  `pos` int(11) NOT NULL,
  UNIQUE KEY `article_search_object_keywords_pkey` (`object_id`,`pos`),
  KEY `article_search_object_keywords_keyword_id` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_search_object_keywords`
--

LOCK TABLES `article_search_object_keywords` WRITE;
/*!40000 ALTER TABLE `article_search_object_keywords` DISABLE KEYS */;
INSERT INTO `article_search_object_keywords` VALUES (1,1,0),(1,2,1),(2,1,0),(2,3,1),(3,1,0),(3,3,1),(3,4,2),(8,7,7),(9,1,0),(9,2,1),(10,1,0),(10,3,1),(10,6,2),(11,1,0),(11,3,1),(11,6,2),(16,1,0),(16,2,1),(17,1,0),(17,3,1),(18,1,0),(18,3,1),(18,4,2),(23,1,0),(23,2,1),(24,1,0),(24,3,1),(25,1,0),(25,3,1),(25,4,2),(8,8,8),(8,32,9),(30,1,0),(30,2,1),(31,1,0),(31,3,1),(32,1,0),(32,3,1),(32,4,2),(37,1,0),(37,2,1),(38,1,0),(38,3,1),(39,1,0),(39,3,1),(39,4,2),(44,1,0),(44,2,1),(45,1,0),(45,3,1),(46,1,0),(46,3,1),(46,4,2),(51,1,0),(51,2,1),(52,1,0),(52,3,1),(53,1,0),(53,3,1),(53,4,2),(58,1,0),(58,2,1),(59,1,0),(59,3,1),(60,1,0),(60,3,1),(60,4,2),(65,1,0),(65,2,1),(66,1,0),(66,3,1),(67,1,0),(67,3,1),(67,4,2),(72,1,0),(72,2,1),(73,1,0),(73,3,1),(74,1,0),(74,3,1),(74,4,2),(79,1,0),(79,2,1),(79,9,2),(79,10,3),(79,11,4),(80,1,0),(80,3,1),(81,1,0),(81,3,1),(81,4,2),(83,12,0),(83,13,1),(83,14,2),(83,15,3),(86,1,0),(86,2,1),(86,16,2),(86,9,3),(86,17,4),(86,18,5),(86,19,6),(86,10,7),(86,11,8),(87,1,0),(87,3,1),(88,1,0),(88,3,1),(88,4,2),(90,12,0),(90,12,1),(90,13,2),(90,14,3),(90,15,4),(90,20,5),(90,21,6),(90,22,7),(93,1,0),(93,2,1),(93,16,2),(93,9,3),(93,17,4),(93,18,5),(93,19,6),(93,10,7),(93,11,8),(94,1,0),(94,3,1),(94,1,2),(94,23,3),(95,1,0),(95,3,1),(95,4,2),(95,24,3),(95,25,4),(95,18,5),(95,26,6),(95,27,7),(95,28,8),(97,12,0),(97,12,1),(97,13,2),(97,14,3),(97,15,4),(97,20,5),(97,21,6),(97,22,7),(100,1,0),(100,2,1),(100,16,2),(100,9,3),(100,17,4),(100,18,5),(100,19,6),(100,10,7),(100,11,8),(101,1,0),(101,23,1),(101,1,2),(101,3,3),(102,24,0),(102,25,1),(102,18,2),(102,26,3),(102,27,4),(102,28,5),(102,1,6),(102,3,7),(102,4,8),(104,12,0),(104,12,1),(104,20,2),(104,21,3),(104,22,4),(104,13,5),(104,14,6),(104,15,7),(107,1,0),(107,2,1),(107,16,2),(107,9,3),(107,17,4),(107,18,5),(107,19,6),(107,10,7),(107,11,8),(108,1,0),(108,23,1),(108,1,2),(108,3,3),(109,24,0),(109,25,1),(109,18,2),(109,26,3),(109,27,4),(109,28,5),(109,1,6),(109,3,7),(109,4,8),(111,12,0),(111,12,1),(111,20,2),(111,21,3),(111,22,4),(111,13,5),(111,14,6),(111,15,7),(8,31,6),(8,29,5),(8,30,4),(8,29,3),(8,8,2),(8,7,1),(8,3,0),(114,1,0),(114,2,1),(114,16,2),(114,9,3),(114,17,4),(114,18,5),(114,19,6),(114,10,7),(114,11,8),(115,1,0),(115,23,1),(115,1,2),(115,3,3),(116,24,0),(116,25,1),(116,18,2),(116,26,3),(116,27,4),(116,28,5),(116,1,6),(116,3,7),(116,4,8),(118,12,0),(118,12,1),(118,20,2),(118,21,3),(118,22,4),(118,13,5),(118,14,6),(118,15,7),(121,1,0),(121,2,1),(121,16,2),(121,9,3),(121,17,4),(121,18,5),(121,19,6),(121,10,7),(121,11,8),(122,1,0),(122,23,1),(122,1,2),(122,3,3),(123,24,0),(123,25,1),(123,18,2),(123,26,3),(123,27,4),(123,28,5),(123,1,6),(123,3,7),(123,4,8),(125,12,0),(125,12,1),(125,20,2),(125,21,3),(125,22,4),(125,13,5),(125,14,6),(125,15,7),(128,1,0),(128,2,1),(128,16,2),(128,9,3),(128,17,4),(128,18,5),(128,19,6),(128,10,7),(128,11,8),(129,1,0),(129,23,1),(129,1,2),(129,3,3),(130,24,0),(130,25,1),(130,18,2),(130,26,3),(130,27,4),(130,28,5),(130,1,6),(130,3,7),(130,4,8),(132,12,0),(132,12,1),(132,20,2),(132,21,3),(132,22,4),(132,13,5),(132,14,6),(132,15,7),(135,1,0),(135,2,1),(135,16,2),(135,9,3),(135,17,4),(135,18,5),(135,19,6),(135,10,7),(135,11,8),(136,1,0),(136,23,1),(136,1,2),(136,3,3),(137,24,0),(137,25,1),(137,18,2),(137,26,3),(137,27,4),(137,28,5),(137,1,6),(137,3,7),(137,4,8),(139,12,0),(139,12,1),(139,20,2),(139,21,3),(139,22,4),(139,13,5),(139,14,6),(139,15,7),(142,1,0),(142,2,1),(142,16,2),(142,9,3),(142,17,4),(142,18,5),(142,19,6),(142,10,7),(142,11,8),(143,1,0),(143,23,1),(143,1,2),(143,3,3),(144,24,0),(144,25,1),(144,18,2),(144,26,3),(144,27,4),(144,28,5),(144,1,6),(144,3,7),(144,4,8),(146,12,0),(146,12,1),(146,20,2),(146,21,3),(146,22,4),(146,13,5),(146,14,6),(146,15,7),(149,1,0),(149,2,1),(149,16,2),(149,9,3),(149,17,4),(149,18,5),(149,19,6),(149,10,7),(149,11,8),(150,1,0),(150,23,1),(150,1,2),(150,3,3),(151,24,0),(151,25,1),(151,18,2),(151,26,3),(151,27,4),(151,28,5),(151,1,6),(151,3,7),(151,4,8),(153,12,0),(153,12,1),(153,20,2),(153,21,3),(153,22,4),(153,13,5),(153,14,6),(153,15,7),(156,1,0),(156,2,1),(156,16,2),(156,9,3),(156,17,4),(156,18,5),(156,19,6),(156,10,7),(156,11,8),(157,1,0),(157,23,1),(157,1,2),(157,3,3),(158,24,0),(158,25,1),(158,18,2),(158,26,3),(158,27,4),(158,28,5),(158,1,6),(158,3,7),(158,4,8),(160,12,0),(160,12,1),(160,20,2),(160,21,3),(160,22,4),(160,13,5),(160,14,6),(160,15,7),(163,1,0),(163,2,1),(163,16,2),(163,9,3),(163,17,4),(163,18,5),(163,19,6),(163,10,7),(163,11,8),(164,1,0),(164,23,1),(164,1,2),(164,3,3),(165,24,0),(165,25,1),(165,18,2),(165,26,3),(165,27,4),(165,28,5),(165,1,6),(165,3,7),(165,4,8),(167,12,0),(167,12,1),(167,20,2),(167,21,3),(167,22,4),(167,13,5),(167,14,6),(167,15,7),(170,1,0),(170,2,1),(170,16,2),(170,9,3),(170,17,4),(170,18,5),(170,19,6),(170,10,7),(170,11,8),(171,1,0),(171,23,1),(171,1,2),(171,3,3),(172,24,0),(172,25,1),(172,18,2),(172,26,3),(172,27,4),(172,28,5),(172,1,6),(172,3,7),(172,4,8),(174,12,0),(174,12,1),(174,20,2),(174,21,3),(174,22,4),(174,13,5),(174,14,6),(174,15,7),(177,1,0),(177,2,1),(177,16,2),(177,9,3),(177,17,4),(177,18,5),(177,19,6),(177,10,7),(177,11,8),(178,1,0),(178,23,1),(178,1,2),(178,3,3),(179,24,0),(179,25,1),(179,18,2),(179,26,3),(179,27,4),(179,28,5),(179,1,6),(179,3,7),(179,4,8),(181,12,0),(181,12,1),(181,20,2),(181,21,3),(181,22,4),(181,13,5),(181,14,6),(181,15,7),(184,1,0),(184,2,1),(184,16,2),(184,9,3),(184,17,4),(184,18,5),(184,19,6),(184,10,7),(184,11,8),(185,1,0),(185,23,1),(185,1,2),(185,3,3),(186,24,0),(186,25,1),(186,18,2),(186,26,3),(186,27,4),(186,28,5),(186,1,6),(186,3,7),(186,4,8),(188,12,0),(188,12,1),(188,20,2),(188,21,3),(188,22,4),(188,13,5),(188,14,6),(188,15,7),(191,1,0),(191,2,1),(191,16,2),(191,9,3),(191,17,4),(191,18,5),(191,19,6),(191,10,7),(191,11,8),(192,1,0),(192,23,1),(192,1,2),(192,3,3),(193,24,0),(193,25,1),(193,18,2),(193,26,3),(193,27,4),(193,28,5),(193,1,6),(193,3,7),(193,4,8),(195,12,0),(195,12,1),(195,20,2),(195,21,3),(195,22,4),(195,13,5),(195,14,6),(195,15,7),(198,1,0),(198,2,1),(198,16,2),(198,9,3),(198,17,4),(198,18,5),(198,19,6),(198,10,7),(198,11,8),(199,1,0),(199,23,1),(199,1,2),(199,3,3),(200,24,0),(200,25,1),(200,18,2),(200,26,3),(200,27,4),(200,28,5),(200,1,6),(200,3,7),(200,4,8),(202,12,0),(202,12,1),(202,20,2),(202,21,3),(202,22,4),(202,13,5),(202,14,6),(202,15,7);
/*!40000 ALTER TABLE `article_search_object_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_search_objects`
--

DROP TABLE IF EXISTS `article_search_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_search_objects` (
  `object_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `article_id` bigint(20) NOT NULL,
  `type` int(11) NOT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`object_id`)
) ENGINE=MyISAM AUTO_INCREMENT=205 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_search_objects`
--

LOCK TABLES `article_search_objects` WRITE;
/*!40000 ALTER TABLE `article_search_objects` DISABLE KEYS */;
INSERT INTO `article_search_objects` VALUES (1,1,1,0),(2,1,2,0),(3,1,4,0),(4,1,8,0),(5,1,16,0),(6,1,32,0),(7,1,64,0),(8,1,256,2),(9,2,1,0),(10,2,2,0),(11,2,4,0),(12,2,8,0),(13,2,16,0),(14,2,32,0),(15,2,64,0),(16,1,1,0),(17,1,2,0),(18,1,4,0),(19,1,8,0),(20,1,16,0),(21,1,32,0),(22,1,64,0),(23,1,1,0),(24,1,2,0),(25,1,4,0),(26,1,8,0),(27,1,16,0),(28,1,32,0),(29,1,64,0),(30,1,1,0),(31,1,2,0),(32,1,4,0),(33,1,8,0),(34,1,16,0),(35,1,32,0),(36,1,64,0),(37,1,1,0),(38,1,2,0),(39,1,4,0),(40,1,8,0),(41,1,16,0),(42,1,32,0),(43,1,64,0),(44,1,1,0),(45,1,2,0),(46,1,4,0),(47,1,8,0),(48,1,16,0),(49,1,32,0),(50,1,64,0),(51,1,1,0),(52,1,2,0),(53,1,4,0),(54,1,8,0),(55,1,16,0),(56,1,32,0),(57,1,64,0),(58,1,1,0),(59,1,2,0),(60,1,4,0),(61,1,8,0),(62,1,16,0),(63,1,32,0),(64,1,64,0),(65,1,1,0),(66,1,2,0),(67,1,4,0),(68,1,8,0),(69,1,16,0),(70,1,32,0),(71,1,64,0),(72,1,1,0),(73,1,2,0),(74,1,4,0),(75,1,8,0),(76,1,16,0),(77,1,32,0),(78,1,64,0),(79,1,1,0),(80,1,2,0),(81,1,4,0),(82,1,8,0),(83,1,16,0),(84,1,32,0),(85,1,64,0),(86,1,1,0),(87,1,2,0),(88,1,4,0),(89,1,8,0),(90,1,16,0),(91,1,32,0),(92,1,64,0),(93,1,1,0),(94,1,2,0),(95,1,4,0),(96,1,8,0),(97,1,16,0),(98,1,32,0),(99,1,64,0),(100,1,1,0),(101,1,2,0),(102,1,4,0),(103,1,8,0),(104,1,16,0),(105,1,32,0),(106,1,64,0),(107,1,1,0),(108,1,2,0),(109,1,4,0),(110,1,8,0),(111,1,16,0),(112,1,32,0),(113,1,64,0),(114,1,1,0),(115,1,2,0),(116,1,4,0),(117,1,8,0),(118,1,16,0),(119,1,32,0),(120,1,64,0),(121,1,1,0),(122,1,2,0),(123,1,4,0),(124,1,8,0),(125,1,16,0),(126,1,32,0),(127,1,64,0),(128,1,1,0),(129,1,2,0),(130,1,4,0),(131,1,8,0),(132,1,16,0),(133,1,32,0),(134,1,64,0),(135,1,1,0),(136,1,2,0),(137,1,4,0),(138,1,8,0),(139,1,16,0),(140,1,32,0),(141,1,64,0),(142,1,1,0),(143,1,2,0),(144,1,4,0),(145,1,8,0),(146,1,16,0),(147,1,32,0),(148,1,64,0),(149,1,1,0),(150,1,2,0),(151,1,4,0),(152,1,8,0),(153,1,16,0),(154,1,32,0),(155,1,64,0),(156,1,1,0),(157,1,2,0),(158,1,4,0),(159,1,8,0),(160,1,16,0),(161,1,32,0),(162,1,64,0),(163,1,1,0),(164,1,2,0),(165,1,4,0),(166,1,8,0),(167,1,16,0),(168,1,32,0),(169,1,64,0),(170,1,1,0),(171,1,2,0),(172,1,4,0),(173,1,8,0),(174,1,16,0),(175,1,32,0),(176,1,64,0),(177,1,1,0),(178,1,2,0),(179,1,4,0),(180,1,8,0),(181,1,16,0),(182,1,32,0),(183,1,64,0),(184,1,1,0),(185,1,2,0),(186,1,4,0),(187,1,8,0),(188,1,16,0),(189,1,32,0),(190,1,64,0),(191,1,1,0),(192,1,2,0),(193,1,4,0),(194,1,8,0),(195,1,16,0),(196,1,32,0),(197,1,64,0),(198,1,1,0),(199,1,2,0),(200,1,4,0),(201,1,8,0),(202,1,16,0),(203,1,32,0),(204,1,64,0);
/*!40000 ALTER TABLE `article_search_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_settings`
--

DROP TABLE IF EXISTS `article_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_settings` (
  `article_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `article_settings_pkey` (`article_id`,`locale`,`setting_name`),
  KEY `article_settings_article_id` (`article_id`),
  KEY `article_settings_name_value` (`setting_name`(50),`setting_value`(150))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_settings`
--

LOCK TABLES `article_settings` WRITE;
/*!40000 ALTER TABLE `article_settings` DISABLE KEYS */;
INSERT INTO `article_settings` VALUES (1,'en_US','title','DOI Test','string'),(1,'en_US','cleanTitle','DOI Test','string'),(1,'en_US','abstract','DOI Test Submission','string'),(1,'en_US','sponsor','','string'),(1,'en_US','coverPageAltText','','string'),(1,'','pub-id::publisher-id','','string'),(2,'en_US','title','DOI Test - Second Article','string'),(2,'en_US','cleanTitle','DOI Test  Second Article','string'),(2,'en_US','abstract','DOI Test Second Article','string'),(2,'en_US','sponsor','','string'),(1,'en_US','showCoverPage','0','int'),(1,'en_US','hideCoverPageToc','0','int'),(1,'en_US','hideCoverPageAbstract','0','int'),(1,'','doiSuffix','custom_article_doi','string'),(1,'en_US','subjectClass','22A10','string'),(1,'en_US','subject','general topological groups','string'),(1,'de_DE','title','DOI Testartikel','string'),(1,'de_DE','cleanTitle','DOI Testartikel','string'),(1,'de_DE','abstract','Ein Artikel zum Testen von DOIs','string'),(1,'de_DE','coverPageAltText','','string'),(1,'de_DE','showCoverPage','0','int'),(1,'de_DE','hideCoverPageToc','0','int'),(1,'de_DE','hideCoverPageAbstract','0','int'),(1,'de_DE','subjectClass','22A10','string'),(1,'de_DE','subject','Generelle Topologische Gruppen','string'),(1,'de_DE','sponsor','','string'),(1,'','pub-id::doi','10.1234/t.v1i1.1','string'),(1,'','pub-id::other::urn','urn:nbn:de:0000-t.v1i1.18','string');
/*!40000 ALTER TABLE `article_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_supp_file_settings`
--

DROP TABLE IF EXISTS `article_supp_file_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_supp_file_settings` (
  `supp_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `article_supp_file_settings_pkey` (`supp_id`,`locale`,`setting_name`),
  KEY `article_supp_file_settings_supp_id` (`supp_id`),
  KEY `article_supp_file_settings_name_value` (`setting_name`(50),`setting_value`(150))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_supp_file_settings`
--

LOCK TABLES `article_supp_file_settings` WRITE;
/*!40000 ALTER TABLE `article_supp_file_settings` DISABLE KEYS */;
INSERT INTO `article_supp_file_settings` VALUES (1,'en_US','title','Test Supp File','string'),(1,'en_US','creator','Suppfile Creator','string'),(1,'en_US','subject','Suppfile Subject','string'),(1,'en_US','typeOther','','string'),(1,'en_US','description','supp file description','string'),(1,'en_US','publisher','Supp File Publisher','string'),(1,'en_US','sponsor','','string'),(1,'en_US','source','','string'),(1,'','pub-id::publisher-id','','string'),(1,'','doiSuffix','custom_suppfile_doi','string'),(1,'','pub-id::doi','10.1234/t.v1i1.1.s1','string'),(1,'','pub-id::other::urn','urn:nbn:de:0000-t.v1i1.1.s19','string');
/*!40000 ALTER TABLE `article_supp_file_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_supplementary_files`
--

DROP TABLE IF EXISTS `article_supplementary_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_supplementary_files` (
  `supp_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_id` bigint(20) NOT NULL,
  `article_id` bigint(20) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `show_reviewers` tinyint(4) DEFAULT NULL,
  `date_submitted` datetime NOT NULL,
  `seq` double NOT NULL,
  `remote_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`supp_id`),
  KEY `article_supplementary_files_file_id` (`file_id`),
  KEY `article_supplementary_files_article_id` (`article_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_supplementary_files`
--

LOCK TABLES `article_supplementary_files` WRITE;
/*!40000 ALTER TABLE `article_supplementary_files` DISABLE KEYS */;
INSERT INTO `article_supplementary_files` VALUES (1,2,1,'Research Instrument','pt','2011-10-01',0,'2011-10-02 20:28:52',0,NULL);
/*!40000 ALTER TABLE `article_supplementary_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_tombstone_settings`
--

DROP TABLE IF EXISTS `article_tombstone_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_tombstone_settings` (
  `tombstone_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `article_tombstone_settings_pkey` (`tombstone_id`,`locale`,`setting_name`),
  KEY `article_tombstone_settings_tombstone_id` (`tombstone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_tombstone_settings`
--

LOCK TABLES `article_tombstone_settings` WRITE;
/*!40000 ALTER TABLE `article_tombstone_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_tombstone_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_tombstones`
--

DROP TABLE IF EXISTS `article_tombstones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_tombstones` (
  `tombstone_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `article_id` bigint(20) NOT NULL,
  `date_deleted` datetime NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `section_id` bigint(20) NOT NULL,
  `set_spec` varchar(255) NOT NULL,
  `set_name` varchar(255) NOT NULL,
  `oai_identifier` varchar(255) NOT NULL,
  PRIMARY KEY (`tombstone_id`),
  KEY `article_tombstones_journal_id` (`journal_id`),
  KEY `article_tombstones_article_id` (`article_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_tombstones`
--

LOCK TABLES `article_tombstones` WRITE;
/*!40000 ALTER TABLE `article_tombstones` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_tombstones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_xml_galleys`
--

DROP TABLE IF EXISTS `article_xml_galleys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_xml_galleys` (
  `xml_galley_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `galley_id` bigint(20) NOT NULL,
  `article_id` bigint(20) NOT NULL,
  `label` varchar(32) NOT NULL,
  `galley_type` varchar(255) NOT NULL,
  `views` int(11) NOT NULL,
  PRIMARY KEY (`xml_galley_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_xml_galleys`
--

LOCK TABLES `article_xml_galleys` WRITE;
/*!40000 ALTER TABLE `article_xml_galleys` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_xml_galleys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `article_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `locale` varchar(5) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `section_id` bigint(20) DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `comments_to_ed` text,
  `citations` text,
  `date_submitted` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_status_modified` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `submission_progress` tinyint(4) NOT NULL,
  `current_round` tinyint(4) NOT NULL,
  `submission_file_id` bigint(20) DEFAULT NULL,
  `revised_file_id` bigint(20) DEFAULT NULL,
  `review_file_id` bigint(20) DEFAULT NULL,
  `editor_file_id` bigint(20) DEFAULT NULL,
  `pages` varchar(255) DEFAULT NULL,
  `fast_tracked` tinyint(4) NOT NULL,
  `hide_author` tinyint(4) NOT NULL,
  `comments_status` tinyint(4) NOT NULL,
  PRIMARY KEY (`article_id`),
  KEY `articles_user_id` (`user_id`),
  KEY `articles_journal_id` (`journal_id`),
  KEY `articles_section_id` (`section_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (1,'en_US',1,1,1,'en','',NULL,'2011-10-06 11:31:07','2012-01-23 19:49:38','2011-10-06 11:33:57',3,0,1,NULL,NULL,NULL,NULL,'33',0,0,0),(2,'en_US',1,1,1,'en','',NULL,'2011-10-20 15:46:53','2011-10-20 15:46:53','2011-10-20 15:46:53',1,0,1,NULL,NULL,NULL,NULL,NULL,0,0,0);
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_sources`
--

DROP TABLE IF EXISTS `auth_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_sources` (
  `auth_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `plugin` varchar(32) NOT NULL,
  `auth_default` tinyint(4) NOT NULL,
  `settings` text,
  PRIMARY KEY (`auth_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_sources`
--

LOCK TABLES `auth_sources` WRITE;
/*!40000 ALTER TABLE `auth_sources` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_settings`
--

DROP TABLE IF EXISTS `author_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author_settings` (
  `author_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `author_settings_pkey` (`author_id`,`locale`,`setting_name`),
  KEY `author_settings_author_id` (`author_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_settings`
--

LOCK TABLES `author_settings` WRITE;
/*!40000 ALTER TABLE `author_settings` DISABLE KEYS */;
INSERT INTO `author_settings` VALUES (1,'en_US','biography','Bio Statement','string'),(1,'en_US','affiliation','Affiliation','string'),(2,'en_US','biography','','string'),(2,'en_US','affiliation','','string'),(1,'de_DE','biography','Angaben zum Lebenslauf','string'),(1,'de_DE','affiliation','Institution','string');
/*!40000 ALTER TABLE `author_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authors` (
  `author_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `primary_contact` tinyint(4) NOT NULL,
  `seq` double NOT NULL,
  `first_name` varchar(40) NOT NULL,
  `middle_name` varchar(40) DEFAULT NULL,
  `last_name` varchar(90) NOT NULL,
  `country` varchar(90) DEFAULT NULL,
  `email` varchar(90) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `user_group_id` bigint(20) DEFAULT NULL,
  `suffix` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`author_id`),
  KEY `authors_submission_id` (`submission_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,1,1,1,'DOI','','Tester','','jerico.dev@gmail.com','',NULL,NULL),(2,2,1,1,'DOI','2.','Tester','','jerico.dev@gmail.com','',NULL,NULL);
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_for_review`
--

DROP TABLE IF EXISTS `books_for_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books_for_review` (
  `book_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `status` smallint(6) NOT NULL,
  `author_type` smallint(6) NOT NULL,
  `publisher` varchar(255) NOT NULL,
  `year` smallint(6) NOT NULL,
  `language` varchar(10) NOT NULL,
  `copy` tinyint(4) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `edition` tinyint(4) DEFAULT NULL,
  `pages` smallint(6) DEFAULT NULL,
  `isbn` varchar(30) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `date_requested` datetime DEFAULT NULL,
  `date_assigned` datetime DEFAULT NULL,
  `date_mailed` datetime DEFAULT NULL,
  `date_due` datetime DEFAULT NULL,
  `date_submitted` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `editor_id` bigint(20) DEFAULT NULL,
  `article_id` bigint(20) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`book_id`),
  KEY `bfr_id` (`book_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_for_review`
--

LOCK TABLES `books_for_review` WRITE;
/*!40000 ALTER TABLE `books_for_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `books_for_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_for_review_authors`
--

DROP TABLE IF EXISTS `books_for_review_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books_for_review_authors` (
  `author_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `book_id` bigint(20) NOT NULL,
  `seq` double NOT NULL,
  `first_name` varchar(40) NOT NULL,
  `middle_name` varchar(40) DEFAULT NULL,
  `last_name` varchar(90) NOT NULL,
  PRIMARY KEY (`author_id`),
  KEY `bfr_book_id` (`book_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_for_review_authors`
--

LOCK TABLES `books_for_review_authors` WRITE;
/*!40000 ALTER TABLE `books_for_review_authors` DISABLE KEYS */;
/*!40000 ALTER TABLE `books_for_review_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_for_review_settings`
--

DROP TABLE IF EXISTS `books_for_review_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books_for_review_settings` (
  `book_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `bfr_settings_pkey` (`book_id`,`locale`,`setting_name`),
  KEY `bfr_settings_book_id` (`book_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_for_review_settings`
--

LOCK TABLES `books_for_review_settings` WRITE;
/*!40000 ALTER TABLE `books_for_review_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `books_for_review_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `captchas`
--

DROP TABLE IF EXISTS `captchas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `captchas` (
  `captcha_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(40) NOT NULL,
  `value` varchar(20) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`captcha_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `captchas`
--

LOCK TABLES `captchas` WRITE;
/*!40000 ALTER TABLE `captchas` DISABLE KEYS */;
/*!40000 ALTER TABLE `captchas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citation_settings`
--

DROP TABLE IF EXISTS `citation_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `citation_settings` (
  `citation_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `citation_settings_pkey` (`citation_id`,`locale`,`setting_name`),
  KEY `citation_settings_citation_id` (`citation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citation_settings`
--

LOCK TABLES `citation_settings` WRITE;
/*!40000 ALTER TABLE `citation_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `citation_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citations`
--

DROP TABLE IF EXISTS `citations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `citations` (
  `citation_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `citation_state` bigint(20) NOT NULL,
  `raw_citation` text,
  `seq` bigint(20) NOT NULL,
  `lock_id` varchar(23) DEFAULT NULL,
  PRIMARY KEY (`citation_id`),
  UNIQUE KEY `citations_assoc_seq` (`assoc_type`,`assoc_id`,`seq`),
  KEY `citations_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citations`
--

LOCK TABLES `citations` WRITE;
/*!40000 ALTER TABLE `citations` DISABLE KEYS */;
/*!40000 ALTER TABLE `citations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `comment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `parent_comment_id` bigint(20) DEFAULT NULL,
  `num_children` int(11) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `poster_ip` varchar(15) NOT NULL,
  `poster_name` varchar(90) DEFAULT NULL,
  `poster_email` varchar(90) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `body` text,
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `comments_submission_id` (`submission_id`),
  KEY `comments_parent_comment_id` (`parent_comment_id`),
  KEY `comments_user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `completed_payments`
--

DROP TABLE IF EXISTS `completed_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `completed_payments` (
  `completed_payment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `payment_type` bigint(20) NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `amount` double NOT NULL,
  `currency_code_alpha` varchar(3) DEFAULT NULL,
  `payment_method_plugin_name` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`completed_payment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `completed_payments`
--

LOCK TABLES `completed_payments` WRITE;
/*!40000 ALTER TABLE `completed_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `completed_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlled_vocab_entries`
--

DROP TABLE IF EXISTS `controlled_vocab_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controlled_vocab_entries` (
  `controlled_vocab_entry_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `controlled_vocab_id` bigint(20) NOT NULL,
  `seq` double DEFAULT NULL,
  PRIMARY KEY (`controlled_vocab_entry_id`),
  KEY `controlled_vocab_entries_cv_id` (`controlled_vocab_id`,`seq`)
) ENGINE=MyISAM AUTO_INCREMENT=317 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocab_entries`
--

LOCK TABLES `controlled_vocab_entries` WRITE;
/*!40000 ALTER TABLE `controlled_vocab_entries` DISABLE KEYS */;
INSERT INTO `controlled_vocab_entries` VALUES (100,100,1),(101,100,2),(102,100,3),(110,101,1),(111,101,2),(112,101,3),(113,101,4),(114,101,5),(115,101,6),(116,101,7),(120,102,1),(121,102,2),(122,102,3),(130,103,1),(131,103,2),(132,103,3),(133,103,4),(134,103,5),(135,103,6),(136,103,7),(137,103,8),(138,103,9),(139,103,10),(140,103,11),(141,103,12),(150,104,1),(151,104,2),(200,200,1),(201,200,2),(202,200,3),(203,200,4),(300,300,1),(301,300,2),(302,300,3),(303,300,4),(304,300,5),(305,300,6),(306,300,7),(310,301,1),(311,301,2),(312,301,3),(313,301,4),(314,301,5),(315,301,6),(316,301,7);
/*!40000 ALTER TABLE `controlled_vocab_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlled_vocab_entry_settings`
--

DROP TABLE IF EXISTS `controlled_vocab_entry_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controlled_vocab_entry_settings` (
  `controlled_vocab_entry_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `c_v_e_s_pkey` (`controlled_vocab_entry_id`,`locale`,`setting_name`),
  KEY `c_v_e_s_entry_id` (`controlled_vocab_entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocab_entry_settings`
--

LOCK TABLES `controlled_vocab_entry_settings` WRITE;
/*!40000 ALTER TABLE `controlled_vocab_entry_settings` DISABLE KEYS */;
INSERT INTO `controlled_vocab_entry_settings` VALUES (100,'','name','personal','string'),(101,'','name','corporate','string'),(102,'','name','conference','string'),(110,'','name','aut','string'),(110,'','description','Author','string'),(111,'','name','ctb','string'),(111,'','description','Contributor','string'),(112,'','name','edt','string'),(112,'','description','Editor','string'),(113,'','name','ill','string'),(113,'','description','Illustrator','string'),(114,'','name','pht','string'),(114,'','description','Photographer','string'),(115,'','name','spn','string'),(115,'','description','Sponsor','string'),(116,'','name','trl','string'),(116,'','description','Translator','string'),(120,'','name','multimedia','string'),(121,'','name','still image','string'),(122,'','name','text','string'),(130,'','name','article','string'),(131,'','name','book','string'),(132,'','name','conference publication','string'),(133,'','name','issue','string'),(134,'','name','journal','string'),(135,'','name','newspaper','string'),(136,'','name','picture','string'),(137,'','name','review','string'),(138,'','name','periodical','string'),(139,'','name','series','string'),(140,'','name','thesis','string'),(141,'','name','web site','string'),(150,'','name','electronic','string'),(151,'','name','print','string'),(200,'','name','journal','string'),(201,'','name','book','string'),(202,'','name','conf-proc','string'),(203,'','name','thesis','string'),(300,'','name','journal','string'),(301,'','name','issue','string'),(302,'','name','article','string'),(303,'','name','proceeding','string'),(304,'','name','conference','string'),(305,'','name','preprint','string'),(306,'','name','unknown','string'),(310,'','name','book','string'),(311,'','name','bookitem','string'),(312,'','name','proceeding','string'),(313,'','name','conference','string'),(314,'','name','report','string'),(315,'','name','document','string'),(316,'','name','unknown','string');
/*!40000 ALTER TABLE `controlled_vocab_entry_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlled_vocabs`
--

DROP TABLE IF EXISTS `controlled_vocabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controlled_vocabs` (
  `controlled_vocab_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `symbolic` varchar(64) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  PRIMARY KEY (`controlled_vocab_id`),
  UNIQUE KEY `controlled_vocab_symbolic` (`symbolic`,`assoc_type`,`assoc_id`)
) ENGINE=MyISAM AUTO_INCREMENT=304 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocabs`
--

LOCK TABLES `controlled_vocabs` WRITE;
/*!40000 ALTER TABLE `controlled_vocabs` DISABLE KEYS */;
INSERT INTO `controlled_vocabs` VALUES (100,'mods34-name-types',0,0),(101,'mods34-name-role-roleTerms-marcrelator',0,0),(102,'mods34-typeOfResource',0,0),(103,'mods34-genre-marcgt',0,0),(104,'mods34-physicalDescription-form-marcform',0,0),(200,'nlm30-publication-types',0,0),(300,'openurl10-journal-genres',0,0),(301,'openurl10-book-genres',0,0),(302,'category',0,0),(303,'interest',0,0);
/*!40000 ALTER TABLE `controlled_vocabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `counter_monthly_log`
--

DROP TABLE IF EXISTS `counter_monthly_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `counter_monthly_log` (
  `year` bigint(20) NOT NULL,
  `month` bigint(20) NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `count_html` bigint(20) NOT NULL,
  `count_pdf` bigint(20) NOT NULL,
  `count_other` bigint(20) NOT NULL,
  UNIQUE KEY `counter_monthly_log_key` (`year`,`month`,`journal_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counter_monthly_log`
--

LOCK TABLES `counter_monthly_log` WRITE;
/*!40000 ALTER TABLE `counter_monthly_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `counter_monthly_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_issue_orders`
--

DROP TABLE IF EXISTS `custom_issue_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_issue_orders` (
  `issue_id` bigint(20) NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `seq` double NOT NULL,
  UNIQUE KEY `custom_issue_orders_pkey` (`issue_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_issue_orders`
--

LOCK TABLES `custom_issue_orders` WRITE;
/*!40000 ALTER TABLE `custom_issue_orders` DISABLE KEYS */;
INSERT INTO `custom_issue_orders` VALUES (1,1,1);
/*!40000 ALTER TABLE `custom_issue_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_section_orders`
--

DROP TABLE IF EXISTS `custom_section_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_section_orders` (
  `issue_id` bigint(20) NOT NULL,
  `section_id` bigint(20) NOT NULL,
  `seq` double NOT NULL,
  UNIQUE KEY `custom_section_orders_pkey` (`issue_id`,`section_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_section_orders`
--

LOCK TABLES `custom_section_orders` WRITE;
/*!40000 ALTER TABLE `custom_section_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_section_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edit_assignments`
--

DROP TABLE IF EXISTS `edit_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edit_assignments` (
  `edit_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `article_id` bigint(20) NOT NULL,
  `editor_id` bigint(20) NOT NULL,
  `can_edit` tinyint(4) NOT NULL,
  `can_review` tinyint(4) NOT NULL,
  `date_assigned` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `date_underway` datetime DEFAULT NULL,
  PRIMARY KEY (`edit_id`),
  KEY `edit_assignments_article_id` (`article_id`),
  KEY `edit_assignments_editor_id` (`editor_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit_assignments`
--

LOCK TABLES `edit_assignments` WRITE;
/*!40000 ALTER TABLE `edit_assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `edit_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edit_decisions`
--

DROP TABLE IF EXISTS `edit_decisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edit_decisions` (
  `edit_decision_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `article_id` bigint(20) NOT NULL,
  `round` tinyint(4) NOT NULL,
  `editor_id` bigint(20) NOT NULL,
  `decision` tinyint(4) NOT NULL,
  `date_decided` datetime NOT NULL,
  PRIMARY KEY (`edit_decision_id`),
  KEY `edit_decisions_article_id` (`article_id`),
  KEY `edit_decisions_editor_id` (`editor_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit_decisions`
--

LOCK TABLES `edit_decisions` WRITE;
/*!40000 ALTER TABLE `edit_decisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `edit_decisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_log`
--

DROP TABLE IF EXISTS `email_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `sender_id` bigint(20) NOT NULL,
  `date_sent` datetime NOT NULL,
  `ip_address` varchar(39) DEFAULT NULL,
  `event_type` bigint(20) DEFAULT NULL,
  `from_address` varchar(255) DEFAULT NULL,
  `recipients` text,
  `cc_recipients` text,
  `bcc_recipients` text,
  `subject` varchar(255) DEFAULT NULL,
  `body` text,
  PRIMARY KEY (`log_id`),
  KEY `email_log_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log`
--

LOCK TABLES `email_log` WRITE;
/*!40000 ALTER TABLE `email_log` DISABLE KEYS */;
INSERT INTO `email_log` VALUES (1,257,1,1,'2011-10-06 11:31:13','::1',NULL,'\"FUB Integration Test Principal Contact\" <jerico.dev@gmail.com>','\"admin \" <jerico.dev@gmail.com>',NULL,NULL,'[T] Submission Acknowledgement','admin :\n\nThank you for submitting the manuscript, \"DOI Test\" to test. With the online journal management system that we are using, you will be able to track its progress through the editorial process by logging in to the journal web site:\n\nManuscript URL: http://localhost/pkp-ojs/index.php/test/author/submission/1\nUsername: admin\n\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.\n\nFUB Integration Test Principal Contact\ntest\n________________________________________________________________________\r\ntest\r\nhttp://localhost/pkp-ojs/index.php/test'),(2,257,2,1,'2011-10-20 15:46:53','187.15.48.79',NULL,'\"FUB Integration Test Principal Contact\" <jerico.dev@gmail.com>','\"admin \" <jerico.dev@gmail.com>',NULL,NULL,'[T] Submission Acknowledgement','admin :\n\nThank you for submitting the manuscript, \"DOI Test - Second Article\" to test. With the online journal management system that we are using, you will be able to track its progress through the editorial process by logging in to the journal web site:\n\nManuscript URL: http://ojs-test.cedis.fu-berlin.de/ojs-dev/index.php/test/author/submission/2\nUsername: admin\n\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.\n\nFUB Integration Test Principal Contact\ntest\n________________________________________________________________________\r\ntest\r\nhttp://localhost/pkp-ojs/index.php/test');
/*!40000 ALTER TABLE `email_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates` (
  `email_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email_key` varchar(30) NOT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `enabled` tinyint(4) NOT NULL,
  PRIMARY KEY (`email_id`),
  UNIQUE KEY `email_templates_email_key` (`email_key`,`assoc_type`,`assoc_id`),
  KEY `email_templates_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates`
--

LOCK TABLES `email_templates` WRITE;
/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates_data`
--

DROP TABLE IF EXISTS `email_templates_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates_data` (
  `email_key` varchar(30) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `subject` varchar(120) NOT NULL,
  `body` text,
  UNIQUE KEY `email_templates_data_pkey` (`email_key`,`locale`,`assoc_type`,`assoc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_data`
--

LOCK TABLES `email_templates_data` WRITE;
/*!40000 ALTER TABLE `email_templates_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_templates_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates_default`
--

DROP TABLE IF EXISTS `email_templates_default`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates_default` (
  `email_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email_key` varchar(64) NOT NULL,
  `can_disable` tinyint(4) NOT NULL,
  `can_edit` tinyint(4) NOT NULL,
  `from_role_id` bigint(20) DEFAULT NULL,
  `to_role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`email_id`),
  KEY `email_templates_default_email_key` (`email_key`)
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_default`
--

LOCK TABLES `email_templates_default` WRITE;
/*!40000 ALTER TABLE `email_templates_default` DISABLE KEYS */;
INSERT INTO `email_templates_default` VALUES (1,'NOTIFICATION',0,1,NULL,NULL),(2,'NOTIFICATION_MAILLIST',0,1,NULL,NULL),(3,'NOTIFICATION_MAILLIST_WELCOME',0,1,NULL,NULL),(4,'PASSWORD_RESET_CONFIRM',0,1,NULL,NULL),(5,'PASSWORD_RESET',0,1,NULL,NULL),(6,'USER_REGISTER',0,1,NULL,NULL),(7,'USER_VALIDATE',0,1,NULL,NULL),(8,'REVIEWER_REGISTER',0,1,NULL,NULL),(9,'PUBLISH_NOTIFY',0,1,NULL,NULL),(10,'LOCKSS_EXISTING_ARCHIVE',0,1,NULL,NULL),(11,'LOCKSS_NEW_ARCHIVE',0,1,NULL,NULL),(12,'SUBMISSION_ACK',1,1,NULL,65536),(13,'SUBMISSION_UNSUITABLE',1,1,512,65536),(14,'SUBMISSION_COMMENT',0,1,NULL,NULL),(15,'SUBMISSION_DECISION_REVIEWERS',0,1,512,4096),(16,'EDITOR_ASSIGN',1,1,256,512),(17,'REVIEW_CANCEL',1,1,512,4096),(18,'REVIEW_REQUEST',1,1,512,4096),(19,'REVIEW_REQUEST_ONECLICK',1,1,512,4096),(20,'REVIEW_REQUEST_ATTACHED',0,1,512,4096),(21,'REVIEW_CONFIRM',1,1,4096,512),(22,'REVIEW_DECLINE',1,1,4096,512),(23,'REVIEW_COMPLETE',1,1,4096,512),(24,'REVIEW_ACK',1,1,512,4096),(25,'REVIEW_REMIND',0,1,512,4096),(26,'REVIEW_REMIND_AUTO',0,1,NULL,4096),(27,'REVIEW_REMIND_ONECLICK',0,1,512,4096),(28,'REVIEW_REMIND_AUTO_ONECLICK',0,1,NULL,4096),(29,'EDITOR_DECISION_ACCEPT',0,1,512,65536),(30,'EDITOR_DECISION_REVISIONS',0,1,512,65536),(31,'EDITOR_DECISION_RESUBMIT',0,1,512,65536),(32,'EDITOR_DECISION_DECLINE',0,1,512,65536),(33,'COPYEDIT_REQUEST',1,1,512,8192),(34,'COPYEDIT_COMPLETE',1,1,8192,65536),(35,'COPYEDIT_ACK',1,1,512,8192),(36,'COPYEDIT_AUTHOR_REQUEST',1,1,512,65536),(37,'COPYEDIT_AUTHOR_COMPLETE',1,1,65536,512),(38,'COPYEDIT_AUTHOR_ACK',1,1,512,65536),(39,'COPYEDIT_FINAL_REQUEST',1,1,512,8192),(40,'COPYEDIT_FINAL_COMPLETE',1,1,8192,512),(41,'COPYEDIT_FINAL_ACK',1,1,512,8192),(42,'LAYOUT_REQUEST',1,1,512,768),(43,'LAYOUT_COMPLETE',1,1,768,512),(44,'LAYOUT_ACK',1,1,512,768),(45,'PROOFREAD_AUTHOR_REQUEST',1,1,512,65536),(46,'PROOFREAD_AUTHOR_COMPLETE',1,1,65536,512),(47,'PROOFREAD_AUTHOR_ACK',1,1,512,65536),(48,'PROOFREAD_REQUEST',1,1,512,12288),(49,'PROOFREAD_COMPLETE',1,1,12288,512),(50,'PROOFREAD_ACK',1,1,512,12288),(51,'PROOFREAD_LAYOUT_REQUEST',1,1,512,768),(52,'PROOFREAD_LAYOUT_COMPLETE',1,1,768,512),(53,'PROOFREAD_LAYOUT_ACK',1,1,512,768),(54,'EMAIL_LINK',0,1,1048576,NULL),(55,'SUBSCRIPTION_NOTIFY',0,1,NULL,1048576),(56,'OPEN_ACCESS_NOTIFY',0,1,NULL,1048576),(57,'SUBSCRIPTION_BEFORE_EXPIRY',0,1,NULL,1048576),(58,'SUBSCRIPTION_AFTER_EXPIRY',0,1,NULL,1048576),(59,'SUBSCRIPTION_AFTER_EXPIRY_LAST',0,1,NULL,1048576),(60,'SUBSCRIPTION_PURCHASE_INDL',0,1,NULL,2097152),(61,'SUBSCRIPTION_PURCHASE_INSTL',0,1,NULL,2097152),(62,'SUBSCRIPTION_RENEW_INDL',0,1,NULL,2097152),(63,'SUBSCRIPTION_RENEW_INSTL',0,1,NULL,2097152),(64,'CITATION_EDITOR_AUTHOR_QUERY',0,1,NULL,NULL),(65,'GIFT_AVAILABLE',0,1,NULL,NULL),(66,'GIFT_USER_REGISTER',0,1,NULL,NULL),(67,'GIFT_USER_LOGIN',0,1,NULL,NULL),(68,'BFR_REVIEW_REMINDER',0,1,256,65536),(69,'BFR_REVIEW_REMINDER_LATE',0,1,256,65536),(70,'BFR_BOOK_ASSIGNED',0,1,256,65536),(71,'BFR_BOOK_DENIED',0,1,256,65536),(72,'BFR_BOOK_REQUESTED',0,1,65536,256),(73,'BFR_BOOK_MAILED',0,1,256,65536),(74,'BFR_REVIEWER_REMOVED',0,1,256,65536),(75,'THESIS_ABSTRACT_CONFIRM',0,1,NULL,NULL),(76,'SWORD_DEPOSIT_NOTIFICATION',0,1,NULL,NULL),(77,'PAYPAL_INVESTIGATE_PAYMENT',0,1,NULL,NULL),(78,'MANUAL_PAYMENT_NOTIFICATION',0,1,NULL,NULL),(79,'GIFT_AVAILABLE',0,1,NULL,NULL),(80,'GIFT_USER_REGISTER',0,1,NULL,NULL),(81,'GIFT_USER_LOGIN',0,1,NULL,NULL),(82,'GIFT_AVAILABLE',0,1,NULL,NULL),(83,'GIFT_USER_REGISTER',0,1,NULL,NULL),(84,'GIFT_USER_LOGIN',0,1,NULL,NULL),(85,'NOTIFICATION_MAILLIST_WELCOME',0,1,NULL,NULL),(86,'NOTIFICATION_MAILLIST',0,1,NULL,NULL);
/*!40000 ALTER TABLE `email_templates_default` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates_default_data`
--

DROP TABLE IF EXISTS `email_templates_default_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates_default_data` (
  `email_key` varchar(64) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `subject` varchar(120) NOT NULL,
  `body` text,
  `description` text,
  UNIQUE KEY `email_templates_default_data_pkey` (`email_key`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_default_data`
--

LOCK TABLES `email_templates_default_data` WRITE;
/*!40000 ALTER TABLE `email_templates_default_data` DISABLE KEYS */;
INSERT INTO `email_templates_default_data` VALUES ('NOTIFICATION','de_DE','Neue Benachrichtigung von {$siteTitle}','Sie haben eine neue Benachrichtigung von {$siteTitle}:\n\n{$notificationContents}\n\nLink: {$url}\n\n{$principalContactSignature}','Diese E-Mail wird an angemeldete Benutzer/innen geschickt, die sich für diese Art der Benachrichtigung angemeldet haben.'),('NOTIFICATION_MAILLIST','de_DE','Neue Benachrichtigung von {$siteTitle}','Sie haben eine neue Benachrichtigung von {$siteTitle}:\n--\n{$notificationContents}\n\nLink: {$url}\n--\n\nWenn Sie keine Benachrichtigungs-E-Mails mehr erhalten möchten, gehen Sie bitte zu {$unsubscribeLink} und geben Sie Ihre E-Mail-Adresse und Passwort ein.\n\n{$principalContactSignature}','Diese E-Mail wird an nicht registrierte Benutzer/innen auf der Benachrichtigungs-Mailingliste gesendet.'),('NOTIFICATION_MAILLIST_WELCOME','de_DE','Willkommen zu der  {$siteTitle}-Mailingliste!','Sie haben Sich angemeldet, Benachrichtigungen von {$siteTitle} zu erhalten.\n\nBitte klicken Sie auf diesen Link, um Ihre Anfrage zu bestätigen und Ihre E-Mail-Adresse zur Mailingliste hinzuzufügen: {$confirmLink}\n\nWenn Sie keine Benachrichtigungs-E-Mails mehr erhalten möchten, gehen Sie bitte zu {$unsubscribeLink} und geben Sie Ihre E-Mail-Adresse und Passwort ein.\n\nIhr Passwort zum Abbestellen der Mailingliste ist: {$password}\n\n{$principalContactSignature}','Diese E-Mail wird an Benutzer/innen gesendet, die gerade die Benachrichtigungs-Mailingliste abonniert haben.'),('PASSWORD_RESET_CONFIRM','de_DE','Reset-Bestätigung für Ihr Passwort','Wir wurden aufgefordert, Ihr Passwort für die Webseite {$siteTitle} neu zu setzen.\n\nFalls die Aufforderung nicht von Ihnen stammt, ignorieren Sie bitte diese E-Mail, und Ihr Passwort bleibt unverändert. Falls Sie Ihr Passwort neu setzen möchten, klicken Sie bitte auf die folgende URL:\n\nMein Passwort neu setzen: {$url}\n\n{$principalContactSignature}','Diese E-Mail wird an registrierte Benutzer/innen der Benachrichtigungs-Mailingliste gesendet, die angegeben haben, dass sie ihr Passwort vergessen haben oder sich nicht einloggen können. Sie liefert eine URL, der die Benutzer/innen folgen können, um ihr Passwort zurückzusetzen.'),('PASSWORD_RESET','de_DE','Passwort neu gesetzt','Ihr Benutzer/innen-Passwort für die Webseite {$siteTitle} wurde neu gesetzt. Bitte notieren Sie Benutzer/innennamen und Passwort, beides wird für alle Arbeiten mit dieser Zeitschrift gebraucht.\n\nIhr Benutzer/innenname: {$username}\nIhr neues Passwort: {$password}\n\n{$principalContactSignature}','Diese E-Mail wird an registrierte Benutzer/innen gesendet, nachdem sie ihr Passwort erfolgreich nach dem in der PASSWORD_RESET_CONFIRM-E-Mail beschriebenen Verfahren zurückgesetzt haben.'),('USER_REGISTER','de_DE','Registrierung bei der Zeitschrift','{$userFullName},\n\nSie sind nun als neue/r Benutzer/in von {$journalName} registriert. Wir haben Ihren Benutzer/innennamen und Ihr Passwort in dieser Mail aufgeführt, beides wird für alle Arbeiten mit dieser Zeitschrift gebraucht. Sie können sich zu jedem Zeitpunkt als Benutzer/in der Zeitschrift austragen lassen, indem Sie mich kontaktieren.\n\nBenutzer/innenname: {$username}\nPasswort: {$password}\n\nVielen Dank,\n{$principalContactSignature}','Diese E-Mail wird an neu registrierte Benutzer/innen gesendet, um sie beim System willkommen zu heißen und ihnen Benutzer/innennamen und Passwort zu bestätigen.'),('USER_VALIDATE','de_DE','Bestätigung Ihres Benutzer/innenkontos','{$userFullName},\n\nSie haben ein Benutzer/innenkonto bei {$journalName} angelegt, aber bevor Sie es benutzen können, müssen Sie Ihre E-Mail-Adresse bestätigen. Dazu folgen Sie bitte einfach dem folgenden Link:\n\n{$activateUrl}\n\nVielen Dank,\n{$principalContactSignature}','Diese E-Mail wird an neu registrierte Benutzer/innen gesendet, um sie aufzufordern, die angegebene E-Mail-Adresse zu verifizieren. '),('REVIEWER_REGISTER','de_DE','Registrierung als Gutachter/in bei {$journalName}','Angesichts Ihrer Erfahrung haben wir uns erlaubt, Ihren Namen der Gutachter/innendatenbank von {$journalName} hinzuzufügen. Dies verpflichtet Sie in keiner Weise, ermöglicht uns aber, Sie um mögliche Gutachten für eine Einreichung zu bitten. Wenn Sie zu einem Gutachten eingeladen werden, werden Sie Titel und Abstract des Beitrags sehen können und werden stets selber entscheiden können, ob Sie der Einladung folgen oder nicht. Sie können zu jedem Zeitpunkt Ihren Namen von der Gutachter/innenliste entfernen lassen.\n\nWir senden Ihnen einen Benutzer/innennamen und ein Passwort, die sie in allen Schritten der Zusammenarbeit mit der Zeitschrift über deren Website benötigen. Vielleicht möchten Sie z.B. Ihr Profil inkl. Ihrer Begutachtungsinteressen aktualisieren.\n\nUsername: {$username}\nPassword: {$password}\n\nVielen Dank,\n{$principalContactSignature}','Diese E-Mail wird an neu registrierte Gutachter/innen gesendet, um sie beim System willkommen zu heißen und ihnen Benutzer/innennamen und Passwort zu bestätigen.'),('PUBLISH_NOTIFY','de_DE','Neue Ausgabe erschienen','Liebe Leserinnen und Leser,\n\n{$journalName} hat soeben die neueste Ausgabe unter {$journalUrl} veröffentlicht. Wir laden Sie ein, hier das Inhaltsverzeichnis zu lesen und sich dann auf unserer Webseite die Sie interessierenden Beiträge anzusehen.\n\nDanke für das andauernde Interesse an unserer Arbeit,\n{$editorialContactSignature}','Diese E-Mail wird an registrierte Benutzer/innen mittels des \"Benutzer/innen benachrichtigen\"-Links auf der persönlichen Startseite einer Redakteurin/eines Redakteurs gesendet. Sie benachrichtigt Benutzer/innen über eine neue Ausgabe und lädt sie ein, die Zeitschrift unter einer angegebenen URL aufzusuchen.'),('LOCKSS_EXISTING_ARCHIVE','de_DE','Archiving Request for {$journalName}','Sehr geehrte/r [Bibliotheksleiter/in],\n\n{$journalName} <{$journalUrl}> ist eine Zeitschrift, an der ein Mitglied Ihrer Universität, [Name], als [Mitarbeiterfunktion] mitarbeitet. Die Zeitschrift beabsichtigt, mit Ihrer und anderen Universitätsbibliotheken ein mit LOCKSS (Lots of Copies Keep Stuff Safe) kompatibles Archiv aufzubauen.\n\n[Kurze Beschreibung der Zeitschrift]\n\nDie Webadresse der LOCKSS-Erklärung für unsere Zeitschrift ist: {$journalUrl}/gateway/lockss\n\nWir gehen von der Annahme aus, dass Sie bereits an LOCKSS beteiligt sind. Falls weitere Metadaten zur Aufnahme unserer Zeitschrift in Ihre Version von LOCKSS gebraucht werden, stellen wir sie Ihnen gern zur Verfügung.\n\nVielen Dank,\n{$principalContactSignature}','Diese E-Mail bittet die/den Verwalter/in eines LOCKSS-Archivs zu überlegen, diese Zeitschrift in ihr/sein Archiv aufzunehmen. Sie liefert die URL zur LOCKSS-Erklärung der Herausgeber/innen der Zeitschrift.'),('LOCKSS_NEW_ARCHIVE','de_DE','Bitte um Archivierung von {$journalName}','Sehr geehrte/r [Bibliotheksleiter/in],\n\n{$journalName} <{$journalUrl}> ist eine Zeitschrift, an der ein Mitglied Ihrer Universität, [Name], als [Mitarbeiterfunktion] mitarbeitet. Die Zeitschrift beabsichtigt, mit Ihrer und anderen Universitätsbibliotheken ein mit LOCKSS (Lots of Copies Keep Stuff Safe) kompatibles Archiv aufzubauen.\n\n[Kurze Beschreibung der Zeitschrift]\n\nDas LOCKSS-Programm <http://lockss.stanford.edu/>, eine internationale Initiative von Bibliotheken und Verlagen, ist ein funktionierendes verteiltes System zur Erhaltung und zur Archivierung; nähere Einzelheiten finden Sie weiter unten. Die auf jedem gewöhnlichen Rechner laufende Software ist frei; das System lässt sich leicht online bringen; es braucht wenig Wartung.\n\nFalls Sie sich an der Archivierung unserer Zeitschrift beteiligen möchten, laden wir Sie ein, Mitglied der LOCKSS-Community zu werden und mitzuhelfen, Texte aus Ihrer Einrichtung und von Wissenschaftler/innen aus der ganzen Welt zu sammeln und zu erhalten. Dazu sollte sich jemand aus Ihrer Einrichtung auf der Webseite von LOCKSS darüber informieren, wie dieses System funktioniert. Wir freuen uns darauf, von Ihnen zu hören, um die Möglichkeit Ihre Unterstützung bei der Archivierung dieser Zeitschrift und erwarten gern Ihre Antwort zur konkreten Vorgehensweise.\n\nVielen Dank,\n{$principalContactSignature}','Diese E-Mail ermuntert die Empfängerin/den Empfänger, an der LOCKSS-Initiative teilzunehmen und diese Zeitschrift in das Archiv aufzunehmen. Sie liefert Informationen über die LOCKSS-Initiative und über Wege, daran teilzunehmen.'),('SUBMISSION_ACK','de_DE','Eingangsbestätigung','{$authorName},\n\nvielen Dank für die Einreichung Ihres Manuskript \"{$articleTitle}\" zur Veröffentlichung in {$journalName}. Das Verwaltungssystem unserer Webzeitschrift erlaubt Ihnen, jederzeit den Lauf Ihres Beitrags im Redaktionsprozess zu beobachten. Sie loggen sich dazu einfach auf unserer Webseite ein:\n\nURL des Manuskripts: {$submissionUrl}\nBenutzer/innenname: {$authorUsername}\n\nFür weitere Fragen stehen wir Ihnen gern zur Verfügung. Danke für Ihr Interesse an einer Veröffentlichung in unserer Zeitschrift.\n\n{$editorialContactSignature}','Diese E-Mail wird, sofern aktiviert, automatisch an eine Autorin/einen Autor gesendet, wenn sie oder er den Einreichungsprozess eines Manuskripts für die Zeitschrift abgeschlossen hat. Sie liefert Informationen über das Verfolgen der Einreichung durch den Prozess hindurch und dankt der Autorin/dem Autor für die Einreichung.'),('SUBMISSION_UNSUITABLE','de_DE','Ungeeigneter Beitrag','{$authorName},\n\neine erste Lektüre von \"{$articleTitle}\" ergab, dass Ihr Beitrag den Anforderungen und der Orientierung von {$journalName} nicht entspricht. Ich schlage Ihnen vor, dass Sie sich die Beschreibung dieser Zeitschrift unter \"Über uns\" und die aktuellen Inhalte anseehen, um mehr über die Arbeiten zu erfahren, die wir veröffentlichen. Sie könnten außerdem überlegen, diesen Beitrag bei einer anderen, besser passenden Zeitschrift einzureichen.\n\n{$editorialContactSignature}',''),('SUBMISSION_COMMENT','de_DE','Kommentar zu Einreichung','{$name},\n\n{$commentName} hat einen Kommentar zur Einreichung \"{$articleTitle}\" in {$journalName} hinzugefügt:\n\n{$comments}','Diese E-Mail benachrichtigt die Personen, die mit dem Redaktionsprozess zu einer Einreichung zu tun haben, darüber, dass ein neuer Kommentar abgegeben worden ist.'),('SUBMISSION_DECISION_REVIEWERS','de_DE','Entscheidung zu \"{$articleTitle}','Als Gutachter/in zur Einreichung \"{$articleTitle}\" für {$journalName} sende ich Ihnen die Gutachten und die redaktionelle Entscheidung, die an die Autorin/den Autor des Textes geschickt worden sind. Vielen Dank nochmals für den wichtigen Beitrag, den Sie zu diesem Prozess geleistet haben.\n\n{$editorialContactSignature}\n\n{$comments}','Diese E-Mail benachrichtigt die Gutachter/innen einer Einreichung, dass der Begutachtungsprozess abgeschlossen worden ist. Sie enthält Informationen über den Artikel und die getroffene Entscheidung und dankt den Gutachter/innen für ihre Mitwirkung.'),('EDITOR_ASSIGN','de_DE','Zuweisung an Rubrikredakteur/in','{$editorialContactName},\n\nder Beitrag \"{$articleTitle}\" für {$journalName} wird Ihnen zur Durchführung des redaktionellen Prozesses in Ihrer Rolle als Rubrikredakteur/in zugewiesen.\n\nURL des Beitrags: {$submissionUrl}\nBenutzer/innenname: {$editorUsername}\n\nVielen Dank,\n{$editorialContactSignature}','Diese E-Mail benachrichtigt eine/n Rubrikredakteur/in, dass die Redakteurin/der Redakteur ihr/ihm die Aufgabe übertragen hat, eine Einreichung durch den Redaktionsprozess hindurch zu betreuen. Sie liefert Informationen zu der Einreichung und darüber, wie auf die Zeitschriftenseite zugegriffen werden kann.'),('REVIEW_REQUEST','de_DE','Bitte um ein Gutachten','{$reviewerName},\n\naufgrund Ihrer Forschungsschwerpunkte wären Sie ein/e ausgezeichnete/r Gutachter/in für das Manuskript \"{$articleTitle}\", das zur Publikation in {$journalName} eingereicht worden ist. Weiter unten finden Sie eine Kurzfassung des Beitrags. Ich hoffe sehr, dass Sie sich bereitfinden können, uns mit Ihrer Stellungnahme zu unterstützen. Sie wären uns eine große Hilfe.\n\nLoggen Sie sich bitte bis zum {$weekLaterDate} auf der Webseite unserer Zeitschrift ein, um uns Ihre Zu- oder Absage mitzuteilen. Sie finden dort den Beitrag und können gegebenenfalls auch Ihr Gutachten und Ihre Empfehlung dort abgeben. Die Webseite ist {$journalUrl}\n\nDas Gutachten wäre fällig am {$reviewDueDate}.\n\nFalls Sie nicht über Benutzer/innennamen und Passwort verfügen, können Sie über folgenden Link Ihr Passwort neu setzen (Benutzer/innennamen und Passwort gehen Ihnen umgehend per E-Mail zu). {$passwordResetUrl}\n\nURL des Beitrags: {$submissionReviewUrl}\n\nIn der Hoffnung auf eine positive Antwort,\n\n{$editorialContactSignature}\n\n\n\n\"{$articleTitle}\"\n\n{$abstractTermIfEnabled}\n{$articleAbstract}','Diese E-Mail von der/dem Rubrikredakteur/in an eine/n Gutachter/in bittet darum, dass diese/r die Aufgabe, eine Einreichung zu begutachten, übernimmt oder ablehnt. Sie liefert Informationen über die Einreichung wie Titel und Abstract, ein Fälligkeitsdatum für das Gutachten und darüber, wie auf die Einreichung zugegriffen werden kann. Diese Nachricht wird benutzt, wenn in Schritt 2 des Zeitschriftensetups das Standardbegutachtungsverfahren ausgewählt worden ist. (Ansonsten siehe REVIEW_REQUEST_ATTACHED.)'),('REVIEW_REQUEST_ONECLICK','de_DE','Bitte um ein Gutachten','{$reviewerName},\n\naufgrund Ihrer Forschungsschwerpunkte wären Sie ein/e ausgezeichnete/r Gutachter/in für das Manuskript \"{$articleTitle}\", das zur Publikation in {$journalName} eingereicht worden ist. Weiter unten finden Sie eine Kurzfassung des Beitrags. Ich hoffe sehr, dass Sie sich bereitfinden können, uns mit Ihrer Stellungnahme zu unterstützen. Sie wären uns eine große Hilfe.\n\nLoggen Sie sich bitte bis zum {$weekLaterDate} auf der Webseite unserer Zeitschrift ein, um uns Ihre Zu- oder Absage mitzuteilen. Sie finden dort den Beitrag und können gegebenenfalls auch Ihr Gutachten und Ihre Empfehlung dort abgeben.\n\nDas Gutachten wäre fällig am {$reviewDueDate}.\n\nURL des Beitrags: {$submissionReviewUrl}\n\nIn der Hoffnung auf eine positive Antwort,\n\n{$editorialContactSignature}\n\n\n\n\"{$articleTitle}\"\n\n{$abstractTermIfEnabled}\n{$articleAbstract}','Diese E-Mail von der/dem Rubrikredakteur/in an eine/n Gutachter/in bittet darum, dass diese/r die Aufgabe, eine Einreichung zu begutachten, übernimmt oder ablehnt. Sie liefert Informationen über die Einreichung wie Titel und Abstract, ein Fälligkeitsdatum für das Gutachten und darüber, wie auf die Einreichung zugegriffen werden kann. Diese Nachricht wird benutzt, wenn in Schritt 2 des Zeitschriftensetups das Standardbegutachtungsverfahren ausgewählt worden ist und wenn der One-Click-Zugang für Gutachter/innen aktiviert ist.'),('REVIEW_REQUEST_ATTACHED','de_DE','Bitte um ein Gutachten','{$reviewerName},\n\naufgrund Ihrer Forschungsschwerpunkte wären Sie ein/e ausgezeichnete/r Gutachter/in für das Manuskript \"{$articleTitle}\", das zur Publikation in {$journalName} eingereicht worden ist. Ich hoffe sehr, dass Sie sich bereitfinden können, uns mit Ihrer Stellungnahme zu unterstützen. Sie wären uns eine große Hilfe. Die Richtlinien für die Begutachtung sind angefügt, ebenso der Beitrag, um den es geht. Ihr Gutachten und Ihre Empfehlung sollten gegebenenfalls bis zum {$reviewDueDate} per E-Mail bei uns eingehen.\n\nBitte benachrichtigen Sie uns bis zum {$weekLaterDate} per E-Mail, ob Sie das Gutachten übernehmen können.\n\nIn der Hoffnung auf eine positive Antwort,\n\n{$editorialContactSignature}\n\n\nRichtlinien für Gutachter/innen\n\n{$reviewGuidelines}\n','Diese E-Mail wird von der/dem Rubrikredakteur/in an eine/n Gutachter/in gesendet, um darum zu bitten, dass sie/er die Aufgabe, eine Einreichung zu begutachten, übernimmt oder ablehnt. Sie enthält die Einreichung als E-Mail-Anhang. Diese Nachricht wird benutzt, wenn in Schritt 2 des Zeitschriftensetups das Begutachtungsverfahren über E-Mail-Anhänge ausgewählt worden ist. (Ansonsten siehe REVIEW_REQUEST.)'),('REVIEW_CANCEL','de_DE','Rücknahme einer Bitte um ein Gutachten','{$reviewerName},\n\nwir haben uns entschieden, unsere Anfrage nach einem Gutachten für den Beitrag \"{$articleTitle}\" für {$journalName} zurückzuziehen. Verzeihen Sie bitte die Ihnen dadurch evtl. entstandenen Unannehmlichkeiten. Wir hoffen, dass wir weiterhin auf Ihre Hilfe als Gutachter/in für die Zeitschrift zählen können.\n\nFalls Sie Fragen haben, können Sie sich gerne an mich wenden.\n\n{$editorialContactSignature}','Diese E-Mail wird von der/dem Rubrikredakteur/in an eine/n Gutachter/in gesendet, die an einem Gutachten arbeiten, um sie darüber zu informieren, dass das Gutachten abgesagt worden ist.'),('REVIEW_CONFIRM','de_DE','Einwilligung in die Begutachtung','{$editorialContactName},\n\nich bin in der Lage und auch gern bereit, den Beitrag \"{$articleTitle}\" für {$journalName} zu begutachten. Vielen Dank für Ihr Vertrauen; ich werde das Gutachten spätestens bis zum {$reviewDueDate} einreichen, wenn möglich auch früher.\n\n{$reviewerName}','Diese E-Mail wird von einer Gutachterin/einem Gutachter an die/den Rubrikredakteur/in als Antwort auf eine Begutachtungsanfrage gesendet, um die/den Rubrikredakteur/in darüber zu informieren, dass die Begutachtung übernommen wird und bis zu dem angegebenen Datum abgeschlossen sein wird.'),('REVIEW_DECLINE','de_DE','Ablehnung der Bitte um ein Gutachten','{$editorialContactName},\n\nleider kann ich gegenwärtig die Begutachtung des Beitrags \"{$articleTitle}\" für {$journalName} nicht übernehmen. Ich danke für Ihr Vertrauen. Bei anderer Gelegenheit können Sie sich gerne wieder an mich wenden.\n\n{$reviewerName}','Diese E-Mail wird von einer Gutachterin/einem Gutachter an die/den Rubrikredakteur/in als Antwort auf eine Begutachtungsanfrage gesendet, um darüber zu informieren, dass die Anfrage abgelehnt wird.'),('REVIEW_COMPLETE','de_DE','Gutachten für einen Beitrag fertiggestellt','{$editorialContactName},\n\nich habe mein Gutachten zu dem Beitrag \"{$articleTitle}\" für {$journalName} fertiggestellt und meine Empfehlung \"{$recommendation}\" abgegeben.\n\n{$reviewerName}','Diese E-Mail wird von einer Gutachterin/einem Gutachter an die/den Rubrikredakteur/in gesendet, um darüber zu informieren, dass ein Gutachten fertiggestellt worden ist un dass die Kommentare und Korrekturen auf der Website der Zeitschrift notiert worden sind.'),('REVIEW_ACK','de_DE','Eingangsbestätigung für ein Gutachten','{$reviewerName},\n\nvielen Dank für Ihr Gutachten zum Beitrag \"{$articleTitle}\" für {$journalName}. Ihre Stellungnahme ist eine wichtige Unterstützung für unsere Bemühungen um die Qualität der von uns veröffentlichten Arbeiten.\n\n{$editorialContactSignature}','Diese E-Mail wird von eine/r Rubrikredakteur/in gesendet, um den Empfang eines abgeschlossenen Gutachtens zu bestätigen und um der Gutachterin/dem Gutachter für die Mitwirkung zu danken.'),('REVIEW_REMIND','de_DE','Erinnerung an fälliges Gutachten','{$reviewerName},\n\nwir möchten Sie freundlich an Ihre Zusage erinnern, den Beitrag \"{$articleTitle}\" für {$journalName} zu begutachten. Wir hatten gehofft, das Gutachten bis zum {$reviewDueDate} zu erhalten. Wir würden uns freuen, wenn es uns baldmöglichst zur Verfügung stünde.\n\nFalls Ihnen Benutzer/innenname und Passwort fehlen, können Sie über folgenden Link Ihr Passwort neu setzen (Benutzer/innenname und Passwort gehen Ihnen umgehend per E-Mail zu). {$passwordResetUrl}\n\nURL des Beitrags: {$submissionReviewUrl}\n\nKönnten Sie uns bitte bestätigen, dass Sie nach wie vor bereit sind, unsere Zeitschrift gutachterlich zu unterstützen? Wir würden uns freuen, bald von Ihnen zu hören.\n\n{$editorialContactSignature}','Diese E-Mail wird von einer Rubrikredakteurin/einem Rubrikredakteur gesendet, um eine/n Gutachter/in daran zu erinnern, dass ihr/sein Gutachten fällig ist.'),('REVIEW_REMIND_ONECLICK','de_DE','Erinnerung an die Fälligkeit eines Gutachtens','{$reviewerName},\n\nhiermit möchten wir Sie freundlich an Ihre Zusage erinnern, den Beitrag \"{$articleTitle}\" für {$journalName} zu begutachten. Wir hatten gehofft, das Gutachten zum {$reviewDueDate} zu erhalten. Diese E-Mail wurde automatisch erstellt und nach Überschreitung des Termins versandt. Wir würden uns freuen, wenn uns das Gutachten baldmöglichst zur Verfügung stünde.\n\nURL des Beitrags: {$submissionReviewUrl}\n\nKönnten Sie uns bitte bestätigen, dass Sie nach wie vor bereit sind, unsere Zeitschrift gutachterlich zu unterstützen? Wir würden uns freuen, bald von Ihnen zu hören.\n\n{$editorialContactSignature}','Diese E-Mail wird von einer Rubrikredakteurin/einem Rubrikredakteur gesendet, um eine/n Gutachter/in daran zu erinnern, dass ihr/sein Gutachten fällig ist.'),('REVIEW_REMIND_AUTO','de_DE','Automatische Erinnerung an die Fälligkeit eines Gutachtens','{$reviewerName},\n\nhiermit möchten wir Sie freundlich an Ihre Zusage erinnern, den Beitrag \"{$articleTitle}\" für {$journalName} zu begutachten. Wir hatten gehofft, das Gutachten zum {$reviewDueDate} zu erhalten. Diese E-Mail wurde automatisch erstellt und nach Überschreitung des Termins versandt. Wir würden uns freuen, wenn uns das Gutachten baldmöglichst zur Verfügung stünde.\n\nFalls Ihnen Benutzer/innennamen und Passwort fehlen, können Sie über folgenden Link Ihr Passwort neu setzen (Benutzer/innenname und Passwort gehen Ihnen umgehend per E-Mail zu). {$passwordResetUrl}\n\nURL des Beitrags: {$submissionReviewUrl}\n\nKönnten Sie uns bitte bestätigen, dass Sie nach wie vor bereit sind, unsere Zeitschrift gutachterlich zu unterstützen? Wir würden uns freuen, bald von Ihnen zu hören.\n\n{$editorialContactSignature}','Diese E-Mail wird automatisch verschickt, wenn das Fälligkeitsdatum für eine/n Gutachter/in verstrichen ist (vgl. die Begutachtungseinstellungen in Schritt 2 des Zeitschriftensetups) und wenn der One-Click-Zugang für Gutachter/innen deaktiviert ist. Planmäßige Aufgaben (scheduled tasks) müssen aktiviert und konfiguriert sein (vgl. die Konfigurationsdatei der Website).'),('REVIEW_REMIND_AUTO_ONECLICK','de_DE','Automatische Erinnerung an Begutachtung','{$reviewerName},\n\nhiermit möchten wir Sie freundlich an Ihre Zusage erinnern, den Beitrag \"{$articleTitle}\" für {$journalName} zu begutachten. Wir hatten gehofft, das Gutachten zum {$reviewDueDate} zu erhalten. Diese E-Mail wurde automatisch erstellt und nach Überschreitung des Termins versandt. Wir würden uns freuen, wenn uns das Gutachten baldmöglichst zur Verfügung stünde.\n\nURL des Beitrags: {$submissionReviewUrl}\n\nKönnten Sie uns bitte bestätigen, dass Sie nach wie vor bereit sind, unsere Zeitschrift mit Ihrer wertvollen gutachterlichen Arbeit zu unterstützen? Wir würden uns freuen, bald von Ihnen zu hören.\n\n{$editorialContactSignature}','Diese E-Mail wird automatisch verschickt, wenn das Fälligkeitsdatum für eine/n Gutachter/in verstrichen ist (vgl. die Begutachtungseinstellungen in Schritt 2 des Zeitschriftensetups) und wenn der One-Click-Zugang für Gutachter/innen aktiviert ist. Planmäßige Aufgaben (scheduled tasks) müssen aktiviert und konfiguriert sein (vgl. die Konfigurationsdatei der Website).'),('EDITOR_DECISION_ACCEPT','de_DE','Entscheidung der Redaktion','{$authorName},\n\nwir sind zu einer Entscheidung in Bezug auf Ihre Einreichung für {$journalTitle}: \"{$articleTitle}\" gekommen.\n\nUnsere Entscheidung lautet:\n\n{$editorialContactSignature}\n','Diese E-Mail von der/dem Redakteur/in oder Rubrikredakteur/in an eine/n Autor/in informiert diese/n über eine getroffene Entscheidung zu ihrer/seiner Einreichung.'),('EDITOR_DECISION_REVISIONS','de_DE','Entscheidung der Redaktion','{$authorName},\n\nwir sind zu einer Entscheidung in Bezug auf Ihre Einreichung für {$journalTitle}: \"{$articleTitle}\" gekommen.\n\nUnsere Entscheidung lautet:\n\n{$editorialContactSignature}\n','Diese E-Mail von der/dem Redakteur/in oder Rubrikredakteur/in an eine/n Autor/in informiert diese/n über eine getroffene Entscheidung zu ihrer/seiner Einreichung.'),('EDITOR_DECISION_RESUBMIT','de_DE','Entscheidung der Redaktion','{$authorName},\n\nwir sind zu einer Entscheidung in Bezug auf Ihre Einreichung für {$journalTitle}: \"{$articleTitle}\" gekommen.\n\nUnsere Entscheidung lautet:\n\n{$editorialContactSignature}\n','Diese E-Mail von der/dem Redakteur/in oder Rubrikredakteur/in an eine/n Autor/in informiert diese/n über eine getroffene Entscheidung zu ihrer/seiner Einreichung.'),('EDITOR_DECISION_DECLINE','de_DE','Entscheidung der Redaktion','{$authorName},\n\nwir sind zu einer Entscheidung in Bezug auf Ihre Einreichung für {$journalTitle}: \"{$articleTitle}\" gekommen.\n\nUnsere Entscheidung lautet:\n\n{$editorialContactSignature}\n','Diese E-Mail von der/dem Redakteur/in oder Rubrikredakteur/in an eine/n Autor/in informiert diese/n über eine getroffene Entscheidung zu ihrer/seiner Einreichung.'),('COPYEDIT_REQUEST','de_DE','Bitte um ein Lektorat','{$copyeditorName},\n\nich bitte Sie, das Manuskript \"{$articleTitle}\" für {$journalName} zu lektorieren. Bitte gehen Sie dabei folgendermaßen vor:\n1. Klicken Sie auf die unten stehende URL des Beitrags.\n2. Loggen Sie sich bei der Zeitschrift ein und klicken Sie auf den Dateinamen in Schritt 1.\n3. Beachten Sie die Hinweise zum Lektorat auf der Webseite.\n4. Öffnen Sie die heruntergeladene Datei und lektorieren Sie den Text; fügen Sie, falls nötig, Fragen an die Autorin/den Autor hinzu.\n5. Sichern Sie die lektorierte Version und laden Sie sie zu Schritt 1 des Lektorats hoch.\n6. Schicken Sie die ABGESCHLOSSEN-E-Mail an die Redaktion.\n\nURL {$journalName}: {$journalUrl}\nURL des Beitrags: {$submissionCopyeditingUrl}\nBenutzer/innenname: {$copyeditorUsername}\n\n{$editorialContactSignature}','Diese E-Mail wird von der/dem Rubrikredakteur/in an die/den Lektor einer Einreichung gesendet, um diese/n zu bitten, mit dem Lektorat zu beginnen. Sie liefert Informationen über die Einreichung und darüber, wie auf sie zuzugreifen ist.'),('COPYEDIT_COMPLETE','de_DE','Lektorat beendet','{$editorialContactName},\n\nwir haben den ersten Lektoratsdurchgang für das Manuskript \"{$articleTitle}\" für {$journalName} abgeschlossen. Um die vorgeschlagenen Änderungen zu verfolgen und die eingefügten Fragen an die Autorin/den Autor zu beantworten, gehen Sie bitte folgendermaßen vor:\n\n1. Loggen Sie sich bitte bei der Zeitschrift mit Ihrem Benutzer/innennamen und Ihrem Passwort ein (verwenden Sie \"Passwort vergessen\", falls nötig).\n2. Klicken Sie auf die Datei bei 1: Erstes Lektorat und öffnen Sie die lektorierte Version.\n3. Überprüfen Sie die lektorierte Version und nehmen Sie ggf. Änderungen vor. Verwenden Sie dabei bitte das Word-Korrekturprogramm. Beantworten Sie auch die eingefügten Fragen zum Text.\n4. Sichern Sie die Datei und laden Sie sie zu Schritt 2: Lektorat durch Autor/in hoch.\n5. Klicken Sie auf das E-Mail-Symbol und senden Sie die ABGESCHLOSSEN-Nachricht an die Redakteurin/den Redakteur.\n\nDies ist die letzte Gelegenheit für Sie, noch größere Änderungen vorzunehmen. Sie werden später noch gebeten, die Fahnen zu korrigieren, dann können jedoch nur noch kleinere Typographie- und Layoutfehler korrigiert werden.\n\nURL des Beitrags: {$submissionEditingUrl}\nBenutzer/innenname: {$authorUsername}\n\nFalls Sie zur Zeit nicht in der Lage sein sollten, unserer Aufforderung nachzukommen oder noch Fragen haben,\ngeben Sie mir bitte Bescheid. Vielen Dank für Ihren Beitrag zu dieser Zeitschrift.\n\n{$copyeditorName}',''),('COPYEDIT_ACK','de_DE','Eingangsbestätigung für lektorierte Fassung','{$copyeditorName},\n\nvielen Dank für das Lektorat des Manuskripts \"{$articleTitle}\". Ihre Mitarbeit unterstützt uns bei den Bemühungen, die Qualität der Beiträge in {$journalName} zu sichern.\n\n{$editorialContactSignature}','Diese E-Mail wird von der Rubrikredakteurin/dem Rubrikredakteur an die Lektorin/den Lektor eines Beitrags, um den erfolgreichen Abschluss des Lektoratsprozesses zu bestätigen und um ihr/ihm für die Unterstützung zu danken.'),('COPYEDIT_AUTHOR_REQUEST','de_DE','Bitte um Durchsicht der lektorierten Fassung','{$authorName},\n\nIhre Einreichung \"{$articleTitle}\" für {$journalName} hat den ersten Lektoratsschritt passiert, und Sie können ihn jetzt durchsehen. Gehen Sie bitte folgendermaßen vor:\n\n1. Klicken Sie auf die unten stehende URL Ihres Beitrags.\n2. Loggen Sie sich bitte mit Ihrem Benutzer/innennamen bei der Zeitschrift ein und klicken Sie auf den Dateinamen, der bei Schritt 1 erscheint. 3. Öffnen Sie die heruntergeladene Version Ihres Beitrags.\n4. Überprüfen Sie den Text einschließlich der Änderungsvorschläge in Ihrem Manuskript und beantworten Sie die ggf. dort gestellte Fragen.\n5. Sie können weitere eigene Verbesserungen in Ihrem Text vornehmen.\n6. Laden Sie die fertige Korrekturversion in Schritt 2 wieder hoch.\n7. Klicken Sie auf METADATEN ÜBERPRÜFEN, um die Angaben für die Indizierung Ihres Beitrags auf Vollständigkeit und Richtigkeit zu überprüfen.\n8. Benachrichtigen Sie die Redaktion mit der ABGESCHLOSSEN-E-Mail.\n\nURL des Beitrags: {$submissionCopyeditingUrl}\nBenutzer/innename: {$authorUsername}\n\nDies ist die letzte Gelegenheit für Sie, noch größere Änderungen vorzunehmen. Sie werden danach noch gebeten, die Fahnen zu korrigieren. Dann können Sie jedoch nur noch kleinere Typographie- und Layoutfehler korrigieren.\n\nFalls Sie zur Zeit nicht in der Lage sein sollten, unserer Aufforderung nachzukommen oder noch Fragen haben, benachrichtigen Sie mich bitte. Vielen Dank für Ihren Beitrag zu dieser Zeitschrift.\n\n{$editorialContactSignature}','Diese E-Mail wird von der/dem Rubrikredakteur/in an die Autorin/den Autor einer Einreichung gesendet, um diese/n darum zu bitten, die Arbeit der Lektorin/des Lektors korrekturzulesen. Sie liefert Informationen über den Zugang zu dem Manuskript und weist darauf hin, dass dies die letzte Gelegenheit für die Autorin/den Autor ist, nennenswerte Änderungen vorzunehmen.'),('COPYEDIT_AUTHOR_COMPLETE','de_DE','Lektorat durch Autor/in abgeschlossen','{$editorialContactName},\n\nich habe nun die lektorierte Fassung meines Manuskripts \"{$articleTitle}\" für {$journalName} korrigiert. Es steht damit für die abschließende Durchsicht und die Vorbereitung des Layouts für die Veröffentlichung in {$journalName} zur Verfügung.\n\nMit bestem Dank für Ihre Bemühungen um meinen Beitrag,\n{$authorName}','This email is sent by the Author to the Section Editor to notify them that the Author\'s copyediting process has been completed.'),('COPYEDIT_AUTHOR_ACK','de_DE','Eingangsbestätigung für die durchgesehene Korrekturversion','{$authorName},\n\nvielen Dank für die Durchsicht der Korrekturversion Ihres Manuskripts \"{$articleTitle}\" für {$journalName}. Wir freuen uns auf die Veröffentlichung dieses Beitrags.\n\n{$editorialContactSignature}','Diese E-Mail wird von der/dem Rubrikredakteur/in an die  Autorin/den Autor einer Einreichung gesendet, um ihr/ihm zu bestätigen, dass das Korrekturlektorat durch die/den Autor/in abgeschlossen ist und um ihr/ihm für die Mitwirkung zu danken.'),('COPYEDIT_FINAL_REQUEST','de_DE','Bitte um letzte Durchsicht','{$copyeditorName},\n\nAutor/in und Redaktion haben die Prüfung und Korrektur des Manuskripts \"{$articleTitle}\" für {$journalName} abgeschlossen. Eine endgültige Fassung, die dann für das Layout zur Verfügung steht, muss jetzt erstellt werden. Bitte gehen Sie dabei folgendermaßen vor:\n1. Klicken Sie auf die unten stehende URL des Beitrags.\n2. Loggen Sie sich bei der Zeitschrift ein und klicken Sie auf den Dateinamen in Schritt 2.\n3. Öffnen Sie die heruntergeladene Datei und fügen Sie alle Korrekturen und Fragen an die Autorin/den Autor ein.\n4. Sichern Sie die Datei und laden Sie sie zu Schritt 3 des Lektorats hoch.\n5. Klicken Sie auf METADATEN ÜBERPRÜFEN und überprüfen Sie die Informationen für die Indizierung. Vergessen Sie ggf. nicht, Ihre Änderungen zu sichern.\n6. Schicken Sie die ABGESCHLOSSEN-E-Mail an die Redaktion.\n\nURL {$journalName}: {$journalUrl}\nURL des Beitrags: {$submissionCopyeditingUrl}\nBenutzer/innenname: {$copyeditorUsername}\n\n{$editorialContactSignature}','Diese E-Mail wird von der/dem Rubrikredakteur/in an die/den Lektor/in gesendet, um darum zu bitten, dass sie/er einen letzten Durchgang des Lektorats einer Einreichung durchführt, bevor diese in den Layoutprozess gegeben wird.'),('COPYEDIT_FINAL_COMPLETE','de_DE','Letzte Durchsicht abgeschlossen','{$editorialContactName},\n\nich habe eine korrigierte letzte Fassung des Manuskripts \"{$articleTitle}\" für {$journalName} fertiggestellt. Sie steht nun zum Layout und zur Vorbereitung der Fahnen bereit.\n\n{$copyeditorName}','Diese E-Mail von der/dem Lektor/in an die/den Rubrikredakteur/in informiert diese/n darüber, dass der letzte Lektoratdurchgang abgeschlossen worden ist und dass der Layoutprozess nun beginnen kann.'),('COPYEDIT_FINAL_ACK','de_DE','Eingangsbestätigung für abschließende Korrektur','{$copyeditorName},\n\nvielen Dank für die abschließende Bearbeitung des Manuskripts \"{$articleTitle}\" für {$journalName}. Mit der Erstellung dieser letzten Fassung als Vorbereitung für das Layout haben Sie uns im Redaktionsprozess sehr geholfen.\n\n{$editorialContactSignature}','Diese E-Mail von der/dem Rubrikredakteur/in an die/den Lektor/in bestätigt den Abschluss des letzten Lektoratdurchgangs und dankt ihr/ihm für die Mitwirkung.'),('LAYOUT_REQUEST','de_DE','Bitte um Layout','{$layoutEditorName},\n\nich bitte Sie um das Layout der Fahnen für das Manuskript \"{$articleTitle}\" für {$journalName}. Bitte gehen Sie folgendermaßen vor:\n\n1. Klicken Sie auf die unten stehende URL des Beitrags.\n2. Loggen Sie sich bei der Zeitschrift ein und verwenden Sie die Datei der Layout-Fassung, um die Fahne entsprechend den Vorgaben der Zeitschrift zu erstellen.\n3. Schicken Sie die ABGESCHLOSSEN-E-Mail an die Redaktion.\n\nURL {$journalName}: {$journalUrl}\nURL des Beitrags: {$submissionLayoutUrl}\nBenutzer/innenname: {$layoutEditorUsername}\n\nFalls Sie zur Zeit nicht in der Lage sein sollten, die Arbeit zu übernehmen, oder Fragen haben, geben Sie mir bitte Bescheid. Vielen Dank für Ihre Unterstützung dieser Zeitschrift.\n\n{$editorialContactSignature}','Diese E-Mail von der/dem Rubrikredakteur/in an die/den Layouter/in benachrichtigt diese/n, dass ihr/ihm die Aufgabe zugewiesen wird, einen Beitrag zu layouten. Sie liefert Informationen über den Beitrag und darüber, wie auf ihn zugegriffen werden kann.'),('LAYOUT_COMPLETE','de_DE','Fahnen fertigestellt','{$editorialContactName},\n\ndie Fahnen für das Manuskript \"{$articleTitle}\" für {$journalName} sind fertig und stehen zum Korrekturlektorat bereit.\n\nFalls Sie Fragen haben, können Sie sich gerne an mich wenden.\n\n{$layoutEditorName}','Diese E-Mail von der/dem Layouter/in an die/den Rubrikredakteur/in benachrichtigt diese/n, dass der Layoutprozess abgeschlossen worden ist.'),('LAYOUT_ACK','de_DE','Eingangsbestätigung für die Fahnen','{$layoutEditorName},\n\nvielen Dank für die Fahnen des Manuskripts \"{$articleTitle}\" für {$journalName}. Dies ist ein wichtiger Beitrag zum Veröffentlichungsprozess.\n\n{$editorialContactSignature}','Diese E-Mail von der/dem Rubrikredakteur/in an die/den Layouter/in bestätigt den Abschluss des Layoutprozesses und dankt ihr/ihm für die Mitwirkung.'),('PROOFREAD_AUTHOR_REQUEST','de_DE','Bitte um Fahnenkorrektur an Autor/in','{$authorName},\n\nwir bitten Sie, die Fahnenkorrektur von \"{$articleTitle}\" für {$journalName} vorzunehmen. Bitte gehen Sie folgendermaßen vor:\n1. Klicken Sie auf die unten stehende URL der Zeitschrift.\n2. Loggen Sie sich bei der Zeitschrift ein und öffnen Sie die KORREKTURHINWEISE.\n3. Klicken Sie auf KORREKTURFAHNE ANSEHEN und überprüfen Sie die Typographie und die Formatierungen.\n4. Geben Sie typographische Korrekturen und Formatänderungen ein.\n5. Speichern Sie die Datei ab und schicken Sie sie per E-Mail an die Layoutredaktion und das Korrekturlektorat.\n6. Senden Sie die ABGESCHLOSSEN-E-Mail an die Redaktion.\n\nURL des Beitrags: {$submissionUrl}\nBenutzer/innenname: {$authorUsername}\n\n{$editorialContactSignature}','Diese E-Mail von der/dem Rubrikredakteur/in an die/den Autor/in benachrichtigt diese/n, dass die Fahnen eines Artikels zum Korrekturlektorat bereit stehen. Sie liefert Informationen über den Beitrag und darüber, wie auf ihn zugegriffen werden kann.'),('PROOFREAD_AUTHOR_COMPLETE','de_DE','Korrekturen abgeschlossen (Autor/in)','{$editorialContactName},\n\nich habe die Fahnenkorrekturen meines Manuskripts \"{$articleTitle}\" für {$journalName} abgeschlossen. Die Fahnen können nun von Lektor/in und Layouter/in fertiggestellt werden.\n\n{$authorName}','Diese E-Mail von der/dem Autor/in an Korrekturlektor/in und Redakteur/in benachrichtigt diese, dass der Korrekturlektoratdurchgang der Autorin/des Autors abgeschlossen ist und dann Details in den Kommentaren zum Artikel zu finden sind.'),('PROOFREAD_AUTHOR_ACK','de_DE','Eingangsbestätigung für die Korrekturfassung an Autor/in','{$authorName},\n\nvielen Dank für die Fahnenkorrektur Ihres Manuskripts \"{$articleTitle}\". Wir freuen uns auf die baldige Veröffentlichung Ihres Beitrags in {$journalName}.\n\nWenn Sie sich für unseren Benachrichtigungsdienst einschreiben, erhalten Sie gleich bei Erscheinen eine E-Mail mit dem Inhaltsverzeichnis der neuen Nummer. Falls Sie Fragen haben, benachrichtigen Sie uns bitte.\n\n{$editorialContactSignature}','Diese E-Mail von der/dem Rubrikredakteur/in an die/den Autor/in bestätigt den Abschluss des ersten Korrekturlektoratdurchgangs und dankt ihr/ihm für die Mitwirkung.'),('PROOFREAD_REQUEST','de_DE','Korrekturlektorat-Anfrage','{$proofreaderName},\n\nder Beitrag \"{$articleTitle}\" für {$journalName} muss nun gemäß der folgenden Schritte durchgesehen werden.\n1. Klicken Sie unten auf die URL des Beitrags.\n2. Loggen Sie sich bei der Zeitschrift ein und lesen Sie die Korrekturhinweise.\n3. Klicken Sie auf KORREKTURFAHNE LESEN und überprüfen Sie die Fahnen in den jeweiligen Formaten.\n4. Geben Sie typographische Korrekturen und Formatänderungen ein.\n5. Speichern Sie die Korrekturen und senden sie per E-Mail an die Layouterin/den Layouter.\n6. Senden Sie die ABGESCHLOSSEN-E-Mail an die Redakteurin/den Redakteur.\n\nManuskript-URL: {$submissionUrl}\nBenutzer/innenname: {$proofreaderUsername}\n\nFalls Sie zur Zeit nicht in der Lage sein sollten, unserer Aufforderung nachzukommen, oder noch Fragen haben, geben Sie mir bitte Bescheid. Vielen Dank für Ihren Beitrag zu dieser Zeitschrift.\n\n{$editorialContactSignature}','Diese E-Mail von der/dem Rubrikredakteur/in an die/den Korrekturlektor/in bittet darum, dass diese/r die Fahnen eines Artikels korrekturliest. Sie liefert Informationen über den Artikel und darüber, wie auf ihn zugegriffen werden kann.'),('PROOFREAD_COMPLETE','de_DE','Lektorat beendet','{$editorialContactName},\n\nich habe das Lektorat für das Manuskript \"{$articleTitle}\" für {$journalName} beendet. Die Fahnen sind für die Endkorrekturen durch die Layoutredakteurin/den Layoutredakteur fertiggestellt.\n\n{$proofreaderName}','Diese E-Mail von der/dem Korrekturlektor/in an die/den Rubrikredakteur/in benachrichtigt diese/n, dass die/der Korrekturlektor/in das Korrekturlektorat beendet hat.'),('PROOFREAD_ACK','de_DE','Eingangsbestätigung für die Endkorrekturen','{$proofreaderName},\n\nvielen Dank für die Endkorrektur der Fahnen des Manuskripts \"{$articleTitle}\". Sie haben uns bei den Korrekturarbeiten an {$journalName} sehr geholfen.\n\n{$editorialContactSignature}','Diese E-Mail von der/dem Rubrikredakteur/in an die/den Korrekturlektor/in bestätigt den Abschluss des Korrekturlektorat-Prozesses durch die/den Korrekturlektor/in und dankt ihr/ihm für die Unterstützung.'),('PROOFREAD_LAYOUT_REQUEST','de_DE','Korrekturlektorat-Anfrage (Layouter/in)','{$layoutEditorName},\n\nder Beitrag \"{$articleTitle}\" für {$journalName} ist von Autor/in und Korrekturlektor/in durchgesehen worden, und alle Korrekturen sollten nun den folgenden Schritten gemäß durchgeführt werden.\n1. Klicken Sie auf die URL des Beitrags unten.\n2. Loggen Sie sich bei der Zeitschrift ein und lesen Sie die Korrekturen, um die korrigierten Fahnen zu erzeugen.\n3. Laden Sie die überarbeiteten Fahnen hoch.\n4. Senden Sie die ABGESCHLOSSEN-E-Mail in Schritt 3 des Korrekturlektorats an die Redakteurin/den Redakteur.\n\nURL {$journalName}: {$journalUrl}\nURL des Beitrags: {$submissionUrl}\nBenutzer/innenname: {$layoutEditorUsername}\n\nWenn Sie diese Aufgabe zur Zeit nicht erledigen können oder wenn Sie irgendwelche Fragen haben, kontaktieren Sie mich bitte. Danke für Ihren Beitrag zu dieser Zeitschrift.\n\n{$editorialContactSignature}','Diese E-Mail von der/dem Rubrikredakteur/in an die/den Layouter/in informiert diese/n, dass die Fahnen eines Artikels zum letzten Korrekturlektorat bereit stehen. Sie liefert Informationen über den Artikel und darüber, wie auf ihn zugegriffen werden kann.'),('PROOFREAD_LAYOUT_COMPLETE','de_DE','Eingangsbestätigung Korrekturlektorat (Korrekturlektor/in)','{$editorialContactName},\n\nnach dem Korrekturlektorat sind nun die Fahnen für das Manuskript \"{$articleTitle}\" für {$journalName} korrigiert worden. Der Beitrag liegt damit bereit zur Veröffentlichung.\n\n{$layoutEditorName}','Diese E-Mail von der/dem Layouter/in an die/den Rubrikredakteur/in informiert diese/n darüber, dass der letzte Schritt des Korrekturlektorats abgeschlossen worden ist und der Artikel nun zur Veröffentlichung bereit steht.'),('PROOFREAD_LAYOUT_ACK','de_DE','Eingangsbestätigung Korrekturlektorat (Layouter/in)','{$layoutEditorName},\n\nvielen Dank für den Abschluss der Änderungen aus dem Korrekturlektorat in den Fahnen zum Manuskript \"{$articleTitle}\" für {$journalName}. Dies stellt einen wichtigen Beitrag zur Arbeit dieser Zeitschrift dar.\n\n{$editorialContactSignature}','Diese E-Mail wird von der/dem Rubrikredakteur/in an die/den Layouter/in gesendet, um den Abschluss des letzten Schritts des Korrekturlektorats zu bestätigen und um ihr/ihm für die Mitwirkung zu danken.'),('EMAIL_LINK','de_DE','Möglicherweise interessierender Artikel','Ich dachte, Sie würden sich vielleicht für den Beitrag \"{$articleTitle}\" von {$authorName}, veröffentlicht in Band {$volume}, Nummer {$number} ({$year}) von {$journalName} unter \"{$articleUrl}\", interessieren.','Diese E-Mail-Vorlage gibt einer registrierten Leserin/einem registrierten Leser die Möglichkeit, Informationen über einen Artikel an jemanden zu senden, die/der sich eventuell dafür interessiert. Sie ist über die Lesewerkzeuge erreichbar und muss von der/dem Zeitschriftenverwalter/in in den Einstellungen der Lesewerkzeuge aktiviert werden.'),('SUBSCRIPTION_NOTIFY','de_DE','Abonnementbestätigung','{$subscriberName},\n\nSie wurden als Abonnent/in in unserem Zeitschriftenverwaltungssystem für {$journalName} registriert, und zwar in der folgenden Kategorie:\n\n{$subscriptionType}\n\nUm auf Inhalte, die nur Abonnent/innen zur Verfügung stehen, zuzugreifen, loggen Sie sich einfach mit Ihrem Benutzer/innennamen \"{$username}\" in das System ein.\n\nEinmal eingeloggt, können Sie jederzeit die Einzelheiten Ihres Benutzer/innenprofils und Ihr Passwort ändern.\n\nBeachten Sie bitte, dass Sie sich nicht einloggen müssen, wenn Sie ein institutionelles Abonnement haben. Das System gestattet Ihnen dann automatisch den Zugang zu den Inhalten für Abonnent/innen.\n\nFalls Sie Fragen haben, können Sie sich gerne an mich wenden.\n\n{$subscriptionContactSignature}','Diese E-Mail benachrichtigt eine/n registrierte/n Leser/in, dass die/der Abonnementverwalter/in für sie/ihn ein Abonnement angelegt hat. Sie liefert die URL der Zeitschrift und Zugriffsinformationen.'),('OPEN_ACCESS_NOTIFY','de_DE','Ausgabe jetzt im Open Access','Liebe Leser/innen,\n\n{$journalName} hat soeben die nächste Ausgabe frei zugänglich gemacht. Wir laden Sie ein, sich hier das Inhaltsverzeichnis und auf unserer Webseite ({$journalUrl}) die Sie interessierenden Beiträge anzusehen.\n\nWir danken für Ihr Interesse an unserer Arbeit,\n{$editorialContactSignature}\n{$editorialContactSignature}','Diese E-Mail wird an registrierte Leser/innen gesendet, die darum gebeten haben, informiert zu werden, wenn eine Ausgabe frei verfügbar wird.'),('SUBSCRIPTION_BEFORE_EXPIRY','de_DE','Benachrichtigung über ablaufendes Abonnement','{$subscriberName},\n\nIhr Abonnement für {$journalName} läuft demnächst aus.\n\n{$subscriptionType}\nExpiry date: {$expiryDate}\n\nUm den künftigen Zugang zu dieser Zeitschrift zu gewährleisten, gehen Sie bitte zur Website der Zeitschrift und erneuern Sie Ihr Abonnement. Sie können sich mit Ihrem Benutzer/innennamen \"{$username}\" in das System einloggen.\n\nFalls Sie Fragen haben, können Sie sich gerne an mich wenden.\n\n{$subscriptionContactSignature}','Diese E-Mail informiert eine/n Abonnentin/Abonnenten, dass ihr/sein Abonnement demnächst abläuft. Sie liefert die URL der Zeitschrift und Zugriffsinformationen.'),('SUBSCRIPTION_AFTER_EXPIRY','de_DE','Abonnement abgelaufen','{$subscriberName},\n\nIhr Abonnement für {$journalName} ist ausgelaufen.\n\n{$subscriptionType}\nAblaufdatum: {$expiryDate}\n\nFalls Sie Ihr Abonnement erneuern möchten, gehen Sie bitte zur Website der Zeitschrift. Sie können sich mit Ihrem Benutzer/innennamen \"{$username}\" in das System einloggen.\n\nFalls Sie Fragen haben, können Sie sich gerne an mich wenden.\n\n{$subscriptionContactSignature}','Diese E-Mail informiert eine/n Abonnentin/Abonnenten, dass ihr/sein Abonnement abgelaufen ist. Sie liefert die URL der Zeitschrift und Zugriffsinformationen.'),('SUBSCRIPTION_AFTER_EXPIRY_LAST','de_DE','Abonnement abgelaufen – letzte Benachrichtigung','{$subscriberName},\n\nIhr Abonnement für {$journalName} ist abgelaufen. Bitte beachten Sie, dass dies die letzte Benachrichtung ist, die wir Ihnen senden.\n\n{$subscriptionType}\nAblaufdatum: {$expiryDate}\n\nFalls Sie Ihr Abonnement erneuern möchten, gehen Sie bitte zur Website der Zeitschrift. Sie können sich mit Ihrem Benutzer/innennamen \"{$username}\" in das System einloggen.\n\nFalls Sie Fragen haben, können Sie sich gerne an mich wenden.\n\n{$subscriptionContactSignature}','Diese E-Mail informiert eine/n Abonnentin/Abonnenten, dass ihr/sein Abonnement abgelaufen ist. Sie liefert die URL der Zeitschrift und Zugriffsinformationen.'),('SUBSCRIPTION_PURCHASE_INDL','de_DE','Abschluss eines Abonnements: Individuell','Ein individuelles Abonnement ist online für {$journalName} mit den folgenden Details abgeschlossen worden.\n\nArt des Abonnements:\n{$subscriptionType}\n\nBenutzer/in:\n{$userDetails}\n\nInformationen zur Mitgliedschaft (sofern angegeben):\n{$membership}\n\nUm sich dieses Abonnement anzusehen oder es zu ändern, benutzen Sie bitte die folgende URL.\n\nAbonnement-URL: {$subscriptionUrl}\n','Diese E-Mail benachrichtigt die/den Abonnementverwalter/in, dass ein individuelles Abonnement online erworben worden ist. Sie liefert Informationen über das Abonnement und einen Link zum schnellen Zugriff auf das abgeschlossene Abonnement.'),('SUBSCRIPTION_PURCHASE_INSTL','de_DE','Abschluss eines Abonnements: Institutionell','Ein institutionelles Abonnement ist online für {$journalName} mit den folgenden Details abgeschlossen worden. Um dieses Abonnement zu aktivieren, benutzen Sie bitte den angegebenen Abonnement-URL und setzen Sie den Abonnementstatus auf \'Aktiv\'.\n\nArt des Abonnements:\n{$subscriptionType}\n\nInstitution:\n{$institutionName}\n{$institutionMailingAddress}\n\nDomain (sofern angegeben):\n{$domain}\n\nIP-Bereich (sofern angeben):\n{$ipRanges}\n\nKontaktperson:\n{$userDetails}\n\nInformationen zur Mitgliedschaft (sofern angegeben):\n{$membership}\n\nUm sich dieses Abonnement anzusehen oder es zu ändern, benutzen Sie bitte die folgende URL.\n\nAbonnement-URL: {$subscriptionUrl}\n','Diese E-Mail benachrichtigt die/den Abonnementverwalter/in, dass ein institutionelles Abonnement online erworben worden ist. Sie liefert Informationen über das Abonnement und einen Link zum schnellen Zugriff auf das abgeschlossene Abonnement.'),('SUBSCRIPTION_RENEW_INDL','de_DE','Erneuerung eines Abonnements: Individuell','Ein individuelles Abonnement ist online für {$journalName} mit den folgenden Details erneuert worden.\n\nArt des Abonnements:\n{$subscriptionType}\n\nBenutzer/in:\n{$userDetails}\n\nInformationen zur Mitgliedschaft (sofern angegeben):\n{$membership}\n\nUm sich dieses Abonnement anzusehen oder es zu ändern, benutzen Sie bitte die folgende URL.\n\nAbonnement-URL: {$subscriptionUrl}\n','Diese E-Mail benachrichtigt die/den Abonnementverwalter/in, dass ein individuelles Abonement online erneuert worden ist. Sie liefert Informationen über das Abonnement und einen Link zum schnellen Zugriff auf das erneuerte Abonnement.'),('SUBSCRIPTION_RENEW_INSTL','de_DE','Erneuerung eines Abonnements: Institutionell','Ein institutionelles Abonnement ist online für {$journalName} mit den folgenden Details erneuert worden.\n\nArt des Abonnements:\n{$subscriptionType}\n\nInstitution:\n{$institutionName}\n{$institutionMailingAddress}\n\nDomain (sofern angegeben):\n{$domain}\n\nIP-Bereich (sofern angeben):\n{$ipRanges}\n\nKontaktperson:\n{$userDetails}\n\nInformationen zur Mitgliedschaft (sofern angegeben):\n{$membership}\n\nUm sich dieses Abonnement anzusehen oder es zu ändern, benutzen Sie bitte die folgende URL.\n\nAbonnement-URL: {$subscriptionUrl}\n','Diese E-Mail benachrichtigt die/den Abonnementverwalter/in, dass ein institutionelles Abonement online erneuert worden ist. Sie liefert Informationen über das Abonnement und einen Link zum schnellen Zugriff auf das erneuerte Abonnement.'),('CITATION_EDITOR_AUTHOR_QUERY','de_DE','Zitationsbearbeitung','{$authorFirstName},\n\nkönnten Sie uns bitte die korrekte Zitation für den folgenden Verweis aus Ihrem Artikel {$articleTitle} bestätigen bzw. nachreichen:\n\n{$rawCitation}\n\nVielen Dank!\n\n{$userFirstName}\nLektor/in, {$journalName}\n','Diese E-Mail ermöglicht es Lektor/innen, zusätzliche Informationen über Verweise von Autor/innen anzufordern.'),('GIFT_AVAILABLE','de_DE','{$giftNoteTitle}','Dear {$recipientFirstName},\n\n{$buyerFullName} möchte mit Ihnen ein Geschenk bei {$giftJournalName} teilen:\n\n{$giftDetails}\n\n\n{$giftNote}\n\n\nSie werden eine Folgemail erhalten, die Login-Details und eine Anleitung zum Einlösen des Geschenks enthält.\n\nWir hoffen, dass Sie sich über Ihr Geschenk freuen!\n\n{$giftContactSignature}\n','Diese E-Mail benachrichtigt eine/n Geschenkempfänger/in, dass ein Geschenk erworben worden ist und zur Einlösung bereit steht.'),('GIFT_USER_REGISTER','de_DE','Lösen Sie Ihr Geschenk ein: Login-Details','Liebe/r {$recipientFirstName},\n\n{$buyerFullName} möchte mit Ihnen ein Geschenk bei {$giftJournalName} teilen:\n\n{$giftDetails}\n\n\nUm Ihr Geschenk einzulösen, loggen Sie sich bitte auf der Website der Zeitschrift unter {$giftUrl} ein.\n\nIhr Benutzer/innenname: {$username}\nIhr Passwort: {$password}\n\nSobald Sie sich eingeloggt haben, können Sie Ihr Passwort jederzeit ändern.\n\nWir hoffen, dass Sie sich über Ihr Geschenk freuen!\n\n{$giftContactSignature}\n','Diese E-Mail informiert eine/n Geschenkempfänger/in über die Login-Details für einen neuen Account.'),('GIFT_USER_LOGIN','de_DE','Lösen Sie Ihr Geschenk ein: Login-Details','Liebe/r {$recipientFirstName},\n\n{$buyerFullName} möchte mit Ihnen ein Geschenk bei {$giftJournalName} teilen:\n\n{$giftDetails}\n\n\nUm Ihr Geschenk einzulösen, loggen Sie sich bitte auf der Website der Zeitschrift unter {$giftUrl} ein.\n\nIhr Benutzer/innenname: {$username}\n\nWir hoffen, dass Sie sich über Ihr Geschenk freuen!\n\n{$giftContactSignature}\n','Diese E-Mail informiert eine/n Geschenkempfänger/in über seine/ihre Login-Details.'),('NOTIFICATION','en_US','New notification from {$siteTitle}','You have a new notification from {$siteTitle}:\n\n{$notificationContents}\n\nLink: {$url}\n\n{$principalContactSignature}','The email is sent to registered users that have selected to have this type of notification emailed to them.'),('NOTIFICATION_MAILLIST','en_US','New notification from {$siteTitle}','You have a new notification from {$siteTitle}:\n--\n{$notificationContents}\n\nLink: {$url}\n--\n\nIf you wish to stop receiving notification emails, please go to {$unsubscribeLink}.\n\n{$principalContactSignature}','This email is sent to unregistered users on the notification mailing list.'),('NOTIFICATION_MAILLIST_WELCOME','en_US','Welcome to the the {$siteTitle} mailing list!','You have signed up to receive notifications from {$siteTitle}.\n\nPlease click on this link to confirm your request and add your email address to the mailing list: {$confirmLink}\n\nIf you wish to stop receiving notification emails, please go to {$unsubscribeLink}.\n\n{$principalContactSignature}','This email is sent to an unregistered user who just registered with the notification mailing list.'),('PASSWORD_RESET_CONFIRM','en_US','Password Reset Confirmation','We have received a request to reset your password for the {$siteTitle} web site.\n\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.\n\nReset my password: {$url}\n\n{$principalContactSignature}','This email is sent to a registered user when they indicate that they have forgotten their password or are unable to login. It provides a URL they can follow to reset their password.'),('PASSWORD_RESET','en_US','Password Reset','Your password has been successfully reset for use with the {$siteTitle} web site. Please retain this username and password, as it is necessary for all work with the journal.\n\nYour username: {$username}\nYour new password: {$password}\n\n{$principalContactSignature}','This email is sent to a registered user when they have successfully reset their password following the process described in the PASSWORD_RESET_CONFIRM email.'),('USER_REGISTER','en_US','Journal Registration','{$userFullName}\n\nYou have now been registered as a user with {$journalName}. We have included your username and password in this email, which are needed for all work with this journal through its website. At any point, you can ask to be removed from the journal\'s list of users by contacting me.\n\nUsername: {$username}\nPassword: {$password}\n\nThank you,\n{$principalContactSignature}','This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.'),('USER_VALIDATE','en_US','Validate Your Account','{$userFullName}\n\nYou have created an account with {$journalName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:\n\n{$activateUrl}\n\nThank you,\n{$principalContactSignature}','This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.'),('REVIEWER_REGISTER','en_US','Registration as Reviewer with {$journalName}','In light of your expertise, we have taken the liberty of registering your name in the reviewer database for {$journalName}. This does not entail any form of commitment on your part, but simply enables us to approach you with a submission to possibly review. On being invited to review, you will have an opportunity to see the title and abstract of the paper in question, and you\'ll always be in a position to accept or decline the invitation. You can also ask at any point to have your name removed from this reviewer list.\n\nWe are providing you with a username and password, which is used in all interactions with the journal through its website. You may wish, for example, to update your profile, including your reviewing interests.\n\nUsername: {$username}\nPassword: {$password}\n\nThank you,\n{$principalContactSignature}','This email is sent to a newly registered reviewer to welcome them to the system and provide them with a record of their username and password.'),('PUBLISH_NOTIFY','en_US','New Issue Published','Readers:\n\n{$journalName} has just published its latest issue at {$journalUrl}. We invite you to review the Table of Contents here and then visit our web site to review articles and items of interest.\n\nThanks for the continuing interest in our work,\n{$editorialContactSignature}','This email is sent to registered readers via the \"Notify Users\" link in the Editor\'s User Home. It notifies readers of a new issue and invites them to visit the journal at a supplied URL.'),('LOCKSS_EXISTING_ARCHIVE','en_US','Archiving Request for {$journalName}','Dear [University Librarian]\n\n{$journalName} <{$journalUrl}>, is a journal for which a member of your faculty, [name of member], serves as a [title of position]. The journal is seeking to establish a LOCKSS (Lots of Copies Keep Stuff Safe) compliant archive with this and other university libraries.\n\n[Brief description of journal]\n\nThe URL to the LOCKSS Publisher Manifest for our journal is: {$journalUrl}/gateway/lockss\n\nWe understand that you are already participating in LOCKSS. If we can provide any additional metadata for purposes of registering our journal with your version of LOCKSS, we would be happy to provide it.\n\nThank you,\n{$principalContactSignature}','This email requests the keeper of a LOCKSS archive to consider including this journal in their archive. It provides the URL to the journal\'s LOCKSS Publisher Manifest.'),('LOCKSS_NEW_ARCHIVE','en_US','Archiving Request for {$journalName}','Dear [University Librarian]\n\n{$journalName} <{$journalUrl}>, is a journal for which a member of your faculty, [name of member] serves as a [title of position]. The journal is seeking to establish a LOCKSS (Lots of Copies Keep Stuff Safe) compliant archive with this and other university libraries.\n\n[Brief description of journal]\n\nThe LOCKSS Program <http://lockss.org/>, an international library/publisher initiative, is a working example of a distributed preservation and archiving repository, additional details are below. The software, which runs on an ordinary personal computer is free; the system is easily brought on-line; very little ongoing maintenance is required.\n\nTo assist in the archiving of our journal, we invite you to become a member of the LOCKSS community, to help collect and preserve titles produced by your faculty and by other scholars worldwide. To do so, please have someone on your staff visit the LOCKSS site for information on how this system operates. I look forward to hearing from you on the feasibility of providing this archiving support for this journal.\n\nThank you,\n{$principalContactSignature}','This email encourages the recipient to participate in the LOCKSS initiative and include this journal in the archive. It provides information about the LOCKSS initiative and ways to become involved.'),('SUBMISSION_ACK','en_US','Submission Acknowledgement','{$authorName}:\n\nThank you for submitting the manuscript, \"{$articleTitle}\" to {$journalName}. With the online journal management system that we are using, you will be able to track its progress through the editorial process by logging in to the journal web site:\n\nManuscript URL: {$submissionUrl}\nUsername: {$authorUsername}\n\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.\n\n{$editorialContactSignature}','This email, when enabled, is automatically sent to an author when he or she completes the process of submitting a manuscript to the journal. It provides information about tracking the submission through the process and thanks the author for the submission.'),('SUBMISSION_UNSUITABLE','en_US','Unsuitable Submission','{$authorName}:\n\nAn initial review of \"{$articleTitle}\" has made it clear that this submission does not fit within the scope and focus of {$journalName}. I recommend that you consult the description of this journal under About, as well as its current contents, to learn more about the work that we publish. You might also consider submitting this manuscript to another, more suitable journal.\n\n{$editorialContactSignature}',''),('SUBMISSION_COMMENT','en_US','Submission Comment','{$name}:\n\n{$commentName} has added a comment to the submission, \"{$articleTitle}\" in {$journalName}:\n\n{$comments}','This email notifies the various people involved in a submission\'s editing process that a new comment has been posted.'),('SUBMISSION_DECISION_REVIEWERS','en_US','Decision on \"{$articleTitle}\"','As one of the reviewers for the submission, \"{$articleTitle},\" to {$journalName}, I am sending you the reviews and editorial decision sent to the author of this piece. Thank you again for your important contribution to this process.\n\n{$editorialContactSignature}\n\n{$comments}','This email notifies the reviewers of a submission that the review process has been completed. It includes information about the article and the decision reached, and thanks the reviewers for their contributions.'),('EDITOR_ASSIGN','en_US','Editorial Assignment','{$editorialContactName}:\n\nThe submission, \"{$articleTitle},\" to {$journalName} has been assigned to you to see through the editorial process in your role as Section Editor.\n\nSubmission URL: {$submissionUrl}\nUsername: {$editorUsername}\n\nThank you,\n{$editorialContactSignature}','This email notifies a Section Editor that the Editor has assigned them the task of overseeing a submission through the editing process. It provides information about the submission and how to access the journal site.'),('REVIEW_REQUEST','en_US','Article Review Request','{$reviewerName}:\n\nI believe that you would serve as an excellent reviewer of the manuscript, \"{$articleTitle},\" which has been submitted to {$journalName}. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.\n\nPlease log into the journal web site by {$weekLaterDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is {$journalUrl}\n\nThe review itself is due {$reviewDueDate}.\n\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}\n\nSubmission URL: {$submissionReviewUrl}\n\nThank you for considering this request.\n\n{$editorialContactSignature}\n\n\n\n\"{$articleTitle}\"\n\n{$abstractTermIfEnabled}\n{$articleAbstract}','This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Journal Setup, Step 2. (Otherwise see REVIEW_REQUEST_ATTACHED.)'),('REVIEW_REQUEST_ONECLICK','en_US','Article Review Request','{$reviewerName}:\n\nI believe that you would serve as an excellent reviewer of the manuscript, \"{$articleTitle},\" which has been submitted to {$journalName}. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.\n\nPlease log into the journal web site by {$weekLaterDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.\n\nThe review itself is due {$reviewDueDate}.\n\nSubmission URL: {$submissionReviewUrl}\n\nThank you for considering this request.\n\n{$editorialContactSignature}\n\n\n\n\"{$articleTitle}\"\n\n{$abstractTermIfEnabled}\n{$articleAbstract}','This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Journal Setup, Step 2, and one-click reviewer access is enabled.'),('REVIEW_REQUEST_ATTACHED','en_US','Article Review Request','{$reviewerName}:\n\nI believe that you would serve as an excellent reviewer of the manuscript, \"{$articleTitle},\" and I am asking that you consider undertaking this important task for us. The Review Guidelines for this journal are appended below, and the submission is attached to this email. Your review of the submission, along with your recommendation, should be emailed to me by {$reviewDueDate}.\n\nPlease indicate in a return email by {$weekLaterDate} whether you are able and willing to do the review.\n\nThank you for considering this request.\n\n{$editorialContactSignature}\n\n\nReview Guidelines\n\n{$reviewGuidelines}\n','This email is sent by the Section Editor to a Reviewer to request that they accept or decline the task of reviewing a submission. It includes the submission as an attachment. This message is used when the Email-Attachment Review Process is selected in Journal Setup, Step 2. (Otherwise see REVIEW_REQUEST.)'),('REVIEW_CANCEL','en_US','Request for Review Cancelled','{$reviewerName}:\n\nWe have decided at this point to cancel our request for you to review the submission, \"{$articleTitle},\" for {$journalName}. We apologize for any inconvenience this may cause you and hope that we will be able to call on you to assist with this journal\'s review process in the future.\n\nIf you have any questions, please contact me.\n\n{$editorialContactSignature}','This email is sent by the Section Editor to a Reviewer who has a submission review in progress to notify them that the review has been cancelled.'),('REVIEW_CONFIRM','en_US','Able to Review','{$editorialContactName}:\n\nI am able and willing to review the submission, \"{$articleTitle},\" for {$journalName}. Thank you for thinking of me, and I plan to have the review completed by its due date, {$reviewDueDate}, if not before.\n\n{$reviewerName}','This email is sent by a Reviewer to the Section Editor in response to a review request to notify the Section Editor that the review request has been accepted and will be completed by the specified date.'),('REVIEW_DECLINE','en_US','Unable to Review','{$editorialContactName}:\n\nI am afraid that at this time I am unable to review the submission, \"{$articleTitle},\" for {$journalName}. Thank you for thinking of me, and another time feel free to call on me.\n\n{$reviewerName}','This email is sent by a Reviewer to the Section Editor in response to a review request to notify the Section Editor that the review request has been declined.'),('REVIEW_COMPLETE','en_US','Article Review Completed','{$editorialContactName}:\n\nI have now completed my review of \"{$articleTitle}\" for {$journalName}, and submitted my recommendation, \"{$recommendation}.\"\n\n{$reviewerName}','This email is sent by a Reviewer to the Section Editor to notify them that a review has been completed and the comments and recommendations have been recorded on the journal web site.'),('REVIEW_ACK','en_US','Article Review Acknowledgement','{$reviewerName}:\n\nThank you for completing the review of the submission, \"{$articleTitle},\" for {$journalName}. We appreciate your contribution to the quality of the work that we publish.\n\n{$editorialContactSignature}','This email is sent by a Section Editor to confirm receipt of a completed review and thank the reviewer for their contributions.'),('REVIEW_REMIND','en_US','Submission Review Reminder','{$reviewerName}:\n\nJust a gentle reminder of our request for your review of the submission, \"{$articleTitle},\" for {$journalName}. We were hoping to have this review by {$reviewDueDate}, and would be pleased to receive it as soon as you are able to prepare it.\n\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}\n\nSubmission URL: {$submissionReviewUrl}\n\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.\n\n{$editorialContactSignature}','This email is sent by a Section Editor to remind a reviewer that their review is due.'),('REVIEW_REMIND_ONECLICK','en_US','Submission Review Reminder','{$reviewerName}:\n\nJust a gentle reminder of our request for your review of the submission, \"{$articleTitle},\" for {$journalName}. We were hoping to have this review by {$reviewDueDate}, and would be pleased to receive it as soon as you are able to prepare it.\n\nSubmission URL: {$submissionReviewUrl}\n\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.\n\n{$editorialContactSignature}','This email is sent by a Section Editor to remind a reviewer that their review is due.'),('REVIEW_REMIND_AUTO','en_US','Automated Submission Review Reminder','{$reviewerName}:\n\nJust a gentle reminder of our request for your review of the submission, \"{$articleTitle},\" for {$journalName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.\n\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}\n\nSubmission URL: {$submissionReviewUrl}\n\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.\n\n{$editorialContactSignature}','This email is automatically sent when a reviewer\'s due date elapses (see Review Options under Journal Setup, Step 2) and one-click reviewer access is disabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),('REVIEW_REMIND_AUTO_ONECLICK','en_US','Automated Submission Review Reminder','{$reviewerName}:\n\nJust a gentle reminder of our request for your review of the submission, \"{$articleTitle},\" for {$journalName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.\n\nSubmission URL: {$submissionReviewUrl}\n\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.\n\n{$editorialContactSignature}','This email is automatically sent when a reviewer\'s due date elapses (see Review Options under Journal Setup, Step 2) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),('EDITOR_DECISION_ACCEPT','en_US','Editor Decision','{$authorName}:\n\nWe have reached a decision regarding your submission to {$journalTitle}, \"{$articleTitle}\".\n\nOur decision is to:\n\n{$editorialContactSignature}\n','This email from the Editor or Section Editor to an Author notifies them of a final decision regarding their submission.'),('EDITOR_DECISION_REVISIONS','en_US','Editor Decision','{$authorName}:\n\nWe have reached a decision regarding your submission to {$journalTitle}, \"{$articleTitle}\".\n\nOur decision is to:\n\n{$editorialContactSignature}\n','This email from the Editor or Section Editor to an Author notifies them of a final decision regarding their submission.'),('EDITOR_DECISION_RESUBMIT','en_US','Editor Decision','{$authorName}:\n\nWe have reached a decision regarding your submission to {$journalTitle}, \"{$articleTitle}\".\n\nOur decision is to:\n\n{$editorialContactSignature}\n','This email from the Editor or Section Editor to an Author notifies them of a final decision regarding their submission.'),('EDITOR_DECISION_DECLINE','en_US','Editor Decision','{$authorName}:\n\nWe have reached a decision regarding your submission to {$journalTitle}, \"{$articleTitle}\".\n\nOur decision is to:\n\n{$editorialContactSignature}\n','This email from the Editor or Section Editor to an Author notifies them of a final decision regarding their submission.'),('COPYEDIT_REQUEST','en_US','Copyediting Request','{$copyeditorName}:\n\nI would ask that you undertake the copyediting of \"{$articleTitle}\" for {$journalName} by following these steps.\n1. Click on the Submission URL below.\n2. Log into the journal and click on the File that appears in Step 1.\n3. Consult Copyediting Instructions posted on webpage.\n4. Open the downloaded file and copyedit, while adding Author Queries as needed.\n5. Save copyedited file, and upload to Step 1 of Copyediting.\n6. Send the COMPLETE email to the editor.\n\n{$journalName} URL: {$journalUrl}\nSubmission URL: {$submissionCopyeditingUrl}\nUsername: {$copyeditorUsername}\n\n{$editorialContactSignature}','This email is sent by a Section Editor to a submission\'s Copyeditor to request that they begin the copyediting process. It provides information about the submission and how to access it.'),('COPYEDIT_COMPLETE','en_US','Copyediting Completed','{$editorialContactName}:\n\nWe have now copyedited your submission \"{$articleTitle}\" for {$journalName}. To review the proposed changes and respond to Author Queries, please follow these steps:\n\n1. Log into the journal using URL below with your username and password (use Forgot link if needed).\n2. Click on the file at 1. Initial Copyedit File to download and open copyedited version.\n3. Review the copyediting, making changes using Track Changes in Word, and answer queries.\n4. Save file to desktop and upload it in 2. Author Copyedit.\n5. Click the email icon under COMPLETE and send email to the editor.\n\nThis is the last opportunity that you have to make substantial changes. You will be asked at a later stage to proofread the galleys, but at that point only minor typographical and layout errors can be corrected.\n\nManuscript URL: {$submissionEditingUrl}\nUsername: {$authorUsername}\n\nIf you are unable to undertake this work at this time or have any questions,\nplease contact me. Thank you for your contribution to this journal.\n\n{$copyeditorName}',''),('COPYEDIT_ACK','en_US','Copyediting Acknowledgement','{$copyeditorName}:\n\nThank you for copyediting the manuscript, \"{$articleTitle},\" for {$journalName}. It will make an important contribution to the quality of this journal.\n\n{$editorialContactSignature}','This email is sent by the Section Editor to a submission\'s Copyeditor to acknowledge that the Copyeditor has successfully completed the copyediting process and thank them for their contribution.'),('COPYEDIT_AUTHOR_REQUEST','en_US','Copyediting Review Request','{$authorName}:\n\nYour submission \"{$articleTitle}\" for {$journalName} has been through the first step of copyediting, and is available for you to review by following these steps.\n\n1. Click on the Submission URL below.\n2. Log into the journal and click on the File that appears in Step 1.\n3. Open the downloaded submission.\n4. Review the text, including copyediting proposals and Author Queries.\n5. Make any copyediting changes that would further improve the text.\n6. When completed, upload the file in Step 2.\n7. Click on METADATA to check indexing information for completeness and accuracy.\n8. Send the COMPLETE email to the editor and copyeditor.\n\nSubmission URL: {$submissionCopyeditingUrl}\nUsername: {$authorUsername}\n\nThis is the last opportunity to make substantial copyediting changes to the submission. The proofreading stage, that follows the preparation of the galleys, is restricted to correcting typographical and layout errors.\n\nIf you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this journal.\n\n{$editorialContactSignature}','This email is sent by the Section Editor to a submission\'s Author to request that they proofread the work of the copyeditor. It provides access information for the manuscript and warns that this is the last opportunity the author has to make substantial changes.'),('COPYEDIT_AUTHOR_COMPLETE','en_US','Copyediting Review Completed','{$editorialContactName}:\n\nI have now reviewed the copyediting of the manuscript, \"{$articleTitle},\" for {$journalName}, and it is ready for the final round of copyediting and preparation for Layout.\n\nThank you for this contribution to my work,\n{$authorName}','This email is sent by the Author to the Section Editor to notify them that the Author\'s copyediting process has been completed.'),('COPYEDIT_AUTHOR_ACK','en_US','Copyediting Review Acknowledgement','{$authorName}:\n\nThank you for reviewing the copyediting of your manuscript, \"{$articleTitle},\" for {$journalName}. We look forward to publishing this work.\n\n{$editorialContactSignature}','This email is sent by the Section Editor to a submission\'s Author to confirm completion of the Author\'s copyediting process and thank them for their contribution.'),('COPYEDIT_FINAL_REQUEST','en_US','Copyediting Final Review','{$copyeditorName}:\n\nThe author and editor have now completed their copyediting review of \"{$articleTitle}\" for {$journalName}. A \"clean copy\" now needs to be prepared for Layout by going through the following steps.\n1. Click on the Submission URL below.\n2. Log into the journal and click on the File that appears in Step 2.\n3. Open the downloaded file and incorporate all copyedits and query responses.\n4. Save clean file, and upload to Step 3 of Copyediting.\n5. Click on METADATA to check indexing information (saving any corrections).\n6. Send the COMPLETE email to the editor.\n\n{$journalName} URL: {$journalUrl}\nSubmission URL: {$submissionCopyeditingUrl}\nUsername: {$copyeditorUsername}\n\n{$editorialContactSignature}','This email from the Section Editor to the Copyeditor requests that they perform a final round of copyediting on a submission before it enters the layout process.'),('COPYEDIT_FINAL_COMPLETE','en_US','Copyediting Final Review Completed','{$editorialContactName}:\n\nI have now prepared a clean, copyedited version of the manuscript, \"{$articleTitle},\" for {$journalName}. It is ready for Layout and the preparation of the galleys.\n\n{$copyeditorName}','This email from the Copyeditor to the Section Editor notifies them that the final round of copyediting has been completed and that the layout process may now begin.'),('COPYEDIT_FINAL_ACK','en_US','Copyediting Final Review Acknowledgement','{$copyeditorName}:\n\nThank you for completing the copyediting of the manuscript, \"{$articleTitle},\" for {$journalName}. This preparation of a \"clean copy\" for Layout is an important step in the editorial process.\n\n{$editorialContactSignature}','This email from the Section Editor to the Copyeditor acknowledges completion of the final round of copyediting and thanks them for their contribution.'),('LAYOUT_REQUEST','en_US','Request Galleys','{$layoutEditorName}:\n\nThe submission \"{$articleTitle}\" to {$journalName} now needs galleys laid out by following these steps.\n1. Click on the Submission URL below.\n2. Log into the journal and use the Layout Version file to create the galleys according to the journal\'s standards.\n3. Send the COMPLETE email to the editor.\n\n{$journalName} URL: {$journalUrl}\nSubmission URL: {$submissionLayoutUrl}\nUsername: {$layoutEditorUsername}\n\nIf you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this journal.\n\n{$editorialContactSignature}','This email from the Section Editor to the Layout Editor notifies them that they have been assigned the task of performing layout editing on a submission. It provides information about the submission and how to access it.'),('LAYOUT_COMPLETE','en_US','Galleys Complete','{$editorialContactName}:\n\nGalleys have now been prepared for the manuscript, \"{$articleTitle},\" for {$journalName} and are ready for proofreading.\n\nIf you have any questions, please contact me.\n\n{$layoutEditorName}','This email from the Layout Editor to the Section Editor notifies them that the layout process has been completed.'),('LAYOUT_ACK','en_US','Layout Acknowledgement','{$layoutEditorName}:\n\nThank you for preparing the galleys for the manuscript, \"{$articleTitle},\" for {$journalName}. This is an important contribution to the publishing process.\n\n{$editorialContactSignature}','This email from the Section Editor to the Layout Editor acknowledges completion of the layout editing process and thanks the layout editor for their contribution.'),('PROOFREAD_AUTHOR_REQUEST','en_US','Proofreading Request (Author)','{$authorName}:\n\nYour submission \"{$articleTitle}\" to {$journalName} now needs to be proofread by folllowing these steps.\n1. Click on the Submission URL below.\n2. Log into the journal and view PROOFING INSTRUCTIONS\n3. Click on VIEW PROOF in Layout and proof the galley in the one or more formats used.\n4. Enter corrections (typographical and format) in Proofreading Corrections.\n5. Save and email corrections to Layout Editor and Proofreader.\n6. Send the COMPLETE email to the editor.\n\nSubmission URL: {$submissionUrl}\nUsername: {$authorUsername}\n\n{$editorialContactSignature}','This email from the Section Editor to the Author notifies them that an article\'s galleys are ready for proofreading. It provides information about the article and how to access it.'),('PROOFREAD_AUTHOR_COMPLETE','en_US','Proofreading Completed (Author)','{$editorialContactName}:\n\nI have completed proofreading the galleys for my manuscript, \"{$articleTitle},\" for {$journalName}. The galleys are now ready to have any final corrections made by the Proofreader and Layout Editor.\n\n{$authorName}','This email from the Author to the Proofreader and Editor notifies them that the Author\'s round of proofreading is complete and that details can be found in the article comments.'),('PROOFREAD_AUTHOR_ACK','en_US','Proofreading Acknowledgement (Author)','{$authorName}:\n\nThank you for proofreading the galleys for your manuscript, \"{$articleTitle},\" in {$journalName}. We are looking forward to publishing your work shortly.\n\nIf you subscribe to our notification service, you will receive an email of the Table of Contents as soon as it is published. If you have any questions, please contact me.\n\n{$editorialContactSignature}','This email from the Section Editor to the Author acknowledges completion of the initial proofreading process and thanks them for their contribution.'),('PROOFREAD_REQUEST','en_US','Proofreading Request','{$proofreaderName}:\n\nThe submission \"{$articleTitle}\" to {$journalName} now needs to be proofread by following these steps.\n1. Click on the Submission URL below.\n2. Log into the journal and view PROOFING INSTRUCTIONS.\n3. Click on VIEW PROOF in Layout and proof the galley in the one or more formats used.\n4. Enter corrections (typographical and format) in Proofreading Corrections.\n5. Save and email corrections to Layout Editor.\n6. Send the COMPLETE email to the editor.\n\nManuscript URL: {$submissionUrl}\nUsername: {$proofreaderUsername}\n\nIf you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this journal.\n\n{$editorialContactSignature}','This email from the Section Editor to the Proofreader requests that they perform proofreading of an article\'s galleys. It provides information about the article and how to access it.'),('PROOFREAD_COMPLETE','en_US','Proofreading Completed','{$editorialContactName}:\n\nI have completed proofreading the galleys for the manuscript, \"{$articleTitle},\" for {$journalName}. The galleys are now ready to have any final corrections made by the Layout Editor.\n\n{$proofreaderName}','This email from the Proofreader to the Section Editor notifies them that the Proofreader has completed the proofreading process.'),('PROOFREAD_ACK','en_US','Proofreading Acknowledgement','{$proofreaderName}:\n\nThank you for proofreading the galleys for the manuscript, \"{$articleTitle},\" for {$journalName}. This work makes an important contribution to the quality of this journal.\n\n{$editorialContactSignature}','This email from the Section Editor to the Proofreader confirms completion of the proofreader\'s proofreading process and thanks them for their contribution.'),('PROOFREAD_LAYOUT_REQUEST','en_US','Proofreading Request (Layout Editor)','{$layoutEditorName}:\n\nThe submission \"{$articleTitle}\" to {$journalName} has been proofread by the author and proofreader, and any corrections should now be made by following these steps.\n1. Click on the Submission URL below.\n2. Log into the journal consult Proofreading Corrections to create corrected galleys.\n3. Upload the revised galleys.\n4. Send the COMPLETE email in Proofreading Step 3 to the editor.\n\n{$journalName} URL: {$journalUrl}\nSubnmission URL: {$submissionUrl}\nUsername: {$layoutEditorUsername}\n\nIf you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this journal.\n\n{$editorialContactSignature}','This email from the Section Editor to the Layout Editor notifies them that an article\'s galleys are ready for final proofreading. It provides information on the article and how to access it.'),('PROOFREAD_LAYOUT_COMPLETE','en_US','Proofreading Completed (Layout Editor)','{$editorialContactName}:\n\nThe galleys have now been corrected, following their proofreading, for the manuscript, \"{$articleTitle},\" for {$journalName}. This piece is now ready to publish.\n\n{$layoutEditorName}','This email from the Layout Editor to the Section Editor notifies them that the final stage of proofreading has been completed and the article is now ready to publish.'),('PROOFREAD_LAYOUT_ACK','en_US','Proofreading Acknowledgement (Layout Editor)','{$layoutEditorName}:\n\nThank you for completing the proofreading corrections for the galleys associated with the manuscript, \"{$articleTitle},\" for {$journalName}. This represents an important contribution to the work of this journal.\n\n{$editorialContactSignature}','This email from the Section Editor to the Layout Editor acknowledges completion of the final stage of proofreading and thanks them for their contribution.'),('EMAIL_LINK','en_US','Article of Possible Interest','Thought you might be interested in seeing \"{$articleTitle}\" by {$authorName} published in Vol {$volume}, No {$number} ({$year}) of {$journalName} at \"{$articleUrl}\".','This email template provides a registered reader with the opportunity to send information about an article to somebody who may be interested. It is available via the Reading Tools and must be enabled by the Journal Manager in the Reading Tools Administration page.'),('SUBSCRIPTION_NOTIFY','en_US','Subscription Notification','{$subscriberName}:\n\nYou have now been registered as a subscriber in our online journal management system for {$journalName}, with the following subscription:\n\n{$subscriptionType}\n\nTo access content that is available only to subscribers, simply log in to the system with your username, \"{$username}\".\n\nOnce you have logged in to the system you can change your profile details and password at any point.\n\nPlease note that if you have an institutional subscription, there is no need for users at your institution to log in, since requests for subscription content will be automatically authenticated by the system.\n\nIf you have any questions, please feel free to contact me.\n\n{$subscriptionContactSignature}','This email notifies a registered reader that the Manager has created a subscription for them. It provides the journal\'s URL along with instructions for access.'),('OPEN_ACCESS_NOTIFY','en_US','Issue Now Open Access','Readers:\n\n{$journalName} has just made available in an open access format the following issue. We invite you to review the Table of Contents here and then visit our web site ({$journalUrl}) to review articles and items of interest.\n\nThanks for the continuing interest in our work,\n{$editorialContactSignature}','This email is sent to registered readers who have requested to receive a notification email when an issue becomes open access.'),('SUBSCRIPTION_BEFORE_EXPIRY','en_US','Notice of Subscription Expiry','{$subscriberName}:\n\nYour {$journalName} subscription is about to expire.\n\n{$subscriptionType}\nExpiry date: {$expiryDate}\n\nTo ensure the continuity of your access to this journal, please go to the journal website and renew your subscription. You are able to log in to the system with your username, \"{$username}\".\n\nIf you have any questions, please feel free to contact me.\n\n{$subscriptionContactSignature}','This email notifies a subscriber that their subscription will soon expire. It provides the journal\'s URL along with instructions for access.'),('SUBSCRIPTION_AFTER_EXPIRY','en_US','Subscription Expired','{$subscriberName}:\n\nYour {$journalName} subscription has expired.\n\n{$subscriptionType}\nExpiry date: {$expiryDate}\n\nTo renew your subscription, please go to the journal website. You are able to log in to the system with your username, \"{$username}\".\n\nIf you have any questions, please feel free to contact me.\n\n{$subscriptionContactSignature}','This email notifies a subscriber that their subscription has expired. It provides the journal\'s URL along with instructions for access.'),('SUBSCRIPTION_AFTER_EXPIRY_LAST','en_US','Subscription Expired - Final Reminder','{$subscriberName}:\n\nYour {$journalName} subscription has expired.\nPlease note that this is the final reminder that will be emailed to you.\n\n{$subscriptionType}\nExpiry date: {$expiryDate}\n\nTo renew your subscription, please go to the journal website. You are able to log in to the system with your username, \"{$username}\".\n\nIf you have any questions, please feel free to contact me.\n\n{$subscriptionContactSignature}','This email notifies a subscriber that their subscription has expired. It provides the journal\'s URL along with instructions for access.'),('SUBSCRIPTION_PURCHASE_INDL','en_US','Subscription Purchase: Individual','An individual subscription has been purchased online for {$journalName} with the following details.\n\nSubscription Type:\n{$subscriptionType}\n\nUser:\n{$userDetails}\n\nMembership Information (if provided):\n{$membership}\n\nTo view or edit this subscription, please use the following URL.\n\nSubscription URL: {$subscriptionUrl}\n','This email notifies the Subscription Manager that an individual subscription has been purchased online. It provides summary information about the subscription and a quick access link to the purchased subscription.'),('SUBSCRIPTION_PURCHASE_INSTL','en_US','Subscription Purchase: Institutional','An institutional subscription has been purchased online for {$journalName} with the following details. To activate this subscription, please use the provided Subscription URL and set the subscription status to \'Active\'.\n\nSubscription Type:\n{$subscriptionType}\n\nInstitution:\n{$institutionName}\n{$institutionMailingAddress}\n\nDomain (if provided):\n{$domain}\n\nIP Ranges (if provided):\n{$ipRanges}\n\nContact Person:\n{$userDetails}\n\nMembership Information (if provided):\n{$membership}\n\nTo view or edit this subscription, please use the following URL.\n\nSubscription URL: {$subscriptionUrl}\n','This email notifies the Subscription Manager that an institutional subscription has been purchased online. It provides summary information about the subscription and a quick access link to the purchased subscription.'),('SUBSCRIPTION_RENEW_INDL','en_US','Subscription Renewal: Individual','An individual subscription has been renewed online for {$journalName} with the following details.\n\nSubscription Type:\n{$subscriptionType}\n\nUser:\n{$userDetails}\n\nMembership Information (if provided):\n{$membership}\n\nTo view or edit this subscription, please use the following URL.\n\nSubscription URL: {$subscriptionUrl}\n','This email notifies the Subscription Manager that an individual subscription has been renewed online. It provides summary information about the subscription and a quick access link to the renewed subscription.'),('SUBSCRIPTION_RENEW_INSTL','en_US','Subscription Renewal: Institutional','An institutional subscription has been renewed online for {$journalName} with the following details.\n\nSubscription Type:\n{$subscriptionType}\n\nInstitution:\n{$institutionName}\n{$institutionMailingAddress}\n\nDomain (if provided):\n{$domain}\n\nIP Ranges (if provided):\n{$ipRanges}\n\nContact Person:\n{$userDetails}\n\nMembership Information (if provided):\n{$membership}\n\nTo view or edit this subscription, please use the following URL.\n\nSubscription URL: {$subscriptionUrl}\n','This email notifies the Subscription Manager that an institutional subscription has been renewed online. It provides summary information about the subscription and a quick access link to the renewed subscription.'),('CITATION_EDITOR_AUTHOR_QUERY','en_US','Citation Editing','{$authorFirstName},\n\nCould you please verify or provide us with the proper citation for the following reference from your article, {$articleTitle}:\n\n{$rawCitation}\n\nThanks!\n\n{$userFirstName}\nCopy-Editor, {$journalName}\n','This email allows copyeditors to request additional information about references from authors.'),('GIFT_AVAILABLE','en_US','{$giftNoteTitle}','Dear {$recipientFirstName},\n\n{$buyerFullName} would like to share a gift with you at {$giftJournalName}:\n\n{$giftDetails}\n\n\n{$giftNote}\n\n\nYou will receive a follow-up email that includes login details and instructions for redeeming your gift.\n\nWe hope that you enjoy your gift!\n\n{$giftContactSignature}\n','This email notifies a gift recipient that a gift has been purchased and is available for redemption.'),('GIFT_USER_REGISTER','en_US','Redeem Your Gift: Login Details','Dear {$recipientFirstName},\n\n{$buyerFullName} would like to share a gift with you at {$giftJournalName}:\n\n{$giftDetails}\n\n\nTo redeem your gift, please login to the journal website at {$giftUrl}\n\nYour username: {$username}\nYour password: {$password}\n\nOnce logged in, you can change your password at any time.\n\nWe hope that you enjoy your gift!\n\n{$giftContactSignature}\n','This email notifies a gift recipient of their login details for a new account.'),('GIFT_USER_LOGIN','en_US','Redeem Your Gift: Login Details','Dear {$recipientFirstName},\n\n{$buyerFullName} would like to share a gift with you at {$giftJournalName}:\n\n{$giftDetails}\n\n\nTo redeem your gift, please login to the journal website at {$giftUrl}\n\nYour username: {$username}\n\nWe hope that you enjoy your gift!\n\n{$giftContactSignature}\n','This email notifies a gift recipient of their login details.'),('BFR_REVIEW_REMINDER','de_DE','Buch zur Rezension: Erinnerung an Fälligkeitsdatum','Liebe/r {$authorName},\n\ndies ist eine freundliche Erinnerung, dass Ihre Buchrezension von {$bookForReviewTitle} am {$bookForReviewDueDate} fällig ist.\n\nUm Ihre Buchrezension einzureichen, loggen Sie sich bitte auf der Website der Zeitschrift ein und schließen Sie den Einreichungsprozess ab. Um es Ihnen zu erleichtern, ist ein URL zur Einreichung hier aufgeführt:\n\nEinreichungs-URL: {$submissionUrl}\n\nBitte zögern Sie nicht, mich zu kontaktieren, wenn Sie Fragen oder Bedenken zu dieser Buchrezension haben.\n\nHerzlichen Dank für Ihren Beitrag zu der Zeitschrift. Ich freue mich darauf, Ihre Einreichung zu erhalten.\n\n{$editorialContactSignature}','Dies ist eine automatisch erzeugte E-Mail, die an eine/n Autor/in gesendet wird, die eine Buchrezension übernommen hat, als eine Erinnerung, dass die Rezension bald fällig ist.'),('BFR_REVIEW_REMINDER_LATE','de_DE','Buch zur Rezension: Rezension fällig','Liebe/r {$authorName},\n\ndies ist eine freundliche Erinnerung, dass Ihre Buchrezension von {$bookForReviewTitle} am {$bookForReviewDueDate} fällig gewesen ist, aber noch nicht hier eingegangen ist.\n\nUm Ihre Buchrezension einzureichen, loggen Sie sich bitte auf der Website der Zeitschrift ein und schließen Sie den Einreichungsprozess ab. Um es Ihnen zu erleichtern, ist ein URL zur Einreichung hier aufgeführt:\n\nEinreichungs-URL: {$submissionUrl}\n\nBitte zögern Sie nicht, mich zu kontaktieren, wenn Sie Fragen oder Bedenken zu dieser Buchrezension haben.\n\nHerzlichen Dank für Ihren Beitrag zu der Zeitschrift. Ich freue mich darauf, Ihre Einreichung zu erhalten.\n\n{$editorialContactSignature}','Dies ist eine automatisch erzeugte E-Mail, die an eine/n Autor/in gesendet wird, die eine Buchrezension übernommen hat, nachdem das Fälligkeitsdatum verstrichen ist.'),('BFR_REVIEWER_REMOVED','de_DE','Buch zur Rezension','Liebe/r {$authorName},\n\ndiese E-Mail bestätigt, dass Sie als Rezensent/in für {$bookForReviewTitle} entfernt worden sind, das nun anderen Autor/innen, die eine Rezension dazu verfassen möchten, zur Verfügung steht.\n\nIch hoffe, dass Sie in Erwägung ziehen, ein anderes Buch aus unserer Liste zu rezensieren - jetzt oder in der Zukunft.\n\n{$editorialContactSignature}','Diese E-Mail wird durch eine/n Redakteur/in an eine/n interessierte/n Autor/in geschickt, wenn ein Buch nicht mehr zur Rezension zur Verfügung steht.'),('BFR_BOOK_MAILED','de_DE','Buch zur Rezension: Buch verschickt','Liebe/r {$authorName},\n\ndiese E-Mail bestätigt, dass ich Ihnen ein Exemplar von {$bookForReviewTitle} an die folgende Anschrift aus Ihrem Benutzer/innenprofil geschickt habe:\n{$authorMailingAddress}\n \nUm Ihre Buchrezension einzureichen, loggen Sie sich bitte auf der Website der Zeitschrift ein und schließen Sie den Einreichungsprozess ab.\n\nEinreichungs-URL: {$submissionUrl}\n\nBitte zögern Sie nicht, mich zu kontaktieren, wenn Sie Fragen oder Bedenken zu dieser Buchrezension haben.\n\n{$editorialContactSignature}','Diese E-Mail wird durch eine/n Redakteur/in an eine/n Rezensent/in geschickt, wenn die/der Redakteur/in ein Exemplar des Buches an den/die Rezensent/in gesendet hat.'),('BFR_BOOK_DENIED','de_DE','Buch zur Rezension','Liebe/r {$authorName},\n\nleider kann ich Ihnen {$bookForReviewTitle} derzeit nicht zu einer Rezension zuteilen.\n\nIch hoffe, dass Sie in Erwägung ziehen, ein anderes Buch aus unserer Liste zu besprechen - jetzt oder in Zukunft.\n\n{$editorialContactSignature}','Diese E-Mail wird durch eine/n Redakteur/in an eine/n interesierte/n Rezensent/in geschickt, wenn das Buch nicht zur Rezension zugeteilt werden kann.'),('BFR_BOOK_ASSIGNED','de_DE','Buch zur Rezension: Buch zugeteilt','Liebe/r {$authorName},\n\ndiese E-Mail bestätigt, dass Ihnen {$bookForReviewTitle} zur Rezension zugeteilt worden ist, die bis {$bookForReviewDueDate} fällig ist.\n\nBitte stellen Sie sicher, dass Ihre Anschrift in Ihrem Benutzer/innenprofil aktuell ist. Diese Adresse wird genutzt werden, um Ihnen ein Exemplar des Buches für die Besprechung zukommen zu lassen.\n\nDie Anschrift, die wir momentan in unseren Unterlagen haben, ist:\n{$authorMailingAddress}\n\nWenn diese Adresse unvollständig ist oder Sie nicht mehr unter dieser Anschrift erreichbar sind, benutzen Sie bitte den folgenden URL zum Benutzer/innenprofil, um Ihre Anschrift zu aktualisieren:\n\nBenutzer/innenprofil-URL: {$userProfileUrl}\n \nUm Ihre Buchrezension einzureichen, loggen Sie sich bitte auf der Website der Zeitschrift ein und schließen Sie den Einreichungsprozess ab.\n\nEinreichungs-URL: {$submissionUrl}\n\nBitte zögern Sie nicht, mich zu kontaktieren, wenn Sie Fragen oder Bedenken zu dieser Buchrezension haben.\n\n{$editorialContactSignature}','Diese E-Mail wird durch eine/n Redakteur/in an eine/n Rezensent/in geschickt, wenn ein/e Redakteur/in das Buch dem/der Rezensent/in zugewiesen hat.'),('BFR_BOOK_REQUESTED','de_DE','Buch zur Rezension: Buchanfrage','Liebe/r {$editorName},\n\nich bin daran interessiert, eine Buchrezension von {$bookForReviewTitle} zu verfassen.\n\nKönnen Sie bitte bestätigen, dass das Buch noch zur Rezension zur Verfügung steht?\n\n{$authorContactSignature}','Diese E-Mail wird durch eine/n Redakteur/in an eine/n Autor/in gesendet, der/die daran interessiert ist, eine Besprechung zu einem gelisteten Buch zu verfassen.'),('BFR_REVIEW_REMINDER','en_US','Book for Review: Due Date Reminder','Dear {$authorName}:\n\nThis is a friendly reminder that your book review of {$bookForReviewTitle} is due {$bookForReviewDueDate}.\n\nTo submit your book review, please log into the journal website and complete the online article submission process. For your convenience, a submission URL has been provided below.\n\nSubmission URL: {$submissionUrl}\n\nPlease feel free to contact me if you have any questions or concerns about this book review.\n\nThank you for your contribution to the journal and I look forward to receiving your submission.\n\n{$editorialContactSignature}','This is an automatically generated email that is sent to a book for review author as a reminder that the due date for the review is approaching.'),('BFR_REVIEW_REMINDER_LATE','en_US','Book for Review: Review Due','Dear {$authorName}:\n\nThis is a friendly reminder that your book review of {$bookForReviewTitle} was due {$bookForReviewDueDate} but has not been received yet.\n\nTo submit your book review, please log into the journal website and complete the online article submission process. For your convenience, a submission URL has been provided below.\n\nSubmission URL: {$submissionUrl}\n\nPlease feel free to contact me if you have any questions or concerns about this book review.\n\nThank you for your contribution to the journal and I look forward to receiving your submission.\n\n{$editorialContactSignature}','This is an automatically generated email that is sent to a book for review author after the review due date has passed.'),('BFR_BOOK_ASSIGNED','en_US','Book for Review: Book Assigned','Dear {$authorName}:\n\nThis email confirms that {$bookForReviewTitle} has been assigned to you for a book review to be completed by {$bookForReviewDueDate}.\n\nPlease ensure that your mailing address in your online user profile is up-to-date. This address will be used to mail a copy of the book to you for the review.\n\nThe mailing address that we currently have on file is:\n{$authorMailingAddress}\n\nIf this address is incomplete or you are no longer at this address, please use the following user profile URL to update your address:\n\nUser Profile URL: {$userProfileUrl}\n \nTo submit your book review, please log into the journal website and complete the online article submission process.\n\nSubmission URL: {$submissionUrl}\n\nPlease feel free to contact me if you have any questions or concerns about this book review.\n\n{$editorialContactSignature}','This email is sent by an editor to a book review author when an editor assigns the book for review to the author.'),('BFR_BOOK_DENIED','en_US','Book for Review','Dear {$authorName}:\n\nUnfortunately, I am not able to assign {$bookForReviewTitle} to you at this time for a book review.\n\nI hope you consider reviewing another book from our listing, either at this time or in the future.\n\n{$editorialContactSignature}','This email is sent by an editor to an interested author when a book is no longer available for review.'),('BFR_BOOK_REQUESTED','en_US','Book for Review: Book Requested','Dear {$editorName}:\n\nI am interested in writing a book review of {$bookForReviewTitle}.\n\nCan you please confirm whether this book is still available for review?\n\n{$authorContactSignature}','This email is sent to an editor by an author interested in writing a book review for a listed book.'),('BFR_BOOK_MAILED','en_US','Book for Review: Book Mailed','Dear {$authorName}:\n\nThis email confirms that I have mailed a copy of {$bookForReviewTitle} to the following mailing address from your online user profile:\n{$authorMailingAddress}\n \nTo submit your book review, please log into the journal website and complete the online article submission process.\n\nSubmission URL: {$submissionUrl}\n\nPlease feel free to contact me if you have any questions or concerns about this book review.\n\n{$editorialContactSignature}','This email is sent by an editor to a book review author when the editor has mailed a copy of the book to the author.'),('BFR_REVIEWER_REMOVED','en_US','Book for Review','Dear {$authorName}:\n\nThis email confirms that you have been removed as the book reviewer for {$bookForReviewTitle}, which will be made available to other authors interested in reviewing the book.\n\nI hope you consider reviewing another book from our listing, either at this time or in the future.\n\n{$editorialContactSignature}','This email is sent by an editor to an interested author when a book is no longer available for review.'),('THESIS_ABSTRACT_CONFIRM','de_DE','Dissertations-Abstract-Einreichung','Diese E-Mail wurde automatisch generiert durch das Dissertations-Abstract-Einreichungsformular von {$journalName}.\n\nBitte bestätigen Sie, dass die eingegebenen Informationen korrekt sind. Nachdem wir Ihre Bestätigung erhalten haben, wird das Abstract in der Onlinefassung dieser Zeitschrift veröffentlicht.\n\nBitte antworten Sie einfach an {$thesisName} ({$thesisEmail}) mit dem Inhalt dieser Nachricht und mit Ihrer Bestätigung sowie mit Ergänzungen oder Korrekturen.\n\nVielen Dank.\n\n\nTitel: {$title}\nAutor/in: {$studentName}\nAbschluss: {$degree}\nName des Abschlusses: {$degreeName}\nAbteilung: {$department}\nHochschule: {$university}\nDatum der Annahme: {$dateApproved}\nGutachter/in: {$supervisorName}\n\nAbstract\n--------\n{$abstract}\n\n{$thesisContactSignature}','Diese E-Mail-Vorlage wird benutzt, um die Einreichung eines Dissertations-Abstracts durch eine/n Dissertant/in zu bestätigen. Sie wird an die/den Betreuer/in geschickt, die/der gebeten wird, die Details des eingereichten Dissertations-Abstracts zu bestätigen.'),('THESIS_ABSTRACT_CONFIRM','en_US','Thesis Abstract Submission','This email was automatically generated by the {$journalName} thesis abstract submission form.\n\nPlease confirm that the submitted information is correct. Upon receiving your confirmation, the abstract will be published in the online edition of the journal.\n\nSimply reply to {$thesisName} ({$thesisEmail}) with the contents of this message and your confirmation, as well as any recommended clarifications or corrections.\n\nThank you.\n\n\nTitle : {$title} \nAuthor : {$studentName}\nDegree : {$degree}\nDegree Name: {$degreeName}\nDepartment : {$department}\nUniversity : {$university}\nAcceptance Date : {$dateApproved}\nSupervisor : {$supervisorName}\n\nAbstract\n--------\n{$abstract}\n\n{$thesisContactSignature}','This email template is used to confirm a thesis abstract submission by a student. It is sent to the student\'s supervisor, who is asked to confirm the details of the submitted thesis abstract.'),('SWORD_DEPOSIT_NOTIFICATION','de_DE','Archivierungsbenachrichtigung','Herzlichen Glückwunsch zur Annahme Ihres Beitrags \"{$articleTitle}\" zur Veröffentlichung in {$journalName}. Wenn Sie möchten, können Sie Ihren Beitrag automatisch in einem oder mehreren Repositorien archivieren.\n\nFahren Sie unter {$swordDepositUrl} fort.\n\nDiese E-Mail wurde durch das SWORD-Archivierungs-Plug-In für Open Journal Systems erzeugt.','Diese E-Mail-Vorlage wird benutzt, um eine/n Autor/in über optionale Archivierungsorte für SWORD-Archivierungen zu informieren.'),('SWORD_DEPOSIT_NOTIFICATION','en_US','Deposit Notification','Congratulations on the acceptance of your submission, \"{$articleTitle}\", for publication in {$journalName}. If you choose, you may automatically deposit your submission in one or more repositories.\n\nGo to {$swordDepositUrl} to proceed.\n\nThis email was generated by Open Journal Systems\' SWORD deposit plugin.','This email template is used to notify an author of optional deposit points for SWORD deposits.'),('PAYPAL_INVESTIGATE_PAYMENT','de_DE','Ungewöhnliche PayPal-Aktivität','Open Journal Systems hat eine ungewöhnliche Aktivität in Bezug auf die Unterstützung  von PayPal-Zahlungen für die Zeitschrift {$journalName} festgestellt. Diese Aktivität könnte eine nähere Untersuchung oder ein Eingreifen erfordern.\n\nDiese E-Mail wurde durch das Open Journal Systems-Plugin PayPal-Gebührenzahlung erzeugt.\n\nVolle Informationen zu dieser Anfrage:\n{$postInfo}\n\nZusätzliche Informationen (soweit angegeben):\n{$additionalInfo}\n\nServer vars:\n{$serverVars}\n','Diese E-Mail-Vorlage wird genutzt, um den primären Zeitschriftenkontakt darüber zu benachrichtigen, dass verdächtige Aktivitäten durch das PayPal-PlugIn entdeckt worden sind.'),('PAYPAL_INVESTIGATE_PAYMENT','en_US','Незвичайна активність PayPal','Система Open Journal Systems помітила незвичайну активність у функціонуванні модуля платежів PayPal журналу {$journalName}. Може знадобитись подальше вивчення цього питання або ручне втручання.\n                       \nЦей лист створений модулем PayPal системи Open Journal Systems.\n\nПовна інформація про запит:\n{$postInfo}\n\nДодаткова інформація (якщо наявна):\n{$additionalInfo}\n\nДані сервера:\n{$serverVars}\n','Цей шаблон листа використовується для інформування основної контактної особи журналу про виявлення модулем PayPal підозрілої активності або активності, що потребує ручного втручання.'),('MANUAL_PAYMENT_NOTIFICATION','de_DE','Benachrichtigung über manuelle Zahlung','Eine manuelle Zahlung ist für die Zeitschrift {$journalName} und den/die Benutzer/in {$userFullName} (Benutzer/innen-Name \"{$userName}\") angekündigt worden.\n\nGezahlt werden soll für \"{$itemName}\".\nDie Kosten betragen {$itemCost} ({$itemCurrencyCode}).\n\nDiese E-Mail wurde vom OJS-Plug-In Manuelle Gebührenzahlung erzeugt.','Diese E-Mail-Vorlage wird genutzt, um eine/n Zeitschriftenverwalter/in darüber zu benachrichtigen, dass eine manuelle Zahlung beantragt worden ist.'),('MANUAL_PAYMENT_NOTIFICATION','en_US','Manual Payment Notification','A manual payment needs to be processed for the journal {$journalName} and the user {$userFullName} (username \"{$userName}\").\n\nThe item being paid for is \"{$itemName}\".\nThe cost is {$itemCost} ({$itemCurrencyCode}).\n\nThis email was generated by Open Journal Systems\' Manual Payment plugin.','This email template is used to notify a journal manager contact that a manual payment was requested.'),('SWORD_DEPOSIT_NOTIFICATION','pt_PT','Notificação de Depósito','Congratulações pela aceitação da sua submissão, \"{$articleTitle}\", para publicação em {$journalName}. Pode optar por depositar automaticamente a sua submissão num ou mais repositórios.\n\nIr a {$swordDepositUrl} para prosseguir.\n\nEste email foi gerado pelo plugin de depósito SWORD do Open Journal System.','Este modelo de email template é usado para notificar o autor sobre os pontos de depósitos opcionais do SWORD.'),('SWORD_DEPOSIT_NOTIFICATION','pt_BR','Notificação de depósito em repositório SWORD','Parabéns pela aceitação de publicação de sua submissão \"{$articleTitle}\", na revista {$journalName}. \nCaso deseje, pode depositar automaticamente esta submissão em um ou mais repositórios.\n\nAcesse {$swordDepositUrl} para proceder.\n\nEsta é uma mensagem automática da ferramenta de Depósito SWORD do Open Journal Systems.','Mensagem de notificação ao autor, de pontos de depósito opcional para repositórios SWORD.'),('THESIS_ABSTRACT_CONFIRM','pt_PT','Submissão de Resumo de Tese','Esta mensagem é gerada automaticamente pelo sistema de envio de resumos de teses da revista {$journalName}.\n\nConfirme se os dados informados estão correctos. Ao receber a confirmação, o resumo será publicado na edição electrónica da revista.\n\nResponda para {$thesisName} ({$thesisEmail}) com o conteúdo desta mensagem e sua confirmação sobre a veracidade e a qualidade dos dados, bem como quaisquer recomendações ou esclarecimentos necessários.\n\nAgradecemos antecipadamente a sua colaboração.\n\n\nTítulo: {$title} \nAutor: {$studentName}\nGrau: {$degree}\nTítulo do Grau: {$degreeName}\nDepartamento : {$department}\nInstituição de Ensino Superior: {$university}\nData de aceitação: {$dateApproved}\nOrientador: {$supervisorName}\n\nResumo\n--------\n{$abstract}\n\n{$thesisContactSignature}','Esta mensagem confirma a submissão de um resumo de tese por parte de um aluno. É enviada ao orientador, que deve confirmar a veracidade e qualidade dos dados informados.'),('THESIS_ABSTRACT_CONFIRM','pt_BR','Submissão de resumo de tese para a revista {$journalName}','Esta é uma mensagem automática do sistema de submissão de resumos de teses da revista {$journalName}.\n\nConfirme se os dados informados estão corretos. Ao receber a confirmação, o resumo será publicado na edição eletrônica da revista.\n\nResponda para {$thesisName} ({$thesisEmail}) com o conteúdo desta mensagem e sua confirmação sobre a veracidade e a qualidade dos dados, bem como quaisquer recomendações ou esclarecimentos necessários.\n\nAgradecemos antecipadamente pela sua colaboração.\n\n\nTítulo: {$title} \nAutor: {$studentName}\nGrau: {$degree}\nTítulo do grau: {$degreeName}\nDepartamento: {$department}\nInstituição de Ensino Superior: {$university}\nData de aceitação: {$dateApproved}\nOrientador: {$supervisorName}\n\nResumo\n----------\n{$abstract}\n\n{$thesisContactSignature}','Mensagem de confirmação de submissão de resumo de tese por parte de um aluno. É enviada ao orientador, que deve confirmar a veracidade e qualidade dos dados informados.'),('BFR_REVIEW_REMINDER','pt_PT','Livro para Revisão: Lembrete do Prazo','Caro(a) {$authorName}:\n\nEste lembrete serve para recordar-lhe que a revisão do livro {$bookForReviewTitle} expirou o prazo {$bookForReviewDueDate}.\n\nPara submeter a sua revisão do livro, autentique-se no portal e complete o processo de submissão online. Para sua conveniência, é fornecido em baixo o URL da submissão.\n\nURL da submissão: {$submissionUrl}\n\nEntre em contacto com o Editor caso tenha dúvidas ou questões a apresentar sobre a revisão do livro.','Trata-se de um email gerado automaticamente e que é enviado para o responsável da revisão do livro, lembrando-o que o prazo da revisão está próximo.'),('BFR_REVIEW_REMINDER_LATE','pt_PT','Livro para Revisão: Prazo da Revisão','Caro(a) {$authorName}:\n\nLembramos que o prazo da sua revisão do livro {$bookForReviewTitle} foi ultrapassada {$bookForReviewDueDate} e ainda não foi recebida.\n\nPara submeter a sua revisão do livro, autentique-se no portal e complete o processo de submissão online. Para sua conveniência, fornecemos em baixo um URL da submissão.\n\nURL da submissão: {$submissionUrl}\n\nEntre em contacto com o Editor caso tenha dúvidas ou questões a apresentar sobre esta revisão do livro.\n\nObrigado pela sua contribuição para a revisão, com os votos de receber com sucesso a sua submisssão.\n\n{$editorialContactSignature}','Trata-se de um email gerado automaticamente e que é enviado ao responsável pela revisão do livro quando a data de revisão foi ultrapassada.'),('BFR_BOOK_ASSIGNED','pt_PT','Livro para Revisão: Livro Atribuído','Caro(a) {$authorName}:\n\nEste email confirma que {$bookForReviewTitle} foi-lhe atribuído um livro para revisão até {$bookForReviewDueDate}.\n\nCertifique-se que os dados o seu email estão correcto. Este endereço será usado para enviar uma cópia do livro para revisão.\n\nO endereço de email existente na base de dados é:\n{$authorMailingAddress}\n\nSe este endereço está incompleto ou desactivado, por favor use o seguinte URL para actualizar o seu perfil:\n\nURL do Perfil do Utilizador: {$userProfileUrl}\n \nPara submeter a sua revisão do livro, autentique-se no portal e complete o processo de submissão online disponível no URL em baixo.\n\nURL da submissão: {$submissionUrl}\n\nEntre em contacto com o Editor caso tenha dúvidas ou questões a apresentar sobre a revisão do livro.\n\n{$editorialContactSignature}','Este email é enviado por um editor a um responsável pela revisão do livro quando lhe é atribuído uma revisão.'),('BFR_BOOK_DENIED','pt_PT','Livro para Revisão','Caro(a) {$authorName}:\n\nLamentamos, mas não foi possível atribuir-lhe o seguinte {$bookForReviewTitle} para revisão.\n\nPese embora essa impossibilidade, esperamos contar com a sua colaboração em futuras revisões de livros.\n\n{$editorialContactSignature}','Este email é enviado por um editor a um potencial interessado quando o livro já não está disponível para revisão.'),('BFR_BOOK_REQUESTED','pt_PT','Livro para Revisão: Livro Requisitado','Caro(a) {$editorName}:\n\nEstou interessado em realizar uma revisão do livro {$bookForReviewTitle}.\n\nPode confirmar se este livro está disponível para revisão?\n\n{$authorContactSignature}','Este email é enviado ao editor por alguém interessado em realizar uma revisão de um livro.'),('BFR_BOOK_MAILED','pt_PT','Livro para Revisão: Livro Enviado','Caro(a) {$authorName}:\n\nEste email confirma que enviei uma cópia do {$bookForReviewTitle} para o seguinte endereço:\n{$authorMailingAddress}\n \nPara submeter a sua revisão do livro, autentique-se no portal e complete o processo de submissão no URL indicado em baixo.\n\nURL da submissão: {$submissionUrl}\n\nEntre em contacto com o Editor caso tenha dúvidas ou questões a apresentar sobre a revisão do livro.\n\n{$editorialContactSignature}','Este email é enviado por um editor para um revisor quando o editor enviou-lhe uma cópia do livro.'),('BFR_REVIEWER_REMOVED','pt_PT','Livro para Revisão','Caro(a) {$authorName}:\n\nEste email confirma que foi retirado como revisor do livro {$bookForReviewTitle}, o qual estará disponível para outros interessados na revisão.\n\nEsperamos contar com a sua colaboração, quer na actual ou em revisões futuras.\n\n{$editorialContactSignature}','Este email é enviado pelo editor a um interessado pela revisão quando este já não disponível para rever o livro.'),('BFR_REVIEW_REMINDER','pt_BR','Revisão de literatura: Lembrete de prazo de conclusão','Prezada(o) {$authorName},\n\nEste é apenas um lembrete de que o prazo para conclusão da revisão de literatura de {$bookForReviewTitle} é {$bookForReviewDueDate}.\n\nPara enviar sua revisão, acesse o sistema e conclua o processo de submissão padrão. Para sua conveniência, segue a URL.\n\nURL da submissão: {$submissionUrl}\n\nEm caso de dúvidas ou preocupações com relação ao processo de revisão de literatura, entre em contato.\n\nAgradecemos sua contribuição à revista e aguardamos sua submissão.\n\n{$editorialContactSignature}','Mensagem automática enviada ao autor de revisão de literatura, como lembrete de prazo de conclusão próximo.'),('BFR_REVIEW_REMINDER_LATE','pt_BR','Revisão de literatura: Lembrete de prazo de conclusão expirado','Prezada(o) {$authorName}:\n\nEste é um lembrete de que o prazo de conclusão da revisão de literatura {$bookForReviewTitle} venceu {$bookForReviewDueDate}, mas a revisão ainda não foi recebida.\n\nPara enviar a revisão de literatura, acesse o sistema e conclua a submissão online padrão. Para sua conveniência, segue a URL.\n\nURL da submissão: {$submissionUrl}\n\nEm caso de dúvidas ou preocupações com relação ao processo de revisão de literatura, entre em contato.\n\nAgradecemos sua contribuição à revista e aguardamos sua submissão.\n\n{$editorialContactSignature}','Mensagem automática enviada ao autor de revisão de literatura, como lembrete de prazo de conclusão próximo.'),('BFR_BOOK_ASSIGNED','pt_BR','Revisão de literatura: revisão designada','Prezada(o) {$authorName}:\n\nEsta mensagem confirma a designação do título {$bookForReviewTitle} para revisão de literatura, a ser concluída até {$bookForReviewDueDate}.\n\nVerifique se seu endereço postal está atualizado no seu perfil, pois ele será usado para enviar uma cópia do trabalho.\n\nSeu endereço postal atual é:\n{$authorMailingAddress}\n\nCaso o endereço esteja incompleto ou equivocado, use a seguinte URL para atualizar seus dados cadastrais:\n\nURL do perfil: {$userProfileUrl}\n\nPara enviar uma revisão de literatura, acesse o sistema e conclua o processo de submissão padrão de um artigo.\n\nURL da submissão: {$submissionUrl}\n\nEm caso de dúvidas e preocupações com relação ao processo de revisão de literatura, entre em contato.\n\n{$editorialContactSignature}','Mensagem enviada pelo editor ao autor de revisão de literatura, referente à tarefa de revisão designada.'),('BFR_BOOK_DENIED','pt_BR','Revisão de literatura','Prezada(o) {$authorName}:\n\nInfelizmente não é possível designar-lhe o título {$bookForReviewTitle} para revisão de literatura.\n\nEspero poder contar com sua contribuição para outro título de nossa lista, agora ou em outra oportunidade futura.\n\n{$editorialContactSignature}','Mensagem enviada pelo editor a autor interessado em realizar revisão de literatura, referente a literatura não mais disponível para revisão.'),('BFR_BOOK_REQUESTED','pt_BR','Revisão de literatura: revisão solicitada','Prezada(o) {$editorName},\n\nEstou interessado em escrever a revisão de literatura do título {$bookForReviewTitle}.\n\nEste título ainda está disponível para revisão de literatura?\n\n{$authorContactSignature}','Mensagem enviada ao editor por autor interessado em realizar revisão de literatura disponível na lista.'),('BFR_BOOK_MAILED','pt_BR','Revisão de literatura: revisão postada','Prezada(o) {$authorName},\n\nEsta mensagem é uma confirmação do envio via correio de uma cópia do título {$bookForReviewTitle} para o seguinte endereço postal, disponível em seu cadastro:\n{$authorMailingAddress}\n \nPara enviar sua revisão de literatura, acesse o sistema e siga os passos para a submissão padrão completa de um artigo.\n\nURL da submissão: {$submissionUrl}\n\nEm caso de dúvidas ou preocupações com relação ao processo de revisão de literatura, entre em contato.\n\n{$editorialContactSignature}','Mensagem enviada pelo editor ao autor de revisão de literatura, referente à postagem via correio de cópia do livro ao autor.'),('BFR_REVIEWER_REMOVED','pt_BR','Revisão de literatura','Prezada(o) {$authorName}:\n\nEsta mensagem é uma confirmação de sua exclusão do processo de revisão de literatura do título {$bookForReviewTitle}, que será oferecido a outros autores interessados.\n\nEsperamos poder contar com sua contribuição para outros títulos de nossa lista, agora ou em outra oportunidade futura.\n\n{$editorialContactSignature}','Mensagem enviada pelo editor ao autor de revisão de literatura, confirmando título indisponível para revisão.'),('MANUAL_PAYMENT_NOTIFICATION','pt_PT','Notificação de pagamento manual','É necessário realizar o processamento de um pagamento manual de assinatura da revista {$journalName} do utilizador {$userFullName} (username \"{$userName}\").\n\nO item adquirido é \"{$itemName}\".\nO custo é {$itemCost} ({$itemCurrencyCode}).\n\nEsta mensagem foi gerada pelo Plugin de Pagamento Manual do OJS.','Esta mensagem notifica o editor-gestor que um pagamento manual foi realizado e exige processamento.'),('MANUAL_PAYMENT_NOTIFICATION','pt_BR','Notificação de pagamento manual','É necessário realizar o processamento de um pagamento manual de assinatura da revista {$journalName}, pelo usuário {$userFullName} (login \"{$userName}\").\n\nO item adquirido é \"{$itemName}\".\nValor em ({$itemCurrencyCode}): {$itemCost}\n\nEsta é uma mensagem automática da ferramenta de Pagamento manual do Open Journal Systems.','Mensagem automática notificando editor-gerente que um pagamento manual foi realizado e exige processamento.'),('PAYPAL_INVESTIGATE_PAYMENT','pt_PT','Actividade incomum na conta PayPal','O sistema OJS encontrou actividade incomum relacionada ao suporte a pagamentos via PayPal, para a revista {$journalName}. Esta actividade pode exigir investigação mais profunda ou intervenção manual.\n                       \nEsta mensagem foi gerada pelo Plugin PayPal do OJS.\n\nInformações detalhadas da notificação:\n{$postInfo}\n\nInformações adicionais (caso informado):\n{$additionalInfo}\n\nVariáveis do Servidor:\n{$serverVars}','Esta mensagem notifica o contacto principal da revista sobre actividades suspeitas, ou atividades que exijam intervenção manual, detectadas pelo Plugin de Pagamento via PayPal.'),('PAYPAL_INVESTIGATE_PAYMENT','pt_BR','Atividade incomum na conta PayPal','O sistema encontrou atividade incomum relacionada ao suporte a pagamentos via PayPal da revista {$journalName}. \nEsta atividade pode exigir investigação mais profunda ou intervenção manual.\n                       \nEsta é uma mensagem automática da ferramenta de Pagamento via PayPal do Open Journal Systems.\n\nInformações detalhadas da notificação:\n{$postInfo}\n\nInformações adicionais (caso informado):\n{$additionalInfo}\n\nVariáveis do servidor:\n{$serverVars}','Esta mensagem notifica o contato principal da revista sobre atividades suspeitas, ou atividades que exijam intervenção manual, detectadas pelo Plugin de Pagamento via PayPal.'),('NOTIFICATION_MAILLIST_WELCOME','cs_CZ','Vítejte na rezesílacím seznamu {$siteTitle}!','Přihlásil jste se k odběru oznámení z {$siteTitle}.\n\nPro potvrzení Vaší žádosti a přidání Vaší emailové adresy do rozesílacího seznamu klikněte prosím na tento odkaz: {$confirmLink}\n\nPokud si přejete ukončit odebírání informačních emailů, přejděte prosím na {$unsubscribeLink} a vložte Vaši emailovou adresu a heslo.\n\nVaše heslo pro zakázání informačních emailů je: {$password}\n\n{$principalContactSignature}',''),('NOTIFICATION_MAILLIST_WELCOME','el_GR','Καλώς ορίσατε mailing list του  {$siteTitle}!','Έχετε εγγραφεί στην λίστα για να λαμβάνεται ενημέρωτικά μηνύματα από το  {$siteTitle}.\n\nΣας παρακαλούμε επιλέξτε τον σύνδεσμο αυτό για να επιβεβαιώσετε την εγγραφή σας και να προσθέσετε το email σας στην λίστα: {$confirmLink}\n\nΑν δεν επιθυμείτε να λαμβάνετε σχετικά μηνύματα, σας παρακαλούμε πηγαίνεται στον σύνδεσμο {$unsubscribeLink} και εισάγετε το email σας και τον κωδικό σας.\n\nΟ κωδικός σας για την απενεργοποίηση των μηνυμάτων ειδοποιήσεων είναι: {$password}\n\n{$principalContactSignature}',''),('NOTIFICATION_MAILLIST_WELCOME','es_ES','Bienvenido a la lista de correo de {$siteTitle} !','Has escogido recibir notificaciones desde {$siteTitle}.\n\nHaga clic en este enlace para confirmar tu petición y añadir tu email a la lista de notificaciones:\n {$confirmLink}\n\nSi no desea recibir emails de notificaciones, ve a {$unsubscribeLink} e introduzca su dirección de email y su contraseña.\n\nSu contraseña para deshabilitar las notificaciones por email es: {$password}\n\n{$principalContactSignature}','Este correo es enviado a usuarios sin registrar los cuales acaban de registrarse en la lista de notificaciones.'),('NOTIFICATION_MAILLIST_WELCOME','eu_ES','Ongi etorri {$siteTitle} posta-zerrendara!','{$siteTitle} gunearen jakinarazpenak jasotzeko izena eman duzu.\n\nEgin klik esteka honetan zure eskaera berresteko eta zure helbide elektronikoa posta-zerrendan gehitzeko: {$confirmLink}\n\nJakinarazpen-mezu gehiago jaso nahi ez baduzu, joan {$unsubscribeLink} orrira eta sartu zure helbide elektronikoa eta pasahitza.\n\nHau da jakinarazpen-mezuak desgaitzeko zure pasahitza: {$password}\n\n{$principalContactSignature}','Mezu hau jakinarazpenen posta-zerrendako erabiltzaile erregistratu berriei bidaltzen zaie.'),('NOTIFICATION_MAILLIST_WELCOME','fa_IR','به لیست ایمیلی {$siteTitle} خوش آمدید','شما جهت دریافت اطلاع رسانی از {$siteTitle} ثبت نام کرده اید.\n\nلطفا بر روی این لینک کلیک کنید تا تقاضای خود را تایید کرده آدرس ایمیل خود را به لیست اضافه کنید:\n{$confirmLink}\n\nچنانچه دی\\ر مایل به دریافت ایمیل اطلاع رسانی نیستید، لطفا به آدرس {$unsubscribeLink} رفته و ایمیل و رمز خود را وارد کنید.\n\n :رمز عبور شما برای غیر فعال کردن ایمیل اطلاع رسانی{$password}\n\n{$principalContactSignature}',''),('NOTIFICATION_MAILLIST_WELCOME','fr_CA','Bienvenue à la liste de diffusion de {$siteTitle}!','Vous vous êtes inscrits pour recevoir des avis de {$siteTitle}.\n\nVeuillez cliquer sur ce lien pour confirmer votre demande et ajouter votre adresse de courriel à la liste de diffusion : {$confirmLink}\n\nSi vous souhaitez  arrêter l\'envoi d\'avis par courriels, veuillez aller à {$unsubscribeLink} et saisir votre adresse de courriel et votre mot de passe.\n\nVotre mot de passe pour désactiver les courriels d\'avis est : {$password}\n\n{$principalContactSignature}',''),('NOTIFICATION_MAILLIST_WELCOME','it_IT','Benvenuto nella mailing list di {$siteTitle}!','Hai chiesto di ricevere notifiche da {$siteTitle}.\n\nClicca su questo link per confermare e aggiungere il tuo indirizzo nella lista di distribuzione: {$confirmLink}\n\nSe non vuoi ricevere email di notifica, vai alla pagina {$unsubscribeLink} per cancellarti.\n\nLa tua password per disabilitare le notifiche &#232;: {$password}\n\n{$principalContactSignature}',''),('NOTIFICATION_MAILLIST_WELCOME','ja_JP','{$siteTitle} メーリングリストへようこそ！','あなたは {$siteTitle} からのお知らせを受け取ることに同意しました。\n\nメーリングリストにあなたのメールアドレスを追加するために下記の確認リンクをクリックしてください。\n{$confirmLink}\n\nもし通知メールの受信を停止したい場合は，下記のページでメールドレスとパスワードを入力してください。\n{$unsubscribeLink}\n\nあなたの通知メールを無効にするためのパスワードは下記のとおりです。\n{$password}\n\n\n{$principalContactSignature}',''),('NOTIFICATION_MAILLIST_WELCOME','nl_NL','Welkom bij de {$siteTitle} maillijst!','U heeft zich geregistreerd om berichten te ontvangen van {$siteTitle}.\n\nKlik op deze link om uw verzoek te bevestigen en uw e-mail adres toe te voegen aan de lijst: {$confirmLink}\n\nAls u de berichten van deze lijst niet langer wilt ontvangen, ga dan naar {$unsubscribeLink} en voer uw e-mail adres en wachtwoord in.\n\nUw wachtwoord voor het stopzetten van berichten is: {$password}\n\n{$principalContactSignature}',''),('NOTIFICATION_MAILLIST_WELCOME','no_NO','Velkommen til e-postlisten til {$siteTitle}!','Du har bedt om å få meldinger fra {$siteTitle}.\n\nVennligst klikke på denne lenken for å bekrefte ditt ønske og legge din e-postadresse til e-postlisten: {$confirmLink}\n\nOm du ikke lenger ønsker å få meldinger via e-post, gå til {$unsubscribeLink} og oppgi din e-postadresse og passord.\n\nDitt passord for å slå av e-postmeldinger er: {$password}\n\n{$principalContactSignature}',''),('NOTIFICATION_MAILLIST_WELCOME','pt_BR','Bem-vino à lista de correio de {$siteTitle}!','Você assinou a lista de notificações de {$siteTitle}.\n\nClique no link a seguir para confirmar sua solicitação e incluir seu e-mail na lista de correio: {$confirmLink}\n\nCaso não deseje mais receber as notificações, acesse {$unsubscribeLink} e informe seu e-mail e senha.\n\nA senha para desabilitar as notificações é: {$password}\n\n{$principalContactSignature}','Esta mensagem é enviada a usuários não cadastrados que acabaram de se registrar no serviço de notificações via lista de correio.'),('NOTIFICATION_MAILLIST_WELCOME','pt_PT','Bem-vindo à lista de correio de {$siteTitle}!','Você assinou a lista de notificações de {$siteTitle}.\n\nClique no link a seguir para confirmar o seu pedido e incluir o seu e-mail na lista de correio: {$confirmLink}\n\nCaso não deseje mais receber as notificações, aceda a {$unsubscribeLink} e forneça o seu e-mail e senha.\n\nA senha para desactivar os e-mails é: {$password}\n\n{$principalContactSignature}','Esta mensagem é enviada a utilizadores não registados que acabaram de se registar no serviço de notificações via lista de correio.'),('NOTIFICATION_MAILLIST_WELCOME','ro_RO','Bine ați venit pe lista de email {$siteTitle}!','V-ați înscris pentru a primi înștiințări de la {$siteTitle}.\n\nDați clic pe acest link pentru a confirma solicitarea de adăugare a emailului pe această listă: {$confirmLink}\n\nDacă nu mai doriți să primiți emailuri de înștiințare, mergeți la {$unsubscribeLink}, unde introduceți adresa de email și parola.\n\nParola pentru dezactivarea înștiințărilor prin email este: {$password}\n\n{$principalContactSignature}','Acest email este trimis unui utilizator neînregistrat pe site, dar care s-a înscris doar pe lista de email.'),('NOTIFICATION_MAILLIST_WELCOME','ru_RU','Добро пожаловать в список рассылки {$siteTitle} !','Вы подписались на получение извещений с сайта {$siteTitle}.\n\nПожалуйста нажмите на ссылку для подтверждения своего запроса и добавления Вашего почтового адреса в список рассылки: {$confirmLink}\n\nЕсли не хотите получать извещения, пожалуйста нажмите на ссылку {$unsubscribeLink}  и введите свой почтовый адрес и пароль.\n\nПароль для отключения извещений: {$password}\n\n{$principalContactSignature}',''),('NOTIFICATION_MAILLIST_WELCOME','zh_CN','欢迎来到{$siteTitle}邮件列表!','您已签署接收来自{$siteTitle}的通知。\n\n请点击链接确认您的请求并把你的邮件地址添加到邮件列表:{$confirmLink}\n\n如果您想停止接收邮件通知，请前往{$unsubscribeLink}然后输入您的邮件地址和密码。\n\n您用来禁用电子邮件通知的密码是：{$password}\n\n{$principalContactSignature}','这封电子邮件是发送给刚刚从通知邮件列表中注册的未注册用户.'),('NOTIFICATION_MAILLIST','cs_CZ','Nové oznámení od {$siteTitle}','Máte nové oznámení od {$siteTitle}:\n--\n{$notificationContents}\n\nOdkaz: {$url}\n--\n\nPokud chcete ukončit odebírání těchto informačních emalů, přejděte prosím na {$unsubscribeLink} a vložte vaši emailovou adresu a heslo.\n\n{$principalContactSignature}',''),('NOTIFICATION_MAILLIST','el_GR','Νέα ειδοποίηση από {$siteTitle}','Έχετε μια νέα ειδοποίηση από {$siteTitle}:\n--\n{$notificationContents}\n\nΣύνδεσμος: {$url}\n--\n\nΑν δεν επιθυμείτε να λαμβάνετε email με ειδοποιήσεις. σας παρακαλούμε πηγαίνετε στο {$unsubscribeLink} και εισάγετα το email σας και τον κωδικό πρόσβασής σας.\n\n{$principalContactSignature}',''),('NOTIFICATION_MAILLIST','es_ES','Nueva notificación desde {$siteTitle}','Tiene una nueva notificación desde {$siteTitle}:\n--\n{$notificationContents}\n\nLink: {$url}\n--\n\nSi no desea recibir los correos de notificaciones, vaya a {$unsubscribeLink} e introduzca su dirección de correo y su contraseña en nuestra plataforma.\n\n{$principalContactSignature}','Este email es enviado a usuarios sin registrar en las listas de notificaciones.'),('NOTIFICATION_MAILLIST','eu_ES','{$siteTitle} gunearen jakinarazpen berria','{$siteTitle} gunearen jakinarazpen berri bat daukazu:\n--\n{$notificationContents}\n\nEsteka: {$url}\n--\n\nJakinarazpen-mezu gehiago jaso nahi ez baduzu, joan {$unsubscribeLink} orrira eta sartu zure helbide elektronikoa eta pasahitza.\n\n{$principalContactSignature}','Mezu hau jakinarazpenen posta-zerrendako erabiltzaile erregistratu gabeei bidaltzen zaie.'),('NOTIFICATION_MAILLIST','fa_IR','فرم اطلاع رسانی جدید {$siteTitle}','یک فرم اطلاع رسانی جدید از {$siteTitle} دارید\n--\n{$notificationContents}\n\nلینک: {$url}\n--\n\nاگر دیگر مایل نیستید این ایمیل های اطلاع رسانی را دریافت کنید، لطفا به آدرس {$unsubscribeLink} رفته و آدرس ایمیل . رمز خود را وارد کنید.\n\n\n{$principalContactSignature}',''),('NOTIFICATION_MAILLIST','fr_CA','Nouvel avis de {$siteTitle}','Vous avez un avis de {$siteTitle}:\n--\n{$notificationContents}\n\nLien: {$url}\n--\n\nSi vous souhaitez ne plus recevoir d\'avis par courriel, veuillez aller à {$unsubscribeLink} et saisir votre adresse de courriel et mot de passe.\n\n{$principalContactSignature}','Ce courriel est envoyé aux utilisateurs non inscrits sur la liste de diffusion d\'avis.'),('NOTIFICATION_MAILLIST','it_IT','Nuova notifica da {$siteTitle}','Hai ricevuto una notifica da  {$siteTitle}:\n--\n{$notificationContents}\n\nLink: {$url}\n--\n\nSe non vuoi ricevere altre notifiche, vai alla pagina {$unsubscribeLink} per cancellarti.\n\n{$principalContactSignature}',''),('NOTIFICATION_MAILLIST','ja_JP','{$siteTitle} からの新しいお知らせ','{$siteTitle} からの新しいお知らせです。\n--\n{$notificationContents}\n\nLink: {$url}\n--\n\n通知メールの配信を停止したい場合は， {$unsubscribeLink} でメールアドレスとパスワードを入力してください。\n\n{$principalContactSignature}',''),('NOTIFICATION_MAILLIST','nl_NL','Nieuw bericht van {$siteTitle}','U heeft een nieuw bericht van {$siteTitle}:\n--\n{$notificationContents}\n\nLink: {$url}\n--\n\nAls u deze berichten niet meer wilt ontvangen, ga dan naar {$unsubscribeLink} en voer uw e-mail adres en wachtwoord in.\n\n{$principalContactSignature}',''),('NOTIFICATION_MAILLIST','no_NO','Ny melding fra {$siteTitle}','Du har en ny melding fra {$siteTitle}:\n--\n{$notificationContents}\n\nLenke: {$url}\n--\n\nOm du ikke lenger ønsker å motte slike meldinger per e-post, gå til  {$unsubscribeLink} og oppgi din e-postadresse og passord.\n\n{$principalContactSignature}',''),('NOTIFICATION_MAILLIST','pt_BR','Nova notificação de {$siteTitle}','Você possui uma nova notificação de {$siteTitle}:\n--\n{$notificationContents}\n\nLink: {$url}\n--\n\nCaso não deseje receber mais notificações via e-mail, acesse {$unsubscribeLink} e informe seu e-mail e senha.\n\n{$principalContactSignature}','Esta mensagem é enviada a usuários não cadastrados que pertencem à lista de correio.'),('NOTIFICATION_MAILLIST','pt_PT','Nova notificação de {$siteTitle}','Você possui uma nova notificação de {$siteTitle}:\n--\n{$notificationContents}\n\nLink: {$url}\n--\n\nCaso não deseje receber mais notificações via e-mail, aceda a {$unsubscribeLink} e forneça o seu endereço de e-mail e senha.\n\n{$principalContactSignature}','Esta mensagem é enviada a utilizadores não registados que pertencem à lista de correio.'),('NOTIFICATION_MAILLIST','ro_RO','Înștiințare nouă de la {$siteTitle}','Aveți o înștiințare nouă de la {$siteTitle}:\n--\n{$notificationContents}\n\nLink: {$url}\n--\n\nDacă nu mai doriți să primiți emailuri de înștiințare, mergeți la {$unsubscribeLink}, unde introduceți adresa de email și parola.\n\n{$principalContactSignature}','Acest email este trimis utilizatorilor neînregistrați prezenți pe lista de înștiințare prin email.'),('NOTIFICATION_MAILLIST','ru_RU','извещение сайта {$siteTitle}','У Вас новое извещение на сайте  {$siteTitle}:\n--\n{$notificationContents}\n\nСсылка: {$url}\n--\n\nЕсли хотите прекратить получение извещений, пожалуйста перейдите по ссылке  {$unsubscribeLink} и введите свой почтовый адрес и пароль.\n\n{$principalContactSignature}',''),('NOTIFICATION_MAILLIST','zh_CN','来自{$siteTitle}的新信息','您有一条来自{$siteTitle}的新信息:\n--\n{$notificationContents}\n\n链接: {$url}\n--\n\n如果您想停止接收电子邮件通知,前往{$unsubscribeLink}输入您的邮件地址和密码。\n\n{$principalContactSignature}','这封电子邮件是发送给通知邮件列表中的未注册用户。'),('BFR_REVIEW_REMINDER','el_GR','Βιβλίο για αξιολόγηση: Υπενθύμιση Λήξης Προθεσμίας','Αγαπητέ/ή {$authorName}:\n\nΤο μήνυμα αυτό αποτελεί μια υπενθύμιση ότι η αξιολόγηση τιυ βιβλίου  {$bookForReviewTitle} που έχετε αναλάβει θα πρέπει να έχει ολοκληρωθεί μέχρι την  {$bookForReviewDueDate}.\n\nΓια να υποβάλλεται την αξιολόγηση του βιβλίου, παρακαλούμε συνδεθείτε στον ιστότοπο του περιοδικού και συμπληρώστε τα απαραίτητα στοιχεία στην διαδικασία υποβολής άρθρων. Για την διευκόλυνσή σας, η σχετική διεύθυνση σύνδεση αναφέρεται παρακάτω.\n\nURL υποβολής: {$submissionUrl}\n\nΓια οποιαδήποτε ερώτηση ή διευκρίνηση σχετικά με την αξιολόγηση του βιβλίου μπορείτε να επικοινήσετε μαζί μου.\n\nΣας ευχαριστούμε για την συνεισφορά σας στο περιοδικό.\n\n{$editorialContactSignature}','Αυτό είναι ένα μήνυμα που δημιουργήθηκε αυτόματα για να σταλεί σε έναν συγγραφέα αξιολόγησης βιβλίου ως υπενθύμιση για την προθεσμία υποβολής της αξιολόγησής του.'),('BFR_REVIEW_REMINDER_LATE','el_GR','Βιβλίο για αξιολόγηση: Λήξης Προθεσμίας','Αγαπητέ/ή {$authorName}:\n\nΘα θέλαμε να σας υπενθυμίσουμε ότι η αξιλόγηση του βιβλίου {$bookForReviewTitle} που έχετε αναλάβει θα έπρεπε να έχει ολοκληρωθεί μέχρι την {$bookForReviewDueDate} αλλά δυστυχώς δεν έχει παραδοθεί ακόμα.\n\nΓια να υποβάλλετε την αξιολόγηση του βιβλιου, μπορείτε να συνδεθείτε στον ιστότοπο του περιοδικού και να ολοκληρώσετ την διαδικασία υποβολής. Για την διευκόλυνσή σας, η διεύθυνση υποβολής παρατίθεται παρακάτω.\n\nURL υποβολής: {$submissionUrl}\n\nΓια οποιαδήποτε ερώτηση ή διευκρίνηση σχετικά με την αξιολόγηση του βιβλίου μπορείτε να επικοινωνήσετε  μαζί μου.\n\nΑναμένοντας την υποβολή της αξιολόγησης θα ήθελα να σας ευχαριστήσω για την συνεισφορά σας στο περιοδικό.\n\n{$editorialContactSignature}','Αυτό το μήνυμα δημιουργήθηκε αυτόματα για να αποσταλεί σε έναν συγγραφέα αξιολόηγησης βιβλίου μετά την λήξη της προθεσμίας ολοκλήρωσης της αξιολόγησης.'),('BFR_BOOK_ASSIGNED','el_GR','Βιβλίο για αξιολόγηση: Ανάθεση βιβλίου','Αγαπητέ/ή {$authorName}:\n\nΑυτό το μήνυμα επιβεβαιώνει ότι σας ανατέθηκε η αξιολόγηση του βιβλίου  {$bookForReviewTitle} και η οποία θα πρέπει να έχει ολοκλήρωθεί μέχρι την {$bookForReviewDueDate}.\n\nΣας παρακαλούμε βεβαιωθείτε ότι η ταχυδρομική σας διεύθυνση στο Προφίλ σας στο Online σύστημα διαχείρισης του περιοδικού είναι ενημερωμένη. Στην διεύθυνση αυτή θα σας σταλεί ένα ατνίγραφο του βιβλίου προς αξιολόγηση.\n\nΗ διεύθυνση που υπάρχει αυτή τη στιγμή στο σύστημα είναι:\n{$authorMailingAddress}\n\nΑν αυτή η διεύθυνση δεν είναι σωστή ή έχει αλλάξει, σας παρακαλούμε ακολουθήστε τον παρακάτω σύνδεσμο για να ενημερώσετε το πεδίο της διεύθυνσής σας :\n\nURL Προφίλ Χρήστη: {$userProfileUrl}\n \nΓια να υποβάλλετε την αξιολόγησή σας, θα πρέπει να συνδεθείτε στον ιστότοπο του περιοδικού και ολοκλήρώστε την διαδικασί υποβολής .\n\nURL υποβολής: {$submissionUrl}\n\nΓια οποιαδήποτε ερώτηση ή διευκρίνηση σχετική με την αξιολόγηση του βιβλίου μπορείτε να επικοινωνείτε μαζί μου\n\n{$editorialContactSignature}','Αυτό το μήνυμα αποστέλεται από έναν επιμελητή σε έναν συγγραφέα αξιολόγησης βιβλίου όταν ο επιμελητής αναθέτει στον συγγραφέα την αξιολόγηση.'),('BFR_BOOK_DENIED','el_GR','Βιβλίο για αξιολόγηση','Αγαπητέ/ή {$authorName}:\n\nΔυστυχώς, δεν είναι δυνατόν αυτή τη στιγμή να σας αναθέσω την αξιολόγηση του βιβλίου {$bookForReviewTitle} .\n\nΕύχομαι ότι θα ενδιαφερθείτε να αναλάβετε την αξιολόγηση κάποιου άλλου βιβλίου από την λίστα μας, είτε τώρα ή στο μέλλον.\n\n{$editorialContactSignature}','Αυτό το μήνυμα αποστέλεται από έναν επιμελητή σε έναν συγγραφέα που ενδιαφέρεται να αξιολογήσει ένα βιβλίο, το οποίο δεν είναι πλέον διαθέσιμο για αξιολόγηση.'),('BFR_BOOK_REQUESTED','el_GR','Βιβλίο για αξιολόγηση: Αίτημα για αξιολόγηση βιβλίου','Αγαπητέ/ή {$editorName}:\n\nΕνδιαφέρομαι να αναλάβω την σύνταξη μιας αξιολόγηση για το βιβλίο  {$bookForReviewTitle}.\n\nΣας παρακαλώ να με ενημερώσετε αν το συγκεκριμένο βιβλίο είναι ακόμα διαθέσιμο για αξιολόγηση.\n\n{$authorContactSignature}','Αυτό το μήνυμα αποστέλεται σε έναν επιμελητή από έναν συγγραφέα που ενδιαφέρεται ανα αναλάβει την αξιολόγηση ενός βιβλίου από την σχετική λίστα.'),('BFR_BOOK_MAILED','el_GR','Βιβλίο για αξιολόγηση: Αποστολή βιβλίου','Αγαπητέ/ή {$authorName}:\n\nΜε αυτό μήνυμα θα ήθελα να σας ενημερώσω ότι ταχυδρόμησα ένα αντίγραφο του βιβλίου {$bookForReviewTitle} στην παρακάτω ταψχυδρομική διεύθυνση η οποία βρίσκεται στο online Προφίλ σας:\n{$authorMailingAddress}\n \nΓια να υποβάλλεται την αξιολόγησή σας, θα πρέπει να συνδεθείτε στον ιστότοπο του περιοδικού και ακολουθήστε την διαδικασία υποβολής.\n\nURL υποβολής: {$submissionUrl}\n\nΓια οποιαδήποτε ερώτηση ή διευκρίνηση σχετικά με την αξιολόγηση του βιβλίου μπορείτε να επικοινωνείτε μαζί μου.\n\n{$editorialContactSignature}','Το μήνυμα αυτό αποστέλεται από έναν επιμελητή σε έναν συγγραφέα αξιολόγησης βιβλίου, όταν ο επιμελητής έχει ταχυδρομήσει ένα αντίγραφο του βιβλίου προς αξιολόγηση στον συγγραφεά.'),('BFR_REVIEWER_REMOVED','el_GR','Βιβλίο για αξιολόγηση','Αγαπητέ/ή {$authorName}:\n\nΜε αυτό το μήνυμα θα ήθελα να σας ενημερώσω για την ακύρωση της ανάθεσης σε εσάς της αξιολόγησης του βιβλίου  {$bookForReviewTitle}. Η αξιολόγηση του βιβλίου θα είναι διαθέσιμη για ανάθεση σε άλλους συγγραφείς που ενδιαφέρονται για την εργασία αυτή.\n\nΕύχομαι να ενδιαφερθείτε ξανά για την αξιολόγηση κάποιου άλλου βιβλίου της λίστας μας, είτε τώρα ή στο μέλλον.\n\n{$editorialContactSignature}','Αυτό το μήνυμα αποστέλεται από έναν επιμελητή σε έναν συγγραφέα που ενδιαφέρεται για την αξιολόγηση ενός βιβλίου όταν αυτή δεν είναι διαθέσιμη για ανάθεση.'),('BFR_REVIEW_REMINDER','es_ES','Petición de Revisión: Recordatorio Fecha de vencimiento','Estimado {$authorName}:\n\nEste es un recordatorio de que su reseña del libro {$bookForReviewTitle}  se debe realizar hacer antes de la fecha {$bookForReviewDueDate}.\n\nPara enviar su reseña del libro, inicie sesión en la Web de la revista y complete el proceso de envío de revisión en línea. Para su conveniencia, un enlace directo se proporciona a continuación:\n\nURL Presentación: {$submissionUrl}\n\nPor favor, no dude en ponerse en contacto conmigo si tiene alguna pregunta o inquietud sobre esta reseña del libro.\n\nGracias por su contribución a la revista y espero con interés recibir su envío.\n\n{$editorialContactSignature}','Este es un mensaje generado automáticamente que se envía al autor de la revisión de un libro como un recordatorio de que la fecha de su vencimiento se acerca.'),('BFR_REVIEW_REMINDER_LATE','es_ES','Petición de Revisión: Recordatorio Fecha de vencimiento','Estimado  {$authorName}:\n\nEste es un recordatorio de que su reseña del libro {$bookForReviewTitle} se debió hacer para la fecha {$bookForReviewDueDate} pero no se ha recibido todavía.\n\nPara enviar su reseña del libro, por favor, inicie sesión en el Web site del diario y complete el proceso de envío de revisión en línea. Para su conveniencia, un enlace directo se proporciona a continuación:\n\nURL Presentación: {$submissionUrl}\n\nPor favor, no dude en ponerse en contacto conmigo si tiene alguna pregunta o inquietud sobre esta reseña del libro.\n\nGracias por su contribución a la revista y espero con interés recibir su envío.\n\n{$editorialContactSignature}','Este es un mensaje generado automáticamente que se envía a un autor de una revisión después de que la revisión ha llegado a la fecha de vencimiento.'),('BFR_BOOK_ASSIGNED','es_ES','Petición de revisión: Petición asignada','Estimado  {$authorName}:\n\nEste mensaje confirma que {$bookForReviewTitle} se ha asignado a usted para una revisión que debe ser completada antes de {$bookForReviewDueDate}.\n\nAsegúrese de que su dirección de correo en su perfil de usuario está al día. Esta dirección se usará para enviar por correo una copia de la petición a usted para la revisión.\n\nLa dirección de correo que tenemos actualmente en el archivo es:\n{$authorMailingAddress}\n\nSi la dirección es incompleta o ya no está disponible, por favor use la siguiente URL  para actualizar su dirección en su perfil de usuario:\n\nPerfil del usuario URL: {$userProfileUrl}\n \nPara enviar su reseña, por favor, inicie sesión en el Web de la revista y complete el proceso de envío de artículos en línea.\n\nURL: {$submissionUrl}\n\nPor favor, no dude en ponerse en contacto conmigo si tiene alguna pregunta o inquietud sobre esta petición de revisión.\n\n{$editorialContactSignature}','Este correo electrónico es enviado por un editor a un autor de revisión cuando un editor le asigna la petición de revisión al autor.'),('BFR_BOOK_DENIED','es_ES','Petición de revisión','Estimado {$authorName}:\n\nDesafortunadamente, no puedo asignarle en este momento la petición {$bookForReviewTitle}.\n\nEspero que considere la revisión de otra petición de nuestra lista, ya sea en este momento o en el futuro.\n\n{$editorialContactSignature}','Este correo electrónico es enviado por un editor a un autor interesado cuando una petición ya no está disponible para su revisión.'),('BFR_BOOK_REQUESTED','es_ES','Petición de Revisión: Petición solicitada','Estimado {$editorName}:\n\nEstoy interesado en escribir la reseña  {$bookForReviewTitle}.\n\n¿Puede usted confirmar si aún está disponible para su revisión?\n\n{$authorContactSignature}','Este correo electrónico se envía por un autor interesado en escribir una reseña de la lista de peticiones a un editor.'),('BFR_BOOK_MAILED','es_ES','Petición de revisión: Petición enviada','Estimado {$authorName}:\n\nEste mensaje confirma que he enviado {$bookForReviewTitle} a la siguiente dirección de su perfil de usuario :\n{$authorMailingAddress}\n \nPara enviar su reseña, por favor, inicie sesión en la Web de la Revista y complete el proceso de envío:\n\nURL: {$submissionUrl}\n\nPor favor, no dude en ponerse en contacto conmigo si tiene alguna pregunta o inquietud sobre esta reseña.\n\n{$editorialContactSignature}','Este correo electrónico es enviado por un editor para el autor de una revisión cuando el editor ha enviado por correo una petición autor.'),('BFR_REVIEWER_REMOVED','es_ES','Petición de revisión','Estimado {$authorName}:\n\nEste mensaje confirma que ha sido eliminado como revisor de {$bookForReviewTitle}, que se pondrá a disposición de otros autores interesados en hace la revisión.\n\nEspero que considere realizar otra revisión de nuestra lista, ya sea en este momento o en el futuro.\n\n{$editorialContactSignature}','Este correo electrónico es enviado por un editor a un autor interesado cuando una petición ya no está disponible para su revisión.'),('BFR_REVIEW_REMINDER','fa_IR','کتاب برای کارشناسی: یادآوری مهلت انقضا','Dear {$authorName}:\n\nThis is a friendly reminder that your book review of {$bookForReviewTitle} is due {$bookForReviewDueDate}.\n\nبرای ارسال کارشناسی کتاب، لطفا وارد وب سایت مجله شوید و روند ساب میت آن لاین مقاله را کامل کنید. برای راحتی کار شما یک آدرس ارسال نیز در زیر آورده ایم\n\nآدرس ارسال: {$submissionUrl}\n\nدر صورت داشتن هرگونه سؤال در خصوص این کارشناسی کتاب با من تماس بگیرید.\n\nبا تشکر منتظر دریافت ساب میشن شما هستم\n\n{$editorialContactSignature}',''),('BFR_REVIEW_REMINDER_LATE','fa_IR','کتاب برای کارشناسی: مهلت کارشناسی','Dear {$authorName}:\n\nThis is a friendly reminder that your book review of {$bookForReviewTitle} was due {$bookForReviewDueDate} ولی هنوز دریافت نشده است.\n\nبرای ارسال کارشناسی کتاب وارد سایت مجله شوید و روند آن لاین ساب میت مقاله را کامل کنید. برای راحتی کار شما یک آدرس ارسال نیز در زیر آورده ایم\n\nآدرس ساب میشن: {$submissionUrl}\n\nدر صورت داشتن هرگونه سؤال در خصوص این کارشناسی کتاب با من تماس بگیرید.\n\nبا تشکر منتظر دریافت ساب میشن شما هستم\n\n{$editorialContactSignature}',''),('BFR_BOOK_ASSIGNED','fa_IR','کتاب برای کارشناسی: انتساب کتاب','{$authorName} عزیز:\n\nاین ایمیل تایید می کند که  {$bookForReviewTitle} برای کارشناسی کتاب به شما انتساب داده شده است و تا تاریخ {$bookForReviewDueDate} باید انجام شود.\n\nلطفا مطئن شوید که آدرس ایمیل شمه در پروفایل شما بروز است. این ایمیل برای ارسال یک کپی از کتاب برای شما به منظور کارشناسی بکار خواهد رفت.\n\nآدرس ایمیلی که ما از شما داریم:\n{$authorMailingAddress}\n\nاگر این آدرس ایمیل ناکامل است و یا دیگر مورد استفاده شما نیست، لطفا از آدرس زیر برای بروزرسانی آدرس ایمیل خود استفاده کنید:\n\nآدرس پروفایل کاربر: {$userProfileUrl}\n \nبرای ارسال کارشناسی کتاب لطفا وارد سایت شده و روند ارسال آن لاین مقاله  را کامل کنید.\n\nآدرس ساب میشن: {$submissionUrl}\n\nدر صورت داشتن هرگونه سؤال در خصوص این کارشناسی کتاب با من تماس بگیرید.\n\n{$editorialContactSignature}','This email is sent by an editor to a book review author when an editor assigns the book for review to the author.'),('BFR_BOOK_DENIED','fa_IR','کتاب برای کارشناسی','{$authorName} عزیز:\n\nمتاسفانه من نمیتوانم کتاب {$bookForReviewTitle} را به شما برای کارشناسی منتسب کنم.\n\nامیدوارم شما کارشناسی کتاب دیگری  از لیست ما را حال یا آینده به عهده بگیرید\n\n{$editorialContactSignature}',''),('BFR_BOOK_REQUESTED','fa_IR','کتاب برای کارشناسی: کتاب درخواست شده','{$editorName} عزیز:\n\nمن مایلم که کارشناسی کتاب {$bookForReviewTitle} را به عهده بگیرم.\n\nدر صورت امکان مشخص کنید که آیا این کتاب آیا هنوز برای کارشناسی در درسترس می باشد؟\n\n{$authorContactSignature}',''),('BFR_BOOK_MAILED','fa_IR','کتاب برای کارشناسی: کتاب ارسال شد','{$authorName} عزیز:\n\nاین ایمل تایید می کند که من یک کپی از {$bookForReviewTitle} را به آدرس ایمیل زیر از طریق پروفایل آنلاین شما ارسال کرده ام:\n{$authorMailingAddress}\n\nبرای ارسال کارشناسی کتاب، لطفا وارد وب سایت مجله شوید و روند ساب میت آن لاین مقاله را کامل کنید. برای راحتی کار شما یک آدرس ارسال نیز در زیر آورده ایم\n\nآدرس ارسال: {$submissionUrl}\n\nدر صورت داشتن هرگونه سؤال در خصوص این کارشناسی کتاب با من تماس بگیرید.\n\n{$editorialContactSignature}',''),('BFR_REVIEWER_REMOVED','fa_IR','کتاب برای کارشناسی','{$authorName} عزیز:\n\nاین ایمیل تایید می کند که شما از لیست کارشناسان کتاب {$bookForReviewTitle} حذف شده اید، تا بدین وسیله در دسترس دیگر نویسندگان علاقه مند برای وارشناسی کتاب قرار گیرد.\n\nامیدوارم در آینده کارشناسی سایر کتابهای مار را به عهده بگیرید\n\n{$editorialContactSignature}',''),('BFR_REVIEW_REMINDER','fr_CA','Compte rendu de livre : Rappel de la date d\'échéance','Madame, Monsieur, {$authorName}:\n\nCeci est un rappel amical de la date d\'échéance de votre compte rendu de livre {$bookForReviewTitle} qui est le {$bookForReviewDueDate}.\n\nAfin de soumettre votre compte rendu de livre, veuillez vous connecter dans le site Web de la revue et compléter le processus de soumission d\'article en ligne. Pour plus de commodités, l\'URL de la soumission vous est fourni plus ci-dessous.\n\nURL de la soumission : {$submissionUrl}\n\nN\'hésitez pas à communiquer avec moi si vous avez es questions ou préoccupations concernant ce compte rendu de livre.\n\nMerci pour votre contribution à la revue. Dans l\'attente de la réception de votre soumission.\n\n{$editorialContactSignature}',''),('BFR_REVIEW_REMINDER_LATE','fr_CA','Compte rendu de livre : compte rendu non reçu','Monsieur, Madame, {$authorName} :\n\nCeci est un rappel amical pour vous informer que votre compte rendu du livre {$bookForReviewTitle} était attendu le {$bookForReviewDueDate} mais n\'a pas encore été reçu.\n\nPour soumettre votre compte rendu de livre, veuillez vous connecter dans le site Web de la revue et compléter le processus de soumission d\'article en ligne. Pour plus de commodités, l\'URL de la soumission vous a été fourni ci-dessous.\n\nL\'URL de la soumission : {$submissionUrl}\n\nN\'hésitez pas à communiquer avec moi si vous avez des questions ou des préoccupations concernant ce compte rendu de livre.\n\nMerci pour votre contribution à la revue. Dans l\'attente de la réception de votre soumission.\n\n{$editorialContactSignature}',''),('BFR_BOOK_ASSIGNED','fr_CA','Compte rendu de livre : livre assigné','Monsieur, Madame, {$authorName} :\n\nCe courriel confirme que {$bookForReviewTitle} vous a été assigné pour un compte rendu qui devra être complété d\'ici le {$bookForReviewDueDate}.\n\nVeuillez vous assurer que l\'adresse postale dans votre profil utilisateur est à jour. Cette adresse sera utilisé pour vous poster une copie du livre dont vous devez faire le compte rendu.\n\nL\'adresse postale présentement consignée est:\n{$authorMailingAddress}\n\nSi cette adresse est incomplète ou si vous n\'habitez plus à cette adresse, veuillez utiliser l\'URL du profil utilisateur suivant pour mettre à jour votre adresse :\n\nURL du profil utilisateur : {$userProfileUrl}\n \nPour soumettre votre compte rendu de livre, veuillez vous connecter dans le site Web de la revue et compléter le processus de soumission d\'article en ligne.\n\nURL de la soumission : {$submissionUrl}\n\nN\'hésitez pas à me contacter si vous avez des questions ou des préoccupations concernant ce compte rendu de livre.\n\n{$editorialContactSignature}',''),('BFR_BOOK_DENIED','fr_CA','Compte rendu de livre','Madame, Monsieur, {$authorName} :\n\nMalheureusement, Je suis dans l\'impossibilité de vous assigner {$bookForReviewTitle} à ce moment-ci pour fins de compte rendu.\n\nJ\'espère que vous considérez faire le compte rendu d\'un autre livre de notre liste, soir dès maintenant ou à un autre moment.\n\n{$editorialContactSignature}',''),('BFR_BOOK_REQUESTED','fr_CA','Compte rendu de livre : demande de livre','Madame, Monsieur, {$editorName} :\n\nJe suis intéressé à faire le compte rendu du livre {$bookForReviewTitle}.\n\nPourriez-vous m\'informer si ce livre est toujours disponible pour fins de compte rendu?\n\n{$authorContactSignature}',''),('BFR_BOOK_MAILED','fr_CA','Compte rendu de livre : livre posté','Madame, Monsieur, {$authorName} :\n\nCe courriel vous confirme l\'envoi postal d\'une copie de {$bookForReviewTitle} à l\'adresse postale suivante, provenant de votre profil utilisateur en ligne :\n{$authorMailingAddress}\n \nPour soumettre votre compte rendu de livre, veuillez vous connecter dans le site Web de la revue et compléter le processus de soumission d\'article en ligne.\n\nURL de la soumission : {$submissionUrl}\n\nN\'hésitez pas à communiquer avec moi si vous avez des questions ou des préoccupations concernant ce compte rendu de livre.\n\n{$editorialContactSignature}',''),('BFR_REVIEWER_REMOVED','fr_CA','Compte rendu de livre','Madame, Monsieur, {$authorName} :\n\nCe courriel confirme que vous n\'êtes plus responsable du compte rendu du livre {$bookForReviewTitle}, qui sera de nouveau disponible aux autres auteurs intéressés à en faire le compte rendu.\n\nJ\'espère que vous considérez faire le compte rendu d\'un autre livre dans notre liste, soit dès maintenant ou à un autre moment.\n\n{$editorialContactSignature}',''),('BFR_REVIEW_REMINDER','it_IT','Recensioni - Promemoria di scadenza','Gentile {$authorName},\n\nTi ricordo che attendiamo la tua recensione di {$bookForReviewTitle} per il  {$bookForReviewDueDate}.\n\nPer inviare la recensione, fai log-in nel sito della rivista e completa il processo di submission. Per tua praticità, qui sotto trovi un link diretto.\n\nSubmission URL: {$submissionUrl}\n\nSentiti libero di contattarmi per qualsiasi eventuale dubbio.\n\nGrazie del tuo contributo, che aspetto di ricevere presto.\n\n{$editorialContactSignature}','Questa email viene generata automaticamente come promemoria di scadenza di una recensione'),('BFR_REVIEW_REMINDER_LATE','it_IT','Recensioni - Promemoria di scadenza','Gentile {$authorName},\n\nTi ricordo che ancora attendiamo la tua recensione di {$bookForReviewTitle}, scaduta il  {$bookForReviewDueDate}, ma che non abbiamo ancora ricevuto.\n\nPer inviare la recensione, fai log-in nel sito della rivista e completa il processo di submission. Per tua praticità, qui sotto trovi un link diretto.\n\nSubmission URL: {$submissionUrl}\n\nSentiti libero di contattarmi per qualsiasi eventuale dubbio.\n\nGrazie del tuo contributo, che aspetto di ricevere presto.\n\n{$editorialContactSignature}',''),('BFR_BOOK_ASSIGNED','it_IT','Recensioni - Assegnazione volume','Gentile {$authorName},\n\nTi confermo l\'assegnazione di {$bookForReviewTitle} in recensione, con scadenza  {$bookForReviewDueDate}.\n\nTi prego di controllare che l\'indirizzo postale che hai inserito nel tuo profilo sia aggiornato, poiché verrà utilizzato per la spedizione del volume.\n\nL\'indirizzo che abbiamo è:\n{$authorMailingAddress}\n\nSe è incompleto o sbagliato, utilizza il link qui sotto per aggiornarlo, all\'interno del tuo profilo.\n\nUser Profile URL: {$userProfileUrl}\n \nPer inviarci la revisione, fai log-in nel sito della rivista e completa il normale processo di submission, all\'indirizzo {$submissionUrl}\n\nSentiti libero di contattarmi per qualsiasi eventuale dubbio.\n\n{$editorialContactSignature}',''),('BFR_BOOK_DENIED','it_IT','Recensione','Gentile {$authorName}:\n\nPurtroppo non posso assegnarti {$bookForReviewTitle} in recensione.\n\nSpero che troverai, in futuro, altri libri da recensire.\n\n{$editorialContactSignature}',''),('BFR_BOOK_MAILED','it_IT','Recensioni - Volume spedito','Gentile {$authorName},\n\nTi comunico che abbiamo spedito una copia di {$bookForReviewTitle} all\'indirizzo che hai indicato nel tuo profilo: \n{$authorMailingAddress}\n\nPer inviare la recensione, fai log-in nel sito della rivista e completa il processo di submission. Per tua praticità, qui sotto trovi un link diretto.\n\nSubmission URL: {$submissionUrl}\n\nSentiti libero di contattarmi per qualsiasi eventuale dubbio.\n\nGrazie del tuo contributo, che aspetto di ricevere presto.\n\n{$editorialContactSignature}',''),('BFR_REVIEWER_REMOVED','it_IT','Recensione','Gentile {$authorName}:\n\nTi scrivo per confermarti la cancellazione della recensione da parte tua di  {$bookForReviewTitle}, che verrà reso disponibile ad altri autori interessati a recensirlo.\n\nSpero che tu voglia considerare altri libri da recensire, disponibili nel nostro elenco ora o in futuro.\n\n{$editorialContactSignature}',''),('BFR_BOOK_REQUESTED','it_IT','Recensioni - Richiesta volume','Gentile {$editorName}:\n\nSono interessato a recensire \"{$bookForReviewTitle}\".\n\nPuoi confermarmi la disponibilità o meno del volume?\n\nSaluti,\n{$authorContactSignature}',''),('BFR_REVIEW_REMINDER','ja_JP','書評 : 締切日リマインダ','{$authorName} 様:\n\nこれは {$bookForReviewDueDate} が締切の {$bookForReviewTitle} の書評についてのリマインダーメールです。\n\n書評を送信するために，雑誌のWebサイトにログインしてオンライン論文投稿プロセスを完了してください。下記の投稿URLからアクセスできます。\n\n投稿 URL: {$submissionUrl}\n\nもし何かご質問などありましたらお気軽にお問い合わせください。\n\n本誌へのご協力に感謝いたしますとともに，投稿が届くのを楽しみにしております。\n\n{$editorialContactSignature}','締切日が近付いている書評の執筆に対して自動的に作成されて送信されるメールです。'),('BFR_REVIEW_REMINDER_LATE','ja_JP','書評: 締切日','{$authorName}様:\n\nこのメールは 締切日が {$bookForReviewDueDate} となっている 書評 {$bookForReviewTitle} がまだ届いていないためお送りしております。\n\n書評を送信するために，雑誌のWebサイトにログインしてオンライン投稿プロセスを完了してください。下記のURLより投稿が可能です。\n\nURL: {$submissionUrl}\n\n今回の書評について何か疑問や気になる点がございましたらお気軽にご質問ください。\n書評が到着するのを楽しみにしております。\n\n{$editorialContactSignature}','書評の締切がすぎた場合に書評執筆者に自動的に生成されて送信されるメールです。'),('BFR_BOOK_MAILED','ja_JP','書評: 図書のメール通知','{$authorName} 様:\n\nこれは，オンラインユーザ情報に登録されている次のアドレス: {$authorMailingAddress} 宛に {$bookForReviewTitle} のコピーを送信したことをお知らせするメールです。\n\n書評を投稿するには，雑誌のWebサイトにログインしてオンライン投稿プロセスを完了してください。\n投稿は下記のURLより可能です。\n\nURL: {$submissionUrl}\n\n今回の書評について何か疑問点や気になる点がございましたら，お気軽にお問い合わせください。\n\n{$editorialContactSignature}','編集者が図書のコピーを評者にメールした際に編集者が評者に送信するメールです。'),('BFR_REVIEWER_REMOVED','ja_JP','書評取消','{$authorName} \n\n{$bookForReviewTitle} の評者として削除されました。この図書は他の方の書評用にまわされます。\n\n今回あるいは次回以降に，リストにある他の図書で再度ご検討いただければ幸いです。\n\n{$editorialContactSignature}','今回あるいは次回以降に，リストに掲載されている他の図書で再度ご検討いただけましたら幸いです。'),('BFR_BOOK_DENIED','ja_JP','書評謝絶','{$authorName} 様:\n\n残念ながら，今回 {$bookForReviewTitle} の書評をお願いすることができません。\n\n今回あるいは次回以降に，リストに掲載されている他の図書で再度ご検討いただけましたら幸いです。\n\n{$editorialContactSignature}','図書の書評ができなくった場合に書評執筆希望者に対して編集者から送られるメールです。'),('BFR_BOOK_ASSIGNED','ja_JP','書評: 割り当て','{$authorName} 様:\n\n{$bookForReviewTitle} の書評があなたに割り当てられました。 {$bookForReviewDueDate} までに書評を完成させてください。\n\nユーザプロフィールに登録されているメールアドレスが最新かどうか確認してください。このアドレスは書評用に図書をコピーして送る際にも使用されます。\n\nこちらで把握しているメールアドレス:\n{$authorMailingAddress}\n\nこのメールアドレスが不完全か，もはや使用していない場合は，次のユーザプロフィールURLにアクセスして，アドレス情報を更新してください。:\n\nユーザプロフィール URL: {$userProfileUrl}\n\n書評を投稿するには，雑誌のWebサイトにログインしてオンライン投稿プロセスを完了してください。\n\n投稿 URL: {$submissionUrl}\n\n今回の書評について何か疑問点やお気づきの点がございましたら，お気軽にお問い合わせください。\n\n{$editorialContactSignature}','このメールは執筆者に図書を割り当てた際に編集者が執筆者に送信するメールです。'),('BFR_BOOK_REQUESTED','ja_JP','書評: リクエスト','{$editorName} 様:\n\n私は {$bookForReviewTitle} の書評執筆に関心があります。\n\nこの図書がまだ書評可能かどうか確認していただけますでしょうか？\n\n{$authorContactSignature}','これは，リストにある図書の書評執筆に関心のある著者が編集者に送信されるメールです。'),('BFR_REVIEWER_REMOVED','nl_NL','Te bespreken boek','Beste {$authorName}:\n\nMet deze e-mail bevestigen wij dat u niet langer {$bookForReviewTitle} bespreekt. Het boek zal ter aangeboden worden aan andere geïnteresseerden.\n\nIk hoop dat u nu of in de toekomst wilt overwegen om een ander boek uit onze lijst te bespreken.\n\n{$editorialContactSignature}','Deze e-mail wordt door een redacteur verstuurd aan een auteur als een boek niet langer beschikbaar is voor bespreking'),('BFR_BOOK_MAILED','nl_NL','Boekbespreking: boek is verstuurd','Beste {$authorName}:\n\nMet deze e-mail bevestig ik dat ik een exemplaar van {$bookForReviewTitle} heb verstuurd naar het volgende adres uit uw gebruikersprofiel:\n{$authorMailingAddress}\n \nOm uw bespreking in te dienen, kunt u inloggen op de website van het tijdschrift en het online indienen van een artikel uitvoeren.\n\nURL: {$submissionUrl}\n\nVoel u vrij om contact met me op te nemen als u vragen heeft over deze boekbespreking.\n\n{$editorialContactSignature}','Deze e-mail wordt door een  redacteur verstuur aan een auteur als de redacteur het te bespreken boek heeft verstuurd.'),('BFR_BOOK_REQUESTED','nl_NL','Boek gevraagd voor bespreking','Beste {$editorName}:\n\nIk heb interesse in het schrijven van een bespreking over {$bookForReviewTitle}.\n\nKunt u me zeggen of dit boek nog beschikbaar is voor bespreking?\n\n{$authorContactSignature}','Deze e-mail wordt door een auteur die een boek wil bespreken, verstuurd naar een redacteur.'),('BFR_BOOK_DENIED','nl_NL','Boekbespreking','Beste {$authorName}:\n\nHelaas kan ik {$bookForReviewTitle} niet voor een bespreking aan u toekennen.\n\nIk hoop dat u nu of in de toekomst wilt overwegen om een ander boek uit onze lijst te bespreken.\n\n{$editorialContactSignature}',''),('BFR_REVIEW_REMINDER','nl_NL','Boekbespreking: herinnering aan de afloopdatum','Beste {$authorName}:\n\nDit is een vriendelijke herinnering dat uw boekbespreking van {$bookForReviewTitle} verwacht wordt op {$bookForReviewDueDate}.\n\nOm uw bespreking in te sturen, kunt u inloggen op de website van het tijdschrift en het online inzenden van een artikel doorlopen. Om het u makkelijk te maken vindt u hieronder een URL voor het inzenden.\n\nURL voor uw inzending: {$submissionUrl}\n\nVoel u vrij om contact met mij op te nemen als u vragen heeft over deze boekbespreking.\n\nIk dank u voor uw bijdrage aan het tijdschrift en kijk uit naar het ontvangen van uw bijdrage.\n\n{$editorialContactSignature}','Dit is een automatisch gegenereerde e-mail die naar de auteur van een boekbespreking wordt verstuurd als  de uiterste inzenddatum nadert.'),('BFR_REVIEW_REMINDER_LATE','nl_NL','Boekbespreking: inzenddatum verlopen','Beste {$authorName}:\n\nDit is een vriendelijke herinnering dat uw boekbespreking van {$bookForReviewTitle} verwacht was op {$bookForReviewDueDate}, maar nog niet door ons is ontvangen.\n\nOm uw bespreking in te sturen, kunt u inloggen op de website van het tijdschrift en het online inzenden van een artikel doorlopen. Om het u makkelijk te maken vindt u hieronder een URL voor het inzenden.\n\nURL voor uw inzending: {$submissionUrl}\n\nVoel u vrij om contact met mij op te nemen als u vragen heeft over deze boekbespreking.\n\nIk dank u voor uw bijdrage aan het tijdschrift en kijk uit naar het ontvangen van uw bijdrage.\n\n{$editorialContactSignature}','Dit is een automatisch gegenereerde e-mail die naar de auteur van een boekbespreking wordt verstuurd nadat de inzenddatum is gepasseerd.'),('BFR_BOOK_ASSIGNED','nl_NL','Boekbespreking: boek toegewezen','Beste {$authorName}:\n\nMet deze e-mail bevestigen wij dat {$bookForReviewTitle} aan u is toegewezen voor een boekbespreking. Wij verwachten de bespreking op  {$bookForReviewDueDate}.\n\nVergewis u ervan dat het postadres in uw profiel actueel is. Het boek wordt naar dat adres verstuurd.\n\nHet adres dat we momenteel van u hebben is:\n{$authorMailingAddress}\n\nAls dit adres incompleet is of als u niet langer op dit adres bereikbaar bent kunt u de volgende URL gebruiken om uw adres in uw profiel bij te werken:\n\nURL gebruikersprofiel: {$userProfileUrl}\n\nOm uw bespreking in te sturen, kunt u inloggen op de website van het tijdschrift en het online inzenden van een artikel doorlopen. Om het u makkelijk te maken vindt u hieronder een URL voor het inzenden.\n\nURL voor uw inzending: {$submissionUrl}\n\nVoel u vrij om contact met mij op te nemen als u vragen heeft over deze boekbespreking.\n\n{$editorialContactSignature}','Deze e-mail wordt door een redacteur verstuurd naar de auteur van een boekbespreking als de redacteur het boek aan die auteur toekent.'),('BFR_REVIEW_REMINDER','ro_RO','Carte pentru a fi evaluată: rapel privind data limită','Stimate {$authorName}:\n\nVă readucem aminte că evaluarea pentru cartea {$bookForReviewTitle} are data limită {$bookForReviewDueDate}.\n\nPentru a trimite evaluarea, autentificați-vă pe siteul revistei și completați pașii pentru depunerea propunerii online. Pentru eficiență vi se ofer mai jos un URL la care să depuneți propunerea.\n\nURL-ul pentru depunere propunere: {$submissionUrl}\n\nVă rog să mă contactați dacă aveți întrebări sau neclarități privind această evaluare a cărții.\n\nVă mulțumim pentru contribuția dumneavoastră la revistă și așteptăm propunerea.\n\n{$editorialContactSignature}',''),('BFR_REVIEW_REMINDER_LATE','ro_RO','Carte pentru a fi evaluată: data limită pentru evaluare','Stimate {$authorName}:\n\nAcest mesaj este pentru a te anunța că evaluarea cărții intitulate {$bookForReviewTitle} a avut data limită {$bookForReviewDueDate} și încă nu a fost primită.\n\nPentru a trimite evaluarea pentru carte, autentificați-vă pe siteul revistei și completați pașii pentru depunerea propunerii. Pentru a ușura procesul vă este dat mai jos un URL.\n\nURL-ul propunerii: {$submissionUrl}\n\nDacă aveți întrebări sau nelămuriri, vă rog să mă contactați.\n\nVă mulțumim pentru contribuția la revistă și așteptăm propunerea.\n\n{$editorialContactSignature}',''),('BFR_BOOK_ASSIGNED','ro_RO','Carte pentru a fi evaluată: angajată','Stimate {$authorName}:\n\nAcest email confirmă faptul că {$bookForReviewTitle} v-a fost atribuit pentru a încheia evaluarea până la data de {$bookForReviewDueDate}.\n\nAsigură-te că adresa de email din profilul online este actuală. Această adresă va fi utilizată pentru a trimite o copie a cărții pentru a începe evaluarea.\n\nAdresa de email pe care o avem acum este:\n{$authorMailingAddress}\n\nDacă adresa de email este incompletă sau nu mai este de actualitate, urmează URL-ul de mai jos pentru a o actualiza:\n\nURL-ul profilului utilizatorului: {$userProfileUrl}\n \nPentru a trimite evaluarea cărții, autentificați-vă pe siteul revistei și încheiați procesul de trimitere a propunerii.\nURL-ul pentru depunere: {$submissionUrl}\n\nPentru întrebări și neclarități privind evaluarea acestei cărți, contactați-mă.\n\n{$editorialContactSignature}',''),('BFR_BOOK_DENIED','ro_RO','Carte pentru a fi evaluată','Stimate {$authorName}:\n\nDin nefericire nu vă pot angaja în acest moment cu evaluarea pentru {$bookForReviewTitle}.\n\nSperăm că veți lua în considerare evaluarea unei alte cărți din listă în acest moment sau poate în viitor.\n\n{$editorialContactSignature}',''),('BFR_BOOK_REQUESTED','ro_RO','Carte pentru a fi evaluată: solicitarea unei cărți','Stimate {$editorName}:\n\nSunt interesat de a face evaluarea pentru {$bookForReviewTitle}.\n\nPuteți confirma dacă această carte este disponibilă?\n\n{$authorContactSignature}',''),('BFR_BOOK_MAILED','ro_RO','Carte pentru a fi evaluată: cartea a fost trimisă prin email','Stimate {$authorName}:\n\nAcest email confirmă că ai trimis o copie din {$bookForReviewTitle} la următoarea adresă de email existentă în profilul online a utilizatorului:\n{$authorMailingAddress}\n\nPentru a trimite evaluarea cărții, autentificați-vă pe siteul revistei și încheiați procesul de trimitere online.\n\nURL-ul propunerii: {$submissionUrl}\n\nDacă aveți întrebări și neclarități privind evaluarea cărții, contactați-mă.\n\n{$editorialContactSignature}',''),('BFR_REVIEWER_REMOVED','ro_RO','Carte pentru a fi evaluată','Stimate {$authorName}:\n\nAcest email confirmă faptul că ați fost dezangajat de la sarcina de evaluare a cărții {$bookForReviewTitle}, care va fi pusă la dispoziția autorilor interesați pentur a face această evaluare.\n\nSperăm să luați în considerare evaluarea altei cărți din lista existentă, fie la acest moment sau în viitor.\n\n{$editorialContactSignature}',''),('BFR_REVIEW_REMINDER','eu_ES','Ebaluatzeko liburua: mugaegunaren oroigarria','{$authorName} jauna/andrea:\n\nOroigarri honekin gogorarazi nahi dizut zure {$bookForReviewTitle} liburuaren ebaluazioa {$bookForReviewDueDate} mugaegunerako egin behar  dela.\n\nLiburuaren ebaluazioa bidaltzeko, has ezazu saioa aldizkariaren web orrian eta bete ezazu artikulua bidaltzeko lineako prozesua, mesedez. Bidea errazteko, bidalketaren URLa agertzen da azpian.\n\nBidalketaren URLa: {$submissionUrl}\n\nArren, liburuaren ebaluazioari buruzko galderarik edo zalantzarik izanez gero, jar zaitez nirekin harremanetan. \n\nEskerrik asko aldizkariari laguntzeagatik. Zure aurkezpena jasotzeko zain geratzen naiz.\n\n{$editorialContactSignature}','Mezu elektroniko hau automatikoki sortzen da, liburu bat ebaluatzen ari den egileari ebaluazioaren mugaeguna gerturatzen ari dela gogorarazteko.'),('BFR_REVIEW_REMINDER_LATE','eu_ES','Ebaluatzeko liburua: ebaluazioaren mugaeguna','Oroigarri honekin jakinarazi nahi dizut {$bookForReviewTitle} liburuaren ebaluazioa  {$bookForReviewDueDate} mugaegunerako zela, baina ez dugula oraindik jaso.\n\nLiburuaren ebaluazioa bidaltzeko, has ezazu saioa aldizkariaren web orrian, eta bete ezazu artikulua bidaltzeko lineako prozesua, mesedez. Bidea errazteko, bidalketaren URLa agertzen da azpian:\n\nBidalketaren URLa: {$submissionUrl}\n\nArren, liburuaren ebaluazioari buruzko galderarik edo zalantzarik izanez gero, jar zaitez nirekin harremanetan.\n\nEskerrik asko aldizkariari laguntzeagatik. Zure aurkezpena jasotzeko zain geratzen naiz.\n\n{$editorialContactSignature}','Mezu elektroniko hau automatikoki bidaltzen zaio liburua ebaluatzea dagokion egileari, ebaluazioa bidaltzeko eguna igaro ondoren.'),('BFR_BOOK_ASSIGNED','eu_ES','Ebaluatzeko liburua: esleitutako liburua','{$authorName} jauna/andrea:\nMezu elektroniko honek baieztatzen du {$bookForReviewTitle} liburuaren ebaluazioa egitea esleitu zaizula, eta ebaluazioa {$bookForReviewDueDate} mugaegunerako amaitu behar dela.\nMesedez, ziurtatu ezazu zure lineako erabiltzailearen profilean agertzen den posta-helbidea eguneratuta dagoela. Helbide horretara bidaliko da ebaluazioa egiteko esleitu zaizun liburuaren kopia.\nUne honetan fitxategian dagoen zure posta-helbidea honako hau da:\n{$authorMailingAddress}\n\nHelbide hori zuzena ez bada edo ez baduzu erabiltzen, erabil ezazu erabiltzailearen profilaren URLa zure helbidea eguneratzeko, mesedez:\nErabiltzailearen profilaren URLa: {$userProfileUrl}\n\nLiburuaren ebaluazioa bidaltzeko, has ezazu saioa aldizkariaren web orrian eta bete ezazu artikulua bidaltzeko lineako prozesua, mesedez.\n\nBidalketaren URLa: {$submissionUrl}\n\nArren, liburuaren ebaluazioari buruzko galderarik edo zalantzarik izanez gero, jar zaitez nirekin harremanetan.\n\n{$editorialContactSignature}','Mezu elektroniko hau editoreak bidaltzen dio liburu baten ebaluazioa egiteko esleitu den egileari, editoreak liburua ebaluatzeko egilea izendatzen duenean.'),('BFR_BOOK_DENIED','eu_ES','Ebaluatzeko liburua','{$authorName} jauna/andrea:\n\nTamalez, une honetan ezin zaitut esleitu {$bookForReviewTitle} liburuaren ebaluazioa egiteko.\n\nEspero dut gure zerrendako beste libururen bat ebaluatzeko prest egongo zarela, orain edo etorkizunean.\n\n{$editorialContactSignature}','Mezu elektroniko hau editoreak bidaltzen dio liburu bat ebaluatu nahi duen egileari, liburu hori ebaluatzeko moduan ez badago.'),('BFR_BOOK_REQUESTED','eu_ES','Ebaluatzeko liburua: liburua eskatzea','{$editorName} jauna/andrea:\n\n{$bookForReviewTitle} liburua ebaluatzea gustatuko litzaidake.\n\nBaieztatuko al zenidake, mesedez, liburu hori ebaluatzeko moduan dagoen oraindik?\n\n{$authorContactSignature}','Mezu elektroniko hau zerrendako liburu bat ebaluatu nahi duen egile batek bidaltzen dio editoreari.'),('BFR_BOOK_MAILED','eu_ES','Ebaluatzeko liburua: liburua postaz bidaltzea','{$authorName} jauna/andrea:\n\nMezu elektroniko honek baieztatzen du {$bookForReviewTitle} liburuaren kopia bat bidali dudala zure lineako erabiltzailearen profilean agertzen den posta-helbide honetara: \n{$authorMailingAddress}\n\nLiburuaren ebaluazioa bidaltzeko, has ezazu saioa aldizkariaren web orrian eta bete ezazu artikulua bidaltzeko lineako prozesua, mesedez.\n\nBidalketaren URLa: {$submissionUrl}\n\nArren, liburuaren ebaluazioari buruzko galderarik edo zalantzarik izanez gero, jar zaitez nirekin harremanetan, mesedez.\n\n{$editorialContactSignature}','Mezu elektroniko hau editoreak bidaltzen dio ebaluazioa egiteko izendatuta dagoen egileari, editoreak idazleari ebaluatzeko liburuaren kopia bat bidaltzen dionean.'),('BFR_REVIEWER_REMOVED','eu_ES','Ebaluatzeko liburua','{$authorName} jauna/andrea:\n\nMezu elektroniko honek baieztatzen du {$bookForReviewTitle} liburua ebaluatzeko ardura kendu zaizula. Liburu hori ebaluatu nahi duten beste egile batzuen eskura jarriko da.\n\nEspero dut gure zerrendako beste libururen bat ebaluatzeko prest egongo zarela, orain edo etorkizunean.\n\n{$editorialContactSignature}','Mezu elektroniko hau editoreak bidaltzen dio liburua ebaluatu nahi duen egile bati, liburua ebaluatzeko moduan ez badago.'),('BFR_REVIEW_REMINDER','zh_CN','书评：截止日期提醒','{$authorName}，您好:\n\n这个一个友情提示，是关于《{$bookForReviewTitle}》的书评截止日期{$bookForReviewDueDate}.\n\n提交您的书评，请进入到期刊网站并在线完成文章提交，为了您的方便，提供给您投稿URL如下.\n\n投稿 URL: {$submissionUrl}\n\n请随时与我联系，如果您有与书评相关的任何问题。感谢您对本刊的贡献，我期待着收到您的提交。\n{$editorialContactSignature}','这是一个自动生成的电子邮件，用于发送给书评作者以提醒他书评提交的截止日期'),('BFR_REVIEW_REMINDER_LATE','zh_CN','书评到期','{$authorName}，您好！\n\n这是一个有好的提醒邮件，您的关于{$bookForReviewTitle}的书评已经到期（{$bookForReviewDueDate}），但还没有收到。\n\n请登录到期刊网站并提交您的书评，投稿URL如下： {$submissionUrl}\n\n如果您对书评有任何问题或者建议，请随时联系我们。高些您对本刊的贡献，我们期刊您的来稿。\n\n{$editorialContactSignature}','这是一个自动生成的电子邮件，在书评截止日期到来后将发送给书评作者'),('BFR_BOOK_ASSIGNED','zh_CN','书评：指派','{$authorName} 您好！\n\n这个电邮确认关于《{$bookForReviewTitle}》的评审工作已经指派给您，并可以在{$bookForReviewDueDate}之前完成。\n\n请确认在万盏注册的您的邮寄地址是最新，这个地址将用于邮寄书的副本给您。您现在使用的邮寄地址如下：\n\n{$authorMailingAddress}\n\n如果这个地址不完整或者您不在使用这个地址，请点击如下地址，更新您的电邮地址：\n用户帐户URL: {$userProfileUrl}\n \n提交您的书评，您需要登录到期刊网站，完成在线稿件提交。\n提交地址: {$submissionUrl}\n\n如有您对本次书评的任务有任何疑问或者建议，请联系我。\n{$editorialContactSignature}','当编辑指派了一个书评的作者，这个邮件将由编辑发送给书评的作者。'),('BFR_BOOK_DENIED','zh_CN','书评','{$authorName}，您好！\n\n很不幸，这次我不能指派《{$bookForReviewTitle}》这本书的评审工作给您。我希望您能考虑这次或者将来对我们提供的其他书进行评审。\n\n{$editorialContactSignature}','这个邮件由编辑发送给有兴趣的不再做书评的作者 .'),('BFR_BOOK_REQUESTED','zh_CN','书评：请求书','{$editorName}，您好！\n\n我对撰写《{$bookForReviewTitle}》这本书的评论很感兴趣，您能确认这本书是否已经写了书评？\n\n\n{$authorContactSignature}','这个邮件由作者发送给编辑，表明他对写书评感兴趣。'),('BFR_BOOK_MAILED','zh_CN','书评：书已邮寄','亲爱的 {$authorName}：\n\n收到这封邮件，说明我已经将一份{$bookForReviewTitle}的拷贝邮寄给了您在线账户中的邮件地址。\n{$authorMailingAddress}\n\n要提交您的书评，请先登录期刊站点，完成在线投稿流程。\n\n投稿URL： {$submissionUrl}\n\n 如果您遇到问题或者关注的书评，请随时联系我。','这是一封由编辑发送给书评作者的电子邮件。当编辑将书的一份拷贝的 邮寄给作者时该邮件会被发送！'),('BFR_REVIEWER_REMOVED','zh_CN','书评','{$authorName}，您好：\n\n收到这封电子邮件，说明您已经被从{$bookForReviewTitle}的书评作者中移除。这使得其它感兴趣的作者可以审稿这本书。\n\n我们希望您现在或者将来考虑审查清单中的其它书籍。\n\n{$editorialContactSignature}','当一本书不再做审查时，编辑会将这封邮件发动给该书的兴趣作者！'),('SWORD_DEPOSIT_NOTIFICATION','el_GR','Ενημερώση για αρχειοθέτηση άρθρου','Συγχαρητήρια για την αποδοχή του άρθρου σας, \"{$articleTitle}\", για δημοσίευση στο περιοδικό {$journalName}. Αν επιθυμείτε, μπορείτε αυτόματα να αρχειοθετήσετε το έρθρο σας σε ένα ή περισσότερα καταθετήρια.\n\nΠηγαίνεται στη διεύθυνση {$swordDepositUrl} για τα περαιτέρω.\n\nΑυτό το μήνυμα δημιουργήθηκε από το SWORD deposit plugin του Open Journal Systems.','Αυτό το πρότυπο μηνύματος χρησιμοποιείται για την ενημέρωση του συγγραφέα σχετικά με την δυνατότητα αρχειοθέτησης του άρθρου του.'),('SWORD_DEPOSIT_NOTIFICATION','es_ES','Notificación de depósito','Enhorabuena por la aceptación de su presentación, \"($ articleTitle)\", para su publicación en {$journalName}. Si lo desea, puede depositar de forma automática su presentación en uno o varios repositorios.\n\nVaya a {$swordDepositUrl} para proceder.\n\nEste correo electrónico fue generado por Open Journal Systems\' SWORD deposit plugin.','Esta plantilla de correo electrónico se utiliza para notificar a un autor de puntos opcionales de depósito para los depósitos SWORD.'),('SWORD_DEPOSIT_NOTIFICATION','fa_IR','مطلع ساختن از دپوزیت','با خوشوقتی به اطلاع می رشاند که دپوزیت مقاله شما, \"{$articleTitle}\", برای چاپ در مجله {$journalName} مورد قبول واقع شد. در صورت تمایل می توانید نسبت به دپوزیت مقاله خود در بیش از یک مخزن نیز اقدام کنید..\n\nبرای ادامه به  {$swordDepositUrl} بروید.\n\nاین ایمیل توسط افزونه دپوزیت سورد مربوط به سیستم های مجله آزاد تولید شده است',''),('SWORD_DEPOSIT_NOTIFICATION','fr_CA','Avis de dépôt','Félicitations pour l\'acceptation de votre soumission, \"{$articleTitle}\", pour publication dans la revue {$journalName}. Si vous le souhaitez, vous pouvez déposer automatiquement votre soumission dans un ou plusieurs de nos services d\'archivage.\n\nAller à {$swordDepositUrl} afin de procéder.\n\nCe courriel a été généré par le plugiciel de dépôt SWORD du Open Journal Systems.',''),('SWORD_DEPOSIT_NOTIFICATION','it_IT','Notifica di deposito','Congratulazioni per l\'accettazione della tua submission, \"{$articleTitle}\", per la pubblicazione in {$journalName}. \n\nSe vuoi, puoi depositare automaticamente la tua submission in uno o più archivi.\n\nVai all\'indirizzo {$swordDepositUrl} per proseguire.\n\nQuesta email è generara atumaticamentee da Open Journal Systems\' SWORD deposit plugin.',''),('SWORD_DEPOSIT_NOTIFICATION','ja_JP','デポジット通知','この度は， {$journalName} に  \"{$articleTitle}\" を投稿いただきまして誠に有難うございます。\n\nご希望の場合は，下記のURLから他のリポジトリにも自動的にデポジットすることができます。\n\n{$swordDepositUrl}\n\nこのメールは，Open Journal Systems\' SWORD デポジットプラグインで生成されました。','SWORD デポジットでデポジットポイントの選択を著者に通知するために使われるテンプレートです。'),('SWORD_DEPOSIT_NOTIFICATION','nl_NL','Bericht van opname','Gefeliciteerd met de acceptatie van uw inzending, \"{$articleTitle}\", voor publicatie in {$journalName}. Als u wilt, kunt u uw inzending automatisch opnemen in één of meer repositories.\n\nGa daarvoor naar {$swordDepositUrl}.\n\nDeze e-mail is gegenereerd door de SWORD deposit plugin van Open Journal Systems.','Dit e-mail sjabloon wordt gebruikt om een auteur te in te lichten over de mogelijkheid om met SWORD in te zenden naar repositories'),('SWORD_DEPOSIT_NOTIFICATION','ro_RO','Înștiințare pentru depozitare','Felicitări pentru acceptul propunerii de articol \"{$articleTitle}\" pentru a fi publicat în  {$journalName}. Dacă doriți, puteți depozita automat propunerea în unul sau mai multe depozite.\n\nMergi la {$swordDepositUrl} pentru a proceda.\n\nAcest email a fost generat de modulul OJS pentru depozitare prin SWORD.',''),('SWORD_DEPOSIT_NOTIFICATION','eu_ES','Gordailuari buruzko jakinarazpena','Zorionak zure aurkezpena, \"{$articleTitle}, {$journalName} aldizkarian argitaratzeko onartu delako. Nahi izanez gero, zure aurkezpena automatikoki jar dezakezu gordailu batean edo gehiagotan.\n\nHorretarako, joan zaitez hona: {$swordDepositUrl}.\n\nMezu elektroniko hau Open Journal System-en SWORD gordailuaren pluginak sortu du.','Mezu elektronikoaren eredu hau egileei SWORD gordailuetan aurkezpenak gorde ahal izateko hainbat puntu aukeratu daitezkeela jakinarazteko erabiltzen da.'),('SWORD_DEPOSIT_NOTIFICATION','zh_CN','存入通知','恭喜您的文章\"{$articleTitle}\"已经被 {$journalName}录取。您可以选择这篇稿件自动存入一个或者多个仓储。\n\n进入{$swordDepositUrl}继续。\n\n这个邮件由Open Journal Systems\' 的SWORD deposit 插件自动生成。','本邮件模板用于通知作者关于SWORD存储的存入点选择'),('THESIS_ABSTRACT_CONFIRM','el_GR','Υποβολή Περίληψης Διατριβής','Αυτό το μήνυμα δημιούργηθηκε αυτόματα από την φόρμα υποβολής περίληψης διατριβής του περιοδικού {$journalName} .\n\nΠαρακαλούμε επιβεβαιώστε ότι οι πληροφορίες της υποβολής είναι σωστές. Με την επιβεβαίωσή σας, η περίληψη θα δημοσιευτεί στην online έκδοση του περιοδικού.\n\nΑπλά απαντήστε στο {$thesisName} ({$thesisEmail}) με το περιεχόμενο αυτού του μηνύματος και την επιβεβαίωσή σας, καθώς με οποιαδήποτε σύσταση ή διόρθωση.\n\nΣας ευχαριστούμε.\n\n\nΤίτλος : {$title} \nΣυγγραφέας : {$studentName}\nΤίτλος : {$degree}\nΌνομα Τίτλου: {$degreeName}\nΤμήμα : {$department}\nΠανεπιστήμιο : {$university}\nΗμερομηνία Αποδοχής : {$dateApproved}\nΕπιβλέπων : {$supervisorName}\n\nΠερίληψη\n--------\n{$abstract}\n\n{$thesisContactSignature}',''),('THESIS_ABSTRACT_CONFIRM','es_ES','Presentación de resúmen de Tesis','Este correo fué generado automáticamente por el formulario de envío de resúmenes de tesis de {$journalName} \n\nPor favor, confirme que la información enviada es correcta. Tras recibir su confirmación, el resúmen será publicado en la edición online de la revista.\n\nSimplemente responda a {$thesisName} ({$thesisEmail}) con el contenido de este mensaje y tu confirmación, así como cualquier clarificación o corrección recomendada.\n\nGracias.\n\n\nTítulo : {$title} \nAutor : {$studentName}\nTítulo : {$degree}\nNombre del Título: {$degreeName}\nDepartamento : {$department}\nUniversidad : {$university}\nFecha de Aceptación : {$dateApproved}\nSupervisor : {$supervisorName}\n\nResúmen\n--------\n{$abstract}\n\n{$thesisContactSignature}','Esta plantilla de correo se usa para confirmar un envío de un resúmen de una tesis por un investigador. Se envía al supervisor del investigador, a quien se le pide que confirme los detalles del resúmen de tesis enviado.'),('THESIS_ABSTRACT_CONFIRM','fa_IR','ساب میشن چکیده پایان نامه','این ایمیل بطور خودکار توسط فرم چکیده پایان نامه {$journalName} تولید شده است.\n\nلطفا تایید کنید که اطلاعات ارسالی صحیح است. پس از دریافت تاییدیه شما چکیده پایان نامه بصورا آن لاین منتشر میشود.\n\nکافی است که به {$thesisName} ({$thesisEmail}) همرا با محتوای این ایمیل و تاییدیه خود پاسخ دهید ، همچنین هرگونه اصلاحیه ای را نیز ذکر کنید.\n\nبا تشکر.\n\n\nعنوان : {$title} \nنویسنده : {$studentName}\nدرجه : {$degree}\nنام درجه: {$degreeName}\nگروه : {$department}\nدانشگاه : {$university}\nتاریخ پذیرش : {$dateApproved}\nاستاد راهنما : {$supervisorName}\n\nچکیده\n--------\n{$abstract}\n\n{$thesisContactSignature}',''),('THESIS_ABSTRACT_CONFIRM','fr_CA','Soumission de résumé de thèse','Ce courriel a été généré automatiquement par le formulaire de soumission de résumé de thèse de {$journalName}.\n\nVeuillez confirmer que l\'information soumise est correcte. Sur réception de votre confirmation, le résumé sera publié dans l\'édition en ligne de la revue.\n\nRépondre à {$thesisName} ({$thesisEmail}) avec le contenu de ce message et votre confirmation, ainsi qu\'avec toutes les recommendations de clarification ou de correction.\n\nMerci.',''),('THESIS_ABSTRACT_CONFIRM','it_IT','Richiesta conferma dei dati di una tesi','Questa e-mail è generata automaticamente dal sistema di gestione degli abstract delle tesi di {$journalName}.\n\nLe chiediamo di confermare la correttezza delle informazioni inserite. Una volta ricevuta tale conferma, l\'abstract verrà pubblicato sulla versione on-line della rivista.\n\nPer confermare i dati, basta rispondere a {$thesisName} ({$thesisEmail}) con una e-mail contenente il testo di questo messaggio, la sua conferma, e ogni richiesta di correzione o chiarimento che riterrà opportuna.\nGeneralmente è sufficiente cliccare sul pulsante \"Rispondi\" del client di posta elettronica.\n\nGrazie.\n{$thesisContactSignature}\n\nDati della tesi\nTitle : {$title} \nAuthor : {$studentName}\nDegree : {$degree}\nDegree Name: {$degreeName}\nDepartment : {$department}\nUniversity : {$university}\nAcceptance Date : {$dateApproved}\nSupervisor : {$supervisorName}\n\nAbstract\n--------\n{$abstract}',''),('THESIS_ABSTRACT_CONFIRM','ja_JP','学位論文要旨の投稿','このメールは {$journalName} の学位論文要旨投稿フォームから自動的に生成されました。\n\n投稿された情報が正しいかどうか確認してください。確認がとれ次第，要旨は雑誌のオンライン版で公開されます。\n\n明示したい点や修正点とあなたの確認の結果をこのメッセージにそえて，\n{$thesisName} ({$thesisEmail}) \nまで返信してください。\n\nよろしくお願い致します。\n\n\n論文タイトル : {$title} \n著者 : {$studentName}\n学位 : {$degree}\n学位の種類: {$degreeName}\n部局名 : {$department}\n大学名 : {$university}\n授与年月日 : {$dateApproved}\n指導教員 : {$supervisorName}\n\n要旨\n--------\n{$abstract}\n\n{$thesisContactSignature}',''),('THESIS_ABSTRACT_CONFIRM','nl_NL','Thesis samenvatting inzending','Deze e-mail is automatisch gegenereerd door het thesis samenvattingen formulier van {$journalName}. \n\nGelieve te bevestigen dat de ingestuurde informatie correct is. De samenvatting zal gepubliceerd worden in de online editie van het tijdschrift nadat de bevestiging is ontvangen.\n\nU hoeft alleen te antwoorden aan {$thesisName} ({$thesisEmail}) met de inhoud van dit bericht en uw bevestiging en eventuele verduidelijkingen en aanbevelingen.\n\nDank u.\n\n\nTitel : {$title} \nAuteur : {$studentName}\nGraad : {$degree}\nGraad naam: {$degreeName}\nDepartement : {$department}\nUniversiteit : {$university}\nAcceptatiedatum : {$dateApproved}\nBegeleider : {$supervisorName}\n\nSamenvatting\n--------\n{$abstract}\n\n{$thesisContactSignature}',''),('THESIS_ABSTRACT_CONFIRM','ro_RO','Depunerea abstractului pentru o teză','Acest email a fost generat automat de formularul pentru depunerea abstractelor al {$journalName}.\n\nConfirmă faptul că informația trimisă este corectă. La momentul primirii confirmării, abstractul va fi publicat în ediția ofline a revistei.\n\nRăspunde la {$thesisName} ({$thesisEmail}) punând conținutul acestui mesaj și confirmarea ta, precum și orice alte clarificări și corecții recomandate din partea ta.\n\nÎți mulțumim.\n\n\nTitlu : {$title} \nAutor : {$studentName}\nTitlu (universitar) : {$degree}\nDenumirea titlului: {$degreeName}\nDepartament : {$department}\nUniversitate : {$university}\nData acceptării : {$dateApproved}\nÎndrumător : {$supervisorName}\n\nAbstract\n--------\n{$abstract}\n\n{$thesisContactSignature}','Acest șablon de email este utilizat pentru a confirma depunerea abstractului tezei de către un student. Acesta este trimis către îndrumătorul studentului, care este rugat să confirme detaliile pentru abstractul tezei care a fost trimis.'),('THESIS_ABSTRACT_CONFIRM','cs_CZ','Odeslání abstraktu závěrečné práce','Tento email byl automaticky vygenerován formulářem pro odesílání abstrakt závěrečných prací do {$journalName}.\n\nPotvrďte prosím, že jsou odeslané informace správné. Po obdržení Vašeho potvrzení bude abstrakt publikován v online verzi časopisu.\n\nJednoduše odpovězte na {$thesisName} ({$thesisEmail}) s obsahem této zprávy a Vaším potvrzením, doporučením upřesnění nebo úprav.\n\nDěkujeme.\n\n\nNázev: {$title} \nAutor : {$studentName}\nStupeň: {$degree}\nNázev stupně: {$degreeName}\nPracoviště: {$department}\nUniverzita : {$university}\nDatum schválení: {$dateApproved}\nŠkolitel: {$supervisorName}\n\nAbstrakt\n--------\n{$abstract}\n\n{$thesisContactSignature}',''),('THESIS_ABSTRACT_CONFIRM','eu_ES','Tesi-laburpenaren bidalketa','Mezu hau automatikoki sortu du {$journalName} aldizkariko tesi-laburpena bidaltzeko inprimakiak.\n\nMesedez, berretsi bidali diguten informazioa zuzena dela. Zure berrespena jasotzen dugunean, laburpena aldizkariaren lineako edizioan argitaratuko da.\n\nBesterik gabe, erantzun {$thesisName} mezuari ({$thesisEmail}) mezu honen edukiarekin eta zure berrespenarekin, nahi izanez gero, argibideak eta zuzenketak erantsiz.\n\nEskerrik asko.\n\n\nTitulua: {$title} \nEgilea: {$studentName}\nGradua: {$degree}\nGraduaren izena: {$degreeName}\nSaila: {$department}\nUnibertsitatea: {$university}\nOnartze-data: {$dateApproved}\nZuzendaria: {$supervisorName}\n\nLaburpena\n------------\n{$abstract}\n\n{$thesisContactSignature}','Mezu-txantiloi hau ikasleek bidalitako tesi-laburpenak berresteko erabiltzen da. Ikaslearen zuzendariari bidaltzen zaio, jaso den tesi-laburpenaren xehetasunak berrets ditzala eskatzeko.'),('THESIS_ABSTRACT_CONFIRM','ru_RU','Подача тезисов диссертации','Это письмо было автоматически сгенерировано формой подачи тезисов диссертации для публикации в журнале {$journalName}.\n\nПожалуйста подтвердите правильность введенной информации. После Вашего подтверждения, тезисы будут опубликованы в онлайн-редакции журнала.\n\nПросто ответьте {$thesisName} ({$thesisEmail}), включив содержание этого письма и Ваше подтверждение (а также необходимые уточнения и дополнения).\n\nСпасибо !\n\nНазвание : {$title} \nАвтор : {$studentName}\nСтепень : {$degree}\nСтепень полностью: {$degreeName}\nСовет : {$department}\nОрганизация : {$university}\nДата защиты : {$dateApproved}\nРуководитель : {$supervisorName}\n\nТезисы\n--------\n{$abstract}\n\n{$thesisContactSignature}',''),('THESIS_ABSTRACT_CONFIRM','zh_CN','论文摘要提交','这封电子邮件是由 {$journalName} 论文摘要提交表单自动生成的。\n\n请确认所提交的信息是正确的。一收到您的确认信息，这篇摘要将会被出版到期刊的在线版。\n\n只需回复{$thesisName} ({$thesisEmail}) ，这条消息的内容和你的确认信息， 以及需要澄清或者修改的任何建议。\n\n谢谢您。\n\n标题：{$title} \n作者：{$studentName}\n学位：{$degree}\n学位名：{$degreeName}\n院系：{$department}\n院校：{$dateApproved}\n验收日期：{$dateApproved}\n论文导师：{$supervisorName}\n\n摘要\n----------\n\n{$abstract}\n\n{$thesisContactSignature}','此电子邮件模板是用来确认学生提交的论文摘要。它发送到学生的论文导师，他被要求确认所提交的论文摘要的细节。'),('MANUAL_PAYMENT_NOTIFICATION','el_GR','Ειδοποίηση μη αυτόματης πληρωμής','Μια μη αυτόματη διαδικασία πληρωμής για το περιοδικό {$journalName} από τον χρήση {$userFullName} (username \"{$userName}\") πρέπει να προωθηθεί.\n\nΗ πληρωμή γίνεται για  \"{$itemName}\".\nΤο κόστος είναι {$itemCost} ({$itemCurrencyCode}).\n\nΤο μήνυμα αυτό δημιουργείται αυτόματα από το Plugin Μη αυτόματης πληρωμής του Open Journal Systems.',''),('MANUAL_PAYMENT_NOTIFICATION','es_ES','Notificación de Pago Manual','Un pago manual necesita ser procesado para la revista  {$journalName} y el usuario {$userFullName} (username \"{$userName}\").\n\nEl ítem pagado es \"{$itemName}\".\nEl precio es {$itemCost} ({$itemCurrencyCode}).\n\nEste correo ha sido generado por el plugin de Pago Manual de  Open Journal Systems.','Este correo se usa para notificar al Gestor de la Revista de que se ha realizado un pago manual.'),('MANUAL_PAYMENT_NOTIFICATION','fa_IR','اطلاع رسانی پرداخت دستی','یک پرداخت دستی قرار است برای مجله {$journalName} از طرف کاربر {$userFullName} (username \"{$userName}\") صورت گیرد.\n\nمورد خرید \"{$itemName}\".\nقیمت {$itemCost} ({$itemCurrencyCode}).\n\nاین ایمیل توسط پلاگین پرداخت دستی سیستم های مجله آزاد ایجاد شده است.',''),('MANUAL_PAYMENT_NOTIFICATION','fr_CA','Avis de paiement manuel','Un paiement manuel doit être traité pour la revue {$journalName} et l\'utilisateur {$userFullName} (nom d\'utilisateur \"{$userName}\").\n\nL\'élément facturé est \"{$itemName}\".\nLe coût est de {$itemCost} ({$itemCurrencyCode}).\n\nCe courriel a été généré par le plugiciel de paiement manuel du Open Journal Systems.','Ce modèle de courriel est utilisé pour aviser un directeur de revue que le paiement manuel a été demandé.'),('MANUAL_PAYMENT_NOTIFICATION','it_IT','Notifica di pagamento manuale','Bisogna eseguire un pagamento manuale per  {$journalName}, utente {$userFullName} (username \"{$userName}\").\n\nIl pagamento riguarda \"{$itemName}\".\nIl costo è {$itemCost} ({$itemCurrencyCode}).\n\nQuesta email è generata automaticamente da Open Journal Systems\' Manual Payment plugin.',''),('MANUAL_PAYMENT_NOTIFICATION','ja_JP','手作業による料金支払い通知','手作業による料金支払いでは 雑誌 {$journalName} とユーザ {$userFullName} (ユーザ名 \"{$userName}\") に対する処理が必要となります。\n\n \"{$itemName}\" についての支払いです。\n料金は {$itemCost} ({$itemCurrencyCode}) です。\n\nこのメールは Open Journal Systems の 手作業による料金支払いプラグイン によって生成されています。',''),('MANUAL_PAYMENT_NOTIFICATION','nl_NL','Bericht van handmatige betaling','Er moet een handmatige betaling verwerkt worden voor tijdschrift {$journalName} en gebruiker {$userFullName} (gebruikersnaam \"{$userName}\").\n\nEr wordt betaald voor \"{$itemName}\".\nDe prijs is {$itemCost} ({$itemCurrencyCode}).\n\nDeze e-mail is gegenereerd door de Handmatige betalingen plugin van Open Journal Systems.',''),('MANUAL_PAYMENT_NOTIFICATION','ro_RO','Înștiințare la plata în sistem tradițional','Trebuie procesată o plată făcută în sistem tradițional (nu electronică) pentru această revistă {$journalName} a utilizatorului {$userFullName} (username \"{$userName}\").\n\nSe face plata pentru \"{$itemName}\".\nCostă {$itemCost} ({$itemCurrencyCode}).\n\nAcest email a fost generat de modulul pentru plăți în sistem tradițional al Open Journal Systems.','Acest șablon de email este utilizat pentru a înștiința managerul unei reviste asupra faptului că a fost solicitată o plată în sistem tradițional.'),('MANUAL_PAYMENT_NOTIFICATION','cs_CZ','Oznámení o manuální platbě','Je třeba zpracovat manuální platbu pro časopis {$journalName} a uživatele {$userFullName} (uživatelské jméno \"{$userName}\").\n\nPoložka, za kterou je placeno \"{$itemName}\".\nCena je {$itemCost} ({$itemCurrencyCode}).\n\nTento email byl vygenerován OJS pluginem Manuální platby.',''),('MANUAL_PAYMENT_NOTIFICATION','eu_ES','Eskuzko ordainketaren jakinarazpena','{$userFullName} erabiltzaileak (\"{$userName}\" erab.-iz.) {$journalName} aldizkarirako egindako eskuzko ordainketa bat prozesatu beharrean dago.\n\nOrdaindu beharreko lana \"{$itemName}\" da.\nKostua : {$itemCost} ({$itemCurrencyCode}).\n\nMezu hau Open Journal Systems-en Eskuzko ordainketen pluginak sortu du.','Mezu-txantiloi hau aldizkariaren kudeatzaileari eskuzko ordainketa bat eskatu dela jakinarazteko erabiltzen da.'),('MANUAL_PAYMENT_NOTIFICATION','ru_RU','Уведомление о платеже','Необходимо обработать платеж на имя журнала  {$journalName} от {$userFullName} (пользователь \"{$userName}\").\n\nОплачивается \"{$itemName}\".\nЦена {$itemCost} ({$itemCurrencyCode}).\n\nЭто письмо отправлено модулем платежей OJS.',''),('MANUAL_PAYMENT_NOTIFICATION','zh_CN','人工支付通知','人工支付需要被{$journalName}期刊的{$userFullName}来处理（用户名“{$userName}”）。\n\n\n被支付的项目：“{$itemName}”；。\n费用：{$itemCost} ({$itemCurrencyCode})。\n\n此邮件是由开放期刊系统的人工支付插件生成的。','这封电子邮件用来通知期刊管理员去处理一个人工支付请求。'),('PAYPAL_INVESTIGATE_PAYMENT','el_GR','Ασυνήθιστη δραστηριότητα PayPal','To Open Journal Systems διαπίστωσε μια ασυνήθιστη δραστηριότητα σχετικά με διαδικασίες πληρωμής με τη μέθοδο PayPal για το περιοδικό {$journalName}. Αυτή η δραστηριότητα ίσως χρειάζεται να διερευνηθεί περαιτέρω.\n                       \nΤο μήνυμα αυτό δημιουργήθκε αυτόματα από το PayPal plugin του  Open Journal Systems.\n\nΠλήρη ταχυδρομικά στοιχεία :\n{$postInfo}\n\nΠρόσθετε πληροφορίες (αν παρέχονται):\n{$additionalInfo}\n\nServer vars:\n{$serverVars}',''),('PAYPAL_INVESTIGATE_PAYMENT','es_ES','Actividad inusual de PayPal','Open Journal Systems ha notado una actividad inusual relacionada con el soporte de pago de PayPal para la revista {$journalName}.  Esta actividad puede necesitar de mayor investigación o intervención manual.\n\nEste email ha sido generado por el plugin de PayPal de Open Journal Systems.\n\nInformación completa de envío para la solicitud:\n{$postInfo}\n\nInformación adicional (si proporcionada):\n{$additionalInfo}\n\nVariables de servidor:\n{$serverVars}','Esta plantilla de correo es usada para notificar al contacto principal de la revista de que el plugin de PayPal ha detectado actividad sospechosa o actividad que requiere de intervención manual.'),('PAYPAL_INVESTIGATE_PAYMENT','fa_IR','فعالیت غیر عدی PayPal','سیستم های مجله آزاد فعالیتی غیر عادی مربوط به قسمت پرداخت PayPal برای {$journalName} را کشف کرده است.\nاین فعالیت ممکن است بررسی بیشتر شما را ایجاب کند.\n                       \nاین ایمیل توسط پلاگین PayPal سیستم های مجله آزاد تولید شده است.\n\nاطلاعات کامل پست برای درخواست:\n{$postInfo}\n\nاطلاعات اضافی در صورت وجود:\n{$additionalInfo}\n\nمتغییرهای سرور\n{$serverVars}',''),('PAYPAL_INVESTIGATE_PAYMENT','fr_CA','Activité inhabituelle de PayPal','L\'Open Journal Systems a remarqué une activité inhabituelle concernant la prise en charge du paiement PayPal pour la revue {$journalName}. Cette activité pourrait nécessiter une attention particulière ou une intervention manuelle.\n                       \nCe courriel a été généré par le plugiciel PayPal du Open Journal Systems.\n\nInformation complète de la demande :\n{$postInfo}\n\nInformation supplémentaire (si fournie) :\n{$additionalInfo}\n\nVariables serveur :\n{$serverVars}\n','Ce modèle de courriel est utilisé pour aviser un contact principal d\'une revue qu\'une activité inhabituelle ou requérant une intervention manuelle a été remarquée par le plugiciel PayPal.'),('PAYPAL_INVESTIGATE_PAYMENT','it_IT','Attivit&#224; PayPal sospetta','Open Journal Systems ha riscontrato un\'attivtà sospetta sul conto PayPal della rivista {$journalName}. Ciò può richiedere ulteriori indagini o un intervento manuale.\n\nQuesta email è stata generata da Open Journal Systems\' PayPal plugin\n\nTutte le informazioni sulla richiesta:\n{$postInfo}\n\nInformazioni aggiuntive (se disponibili):\n{$additionalInfo}\n\nServer vars:\n{$serverVars}',''),('PAYPAL_INVESTIGATE_PAYMENT','ja_JP','異常なPayPal','Open Journal Systems は {$journalName} がサポートしている PayPal 支払いに関して異常な処理が発生しました。この処理についてさらなる調査と手作業による介入が必要かもしれません。\n\nこのメールは Open Journal Systems の PayPal プラグインから自動生成されました。\n\n要求のあった全ポスト情報:\n{$postInfo}\n\n追加情報 (ある場合):\n{$additionalInfo}\n\nServer vars:\n{$serverVars}',''),('PAYPAL_INVESTIGATE_PAYMENT','nl_NL','Ongebruikelijke PayPal activiteit','Open Journal Systems heeft ongebruikelijke activiteit geconstateerd met betrekking tot de PayPal betalingsondersteuning van het tijdschrift {$journalName}. Deze activiteit vraagt om verder onderzoek of handmatige interventie.\n                       \nDeze e-mail is gegenereerd door de PayPal plugin van Open Journal Systems.\n\nVolledige berichtinformatie voor het verzoek:\n{$postInfo}\n\nAdditionele informatie (indien opgegeven):\n{$additionalInfo}\n\nServer variabelen:\n{$serverVars}',''),('PAYPAL_INVESTIGATE_PAYMENT','ro_RO','Activitate PayPal anormală','Open Journal Systems a sesizat o activitate anormală privind suportul pentru plăți prin PayPal pentru revista {$journalName}. Această activitate necesită investigații sau intervenția manuală.\n                       \nAcest email a fost generat de modulul pentru plăți prin PayPal al Open Journal Systems.\n\nInformații postfactum pentru solicitarea:\n{$postInfo}\n\nInformații suplimentare (dacă sunt oferite):\n{$additionalInfo}\n\nVariabile de server:\n{$serverVars}\n','Acest șablon de email este utilizat pentru a înștiința contactul primar al unei reviste asupra sesizării de către modulul pentru plăți prin PayPal a unor activități anormale sau asupra unei activități care necesită intervenția manuală.'),('PAYPAL_INVESTIGATE_PAYMENT','cs_CZ','Neobvyklá PayPal aktivita','OJS zaznamenal neobvyklou aktivitu v souvislosti s podporou plateb přes PayPal pro časopis {$journalName}. Tato aktivita může vyžadovat další kontrolu nebo ruční zásah.\n                       \nTento email byl vygenerován OJS pluginem pro PayPal.\n\nKompletní informace k požadavku:\n{$postInfo}\n\nDoplňkové informace (pokud byly uvedeny):\n{$additionalInfo}\n\nProměnné serveru:\n{$serverVars}',''),('PAYPAL_INVESTIGATE_PAYMENT','eu_ES','Ezohiko PayPal jarduera','Open Journal Systems-ek ezohiko jarduera sumatu du {$journalName} aldizkariaren PayPal ordainketa-zerbitzuan. Jarduera hori gehiago ikertu beharko da edo eskuz parte hartu beharko da.\n                       \nMezu hau Open Journal Systems-en PayPal pluginak sortu du.\n\nEskaeraren informazio osoa:\n{$postInfo}\n\nInformazio osagarria (eman badute):\n{$additionalInfo}\n\nZerbitzari-aldagaiak:\n{$serverVars}','Mezu-txantiloi hau erabiltzen da aldizkariko kontaktu nagusiari jakinarazteko PayPal pluginak jarduera susmagarria edo eskuz parte hartzea eskatzen duena topatu duela.'),('PAYPAL_INVESTIGATE_PAYMENT','ru_RU','Необычная активность PayPal','Система OJS обнаружила необычную активность, свящанную с поддержкой платежей в системе PayPal для журнала {$journalName}.  Может потребоваться внимание и вмешательство в ручном режиме.\n\nПисьмо было сгенерировано модулем платежей PayPal.\n\nПолная информация о запросе:\n{$postInfo}\n\nДополнительная информация (если указана):\n{$additionalInfo}\n\nПеременные сервера:\n{$serverVars}',''),('PAYPAL_INVESTIGATE_PAYMENT','zh_CN','不正常的PayPal活动','开放期刊系统遇到不正常的活动，是关于{$journalName}期刊的PayPal支付支持。此活动肯需要进一步调查或者人工干预。\n\n此电子邮件是由开放期刊系统的PayPal插件生成的。\n\n全部信息：\n{$postInfo}\n\n附加信息（如果提供）：\n{$additionalInfo}\n\n服务器增值经销商\n{$serverVars}','这封电子邮件模板用于通知期刊主要联系人，PayPal插件碰到可疑活动或者活动需要人工支持。'),('SWORD_DEPOSIT_NOTIFICATION','uk_UA','Повідомлення про депонування','Поздоровляємо з прийняттям Вашого подання \"{$articleTitle}\" до публікації у журналі {$journalName}. За бажанням, Ви можете автоматично депонувати Ваше подання у одне або кілька сховищ відкритого доступу.\n\nЩоб зробити це, натисніть {$swordDepositUrl}.\n\nЦей лист був генерований модулем депонування SWORD системи Open Journal Systems.','Цей шаблон листа використовується для повідомлення автору про можливість депонування роботи у SWORD-сумісні сховища.'),('BFR_REVIEW_REMINDER','uk_UA','Книги до рецензії: Нагадування про дату кінцевого терміну','Шановний {$authorName}:\n\nЦей лист - нагадування про те, що {$bookForReviewDueDate} закінчується встановлений термін рецензування Вами книги {$bookForReviewTitle}.\n\nДля того, щоб надіслати Вашу рецензію на книгу, будь ласка, увійдіть на веб-сайт журналу та виконайте традиційний процес подання статті для опублікування. Для більшої зручності нижче подано адресу URL для подання статей до журналу.\n\nURL-адреса для подання статей: {$submissionUrl}\n\nБудь ласка, повідомте мені, якщо Ви маєте питання або проблеми стосовно рецензування книги.\n\nДякую за Вашу роботу для журналу та з нетерпінням чекаю Вашого рукопису.\n\n{$editorialContactSignature}','Цей лист генерується автоматично і надсилається автору рецензії на книгу як нагадування про те, що наближається встановлений для нього кінцевий термін рецензування.'),('BFR_REVIEW_REMINDER_LATE','uk_UA','Книги до рецензії: Настання кінцевого терміну','Шановний {$authorName}:\n\nМЦей лист - нагадування про те, що {$bookForReviewDueDate} закінчився встановлений термін рецензування Вами книги {$bookForReviewTitle}, але рецензія досі не була отримана нами.\n\nДля того, щоб надіслати Вашу рецензію на книгу, будь ласка, увійдіть на веб-сайт журналу та виконайте традиційний процес подання статті для опублікування. Для більшої зручності нижче подано адресу URL для подання статей до журналу.\n\nURL-адреса для подання статей: {$submissionUrl}\n\nБудь ласка, повідомте мені, якщо Ви маєте питання або проблеми стосовно рецензування книги.\n\nДякую за Вашу роботу для журналу та з нетерпінням чекаю Вашого рукопису.\n\n{$editorialContactSignature}','Цей лист генерується автоматично і надсилається автору рецензії на книгу як нагадування про те, що дата встановленого для нього кінцевого терміну рецензування вже минула.'),('BFR_BOOK_ASSIGNED','uk_UA','Книги до рецензії: Рецензія на книгу доручена','Шановний {$authorName}:\n\nЦим листом повідомляємо, що Вам було доручено до {$bookForReviewDueDate} написати рецензію на книгу {$bookForReviewTitle}.\n\nБудь ласка, переконайтеся, що у Вашому профілі на сайті журналу коректно вказана поштова адреса. На цю адресу Вам буде надісланий примірник книги для виконання рецензії на неї.\n\nЗараз ми маємо наступну Вашу адресу:\n{$authorMailingAddress}\n\nЯкщо ця адреса неповна або невірна, будь ласка, скористайтеся посиланням нижче, щоб оновити у Вашому профілі необхідну інформацію:\n\nURL-адреса профілю користувача: {$userProfileUrl}\n \nДля того, щоб надіслати Вашу рецензію на книгу, будь ласка, увійдіть на веб-сайт журналу та виконайте традиційний процес подання статті для опублікування.\n\nURL-адреса для подання статей: {$submissionUrl}\n\nБудь ласка, повідомте мені, якщо Ви маєте питання або проблеми стосовно рецензування книги.\n\n{$editorialContactSignature}','Цей лист редактор надсилає автору, коли доручає йому рецензування книги.'),('BFR_BOOK_DENIED','uk_UA','Книги до рецензії','Шановний {$authorName}:\n\nНажаль, тепер я вже не можу доручити Вам рецензування книги {$bookForReviewTitle}.\n\nХочу сподіватись, що зараз або у майбутньому Ви розглянете можливість рецензування іншої книги з нашого списку.\n\n{$editorialContactSignature}','Цей лист редактор надсилає автору, заінтересованому у рецензуванні книги, коли книга вже не доступна для рецензування.'),('BFR_BOOK_REQUESTED','uk_UA','Книги до рецензії: Запит на книгу','Шановний {$editorName}:\n\nЯ хотів би написати рецензію на книгу {$bookForReviewTitle}.\n\nБудь ласка, повідомте, чи доступна ця книга зараз для рецензування.\n\n{$authorContactSignature}','Цей лист надсилає редактору автор, заінтересований у написанні рецензії на одну з книг, представлених у списку.'),('BFR_BOOK_MAILED','uk_UA','Книги до рецензії: Книга відправлена','Шановний {$authorName}:\n\nЦим листом хочу повідомити, що я надіслав примірник книги {$bookForReviewTitle} на вказану нижче адресу з Вашого профілю на сайті журналу:\n{$authorMailingAddress}\n \nДля того, щоб надіслати Вашу рецензію на книгу, будь ласка, увійдіть на веб-сайт журналу та виконайте традиційний процес подання статті для опублікування.\n\nURL-адреса для подання статей: {$submissionUrl}\n\nБудь ласка, повідомте мені, якщо Ви маєте питання або проблеми стосовно рецензування книги.\n\n{$editorialContactSignature}','Цей лист редактор відправляє автору, якому доручене рецензування книги, після відправлення йому примірнику книги.'),('BFR_REVIEWER_REMOVED','uk_UA','Книги до рецензії','Шановний {$authorName}:\n\nЦим листом повідомляю, що Ваше доручення на рецензування книги {$bookForReviewTitle} було скасоване. Тепер ця книга доступна для рецензування іншим заінтересованим авторам.\n\nСподіваюсь, що зараз або у майбутньому Ви розглянете можливість рецензування іншої книги з нашого списку.\n\n{$editorialContactSignature}','Цей лист редактор надсилає автору, заінтересованому у рецензуванні книги, коли книга вже не доступна для рецензування.'),('MANUAL_PAYMENT_NOTIFICATION','uk_UA','Інформування про платіж','На рахунок журналу {$journalName} користувачем {$userFullName} (username \"{$userName}\") повинен бути перерахований платіж.\n\nЦе плата за \"{$itemName}\".\nСума платежу {$itemCost} ({$itemCurrencyCode}).\n\nЦей лист був створений модулем ручних платежів системи Open Journal Systems.','Цей шаблон листа використовується для інформування менеджера журнала про запит на здійснення ручного платежу.');
/*!40000 ALTER TABLE `email_templates_default_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_log`
--

DROP TABLE IF EXISTS `event_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_logged` datetime NOT NULL,
  `ip_address` varchar(39) NOT NULL,
  `event_type` bigint(20) DEFAULT NULL,
  `message` text,
  `is_translated` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `event_log_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log`
--

LOCK TABLES `event_log` WRITE;
/*!40000 ALTER TABLE `event_log` DISABLE KEYS */;
INSERT INTO `event_log` VALUES (1,257,1,1,'2011-10-06 11:31:13','::1',268435457,'log.author.submitted',0),(2,257,2,1,'2011-10-20 15:46:54','187.15.48.79',268435457,'log.author.submitted',0),(3,257,1,1,'2011-10-20 16:50:03','160.45.170.42',268435458,'log.editor.metadataModified',0),(4,257,1,1,'2011-10-28 23:14:15','160.45.170.42',268435458,'log.editor.metadataModified',0),(5,257,1,1,'2011-10-29 07:49:54','160.45.170.42',268435458,'log.editor.metadataModified',0),(6,257,1,1,'2011-10-31 22:18:03','160.45.170.42',268435458,'log.editor.metadataModified',0),(7,257,1,1,'2011-10-31 22:26:41','160.45.170.42',268435458,'log.editor.metadataModified',0),(8,257,1,1,'2011-11-01 00:58:17','160.45.170.42',268435458,'log.editor.metadataModified',0),(9,257,1,1,'2011-11-01 13:35:36','160.45.170.42',268435458,'log.editor.metadataModified',0),(10,257,1,1,'2011-11-03 01:22:01','160.45.170.42',268435458,'log.editor.metadataModified',0),(11,257,1,1,'2011-11-03 02:37:04','160.45.170.42',268435458,'log.editor.metadataModified',0),(12,257,1,1,'2011-11-14 20:08:26','187.15.106.207',268435458,'log.editor.metadataModified',0),(13,257,1,1,'2011-11-14 20:09:48','187.15.106.207',268435458,'log.editor.metadataModified',0),(14,257,1,1,'2011-11-14 20:11:11','187.15.106.207',268435458,'log.editor.metadataModified',0),(15,257,1,1,'2011-11-14 20:21:30','160.45.170.42',268435458,'log.editor.metadataModified',0),(16,257,1,1,'2011-11-14 20:34:06','160.45.170.42',268435458,'log.editor.metadataModified',0),(17,257,1,1,'2011-12-02 03:31:21','160.45.170.42',268435458,'log.editor.metadataModified',0),(18,257,1,1,'2011-12-02 03:48:13','160.45.170.42',268435458,'log.editor.metadataModified',0),(19,257,1,1,'2011-12-02 03:57:24','160.45.170.42',268435458,'log.editor.metadataModified',0),(20,257,1,1,'2011-12-30 03:35:38','160.45.170.42',268435458,'log.editor.metadataModified',0),(21,257,1,1,'2011-12-30 03:35:40','160.45.170.42',268435458,'log.editor.metadataModified',0),(22,257,1,1,'2011-12-30 03:35:44','160.45.170.42',268435458,'log.editor.metadataModified',0),(23,257,1,1,'2011-12-30 04:05:27','160.45.170.42',268435458,'log.editor.metadataModified',0),(24,257,1,1,'2011-12-30 04:05:29','160.45.170.42',268435458,'log.editor.metadataModified',0),(25,257,1,1,'2011-12-30 04:05:33','160.45.170.42',268435458,'log.editor.metadataModified',0),(26,257,1,1,'2012-01-23 20:26:09','160.45.170.42',268435458,'log.editor.metadataModified',0),(27,257,1,1,'2012-01-23 20:29:22','160.45.170.42',268435458,'log.editor.metadataModified',0),(28,257,1,1,'2012-01-23 20:29:24','160.45.170.42',268435458,'log.editor.metadataModified',0),(29,257,1,1,'2012-01-23 20:29:28','160.45.170.42',268435458,'log.editor.metadataModified',0);
/*!40000 ALTER TABLE `event_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_log_settings`
--

DROP TABLE IF EXISTS `event_log_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_log_settings` (
  `log_id` bigint(20) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `event_log_settings_pkey` (`log_id`,`setting_name`),
  KEY `event_log_settings_log_id` (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log_settings`
--

LOCK TABLES `event_log_settings` WRITE;
/*!40000 ALTER TABLE `event_log_settings` DISABLE KEYS */;
INSERT INTO `event_log_settings` VALUES (1,'authorName','admin ','string'),(1,'old_log_id','257','int'),(2,'authorName','admin ','string'),(3,'editorName','admin ','string'),(4,'editorName','admin ','string'),(5,'editorName','admin ','string'),(6,'editorName','admin ','string'),(7,'editorName','admin ','string'),(8,'editorName','admin ','string'),(9,'editorName','admin ','string'),(10,'editorName','admin ','string'),(11,'editorName','admin ','string'),(12,'editorName','admin ','string'),(13,'editorName','admin ','string'),(14,'editorName','admin ','string'),(15,'editorName','admin ','string'),(16,'editorName','admin ','string'),(17,'editorName','admin ','string'),(18,'editorName','admin ','string'),(19,'editorName','admin ','string'),(20,'editorName','admin ','string'),(21,'editorName','admin ','string'),(22,'editorName','admin ','string'),(23,'editorName','admin ','string'),(24,'editorName','admin ','string'),(25,'editorName','admin ','string'),(26,'editorName','admin ','string'),(27,'editorName','admin ','string'),(28,'editorName','admin ','string'),(29,'editorName','admin ','string');
/*!40000 ALTER TABLE `event_log_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_feed_settings`
--

DROP TABLE IF EXISTS `external_feed_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_feed_settings` (
  `feed_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `external_feed_settings_pkey` (`feed_id`,`locale`,`setting_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_feed_settings`
--

LOCK TABLES `external_feed_settings` WRITE;
/*!40000 ALTER TABLE `external_feed_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `external_feed_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_feeds`
--

DROP TABLE IF EXISTS `external_feeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_feeds` (
  `feed_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `url` varchar(255) NOT NULL,
  `seq` double NOT NULL,
  `display_homepage` tinyint(4) NOT NULL,
  `display_block` smallint(6) NOT NULL,
  `limit_items` tinyint(4) DEFAULT NULL,
  `recent_items` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`feed_id`),
  KEY `external_feeds_journal_id` (`journal_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_feeds`
--

LOCK TABLES `external_feeds` WRITE;
/*!40000 ALTER TABLE `external_feeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `external_feeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_groups`
--

DROP TABLE IF EXISTS `filter_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filter_groups` (
  `filter_group_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `symbolic` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `input_type` varchar(255) DEFAULT NULL,
  `output_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`filter_group_id`),
  UNIQUE KEY `filter_groups_symbolic` (`symbolic`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_groups`
--

LOCK TABLES `filter_groups` WRITE;
/*!40000 ALTER TABLE `filter_groups` DISABLE KEYS */;
INSERT INTO `filter_groups` VALUES (1,'article=>dc11','plugins.metadata.dc11.articleAdapter.displayName','plugins.metadata.dc11.articleAdapter.description','class::classes.article.Article','metadata::plugins.metadata.dc11.schema.Dc11Schema(ARTICLE)'),(2,'mods34=>mods34-xml','plugins.metadata.mods34.mods34XmlOutput.displayName','plugins.metadata.mods34.mods34XmlOutput.description','metadata::plugins.metadata.mods34.schema.Mods34Schema(*)','xml::schema(lib/pkp/plugins/metadata/mods34/filter/mods34.xsd)'),(3,'article=>mods34','plugins.metadata.mods34.articleAdapter.displayName','plugins.metadata.mods34.articleAdapter.description','class::classes.article.Article','metadata::plugins.metadata.mods34.schema.Mods34Schema(ARTICLE)'),(4,'mods34=>article','plugins.metadata.mods34.articleAdapter.displayName','plugins.metadata.mods34.articleAdapter.description','metadata::plugins.metadata.mods34.schema.Mods34Schema(ARTICLE)','class::classes.article.Article'),(5,'citation=>nlm30','plugins.metadata.nlm30.citationAdapter.displayName','plugins.metadata.nlm30.citationAdapter.description','class::lib.pkp.classes.citation.Citation','metadata::lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema(CITATION)'),(6,'nlm30=>citation','plugins.metadata.nlm30.citationAdapter.displayName','plugins.metadata.nlm30.citationAdapter.description','metadata::lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema(CITATION)','class::lib.pkp.classes.citation.Citation'),(7,'plaintext=>nlm30-element-citation','plugins.metadata.nlm30.citationParsers.displayName','plugins.metadata.nlm30.citationParsers.description','primitive::string','metadata::lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema(CITATION)'),(8,'nlm30-element-citation=>nlm30-element-citation','plugins.metadata.nlm30.citationLookup.displayName','plugins.metadata.nlm30.citationLookup.description','metadata::lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema(CITATION)','metadata::lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema(CITATION)'),(9,'nlm30-element-citation=>plaintext','plugins.metadata.nlm30.citationOutput.displayName','plugins.metadata.nlm30.citationOutput.description','metadata::lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema(CITATION)','primitive::string'),(10,'nlm30-element-citation=>nlm30-xml','plugins.metadata.nlm30Xml.citationOutput.displayName','plugins.metadata.nlm30Xml.citationOutput.description','metadata::lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema(CITATION)','xml::*'),(11,'submission=>nlm30-article-xml','plugins.metadata.nlm30.nlm30XmlOutput.displayName','plugins.metadata.nlm30.nlm30XmlOutput.description','class::lib.pkp.classes.submission.Submission','xml::*'),(12,'submission=>nlm23-article-xml','plugins.metadata.nlm30.nlm23XmlOutput.displayName','plugins.metadata.nlm30.nlm23XmlOutput.description','class::lib.pkp.classes.submission.Submission','xml::*'),(13,'nlm30-article-xml=>nlm23-article-xml','plugins.metadata.nlm30.nlm30ToNlm23Xml.displayName','plugins.metadata.nlm30.nlm30ToNlm23Xml.description','xml::*','xml::*'),(14,'submission=>reference-list','plugins.metadata.nlm30.refList.displayName','plugins.metadata.nlm30.refList.description','class::lib.pkp.classes.submission.Submission','class::lib.pkp.classes.citation.PlainTextReferencesList'),(15,'nlm30-element-citation=>isbn','plugins.citationLookup.isbndbExtraction.displayName','plugins.citationLookup.isbndbExtraction.description','metadata::lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema(CITATION)','primitive::string'),(16,'isbn=>nlm30-element-citation','plugins.citationLookup.isbndbLookup.displayName','plugins.citationLookup.isbndbLookup.description','primitive::string','metadata::lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema(CITATION)');
/*!40000 ALTER TABLE `filter_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_settings`
--

DROP TABLE IF EXISTS `filter_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filter_settings` (
  `filter_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `filter_settings_pkey` (`filter_id`,`locale`,`setting_name`),
  KEY `filter_settings_id` (`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_settings`
--

LOCK TABLES `filter_settings` WRITE;
/*!40000 ALTER TABLE `filter_settings` DISABLE KEYS */;
INSERT INTO `filter_settings` VALUES (8,'','citationOutputFilterName','lib.pkp.plugins.metadata.nlm30.filter.Nlm30CitationSchemaNlm30XmlFilter','string'),(8,'','metadataSchemaName','lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema','string'),(9,'','settingsMapping','a:2:{s:6:\"apiKey\";a:2:{i:0;s:11:\"seq1_apiKey\";i:1;s:11:\"seq2_apiKey\";}s:10:\"isOptional\";a:2:{i:0;s:15:\"seq1_isOptional\";i:1;s:15:\"seq2_isOptional\";}}','object'),(10,'','citationOutputFilterName','lib.pkp.plugins.metadata.nlm30.filter.Nlm30CitationSchemaNlm30XmlFilter','string'),(10,'','metadataSchemaName','lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema','string'),(11,'','xsl','lib/pkp/plugins/metadata/nlm30/filter/nlm30-to-23-ref-list.xsl','string'),(11,'','xslType','2','int'),(12,'','phpVersionMin','5.0.0','string'),(13,'','phpVersionMin','5.0.0','string'),(14,'','phpVersionMin','5.0.0','string'),(15,'','settingsMapping','a:2:{s:6:\"apiKey\";a:2:{i:0;s:11:\"seq1_apiKey\";i:1;s:11:\"seq2_apiKey\";}s:10:\"isOptional\";a:2:{i:0;s:15:\"seq1_isOptional\";i:1;s:15:\"seq2_isOptional\";}}','object'),(16,'','phpVersionMin','5.0.0','string'),(17,'','phpVersionMin','5.0.0','string'),(19,'','ordering','1','int'),(19,'','citationOutputFilterName','lib.pkp.plugins.citationOutput.vancouver.filter.Nlm30CitationSchemaVancouverFilter','string'),(19,'','metadataSchemaName','lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema','string'),(21,'','ordering','2','int'),(21,'','citationOutputFilterName','lib.pkp.plugins.citationOutput.abnt.filter.Nlm30CitationSchemaAbntFilter','string'),(21,'','metadataSchemaName','lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema','string'),(23,'','ordering','2','int'),(23,'','citationOutputFilterName','lib.pkp.plugins.citationOutput.apa.filter.Nlm30CitationSchemaApaFilter','string'),(23,'','metadataSchemaName','lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema','string'),(25,'','ordering','2','int'),(25,'','citationOutputFilterName','lib.pkp.plugins.citationOutput.mla.filter.Nlm30CitationSchemaMlaFilter','string'),(25,'','metadataSchemaName','lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema','string'),(26,'','phpVersionMin','5.0.0','string'),(27,'','phpVersionMin','5.0.0','string'),(28,'','phpVersionMin','5.0.0','string'),(29,'','phpVersionMin','5.0.0','string');
/*!40000 ALTER TABLE `filter_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filters`
--

DROP TABLE IF EXISTS `filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filters` (
  `filter_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `filter_group_id` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `is_template` tinyint(4) NOT NULL,
  `parent_filter_id` bigint(20) NOT NULL,
  `seq` bigint(20) NOT NULL,
  PRIMARY KEY (`filter_id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filters`
--

LOCK TABLES `filters` WRITE;
/*!40000 ALTER TABLE `filters` DISABLE KEYS */;
INSERT INTO `filters` VALUES (1,1,0,'Extract metadata from a(n) Article','plugins.metadata.dc11.filter.Dc11SchemaArticleAdapter',0,0,0),(2,2,0,'MODS 3.4','lib.pkp.plugins.metadata.mods34.filter.Mods34DescriptionXmlFilter',0,0,0),(3,3,0,'Extract metadata from a(n) Article','plugins.metadata.mods34.filter.Mods34SchemaArticleAdapter',0,0,0),(4,4,0,'Inject metadata into a(n) Article','plugins.metadata.mods34.filter.Mods34SchemaArticleAdapter',0,0,0),(5,5,0,'Extract metadata from a(n) Citation','lib.pkp.plugins.metadata.nlm30.filter.Nlm30CitationSchemaCitationAdapter',0,0,0),(6,6,0,'Inject metadata into a(n) Citation','lib.pkp.plugins.metadata.nlm30.filter.Nlm30CitationSchemaCitationAdapter',0,0,0),(7,10,0,'NLM 3.0 XML Citation Output','lib.pkp.plugins.metadata.nlm30.filter.Nlm30CitationSchemaNlm30XmlFilter',0,0,0),(8,11,0,'NLM Journal Publishing V3.0 ref-list','lib.pkp.plugins.metadata.nlm30.filter.PKPSubmissionNlm30XmlFilter',0,0,0),(9,12,0,'NLM Journal Publishing V2.3 ref-list','lib.pkp.classes.filter.GenericSequencerFilter',0,0,0),(10,11,0,'NLM 2.3: NLM 3.0','lib.pkp.plugins.metadata.nlm30.filter.PKPSubmissionNlm30XmlFilter',0,9,1),(11,13,0,'NLM 2.3: NLM 3.0 to 2.3','lib.pkp.classes.xslt.XSLTransformationFilter',0,9,2),(12,8,0,'PubMed','lib.pkp.plugins.citationLookup.pubmed.filter.PubmedNlm30CitationSchemaFilter',1,0,0),(13,8,0,'WorldCat','lib.pkp.plugins.citationLookup.worldcat.filter.WorldcatNlm30CitationSchemaFilter',1,0,0),(14,8,0,'CrossRef','lib.pkp.plugins.citationLookup.crossref.filter.CrossrefNlm30CitationSchemaFilter',1,0,0),(15,8,0,'ISBNdb','lib.pkp.classes.filter.GenericSequencerFilter',1,0,0),(16,15,0,'ISBNdb (from NLM)','lib.pkp.plugins.citationLookup.isbndb.filter.IsbndbNlm30CitationSchemaIsbnFilter',0,15,1),(17,16,0,'ISBNdb','lib.pkp.plugins.citationLookup.isbndb.filter.IsbndbIsbnNlm30CitationSchemaFilter',0,15,2),(18,9,0,'Vancouver Citation Output','lib.pkp.plugins.citationOutput.vancouver.filter.Nlm30CitationSchemaVancouverFilter',0,0,0),(19,14,0,'Vancouver Reference List','lib.pkp.classes.citation.PlainTextReferencesListFilter',0,0,0),(20,9,0,'ABNT Citation Output','lib.pkp.plugins.citationOutput.abnt.filter.Nlm30CitationSchemaAbntFilter',0,0,0),(21,14,0,'ABNT Reference List','lib.pkp.classes.citation.PlainTextReferencesListFilter',0,0,0),(22,9,0,'APA Citation Output','lib.pkp.plugins.citationOutput.apa.filter.Nlm30CitationSchemaApaFilter',0,0,0),(23,14,0,'APA Reference List','lib.pkp.classes.citation.PlainTextReferencesListFilter',0,0,0),(24,9,0,'MLA Citation Output','lib.pkp.plugins.citationOutput.mla.filter.Nlm30CitationSchemaMlaFilter',0,0,0),(25,14,0,'MLA Reference List','lib.pkp.classes.citation.PlainTextReferencesListFilter',0,0,0),(26,7,0,'ParaCite','lib.pkp.plugins.citationParser.paracite.filter.ParaciteRawCitationNlm30CitationSchemaFilter',1,0,0),(27,7,0,'RegEx','lib.pkp.plugins.citationParser.regex.filter.RegexRawCitationNlm30CitationSchemaFilter',1,0,0),(28,7,0,'ParsCit','lib.pkp.plugins.citationParser.parscit.filter.ParscitRawCitationNlm30CitationSchemaFilter',1,0,0),(29,7,0,'FreeCite','lib.pkp.plugins.citationParser.freecite.filter.FreeciteRawCitationNlm30CitationSchemaFilter',1,0,0);
/*!40000 ALTER TABLE `filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gifts`
--

DROP TABLE IF EXISTS `gifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gifts` (
  `gift_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` smallint(6) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `gift_type` smallint(6) NOT NULL,
  `gift_assoc_id` bigint(20) NOT NULL,
  `buyer_first_name` varchar(40) NOT NULL,
  `buyer_middle_name` varchar(40) DEFAULT NULL,
  `buyer_last_name` varchar(90) NOT NULL,
  `buyer_email` varchar(90) NOT NULL,
  `buyer_user_id` bigint(20) DEFAULT NULL,
  `recipient_first_name` varchar(40) NOT NULL,
  `recipient_middle_name` varchar(40) DEFAULT NULL,
  `recipient_last_name` varchar(90) NOT NULL,
  `recipient_email` varchar(90) NOT NULL,
  `recipient_user_id` bigint(20) DEFAULT NULL,
  `date_redeemed` datetime DEFAULT NULL,
  `locale` varchar(5) NOT NULL,
  `gift_note_title` varchar(90) DEFAULT NULL,
  `gift_note` text,
  `notes` text,
  PRIMARY KEY (`gift_id`),
  KEY `gifts_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gifts`
--

LOCK TABLES `gifts` WRITE;
/*!40000 ALTER TABLE `gifts` DISABLE KEYS */;
/*!40000 ALTER TABLE `gifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_memberships`
--

DROP TABLE IF EXISTS `group_memberships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_memberships` (
  `user_id` bigint(20) NOT NULL,
  `group_id` bigint(20) NOT NULL,
  `about_displayed` tinyint(4) NOT NULL,
  `seq` double NOT NULL,
  UNIQUE KEY `group_memberships_pkey` (`user_id`,`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_memberships`
--

LOCK TABLES `group_memberships` WRITE;
/*!40000 ALTER TABLE `group_memberships` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_memberships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_settings`
--

DROP TABLE IF EXISTS `group_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_settings` (
  `group_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `group_settings_pkey` (`group_id`,`locale`,`setting_name`),
  KEY `group_settings_group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_settings`
--

LOCK TABLES `group_settings` WRITE;
/*!40000 ALTER TABLE `group_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `group_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` smallint(6) DEFAULT NULL,
  `publish_email` smallint(6) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `context` bigint(20) DEFAULT NULL,
  `about_displayed` tinyint(4) NOT NULL,
  `seq` double NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `groups_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institutional_subscription_ip`
--

DROP TABLE IF EXISTS `institutional_subscription_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `institutional_subscription_ip` (
  `institutional_subscription_ip_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint(20) NOT NULL,
  `ip_string` varchar(40) NOT NULL,
  `ip_start` bigint(20) NOT NULL,
  `ip_end` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`institutional_subscription_ip_id`),
  KEY `institutional_subscription_ip_subscription_id` (`subscription_id`),
  KEY `institutional_subscription_ip_start` (`ip_start`),
  KEY `institutional_subscription_ip_end` (`ip_end`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institutional_subscription_ip`
--

LOCK TABLES `institutional_subscription_ip` WRITE;
/*!40000 ALTER TABLE `institutional_subscription_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `institutional_subscription_ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institutional_subscriptions`
--

DROP TABLE IF EXISTS `institutional_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `institutional_subscriptions` (
  `institutional_subscription_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint(20) NOT NULL,
  `institution_name` varchar(255) NOT NULL,
  `mailing_address` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`institutional_subscription_id`),
  KEY `institutional_subscriptions_subscription_id` (`subscription_id`),
  KEY `institutional_subscriptions_domain` (`domain`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institutional_subscriptions`
--

LOCK TABLES `institutional_subscriptions` WRITE;
/*!40000 ALTER TABLE `institutional_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `institutional_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_files`
--

DROP TABLE IF EXISTS `issue_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_files` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `issue_id` bigint(20) NOT NULL,
  `file_name` varchar(90) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `content_type` bigint(20) NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`file_id`),
  KEY `issue_files_issue_id` (`issue_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_files`
--

LOCK TABLES `issue_files` WRITE;
/*!40000 ALTER TABLE `issue_files` DISABLE KEYS */;
INSERT INTO `issue_files` VALUES (1,1,'1-1-PB.pdf','application/pdf',15951,1,'DOI Test Galley.pdf','2011-12-30 03:31:26','2011-12-30 03:31:26');
/*!40000 ALTER TABLE `issue_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_galley_settings`
--

DROP TABLE IF EXISTS `issue_galley_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_galley_settings` (
  `galley_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `issue_galley_settings_pkey` (`galley_id`,`locale`,`setting_name`),
  KEY `issue_galley_settings_galley_id` (`galley_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_galley_settings`
--

LOCK TABLES `issue_galley_settings` WRITE;
/*!40000 ALTER TABLE `issue_galley_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_galley_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_galleys`
--

DROP TABLE IF EXISTS `issue_galleys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_galleys` (
  `galley_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `locale` varchar(5) DEFAULT NULL,
  `issue_id` bigint(20) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `label` varchar(32) DEFAULT NULL,
  `seq` double NOT NULL,
  `views` int(11) NOT NULL,
  PRIMARY KEY (`galley_id`),
  KEY `issue_galleys_issue_id` (`issue_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_galleys`
--

LOCK TABLES `issue_galleys` WRITE;
/*!40000 ALTER TABLE `issue_galleys` DISABLE KEYS */;
INSERT INTO `issue_galleys` VALUES (1,'en_US',1,1,'PDF',0,0);
/*!40000 ALTER TABLE `issue_galleys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_settings`
--

DROP TABLE IF EXISTS `issue_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_settings` (
  `issue_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `issue_settings_pkey` (`issue_id`,`locale`,`setting_name`),
  KEY `issue_settings_issue_id` (`issue_id`),
  KEY `issue_settings_name_value` (`setting_name`(50),`setting_value`(150))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_settings`
--

LOCK TABLES `issue_settings` WRITE;
/*!40000 ALTER TABLE `issue_settings` DISABLE KEYS */;
INSERT INTO `issue_settings` VALUES (1,'en_US','title','Test Issue','string'),(1,'en_US','coverPageDescription','','string'),(1,'en_US','showCoverPage','0','int'),(1,'en_US','hideCoverPageArchives','0','int'),(1,'en_US','hideCoverPageCover','0','int'),(1,'en_US','description','Issue description','string'),(1,'en_US','coverPageAltText','','string'),(1,'','doiSuffix','custom_issue_doi','string'),(1,'','pub-id::publisher-id','','string'),(1,'de_DE','title','','string'),(1,'de_DE','coverPageDescription','','string'),(1,'de_DE','coverPageAltText','','string'),(1,'de_DE','showCoverPage','0','int'),(1,'de_DE','hideCoverPageArchives','0','int'),(1,'de_DE','hideCoverPageCover','0','int'),(1,'de_DE','description','Dies ist dieselbe Ausgabe in deutsch.','string'),(1,'','pub-id::doi','10.1234/t.v1i1','string'),(1,'','pub-id::other::urn','urn:nbn:de:0000-t.v1i19','string');
/*!40000 ALTER TABLE `issue_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issues`
--

DROP TABLE IF EXISTS `issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issues` (
  `issue_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `volume` smallint(6) DEFAULT NULL,
  `number` varchar(10) DEFAULT NULL,
  `year` smallint(6) DEFAULT NULL,
  `published` tinyint(4) NOT NULL,
  `current` tinyint(4) NOT NULL,
  `date_published` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `access_status` tinyint(4) NOT NULL,
  `open_access_date` datetime DEFAULT NULL,
  `show_volume` tinyint(4) NOT NULL,
  `show_number` tinyint(4) NOT NULL,
  `show_year` tinyint(4) NOT NULL,
  `show_title` tinyint(4) NOT NULL,
  `style_file_name` varchar(90) DEFAULT NULL,
  `original_style_file_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`issue_id`),
  KEY `issues_journal_id` (`journal_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issues`
--

LOCK TABLES `issues` WRITE;
/*!40000 ALTER TABLE `issues` DISABLE KEYS */;
INSERT INTO `issues` VALUES (1,1,1,'1',2011,1,1,'2011-10-06 00:00:00',NULL,0,NULL,1,1,1,1,NULL,NULL);
/*!40000 ALTER TABLE `issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journal_settings`
--

DROP TABLE IF EXISTS `journal_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journal_settings` (
  `journal_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `journal_settings_pkey` (`journal_id`,`locale`,`setting_name`),
  KEY `journal_settings_journal_id` (`journal_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal_settings`
--

LOCK TABLES `journal_settings` WRITE;
/*!40000 ALTER TABLE `journal_settings` DISABLE KEYS */;
INSERT INTO `journal_settings` VALUES (1,'','numPageLinks','10','int'),(1,'','itemsPerPage','25','int'),(1,'','numWeeksPerReview','4','int'),(1,'en_US','privacyStatement','The names and email addresses entered in this journal site will be used exclusively for the stated purposes of this journal and will not be made available for any other purpose or to any other party.','string'),(1,'en_US','openAccessPolicy','This journal provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.','string'),(1,'en_US','authorSelfArchivePolicy','This journal permits and encourages authors to post items submitted to the journal on personal websites or institutional repositories both prior to and after publication, while providing bibliographic details that credit, if applicable, its publication in this journal.','string'),(1,'en_US','copyeditInstructions','The copyediting stage is intended to improve the flow, clarity, grammar, wording, and formatting of the article. It represents the last chance for the author to make any substantial changes to the text because the next stage is restricted to typos and formatting corrections.   The file to be copyedited is in Word or .rtf format and therefore can easily be edited as a word processing document. The set of instructions displayed here proposes two approaches to copyediting. One is based on Microsoft Word\'s Track Changes feature and requires that the copy editor, editor, and author have access to this program. A second system, which is software independent, has been borrowed, with permission, from the Harvard Educational Review. The journal editor is in a position to modify these instructions, so suggestions can be made to improve the process for this journal.   <h4>Copyediting Systems</h4> <strong>1. Microsoft Word\'s Track Changes</strong> Under Tools in the menu bar, the feature Track Changes enables the copy editor to make insertions (text appears in color) and deletions (text appears crossed out in color or in the margins as deleted). The copy editor can posit queries to both the author (Author Queries) and to the editor (Editor Queries) by inserting these queries in square brackets. The copyedited version is then uploaded, and the editor is notified. The editor then reviews the text and notifies the author.  The editor and author should leave those changes with which they are satisfied. If further changes are necessary, the editor and author can make changes to the initial insertions or deletions, as well as make new insertions or deletions elsewhere in the text. Authors and editors should respond to each of the queries addressed to them, with responses placed inside the square brackets.   After the text has been reviewed by editor and author, the copy editor will make a final pass over the text accepting the changes in preparation for the layout and galley stage.   <strong>2. Harvard Educational Review </strong> <strong>Instructions for Making Electronic Revisions to the Manuscript</strong> Please follow the following protocol for making electronic revisions to your manuscript:  <strong>Responding to suggested changes.</strong> For each of the suggested changes that you accept, unbold the text.   For each of the suggested changes that you do not accept, re-enter the original text and <strong>bold</strong> it.  <strong>Making additions and deletions.</strong> Indicate additions by <strong>bolding</strong> the new text.   Replace deleted sections with: <strong>[deleted text]</strong>.   If you delete one or more sentence, please indicate with a note, e.g., <strong>[deleted 2 sentences]</strong>.  <strong>Responding to Queries to the Author (QAs).</strong> Keep all QAs intact and bolded within the text. Do not delete them.   To reply to a QA, add a comment after it. Comments should be delimited using: <strong>[Comment:]</strong> e.g., <strong>[Comment: Expanded discussion of methodology as you suggested]</strong>.  <strong>Making comments.</strong> Use comments to explain organizational changes or major revisions   e.g., <strong>[Comment: Moved the above paragraph from p. 5 to p. 7].</strong> Note: When referring to page numbers, please use the page numbers from the printed copy of the manuscript that was sent to you. This is important since page numbers may change as a document is revised electronically.  <h4>An Illustration of an Electronic Revision</h4> <ol> <li><strong>Initial copyedit.</strong> The journal copy editor will edit the text to improve flow, clarity, grammar, wording, and formatting, as well as including author queries as necessary. Once the initial edit is complete, the copy editor will upload the revised document through the journal Web site and notify the author that the edited manuscript is available for review.</li> <li><strong>Author copyedit.</strong> Before making dramatic departures from the structure and organization of the edited manuscript, authors must check in with the editors who are co-chairing the piece. Authors should accept/reject any changes made during the initial copyediting, as appropriate, and respond to all author queries. When finished with the revisions, authors should rename the file from AuthorNameQA.doc to AuthorNameQAR.doc (e.g., from LeeQA.doc to LeeQAR.doc) and upload the revised document through the journal Web site as directed.</li> <li><strong>Final copyedit.</strong> The journal copy editor will verify changes made by the author and incorporate the responses to the author queries to create a final manuscript. When finished, the copy editor will upload the final document through the journal Web site and alert the layout editor to complete formatting.</li> </ol>','string'),(1,'','useLayoutEditors','0','bool'),(1,'','emailSignature','________________________________________________________________________\r\ntest\r\nhttp://localhost/pkp-ojs/index.php/test','string'),(1,'en_US','proofInstructions','<p>The proofreading stage is intended to catch any errors in the galley\'s spelling, grammar, and formatting. More substantial changes cannot be made at this stage, unless discussed with the Section Editor. In Layout, click on VIEW PROOF to see the HTML, PDF, and other available file formats used in publishing this item.</p> <h4>For Spelling and Grammar Errors</h4> <p>Copy the problem word or groups of words and paste them into the Proofreading Corrections box with \"CHANGE-TO\" instructions to the editor as follows:</p> <pre>1. CHANGE...\r\n	then the others\r\n	TO...\r\n	than the others</pre> <br /> <pre>2. CHANGE...\r\n	Malinowsky\r\n	TO...\r\n	Malinowski</pre> <br /> <h4>For Formatting Errors</h4> <p>Describe the location and nature of the problem in the Proofreading Corrections box after typing in the title \"FORMATTING\" as follows:</p> <br /> <pre>3. FORMATTING\r\n	The numbers in Table 3 are not aligned in the third column.</pre> <br /> <pre>4. FORMATTING\r\n	The paragraph that begins \"This last topic...\" is not indented.</pre>','string'),(1,'en_US','refLinkInstructions','<h4>To Add Reference Linking to the Layout Process</h4> <p>When turning a submission into HTML or PDF, make sure that all hyperlinks in the submission are active.</p> <h4>A. When the Author Provides a Link with the Reference</h4> <ol> <li>While the submission is still in its word processing format (e.g., Word), add the phrase VIEW ITEM to the end of the reference that has a URL.</li> <li>Turn that phrase into a hyperlink by highlighting it and using Word\'s Insert Hyperlink tool and the URL prepared in #2.</li> </ol> <h4>B. Enabling Readers to Search Google Scholar For References</h4> <ol> <li>While the submission is still in its word processing format (e.g., Word), copy the title of the work referenced in the References list (if it appears to be too common a title—e.g., \"Peace\"—then copy author and title).</li> <li>Paste the reference\'s title between the %22\'s, placing a + between each word: http://scholar.google.com/scholar?q=%22PASTE+TITLE+HERE%22&amp;hl=en&amp;lr=&amp;btnG=Search.</li> <li>Add the phrase GS SEARCH to the end of each citation in the submission\'s References list.</li> <li>Turn that phrase into a hyperlink by highlighting it and using Word\'s Insert Hyperlink tool and the URL prepared in #2.</li> </ol> <h4>C. Enabling Readers to Search for References with a DOI</h4> <ol> <li>While the submission is still in Word, copy a batch of references into CrossRef Text Query http://www.crossref.org/freeTextQuery/.</li> <li>Paste each DOI that the Query provides in the following URL (between = and &amp;): http://www.cmaj.ca/cgi/external_ref?access_num=PASTE DOI#HERE&amp;link_type=DOI.</li> <li>Add the phrase CrossRef to the end of each citation in the submission\'s References list.</li> <li>Turn that phrase into a hyperlink by highlighting the phrase and using Word\'s Insert Hyperlink tool and the appropriate URL prepared in #2.</li> </ol>','string'),(1,'en_US','readerInformation','We encourage readers to sign up for the publishing notification service for this journal. Use the <a href=\"/pkp-ojs/index.php/test/user/register\">Register</a> link at the top of the home page for the journal. This registration will result in the reader receiving the Table of Contents by email for each new issue of the journal. This list also allows the journal to claim a certain level of support or readership. See the journal\'s <a href=\"/pkp-ojs/index.php/test/about/submissions#privacyStatement\">Privacy Statement</a>, which assures readers that their name and email address will not be used for other purposes.','string'),(1,'en_US','authorInformation','Interested in submitting to this journal? We recommend that you review the <a href=\"/pkp-ojs/index.php/test/about\">About the Journal</a> page for the journal\'s section policies, as well as the <a href=\"/pkp-ojs/index.php/test/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"/pkp-ojs/index.php/test/user/register\">register</a> with the journal prior to submitting or, if already registered, can simply <a href=\"/pkp-ojs/index.php/index/login\">log in</a> and begin the five-step process.','string'),(1,'','displayCurrentIssue','0','bool'),(1,'en_US','librarianInformation','We encourage research librarians to list this journal among their library\'s electronic journal holdings. As well, it may be worth noting that this journal\'s open source publishing system is suitable for libraries to host for their faculty members to use with journals they are involved in editing (see <a href=\"http://pkp.sfu.ca/ojs\">Open Journal Systems</a>).','string'),(1,'en_US','lockssLicense','This journal utilizes the LOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href=\"http://lockss.org/\">More...</a>','string'),(1,'','supportedLocales','a:2:{i:0;s:5:\"en_US\";i:1;s:5:\"de_DE\";}','object'),(1,'','supportedFormLocales','a:2:{i:0;s:5:\"en_US\";i:1;s:5:\"de_DE\";}','object'),(1,'','supportedSubmissionLocales','a:2:{i:0;s:5:\"en_US\";i:1;s:5:\"de_DE\";}','object'),(1,'en_US','submissionChecklist','a:6:{i:0;a:2:{s:5:\"order\";s:1:\"1\";s:7:\"content\";s:165:\"The submission has not been previously published, nor is it before another journal for consideration (or an explanation has been provided in Comments to the Editor).\";}i:1;a:2:{s:5:\"order\";s:1:\"2\";s:7:\"content\";s:95:\"The submission file is in OpenOffice, Microsoft Word, RTF, or WordPerfect document file format.\";}i:2;a:2:{s:5:\"order\";s:1:\"3\";s:7:\"content\";s:60:\"Where available, URLs for the references have been provided.\";}i:3;a:2:{s:5:\"order\";s:1:\"4\";s:7:\"content\";s:239:\"The text is single-spaced; uses a 12-point font; employs italics, rather than underlining (except with URL addresses); and all illustrations, figures, and tables are placed within the text at the appropriate points, rather than at the end.\";}i:4;a:2:{s:5:\"order\";s:1:\"5\";s:7:\"content\";s:239:\"The text adheres to the stylistic and bibliographic requirements outlined in the <a href=\"http://localhost/pkp-ojs/index.php/test/about/submissions#authorGuidelines\" target=\"_new\">Author Guidelines</a>, which is found in About the Journal.\";}i:5;a:2:{s:5:\"order\";s:1:\"6\";s:7:\"content\";s:230:\"If submitting to a peer-reviewed section of the journal, the instructions in <a href=\"javascript:openHelp(\'http://localhost/pkp-ojs/index.php/test/help/view/editorial/topic/000044\')\">Ensuring a Blind Review</a> have been followed.\";}}','object'),(1,'','rtAbstract','1','bool'),(1,'','rtCaptureCite','1','bool'),(1,'','rtViewMetadata','1','bool'),(1,'','rtSupplementaryFiles','1','bool'),(1,'','rtPrinterFriendly','1','bool'),(1,'','rtDefineTerms','1','bool'),(1,'','rtAddComment','1','bool'),(1,'','rtEmailAuthor','1','bool'),(1,'','rtEmailOthers','1','bool'),(1,'','allowRegReviewer','1','bool'),(1,'','allowRegAuthor','1','bool'),(1,'','allowRegReader','1','bool'),(1,'','submissionFee','0','int'),(1,'en_US','submissionFeeName','Article Submission','string'),(1,'en_US','submissionFeeDescription','Authors are required to pay an Article Submission Fee as part of the submission process to contribute to review costs.','string'),(1,'','fastTrackFee','0','int'),(1,'en_US','fastTrackFeeName','Fast-Track Review','string'),(1,'en_US','fastTrackFeeDescription','With the payment of this fee, the review, editorial decision, and author notification on this manuscript is guaranteed to take place within 4 weeks.','string'),(1,'','publicationFee','0','int'),(1,'en_US','publicationFeeName','Article Publication','string'),(1,'en_US','publicationFeeDescription','If this paper is accepted for publication, you will be asked to pay an Article Publication Fee to cover publications costs.','string'),(1,'en_US','waiverPolicy','If you do not have funds to pay such fees, you will have an opportunity to waive each fee. We do not want fees to prevent the publication of worthy work.','string'),(1,'','purchaseArticleFee','0','int'),(1,'en_US','purchaseArticleFeeName','Purchase Article','string'),(1,'en_US','purchaseArticleFeeDescription','The payment of this fee will enable you to view, download, and print this article.','string'),(1,'','membershipFee','0','int'),(1,'en_US','membershipFeeName','Association Membership','string'),(1,'en_US','membershipFeeDescription','The payment of this fee will enroll you as a member in this association for one year and provide you with free access to this journal.','string'),(1,'en_US','donationFeeName','Donations to journal','string'),(1,'en_US','donationFeeDescription','Donations of any amount to this journal are gratefully received and provide a means for the editors to continue to provide a journal of the highest quality to its readers.','string'),(1,'en_US','title','test','string'),(1,'en_US','initials','T','string'),(1,'','printIssn','10184784','string'),(1,'','onlineIssn','10184783','string'),(1,'','mailingAddress','','string'),(1,'','categories','N;','object'),(1,'','useEditorialBoard','0','bool'),(1,'','contactName','FUB Integration Test Principal Contact','string'),(1,'','contactEmail','jerico.dev@gmail.com','string'),(1,'','contactPhone','','string'),(1,'','contactFax','','string'),(1,'','supportName','FUB Integration Test Tech Contact','string'),(1,'','supportEmail','jerico.dev@gmail.com','string'),(1,'','supportPhone','','string'),(1,'','sponsors','a:0:{}','object'),(1,'','publisherInstitution','Test Publisher','string'),(1,'','publisherUrl','','string'),(1,'','contributors','a:0:{}','object'),(1,'','envelopeSender','','string'),(1,'','enableComments','0','int'),(1,'','rtEnabled','1','bool'),(1,'','rtVersionId','0','int'),(1,'','rtFindingReferences','0','bool'),(1,'','rtViewReviewPolicy','0','bool'),(1,'','rtSharingEnabled','','string'),(1,'','rtSharingUserName','','string'),(1,'','rtSharingButtonStyle','','string'),(1,'','rtSharingDropDownMenu','','string'),(1,'','rtSharingBrand','','string'),(1,'','rtSharingDropDown','','string'),(1,'','rtSharingLanguage','','string'),(1,'','rtSharingLogo','','string'),(1,'','rtSharingLogoBackground','','string'),(1,'','rtSharingLogoColor','','string'),(1,'en_US','navItems','a:1:{i:0;a:2:{s:4:\"name\";s:0:\"\";s:3:\"url\";s:0:\"\";}}','object'),(1,'','journalTheme','','string'),(1,'','disableUserReg','0','bool'),(1,'','restrictSiteAccess','0','bool'),(1,'','restrictArticleAccess','0','bool'),(1,'','publicationFormatVolume','1','bool'),(1,'','publicationFormatNumber','1','bool'),(1,'','publicationFormatYear','1','bool'),(1,'','publicationFormatTitle','1','bool'),(1,'','initialVolume','0','int'),(1,'','initialNumber','0','int'),(1,'','initialYear','0','int'),(1,'','useCopyeditors','0','bool'),(1,'','provideRefLinkInstructions','0','bool'),(1,'','useProofreaders','0','bool'),(1,'','publishingMode','0','int'),(1,'','showGalleyLinks','0','bool'),(1,'','enableAnnouncements','0','bool'),(1,'','enableAnnouncementsHomepage','0','bool'),(1,'','numAnnouncementsHomepage','0','int'),(1,'','volumePerYear','0','int'),(1,'','issuePerVolume','0','int'),(1,'','enablePublicIssueId','0','bool'),(1,'','enablePublicArticleId','0','bool'),(1,'','enablePublicGalleyId','0','bool'),(1,'','enablePublicSuppFileId','0','bool'),(1,'','enablePageNumber','1','bool'),(1,'de_DE','title','test-de','string'),(1,'de_DE','initials','T-DE','string'),(1,'','includeCreativeCommons','0','bool'),(1,'','copyrightNoticeAgree','0','bool'),(1,'','requireAuthorCompetingInterests','0','bool'),(1,'','requireReviewerCompetingInterests','0','bool'),(1,'','metaDiscipline','0','bool'),(1,'','metaSubjectClass','1','bool'),(1,'en_US','metaSubjectClassTitle','Mathematics Subject Classification','string'),(1,'en_US','metaSubjectClassUrl','http://www.ams.org/mathscinet/msc/msc2010.html','string'),(1,'','metaSubject','1','bool'),(1,'en_US','metaSubjectExamples','Photosynthesis; Black Holes; Four-Color Map Problem; Bayesian Theory','string'),(1,'','metaCoverage','0','bool'),(1,'','metaType','0','bool'),(1,'','metaCitations','0','bool'),(1,'','metaCitationOutputFilterId','0','int'),(1,'','copySubmissionAckPrimaryContact','0','bool'),(1,'','copySubmissionAckSpecified','0','bool'),(1,'','copySubmissionAckAddress','','string'),(1,'en_US','copyrightNotice','Copyright Notice','string');
/*!40000 ALTER TABLE `journal_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journals`
--

DROP TABLE IF EXISTS `journals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journals` (
  `journal_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `path` varchar(32) NOT NULL,
  `seq` double NOT NULL,
  `primary_locale` varchar(5) NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  PRIMARY KEY (`journal_id`),
  UNIQUE KEY `journals_path` (`path`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journals`
--

LOCK TABLES `journals` WRITE;
/*!40000 ALTER TABLE `journals` DISABLE KEYS */;
INSERT INTO `journals` VALUES (1,'test',1,'en_US',1);
/*!40000 ALTER TABLE `journals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metadata_description_settings`
--

DROP TABLE IF EXISTS `metadata_description_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metadata_description_settings` (
  `metadata_description_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `metadata_descripton_settings_pkey` (`metadata_description_id`,`locale`,`setting_name`),
  KEY `metadata_description_settings_id` (`metadata_description_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metadata_description_settings`
--

LOCK TABLES `metadata_description_settings` WRITE;
/*!40000 ALTER TABLE `metadata_description_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `metadata_description_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metadata_descriptions`
--

DROP TABLE IF EXISTS `metadata_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metadata_descriptions` (
  `metadata_description_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `schema_namespace` varchar(255) NOT NULL,
  `schema_name` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `seq` bigint(20) NOT NULL,
  PRIMARY KEY (`metadata_description_id`),
  KEY `metadata_descriptions_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metadata_descriptions`
--

LOCK TABLES `metadata_descriptions` WRITE;
/*!40000 ALTER TABLE `metadata_descriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `metadata_descriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mutex`
--

DROP TABLE IF EXISTS `mutex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mutex` (
  `i` tinyint(4) NOT NULL,
  PRIMARY KEY (`i`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mutex`
--

LOCK TABLES `mutex` WRITE;
/*!40000 ALTER TABLE `mutex` DISABLE KEYS */;
INSERT INTO `mutex` VALUES (0),(1),(2),(3),(4),(5),(6),(7),(8),(9);
/*!40000 ALTER TABLE `mutex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `note_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `file_id` bigint(20) DEFAULT NULL,
  `contents` text,
  PRIMARY KEY (`note_id`),
  KEY `notes_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_mail_list`
--

DROP TABLE IF EXISTS `notification_mail_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_mail_list` (
  `notification_mail_list_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(90) NOT NULL,
  `confirmed` tinyint(4) NOT NULL,
  `token` varchar(40) NOT NULL,
  `context` bigint(20) NOT NULL,
  PRIMARY KEY (`notification_mail_list_id`),
  UNIQUE KEY `notification_mail_list_email_context` (`email`,`context`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_mail_list`
--

LOCK TABLES `notification_mail_list` WRITE;
/*!40000 ALTER TABLE `notification_mail_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_mail_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_settings`
--

DROP TABLE IF EXISTS `notification_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_settings` (
  `setting_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `notification_id` bigint(20) NOT NULL,
  `locale` varchar(5) DEFAULT NULL,
  `setting_name` varchar(64) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`setting_id`),
  UNIQUE KEY `notification_settings_pkey` (`notification_id`,`locale`,`setting_name`)
) ENGINE=MyISAM AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_settings`
--

LOCK TABLES `notification_settings` WRITE;
/*!40000 ALTER TABLE `notification_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_subscription_settings`
--

DROP TABLE IF EXISTS `notification_subscription_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_subscription_settings` (
  `setting_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `setting_name` varchar(64) NOT NULL,
  `setting_value` text,
  `user_id` bigint(20) NOT NULL,
  `context` bigint(20) NOT NULL,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_subscription_settings`
--

LOCK TABLES `notification_subscription_settings` WRITE;
/*!40000 ALTER TABLE `notification_subscription_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_subscription_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `notification_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `level` bigint(20) NOT NULL,
  `type` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_read` datetime DEFAULT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `notifications_context_id_user_id` (`context_id`,`user_id`,`level`),
  KEY `notifications_context_id` (`context_id`,`level`),
  KEY `notifications_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=MyISAM AUTO_INCREMENT=229 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,0,1,2,257,'2011-10-06 11:31:13',NULL,0,0),(2,0,1,2,257,'2011-10-17 20:28:34',NULL,0,0),(3,0,1,2,257,'2011-10-17 20:29:08',NULL,0,0),(4,1,1,2,16777217,'2011-10-20 15:46:54',NULL,257,2),(5,1,1,2,16777218,'2011-10-20 16:50:03',NULL,257,1),(7,1,1,2,16777218,'2011-10-28 23:14:15',NULL,257,1),(9,1,1,2,16777222,'2011-10-29 07:49:14',NULL,257,1),(10,1,1,2,16777220,'2011-10-29 07:49:18',NULL,257,1),(11,1,1,2,16777222,'2011-10-29 07:49:31',NULL,257,1),(12,1,1,2,16777220,'2011-10-29 07:49:34',NULL,257,1),(13,1,1,2,16777218,'2011-10-29 07:49:54',NULL,257,1),(21,1,1,2,16777222,'2011-10-31 22:17:23',NULL,257,1),(17,1,1,2,16777222,'2011-10-29 07:50:12',NULL,257,1),(19,1,1,2,16777220,'2011-10-29 07:50:19',NULL,257,1),(22,1,1,2,16777220,'2011-10-31 22:17:27',NULL,257,1),(23,1,1,2,16777222,'2011-10-31 22:17:40',NULL,257,1),(24,1,1,2,16777220,'2011-10-31 22:17:42',NULL,257,1),(25,1,1,2,16777218,'2011-10-31 22:18:03',NULL,257,1),(33,1,1,2,16777222,'2011-10-31 22:26:00',NULL,257,1),(29,1,1,2,16777222,'2011-10-31 22:18:21',NULL,257,1),(31,1,1,2,16777220,'2011-10-31 22:18:28',NULL,257,1),(34,1,1,2,16777220,'2011-10-31 22:26:03',NULL,257,1),(35,1,1,2,16777222,'2011-10-31 22:26:17',NULL,257,1),(36,1,1,2,16777220,'2011-10-31 22:26:20',NULL,257,1),(37,1,1,2,16777218,'2011-10-31 22:26:41',NULL,257,1),(45,1,1,2,16777222,'2011-11-01 00:57:37',NULL,257,1),(41,1,1,2,16777222,'2011-10-31 22:26:58',NULL,257,1),(43,1,1,2,16777220,'2011-10-31 22:27:05',NULL,257,1),(46,1,1,2,16777220,'2011-11-01 00:57:41',NULL,257,1),(47,1,1,2,16777222,'2011-11-01 00:57:54',NULL,257,1),(48,1,1,2,16777220,'2011-11-01 00:57:57',NULL,257,1),(49,1,1,2,16777218,'2011-11-01 00:58:17',NULL,257,1),(57,1,1,2,16777222,'2011-11-01 13:34:56',NULL,257,1),(53,1,1,2,16777222,'2011-11-01 00:58:35',NULL,257,1),(55,1,1,2,16777220,'2011-11-01 00:58:42',NULL,257,1),(58,1,1,2,16777220,'2011-11-01 13:35:00',NULL,257,1),(59,1,1,2,16777222,'2011-11-01 13:35:13',NULL,257,1),(60,1,1,2,16777220,'2011-11-01 13:35:16',NULL,257,1),(61,1,1,2,16777218,'2011-11-01 13:35:36',NULL,257,1),(69,1,1,2,16777222,'2011-11-03 01:21:21',NULL,257,1),(65,1,1,2,16777222,'2011-11-01 13:35:54',NULL,257,1),(67,1,1,2,16777220,'2011-11-01 13:36:01',NULL,257,1),(70,1,1,2,16777220,'2011-11-03 01:21:25',NULL,257,1),(71,1,1,2,16777222,'2011-11-03 01:21:38',NULL,257,1),(72,1,1,2,16777220,'2011-11-03 01:21:40',NULL,257,1),(73,1,1,2,16777218,'2011-11-03 01:22:01',NULL,257,1),(81,1,1,2,16777222,'2011-11-03 02:36:23',NULL,257,1),(77,1,1,2,16777222,'2011-11-03 01:22:18',NULL,257,1),(79,1,1,2,16777220,'2011-11-03 01:22:25',NULL,257,1),(82,1,1,2,16777220,'2011-11-03 02:36:27',NULL,257,1),(83,1,1,2,16777222,'2011-11-03 02:36:40',NULL,257,1),(84,1,1,2,16777220,'2011-11-03 02:36:43',NULL,257,1),(85,1,1,2,16777218,'2011-11-03 02:37:04',NULL,257,1),(89,1,1,2,16777222,'2011-11-03 02:37:21',NULL,257,1),(91,1,1,2,16777220,'2011-11-03 02:37:28',NULL,257,1),(93,1,1,2,16777222,'2011-11-14 19:28:44',NULL,257,1),(94,1,1,2,16777222,'2011-11-14 19:30:06',NULL,257,1),(95,1,1,2,16777218,'2011-11-14 20:08:26',NULL,257,1),(96,1,1,2,16777218,'2011-11-14 20:09:48',NULL,257,1),(97,1,1,2,16777218,'2011-11-14 20:11:11',NULL,257,1),(99,1,1,2,16777218,'2011-11-14 20:21:30',NULL,257,1),(101,1,1,2,16777222,'2011-11-14 20:33:24',NULL,257,1),(102,1,1,2,16777220,'2011-11-14 20:33:28',NULL,257,1),(103,1,1,2,16777222,'2011-11-14 20:33:41',NULL,257,1),(104,1,1,2,16777220,'2011-11-14 20:33:44',NULL,257,1),(105,1,1,2,16777218,'2011-11-14 20:34:06',NULL,257,1),(109,1,1,2,16777222,'2011-11-14 20:34:23',NULL,257,1),(111,1,1,2,16777220,'2011-11-14 20:34:31',NULL,257,1),(112,1,1,2,16777222,'2011-11-18 05:06:40',NULL,257,1),(113,1,1,2,16777220,'2011-12-02 03:19:18',NULL,257,1),(115,1,1,2,16777222,'2011-12-02 03:30:42',NULL,257,1),(116,1,1,2,16777220,'2011-12-02 03:30:45',NULL,257,1),(117,1,1,2,16777222,'2011-12-02 03:30:58',NULL,257,1),(118,1,1,2,16777220,'2011-12-02 03:31:01',NULL,257,1),(119,1,1,2,16777218,'2011-12-02 03:31:21',NULL,257,1),(127,1,1,2,16777222,'2011-12-02 03:47:32',NULL,257,1),(123,1,1,2,16777222,'2011-12-02 03:31:39',NULL,257,1),(125,1,1,2,16777220,'2011-12-02 03:31:45',NULL,257,1),(128,1,1,2,16777220,'2011-12-02 03:47:36',NULL,257,1),(129,1,1,2,16777222,'2011-12-02 03:47:49',NULL,257,1),(130,1,1,2,16777220,'2011-12-02 03:47:52',NULL,257,1),(131,1,1,2,16777218,'2011-12-02 03:48:13',NULL,257,1),(139,1,1,2,16777222,'2011-12-02 03:56:42',NULL,257,1),(135,1,1,2,16777222,'2011-12-02 03:48:30',NULL,257,1),(137,1,1,2,16777220,'2011-12-02 03:48:37',NULL,257,1),(140,1,1,2,16777220,'2011-12-02 03:56:46',NULL,257,1),(141,1,1,2,16777222,'2011-12-02 03:56:59',NULL,257,1),(142,1,1,2,16777220,'2011-12-02 03:57:02',NULL,257,1),(143,1,1,2,16777218,'2011-12-02 03:57:24',NULL,257,1),(147,1,1,2,16777222,'2011-12-02 03:57:41',NULL,257,1),(149,1,1,2,16777220,'2011-12-02 03:57:48',NULL,257,1),(151,1,1,2,16777222,'2011-12-30 03:34:38',NULL,257,1),(152,1,1,2,16777220,'2011-12-30 03:34:41',NULL,257,1),(153,1,1,2,16777222,'2011-12-30 03:34:55',NULL,257,1),(154,1,1,2,16777220,'2011-12-30 03:34:58',NULL,257,1),(159,1,1,2,16777218,'2011-12-30 03:35:38',NULL,257,1),(160,1,1,2,16777218,'2011-12-30 03:35:40',NULL,257,1),(161,1,1,2,16777218,'2011-12-30 03:35:44',NULL,257,1),(166,1,1,2,16777222,'2011-12-30 03:36:11',NULL,257,1),(165,1,1,2,16777222,'2011-12-30 03:36:09',NULL,257,1),(167,1,1,2,16777222,'2011-12-30 03:36:13',NULL,257,1),(170,1,1,2,16777220,'2011-12-30 03:36:22',NULL,257,1),(169,1,1,2,16777220,'2011-12-30 03:36:20',NULL,257,1),(171,1,1,2,16777220,'2011-12-30 03:36:25',NULL,257,1),(173,1,1,2,16777222,'2011-12-30 04:04:24',NULL,257,1),(174,1,1,2,16777220,'2011-12-30 04:04:28',NULL,257,1),(175,1,1,2,16777222,'2011-12-30 04:04:42',NULL,257,1),(176,1,1,2,16777220,'2011-12-30 04:04:45',NULL,257,1),(181,1,1,2,16777218,'2011-12-30 04:05:27',NULL,257,1),(182,1,1,2,16777218,'2011-12-30 04:05:29',NULL,257,1),(183,1,1,2,16777218,'2011-12-30 04:05:33',NULL,257,1),(188,1,1,2,16777222,'2011-12-30 04:06:00',NULL,257,1),(187,1,1,2,16777222,'2011-12-30 04:05:58',NULL,257,1),(189,1,1,2,16777222,'2011-12-30 04:06:03',NULL,257,1),(192,1,1,2,16777220,'2011-12-30 04:06:12',NULL,257,1),(191,1,1,2,16777220,'2011-12-30 04:06:10',NULL,257,1),(193,1,1,2,16777220,'2011-12-30 04:06:15',NULL,257,1),(197,1,1,2,16777222,'2012-01-23 20:25:49',NULL,257,1),(198,1,1,2,16777220,'2012-01-23 20:25:50',NULL,257,1),(199,1,1,2,16777218,'2012-01-23 20:26:08',NULL,257,1),(200,1,1,2,16777222,'2012-01-23 20:26:19',NULL,257,1),(201,1,1,2,16777220,'2012-01-23 20:26:24',NULL,257,1),(208,1,1,2,16777222,'2012-01-23 20:28:31',NULL,257,1),(209,1,1,2,16777220,'2012-01-23 20:28:35',NULL,257,1),(210,1,1,2,16777222,'2012-01-23 20:28:46',NULL,257,1),(211,1,1,2,16777220,'2012-01-23 20:28:49',NULL,257,1),(216,1,1,2,16777218,'2012-01-23 20:29:22',NULL,257,1),(217,1,1,2,16777218,'2012-01-23 20:29:24',NULL,257,1),(218,1,1,2,16777218,'2012-01-23 20:29:28',NULL,257,1),(223,1,1,2,16777222,'2012-01-23 20:29:56',NULL,257,1),(222,1,1,2,16777222,'2012-01-23 20:29:54',NULL,257,1),(224,1,1,2,16777222,'2012-01-23 20:29:59',NULL,257,1),(227,1,1,2,16777220,'2012-01-23 20:30:09',NULL,257,1),(226,1,1,2,16777220,'2012-01-23 20:30:06',NULL,257,1),(228,1,1,2,16777220,'2012-01-23 20:30:12',NULL,257,1);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oai_resumption_tokens`
--

DROP TABLE IF EXISTS `oai_resumption_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oai_resumption_tokens` (
  `token` varchar(32) NOT NULL,
  `expire` bigint(20) NOT NULL,
  `record_offset` int(11) NOT NULL,
  `params` text,
  UNIQUE KEY `oai_resumption_tokens_pkey` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oai_resumption_tokens`
--

LOCK TABLES `oai_resumption_tokens` WRITE;
/*!40000 ALTER TABLE `oai_resumption_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oai_resumption_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_transactions`
--

DROP TABLE IF EXISTS `paypal_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_transactions` (
  `txn_id` varchar(17) NOT NULL,
  `txn_type` varchar(20) DEFAULT NULL,
  `payer_email` varchar(127) DEFAULT NULL,
  `receiver_email` varchar(127) DEFAULT NULL,
  `item_number` varchar(127) DEFAULT NULL,
  `payment_date` varchar(127) DEFAULT NULL,
  `payer_id` varchar(13) DEFAULT NULL,
  `receiver_id` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`txn_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_transactions`
--

LOCK TABLES `paypal_transactions` WRITE;
/*!40000 ALTER TABLE `paypal_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_settings`
--

DROP TABLE IF EXISTS `plugin_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_settings` (
  `plugin_name` varchar(80) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `setting_name` varchar(80) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `plugin_settings_pkey` (`plugin_name`,`locale`,`journal_id`,`setting_name`),
  KEY `plugin_settings_plugin_name` (`plugin_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_settings`
--

LOCK TABLES `plugin_settings` WRITE;
/*!40000 ALTER TABLE `plugin_settings` DISABLE KEYS */;
INSERT INTO `plugin_settings` VALUES ('coinsplugin','',0,'enabled','1','bool'),('tinymceplugin','',0,'enabled','1','bool'),('mods34metadataplugin','',0,'metadataPluginControlledVocabInstalled','1','bool'),('nlm30metadataplugin','',0,'metadataPluginControlledVocabInstalled','1','bool'),('openurl10metadataplugin','',0,'metadataPluginControlledVocabInstalled','1','bool'),('notificationblockplugin','',0,'enabled','1','bool'),('notificationblockplugin','',0,'seq','3','int'),('notificationblockplugin','',0,'context','2','int'),('navigationblockplugin','',0,'enabled','1','bool'),('navigationblockplugin','',0,'seq','5','int'),('navigationblockplugin','',0,'context','2','int'),('userblockplugin','',0,'enabled','1','bool'),('userblockplugin','',0,'seq','2','int'),('userblockplugin','',0,'context','2','int'),('donationblockplugin','',0,'enabled','1','bool'),('donationblockplugin','',0,'seq','5','int'),('donationblockplugin','',0,'context','2','int'),('helpblockplugin','',0,'enabled','1','bool'),('helpblockplugin','',0,'seq','1','int'),('helpblockplugin','',0,'context','2','int'),('developedbyblockplugin','',0,'enabled','1','bool'),('developedbyblockplugin','',0,'seq','0','int'),('developedbyblockplugin','',0,'context','2','int'),('languagetoggleblockplugin','',0,'enabled','1','bool'),('languagetoggleblockplugin','',0,'seq','4','int'),('languagetoggleblockplugin','',0,'context','2','int'),('fontsizeblockplugin','',0,'enabled','1','bool'),('fontsizeblockplugin','',0,'seq','6','int'),('fontsizeblockplugin','',0,'context','2','int'),('tinymceplugin','',1,'enabled','1','bool'),('subscriptionblockplugin','',1,'enabled','0','bool'),('subscriptionblockplugin','',1,'seq','2','int'),('subscriptionblockplugin','',1,'context','2','int'),('roleblockplugin','',1,'enabled','1','bool'),('roleblockplugin','',1,'seq','2','int'),('roleblockplugin','',1,'context','2','int'),('informationblockplugin','',1,'enabled','0','bool'),('informationblockplugin','',1,'seq','10','int'),('informationblockplugin','',1,'context','2','int'),('developedbyblockplugin','',1,'enabled','0','bool'),('developedbyblockplugin','',1,'seq','0','int'),('developedbyblockplugin','',1,'context','2','int'),('helpblockplugin','',1,'enabled','0','bool'),('helpblockplugin','',1,'seq','1','int'),('helpblockplugin','',1,'context','2','int'),('userblockplugin','',1,'enabled','1','bool'),('userblockplugin','',1,'seq','0','int'),('userblockplugin','',1,'context','2','int'),('notificationblockplugin','',1,'enabled','1','bool'),('notificationblockplugin','',1,'seq','1','int'),('notificationblockplugin','',1,'context','2','int'),('languagetoggleblockplugin','',1,'enabled','1','bool'),('languagetoggleblockplugin','',1,'seq','3','int'),('languagetoggleblockplugin','',1,'context','2','int'),('donationblockplugin','',1,'enabled','0','bool'),('donationblockplugin','',1,'seq','7','int'),('donationblockplugin','',1,'context','2','int'),('navigationblockplugin','',1,'enabled','1','bool'),('navigationblockplugin','',1,'seq','4','int'),('navigationblockplugin','',1,'context','2','int'),('fontsizeblockplugin','',1,'enabled','0','bool'),('fontsizeblockplugin','',1,'seq','9','int'),('fontsizeblockplugin','',1,'context','2','int'),('resolverplugin','',1,'enabled','1','bool'),('referralplugin','',1,'enabled','1','bool'),('referralplugin','',1,'exclusions','#^http://www.google.#\n#^http://www.yahoo.#','string'),('webfeedplugin','',1,'enabled','1','bool'),('webfeedplugin','',1,'displayPage','homepage','string'),('webfeedplugin','',1,'displayItems','1','bool'),('readingtoolsblockplugin','',1,'enabled','1','bool'),('readingtoolsblockplugin','',1,'context','2','int'),('readingtoolsblockplugin','',1,'seq','5','int'),('keywordcloudblockplugin','',1,'enabled','0','bool'),('relateditemsblockplugin','',1,'enabled','0','bool'),('webfeedblockplugin','',1,'enabled','0','bool'),('authorbiosblockplugin','',1,'enabled','0','bool'),('authorbiosblockplugin','',1,'context','2','int'),('authorbiosblockplugin','',1,'seq','11','int'),('medraexportplugin','',1,'exportIssuesAs','1','int'),('medraexportplugin','',1,'publicationCountry','US','string'),('dataciteexportplugin','',1,'username','TIB.OJSTEST','string'),('dataciteexportplugin','',1,'password','rhowchaphy','string'),('medraexportplugin','',1,'registrantName','Registrant','string'),('medraexportplugin','',1,'fromCompany','Contact Institution','string'),('medraexportplugin','',1,'fromName','Contact Name','string'),('medraexportplugin','',1,'fromEmail','jerico.dev@gmail.com','string'),('medraexportplugin','',1,'username','TEST_OJS','string'),('medraexportplugin','',1,'password','tynJofOfso','string'),('doipubidplugin','',1,'enabled','1','bool'),('doipubidplugin','',1,'enableIssueDoi','1','bool'),('doipubidplugin','',1,'enableArticleDoi','1','bool'),('doipubidplugin','',1,'enableGalleyDoi','1','bool'),('doipubidplugin','',1,'enableSuppFileDoi','1','bool'),('doipubidplugin','',1,'doiPrefix','10.1234','string'),('doipubidplugin','',1,'doiSuffix','default','string'),('doipubidplugin','',1,'doiIssueSuffixPattern','','string'),('doipubidplugin','',1,'doiArticleSuffixPattern','','string'),('doipubidplugin','',1,'doiGalleySuffixPattern','','string'),('doipubidplugin','',1,'doiSuppFileSuffixPattern','','string'),('urnpubidplugin','',1,'enabled','1','bool'),('urnpubidplugin','',1,'enableIssueURN','1','bool'),('urnpubidplugin','',1,'enableArticleURN','1','bool'),('urnpubidplugin','',1,'enableGalleyURN','1','bool'),('urnpubidplugin','',1,'enableSuppFileURN','1','bool'),('urnpubidplugin','',1,'urnPrefix','urn:nbn:de:0000-','string'),('urnpubidplugin','',1,'urnSuffix','default','string'),('urnpubidplugin','',1,'urnIssueSuffixPattern','','string'),('urnpubidplugin','',1,'urnArticleSuffixPattern','','string'),('urnpubidplugin','',1,'urnGalleySuffixPattern','','string'),('urnpubidplugin','',1,'urnSuppFileSuffixPattern','','string'),('urnpubidplugin','',1,'checkNo','1','bool'),('urnpubidplugin','',1,'namespace','urn:nbn:de','string');
/*!40000 ALTER TABLE `plugin_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `processes`
--

DROP TABLE IF EXISTS `processes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `processes` (
  `process_id` varchar(23) NOT NULL,
  `process_type` tinyint(4) NOT NULL,
  `time_started` bigint(20) NOT NULL,
  `obliterated` tinyint(4) NOT NULL,
  UNIQUE KEY `processes_pkey` (`process_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `processes`
--

LOCK TABLES `processes` WRITE;
/*!40000 ALTER TABLE `processes` DISABLE KEYS */;
/*!40000 ALTER TABLE `processes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `published_articles`
--

DROP TABLE IF EXISTS `published_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `published_articles` (
  `published_article_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `article_id` bigint(20) NOT NULL,
  `issue_id` bigint(20) NOT NULL,
  `date_published` datetime DEFAULT NULL,
  `seq` double NOT NULL,
  `views` int(11) NOT NULL,
  `access_status` tinyint(4) NOT NULL,
  PRIMARY KEY (`published_article_id`),
  UNIQUE KEY `published_articles_article_id` (`article_id`),
  KEY `published_articles_issue_id` (`issue_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `published_articles`
--

LOCK TABLES `published_articles` WRITE;
/*!40000 ALTER TABLE `published_articles` DISABLE KEYS */;
INSERT INTO `published_articles` VALUES (1,1,1,'2011-10-06 00:00:00',1,236,0);
/*!40000 ALTER TABLE `published_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queued_payments`
--

DROP TABLE IF EXISTS `queued_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queued_payments` (
  `queued_payment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `payment_data` text,
  PRIMARY KEY (`queued_payment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queued_payments`
--

LOCK TABLES `queued_payments` WRITE;
/*!40000 ALTER TABLE `queued_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `queued_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referral_settings`
--

DROP TABLE IF EXISTS `referral_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `referral_settings` (
  `referral_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `referral_settings_pkey` (`referral_id`,`locale`,`setting_name`),
  KEY `referral_settings_referral_id` (`referral_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referral_settings`
--

LOCK TABLES `referral_settings` WRITE;
/*!40000 ALTER TABLE `referral_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `referral_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referrals`
--

DROP TABLE IF EXISTS `referrals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `referrals` (
  `referral_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `article_id` bigint(20) NOT NULL,
  `status` smallint(6) NOT NULL,
  `url` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `link_count` bigint(20) NOT NULL,
  PRIMARY KEY (`referral_id`),
  UNIQUE KEY `referral_article_id` (`article_id`,`url`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referrals`
--

LOCK TABLES `referrals` WRITE;
/*!40000 ALTER TABLE `referrals` DISABLE KEYS */;
INSERT INTO `referrals` VALUES (1,1,1,'http://localhost:4444/selenium-server/core/Blank.html','2011-10-06 11:36:26',9);
/*!40000 ALTER TABLE `referrals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_assignments`
--

DROP TABLE IF EXISTS `review_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_assignments` (
  `review_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `reviewer_id` bigint(20) NOT NULL,
  `competing_interests` text,
  `regret_message` text,
  `recommendation` tinyint(4) DEFAULT NULL,
  `date_assigned` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `date_confirmed` datetime DEFAULT NULL,
  `date_completed` datetime DEFAULT NULL,
  `date_acknowledged` datetime DEFAULT NULL,
  `date_due` datetime DEFAULT NULL,
  `date_response_due` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `reminder_was_automatic` tinyint(4) NOT NULL,
  `declined` tinyint(4) NOT NULL,
  `replaced` tinyint(4) NOT NULL,
  `cancelled` tinyint(4) NOT NULL,
  `reviewer_file_id` bigint(20) DEFAULT NULL,
  `date_rated` datetime DEFAULT NULL,
  `date_reminded` datetime DEFAULT NULL,
  `quality` tinyint(4) DEFAULT NULL,
  `stage_id` tinyint(4) NOT NULL,
  `review_method` tinyint(4) NOT NULL,
  `round` tinyint(4) NOT NULL,
  `step` tinyint(4) NOT NULL,
  `review_form_id` bigint(20) DEFAULT NULL,
  `review_round_id` bigint(20) NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `review_assignments_submission_id` (`submission_id`),
  KEY `review_assignments_reviewer_id` (`reviewer_id`),
  KEY `review_assignments_form_id` (`review_form_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_assignments`
--

LOCK TABLES `review_assignments` WRITE;
/*!40000 ALTER TABLE `review_assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_form_element_settings`
--

DROP TABLE IF EXISTS `review_form_element_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_form_element_settings` (
  `review_form_element_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `review_form_element_settings_pkey` (`review_form_element_id`,`locale`,`setting_name`),
  KEY `review_form_element_settings_review_form_element_id` (`review_form_element_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_form_element_settings`
--

LOCK TABLES `review_form_element_settings` WRITE;
/*!40000 ALTER TABLE `review_form_element_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_form_element_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_form_elements`
--

DROP TABLE IF EXISTS `review_form_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_form_elements` (
  `review_form_element_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `review_form_id` bigint(20) NOT NULL,
  `seq` double DEFAULT NULL,
  `element_type` bigint(20) DEFAULT NULL,
  `required` tinyint(4) DEFAULT NULL,
  `included` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`review_form_element_id`),
  KEY `review_form_elements_review_form_id` (`review_form_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_form_elements`
--

LOCK TABLES `review_form_elements` WRITE;
/*!40000 ALTER TABLE `review_form_elements` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_form_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_form_responses`
--

DROP TABLE IF EXISTS `review_form_responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_form_responses` (
  `review_form_element_id` bigint(20) NOT NULL,
  `review_id` bigint(20) NOT NULL,
  `response_type` varchar(6) DEFAULT NULL,
  `response_value` text,
  KEY `review_form_responses_pkey` (`review_form_element_id`,`review_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_form_responses`
--

LOCK TABLES `review_form_responses` WRITE;
/*!40000 ALTER TABLE `review_form_responses` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_form_responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_form_settings`
--

DROP TABLE IF EXISTS `review_form_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_form_settings` (
  `review_form_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `review_form_settings_pkey` (`review_form_id`,`locale`,`setting_name`),
  KEY `review_form_settings_review_form_id` (`review_form_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_form_settings`
--

LOCK TABLES `review_form_settings` WRITE;
/*!40000 ALTER TABLE `review_form_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_form_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_forms`
--

DROP TABLE IF EXISTS `review_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_forms` (
  `review_form_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `seq` double DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`review_form_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_forms`
--

LOCK TABLES `review_forms` WRITE;
/*!40000 ALTER TABLE `review_forms` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_object_metadata`
--

DROP TABLE IF EXISTS `review_object_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_object_metadata` (
  `metadata_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `review_object_type_id` bigint(20) NOT NULL,
  `seq` double DEFAULT NULL,
  `metadata_type` bigint(20) DEFAULT NULL,
  `required` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`metadata_id`),
  KEY `review_object_metadata_metadata_id` (`metadata_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_object_metadata`
--

LOCK TABLES `review_object_metadata` WRITE;
/*!40000 ALTER TABLE `review_object_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_object_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_object_metadata_settings`
--

DROP TABLE IF EXISTS `review_object_metadata_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_object_metadata_settings` (
  `metadata_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `review_object_metadata_settings_pkey` (`metadata_id`,`locale`,`setting_name`),
  KEY `review_object_metadata_settings_metadata_id` (`metadata_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_object_metadata_settings`
--

LOCK TABLES `review_object_metadata_settings` WRITE;
/*!40000 ALTER TABLE `review_object_metadata_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_object_metadata_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_object_type_settings`
--

DROP TABLE IF EXISTS `review_object_type_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_object_type_settings` (
  `type_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `review_object_type_settings_pkey` (`type_id`,`locale`,`setting_name`),
  KEY `review_object_type_settings_type_id` (`type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_object_type_settings`
--

LOCK TABLES `review_object_type_settings` WRITE;
/*!40000 ALTER TABLE `review_object_type_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_object_type_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_object_types`
--

DROP TABLE IF EXISTS `review_object_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_object_types` (
  `type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  PRIMARY KEY (`type_id`),
  KEY `review_object_type_type_id` (`type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_object_types`
--

LOCK TABLES `review_object_types` WRITE;
/*!40000 ALTER TABLE `review_object_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_object_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_rounds`
--

DROP TABLE IF EXISTS `review_rounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_rounds` (
  `review_round_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `stage_id` bigint(20) DEFAULT NULL,
  `round` tinyint(4) NOT NULL,
  `review_revision` bigint(20) DEFAULT NULL,
  `status` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`review_round_id`),
  UNIQUE KEY `review_rounds_pkey` (`submission_id`,`stage_id`,`round`),
  KEY `review_rounds_submission_id` (`submission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_rounds`
--

LOCK TABLES `review_rounds` WRITE;
/*!40000 ALTER TABLE `review_rounds` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_rounds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `journal_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  UNIQUE KEY `roles_pkey` (`journal_id`,`user_id`,`role_id`),
  KEY `roles_journal_id` (`journal_id`),
  KEY `roles_user_id` (`user_id`),
  KEY `roles_role_id` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (0,1,1),(1,1,16),(1,1,256),(1,1,65536);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rt_contexts`
--

DROP TABLE IF EXISTS `rt_contexts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rt_contexts` (
  `context_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version_id` bigint(20) NOT NULL,
  `title` varchar(120) NOT NULL,
  `abbrev` varchar(32) NOT NULL,
  `description` text,
  `cited_by` tinyint(4) NOT NULL,
  `author_terms` tinyint(4) NOT NULL,
  `define_terms` tinyint(4) NOT NULL,
  `geo_terms` tinyint(4) NOT NULL,
  `seq` double NOT NULL,
  PRIMARY KEY (`context_id`),
  KEY `rt_contexts_version_id` (`version_id`)
) ENGINE=MyISAM AUTO_INCREMENT=248 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rt_contexts`
--

LOCK TABLES `rt_contexts` WRITE;
/*!40000 ALTER TABLE `rt_contexts` DISABLE KEYS */;
INSERT INTO `rt_contexts` VALUES (1,1,'Author\'s work','Other Works','Identify other works by the article\'s author(s) by using OAI engines.',0,1,0,0,0),(2,1,'Look up terms','Look up terms','Double click on any word in the text and it will appear in the \"Definition of terms\" box. You can also type or paste a word into the box. Then use the search function to find a definition for the word. These resources have been selected because of their relevance and their open (free) access to all or part of their contents.',0,0,1,0,1),(3,1,'Related studies','Related studies','Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.',0,0,0,0,2),(4,1,'Book searches','Book searches','Book-related Resources',0,0,0,0,3),(5,1,'Online forums','Online forums','Choose online, open-access online forums that would enrich the context of the research studies on your site.',0,0,0,0,4),(6,1,'Pay-per-view','Pay-per-view','A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC\'s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.',0,0,0,0,5),(7,1,'Multimedia','Multimedia','Multimedia content',0,0,0,0,6),(8,1,'Teaching files','Instructional','Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.',0,0,0,0,7),(9,1,'Databases','Databases','Databases',0,0,0,0,8),(10,1,'Relevant portals','Relevant portals','Relevant portals',0,0,0,0,9),(11,1,'Government policy','Gov Policy','Access to Information and services gateway run by the Government of the United States and Canada.',0,0,0,0,10),(12,1,'Media reports','Media reports','Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.',0,0,0,0,11),(13,1,'Web search','Web search','Enter a search term for Internet resources through various search engines.',0,0,0,0,12),(14,2,'Author\'s work','Other Works','Identify other works by the article\'s author(s) by using OAI engines.',0,1,0,0,0),(15,2,'Look up terms','Look up terms','Double click on any word in the text and it will appear in the \"Definition of terms\" box.  You can also type or paste a word into the box.  Then use the search function to find a definition for the word.  These resources have been selected because of their relevance and their open (free) access to all or part of their contents.',0,0,1,0,1),(16,2,'Related studies','Related studies','Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.',0,0,0,0,2),(17,2,'Book searches','Book searches','Book-related Resources',0,0,0,0,3),(18,2,'Pay-per-view','Pay-per-view','A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC\'s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.',0,0,0,0,4),(19,2,'Multimedia','Multimedia','Multimedia Resources',0,0,0,0,5),(20,2,'Astro data','Astro data','Provide access to astronomy data.',0,0,0,0,6),(21,2,'Online forums','Online forums','Choose online, open-access online forums that would enrich the context of the research studies on your site.',0,0,0,0,7),(22,2,'Teaching files','Instructional','Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.',0,0,0,0,8),(23,2,'Government policy','Gov Policy','Access to Information and services gateway run by the Government of the United States and Canada.',0,0,0,0,9),(24,2,'Media reports','Media reports','Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.',0,0,0,0,10),(25,2,'Web search','Web search','Enter a search term for Internet resources through Google search engine.',0,0,0,0,11),(26,3,'Author\'s work','Other Works','Identify other works by the article\'s author(s) by using OAI engines.',0,1,0,0,0),(27,3,'Look up terms','Look up terms','Double click on any word in the text and it will appear in the \"Definition of terms\" box. You can also type or paste a word into the box. Then use the search function to find a definition for the word. These resources have been selected because of their relevance and their open (free) access to all or part of their contents.',0,0,1,0,1),(28,3,'Book searches','Book searches','Book-related Resources',0,0,0,0,2),(29,3,'Relevant portals','Relevant portals','General Science resource portals',0,0,0,0,3),(30,3,'Related studies','Related studies','Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.',0,0,0,0,4),(31,3,'Pay-per-view','Pay-per-view','A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC\'s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.',0,0,0,0,5),(32,3,'Directories','Directories','Access to information of research institutions',0,0,0,0,6),(33,3,'Online forums','Online forums','Choose online, open-access online forums that would enrich the context of the research studies on your site.',0,0,0,0,7),(34,3,'Teaching files','Instructional','Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.',0,0,0,0,8),(35,3,'Multimedia','Multimedia','Multimedia content',0,0,0,0,9),(36,3,'Government policy','Gov Policy','Access to Information and services gateway run by the Government of the United States and Canada.',0,0,0,0,10),(37,3,'Media reports','Media reports','Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.',0,0,0,0,11),(38,3,'Web search','Web search','Enter a search term for Internet resources through various search engines.',0,0,0,0,12),(39,4,'Author\'s work','Other Works','Identify other works by the article\'s author(s) by using OAI engines.',0,1,0,0,0),(40,4,'Look up terms','Look up terms','Double click on any word in the text and it will appear in the \"Definition of terms\" box.  You can also type or paste a word into the box.  Then use the search function to find a definition for the word.  These resources have been selected because of their relevance and their open (free) access to all or part of their contents.',0,0,1,0,1),(41,4,'Related studies','Related studies','Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.',0,0,0,0,2),(42,4,'Book searches','Book searches','Book-related Resources',0,0,0,0,3),(43,4,'Databases','Databases','Databases containing information related to Computing Science',0,0,0,0,4),(44,4,'Pay-per-view','Pay-per-view','A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC\'s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.',0,0,0,0,5),(45,4,'Tech. reports','Tech. reports','Provide gateway to technical report collections.',0,0,0,0,6),(46,4,'Patents','Patents','Access to Canada, U.S. and Europe patent information.',0,0,0,0,7),(47,4,'Standards','Standards','Access to standards information that is frequently consulted by computer scientists.',0,0,0,0,8),(48,4,'Online forums','Online forums','Choose online, open-access online forums that would enrich the context of the research studies on your site.',0,0,0,0,9),(49,4,'Multimedia','Multimedia','Multimedia resources',0,0,0,0,10),(50,4,'Teaching files','Instructional','Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.',0,0,0,0,11),(51,4,'Government policy','Gov Policy','Access to Information and services gateway run by the Government of the United States and Canada.',0,0,0,0,12),(52,4,'Media reports','Media reports','Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.',0,0,0,0,13),(53,4,'Web search','Web search','Enter a search term for Internet resources through various search engines.',0,0,0,0,14),(54,5,'Author\'s work','Other Works','Identify other works by the article\'s author(s) by using OAI engines.',0,1,0,0,0),(55,5,'Look up terms','Look up terms','Double click on any word in the text and it will appear in the \"Definition of terms\" box. You can also type or paste a word into the box. Then use the search function to find a definition for the word. These resources have been selected because of their relevance and their open (free) access to all or part of their contents.',0,0,1,0,1),(56,5,'Gov\'t policy','Gov\'t policy','Check various government resources.',0,0,0,0,2),(57,5,'Book searches','Book searches','Book-related Resources',0,0,0,0,3),(58,5,'Lit critics','Literary Critics','Search critical and biographical websites about authors and their works that can be browsed by author, by title, or by nationality and literary period.',0,0,0,0,4),(59,5,'Book reviews','Book reviews','Click on the search urls to check for book reviews.',0,0,0,0,5),(60,5,'Related studies','Related studies','Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.',0,0,0,0,6),(61,5,'Dissertations','Dissertations','Provides access to a repository of rich graduate educational material contributed by a number of member institutions worldwide.',0,0,0,0,7),(62,5,'Databases','Databases','Provide access to open-access abstract and/or full-text databases.',0,0,0,0,8),(63,5,'Relevant portals','Relevant portals','Relevant portals',0,0,0,0,9),(64,5,'Pay-per-view','Pay-per-view','A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC\'s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.',0,0,0,0,10),(65,5,'Related texts','Related texts','Provide online access to full text resources in Humanities.',0,0,0,0,11),(66,5,'Online forums','Online forums','Choose online, open-access online forums that would enrich the context of the research studies on your site.',0,0,0,0,12),(67,5,'Teaching files','Instructional','Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.',0,0,0,0,13),(68,5,'Media reports','Media reports','Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.',0,0,0,0,14),(69,5,'Web search','Web search','Enter a search term for Internet resources through various search engines.',0,0,0,0,15),(70,6,'Author\'s work','Other Works','Identify other works by the article\'s author(s) by using OAI engines.',0,1,0,0,0),(71,6,'Look up terms','Look up terms','Double click on any word in the text and it will appear in the \"Definition of terms\" box. You can also type or paste a word into the box. Then use the search function to find a definition for the word. These resources have been selected because of their relevance and their open (free) access to all or part of their contents.',0,0,1,0,1),(72,6,'Government policy','Gov Policy','Check various government resources.',0,0,0,0,2),(73,6,'Book searches','Book searches','Book-related Resources',0,0,0,0,3),(74,6,'Book reviews','Book reviews','Check online scholary book review resources.',0,0,0,0,4),(75,6,'Dissertations','Dissertations','Provides access to a repository of rich graduate educational material contributed by a number of member institutions worldwide.',0,0,0,0,5),(76,6,'Online forums','Online forums','Choose online, open-access online forums that would enrich the context of the research studies on your site.',0,0,0,0,6),(77,6,'Quotations','Quotations','Search familiear or famous quotation resources on the Internet',0,0,0,0,7),(78,6,'Pay-per-view','Pay-per-view','A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC\'s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.',0,0,0,0,8),(79,6,'Resources','Resources','General Resources',0,0,0,0,9),(80,6,'Media reports','Media reports','Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.',0,0,0,0,10),(81,6,'Web search','Web search','Enter a search term for Internet resources through various search engines.',0,0,0,0,11),(82,7,'Author\'s work','Other Works','Identify other works by the article\'s author(s) by using OAI engines.',0,1,0,0,0),(83,7,'Book searches','Book searches','Book-related Resources',0,0,0,0,1),(84,7,'Look up terms','Look up terms','Double click on any word in the text and it will appear in the \"Definition of terms\" box.  You can also type or paste a word into the box.  Then use the search function to find a definition for the word.  These resources have been selected because of their relevance and their open (free) access to all or part of their contents.',0,0,1,0,2),(85,7,'Related studies','Related studies','Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.',0,0,0,0,3),(86,7,'Relevant portals','Relevant portals','Offer an entry point to other websites.',0,0,0,0,4),(87,7,'Pay-per-view','Pay-per-view','A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC\'s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.',0,0,0,0,5),(88,7,'e-Journals','e-Journals','Provide pop-up window for entering open-access and full-text e-Journals relevant to your field.',0,0,0,0,6),(89,7,'Databases','Databases','Provide access to open-access abstract and/or full-text databases.',0,0,0,0,7),(90,7,'Online forums','Online forums','Choose online, open-access online forums that would enrich the context of the research studies on your site.',0,0,0,0,8),(91,7,'Government policy','Gov Policy','Access to Information and services gateway run by the Government of the United States and Canada.',0,0,0,0,9),(92,7,'Media reports','Media reports','Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.',0,0,0,0,10),(93,7,'Web search','Web search','Enter a search term for Internet resources through various search engines.',0,0,0,0,11),(94,8,'Author\'s work','Other Works','Identify other works by the article\'s author(s) by using OAI engines.',0,1,0,0,0),(95,8,'Look up terms','Look up terms','Double click on any word in the text and it will appear in the \"Definition of terms\" box. You can also type or paste a word into the box. Then use the search function to find a definition for the word. These resources have been selected because of their relevance and their open (free) access to all or part of their contents.',0,0,1,0,1),(96,8,'Related studies','Related studies','Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.',0,0,0,0,2),(97,8,'Government policy','Gov Policy','Check various government resources.',0,0,0,0,3),(98,8,'Relevant portals','Relevant portals','Environmental resource portals',0,0,0,0,4),(99,8,'Book searches','Book searches','Book-related Resources',0,0,0,0,5),(100,8,'Online forums','Online forums','Choose online, open-access online forums that would enrich the context of the research studies on your site.',0,0,0,0,6),(101,8,'Data sets','Data sets','Provides access to statistics in environmental studies.',0,0,0,0,7),(102,8,'Pay-per-view','Pay-per-view','A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC\'s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.',0,0,0,0,8),(103,8,'Media reports','Media reports','Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.',0,0,0,0,9),(104,8,'Web search','Web search','Enter a search term for Internet resources through various search engines.',0,0,0,0,10),(105,9,'Author\'s work','Other Works','Identify other works by the article\'s author(s) by using OAI engines.',0,1,0,0,0),(106,9,'Look up terms','Look up terms','Double click on any word in the text and it will appear in the \"Definition of terms\" box.  You can also type or paste a word into the box.  Then use the search function to find a definition for the word.  These resources have been selected because of their relevance and their open (free) access to all or part of their contents.',0,0,1,0,1),(107,9,'Related studies','Related studies','Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.',0,0,0,0,2),(108,9,'Book searches','Book searches','Book-related Resources',0,0,0,0,3),(109,9,'Pay-per-view','Pay-per-view','A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC\'s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.',0,0,0,0,4),(110,9,'Relevant portals','Relevant portals','Offer an entry point to other websites.',0,0,0,0,5),(111,9,'Online forums','Online forums','Choose online, open-access online forums that would enrich the context of the research studies on your site.',0,0,0,0,6),(112,9,'Teaching files','Instructional','Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.',0,0,0,0,7),(113,9,'Government policy','Gov Policy','Access to Information and services gateway run by the Government of the United States and Canada.',0,0,0,0,8),(114,9,'Media reports','Media reports','Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.',0,0,0,0,9),(115,9,'Web search','Web search','Enter a search term for Internet resources through various search engines.',0,0,0,0,10),(116,10,'Author\'s work','Other Works','Identify other works by the article\'s author(s) by using OAI engines.',0,1,0,0,0),(117,10,'Look up terms','Look up terms','Double click on any word in the text and it will appear in the \"Definition of terms\" box. You can also type or paste a word into the box. Then use the search function to find a definition for the word. These resources have been selected because of their relevance and their open (free) access to all or part of their contents.',0,0,1,0,1),(118,10,'e-Journals','e-Journals','Electronic Journals',0,0,0,0,2),(119,10,'Related studies','Related studies','Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.',0,0,0,0,3),(120,10,'Government policy','Gov Policy','Check various government resources.',0,0,0,0,4),(121,10,'Book searches','Book searches','Book-related Resources',0,0,0,0,5),(122,10,'Dissertations','Dissertations','Provides access to a repository of rich graduate educational material contributed by a number of member institutions worldwide.',0,0,0,0,6),(123,10,'Databases','Databases','Provide access to open-access abstract and/or full-text databases.',0,0,0,0,7),(124,10,'Relevant portals','Relevant portals','Offer an entry point to other websites.',0,0,0,0,8),(125,10,'Online forums','Online forums','Choose online, open-access online forums that would enrich the context of the research studies on your site.',0,0,0,0,9),(126,10,'Pay-per-view','Pay-per-view','A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC\'s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.',0,0,0,0,10),(127,10,'Media reports','Media reports','Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.',0,0,0,0,11),(128,10,'Web search','Web search','Enter a search term for Internet resources through various search engines.',0,0,0,0,12),(129,11,'Author\'s work','Other Works','Identify other works by the article\'s author(s) by using OAI engines.',0,1,0,0,0),(130,11,'Look up terms','Look up terms','Double click on any word in the text and it will appear in the \"Definition of terms\" box. You can also type or paste a word into the box. Then use the search function to find a definition for the word. These resources have been selected because of their relevance and their open (free) access to all or part of their contents.',0,0,1,0,1),(131,11,'Book searches','Book searches','Book-related Resources',0,0,0,0,2),(132,11,'e-Journals','e-Journals','Provide pop-up window for entering open-access and full-text e-Journals relevant to your field.',0,0,0,0,3),(133,11,'Related theory','Related theory','Access to published scholarly articles and studies in the foundations of education, and in related disciplines outside the field of education, which contribute to the advancement of educational theory.',0,0,0,0,4),(134,11,'Related studies','Related studies','Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.',0,0,0,0,5),(135,11,'Pay-per-view','Pay-per-view','A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC\'s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.',0,0,0,0,6),(136,11,'Online forums','Online forums','Choose online, open-access online forums that would enrich the context of the research studies on your site.',0,0,0,0,7),(137,11,'Multimedia','Multimedia','Multimedia Content',0,0,0,0,8),(138,11,'Teaching files','Instructional','Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.',0,0,0,0,9),(139,11,'Relevant portals','Relevant portals','Education-related Portals',0,0,0,0,10),(140,11,'Government policy','Gov Policy','Access to Information and services gateway run by the Government of the United States and Canada.',0,0,0,0,11),(141,11,'Media reports','Media reports','Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.',0,0,0,0,12),(142,11,'Web search','Web search','Enter a search term for Internet resources through various search engines.',0,0,0,0,13),(143,12,'Author\'s work','Other Works','Identify other works by the article\'s author(s) by using OAI engines.',0,1,0,0,0),(144,12,'Look up terms','Look up terms','Double click on any word in the text and it will appear in the \"Definition of terms\" box.  You can also type or paste a word into the box.  Then use the search function to find a definition for the word.  These resources have been selected because of their relevance and their open (free) access to all or part of their contents.',0,0,1,0,1),(145,12,'Related studies','Related studies','Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.',0,0,0,0,2),(146,12,'Government policy','Gov Policy','Check various government resources.',0,0,0,0,3),(147,12,'Book searches','Book searches','Book-related Resources',0,0,0,0,4),(148,12,'Dissertations','Dissertations','Provides access to a repository of rich graduate educational material contributed by a number of member institutions worldwide.',0,0,0,0,5),(149,12,'Relevant portals','Relevant portals','Offer an entry point to other websites.',0,0,0,0,6),(150,12,'Databases','Databases','Art & Architecture Databases',0,0,0,0,7),(151,12,'Online forums','Online forums','Choose online, open-access online forums that would enrich the context of the research studies on your site.',0,0,0,0,8),(152,12,'Pay-per-view','Pay-per-view','A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC\'s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.',0,0,0,0,9),(153,12,'Teaching files','Teaching files','Provide educators with quick and easy access to the learning objects and lesson materials found in these databases that would help with the teaching of concepts and materials in their field.',0,0,0,0,10),(154,12,'e-Journals','e-Journals','Electronic Journals',0,0,0,0,11),(155,12,'Media reports','Media reports','Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.',0,0,0,0,12),(156,12,'Web search','Web search','Enter a search term for Internet resources through Google search engine.',0,0,0,0,13),(157,13,'Author\'s work','Other Works','Identify other works by the article\'s author(s) by using OAI engines.',0,1,0,0,0),(158,13,'Look up terms','Look up terms','Double click on any word in the text and it will appear in the \"Definition of terms\" box. You can also type or paste a word into the box. Then use the search function to find a definition for the word. These resources have been selected because of their relevance and their open (free) access to all or part of their contents.',0,0,1,0,1),(159,13,'Related studies','Related studies','Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.',0,0,0,0,2),(160,13,'Multimedia','Multimedia','Multimedia content',0,0,0,0,3),(161,13,'Book searches','Book searches','Book-related Resources',0,0,0,0,4),(162,13,'Pay-per-view','Pay-per-view','A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC\'s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.',0,0,0,0,5),(163,13,'Government health sites','Gov Health Sites','Access to health information resources provided by govenment.',0,0,0,0,6),(164,13,'Relevant portals','Relevant portals','Offer an entry point to other websites.',0,0,0,0,7),(165,13,'Databases','Databases','Provide access to open-access abstract and/or full-text databases.',0,0,0,0,8),(166,13,'Online forums','Online forums','Choose online, open-access online forums that would enrich the context of the research studies on your site.',0,0,0,0,9),(167,13,'Teaching files','Instructional','Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.',0,0,0,0,10),(168,13,'Government policy','Gov Policy','Access to Information and services gateway run by the Government of the United States and Canada.',0,0,0,0,11),(169,13,'Media reports','Media reports','Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.',0,0,0,0,12),(170,13,'Web search','Web search','Enter a search term for Internet resources through various search engines.',0,0,0,0,13),(171,14,'Author\'s work','Other Works','Identify other works by the article\'s author(s) by using OAI engines.',0,1,0,0,0),(172,14,'Look up terms','Look up terms','Double click on any word in the text and it will appear in the \"Definition of terms\" box.  You can also type or paste a word into the box.  Then use the search function to find a definition for the word.  These resources have been selected because of their relevance and their open (free) access to all or part of their contents.',0,0,1,0,1),(173,14,'Related studies','Related studies','Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.',0,0,0,0,2),(174,14,'Book searches','Book searches','Book-related Resources',0,0,0,0,3),(175,14,'Databases','Databases','Provide access to open-access abstract and/or full-text databases.',0,0,0,0,4),(176,14,'Relevant portals','Relevant portals','Portals related to chemistry',0,0,0,0,5),(177,14,'Pay-per-view','Pay-per-view','A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC\'s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.',0,0,0,0,6),(178,14,'Online forums','Online forums','Choose online, open-access online forums that would enrich the context of the research studies on your site.',0,0,0,0,7),(179,14,'Teaching files','Instructional','Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.',0,0,0,0,8),(180,14,'Government policy','Gov Policy','Access to Information and services gateway run by the Government of the United States and Canada.',0,0,0,0,9),(181,14,'Media reports','Media reports','Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.',0,0,0,0,10),(182,14,'Web search','Web search','Enter a search term for Internet resources through various search engines.',0,0,0,0,11),(183,15,'Author\'s work','Other Works','Identify other works by the article\'s author(s) by using OAI engines.',0,1,0,0,0),(184,15,'Look up terms','Look up terms','Double click on any word in the text and it will appear in the \"Definition of terms\" box.  You can also type or paste a word into the box.  Then use the search function to find a definition for the word.  These resources have been selected because of their relevance and their open (free) access to all or part of their contents.',0,0,1,0,1),(185,15,'Book searches','Book searches','Book-related Resources',0,0,0,0,2),(186,15,'Cognitive theory','Cognitive theory','Check the encyclopedic entries to give you the foundationof cognitive theory.',0,0,0,0,3),(187,15,'Related studies','Related studies','Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.',0,0,0,0,4),(188,15,'Pay-per-view','Pay-per-view','A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC\'s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.',0,0,0,0,5),(189,15,'Online forums','Online forums','Choose online, open-access online forums that would enrich the context of the research studies on your site.',0,0,0,0,6),(190,15,'Multimedia','Multimedia','Multimedia resources for Cognitive Sciences',0,0,0,0,7),(191,15,'Teaching files','Instructional','Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.',0,0,0,0,8),(192,15,'Government policy','Gov Policy','Access to Information and services gateway run by the Government of the United States and Canada.',0,0,0,0,9),(193,15,'Media reports','Media reports','Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.',0,0,0,0,10),(194,15,'Web search','Web search','Enter a search term for Internet resources through various search engines.',0,0,0,0,11),(195,16,'Author\'s work','Other Works','Identify other works by the article\'s author(s) by using OAI engines.',0,1,0,0,0),(196,16,'Look up terms','Look up terms','Double click on any word in the text and it will appear in the \"Definition of terms\" box.  You can also type or paste a word into the box.  Then use the search function to find a definition for the word.  These resources have been selected because of their relevance and their open (free) access to all or part of their contents.',0,0,1,0,1),(197,16,'Book searches','Book searches','Book-related Resources',0,0,0,0,2),(198,16,'Working papers','Working papers','Search the largest online, free research paper collections in economics.',0,0,0,0,3),(199,16,'Related studies','Related studies','Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.',0,0,0,0,4),(200,16,'Relevant portals','Relevant portals','Offer an entry point to other websites.',0,0,0,0,5),(201,16,'Nat\'l statistics','Nat\'l statistics','Provides access to statistics in economic studies.',0,0,0,0,6),(202,16,'Pay-per-view','Pay-per-view','A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC\'s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.',0,0,0,0,7),(203,16,'Online forums','Online forums','Choose online, open-access online forums that would enrich the context of the research studies on your site.',0,0,0,0,8),(204,16,'Teaching files','Instructional','Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.',0,0,0,0,9),(205,16,'Government policy','Gov Policy','Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.',0,0,0,0,10),(206,16,'Media reports','Media reports','Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.',0,0,0,0,11),(207,16,'Web search','Web search','Enter a search term for Internet resources through various search engines.',0,0,0,0,12),(208,17,'Author\'s work','Other Works','Identify other works by the article\'s author(s) by using OAI engines.',0,1,0,0,0),(209,17,'Look up terms','Look up terms','Double click on any word in the text and it will appear in the \"Definition of terms\" box. You can also type or paste a word into the box. Then use the search function to find a definition for the word. These resources have been selected because of their relevance and their open (free) access to all or part of their contents.',0,0,1,0,1),(210,17,'Book searches','Book searches','Book-related Resources',0,0,0,0,2),(211,17,'Databases','Databases','Databases',0,0,0,0,3),(212,17,'Math theory','Math theory','Access to glossary of terms ranges from undergraduate to research level.',0,0,0,0,4),(213,17,'Related studies','Related studies','Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.',0,0,0,0,5),(214,17,'Pay-per-view','Pay-per-view','A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC\'s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.',0,0,0,0,6),(215,17,'Online forums','Online forums','Choose online, open-access online forums that would enrich the context of the research studies on your site.',0,0,0,0,7),(216,17,'Teaching files','Instructional','Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.',0,0,0,0,8),(217,17,'Government policy','Gov Policy','Access to Information and services gateway run by the Government of the United States and Canada.',0,0,0,0,9),(218,17,'Media reports','Media reports','Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.',0,0,0,0,10),(219,17,'Web search','Web search','Enter a search term for Internet resources through various search engines.',0,0,0,0,11),(220,18,'Author\'s work','Other Works','Identify other works by the article\'s author(s) by using OAI engines.',0,1,0,0,0),(221,18,'Look up terms','Look up terms','Double click on any word in the text and it will appear in the \"Definition of terms\" box. You can also type or paste a word into the box. Then use the search function to find a definition for the word. These resources have been selected because of their relevance and their open (free) access to all or part of their contents.',0,0,1,0,1),(222,18,'Related studies','Related studies','Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.',0,0,0,0,2),(223,18,'Book reviews','Book reviews','Click on the search urls to check for book reviews.',0,0,0,0,3),(224,18,'Pay-per-view','Pay-per-view','A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC\'s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.',0,0,0,0,4),(225,18,'Surveys','Surveys','Access to important surveys in social science.',0,0,0,0,5),(226,18,'Soc sci data','Soc sci data','Provides access to a vast archive of social science data for research and instruction.',0,0,0,0,6),(227,18,'Social theories','Social theories','Search sites contain information on social theories.',0,0,0,0,7),(228,18,'Book searches','Book searches','Book-related Resources',0,0,0,0,8),(229,18,'Databases','Databases','Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.',0,0,0,0,9),(230,18,'Relevant portals','Relevant portals','Relevant portals',0,0,0,0,10),(231,18,'Online forums','Online forums','Choose online, open-access online forums that would enrich the context of the research studies on your site.',0,0,0,0,11),(232,18,'Legal materials','Legal materials','Porvides free Internet access to legal materials of major countries.',0,0,0,0,12),(233,18,'Government policy','Gov Policy','Access to Information and services gateway run by the Government of the United States and Canada.',0,0,0,0,13),(234,18,'Media reports','Media reports','Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.',0,0,0,0,14),(235,18,'Web search','Web search','Enter a search term for Internet resources through various search engines.',0,0,0,0,15),(236,19,'Author\'s work','Other Works','Identify other works by the article\'s author(s) by using OAI engines.',0,1,0,0,0),(237,19,'Look up terms','Look up terms','Double click on any word in the text and it will appear in the \"Definition of terms\" box.  You can also type or paste a word into the box.  Then use the search function to find a definition for the word.  These resources have been selected because of their relevance and their open (free) access to all or part of their contents.',0,0,1,0,1),(238,19,'Related studies','Related studies','Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.',0,0,0,0,2),(239,19,'Government policy','Gov Policy','Check various government resources.',0,0,0,0,3),(240,19,'Book searches','Book searches','Book-related Resources',0,0,0,0,4),(241,19,'Relevant portals','Relevant portals','Offer an entry point to other websites.',0,0,0,0,5),(242,19,'Databases','Databases','Provide access to open-access abstract and/or full-text databases.',0,0,0,0,6),(243,19,'Online forums','Online forums','Choose online, open-access online forums that would enrich the context of the research studies on your site.',0,0,0,0,7),(244,19,'Data sets','Data sets','Provides access to agricultural statistics.',0,0,0,0,8),(245,19,'Pay-per-view','Pay-per-view','A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC\'s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.',0,0,0,0,9),(246,19,'Media reports','Media reports','Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.',0,0,0,0,10),(247,19,'Web search','Web search','Enter search terms for Internet resources through various search engines.',0,0,0,0,11);
/*!40000 ALTER TABLE `rt_contexts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rt_searches`
--

DROP TABLE IF EXISTS `rt_searches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rt_searches` (
  `search_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `title` varchar(120) NOT NULL,
  `description` text,
  `url` text,
  `search_url` text,
  `search_post` text,
  `seq` double NOT NULL,
  PRIMARY KEY (`search_id`),
  KEY `rt_searches_context_id` (`context_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1282 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rt_searches`
--

LOCK TABLES `rt_searches` WRITE;
/*!40000 ALTER TABLE `rt_searches` DISABLE KEYS */;
/*!40000 ALTER TABLE `rt_searches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rt_versions`
--

DROP TABLE IF EXISTS `rt_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rt_versions` (
  `version_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `version_key` varchar(40) NOT NULL,
  `locale` varchar(5) DEFAULT NULL,
  `title` varchar(120) NOT NULL,
  `description` text,
  PRIMARY KEY (`version_id`),
  KEY `rt_versions_journal_id` (`journal_id`),
  KEY `rt_versions_version_key` (`version_key`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rt_versions`
--

LOCK TABLES `rt_versions` WRITE;
/*!40000 ALTER TABLE `rt_versions` DISABLE KEYS */;
INSERT INTO `rt_versions` VALUES (1,1,'Physics','en_US','Physics','The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.'),(2,1,'Astrophysics','en_US','Astrophysics','The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.'),(3,1,'General_Science','en_US','General Science','The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.'),(4,1,'Computer_Science','en_US','Computer Science','The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.'),(5,1,'Humanities','en_US','Humanities','The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.'),(6,1,'Generic','en_US','Generic','The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.'),(7,1,'Business','en_US','Business','The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.'),(8,1,'Environment','en_US','Environment','The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.'),(9,1,'Biology','en_US','Biology','The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.'),(10,1,'Music','en_US','Music','The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.'),(11,1,'Education','en_US','Education','The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.'),(12,1,'Art_Architecture','en_US','Art & Architecture','The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.'),(13,1,'Life_Sciences','en_US','Life Sciences','The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.'),(14,1,'Chemistry','en_US','Chemistry','The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.'),(15,1,'Cognitive_Science','en_US','Cognitive Science','The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.'),(16,1,'Economics','en_US','Economics','The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.'),(17,1,'Mathematics','en_US','Mathematics','The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.'),(18,1,'Social_Sciences','en_US','Social Sciences','The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.'),(19,1,'Agriculture','en_US','Agriculture','The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.');
/*!40000 ALTER TABLE `rt_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduled_tasks`
--

DROP TABLE IF EXISTS `scheduled_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduled_tasks` (
  `class_name` varchar(255) NOT NULL,
  `last_run` datetime DEFAULT NULL,
  UNIQUE KEY `scheduled_tasks_pkey` (`class_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduled_tasks`
--

LOCK TABLES `scheduled_tasks` WRITE;
/*!40000 ALTER TABLE `scheduled_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `scheduled_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section_editors`
--

DROP TABLE IF EXISTS `section_editors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section_editors` (
  `journal_id` bigint(20) NOT NULL,
  `section_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `can_edit` tinyint(4) NOT NULL,
  `can_review` tinyint(4) NOT NULL,
  UNIQUE KEY `section_editors_pkey` (`journal_id`,`section_id`,`user_id`),
  KEY `section_editors_journal_id` (`journal_id`),
  KEY `section_editors_section_id` (`section_id`),
  KEY `section_editors_user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section_editors`
--

LOCK TABLES `section_editors` WRITE;
/*!40000 ALTER TABLE `section_editors` DISABLE KEYS */;
/*!40000 ALTER TABLE `section_editors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section_settings`
--

DROP TABLE IF EXISTS `section_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section_settings` (
  `section_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `section_settings_pkey` (`section_id`,`locale`,`setting_name`),
  KEY `section_settings_section_id` (`section_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section_settings`
--

LOCK TABLES `section_settings` WRITE;
/*!40000 ALTER TABLE `section_settings` DISABLE KEYS */;
INSERT INTO `section_settings` VALUES (1,'en_US','title','Articles','string'),(1,'en_US','abbrev','ART','string'),(1,'en_US','policy','','string');
/*!40000 ALTER TABLE `section_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `section_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `review_form_id` bigint(20) DEFAULT NULL,
  `seq` double NOT NULL,
  `editor_restricted` tinyint(4) NOT NULL,
  `meta_indexed` tinyint(4) NOT NULL,
  `meta_reviewed` tinyint(4) NOT NULL,
  `abstracts_not_required` tinyint(4) NOT NULL,
  `hide_title` tinyint(4) NOT NULL,
  `hide_author` tinyint(4) NOT NULL,
  `hide_about` tinyint(4) NOT NULL,
  `disable_comments` tinyint(4) NOT NULL,
  `abstract_word_count` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`section_id`),
  KEY `sections_journal_id` (`journal_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,1,NULL,0,0,1,1,0,0,0,0,0,0);
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `session_id` varchar(40) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `ip_address` varchar(39) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `created` bigint(20) NOT NULL,
  `last_used` bigint(20) NOT NULL,
  `remember` tinyint(4) NOT NULL,
  `data` text,
  UNIQUE KEY `sessions_pkey` (`session_id`),
  KEY `sessions_user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('7asi0hm1eg8sisrli69ae4oh91erj80n',1,'160.45.170.42','0',1327344962,1327344963,0,'userId|s:1:\"1\";username|s:5:\"admin\";'),('9qndi5fpaiji9ldn9c79q3hu6upgn1cr',1,'160.45.170.42','0',1327344961,1327344961,0,'userId|s:1:\"1\";username|s:5:\"admin\";'),('klb63vf1ces6p5mtggrusgcql4sj5l8p',1,'160.45.170.42','0',1327344960,1327344960,0,'userId|s:1:\"1\";username|s:5:\"admin\";'),('ne52d7vlbuljh7l3oipvr6nrge5q24sb',NULL,'160.45.170.42','0',1327344960,1327344960,0,''),('m60h91cm2lf783ba29rmet6j1kgg7ubt',NULL,'160.45.170.42','0',1327344585,1327344585,0,''),('f8kinjjorhrc8qkhotfp1gqvu54j6gh2',1,'177.115.107.211','Mozilla/5.0 (Ubuntu; X11; Linux x86_64; rv:9.0.1) Gecko/20100101 Firefox/9.0.1',1327344766,1327347129,0,'userId|s:1:\"1\";username|s:5:\"admin\";'),('lajc08v8naei2kb9mud4jhpc9ju96rjj',NULL,'160.45.170.42','0',1327344583,1327344584,0,''),('vutsr1th2d3mv0c0812tab7se31g0sgf',NULL,'160.45.170.42','0',1327344584,1327344584,0,''),('vucifras39aljjoksdrc7m303m3m42hn',NULL,'160.45.170.42','0',1327344566,1327344567,0,''),('g622gtsih7tmnftvt7r7oaf9ug4m3ii1',NULL,'160.45.170.42','0',1327344567,1327344568,0,''),('pnnr2nf62m0gbua2f1oo7fgd2m3p8t63',NULL,'160.45.170.42','0',1327344580,1327344580,0,''),('df410dqqp11l7eot6q77qot152oh6rd5',NULL,'160.45.170.42','0',1327344563,1327344563,0,''),('1c48gl5924bh7qqk8d28oq94rbu177aa',NULL,'160.45.170.42','0',1327344564,1327344564,0,''),('jont9eqr8ep0qo8cp9kcmrkkrd91pqq3',NULL,'160.45.170.42','0',1327344565,1327344565,0,''),('t6c98pkfocl6ju693i8jbkkhs91d673j',NULL,'160.45.170.42','0',1327344527,1327344527,0,''),('5de0lmo12gibga6qabi5um29ea5lr4uo',NULL,'160.45.170.42','0',1327344528,1327344528,0,''),('967lkfhpc38mo8fm1hs0sq9mm6cerr7o',NULL,'160.45.170.42','0',1327344547,1327344548,0,''),('epds7dplbrf8i8f7h13439n6nb75epoo',NULL,'160.45.170.42','0',1327344548,1327344548,0,''),('8go638kslpkkh0aodubcgeqb39o25pmj',NULL,'160.45.170.42','0',1327344549,1327344549,0,''),('99feit6qb7tr2hkkvevemd20v1qc1ap7',NULL,'160.45.170.42','0',1327344550,1327344551,0,''),('sddv7gfj0asbtvu4lhogm90qlhghbi7s',NULL,'160.45.170.42','0',1327344552,1327344552,0,''),('sb1126ur3iglgqkajs1uqd99amimsktn',1,'160.45.170.42','Mozilla/5.0 (X11; U; Linux i686 (x86_64); en-US; rv:1.9.1.9) Gecko/20100317 SUSE/3.5.9-0.4.1 Firefox/3.5.9',1327344553,1327344969,0,'userId|s:1:\"1\";username|s:5:\"admin\";'),('5f69f0fao7dtpf2frdtnv44foi4l44se',NULL,'66.249.66.101','Googlebot/2.1 (+http://www.google.com/bot.html)',1327345912,1327345912,0,''),('n50r9ej4plqbrfo3rqgdmaq958t8g2q9',1,'160.45.170.42','0',1327346460,1327346461,0,'userId|s:1:\"1\";username|s:5:\"admin\";'),('1q82tp88lvk3k22f9li2j12575i4dg35',1,'160.45.170.42','0',1327346572,1327346572,0,'userId|s:1:\"1\";username|s:5:\"admin\";'),('7tdl32og3nuqkcdsq1fc5bd7cf3gs9mp',1,'160.45.170.42','0',1327346581,1327346581,0,'userId|s:1:\"1\";username|s:5:\"admin\";'),('g694db5omitfpm20obh0iv4vvo71bvci',1,'160.45.170.42','0',1327346608,1327346608,0,'userId|s:1:\"1\";username|s:5:\"admin\";'),('fge0onji07ptmfg9nebof2gptb63hdsu',1,'160.45.170.42','Mozilla/5.0 (X11; U; Linux i686 (x86_64); en-US; rv:1.9.1.9) Gecko/20100317 SUSE/3.5.9-0.4.1 Firefox/3.5.9',1327346682,1327347032,0,'userId|s:1:\"1\";username|s:5:\"admin\";'),('kfhd342jqdpcs7vosojvom6g21',1,'127.0.0.1','Mozilla/5.0 (X11; U; Linux i686; de; rv:1.9.1.16) Gecko/20111108 Iceweasel/3.5.16 (like Firefox/3.5.16)',1327401204,1327401319,0,'7OgVn2j8rbae-vXaihyxbAn4-H-74VAn1RZaMOwoXNRRk8qiqymW2l_MrSJGZdKE22oK7cNNz2WdInmMbV9pWA..'),('n9rjnmjoon3dr67f68mia8q005',1,'127.0.0.1','Mozilla/5.0 (X11; U; Linux i686; de; rv:1.9.1.16) Gecko/20120201 Iceweasel/3.5.16 (like Firefox/3.5.16)',1329756175,1329756234,0,'userId|s:1:\"1\";username|s:5:\"admin\";');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signoffs`
--

DROP TABLE IF EXISTS `signoffs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `signoffs` (
  `signoff_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `symbolic` varchar(32) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `file_id` bigint(20) DEFAULT NULL,
  `file_revision` bigint(20) DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `date_underway` datetime DEFAULT NULL,
  `date_completed` datetime DEFAULT NULL,
  `date_acknowledged` datetime DEFAULT NULL,
  `user_group_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`signoff_id`),
  UNIQUE KEY `signoff_symbolic` (`assoc_type`,`assoc_id`,`symbolic`,`user_id`,`user_group_id`,`file_id`,`file_revision`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signoffs`
--

LOCK TABLES `signoffs` WRITE;
/*!40000 ALTER TABLE `signoffs` DISABLE KEYS */;
INSERT INTO `signoffs` VALUES (1,'SIGNOFF_COPYEDITING_INITIAL',257,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'SIGNOFF_COPYEDITING_AUTHOR',257,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'SIGNOFF_COPYEDITING_FINAL',257,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'SIGNOFF_LAYOUT',257,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'SIGNOFF_PROOFREADING_AUTHOR',257,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'SIGNOFF_PROOFREADING_PROOFREADER',257,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'SIGNOFF_PROOFREADING_LAYOUT',257,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'SIGNOFF_COPYEDITING_INITIAL',257,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'SIGNOFF_COPYEDITING_AUTHOR',257,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'SIGNOFF_COPYEDITING_FINAL',257,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'SIGNOFF_LAYOUT',257,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,'SIGNOFF_PROOFREADING_AUTHOR',257,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,'SIGNOFF_PROOFREADING_PROOFREADER',257,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'SIGNOFF_PROOFREADING_LAYOUT',257,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `signoffs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site` (
  `redirect` bigint(20) NOT NULL,
  `primary_locale` varchar(5) NOT NULL,
  `min_password_length` tinyint(4) NOT NULL,
  `installed_locales` varchar(255) NOT NULL,
  `supported_locales` varchar(255) DEFAULT NULL,
  `original_style_file_name` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site`
--

LOCK TABLES `site` WRITE;
/*!40000 ALTER TABLE `site` DISABLE KEYS */;
INSERT INTO `site` VALUES (0,'en_US',6,'de_DE:en_US','de_DE:en_US',NULL);
/*!40000 ALTER TABLE `site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_settings`
--

DROP TABLE IF EXISTS `site_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_settings` (
  `setting_name` varchar(255) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `site_settings_pkey` (`setting_name`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_settings`
--

LOCK TABLES `site_settings` WRITE;
/*!40000 ALTER TABLE `site_settings` DISABLE KEYS */;
INSERT INTO `site_settings` VALUES ('title','en_US','Open Journal Systems','string'),('contactName','en_US','Open Journal Systems','string'),('contactEmail','en_US','jerico.dev@gmail.com','string');
/*!40000 ALTER TABLE `site_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `static_page_settings`
--

DROP TABLE IF EXISTS `static_page_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `static_page_settings` (
  `static_page_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` longtext,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `static_page_settings_pkey` (`static_page_id`,`locale`,`setting_name`),
  KEY `static_page_settings_static_page_id` (`static_page_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `static_page_settings`
--

LOCK TABLES `static_page_settings` WRITE;
/*!40000 ALTER TABLE `static_page_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `static_page_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `static_pages`
--

DROP TABLE IF EXISTS `static_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `static_pages` (
  `static_page_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  PRIMARY KEY (`static_page_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `static_pages`
--

LOCK TABLES `static_pages` WRITE;
/*!40000 ALTER TABLE `static_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `static_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_type_settings`
--

DROP TABLE IF EXISTS `subscription_type_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription_type_settings` (
  `type_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `subscription_type_settings_pkey` (`type_id`,`locale`,`setting_name`),
  KEY `subscription_type_settings_type_id` (`type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_type_settings`
--

LOCK TABLES `subscription_type_settings` WRITE;
/*!40000 ALTER TABLE `subscription_type_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_type_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_types`
--

DROP TABLE IF EXISTS `subscription_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription_types` (
  `type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `cost` double NOT NULL,
  `currency_code_alpha` varchar(3) NOT NULL,
  `non_expiring` tinyint(4) NOT NULL,
  `duration` smallint(6) DEFAULT NULL,
  `format` smallint(6) NOT NULL,
  `institutional` tinyint(4) NOT NULL,
  `membership` tinyint(4) NOT NULL,
  `disable_public_display` tinyint(4) NOT NULL,
  `seq` double NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_types`
--

LOCK TABLES `subscription_types` WRITE;
/*!40000 ALTER TABLE `subscription_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriptions` (
  `subscription_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `type_id` bigint(20) NOT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `membership` varchar(40) DEFAULT NULL,
  `reference_number` varchar(40) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`subscription_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temporary_files`
--

DROP TABLE IF EXISTS `temporary_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temporary_files` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `file_name` varchar(90) NOT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `file_size` bigint(20) NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL,
  PRIMARY KEY (`file_id`),
  KEY `temporary_files_user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temporary_files`
--

LOCK TABLES `temporary_files` WRITE;
/*!40000 ALTER TABLE `temporary_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `temporary_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theses`
--

DROP TABLE IF EXISTS `theses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `theses` (
  `thesis_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `status` smallint(6) NOT NULL,
  `degree` smallint(6) NOT NULL,
  `degree_name` varchar(255) DEFAULT NULL,
  `department` varchar(255) NOT NULL,
  `university` varchar(255) NOT NULL,
  `date_approved` datetime NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` text,
  `abstract` text,
  `comment` text,
  `student_first_name` varchar(40) NOT NULL,
  `student_middle_name` varchar(40) DEFAULT NULL,
  `student_last_name` varchar(90) NOT NULL,
  `student_email` varchar(90) NOT NULL,
  `student_email_publish` tinyint(4) DEFAULT NULL,
  `student_bio` text,
  `supervisor_first_name` varchar(40) NOT NULL,
  `supervisor_middle_name` varchar(40) DEFAULT NULL,
  `supervisor_last_name` varchar(90) NOT NULL,
  `supervisor_email` varchar(90) NOT NULL,
  `discipline` varchar(255) DEFAULT NULL,
  `subject_class` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `coverage_geo` varchar(255) DEFAULT NULL,
  `coverage_chron` varchar(255) DEFAULT NULL,
  `coverage_sample` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `date_submitted` datetime NOT NULL,
  PRIMARY KEY (`thesis_id`),
  KEY `theses_journal_id` (`journal_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theses`
--

LOCK TABLES `theses` WRITE;
/*!40000 ALTER TABLE `theses` DISABLE KEYS */;
/*!40000 ALTER TABLE `theses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_interests`
--

DROP TABLE IF EXISTS `user_interests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_interests` (
  `user_id` bigint(20) NOT NULL,
  `controlled_vocab_entry_id` bigint(20) NOT NULL,
  UNIQUE KEY `u_e_pkey` (`user_id`,`controlled_vocab_entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_interests`
--

LOCK TABLES `user_interests` WRITE;
/*!40000 ALTER TABLE `user_interests` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_interests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_settings`
--

DROP TABLE IF EXISTS `user_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_settings` (
  `user_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `user_settings_pkey` (`user_id`,`locale`,`setting_name`,`assoc_type`,`assoc_id`),
  KEY `user_settings_user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_settings`
--

LOCK TABLES `user_settings` WRITE;
/*!40000 ALTER TABLE `user_settings` DISABLE KEYS */;
INSERT INTO `user_settings` VALUES (1,'','filterEditor',256,1,'0','int'),(1,'','filterSection',256,1,'0','int');
/*!40000 ALTER TABLE `user_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salutation` varchar(40) DEFAULT NULL,
  `first_name` varchar(40) NOT NULL,
  `middle_name` varchar(40) DEFAULT NULL,
  `last_name` varchar(90) NOT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `initials` varchar(5) DEFAULT NULL,
  `email` varchar(90) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `phone` varchar(24) DEFAULT NULL,
  `fax` varchar(24) DEFAULT NULL,
  `mailing_address` varchar(255) DEFAULT NULL,
  `billing_address` varchar(255) DEFAULT NULL,
  `country` varchar(90) DEFAULT NULL,
  `locales` varchar(255) DEFAULT NULL,
  `date_last_email` datetime DEFAULT NULL,
  `date_registered` datetime NOT NULL,
  `date_validated` datetime DEFAULT NULL,
  `date_last_login` datetime NOT NULL,
  `must_change_password` tinyint(4) DEFAULT NULL,
  `auth_id` bigint(20) DEFAULT NULL,
  `auth_str` varchar(255) DEFAULT NULL,
  `disabled` tinyint(4) NOT NULL,
  `disabled_reason` text,
  `suffix` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `users_username` (`username`),
  UNIQUE KEY `users_email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','237cdeb8d6968f127714c572f0c5424b8f903f30',NULL,'admin',NULL,'',NULL,NULL,'jerico.dev@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2011-10-06 08:45:41',NULL,'2012-02-20 17:43:03',0,NULL,NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `versions` (
  `major` int(11) NOT NULL,
  `minor` int(11) NOT NULL,
  `revision` int(11) NOT NULL,
  `build` int(11) NOT NULL,
  `date_installed` datetime NOT NULL,
  `current` tinyint(4) NOT NULL,
  `product_type` varchar(30) DEFAULT NULL,
  `product` varchar(30) DEFAULT NULL,
  `product_class_name` varchar(80) DEFAULT NULL,
  `lazy_load` tinyint(4) NOT NULL,
  `sitewide` tinyint(4) NOT NULL,
  UNIQUE KEY `versions_pkey` (`product_type`,`product`,`major`,`minor`,`revision`,`build`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
INSERT INTO `versions` VALUES (1,0,0,0,'2011-10-06 08:45:41',1,'plugins.metadata','dc11','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.metadata','mods34','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.metadata','nlm30','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.metadata','openurl10','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.auth','ldap','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.blocks','readingTools','ReadingToolsBlockPlugin',1,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.blocks','notification','NotificationBlockPlugin',1,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.blocks','keywordCloud','KeywordCloudBlockPlugin',1,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.blocks','relatedItems','RelatedItemsBlockPlugin',1,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.blocks','subscription','SubscriptionBlockPlugin',1,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.blocks','navigation','NavigationBlockPlugin',1,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.blocks','authorBios','AuthorBiosBlockPlugin',1,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.blocks','role','RoleBlockPlugin',1,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.blocks','user','UserBlockPlugin',1,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.blocks','information','InformationBlockPlugin',1,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.blocks','donation','DonationBlockPlugin',1,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.blocks','help','HelpBlockPlugin',1,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.blocks','developedBy','DevelopedByBlockPlugin',1,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.blocks','languageToggle','LanguageToggleBlockPlugin',1,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.blocks','fontSize','FontSizeBlockPlugin',1,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.citationFormats','bibtex','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.citationFormats','cbe','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.citationFormats','turabian','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.citationFormats','proCite','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.citationFormats','abnt','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.citationFormats','refWorks','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.citationFormats','apa','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.citationFormats','endNote','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.citationFormats','refMan','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.citationFormats','mla','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.citationLookup','pubmed','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.citationLookup','worldcat','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.citationLookup','crossref','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.citationLookup','isbndb','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.citationOutput','vancouver','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.citationOutput','abnt','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.citationOutput','apa','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.citationOutput','mla','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.citationParser','paracite','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.citationParser','regex','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.citationParser','parscit','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.citationParser','freecite','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.gateways','metsGateway','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.gateways','resolver','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.generic','coins','CoinsPlugin',1,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.generic','announcementFeed','AnnouncementFeedPlugin',1,0),(1,1,0,0,'2011-10-06 08:45:41',1,'plugins.generic','openAIRE','OpenAIREPlugin',1,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.generic','booksForReview','BooksForReviewPlugin',1,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.generic','roundedCorners','RoundedCornersPlugin',1,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.generic','referral','ReferralPlugin',1,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.generic','sehl','SehlPlugin',1,0),(1,2,0,0,'2011-10-06 08:45:41',1,'plugins.generic','staticPages','StaticPagesPlugin',1,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.generic','translator','TranslatorPlugin',1,1),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.generic','xmlGalley','XmlGalleyPlugin',1,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.generic','thesis','ThesisPlugin',1,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.generic','tinymce','TinyMCEPlugin',1,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.generic','customLocale','CustomLocalePlugin',1,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.generic','sword','SwordPlugin',1,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.generic','externalFeed','ExternalFeedPlugin',1,0),(1,1,0,0,'2011-10-06 08:45:41',1,'plugins.generic','customBlockManager','CustomBlockManagerPlugin',1,0),(1,1,0,0,'2011-10-06 08:45:41',1,'plugins.generic','counter','CounterPlugin',1,1),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.generic','openAds','OpenAdsPlugin',1,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.generic','thesisFeed','ThesisFeedPlugin',1,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.generic','googleAnalytics','GoogleAnalyticsPlugin',1,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.generic','webFeed','WebFeedPlugin',1,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.generic','phpMyVisites','PhpMyVisitesPlugin',1,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.implicitAuth','shibboleth','',0,1),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.importexport','quickSubmit','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.importexport','users','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.importexport','pubmed','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.importexport','duracloud','',0,0),(1,1,0,0,'2011-10-06 08:45:41',1,'plugins.importexport','crossref','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.importexport','native','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.importexport','doaj','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.importexport','mets','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.importexport','erudit','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.oaiMetadataFormats','marcxml','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.oaiMetadataFormats','nlm','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.oaiMetadataFormats','marc','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.oaiMetadataFormats','rfc1807','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.oaiMetadataFormats','dc','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.paymethod','paypal','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.paymethod','manual','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.reports','views','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.reports','reviews','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.reports','subscriptions','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.reports','articles','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.themes','classicGreen','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.themes','vanilla','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.themes','custom','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.themes','redbar','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.themes','classicNavy','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.themes','lilac','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.themes','classicBlue','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.themes','desert','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.themes','classicBrown','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.themes','steel','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.themes','night','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.themes','uncommon','',0,0),(1,0,0,0,'2011-10-06 08:45:41',1,'plugins.themes','classicRed','',0,0),(1,0,0,0,'2011-10-17 18:19:59',1,'plugins.generic','driver','DRIVERPlugin',1,0),(1,0,0,0,'2011-10-19 06:50:29',1,'plugins.generic','browse','',0,0),(2,4,0,0,'2011-10-19 06:49:40',1,'core','ojs2','',0,1),(1,0,0,0,'2011-11-14 19:12:43',1,'plugins.generic','piwik','PiwikPlugin',1,0),(1,0,0,0,'2012-01-05 17:01:24',1,'plugins.importexport','medra','',0,0),(1,0,0,0,'2012-01-05 17:01:24',1,'plugins.importexport','datacite','',0,0),(1,0,0,0,'2012-01-12 14:30:30',1,'plugins.importexport','pubIds','',0,0),(1,0,0,0,'2012-01-23 19:41:09',1,'plugins.pubIds','doi','DOIPubIdPlugin',1,0),(1,0,0,0,'2012-01-24 11:33:02',1,'plugins.pubIds','urn','URNPubIdPlugin',1,0);
/*!40000 ALTER TABLE `versions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-01-24 17:44:46