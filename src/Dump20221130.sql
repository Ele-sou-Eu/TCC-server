CREATE DATABASE  IF NOT EXISTS `level_up` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `level_up`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: level_up
-- ------------------------------------------------------
-- Server version	5.6.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aluno` (
  `cpf` bigint(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `e-mail` varchar(60) NOT NULL,
  PRIMARY KEY (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES (7639173469,'Leonardo de Freitas Bernardo','leonardo_ancora@hotmail.com');
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conquista`
--

DROP TABLE IF EXISTS `conquista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conquista` (
  `matricula` bigint(11) NOT NULL,
  `nome_conquista` varchar(30) DEFAULT NULL,
  `habilidade` int(11) DEFAULT NULL,
  `porcentagem` decimal(3,1) DEFAULT NULL,
  KEY `matrícula` (`matricula`),
  KEY `habilidade` (`habilidade`),
  CONSTRAINT `conquista_ibfk_2` FOREIGN KEY (`habilidade`) REFERENCES `habilidade` (`codigo_habilidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conquista`
--

LOCK TABLES `conquista` WRITE;
/*!40000 ALTER TABLE `conquista` DISABLE KEYS */;
/*!40000 ALTER TABLE `conquista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curso` (
  `codigo_curso` int(11) NOT NULL DEFAULT '0',
  `nome` varchar(50) NOT NULL,
  `tipo` enum('Licenciatura','Bacharelado','Tecnológico') NOT NULL,
  `departamento` varchar(50) NOT NULL,
  `cidade` varchar(30) DEFAULT NULL,
  `status` enum('Ativo','Inativo') NOT NULL DEFAULT 'Ativo',
  PRIMARY KEY (`codigo_curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'Ciências e Tecnologia','Bacharelado','Escola de Ciências e Tecnologia','Natal','Ativo'),(2,'Engenharia de Computação','Bacharelado','Centro de Tecnologia','Natal','Ativo'),(3,'Tecnologia da Informação','Bacharelado','Instituto Metrópole Digital','Natal','Ativo'),(5,'Javascript','Bacharelado','Sei lá','Natal','Ativo');
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `desempenho`
--

DROP TABLE IF EXISTS `desempenho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `desempenho` (
  `matricula` bigint(11) NOT NULL,
  `codigo_disciplina` varchar(7) NOT NULL,
  `semestre` decimal(5,1) NOT NULL,
  `nota_1` decimal(4,2) DEFAULT NULL,
  `nota_2` decimal(4,2) DEFAULT NULL,
  `nota_3` decimal(4,2) DEFAULT NULL,
  `nota_final` decimal(4,2) DEFAULT NULL,
  `media` decimal(4,2) DEFAULT NULL,
  KEY `Código_disciplina` (`codigo_disciplina`),
  KEY `Matrícula` (`matricula`),
  CONSTRAINT `desempenho_ibfk_2` FOREIGN KEY (`codigo_disciplina`) REFERENCES `disciplina` (`codigo_disciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `desempenho`
--

LOCK TABLES `desempenho` WRITE;
/*!40000 ALTER TABLE `desempenho` DISABLE KEYS */;
INSERT INTO `desempenho` VALUES (2013020980,'ECT2101',2013.1,10.00,NULL,NULL,NULL,NULL),(2013020980,'ECT2102',2013.1,10.00,NULL,NULL,NULL,NULL),(2013020980,'ECT2103',2013.1,8.00,NULL,NULL,NULL,NULL),(2013020980,'ECT2104',2013.1,8.10,NULL,NULL,NULL,NULL),(2013020980,'ECT2105',2013.1,8.40,NULL,NULL,NULL,NULL),(2013020980,'ECT2106',2013.1,8.50,NULL,NULL,NULL,NULL),(123456,'ECT2101',2021.1,10.00,9.00,7.00,NULL,8.66),(123456,'ECT2102',2021.2,4.50,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `desempenho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disciplina` (
  `codigo_disciplina` varchar(7) NOT NULL DEFAULT '',
  `nome` varchar(60) NOT NULL,
  PRIMARY KEY (`codigo_disciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina`
--

LOCK TABLES `disciplina` WRITE;
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
INSERT INTO `disciplina` VALUES ('ECT2101','Pré-Cálculo'),('ECT2102','Vetores e Geometria Analítica'),('ECT2103','Cálculo I'),('ECT2104','Química Geral'),('ECT2105','Práticas de Leitura e Escrita I'),('ECT2106','Ciência, Tecnologia e Sociedade'),('ECT2201','Cálculo II'),('ECT2202','Álgebra Linear'),('ECT2203','Lógica de Programação'),('ECT2204','Introdução à Física Clássica I'),('ECT2205','Práticas de Leitura e Escrita II'),('ECT2206','Gestão e Economia da Ciência, Tecnologia e Inovação'),('ECT2207','Probabilidade e Estatística'),('ECT2301','Cálculo III'),('ECT2302','Metodologia Científica e Tecnológica'),('ECT2303','Linguagem de Programação'),('ECT2304','Introdução à Física Clássica II'),('ECT2305','Prática de Leitura em Inglês'),('ECT2306','Meio Ambiente e Desenvolvimento Urbano'),('ECT2307','Física Experimental I'),('ECT2401','Computação Numérica'),('ECT2402','Introdução à Física Clássica III'),('ECT2403','Física Experimental II'),('ECT2411','Ciência e Tecnologia dos Materiais'),('ECT2412','Mecânica dos Sólidos'),('ECT2413','Mecânica dos Fluidos'),('ECT2416','Expressão Gráfica'),('IMD0017','Práticas de Leitura e Escrita em Português'),('IMD0018','Práticas de Leitura em Inglês'),('IMD0020','Tecnologia da Informação e Sociedade'),('IMD1001','Matemática Elementar'),('IMD1002','Análise Combinatória'),('IMD1003','Geometria Euclidiana'),('IMD1004','Pensamento Computacional');
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estrutura_curricular`
--

DROP TABLE IF EXISTS `estrutura_curricular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estrutura_curricular` (
  `codigo_curso` int(11) NOT NULL,
  `especializacao` varchar(30) DEFAULT NULL,
  `turno` varchar(30) NOT NULL,
  `codigo_disciplina` varchar(7) NOT NULL,
  `obrigatoriedade` enum('Obrigatória','Optativa') NOT NULL,
  `semestre` int(11) NOT NULL,
  KEY `Código_curso` (`codigo_curso`),
  KEY `Código_disciplina` (`codigo_disciplina`),
  CONSTRAINT `estrutura_curricular_ibfk_3` FOREIGN KEY (`codigo_curso`) REFERENCES `curso` (`codigo_curso`),
  CONSTRAINT `estrutura_curricular_ibfk_4` FOREIGN KEY (`codigo_disciplina`) REFERENCES `disciplina` (`codigo_disciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estrutura_curricular`
--

LOCK TABLES `estrutura_curricular` WRITE;
/*!40000 ALTER TABLE `estrutura_curricular` DISABLE KEYS */;
INSERT INTO `estrutura_curricular` VALUES (1,NULL,'','ECT2101','Obrigatória',1),(1,NULL,'','ECT2102','Obrigatória',1),(1,NULL,'','ECT2103','Obrigatória',1),(1,NULL,'','ECT2104','Obrigatória',1),(1,NULL,'','ECT2105','Obrigatória',1),(1,NULL,'','ECT2106','Obrigatória',1),(2,NULL,'','ECT2101','Obrigatória',1),(2,NULL,'','ECT2102','Obrigatória',1),(2,NULL,'','ECT2103','Obrigatória',1),(2,NULL,'','ECT2104','Obrigatória',1),(2,NULL,'','ECT2105','Obrigatória',1),(2,NULL,'','ECT2106','Obrigatória',1),(3,NULL,'','IMD0017','Obrigatória',1),(3,NULL,'','IMD0018','Obrigatória',1),(3,NULL,'','IMD0020','Obrigatória',1),(3,NULL,'','IMD1001','Obrigatória',1),(3,NULL,'','IMD1002','Obrigatória',1),(3,NULL,'','IMD1003','Obrigatória',1),(3,NULL,'','IMD1004','Obrigatória',1),(2,NULL,'','ECT2201','Obrigatória',2),(2,NULL,'','ECT2202','Obrigatória',2),(2,NULL,'','ECT2203','Obrigatória',2),(2,NULL,'','ECT2204','Obrigatória',2),(2,NULL,'','ECT2205','Obrigatória',2),(2,NULL,'','ECT2206','Obrigatória',2),(2,NULL,'','ECT2207','Obrigatória',2),(2,NULL,'','ECT2301','Obrigatória',3),(2,NULL,'','ECT2302','Obrigatória',3),(2,NULL,'','ECT2303','Obrigatória',3),(2,NULL,'','ECT2304','Obrigatória',3),(2,NULL,'','ECT2305','Obrigatória',3),(2,NULL,'','ECT2306','Obrigatória',3),(2,NULL,'','ECT2307','Obrigatória',3),(2,NULL,'','ECT2416','Obrigatória',3),(2,NULL,'','ECT2401','Obrigatória',4),(2,NULL,'','ECT2402','Obrigatória',4),(2,NULL,'','ECT2403','Obrigatória',4),(2,NULL,'','ECT2411','Obrigatória',4),(2,NULL,'','ECT2412','Obrigatória',4),(2,NULL,'','ECT2413','Obrigatória',4);
/*!40000 ALTER TABLE `estrutura_curricular` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habilidade`
--

DROP TABLE IF EXISTS `habilidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `habilidade` (
  `codigo_habilidade` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `codigo_curso` int(11) DEFAULT NULL,
  `codigo_disciplina` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`codigo_habilidade`),
  KEY `código_curso` (`codigo_curso`),
  KEY `código_disciplina` (`codigo_disciplina`),
  CONSTRAINT `habilidade_ibfk_1` FOREIGN KEY (`codigo_curso`) REFERENCES `curso` (`codigo_curso`),
  CONSTRAINT `habilidade_ibfk_2` FOREIGN KEY (`codigo_disciplina`) REFERENCES `disciplina` (`codigo_disciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habilidade`
--

LOCK TABLES `habilidade` WRITE;
/*!40000 ALTER TABLE `habilidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `habilidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matricula`
--

DROP TABLE IF EXISTS `matricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matricula` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `matricula` bigint(11) NOT NULL,
  `senha` text NOT NULL,
  `cpf_aluno` bigint(11) NOT NULL,
  `curso` int(11) NOT NULL,
  `status` enum('Ativo','Concluído','Inativo') NOT NULL DEFAULT 'Ativo',
  `semestre_entrada` decimal(5,1) NOT NULL,
  `semestre_conclusao` decimal(5,1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Cpf_aluno` (`cpf_aluno`),
  KEY `Curso` (`curso`),
  CONSTRAINT `matricula_ibfk_2` FOREIGN KEY (`Cpf_aluno`) REFERENCES `aluno` (`Cpf`),
  CONSTRAINT `matricula_ibfk_3` FOREIGN KEY (`Curso`) REFERENCES `curso` (`codigo_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matricula`
--

LOCK TABLES `matricula` WRITE;
/*!40000 ALTER TABLE `matricula` DISABLE KEYS */;
INSERT INTO `matricula` VALUES (1,123456,'$2b$10$sWzRI42jQ38dfPU4Wc9f1eDyHiqvmmKwBBeDt7jMGc8oV.FEfv2tC',7639173469,2,'Ativo',2021.0,NULL),(2,20180009734,'$2a$12$./MibQFUXfeHnOwCPiK6beY71HmHR1HU9z8S2CUEdWjto408oilxS',7639173469,2,'Ativo',2018.1,NULL),(3,2013020980,'$2b$10$sWzRI42jQ38dfPU4Wc9f1eDyHiqvmmKwBBeDt7jMGc8oV.FEfv2tC',7639173469,2,'Concluído',2013.1,2017.2);
/*!40000 ALTER TABLE `matricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pre_req`
--

DROP TABLE IF EXISTS `pre_req`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pre_req` (
  `codigo_disciplina` varchar(7) DEFAULT NULL,
  `codigo_requisito` varchar(7) DEFAULT NULL,
  KEY `código_disciplina` (`codigo_disciplina`),
  KEY `código_requisito` (`codigo_requisito`),
  CONSTRAINT `pre_req_ibfk_1` FOREIGN KEY (`codigo_disciplina`) REFERENCES `disciplina` (`codigo_disciplina`),
  CONSTRAINT `pre_req_ibfk_2` FOREIGN KEY (`codigo_requisito`) REFERENCES `disciplina` (`codigo_disciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pre_req`
--

LOCK TABLES `pre_req` WRITE;
/*!40000 ALTER TABLE `pre_req` DISABLE KEYS */;
INSERT INTO `pre_req` VALUES ('ECT2201','ECT2101'),('ECT2201','ECT2102'),('ECT2201','ECT2103'),('ECT2202','ECT2102'),('ECT2204','ECT2103'),('ECT2205','ECT2105'),('ECT2207','ECT2103'),('ECT2301','ECT2201'),('ECT2303','ECT2203'),('ECT2304','ECT2204'),('ECT2307','ECT2204'),('ECT2416','ECT2203'),('ECT2401','ECT2303'),('ECT2401','ECT2103'),('ECT2401','ECT2202'),('ECT2402','ECT2301'),('ECT2402','ECT2304'),('ECT2403','ECT2307'),('ECT2403','ECT2304'),('ECT2411','ECT2104'),('ECT2412','ECT2201'),('ECT2412','ECT2204'),('ECT2413','ECT2201'),('ECT2413','ECT2304');
/*!40000 ALTER TABLE `pre_req` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-30 20:25:30
