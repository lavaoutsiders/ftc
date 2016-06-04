-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: hardware-inventory.c6co0t2aiynq.us-west-1.rds.amazonaws.com    Database: ftc
-- ------------------------------------------------------
-- Server version	5.7.11-log

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
-- Table structure for table `bestelt`
--

DROP TABLE IF EXISTS `bestelt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bestelt` (
  `klantID` int(11) NOT NULL,
  `computerNr` int(11) NOT NULL,
  `bestelnr` int(11) NOT NULL AUTO_INCREMENT,
  `aantal` int(11) DEFAULT NULL,
  `toestand` varchar(50) DEFAULT 'Niet klaar',
  `extraInfo` varchar(90) DEFAULT NULL,
  `emailV` varchar(50) DEFAULT NULL,
  `emailT` varchar(50) DEFAULT NULL,
  `afleveringsdatum` date DEFAULT NULL,
  PRIMARY KEY (`bestelnr`),
  KEY `IX_klaBes` (`klantID`),
  KEY `IX_comBes` (`computerNr`),
  KEY `IX_Relationship1` (`emailV`),
  KEY `IX_Relationship2` (`emailT`),
  KEY `emailV` (`emailV`),
  CONSTRAINT `Relationship1` FOREIGN KEY (`emailV`) REFERENCES `verkoper` (`email`),
  CONSTRAINT `Relationship2` FOREIGN KEY (`emailT`) REFERENCES `technicus` (`email`),
  CONSTRAINT `comBes` FOREIGN KEY (`computerNr`) REFERENCES `computerModel` (`computerNr`),
  CONSTRAINT `klaBes` FOREIGN KEY (`klantID`) REFERENCES `klant` (`klantID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bestelt`
--

LOCK TABLES `bestelt` WRITE;
/*!40000 ALTER TABLE `bestelt` DISABLE KEYS */;
INSERT INTO `bestelt` VALUES (3,3,24,2,'Bezig',NULL,'Filip@hotmail.com','jianing@hotmail.com','2016-05-18'),(5,4,25,2,'Niet klaar','Win7 install','Filip@hotmail.com','tomasz@hotmail.com','2016-05-29');
/*!40000 ALTER TABLE `bestelt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `computerModel`
--

DROP TABLE IF EXISTS `computerModel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `computerModel` (
  `computerNr` int(11) NOT NULL AUTO_INCREMENT,
  `beschrijving` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`computerNr`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `computerModel`
--

LOCK TABLES `computerModel` WRITE;
/*!40000 ALTER TABLE `computerModel` DISABLE KEYS */;
INSERT INTO `computerModel` VALUES (3,'Ipad2 16G+Wifi'),(4,'Acer aspire 120GB SSD 500GB SSD'),(5,'Samsung Flat Panel Monitor'),(6,'Ipad4 32GB+3G');
/*!40000 ALTER TABLE `computerModel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `klant`
--

DROP TABLE IF EXISTS `klant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `klant` (
  `klantID` int(11) NOT NULL AUTO_INCREMENT,
  `naam` varchar(20) DEFAULT NULL,
  `voornaam` varchar(20) DEFAULT NULL,
  `telefoonnr` varchar(20) DEFAULT NULL,
  `adres` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`klantID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klant`
--

LOCK TABLES `klant` WRITE;
/*!40000 ALTER TABLE `klant` DISABLE KEYS */;
INSERT INTO `klant` VALUES (3,'Subedi','Ajon','484673493','bombardenvest 1 Antwerpen 2060'),(4,'Gromek','Timo','484327689','Groenplaats 2 Antwerpen 2060'),(5,'Arnou','Annie','483278862','Dieselweg 3 Merksem 2013');
/*!40000 ALTER TABLE `klant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technicus`
--

DROP TABLE IF EXISTS `technicus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `technicus` (
  `naam` varchar(20) DEFAULT NULL,
  `voornaam` varchar(20) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `wachtwoord` varchar(100) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `niveau` char(1) NOT NULL DEFAULT 't',
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technicus`
--

LOCK TABLES `technicus` WRITE;
/*!40000 ALTER TABLE `technicus` DISABLE KEYS */;
INSERT INTO `technicus` VALUES ('Tsang','Benjiamin','benji@hotmail.com','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',0,'t'),('Li','Jianing','jianing@hotmail.com','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',1,'t'),('Lin','Feng','lin.feng55@hotmail.com','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',1,'t'),('Gromek','Tomasz','tomasz@hotmail.com','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',0,'t');
/*!40000 ALTER TABLE `technicus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verkoper`
--

DROP TABLE IF EXISTS `verkoper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verkoper` (
  `naam` varchar(20) DEFAULT NULL,
  `voornaam` varchar(20) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `wachtwoord` varchar(100) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `niveau` char(1) NOT NULL DEFAULT 'v',
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verkoper`
--

LOCK TABLES `verkoper` WRITE;
/*!40000 ALTER TABLE `verkoper` DISABLE KEYS */;
INSERT INTO `verkoper` VALUES ('Chen','Fabio','Fabio@hotmail.com','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',1,'v'),('Ellen','Filip','Filip@hotmail.com','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',0,'v'),('El','Lotfi','Lotfi@hotmail.com','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',0,'v');
/*!40000 ALTER TABLE `verkoper` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-04 13:01:58
