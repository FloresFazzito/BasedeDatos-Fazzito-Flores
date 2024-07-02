-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: Ejercicio6_Proovedores
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
-- Table structure for table `Clientes`
--

DROP TABLE IF EXISTS `Clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clientes` (
  `Código` int NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Apellido` varchar(45) DEFAULT NULL,
  `Dirección` varchar(45) DEFAULT NULL,
  `Teléfono` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Código`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clientes`
--

LOCK TABLES `Clientes` WRITE;
/*!40000 ALTER TABLE `Clientes` DISABLE KEYS */;
INSERT INTO `Clientes` VALUES (1,'Nombre1','Perez','Calle 123, Ciudad A','123456789'),(2,'Nombre2','Apellido2','Avenida XYZ, Ciudad B','987654321'),(3,'Nombre3','Pato','Calle Principal, Ciudad C','555444333'),(4,'Nombre4','Apellido4','Carrera 456, Ciudad D','777888999');
/*!40000 ALTER TABLE `Clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Clientes_has_Productos`
--

DROP TABLE IF EXISTS `Clientes_has_Productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clientes_has_Productos` (
  `Clientes_Código` int NOT NULL,
  `Productos_Código` int NOT NULL,
  PRIMARY KEY (`Clientes_Código`,`Productos_Código`),
  KEY `fk_Clientes_has_Productos_Productos1_idx` (`Productos_Código`),
  KEY `fk_Clientes_has_Productos_Clientes_idx` (`Clientes_Código`),
  CONSTRAINT `fk_Clientes_has_Productos_Clientes` FOREIGN KEY (`Clientes_Código`) REFERENCES `Clientes` (`Código`),
  CONSTRAINT `fk_Clientes_has_Productos_Productos1` FOREIGN KEY (`Productos_Código`) REFERENCES `Productos` (`Código`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clientes_has_Productos`
--

LOCK TABLES `Clientes_has_Productos` WRITE;
/*!40000 ALTER TABLE `Clientes_has_Productos` DISABLE KEYS */;
INSERT INTO `Clientes_has_Productos` VALUES (1,1),(1,2),(2,3),(3,4);
/*!40000 ALTER TABLE `Clientes_has_Productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Productos`
--

DROP TABLE IF EXISTS `Productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Productos` (
  `Código` int NOT NULL,
  `Descripción` varchar(45) DEFAULT NULL,
  `Stock` varchar(45) DEFAULT NULL,
  `Precio` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Código`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Productos`
--

LOCK TABLES `Productos` WRITE;
/*!40000 ALTER TABLE `Productos` DISABLE KEYS */;
INSERT INTO `Productos` VALUES (1,'Producto1','10 unidades','20.50'),(2,'Producto2','20 unidades','15.75'),(3,'Producto3','15 unidades','3000'),(4,'Producto4','25 unidades','4000'),(5,NULL,'50 unidades','250');
/*!40000 ALTER TABLE `Productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Productos_has_Proveedores`
--

DROP TABLE IF EXISTS `Productos_has_Proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Productos_has_Proveedores` (
  `Productos_Código` int NOT NULL,
  `Proveedores_Código` int NOT NULL,
  PRIMARY KEY (`Productos_Código`,`Proveedores_Código`),
  KEY `fk_Productos_has_Proveedores_Proveedores1_idx` (`Proveedores_Código`),
  KEY `fk_Productos_has_Proveedores_Productos1_idx` (`Productos_Código`),
  CONSTRAINT `fk_Productos_has_Proveedores_Productos1` FOREIGN KEY (`Productos_Código`) REFERENCES `Productos` (`Código`),
  CONSTRAINT `fk_Productos_has_Proveedores_Proveedores1` FOREIGN KEY (`Proveedores_Código`) REFERENCES `Proveedores` (`Código`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Productos_has_Proveedores`
--

LOCK TABLES `Productos_has_Proveedores` WRITE;
/*!40000 ALTER TABLE `Productos_has_Proveedores` DISABLE KEYS */;
INSERT INTO `Productos_has_Proveedores` VALUES (1,1),(1,2),(2,3),(3,4);
/*!40000 ALTER TABLE `Productos_has_Proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Proveedores`
--

DROP TABLE IF EXISTS `Proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Proveedores` (
  `Código` int NOT NULL,
  `Provincia` varchar(45) DEFAULT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Apellido` varchar(45) DEFAULT NULL,
  `Dirección` varchar(45) DEFAULT NULL,
  `Teléfono` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Código`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Proveedores`
--

LOCK TABLES `Proveedores` WRITE;
/*!40000 ALTER TABLE `Proveedores` DISABLE KEYS */;
INSERT INTO `Proveedores` VALUES (1,'Provincia1','NombreProveedor1','ApellidoProveedor1','DirecciónProveedor1','123456789'),(2,'Provincia2','NombreProveedor2','ApellidoProveedor2','DirecciónProveedor2','987654321'),(3,'Provincia3','NombreProveedor3','ApellidoProveedor3','DirecciónProveedor3','555444333'),(4,'Provincia4','NombreProveedor4','ApellidoProveedor4','DirecciónProveedor4','777888999');
/*!40000 ALTER TABLE `Proveedores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-14 16:00:26
