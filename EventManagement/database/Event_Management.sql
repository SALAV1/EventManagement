CREATE DATABASE  IF NOT EXISTS `eventmanagement` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `eventmanagement`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: eventmanagement
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_name` varchar(200) NOT NULL,
  `startdate` date DEFAULT NULL,
  `starttime` varchar(10) DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `endtime` varchar(10) DEFAULT NULL,
  `venuename` varchar(200) DEFAULT NULL,
  `fee` bigint(20) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `tickets` int(11) DEFAULT NULL,
  `sold` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `header` varchar(100) DEFAULT NULL,
  `advanceddetails` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (1,'Workshop lộ trình tự học IELTS từ cơ bản đến nâng cao','2021-04-17','15:00','2021-04-17','16:30','VICTORIA ENGLISH - 228 Trần Hưng Đạo, Q. Sơn Trà, TP. Đà Nẵng.',100000,'Chương trình tư vấn và hỗ trợ học tập IELTS của Victoria English dành cho sinh viên Đà Nẵng :<br>-Hướng dẫn xây dựng cách tự học tiếng Anh hiệu quả<br>-Hướng dẫn xây dựng nền móng tiếng Anh cơ bản<br>-Tư vấn lộ trình cá nhân hóa cho việc học IELTS<br>-Hỗ trợ tài liệu học IELTS',50,0,'Published','Chương trình tư vấn và hỗ trợ học tập IELTS của Victoria English dành cho sinh viên Đà Nẵng',''),(2,'Khai trương trung tâm thương mại','2021-07-16','8:00','2021-07-16','10:00','VICTORIA - 228 Trần Hưng Đạo, Q. Sơn Trà, TP. Đà Nẵng.',0,'Nhiều ưu đãi hấp dẫn:\n- Sale nhiều mặt hàng\n- Qùa tặng',0,0,'Published','Miễn phí vào cổng','');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `register_event`
--

DROP TABLE IF EXISTS `register_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `register_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `count_tickets` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `event_id` (`event_id`),
  CONSTRAINT `register_event_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `register_event_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `register_event`
--

LOCK TABLES `register_event` WRITE;
/*!40000 ALTER TABLE `register_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `register_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_MEMBER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `enable` int(11) DEFAULT '1',
  `fullname` varchar(50) NOT NULL,
  `address` varchar(20) DEFAULT NULL,
  `phonenumber` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','$2a$10$cYLM.qoXpeAzcZhJ3oXRLu9Slkb61LHyWW5qJ4QKvHEMhaxZ5qCPi',1,1,'',NULL,NULL),(2,'user1','$2a$10$cYLM.qoXpeAzcZhJ3oXRLu9Slkb61LHyWW5qJ4QKvHEMhaxZ5qCPi',2,1,'Nguyen','Can Tho','00998778'),(3,'user2','$2a$10$cYLM.qoXpeAzcZhJ3oXRLu9Slkb61LHyWW5qJ4QKvHEMhaxZ5qCPi',2,1,'Nguyen','Can Tho','00998778');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-15  7:09:53
