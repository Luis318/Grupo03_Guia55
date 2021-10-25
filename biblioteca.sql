# SQL-Front 5.1  (Build 4.16)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;


# Host: 127.0.0.1:3308    Database: biblioteca
# ------------------------------------------------------
# Server version 5.5.5-10.1.13-MariaDB

DROP DATABASE IF EXISTS `biblioteca`;
CREATE DATABASE `biblioteca` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `biblioteca`;

#
# Source for table libro
#

DROP TABLE IF EXISTS `libro`;
CREATE TABLE `libro` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `isbn` int(11) NOT NULL DEFAULT '0',
  `titulo` varchar(255) NOT NULL DEFAULT 'nombreT',
  `autor` varchar(255) NOT NULL DEFAULT 'nombreA',
  `editorial` varchar(255) NOT NULL DEFAULT 'nombreE',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

#
# Dumping data for table libro
#

LOCK TABLES `libro` WRITE;
/*!40000 ALTER TABLE `libro` DISABLE KEYS */;
INSERT INTO `libro` VALUES (6,218626417,'Jose','Carlitos','Monte Negro');
INSERT INTO `libro` VALUES (9,124441,'La Ileada','Homero','Casa de libro');
INSERT INTO `libro` VALUES (12,1626594,'Sherlock holmes','Arthur Conan Doyle','El mundo');
INSERT INTO `libro` VALUES (38,65489521,'La vaca lola','Luis','Masferrer');
/*!40000 ALTER TABLE `libro` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table users
#

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(12) COLLATE latin1_spanish_ci NOT NULL DEFAULT 'Anonimo',
  `password` varchar(255) COLLATE latin1_spanish_ci NOT NULL DEFAULT 'm1sm4',
  `nombre` varchar(100) COLLATE latin1_spanish_ci NOT NULL DEFAULT 'Anonimo Anonimo',
  `nivel` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

#
# Dumping data for table users
#

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','1','Luis',2);
INSERT INTO `users` VALUES (2,'Vice','2','Josué',1);
INSERT INTO `users` VALUES (3,'Preci','3','Ricardo',2);
INSERT INTO `users` VALUES (4,'','','',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
