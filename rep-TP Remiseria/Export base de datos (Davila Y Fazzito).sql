-- MySQL dump 10.13  Distrib 8.0.37, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: Tp_Remiseria
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
-- Table structure for table `Cuenta_corriente`
--

DROP TABLE IF EXISTS `Cuenta_corriente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cuenta_corriente` (
  `id` int NOT NULL,
  `Plata` int DEFAULT NULL,
  `cliente_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cliente_id` (`cliente_id`),
  CONSTRAINT `Cuenta_corriente_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cuenta_corriente`
--

LOCK TABLES `Cuenta_corriente` WRITE;
/*!40000 ALTER TABLE `Cuenta_corriente` DISABLE KEYS */;
INSERT INTO `Cuenta_corriente` VALUES (1,-23123,2002),(2,23,20202),(93,17331,21002),(939,1731,2002),(9139,174341,20402),(9239,173231,20202),(9539,173661,23002);
/*!40000 ALTER TABLE `Cuenta_corriente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autos`
--

DROP TABLE IF EXISTS `autos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autos` (
  `Patente` int NOT NULL,
  `Modelo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Patente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autos`
--

LOCK TABLES `autos` WRITE;
/*!40000 ALTER TABLE `autos` DISABLE KEYS */;
INSERT INTO `autos` VALUES (224,'r2'),(244,'r8'),(2424,'r4'),(2442,'r84'),(24242,'r42');
/*!40000 ALTER TABLE `autos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chofer`
--

DROP TABLE IF EXISTS `chofer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chofer` (
  `id` int NOT NULL,
  `dni` int DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `Direccion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chofer`
--

LOCK TABLES `chofer` WRITE;
/*!40000 ALTER TABLE `chofer` DISABLE KEYS */;
INSERT INTO `chofer` VALUES (2002,455522,'ofelia','ojeda',312141,'helguera 2000'),(2004,4544322,'ofelias','ojedsaa',31211,'helguera 4000'),(2006,53522,'ofelwia','ojedera',3156741,'helguera 6000'),(2008,4554232,'pofelia','orjeda',319743,'helguera 8000'),(2010,4598485,'pofekea','orjteda',359763,'helguera 9000');
/*!40000 ALTER TABLE `chofer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id` int NOT NULL,
  `dni` int DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `Direccion` varchar(45) DEFAULT NULL,
  `Observaciones` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (2002,455522,'ofelia','ojeda',312141,'helguera 2005','lentes oscuros'),(20202,13412,'ofeliag','ojseda',31141,'Condarco 2005','arito'),(20402,4522,'ofeliat','ojedac',3121451,'helgueras 2005','rapado costados'),(21002,22,'ofelida','ojteda',3122141,'helsguera 2005','campera negra'),(23002,522,'ofeslia','ojeyda',141,'helguera 20','lentes ');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viaje`
--

DROP TABLE IF EXISTS `viaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viaje` (
  `id` int NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Destino` varchar(45) DEFAULT NULL,
  `Hora_de_llegada` datetime DEFAULT NULL,
  `costo` int DEFAULT NULL,
  `Direccion` varchar(45) DEFAULT NULL,
  `cliente_id` int DEFAULT NULL,
  `autos_patente` int DEFAULT NULL,
  `Chofer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cliente_id` (`cliente_id`),
  KEY `autos_patente` (`autos_patente`),
  KEY `Chofer_id` (`Chofer_id`),
  CONSTRAINT `viaje_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  CONSTRAINT `viaje_ibfk_2` FOREIGN KEY (`autos_patente`) REFERENCES `autos` (`Patente`),
  CONSTRAINT `viaje_ibfk_3` FOREIGN KEY (`Chofer_id`) REFERENCES `chofer` (`id`),
  CONSTRAINT `viaje_chk_1` CHECK ((`costo` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viaje`
--

LOCK TABLES `viaje` WRITE;
/*!40000 ALTER TABLE `viaje` DISABLE KEYS */;
INSERT INTO `viaje` VALUES (1,'2023-10-25','Ciudad A','2024-06-25 08:00:00',100,'Calle Principal 123',2002,2424,2002),(2,'2023-10-20','Ciudad B','2024-06-26 10:30:00',120,'Avenida Central 456',20202,244,2004),(3,'2023-10-20','Ciudad C','2024-06-27 12:15:00',110,'Plaza Mayor 789',20202,224,2004),(4,'2024-06-28','Ciudad D','2024-06-28 14:00:00',150,'Calle Secundaria 321',23002,2442,2008),(5,'2024-06-29','Ciudad E','2024-06-29 16:45:00',130,'Avenida Principal 654',21002,24242,2010),(6,'2024-07-01','Ciudad F','2024-07-01 09:30:00',140,'Calle Peatonal 987',2002,2424,2002),(7,'2024-07-02','Ciudad G','2024-07-02 11:00:00',115,'Bulevar Central 741',20202,244,2004),(8,'2024-07-03','Ciudad H','2024-07-03 13:45:00',125,'Avenida Principal 852',20402,224,2006),(9,'2024-07-04','Ciudad I','2024-07-04 15:30:00',135,'Plaza Central 963',23002,2442,2008),(10,'2024-07-05','Ciudad J','2024-07-05 17:15:00',145,'Calle Principal 147',21002,24242,2010);
/*!40000 ALTER TABLE `viaje` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-25 16:15:10
