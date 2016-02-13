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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES (1,1,'Do godziny 16-17, żeby nie pobudzać sekrecji w godzinach nocnych',0,1),(2,1,'O każdej porze dnia i nocy',1,2),(3,1,'Do trzech razy dziennie tylko w ciągu dnia',0,3),(4,2,'Fosidal hamuje odruch kaszlowy i może być stosowany tylko w terapii kaszlu suchego',0,1),(5,2,'Fosidal rozrzedza wydzielinę i może być stosowany tylko w terapii kaszlu mokrego',0,2),(6,2,'Fosidal działa przeciwzapalnie w drogach oddechowych i może być stosowanych przy kaszlu suchym i mokrym',1,3),(7,3,'Fosidal nie wykazuje interakcji z mukolitykami (bromoheksyna, ambroksol), więc można łączyć ze sobą te leki',1,1),(8,3,'Fosidal nie wykazuje interakcji z mukolitykami (bromoheksyna, ambroksol), ale nie powinno się łączyć tych leków',0,2),(10,3,'Fosidal wykazuje interakcje z lekami hamującymi odruch kaszlowy (np. Dexapico) i dlatego nie powinno się łączyć tych leków',0,3),(11,4,'Tylko w I. fazie (kaszel suchy)',0,1),(12,4,'Tylko w II. fazie (kaszel mokry)',0,2),(13,4,'Fosidal może być stosowany w każdej fazie zakażenia dróg oddechowych',1,3),(14,5,'Fosidal nie wykazuje interakcji z lekami hamującymi odruch kaszlowy, więc można łączyć ze sobą te leki',1,1),(15,5,'Fosidal nie wykazuje interakcji z mukolitykami , ale nie powinno się łączyć tych leków',0,2),(16,5,'Fosidal wykazuje interakcje z lekami hamującymi odruch kaszlowy i dlatego nie powinno się łączyć tych leków',0,3),(17,6,'Leki przeciwkaszlowe i fenspiryd (np. Fosidal)',1,1),(18,6,'Mukolityki/sekrolityki i fenspiryd (np. Fosidal)',0,2),(19,6,'Tylko leki przeciwkaszlowe',0,3),(20,7,'Leki przeciwkaszlowe i fenspiryd (np. Fosidal)',0,1),(21,7,'Mukolityki/sekretolityki i fenspiryd (np. Fosidal)',1,2),(22,7,'Tylko mukolityki/sekrolityki',0,3),(23,8,'W III. fazie zakażenia dróg oddechowych (nadkażenie bakteryjne) konieczna jest konsultacja lekarska oraz włączenie odpowiedniego antybiotyku wspomaganego przez niesteroidowe leki przeciwzapalne i fenspiryd (np. Fosidal)',1,1),(24,8,'W III. fazie zakażenia dróg oddechowych (nadkażenie bakteryjne) konieczna jest konsultacja lekarska oraz włączenie odpowiedniego antybiotyku wspomaganego przez leki przeciwkaszlowe',0,2),(25,8,'W III. fazie zakażenia dróg oddechowych (nadkażenie bakteryjne) nie jest konieczna  konsultacja lekarska',0,3);
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
INSERT INTO `fos_user` VALUES (2,'admin','admin','rogalski.tomaszek@gmail.com','rogalski.tomaszek@gmail.com',1,'qdk8ji7y1xcws044g0o4w8sk0o88kss','$2y$13$qdk8ji7y1xcws044g0o4wudnkOxLacIWvfdAozaE3OxQfoJs0aGUe','2016-02-13 17:28:22',0,0,NULL,NULL,NULL,'a:1:{i:0;s:10:\"ROLE_ADMIN\";}',0,NULL),(3,'agata','agata','agata.menesiak@nuorder.pl','agata.menesiak@nuorder.pl',1,'qgfoez49wwgcc0wwgc8s08ggwowgc0k','$2y$13$qgfoez49wwgcc0wwgc8s0u2oTUPEASPSu2npgOTdU680iljPt4KJq','2016-02-11 10:09:40',0,0,NULL,NULL,NULL,'a:1:{i:0;s:10:\"ROLE_ADMIN\";}',0,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` VALUES (7,'Regulamin','Regulamin','Regulamin','rule');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,2,'1. W jakich godzinach może być podawany Fosidal?',30,50,1),(2,2,'2. Które z poniższych stwierdzeń jest prawidłowe',30,50,2),(3,2,'3. Które z poniższych stwierdzeń jest prawidłowe',30,50,3),(4,2,'4. W której fazie zakażenia dróg oddechowych można stosować Fosidal',30,50,4),(5,3,'5.Które z poniższych stwierdzeń jest prawidłowe?',60,50,1),(6,3,'6. Które z poniższych leków mogą być stosowane w I. fazie zakażenia dróg oddechowych w leczeniu objawowym i przyczynowym kaszlu?',60,50,2),(7,3,'7. Które z poniższych leków mogą być stosowane w II. fazie zakażenia dróg oddechowych w leczeniu objawowym i przyczynowym kaszlu?',60,50,3),(8,3,'8.Zaznacz prawidłowe stwierdzenie',60,50,4);
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
  `agree1` tinyint(1) DEFAULT NULL,
  `agree2` tinyint(1) DEFAULT NULL,
  `created` datetime NOT NULL,
  `survey_id` int(11) DEFAULT NULL,
  `points` int(11) NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `award1` tinyint(1) DEFAULT NULL,
  `award2` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_136AC113B3FE509D` (`survey_id`),
  CONSTRAINT `FK_136AC113B3FE509D` FOREIGN KEY (`survey_id`) REFERENCES `survey` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result`
--

LOCK TABLES `result` WRITE;
/*!40000 ALTER TABLE `result` DISABLE KEYS */;
INSERT INTO `result` VALUES (16,'Tomek','Rogalski','rogalski.tomaszek@gmail.com','Waniliowa','46',NULL,'11111','Kraków','555555555',0,0,'2016-02-13 13:05:56',2,50,'{\"1\":{\"point\":50,\"timeLeft\":\"29\"},\"2\":{\"point\":0,\"timeLeft\":\"0\"},\"3\":{\"point\":0,\"timeLeft\":\"0\"},\"4\":{\"point\":0,\"timeLeft\":\"9\"}}',NULL,NULL),(17,'Marek','Kowalski','marek.kowalski@gmail.com','Krzywa','22',NULL,'11244','Jaroslaw','222222222',0,0,'2016-02-13 13:08:22',2,50,'{\"1\":{\"point\":50,\"timeLeft\":\"29\"},\"2\":{\"point\":0,\"timeLeft\":\"30\"},\"3\":{\"point\":0,\"timeLeft\":\"30\"},\"4\":{\"point\":0,\"timeLeft\":\"30\"}}',NULL,NULL),(18,'Józef','Burczymucha','burczy@gmail.com','Mokra','22',NULL,'88763','Warszawa','277625525',0,0,'2016-02-13 13:15:28',2,100,'{\"1\":{\"point\":50,\"timeLeft\":\"29\"},\"2\":{\"point\":50,\"timeLeft\":\"23\"},\"3\":{\"point\":0,\"timeLeft\":\"20\"},\"4\":{\"point\":0,\"timeLeft\":\"29\"}}',NULL,1),(19,'Maja','Karczewska','majaka@tlen.pl','Horza','3',NULL,'22555','Olsztyn','272652442',0,0,'2016-02-13 13:16:37',2,200,'{\"1\":{\"point\":50,\"timeLeft\":\"28\"},\"2\":{\"point\":50,\"timeLeft\":\"26\"},\"3\":{\"point\":50,\"timeLeft\":\"29\"},\"4\":{\"point\":50,\"timeLeft\":\"27\"}}',1,NULL),(20,'Jacek','Lechiński','lechinski@gmail.com','Malinowa','12',NULL,'66666','Szczytniki','666656666',0,0,'2016-02-13 14:47:12',2,50,'{\"1\":{\"point\":0,\"timeLeft\":\"0\"},\"2\":{\"point\":0,\"timeLeft\":\"26\"},\"3\":{\"point\":0,\"timeLeft\":\"26\"},\"4\":{\"point\":50,\"timeLeft\":\"27\"}}',NULL,1),(21,'Marek','Marke','marke.ma@gmai.pl','Dojazd','20',NULL,'66666','Poznań','666636666',0,0,'2016-02-13 14:49:38',2,50,'{\"1\":{\"point\":50,\"timeLeft\":\"25\"},\"2\":{\"point\":0,\"timeLeft\":\"0\"},\"3\":{\"point\":0,\"timeLeft\":\"0\"},\"4\":{\"point\":0,\"timeLeft\":\"0\"}}',NULL,1),(22,'Alojzy','Gąbka','gabka@tlen.pl','Wysoka','21',NULL,'76543','Wietnam','123344211',0,0,'2016-02-13 14:51:13',2,200,'{\"1\":{\"point\":50,\"timeLeft\":\"25\"},\"2\":{\"point\":50,\"timeLeft\":\"24\"},\"3\":{\"point\":50,\"timeLeft\":\"23\"},\"4\":{\"point\":50,\"timeLeft\":\"26\"}}',1,0),(23,'Jola','Niewola','niewola@tlen.pl','Mała','2',NULL,'11111','Gdańsk','235467772',1,1,'2016-02-13 17:39:16',2,200,'{\"1\":{\"point\":50,\"timeLeft\":\"25\"},\"2\":{\"point\":50,\"timeLeft\":\"22\"},\"3\":{\"point\":50,\"timeLeft\":\"25\"},\"4\":{\"point\":50,\"timeLeft\":\"28\"}}',1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey`
--

LOCK TABLES `survey` WRITE;
/*!40000 ALTER TABLE `survey` DISABLE KEYS */;
INSERT INTO `survey` VALUES (2,'Edycja pierwsza','2016-02-01 00:00:00','2016-02-21 23:59:00'),(3,'Edycja druga','2016-02-22 00:00:00','2016-02-28 00:00:00'),(4,'Edycja trzecia','2016-02-29 00:00:00','2016-03-06 00:00:00');
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
  CONSTRAINT `FK_3B8BA7C7C4663E4` FOREIGN KEY (`page_id`) REFERENCES `page` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `text`
--

LOCK TABLES `text` WRITE;
/*!40000 ALTER TABLE `text` DISABLE KEYS */;
INSERT INTO `text` VALUES (6,7,'Regulamin konkursu','<p>I.Postanowienia og&oacute;lne</p>\r\n<ol>\r\n<li>Niniejszy Regulamin określa zasady uczestnictwa w konkursie kierowanego do farmaceut&oacute;w i technik&oacute;w farmacji (dalej: Konkurs).</li>\r\n<li>Organizatorem Konkursu jest Polpharma Biuro Handlowe Sp. z o.o., z siedzibą w Warszawie (00-728), ul. Bobrowiecka 6, wpisana do rejestru przedsiębiorc&oacute;w KRS pod numerem 0000043523, przez Sąd Rejonowy dla m.st. Warszawy, XIII Wydział Gospodarczy KRS, NIP 525-21-13-462, kapitał zakładowy: 6.187.000 złotych (dalej: Organizator ).</li>\r\n<li>Fundatorem nagr&oacute;d w Konkursie jest Organizator.</li>\r\n<li>W Konkursie mogą uczestniczyć wyłącznie osoby fizyczne wykonujące na terytorium Rzeczpospolitej Polskiej zaw&oacute;d farmaceuty lub technika farmacji&nbsp; (dalej: Uczestnicy).</li>\r\n<li>W Konkursie nie mogą brać udziału pracownicy Organizatora, Zakład&oacute;w Farmaceutycznych Polpharma S.A. z siedzibą w Starogardzie Gdańskim, Medana Pharma S.A. z siedzibą w Sieradzu, Warszawskie Zakłady Farmaceutyczne Polfa S.A. z siedzibą w Warszawie, Herbapol Lublin S.A. z siedzibą w Lublinie oraz członkowie ich najbliższych rodzin (małżonkowie, rodzeństwo, zstępni, wstępni).</li>\r\n</ol>\r\n<p>II. Czas trwania Konkursu</p>\r\n<ol>\r\n<li>Konkurs rozpoczyna się 15.02 i&nbsp; trwa do 06.03.2016r.</li>\r\n<li>Tygodniowe etapy konkursu rozpoczynają się 15.02, 22.02, 29.02.2016r.&nbsp;</li>\r\n<li>Rozstrzygnięcie każdego tygodniowego etapu Konkursu nastąpi w ciągu 7 dni roboczych od zakończenia tygodniowego etapu.</li>\r\n</ol>\r\n<p>&nbsp;III. Komisja Konkursowa<br /><br />Celem zapewnienia prawidłowej organizacji i przebiegu Konkursu, a w szczeg&oacute;lności w celu dokonania oceny prawidłowości zgłoszeń konkursowych oraz dokonania wyboru zwycięzc&oacute;w, Organizator powoła Komisję Konkursową. W skład Komisji Konkursowej wejdą osoby delegowane przez Organizatora.</p>\r\n<p>IV. Zasady Konkursu</p>\r\n<ol>\r\n<li>Przedmiotem Konkursu jest wyłonienie zwycięzc&oacute;w spośr&oacute;d Uczestnik&oacute;w, kt&oacute;rzy jako pierwsi prawidłowo odpowiedzą na pytania konkursowe.</li>\r\n<li>Wysyłając odpowiedź Uczestnik akceptuje zapisy niniejszego regulaminu.</li>\r\n<li>Pytania konkursowe będą dostępne na stronie www.konkurs.fosidal.pl po kliknięciu w banner konkursowy przesłany e-mailem lub dostępny na serwisach dla farmaceut&oacute;w. Odpowiedzi udziela się zaznaczając prawidłową odpowiedź. Udzielenie wszystkich poprawnych odpowiedzi stanowi warunek uczestnictwa w Konkursie.</li>\r\n<li>W każdym tygodniu trwania konkursu nagrodzonych zostanie 50 Uczestnik&oacute;w, kt&oacute;rzy odpowiedzą prawidłowo na pytania konkursowe zdobywając największą liczbę punkt&oacute;w.&nbsp; W całym konkursie przewidzianych zostało 150 nagr&oacute;d.&nbsp;</li>\r\n<li>Wyniki Konkursu zostaną ogłoszone na stronie internetowej www.konkurs.fosidal.pl&nbsp; w terminie do 7 dni roboczych po zakończeniu każdego etapu Konkursu.</li>\r\n<li>W każdej tygodniowej edycji konkursu jeden Uczestnik może podjąć maksymalnie 1 pr&oacute;bę rozwiązania zadań konkursowych.&nbsp;</li>\r\n<li>Udział w Konkursie oznacza zgodę na opublikowanie imienia, nazwiska oraz miejscowości zamieszkania (dane korespondencyjne podane podczas rejestracji na stronie&nbsp; www.konkurs.fosidal.pl ) Uczestnika Konkursu na stronie internetowe www.konkurs.fosidal.pl&nbsp; w zakładce &bdquo;Zwycięzcy&rdquo;.</li>\r\n</ol>\r\n<p>V. Nagrody w Konkursie</p>\r\n<ol>\r\n<li>Organizator przewidział 150 nagr&oacute;d. Nagrodami są:&nbsp; <br />\r\n<ul>\r\n<li>sk&oacute;rzane etui na klucze oznakowane logotypem leku Fosidal&nbsp; (łącznie 90 sztuk w całym konkursie)</li>\r\n<li>sk&oacute;rzane etui na pieczątkę oznakowane logotypem leku Fosidal ( łącznie 60 sztuk w całym konkursie).&nbsp; Wartość każdej nagrody nie przekracza kwoty 100 zł brutto.</li>\r\n</ul>\r\n</li>\r\n<li>W każdym tygodniowym etapie konkursu komisja konkursowa nagrodzi 50 os&oacute;b, kt&oacute;re odpowiedzą na wszystkie pytania zdobywając największą ilość punkt&oacute;w. Kolejność nagradzania jest następująca:&nbsp; <br />\r\n<ul>\r\n<li>pierwsze 20 os&oacute;b w danym tygodniowym etapie, kt&oacute;re poprawnie odpowie na wszystkie pytania konkursowe otrzyma sk&oacute;rzane etui na pieczątkę&nbsp;&nbsp;</li>\r\n<li>kolejne 30 os&oacute;b w danym tygodniowym etapie, kt&oacute;re poprawnie odpowie na wszystkie pytania konkursowe otrzyma sk&oacute;rzane etui na klucze.&nbsp;&nbsp;&nbsp;</li>\r\n</ul>\r\n</li>\r\n<li>W przypadku zajęcia miejsc ex-aequo liczy się data i godzina nadesłania zgłoszenia.</li>\r\n<li>Nagrody nie podlegają zamianie na r&oacute;wnowartość pieniężną.</li>\r\n<li>Jakiekolwiek roszczenia Uczestnik&oacute;w dotyczące rodzaju, jakości i innych właściwości nagr&oacute;d są wyłączone.</li>\r\n<li>Każdy Uczestnik może otrzymać tylko jedną nagrodę w trakcie trwania konkursu.&nbsp;&nbsp;</li>\r\n<li>Nagrody zostaną wysłane przesyłką kurierską na koszt Organizatora, niezwłocznie po rozstrzygnięciu konkursu.</li>\r\n</ol>\r\n<p>VI. Postanowienia końcowe</p>\r\n<ol>\r\n<li>Organizator zastrzega sobie prawo weryfikacji, czy nagrodzony Uczestnik spełnia warunki określone w Regulaminie Konkursu. W tym celu może żądać od Uczestnika złożenia określonych oświadczeń, podania określonych danych bądź przedłożenia określonych dokument&oacute;w. Niespełnienie warunk&oacute;w Konkursu lub odmowa spełnienia powyższych żądań powoduje wykluczenie danego Uczestnika z Konkursu z jednoczesnym wygaśnięciem prawa do nagrody i jakichkolwiek innych roszczeń w stosunku do Organizatora.</li>\r\n<li>Organizator nie ponosi odpowiedzialności za wadliwe działanie lub przerwy w działaniu sieci Internet, a także za op&oacute;źnienia w dostarczeniu, niedostarczenie lub uszkodzenie przesyłki z winy operatora pocztowego.</li>\r\n<li>Reklamacje co do przebiegu Konkursu mogą być zgłaszane listownie na adres Organizatora, z tytułem &bdquo;Reklamacja do konkursu dla farmaceut&oacute;w: Fosidal&rdquo;, nie p&oacute;źniej niż w ciągu 7 dni od dnia ogłoszenia wynik&oacute;w.</li>\r\n<li>Prawo złożenia reklamacji przysługuje jedynie Uczestnikom Konkursu.</li>\r\n<li>Pisemna reklamacja powinna zawierać imię i nazwisko oraz adres e-mail Uczestnika, podany przy rejestracji na stronie, jak r&oacute;wnież dokładny opis i wskazanie przyczyny reklamacji.</li>\r\n<li>Reklamacje rozpatrywane są przez Organizatora w terminie 14 dni od dnia doręczenia Organizatorowi.</li>\r\n<li>Decyzja Organizatora w przedmiocie reklamacji jest ostateczna i wiążąca. Uczestnik zostanie powiadomiony o decyzji Organizatora listownie na adres podany w reklamacji w terminie 7 dni od daty rozpatrzenia reklamacji.</li>\r\n<li>Dochodzenie roszczeń na drodze sądowej może nastąpić wyłącznie po wyczerpaniu procedury reklamacyjnej przewidzianej w niniejszym Regulaminie.</li>\r\n<li>Administratorem danych osobowych udostępnianych przez Uczestnik&oacute;w Konkursu jest Organizator. Dane osobowe będą przetwarzane dla cel&oacute;w organizacji Konkursu oraz wydania przyznanych nagr&oacute;d, a także informowania o wynikach Konkursu. Uczestnik może w każdej chwili uzyskać dostęp do swoich danych osobowych i żądać ich poprawienia, zmiany lub usunięcia. Podanie danych osobowych uczestnik&oacute;w jest dobrowolne, lecz ich brak uniemożliwia wzięcie udziału w konkursie. Żądanie usunięcia danych osobowych w czasie trwania Konkursu jest r&oacute;wnoznaczne z rezygnacją z uczestnictwa w Konkursie.</li>\r\n<li>Zgłoszenie do udziału w Konkursie oznacza zaakceptowanie wszystkich postanowień niniejszego Regulaminu.</li>\r\n<li>Regulamin Konkursu jest dostępny dla Uczestnik&oacute;w w siedzibie Organizatora oraz na stronie internetowej www.konkurs.fosidal.pl&nbsp;</li>\r\n<li>Postanowienia Regulaminu są wyłączną podstawą prowadzenia Konkursu, a ich wykładnia i interpretacja należy wyłącznie do Komisji Konkursowej.</li>\r\n<li>Organizator zastrzega sobie możliwość zmiany zasad Konkursu i treści niniejszego Regulaminu bez podania przyczyny, jeżeli nie wpłynie to na pogorszenie warunk&oacute;w udziału w Konkursie i nie będzie naruszało podstawowej koncepcji Konkursu.</li>\r\n<li>W sprawach nieuregulowanych stosuje się przepisy Kodeksu cywilnego.</li>\r\n<li>Niniejszy konkurs nie jest grą losową w rozumieniu ustawy o grach hazardowych z dnia 19 listopada 2009 roku.</li>\r\n</ol>');
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

-- Dump completed on 2016-02-13 18:15:56
