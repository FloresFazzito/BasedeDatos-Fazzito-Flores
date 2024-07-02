-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: Ejercicio5hosp
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
-- Table structure for table `Ingresos`
--

DROP TABLE IF EXISTS `Ingresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ingresos` (
  `Codigo de ingresos` int NOT NULL,
  `Numero de habitacion y cama` varchar(45) DEFAULT NULL,
  `Fecha de ingreso` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Codigo de ingresos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ingresos`
--

LOCK TABLES `Ingresos` WRITE;
/*!40000 ALTER TABLE `Ingresos` DISABLE KEYS */;
INSERT INTO `Ingresos` VALUES (157,'57','2023-11-21');
/*!40000 ALTER TABLE `Ingresos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Medico`
--

DROP TABLE IF EXISTS `Medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Medico` (
  `Codigo` int NOT NULL,
  `Especialidad` varchar(45) DEFAULT NULL,
  `Apellido` varchar(45) DEFAULT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Numero de telefono` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Medico`
--

LOCK TABLES `Medico` WRITE;
/*!40000 ALTER TABLE `Medico` DISABLE KEYS */;
INSERT INTO `Medico` VALUES (10,'Pediatria','Lema','Lionel','50'),(11,'Traumatologo','Lemano','Leonardo','51'),(12,'Dentista','Figal','Leon','52'),(13,'Inspector','Correa','Gonza','53');
/*!40000 ALTER TABLE `Medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Paciente`
--

DROP TABLE IF EXISTS `Paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Paciente` (
  `Numero de telefono` int NOT NULL,
  `Medico_Codigo` int NOT NULL,
  `Ciudad` varchar(45) DEFAULT NULL,
  `Direccion` varchar(45) DEFAULT NULL,
  `Codigo postal` varchar(45) DEFAULT NULL,
  `Apellido` varchar(45) DEFAULT NULL,
  `Provincia` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Numero de telefono`),
  KEY `fk_Paciente_Medico1_idx` (`Medico_Codigo`),
  CONSTRAINT `fk_Paciente_Medico1` FOREIGN KEY (`Medico_Codigo`) REFERENCES `Medico` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Paciente`
--

LOCK TABLES `Paciente` WRITE;
/*!40000 ALTER TABLE `Paciente` DISABLE KEYS */;
INSERT INTO `Paciente` VALUES (123456789,10,'Ciudad A','Calle 123','Sacar','Apellido1','Provincia A'),(555444333,12,'Ciudad C','Calle Principal','Mover','Apellido3','Provincia C'),(987654321,11,'Ciudad B','Avenida XYZ','Meter','Apellido2','Provincia B');
/*!40000 ALTER TABLE `Paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Paciente_has_Ingresos`
--

DROP TABLE IF EXISTS `Paciente_has_Ingresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Paciente_has_Ingresos` (
  `Paciente_Numero de telefono` int NOT NULL,
  `Ingresos_Codigo de ingresos` int NOT NULL,
  PRIMARY KEY (`Paciente_Numero de telefono`,`Ingresos_Codigo de ingresos`),
  KEY `fk_Paciente_has_Ingresos_Ingresos1_idx` (`Ingresos_Codigo de ingresos`),
  KEY `fk_Paciente_has_Ingresos_Paciente1_idx` (`Paciente_Numero de telefono`),
  CONSTRAINT `fk_Paciente_has_Ingresos_Ingresos1` FOREIGN KEY (`Ingresos_Codigo de ingresos`) REFERENCES `Ingresos` (`Codigo de ingresos`),
  CONSTRAINT `fk_Paciente_has_Ingresos_Paciente1` FOREIGN KEY (`Paciente_Numero de telefono`) REFERENCES `Paciente` (`Numero de telefono`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Paciente_has_Ingresos`
--

LOCK TABLES `Paciente_has_Ingresos` WRITE;
/*!40000 ALTER TABLE `Paciente_has_Ingresos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Paciente_has_Ingresos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-14 14:42:28
