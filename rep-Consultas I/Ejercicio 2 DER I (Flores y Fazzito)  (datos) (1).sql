-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: Ejercicio2
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Camioneros`
--

DROP TABLE IF EXISTS `Camioneros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Camioneros` (
  `DNI` int NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Teléfono` int DEFAULT NULL,
  `Dirección` varchar(45) DEFAULT NULL,
  `Salario` int DEFAULT NULL,
  `Ciudad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Camioneros`
--

LOCK TABLES `Camioneros` WRITE;
/*!40000 ALTER TABLE `Camioneros` DISABLE KEYS */;
INSERT INTO `Camioneros` VALUES (80,'Martin',1900,'Congreso',242,'California'),(81,'Martinez',1910,'Congressista',254,'Washington'),(82,'Alvarez',1920,'Congresismo',266,'Texas'),(83,'Pato',1930,'Anarquismo',278,'Billardo'),(84,'Patito',1940,'Everton',264,'Menotti');
/*!40000 ALTER TABLE `Camioneros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Camioneros_has_Camiones`
--

DROP TABLE IF EXISTS `Camioneros_has_Camiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Camioneros_has_Camiones` (
  `Camioneros_DNI` int NOT NULL,
  `Camioneros_Camiones_Matrícula` int NOT NULL,
  `Camiones_Matrícula` int NOT NULL,
  PRIMARY KEY (`Camioneros_DNI`,`Camioneros_Camiones_Matrícula`,`Camiones_Matrícula`),
  KEY `fk_Camioneros_has_Camiones_Camiones1_idx` (`Camiones_Matrícula`),
  KEY `fk_Camioneros_has_Camiones_Camioneros1_idx` (`Camioneros_DNI`,`Camioneros_Camiones_Matrícula`),
  CONSTRAINT `fk_Camioneros_has_Camiones_Camioneros1` FOREIGN KEY (`Camioneros_DNI`) REFERENCES `Camioneros` (`DNI`),
  CONSTRAINT `fk_Camioneros_has_Camiones_Camiones1` FOREIGN KEY (`Camiones_Matrícula`) REFERENCES `Camiones` (`Matrícula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Camioneros_has_Camiones`
--

LOCK TABLES `Camioneros_has_Camiones` WRITE;
/*!40000 ALTER TABLE `Camioneros_has_Camiones` DISABLE KEYS */;
/*!40000 ALTER TABLE `Camioneros_has_Camiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Camiones`
--

DROP TABLE IF EXISTS `Camiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Camiones` (
  `Matrícula` int NOT NULL,
  `Modelo` varchar(45) DEFAULT NULL,
  `Potencia` varchar(45) DEFAULT NULL,
  `Tipo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Matrícula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Camiones`
--

LOCK TABLES `Camiones` WRITE;
/*!40000 ALTER TABLE `Camiones` DISABLE KEYS */;
INSERT INTO `Camiones` VALUES (425,'Camaro','Alta','Extraño'),(426,'Camarole','Altisima','Extraña'),(427,'Camarolan','Altita','Extrañisima'),(428,'Schevene','Baja','Extrañada'),(429,'Schevenko','Bajita','Comunem');
/*!40000 ALTER TABLE `Camiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Paquetes`
--

DROP TABLE IF EXISTS `Paquetes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Paquetes` (
  `Código` int NOT NULL,
  `Descripción` varchar(45) DEFAULT NULL,
  `Destinatario` varchar(45) DEFAULT NULL,
  `Dirección del destinatario` varchar(45) DEFAULT NULL,
  `Provincias_Código` int NOT NULL,
  `Camioneros_DNI` int NOT NULL,
  PRIMARY KEY (`Código`),
  KEY `fk_Paquetes_Provincias1_idx` (`Provincias_Código`),
  KEY `fk_Paquetes_Camioneros1_idx` (`Camioneros_DNI`),
  CONSTRAINT `fk_Paquetes_Camioneros1` FOREIGN KEY (`Camioneros_DNI`) REFERENCES `Camioneros` (`DNI`),
  CONSTRAINT `fk_Paquetes_Provincias1` FOREIGN KEY (`Provincias_Código`) REFERENCES `Provincias` (`Código`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Paquetes`
--

LOCK TABLES `Paquetes` WRITE;
/*!40000 ALTER TABLE `Paquetes` DISABLE KEYS */;
INSERT INTO `Paquetes` VALUES (102,'comun','Cocolo','triunvirates',3,82),(103,'bueno','Cocoros','irlanda',4,83),(104,'malo','Cocorno','bosnia',5,84);
/*!40000 ALTER TABLE `Paquetes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Provincias`
--

DROP TABLE IF EXISTS `Provincias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Provincias` (
  `Código` int NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Código`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Provincias`
--

LOCK TABLES `Provincias` WRITE;
/*!40000 ALTER TABLE `Provincias` DISABLE KEYS */;
INSERT INTO `Provincias` VALUES (1,'Chubut'),(2,'Mendoza'),(3,'Cordoba'),(4,'Salta'),(5,'Corrientes');
/*!40000 ALTER TABLE `Provincias` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-14 16:06:03
