-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: whiTee
-- ------------------------------------------------------
-- Server version	8.0.32-0ubuntu0.20.04.2

USE whiTee;

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
  `descrizione` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Maglietta`
--

LOCK TABLES `Maglietta` WRITE;
/*!40000 ALTER TABLE `Maglietta` DISABLE KEYS */;
INSERT INTO `Maglietta` VALUES (1,'Mercoledi',15,3,'Bianco','Film e Serie TV','images\\grafiche\\1Film e Serie TV.jpg', 'Maglietta di Mercoledì'),(2,'Game of Thrones',15,3,'Blu','Film e Serie TV','images\\grafiche\\2Film e Serie TV.jpg', 'Maglietta di Game of Thrones'),(3,'Stranger Things',15,3,'Bianco','Film e Serie TV','images\\grafiche\\3Film e Serie TV.jpg', 'Maglietta di Stranger Things'),(4,'Bud Spencer',15,3,'Nero','Film e Serie TV','images\\grafiche\\4Film e Serie TV.png', 'Maglietta del GRANDE Bud Spencer (il sommo, il mio preferito)'),(5,'Naruto',16,3,'Nero','Anime e Manga','images\\grafiche\\5Anime e Manga.jpg', 'Maglietta di Naruto'),(6,'Anime',12,3,'Nero','Anime e Manga','images\\grafiche\\6Anime e Manga.jpg', 'Generica maglietta sugli anime'),(7,'JoJo Reference',18,3,'Blu','Anime e Manga','images\\grafiche\\7Anime e Manga.png', 'Maglietta di JoJo'),(8,'Demon Slayer',23,3,'Blu','Anime e Manga','images\\grafiche\\8Anime e Manga.png', 'Maglietta di Demon Slayer'),(9,'Kuromi',25,3,'Nero','Girl Power','images\\grafiche\\9Girl Power.png', 'Maglietta di Kuromi'),(10,'Sailor Moon',17,3,'Bianco','Girl Power','images\\grafiche\\10Girl Power.png', 'Maglietta di Sailor Moon');
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
  `cap` char(5) NOT NULL,
  `via` varchar(70) NOT NULL,
  `citta` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ordine`
--

LOCK TABLES `Ordine` WRITE;
/*!40000 ALTER TABLE `Ordine` DISABLE KEYS */;
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
  PRIMARY KEY (`TG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Taglia`
--

LOCK TABLES `Taglia` WRITE;
/*!40000 ALTER TABLE `Taglia` DISABLE KEYS */;
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
  `numCarta` char(16) NOT NULL,
  `dataScadenza` date NOT NULL,
  `cap` char(5) NOT NULL,
  `via` varchar(70) NOT NULL,
  `citta` varchar(30) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Utente`
--

LOCK TABLES `Utente` WRITE;
/*!40000 ALTER TABLE `Utente` DISABLE KEYS */;
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

-- Dump completed on 2023-05-03 12:39:06
