-- MySQL dump 10.13  Distrib 8.0.37, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: tpremiseria
-- ------------------------------------------------------
-- Server version	8.0.37-0ubuntu0.22.04.3

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
-- Table structure for table `Choferes`
--

DROP TABLE IF EXISTS `Choferes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Choferes` (
  `idChoferes` int NOT NULL,
  `DNI_chofer` int DEFAULT NULL,
  `Apellido_chofer` varchar(45) DEFAULT NULL,
  `Nombre_chofer` varchar(45) DEFAULT NULL,
  `Direccion_chofer` varchar(45) DEFAULT NULL,
  `Telefono_chofer` int DEFAULT NULL,
  PRIMARY KEY (`idChoferes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Choferes`
--

LOCK TABLES `Choferes` WRITE;
/*!40000 ALTER TABLE `Choferes` DISABLE KEYS */;
INSERT INTO `Choferes` VALUES (6,12345677,'Apellido6','Nombre6','Direccion6',111111112),(7,23456788,'Apellido7','Nombre7','Direccion7',222222223),(8,34567899,'Apellido8','Nombre8','Direccion8',333333334),(9,45678900,'Apellido9','Nombre9','Direccion9',444444445),(10,56789011,'Apellido10','Nombre10','Direccion10',555555556);
/*!40000 ALTER TABLE `Choferes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Clientes`
--

DROP TABLE IF EXISTS `Clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clientes` (
  `idCliente` int NOT NULL,
  `DNI` int DEFAULT NULL,
  `Apellido` varchar(45) DEFAULT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Direccion` varchar(45) DEFAULT NULL,
  `Telefono` int DEFAULT NULL,
  `Observaciones` varchar(45) DEFAULT NULL,
  `CuentaCorriente_codigoCC` int DEFAULT NULL,
  PRIMARY KEY (`idCliente`),
  KEY `CuentaCorriente_codigoCC` (`CuentaCorriente_codigoCC`),
  CONSTRAINT `Clientes_ibfk_1` FOREIGN KEY (`CuentaCorriente_codigoCC`) REFERENCES `CuentaCorriente` (`codigoCC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clientes`
--

LOCK TABLES `Clientes` WRITE;
/*!40000 ALTER TABLE `Clientes` DISABLE KEYS */;
INSERT INTO `Clientes` VALUES (1,12345678,'Apellido1','Nombre1','Direccion1',111111111,'Observaciones Cliente 1',567),(2,23456789,'Apellido2','Nombre2','Direccion2',222222222,'Observaciones Cliente 2',568),(3,34567890,'Apellido3','Nombre3','Direccion3',333333333,'Observaciones Cliente 3',569),(4,45678901,'Apellido4','Nombre4','Direccion4',444444444,'Observaciones Cliente 4',570),(5,56789012,'Apellido5','Nombre5','Direccion5',555555555,'Observaciones Cliente 5',571);
/*!40000 ALTER TABLE `Clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CuentaCorriente`
--

DROP TABLE IF EXISTS `CuentaCorriente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CuentaCorriente` (
  `codigoCC` int NOT NULL,
  `saldo` int DEFAULT NULL,
  PRIMARY KEY (`codigoCC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CuentaCorriente`
--

LOCK TABLES `CuentaCorriente` WRITE;
/*!40000 ALTER TABLE `CuentaCorriente` DISABLE KEYS */;
INSERT INTO `CuentaCorriente` VALUES (567,450),(568,451),(569,452),(570,453),(571,454);
/*!40000 ALTER TABLE `CuentaCorriente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Viajes`
--

DROP TABLE IF EXISTS `Viajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Viajes` (
  `idviaje` int NOT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Destino` varchar(45) DEFAULT NULL,
  `Hora_de_llegada` time DEFAULT NULL,
  `Costo` int DEFAULT NULL,
  `CuentaCorriente_codigoCC` int DEFAULT NULL,
  `Choferes_idChoferes` int DEFAULT NULL,
  PRIMARY KEY (`idviaje`),
  KEY `CuentaCorriente_codigoCC` (`CuentaCorriente_codigoCC`),
  KEY `Choferes_idChoferes` (`Choferes_idChoferes`),
  CONSTRAINT `Viajes_ibfk_1` FOREIGN KEY (`CuentaCorriente_codigoCC`) REFERENCES `CuentaCorriente` (`codigoCC`),
  CONSTRAINT `Viajes_ibfk_2` FOREIGN KEY (`Choferes_idChoferes`) REFERENCES `Choferes` (`idChoferes`),
  CONSTRAINT `Viajes_chk_1` CHECK ((`Costo` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Viajes`
--

LOCK TABLES `Viajes` WRITE;
/*!40000 ALTER TABLE `Viajes` DISABLE KEYS */;
INSERT INTO `Viajes` VALUES (11,'2020-01-10 00:00:00','salta','12:30:01',28,567,6),(12,'2020-02-10 00:00:00','jujuy','12:30:02',57,568,7),(13,'2020-03-10 00:00:00','cordoba','12:30:03',85,569,8),(14,'2020-04-10 00:00:00','neuquen','12:30:04',113,570,9),(15,'2020-05-10 00:00:00','rionegro','12:30:05',142,571,10),(16,'2020-06-10 00:00:00','catamarca','12:30:06',169,567,6),(17,'2020-07-10 00:00:00','caba','12:30:07',197,568,7),(18,'2020-08-10 00:00:00','misiones','12:30:08',225,569,8),(19,'2020-09-10 00:00:00','entrerios','12:30:09',254,570,9),(20,'2020-10-10 00:00:00','chaco','12:30:10',254,571,10);
/*!40000 ALTER TABLE `Viajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autos`
--

DROP TABLE IF EXISTS `autos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autos` (
  `Patente` varchar(45) NOT NULL,
  `Modelo` varchar(45) DEFAULT NULL,
  `Choferes_idChoferes2` int DEFAULT NULL,
  PRIMARY KEY (`Patente`),
  KEY `Choferes_idChoferes2` (`Choferes_idChoferes2`),
  CONSTRAINT `autos_ibfk_1` FOREIGN KEY (`Choferes_idChoferes2`) REFERENCES `Choferes` (`idChoferes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autos`
--

LOCK TABLES `autos` WRITE;
/*!40000 ALTER TABLE `autos` DISABLE KEYS */;
INSERT INTO `autos` VALUES ('KVP 980','Corsa',6),('KVP 981','Corsav',7),('KVP 982','Corsak',8),('KVT 986','Corsat',9),('KVT 987','Corsas',10);
/*!40000 ALTER TABLE `autos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-25 17:53:11
