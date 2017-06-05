-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.18-log - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

usuario
-- Volcando estructura de base de datos para bd_prisma_3020
CREATE DATABASE IF NOT EXISTS `bd_prisma_3020` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bd_prisma_3020`;

-- Volcando estructura para tabla bd_prisma_3020.categoriasln
CREATE TABLE IF NOT EXISTS `categoriasln` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla bd_prisma_3020.ciclodevida
CREATE TABLE IF NOT EXISTS `ciclodevida` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla bd_prisma_3020.consulta
CREATE TABLE IF NOT EXISTS `consulta` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idSolucionConsfk` int(6) NOT NULL DEFAULT '0',
  `idPalabraClaveConsfk` int(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FKidSolucionCons` (`idSolucionConsfk`),
  KEY `FKidPalabraClaveCons` (`idPalabraClaveConsfk`),
  CONSTRAINT `FKidPalabraClaveCons` FOREIGN KEY (`idPalabraClaveConsfk`) REFERENCES `palabraclavexsln` (`idPalabraClavefk`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKidSolucionCons` FOREIGN KEY (`idSolucionConsfk`) REFERENCES `palabraclavexsln` (`idSolucionfk`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla bd_prisma_3020.criticidad
CREATE TABLE IF NOT EXISTS `criticidad` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla bd_prisma_3020.decisionsln
CREATE TABLE IF NOT EXISTS `decisionsln` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla bd_prisma_3020.direccion
CREATE TABLE IF NOT EXISTS `direccion` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla bd_prisma_3020.estrategia
CREATE TABLE IF NOT EXISTS `estrategia` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla bd_prisma_3020.jefatura
CREATE TABLE IF NOT EXISTS `jefatura` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL DEFAULT '0',
  `idDireccionfk` int(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FKdireccion` (`idDireccionfk`),
  CONSTRAINT `FKdireccion` FOREIGN KEY (`idDireccionfk`) REFERENCES `direccion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla bd_prisma_3020.palabraclave
CREATE TABLE IF NOT EXISTS `palabraclave` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla bd_prisma_3020.palabraclavexsln
CREATE TABLE IF NOT EXISTS `palabraclavexsln` (
  `idPalabraClavefk` int(6) NOT NULL,
  `idSolucionfk` int(6) NOT NULL,
  KEY `FKidPalabraClave` (`idPalabraClavefk`),
  KEY `FKidSolucion` (`idSolucionfk`),
  CONSTRAINT `FKidPalabraClave` FOREIGN KEY (`idPalabraClavefk`) REFERENCES `palabraclave` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKidSolucion` FOREIGN KEY (`idSolucionfk`) REFERENCES `solucion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla bd_prisma_3020.responsable
CREATE TABLE IF NOT EXISTS `responsable` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL DEFAULT '0',
  `correo` varchar(100) NOT NULL DEFAULT '0',
  `usuario` varchar(100) NOT NULL DEFAULT '0',
  `idJefaturafk` int(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FKjefatura` (`idJefaturafk`),
  CONSTRAINT `FKjefatura` FOREIGN KEY (`idJefaturafk`) REFERENCES `jefatura` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla bd_prisma_3020.responsablexsln
CREATE TABLE IF NOT EXISTS `responsablexsln` (
  `idResponsablefk` int(6) NOT NULL,
  `idSolucionfk` int(6) NOT NULL,
  `idAlternofk` int(6) NOT NULL,
  KEY `FKResponsable` (`idResponsablefk`),
  KEY `FKSolucion` (`idSolucionfk`),
  KEY `FKAlterno` (`idAlternofk`),
  CONSTRAINT `FKAlterno` FOREIGN KEY (`idAlternofk`) REFERENCES `responsable` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKResponsable` FOREIGN KEY (`idResponsablefk`) REFERENCES `responsable` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKSolucion` FOREIGN KEY (`idSolucionfk`) REFERENCES `solucion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla bd_prisma_3020.rol
CREATE TABLE IF NOT EXISTS `rol` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla bd_prisma_3020.solucion
CREATE TABLE IF NOT EXISTS `solucion` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL DEFAULT '0',
  `descripcion` varchar(1500) NOT NULL DEFAULT '0',
  `aprovechabilidad` binary(50) NOT NULL,
  `descAprovechabilidad` varchar(1500) NOT NULL DEFAULT '0',
  `razonCriticidad` varchar(1500) NOT NULL DEFAULT '0',
  `enlaceDocumentacion` varchar(1500) NOT NULL DEFAULT '0',
  `fechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fechaActualizacion` date NOT NULL,
  `aprobacion` binary(50) NOT NULL,
  `visibilidad` binary(50) NOT NULL,
  `nota` varchar(1500) NOT NULL DEFAULT '0',
  `idTipoApoyoNegociofk` int(6) NOT NULL DEFAULT '0',
  `idCriticidadfk` int(6) NOT NULL DEFAULT '0',
  `idCicloDeVidafk` int(6) NOT NULL DEFAULT '0',
  `idDecisionSlnfk` int(6) NOT NULL DEFAULT '0',
  `idEstrategiafk` int(6) NOT NULL DEFAULT '0',
  `idCategoriafk` int(6) NOT NULL DEFAULT '0',
  `idTemaInfofk` int(6) NOT NULL DEFAULT '0',
  `idTipoSlnfk` int(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FKApoyoNegocio_Sln` (`idTipoApoyoNegociofk`),
  KEY `FKCategoria_Sln` (`idCategoriafk`),
  KEY `FKCicloDeVida_Sln` (`idCicloDeVidafk`),
  KEY `FKCriticidad_Sln` (`idCriticidadfk`),
  KEY `FKDecision_Sln` (`idDecisionSlnfk`),
  KEY `FKEstrategia_Sln` (`idEstrategiafk`),
  KEY `FKTemaInfo_Sln` (`idTemaInfofk`),
  KEY `FKTipo_Sln` (`idTipoSlnfk`),
  CONSTRAINT `FKApoyoNegocio_Sln` FOREIGN KEY (`idTipoApoyoNegociofk`) REFERENCES `tipoapoyonegocio` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKCategoria_Sln` FOREIGN KEY (`idCategoriafk`) REFERENCES `categoriasln` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKCicloDeVida_Sln` FOREIGN KEY (`idCicloDeVidafk`) REFERENCES `ciclodevida` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKCriticidad_Sln` FOREIGN KEY (`idCriticidadfk`) REFERENCES `criticidad` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKDecision_Sln` FOREIGN KEY (`idDecisionSlnfk`) REFERENCES `decisionsln` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKEstrategia_Sln` FOREIGN KEY (`idEstrategiafk`) REFERENCES `estrategia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKTemaInfo_Sln` FOREIGN KEY (`idTemaInfofk`) REFERENCES `temainfosln` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKTipo_Sln` FOREIGN KEY (`idTipoSlnfk`) REFERENCES `tiposln` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla bd_prisma_3020.subcategoriasln
CREATE TABLE IF NOT EXISTS `subcategoriasln` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL DEFAULT '0',
  `idCategoriafk` int(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FKCat_Subc` (`idCategoriafk`),
  CONSTRAINT `FKCat_Subc` FOREIGN KEY (`idCategoriafk`) REFERENCES `categoriasln` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla bd_prisma_3020.temainfosln
CREATE TABLE IF NOT EXISTS `temainfosln` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla bd_prisma_3020.tipoapoyonegocio
CREATE TABLE IF NOT EXISTS `tipoapoyonegocio` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla bd_prisma_3020.tiposln
CREATE TABLE IF NOT EXISTS `tiposln` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla bd_prisma_3020.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(100) NOT NULL,
  `contrasena` varchar(12) NOT NULL,
  `idRolfk` int(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FKrol` (`idRolfk`),
  CONSTRAINT `FKrol` FOREIGN KEY (`idRolfk`) REFERENCES `rol` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
