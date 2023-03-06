/*
 Navicat Premium Data Transfer

 Source Server         : mysql_1
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : cw3

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 09/12/2021 16:04:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Book
-- ----------------------------
DROP TABLE IF EXISTS `Book`;
CREATE TABLE `Book` (
  `P_Number` int DEFAULT NULL,
  `H_Number` int DEFAULT NULL,
  KEY `PK_P_Number` (`P_Number`),
  KEY `PK_H_Number` (`H_Number`),
  CONSTRAINT `PK_H_Number` FOREIGN KEY (`H_Number`) REFERENCES `Hospital` (`H_Number`),
  CONSTRAINT `PK_P_Number` FOREIGN KEY (`P_Number`) REFERENCES `Patients` (`P_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of Book
-- ----------------------------
BEGIN;
INSERT INTO `Book` VALUES (1, 1);
INSERT INTO `Book` VALUES (2, 1);
INSERT INTO `Book` VALUES (3, 2);
INSERT INTO `Book` VALUES (4, 3);
INSERT INTO `Book` VALUES (5, 3);
INSERT INTO `Book` VALUES (6, 4);
INSERT INTO `Book` VALUES (7, 5);
INSERT INTO `Book` VALUES (6, 1);
INSERT INTO `Book` VALUES (7, 2);
INSERT INTO `Book` VALUES (8, 2);
INSERT INTO `Book` VALUES (9, 4);
INSERT INTO `Book` VALUES (10, 1);
INSERT INTO `Book` VALUES (11, 1);
INSERT INTO `Book` VALUES (12, 1);
INSERT INTO `Book` VALUES (3, 6);
INSERT INTO `Book` VALUES (4, 7);
COMMIT;

-- ----------------------------
-- Table structure for BS
-- ----------------------------
DROP TABLE IF EXISTS `BS`;
CREATE TABLE `BS` (
  `SIM_ID` varchar(10) NOT NULL,
  `In_time` datetime DEFAULT NULL,
  `Out_time` datetime DEFAULT NULL,
  `GPS` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  KEY `PK_SIM_ID` (`SIM_ID`),
  CONSTRAINT `PK_SIM_ID` FOREIGN KEY (`SIM_ID`) REFERENCES `Person` (`SIM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of BS
-- ----------------------------
BEGIN;
INSERT INTO `BS` VALUES ('233636', '2021-10-07 16:48:00', '2021-10-09 09:32:00', 'WI12,3');
INSERT INTO `BS` VALUES ('233636', '2021-10-09 10:00:00', '2021-10-09 19:30:00', 'CB8,7');
INSERT INTO `BS` VALUES ('203436', NULL, NULL, 'NV9,3');
INSERT INTO `BS` VALUES ('207764', '2021-10-08 18:56:00', NULL, 'WI6,3');
INSERT INTO `BS` VALUES ('392481', NULL, '2021-10-08 20:00:00', 'WI7,5');
INSERT INTO `BS` VALUES ('392481', '2021-10-08 21:17:00', NULL, 'EX10,7');
INSERT INTO `BS` VALUES ('175432', '2021-10-03 10:46:00', NULL, 'EX2,4');
INSERT INTO `BS` VALUES ('213481', NULL, '2021-10-07 10:00:00', 'WI12,3');
INSERT INTO `BS` VALUES ('213481', '2021-10-07 17:10:00', NULL, 'NV7,18');
INSERT INTO `BS` VALUES ('604175', '2021-07-18 12:43:00', '2021-07-18 13:43:00', 'CK9,10');
INSERT INTO `BS` VALUES ('735891', NULL, '2021-10-08 09:18:00', 'CB10,11');
INSERT INTO `BS` VALUES ('735891', '2021-10-08 21:59:00', NULL, 'NW1,7');
COMMIT;

-- ----------------------------
-- Table structure for District
-- ----------------------------
DROP TABLE IF EXISTS `District`;
CREATE TABLE `District` (
  `GPS` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `District_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `risk_level` varchar(4) NOT NULL DEFAULT 'low',
  PRIMARY KEY (`GPS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of District
-- ----------------------------
BEGIN;
INSERT INTO `District` VALUES ('CB', 'Lenny town', 'mid');
INSERT INTO `District` VALUES ('CK', 'Centre Lukewarm Hillside', 'low');
INSERT INTO `District` VALUES ('EK', 'Bunny Tail district', 'low');
INSERT INTO `District` VALUES ('EX', 'Raspberry town', 'low');
INSERT INTO `District` VALUES ('NV', 'Northern Tail district', 'low');
INSERT INTO `District` VALUES ('NW', 'Bourrasque town', 'low');
INSERT INTO `District` VALUES ('SA', 'Storm town', 'low');
INSERT INTO `District` VALUES ('SG', 'Glow Sand district', 'low');
INSERT INTO `District` VALUES ('WI', 'Western Lukewarm Hillside', 'high');
INSERT INTO `District` VALUES ('WV', 'Hot district', 'low');
COMMIT;

-- ----------------------------
-- Table structure for Doctor_information
-- ----------------------------
DROP TABLE IF EXISTS `Doctor_information`;
CREATE TABLE `Doctor_information` (
  `Doctor_Number` int NOT NULL AUTO_INCREMENT,
  `Doctor_Name` varchar(50) NOT NULL,
  `H_Number` int DEFAULT NULL,
  PRIMARY KEY (`Doctor_Number`),
  KEY `PK_H_Number_2` (`H_Number`),
  CONSTRAINT `PK_H_Number_2` FOREIGN KEY (`H_Number`) REFERENCES `Hospital` (`H_Number`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of Doctor_information
-- ----------------------------
BEGIN;
INSERT INTO `Doctor_information` VALUES (1, 'Jun Qi', 1);
INSERT INTO `Doctor_information` VALUES (2, 'David', 1);
INSERT INTO `Doctor_information` VALUES (3, 'Bob', 2);
INSERT INTO `Doctor_information` VALUES (4, 'Lisa', 3);
INSERT INTO `Doctor_information` VALUES (5, 'Eason', 4);
INSERT INTO `Doctor_information` VALUES (6, 'Lily', 5);
INSERT INTO `Doctor_information` VALUES (7, 'Nilson', 6);
INSERT INTO `Doctor_information` VALUES (8, 'Q', 7);
INSERT INTO `Doctor_information` VALUES (9, 'Bill', 6);
INSERT INTO `Doctor_information` VALUES (10, 'Aka', 8);
INSERT INTO `Doctor_information` VALUES (11, 'Pushyoo', 2);
INSERT INTO `Doctor_information` VALUES (12, 'Luvia', 8);
COMMIT;

-- ----------------------------
-- Table structure for Hospital
-- ----------------------------
DROP TABLE IF EXISTS `Hospital`;
CREATE TABLE `Hospital` (
  `H_Number` int NOT NULL AUTO_INCREMENT,
  `H_Name` varchar(255) NOT NULL,
  `GPS` varchar(2) NOT NULL,
  PRIMARY KEY (`H_Number`),
  UNIQUE KEY `UN_H_Name` (`H_Name`) USING BTREE,
  KEY `FP_GPS` (`GPS`),
  CONSTRAINT `FP_GPS` FOREIGN KEY (`GPS`) REFERENCES `District` (`GPS`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of Hospital
-- ----------------------------
BEGIN;
INSERT INTO `Hospital` VALUES (1, 'Central Lukewarm KIngdom Hospital', 'CK');
INSERT INTO `Hospital` VALUES (2, 'International Searching Hospital', 'CB');
INSERT INTO `Hospital` VALUES (3, 'Happy Hospital', 'NW');
INSERT INTO `Hospital` VALUES (4, 'Golden Time Hospital', 'SG');
INSERT INTO `Hospital` VALUES (5, 'Glorious Years Hospital', 'WV');
INSERT INTO `Hospital` VALUES (6, 'Hope Hospital', 'WI');
INSERT INTO `Hospital` VALUES (7, 'WisdomLake Hospital', 'EX');
INSERT INTO `Hospital` VALUES (8, 'XJTLU Hospital', 'CB');
COMMIT;

-- ----------------------------
-- Table structure for Patients
-- ----------------------------
DROP TABLE IF EXISTS `Patients`;
CREATE TABLE `Patients` (
  `P_Number` int NOT NULL AUTO_INCREMENT,
  `P_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `P_Sex` varchar(1) NOT NULL,
  `P_Age` int NOT NULL,
  `P_Mobile` varchar(10) NOT NULL,
  PRIMARY KEY (`P_Number`),
  UNIQUE KEY `UN_P_Mobile` (`P_Mobile`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of Patients
-- ----------------------------
BEGIN;
INSERT INTO `Patients` VALUES (1, 'Mark', 'M', 23, '233636');
INSERT INTO `Patients` VALUES (2, 'Jerry', 'M', 20, '203436');
INSERT INTO `Patients` VALUES (3, 'Cavin', 'M', 40, '407764');
INSERT INTO `Patients` VALUES (4, 'Ivy', 'F', 39, '392481');
INSERT INTO `Patients` VALUES (5, 'Marry', 'F', 17, '175432');
INSERT INTO `Patients` VALUES (6, 'AlwaysSmile', 'M', 21, '213481');
INSERT INTO `Patients` VALUES (7, 'Jenny', 'F', 60, '604175');
INSERT INTO `Patients` VALUES (8, 'Jacobe', 'M', 73, '735891');
INSERT INTO `Patients` VALUES (9, 'Kitty', 'F', 14, '143526');
INSERT INTO `Patients` VALUES (10, 'Coco', 'F', 31, '317042');
INSERT INTO `Patients` VALUES (11, 'Zoom', 'M', 41, '419050');
INSERT INTO `Patients` VALUES (12, 'Justin', 'M', 59, '597053');
COMMIT;

-- ----------------------------
-- Table structure for Person
-- ----------------------------
DROP TABLE IF EXISTS `Person`;
CREATE TABLE `Person` (
  `SIM_ID` varchar(10) NOT NULL,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`SIM_ID`),
  UNIQUE KEY `UN_SIM_ID` (`SIM_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of Person
-- ----------------------------
BEGIN;
INSERT INTO `Person` VALUES ('123456', 'Scout');
INSERT INTO `Person` VALUES ('143526', 'Kitty');
INSERT INTO `Person` VALUES ('175432', 'Marry');
INSERT INTO `Person` VALUES ('203436', 'Jerry');
INSERT INTO `Person` VALUES ('207764', 'Cavin');
INSERT INTO `Person` VALUES ('213481', 'AlwaysSmile');
INSERT INTO `Person` VALUES ('233636', 'Mark');
INSERT INTO `Person` VALUES ('297053', 'Justin');
INSERT INTO `Person` VALUES ('317042', 'Coco');
INSERT INTO `Person` VALUES ('392481', 'Ivy');
INSERT INTO `Person` VALUES ('419050', 'Zoom');
INSERT INTO `Person` VALUES ('604175', 'Jenny');
INSERT INTO `Person` VALUES ('667788', 'Tom');
INSERT INTO `Person` VALUES ('735891', 'Jacobe');
COMMIT;

-- ----------------------------
-- Table structure for Sample_Type
-- ----------------------------
DROP TABLE IF EXISTS `Sample_Type`;
CREATE TABLE `Sample_Type` (
  `P_Number` int NOT NULL,
  `Type_Number` int NOT NULL,
  `Sample_Result` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  KEY `PK_P_Number_2` (`P_Number`),
  KEY `PK_Type_Number` (`Type_Number`),
  CONSTRAINT `PK_P_Number_2` FOREIGN KEY (`P_Number`) REFERENCES `Patients` (`P_Number`),
  CONSTRAINT `PK_Type_Number` FOREIGN KEY (`Type_Number`) REFERENCES `Sample_Type_Detail` (`Type_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of Sample_Type
-- ----------------------------
BEGIN;
INSERT INTO `Sample_Type` VALUES (1, 1, 'P');
INSERT INTO `Sample_Type` VALUES (2, 1, 'N');
INSERT INTO `Sample_Type` VALUES (3, 2, 'N');
INSERT INTO `Sample_Type` VALUES (4, 3, 'N');
INSERT INTO `Sample_Type` VALUES (5, 2, 'N');
INSERT INTO `Sample_Type` VALUES (6, 3, 'N');
INSERT INTO `Sample_Type` VALUES (7, 1, 'N');
INSERT INTO `Sample_Type` VALUES (6, 2, 'N');
INSERT INTO `Sample_Type` VALUES (7, 2, 'N');
INSERT INTO `Sample_Type` VALUES (8, 2, 'N');
INSERT INTO `Sample_Type` VALUES (8, 3, 'N');
INSERT INTO `Sample_Type` VALUES (9, 2, 'P');
INSERT INTO `Sample_Type` VALUES (10, 3, 'P');
INSERT INTO `Sample_Type` VALUES (11, 2, 'P');
INSERT INTO `Sample_Type` VALUES (12, 1, 'P');
INSERT INTO `Sample_Type` VALUES (3, 1, 'P');
INSERT INTO `Sample_Type` VALUES (4, 1, 'N');
COMMIT;

-- ----------------------------
-- Table structure for Sample_Type_Detail
-- ----------------------------
DROP TABLE IF EXISTS `Sample_Type_Detail`;
CREATE TABLE `Sample_Type_Detail` (
  `Type_Number` int NOT NULL AUTO_INCREMENT,
  `Sample_Name` varchar(50) NOT NULL,
  `Description` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Type_Number`),
  UNIQUE KEY `UN_Sample_Name` (`Sample_Name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of Sample_Type_Detail
-- ----------------------------
BEGIN;
INSERT INTO `Sample_Type_Detail` VALUES (1, 'Coughid-21', 'Coughid-21 is a newly identified type of virus this year, all patients tested to be positive should rest well and avoid going outside');
INSERT INTO `Sample_Type_Detail` VALUES (2, 'Covid-19', 'Covid-19 is a highly contagious respiratory disease, and infected patients should be isolated and treated immediately.');
INSERT INTO `Sample_Type_Detail` VALUES (3, 'Coldid-7', 'Coldid-7 is a new cold virus and all patients who test positive should take medicine and get plenty of rest.');
COMMIT;

-- ----------------------------
-- Table structure for Time
-- ----------------------------
DROP TABLE IF EXISTS `Time`;
CREATE TABLE `Time` (
  `P_Number` int NOT NULL,
  `Collect_TIme` datetime DEFAULT NULL,
  `Test_Time` datetime DEFAULT NULL,
  `Report_Time` datetime DEFAULT NULL,
  `Doctor_Number` int DEFAULT NULL,
  `H_Number` int DEFAULT NULL,
  KEY `PK_P_Number_3` (`P_Number`),
  KEY `PK_Doctor_Number` (`Doctor_Number`),
  KEY `PK_H_Number_3` (`H_Number`),
  CONSTRAINT `PK_Doctor_Number` FOREIGN KEY (`Doctor_Number`) REFERENCES `Doctor_information` (`Doctor_Number`),
  CONSTRAINT `PK_H_Number_3` FOREIGN KEY (`H_Number`) REFERENCES `Hospital` (`H_Number`),
  CONSTRAINT `PK_P_Number_3` FOREIGN KEY (`P_Number`) REFERENCES `Patients` (`P_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of Time
-- ----------------------------
BEGIN;
INSERT INTO `Time` VALUES (1, '2021-10-08 17:30:00', '2021-10-09 12:21:00', '2021-10-09 19:30:00', 1, 1);
INSERT INTO `Time` VALUES (2, '2021-06-23 10:30:00', '2021-06-23 15:48:00', '2021-06-24 09:30:00', 2, 1);
INSERT INTO `Time` VALUES (3, '2021-10-31 14:50:00', '2021-11-01 09:20:00', '2021-11-01 13:43:00', 3, 2);
INSERT INTO `Time` VALUES (4, '2021-10-08 13:15:00', '2021-10-09 10:12:00', '2021-10-09 20:00:00', 4, 3);
INSERT INTO `Time` VALUES (5, '2021-10-05 11:23:00', '2021-10-05 17:30:00', '2021-10-06 07:47:00', 4, 3);
INSERT INTO `Time` VALUES (6, '2020-10-03 08:35:00', '2020-10-03 16:23:00', '2020-10-04 07:53:00', 5, 4);
INSERT INTO `Time` VALUES (6, '2020-10-04 10:57:00', '2020-10-04 18:30:00', '2020-10-05 11:49:00', 1, 1);
INSERT INTO `Time` VALUES (7, '2020-10-03 09:56:00', '2020-10-03 20:12:00', '2020-10-04 10:38:00', 6, 5);
INSERT INTO `Time` VALUES (7, '2020-10-05 06:29:00', '2020-10-05 13:19:00', '2020-10-05 23:14:00', 3, 2);
INSERT INTO `Time` VALUES (8, '2020-10-03 12:43:00', '2020-10-03 21:59:00', '2020-10-04 09:37:00', 3, 2);
INSERT INTO `Time` VALUES (8, '2020-10-03 14:36:00', '2020-10-03 23:18:00', '2020-10-04 10:31:00', 4, 3);
INSERT INTO `Time` VALUES (9, '2021-10-03 11:09:00', '2021-10-03 15:11:00', '2021-10-04 09:51:00', 5, 4);
INSERT INTO `Time` VALUES (10, '2021-10-03 10:18:00', '2021-10-03 14:49:00', '2021-10-04 10:03:00', 2, 1);
INSERT INTO `Time` VALUES (11, '2021-10-04 09:23:00', '2021-10-04 19:03:00', '2021-10-05 06:40:00', 1, 1);
INSERT INTO `Time` VALUES (12, '2021-10-04 10:13:00', '2021-10-04 17:08:00', '2021-10-05 07:01:00', 2, 1);
INSERT INTO `Time` VALUES (3, '2021-10-10 10:10:00', '2021-10-10 20:20:00', '2021-10-11 09:41:00', 7, 6);
INSERT INTO `Time` VALUES (4, '2021-10-20 13:09:00', '2021-10-21 05:52:00', '2021-10-21 12:03:00', 8, 7);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;


--         Important use cases
-- use case 1
SELECT DISTINCT SIM_ID FROM BS WHERE LEFT(GPS,2) IN (SELECT LEFT(GPS,2) FROM BS 
WHERE SIM_ID='233636')AND SIM_ID!='233636'AND 
(Out_time IS NULL  OR TIMESTAMPDIFF(HOUR,Out_time,'2021-10-09 19:30:00')<48 AND TIMESTAMPDIFF(HOUR,Out_time,'2021-10-09 19:30:00')>0)

-- test data
BEGIN;
INSERT INTO `BS` VALUES ('233636', '2021-10-07 16:48:00', '2021-10-09 09:32:00', 'WI12,3');
INSERT INTO `BS` VALUES ('233636', '2021-10-09 10:00:00', '2021-10-09 19:30:00', 'CB8,7');
INSERT INTO `BS` VALUES ('203436', NULL, NULL, 'NV9,3');
INSERT INTO `BS` VALUES ('207764', '2021-10-08 18:56:00', NULL, 'WI6,3');
INSERT INTO `BS` VALUES ('392481', NULL, '2021-10-08 20:00:00', 'WI7,5');
INSERT INTO `BS` VALUES ('392481', '2021-10-08 21:17:00', NULL, 'EX10,7');
INSERT INTO `BS` VALUES ('175432', '2021-10-03 10:46:00', NULL, 'EX2,4');
INSERT INTO `BS` VALUES ('213481', NULL, '2021-10-07 10:00:00', 'WI12,3');
INSERT INTO `BS` VALUES ('213481', '2021-10-07 17:10:00', NULL, 'NV7,18');
INSERT INTO `BS` VALUES ('604175', '2021-07-18 12:43:00', '2021-07-18 13:43:00', 'CK9,10');
COMMIT;

-- use case 2
INSERT INTO `cw3`.`Person` (`SIM_ID`, `Name`) VALUES ('667788', 'Tom')
INSERT INTO `cw3`.`BS` (`SIM_ID`, `In_time`, `Out_time`, `GPS`) VALUES ('667788', '2021/7/18/12:43', '2021/7/18/13:43', 'CK9,10')

-- use case 3
SELECT H_Name FROM Hospital INNER JOIN (SELECT H_Number,result.AVG_H from
(SELECT H_Number,avg(TIMESTAMPDIFF(MINUTE,Test_Time,Report_Time)) AS AVG_H FROM Time GROUP BY H_Number)result
WHERE result.AVG_H IN (SELECT MIN(result.AVG_H) AS Useful_H FROM (SELECT H_Number,avg(TIMESTAMPDIFF(MINUTE,Test_Time,Report_Time))AS AVG_H FROM Time GROUP BY H_Number)result))Result USING(H_Number)

-- test data
BEGIN;
INSERT INTO `Time` VALUES (1, '2021-10-08 17:30:00', '2021-10-09 12:21:00', '2021-10-09 19:30:00', 1, 1);
INSERT INTO `Time` VALUES (2, '2021-06-23 10:30:00', '2021-06-23 15:48:00', '2021-06-24 09:30:00', 2, 1);
INSERT INTO `Time` VALUES (3, '2021-10-31 14:50:00', '2021-11-01 09:20:00', '2021-11-01 13:43:00', 3, 2);
INSERT INTO `Time` VALUES (4, '2021-10-08 13:15:00', '2021-10-09 10:12:00', '2021-10-09 20:00:00', 4, 3);
INSERT INTO `Time` VALUES (5, '2021-10-05 11:23:00', '2021-10-05 17:30:00', '2021-10-06 07:47:00', 4, 3);
COMMIT;
BEGIN;
INSERT INTO `Hospital` VALUES (1, 'Central Lukewarm KIngdom Hospital', 'CK');
INSERT INTO `Hospital` VALUES (2, 'International Searching Hospital', 'CB');
INSERT INTO `Hospital` VALUES (3, 'Happy Hospital', 'NW');
COMMIT;

-- use case 4
SELECT P_Mobile FROM Patients WHERE P_Number IN (SELECT Result_1.P_Number FROM Time,(SELECT P_Number,Collect_TIme FROM Time AS Result_1 WHERE P_Number IN (SELECT P_Number FROM Time  WHERE TIMESTAMPDIFF(HOUR,'2020-10-3-0:00',Collect_TIme)>=0
AND TIMESTAMPDIFF(HOUR,'2020-10-3-0:00',Collect_TIme)<=48 GROUP BY P_Number  HAVING COUNT(*)=2))Result_1 WHERE Time.P_Number=Result_1.P_Number AND ABS(TIMESTAMPDIFF(HOUR,Result_1.Collect_TIme,Time.Collect_TIme)>=24))

-- test data
BEGIN;
INSERT INTO `Time` VALUES (6, '2020-10-03 08:35:00', '2020-10-03 16:23:00', '2020-10-04 07:53:00', 5, 4);
INSERT INTO `Time` VALUES (6, '2020-10-04 10:57:00', '2020-10-04 18:30:00', '2020-10-05 11:49:00', 1, 1);
INSERT INTO `Time` VALUES (7, '2020-10-03 09:56:00', '2020-10-03 20:12:00', '2020-10-04 10:38:00', 6, 5);
INSERT INTO `Time` VALUES (7, '2020-10-05 06:29:00', '2020-10-05 13:19:00', '2020-10-05 23:14:00', 3, 2);
INSERT INTO `Time` VALUES (8, '2020-10-03 12:43:00', '2020-10-03 21:59:00', '2020-10-04 09:37:00', 3, 2);
INSERT INTO `Time` VALUES (8, '2020-10-03 14:36:00', '2020-10-03 23:18:00', '2020-10-04 10:31:00', 4, 3);
COMMIT;
BEGIN;
INSERT INTO `Patients` VALUES (6, 'AlwaysSmile', 'M', 21, '213481');
INSERT INTO `Patients` VALUES (7, 'Jenny', 'F', 60, '604175');
INSERT INTO `Patients` VALUES (8, 'Jacobe', 'M', 73, '735891');
COMMIT;

-- use case 5
SELECT DISTINCT District_Name AS district_name, risk_level FROM District ORDER BY CASE risk_level WHEN 'high' THEN 1 WHEN 'mid' THEN 2 ELSE 3 END

-- test data
BEGIN;
INSERT INTO `District` VALUES ('CB', 'Lenny town', 'mid');
INSERT INTO `District` VALUES ('CK', 'Centre Lukewarm Hillside', 'low');
INSERT INTO `District` VALUES ('EK', 'Bunny Tail district', 'low');
INSERT INTO `District` VALUES ('EX', 'Raspberry town', 'low');
INSERT INTO `District` VALUES ('NV', 'Northern Tail district', 'low');
INSERT INTO `District` VALUES ('NW', 'Bourrasque town', 'low');
INSERT INTO `District` VALUES ('SA', 'Storm town', 'low');
INSERT INTO `District` VALUES ('SG', 'Glow Sand district', 'low');
INSERT INTO `District` VALUES ('WI', 'Western Lukewarm Hillside', 'high');
INSERT INTO `District` VALUES ('WV', 'Hot district', 'low');
COMMIT;

-- use case 6
SELECT P_Name,P_Mobile FROM Patients WHERE P_Number IN 
(SELECT DISTINCT P_Number FROM Time WHERE 
Report_Time>='2021-10-4-00:00' AND Report_Time<'2021-10-5-00:00' AND H_Number IN 
(SELECT H_Number FROM Hospital WHERE GPS='CK'))

-- test data
BEGIN;
INSERT INTO `Hospital` VALUES (1, 'Central Lukewarm KIngdom Hospital', 'CK');
INSERT INTO `Hospital` VALUES (2, 'International Searching Hospital', 'CB');
INSERT INTO `Hospital` VALUES (3, 'Happy Hospital', 'NW');
INSERT INTO `Hospital` VALUES (4, 'Golden Time Hospital', 'SG');
INSERT INTO `Hospital` VALUES (5, 'Glorious Years Hospital', 'WV');
INSERT INTO `Hospital` VALUES (6, 'Hope Hospital', 'WI');
INSERT INTO `Hospital` VALUES (7, 'WisdomLake Hospital', 'EX');
INSERT INTO `Hospital` VALUES (8, 'XJTLU Hospital', 'CB');
COMMIT;
BEGIN;
INSERT INTO `Time` VALUES (1, '2021-10-08 17:30:00', '2021-10-09 12:21:00', '2021-10-09 19:30:00', 1, 1);
INSERT INTO `Time` VALUES (2, '2021-06-23 10:30:00', '2021-06-23 15:48:00', '2021-06-24 09:30:00', 2, 1);
INSERT INTO `Time` VALUES (3, '2021-10-31 14:50:00', '2021-11-01 09:20:00', '2021-11-01 13:43:00', 3, 2);
INSERT INTO `Time` VALUES (4, '2021-10-08 13:15:00', '2021-10-09 10:12:00', '2021-10-09 20:00:00', 4, 3);
INSERT INTO `Time` VALUES (5, '2021-10-05 11:23:00', '2021-10-05 17:30:00', '2021-10-06 07:47:00', 4, 3);
INSERT INTO `Time` VALUES (6, '2020-10-03 08:35:00', '2020-10-03 16:23:00', '2020-10-04 07:53:00', 5, 4);
INSERT INTO `Time` VALUES (6, '2020-10-04 10:57:00', '2020-10-04 18:30:00', '2020-10-05 11:49:00', 1, 1);
INSERT INTO `Time` VALUES (7, '2020-10-03 09:56:00', '2020-10-03 20:12:00', '2020-10-04 10:38:00', 6, 5);
INSERT INTO `Time` VALUES (7, '2020-10-05 06:29:00', '2020-10-05 13:19:00', '2020-10-05 23:14:00', 3, 2);
INSERT INTO `Time` VALUES (8, '2020-10-03 12:43:00', '2020-10-03 21:59:00', '2020-10-04 09:37:00', 3, 2);
INSERT INTO `Time` VALUES (8, '2020-10-03 14:36:00', '2020-10-03 23:18:00', '2020-10-04 10:31:00', 4, 3);
INSERT INTO `Time` VALUES (9, '2021-10-03 11:09:00', '2021-10-03 15:11:00', '2021-10-04 09:51:00', 5, 4);
INSERT INTO `Time` VALUES (10, '2021-10-03 10:18:00', '2021-10-03 14:49:00', '2021-10-04 10:03:00', 2, 1);
INSERT INTO `Time` VALUES (11, '2021-10-04 09:23:00', '2021-10-04 19:03:00', '2021-10-05 06:40:00', 1, 1);
INSERT INTO `Time` VALUES (12, '2021-10-04 10:13:00', '2021-10-04 17:08:00', '2021-10-05 07:01:00', 2, 1);
INSERT INTO `Time` VALUES (3, '2021-10-10 10:10:00', '2021-10-10 20:20:00', '2021-10-11 09:41:00', 7, 6);
INSERT INTO `Time` VALUES (4, '2021-10-20 13:09:00', '2021-10-21 05:52:00', '2021-10-21 12:03:00', 8, 7);
COMMIT;
BEGIN;
INSERT INTO `Patients` VALUES (1, 'Mark', 'M', 23, '233636');
INSERT INTO `Patients` VALUES (2, 'Jerry', 'M', 20, '203436');
INSERT INTO `Patients` VALUES (3, 'Cavin', 'M', 40, '407764');
INSERT INTO `Patients` VALUES (4, 'Ivy', 'F', 39, '392481');
INSERT INTO `Patients` VALUES (5, 'Marry', 'F', 17, '175432');
INSERT INTO `Patients` VALUES (6, 'AlwaysSmile', 'M', 21, '213481');
INSERT INTO `Patients` VALUES (7, 'Jenny', 'F', 60, '604175');
INSERT INTO `Patients` VALUES (8, 'Jacobe', 'M', 73, '735891');
INSERT INTO `Patients` VALUES (9, 'Kitty', 'F', 14, '143526');
INSERT INTO `Patients` VALUES (10, 'Coco', 'F', 31, '317042');
INSERT INTO `Patients` VALUES (11, 'Zoom', 'M', 41, '419050');
INSERT INTO `Patients` VALUES (12, 'Justin', 'M', 59, '597053');
COMMIT;

-- use case 7
SELECT (SELECT COUNT(DISTINCT P_Number)FROM Time WHERE 
Report_Time>='2021-10-5-00:00' AND Report_Time<'2021-10-6-00:00' AND H_Number IN 
(SELECT H_Number FROM Hospital WHERE GPS='CK'))-(SELECT COUNT(DISTINCT P_Number)FROM Time WHERE 
Report_Time>='2021-10-4-00:00' AND Report_Time<'2021-10-5-00:00' AND H_Number IN 
(SELECT H_Number FROM Hospital WHERE GPS='CK'))AS 'increase_number'

-- test data
BEGIN;
INSERT INTO `Patients` VALUES (1, 'Mark', 'M', 23, '233636');
INSERT INTO `Patients` VALUES (2, 'Jerry', 'M', 20, '203436');
INSERT INTO `Patients` VALUES (3, 'Cavin', 'M', 40, '407764');
INSERT INTO `Patients` VALUES (4, 'Ivy', 'F', 39, '392481');
INSERT INTO `Patients` VALUES (5, 'Marry', 'F', 17, '175432');
INSERT INTO `Patients` VALUES (6, 'AlwaysSmile', 'M', 21, '213481');
INSERT INTO `Patients` VALUES (7, 'Jenny', 'F', 60, '604175');
INSERT INTO `Patients` VALUES (8, 'Jacobe', 'M', 73, '735891');
INSERT INTO `Patients` VALUES (9, 'Kitty', 'F', 14, '143526');
INSERT INTO `Patients` VALUES (10, 'Coco', 'F', 31, '317042');
INSERT INTO `Patients` VALUES (11, 'Zoom', 'M', 41, '419050');
INSERT INTO `Patients` VALUES (12, 'Justin', 'M', 59, '597053');
COMMIT;

-- use case 8
SELECT (SELECT count(result_2.P_Number) AS infected FROM 
(SELECT P_Number FROM (SELECT DISTINCT SIM_ID FROM BS WHERE LEFT(GPS,2) IN (SELECT LEFT(GPS,2) FROM BS 
WHERE SIM_ID='233636')AND SIM_ID!='233636'AND 
(Out_time IS NULL  OR TIMESTAMPDIFF(HOUR,Out_time,'2021-10-09 19:30:00')<48 
AND TIMESTAMPDIFF(HOUR,Out_time,'2021-10-09 19:30:00')>0))result_1,Patients
WHERE result_1.SIM_ID=Patients.P_Mobile)result_2,Time,Sample_Type 
WHERE result_2.P_Number=Time.P_Number AND Time.Report_Time>='2021-10-09-19:30'
AND Time.Report_Time<'2021-10-23-0:00'AND 
result_2.P_Number=Sample_Type.P_Number AND Sample_Type.Type_Number='1' 
AND Sample_Type.Sample_Result='P')/(SELECT count(DISTINCT SIM_ID) FROM BS 
WHERE LEFT(GPS,2) IN (SELECT LEFT(GPS,2) FROM BS 
WHERE SIM_ID='233636')AND SIM_ID!='233636'AND 
(Out_time IS NULL  OR TIMESTAMPDIFF(HOUR,Out_time,'2021-10-09 19:30:00')<48 
AND TIMESTAMPDIFF(HOUR,Out_time,'2021-10-09 19:30:00')>0))AS spread_rate

-- test data
BEGIN;
INSERT INTO `Sample_Type_Detail` VALUES (1, 'Coughid-19', 'Coughid-19 is a newly identified type of virus this year, all patients tested to be positive should rest well and avoid going outside');
INSERT INTO `Sample_Type_Detail` VALUES (2, 'Covid-19', 'Covid-19 is a highly contagious respiratory disease, and infected patients should be isolated and treated immediately.');
INSERT INTO `Sample_Type_Detail` VALUES (3, 'Coldid-7', 'Coldid-7 is a new cold virus and all patients who test positive should take medicine and get plenty of rest.');
COMMIT;
BEGIN;
INSERT INTO `Time` VALUES (1, '2021-10-08 17:30:00', '2021-10-09 12:21:00', '2021-10-09 19:30:00', 1, 1);
INSERT INTO `Time` VALUES (2, '2021-06-23 10:30:00', '2021-06-23 15:48:00', '2021-06-24 09:30:00', 2, 1);
INSERT INTO `Time` VALUES (3, '2021-10-31 14:50:00', '2021-11-01 09:20:00', '2021-11-01 13:43:00', 3, 2);
INSERT INTO `Time` VALUES (4, '2021-10-08 13:15:00', '2021-10-09 10:12:00', '2021-10-09 20:00:00', 4, 3);
INSERT INTO `Time` VALUES (5, '2021-10-05 11:23:00', '2021-10-05 17:30:00', '2021-10-06 07:47:00', 4, 3);
INSERT INTO `Time` VALUES (6, '2020-10-03 08:35:00', '2020-10-03 16:23:00', '2020-10-04 07:53:00', 5, 4);
INSERT INTO `Time` VALUES (6, '2020-10-04 10:57:00', '2020-10-04 18:30:00', '2020-10-05 11:49:00', 1, 1);
INSERT INTO `Time` VALUES (7, '2020-10-03 09:56:00', '2020-10-03 20:12:00', '2020-10-04 10:38:00', 6, 5);
INSERT INTO `Time` VALUES (7, '2020-10-05 06:29:00', '2020-10-05 13:19:00', '2020-10-05 23:14:00', 3, 2);
INSERT INTO `Time` VALUES (8, '2020-10-03 12:43:00', '2020-10-03 21:59:00', '2020-10-04 09:37:00', 3, 2);
INSERT INTO `Time` VALUES (8, '2020-10-03 14:36:00', '2020-10-03 23:18:00', '2020-10-04 10:31:00', 4, 3);
INSERT INTO `Time` VALUES (9, '2021-10-03 11:09:00', '2021-10-03 15:11:00', '2021-10-04 09:51:00', 5, 4);
INSERT INTO `Time` VALUES (10, '2021-10-03 10:18:00', '2021-10-03 14:49:00', '2021-10-04 10:03:00', 2, 1);
INSERT INTO `Time` VALUES (11, '2021-10-04 09:23:00', '2021-10-04 19:03:00', '2021-10-05 06:40:00', 1, 1);
INSERT INTO `Time` VALUES (12, '2021-10-04 10:13:00', '2021-10-04 17:08:00', '2021-10-05 07:01:00', 2, 1);
INSERT INTO `Time` VALUES (3, '2021-10-10 10:10:00', '2021-10-10 20:20:00', '2021-10-11 09:41:00', 7, 6);
INSERT INTO `Time` VALUES (4, '2021-10-20 13:09:00', '2021-10-21 05:52:00', '2021-10-21 12:03:00', 8, 7);
COMMIT;

--          Extended use cases
-- use case 1
SELECT H_Name FROM Hospital WHERE H_Number IN
(SELECT H_Number FROM Book WHERE P_Number IN
(SELECT DISTINCT P_Number FROM Sample_Type WHERE Sample_Result='P'))

-- test data
BEGIN;
INSERT INTO `Sample_Type` VALUES (1, 1, 'P');
INSERT INTO `Sample_Type` VALUES (2, 1, 'N');
INSERT INTO `Sample_Type` VALUES (3, 2, 'N');
INSERT INTO `Sample_Type` VALUES (4, 3, 'N');
INSERT INTO `Sample_Type` VALUES (5, 2, 'N');
INSERT INTO `Sample_Type` VALUES (6, 3, 'N');
INSERT INTO `Sample_Type` VALUES (7, 1, 'N');
INSERT INTO `Sample_Type` VALUES (6, 2, 'N');
INSERT INTO `Sample_Type` VALUES (7, 2, 'N');
INSERT INTO `Sample_Type` VALUES (8, 2, 'N');
INSERT INTO `Sample_Type` VALUES (8, 3, 'N');
INSERT INTO `Sample_Type` VALUES (9, 2, 'P');
INSERT INTO `Sample_Type` VALUES (10, 3, 'P');
INSERT INTO `Sample_Type` VALUES (11, 2, 'P');
INSERT INTO `Sample_Type` VALUES (12, 1, 'P');
INSERT INTO `Sample_Type` VALUES (3, 1, 'P');
INSERT INTO `Sample_Type` VALUES (4, 1, 'N');
COMMIT;
BEGIN;
INSERT INTO `Book` VALUES (1, 1);
INSERT INTO `Book` VALUES (2, 1);
INSERT INTO `Book` VALUES (3, 2);
INSERT INTO `Book` VALUES (4, 3);
INSERT INTO `Book` VALUES (5, 3);
INSERT INTO `Book` VALUES (6, 4);
INSERT INTO `Book` VALUES (7, 5);
INSERT INTO `Book` VALUES (6, 1);
INSERT INTO `Book` VALUES (7, 2);
INSERT INTO `Book` VALUES (8, 2);
INSERT INTO `Book` VALUES (9, 4);
INSERT INTO `Book` VALUES (10, 1);
INSERT INTO `Book` VALUES (11, 1);
INSERT INTO `Book` VALUES (12, 1);
INSERT INTO `Book` VALUES (3, 6);
INSERT INTO `Book` VALUES (4, 7);
COMMIT;
BEGIN;
INSERT INTO `Hospital` VALUES (1, 'Central Lukewarm KIngdom Hospital', 'CK');
INSERT INTO `Hospital` VALUES (2, 'International Searching Hospital', 'CB');
INSERT INTO `Hospital` VALUES (3, 'Happy Hospital', 'NW');
INSERT INTO `Hospital` VALUES (4, 'Golden Time Hospital', 'SG');
INSERT INTO `Hospital` VALUES (5, 'Glorious Years Hospital', 'WV');
INSERT INTO `Hospital` VALUES (6, 'Hope Hospital', 'WI');
INSERT INTO `Hospital` VALUES (7, 'WisdomLake Hospital', 'EX');
COMMIT;

-- use case 2
SELECT DISTINCT P_Name,P_Mobile FROM Patients INNER JOIN Time USING (P_Number) WHERE Time.Doctor_Number=4

-- test data
BEGIN;
INSERT INTO `Time` VALUES (1, '2021-10-08 17:30:00', '2021-10-09 12:21:00', '2021-10-09 19:30:00', 1, 1);
INSERT INTO `Time` VALUES (2, '2021-06-23 10:30:00', '2021-06-23 15:48:00', '2021-06-24 09:30:00', 2, 1);
INSERT INTO `Time` VALUES (3, '2021-10-31 14:50:00', '2021-11-01 09:20:00', '2021-11-01 13:43:00', 3, 2);
INSERT INTO `Time` VALUES (4, '2021-10-08 13:15:00', '2021-10-09 10:12:00', '2021-10-09 20:00:00', 4, 3);
INSERT INTO `Time` VALUES (5, '2021-10-05 11:23:00', '2021-10-05 17:30:00', '2021-10-06 07:47:00', 4, 3);
INSERT INTO `Time` VALUES (6, '2020-10-03 08:35:00', '2020-10-03 16:23:00', '2020-10-04 07:53:00', 5, 4);
INSERT INTO `Time` VALUES (6, '2020-10-04 10:57:00', '2020-10-04 18:30:00', '2020-10-05 11:49:00', 1, 1);
INSERT INTO `Time` VALUES (7, '2020-10-03 09:56:00', '2020-10-03 20:12:00', '2020-10-04 10:38:00', 6, 5);
INSERT INTO `Time` VALUES (7, '2020-10-05 06:29:00', '2020-10-05 13:19:00', '2020-10-05 23:14:00', 3, 2);
INSERT INTO `Time` VALUES (8, '2020-10-03 12:43:00', '2020-10-03 21:59:00', '2020-10-04 09:37:00', 3, 2);
INSERT INTO `Time` VALUES (8, '2020-10-03 14:36:00', '2020-10-03 23:18:00', '2020-10-04 10:31:00', 4, 3);
INSERT INTO `Time` VALUES (9, '2021-10-03 11:09:00', '2021-10-03 15:11:00', '2021-10-04 09:51:00', 5, 4);
INSERT INTO `Time` VALUES (10, '2021-10-03 10:18:00', '2021-10-03 14:49:00', '2021-10-04 10:03:00', 2, 1);
INSERT INTO `Time` VALUES (11, '2021-10-04 09:23:00', '2021-10-04 19:03:00', '2021-10-05 06:40:00', 1, 1);
INSERT INTO `Time` VALUES (12, '2021-10-04 10:13:00', '2021-10-04 17:08:00', '2021-10-05 07:01:00', 2, 1);
INSERT INTO `Time` VALUES (3, '2021-10-10 10:10:00', '2021-10-10 20:20:00', '2021-10-11 09:41:00', 7, 6);
INSERT INTO `Time` VALUES (4, '2021-10-20 13:09:00', '2021-10-21 05:52:00', '2021-10-21 12:03:00', 8, 7);
COMMIT;
BEGIN;
INSERT INTO `Patients` VALUES (1, 'Mark', 'M', 23, '233636');
INSERT INTO `Patients` VALUES (2, 'Jerry', 'M', 20, '203436');
INSERT INTO `Patients` VALUES (3, 'Cavin', 'M', 40, '407764');
INSERT INTO `Patients` VALUES (4, 'Ivy', 'F', 39, '392481');
INSERT INTO `Patients` VALUES (5, 'Marry', 'F', 17, '175432');
INSERT INTO `Patients` VALUES (6, 'AlwaysSmile', 'M', 21, '213481');
INSERT INTO `Patients` VALUES (7, 'Jenny', 'F', 60, '604175');
INSERT INTO `Patients` VALUES (8, 'Jacobe', 'M', 73, '735891');
INSERT INTO `Patients` VALUES (9, 'Kitty', 'F', 14, '143526');
INSERT INTO `Patients` VALUES (10, 'Coco', 'F', 31, '317042');
INSERT INTO `Patients` VALUES (11, 'Zoom', 'M', 41, '419050');
INSERT INTO `Patients` VALUES (12, 'Justin', 'M', 59, '597053');
COMMIT;

-- use case 3
SELECT (SELECT COUNT(P_Number) FROM Sample_Type WHERE Type_Number=1 AND Sample_Result='P')/(SELECT COUNT(SIM_ID) FROM Person) AS rate

-- test data
BEGIN;
INSERT INTO `Sample_Type` VALUES (1, 1, 'P');
INSERT INTO `Sample_Type` VALUES (2, 1, 'N');
INSERT INTO `Sample_Type` VALUES (3, 2, 'N');
INSERT INTO `Sample_Type` VALUES (4, 3, 'N');
INSERT INTO `Sample_Type` VALUES (5, 2, 'N');
INSERT INTO `Sample_Type` VALUES (6, 3, 'N');
INSERT INTO `Sample_Type` VALUES (7, 1, 'N');
INSERT INTO `Sample_Type` VALUES (6, 2, 'N');
INSERT INTO `Sample_Type` VALUES (7, 2, 'N');
INSERT INTO `Sample_Type` VALUES (8, 2, 'N');
INSERT INTO `Sample_Type` VALUES (8, 3, 'N');
INSERT INTO `Sample_Type` VALUES (9, 2, 'P');
INSERT INTO `Sample_Type` VALUES (10, 3, 'P');
INSERT INTO `Sample_Type` VALUES (11, 2, 'P');
INSERT INTO `Sample_Type` VALUES (12, 1, 'P');
INSERT INTO `Sample_Type` VALUES (3, 1, 'P');
INSERT INTO `Sample_Type` VALUES (4, 1, 'N');
COMMIT;
BEGIN;
INSERT INTO `Person` VALUES ('123456', 'Scout');
INSERT INTO `Person` VALUES ('143526', 'Kitty');
INSERT INTO `Person` VALUES ('175432', 'Marry');
INSERT INTO `Person` VALUES ('203436', 'Jerry');
INSERT INTO `Person` VALUES ('207764', 'Cavin');
INSERT INTO `Person` VALUES ('213481', 'AlwaysSmile');
INSERT INTO `Person` VALUES ('233636', 'Mark');
INSERT INTO `Person` VALUES ('297053', 'Justin');
INSERT INTO `Person` VALUES ('317042', 'Coco');
INSERT INTO `Person` VALUES ('392481', 'Ivy');
INSERT INTO `Person` VALUES ('419050', 'Zoom');
INSERT INTO `Person` VALUES ('604175', 'Jenny');
INSERT INTO `Person` VALUES ('667788', 'Tom');
INSERT INTO `Person` VALUES ('735891', 'Jacobe');
COMMIT;

-- use case 4
Your SQL statement: SELECT*FROM Time LEFT OUTER JOIN Hospital ON Time.H_Number=Hospital.H_Number ORDER BY P_Number ASC

-- test data
BEGIN;
INSERT INTO `Time` VALUES (1, '2021-10-08 17:30:00', '2021-10-09 12:21:00', '2021-10-09 19:30:00', 1, 1);
INSERT INTO `Time` VALUES (2, '2021-06-23 10:30:00', '2021-06-23 15:48:00', '2021-06-24 09:30:00', 2, 1);
INSERT INTO `Time` VALUES (3, '2021-10-31 14:50:00', '2021-11-01 09:20:00', '2021-11-01 13:43:00', 3, 2);
INSERT INTO `Time` VALUES (4, '2021-10-08 13:15:00', '2021-10-09 10:12:00', '2021-10-09 20:00:00', 4, 3);
INSERT INTO `Time` VALUES (5, '2021-10-05 11:23:00', '2021-10-05 17:30:00', '2021-10-06 07:47:00', 4, 3);
INSERT INTO `Time` VALUES (6, '2020-10-03 08:35:00', '2020-10-03 16:23:00', '2020-10-04 07:53:00', 5, 4);
INSERT INTO `Time` VALUES (6, '2020-10-04 10:57:00', '2020-10-04 18:30:00', '2020-10-05 11:49:00', 1, 1);
INSERT INTO `Time` VALUES (7, '2020-10-03 09:56:00', '2020-10-03 20:12:00', '2020-10-04 10:38:00', 6, 5);
INSERT INTO `Time` VALUES (7, '2020-10-05 06:29:00', '2020-10-05 13:19:00', '2020-10-05 23:14:00', 3, 2);
INSERT INTO `Time` VALUES (8, '2020-10-03 12:43:00', '2020-10-03 21:59:00', '2020-10-04 09:37:00', 3, 2);
INSERT INTO `Time` VALUES (8, '2020-10-03 14:36:00', '2020-10-03 23:18:00', '2020-10-04 10:31:00', 4, 3);
INSERT INTO `Time` VALUES (9, '2021-10-03 11:09:00', '2021-10-03 15:11:00', '2021-10-04 09:51:00', 5, 4);
INSERT INTO `Time` VALUES (10, '2021-10-03 10:18:00', '2021-10-03 14:49:00', '2021-10-04 10:03:00', 2, 1);
INSERT INTO `Time` VALUES (11, '2021-10-04 09:23:00', '2021-10-04 19:03:00', '2021-10-05 06:40:00', 1, 1);
INSERT INTO `Time` VALUES (12, '2021-10-04 10:13:00', '2021-10-04 17:08:00', '2021-10-05 07:01:00', 2, 1);
INSERT INTO `Time` VALUES (3, '2021-10-10 10:10:00', '2021-10-10 20:20:00', '2021-10-11 09:41:00', 7, 6);
INSERT INTO `Time` VALUES (4, '2021-10-20 13:09:00', '2021-10-21 05:52:00', '2021-10-21 12:03:00', 8, 7);
COMMIT;
BEGIN;
INSERT INTO `Hospital` VALUES (1, 'Central Lukewarm KIngdom Hospital', 'CK');
INSERT INTO `Hospital` VALUES (2, 'International Searching Hospital', 'CB');
INSERT INTO `Hospital` VALUES (3, 'Happy Hospital', 'NW');
INSERT INTO `Hospital` VALUES (4, 'Golden Time Hospital', 'SG');
INSERT INTO `Hospital` VALUES (5, 'Glorious Years Hospital', 'WV');
INSERT INTO `Hospital` VALUES (6, 'Hope Hospital', 'WI');
INSERT INTO `Hospital` VALUES (7, 'WisdomLake Hospital', 'EX');
COMMIT;

-- use case 5
SELECT COUNT(*)AS Judgement FROM Patients WHERE P_Mobile='908762'

-- test data
BEGIN;
INSERT INTO `Patients` VALUES (1, 'Mark', 'M', 23, '233636');
INSERT INTO `Patients` VALUES (2, 'Jerry', 'M', 20, '203436');
INSERT INTO `Patients` VALUES (3, 'Cavin', 'M', 40, '407764');
INSERT INTO `Patients` VALUES (4, 'Ivy', 'F', 39, '392481');
INSERT INTO `Patients` VALUES (5, 'Marry', 'F', 17, '175432');
INSERT INTO `Patients` VALUES (6, 'AlwaysSmile', 'M', 21, '213481');
INSERT INTO `Patients` VALUES (7, 'Jenny', 'F', 60, '604175');
INSERT INTO `Patients` VALUES (8, 'Jacobe', 'M', 73, '735891');
INSERT INTO `Patients` VALUES (9, 'Kitty', 'F', 14, '143526');
INSERT INTO `Patients` VALUES (10, 'Coco', 'F', 31, '317042');
INSERT INTO `Patients` VALUES (11, 'Zoom', 'M', 41, '419050');
INSERT INTO `Patients` VALUES (12, 'Justin', 'M', 59, '597053');
COMMIT;

-- use case 6
SELECT P_Name, P_Mobile FROM Patients 
WHERE P_Age=(SELECT MAX(P_Age) FROM 
(SELECT P_Name,P_Mobile,P_Age FROM Patients WHERE P_Number IN 
(SELECT P_Number FROM Sample_Type WHERE Type_Number='1'AND Sample_Result='P'))result)
AND P_Number IN(SELECT P_Number FROM Sample_Type WHERE Type_Number='1'AND Sample_Result='P')

-- test data
BEGIN;
INSERT INTO `Sample_Type` VALUES (1, 1, 'P');
INSERT INTO `Sample_Type` VALUES (2, 1, 'N');
INSERT INTO `Sample_Type` VALUES (3, 2, 'N');
INSERT INTO `Sample_Type` VALUES (4, 3, 'N');
INSERT INTO `Sample_Type` VALUES (5, 2, 'N');
INSERT INTO `Sample_Type` VALUES (6, 3, 'N');
INSERT INTO `Sample_Type` VALUES (7, 1, 'N');
INSERT INTO `Sample_Type` VALUES (6, 2, 'N');
INSERT INTO `Sample_Type` VALUES (7, 2, 'N');
INSERT INTO `Sample_Type` VALUES (8, 2, 'N');
INSERT INTO `Sample_Type` VALUES (8, 3, 'N');
INSERT INTO `Sample_Type` VALUES (9, 2, 'P');
INSERT INTO `Sample_Type` VALUES (10, 3, 'P');
INSERT INTO `Sample_Type` VALUES (11, 2, 'P');
INSERT INTO `Sample_Type` VALUES (12, 1, 'P');
INSERT INTO `Sample_Type` VALUES (3, 1, 'P');
INSERT INTO `Sample_Type` VALUES (4, 1, 'N');
COMMIT;
BEGIN;
INSERT INTO `Patients` VALUES (1, 'Mark', 'M', 23, '233636');
INSERT INTO `Patients` VALUES (2, 'Jerry', 'M', 20, '203436');
INSERT INTO `Patients` VALUES (3, 'Cavin', 'M', 40, '407764');
INSERT INTO `Patients` VALUES (4, 'Ivy', 'F', 39, '392481');
INSERT INTO `Patients` VALUES (5, 'Marry', 'F', 17, '175432');
INSERT INTO `Patients` VALUES (6, 'AlwaysSmile', 'M', 21, '213481');
INSERT INTO `Patients` VALUES (7, 'Jenny', 'F', 60, '604175');
INSERT INTO `Patients` VALUES (8, 'Jacobe', 'M', 73, '735891');
INSERT INTO `Patients` VALUES (9, 'Kitty', 'F', 14, '143526');
INSERT INTO `Patients` VALUES (10, 'Coco', 'F', 31, '317042');
INSERT INTO `Patients` VALUES (11, 'Zoom', 'M', 41, '419050');
INSERT INTO `Patients` VALUES (12, 'Justin', 'M', 59, '597053');
COMMIT;

-- use case 7
SELECT P_Name, P_Mobile FROM Patients WHERE 
P_Number IN (SELECT result.P_Number FROM 
(SELECT DISTINCT P_Number FROM Sample_Type WHERE Sample_Result='P')result,Time 
WHERE Time.H_Number='1'AND result.P_Number=Time.P_Number)

-- test data
BEGIN;
INSERT INTO `Sample_Type` VALUES (1, 1, 'P');
INSERT INTO `Sample_Type` VALUES (2, 1, 'N');
INSERT INTO `Sample_Type` VALUES (3, 2, 'N');
INSERT INTO `Sample_Type` VALUES (4, 3, 'N');
INSERT INTO `Sample_Type` VALUES (5, 2, 'N');
INSERT INTO `Sample_Type` VALUES (6, 3, 'N');
INSERT INTO `Sample_Type` VALUES (7, 1, 'N');
INSERT INTO `Sample_Type` VALUES (6, 2, 'N');
INSERT INTO `Sample_Type` VALUES (7, 2, 'N');
INSERT INTO `Sample_Type` VALUES (8, 2, 'N');
INSERT INTO `Sample_Type` VALUES (8, 3, 'N');
INSERT INTO `Sample_Type` VALUES (9, 2, 'P');
INSERT INTO `Sample_Type` VALUES (10, 3, 'P');
INSERT INTO `Sample_Type` VALUES (11, 2, 'P');
INSERT INTO `Sample_Type` VALUES (12, 1, 'P');
INSERT INTO `Sample_Type` VALUES (3, 1, 'P');
INSERT INTO `Sample_Type` VALUES (4, 1, 'N');
COMMIT;
BEGIN;
INSERT INTO `Time` VALUES (1, '2021-10-08 17:30:00', '2021-10-09 12:21:00', '2021-10-09 19:30:00', 1, 1);
INSERT INTO `Time` VALUES (2, '2021-06-23 10:30:00', '2021-06-23 15:48:00', '2021-06-24 09:30:00', 2, 1);
INSERT INTO `Time` VALUES (3, '2021-10-31 14:50:00', '2021-11-01 09:20:00', '2021-11-01 13:43:00', 3, 2);
INSERT INTO `Time` VALUES (4, '2021-10-08 13:15:00', '2021-10-09 10:12:00', '2021-10-09 20:00:00', 4, 3);
INSERT INTO `Time` VALUES (5, '2021-10-05 11:23:00', '2021-10-05 17:30:00', '2021-10-06 07:47:00', 4, 3);
INSERT INTO `Time` VALUES (6, '2020-10-03 08:35:00', '2020-10-03 16:23:00', '2020-10-04 07:53:00', 5, 4);
INSERT INTO `Time` VALUES (6, '2020-10-04 10:57:00', '2020-10-04 18:30:00', '2020-10-05 11:49:00', 1, 1);
INSERT INTO `Time` VALUES (7, '2020-10-03 09:56:00', '2020-10-03 20:12:00', '2020-10-04 10:38:00', 6, 5);
INSERT INTO `Time` VALUES (7, '2020-10-05 06:29:00', '2020-10-05 13:19:00', '2020-10-05 23:14:00', 3, 2);
INSERT INTO `Time` VALUES (8, '2020-10-03 12:43:00', '2020-10-03 21:59:00', '2020-10-04 09:37:00', 3, 2);
INSERT INTO `Time` VALUES (8, '2020-10-03 14:36:00', '2020-10-03 23:18:00', '2020-10-04 10:31:00', 4, 3);
INSERT INTO `Time` VALUES (9, '2021-10-03 11:09:00', '2021-10-03 15:11:00', '2021-10-04 09:51:00', 5, 4);
INSERT INTO `Time` VALUES (10, '2021-10-03 10:18:00', '2021-10-03 14:49:00', '2021-10-04 10:03:00', 2, 1);
INSERT INTO `Time` VALUES (11, '2021-10-04 09:23:00', '2021-10-04 19:03:00', '2021-10-05 06:40:00', 1, 1);
INSERT INTO `Time` VALUES (12, '2021-10-04 10:13:00', '2021-10-04 17:08:00', '2021-10-05 07:01:00', 2, 1);
INSERT INTO `Time` VALUES (3, '2021-10-10 10:10:00', '2021-10-10 20:20:00', '2021-10-11 09:41:00', 7, 6);
INSERT INTO `Time` VALUES (4, '2021-10-20 13:09:00', '2021-10-21 05:52:00', '2021-10-21 12:03:00', 8, 7);
COMMIT;
BEGIN;
INSERT INTO `Patients` VALUES (1, 'Mark', 'M', 23, '233636');
INSERT INTO `Patients` VALUES (2, 'Jerry', 'M', 20, '203436');
INSERT INTO `Patients` VALUES (3, 'Cavin', 'M', 40, '407764');
INSERT INTO `Patients` VALUES (4, 'Ivy', 'F', 39, '392481');
INSERT INTO `Patients` VALUES (5, 'Marry', 'F', 17, '175432');
INSERT INTO `Patients` VALUES (6, 'AlwaysSmile', 'M', 21, '213481');
INSERT INTO `Patients` VALUES (7, 'Jenny', 'F', 60, '604175');
INSERT INTO `Patients` VALUES (8, 'Jacobe', 'M', 73, '735891');
INSERT INTO `Patients` VALUES (9, 'Kitty', 'F', 14, '143526');
INSERT INTO `Patients` VALUES (10, 'Coco', 'F', 31, '317042');
INSERT INTO `Patients` VALUES (11, 'Zoom', 'M', 41, '419050');
INSERT INTO `Patients` VALUES (12, 'Justin', 'M', 59, '597053');
COMMIT;

-- use case 8
UPDATE Doctor_information SET H_Number=(SELECT H_Number FROM Hospital INNER JOIN District USING (GPS) WHERE GPS='WI')WHERE Doctor_Name='Bill'

-- test data
BEGIN;
INSERT INTO `District` VALUES ('CB', 'Lenny town', 'mid');
INSERT INTO `District` VALUES ('CK', 'Centre Lukewarm Hillside', 'low');
INSERT INTO `District` VALUES ('EK', 'Bunny Tail district', 'low');
INSERT INTO `District` VALUES ('EX', 'Raspberry town', 'low');
INSERT INTO `District` VALUES ('NV', 'Northern Tail district', 'low');
INSERT INTO `District` VALUES ('NW', 'Bourrasque town', 'low');
INSERT INTO `District` VALUES ('SA', 'Storm town', 'low');
INSERT INTO `District` VALUES ('SG', 'Glow Sand district', 'low');
INSERT INTO `District` VALUES ('WI', 'Western Lukewarm Hillside', 'high');
INSERT INTO `District` VALUES ('WV', 'Hot district', 'low');
COMMIT;
BEGIN;
INSERT INTO `Doctor_information` VALUES (1, 'Jun Qi', 1);
INSERT INTO `Doctor_information` VALUES (2, 'David', 1);
INSERT INTO `Doctor_information` VALUES (3, 'Bob', 2);
INSERT INTO `Doctor_information` VALUES (4, 'Lisa', 3);
INSERT INTO `Doctor_information` VALUES (5, 'Eason', 4);
INSERT INTO `Doctor_information` VALUES (6, 'Lily', 5);
INSERT INTO `Doctor_information` VALUES (7, 'Nilson', 6);
INSERT INTO `Doctor_information` VALUES (8, 'Q', 7);
INSERT INTO `Doctor_information` VALUES (9, 'Bill', 6);
INSERT INTO `Doctor_information` VALUES (10, 'Aka', 8);
INSERT INTO `Doctor_information` VALUES (11, 'Pushyoo', 2);
INSERT INTO `Doctor_information` VALUES (12, 'Luvia', 8);
COMMIT;
BEGIN;
INSERT INTO `Hospital` VALUES (1, 'Central Lukewarm KIngdom Hospital', 'CK');
INSERT INTO `Hospital` VALUES (2, 'International Searching Hospital', 'CB');
INSERT INTO `Hospital` VALUES (3, 'Happy Hospital', 'NW');
INSERT INTO `Hospital` VALUES (4, 'Golden Time Hospital', 'SG');
INSERT INTO `Hospital` VALUES (5, 'Glorious Years Hospital', 'WV');
INSERT INTO `Hospital` VALUES (6, 'Hope Hospital', 'WI');
INSERT INTO `Hospital` VALUES (7, 'WisdomLake Hospital', 'EX');
COMMIT;

-- use case 9
SELECT P_Name,P_Mobile FROM Patients WHERE P_Number IN 
(SELECT DISTINCT P_Number FROM
(SELECT P_Number FROM Patients INNER JOIN Sample_Type USING (P_Number)
WHERE Sample_Type.Type_Number='1' AND Sample_Type.Sample_Result='P')result INNER JOIN Time USING (P_Number) 
WHERE Time.Collect_TIme>'2021-10-5-00:00') AND P_Age>40

-- test data
BEGIN;
INSERT INTO `Patients` VALUES (1, 'Mark', 'M', 23, '233636');
INSERT INTO `Patients` VALUES (2, 'Jerry', 'M', 20, '203436');
INSERT INTO `Patients` VALUES (3, 'Cavin', 'M', 40, '407764');
INSERT INTO `Patients` VALUES (4, 'Ivy', 'F', 39, '392481');
INSERT INTO `Patients` VALUES (5, 'Marry', 'F', 17, '175432');
INSERT INTO `Patients` VALUES (6, 'AlwaysSmile', 'M', 21, '213481');
INSERT INTO `Patients` VALUES (7, 'Jenny', 'F', 60, '604175');
INSERT INTO `Patients` VALUES (8, 'Jacobe', 'M', 73, '735891');
INSERT INTO `Patients` VALUES (9, 'Kitty', 'F', 14, '143526');
INSERT INTO `Patients` VALUES (10, 'Coco', 'F', 31, '317042');
INSERT INTO `Patients` VALUES (11, 'Zoom', 'M', 41, '419050');
INSERT INTO `Patients` VALUES (12, 'Justin', 'M', 59, '597053');
COMMIT;
BEGIN;
INSERT INTO `Sample_Type` VALUES (1, 1, 'P');
INSERT INTO `Sample_Type` VALUES (2, 1, 'N');
INSERT INTO `Sample_Type` VALUES (3, 2, 'N');
INSERT INTO `Sample_Type` VALUES (4, 3, 'N');
INSERT INTO `Sample_Type` VALUES (5, 2, 'N');
INSERT INTO `Sample_Type` VALUES (6, 3, 'N');
INSERT INTO `Sample_Type` VALUES (7, 1, 'N');
INSERT INTO `Sample_Type` VALUES (6, 2, 'N');
INSERT INTO `Sample_Type` VALUES (7, 2, 'N');
INSERT INTO `Sample_Type` VALUES (8, 2, 'N');
INSERT INTO `Sample_Type` VALUES (8, 3, 'N');
INSERT INTO `Sample_Type` VALUES (9, 2, 'P');
INSERT INTO `Sample_Type` VALUES (10, 3, 'P');
INSERT INTO `Sample_Type` VALUES (11, 2, 'P');
INSERT INTO `Sample_Type` VALUES (12, 1, 'P');
INSERT INTO `Sample_Type` VALUES (3, 1, 'P');
INSERT INTO `Sample_Type` VALUES (4, 1, 'N');
COMMIT;
BEGIN;
INSERT INTO `Time` VALUES (1, '2021-10-08 17:30:00', '2021-10-09 12:21:00', '2021-10-09 19:30:00', 1, 1);
INSERT INTO `Time` VALUES (2, '2021-06-23 10:30:00', '2021-06-23 15:48:00', '2021-06-24 09:30:00', 2, 1);
INSERT INTO `Time` VALUES (3, '2021-10-31 14:50:00', '2021-11-01 09:20:00', '2021-11-01 13:43:00', 3, 2);
INSERT INTO `Time` VALUES (4, '2021-10-08 13:15:00', '2021-10-09 10:12:00', '2021-10-09 20:00:00', 4, 3);
INSERT INTO `Time` VALUES (5, '2021-10-05 11:23:00', '2021-10-05 17:30:00', '2021-10-06 07:47:00', 4, 3);
INSERT INTO `Time` VALUES (6, '2020-10-03 08:35:00', '2020-10-03 16:23:00', '2020-10-04 07:53:00', 5, 4);
INSERT INTO `Time` VALUES (6, '2020-10-04 10:57:00', '2020-10-04 18:30:00', '2020-10-05 11:49:00', 1, 1);
INSERT INTO `Time` VALUES (7, '2020-10-03 09:56:00', '2020-10-03 20:12:00', '2020-10-04 10:38:00', 6, 5);
INSERT INTO `Time` VALUES (7, '2020-10-05 06:29:00', '2020-10-05 13:19:00', '2020-10-05 23:14:00', 3, 2);
INSERT INTO `Time` VALUES (8, '2020-10-03 12:43:00', '2020-10-03 21:59:00', '2020-10-04 09:37:00', 3, 2);
INSERT INTO `Time` VALUES (8, '2020-10-03 14:36:00', '2020-10-03 23:18:00', '2020-10-04 10:31:00', 4, 3);
INSERT INTO `Time` VALUES (9, '2021-10-03 11:09:00', '2021-10-03 15:11:00', '2021-10-04 09:51:00', 5, 4);
INSERT INTO `Time` VALUES (10, '2021-10-03 10:18:00', '2021-10-03 14:49:00', '2021-10-04 10:03:00', 2, 1);
INSERT INTO `Time` VALUES (11, '2021-10-04 09:23:00', '2021-10-04 19:03:00', '2021-10-05 06:40:00', 1, 1);
INSERT INTO `Time` VALUES (12, '2021-10-04 10:13:00', '2021-10-04 17:08:00', '2021-10-05 07:01:00', 2, 1);
INSERT INTO `Time` VALUES (3, '2021-10-10 10:10:00', '2021-10-10 20:20:00', '2021-10-11 09:41:00', 7, 6);
INSERT INTO `Time` VALUES (4, '2021-10-20 13:09:00', '2021-10-21 05:52:00', '2021-10-21 12:03:00', 8, 7);
COMMIT;

-- use case 10
SELECT Doctor_Name FROM Doctor_information WHERE H_Number IN 
(SELECT H_Number FROM Hospital WHERE GPS=(SELECT GPS FROM District WHERE District_Name='Lenny town'))

-- test data
BEGIN;
INSERT INTO `District` VALUES ('CB', 'Lenny town', 'mid');
INSERT INTO `District` VALUES ('CK', 'Centre Lukewarm Hillside', 'low');
INSERT INTO `District` VALUES ('EK', 'Bunny Tail district', 'low');
INSERT INTO `District` VALUES ('EX', 'Raspberry town', 'low');
INSERT INTO `District` VALUES ('NV', 'Northern Tail district', 'low');
INSERT INTO `District` VALUES ('NW', 'Bourrasque town', 'low');
INSERT INTO `District` VALUES ('SA', 'Storm town', 'low');
INSERT INTO `District` VALUES ('SG', 'Glow Sand district', 'low');
INSERT INTO `District` VALUES ('WI', 'Western Lukewarm Hillside', 'high');
INSERT INTO `District` VALUES ('WV', 'Hot district', 'low');
COMMIT;
BEGIN;
INSERT INTO `Hospital` VALUES (1, 'Central Lukewarm KIngdom Hospital', 'CK');
INSERT INTO `Hospital` VALUES (2, 'International Searching Hospital', 'CB');
INSERT INTO `Hospital` VALUES (3, 'Happy Hospital', 'NW');
INSERT INTO `Hospital` VALUES (4, 'Golden Time Hospital', 'SG');
INSERT INTO `Hospital` VALUES (5, 'Glorious Years Hospital', 'WV');
INSERT INTO `Hospital` VALUES (6, 'Hope Hospital', 'WI');
INSERT INTO `Hospital` VALUES (7, 'WisdomLake Hospital', 'EX');
COMMIT;
BEGIN;
INSERT INTO `Doctor_information` VALUES (1, 'Jun Qi', 1);
INSERT INTO `Doctor_information` VALUES (2, 'David', 1);
INSERT INTO `Doctor_information` VALUES (3, 'Bob', 2);
INSERT INTO `Doctor_information` VALUES (4, 'Lisa', 3);
INSERT INTO `Doctor_information` VALUES (5, 'Eason', 4);
INSERT INTO `Doctor_information` VALUES (6, 'Lily', 5);
INSERT INTO `Doctor_information` VALUES (7, 'Nilson', 6);
INSERT INTO `Doctor_information` VALUES (8, 'Q', 7);
INSERT INTO `Doctor_information` VALUES (9, 'Bill', 6);
INSERT INTO `Doctor_information` VALUES (10, 'Aka', 8);
INSERT INTO `Doctor_information` VALUES (11, 'Pushyoo', 2);
INSERT INTO `Doctor_information` VALUES (12, 'Luvia', 8);
COMMIT;


