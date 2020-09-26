CREATE DATABASE  IF NOT EXISTS `RBA` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `RBA`;
-- MariaDB dump 10.17  Distrib 10.5.5-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: RBA
-- ------------------------------------------------------
-- Server version	10.5.5-MariaDB

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `acno` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pass` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`acno`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'12345','bongoli');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `completed`
--

DROP TABLE IF EXISTS `completed`;
/*!50001 DROP VIEW IF EXISTS `completed`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `completed` (
  `srno` tinyint NOT NULL,
  `eta_date` tinyint NOT NULL,
  `job` tinyint NOT NULL,
  `impname` tinyint NOT NULL,
  `shipper` tinyint NOT NULL,
  `pks` tinyint NOT NULL,
  `invoice_no` tinyint NOT NULL,
  `comm` tinyint NOT NULL,
  `be` tinyint NOT NULL,
  `be_date` tinyint NOT NULL,
  `container_no` tinyint NOT NULL,
  `phyto` tinyint NOT NULL,
  `st_duty` tinyint NOT NULL,
  `yield` tinyint NOT NULL,
  `ship_rec` tinyint NOT NULL,
  `cfs` tinyint NOT NULL,
  `duty_rec` tinyint NOT NULL,
  `pq_rec` tinyint NOT NULL,
  `fssai_rec` tinyint NOT NULL,
  `surv_rec` tinyint NOT NULL,
  `o_rec` tinyint NOT NULL,
  `rba_bill_a` tinyint NOT NULL,
  `rba_bill_b` tinyint NOT NULL,
  `job_status` tinyint NOT NULL,
  `job_delayed` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `delay`
--

DROP TABLE IF EXISTS `delay`;
/*!50001 DROP VIEW IF EXISTS `delay`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `delay` (
  `srno` tinyint NOT NULL,
  `eta_date` tinyint NOT NULL,
  `job` tinyint NOT NULL,
  `impname` tinyint NOT NULL,
  `shipper` tinyint NOT NULL,
  `pks` tinyint NOT NULL,
  `invoice_no` tinyint NOT NULL,
  `comm` tinyint NOT NULL,
  `be` tinyint NOT NULL,
  `be_date` tinyint NOT NULL,
  `container_no` tinyint NOT NULL,
  `phyto` tinyint NOT NULL,
  `st_duty` tinyint NOT NULL,
  `yield` tinyint NOT NULL,
  `ship_rec` tinyint NOT NULL,
  `cfs` tinyint NOT NULL,
  `duty_rec` tinyint NOT NULL,
  `pq_rec` tinyint NOT NULL,
  `fssai_rec` tinyint NOT NULL,
  `surv_rec` tinyint NOT NULL,
  `o_rec` tinyint NOT NULL,
  `rba_bill_a` tinyint NOT NULL,
  `rba_bill_b` tinyint NOT NULL,
  `job_status` tinyint NOT NULL,
  `job_delayed` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `imp_details`
--

DROP TABLE IF EXISTS `imp_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imp_details` (
  `imp_id` int(11) NOT NULL AUTO_INCREMENT,
  `impname` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ic` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gst` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pan` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fssai` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`impname`),
  UNIQUE KEY `imp_id` (`imp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imp_details`
--

LOCK TABLES `imp_details` WRITE;
/*!40000 ALTER TABLE `imp_details` DISABLE KEYS */;
INSERT INTO `imp_details` VALUES (29,'Ashu','12','','',''),(3,'dolore',NULL,NULL,NULL,NULL),(6,'enim',NULL,NULL,NULL,NULL),(4,'eum',NULL,NULL,NULL,NULL),(8,'in',NULL,NULL,NULL,NULL),(7,'minima',NULL,NULL,NULL,NULL),(28,'Neelak','12130','1222','2222','3343'),(2,'optio',NULL,NULL,NULL,NULL),(9,'quis',NULL,NULL,NULL,NULL),(10,'reprehenderit',NULL,NULL,NULL,NULL),(1,'voluptas',NULL,NULL,NULL,NULL),(5,'voluptatum',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `imp_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `importers`
--

DROP TABLE IF EXISTS `importers`;
/*!50001 DROP VIEW IF EXISTS `importers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `importers` (
  `impname` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `imports`
--

DROP TABLE IF EXISTS `imports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imports` (
  `srno` int(11) NOT NULL AUTO_INCREMENT,
  `eta_date` date DEFAULT NULL,
  `job` int(11) DEFAULT NULL,
  `impname` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipper` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pks` int(11) DEFAULT NULL,
  `invoice_no` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comm` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `be` int(11) DEFAULT NULL,
  `be_date` date DEFAULT NULL,
  `container_no` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phyto` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `st_duty` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `yield` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_rec` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cfs` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duty_rec` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pq_rec` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fssai_rec` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surv_rec` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `o_rec` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rba_bill_a` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rba_bill_b` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_status` tinyint(1) DEFAULT 0,
  `job_delayed` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`srno`),
  KEY `iname` (`impname`),
  CONSTRAINT `iname` FOREIGN KEY (`impname`) REFERENCES `imp_details` (`impname`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imports`
--

LOCK TABLES `imports` WRITE;
/*!40000 ALTER TABLE `imports` DISABLE KEYS */;
INSERT INTO `imports` VALUES (1,'1980-04-15',7,'voluptas','perspiciatis',0,'','aliquid',NULL,'2009-12-04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1),(2,'1972-09-24',6,'optio','natus',0,'8','enim',NULL,'1994-09-10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1),(3,'1994-03-17',5,'dolore','sint',4,'5','consequatur',NULL,'2020-07-22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1),(4,'1986-02-24',5,'eum','rerum',1,'3','id',NULL,'1986-02-14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1),(5,'1977-10-21',8,'voluptatum','aliquam',9,'7','odio',NULL,'1993-03-10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1),(6,'2002-08-07',1,'enim','dolore',7,'2','quae',NULL,'1987-01-05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1),(7,'1979-06-01',4,'minima','magnam',2,'7','sit',NULL,'1971-06-28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1),(8,'2001-01-09',4,'in','nesciunt',3,'5','omnis',NULL,'2014-10-16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1),(9,'2000-02-20',1,'quis','iusto',5,'4','esse',NULL,'2005-12-12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1),(10,'2020-05-26',1,'reprehenderit','mollitia',3,'5','sunt',NULL,'2013-07-15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1),(14,'2020-09-22',NULL,'Neelak',NULL,NULL,NULL,NULL,NULL,'2020-09-26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0);
/*!40000 ALTER TABLE `imports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `pending`
--

DROP TABLE IF EXISTS `pending`;
/*!50001 DROP VIEW IF EXISTS `pending`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `pending` (
  `srno` tinyint NOT NULL,
  `eta_date` tinyint NOT NULL,
  `job` tinyint NOT NULL,
  `impname` tinyint NOT NULL,
  `shipper` tinyint NOT NULL,
  `pks` tinyint NOT NULL,
  `invoice_no` tinyint NOT NULL,
  `comm` tinyint NOT NULL,
  `be` tinyint NOT NULL,
  `be_date` tinyint NOT NULL,
  `container_no` tinyint NOT NULL,
  `phyto` tinyint NOT NULL,
  `st_duty` tinyint NOT NULL,
  `yield` tinyint NOT NULL,
  `ship_rec` tinyint NOT NULL,
  `cfs` tinyint NOT NULL,
  `duty_rec` tinyint NOT NULL,
  `pq_rec` tinyint NOT NULL,
  `fssai_rec` tinyint NOT NULL,
  `surv_rec` tinyint NOT NULL,
  `o_rec` tinyint NOT NULL,
  `rba_bill_a` tinyint NOT NULL,
  `rba_bill_b` tinyint NOT NULL,
  `job_status` tinyint NOT NULL,
  `job_delayed` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `completed`
--

/*!50001 DROP TABLE IF EXISTS `completed`*/;
/*!50001 DROP VIEW IF EXISTS `completed`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `completed` AS select `imports`.`srno` AS `srno`,`imports`.`eta_date` AS `eta_date`,`imports`.`job` AS `job`,`imports`.`impname` AS `impname`,`imports`.`shipper` AS `shipper`,`imports`.`pks` AS `pks`,`imports`.`invoice_no` AS `invoice_no`,`imports`.`comm` AS `comm`,`imports`.`be` AS `be`,`imports`.`be_date` AS `be_date`,`imports`.`container_no` AS `container_no`,`imports`.`phyto` AS `phyto`,`imports`.`st_duty` AS `st_duty`,`imports`.`yield` AS `yield`,`imports`.`ship_rec` AS `ship_rec`,`imports`.`cfs` AS `cfs`,`imports`.`duty_rec` AS `duty_rec`,`imports`.`pq_rec` AS `pq_rec`,`imports`.`fssai_rec` AS `fssai_rec`,`imports`.`surv_rec` AS `surv_rec`,`imports`.`o_rec` AS `o_rec`,`imports`.`rba_bill_a` AS `rba_bill_a`,`imports`.`rba_bill_b` AS `rba_bill_b`,`imports`.`job_status` AS `job_status`,`imports`.`job_delayed` AS `job_delayed` from `imports` where `imports`.`job_status` = 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `delay`
--

/*!50001 DROP TABLE IF EXISTS `delay`*/;
/*!50001 DROP VIEW IF EXISTS `delay`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `delay` AS select `imports`.`srno` AS `srno`,`imports`.`eta_date` AS `eta_date`,`imports`.`job` AS `job`,`imports`.`impname` AS `impname`,`imports`.`shipper` AS `shipper`,`imports`.`pks` AS `pks`,`imports`.`invoice_no` AS `invoice_no`,`imports`.`comm` AS `comm`,`imports`.`be` AS `be`,`imports`.`be_date` AS `be_date`,`imports`.`container_no` AS `container_no`,`imports`.`phyto` AS `phyto`,`imports`.`st_duty` AS `st_duty`,`imports`.`yield` AS `yield`,`imports`.`ship_rec` AS `ship_rec`,`imports`.`cfs` AS `cfs`,`imports`.`duty_rec` AS `duty_rec`,`imports`.`pq_rec` AS `pq_rec`,`imports`.`fssai_rec` AS `fssai_rec`,`imports`.`surv_rec` AS `surv_rec`,`imports`.`o_rec` AS `o_rec`,`imports`.`rba_bill_a` AS `rba_bill_a`,`imports`.`rba_bill_b` AS `rba_bill_b`,`imports`.`job_status` AS `job_status`,`imports`.`job_delayed` AS `job_delayed` from `imports` where `imports`.`job_status` = 0 and `imports`.`job_delayed` = 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `importers`
--

/*!50001 DROP TABLE IF EXISTS `importers`*/;
/*!50001 DROP VIEW IF EXISTS `importers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `importers` AS select distinct `imports`.`impname` AS `impname` from `imports` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pending`
--

/*!50001 DROP TABLE IF EXISTS `pending`*/;
/*!50001 DROP VIEW IF EXISTS `pending`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pending` AS select `imports`.`srno` AS `srno`,`imports`.`eta_date` AS `eta_date`,`imports`.`job` AS `job`,`imports`.`impname` AS `impname`,`imports`.`shipper` AS `shipper`,`imports`.`pks` AS `pks`,`imports`.`invoice_no` AS `invoice_no`,`imports`.`comm` AS `comm`,`imports`.`be` AS `be`,`imports`.`be_date` AS `be_date`,`imports`.`container_no` AS `container_no`,`imports`.`phyto` AS `phyto`,`imports`.`st_duty` AS `st_duty`,`imports`.`yield` AS `yield`,`imports`.`ship_rec` AS `ship_rec`,`imports`.`cfs` AS `cfs`,`imports`.`duty_rec` AS `duty_rec`,`imports`.`pq_rec` AS `pq_rec`,`imports`.`fssai_rec` AS `fssai_rec`,`imports`.`surv_rec` AS `surv_rec`,`imports`.`o_rec` AS `o_rec`,`imports`.`rba_bill_a` AS `rba_bill_a`,`imports`.`rba_bill_b` AS `rba_bill_b`,`imports`.`job_status` AS `job_status`,`imports`.`job_delayed` AS `job_delayed` from `imports` where `imports`.`job_status` = 0 and `imports`.`job_delayed` = 0 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-22 23:03:51
