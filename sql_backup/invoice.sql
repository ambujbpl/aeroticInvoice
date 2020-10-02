-- MySQL dump 10.13  Distrib 5.7.27, for Win64 (x86_64)
--
-- Host: localhost    Database: invoice
-- ------------------------------------------------------
-- Server version	5.7.27-log

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
-- Table structure for table `basic`
--

DROP TABLE IF EXISTS `basic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basic` (
  `Name` varchar(20) NOT NULL,
  `Address` varchar(40) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `Gst` varchar(15) NOT NULL,
  `HsnCode` varchar(15) NOT NULL,
  `YearCode` varchar(15) NOT NULL,
  `InvoiceCount` int(11) NOT NULL DEFAULT '1',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(3) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basic`
--

LOCK TABLES `basic` WRITE;
/*!40000 ALTER TABLE `basic` DISABLE KEYS */;
INSERT INTO `basic` VALUES ('Saniya Enterprises','Bhopal Madhya Pradesh','9584444161','23CPFPD6088B1Z8','MP04TA0123','-2021',7,'2020-10-02 07:12:05',1);
/*!40000 ALTER TABLE `basic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` varchar(255) NOT NULL,
  `invoice_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `subtotal` decimal(11,3) DEFAULT '0.000',
  `gst` decimal(11,3) DEFAULT '0.000',
  `total` decimal(11,3) DEFAULT '0.000',
  `paid` decimal(11,3) DEFAULT '0.000',
  `due` decimal(11,3) DEFAULT '0.000',
  `address` longtext,
  `customer_address` longtext,
  `product_details` longtext,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` VALUES (1,'testing','2020-07-03 18:30:00',2226.300,400.734,2627.030,0.000,2627.030,'{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"9584444161\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}','{\"PartyName\":\"\",\"PartyAddress\":\"\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"MP04TA0123\",\"header\":\"INVOICE\"}\n','[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"1005.500\",\"productQuantity\":\"1\",\"productPrize\":\"1005.50\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"1207.700\",\"productQuantity\":\"1\",\"productPrize\":\"1207.70\"},{\"productName\":\"Roter Seal\",\"productDesc\":\"Seal for SLD device\",\"productCost\":\"13.100\",\"productQuantity\":\"1\",\"productPrize\":\"13.10\"}]','2020-10-02 06:21:17','2020-10-02 06:21:17','harshuj'),(2,'001/-2021','2020-10-01 18:30:00',0.000,0.000,0.000,0.000,0.000,'{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"9584444161\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}','{\"PartyName\":\"\",\"PartyAddress\":\"\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"MP04TA0123\",\"header\":\"INVOICE\"}','[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"1005.500\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"1207.100\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Roter Seal\",\"productDesc\":\"Seal for SLD device\",\"productCost\":\"13.500\",\"productQuantity\":\"\",\"productPrize\":\"\"}]','2020-10-02 06:34:38','2020-10-02 06:34:38','gouravdubey'),(3,'001/-2021','2020-10-01 18:30:00',0.000,0.000,0.000,0.000,0.000,'{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"9584444161\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}','{\"PartyName\":\"\",\"PartyAddress\":\"\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"MP04TA0123\",\"header\":\"INVOICE\"}','[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"1005.500\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"1207.100\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Roter Seal\",\"productDesc\":\"Seal for SLD device\",\"productCost\":\"13.500\",\"productQuantity\":\"\",\"productPrize\":\"\"}]','2020-10-02 06:38:47','2020-10-02 06:38:47','gouravdubey'),(4,'001/-2021','2020-10-01 18:30:00',0.000,0.000,0.000,0.000,0.000,'{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"9584444161\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}','{\"PartyName\":\"\",\"PartyAddress\":\"\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"MP04TA0123\",\"header\":\"INVOICE\"}','[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"1005.500\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"1207.100\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Roter Seal\",\"productDesc\":\"Seal for SLD device\",\"productCost\":\"13.500\",\"productQuantity\":\"\",\"productPrize\":\"\"}]','2020-10-02 06:38:58','2020-10-02 06:38:58','gouravdubey'),(5,'testing','2020-07-03 18:30:00',2226.300,400.734,2627.030,0.000,2627.030,'{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"9584444161\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}','{\"PartyName\":\"\",\"PartyAddress\":\"\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"MP04TA0123\",\"header\":\"INVOICE\"}\n','[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"1005.500\",\"productQuantity\":\"1\",\"productPrize\":\"1005.50\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"1207.700\",\"productQuantity\":\"1\",\"productPrize\":\"1207.70\"},{\"productName\":\"Roter Seal\",\"productDesc\":\"Seal for SLD device\",\"productCost\":\"13.100\",\"productQuantity\":\"1\",\"productPrize\":\"13.10\"}]','2020-10-02 06:44:01','2020-10-02 06:44:01','harshuj'),(6,'testing','2020-07-03 18:30:00',2226.300,400.734,2627.030,0.000,2627.030,'{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"9584444161\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}','{\"PartyName\":\"\",\"PartyAddress\":\"\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"MP04TA0123\",\"header\":\"INVOICE\"}\n','[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"1005.500\",\"productQuantity\":\"1\",\"productPrize\":\"1005.50\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"1207.700\",\"productQuantity\":\"1\",\"productPrize\":\"1207.70\"},{\"productName\":\"Roter Seal\",\"productDesc\":\"Seal for SLD device\",\"productCost\":\"13.100\",\"productQuantity\":\"1\",\"productPrize\":\"13.10\"}]','2020-10-02 06:44:13','2020-10-02 06:44:13','harshuj'),(7,'testing','2020-07-03 18:30:00',2226.300,400.734,2627.030,0.000,2627.030,'{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"9584444161\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}','{\"PartyName\":\"\",\"PartyAddress\":\"\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"MP04TA0123\",\"header\":\"INVOICE\"}\n','[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"1005.500\",\"productQuantity\":\"1\",\"productPrize\":\"1005.50\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"1207.700\",\"productQuantity\":\"1\",\"productPrize\":\"1207.70\"},{\"productName\":\"Roter Seal\",\"productDesc\":\"Seal for SLD device\",\"productCost\":\"13.100\",\"productQuantity\":\"1\",\"productPrize\":\"13.10\"}]','2020-10-02 06:46:26','2020-10-02 06:46:26','harshuj'),(8,'testing','2020-07-03 18:30:00',2226.300,400.734,2627.030,0.000,2627.030,'{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"9584444161\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}','{\"PartyName\":\"\",\"PartyAddress\":\"\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"MP04TA0123\",\"header\":\"INVOICE\"}\n','[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"1005.500\",\"productQuantity\":\"1\",\"productPrize\":\"1005.50\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"1207.700\",\"productQuantity\":\"1\",\"productPrize\":\"1207.70\"},{\"productName\":\"Roter Seal\",\"productDesc\":\"Seal for SLD device\",\"productCost\":\"13.100\",\"productQuantity\":\"1\",\"productPrize\":\"13.10\"}]','2020-10-02 06:46:28','2020-10-02 06:46:28','harshuj'),(9,'testing','2020-07-03 18:30:00',2226.300,400.734,2627.030,0.000,2627.030,'{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"9584444161\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}','{\"PartyName\":\"\",\"PartyAddress\":\"\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"MP04TA0123\",\"header\":\"INVOICE\"}\n','[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"1005.500\",\"productQuantity\":\"1\",\"productPrize\":\"1005.50\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"1207.700\",\"productQuantity\":\"1\",\"productPrize\":\"1207.70\"},{\"productName\":\"Roter Seal\",\"productDesc\":\"Seal for SLD device\",\"productCost\":\"13.100\",\"productQuantity\":\"1\",\"productPrize\":\"13.10\"}]','2020-10-02 06:46:29','2020-10-02 06:46:29','harshuj'),(10,'testing','2020-07-03 18:30:00',2226.300,400.734,2627.030,0.000,2627.030,'{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"9584444161\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}','{\"PartyName\":\"\",\"PartyAddress\":\"\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"MP04TA0123\",\"header\":\"INVOICE\"}\n','[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"1005.500\",\"productQuantity\":\"1\",\"productPrize\":\"1005.50\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"1207.700\",\"productQuantity\":\"1\",\"productPrize\":\"1207.70\"},{\"productName\":\"Roter Seal\",\"productDesc\":\"Seal for SLD device\",\"productCost\":\"13.100\",\"productQuantity\":\"1\",\"productPrize\":\"13.10\"}]','2020-10-02 06:48:25','2020-10-02 06:48:25','harshuj'),(11,'005/-2021','2020-10-01 18:30:00',0.000,0.000,0.000,0.000,0.000,'{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"9584444161\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}','{\"PartyName\":\"\",\"PartyAddress\":\"\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"MP04TA0123\",\"header\":\"INVOICE\"}','[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"1005.500\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"1207.100\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Roter Seal\",\"productDesc\":\"Seal for SLD device\",\"productCost\":\"13.500\",\"productQuantity\":\"\",\"productPrize\":\"\"}]','2020-10-02 06:54:23','2020-10-02 06:54:23','gouravdubey'),(12,'006/-2021','2020-10-01 18:30:00',0.000,0.000,0.000,0.000,0.000,'{\"selfName\":\"Saniya Enterprises\",\"selfAddress\":\"Bhopal Madhya Pradesh\",\"selfPhone\":\"9584444161\",\"selfGst\":\"23CPFPD6088B1Z8\",\"gstPercent\":\"18\"}','{\"PartyName\":\"\",\"PartyAddress\":\"\",\"PartyPhone\":\"\",\"PartyGst\":\"\",\"Registration\":\"MP04TA0123\",\"header\":\"INVOICE\"}','[{\"productName\":\"SLD\",\"productDesc\":\"Fuel Type\",\"productCost\":\"1005.500\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"SLD\",\"productDesc\":\"Electronic\",\"productCost\":\"1207.100\",\"productQuantity\":\"\",\"productPrize\":\"\"},{\"productName\":\"Roter Seal\",\"productDesc\":\"Seal for SLD device\",\"productCost\":\"13.500\",\"productQuantity\":\"\",\"productPrize\":\"\"}]','2020-10-02 07:12:04','2020-10-02 07:12:04','gouravdubey');
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `map_id` int(6) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` varchar(255) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES (1,1,'2020-10-01 19:55:17','login','gouravdubey','users',NULL),(2,1,'2020-10-01 21:24:34','login','gouravdubey','users',NULL),(3,1,'2020-10-02 03:54:35','logout','gouravdubey','users',NULL),(4,2,'2020-10-02 03:55:04','login','ambuj','users',NULL),(5,2,'2020-10-02 04:08:17','logout','ambuj','users',NULL),(6,2,'2020-10-02 04:08:23','login','ambuj','users',NULL),(7,2,'2020-10-02 04:09:51','logout','ambuj','users',NULL),(8,1,'2020-10-02 04:10:06','login','gouravdubey','users',NULL),(9,1,'2020-10-02 04:44:33','login','gouravdubey','users',NULL),(10,1,'2020-10-02 05:50:59','login','gouravdubey','users',NULL),(11,1,'2020-10-02 06:56:03','login','gouravdubey','users',NULL),(12,1,'2020-10-02 06:56:12','logout','gouravdubey','users',NULL),(13,1,'2020-10-02 06:56:32','login','gouravdubey','users',NULL),(14,1,'2020-10-02 07:03:06','login','gouravdubey','users',NULL),(15,1,'2020-10-02 07:05:50','login','gouravdubey','users',NULL),(16,1,'2020-10-02 07:11:28','login','gouravdubey','users',NULL);
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `rate` decimal(11,3) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'SLD','Fuel Type',1005.500,'2020-03-07 18:42:02','2020-04-19 01:54:03',1),(2,'SLD','Electronic',1207.100,'2020-03-07 18:42:02','2020-10-02 04:34:30',1),(3,'Roter Seal','Seal for SLD device',13.500,'2020-03-07 18:42:02','2020-10-02 04:34:12',1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `userid` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(15) DEFAULT NULL,
  `role` varchar(10) DEFAULT 'VIEWER',
  `profile_file_name` varchar(255) DEFAULT NULL,
  `notification` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Gourav','Dubey','gouravdubey','mpbhopal','gouravdubey03@gmail.com','8770557511','2020-10-01 19:55:04','2020-10-02 04:40:01','gouravdubey','ADMIN','image.png',0),(2,'Ambuj','Dubey','ambuj','dubey','ambuj.ideata@gmail.com','9753750955','2020-10-02 03:54:56','2020-10-02 03:54:56',NULL,'VIEWER',NULL,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-02 12:45:09
