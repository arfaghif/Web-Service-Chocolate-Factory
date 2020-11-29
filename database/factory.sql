-- MariaDB dump 10.17  Distrib 10.4.14-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: factory
-- ------------------------------------------------------
-- Server version	10.4.14-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bahan`
--

DROP TABLE IF EXISTS `bahan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bahan` (
  `idbahan` int(11) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `exp` date NOT NULL,
  PRIMARY KEY (`idbahan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bahan`
--

LOCK TABLES `bahan` WRITE;
/*!40000 ALTER TABLE `bahan` DISABLE KEYS */;
INSERT INTO `bahan` VALUES (1,'Coklat',10,'2020-12-08'),(2,'Kacang',10,'2020-12-08'),(3,'Keju',10,'2020-12-06'),(4,'Oreo',10,'2020-12-08'),(5,'Susu',10,'2020-12-08'),(6,'Waffle',10,'2020-12-08');
/*!40000 ALTER TABLE `bahan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `choc_avail`
--

DROP TABLE IF EXISTS `choc_avail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `choc_avail` (
  `idcoklat` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(45) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  PRIMARY KEY (`idcoklat`),
  UNIQUE KEY `idcoklat_UNIQUE` (`idcoklat`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choc_avail`
--

LOCK TABLES `choc_avail` WRITE;
/*!40000 ALTER TABLE `choc_avail` DISABLE KEYS */;
INSERT INTO `choc_avail` VALUES (1,'waffle 1',10),(2,'waffle 2',7),(3,'waffle 3',11),(4,'waffle 4',0),(5,'waffle 5',0),(6,'waffle 6',0),(7,'choco 1',0),(8,'choco 2',0),(9,'choco 3',0),(10,'choco 4',0),(11,'choco 5',0),(12,'choco 6',0),(13,'brownies 1',0),(14,'brownies 2',0),(15,'brownies 3',0),(16,'brownies 4',0),(17,'brownies 5',0),(18,'brownies 6',0);
/*!40000 ALTER TABLE `choc_avail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_stock`
--

DROP TABLE IF EXISTS `request_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_stock` (
  `idreq` int(11) NOT NULL AUTO_INCREMENT,
  `idcoklat` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`idreq`),
  UNIQUE KEY `id_req_UNIQUE` (`idreq`),
  KEY `id_coklat_idx` (`idcoklat`),
  CONSTRAINT `id_coklat` FOREIGN KEY (`idcoklat`) REFERENCES `choc_avail` (`idcoklat`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_stock`
--

LOCK TABLES `request_stock` WRITE;
/*!40000 ALTER TABLE `request_stock` DISABLE KEYS */;
INSERT INTO `request_stock` VALUES (1,1,2,0),(2,3,1,0),(3,2,1,1);
/*!40000 ALTER TABLE `request_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resep`
--

DROP TABLE IF EXISTS `resep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resep` (
  `idresep` int(11) NOT NULL,
  `idcoklat` int(11) DEFAULT NULL,
  `idbahan` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  PRIMARY KEY (`idresep`),
  KEY `idcoklat_idx` (`idcoklat`),
  KEY `idbahan_idx` (`idbahan`),
  CONSTRAINT `idbahan` FOREIGN KEY (`idbahan`) REFERENCES `bahan` (`idbahan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idcoklat` FOREIGN KEY (`idcoklat`) REFERENCES `choc_avail` (`idcoklat`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resep`
--

LOCK TABLES `resep` WRITE;
/*!40000 ALTER TABLE `resep` DISABLE KEYS */;
INSERT INTO `resep` VALUES (1,1,1,2),(2,1,2,2),(3,1,3,1),(4,2,1,1),(5,2,2,3),(6,2,4,1),(7,3,1,3),(8,3,2,2),(9,3,5,1),(10,4,1,2),(11,4,4,3),(12,4,5,2),(13,5,6,3),(14,5,2,4),(15,5,1,2),(16,6,3,4),(17,6,5,3),(18,6,4,1),(19,7,2,2),(20,7,3,4),(21,7,1,4),(22,8,6,3),(23,8,4,3),(24,8,5,1),(25,9,2,3),(26,9,4,3),(27,9,3,1),(28,10,2,1),(29,10,4,3),(30,10,3,4),(31,11,6,4),(32,11,1,3),(33,11,4,4),(34,12,3,2),(35,12,1,3),(36,12,2,2),(37,13,5,1),(38,13,4,3),(39,13,2,4),(40,14,5,2),(41,14,1,2),(42,14,4,3),(43,15,5,1),(44,15,6,4),(45,15,2,3),(46,16,3,2),(47,16,5,4),(48,16,2,1),(49,17,2,4),(50,17,3,4),(51,17,1,2),(52,18,6,4),(53,18,2,3),(54,18,1,4);
/*!40000 ALTER TABLE `resep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saldo`
--

DROP TABLE IF EXISTS `saldo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saldo` (
  `value` int(11) NOT NULL,
  PRIMARY KEY (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saldo`
--

LOCK TABLES `saldo` WRITE;
/*!40000 ALTER TABLE `saldo` DISABLE KEYS */;
INSERT INTO `saldo` VALUES (1000000);
/*!40000 ALTER TABLE `saldo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(1024) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
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

-- Dump completed on 2020-11-29 14:58:16
