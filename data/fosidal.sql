-- MySQL dump 10.13  Distrib 5.5.47, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: fosidal
-- ------------------------------------------------------
-- Server version	5.5.47-0ubuntu0.14.04.1

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
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `isCorrect` tinyint(1) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_DADD4A251E27F6BF` (`question_id`),
  CONSTRAINT `FK_DADD4A251E27F6BF` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES (1,1,'Do godziny 16-17, żeby nie pobudzać sekrecji w godzinach nocnych',0,1),(2,1,'O każdej porze dnia i nocy',1,2),(3,1,'Do trzech razy dziennie tylko w ciągu dnia',0,3),(4,2,'Fosidal hamuje odruch kaszlowy i może być stosowany tylko w terapii kaszlu suchego',0,1),(5,2,'Fosidal rozrzedza wydzielinę i może być stosowany tylko w terapii kaszlu mokrego',0,2),(6,2,'Fosidal działa przeciwzapalnie w drogach oddechowych i może być stosowanych przy kaszlu suchym i mokrym',1,3),(7,3,'Fosidal nie wykazuje interakcji z mukolitykami (bromoheksyna, ambroksol), więc można łączyć ze sobą te leki',1,1),(8,3,'Fosidal nie wykazuje interakcji z mukolitykami (bromoheksyna, ambroksol), ale nie powinno się łączyć tych leków',0,2),(10,3,'Fosidal wykazuje interakcje z lekami hamującymi odruch kaszlowy (np. Dexapico) i dlatego nie powinno się łączyć tych leków',0,3),(11,4,'Tylko w I. fazie (kaszel suchy)',0,1),(12,4,'Tylko w II. fazie (kaszel mokry)',0,2),(13,4,'Fosidal może być stosowany w każdej fazie zakażenia dróg oddechowych',1,3);
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fos_user`
--

DROP TABLE IF EXISTS `fos_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fos_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_957A647992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_957A6479A0D96FBF` (`email_canonical`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fos_user`
--

LOCK TABLES `fos_user` WRITE;
/*!40000 ALTER TABLE `fos_user` DISABLE KEYS */;
INSERT INTO `fos_user` VALUES (2,'admin','admin','rogalski.tomaszek@gmail.com','rogalski.tomaszek@gmail.com',1,'qdk8ji7y1xcws044g0o4w8sk0o88kss','$2y$13$qdk8ji7y1xcws044g0o4wudnkOxLacIWvfdAozaE3OxQfoJs0aGUe','2016-02-07 18:42:00',0,0,NULL,NULL,NULL,'a:1:{i:0;s:10:\"ROLE_ADMIN\";}',0,NULL),(3,'agata','agata','agata.menesiak@nuorder.pl','agata.menesiak@nuorder.pl',1,'qgfoez49wwgcc0wwgc8s08ggwowgc0k','$2y$13$qgfoez49wwgcc0wwgc8s0u2oTUPEASPSu2npgOTdU680iljPt4KJq','2016-02-01 22:21:50',0,0,NULL,NULL,NULL,'a:1:{i:0;s:10:\"ROLE_ADMIN\";}',0,NULL);
/*!40000 ALTER TABLE `fos_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `keywords` longtext COLLATE utf8_unicode_ci,
  `hashname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_140AB620107EC1CF` (`hashname`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` VALUES (1,'Regulamin','Regulamin','regulamin','rule'),(2,'O firmie','O firmie','o firmie','about'),(3,'Odpowiedzialność społeczna','Odpowiedzialność społeczna','Odpowiedzialność społeczna','responsibility'),(4,'Zgłoś działania nieporządane','Zgłoś działania nieporządane','Zgłoś działania nieporządane','notice'),(5,'Kontakt','Kontakt','Kontakt','contact');
/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `timeToAnswer` int(11) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B6F7494EB3FE509D` (`survey_id`),
  CONSTRAINT `FK_B6F7494EB3FE509D` FOREIGN KEY (`survey_id`) REFERENCES `survey` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,2,'1 W jakich godzinach może być podawany Fosidal?',10,5,1),(2,2,'2 Które z poniższych stwierdzeń jest prawidłowe',60,6,2),(3,2,'3 Które z poniższych stwierdzeń jest prawidłowe',33,7,3),(4,2,'4 W której fazie zakażenia dróg oddechowych można stosować Fosidal',34,8,4);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `surname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `street` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `houseNr` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `flatNr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postCode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `agree1` tinyint(1) NOT NULL,
  `agree2` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `survey_id` int(11) DEFAULT NULL,
  `points` int(11) NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_136AC113B3FE509D` (`survey_id`),
  CONSTRAINT `FK_136AC113B3FE509D` FOREIGN KEY (`survey_id`) REFERENCES `survey` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result`
--

LOCK TABLES `result` WRITE;
/*!40000 ALTER TABLE `result` DISABLE KEYS */;
INSERT INTO `result` VALUES (1,'Tomek','Rogalski','test@test','Waniliowa','46',NULL,'12222','Kamionki','608651322',1,1,'2016-01-25 21:53:55',2,5,'{\"1\":5,\"2\":0,\"3\":0,\"4\":0}'),(2,'Tomek','Rogalski','test@test','Waniliowa','46',NULL,'62023','Kamionki','666 666 666',1,1,'2016-01-25 22:16:02',2,5,'{\"1\":5,\"2\":0,\"3\":0,\"4\":0}'),(3,'Tomek','Rogalski','test@test','Waniliowa','46',NULL,'62023','Kamionki','666 666 666',1,1,'2016-01-25 22:18:15',2,5,'{\"1\":5,\"2\":0,\"3\":0,\"4\":0}'),(4,'Tomek','Rogalski','test@test','Waniliowa','46',NULL,'62023','Kamionki','666 666 666',1,1,'2016-01-25 22:19:33',2,5,'{\"1\":5,\"2\":0,\"3\":0,\"4\":0}'),(5,'Tomek','Rogalski','rogalski.tomaszek@gmail.com','Waniliowa','46',NULL,'11111','Kamionki','608-651-322',1,1,'2016-01-27 22:03:18',2,0,'{\"1\":{\"point\":0,\"timeLeft\":\"0\"},\"2\":{\"point\":0,\"timeLeft\":\"0\"},\"3\":{\"point\":0,\"timeLeft\":\"0\"},\"4\":{\"point\":0,\"timeLeft\":\"0\"}}'),(6,'Tomek','Rogalski','rogalski.tomaszek@gmail.com','Waniliowa','46',NULL,'11111','Kamionki','608651322',1,1,'2016-01-27 22:08:18',2,12,'{\"1\":{\"point\":5,\"timeLeft\":\"8\"},\"2\":{\"point\":0,\"timeLeft\":\"32\"},\"3\":{\"point\":7,\"timeLeft\":\"33\"},\"4\":{\"point\":0,\"timeLeft\":\"34\"}}'),(7,'Tomek','Rogalski','aa@aa.pl','aa','23dd','34','12340','aaa','+48 666 666 000',1,0,'2016-01-30 20:35:52',2,5,'{\"1\":{\"point\":5,\"timeLeft\":\"5\"},\"2\":{\"point\":0,\"timeLeft\":\"59\"},\"3\":{\"point\":0,\"timeLeft\":\"32\"},\"4\":{\"point\":0,\"timeLeft\":\"33\"}}'),(9,'Tomek','Rogalski','rogalski.tomaszek1@gmail.com','Waniliowa','46',NULL,'11111','Kamionki','608651322',1,0,'2016-01-30 21:24:22',2,7,'{\"1\":{\"point\":0,\"timeLeft\":\"0\"},\"2\":{\"point\":0,\"timeLeft\":\"21\"},\"3\":{\"point\":7,\"timeLeft\":\"33\"},\"4\":{\"point\":0,\"timeLeft\":\"34\"}}'),(10,'Tomek','Rogalski','rogalski.tomaszek2@gmail.com','Waniliowa','46',NULL,'11111','Kamionki','608651322',1,0,'2016-02-03 20:49:56',2,0,'{\"1\":{\"point\":0,\"timeLeft\":\"0\"},\"2\":{\"point\":0,\"timeLeft\":\"0\"},\"3\":{\"point\":0,\"timeLeft\":\"0\"},\"4\":{\"point\":0,\"timeLeft\":\"0\"}}'),(11,'Tomek','Rogalski','test@test','Waniliowa','46',NULL,'12222','Kamionki','608651322',1,1,'2016-01-25 22:53:55',2,5,'{\"1\":5,\"2\":0,\"3\":0,\"4\":0}'),(12,'Tomek','Rogalski','test@test','Waniliowa','46',NULL,'62023','Kamionki','666 666 666',1,1,'2016-01-25 23:16:02',2,5,'{\"1\":5,\"2\":0,\"3\":0,\"4\":0}'),(13,'Tomek','Rogalski','test@test','Waniliowa','46',NULL,'62023','Kamionki','666 666 666',1,1,'2016-01-25 23:18:15',2,5,'{\"1\":5,\"2\":0,\"3\":0,\"4\":0}'),(14,'Tomek','Rogalski','test@test','Waniliowa','46',NULL,'62023','Kamionki','666 666 666',1,1,'2016-01-25 23:19:33',2,5,'{\"1\":5,\"2\":0,\"3\":0,\"4\":0}'),(15,'Tomek','Rogalski','rogalski.tomaszek@gmail.com','Waniliowa','46',NULL,'11111','Kamionki','608-651-322',1,1,'2016-01-27 23:03:18',2,0,'{\"1\":{\"point\":0,\"timeLeft\":\"0\"},\"2\":{\"point\":0,\"timeLeft\":\"0\"},\"3\":{\"point\":0,\"timeLeft\":\"0\"},\"4\":{\"point\":0,\"timeLeft\":\"0\"}}'),(16,'Tomek','Rogalski','rogalski.tomaszek@gmail.com','Waniliowa','46',NULL,'11111','Kamionki','608651322',1,1,'2016-01-27 23:08:18',2,12,'{\"1\":{\"point\":5,\"timeLeft\":\"8\"},\"2\":{\"point\":0,\"timeLeft\":\"32\"},\"3\":{\"point\":7,\"timeLeft\":\"33\"},\"4\":{\"point\":0,\"timeLeft\":\"34\"}}'),(17,'Tomek','Rogalski','aa@aa.pl','aa','23dd','34','12340','aaa','+48 666 666 000',1,0,'2016-01-30 21:35:52',2,5,'{\"1\":{\"point\":5,\"timeLeft\":\"5\"},\"2\":{\"point\":0,\"timeLeft\":\"59\"},\"3\":{\"point\":0,\"timeLeft\":\"32\"},\"4\":{\"point\":0,\"timeLeft\":\"33\"}}'),(18,'Tomek','Rogalski','rogalski.tomaszek1@gmail.com','Waniliowa','46',NULL,'11111','Kamionki','608651322',1,0,'2016-01-30 22:24:22',2,7,'{\"1\":{\"point\":0,\"timeLeft\":\"0\"},\"2\":{\"point\":0,\"timeLeft\":\"21\"},\"3\":{\"point\":7,\"timeLeft\":\"33\"},\"4\":{\"point\":0,\"timeLeft\":\"34\"}}'),(19,'Tomek','Rogalski','rogalski.tomaszek2@gmail.com','Waniliowa','46',NULL,'11111','Kamionki','608651322',1,0,'2016-02-03 21:49:56',2,0,'{\"1\":{\"point\":0,\"timeLeft\":\"0\"},\"2\":{\"point\":0,\"timeLeft\":\"0\"},\"3\":{\"point\":0,\"timeLeft\":\"0\"},\"4\":{\"point\":0,\"timeLeft\":\"0\"}}'),(20,'Tomek','Rogalski','test@test','Waniliowa','46',NULL,'12222','Kamionki','608651322',1,1,'2016-01-25 22:53:55',2,5,'{\"1\":5,\"2\":0,\"3\":0,\"4\":0}'),(21,'Tomek','Rogalski','test@test','Waniliowa','46',NULL,'62023','Kamionki','666 666 666',1,1,'2016-01-25 23:16:02',2,5,'{\"1\":5,\"2\":0,\"3\":0,\"4\":0}'),(22,'Tomek','Rogalski','test@test','Waniliowa','46',NULL,'62023','Kamionki','666 666 666',1,1,'2016-01-25 23:18:15',2,5,'{\"1\":5,\"2\":0,\"3\":0,\"4\":0}'),(23,'Tomek','Rogalski','test@test','Waniliowa','46',NULL,'62023','Kamionki','666 666 666',1,1,'2016-01-25 23:19:33',2,5,'{\"1\":5,\"2\":0,\"3\":0,\"4\":0}'),(24,'Tomek','Rogalski','rogalski.tomaszek@gmail.com','Waniliowa','46',NULL,'11111','Kamionki','608-651-322',1,1,'2016-01-27 23:03:18',2,0,'{\"1\":{\"point\":0,\"timeLeft\":\"0\"},\"2\":{\"point\":0,\"timeLeft\":\"0\"},\"3\":{\"point\":0,\"timeLeft\":\"0\"},\"4\":{\"point\":0,\"timeLeft\":\"0\"}}'),(25,'Tomek','Rogalski','rogalski.tomaszek@gmail.com','Waniliowa','46',NULL,'11111','Kamionki','608651322',1,1,'2016-01-27 23:08:18',2,12,'{\"1\":{\"point\":5,\"timeLeft\":\"8\"},\"2\":{\"point\":0,\"timeLeft\":\"32\"},\"3\":{\"point\":7,\"timeLeft\":\"33\"},\"4\":{\"point\":0,\"timeLeft\":\"34\"}}'),(26,'Tomek','Rogalski','aa@aa.pl','aa','23dd','34','12340','aaa','+48 666 666 000',1,0,'2016-01-30 21:35:52',2,5,'{\"1\":{\"point\":5,\"timeLeft\":\"5\"},\"2\":{\"point\":0,\"timeLeft\":\"59\"},\"3\":{\"point\":0,\"timeLeft\":\"32\"},\"4\":{\"point\":0,\"timeLeft\":\"33\"}}'),(27,'Tomek','Rogalski','rogalski.tomaszek1@gmail.com','Waniliowa','46',NULL,'11111','Kamionki','608651322',1,0,'2016-01-30 22:24:22',2,7,'{\"1\":{\"point\":0,\"timeLeft\":\"0\"},\"2\":{\"point\":0,\"timeLeft\":\"21\"},\"3\":{\"point\":7,\"timeLeft\":\"33\"},\"4\":{\"point\":0,\"timeLeft\":\"34\"}}'),(28,'Tomek','Rogalski','rogalski.tomaszek2@gmail.com','Waniliowa','46',NULL,'11111','Kamionki','608651322',1,0,'2016-02-03 21:49:56',2,0,'{\"1\":{\"point\":0,\"timeLeft\":\"0\"},\"2\":{\"point\":0,\"timeLeft\":\"0\"},\"3\":{\"point\":0,\"timeLeft\":\"0\"},\"4\":{\"point\":0,\"timeLeft\":\"0\"}}'),(29,'Tomek','Kowalski','test@test2.pl','Krótka','46',NULL,'23456','Warszawa','999 999 999',1,0,'2016-02-03 22:38:38',2,0,'{\"1\":{\"point\":0,\"timeLeft\":\"0\"},\"2\":{\"point\":0,\"timeLeft\":\"0\"},\"3\":{\"point\":0,\"timeLeft\":\"30\"},\"4\":{\"point\":0,\"timeLeft\":\"33\"}}'),(30,'Marek','Burczymucha','test@test3.pl','Mokra','54',NULL,'33333','Kraków','667 667 666',1,0,'2016-02-03 22:42:17',2,0,'{\"1\":{\"point\":0,\"timeLeft\":\"0\"},\"2\":{\"point\":0,\"timeLeft\":\"0\"},\"3\":{\"point\":0,\"timeLeft\":\"0\"},\"4\":{\"point\":0,\"timeLeft\":\"0\"}}');
/*!40000 ALTER TABLE `result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey`
--

DROP TABLE IF EXISTS `survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey`
--

LOCK TABLES `survey` WRITE;
/*!40000 ALTER TABLE `survey` DISABLE KEYS */;
INSERT INTO `survey` VALUES (2,'Fosidal 1','2016-01-01 00:00:00','2016-12-31 23:59:00');
/*!40000 ALTER TABLE `survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `text`
--

DROP TABLE IF EXISTS `text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `text` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_3B8BA7C7C4663E4` (`page_id`),
  CONSTRAINT `FK_3B8BA7C7C4663E4` FOREIGN KEY (`page_id`) REFERENCES `page` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `text`
--

LOCK TABLES `text` WRITE;
/*!40000 ALTER TABLE `text` DISABLE KEYS */;
INSERT INTO `text` VALUES (1,1,'Regulamin konkuru','<ol>\r\n                <li>Postanowienia ogólne\r\n                    <ol>\r\n                        <li>Niniejszy Regulamin określa zasady uczestnictwa w konkursie kierowanego do farmaceutów i techników farmacji (dalej: Konkurs).</li>\r\n                        <li>Organizatorem Konkursu jest Polpharma Biuro Handlowe Sp. z o.o., z siedzibą w Warszawie (00 - 728), ul. Bobrowiecka 6, wpisana do rejestru przedsiębiorców KRS pod numerem 0000043523, przez Sąd Rejonowy dla .st. Warszawy, XIII Wydział Gospodarczy KRS, NIP 525-21-13-462, kapitał zakładowy: 6.187.000 złotych (dalej: Organizator ).</li>\r\n                        <li>Fundatorem nagród w Konkursie jest Organizator.</li>\r\n                        <li>W Konkursie mogą uczestniczyć wyłącznie osoby fizyczne wykonujące na terytorium Rzeczpospolitej Polskiej zawód farmaceuty lub technika farmacji (dalej: Uczestnicy).</li>\r\n                        <li>W Konkursie nie mogą brać udziału pracownicy Organizatora, Zakładów Farmaceutycznych Polpharma S.A. z siedzibą w Starogardzie Gdańskim, Medana Pharma S.A. z siedzibą w Sieradzu, Warszawskie Zakłady Farmaceutyczne Polfa S.A. z siedzibą w Warszawie, Herbapol Lublin S.A. z siedzibą w Lublinie oraz członkowie ich najbliższych rodzin (małżonkowie, rodzeństwo, zstępni, wstępni).</li>\r\n                    </ol>\r\n                </li>\r\n                <li>Czas trwania Konkursu\r\n                    <ol>\r\n                        <li>Konkurs rozpoczyna się 12.01.2015 i trwa do 08.02.2015r.</li>\r\n                        <li>Tygodniowe etapy konkursu rozpoczynają się 12.01, 19.01, 26.01,02.02.2015r.</li>\r\n                        <li>Rozstrzygnięcie każdego tygodniowego etapu Konkursu nastąpi w ciągu 7 dni roboczych od zakończenia tygodniowego etapu.</li>\r\n                    </ol>\r\n                </li>\r\n                <li>Komisja Konkursowa\r\n                    <p>Celem zapewnienia prawidłowej organizacji i przebiegu Konkursu, a w szczególności w celu dokonania oceny prawidłowości zgłoszeń konkursowych oraz dokonania wyboru zwycięzców, Organizator powoła Komisję Konkursową. W skład Komisji Konkursowej wejdą osoby delegowane przez Organizatora.</p>\r\n                </li>\r\n                <li>Zasady Konkursu\r\n                    <ol>\r\n                        <li>Przedmiotem Konkursu jest wyłonienie zwycięzców spośród Uczestników, którzy jako pierwsi prawidłowo odpowiedzą na pytania konkursowe.</li>\r\n                        <li>Wysyłając odpowiedź Uczestnik akceptuje zapisy niniejszego regulaminu.</li>\r\n                        <li>Pytania konkursowe będą dostępne na stronie www.konkursfosidal.pl po kliknięciu w banner konkursowy przesłany e-mailem lub dostępny na serwisach dla farmaceutów. Odpowiedzi udziela się zaznaczając prawidłową odpowiedź. Udzielenie 7 poprawnych odpowiedzi stanowi warunek uczestnictwa w Konkursie.</li>\r\n                        <li>W każdym tygodniu trwania konkursu nagrodzonych zostanie 250 Uczestników, którzy jako pierwsi prawidłowo odpowiedzą na pytania konkursowe. W całym konkursie nagrodzonych zostanie łącznie 1000 wygranych.</li>\r\n                        <li>Każdy z uczestników może wygrać maksymalnie po jednej nagrodzie z każdego rodzaju (czyli 1 kubek termiczny, 1 zestaw kosmetyków: krem do rąk + mydło do rąk oraz 1 krem do rąk). Zasady przyznawania nagród w każdym etapie konkursu będą następujące:</li>\r\n                        <p>TABELKA</p><br>\r\n                        <li>Wyniki Konkursu zostaną ogłoszone na stronie internetowej www.konkursfosidal.pl w terminie do 7 dni roboczych po zakończeniu każdego etapu Konkursu.</li>\r\n                        <li>Udział w Konkursie oznacza zgodę na opublikowanie imienia, nazwiska oraz miejscowości zamieszkania (dane korespondencyjne podane podczas rejestracji na stronie www.konkursfosidal.pl) Uczestnika Konkursu na stronie internetowe www.konkursfosidal.pl.</li>\r\n                    </ol>\r\n                </li>\r\n                <li>Nagrody w Konkursie\r\n                    <ol>\r\n                        <li>Organizator przewidział 1 000 nagród. Nagrodami są:\r\n                            <ul>\r\n                                <li>kubek termiczny marki Contigo;</li>\r\n                                <li>zestaw: krem do rąk firmy Stara Mydlarnia o zapachu pomarańczy oraz mydło do rąk firmy Stara Mydlarnia o zapachu pomarańczy ;</li>\r\n                                <li>krem do rąk firmy Stara Mydlarnia o zapachu pomarańczy.</li>\r\n                                <li>Wartość każdej nagrody nie przekracza kwoty 100 zł brutto.</li>\r\n                            </ul>\r\n                        </li>\r\n                        <li>W każdym tygodniowym etapie konkursu komisja konkursowa nagrodzi 250 osób, które jako pierwsze prawidłowo odpowiedzą na wszystkie pytania. Kolejność nagradzania jest następująca:\r\n                            <ul>\r\n                                <li>pierwsze 100 osób w danym tygodniowym etapie, które poprawnie odpowie na pytania konkursowe otrzyma kubek termiczny firmy Contigo</li>\r\n                                <li>kolejne 125 osób w danym tygodniowym etapie, które poprawnie odpowie na pytania konkursowe otrzyma zestaw: krem do rąk firmy Stara	  Mydlarnia o zapachu pomarańczy oraz mydło do rąk firmy Stara Mydlarnia o zapachu pomarańczy</li>\r\n                                <li>kolejne 25 osób w danym tygodniowym etapie, które poprawie odpowie na pytania konkurs owe otrzyma zestaw: krem do rąk firmy Stara	  Mydlarnia o zapachu pomarańczy.</li>\r\n                            </ul>\r\n                        </li>\r\n                        <li>Nagrody nie podlegają zamianie na równowartość pieniężną.</li>\r\n                        <li>Jakiekolwiek roszczenia Uczestników dotyczące rodzaju, jakości i innych właściwości nagród są wyłączone.</li>\r\n                        <li>Każdy Uczestnik może otrzymać tylko jedną nagrodę z danego rodzaju (jeden Uczestnik może wygrać maksymalnie 3 nagrody: po jednej z każdego typu).</li>\r\n                        <li>Nagrody zostaną wysłane przesyłką kurierską na koszt Organizatora, niezwłocznie po rozstrzygnięciu konkursu.</li>\r\n                    </ol>\r\n                </li>\r\n                <li>Postanowienia końcowe\r\n                    <ol>\r\n                        <li>Organizator zastrzega sobie prawo weryfikacji, czy nagrodzony Uczestnik spełnia warunki określone w Regulaminie Konkursu. W tym celu może żądać od Uczestnika złożenia określonych oświadczeń, podania określonych danych bądź przedłożenia określonych dokumentów. Niespełnienie warunków Konkursu lub odmowa spełnienia powyższych żądań powoduje wykluczenie danego Uczestnika z Konkursu z jednoczesnym wygaśnięciem prawa do nagrody i jakichkolwiek innych roszczeń w stosunku do Organizatora.</li>\r\n                        <li>Organizator nie ponosi odpowiedzialności za wadliwe działanie lub przerwy w działaniu sieci Internet, a także za opóźnienia w dostarczeniu, niedostarczenie lub uszkodzenie przesyłki z winy operatora pocztowego.</li>\r\n                        <li>Reklamacje co do przebiegu Konkursu mogą być zgłaszane listownie na adres Organizatora, z tytułem „Reklamacja do konkursu dla farmaceutów: Fosidal”, nie później niż w ciągu 7 dni od dnia ogłoszenia wyników.</li>\r\n                        <li>Prawo złożenia reklamacji przysługuje jedynie Uczestnikom Konkursu.</li>\r\n                        <li>Pisemna reklamacja powinna zawierać imię i nazwisko oraz adres e-mail Uczestnika, podany przy rejestracji na stronie, jak również dokładny opis i wskazanie przyczyny reklamacji.</li>\r\n                        <li>Reklamacje rozpatrywane są przez Organizatora w terminie 14 dni od dnia doręczenia Organizatorowi.</li>\r\n                        <li>Decyzja Organizatora w przedmiocie reklamacji jest ostateczna i wiążąca. Uczestnik zostanie powiadomiony o decyzji Organizatora listownie na adres podany w reklamacji w terminie 7 dni od daty rozpatrzenia reklamacji.</li>\r\n                        <li>Dochodzenie roszczeń na drodze sądowej może nastąpić wyłącznie po wyczerpaniu procedury reklamacyjnej przewidzianej w niniejszym Regulaminie.</li>\r\n                        <li>Administratorem danych osobowych udostępnianych przez Uczestników Konkursu jest Organizator. Dane osobowe będą przetwarzane dla celów organizacji Konkursu oraz wydania przyznanych nagród, a także informowania o wynikach Konkursu. Uczestnik może w każdej chwili uzyskać dostęp do swoich danych osobowych i żądać ich poprawienia, zmiany lub usunięcia. Podanie danych osobowych uczestników jest dobrowolne, lecz ich brak uniemożliwia wzięcie udziału w konkursie. Żądanie usunięcia danych osobowych w czasie trwania Konkursu jest równoznaczne z rezygnacją z uczestnictwa w Konkursie</li>\r\n                        <li>Zgłoszenie do udziału w Konkursie oznacza zaakceptowanie wszystkich postanowień niniejszego Regulaminu.</li>\r\n                        <li>Regulamin Konkursu jest dostępny dla Uczestników w siedzibie Organizatora oraz na stronie internetowej www.konkursfosidal.pl</li>\r\n                        <li>Postanowienia Regulaminu są wyłączną podstawą prowadzenia Konkursu, a ich wykładnia i interpretacja należy wyłącznie do Komisji Konkursowej.</li>\r\n                        <li>Organizator zastrzega sobie możliwość zmiany zasad Konkursu i treści niniejszego Regulaminu bez podania przyczyny, jeżeli nie wpłynie to na pogorszenie warunków udziału w Konkursie i nie będzie naruszało podstawowej koncepcji Konkursu.</li>\r\n                        <li>W sprawach nieuregulowanych stosuje się przepisy Kodeksu cywilnego.</li>\r\n                        <li>Niniejszy konkurs nie jest grą losową w rozumieniu ustawy o grach hazardowych z dnia 19 listopada 2009 roku.</li>\r\n                    </ol>\r\n                </li>\r\n            </ol>'),(2,3,'Odpowiedzialność społeczna','<p>\r\n            Curabitur suscipit suscipit tellus. Sed aliquam ultrices mauris. Proin magna. Donec orci lectus, aliquam ut, faucibus non, \r\n            euismod id, nulla. Nulla sit amet est. In ac felis quis tortor malesuada pretium. Praesent turpis. Nullam dictum felis eu\r\n            pede mollis pretium. Morbi nec metus. Vestibulum dapibus nunc ac augue. Maecenas vestibulum mollis diam. Fusce\r\n            ac felis sit amet ligula pharetra condimentum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere\r\n            cubilia Curae; Fusce id purus. Praesent porttitor, nulla vitae posuere iaculis, arcu nisl dignissim dolor, a pretium mi\r\n            sem ut ipsum. Pellentesque dapibus hendrerit tortor.\r\n        </p>\r\n<p>\r\n            Curabitur suscipit suscipit tellus. Sed aliquam ultrices mauris. Proin magna. Donec orci lectus, aliquam ut, faucibus non, \r\n            euismod id, nulla. Nulla sit amet est. In ac felis quis tortor malesuada pretium. Praesent turpis. Nullam dictum felis eu\r\n            pede mollis pretium. Morbi nec metus. Vestibulum dapibus nunc ac augue. Maecenas vestibulum mollis diam. Fusce\r\n            ac felis sit amet ligula pharetra condimentum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere\r\n            cubilia Curae; Fusce id purus. Praesent porttitor, nulla vitae posuere iaculis, arcu nisl dignissim dolor, a pretium mi\r\n            sem ut ipsum. Pellentesque dapibus hendrerit tortor.\r\n        </p>\r\n<p>\r\n            Curabitur suscipit suscipit tellus. Sed aliquam ultrices mauris. Proin magna. Donec orci lectus, aliquam ut, faucibus non, \r\n            euismod id, nulla. Nulla sit amet est. In ac felis quis tortor malesuada pretium. Praesent turpis. Nullam dictum felis eu\r\n            pede mollis pretium. Morbi nec metus. Vestibulum dapibus nunc ac augue. Maecenas vestibulum mollis diam. Fusce\r\n            ac felis sit amet ligula pharetra condimentum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere\r\n            cubilia Curae; Fusce id purus. Praesent porttitor, nulla vitae posuere iaculis, arcu nisl dignissim dolor, a pretium mi\r\n            sem ut ipsum. Pellentesque dapibus hendrerit tortor.\r\n        </p>'),(3,2,'O firmie','<p>\r\n            Curabitur suscipit suscipit tellus. Sed aliquam ultrices mauris. Proin magna. Donec orci lectus, aliquam ut, faucibus non, \r\n            euismod id, nulla. Nulla sit amet est. In ac felis quis tortor malesuada pretium. Praesent turpis. Nullam dictum felis eu\r\n            pede mollis pretium. Morbi nec metus. Vestibulum dapibus nunc ac augue. Maecenas vestibulum mollis diam. Fusce\r\n            ac felis sit amet ligula pharetra condimentum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere\r\n            cubilia Curae; Fusce id purus. Praesent porttitor, nulla vitae posuere iaculis, arcu nisl dignissim dolor, a pretium mi\r\n            sem ut ipsum. Pellentesque dapibus hendrerit tortor.\r\n        </p>\r\n<p>\r\n            Curabitur suscipit suscipit tellus. Sed aliquam ultrices mauris. Proin magna. Donec orci lectus, aliquam ut, faucibus non, \r\n            euismod id, nulla. Nulla sit amet est. In ac felis quis tortor malesuada pretium. Praesent turpis. Nullam dictum felis eu\r\n            pede mollis pretium. Morbi nec metus. Vestibulum dapibus nunc ac augue. Maecenas vestibulum mollis diam. Fusce\r\n            ac felis sit amet ligula pharetra condimentum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere\r\n            cubilia Curae; Fusce id purus. Praesent porttitor, nulla vitae posuere iaculis, arcu nisl dignissim dolor, a pretium mi\r\n            sem ut ipsum. Pellentesque dapibus hendrerit tortor.\r\n        </p>\r\n<p>\r\n            Curabitur suscipit suscipit tellus. Sed aliquam ultrices mauris. Proin magna. Donec orci lectus, aliquam ut, faucibus non, \r\n            euismod id, nulla. Nulla sit amet est. In ac felis quis tortor malesuada pretium. Praesent turpis. Nullam dictum felis eu\r\n            pede mollis pretium. Morbi nec metus. Vestibulum dapibus nunc ac augue. Maecenas vestibulum mollis diam. Fusce\r\n            ac felis sit amet ligula pharetra condimentum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere\r\n            cubilia Curae; Fusce id purus. Praesent porttitor, nulla vitae posuere iaculis, arcu nisl dignissim dolor, a pretium mi\r\n            sem ut ipsum. Pellentesque dapibus hendrerit tortor.\r\n        </p>'),(4,4,'Zgłoś działania nieporządane','<p>\r\n            Curabitur suscipit suscipit tellus. Sed aliquam ultrices mauris. Proin magna. Donec orci lectus, aliquam ut, faucibus non, \r\n            euismod id, nulla. Nulla sit amet est. In ac felis quis tortor malesuada pretium. Praesent turpis. Nullam dictum felis eu\r\n            pede mollis pretium. Morbi nec metus. Vestibulum dapibus nunc ac augue. Maecenas vestibulum mollis diam. Fusce\r\n            ac felis sit amet ligula pharetra condimentum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere\r\n            cubilia Curae; Fusce id purus. Praesent porttitor, nulla vitae posuere iaculis, arcu nisl dignissim dolor, a pretium mi\r\n            sem ut ipsum. Pellentesque dapibus hendrerit tortor.\r\n        </p>\r\n<p>\r\n            Curabitur suscipit suscipit tellus. Sed aliquam ultrices mauris. Proin magna. Donec orci lectus, aliquam ut, faucibus non, \r\n            euismod id, nulla. Nulla sit amet est. In ac felis quis tortor malesuada pretium. Praesent turpis. Nullam dictum felis eu\r\n            pede mollis pretium. Morbi nec metus. Vestibulum dapibus nunc ac augue. Maecenas vestibulum mollis diam. Fusce\r\n            ac felis sit amet ligula pharetra condimentum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere\r\n            cubilia Curae; Fusce id purus. Praesent porttitor, nulla vitae posuere iaculis, arcu nisl dignissim dolor, a pretium mi\r\n            sem ut ipsum. Pellentesque dapibus hendrerit tortor.\r\n        </p>\r\n<p>\r\n            Curabitur suscipit suscipit tellus. Sed aliquam ultrices mauris. Proin magna. Donec orci lectus, aliquam ut, faucibus non, \r\n            euismod id, nulla. Nulla sit amet est. In ac felis quis tortor malesuada pretium. Praesent turpis. Nullam dictum felis eu\r\n            pede mollis pretium. Morbi nec metus. Vestibulum dapibus nunc ac augue. Maecenas vestibulum mollis diam. Fusce\r\n            ac felis sit amet ligula pharetra condimentum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere\r\n            cubilia Curae; Fusce id purus. Praesent porttitor, nulla vitae posuere iaculis, arcu nisl dignissim dolor, a pretium mi\r\n            sem ut ipsum. Pellentesque dapibus hendrerit tortor.\r\n        </p>'),(5,5,'Kontakt','<p>\r\n            Curabitur suscipit suscipit tellus. Sed aliquam ultrices mauris. Proin magna. Donec orci lectus, aliquam ut, faucibus non, \r\n            euismod id, nulla. Nulla sit amet est. In ac felis quis tortor malesuada pretium. Praesent turpis. Nullam dictum felis eu\r\n            pede mollis pretium. Morbi nec metus. Vestibulum dapibus nunc ac augue. Maecenas vestibulum mollis diam. Fusce\r\n            ac felis sit amet ligula pharetra condimentum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere\r\n            cubilia Curae; Fusce id purus. Praesent porttitor, nulla vitae posuere iaculis, arcu nisl dignissim dolor, a pretium mi\r\n            sem ut ipsum. Pellentesque dapibus hendrerit tortor.\r\n        </p>\r\n<p>\r\n            Curabitur suscipit suscipit tellus. Sed aliquam ultrices mauris. Proin magna. Donec orci lectus, aliquam ut, faucibus non, \r\n            euismod id, nulla. Nulla sit amet est. In ac felis quis tortor malesuada pretium. Praesent turpis. Nullam dictum felis eu\r\n            pede mollis pretium. Morbi nec metus. Vestibulum dapibus nunc ac augue. Maecenas vestibulum mollis diam. Fusce\r\n            ac felis sit amet ligula pharetra condimentum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere\r\n            cubilia Curae; Fusce id purus. Praesent porttitor, nulla vitae posuere iaculis, arcu nisl dignissim dolor, a pretium mi\r\n            sem ut ipsum. Pellentesque dapibus hendrerit tortor.\r\n        </p>\r\n<p>\r\n            Curabitur suscipit suscipit tellus. Sed aliquam ultrices mauris. Proin magna. Donec orci lectus, aliquam ut, faucibus non, \r\n            euismod id, nulla. Nulla sit amet est. In ac felis quis tortor malesuada pretium. Praesent turpis. Nullam dictum felis eu\r\n            pede mollis pretium. Morbi nec metus. Vestibulum dapibus nunc ac augue. Maecenas vestibulum mollis diam. Fusce\r\n            ac felis sit amet ligula pharetra condimentum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere\r\n            cubilia Curae; Fusce id purus. Praesent porttitor, nulla vitae posuere iaculis, arcu nisl dignissim dolor, a pretium mi\r\n            sem ut ipsum. Pellentesque dapibus hendrerit tortor.\r\n        </p>');
/*!40000 ALTER TABLE `text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'fosidal'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-02-07 18:55:49
