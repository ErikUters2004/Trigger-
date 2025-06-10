CREATE DATABASE  IF NOT EXISTS `trigger` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `trigger`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: trigger
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bestellingen`
--

DROP TABLE IF EXISTS `bestellingen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bestellingen` (
  `id` int NOT NULL AUTO_INCREMENT,
  `klant_id` int DEFAULT NULL,
  `product` varchar(100) DEFAULT NULL,
  `bedrag` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `klant_id` (`klant_id`),
  CONSTRAINT `bestellingen_ibfk_1` FOREIGN KEY (`klant_id`) REFERENCES `klanten` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bestellingen`
--

LOCK TABLES `bestellingen` WRITE;
/*!40000 ALTER TABLE `bestellingen` DISABLE KEYS */;
INSERT INTO `bestellingen` VALUES (1,1,'Laptop',999.99),(2,1,'Monitor',199.99),(24,1,'Playstation 5',599.99),(26,40,'Gaming Stoel',149.99);
/*!40000 ALTER TABLE `bestellingen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `klanten`
--

DROP TABLE IF EXISTS `klanten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `klanten` (
  `id` int NOT NULL AUTO_INCREMENT,
  `naam` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klanten`
--

LOCK TABLES `klanten` WRITE;
/*!40000 ALTER TABLE `klanten` DISABLE KEYS */;
INSERT INTO `klanten` VALUES (1,'Alice','wassim@newmail.com'),(40,'Mo','mo@mail.com'),(41,'Ruben','ruben@mail.com'),(43,'Wassim','wassim@mail.com'),(47,'Martijn','Martijn@mail.com'),(78,'Wassim','wassim@mail.com'),(107,'Martijn','Martijn@mail.com'),(114,'Kees','Kees@gmail.com'),(115,'Richard','Richard@gmail.com'),(116,'Joost','Joost@gmail.com'),(117,'Piet','Piet@gmail.com'),(118,'Petra','petratest@gmail.com'),(119,'Gerard','Gerard@gmail.com'),(120,'Pim','Pim@gmail.com'),(121,'Tim','Tim@gmail.com'),(123,'Johan','Johan@gmail.com'),(124,'Pete','Pete@gmail.com'),(125,'Kees','Kees@gmail.com'),(126,'Piet','Piet@gmail.com');
/*!40000 ALTER TABLE `klanten` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logboek`
--

DROP TABLE IF EXISTS `logboek`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logboek` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tabelnaam` varchar(50) DEFAULT NULL,
  `bewerking` varchar(10) DEFAULT NULL,
  `tijdstip` datetime DEFAULT CURRENT_TIMESTAMP,
  `oude_waarde` text,
  `nieuwe_waarde` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logboek`
--

LOCK TABLES `logboek` WRITE;
/*!40000 ALTER TABLE `logboek` DISABLE KEYS */;
INSERT INTO `logboek` VALUES (1,'klanten','INSERT','2025-05-22 08:47:17',NULL,'naam=Alice, email=alice@example.com'),(2,'klanten','INSERT','2025-05-22 08:47:17',NULL,'naam=Bob, email=bob@example.com'),(3,'klanten','UPDATE','2025-05-22 08:47:17','naam=Alice, email=alice@example.com','naam=Alice, email=alice@nieuwmail.com'),(4,'bestellingen','INSERT','2025-05-22 08:47:17',NULL,'klant_id=1, product=Laptop, bedrag=999.99'),(5,'klanten','DELETE','2025-05-22 08:47:17','naam=Bob, email=bob@example.com',NULL),(6,'klanten','INSERT','2025-05-22 08:49:42',NULL,'naam=Wassim, email=wassim@mail.com'),(7,'klanten','INSERT','2025-05-22 08:49:42',NULL,'naam=Erik, email=erik@mail.com'),(8,'klanten','INSERT','2025-05-22 08:49:42',NULL,'naam=Mo, email=mo@mail.com'),(9,'klanten','INSERT','2025-05-22 08:49:42',NULL,'naam=Ruben, email=ruben@mail.com'),(10,'klanten','UPDATE','2025-05-22 08:49:42','naam=Alice, email=alice@nieuwmail.com','naam=Alice, email=wassim@newmail.com'),(11,'bestellingen','INSERT','2025-05-22 08:49:42',NULL,'klant_id=1, product=Monitor, bedrag=199.99'),(12,'klanten','DELETE','2025-05-22 08:49:42','naam=Erik, email=erik@mail.com',NULL),(13,'klanten','INSERT','2025-05-22 08:51:50',NULL,'naam=Chris, email=chris@example.com'),(14,'klanten','INSERT','2025-05-22 08:56:00',NULL,'naam=Jannes, email=Jannes@example.com'),(15,'klanten','INSERT','2025-05-22 08:59:05',NULL,'naam=Wassim, email=wassim@mail.com'),(16,'klanten','INSERT','2025-05-22 08:59:05',NULL,'naam=Erik, email=erik@mail.com'),(17,'klanten','INSERT','2025-05-22 08:59:05',NULL,'naam=Mo, email=mo@mail.com'),(18,'klanten','INSERT','2025-05-22 08:59:05',NULL,'naam=Ruben, email=ruben@mail.com'),(19,'klanten','INSERT','2025-05-22 08:59:05',NULL,'naam=Martijn, email=Martijn@mail.com'),(20,'klanten','UPDATE','2025-05-22 08:59:05','naam=Alice, email=wassim@newmail.com','naam=Alice, email=wassim@newmail.com'),(21,'bestellingen','INSERT','2025-05-22 08:59:05',NULL,'klant_id=1, product=Monitor, bedrag=199.99'),(22,'klanten','INSERT','2025-05-22 09:13:12',NULL,'naam=Wassim, email=wassim@mail.com'),(23,'klanten','INSERT','2025-05-22 09:13:12',NULL,'naam=Erik, email=erik@mail.com'),(24,'klanten','INSERT','2025-05-22 09:13:12',NULL,'naam=Mo, email=mo@mail.com'),(25,'klanten','INSERT','2025-05-22 09:13:12',NULL,'naam=Ruben, email=ruben@mail.com'),(26,'klanten','INSERT','2025-05-22 09:13:12',NULL,'naam=Martijn, email=Martijn@mail.com'),(27,'klanten','UPDATE','2025-05-22 09:13:12','naam=Alice, email=wassim@newmail.com','naam=Alice, email=wassim@newmail.com'),(28,'bestellingen','INSERT','2025-05-22 09:13:12',NULL,'klant_id=1, product=Playstation 5, bedrag=599.99'),(42,'klanten','INSERT','2025-05-22 09:36:09',NULL,'naam=Wassim, email=wassim@mail.com'),(43,'klanten','INSERT','2025-05-22 09:36:09',NULL,'naam=Erik, email=erik@mail.com'),(44,'klanten','INSERT','2025-05-22 09:36:09',NULL,'naam=Mo, email=mo@mail.com'),(45,'klanten','INSERT','2025-05-22 09:36:09',NULL,'naam=Ruben, email=ruben@mail.com'),(46,'klanten','INSERT','2025-05-22 09:36:09',NULL,'naam=Martijn, email=Martijn@mail.com'),(47,'klanten','UPDATE','2025-05-22 09:36:09','naam=Alice, email=wassim@newmail.com','naam=Alice, email=wassim@newmail.com'),(48,'bestellingen','INSERT','2025-05-22 09:36:09',NULL,'klant_id=1, product=Playstation 5, bedrag=599.99'),(56,'klanten','INSERT','2025-05-22 09:37:00',NULL,'naam=Wassim, email=wassim@mail.com'),(57,'klanten','INSERT','2025-05-22 09:37:00',NULL,'naam=Erik, email=erik@mail.com'),(58,'klanten','INSERT','2025-05-22 09:37:00',NULL,'naam=Mo, email=mo@mail.com'),(59,'klanten','INSERT','2025-05-22 09:37:00',NULL,'naam=Ruben, email=ruben@mail.com'),(60,'klanten','INSERT','2025-05-22 09:37:00',NULL,'naam=Martijn, email=Martijn@mail.com'),(61,'klanten','UPDATE','2025-05-22 09:37:00','naam=Alice, email=wassim@newmail.com','naam=Alice, email=wassim@newmail.com'),(62,'bestellingen','INSERT','2025-05-22 09:37:00',NULL,'klant_id=1, product=Playstation 5, bedrag=599.99'),(63,'klanten','DELETE','2025-05-22 09:37:00','naam=Wassim, email=wassim@mail.com',NULL),(64,'klanten','INSERT','2025-05-22 09:37:20',NULL,'naam=Wassim, email=wassim@mail.com'),(65,'klanten','INSERT','2025-05-22 09:37:20',NULL,'naam=Erik, email=erik@mail.com'),(66,'klanten','INSERT','2025-05-22 09:37:20',NULL,'naam=Mo, email=mo@mail.com'),(67,'klanten','INSERT','2025-05-22 09:37:20',NULL,'naam=Ruben, email=ruben@mail.com'),(68,'klanten','INSERT','2025-05-22 09:37:20',NULL,'naam=Martijn, email=Martijn@mail.com'),(69,'klanten','UPDATE','2025-05-22 09:37:20','naam=Alice, email=wassim@newmail.com','naam=Alice, email=wassim@newmail.com'),(70,'bestellingen','INSERT','2025-05-22 09:37:20',NULL,'klant_id=1, product=Playstation 5, bedrag=599.99'),(71,'klanten','DELETE','2025-05-22 09:37:20','naam=Mo, email=mo@mail.com',NULL),(114,'klanten','INSERT','2025-05-22 09:43:21',NULL,'naam=Wassim, email=wassim@mail.com'),(115,'klanten','INSERT','2025-05-22 09:43:21',NULL,'naam=Erik, email=erik@mail.com'),(116,'klanten','INSERT','2025-05-22 09:43:21',NULL,'naam=Mo, email=mo@mail.com'),(117,'klanten','INSERT','2025-05-22 09:43:21',NULL,'naam=Ruben, email=ruben@mail.com'),(118,'klanten','INSERT','2025-05-22 09:43:21',NULL,'naam=Martijn, email=Martijn@mail.com'),(119,'klanten','UPDATE','2025-05-22 09:43:21','naam=Alice, email=wassim@newmail.com','naam=Alice, email=wassim@newmail.com'),(120,'bestellingen','INSERT','2025-05-22 09:43:21',NULL,'klant_id=1, product=Playstation 5, bedrag=599.99'),(121,'klanten','DELETE','2025-05-22 09:43:21','naam=Ruben, email=ruben@mail.com',NULL),(122,'klanten','DELETE','2025-05-22 09:43:21','naam=Martijn, email=Martijn@mail.com',NULL),(151,'klanten','INSERT','2025-05-22 09:47:08',NULL,'naam=Wassim, email=wassim@mail.com'),(152,'klanten','INSERT','2025-05-22 09:47:08',NULL,'naam=Erik, email=erik@mail.com'),(153,'klanten','INSERT','2025-05-22 09:47:08',NULL,'naam=Mo, email=mo@mail.com'),(154,'klanten','INSERT','2025-05-22 09:47:08',NULL,'naam=Ruben, email=ruben@mail.com'),(155,'klanten','INSERT','2025-05-22 09:47:08',NULL,'naam=Martijn, email=Martijn@mail.com'),(156,'klanten','UPDATE','2025-05-22 09:47:08','naam=Alice, email=wassim@newmail.com','naam=Alice, email=wassim@newmail.com'),(157,'bestellingen','INSERT','2025-05-22 09:47:08',NULL,'klant_id=1, product=Playstation 5, bedrag=599.99'),(158,'klanten','DELETE','2025-05-22 09:47:08','naam=Chris, email=chris@example.com',NULL),(159,'klanten','DELETE','2025-05-22 09:47:08','naam=Jannes, email=Jannes@example.com',NULL),(160,'klanten','DELETE','2025-05-22 09:47:08','naam=Erik, email=erik@mail.com',NULL),(161,'klanten','INSERT','2025-05-22 09:50:00',NULL,'naam=Wassim, email=wassim@mail.com'),(162,'klanten','INSERT','2025-05-22 09:50:00',NULL,'naam=Erik, email=erik@mail.com'),(163,'klanten','INSERT','2025-05-22 09:50:00',NULL,'naam=Mo, email=mo@mail.com'),(164,'klanten','INSERT','2025-05-22 09:50:00',NULL,'naam=Ruben, email=ruben@mail.com'),(165,'klanten','INSERT','2025-05-22 09:50:00',NULL,'naam=Martijn, email=Martijn@mail.com'),(166,'klanten','UPDATE','2025-05-22 09:50:00','naam=Alice, email=wassim@newmail.com','naam=Alice, email=wassim@newmail.com'),(167,'bestellingen','INSERT','2025-05-22 09:50:00',NULL,'klant_id=1, product=Playstation 5, bedrag=599.99'),(168,'klanten','INSERT','2025-05-22 10:32:29',NULL,'naam=Gerard, email=Gerard@mail.com'),(169,'klanten','UPDATE','2025-05-22 10:32:29','naam=Alice, email=wassim@newmail.com','naam=Alice, email=wassim@newmail.com'),(170,'bestellingen','INSERT','2025-05-22 10:32:29',NULL,'klant_id=1, product=Playstation 5, bedrag=599.99'),(171,'klanten','INSERT','2025-05-23 09:41:49',NULL,'naam=Kees, email=Kees@gmail.com'),(172,'klanten','DELETE','2025-05-23 09:45:23','naam=Ruben, email=ruben@mail.com',NULL),(173,'bestellingen','INSERT','2025-05-23 09:46:13',NULL,'klant_id=6, product=monitor, bedrag=500.00'),(174,'bestellingen','DELETE','2025-05-23 09:47:07','klant_id=6, product=monitor, bedrag=500.00',NULL),(175,'klanten','INSERT','2025-05-23 10:14:03',NULL,'naam=Richard, email=Richard@gmail.com'),(176,'klanten','INSERT','2025-05-23 10:31:26',NULL,'naam=Joost, email=Joost@gmail.com'),(177,'klanten','INSERT','2025-05-23 11:07:14',NULL,'naam=Piet, email=Piet@gmail.com'),(178,'klanten','DELETE','2025-05-27 09:20:13','naam=Ruben, email=ruben@mail.com',NULL),(179,'klanten','DELETE','2025-05-27 09:20:24','naam=Mo, email=mo@mail.com',NULL),(180,'klanten','DELETE','2025-05-27 09:20:27','naam=Erik, email=erik@mail.com',NULL),(181,'klanten','DELETE','2025-05-27 09:20:32','naam=Ruben, email=ruben@mail.com',NULL),(182,'klanten','DELETE','2025-05-27 09:20:36','naam=Mo, email=mo@mail.com',NULL),(183,'klanten','DELETE','2025-05-27 09:20:40','naam=Erik, email=erik@mail.com',NULL),(184,'klanten','DELETE','2025-05-27 09:20:44','naam=Martijn, email=Martijn@mail.com',NULL),(185,'klanten','DELETE','2025-05-27 09:20:46','naam=Ruben, email=ruben@mail.com',NULL),(186,'klanten','DELETE','2025-05-27 09:21:02','naam=Wassim, email=wassim@mail.com',NULL),(187,'klanten','DELETE','2025-05-27 09:21:05','naam=Mo, email=mo@mail.com',NULL),(188,'klanten','DELETE','2025-05-27 09:21:07','naam=Martijn, email=Martijn@mail.com',NULL),(189,'klanten','DELETE','2025-05-27 09:21:09','naam=Wassim, email=wassim@mail.com',NULL),(190,'klanten','DELETE','2025-05-27 09:21:11','naam=Erik, email=erik@mail.com',NULL),(191,'klanten','DELETE','2025-05-27 09:21:13','naam=Mo, email=mo@mail.com',NULL),(192,'klanten','DELETE','2025-05-27 09:21:22','naam=Wassim, email=wassim@mail.com',NULL),(193,'klanten','DELETE','2025-05-27 09:21:24','naam=Erik, email=erik@mail.com',NULL),(194,'klanten','DELETE','2025-05-27 09:21:27','naam=Mo, email=mo@mail.com',NULL),(195,'klanten','DELETE','2025-05-27 09:21:29','naam=Ruben, email=ruben@mail.com',NULL),(196,'klanten','DELETE','2025-05-27 09:21:31','naam=Martijn, email=Martijn@mail.com',NULL),(197,'klanten','DELETE','2025-05-27 09:21:35','naam=Wassim, email=wassim@mail.com',NULL),(198,'klanten','DELETE','2025-05-27 09:21:53','naam=Erik, email=erik@mail.com',NULL),(199,'klanten','DELETE','2025-05-27 09:22:02','naam=Ruben, email=ruben@mail.com',NULL),(200,'klanten','DELETE','2025-05-27 09:22:08','naam=Ruben, email=ruben@mail.com',NULL),(201,'klanten','DELETE','2025-05-27 09:22:13','naam=Martijn, email=Martijn@mail.com',NULL),(202,'klanten','DELETE','2025-05-27 09:22:17','naam=Erik, email=erik@mail.com',NULL),(203,'klanten','DELETE','2025-05-27 09:22:20','naam=Erik, email=erik@mail.com',NULL),(204,'klanten','DELETE','2025-05-27 09:22:23','naam=Mo, email=mo@mail.com',NULL),(205,'klanten','DELETE','2025-05-27 09:22:26','naam=Mo, email=mo@mail.com',NULL),(206,'klanten','DELETE','2025-05-27 09:22:40','naam=Martijn, email=Martijn@mail.com',NULL),(207,'klanten','DELETE','2025-05-27 09:22:44','naam=Wassim, email=wassim@mail.com',NULL),(208,'klanten','DELETE','2025-05-27 09:22:47','naam=Wassim, email=wassim@mail.com',NULL),(209,'klanten','INSERT','2025-06-06 09:37:43',NULL,'naam=Petra, email=petratest@gmail.com'),(210,'klanten','INSERT','2025-06-06 09:47:04',NULL,'naam=Gerard, email=Gerard@gmail.com'),(211,'klanten','INSERT','2025-06-06 09:49:35',NULL,'naam=Pim, email=Pim@gmail.com'),(212,'klanten','INSERT','2025-06-06 09:53:43',NULL,'naam=Tim, email=Tim@gmail.com'),(213,'klanten','INSERT','2025-06-06 09:55:30',NULL,'naam=Dasdasd, email=sadasda'),(214,'klanten','DELETE','2025-06-06 10:13:11','naam=Dasdasd, email=sadasda',NULL),(215,'klanten','INSERT','2025-06-06 10:15:38',NULL,'naam=Johan, email=Johan@gmail.com'),(216,'klanten','DELETE','2025-06-06 10:16:37','naam=Gerard, email=Gerard@mail.com',NULL),(217,'klanten','INSERT','2025-06-06 11:03:57',NULL,'naam=Pete, email=Pete@gmail.com'),(218,'klanten','INSERT','2025-06-06 11:08:34',NULL,'naam=Kees, email=Kees@gmail.com'),(219,'bestellingen','INSERT','2025-06-06 11:12:56',NULL,'klant_id=40, product=Gaming Stoel, bedrag=149.99'),(220,'bestellingen','DELETE','2025-06-06 11:13:30','klant_id=1, product=Playstation 5, bedrag=599.99',NULL),(221,'bestellingen','DELETE','2025-06-06 11:13:33','klant_id=1, product=Playstation 5, bedrag=599.99',NULL),(222,'bestellingen','DELETE','2025-06-06 11:13:35','klant_id=1, product=Playstation 5, bedrag=599.99',NULL),(223,'bestellingen','DELETE','2025-06-06 11:13:42','klant_id=1, product=Playstation 5, bedrag=599.99',NULL),(224,'bestellingen','DELETE','2025-06-06 11:13:45','klant_id=1, product=Playstation 5, bedrag=599.99',NULL),(225,'bestellingen','DELETE','2025-06-06 11:13:50','klant_id=1, product=Playstation 5, bedrag=599.99',NULL),(226,'bestellingen','DELETE','2025-06-06 11:13:53','klant_id=1, product=Playstation 5, bedrag=599.99',NULL),(227,'bestellingen','DELETE','2025-06-06 11:14:25','klant_id=1, product=Monitor, bedrag=199.99',NULL),(228,'klanten','INSERT','2025-06-10 09:06:52',NULL,'naam=Piet, email=Piet@gmail.com');
/*!40000 ALTER TABLE `logboek` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-10  9:24:38
