CREATE DATABASE  IF NOT EXISTS `entre_lp2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `entre_lp2`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: entre_lp2
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `tb_administrador`
--

DROP TABLE IF EXISTS `tb_administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_administrador` (
  `cod_adm` char(5) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `Direccion` varchar(50) DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `sexo` varchar(50) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `cod_ciu` char(5) DEFAULT NULL,
  PRIMARY KEY (`cod_adm`),
  KEY `fk_tbA` (`cod_ciu`),
  CONSTRAINT `fk_tbA` FOREIGN KEY (`cod_ciu`) REFERENCES `tb_ciudad` (`cod_ciu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_administrador`
--

LOCK TABLES `tb_administrador` WRITE;
/*!40000 ALTER TABLE `tb_administrador` DISABLE KEYS */;
INSERT INTO `tb_administrador` VALUES ('AD001','cristian cla','Orizano Huyhua','los pinos',984561231,'Masculino','2021-10-21','CI001'),('AD002','cristian cla','Orizano Huyhua','Orizano Huyhua',98456123,'Masculino','2022-07-27','CI001'),('AD003','cristian','Orizano huyhua','los pinos',98456123,'Masculino','2022-07-29','CI001'),('AD004','Lucas','Gamer','avenida pinos',98456123,'Masculino','2022-07-29','CI004'),('AD005','Romam','Reingns','chicago',98456123,'Masculino','2022-07-27','CI003'),('AD006','cristian','Orizano momo','Orizano momo',98456123,'Femenino','2022-07-29','CI002'),('AD007','Debby','Ryan','time square',98456123,'Femenino','2022-07-27','CI004'),('AD008','cristian cla','Orizano Huyhua','calle el strem',98456123,'Masculino','2022-07-27','CI002'),('AD009','cristian cla','Orizano Huyhua','Orizano Huyhua',98456123,'Masculino','2022-07-27','CI001'),('AD010','momo','Orizano Huyhua','Orizano Huyhua',98456123,'Otro','2022-07-27','CI004'),('AD011','Emma','Roos','avenida pinos',98456123,'Femenino','2022-07-08','CI004'),('AD012','Emma eva','Roos','Roos',98456123,'Seleccione','2022-07-08','CI004'),('AD013','Emma','Roos','Roos',98456123,'Masculino','2022-07-08','CI004'),('AD014','Momo','Roos','Roos',98456123,'Masculino','2022-07-08','CI002'),('AD015','Nini','Salazar','los angeles',98456132,'Femenino','2022-07-13','CI004'),('AD016','Lucas','Gamer','portland',98456123,'Masculino','2022-07-29','CI002'),('AD017','Peyton','List','avenida pinos',978465213,'Femenino','2022-07-06','CI001'),('AD018','cristian cyber','Orizano','los angeles',9123486,'Masculino','2022-08-16','CI002'),('AD019','cristian','Orizano momo','los pinos',98456123,'Masculino','2020-08-16','CI001'),('AD020','cristian cla','Orizano Huyhua','los pinos',98456123,'Masculino','2021-10-21','CI001'),('AD021','cristian cla','Orizano Huyhua','los pinos',98456123,'Masculino','2021-10-21','CI001'),('AD022','cristian cla','Orizano Huyhua','los pinos',98456123,'Masculino','2021-10-21','CI001'),('AD023','cristian cla','Orizano Huyhua','los pinos',98456123,'Masculino','2021-10-21','CI001'),('AD024','cris','oriza','sdfsd',789456,'Masculino','2023-01-19','CI001'),('AD025','khj','dfg','hjñ',789456123,'Femenino','2023-01-14','CI002'),('AD026','khj','dfg','hjñ',789456123,'Femenino','2023-01-14','CI002'),('AD027','khj','dfg','hjñ',789456123,'Femenino','2023-01-14','CI002'),('AD028','crf','dfdf','dfgd',123456789,'Masculino','2023-01-13','CI001'),('AD029','Olivia','Orizano huyhua','los angeles',123456789,'Femenino','2023-01-05','CI001'),('AD030','OLivia','Orizano huyhua','los angeles',123456789,'Masculino','2023-01-06','CI001'),('AD031','Taylor','Alis','fgh',123456798,'Masculino','2023-01-06','CI002'),('AD032','cristian','Orizano momo','Orizano momo',984561231,'Femenino','2022-07-29','CI002'),('AD033','cristian cyber','Orizano huyhua','los angeles',134567897,'Masculino','2023-01-30','CI001'),('AD034','cdds','sdds','sdsd',123456789,'Masculino','2023-01-17','CI002'),('AD035','mabel','sdfs','sdsd',123456789,'Masculino','2023-01-11','CI003');
/*!40000 ALTER TABLE `tb_administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cab_boleta`
--

DROP TABLE IF EXISTS `tb_cab_boleta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_cab_boleta` (
  `num_bol` char(5) NOT NULL,
  `fch_emi` date DEFAULT NULL,
  `cod_adm` char(5) NOT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`num_bol`),
  KEY `cod_adm` (`cod_adm`),
  CONSTRAINT `tb_cab_boleta_ibfk_1` FOREIGN KEY (`cod_adm`) REFERENCES `tb_administrador` (`cod_adm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cab_boleta`
--

LOCK TABLES `tb_cab_boleta` WRITE;
/*!40000 ALTER TABLE `tb_cab_boleta` DISABLE KEYS */;
INSERT INTO `tb_cab_boleta` VALUES ('B0001','2022-08-05','AD001',1800.00),('B0010','2022-08-05','AD001',8400.00),('B0011','2022-08-05','AD001',2900.00),('B0012','2022-08-05','AD001',2605.50),('B0013','2022-08-05','AD001',4500.00),('B0014','2022-08-06','AD001',12600.00),('B0015','2022-08-06','AD001',3316.50),('B0016','2022-08-06','AD001',12211.00),('B0017','2022-08-06','AD001',82800.00),('B0018','2023-01-12','AD001',1600.00),('B0019','2023-01-21','AD001',3100.00);
/*!40000 ALTER TABLE `tb_cab_boleta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_categoria`
--

DROP TABLE IF EXISTS `tb_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_categoria` (
  `ide_cat` int NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ide_cat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_categoria`
--

LOCK TABLES `tb_categoria` WRITE;
/*!40000 ALTER TABLE `tb_categoria` DISABLE KEYS */;
INSERT INTO `tb_categoria` VALUES (1,'Cocina'),(2,'Limpieza'),(3,'Refrigeracion'),(4,'Entretenimiento');
/*!40000 ALTER TABLE `tb_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_ciudad`
--

DROP TABLE IF EXISTS `tb_ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_ciudad` (
  `cod_ciu` char(5) NOT NULL,
  `nom_ciu` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cod_ciu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ciudad`
--

LOCK TABLES `tb_ciudad` WRITE;
/*!40000 ALTER TABLE `tb_ciudad` DISABLE KEYS */;
INSERT INTO `tb_ciudad` VALUES ('CI001','Wisconsi'),('CI002','Denver'),('CI003','California'),('CI004','Viugglu');
/*!40000 ALTER TABLE `tb_ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_det_boleta`
--

DROP TABLE IF EXISTS `tb_det_boleta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_det_boleta` (
  `num_bol` char(5) NOT NULL,
  `codigo_elc` int NOT NULL,
  `cantidad` int DEFAULT NULL,
  `importe` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`num_bol`,`codigo_elc`),
  KEY `codigo_elc` (`codigo_elc`),
  CONSTRAINT `tb_det_boleta_ibfk_1` FOREIGN KEY (`num_bol`) REFERENCES `tb_cab_boleta` (`num_bol`),
  CONSTRAINT `tb_det_boleta_ibfk_2` FOREIGN KEY (`codigo_elc`) REFERENCES `tb_electrodomesticos` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_det_boleta`
--

LOCK TABLES `tb_det_boleta` WRITE;
/*!40000 ALTER TABLE `tb_det_boleta` DISABLE KEYS */;
INSERT INTO `tb_det_boleta` VALUES ('B0001',10003,1,900.00),('B0001',10010,1,900.00),('B0010',10002,5,5000.00),('B0010',10011,1,700.00),('B0010',10015,3,2700.00),('B0011',10002,1,1000.00),('B0011',10011,1,700.00),('B0011',10012,3,1200.00),('B0012',10009,1,105.50),('B0012',10012,4,1600.00),('B0012',10015,1,900.00),('B0013',10014,3,2700.00),('B0013',10015,2,1800.00),('B0014',10003,7,6300.00),('B0014',10015,7,6300.00),('B0015',10003,1,900.00),('B0015',10009,3,316.50),('B0015',10011,3,2100.00),('B0016',10001,3,4500.00),('B0016',10002,3,3000.00),('B0016',10009,2,211.00),('B0016',10014,5,4500.00),('B0017',10003,92,82800.00),('B0018',10010,1,900.00),('B0018',10011,1,700.00),('B0019',10012,1,400.00),('B0019',10015,3,2700.00);
/*!40000 ALTER TABLE `tb_det_boleta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_electrodomesticos`
--

DROP TABLE IF EXISTS `tb_electrodomesticos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_electrodomesticos` (
  `codigo` int NOT NULL,
  `ide_cat` int DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `Marca` varchar(50) DEFAULT NULL,
  `estado` int DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_cat` (`ide_cat`),
  KEY `fk_est` (`estado`),
  CONSTRAINT `fk_cat` FOREIGN KEY (`ide_cat`) REFERENCES `tb_categoria` (`ide_cat`),
  CONSTRAINT `fk_est` FOREIGN KEY (`estado`) REFERENCES `tb_estado` (`estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_electrodomesticos`
--

LOCK TABLES `tb_electrodomesticos` WRITE;
/*!40000 ALTER TABLE `tb_electrodomesticos` DISABLE KEYS */;
INSERT INTO `tb_electrodomesticos` VALUES (10001,2,'Aspiradora smart',97,1500.00,'Xiaomi',1),(10002,2,'Purificador de aire',97,1000.00,'Home',1),(10003,1,'Air fryer',100,900.00,'Oster',1),(10004,1,'Lavadora',1,1.02,'LG',0),(10005,4,'Lavadora',13,25.16,'LG',0),(10006,2,'Lavadora',100,1.05,'LG',1),(10007,2,'Lavadora',100,1.05,'LG',1),(10008,2,'c',1,1.00,'LG',0),(10009,4,'Equipo de sonido',95,105.50,'LG',1),(10010,1,'Microondas',99,900.00,'Whirpool',1),(10011,1,'Licuadora',96,700.00,'Oster',1),(10012,1,'Olla arrocera',99,400.00,'Oster',1),(10013,1,'Hornilla doble',100,600.00,'Flama',1),(10014,3,'Refrigeradora 2021',92,900.00,'Samsung',1),(10015,1,'Tostadora',88,900.00,'Kitchen Aid',1),(10016,4,'televisor',100,100.60,'LG',1),(10017,4,'Play Station',100,1500.50,'Sonic',1),(10018,2,'Aspiradora smart',97,1500.00,'Xiaomi',1),(10019,2,'Aspiradora smart',97,1500.00,'Xiaomi',1);
/*!40000 ALTER TABLE `tb_electrodomesticos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_empleado`
--

DROP TABLE IF EXISTS `tb_empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_empleado` (
  `codi_empl` int NOT NULL AUTO_INCREMENT,
  `nom_em` varchar(50) DEFAULT NULL,
  `apell_em` varchar(50) DEFAULT NULL,
  `num_hijos` int DEFAULT NULL,
  `sueldo` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`codi_empl`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_empleado`
--

LOCK TABLES `tb_empleado` WRITE;
/*!40000 ALTER TABLE `tb_empleado` DISABLE KEYS */;
INSERT INTO `tb_empleado` VALUES (1,'Emma evangely','jons',2,1.03),(3,'cristian cladimir','Orizano huyhua',2,4.00),(7,'Nini robr','Salazar',8,8.00),(8,'olivia ','rodrigo',7,5.00),(9,'cece','jons',2,32.00),(10,'Momo','orizano',5,100.45),(11,'Debby debora','Ryan',5,45.00),(12,'Debby','Ryan',5,45.00),(16,'Emma','swicht',7,500.00),(18,'mugi','asaf',6,1.30),(19,'anaban','asaf',6,1.38),(20,'cody','Mart',7,500.90),(21,'Dominik','orizano',5,100.45),(22,'Dominik','salas',5,100.45),(23,'Emma','jons',7,1.08),(34,'cristian ','Drillbi',2,1.01),(35,'cristian ','Orizano huyhua',6,1.05),(36,'cristian ','Orizano huyhua',6,1.05),(37,'cristian ','Orizano huyhua',6,1.05),(38,'cristian ','Orizano huyhua',6,1.05),(41,'Mordekay','Tonson',2,500.80),(42,'Emma evangely','Ross',3,1050.90),(43,'cece','jons',2,32.00),(44,'cristian cladimir','Orizano huyhua',2,1.01),(45,'cristian cladimir','Orizano huyhua',2,1.01),(46,'olivia nini','rodrigo so',7,5.00),(48,'crsitian','orizano',5,25.00),(49,'sony ent','munro',5,1.08);
/*!40000 ALTER TABLE `tb_empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_estado`
--

DROP TABLE IF EXISTS `tb_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_estado` (
  `estado` int NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_estado`
--

LOCK TABLES `tb_estado` WRITE;
/*!40000 ALTER TABLE `tb_estado` DISABLE KEYS */;
INSERT INTO `tb_estado` VALUES (0,'eliminado'),(1,'Activo');
/*!40000 ALTER TABLE `tb_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_usuarios`
--

DROP TABLE IF EXISTS `tb_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_usuarios` (
  `cod_usu` int NOT NULL AUTO_INCREMENT,
  `cod_adm` char(5) DEFAULT NULL,
  `login` varchar(50) DEFAULT NULL,
  `contra` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cod_usu`),
  KEY `fk_tbU` (`cod_adm`),
  CONSTRAINT `fk_tbU` FOREIGN KEY (`cod_adm`) REFERENCES `tb_administrador` (`cod_adm`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_usuarios`
--

LOCK TABLES `tb_usuarios` WRITE;
/*!40000 ALTER TABLE `tb_usuarios` DISABLE KEYS */;
INSERT INTO `tb_usuarios` VALUES (1,'AD001','cristian57@gamil.com','cristian123');
/*!40000 ALTER TABLE `tb_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'entre_lp2'
--

--
-- Dumping routines for database 'entre_lp2'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-21 17:45:28
