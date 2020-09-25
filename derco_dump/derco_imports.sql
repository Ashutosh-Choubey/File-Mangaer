-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: derco
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `imports`
--

DROP TABLE IF EXISTS `imports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imports` (
  `srno` int NOT NULL AUTO_INCREMENT,
  `eta_date` date DEFAULT NULL,
  `job` int DEFAULT NULL,
  `impname` varchar(30) DEFAULT NULL,
  `shipper` varchar(20) DEFAULT NULL,
  `pks` int DEFAULT NULL,
  `invoice_no` varchar(20) DEFAULT NULL,
  `comm` varchar(30) DEFAULT NULL,
  `be` int DEFAULT NULL,
  `be_date` date DEFAULT NULL,
  `container_no` varchar(20) DEFAULT NULL,
  `phyto` varchar(30) DEFAULT NULL,
  `st_duty` varchar(30) DEFAULT NULL,
  `yield` varchar(30) DEFAULT NULL,
  `ship_rec` varchar(30) DEFAULT NULL,
  `cfs` varchar(30) DEFAULT NULL,
  `duty_rec` varchar(30) DEFAULT NULL,
  `pq_rec` varchar(30) DEFAULT NULL,
  `fssai_rec` varchar(30) DEFAULT NULL,
  `surv_rec` varchar(30) DEFAULT NULL,
  `o_rec` varchar(30) DEFAULT NULL,
  `rba_bill_a` varchar(30) DEFAULT NULL,
  `rba_bill_b` varchar(30) DEFAULT NULL,
  `job_status` tinyint(1) DEFAULT '0',
  `job_delayed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`srno`),
  KEY `iname` (`impname`),
  CONSTRAINT `iname` FOREIGN KEY (`impname`) REFERENCES `imp_details` (`impname`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imports`
--

LOCK TABLES `imports` WRITE;
/*!40000 ALTER TABLE `imports` DISABLE KEYS */;
INSERT INTO `imports` VALUES (1,'1980-04-15',7,'voluptas','perspiciatis',0,'','aliquid',NULL,'2009-12-04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1),(2,'1972-09-24',6,'optio','natus',0,'8','enim',NULL,'1994-09-10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1),(4,'1986-02-24',5,'eum','rerum',1,'3','id',NULL,'1986-02-14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1),(5,'1977-10-21',8,'voluptatum','aliquam',9,'7','odio',NULL,'1993-03-10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1),(6,'2002-08-07',1,'enim','dolore',7,'2','quae',NULL,'1987-01-05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1),(7,'1979-06-01',4,'minima','magnam',2,'7','sit',NULL,'1971-06-28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1),(8,'2001-01-09',4,'in','nesciunt',3,'5','omnis',NULL,'2014-10-16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1),(9,'2000-02-20',1,'quis','iusto',5,'4','esse',NULL,'2005-12-12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1),(10,'2020-05-26',1,'reprehenderit','mollitia',3,'5','sunt',NULL,'2013-07-15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1),(11,'1994-03-17',5,'dolore','sint',4,'5','consequatur',NULL,'2020-07-22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1),(15,'2021-05-26',1,'reprehenderit','mollitia',3,'5','sunt',NULL,'2013-07-15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0);
/*!40000 ALTER TABLE `imports` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-25 18:48:10
