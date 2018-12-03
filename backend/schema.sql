-- MySQL dump 10.17  Distrib 10.3.11-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: cse331
-- ------------------------------------------------------
-- Server version	10.3.11-MariaDB-1:10.3.11+maria~bionic-log

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
-- Table structure for table `BlacklistedWebsites`
--

DROP TABLE IF EXISTS `BlacklistedWebsites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BlacklistedWebsites` (
  `URL` varchar(2083) NOT NULL,
  `RedirectURL` varchar(2083) DEFAULT NULL,
  PRIMARY KEY (`URL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BlacklistedWebsites`
--

LOCK TABLES `BlacklistedWebsites` WRITE;
/*!40000 ALTER TABLE `BlacklistedWebsites` DISABLE KEYS */;
/*!40000 ALTER TABLE `BlacklistedWebsites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Client`
--

DROP TABLE IF EXISTS `Client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Client` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CellPhone` varchar(15) DEFAULT NULL,
  `StreetAddress` varchar(80) DEFAULT NULL,
  `Email` varchar(60) DEFAULT NULL,
  `SSN` char(11) DEFAULT NULL,
  `FirstName` varchar(30) DEFAULT NULL,
  `LastName` varchar(30) DEFAULT NULL,
  `BirthDate` varchar(15) DEFAULT NULL,
  `City` varchar(30) DEFAULT NULL,
  `Country` varchar(40) DEFAULT NULL,
  `ZipCode` varchar(15) DEFAULT NULL,
  `State` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Client`
--

LOCK TABLES `Client` WRITE;
/*!40000 ALTER TABLE `Client` DISABLE KEYS */;
/*!40000 ALTER TABLE `Client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ComplexForms`
--

DROP TABLE IF EXISTS `ComplexForms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ComplexForms` (
  `CID` int(10) unsigned NOT NULL,
  `JSONFORM` varchar(3068) NOT NULL,
  `URL` varchar(2083) DEFAULT NULL,
  PRIMARY KEY (`CID`,`JSONFORM`),
  CONSTRAINT `ComplexForms_ibfk_1` FOREIGN KEY (`CID`) REFERENCES `Client` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ComplexForms`
--

LOCK TABLES `ComplexForms` WRITE;
/*!40000 ALTER TABLE `ComplexForms` DISABLE KEYS */;
/*!40000 ALTER TABLE `ComplexForms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cookies`
--

DROP TABLE IF EXISTS `Cookies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cookies` (
  `CID` int(10) unsigned NOT NULL,
  `URL` varchar(2083) NOT NULL,
  `Content` text DEFAULT NULL,
  `Name` varchar(80) NOT NULL,
  PRIMARY KEY (`CID`,`URL`,`Name`),
  CONSTRAINT `Cookies_ibfk_1` FOREIGN KEY (`CID`) REFERENCES `Client` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cookies`
--

LOCK TABLES `Cookies` WRITE;
/*!40000 ALTER TABLE `Cookies` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cookies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Credentials`
--

DROP TABLE IF EXISTS `Credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Credentials` (
  `Username` varchar(60) NOT NULL,
  `UserPassword` varchar(60) DEFAULT NULL,
  `URL` varchar(2083) NOT NULL,
  `CID` int(10) unsigned NOT NULL,
  `MFA` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Username`,`URL`,`CID`),
  KEY `CID` (`CID`),
  CONSTRAINT `Credentials_ibfk_1` FOREIGN KEY (`CID`) REFERENCES `Client` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Credentials`
--

LOCK TABLES `Credentials` WRITE;
/*!40000 ALTER TABLE `Credentials` DISABLE KEYS */;
/*!40000 ALTER TABLE `Credentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CreditCard`
--

DROP TABLE IF EXISTS `CreditCard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CreditCard` (
  `CreditCardNumber` varchar(20) NOT NULL,
  `CVC` char(3) DEFAULT NULL,
  `ExpirationDate` varchar(30) DEFAULT NULL,
  `CID` int(10) unsigned NOT NULL,
  `Type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`CreditCardNumber`),
  KEY `CID` (`CID`),
  CONSTRAINT `CreditCard_ibfk_1` FOREIGN KEY (`CID`) REFERENCES `Client` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CreditCard`
--

LOCK TABLES `CreditCard` WRITE;
/*!40000 ALTER TABLE `CreditCard` DISABLE KEYS */;
/*!40000 ALTER TABLE `CreditCard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FormIDMappings`
--

DROP TABLE IF EXISTS `FormIDMappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FormIDMappings` (
  `URL` varchar(2083) DEFAULT NULL,
  `LocalDef` enum('Username','UserPassword','FirstName','LastName','CellPhone','StreetAddress','Email','SSN','BirthDate','URL','MFA','CreditCardNumber','CVC','ExpirationDate','Type','Question','Answer','City','ZipCode','State','Country') DEFAULT NULL,
  `RemoteDef` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FormIDMappings`
--

LOCK TABLES `FormIDMappings` WRITE;
/*!40000 ALTER TABLE `FormIDMappings` DISABLE KEYS */;
INSERT INTO `FormIDMappings` VALUES ('*','FirstName','FirstName'),('*','LastName','LastName'),('*','CellPhone','phone'),('*','StreetAddress','StreetAddress'),('*','Email','email'),('*','SSN','ssn'),('*','BirthDate','DOB'),('*','URL','url'),('*','CreditCardNumber','ccn'),('*','CVC','cvc'),('*','ExpirationDate','exp'),('*','Type','type'),('*','Question','Q'),('*','Answer','A'),('*','City','city'),('*','State','state'),('*','ZipCode','ZipCode'),('*','Country','Country'),('*','Question','Q2'),('*','Question','Q3'),('*','FirstName','FirstName2'),('*','Country','Country2'),('*','Question','Q5'),('*','Question','Q4'),('*','Answer','A1'),('*','Answer','A2'),('*','Answer','A3'),('*','Username','username'),('*','MFA','mfa'),('*','Username','uname'),('*','Username','uname2');
/*!40000 ALTER TABLE `FormIDMappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PendingPayloads`
--

DROP TABLE IF EXISTS `PendingPayloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PendingPayloads` (
  `ClientID` int(10) unsigned NOT NULL,
  `Payload` text DEFAULT NULL,
  PRIMARY KEY (`ClientID`),
  CONSTRAINT `PendingPayloads_ibfk_1` FOREIGN KEY (`ClientID`) REFERENCES `Client` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PendingPayloads`
--

LOCK TABLES `PendingPayloads` WRITE;
/*!40000 ALTER TABLE `PendingPayloads` DISABLE KEYS */;
/*!40000 ALTER TABLE `PendingPayloads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SecurityQuestions`
--

DROP TABLE IF EXISTS `SecurityQuestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SecurityQuestions` (
  `CID` int(10) unsigned NOT NULL,
  `Question` varchar(80) NOT NULL,
  `Answer` varchar(80) DEFAULT NULL,
  `URL` varchar(2083) NOT NULL,
  PRIMARY KEY (`CID`,`Question`,`URL`),
  CONSTRAINT `SecurityQuestions_ibfk_1` FOREIGN KEY (`CID`) REFERENCES `Client` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SecurityQuestions`
--

LOCK TABLES `SecurityQuestions` WRITE;
/*!40000 ALTER TABLE `SecurityQuestions` DISABLE KEYS */;
/*!40000 ALTER TABLE `SecurityQuestions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-03  4:10:51
