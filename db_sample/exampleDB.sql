-- MySQL dump 10.13  Distrib 5.7.22, for Win64 (x86_64)
--
-- Host: localhost    Database: wheretostudy
-- ------------------------------------------------------
-- Server version	5.7.22-log

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
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `building` (
  `building_number` varchar(6) NOT NULL,
  `building_name` varchar(80) NOT NULL,
  PRIMARY KEY (`building_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
INSERT INTO `building` VALUES ('E11','창의학습관'),('E4','KI빌딩'),('E6','자연과학동'),('E9','학술문화관'),('N1','김병호, 김삼열 IT융합 빌딩'),('N10','교양분관'),('N11','학생식당'),('N13-2','장영신 학생회관'),('N4','인문사회과학부동'),('N7','기계공학동'),('W1','응용공학동'),('W8','교육지원동');
/*!40000 ALTER TABLE `building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `category_number` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`category_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'카페'),(2,'열람실'),(3,'자유석'),(4,'세미나실');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `location_number` int(11) NOT NULL,
  `location_name` varchar(30) DEFAULT NULL,
  `building_code` varchar(6) NOT NULL,
  `category_number` int(11) NOT NULL,
  `available_begin_weekday` time DEFAULT NULL,
  `available_end_weekday` time DEFAULT NULL,
  `available_begin_weekend` time DEFAULT NULL,
  `available_end_weekend` time DEFAULT NULL,
  PRIMARY KEY (`location_number`),
  KEY `fk_LOCATION_CATEGORY_idx` (`category_number`),
  KEY `fk_LOCATION_BUILDING1_idx` (`building_code`),
  CONSTRAINT `fk_LOCATION_BUILDING1` FOREIGN KEY (`building_code`) REFERENCES `building` (`building_number`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_LOCATION_CATEGORY` FOREIGN KEY (`category_number`) REFERENCES `category` (`category_number`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'교양분관 1층','N10',3,'00:00:00','23:59:59','00:00:00','23:59:59'),(2,'교양분관 1층 세미나실','N10',4,'00:00:00','23:59:59','00:00:00','23:59:59'),(3,'교양분관 2층 열람실','N10',2,'00:00:00','23:59:59','00:00:00','23:59:59'),(4,'인문사회과학부동 1층','N4',3,'00:00:00','23:59:59','00:00:00','23:59:59'),(5,'뚜레쥬르','E6',1,'07:00:00','23:00:00','07:00:00','22:00:00'),(6,'투썸플레이스','E6',1,'07:00:00','23:00:00','07:00:00','23:00:00'),(7,'던킨도너츠','E6',1,'07:00:00','23:00:00','07:00:00','23:00:00'),(8,'카페 오가다','E6',1,'08:30:00','21:30:00','08:30:00','21:30:00'),(9,'카페 그랑','E6',1,'08:30:00','20:00:00','10:00:00','19:30:00'),(10,'헨델과 그레텔','E6',1,'08:00:00','23:00:00','08:00:00','22:00:00'),(11,'망고식스','E6',1,'08:30:00','21:30:00','10:30:00','18:00:00'),(12,'커피빈','E6',1,'09:00:00','22:30:00','09:00:00','22:30:00'),(13,'도서관 자유석','E9',3,'09:00:00','23:59:59','13:00:00','23:59:59'),(14,'도서관 한방향 열람실','E9',2,'09:00:00','23:59:59','13:00:00','23:59:59'),(15,'신학관 1,2층','N13-2',3,'00:00:00','23:59:59','00:00:00','23:59:59'),(16,'문화관 자유석','E9',3,'00:00:00','23:59:59','00:00:00','23:59:59'),(17,'문화관 콜라보레이션룸','E9',4,'00:00:00','23:59:59','00:00:00','23:59:59'),(18,'도서관 세미나실','E9',4,'09:00:00','23:59:59','13:00:00','23:59:59'),(19,'도서관 세미나실','E9',4,'09:00:00','23:59:59','13:00:00','23:59:59');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL,
  `reserve_slot` int(11) NOT NULL,
  `user_id` varchar(15) NOT NULL,
  `begin_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `num_people` int(11) NOT NULL,
  `reservation_purpose` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`reservation_id`),
  KEY `fk_RESERVATION_USER1_idx` (`user_id`),
  KEY `fk_RESERVATION_SLOT1_idx` (`reserve_slot`),
  CONSTRAINT `fk_RESERVATION_SLOT1` FOREIGN KEY (`reserve_slot`) REFERENCES `slot` (`slot_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_RESERVATION_USER1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `review_number` int(11) NOT NULL,
  `user_id` varchar(15) NOT NULL,
  `location_number` int(11) NOT NULL,
  `like_score` int(11) DEFAULT NULL,
  `crowded_score` int(11) DEFAULT NULL,
  `comment` varchar(300) DEFAULT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`review_number`),
  KEY `fk_REVIEW_LOCATION1_idx` (`location_number`),
  KEY `fk_REVIEW_USER1_idx` (`user_id`),
  CONSTRAINT `fk_REVIEW_LOCATION1` FOREIGN KEY (`location_number`) REFERENCES `location` (`location_number`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_REVIEW_USER1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slot`
--

DROP TABLE IF EXISTS `slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slot` (
  `slot_id` int(11) NOT NULL,
  `slot_name` varchar(50) NOT NULL,
  `slot_location` int(11) NOT NULL,
  `slot_type` int(11) NOT NULL,
  `max_reserve_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`slot_id`),
  KEY `fk_SLOT_SLOTTYPES1_idx` (`slot_type`),
  KEY `fk_SLOT_LOCATION1_idx` (`slot_location`),
  CONSTRAINT `fk_SLOT_LOCATION1` FOREIGN KEY (`slot_location`) REFERENCES `location` (`location_number`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SLOT_SLOTTYPES1` FOREIGN KEY (`slot_type`) REFERENCES `slottypes` (`slot_number`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slot`
--

LOCK TABLES `slot` WRITE;
/*!40000 ALTER TABLE `slot` DISABLE KEYS */;
/*!40000 ALTER TABLE `slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slottypes`
--

DROP TABLE IF EXISTS `slottypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slottypes` (
  `slot_number` int(11) NOT NULL,
  `slot_type` varchar(30) NOT NULL,
  `maximum_capacity` int(11) NOT NULL,
  `minimum_capaticy` int(11) NOT NULL,
  PRIMARY KEY (`slot_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slottypes`
--

LOCK TABLES `slottypes` WRITE;
/*!40000 ALTER TABLE `slottypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `slottypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` varchar(15) NOT NULL,
  `user_name` varchar(10) NOT NULL,
  `password_hash` varchar(150) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('user','관리자','password');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'wheretostudy'
--

--
-- Dumping routines for database 'wheretostudy'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-13  4:43:55