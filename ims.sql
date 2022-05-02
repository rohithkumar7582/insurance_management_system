-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.41-3ubuntu12.10


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema insurance
--

CREATE DATABASE IF NOT EXISTS insurance;
USE insurance;

--
-- Definition of table `insurance`.`Holderinst`
--

DROP TABLE IF EXISTS `insurance`.`Holderinst`;
CREATE TABLE  `insurance`.`Holderinst` (
  `HinstId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `HolderId` int(10) unsigned NOT NULL,
  `Pinstid` int(10) unsigned NOT NULL,
  `Amt` int(10) unsigned NOT NULL,
  `Duedt` varchar(45) NOT NULL,
  `Received` varchar(45) NOT NULL,
  `Rdt` varchar(45) NOT NULL,
  `Amount` int(10) unsigned NOT NULL,
  `Mode` varchar(45) NOT NULL,
  `Chno` varchar(45) NOT NULL,
  `Bank` varchar(45) NOT NULL,
  `cdt` varchar(45) NOT NULL,
  PRIMARY KEY (`HinstId`),
  KEY `HolderId` (`HolderId`),
  KEY `Pinstid` (`Pinstid`),
  CONSTRAINT `HolderId` FOREIGN KEY (`HolderId`) REFERENCES `holders` (`HolderId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Pinstid` FOREIGN KEY (`Pinstid`) REFERENCES `policyinst` (`Pinstid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `insurance`.`Holderinst`
--

/*!40000 ALTER TABLE `Holderinst` DISABLE KEYS */;
LOCK TABLES `Holderinst` WRITE;
INSERT INTO `insurance`.`Holderinst` VALUES  (1,1,1,100,'2011-09-09','qq','2009-10-10',2000,'cash','676767','sbi','cc'),
 (2,1,1,0,'2011-04-12','null','2011-04-12',56,'null','null','null','2011-04-05'),
 (3,1,1,0,'2011-04-12','null','2011-04-12',56,'null','null','null','2011-04-05'),
 (4,3,1,555,'01-03-2010','sfdsf','03-02-1999',12312,'dfds','erewr','ewrwer','03-00-1010');
UNLOCK TABLES;
/*!40000 ALTER TABLE `Holderinst` ENABLE KEYS */;


--
-- Definition of table `insurance`.`categories`
--

DROP TABLE IF EXISTS `insurance`.`categories`;
CREATE TABLE  `insurance`.`categories` (
  `cid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cname` varchar(20) NOT NULL,
  `cdetails` varchar(45) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `insurance`.`categories`
--

/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
LOCK TABLES `categories` WRITE;
INSERT INTO `insurance`.`categories` VALUES  (1,'vehicle','insurance'),
 (3,'health','lll'),
 (5,'Employee','Employee Category'),
 (7,'home','homecategory'),
 (8,'life','insurance'),
 (9,'car','car details'),
 (10,'jhj','jhj'),
 (11,'lkl','lkl');
UNLOCK TABLES;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;


--
-- Definition of table `insurance`.`companies`
--

DROP TABLE IF EXISTS `insurance`.`companies`;
CREATE TABLE  `insurance`.`companies` (
  `Compid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Compname` varchar(20) NOT NULL,
  `Address` varchar(60) NOT NULL,
  `City` varchar(20) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `Email` varchar(25) NOT NULL,
  `web` varchar(25) NOT NULL,
  PRIMARY KEY (`Compid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `insurance`.`companies`
--

/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
LOCK TABLES `companies` WRITE;
INSERT INTO `insurance`.`companies` VALUES  (2,'HCL','MPnagarzone1','bhopal','0755420282','vedisoft@ghcom','www.hcl.com'),
 (9,'progressive','dfg','bhj','789054322','uiop@jghj','etetett'),
 (11,'Bajaj','ZoneMpNagar','Bhopal','75534532345','bajaj.alliance@gmail.com','www.Bajaj.com'),
 (12,'Kalptaru ','Bittan Market','bhopal','4355994','kalptaru@yahoo.com','wwwkalptaru'),
 (13,'Lic','MalviyaNagar','Bhopal','4565435','lia@gmail.com','wwlic'),
 (14,'accenture','Zone','bhopal','3456789912','sfg@uiot','www.accenture.com'),
 (15,'reliance','new market 123','Bhopal','1234567890','rl@rle.com','www.reliance.com');
UNLOCK TABLES;
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;


--
-- Definition of table `insurance`.`holders`
--

DROP TABLE IF EXISTS `insurance`.`holders`;
CREATE TABLE  `insurance`.`holders` (
  `HolderId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Hname` varchar(45) NOT NULL,
  `Hadd` varchar(45) NOT NULL,
  `Hcity` varchar(45) NOT NULL,
  `Hstate` varchar(45) NOT NULL,
  `Hemail` varchar(45) NOT NULL,
  `Hmobile` varchar(45) NOT NULL,
  `PDid` int(11) NOT NULL,
  PRIMARY KEY (`HolderId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `insurance`.`holders`
--

/*!40000 ALTER TABLE `holders` DISABLE KEYS */;
LOCK TABLES `holders` WRITE;
INSERT INTO `insurance`.`holders` VALUES  (1,'sanjida','bhel','bhopal','mp','sk@yahoo','7879065',1),
 (3,'gunjan','bhel','bhopal','mp','gunjan@yahoo.com','8982720000',1),
 (4,'ram','malviya nagar','bhopal','Maharastra','ram@fjk.c','66543594',1),
 (5,'sss','bhel','bhopal','mp','sk@yahoo','7879065',1),
 (6,'kehkasha','mayur vihar','bhopal','M.P','kehkasha.33@yahoomail.com','45675753878',2),
 (7,'manish','nehru nagar','indore','M.P','manu.tanu@gmail.com','9809560966',1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `holders` ENABLE KEYS */;


--
-- Definition of table `insurance`.`policies`
--

DROP TABLE IF EXISTS `insurance`.`policies`;
CREATE TABLE  `insurance`.`policies` (
  `Pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Compid` int(10) unsigned NOT NULL,
  `Cid` int(10) unsigned NOT NULL,
  `Pname` varchar(45) NOT NULL,
  `Pdesc` varchar(45) NOT NULL,
  PRIMARY KEY (`Pid`),
  KEY `Compid` (`Compid`),
  KEY `Cid` (`Cid`),
  CONSTRAINT `Cid` FOREIGN KEY (`Cid`) REFERENCES `categories` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Compid` FOREIGN KEY (`Compid`) REFERENCES `companies` (`Compid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `insurance`.`policies`
--

/*!40000 ALTER TABLE `policies` DISABLE KEYS */;
LOCK TABLES `policies` WRITE;
INSERT INTO `insurance`.`policies` VALUES  (1,9,1,'education policy','scholarship'),
 (2,11,3,'medical policy','insurance for medical'),
 (3,15,1,'vehicle Policy','policy for vehicle insurance'),
 (4,2,7,'home policy','Policy for House insurance'),
 (5,2,7,'home policy','Policy for House insurance');
UNLOCK TABLES;
/*!40000 ALTER TABLE `policies` ENABLE KEYS */;


--
-- Definition of table `insurance`.`policydetails`
--

DROP TABLE IF EXISTS `insurance`.`policydetails`;
CREATE TABLE  `insurance`.`policydetails` (
  `PDid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Pid` int(10) unsigned DEFAULT NULL,
  `Op1` varchar(45) NOT NULL,
  `Opt` varchar(45) NOT NULL,
  `Amt` int(10) unsigned NOT NULL,
  PRIMARY KEY (`PDid`),
  KEY `Pid` (`Pid`),
  CONSTRAINT `Pid` FOREIGN KEY (`Pid`) REFERENCES `policies` (`Pid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `insurance`.`policydetails`
--

/*!40000 ALTER TABLE `policydetails` DISABLE KEYS */;
LOCK TABLES `policydetails` WRITE;
INSERT INTO `insurance`.`policydetails` VALUES  (1,1,'fgf45','monthly',35000),
 (2,1,'abc','yearly',350000),
 (3,1,'asd13','abc',6747);
UNLOCK TABLES;
/*!40000 ALTER TABLE `policydetails` ENABLE KEYS */;


--
-- Definition of table `insurance`.`policyinst`
--

DROP TABLE IF EXISTS `insurance`.`policyinst`;
CREATE TABLE  `insurance`.`policyinst` (
  `Pinstid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PDid` int(10) unsigned NOT NULL,
  `Instno` int(10) unsigned NOT NULL,
  `amt` int(10) unsigned NOT NULL,
  `Insttype` varchar(45) NOT NULL,
  PRIMARY KEY (`Pinstid`),
  KEY `PDid` (`PDid`),
  CONSTRAINT `PDid` FOREIGN KEY (`PDid`) REFERENCES `policydetails` (`PDid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `insurance`.`policyinst`
--

/*!40000 ALTER TABLE `policyinst` DISABLE KEYS */;
LOCK TABLES `policyinst` WRITE;
INSERT INTO `insurance`.`policyinst` VALUES  (1,1,234,5600,'fgh'),
 (2,1,234,5600,'fgh'),
 (3,2,333,5345,'fgh'),
 (4,1,12,12000,'abcd'),
 (5,2,123,57657,'cheque'),
 (6,1,122,1000,'cash'),
 (7,1,156,5567,'cash'),
 (8,1,466,5654,'');
UNLOCK TABLES;
/*!40000 ALTER TABLE `policyinst` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
