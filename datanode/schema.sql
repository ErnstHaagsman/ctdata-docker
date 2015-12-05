CREATE DATABASE  IF NOT EXISTS `ctdata` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ctdata`;
-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: 127.0.0.1    Database: ctdata
-- ------------------------------------------------------
-- Server version	5.7.9

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
-- Table structure for table `Observations`
--

DROP TABLE IF EXISTS `Observations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Observations` (
  `Raspberry_Node` varchar(100) NOT NULL COMMENT 'Unique identifier of the raspberry node',
  `Sensor_Id` int(11) NOT NULL COMMENT 'Unique identifier of the sensor connected to the raspberry node',
  `Observation_Data` decimal(10,4) NOT NULL COMMENT 'Sensor data observation',
  `Observation_Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Time of sensor data observation',
  `Acknowledgement_Flag` char(1) NOT NULL DEFAULT 'N' COMMENT 'Acknowledgement flag for the sensor data reception',
  `Latitude` decimal(10,4) NOT NULL COMMENT 'Latitude location of the observation ',
  `Longitude` decimal(10,4) NOT NULL COMMENT 'Longitude location of the observation',
  PRIMARY KEY (`Raspberry_Node`,`Sensor_Id`,`Observation_Time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Raspberry_Nodes`
--

DROP TABLE IF EXISTS `Raspberry_Nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Raspberry_Nodes` (
  `Raspberry_Node` varchar(100) DEFAULT NULL COMMENT 'Unique identifier of the raspberry node',
  `Raspberry_Url` varchar(100) NOT NULL COMMENT 'URL of the raspberry node',
  `Gateway_Id` varchar(100) NOT NULL COMMENT 'Unique identifier of the gateway connected to the raspberry node',
  PRIMARY KEY (`Raspberry_Url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table holds data related to CONNECT messages and denotes mapping of Raspberry-Gateway';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sensors`
--

DROP TABLE IF EXISTS `Sensors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sensors` (
  `Raspberry_Node` varchar(100) CHARACTER SET latin1 NOT NULL COMMENT 'Unique identifier of the raspberry node',
  `Sensor_Id` int(11) NOT NULL COMMENT 'Unique identifier of each sensor connected to a raspberry node',
  `Polling_Frequency` int(11) NOT NULL COMMENT 'Frequency of the sensor data capture',
  `Type` varchar(100) CHARACTER SET latin1 NOT NULL COMMENT 'Type of the sensor',
  `Latitude` decimal(10,4) NOT NULL COMMENT 'Latitude of the location of the sensor',
  `Longitude` decimal(10,4) NOT NULL COMMENT 'Longitude of the location of the sensor',
  `Sensor_Name` varchar(100) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Name of the sensor',
  PRIMARY KEY (`Raspberry_Node`,`Sensor_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `User_Sensors`
--

DROP TABLE IF EXISTS `User_Sensors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_Sensors` (
  `User_Id` varchar(100) NOT NULL COMMENT 'Unique identifier of the user',
  `Raspberry_Url` varchar(100) NOT NULL COMMENT 'Unique identifier of the raspberry node',
  `Connection_Flag` char(1) NOT NULL DEFAULT 'N' COMMENT 'Flag used to mark if the Raspberry-Gateway connection has established or in progress.\n',
  PRIMARY KEY (`User_Id`,`Raspberry_Url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table holds data related to ADD_NODE messages and denotes various raspberry nodes added by a user. ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `User_Id` varchar(100) NOT NULL COMMENT 'Unique identifier of the user',
  `Password` varchar(100) NOT NULL COMMENT 'Login password of the user',
  PRIMARY KEY (`User_Id`),
  UNIQUE KEY `Password_UNIQUE` (`Password`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

COMMIT;
-- Dump completed on 2015-11-28 12:47:54
