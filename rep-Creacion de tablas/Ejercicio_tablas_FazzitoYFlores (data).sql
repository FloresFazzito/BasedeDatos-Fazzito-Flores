-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: TP_Turismo_tablas
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
-- Table structure for table `Alojamiento`
--

DROP TABLE IF EXISTS `Alojamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Alojamiento` (
  `Direccion` varchar(45) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Bar` varchar(45) DEFAULT NULL,
  `Cantidad_de_personas` int DEFAULT NULL,
  `Cantidad_de_pisos` int DEFAULT NULL,
  `Telefono` int DEFAULT NULL,
  `Categoria` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Direccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Alojamiento`
--

LOCK TABLES `Alojamiento` WRITE;
/*!40000 ALTER TABLE `Alojamiento` DISABLE KEYS */;
INSERT INTO `Alojamiento` VALUES ('12',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `Alojamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cabaña`
--

DROP TABLE IF EXISTS `Cabaña`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cabaña` (
  `Alojamiento_Direccion` varchar(45) NOT NULL,
  `Parilla` varchar(45) DEFAULT NULL,
  `Garaje` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Alojamiento_Direccion`),
  CONSTRAINT `Cabaña_ibfk_1` FOREIGN KEY (`Alojamiento_Direccion`) REFERENCES `Alojamiento` (`Direccion`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cabaña`
--

LOCK TABLES `Cabaña` WRITE;
/*!40000 ALTER TABLE `Cabaña` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cabaña` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Clientes`
--

DROP TABLE IF EXISTS `Clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clientes` (
  `DNI` int NOT NULL,
  `Apellido_y_nombre` varchar(45) DEFAULT NULL,
  `Direccion` varchar(45) DEFAULT NULL,
  `Telefono` int DEFAULT NULL,
  PRIMARY KEY (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clientes`
--

LOCK TABLES `Clientes` WRITE;
/*!40000 ALTER TABLE `Clientes` DISABLE KEYS */;
INSERT INTO `Clientes` VALUES (112,NULL,NULL,NULL);
/*!40000 ALTER TABLE `Clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Clientes_reservan_Paquete_de_viaje`
--

DROP TABLE IF EXISTS `Clientes_reservan_Paquete_de_viaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clientes_reservan_Paquete_de_viaje` (
  `Clientes_DNI` int NOT NULL,
  `Paquete_de_viaje_id` int NOT NULL,
  `Inicio` date DEFAULT NULL,
  `Fin` date DEFAULT NULL,
  `Cantidad_de_personas` int DEFAULT NULL,
  PRIMARY KEY (`Clientes_DNI`,`Paquete_de_viaje_id`),
  KEY `Paquete_de_viaje_id` (`Paquete_de_viaje_id`),
  CONSTRAINT `Clientes_reservan_Paquete_de_viaje_ibfk_1` FOREIGN KEY (`Clientes_DNI`) REFERENCES `Clientes` (`DNI`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `Clientes_reservan_Paquete_de_viaje_ibfk_2` FOREIGN KEY (`Paquete_de_viaje_id`) REFERENCES `Paquete_de_viaje` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clientes_reservan_Paquete_de_viaje`
--

LOCK TABLES `Clientes_reservan_Paquete_de_viaje` WRITE;
/*!40000 ALTER TABLE `Clientes_reservan_Paquete_de_viaje` DISABLE KEYS */;
INSERT INTO `Clientes_reservan_Paquete_de_viaje` VALUES (112,900,NULL,NULL,NULL);
/*!40000 ALTER TABLE `Clientes_reservan_Paquete_de_viaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Paquete_de_viaje`
--

DROP TABLE IF EXISTS `Paquete_de_viaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Paquete_de_viaje` (
  `id` int NOT NULL,
  `Cantidad_de_excursiones` int DEFAULT NULL,
  `Viaje` varchar(45) DEFAULT NULL,
  `Cantidad_de_dias` int DEFAULT NULL,
  `Cantidad_de_noches` int DEFAULT NULL,
  `Costo` int DEFAULT NULL,
  `Tipo_de_pago` varchar(45) DEFAULT NULL,
  `Lugar` varchar(45) DEFAULT NULL,
  `Alojamiento_Direccion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Alojamiento_Direccion` (`Alojamiento_Direccion`),
  CONSTRAINT `Paquete_de_viaje_ibfk_1` FOREIGN KEY (`Alojamiento_Direccion`) REFERENCES `Alojamiento` (`Direccion`) ON DELETE CASCADE ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Paquete_de_viaje`
--

LOCK TABLES `Paquete_de_viaje` WRITE;
/*!40000 ALTER TABLE `Paquete_de_viaje` DISABLE KEYS */;
INSERT INTO `Paquete_de_viaje` VALUES (900,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `Paquete_de_viaje` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-04 17:26:29
