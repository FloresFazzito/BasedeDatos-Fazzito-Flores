-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: TP_Fazzito_Flores
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
INSERT INTO `Alojamiento` VALUES ('Avenida 012','Pensión Aurora','Aurora Bar',20,2,33445577,'Cabaña'),('Avenida 234','Albergue Juvenil','Juvenil Bar',60,4,44567788,'Departamento'),('Avenida 456','Hostal del Sol','Sun Bar',50,3,99887655,'Cabaña'),('Avenida 678','Cabañas El Bosque','Bosque Bar',40,1,22334566,'Casita'),('Avenida 890','Resort Paraíso Tropical','Paraíso Bar',200,10,55443322,'Cabaña'),('Calle 123','Hotel Plaza','Plaza Bar',100,5,11223455,'Cabaña'),('Calle 345','Apart Hotel Moderno','Moderno Bar',80,6,66779900,'Cabaña'),('Calle 567','Posada Las Rosas','Rosa Bar',25,2,99886655,'Departamento'),('Calle 789','Residencial Los Pinos','Pino Bar',30,2,55332211,'Cabaña'),('Calle 901','Hotel Mar Azul','Mar Bar',120,8,88776544,'Mansión');
/*!40000 ALTER TABLE `Alojamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cabaña`
--

DROP TABLE IF EXISTS `Cabaña`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cabaña` (
  `Cocina` varchar(45) DEFAULT NULL,
  `Parilla` varchar(45) DEFAULT NULL,
  `Garaje` varchar(45) DEFAULT NULL,
  `Alojamiento_Direccion` varchar(45) NOT NULL,
  PRIMARY KEY (`Alojamiento_Direccion`),
  CONSTRAINT `fk_Cabaña_Alojamiento1` FOREIGN KEY (`Alojamiento_Direccion`) REFERENCES `Alojamiento` (`Direccion`)
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
INSERT INTO `Clientes` VALUES (11223344,'Gutierrez Lucia','Avenida 890',665544322),(12345678,'Gomez Juan','Calle 123',1122334455),(23456789,'Perez Maria','Avenida 456',998877655),(34567890,'Rodriguez Carlos','Calle 789',554433211),(45678901,'Lopez Ana','Avenida 012',334556677),(56789012,'Martinez Laura','Calle 345',667788900),(67890123,'Garayzar Luis','Avenida 678',223344566),(78901234,'Sanchez Sofia','Calle 901',887765544),(89012345,'Diaz Pedro','Avenida 234',445566788),(90123456,'Fernandez Marta','San_Juan_1234',998877655);
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
  KEY `fk_Clientes_has_Paquete_de_viaje_Paquete_de_viaje1_idx` (`Paquete_de_viaje_id`),
  KEY `fk_Clientes_has_Paquete_de_viaje_Clientes_idx` (`Clientes_DNI`),
  CONSTRAINT `fk_Clientes_has_Paquete_de_viaje_Clientes` FOREIGN KEY (`Clientes_DNI`) REFERENCES `Clientes` (`DNI`),
  CONSTRAINT `fk_Clientes_has_Paquete_de_viaje_Paquete_de_viaje1` FOREIGN KEY (`Paquete_de_viaje_id`) REFERENCES `Paquete_de_viaje` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clientes_reservan_Paquete_de_viaje`
--

LOCK TABLES `Clientes_reservan_Paquete_de_viaje` WRITE;
/*!40000 ALTER TABLE `Clientes_reservan_Paquete_de_viaje` DISABLE KEYS */;
INSERT INTO `Clientes_reservan_Paquete_de_viaje` VALUES (11223344,10,'2017-05-01','2017-05-10',3),(12345678,9,'2017-05-06','2017-05-08',2),(23456789,8,'2017-04-03','2017-04-19',5),(34567890,7,'2024-12-03','2024-12-13',1),(45678901,6,'2024-11-12','2024-11-22',3),(56789012,5,'2024-10-20','2024-10-30',2),(67890123,4,'2024-09-05','2024-09-15',4),(78901234,3,'2024-08-10','2024-08-20',1),(89012345,2,'2024-07-15','2024-07-25',3),(90123456,1,'2024-06-01','2024-06-10',2);
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
  `Cantidad_de_excursiones` int DEFAULT NULL COMMENT '	',
  `Viaje` varchar(45) DEFAULT NULL,
  `Cantidad_de_dias` int DEFAULT NULL,
  `Cantidad_de_noches` int DEFAULT NULL,
  `Costo` int DEFAULT NULL,
  `Tipo_de_pago` varchar(45) DEFAULT NULL,
  `Lugar` varchar(45) DEFAULT NULL,
  `Alojamiento_Direccion` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Paquete_de_viaje_Alojamiento1_idx` (`Alojamiento_Direccion`),
  CONSTRAINT `fk_Paquete_de_viaje_Alojamiento1` FOREIGN KEY (`Alojamiento_Direccion`) REFERENCES `Alojamiento` (`Direccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Paquete_de_viaje`
--

LOCK TABLES `Paquete_de_viaje` WRITE;
/*!40000 ALTER TABLE `Paquete_de_viaje` DISABLE KEYS */;
INSERT INTO `Paquete_de_viaje` VALUES (1,3,'Aventura en la selva',7,6,9000,'Tarjeta de crédito','Amazonas, Perú','Avenida 012'),(2,2,'Explorando Italia',10,9,2500,'Transferencia bancaria','Roma, Italia','Avenida 234'),(3,4,'Safari en África',14,13,3000,'Efectivo','Kenia','Avenida 456'),(4,1,'Crucero por el Caribe',5,4,6500,'PayPal','Caribe','Avenida 678'),(5,3,'Ruta del vino en Francia',7,6,1800,'Tarjeta de débito','Burdeos, Francia','Avenida 890'),(6,2,'Aventura en el desierto',8,7,2200,'Transferencia bancaria','Dubai, Emiratos Árabes Unidos','Calle 123'),(7,3,'Recorrido cultural por Japón',12,11,2800,'Efectivo','Tokio, Japón','Calle 345'),(8,1,'Viaje de lujo por Europa',15,14,10000,'Tarjeta de crédito','Varios destinos en Europa','Calle 567'),(9,2,'Aventura en la Patagonia',7,8,2700,'PayPal','Bariloche','Calle 789'),(10,4,'Exploración en el Himalaya',20,19,4000,'Transferencia bancaria','Nepal','Calle 901');
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

-- Dump completed on 2024-05-21 17:02:29
