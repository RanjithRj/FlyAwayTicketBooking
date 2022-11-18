/*
SQLyog Community v9.30 
MySQL - 5.6.25-log : Database - flyawayticket
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`flyawayticket` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `flyawayticket`;

/*Table structure for table `a_book` */

DROP TABLE IF EXISTS `a_book`;

CREATE TABLE `a_book` (
  `ID` bigint(20) NOT NULL,
  `flightId` bigint(20) DEFAULT NULL,
  `flightName` varchar(225) DEFAULT NULL,
  `firstName` varchar(225) DEFAULT NULL,
  `lastName` varchar(225) DEFAULT NULL,
  `mobileNo` varchar(225) DEFAULT NULL,
  `bookDate` date DEFAULT NULL,
  `emailId` varchar(225) DEFAULT NULL,
  `address` varchar(755) DEFAULT NULL,
  `noOfPerson` bigint(20) DEFAULT NULL,
  `price` bigint(20) DEFAULT NULL,
  `finalPrice` bigint(20) DEFAULT NULL,
  `createdBy` varchar(225) DEFAULT NULL,
  `modifiedBy` varchar(225) DEFAULT NULL,
  `createdDatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedDatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `FK_a_book` (`flightId`),
  CONSTRAINT `FK_a_book` FOREIGN KEY (`flightId`) REFERENCES `a_flight` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `a_book` */

insert  into `a_book`(`ID`,`flightId`,`flightName`,`firstName`,`lastName`,`mobileNo`,`bookDate`,`emailId`,`address`,`noOfPerson`,`price`,`finalPrice`,`createdBy`,`modifiedBy`,`createdDatetime`,`modifiedDatetime`) values (1,1,'AIR INDIA','Hariom','Mukati','9165415598','2019-06-21','Shubham@gmail.com','BDGIGIGD',1,0,1200,'root','root','2019-06-20 18:32:53','2019-06-20 18:32:53'),(2,2,'Jet AirWay','Hariom','Mukati','9165415598','2019-06-21','nyqaf@mailinator.net','BDGIGIGD',2,1300,2600,'root','root','2019-06-20 18:35:16','2019-06-20 18:35:16'),(3,1,'AIR INDIA','Hariom','Mukati','9165415598','2019-06-21','guviq@mailinator.net','BDGIGIGD',1,1200,1200,'root','root','2019-06-20 18:37:37','2019-06-20 18:37:37'),(4,2,'Jet AirWay','Hariom','Mukati','9165415598','2019-06-21','byti@mailinator.net','BDGIGIGD',1,1300,1300,'root','root','2019-06-20 18:38:08','2019-06-20 18:38:08');

/*Table structure for table `a_flight` */

DROP TABLE IF EXISTS `a_flight`;

CREATE TABLE `a_flight` (
  `ID` bigint(20) NOT NULL,
  `flightNo` varchar(225) DEFAULT NULL,
  `fightName` varchar(225) DEFAULT NULL,
  `fromCity` varchar(225) DEFAULT NULL,
  `toCity` varchar(225) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `description` varchar(775) DEFAULT NULL,
  `time` varchar(225) DEFAULT NULL,
  `travelDuraion` varchar(225) DEFAULT NULL,
  `ticketPrice` bigint(20) DEFAULT NULL,
  `airPortName` varchar(225) DEFAULT NULL,
  `createdBy` varchar(225) DEFAULT NULL,
  `modifiedBy` varchar(225) DEFAULT NULL,
  `createdDatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedDatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `a_flight` */

insert  into `a_flight`(`ID`,`flightNo`,`fightName`,`fromCity`,`toCity`,`date`,`description`,`time`,`travelDuraion`,`ticketPrice`,`airPortName`,`createdBy`,`modifiedBy`,`createdDatetime`,`modifiedDatetime`) values (1,'5VJ52','AIR INDIA','Indore','Mumbai','2019-06-21','DG wr9f GIG isgifg','10:00 AM','60 Minute',1200,'Devi Ahilya InterNational','Admin@gmail.com','Admin@gmail.com','2019-06-20 10:09:27','2019-06-20 10:09:27'),(2,'5VJ51','Jet AirWay','Indore','Dehli','2019-06-21','HOHO dvsoi srfo','11:00 AM','150 Minute',1300,'Devi Ahilya InterNational','Admin@gmail.com','Admin@gmail.com','2019-06-20 10:11:42','2019-06-20 10:11:42');

/*Table structure for table `a_user` */

DROP TABLE IF EXISTS `a_user`;

CREATE TABLE `a_user` (
  `ID` bigint(20) NOT NULL,
  `firstName` varchar(225) DEFAULT NULL,
  `lastName` varchar(225) DEFAULT NULL,
  `login` varchar(225) DEFAULT NULL,
  `password` varchar(225) DEFAULT NULL,
  `roleId` bigint(20) DEFAULT NULL,
  `createdBy` varchar(225) DEFAULT NULL,
  `modifiedBy` varchar(225) DEFAULT NULL,
  `createdDatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedDatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `a_user` */

insert  into `a_user`(`ID`,`firstName`,`lastName`,`login`,`password`,`roleId`,`createdBy`,`modifiedBy`,`createdDatetime`,`modifiedDatetime`) values (1,'Admin','Admin','Admin@gmail.com','Admin@123',1,'root','root','2019-06-19 18:16:48','2019-06-19 18:16:51');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
