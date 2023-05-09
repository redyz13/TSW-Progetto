-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: whiTee
-- ------------------------------------------------------
-- Server version	8.0.32-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Acquisto`
--

DROP TABLE IF EXISTS `Acquisto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Acquisto` (
  `IDOrdine` int NOT NULL,
  `IDMaglietta` int NOT NULL,
  `quantita` int NOT NULL DEFAULT '1',
  `immagine` varchar(400) DEFAULT NULL,
  `prezzoAq` float NOT NULL DEFAULT '0',
  `ivaAq` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Acquisto`
--

LOCK TABLES `Acquisto` WRITE;
/*!40000 ALTER TABLE `Acquisto` DISABLE KEYS */;
/*!40000 ALTER TABLE `Acquisto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Maglietta`
--

DROP TABLE IF EXISTS `Maglietta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Maglietta` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `prezzo` float NOT NULL DEFAULT '0',
  `IVA` int NOT NULL DEFAULT '0',
  `colore` varchar(30) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `grafica` varchar(400) NOT NULL,
  `descrizione` varchar(150) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Maglietta`
--

LOCK TABLES `Maglietta` WRITE;
/*!40000 ALTER TABLE `Maglietta` DISABLE KEYS */;
INSERT INTO `Maglietta` VALUES (1,'Mercoledi',15,3,'Bianco','Film e Serie TV','images\\grafiche\\1Film e Serie TV.jpg','Maglietta di Mercoledì'),(2,'Game of Thrones',15,3,'Nero','Film e Serie TV','images\\grafiche\\2Film e Serie TV.jpg','Maglietta di Game of Thrones'),(3,'Stranger Things',15,3,'Bianco','Film e Serie TV','images\\grafiche\\3Film e Serie TV.jpg','Maglietta di Stranger Things'),(4,'Bud Spencer',15,3,'Nero','Film e Serie TV','images\\grafiche\\4Film e Serie TV.png','Maglietta del GRANDE Bud Spencer (il sommo, il mio preferito)'),(5,'Naruto',16,3,'Nero','Anime e Manga','images\\grafiche\\5Anime e Manga.jpg','Maglietta di Naruto'),(6,'Anime',12,3,'Nero','Anime e Manga','images\\grafiche\\6Anime e Manga.jpg','Generica maglietta sugli anime'),(7,'JoJo Reference',18,3,'Blu','Anime e Manga','images\\grafiche\\7Anime e Manga.png','Maglietta di JoJo'),(8,'Demon Slayer',23,3,'Nero','Anime e Manga','images\\grafiche\\8Anime e Manga.png','Maglietta di Demon Slayer'),(9,'Kuromi',25,3,'Nero','Girl Power','images\\grafiche\\9Girl Power.png','Maglietta di Kuromi'),(10,'Sailor Moon',17,3,'Bianco','Girl Power','images\\grafiche\\10Girl Power.png','Maglietta di Sailor Moon'),(11,'Pulp Fiction',15,3,'Nero','Film e Serie TV','images\\grafiche\\11Film e Serie TV.jpg','Maglietta Pulp Fiction'),(12,'Interstellar',17,3,'Nero','Film e Serie TV','images\\grafiche\\12Film e Serie TV.jpg','Maglietta Interstellar'),(13,'Aristogatti',15,3,'Rosa','Film e Serie TV','images\\grafiche\\13Film e Serie TV.jpg','Maglietta degli aristogatti'),(14,'Garfield',16,3,'Arancione','Film e Serie TV','images\\grafiche\\14Film e Serie TV.jpg','Maglietta Garfield'),(15,'Sailor Moon',14,3,'Nero','Girl Power','images\\grafiche\\15Girl Power.png','Maglietta Sailor Moon gattino mao'),(16,'Paperino',15,3,'Azzurro','Film e Serie TV','images\\grafiche\\16Film e Serie TV.jpg','Maglietta Paperino'),(17,'Criminal Minds',15,3,'Nero','Film e Serie TV','images\\grafiche\\17Film e Serie TV.jpg','Maglietta Criminal Minds'),(18,'The Resident',15,2,'Bianco','Film e Serie TV','images\\grafiche\\18Film e Serie TV.jpg','Maglietta The Resident'),(19,'I maghi di Waverly',17,2,'Bianco','Film e Serie TV','images\\grafiche\\19Film e Serie TV.jpg','Maglietta I maghi di Waverly'),(20,'Hannah Montana',15,3,'Rosa','Girl Power','images\\grafiche\\20Girl Power.jpg','Maglietta Hannah Montana'),(21,'Steins;Gate',17,3,'Nero','Anime e Manga','images\\grafiche\\21Anime e Manga.jpeg','Maglietta Steins;Gate'),(22,'Holly e Benji',15,3,'Azzurro','Anime e Manga','images\\grafiche\\22Anime e Manga.jpg','Maglietta Holly e Benji'),(23,'Violet Evergarden',17,2,'Bianco','Girl Power','images\\grafiche\\23Girl Power.jpg','Maglietta Violet Evergarden'),(24,'Your Name',15,3,'Bianco','Anime e Manga','images\\grafiche\\24Anime e Manga.jpg','Maglietta Your Name.'),(25,'Peanuts',16,2,'Nero','Fumetti','images\\grafiche\\25Fumetti.jpg','Maglietta Peanuts'),(26,'Topolino',18,3,'Bianco','Fumetti','images\\grafiche\\26Fumetti.jpg','Maglietta Topolino'),(27,'Diabolik',15,2,'Nero','Fumetti','images\\grafiche\\27Fumetti.jpg','Maglietta Diabolik'),(28,'Alice in Wonderland',17,3,'Bianco','Girl Power','images\\grafiche\\28Girl Power.jpg','Maglietta Alice in Wonderland'),(29,'Il castello errante di Howl',18,2,'Azzurro','Anime e Manga','images\\grafiche\\29Anime e Manga.webp','Maglietta Il castello errante di Howl'),(30,'La città incantata',17,3,'Viola','Anime e Manga','images\\grafiche\\30Anime e Manga.jpg','Maglietta La città incantata'),(31,'La Sirenetta',15,2,'Giallo','Film e Serie TV','images\\grafiche\\31Film e Serie TV.jpg','Maglietta La Sirenetta');
/*!40000 ALTER TABLE `Maglietta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Misura`
--

DROP TABLE IF EXISTS `Misura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Misura` (
  `ID` int NOT NULL,
  `TG` int NOT NULL,
  `quantita` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Misura`
--

LOCK TABLES `Misura` WRITE;
/*!40000 ALTER TABLE `Misura` DISABLE KEYS */;
INSERT INTO `Misura` VALUES (1,1,50),(1,2,50),(1,3,50),(1,4,50),(1,5,50),(1,6,50),(2,1,50),(2,2,50),(2,3,50),(2,4,50),(2,5,50),(2,6,50),(3,1,50),(3,2,50),(3,3,50),(3,4,50),(3,5,50),(3,6,50),(4,1,50),(4,3,50),(4,4,50),(4,5,50),(4,6,50),(5,1,50),(5,2,50),(5,3,50),(5,4,50),(5,5,50),(5,6,50),(6,1,50),(6,2,50),(6,3,50),(6,4,50),(6,5,50),(6,6,50),(7,1,50),(7,2,50),(7,3,50),(7,4,50),(7,5,50),(7,6,50),(8,1,50),(8,2,50),(8,3,50),(8,4,50),(8,5,50),(8,6,50),(9,1,50),(9,2,50),(9,3,50),(9,4,50),(9,5,50),(9,6,50),(10,1,50),(10,2,50),(10,3,50),(10,4,50),(10,5,50),(10,6,50),(11,1,50),(11,2,50),(11,3,50),(11,4,50),(11,5,50),(11,6,50),(12,1,50),(12,2,50),(12,3,50),(12,4,50),(12,5,50),(12,6,50),(13,1,50),(13,2,50),(13,3,50),(13,4,50),(13,5,50),(13,6,50),(14,1,50),(14,2,50),(14,3,50),(14,4,50),(14,5,50),(14,6,50),(15,1,50),(15,2,50),(15,3,50),(15,4,50),(15,5,50),(15,6,50),(16,1,50),(16,2,50),(16,3,50),(16,4,50),(16,5,50),(16,6,50),(17,1,50),(17,2,50),(17,3,50),(17,4,50),(17,5,50),(17,6,50),(18,1,50),(18,2,50),(18,3,50),(18,4,50),(18,5,50),(18,6,50),(19,1,50),(19,2,50),(19,3,50),(19,4,50),(19,5,50),(19,6,50),(20,1,50),(20,2,50),(20,3,50),(20,4,50),(20,5,50),(20,6,50),(21,1,50),(21,2,50),(21,3,50),(21,4,50),(21,5,50),(21,6,50),(22,1,50),(22,2,50),(22,3,50),(22,4,50),(22,5,50),(22,6,50),(23,1,50),(23,2,50),(23,3,50),(23,4,50),(23,5,50),(23,6,50),(24,1,50),(24,2,50),(24,3,50),(24,4,50),(24,5,50),(24,6,50),(25,1,50),(25,2,50),(25,3,50),(25,4,50),(25,5,50),(25,6,50),(26,1,50),(26,2,50),(26,3,50),(26,4,50),(26,5,50),(26,6,50),(27,1,50),(27,2,50),(27,3,50),(27,4,50),(27,5,50),(27,6,50),(28,1,50),(28,2,50),(28,3,50),(28,4,50),(28,5,50),(28,6,50),(29,1,50),(29,2,50),(29,3,50),(29,4,50),(29,5,50),(29,6,50),(30,1,50),(30,2,50),(30,3,50),(30,4,50),(30,5,50),(30,6,50);
/*!40000 ALTER TABLE `Misura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ordine`
--

DROP TABLE IF EXISTS `Ordine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ordine` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `prezzoTotale` float NOT NULL DEFAULT '0',
  `dataConsegna` date NOT NULL,
  `dataOrdine` date NOT NULL,
  `cap` varchar(50) NOT NULL,
  `via` varchar(70) NOT NULL,
  `citta` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ordine`
--

LOCK TABLES `Ordine` WRITE;
/*!40000 ALTER TABLE `Ordine` DISABLE KEYS */;
INSERT INTO `Ordine` VALUES (1,'abirkmyr2',150,'2023-06-13','2023-04-16','282984','Vahlen','Werinama'),(2,'adunkerleyc',125,'2023-07-08','2023-05-02','S7W','Prairie Rose','Saskatoon'),(3,'ahaslockr',95,'2023-06-21','2023-04-11','517 50','Emmet','Častolovice'),(4,'amorrisj',125,'2023-07-02','2023-04-12','282984','Forest Dale','Bago'),(5,'aomonahan4',125,'2023-07-06','2023-04-18','282984','Golf View','Phu Loc'),(6,'aratee',55,'2023-06-28','2023-05-03','282984','Forest Dale','Jomda'),(7,'avittore9',135,'2023-06-14','2023-04-14','77305','Sycamore','Conroe'),(8,'cgrabeham5',135,'2023-06-08','2023-04-30','89359','Lawn','Niños Heroes'),(9,'dhaggieg',195,'2023-06-29','2023-04-14','282984','Homewood','Beitou'),(10,'dwyldm',121.97,'2023-07-01','2023-04-26','282984','Forest Dale','Beichengqu'),(11,'edowbakin1',54.65,'2023-07-07','2023-04-10','68300','West','Kälviä'),(12,'elattino',144.5,'2023-06-17','2023-04-08','282984','Basil','Liulang'),(13,'fgirodt',155.51,'2023-06-30','2023-04-26','282984','Havey','Minyat an Naşr'),(14,'gfelliss',69.91,'2023-06-07','2023-04-20','282984','Artisan','Bagrāmī'),(15,'gninnottiq',44.28,'2023-07-03','2023-04-21','38823','Maryland','Las Flores'),(16,'jollerheada',172.95,'2023-07-08','2023-04-16','168 58','Alpine','Bromma'),(17,'kcreddond',192.83,'2023-07-11','2023-04-24','421-3305','Elka','Fujinomiya'),(18,'kcudbertsonf',109.86,'2023-07-04','2023-04-11','282984','Ilene','Oefatu'),(19,'klightollersl',57.31,'2023-07-06','2023-04-12','43-173','Tony','Łaziska Górne'),(20,'lveal3',70.04,'2023-06-29','2023-04-17','36-212','Southridge','Zmiennica'),(21,'mbeaverp',113.6,'2023-07-10','2023-04-07','282984','Pierstorff','Heshui'),(22,'mpettersh',163.6,'2023-06-20','2023-04-30','282984','Reinke','Dongchengyuan'),(23,'mpoor7',74.52,'2023-07-11','2023-04-12','282984','Laurel','Sang-e Māshah'),(24,'oyannikov0',142.81,'2023-06-29','2023-04-11','5425-305','Heffernan','Vidago'),(25,'seyern',37.62,'2023-06-07','2023-04-22','75949 CEDEX 19','Luster','Paris 19'),(26,'sroseborough6',75.75,'2023-07-12','2023-04-26','R95','Quincy','Kilkenny'),(27,'stomlinsi',195.81,'2023-06-21','2023-04-16','152 07','Bartillon','Södertälje'),(28,'tclimarb',170.79,'2023-07-19','2023-04-04','9209','Sloan','Tubod'),(29,'wlargen8',98.95,'2023-07-19','2023-05-01','150627','Tennessee','Cerinza'),(30,'wpickhaverk',133.35,'2023-07-17','2023-04-20','282984','Green','Kano');
/*!40000 ALTER TABLE `Ordine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Recensione`
--

DROP TABLE IF EXISTS `Recensione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Recensione` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `IDMaglietta` int NOT NULL,
  `username` varchar(30) NOT NULL,
  `contenuto` varchar(2000) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Recensione`
--

LOCK TABLES `Recensione` WRITE;
/*!40000 ALTER TABLE `Recensione` DISABLE KEYS */;
/*!40000 ALTER TABLE `Recensione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Taglia`
--

DROP TABLE IF EXISTS `Taglia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Taglia` (
  `TG` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(5) NOT NULL,
  PRIMARY KEY (`TG`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Taglia`
--

LOCK TABLES `Taglia` WRITE;
/*!40000 ALTER TABLE `Taglia` DISABLE KEYS */;
INSERT INTO `Taglia` VALUES (1,'XS'),(2,'S'),(3,'M'),(4,'L'),(5,'XL'),(6,'XXL');
/*!40000 ALTER TABLE `Taglia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Utente`
--

DROP TABLE IF EXISTS `Utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Utente` (
  `username` varchar(30) NOT NULL,
  `pwd` varchar(64) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `cognome` varchar(30) NOT NULL,
  `email` varchar(40) NOT NULL,
  `dataNascita` date NOT NULL,
  `numCarta` varchar(50) NOT NULL,
  `dataScadenza` date NOT NULL,
  `cap` varchar(50) NOT NULL,
  `via` varchar(70) NOT NULL,
  `citta` varchar(30) NOT NULL,
  `tipo` varchar(30) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Utente`
--

LOCK TABLES `Utente` WRITE;
/*!40000 ALTER TABLE `Utente` DISABLE KEYS */;
INSERT INTO `Utente` VALUES ('abirkmyr2','Q96EoYDPcffx','Adamo','Birkmyr','abirkmyr2@weebly.com','1982-09-06','5002358954074208','2029-03-30','601240','Tennessee','Sobinka','admin'),('adunkerleyc','YrBBi6B','Abigael','Dunkerley','adunkerleyc@cbslocal.com','1998-02-21','4508839592653711','2027-03-25','397815','Northport','Devitsa','user'),('ahaslockr','0l9VMGXyyH','Andrew','Haslock','ahaslockr@umn.edu','1998-09-05','201798351944307','2030-01-27','747 20','Morningstar','Vřesina','user'),('amorrisj','rDeSPdIg6AJ','Antoni','Morris','amorrisj@cnn.com','1984-07-17','3589642243850783','2029-07-06','501-1235','Reindahl','Akita Shi','user'),('aomonahan4','uEiKW84pYi','Avril','O\'Monahan','aomonahan4@nhs.uk','1972-03-14','201484490489153','2032-01-03','4940-342','Becker','Arroteia','user'),('aratee','Hnd389vBt9Gt','Aurilia','Rate','aratee@cbslocal.com','1983-12-13','4308736071112','2027-02-12','92795','Redwing','Yongfeng','user'),('avittore9','Ro7a9kb1','Aurelie','Vittore','avittore9@icio.us','2003-12-09','5196461520834109','2031-10-20','92795','Brentwood','Hongyang','admin'),('cgrabeham5','1WYWCcnNud','Cordelie','Grabeham','cgrabeham5@dmoz.org','1976-06-10','6759695068183654831','2033-01-01','92795','Mitchell','Xinchong','admin'),('dhaggieg','XBcTBd3u','Donaugh','Haggie','dhaggieg@mozilla.org','1977-06-23','3551706231600841','2027-08-04','39236','Toban','Jackson','user'),('dwyldm','uFwyc4NsZ','Derwin','Wyld','dwyldm@myspace.com','1986-09-18','4405889634088578','2027-10-03','92795','Eagle Crest','Xiabao','user'),('edowbakin1','VXLQn2','Etta','Dowbakin','edowbakin1@buzzfeed.com','1972-03-06','63043765186930652','2027-04-12','55150-000','Mandrake','Belo Jardim','user'),('elattino','9SCeovLRi74','Emily','Lattin','elattino@drupal.org','1996-09-27','5153490500118424','2027-12-02','66110','Crescent Oaks','Ban Chalong','user'),('fgirodt','svueIwJFWfiL','Fredericka','Girod','fgirodt@last.fm','2003-12-15','3560131163439002','2030-03-13','92795','Riverside','Tīkāpur','user'),('gfelliss','3MoWgK0S3','Gale','Fellis','gfelliss@ucsd.edu','1981-11-02','5602215670554471','2031-09-15','625504','Bashford','Borovskiy','user'),('gninnottiq','GObMzUzJbI','Griswold','Ninnotti','gninnottiq@webeden.co.uk','1988-02-25','372301777615628','2031-10-10','92795','Bobwhite','Yangji','user'),('jollerheada','mFLciBun2X1','Jeane','Ollerhead','jollerheada@google.ru','1977-04-20','3540800629234539','2032-07-28','92795','Brentwood','Wuma','user'),('kcreddond','Oq35de','Kelley','Creddon','kcreddond@hhs.gov','1997-01-21','3556976103432665','2030-04-07','404446','Vernon','Nizhniy Chir','user'),('kcudbertsonf','8DXHRTv','Kienan','Cudbertson','kcudbertsonf@time.com','1971-04-17','3535512202645372','2028-04-28','92795','Meadow Ridge','Yinjiaxi','user'),('klightollersl','4eYkdfNjaS','Kimberli','Lightollers','klightollersl@privacy.gov.au','1979-05-12','201786887461243','2031-08-19','92795','Rowland','Weishanzhuang','user'),('lveal3','FOWGRxv','Lea','Veal','lveal3@google.pl','1986-04-20','3577592699367663','2031-08-07','5307','Lerdahl','Balabac','user'),('mbeaverp','3aLROq59X4N','Morry','Beaver','mbeaverp@reddit.com','1997-06-10','3589351204969547','2028-04-05','92795','Luster','Shuanggang','user'),('mpettersh','pyp8xL2rENuL','Munroe','Petters','mpettersh@unicef.org','1988-04-05','3557038811899203','2031-12-17','92795','Butternut','Kalianyar Selatan','user'),('mpoor7','uDIt4NNDz','Mirabella','Poor','mpoor7@slate.com','1997-02-16','201811031648311','2031-06-04','12001','Mosinee','San Marcos','user'),('oyannikov0','mM7KIIaYUJ','Osborn','Yannikov','oyannikov0@reference.com','1981-07-10','3528729445024673','2033-02-12','99500-000','Hollow Ridge','Carazinho','user'),('seyern','tturONFjjnYK','Swen','Eyer','seyern@people.com.cn','1995-01-15','3544412654230055','2028-09-13','92795','Debra','Xike','user'),('sroseborough6','aJo1L0oxy','Seumas','Roseborough','sroseborough6@sogou.com','2002-02-08','374288106185084','2031-06-15','92795','Park Meadow','Musawa','user'),('stomlinsi','CBozCCObrXBp','Siffre','Tomlins','stomlinsi@forbes.com','1993-12-31','3529941321969603','2030-03-12','92795','Forest Dale','Patos Fshat','user'),('tclimarb','QsLxEGsI','Tove','Climar','tclimarb@oakley.com','1994-01-06','3579884236812568','2032-10-11','92795','La Follette','Xiangcunxiang','user'),('wlargen8','EbdF6Pr4gf','William','Largen','wlargen8@cocolog-nifty.com','1980-04-26','3588202990473593','2028-08-13','92795','Westridge','Yunlong','user'),('wpickhaverk','BTR59Trnm','Whitney','Pickhaver','wpickhaverk@scientificamerican.com','1978-10-07','3565323209836607','2029-12-13','45000-000','Thierer','Vitória da Conquista','user');
/*!40000 ALTER TABLE `Utente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-09 17:47:35
