-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: banco_alimentos
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `beneficiarios`
--

DROP TABLE IF EXISTS `beneficiarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `beneficiarios` (
  `id_beneficiario` varchar(15) NOT NULL,
  `nombre_completo` varchar(25) NOT NULL,
  `tipo` varchar(12) NOT NULL,
  `documento` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_beneficiario`),
  UNIQUE KEY `documento` (`documento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beneficiarios`
--

LOCK TABLES `beneficiarios` WRITE;
/*!40000 ALTER TABLE `beneficiarios` DISABLE KEYS */;
INSERT INTO `beneficiarios` VALUES ('B001','Fundacion Esperanza','Fundacion','1192000001'),('B002','Comedor San Jose','Comedor','1192000002'),('B003','Casa Hogar Luz','Fundacion','1192000003'),('B004','Centro Solidario','Institucion','1192000004'),('B005','Comedor La Paz','Comedor','1192000005');
/*!40000 ALTER TABLE `beneficiarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id_categoria` varchar(15) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`id_categoria`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES ('C005','Aceites'),('C004','Cereales'),('C002','Enlatados'),('C001','Granos'),('C003','Lacteos');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_donacion`
--

DROP TABLE IF EXISTS `detalle_donacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_donacion` (
  `id_detalle_donacion` varchar(15) NOT NULL,
  `id_donacion` varchar(15) NOT NULL,
  `id_producto` varchar(15) NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_detalle_donacion`),
  KEY `id_donacion` (`id_donacion`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `detalle_donacion_ibfk_1` FOREIGN KEY (`id_donacion`) REFERENCES `donaciones` (`id_donacion`),
  CONSTRAINT `detalle_donacion_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_donacion`
--

LOCK TABLES `detalle_donacion` WRITE;
/*!40000 ALTER TABLE `detalle_donacion` DISABLE KEYS */;
INSERT INTO `detalle_donacion` VALUES ('DD001','DN001','P001',50.00),('DD002','DN002','P002',30.00),('DD003','DN003','P003',25.00),('DD004','DN004','P005',20.00),('DD005','DN005','P001',40.00);
/*!40000 ALTER TABLE `detalle_donacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_entrega`
--

DROP TABLE IF EXISTS `detalle_entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_entrega` (
  `id_detalle_entrega` varchar(15) NOT NULL,
  `id_entrega` varchar(15) NOT NULL,
  `id_producto` varchar(15) NOT NULL,
  `cantidad_entregada` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_detalle_entrega`),
  KEY `id_entrega` (`id_entrega`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `detalle_entrega_ibfk_1` FOREIGN KEY (`id_entrega`) REFERENCES `entregas` (`id_entrega`),
  CONSTRAINT `detalle_entrega_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_entrega`
--

LOCK TABLES `detalle_entrega` WRITE;
/*!40000 ALTER TABLE `detalle_entrega` DISABLE KEYS */;
INSERT INTO `detalle_entrega` VALUES ('DE001','E001','P001',10.00),('DE002','E001','P002',5.00),('DE003','E002','P001',15.00),('DE004','E002','P003',8.00),('DE005','E003','P001',0.00),('DE006','E004','P001',20.00),('DE007','E004','P005',6.00),('DE008','E005','P001',5.00),('DE009','E005','P002',3.00);
/*!40000 ALTER TABLE `detalle_entrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_solicitud`
--

DROP TABLE IF EXISTS `detalle_solicitud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_solicitud` (
  `id_detalle_solicitud` varchar(15) NOT NULL,
  `id_solicitud` varchar(15) NOT NULL,
  `id_producto` varchar(15) NOT NULL,
  `cantidad_solicitada` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_detalle_solicitud`),
  KEY `id_solicitud` (`id_solicitud`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `detalle_solicitud_ibfk_1` FOREIGN KEY (`id_solicitud`) REFERENCES `solicitudes` (`id_solicitud`),
  CONSTRAINT `detalle_solicitud_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_solicitud`
--

LOCK TABLES `detalle_solicitud` WRITE;
/*!40000 ALTER TABLE `detalle_solicitud` DISABLE KEYS */;
INSERT INTO `detalle_solicitud` VALUES ('DS001','S001','P001',10.00),('DS002','S001','P002',5.00),('DS003','S002','P001',15.00),('DS004','S002','P003',8.00),('DS005','S003','P001',12.00),('DS006','S003','P004',4.00),('DS007','S004','P001',20.00),('DS008','S004','P005',6.00),('DS009','S005','P001',10.00),('DS010','S005','P002',3.00);
/*!40000 ALTER TABLE `detalle_solicitud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donaciones`
--

DROP TABLE IF EXISTS `donaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donaciones` (
  `id_donacion` varchar(15) NOT NULL,
  `id_donante` varchar(15) NOT NULL,
  `fecha_donacion` date NOT NULL,
  `estado` varchar(15) NOT NULL,
  PRIMARY KEY (`id_donacion`),
  KEY `id_donante` (`id_donante`),
  CONSTRAINT `donaciones_ibfk_1` FOREIGN KEY (`id_donante`) REFERENCES `donantes` (`id_donante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donaciones`
--

LOCK TABLES `donaciones` WRITE;
/*!40000 ALTER TABLE `donaciones` DISABLE KEYS */;
INSERT INTO `donaciones` VALUES ('DN001','D001','2026-10-02','Recibida'),('DN002','D002','2026-10-06','Recibida'),('DN003','D003','2026-10-11','Verificada'),('DN004','D004','2026-10-16','Recibida'),('DN005','D005','2026-10-21','Verificada');
/*!40000 ALTER TABLE `donaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donantes`
--

DROP TABLE IF EXISTS `donantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donantes` (
  `id_donante` varchar(15) NOT NULL,
  `nombre_completo` varchar(25) NOT NULL,
  `tipo` varchar(12) NOT NULL,
  `documento` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_donante`),
  UNIQUE KEY `documento` (`documento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donantes`
--

LOCK TABLES `donantes` WRITE;
/*!40000 ALTER TABLE `donantes` DISABLE KEYS */;
INSERT INTO `donantes` VALUES ('D001','Ana Torres','Persona','1101000001'),('D002','Luis Castillo','Persona','1101000002'),('D003','Mercado Central','Empresa','1191000001'),('D004','Rosa Jimenez','Persona','1101000004'),('D005','Comercial Loja','Empresa','1191000005');
/*!40000 ALTER TABLE `donantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entregas`
--

DROP TABLE IF EXISTS `entregas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entregas` (
  `id_entrega` varchar(15) NOT NULL,
  `id_solicitud` varchar(15) NOT NULL,
  `fecha_entrega` date NOT NULL,
  `estado` varchar(15) NOT NULL,
  PRIMARY KEY (`id_entrega`),
  KEY `id_solicitud` (`id_solicitud`),
  CONSTRAINT `entregas_ibfk_1` FOREIGN KEY (`id_solicitud`) REFERENCES `solicitudes` (`id_solicitud`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entregas`
--

LOCK TABLES `entregas` WRITE;
/*!40000 ALTER TABLE `entregas` DISABLE KEYS */;
INSERT INTO `entregas` VALUES ('E001','S001','2026-10-04','Completada'),('E002','S002','2026-10-08','Completada'),('E003','S003','2026-10-13','Pendiente'),('E004','S004','2026-10-18','Completada'),('E005','S005','2026-10-23','Parcial');
/*!40000 ALTER TABLE `entregas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `id_inventario` varchar(15) NOT NULL,
  `fecha_actualizacion` date NOT NULL,
  PRIMARY KEY (`id_inventario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` VALUES ('I001','2026-10-01'),('I002','2026-10-05'),('I003','2026-10-10'),('I004','2026-10-15'),('I005','2026-10-20');
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` varchar(15) NOT NULL,
  `id_categoria` varchar(15) NOT NULL,
  `id_inventario` varchar(15) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `unidad_medida` varchar(20) NOT NULL,
  `cantidad_disponible` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id_producto`),
  KEY `id_categoria` (`id_categoria`),
  KEY `id_inventario` (`id_inventario`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`),
  CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`id_inventario`) REFERENCES `inventario` (`id_inventario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES ('P001','C001','I001','Arroz','Kilogramo',120.00),('P002','C002','I002','Atun enlatado','Unidad',80.00),('P003','C003','I003','Leche','Litro',45.00),('P004','C004','I004','Avena','Kilogramo',0.00),('P005','C005','I005','Aceite vegetal','Litro',60.00);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitudes`
--

DROP TABLE IF EXISTS `solicitudes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitudes` (
  `id_solicitud` varchar(15) NOT NULL,
  `id_beneficiario` varchar(15) NOT NULL,
  `fecha_solicitud` date NOT NULL,
  `estado` varchar(15) NOT NULL,
  `observaciones` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_solicitud`),
  KEY `id_beneficiario` (`id_beneficiario`),
  CONSTRAINT `solicitudes_ibfk_1` FOREIGN KEY (`id_beneficiario`) REFERENCES `beneficiarios` (`id_beneficiario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitudes`
--

LOCK TABLES `solicitudes` WRITE;
/*!40000 ALTER TABLE `solicitudes` DISABLE KEYS */;
INSERT INTO `solicitudes` VALUES ('S001','B001','2026-10-03','Aprobada','Solicitud mensual'),('S002','B002','2026-10-07','Aprobada','Atencion a familias'),('S003','B003','2026-10-12','Pendiente','Apoyo alimentario'),('S004','B004','2026-10-17','Aprobada',NULL),('S005','B005','2026-10-22','Aprobada','Entrega parcial');
/*!40000 ALTER TABLE `solicitudes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-11 16:47:02
