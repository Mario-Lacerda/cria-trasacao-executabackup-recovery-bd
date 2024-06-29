-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: oficina
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Current Database: `oficina`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `oficina` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `oficina`;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `cliente_id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `veiculo` bigint NOT NULL,
  PRIMARY KEY (`cliente_id`),
  UNIQUE KEY `veiculo` (`veiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Alberto Pepperoni',344),(2,'Augusto',345),(3,'Carlos Alberto Melo',243),(4,'Marcelo Castro',133),(5,'Jadilson',255);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mecânico`
--

DROP TABLE IF EXISTS `mecânico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mecânico` (
  `código` bigint NOT NULL,
  `nome` varchar(100) NOT NULL,
  `endereço` varchar(150) NOT NULL,
  `especialidade` varchar(50) NOT NULL,
  PRIMARY KEY (`código`),
  UNIQUE KEY `código` (`código`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mecânico`
--

LOCK TABLES `mecânico` WRITE;
/*!40000 ALTER TABLE `mecânico` DISABLE KEYS */;
INSERT INTO `mecânico` VALUES (3344,'João Melo De Castro','Rua H22','Eletricidade'),(4331,'Breno Melo De Castro','Rua Colina Esverdeada','Carroceria'),(5112,'Carlos Boa Vista','Rua Azul Marinho','Carroceria'),(5677,'Paulo João Da Costa','Rua Das Margaridas Douradas','Motor'),(5678,'Onório Figueiredo','Rua Rosa','Motor'),(5887,'Enzo Melo De Castro','Rua Boa vista','Avaliação de Pneus');
/*!40000 ALTER TABLE `mecânico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `os`
--

DROP TABLE IF EXISTS `os`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `os` (
  `os_num` int NOT NULL,
  `data_emissao` date NOT NULL,
  `os_status` varchar(100) NOT NULL,
  `mao_de_obra` varchar(50) NOT NULL,
  `preco_total` float NOT NULL,
  `data_entrega` date NOT NULL,
  PRIMARY KEY (`os_num`),
  UNIQUE KEY `os_num` (`os_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `os`
--

LOCK TABLES `os` WRITE;
/*!40000 ALTER TABLE `os` DISABLE KEYS */;
INSERT INTO `os` VALUES (331416,'2024-02-01','Problema no Motor','Motor',50,'2023-11-09'),(445661,'2024-02-01','Carroceria amassada','Carroceria',160,'2023-11-12'),(555513,'2024-02-01','Problema no Pneu','Avaliação de Pneus',20,'2023-10-23'),(556321,'2024-02-01','Problema na Bateria','Bateria',33,'2023-11-05'),(667001,'2024-02-01','Problema no Motor','Motor',50,'2023-10-22'),(889551,'2024-02-01','Para-Choque danificado','Carroceria',30,'2023-12-10');
/*!40000 ALTER TABLE `os` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peça`
--

DROP TABLE IF EXISTS `peça`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `peça` (
  `nome` varchar(100) NOT NULL,
  `preco` float NOT NULL,
  PRIMARY KEY (`nome`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peça`
--

LOCK TABLES `peça` WRITE;
/*!40000 ALTER TABLE `peça` DISABLE KEYS */;
INSERT INTO `peça` VALUES ('Bateria',33),('Capô',50),('Engrenagem',16),('Motor',50),('Para-Choque',30),('Parabrisa',64),('Parafuso',20),('Porta-Malas',80),('Roda',35);
/*!40000 ALTER TABLE `peça` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veículo`
--

DROP TABLE IF EXISTS `veículo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veículo` (
  `cliente_id` int NOT NULL,
  `veiculo_id` bigint NOT NULL,
  PRIMARY KEY (`veiculo_id`),
  UNIQUE KEY `veiculo_id` (`veiculo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veículo`
--

LOCK TABLES `veículo` WRITE;
/*!40000 ALTER TABLE `veículo` DISABLE KEYS */;
INSERT INTO `veículo` VALUES (4,133),(3,243),(5,255),(1,336),(1,344),(2,345);
/*!40000 ALTER TABLE `veículo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-01 13:13:49
