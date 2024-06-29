-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: shop
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
-- Current Database: `shop`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `shop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `shop`;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cpf` char(11) NOT NULL,
  `endereço` varchar(150) NOT NULL,
  `status` enum('PJ','PF') NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `id_cliente` (`id_cliente`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `cliente_deletado_trigger` BEFORE DELETE ON `cliente` FOR EACH ROW INSERT INTO clientes_deletados VALUES (OLD.id_cliente, OLD.nome, OLD.status) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `clientes_deletados`
--

DROP TABLE IF EXISTS `clientes_deletados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes_deletados` (
  `id_cliente` int DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `status` enum('PJ','PF') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrega`
--

DROP TABLE IF EXISTS `entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrega` (
  `codigo_rastreio` int NOT NULL,
  `status` enum('A caminho...','Partindo para entrega','Chegou') NOT NULL DEFAULT 'Partindo para entrega',
  PRIMARY KEY (`codigo_rastreio`),
  UNIQUE KEY `codigo_rastreio` (`codigo_rastreio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque` (
  `id_produto` int NOT NULL,
  `categoria` enum('Eletrônicos','Brinquedos','Video Game','Livros','Filmes','Utensílios Domésticos','Ferramentas','Outros') NOT NULL,
  `quantidade_produto` int NOT NULL DEFAULT '1',
  UNIQUE KEY `id_produto` (`id_produto`),
  CONSTRAINT `fk_produto_estoque` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `id_fornecedor` int NOT NULL,
  `razao_social` varchar(150) NOT NULL,
  `cnpj` char(14) NOT NULL,
  `contato` varchar(100) NOT NULL,
  PRIMARY KEY (`id_fornecedor`),
  UNIQUE KEY `id_fornecedor` (`id_fornecedor`),
  UNIQUE KEY `razao_social` (`razao_social`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id_pedido` int NOT NULL,
  `id_cliente_do_pedido` int NOT NULL,
  `status` enum('Concluído!','Cancelado','Em processamento...') NOT NULL,
  `entrega_codigo_rastreio` int NOT NULL,
  `formas_pagamento` varchar(100) NOT NULL,
  PRIMARY KEY (`id_pedido`),
  UNIQUE KEY `id_pedido` (`id_pedido`),
  UNIQUE KEY `id_cliente_do_pedido` (`id_cliente_do_pedido`),
  UNIQUE KEY `entrega_codigo_rastreio` (`entrega_codigo_rastreio`),
  CONSTRAINT `foreign_cliente_pedido` FOREIGN KEY (`id_cliente_do_pedido`) REFERENCES `cliente` (`id_cliente`) ON DELETE CASCADE,
  CONSTRAINT `foreign_pedido_entrega` FOREIGN KEY (`entrega_codigo_rastreio`) REFERENCES `entrega` (`codigo_rastreio`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `id_produto` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `classificacao` enum('Livre para todos os públicos','Idade Superior ou igual a 14 anos','Idade igual ou superior a 16 anos','Idade igual ou superior a 18 anos') NOT NULL,
  `categoria` enum('Eletrônicos','Brinquedos','Video Game','Livros','Filmes','Utensílios Domésticos','Ferramentas','Outros') NOT NULL,
  `valor` float NOT NULL,
  `avaliacao` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_produto`),
  UNIQUE KEY `id_produto` (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=990 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `garantindo_que_nao_hajam_produtos_com_preco_nulo` BEFORE INSERT ON `produto` FOR EACH ROW BEGIN
		IF NEW.valor = 0.0 THEN
			SET NEW.valor = 100.0;
		END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `produtos_do_fornecedor`
--

DROP TABLE IF EXISTS `produtos_do_fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos_do_fornecedor` (
  `id_produto` int NOT NULL,
  `id_fornecedor` int NOT NULL,
  `quantidade_produtos` int NOT NULL,
  `disponibilidade` enum('Disponível','Indisponível') NOT NULL DEFAULT 'Indisponível',
  PRIMARY KEY (`id_produto`,`id_fornecedor`),
  UNIQUE KEY `id_produto` (`id_produto`),
  KEY `fk_produto_fornecedor` (`id_fornecedor`),
  CONSTRAINT `fk_fornecedor_produto` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_produto_fornecedor` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id_fornecedor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `produtos_do_pedido`
--

DROP TABLE IF EXISTS `produtos_do_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos_do_pedido` (
  `id_produto` int NOT NULL,
  `id_pedido` int NOT NULL,
  `quantidade_produtos` int NOT NULL,
  `disponibilidade` enum('Disponível','Indisponível') NOT NULL DEFAULT 'Disponível',
  PRIMARY KEY (`id_produto`,`id_pedido`),
  UNIQUE KEY `id_produto` (`id_produto`),
  UNIQUE KEY `id_pedido` (`id_pedido`),
  CONSTRAINT `fk_pedido_produto` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_produto_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `produtos_do_vendedor`
--

DROP TABLE IF EXISTS `produtos_do_vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos_do_vendedor` (
  `id_produto` int NOT NULL,
  `id_vendedor` int NOT NULL AUTO_INCREMENT,
  `quantidade_produtos` int NOT NULL,
  PRIMARY KEY (`id_produto`,`id_vendedor`),
  UNIQUE KEY `id_produto` (`id_produto`),
  KEY `fk_produto_vendedor` (`id_vendedor`),
  CONSTRAINT `fk_produto_vendedor` FOREIGN KEY (`id_vendedor`) REFERENCES `vendedor` (`id_vendedor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_vendedor_produto` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=312 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedor` (
  `id_vendedor` int NOT NULL,
  `cnpj` char(14) NOT NULL,
  `cpf` char(11) NOT NULL,
  `razao_social` varchar(150) NOT NULL,
  `contato` varchar(100) NOT NULL,
  `localizacao` varchar(50) NOT NULL,
  PRIMARY KEY (`id_vendedor`),
  UNIQUE KEY `cpf` (`cpf`),
  UNIQUE KEY `razao_social` (`razao_social`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-01 12:11:05
