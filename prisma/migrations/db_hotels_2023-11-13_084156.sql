-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: db_hotels
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `_prisma_migrations`
--

DROP TABLE IF EXISTS `_prisma_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_prisma_migrations`
--

/*!40000 ALTER TABLE `_prisma_migrations` DISABLE KEYS */;
INSERT INTO `_prisma_migrations` VALUES ('0f5b04cc-4538-4526-81cd-b4b5cc8556cb','eec5fd341419cdb9056c321c012903c1fbfa72ef77751a2617b20ebdea2b15d1','2023-11-07 17:44:12.694','20231107165145_new_tables',NULL,NULL,'2023-11-07 17:44:10.516',1),('20aaa166-7c2b-42c1-8a3e-797a8cf23d00','3763961aa73dcfac5cf6f79c16a5f7e767b7b55290ce93fdd64f39c52122acc9','2023-11-07 17:44:10.510','0_init',NULL,NULL,'2023-11-07 17:44:08.201',1),('629bb241-6e57-45c5-90c9-8fe6b1e9aa3b','3f0d830164289bcb097896f2027be25d8fb35d0ee40fa4f2f240b5d6ae0f07ab','2023-11-07 17:44:21.371','20231107174421_drop_table_photos',NULL,NULL,'2023-11-07 17:44:21.200',1);
/*!40000 ALTER TABLE `_prisma_migrations` ENABLE KEYS */;

--
-- Table structure for table `comfort`
--

DROP TABLE IF EXISTS `comfort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comfort` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comfort`
--

/*!40000 ALTER TABLE `comfort` DISABLE KEYS */;
INSERT INTO `comfort` VALUES (1,'WiFi'),(2,'TV'),(3,'Air Conditioning');
/*!40000 ALTER TABLE `comfort` ENABLE KEYS */;

--
-- Table structure for table `comfortPlusHouse`
--

DROP TABLE IF EXISTS `comfortPlusHouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comfortPlusHouse` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `house_id` int unsigned DEFAULT NULL,
  `comfort_id` int unsigned DEFAULT NULL,
  `status` enum('true','false') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comfort_id` (`comfort_id`),
  KEY `house_id` (`house_id`),
  CONSTRAINT `comfortPlusHouse_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `house` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comfortPlusHouse_ibfk_2` FOREIGN KEY (`comfort_id`) REFERENCES `comfort` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comfortPlusHouse`
--

/*!40000 ALTER TABLE `comfortPlusHouse` DISABLE KEYS */;
INSERT INTO `comfortPlusHouse` VALUES (1,1,3,'true'),(2,2,1,'true'),(3,2,2,'true'),(4,1,2,'true'),(5,3,3,'false');
/*!40000 ALTER TABLE `comfortPlusHouse` ENABLE KEYS */;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `roomN` smallint unsigned DEFAULT NULL,
  `placeN` smallint unsigned DEFAULT NULL,
  `description` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_inf` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_hotel_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES (1,'Grand Hotel 1','Sample Address 1',50,100,'Hotel Description 1','Contact Info 1','https://images.unsplash.com/photo-1543968332-f99478b1ebdc?auto=format&fit=crop&q=80&w=2070&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),(2,'Milli Hotel','Sample Address 2',60,120,'Hotel Description 2','Contact Info 2','https://images.unsplash.com/photo-1455587734955-081b22074882?auto=format&fit=crop&q=80&w=1920&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),(3,'Wivien Hotel','Sample Address 3',45,90,'Hotel Description 3','Contact Info 3','https://images.unsplash.com/photo-1544124499-58912cbddaad?auto=format&fit=crop&q=80&w=1935&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),(4,'AAA Hotel','Sample Address 4',50,110,'Hotel Description 4','Contact Info 4','https://images.unsplash.com/photo-1543321269-9d86d3680e1c?auto=format&fit=crop&q=80&w=2070&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),(5,'All Mall','Sample Address 5',100,200,'Hotel Description 5','Contact Info 5','https://images.unsplash.com/photo-1562809896-1b1514f40708?auto=format&fit=crop&q=80&w=1781&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),(6,'Paris Hotel','Sample Address 6',48,140,'Hotel Description 6','Contact Info 6','https://images.unsplash.com/photo-1570107515092-7000ae2e6d1a?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),(7,'Beach Hotel','Sample Address 7',35,70,'Hotel Description 7','Contact Info 7','https://images.unsplash.com/photo-1572552719565-651d9a1bca94?q=80&w=1806&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),(8,'My Hotel','Sample Address 8',80,190,'Hotel Description 8','Contact Info 8','https://images.unsplash.com/photo-1599722585837-c1cb8eea32ff?q=80&w=1780&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),(9,'Madrid Hotel','Sample Address 9',64,135,'Hotel Description 9','Contact Info 9','https://images.unsplash.com/photo-1490122417551-6ee9691429d0?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;

--
-- Table structure for table `house`
--

DROP TABLE IF EXISTS `house`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `house` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `roomN` smallint unsigned DEFAULT NULL,
  `placeN` smallint unsigned DEFAULT NULL,
  `description` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_inf` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('free','occupied') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` smallint unsigned DEFAULT NULL,
  `photo` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_house_num` (`roomN`,`placeN`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `house`
--

/*!40000 ALTER TABLE `house` DISABLE KEYS */;
INSERT INTO `house` VALUES (1,'Sample House 1','Cozy Cottage',3,6,'House Description 1','Contact Info 1','free',150,'{\"main\": \"https://raw.githubusercontent.com/emanhamed/Houses-dataset/master/Houses%20Dataset/100_frontal.jpg\", \"other\": \"\"}'),(2,'Sample House 2','Mountain Retreat',2,4,'House Description 2','Contact Info 2','free',120,'{\"main\": \"https://raw.githubusercontent.com/emanhamed/Houses-dataset/master/Houses%20Dataset/101_frontal.jpg\", \"other\": \"\"}'),(3,'Sample House 3','Beach Villa',4,8,'House Description 3','Contact Info 3','occupied',200,'{\"main\": \"https://raw.githubusercontent.com/emanhamed/Houses-dataset/master/Houses%20Dataset/102_frontal.jpg\", \"other\": \"\"}');
/*!40000 ALTER TABLE `house` ENABLE KEYS */;

--
-- Table structure for table `payCheck`
--

DROP TABLE IF EXISTS `payCheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payCheck` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reservation_id` int unsigned DEFAULT NULL,
  `sum` smallint unsigned DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `payType` enum('cash','debit_card','online_wallet') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reservation_id` (`reservation_id`),
  CONSTRAINT `payCheck_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payCheck`
--

/*!40000 ALTER TABLE `payCheck` DISABLE KEYS */;
INSERT INTO `payCheck` VALUES (1,1,300,'2023-11-07 12:00:00','online_wallet'),(2,2,240,'2023-11-08 14:30:00','debit_card'),(3,3,150,'2023-11-09 10:15:00','cash');
/*!40000 ALTER TABLE `payCheck` ENABLE KEYS */;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `object_id` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` enum('active','denied','end') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sum` smallint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `object_id` (`object_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`object_id`) REFERENCES `reservation_object` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,1,1,'2023-11-07','2023-11-10','active',300),(2,2,2,'2023-11-08','2023-11-12','active',240),(3,2,3,'2023-11-09','2023-11-14','denied',150);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;

--
-- Table structure for table `reservation_object`
--

DROP TABLE IF EXISTS `reservation_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation_object` (
  `id` int NOT NULL AUTO_INCREMENT,
  `house_id` int unsigned DEFAULT NULL,
  `room_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `house_id` (`house_id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `reservation_object_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `house` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reservation_object_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_object`
--

/*!40000 ALTER TABLE `reservation_object` DISABLE KEYS */;
INSERT INTO `reservation_object` VALUES (1,1,2),(2,2,1),(3,3,1);
/*!40000 ALTER TABLE `reservation_object` ENABLE KEYS */;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `object_id` int DEFAULT NULL,
  `rate` tinyint DEFAULT NULL,
  `text` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `object_id` (`object_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`object_id`) REFERENCES `reservation_object` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,1,1,4,'Great experience!','2023-11-10 15:45:00'),(2,2,2,5,'Perfect stay!','2023-11-12 09:30:00'),(3,3,3,2,'Disappointed','2023-11-15 11:20:00');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'user'),(2,'admin'),(3,'manager');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `hotel_id` int unsigned DEFAULT NULL,
  `placeN` smallint unsigned DEFAULT NULL,
  `status` enum('free','occupied') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` smallint unsigned DEFAULT NULL,
  `photo` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_id` (`hotel_id`),
  CONSTRAINT `room_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,1,2,'free','Room Description 1',75,'{\"main\": \"https://a0.muscache.com/im/pictures/e5f6a006-ed2c-46f7-81cc-b5f3d713d9c1.jpg\", \"other\": \"\"}'),(2,1,2,'occupied','Room Description 2',85,'{\"main\": \"https://a0.muscache.com/im/pictures/1c14cee3-aa96-436a-a39a-7206291eb371.jpg\", \"other\": \"\"}'),(3,2,3,'free','Room Description 3',95,'{\"main\": \"https://a0.muscache.com/im/pictures/3ffecb5f-27b6-4519-9226-d125330d7bbb.jpg\", \"other\": \"\"}');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'John Doe','john@example.com','password123',2),(2,'Jane Smith','jane@example.com','letmein456',2),(3,'Bob Johnson','bob@example.com ','45hope1955',3);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

--
-- Dumping routines for database 'db_hotels'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-13  8:42:28
