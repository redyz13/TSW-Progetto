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
USE whiTee;

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
INSERT INTO `Acquisto` VALUES (1,4,1,NULL,15,22),(2,7,3,NULL,15,22),(3,10,1,NULL,15,22),(4,6,2,NULL,15,22),(5,7,3,NULL,15,22),(6,23,2,NULL,15,22),(7,10,5,NULL,15,22),(8,1,5,NULL,15,22),(9,24,4,NULL,15,22),(10,18,3,NULL,15,22),(11,12,4,NULL,15,22),(12,17,3,NULL,15,22),(13,16,5,NULL,15,22),(14,5,1,NULL,15,22),(15,7,3,NULL,15,22),(16,11,5,NULL,15,22),(17,14,3,NULL,15,22),(18,2,5,NULL,15,22),(19,2,1,NULL,15,22),(20,8,1,NULL,15,22),(21,28,4,NULL,15,22),(22,14,3,NULL,15,22),(23,8,4,NULL,15,22),(24,5,2,NULL,15,22),(25,9,1,NULL,15,22),(26,11,3,NULL,15,22),(27,2,3,NULL,15,22),(28,22,2,NULL,15,22),(29,16,4,NULL,15,22),(30,23,4,NULL,15,22),(1,20,2,NULL,15,22),(2,10,4,NULL,15,22),(3,23,3,NULL,15,22),(4,15,3,NULL,15,22),(5,23,5,NULL,15,22),(6,19,4,NULL,15,22),(7,10,2,NULL,15,22),(8,5,5,NULL,15,22),(9,27,2,NULL,15,22),(10,25,4,NULL,15,22);
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `cap` varchar(5) NOT NULL,
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
INSERT INTO `Ordine` VALUES (1,'dodoughertyh',30,'2023-05-30','2023-05-23','40745','02042 Independence Point','Dongfanghong'),(2,'econradiei',30,'2023-05-08','2023-05-01','51484','086 Lunder Terrace','Babakan Baru'),(3,'sbittlestone6',30,'2023-05-14','2023-05-07','39531','38117 Maple Park','Castro'),(4,'username',30,'2023-06-09','2023-06-02','31671','37 Cherokee Street','Oranmore'),(5,'username',30,'2023-05-10','2023-05-03','09396','9077 1st Point','Dalu'),(6,'fbarnbrook9',30,'2023-05-18','2023-05-11','40275','92566 Loftsgordon Road','Kasui'),(7,'tchastonl',30,'2023-06-11','2023-06-04','30103','76 Lindbergh Terrace','Bejsce'),(8,'clonergano',30,'2023-05-21','2023-05-14','07604','335 Parkside Terrace','Shahrak-e B─ükharz'),(9,'jmaddicksb',30,'2023-05-20','2023-05-13','65172','4 Dryden Junction','Yushu'),(10,'clonergano',30,'2023-05-30','2023-05-23','86357','4494 Grim Avenue','Anaheim'),(11,'econradiei',15,'2023-05-18','2023-05-11','24285','03 Morningstar Street','Rancapare'),(12,'msolland8',15,'2023-05-22','2023-05-15','55403','88701 Elgar Avenue','Ban─½ Suwayf'),(13,'rgethinsa',15,'2023-06-07','2023-05-31','89027','75 Barnett Parkway','Akhaldaba'),(14,'sbittlestone6',15,'2023-05-20','2023-05-13','64612','7115 Eastlawn Court','Fengshan'),(15,'agovenlockf',15,'2023-05-09','2023-05-02','02467','777 Bellgrove Trail','Mosfilot├¡'),(16,'sferons',15,'2023-05-23','2023-05-16','05012','388 Helena Terrace','Tygda'),(17,'nlockner4',15,'2023-06-10','2023-06-03','59161','78 Crest Line Lane','Bakalang'),(18,'gfernelym',15,'2023-06-03','2023-05-27','91462','7400 Fallview Road','Duanshen'),(19,'ltayloure',15,'2023-05-23','2023-05-16','03513','8176 Roth Way','Hashtgerd'),(20,'cmcgucken2',15,'2023-06-10','2023-06-03','98805','98864 Charing Cross Park','Bira'),(21,'jmaddicksb',15,'2023-06-11','2023-06-04','27066','34 Logan Junction','Klimont├│w'),(22,'econradiei',15,'2023-05-22','2023-05-15','94924','059 Old Gate Court','Houmen'),(23,'cmoulstert',15,'2023-05-21','2023-05-14','13806','1977 5th Plaza','Jind┼Öichov'),(24,'gfernelym',15,'2023-05-19','2023-05-12','03782','54017 Roth Street','Bautista'),(25,'cmoulstert',15,'2023-06-08','2023-06-01','21803','6 Thierer Trail','Sandefjord'),(26,'fbarnbrook9',15,'2023-05-13','2023-05-06','84334','9811 Emmet Court','Kuala Lumpur'),(27,'gfernelym',15,'2023-05-23','2023-05-16','54575','76173 Harper Court','Milton'),(28,'sbittlestone6',15,'2023-06-11','2023-06-04','71487','7280 Bayside Crossing','Lapid'),(29,'clonergano',15,'2023-06-10','2023-06-03','74085','84 West Center','Geputan'),(30,'sferons',15,'2023-06-08','2023-06-01','52026','50 Forster Alley','MacArthur');
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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Recensione`
--

LOCK TABLES `Recensione` WRITE;
/*!40000 ALTER TABLE `Recensione` DISABLE KEYS */;
INSERT INTO `Recensione` VALUES (1,21,'ebomfieldr','Aliquam erat volutpat. In congue. Etiam justo.'),(2,26,'econradiei','Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus.'),(3,8,'cphipp0','Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum.'),(4,23,'jmaddicksb','Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum.'),(5,15,'dodoughertyh','Nunc nisl.'),(6,10,'arenault5','Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.'),(7,25,'klelievre3','Suspendisse potenti.'),(8,14,'fbarnbrook9','Etiam faucibus cursus urna.'),(9,22,'jtironeg','Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim.'),(10,16,'klelievre3','Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum.'),(11,25,'nlockner4','Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.'),(12,15,'dodoughertyh','Aliquam erat volutpat.'),(13,28,'rgethinsa','Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'),(14,18,'ltayloure','Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique.'),(15,23,'sbrouwerj','Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo.'),(16,24,'klelievre3','Suspendisse potenti. Cras in purus eu magna vulputate luctus.'),(17,11,'gflucks1','Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam.'),(18,6,'cbalbeckk','Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.'),(19,18,'nlockner4','Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi.'),(20,4,'cmcgucken2','Duis mattis egestas metus. Aenean fermentum.'),(21,20,'slarmouthc','Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.'),(22,4,'sbittlestone6','Fusce consequat. Nulla nisl. Nunc nisl.'),(23,4,'agovenlockf','Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis.'),(24,8,'cmoulstert','Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.'),(25,10,'cmcgucken2','Morbi ut odio.'),(26,28,'klelievre3','Proin risus.'),(27,23,'rgethinsa','Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc.'),(28,24,'sbrouwerj','Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.'),(29,22,'aologhlen7','Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.'),(30,23,'econradiei','In congue. Etiam justo. Etiam pretium iaculis justo.'),(31,2,'slarmouthc','Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.'),(32,24,'sbrouwerj','Suspendisse potenti. In eleifend quam a odio.'),(33,3,'nlockner4','Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.'),(34,17,'sbrouwerj','Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat.'),(35,23,'arenault5','Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.'),(36,18,'aologhlen7','Integer a nibh. In quis justo.'),(37,20,'msolland8','Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.'),(38,11,'klelievre3','Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.'),(39,18,'rgethinsa','Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.'),(40,18,'clonergano','Sed accumsan felis.'),(41,4,'sbrouwerj','Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien.'),(42,17,'arenault5','Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'),(43,22,'sbittlestone6','Nunc purus. Phasellus in felis. Donec semper sapien a libero.'),(44,4,'jarmfieldp','Morbi non quam nec dui luctus rutrum. Nulla tellus.'),(45,27,'fbarnbrook9','Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis.'),(46,3,'agovenlockf','Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.'),(47,26,'cphipp0','Nunc purus.'),(48,28,'nskeneq','In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.'),(49,19,'econradiei','Aliquam erat volutpat.'),(50,10,'nskeneq','Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue.'),(51,14,'aologhlen7','Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.'),(52,26,'msolland8','Aenean fermentum. Donec ut mauris eget massa tempor convallis.'),(53,23,'econradiei','In hac habitasse platea dictumst.'),(54,2,'jarmfieldp','Donec ut mauris eget massa tempor convallis.'),(55,10,'jtironeg','Etiam faucibus cursus urna. Ut tellus.'),(56,16,'gidwalevansd','Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.'),(57,16,'sferons','Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.'),(58,9,'gfernelym','Nulla tellus. In sagittis dui vel nisl.'),(59,28,'tchastonl','Vivamus vestibulum sagittis sapien.'),(60,24,'clonergano','Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat.');
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
  `email` varchar(40) NOT NULL UNIQUE ,
  `dataNascita` date NOT NULL,
  `numCarta` varchar(50) DEFAULT NULL,
  `dataScadenza` date DEFAULT NULL,
  `CVV` varchar(5) DEFAULT NULL,
  `cap` varchar(5) DEFAULT NULL,
  `via` varchar(70) DEFAULT NULL,
  `citta` varchar(30) DEFAULT NULL,
  `tipo` varchar(30) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Utente`
--

LOCK TABLES `Utente` WRITE;
/*!40000 ALTER TABLE `Utente` DISABLE KEYS */;
INSERT INTO `Utente` VALUES ('admin','admin','admin','admin','admin','2023-05-12',NULL,NULL,NULL,NULL,NULL,NULL,'admin'),('agovenlockf','ZJNtfPtjYa2','Alanna','Govenlock','agovenlockf@oracle.com','1970-10-24','374288773429328','2025-08-30','12345','70119','374 Meadow Ridge Parkway','Trzemeszno','user'),('aologhlen7','md1uFwQzgK91','Ambrosio','O\'Loghlen','aologhlen7@aboutads.info','2002-01-07','3536362078660470','2028-03-15','12345','59977','8 Forster Place','Zhaitou','user'),('arenault5','Clvfwt2Gu7Lc','Annabella','Renault','arenault5@house.gov','1963-11-15','5610529600346731078','2026-09-04','12345','87199','31970 Jana Lane','Oborniki ┼Ül─àskie','user'),('aseggen','9Qq6pHUBARAE','Alyce','Segge','aseggen@statcounter.com','1990-12-18','3550656637414357','2027-02-17','12345','01157','17193 Jenna Pass','Thß╗ï Trß║Ñn Thß╗ì Xu├ón','user'),('cbalbeckk','9t5C4f','Cornell','Balbeck','cbalbeckk@sogou.com','1986-08-05','201996451814145','2029-01-21','12345','61062','4186 Texas Hill','Corticeiro de Baixo','user'),('clonergano','cAZPf3vAU','Carlota','Lonergan','clonergano@scribd.com','1989-03-28','3574939790589906','2028-04-30','12345','95104','00 Cottonwood Junction','Mahates','user'),('cmcgucken2','6S1rng5kX','Culley','McGucken','cmcgucken2@sbwire.com','1991-08-16','36442967633902','2026-11-17','12345','59897','0 Grover Pass','Turkestan','user'),('cmoulstert','kMyLKqL3h','Craggy','Moulster','cmoulstert@amazon.com','2002-05-12','3540465736761111','2028-09-01','12345','01912','0051 Buell Place','Hengdian','user'),('cphipp0','LFZUUXjnS9','Calypso','Phipp','cphipp0@posterous.com','1975-12-15','5602259305531520','2028-07-01','12345','78751','0924 Jana Trail','Nereta','user'),('dodoughertyh','gmTuZB','Darren','O\'Dougherty','dodoughertyh@mit.edu','1984-03-10','3572791630934293','2029-03-10','12345','78402','4983 Green Ridge Junction','Kirovgrad','user'),('ebomfieldr','HyGC7mDTT','Elvira','Bomfield','ebomfieldr@nationalgeographic.com','1986-06-24','3531967784979967','2028-09-06','12345','14169','4708 Ohio Point','Roma','user'),('econradiei','Oyqdojzx','Erna','Conradie','econradiei@privacy.gov.au','1969-11-11','670600954715283646','2026-02-15','12345','80080','446 Kinsman Trail','Padhahegha','user'),('fbarnbrook9','35bV42eoIt','Flo','Barnbrook','fbarnbrook9@dmoz.org','1994-07-13','36888646157053','2025-10-06','12345','00126','7701 Blackbird Pass','Jinping','user'),('gfernelym','MbZa4rcKcR','Gunner','Fernely','gfernelym@google.com.br','1990-01-17','201490374406585','2027-05-26','12345','82259','9981 Forest Dale Crossing','Bluri','user'),('gflucks1','0KNTOZqVDF','Gianina','Flucks','gflucks1@soundcloud.com','2003-12-04','3549105101434644','2027-06-28','12345','61244','8 Esch Park','Koundara','user'),('gidwalevansd','awkUzNGmcOzF','Gert','Idwal Evans','gidwalevansd@amazonaws.com','1961-08-30','3533409596742760','2026-07-04','12345','16810','1 Lyons Lane','Topolovgrad','user'),('jarmfieldp','vPHONxyJxER','Jennifer','Armfield','jarmfieldp@vimeo.com','1986-04-27','67615079647924265','2025-07-19','12345','33268','422 Toban Place','Bangkle','user'),('jmaddicksb','ktDH8DKi','Jocelyne','Maddicks','jmaddicksb@usda.gov','1988-08-02','4459672859008074','2028-09-29','12345','97429','72625 Del Mar Alley','Huaicheng','user'),('jtironeg','x8rWaf','Jule','Tirone','jtironeg@about.me','1998-08-23','5100144892952163','2025-10-22','12345','61516','161 Golf Course Hill','Pokrovka','user'),('klelievre3','kTXQyQfWMj','Kahaleel','Lelievre','klelievre3@thetimes.co.uk','1969-12-06','5108497127350302','2025-08-01','12345','45172','87375 Michigan Center','Bakungan','user'),('ltayloure','98pNQnX','Lanni','Taylour','ltayloure@japanpost.jp','1982-11-13','67619566239208061','2025-07-08','12345','70889','33 Delladonna Place','Tindog','user'),('msolland8','1LS9mRVW2Wx3','Major','Solland','msolland8@jalbum.net','1989-10-31','63047057357415531','2027-02-21','12345','27493','51981 Nova Court','Rat├¡┼íkovice','user'),('nlockner4','830L29YLWVB','Nixie','Lockner','nlockner4@furl.net','1979-08-04','201419602648320','2025-08-23','12345','39695','1 Farwell Place','Nyk├Âping','user'),('nskeneq','tlqPz8PF96','Neda','Skene','nskeneq@comcast.net','2000-04-28','30260857131472','2026-11-07','28387','12345','919 Melrose Court','Kolobolon','user'),('rgethinsa','5D5ajEWbz','Roana','Gethins','rgethinsa@blog.com','1989-04-21','201410134416500','2027-03-28','12345','62657','861 Surrey Drive','Amqui','user'),('sbittlestone6','8YpzCljci6o','Shandeigh','Bittlestone','sbittlestone6@chronoengine.com','1991-08-12','560224701266557244','2025-12-06','12345','38609','584 Golf Course Avenue','Vilarinho da Castanheira','user'),('sbrouwerj','egM3oyF3X','Sallee','Brouwer','sbrouwerj@yelp.com','1969-12-06','3544121540810570','2025-12-16','12345','36371','8 Meadow Valley Drive','Barayong','user'),('sferons','dzhPifMJJUNR','Sandro','Feron','sferons@live.com','1974-04-18','6331105789968794094','2026-11-27','12345','44682','05325 Bashford Junction','Tagum','user'),('slarmouthc','UslwRz666l','Susie','Larmouth','slarmouthc@nationalgeographic.com','1987-10-26','5610112778422666542','2028-01-24','12345','78269','276 Hoard Alley','Kanbe','user'),('tchastonl','yjmvNIBMEQ','Ted','Chaston','tchastonl@stanford.edu','1999-07-29','3571788550196508','2028-06-02','12345','36615','0 Maple Wood Terrace','Ampele├¡es','user'),('user','user','user','user','user','2002-04-05',NULL,NULL,NULL,NULL,NULL,NULL,'user');
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

-- Dump completed on 2023-05-12 21:20:24
