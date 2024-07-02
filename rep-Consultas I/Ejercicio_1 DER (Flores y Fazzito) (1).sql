-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: Ejercicio1
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
  `Nombre` varchar(45) DEFAULT NULL,
  `Apellido` varchar(45) DEFAULT NULL,
  `DNI` int NOT NULL,
  `Dirección` varchar(45) DEFAULT NULL,
  `Fecha de nacimiento` date DEFAULT NULL,
  PRIMARY KEY (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clientes`
--

LOCK TABLES `Clientes` WRITE;
/*!40000 ALTER TABLE `Clientes` DISABLE KEYS */;
INSERT INTO `Clientes` VALUES ('Jorge','facu',4,'zeballos','1999-08-01'),('Jorgito','facultad',5,'changuitozeballos','1999-08-02'),('Jorgaso','faculensio',6,'carloszeballos','1999-08-03'),('Jorgelio','faculito',7,'cuancazeballos','1999-08-04'),('Juan','faculito',27,'cuancazeballos','1999-08-04'),('Juan','facultad',35,'changuitozeballos','1999-08-02'),('Jorge','facu',11111111,'CasadeTito','1999-08-01');
/*!40000 ALTER TABLE `Clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Clientes_has_Productos`
--

DROP TABLE IF EXISTS `Clientes_has_Productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clientes_has_Productos` (
  `Clientes_DNI` int NOT NULL,
  `Productos_Codigo` int NOT NULL,
  PRIMARY KEY (`Clientes_DNI`,`Productos_Codigo`),
  KEY `fk_Clientes_has_Productos_Productos1_idx` (`Productos_Codigo`),
  KEY `fk_Clientes_has_Productos_Clientes1_idx` (`Clientes_DNI`),
  CONSTRAINT `fk_Clientes_has_Productos_Clientes1` FOREIGN KEY (`Clientes_DNI`) REFERENCES `Clientes` (`DNI`),
  CONSTRAINT `fk_Clientes_has_Productos_Productos1` FOREIGN KEY (`Productos_Codigo`) REFERENCES `Productos` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clientes_has_Productos`
--

LOCK TABLES `Clientes_has_Productos` WRITE;
/*!40000 ALTER TABLE `Clientes_has_Productos` DISABLE KEYS */;
INSERT INTO `Clientes_has_Productos` VALUES (4,1),(11111111,1),(35,321),(6,322),(27,323);
/*!40000 ALTER TABLE `Clientes_has_Productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Productos`
--

DROP TABLE IF EXISTS `Productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Productos` (
  `Codigo` int NOT NULL,
  `Precio unitario` varchar(45) DEFAULT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Proveedores_DNI` int NOT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `fk_Productos_Proveedores1_idx` (`Proveedores_DNI`),
  CONSTRAINT `fk_Productos_Proveedores1` FOREIGN KEY (`Proveedores_DNI`) REFERENCES `Proveedores` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Productos`
--

LOCK TABLES `Productos` WRITE;
/*!40000 ALTER TABLE `Productos` DISABLE KEYS */;
INSERT INTO `Productos` VALUES (1,'500','Emilia',340),(320,'500','Emilia',340),(321,'510','Leroy',341),(322,'520','Vini',342),(323,'530','Neuer',343);
/*!40000 ALTER TABLE `Productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Proveedores`
--

DROP TABLE IF EXISTS `Proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Proveedores` (
  `DNI` int NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Direccion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Proveedores`
--

LOCK TABLES `Proveedores` WRITE;
/*!40000 ALTER TABLE `Proveedores` DISABLE KEYS */;
INSERT INTO `Proveedores` VALUES (320,'Jorge','Emilia'),(321,'Jorguinho','Leroy'),(322,'Joao','Vini'),(323,'Emiliano','Neuer'),(326,'Jorge','Emilia'),(327,'Jorguinho','Leroy'),(328,'Joao','Vini'),(329,'Emiliano','Neuer'),(340,'Jorge','Emilia'),(341,'Jorguinho','Leroy'),(342,'Joao','Vini'),(343,'Emiliano','Neuer');
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

-- Dump completed on 2024-04-30 17:43:51
