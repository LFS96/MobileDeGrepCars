-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server Version:               5.7.33 - MySQL Community Server (GPL)
-- Server Betriebssystem:        Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Exportiere Datenbank Struktur für mobilede
CREATE DATABASE IF NOT EXISTS `mobilede` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;
USE `mobilede`;

-- Exportiere Struktur von Tabelle mobilede.advertisements
CREATE TABLE IF NOT EXISTS `advertisements` (
  `id` int(11) NOT NULL,
  `url` varchar(2048) COLLATE utf8mb4_bin DEFAULT NULL,
  `raw` longtext COLLATE utf8mb4_bin,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Daten Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle mobilede.cars
CREATE TABLE IF NOT EXISTS `cars` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8mb4_bin NOT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `damage` text COLLATE utf8mb4_bin,
  `mileage` int(11) DEFAULT NULL,
  `displacement` int(11) DEFAULT NULL,
  `power` int(11) DEFAULT NULL,
  `consumption_k` decimal(12,2) DEFAULT NULL,
  `consumption_i` decimal(12,2) DEFAULT NULL,
  `consumption_a` decimal(12,2) DEFAULT NULL,
  `fuel` text COLLATE utf8mb4_bin,
  `emission` int(11) DEFAULT NULL,
  `transmission` int(11) DEFAULT NULL,
  `registration` date DEFAULT NULL,
  `info` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Daten Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle mobilede.cars_features
CREATE TABLE IF NOT EXISTS `cars_features` (
  `car` int(11) NOT NULL,
  `feature` int(11) NOT NULL,
  PRIMARY KEY (`car`,`feature`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Daten Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle mobilede.features
CREATE TABLE IF NOT EXISTS `features` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Daten Export vom Benutzer nicht ausgewählt

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
