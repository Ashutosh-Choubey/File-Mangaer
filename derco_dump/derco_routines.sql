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
-- Temporary view structure for view `delay`
--

DROP TABLE IF EXISTS `delay`;
/*!50001 DROP VIEW IF EXISTS `delay`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `delay` AS SELECT 
 1 AS `srno`,
 1 AS `eta_date`,
 1 AS `job`,
 1 AS `impname`,
 1 AS `shipper`,
 1 AS `pks`,
 1 AS `invoice_no`,
 1 AS `comm`,
 1 AS `be`,
 1 AS `be_date`,
 1 AS `container_no`,
 1 AS `phyto`,
 1 AS `st_duty`,
 1 AS `yield`,
 1 AS `ship_rec`,
 1 AS `cfs`,
 1 AS `duty_rec`,
 1 AS `pq_rec`,
 1 AS `fssai_rec`,
 1 AS `surv_rec`,
 1 AS `o_rec`,
 1 AS `rba_bill_a`,
 1 AS `rba_bill_b`,
 1 AS `job_status`,
 1 AS `job_delayed`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `importers`
--

DROP TABLE IF EXISTS `importers`;
/*!50001 DROP VIEW IF EXISTS `importers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `importers` AS SELECT 
 1 AS `impname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `completed`
--

DROP TABLE IF EXISTS `completed`;
/*!50001 DROP VIEW IF EXISTS `completed`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `completed` AS SELECT 
 1 AS `srno`,
 1 AS `eta_date`,
 1 AS `job`,
 1 AS `impname`,
 1 AS `shipper`,
 1 AS `pks`,
 1 AS `invoice_no`,
 1 AS `comm`,
 1 AS `be`,
 1 AS `be_date`,
 1 AS `container_no`,
 1 AS `phyto`,
 1 AS `st_duty`,
 1 AS `yield`,
 1 AS `ship_rec`,
 1 AS `cfs`,
 1 AS `duty_rec`,
 1 AS `pq_rec`,
 1 AS `fssai_rec`,
 1 AS `surv_rec`,
 1 AS `o_rec`,
 1 AS `rba_bill_a`,
 1 AS `rba_bill_b`,
 1 AS `job_status`,
 1 AS `job_delayed`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `pending`
--

DROP TABLE IF EXISTS `pending`;
/*!50001 DROP VIEW IF EXISTS `pending`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pending` AS SELECT 
 1 AS `srno`,
 1 AS `eta_date`,
 1 AS `job`,
 1 AS `impname`,
 1 AS `shipper`,
 1 AS `pks`,
 1 AS `invoice_no`,
 1 AS `comm`,
 1 AS `be`,
 1 AS `be_date`,
 1 AS `container_no`,
 1 AS `phyto`,
 1 AS `st_duty`,
 1 AS `yield`,
 1 AS `ship_rec`,
 1 AS `cfs`,
 1 AS `duty_rec`,
 1 AS `pq_rec`,
 1 AS `fssai_rec`,
 1 AS `surv_rec`,
 1 AS `o_rec`,
 1 AS `rba_bill_a`,
 1 AS `rba_bill_b`,
 1 AS `job_status`,
 1 AS `job_delayed`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `delay`
--

/*!50001 DROP VIEW IF EXISTS `delay`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `delay` AS select `imports`.`srno` AS `srno`,`imports`.`eta_date` AS `eta_date`,`imports`.`job` AS `job`,`imports`.`impname` AS `impname`,`imports`.`shipper` AS `shipper`,`imports`.`pks` AS `pks`,`imports`.`invoice_no` AS `invoice_no`,`imports`.`comm` AS `comm`,`imports`.`be` AS `be`,`imports`.`be_date` AS `be_date`,`imports`.`container_no` AS `container_no`,`imports`.`phyto` AS `phyto`,`imports`.`st_duty` AS `st_duty`,`imports`.`yield` AS `yield`,`imports`.`ship_rec` AS `ship_rec`,`imports`.`cfs` AS `cfs`,`imports`.`duty_rec` AS `duty_rec`,`imports`.`pq_rec` AS `pq_rec`,`imports`.`fssai_rec` AS `fssai_rec`,`imports`.`surv_rec` AS `surv_rec`,`imports`.`o_rec` AS `o_rec`,`imports`.`rba_bill_a` AS `rba_bill_a`,`imports`.`rba_bill_b` AS `rba_bill_b`,`imports`.`job_status` AS `job_status`,`imports`.`job_delayed` AS `job_delayed` from `imports` where ((`imports`.`job_status` = 0) and (`imports`.`job_delayed` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `importers`
--

/*!50001 DROP VIEW IF EXISTS `importers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `importers` AS select distinct `imports`.`impname` AS `impname` from `imports` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `completed`
--

/*!50001 DROP VIEW IF EXISTS `completed`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `completed` AS select `imports`.`srno` AS `srno`,`imports`.`eta_date` AS `eta_date`,`imports`.`job` AS `job`,`imports`.`impname` AS `impname`,`imports`.`shipper` AS `shipper`,`imports`.`pks` AS `pks`,`imports`.`invoice_no` AS `invoice_no`,`imports`.`comm` AS `comm`,`imports`.`be` AS `be`,`imports`.`be_date` AS `be_date`,`imports`.`container_no` AS `container_no`,`imports`.`phyto` AS `phyto`,`imports`.`st_duty` AS `st_duty`,`imports`.`yield` AS `yield`,`imports`.`ship_rec` AS `ship_rec`,`imports`.`cfs` AS `cfs`,`imports`.`duty_rec` AS `duty_rec`,`imports`.`pq_rec` AS `pq_rec`,`imports`.`fssai_rec` AS `fssai_rec`,`imports`.`surv_rec` AS `surv_rec`,`imports`.`o_rec` AS `o_rec`,`imports`.`rba_bill_a` AS `rba_bill_a`,`imports`.`rba_bill_b` AS `rba_bill_b`,`imports`.`job_status` AS `job_status`,`imports`.`job_delayed` AS `job_delayed` from `imports` where (`imports`.`job_status` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pending`
--

/*!50001 DROP VIEW IF EXISTS `pending`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pending` AS select `imports`.`srno` AS `srno`,`imports`.`eta_date` AS `eta_date`,`imports`.`job` AS `job`,`imports`.`impname` AS `impname`,`imports`.`shipper` AS `shipper`,`imports`.`pks` AS `pks`,`imports`.`invoice_no` AS `invoice_no`,`imports`.`comm` AS `comm`,`imports`.`be` AS `be`,`imports`.`be_date` AS `be_date`,`imports`.`container_no` AS `container_no`,`imports`.`phyto` AS `phyto`,`imports`.`st_duty` AS `st_duty`,`imports`.`yield` AS `yield`,`imports`.`ship_rec` AS `ship_rec`,`imports`.`cfs` AS `cfs`,`imports`.`duty_rec` AS `duty_rec`,`imports`.`pq_rec` AS `pq_rec`,`imports`.`fssai_rec` AS `fssai_rec`,`imports`.`surv_rec` AS `surv_rec`,`imports`.`o_rec` AS `o_rec`,`imports`.`rba_bill_a` AS `rba_bill_a`,`imports`.`rba_bill_b` AS `rba_bill_b`,`imports`.`job_status` AS `job_status`,`imports`.`job_delayed` AS `job_delayed` from `imports` where (`imports`.`job_status` = 0) */;
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

-- Dump completed on 2020-09-25 18:48:11
