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
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'José Campos Nascimento','10745367289','Casa 13, Rua Das Margaridas Rosadas, Rio Grande Do Sul','PJ'),(2,'José Melo Bispo','78523418496','Casa 01, Rua Dos Coqueiros, São Paulo','PJ'),(3,'Maria Rosada Costa','56425163895','Casa 78, Rua Chuvosa, Minas Gerais','PF');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;
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
-- Dumping data for table `clientes_deletados`
--

LOCK TABLES `clientes_deletados` WRITE;
/*!40000 ALTER TABLE `clientes_deletados` DISABLE KEYS */;
INSERT INTO `clientes_deletados` VALUES (6,'Eduardo Meireles Alcântara','PF'),(7,'Eduardo Meireles Alcântara','PF'),(8,'Vendedor','PJ');
/*!40000 ALTER TABLE `clientes_deletados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `entrega`
--

LOCK TABLES `entrega` WRITE;
/*!40000 ALTER TABLE `entrega` DISABLE KEYS */;
INSERT INTO `entrega` VALUES (141,'A caminho...'),(155,'A caminho...'),(341,'A caminho...'),(899,'A caminho...');
/*!40000 ALTER TABLE `entrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (333,'Video Game',53),(380,'Utensílios Domésticos',20),(445,'Eletrônicos',20),(456,'Livros',40),(489,'Filmes',30),(552,'Eletrônicos',20),(677,'Eletrônicos',50),(776,'Outros',18),(908,'Brinquedos',30);
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (12,'Eletrônicos e Tecnologia Costa LTDA','55613246482962','71 97889-6577'),(15,'Brinquedos Sorriso LTDA','82536728415739','71 96667-8991'),(21,'Filmes Blockbuster S.A','65271435627254','71 96531-3341');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (4441,1,'Em processamento...',141,'Crédito'),(4442,2,'Em processamento...',155,'Débito, Crédito'),(4563,3,'Em processamento...',899,'Dédito');
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (333,'Video Game PRO','Livre para todos os públicos','Video Game',3000,3.5),(380,'Pratos Floridos','Livre para todos os públicos','Utensílios Domésticos',80,3.2),(445,'Televisão Modelo 445','Livre para todos os públicos','Eletrônicos',1500,3),(456,'O Iluminado','Idade Superior ou igual a 14 anos','Livros',50,4.9),(489,'O Cavaleiro','Idade igual ou superior a 18 anos','Filmes',1200,4.8),(551,'Cujo','Idade Superior ou igual a 14 anos','Livros',88,3.3),(552,'Monitor LCD Incrível!!','Livre para todos os públicos','Eletrônicos',3000,1.5),(666,'Mesa de jantar moderna e arrojada','Livre para todos os públicos','Utensílios Domésticos',100,0),(677,'Notebook PRO','Livre para todos os públicos','Eletrônicos',2000,3.3),(776,'Pintura do pôr do sol','Livre para todos os públicos','Outros',37,4.5),(908,'Bola de Borracha','Livre para todos os públicos','Brinquedos',100,2.7),(987,'It','Idade Superior ou igual a 14 anos','Livros',60,3.9),(988,'Carrinho de brinquedo','Livre para todos os públicos','Brinquedos',0,0),(989,'qlq','Livre para todos os públicos','Brinquedos',100,0);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;
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
-- Dumping data for table `produtos_do_fornecedor`
--

LOCK TABLES `produtos_do_fornecedor` WRITE;
/*!40000 ALTER TABLE `produtos_do_fornecedor` DISABLE KEYS */;
INSERT INTO `produtos_do_fornecedor` VALUES (333,12,53,'Disponível'),(445,12,20,'Disponível'),(489,21,30,'Disponível'),(552,12,20,'Disponível'),(677,12,50,'Disponível'),(908,15,30,'Disponível');
/*!40000 ALTER TABLE `produtos_do_fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `produtos_do_pedido`
--

LOCK TABLES `produtos_do_pedido` WRITE;
/*!40000 ALTER TABLE `produtos_do_pedido` DISABLE KEYS */;
INSERT INTO `produtos_do_pedido` VALUES (333,4563,2,'Disponível'),(489,4442,1,'Disponível'),(677,4441,5,'Disponível');
/*!40000 ALTER TABLE `produtos_do_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `produtos_do_vendedor`
--

LOCK TABLES `produtos_do_vendedor` WRITE;
/*!40000 ALTER TABLE `produtos_do_vendedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `produtos_do_vendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `vendedor`
--

LOCK TABLES `vendedor` WRITE;
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
INSERT INTO `vendedor` VALUES (123,'67435953631074','45365142753','Livraria Santana LTDA','8866-7831','Rio De Janeiro'),(221,'45134289635014','55419045672','Cerâmica Bela Vista S.A','6679-9853','São Paulo'),(311,'13267306524819','67241986529','Artes Plásticas e Esculturas S.A','5567-6671','Bahia');
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-01 12:10:33
