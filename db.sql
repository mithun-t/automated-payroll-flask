/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 5.5.20-log : Database - automatedpayroll
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`automatedpayroll` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `automatedpayroll`;

/*Table structure for table `attendance` */

DROP TABLE IF EXISTS `attendance`;

CREATE TABLE `attendance` (
  `AttId` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `Date` date NOT NULL,
  `EnterTime` varchar(60) NOT NULL,
  `ExitTime` varchar(60) NOT NULL,
  PRIMARY KEY (`AttId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `attendance` */

insert  into `attendance`(`AttId`,`UserId`,`Date`,`EnterTime`,`ExitTime`) values 
(1,2,'2021-04-19','11:11:25','12:50:03'),
(2,26,'2021-04-19','12:00:00','12:30:00'),
(3,26,'2021-05-20','09:54:31','09:54:31'),
(4,26,'2021-04-20','10:43:51','11:54:55'),
(5,27,'2021-04-22','08:46:20','09:42:47');

/*Table structure for table `calls` */

DROP TABLE IF EXISTS `calls`;

CREATE TABLE `calls` (
  `CallerId` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `Phno` bigint(20) DEFAULT NULL,
  `Type` varchar(20) DEFAULT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  PRIMARY KEY (`CallerId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `calls` */

insert  into `calls`(`CallerId`,`UserId`,`Phno`,`Type`,`Date`,`Time`) values 
(1,27,919207165182,'incoming','0000-00-00','02:56:04'),
(2,27,919207165182,'incoming','2021-04-16','03:05:25'),
(3,9,918129164899,'incoming','2021-04-16','04:23:31'),
(4,9,919207165182,'incoming','2021-04-16','04:23:31'),
(5,27,8606615832,'outgoing','2021-04-19','05:19:04'),
(6,9,1400911131,'incoming','2021-04-19','10:03:01'),
(7,27,8129164899,'incoming','2021-04-20','11:48:42'),
(8,27,9495796138,'outgoing','2021-04-20','12:02:49'),
(9,27,9495796138,'outgoing','2021-04-20','12:03:06'),
(10,27,9562601187,'incoming','2021-04-22','09:38:40'),
(11,27,919207165182,'incoming','2021-04-22','09:44:00'),
(12,27,919207165182,'outgoing','2021-04-22','09:44:00'),
(13,27,919562601187,'incoming','2021-04-22','09:45:36'),
(14,27,919562601187,'outgoing','2021-04-22','09:45:59');

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `HRid` int(11) NOT NULL AUTO_INCREMENT,
  `Fname` varchar(20) DEFAULT NULL,
  `Lname` varchar(20) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Phno` bigint(20) DEFAULT NULL,
  `Place` varchar(20) DEFAULT NULL,
  `Post` varchar(20) DEFAULT NULL,
  `PIN` bigint(20) DEFAULT NULL,
  `Photo` varchar(100) DEFAULT NULL,
  `loginid` int(11) DEFAULT NULL,
  PRIMARY KEY (`HRid`),
  UNIQUE KEY `Phno` (`Phno`),
  UNIQUE KEY `loginid` (`loginid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

/*Data for the table `employee` */

insert  into `employee`(`HRid`,`Fname`,`Lname`,`Gender`,`Phno`,`Place`,`Post`,`PIN`,`Photo`,`loginid`) values 
(24,'Akash','Dev','male',8606615832,'olavanna','olavanna',673019,'ahashpoto.png',26),
(25,'arafa','cc','female',9574635333,'eranni','rtehew',123456,'20210408175723_IMG_30311.JPG',27);

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `FeedId` int(11) NOT NULL AUTO_INCREMENT,
  `Feedback` varchar(50) NOT NULL,
  `UserId` int(11) NOT NULL,
  `Date` date NOT NULL,
  PRIMARY KEY (`FeedId`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

/*Data for the table `feedback` */

insert  into `feedback`(`FeedId`,`Feedback`,`UserId`,`Date`) values 
(1,'good',7,'2021-01-21'),
(2,'2021-04-13',0,'0000-00-00'),
(3,'2021-04-13',0,'0000-00-00'),
(4,'2021-04-13',0,'0000-00-00'),
(5,'hai',2021,'0000-00-00'),
(6,'hai',9,'2021-04-13'),
(7,'I am arafa',9,'2021-04-13'),
(8,'I am arafa',9,'2021-04-13'),
(9,'helo',9,'2021-04-16'),
(10,'hello',9,'2021-04-16'),
(11,'eysydy',9,'2021-04-16'),
(12,'hy im busy',9,'2021-04-16'),
(13,'deliver the order in time',9,'2021-04-16'),
(14,'heavy traffic block at Christan college',9,'2021-04-16'),
(15,'hai',9,'2021-04-16'),
(16,'i will done',9,'2021-04-16'),
(17,'192.168.43.205',9,'2021-04-16'),
(18,'hi man',9,'2021-04-16'),
(19,'tuui',9,'2021-04-16'),
(20,'???????? ?????',9,'2021-04-16'),
(21,'???????? ?????',9,'2021-04-16'),
(22,'hai',9,'2021-04-16'),
(23,'hai',9,'2021-04-16'),
(24,'hai',9,'2021-04-16'),
(25,'',9,'2021-04-17'),
(26,'ada dasa',9,'2021-04-17'),
(27,'bulubulu bulu',27,'2021-04-20'),
(28,'eedf',27,'2021-04-20'),
(29,'klaaklaa klaa',27,'2021-04-22'),
(30,'klaaklaa klaa',27,'2021-04-22'),
(31,'kluljiljk',27,'2021-04-22'),
(32,'kklk',27,'2021-04-22'),
(33,'kukuku',27,'2021-04-22'),
(34,'xf ff',27,'2021-04-22'),
(35,'krrk',27,'2021-04-22'),
(36,'arara',27,'2021-04-22'),
(37,'hai',27,'2021-04-22'),
(38,'hai',27,'2021-04-22'),
(39,'fgg',27,'2021-04-22');

/*Table structure for table `insertwork` */

DROP TABLE IF EXISTS `insertwork`;

CREATE TABLE `insertwork` (
  `workid` varchar(20) NOT NULL,
  PRIMARY KEY (`workid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `insertwork` */

/*Table structure for table `locations` */

DROP TABLE IF EXISTS `locations`;

CREATE TABLE `locations` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `Latitude` varchar(30) NOT NULL,
  `longitude` varchar(30) NOT NULL,
  `Date_Time` datetime NOT NULL,
  `place` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=latin1;

/*Data for the table `locations` */

insert  into `locations`(`Id`,`userid`,`Latitude`,`longitude`,`Date_Time`,`place`) values 
(1,27,'11.25888','75.8888','2021-04-20 06:25:28','calt'),
(2,27,'11.2578011','75.7845741','2021-04-20 11:30:22','Kozhikode'),
(3,27,'11.2578017','75.7845569','2021-04-20 11:32:34',''),
(4,27,'11.2578028','75.7845625','2021-04-20 11:33:29','SK Temple Road'),
(5,26,'11.2577935','75.78456','2021-04-20 11:37:22',''),
(6,26,'11.2578009','75.784552','2021-04-20 11:41:34','SK Temple Road'),
(7,27,'11.2578','75.784554','2021-04-20 11:42:16',''),
(8,27,'11.257803','75.7845569','2021-04-20 11:43:12','SK Temple Road'),
(9,27,'11.2578033','75.784559','2021-04-20 11:44:07','SK Temple Road'),
(10,27,'11.2577974','75.7845552','2021-04-20 11:45:36',''),
(11,27,'11.2578021','75.7845593','2021-04-20 11:46:31','SK Temple Road'),
(12,27,'11.2578026','75.7845546','2021-04-20 11:47:26','SK Temple Road'),
(13,27,'11.2577982','75.7845631','2021-04-20 11:48:37','SK Temple Road'),
(14,27,'11.2577972','75.7845716','2021-04-20 11:49:50','Golden Tower Building'),
(15,27,'11.2578003','75.7845519','2021-04-20 11:50:45','Golden Tower Building'),
(16,27,'11.2578048','75.7845561','2021-04-20 11:51:52','SK Temple Road'),
(17,27,'11.257804','75.7845764','2021-04-20 11:52:47','SK Temple Road'),
(18,27,'11.2577879','75.7845565','2021-04-20 11:53:42','Golden Tower Building'),
(19,27,'11.2578071','75.784565','2021-04-20 11:57:32','SK Temple Road'),
(20,27,'11.2578069','75.784578','2021-04-20 11:58:35','SK Temple Road'),
(21,0,'','','0000-00-00 00:00:00',NULL),
(22,27,'11.2578034','75.7845615','2021-04-20 11:59:30','Golden Tower Building'),
(23,27,'11.2578081','75.7845613','2021-04-20 12:00:31','SK Temple Road'),
(24,27,'11.2596925','75.7816607','2021-04-22 07:26:57',''),
(25,27,'11.257785000000002','75.7845','2021-04-22 07:28:16',''),
(26,27,'11.2577937','75.7845372','2021-04-22 07:29:11','Golden Tower Building'),
(27,27,'11.257478333333331','75.78439666666667','2021-04-22 07:42:44',''),
(28,27,'11.257478333333331','75.78439666666667','2021-04-22 07:43:40','Golden Tower Building'),
(29,27,'11.257481666666669','75.78444666666665','2021-04-22 07:44:49','Golden Tower Building'),
(30,27,'11.2577754','75.7845441','2021-04-22 07:45:44','Golden Tower Building'),
(31,27,'11.257286666666667','75.78440666666667','2021-04-22 07:46:54','SK Temple Road'),
(32,27,'11.2577797','75.784534','2021-04-22 07:48:09','SK Temple Road'),
(33,27,'11.2577568','75.7846231','2021-04-22 07:49:22','SK Temple Road'),
(34,27,'11.257778','75.7845796','2021-04-22 07:50:17','Golden Tower Building'),
(35,27,'11.257693333333334','75.78453333333333','2021-04-22 07:51:23','Golden Tower Building'),
(36,27,'11.257560000000002','75.78448333333334','2021-04-22 08:40:11',''),
(37,27,'11.257595','75.78450166666667','2021-04-22 08:41:10','Golden Tower Building'),
(38,27,'11.257855','75.78453166666667','2021-04-22 09:21:10',''),
(39,27,'11.257855','75.78453166666667','2021-04-22 09:21:11','Golden Tower Building'),
(40,27,'11.257568333333332','75.78449166666665','2021-04-22 09:27:36','Golden Tower Building'),
(41,27,'11.257635','75.784555','2021-04-22 09:33:57',''),
(42,27,'11.257673333333333','75.78440666666667','2021-04-22 09:36:17',''),
(43,27,'11.2577819','75.7845373','2021-04-22 09:37:29','Golden Tower Building'),
(44,27,'11.2578004','75.7845606','2021-04-22 09:38:40','SK Temple Road'),
(45,27,'11.2577766','75.7845291','2021-04-22 09:39:35','SK Temple Road'),
(46,27,'11.257695000000002','75.78459500000001','2021-04-22 09:42:23',''),
(47,27,'11.257695000000002','75.78459500000001','2021-04-22 09:43:14',''),
(48,27,'11.257695000000002','75.78459500000001','2021-04-22 09:43:15','Kozhikode'),
(49,27,'11.2577766','75.784536','2021-04-22 09:44:23','Kozhikode'),
(50,27,'11.2577766','75.784536','2021-04-22 09:44:23','SK Temple Road'),
(51,27,'11.2577765','75.7845564','2021-04-22 09:45:34','SK Temple Road'),
(52,27,'11.2577765','75.7845564','2021-04-22 09:45:35','SK Temple Road'),
(53,27,'11.2577837','75.7845295','2021-04-22 09:46:45','SK Temple Road'),
(54,27,'11.2577837','75.7845295','2021-04-22 09:46:45','SK Temple Road'),
(55,27,'11.257799','75.7845583','2021-04-22 09:47:56','SK Temple Road'),
(56,27,'11.257799','75.7845583','2021-04-22 09:47:56','SK Temple Road'),
(57,27,'11.2577718','75.784545','2021-04-22 09:48:19','SK Temple Road'),
(58,27,'11.2577718','75.784545','2021-04-22 09:48:19','SK Temple Road'),
(59,27,'11.257711666666667','75.78452666666666','2021-04-22 09:49:08','SK Temple Road'),
(60,27,'11.257711666666667','75.78452666666666','2021-04-22 09:50:04','Golden Tower Building'),
(61,27,'11.257711666666667','75.78452666666666','2021-04-22 09:50:59','Golden Tower Building'),
(62,27,'11.257711666666667','75.78452666666666','2021-04-22 09:51:54','Golden Tower Building'),
(63,27,'11.257711666666667','75.78452666666666','2021-04-22 09:52:49','Golden Tower Building'),
(64,27,'11.257711666666667','75.78452666666666','2021-04-22 09:53:44','Golden Tower Building'),
(65,27,'11.257711666666667','75.78452666666666','2021-04-22 09:54:39','Golden Tower Building'),
(66,27,'11.257711666666667','75.78452666666666','2021-04-22 09:55:34','Golden Tower Building'),
(67,27,'11.257711666666667','75.78452666666666','2021-04-22 09:56:29','Golden Tower Building'),
(68,27,'11.257711666666667','75.78452666666666','2021-04-22 09:57:24','Golden Tower Building'),
(69,27,'11.2577857','75.7845358','2021-04-22 09:58:19','Golden Tower Building'),
(70,27,'11.2577857','75.7845358','2021-04-22 09:59:14','SK Temple Road'),
(71,27,'11.2577857','75.7845358','2021-04-22 10:00:09','SK Temple Road'),
(72,27,'11.2577857','75.7845358','2021-04-22 10:01:04','SK Temple Road'),
(73,27,'11.2577857','75.7845358','2021-04-22 10:01:59','SK Temple Road'),
(74,27,'11.2577921','75.7845228','2021-04-22 10:02:54','SK Temple Road');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `LoginId` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(20) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`LoginId`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`LoginId`,`Username`,`Password`,`type`) values 
(1,'mithun','123','admin'),
(2,'shalu','111','user'),
(3,'mithun','1234','HR'),
(6,'shalu','123','HR'),
(7,'mithun','12342','HR'),
(10,'mituna123','12345','Employee'),
(11,'shalu1234','12342','HR'),
(12,'mithun123','1234','Employee'),
(13,'mithun','23445','Employee'),
(15,'mithun','1234','Employee'),
(16,'mithun','1234','Employee'),
(17,'mithun','1234','Employee'),
(18,'mithun','1234','Employee'),
(19,'mithunt04','3822','Employee'),
(22,'mithun','123','HR'),
(23,'mithun','123','HR'),
(24,'mithuns','1234','Employee'),
(25,'shalu','12342','Employee'),
(26,'mithun','1234','Employee'),
(27,'arafa','0000','Employee');

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `MsgId` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `Message` text NOT NULL,
  `FromNo` bigint(20) NOT NULL,
  `Type` varchar(20) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  PRIMARY KEY (`MsgId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `message` */

insert  into `message`(`MsgId`,`UserId`,`Message`,`FromNo`,`Type`,`Date`,`Time`) values 
(1,27,'Helooo',919207165182,'incoming','2021-04-17','07:13:33'),
(2,26,'Hai',919207165182,'outgoing','2021-04-17','07:29:27'),
(3,27,'Last-Call:00:00:19, Charge:Rs0.00, Main-Bal:Rs1.25, ULPack-Exp:09-Jun-21',0,'incoming','2021-04-20','12:03:49'),
(4,27,'Charge:Rs0.00, Daily-SMS-Bal:99, Main-Bal:Rs1.25, ULPack-Exp:09-Jun-21',0,'incoming','2021-04-22','06:46:36'),
(5,27,'Charge:Rs0.00, Daily-SMS-Bal:98, Main-Bal:Rs1.25, ULPack-Exp:09-Jun-21',0,'incoming','2021-04-22','06:47:14'),
(6,27,'Charge:Rs0.00, Daily-SMS-Bal:97, Main-Bal:Rs1.25, ULPack-Exp:09-Jun-21',0,'incoming','2021-04-22','06:47:51'),
(7,27,'Charge:Rs0.00, Daily-SMS-Bal:96, Main-Bal:Rs1.25, ULPack-Exp:09-Jun-21',0,'incoming','2021-04-22','06:50:10'),
(8,27,'Charge:Rs0.00, Daily-SMS-Bal:95, Main-Bal:Rs1.25, ULPack-Exp:09-Jun-21',0,'incoming','2021-04-22','06:54:16'),
(9,27,'Charge:Rs0.00, Daily-SMS-Bal:94, Main-Bal:Rs1.25, ULPack-Exp:09-Jun-21',0,'incoming','2021-04-22','06:54:49'),
(10,27,'Charge:Rs0.00, Daily-SMS-Bal:93, Main-Bal:Rs1.25, ULPack-Exp:09-Jun-21',0,'incoming','2021-04-22','06:55:23'),
(11,27,'Charge:Rs0.00, Daily-SMS-Bal:92, Main-Bal:Rs1.25, ULPack-Exp:09-Jun-21',0,'incoming','2021-04-22','06:56:44'),
(12,27,'Kooiiii',919562601187,'incoming','2021-04-22','09:14:00'),
(13,27,'Hi',919562601187,'incoming','2021-04-22','09:17:40'),
(14,27,'Loooiii',919562601187,'incoming','2021-04-22','09:22:48'),
(15,27,'Last-Call:00:00:02, Charge:Rs0.00, Main-Bal:Rs1.25, ULPack-Exp:09-Jun-21\nCall 1234 (Tollfree) and Set Evergreen and Latest songs as your Caller Tunes',0,'incoming','2021-04-22','09:44:05'),
(16,27,'Hiii',919207165182,'incoming','2021-04-22','09:47:09'),
(17,27,'Charge:Rs0.00, Daily-SMS-Bal:91, Main-Bal:Rs1.25, ULPack-Exp:09-Jun-21',0,'incoming','2021-04-22','09:47:09'),
(18,27,'Hiii',918606615832,'outgoing','2021-04-22','09:47:10');

/*Table structure for table `salary` */

DROP TABLE IF EXISTS `salary`;

CREATE TABLE `salary` (
  `empid` varchar(20) NOT NULL,
  `tableid` int(20) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `month` varchar(20) NOT NULL,
  `salary` float DEFAULT NULL,
  PRIMARY KEY (`tableid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `salary` */

insert  into `salary`(`empid`,`tableid`,`Date`,`month`,`salary`) values 
('27',1,'2021-04-03','JANUARY',NULL);

/*Table structure for table `workassign` */

DROP TABLE IF EXISTS `workassign`;

CREATE TABLE `workassign` (
  `WorkId` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `location` varchar(70) NOT NULL,
  `work` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`WorkId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `workassign` */

insert  into `workassign`(`WorkId`,`UserId`,`location`,`work`,`status`,`date`) values 
(1,15,'Kozhikode','dsfdsfsd','pending','2021-02-04'),
(2,26,'Kozhikode','dsadasdas','pending','2021-02-09'),
(9,27,'Kozhikode','dsadasdas','pending','2021-03-31');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
