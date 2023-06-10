/*
 Navicat Premium Data Transfer

 Source Server         : pw
 Source Server Type    : MariaDB
 Source Server Version : 100425 (10.4.25-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : turnieje

 Target Server Type    : MariaDB
 Target Server Version : 100425 (10.4.25-MariaDB)
 File Encoding         : 65001

 Date: 10/06/2023 21:36:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for drużyny
-- ----------------------------
DROP TABLE IF EXISTS `drużyny`;
CREATE TABLE `drużyny`  (
  `ID_drużyny` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Nazwa_drużyny` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Logo` geometrycollection NULL,
  `Aktywna` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`ID_drużyny`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of drużyny
-- ----------------------------
INSERT INTO `drużyny` VALUES (1, 'SK Telecom T1', NULL, 1);
INSERT INTO `drużyny` VALUES (2, 'Invictus Gaming', NULL, 1);
INSERT INTO `drużyny` VALUES (3, 'G2 Esports', NULL, 1);
INSERT INTO `drużyny` VALUES (4, 'FunPlus Phoenix', NULL, 1);
INSERT INTO `drużyny` VALUES (5, 'drużyna1', NULL, 1);

-- ----------------------------
-- Table structure for gracze
-- ----------------------------
DROP TABLE IF EXISTS `gracze`;
CREATE TABLE `gracze`  (
  `ID_Gracz` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Imie` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Nazwisko` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Nick` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Rok_urodzenia` year NOT NULL,
  `Aktywny` tinyint(1) NULL DEFAULT 1,
  `ID_kraj` int(10) UNSIGNED NOT NULL,
  `ID_drużyny` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`ID_Gracz`) USING BTREE,
  INDEX `ID_kraj`(`ID_kraj`) USING BTREE,
  INDEX `ID_drużyny`(`ID_drużyny`) USING BTREE,
  CONSTRAINT `gracze_ibfk_1` FOREIGN KEY (`ID_kraj`) REFERENCES `kraj` (`ID_Kraj`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `gracze_ibfk_2` FOREIGN KEY (`ID_drużyny`) REFERENCES `drużyny` (`ID_drużyny`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gracze
-- ----------------------------
INSERT INTO `gracze` VALUES (1, 'Lee', ' Sang-hyeok', 'Faker', 1996, 1, 1, 1);
INSERT INTO `gracze` VALUES (2, 'Mun', 'Hyeon-jun', 'Oner', 2002, 1, 1, 1);
INSERT INTO `gracze` VALUES (3, 'Choi', 'Woo-je', 'Zeus', 2004, 1, 1, 1);
INSERT INTO `gracze` VALUES (4, 'Lee', 'Min-hyeong', 'Gumayusi', 2002, 1, 1, 1);
INSERT INTO `gracze` VALUES (5, 'Ryu', 'Min-seok', 'Keria', 2002, 1, 1, 1);
INSERT INTO `gracze` VALUES (7, 'Kang', 'Seung-lok', 'TheShy', 1999, 1, 2, 2);
INSERT INTO `gracze` VALUES (8, 'Jin', 'Tong-MIn', 'Jinjao', 1999, 1, 2, 2);
INSERT INTO `gracze` VALUES (9, 'Song', 'Eui-jin', 'Rookie', 1996, 1, 2, 2);
INSERT INTO `gracze` VALUES (10, 'Huang', 'Mo', 'Baolan', 1996, 1, 2, 2);
INSERT INTO `gracze` VALUES (11, 'Yu', 'Wen-Bo', 'JackeyLove', 2000, 1, 2, 2);
INSERT INTO `gracze` VALUES (12, 'Martin', 'Hansen', 'Wunder', 1997, 1, 3, 3);
INSERT INTO `gracze` VALUES (13, 'Marcin', 'Jankowski', 'Jankos', 1995, 1, 4, 3);
INSERT INTO `gracze` VALUES (14, 'Luka', 'Perković', 'Perks', 1998, 1, 5, 3);
INSERT INTO `gracze` VALUES (16, 'Mihael', 'Mehle', 'Mikyx', 1995, 1, 6, 3);
INSERT INTO `gracze` VALUES (17, 'Rasmus', 'Caps', 'Borregaard Winther', 1998, 1, 3, 3);
INSERT INTO `gracze` VALUES (18, 'Kim', 'Tea-sang', 'Doinb', 1993, 1, 2, 4);
INSERT INTO `gracze` VALUES (19, 'Gao', 'Tian-Liang', 'Tian', 1999, 1, 2, 4);
INSERT INTO `gracze` VALUES (20, 'Liu', 'Qing-Song', 'Crips', 2000, 1, 2, 4);
INSERT INTO `gracze` VALUES (21, 'Liu', 'Ming-Yi', 'Ming', 1997, 1, 2, 4);
INSERT INTO `gracze` VALUES (22, 'Lin', 'Wei-Xiang', 'Lwx', 2000, 1, 2, 4);
INSERT INTO `gracze` VALUES (25, 'imie2', 'nazwisko2', 'nick2', 1999, 1, 5, 2);

-- ----------------------------
-- Table structure for gry
-- ----------------------------
DROP TABLE IF EXISTS `gry`;
CREATE TABLE `gry`  (
  `ID_gry` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Nazwa_gry` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ID_typ_gry` int(10) UNSIGNED NOT NULL,
  `Opis_gry` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_gry`) USING BTREE,
  INDEX `ID_typ_gry`(`ID_typ_gry`) USING BTREE,
  CONSTRAINT `gry_ibfk_1` FOREIGN KEY (`ID_typ_gry`) REFERENCES `typ_gry` (`ID_typ_gry`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gry
-- ----------------------------
INSERT INTO `gry` VALUES (1, 'Valorant', 1, 'Sieciowa strzelanka pierwszoosobowa oparta na modelu free-to-play, wyprodukowana i wydana przez Riot Games 2 czerwca 2020.');
INSERT INTO `gry` VALUES (2, 'Leauge of Legends', 3, 'Sieciowa gra komputerowa z gatunku multiplayer online battle arena. Powstała na bazie modyfikacji Defense of the Ancients do Warcraft III: The Frozen Throne. ');
INSERT INTO `gry` VALUES (3, 'Counter-Strike: Global Offensive', 1, 'Wieloosobowa strzelanka pierwszoosobowa, stworzona oraz wydana przez Valve Corporation i Hidden Path Entertainment, które już wcześniej pracowały nad Counter-Strike: Source.');
INSERT INTO `gry` VALUES (4, 'Teamfight Tactics', 2, 'Gra typu auto bitwa opracowana i opublikowana przez Riot Games. Gra jest spinoffem League of Legends i opiera się na Dota Auto Chess, w której gracze rywalizują online z siedmioma innymi przeciwnikami, budując drużynę, która będzie ostatnia.');
INSERT INTO `gry` VALUES (5, 'Dota 2', 3, 'Stworzona i wydana przez Valve Corporation. Korzysta z modelu free-to-play i jest pierwszą produkcją używającą silnika Source 2.');

-- ----------------------------
-- Table structure for kraj
-- ----------------------------
DROP TABLE IF EXISTS `kraj`;
CREATE TABLE `kraj`  (
  `ID_Kraj` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Nazwa_Kraju` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Kod_Kraju` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID_Kraj`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kraj
-- ----------------------------
INSERT INTO `kraj` VALUES (1, 'Korea', 'KR');
INSERT INTO `kraj` VALUES (2, 'Chiny', 'CHN');
INSERT INTO `kraj` VALUES (3, 'Dania', 'DK');
INSERT INTO `kraj` VALUES (4, 'Polska', 'PL');
INSERT INTO `kraj` VALUES (5, 'Chorwacja', 'HR');
INSERT INTO `kraj` VALUES (6, 'Słowenia', 'SLO');
INSERT INTO `kraj` VALUES (7, 'Japonia', 'JP');
INSERT INTO `kraj` VALUES (8, 'Francja', 'FR');
INSERT INTO `kraj` VALUES (9, 'test', 't1');

-- ----------------------------
-- Table structure for mecze
-- ----------------------------
DROP TABLE IF EXISTS `mecze`;
CREATE TABLE `mecze`  (
  `ID_mecz` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ID_turniej` int(10) UNSIGNED NOT NULL,
  `Data_rozgrywki` date NOT NULL,
  PRIMARY KEY (`ID_mecz`) USING BTREE,
  INDEX `ID_turniej`(`ID_turniej`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mecze
-- ----------------------------
INSERT INTO `mecze` VALUES (2, 2, '2022-09-26');

-- ----------------------------
-- Table structure for mecze_drużyny
-- ----------------------------
DROP TABLE IF EXISTS `mecze_drużyny`;
CREATE TABLE `mecze_drużyny`  (
  `ID_mecze_drużyny` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ID_mecz` int(10) UNSIGNED NOT NULL,
  `ID_drużyny` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`ID_mecze_drużyny`) USING BTREE,
  INDEX `ID_mecz`(`ID_mecz`) USING BTREE,
  INDEX `ID_drużyny`(`ID_drużyny`) USING BTREE,
  CONSTRAINT `mecze_drużyny_ibfk_1` FOREIGN KEY (`ID_mecz`) REFERENCES `mecze` (`ID_mecz`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `mecze_drużyny_ibfk_2` FOREIGN KEY (`ID_drużyny`) REFERENCES `drużyny` (`ID_drużyny`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mecze_drużyny
-- ----------------------------
INSERT INTO `mecze_drużyny` VALUES (1, 2, 1);
INSERT INTO `mecze_drużyny` VALUES (2, 2, 2);

-- ----------------------------
-- Table structure for mecze_drużyny_wyniki
-- ----------------------------
DROP TABLE IF EXISTS `mecze_drużyny_wyniki`;
CREATE TABLE `mecze_drużyny_wyniki`  (
  `ID_mecze_drużyny` int(10) UNSIGNED NOT NULL,
  `Miejsce` int(1) NOT NULL,
  `Punkty` int(2) NOT NULL,
  PRIMARY KEY (`ID_mecze_drużyny`) USING BTREE,
  CONSTRAINT `mecze_drużyny_wyniki_ibfk_1` FOREIGN KEY (`ID_mecze_drużyny`) REFERENCES `mecze_drużyny` (`ID_mecze_drużyny`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mecze_drużyny_wyniki
-- ----------------------------
INSERT INTO `mecze_drużyny_wyniki` VALUES (1, 1, 3);
INSERT INTO `mecze_drużyny_wyniki` VALUES (2, 2, 0);

-- ----------------------------
-- Table structure for mecze_gracze
-- ----------------------------
DROP TABLE IF EXISTS `mecze_gracze`;
CREATE TABLE `mecze_gracze`  (
  `ID_mecz` int(10) UNSIGNED NOT NULL,
  `ID_gracz` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`ID_mecz`, `ID_gracz`) USING BTREE,
  INDEX `ID_gracz`(`ID_gracz`) USING BTREE,
  CONSTRAINT `mecze_gracze_ibfk_1` FOREIGN KEY (`ID_mecz`) REFERENCES `mecze` (`ID_mecz`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `mecze_gracze_ibfk_2` FOREIGN KEY (`ID_gracz`) REFERENCES `gracze` (`ID_Gracz`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mecze_gracze
-- ----------------------------
INSERT INTO `mecze_gracze` VALUES (2, 1);

-- ----------------------------
-- Table structure for miejsca
-- ----------------------------
DROP TABLE IF EXISTS `miejsca`;
CREATE TABLE `miejsca`  (
  `ID_miejsca` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ID_Kraj` int(10) UNSIGNED NOT NULL,
  `Miasto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID_miejsca`) USING BTREE,
  INDEX `ID_Kraj`(`ID_Kraj`) USING BTREE,
  CONSTRAINT `miejsca_ibfk_1` FOREIGN KEY (`ID_Kraj`) REFERENCES `kraj` (`ID_Kraj`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of miejsca
-- ----------------------------
INSERT INTO `miejsca` VALUES (1, 1, 'Seul');
INSERT INTO `miejsca` VALUES (2, 2, 'Pekin');

-- ----------------------------
-- Table structure for nagrody_turnieju
-- ----------------------------
DROP TABLE IF EXISTS `nagrody_turnieju`;
CREATE TABLE `nagrody_turnieju`  (
  `ID_nagrody` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Nazwa_nagrody` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ID_turniej` int(10) UNSIGNED NOT NULL,
  `Miejsce` int(11) NULL DEFAULT NULL,
  `Wartość_nagordy` float NOT NULL,
  PRIMARY KEY (`ID_nagrody`) USING BTREE,
  INDEX `ID_turniej`(`ID_turniej`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nagrody_turnieju
-- ----------------------------
INSERT INTO `nagrody_turnieju` VALUES (1, 'test1', 2, 1, 10000);

-- ----------------------------
-- Table structure for turnieje
-- ----------------------------
DROP TABLE IF EXISTS `turnieje`;
CREATE TABLE `turnieje`  (
  `ID_turniej` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Nazwa_turnieju` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ID_gry` int(10) UNSIGNED NOT NULL,
  `Data_rozpoczecia` date NOT NULL,
  `Data_zakonczenia` date NOT NULL,
  `ID_miejsce` int(10) UNSIGNED NULL DEFAULT NULL,
  `ID_typ_tunieju` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`ID_turniej`, `Data_zakonczenia`) USING BTREE,
  INDEX `ID_gry`(`ID_gry`) USING BTREE,
  INDEX `ID_miejsce`(`ID_miejsce`) USING BTREE,
  INDEX `ID_typ_tunieju`(`ID_typ_tunieju`) USING BTREE,
  INDEX `ID_turniej`(`ID_turniej`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic PARTITION BY RANGE (year(`Data_zakonczenia`))
PARTITIONS 4
(PARTITION `wczesniej_2021` VALUES LESS THAN (2021) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `2021` VALUES LESS THAN (2022) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `2022` VALUES LESS THAN (2023) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `Ten_rok` VALUES LESS THAN (MAXVALUE) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 )
;

-- ----------------------------
-- Records of turnieje
-- ----------------------------
INSERT INTO `turnieje` VALUES (2, 'Test1', 1, '2022-09-26', '2022-09-30', 1, 2);
INSERT INTO `turnieje` VALUES (3, 'Turniej1', 1, '2022-01-01', '2022-01-03', 1, 2);
INSERT INTO `turnieje` VALUES (4, 'Turniej2', 1, '2022-01-02', '2022-02-03', 1, 2);
INSERT INTO `turnieje` VALUES (5, 'Turniej3', 1, '2022-11-02', '2022-11-03', 1, 2);
INSERT INTO `turnieje` VALUES (6, 'Turniej4', 1, '2022-11-02', '2022-11-03', 1, 2);

-- ----------------------------
-- Table structure for turnieje_drużyny
-- ----------------------------
DROP TABLE IF EXISTS `turnieje_drużyny`;
CREATE TABLE `turnieje_drużyny`  (
  `ID_turniej` int(10) UNSIGNED NOT NULL,
  `ID_dryżyny` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`ID_turniej`, `ID_dryżyny`) USING BTREE,
  INDEX `ID_dryżyny`(`ID_dryżyny`) USING BTREE,
  CONSTRAINT `turnieje_drużyny_ibfk_2` FOREIGN KEY (`ID_dryżyny`) REFERENCES `drużyny` (`ID_drużyny`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of turnieje_drużyny
-- ----------------------------
INSERT INTO `turnieje_drużyny` VALUES (2, 1);
INSERT INTO `turnieje_drużyny` VALUES (2, 2);
INSERT INTO `turnieje_drużyny` VALUES (2, 3);

-- ----------------------------
-- Table structure for turnieje_gracze
-- ----------------------------
DROP TABLE IF EXISTS `turnieje_gracze`;
CREATE TABLE `turnieje_gracze`  (
  `ID_turniej` int(10) UNSIGNED NOT NULL,
  `ID_Gracz` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`ID_turniej`, `ID_Gracz`) USING BTREE,
  INDEX `ID_Gracz`(`ID_Gracz`) USING BTREE,
  CONSTRAINT `turnieje_gracze_ibfk_2` FOREIGN KEY (`ID_Gracz`) REFERENCES `gracze` (`ID_Gracz`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of turnieje_gracze
-- ----------------------------
INSERT INTO `turnieje_gracze` VALUES (2, 1);

-- ----------------------------
-- Table structure for typ_gry
-- ----------------------------
DROP TABLE IF EXISTS `typ_gry`;
CREATE TABLE `typ_gry`  (
  `ID_typ_gry` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Typ_gry` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID_typ_gry`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of typ_gry
-- ----------------------------
INSERT INTO `typ_gry` VALUES (1, 'Strzelanka');
INSERT INTO `typ_gry` VALUES (2, 'Strategia');
INSERT INTO `typ_gry` VALUES (3, 'MOBA');

-- ----------------------------
-- Table structure for typ_turnieju
-- ----------------------------
DROP TABLE IF EXISTS `typ_turnieju`;
CREATE TABLE `typ_turnieju`  (
  `ID_typ_turnieju` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Typ_turnieju` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID_typ_turnieju`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of typ_turnieju
-- ----------------------------
INSERT INTO `typ_turnieju` VALUES (1, 'Online');
INSERT INTO `typ_turnieju` VALUES (2, 'LAN');

-- ----------------------------
-- Table structure for wyniki_turnieju
-- ----------------------------
DROP TABLE IF EXISTS `wyniki_turnieju`;
CREATE TABLE `wyniki_turnieju`  (
  `ID_wyniki_turnieju` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ID_turniej` int(10) UNSIGNED NOT NULL,
  `ID_drużyna` int(10) UNSIGNED NOT NULL,
  `ID_nagrody` int(10) UNSIGNED NULL DEFAULT NULL,
  `Miejsce` int(5) NOT NULL,
  `Wynik` int(10) NOT NULL,
  PRIMARY KEY (`ID_wyniki_turnieju`) USING BTREE,
  INDEX `ID_turniej`(`ID_turniej`) USING BTREE,
  INDEX `ID_drużyna`(`ID_drużyna`) USING BTREE,
  INDEX `ID_nagrody`(`ID_nagrody`) USING BTREE,
  CONSTRAINT `wyniki_turnieju_ibfk_2` FOREIGN KEY (`ID_drużyna`) REFERENCES `drużyny` (`ID_drużyny`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `wyniki_turnieju_ibfk_3` FOREIGN KEY (`ID_nagrody`) REFERENCES `nagrody_turnieju` (`ID_nagrody`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wyniki_turnieju
-- ----------------------------
INSERT INTO `wyniki_turnieju` VALUES (1, 2, 1, 1, 1, 45);
INSERT INTO `wyniki_turnieju` VALUES (2, 2, 2, NULL, 2, 4);
INSERT INTO `wyniki_turnieju` VALUES (3, 2, 3, NULL, 3, 2);

-- ----------------------------
-- Procedure structure for aktywośćdrużyna
-- ----------------------------
DROP PROCEDURE IF EXISTS `aktywośćdrużyna`;
delimiter ;;
CREATE PROCEDURE `aktywośćdrużyna`(IN i_id int)
BEGIN
  #Routine body goes here...
	SELECT Aktywna INTO @aktywnosc from `drużyny` WHERE `ID_drużyny`=i_id;
	if @aktywnosc = 1 THEN
		UPDATE `drużyny` SET Aktywna = 0 where `ID_drużyny` = i_id;
	else 
		UPDATE `drużyny` SET Aktywna = 1 where `ID_drużyny`= i_id;
	END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for aktywośćgracz
-- ----------------------------
DROP PROCEDURE IF EXISTS `aktywośćgracz`;
delimiter ;;
CREATE PROCEDURE `aktywośćgracz`(IN i_id int)
BEGIN
  #Routine body goes here...
	SELECT Aktywny INTO @aktywnosc from gracze WHERE ID_Gracz=i_id;
	if @aktywnosc = 1 THEN
		UPDATE gracze SET Aktywny = 0 where ID_Gracz = i_id;
	else 
		UPDATE gracze SET Aktywny = 1 where ID_Gracz = i_id;
	END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for dodajkraj
-- ----------------------------
DROP PROCEDURE IF EXISTS `dodajkraj`;
delimiter ;;
CREATE PROCEDURE `dodajkraj`(i_nazwa text, i_skrot text)
BEGIN
  #Routine body goes here...
	IF LENGTH(i_nazwa)=0 or LENGTH(i_skrot)=0 THEN 
			SIGNAL SQLSTATE '45000' set message_text='Nie wszystkie dane zostały uzupełnione'; 
	Else 
		INSERT into kraj(Nazwa_Kraju,Kod_Kraju) VALUES (i_nazwa, i_skrot);
	END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for dodajmiejsce
-- ----------------------------
DROP PROCEDURE IF EXISTS `dodajmiejsce`;
delimiter ;;
CREATE PROCEDURE `dodajmiejsce`(i_id_kraj int, i_miasto text)
BEGIN
  #Routine body goes here...
	IF LENGTH(i_id_kraj)=0 or LENGTH(i_miasto)=0 THEN 
			SIGNAL SQLSTATE '45000' set message_text='Nie wszystkie dane zostały uzupełnione'; 
	Else 
		INSERT into `miejsca`(`ID_kraj`,Miasto) VALUES (i_id_kraj, i_miasto);
	END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for dodaj_drużyne
-- ----------------------------
DROP PROCEDURE IF EXISTS `dodaj_drużyne`;
delimiter ;;
CREATE PROCEDURE `dodaj_drużyne`(i_nazwa text)
BEGIN
  #Routine body goes here...
	IF LENGTH(i_nazwa)=0 THEN 
			SIGNAL SQLSTATE '45000' set message_text='Nie wszystkie dane zostały uzupełnione'; 
	Else 
		INSERT into `drużyny`(`Nazwa_drużyny`,Aktywna) VALUES (i_nazwa,1);
	END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for dodaj_drużyne_do_turnieju
-- ----------------------------
DROP PROCEDURE IF EXISTS `dodaj_drużyne_do_turnieju`;
delimiter ;;
CREATE PROCEDURE `dodaj_drużyne_do_turnieju`(i_id_turnieju int, i_id_drużyna int)
BEGIN
  #Routine body goes here...
	IF LENGTH(i_id_turnieju)=0 or LENGTH(i_id_drużyna) = 0 THEN 
			SIGNAL SQLSTATE '45000' set message_text='Nie wszystkie dane zostały uzupełnione'; 
	Else 
		INSERT into `turnieje_drużyny`(ID_turniej,`ID_dryżyny`) VALUES (i_id_turnieju, i_id_drużyna);
	END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for dodaj_gracza
-- ----------------------------
DROP PROCEDURE IF EXISTS `dodaj_gracza`;
delimiter ;;
CREATE PROCEDURE `dodaj_gracza`(i_imie text,i_nick text,i_nazwisko text,i_rok INT,i_id_druzyny INT,i_id_kraj text)
BEGIN
  #Routine body goes here...
		IF length(i_imie)=0 or length(i_nick)=0 or length(i_nazwisko)= 0 or length(i_id_druzyny)=0 or length(i_id_kraj) = 0 or length(i_rok) = 0 THEN
		SIGNAL SQLSTATE '45000' set message_text='Nie wszystkie dane zostały uzupełnione'; 
	ELSE
		INSERT INTO Gracze(Imie, Nazwisko,Nick, Rok_urodzenia ,Aktywny, ID_kraj, ID_drużyny) VALUES (i_imie, i_nazwisko, i_nick, i_rok, 1, i_ID_kraj, i_ID_druzyny);
		END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for dodaj_gracza_do_turnieju
-- ----------------------------
DROP PROCEDURE IF EXISTS `dodaj_gracza_do_turnieju`;
delimiter ;;
CREATE PROCEDURE `dodaj_gracza_do_turnieju`(i_id_turnieju int, i_id_gracz int)
BEGIN
  #Routine body goes here...
	IF LENGTH(i_id_turnieju)=0 or LENGTH(i_id_gracz) = 0 THEN 
			SIGNAL SQLSTATE '45000' set message_text='Nie wszystkie dane zostały uzupełnione'; 
	Else 
		INSERT into `turnieje_gracze`(ID_turniej,`ID_gracz`) VALUES (i_id_turnieju, i_id_gracz);
	END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for dodaj_mecz
-- ----------------------------
DROP PROCEDURE IF EXISTS `dodaj_mecz`;
delimiter ;;
CREATE PROCEDURE `dodaj_mecz`(i_id_turnieju int, i_data_roz date)
BEGIN
  #Routine body goes here...
	IF LENGTH(i_id_turnieju)=0 THEN 
			SIGNAL SQLSTATE '45000' set message_text='Nie wszystkie dane zostały uzupełnione'; 
	Else 
		INSERT into mecze(ID_turniej,Data_rozgrywki) VALUES (i_id_turnieju, i_data_roz);
	END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for dodaj_mecz_drużyna
-- ----------------------------
DROP PROCEDURE IF EXISTS `dodaj_mecz_drużyna`;
delimiter ;;
CREATE PROCEDURE `dodaj_mecz_drużyna`(i_id_mecz int, i_id_drużyna int)
BEGIN
  #Routine body goes here...
	IF LENGTH(i_id_mecz)=0 or LENGTH(i_id_drużyna) = 0 THEN 
			SIGNAL SQLSTATE '45000' set message_text='Nie wszystkie dane zostały uzupełnione'; 
	Else 
		INSERT into `mecze_drużyny`(ID_mecz,`ID_drużyny`) VALUES (i_id_mecz, i_id_drużyna);
	END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for dodaj_mecz_gracz
-- ----------------------------
DROP PROCEDURE IF EXISTS `dodaj_mecz_gracz`;
delimiter ;;
CREATE PROCEDURE `dodaj_mecz_gracz`(i_id_mecz int, i_id_gracz int)
BEGIN
  #Routine body goes here...
	IF LENGTH(i_id_mecz)=0 or LENGTH(i_id_gracz) = 0 THEN 
			SIGNAL SQLSTATE '45000' set message_text='Nie wszystkie dane zostały uzupełnione'; 
	Else 
		INSERT into mecze_gracze(ID_mecz,ID_gracz) VALUES (i_id_mecz, i_id_gracz);
	END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for dodaj_nagrode
-- ----------------------------
DROP PROCEDURE IF EXISTS `dodaj_nagrode`;
delimiter ;;
CREATE PROCEDURE `dodaj_nagrode`(i_nazwa text, i_id_turniej int, i_miejsce int, i_wartosc int)
BEGIN
  #Routine body goes here...
	IF LENGTH(i_nazwa)=0 or LENGTH( i_id_turniej) = 0 or LENGTH(i_miejsce) = 0 or LENGTH(i_wartosc) = 0 THEN 
			SIGNAL SQLSTATE '45000' set message_text='Nie wszystkie dane zostały uzupełnione'; 
	Else 
		INSERT into `nagrody_turnieju`(Nazwa_nagrody, ID_turniej, Miejsce, `Wartość_nagordy`) VALUES (i_nazwa, i_id_turniej , i_miejsce , i_wartosc );
	END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for dodaj_turniej
-- ----------------------------
DROP PROCEDURE IF EXISTS `dodaj_turniej`;
delimiter ;;
CREATE PROCEDURE `dodaj_turniej`(i_nazwa text, i_id_gry int, i_data_roz date, i_data_zak date, i_id_miejsca int, i_id_typ INT)
BEGIN
  #Routine body goes here...
		IF LENGTH(i_nazwa)=0 OR LENGTH(i_id_gry)=0 OR LENGTH(i_id_miejsca)=0 OR LENGTH(i_id_typ)=0 THEN 
			SIGNAL SQLSTATE '45000' set message_text='Nie wszystkie dane zostały uzupełnione';  
			ELSE IF i_data_roz >= i_data_zak THEN 
				SIGNAL SQLSTATE '45000' set message_text='Błędnie wpisana data trwania turnieju';  
				Else IF i_id_gry = 1 or i_id_gry = 2 THEN 
					INSERT INTO turnieje(Nazwa_turnieju,ID_gry,Data_rozpoczecia,Data_zakonczenia,ID_miejsce,ID_typ_tunieju) VALUES (i_nazwa,i_id_gry,i_data_roz,i_data_zak,i_id_miejsca,i_id_typ);
					END IF;
				END IF;
			END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for dodaj_wyniki_turnieju
-- ----------------------------
DROP PROCEDURE IF EXISTS `dodaj_wyniki_turnieju`;
delimiter ;;
CREATE PROCEDURE `dodaj_wyniki_turnieju`(i_id_turniej int, i_id_drużyna int, i_id_nagroda int, i_miejsce int, i_wynik int)
BEGIN
  #Routine body goes here...
	IF LENGTH(i_id_turniej)=0 or LENGTH(i_id_drużyna) = 0 or LENGTH(i_id_nagroda) = 0 or LENGTH(i_miejsce) = 0 or LENGTH(i_wynik) = 0 THEN 
			SIGNAL SQLSTATE '45000' set message_text='Nie wszystkie dane zostały uzupełnione'; 
	Else 
		INSERT into `wyniki_turnieju`(ID_turniej,`ID_drużyna`,ID_nagrody,Miejsce,Wynik) VALUES (i_id_turniej, i_id_drużyna, i_id_nagroda, i_miejsce, i_wynik);
	END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for dodaj_wynik_meczu_drużyny
-- ----------------------------
DROP PROCEDURE IF EXISTS `dodaj_wynik_meczu_drużyny`;
delimiter ;;
CREATE PROCEDURE `dodaj_wynik_meczu_drużyny`(i_id_mecz_drużyny int, i_miejsce int, i_punkty int)
BEGIN
  #Routine body goes here...
	IF LENGTH(i_id_mecz_drużyny )=0 or LENGTH(i_miejsce) = 0 or LENGTH(i_punkty) = 0 THEN 
			SIGNAL SQLSTATE '45000' set message_text='Nie wszystkie dane zostały uzupełnione'; 
	Else 
		INSERT into `mecze_drużyny_wyniki`(`ID_mecze_drużyny`,`Miejsce`, Punkty) VALUES (i_id_mecz_drużyny, i_miejsce, i_punkty);
	END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table mecze
-- ----------------------------
DROP TRIGGER IF EXISTS `ID_turniej-mecze`;
delimiter ;;
CREATE TRIGGER `ID_turniej-mecze` BEFORE INSERT ON `mecze` FOR EACH ROW BEGIN
IF NEW.ID_turniej NOT IN (SELECT ID_turniej FROM turnieje) THEN 
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Takiego turnieju nie ma w bazie';
END if;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table nagrody_turnieju
-- ----------------------------
DROP TRIGGER IF EXISTS `ID_turnieje-narody`;
delimiter ;;
CREATE TRIGGER `ID_turnieje-narody` BEFORE INSERT ON `nagrody_turnieju` FOR EACH ROW BEGIN
IF NEW.ID_turniej NOT IN (SELECT ID_turniej FROM turnieje) THEN 
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Takiego turnieju nie ma w bazie';
END if;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table turnieje
-- ----------------------------
DROP TRIGGER IF EXISTS `ID_gry`;
delimiter ;;
CREATE TRIGGER `ID_gry` BEFORE INSERT ON `turnieje` FOR EACH ROW BEGIN
IF NEW.ID_gry NOT IN (SELECT ID_gry FROM gry) THEN 
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Takiej gry nie ma w bazie';
END if;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table turnieje
-- ----------------------------
DROP TRIGGER IF EXISTS `ID_miejsca`;
delimiter ;;
CREATE TRIGGER `ID_miejsca` BEFORE INSERT ON `turnieje` FOR EACH ROW BEGIN
IF NEW.ID_miejsce NOT IN (SELECT ID_miejsca FROM miejsca) THEN 
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Takiego miejsca nie ma w bazie';
END if;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table turnieje
-- ----------------------------
DROP TRIGGER IF EXISTS `ID_typ_turnieju`;
delimiter ;;
CREATE TRIGGER `ID_typ_turnieju` BEFORE INSERT ON `turnieje` FOR EACH ROW BEGIN
IF NEW.ID_typ_tunieju NOT IN (SELECT ID_typ_turnieju FROM typ_turnieju) THEN 
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Błędnie wpisany typ turnieju';
END if;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table turnieje_drużyny
-- ----------------------------
DROP TRIGGER IF EXISTS `ID_turniej-druzyny`;
delimiter ;;
CREATE TRIGGER `ID_turniej-druzyny` BEFORE INSERT ON `turnieje_drużyny` FOR EACH ROW BEGIN
IF NEW.ID_turniej NOT IN (SELECT ID_turniej FROM turnieje) THEN 
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Takiego turnieju nie ma w bazie';
END if;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table turnieje_gracze
-- ----------------------------
DROP TRIGGER IF EXISTS `ID_turniej-gracze`;
delimiter ;;
CREATE TRIGGER `ID_turniej-gracze` BEFORE INSERT ON `turnieje_gracze` FOR EACH ROW BEGIN
IF NEW.ID_turniej NOT IN (SELECT ID_turniej FROM turnieje) THEN 
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Takiego turnieju nie ma w bazie';
END if;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table wyniki_turnieju
-- ----------------------------
DROP TRIGGER IF EXISTS `ID_turniej-wyniki`;
delimiter ;;
CREATE TRIGGER `ID_turniej-wyniki` BEFORE INSERT ON `wyniki_turnieju` FOR EACH ROW BEGIN
IF NEW.ID_turniej NOT IN (SELECT ID_turniej FROM turnieje) THEN 
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Takiego turnieju nie ma w bazie';
END if;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
