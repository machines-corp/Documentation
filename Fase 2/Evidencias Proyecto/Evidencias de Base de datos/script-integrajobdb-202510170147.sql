-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: integrajobdb
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `acomodos_accesibilidad`
--

DROP TABLE IF EXISTS `acomodos_accesibilidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acomodos_accesibilidad` (
  `id_acomodo` int NOT NULL AUTO_INCREMENT,
  `detalle` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `id_oferta` int NOT NULL,
  `id_taxonomia` int DEFAULT NULL,
  PRIMARY KEY (`id_acomodo`),
  KEY `FKr9xg8xiaeulx33mawcb68n5v9` (`id_oferta`),
  KEY `FK65xtkys9l6fdyppp70leuhd3t` (`id_taxonomia`),
  CONSTRAINT `FK65xtkys9l6fdyppp70leuhd3t` FOREIGN KEY (`id_taxonomia`) REFERENCES `taxonomia` (`id_taxonomia`),
  CONSTRAINT `FKr9xg8xiaeulx33mawcb68n5v9` FOREIGN KEY (`id_oferta`) REFERENCES `oferta_job` (`id_oferta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agrupacion`
--

DROP TABLE IF EXISTS `agrupacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agrupacion` (
  `id_agrupacion` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id_agrupacion`),
  UNIQUE KEY `UK4efx2a6whj70dl1fbvlr2x4xg` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `beneficios`
--

DROP TABLE IF EXISTS `beneficios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `beneficios` (
  `id_beneficio` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `id_oferta` int NOT NULL,
  PRIMARY KEY (`id_beneficio`),
  KEY `FK7ereninhohmq304ync8rfmmh7` (`id_oferta`),
  CONSTRAINT `FK7ereninhohmq304ync8rfmmh7` FOREIGN KEY (`id_oferta`) REFERENCES `oferta_job` (`id_oferta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `caracteristica`
--

DROP TABLE IF EXISTS `caracteristica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caracteristica` (
  `id_caracteristica` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `id_agrupacion` int NOT NULL,
  PRIMARY KEY (`id_caracteristica`),
  KEY `FKrvksch88pbabwp7l16svpeg9u` (`id_agrupacion`),
  CONSTRAINT `FKrvksch88pbabwp7l16svpeg9u` FOREIGN KEY (`id_agrupacion`) REFERENCES `agrupacion` (`id_agrupacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categoria_ocupacional`
--

DROP TABLE IF EXISTS `categoria_ocupacional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_ocupacional` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `id_oferta` int NOT NULL,
  PRIMARY KEY (`id_categoria`),
  KEY `FK8l3kc562paewilbu4a4cb0jt9` (`id_oferta`),
  CONSTRAINT `FK8l3kc562paewilbu4a4cb0jt9` FOREIGN KEY (`id_oferta`) REFERENCES `oferta_job` (`id_oferta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chat_message`
--

DROP TABLE IF EXISTS `chat_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_message` (
  `id_message` int NOT NULL AUTO_INCREMENT,
  `fecha` datetime(6) DEFAULT NULL,
  `remitente` enum('BOT','USER') DEFAULT NULL,
  `texto` varchar(255) DEFAULT NULL,
  `id_session` int NOT NULL,
  PRIMARY KEY (`id_message`),
  KEY `FKdfwckamvof5w4sus32id847or` (`id_session`),
  CONSTRAINT `FKdfwckamvof5w4sus32id847or` FOREIGN KEY (`id_session`) REFERENCES `chat_session` (`id_session`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chat_session`
--

DROP TABLE IF EXISTS `chat_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_session` (
  `id_session` int NOT NULL AUTO_INCREMENT,
  `fecha_fin` datetime(6) DEFAULT NULL,
  `fecha_inicio` datetime(6) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id_session`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa` (
  `id_empresa` int NOT NULL AUTO_INCREMENT,
  `descrip_emp` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `direccion` varchar(255) DEFAULT NULL,
  `idxfuente` varchar(255) DEFAULT NULL,
  `nombre_emp` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `id_rubro` int DEFAULT NULL,
  PRIMARY KEY (`id_empresa`),
  KEY `FK5wggqx3s163tbsem95k7yb5y` (`id_rubro`),
  CONSTRAINT `FK5wggqx3s163tbsem95k7yb5y` FOREIGN KEY (`id_rubro`) REFERENCES `rubro` (`id_rubro`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oferta_caracteristica`
--

DROP TABLE IF EXISTS `oferta_caracteristica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oferta_caracteristica` (
  `id_caracteristica` int NOT NULL,
  `id_oferta` int NOT NULL,
  PRIMARY KEY (`id_caracteristica`,`id_oferta`),
  KEY `FKsw7tnyvv1frmkllpmfv72694k` (`id_oferta`),
  CONSTRAINT `FKgp1wsgw9v25wgrwj6tqqeepwl` FOREIGN KEY (`id_caracteristica`) REFERENCES `caracteristica` (`id_caracteristica`),
  CONSTRAINT `FKsw7tnyvv1frmkllpmfv72694k` FOREIGN KEY (`id_oferta`) REFERENCES `oferta_job` (`id_oferta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oferta_job`
--

DROP TABLE IF EXISTS `oferta_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oferta_job` (
  `id_oferta` int NOT NULL AUTO_INCREMENT,
  `contrato` varchar(255) DEFAULT NULL,
  `descripcion` varchar(10000) DEFAULT NULL,
  `exp_req` varchar(255) DEFAULT NULL,
  `fecha_inicio_job` date DEFAULT NULL,
  `fecha_post` date DEFAULT NULL,
  `fuente` varchar(255) DEFAULT NULL,
  `hrs_laborales` varchar(255) DEFAULT NULL,
  `puesto` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `vacantes` int DEFAULT NULL,
  `valid_through` date DEFAULT NULL,
  `id_empresa` int NOT NULL,
  `id_ubicacion` int DEFAULT NULL,
  PRIMARY KEY (`id_oferta`),
  KEY `FK45jfhpy00q9hfq8ebjomknkpf` (`id_empresa`),
  KEY `FK1g9xfmr3aysnbvyq768m32bld` (`id_ubicacion`),
  CONSTRAINT `FK1g9xfmr3aysnbvyq768m32bld` FOREIGN KEY (`id_ubicacion`) REFERENCES `ubicacion` (`id_ubicacion`),
  CONSTRAINT `FK45jfhpy00q9hfq8ebjomknkpf` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `requisito_educacion`
--

DROP TABLE IF EXISTS `requisito_educacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requisito_educacion` (
  `id_req_edu` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `nivel` varchar(255) DEFAULT NULL,
  `id_oferta` int NOT NULL,
  PRIMARY KEY (`id_req_edu`),
  KEY `FK3c0mykhwt89j8r2q94guaqosl` (`id_oferta`),
  CONSTRAINT `FK3c0mykhwt89j8r2q94guaqosl` FOREIGN KEY (`id_oferta`) REFERENCES `oferta_job` (`id_oferta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rubro`
--

DROP TABLE IF EXISTS `rubro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rubro` (
  `id_rubro` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_rubro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `salario`
--

DROP TABLE IF EXISTS `salario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salario` (
  `id_salario` int NOT NULL AUTO_INCREMENT,
  `maximo` decimal(38,2) DEFAULT NULL,
  `minimo` decimal(38,2) DEFAULT NULL,
  `moneda` varchar(255) DEFAULT NULL,
  `mostrar_sueldo` bit(1) DEFAULT NULL,
  `id_oferta` int NOT NULL,
  PRIMARY KEY (`id_salario`),
  KEY `FKa1qy0ik3ekg4penxvc8dbar9q` (`id_oferta`),
  CONSTRAINT `FKa1qy0ik3ekg4penxvc8dbar9q` FOREIGN KEY (`id_oferta`) REFERENCES `oferta_job` (`id_oferta`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sinonimo`
--

DROP TABLE IF EXISTS `sinonimo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sinonimo` (
  `id_sinonimo` int NOT NULL AUTO_INCREMENT,
  `palabra` varchar(255) NOT NULL,
  `id_caracteristica` int NOT NULL,
  PRIMARY KEY (`id_sinonimo`),
  KEY `FKeuamse0g9msb5q0gc4hx8nfig` (`id_caracteristica`),
  CONSTRAINT `FKeuamse0g9msb5q0gc4hx8nfig` FOREIGN KEY (`id_caracteristica`) REFERENCES `caracteristica` (`id_caracteristica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taxonomia`
--

DROP TABLE IF EXISTS `taxonomia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taxonomia` (
  `id_taxonomia` int NOT NULL AUTO_INCREMENT,
  `categoria` varchar(255) DEFAULT NULL,
  `valor` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_taxonomia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ubicacion`
--

DROP TABLE IF EXISTS `ubicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ubicacion` (
  `id_ubicacion` int NOT NULL AUTO_INCREMENT,
  `comuna` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `latitud` decimal(38,2) DEFAULT NULL,
  `longitud` decimal(38,2) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_ubicacion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'integrajobdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-17  1:47:54
