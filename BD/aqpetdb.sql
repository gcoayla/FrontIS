-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-08-2020 a las 17:41:15
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `aqpetdb`
--
CREATE DATABASE IF NOT EXISTS `aqpetdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `aqpetdb`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `avisos`
--

CREATE TABLE `avisos` (
  `idaviso` int(11) NOT NULL,
  `idcreador` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `mensaje` varchar(200) NOT NULL,
  `imagen1` varchar(40) NOT NULL DEFAULT '-',
  `imagen2` varchar(40) NOT NULL DEFAULT '-',
  `activo` tinyint(1) NOT NULL DEFAULT 0,
  `fechacreacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentariosadopcion`
--

CREATE TABLE `comentariosadopcion` (
  `idcometarioadopcion` int(11) NOT NULL,
  `idusuarioa` int(11) NOT NULL,
  `idadopciona` int(11) NOT NULL,
  `comentario` varchar(200) NOT NULL,
  `tsfechacreacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentariosaviso`
--

CREATE TABLE `comentariosaviso` (
  `idcomentarioaviso` int(11) NOT NULL,
  `idavisoc` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `comentario` varchar(200) NOT NULL,
  `tsfechacreacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datosusuario`
--

CREATE TABLE `datosusuario` (
  `iddatousuario` int(11) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enadopcion`
--

CREATE TABLE `enadopcion` (
  `idenadopcion` int(11) NOT NULL,
  `idcreador` int(11) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `imagen1` varchar(30) NOT NULL DEFAULT '-',
  `imagen2` varchar(30) NOT NULL DEFAULT '-',
  `imagen3` varchar(30) NOT NULL DEFAULT '-',
  `fechacreacion` date NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `vigente` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudadopcion`
--

CREATE TABLE `solicitudadopcion` (
  `idadoptar` int(11) NOT NULL,
  `idsolicitante` int(11) NOT NULL,
  `fechasolicitud` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idusuario` int(11) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `fechacreacion` date NOT NULL,
  `tipousuario` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `avisos`
--
ALTER TABLE `avisos`
  ADD PRIMARY KEY (`idaviso`),
  ADD KEY `avisos_idcreador_IDX` (`idcreador`) USING BTREE;

--
-- Indices de la tabla `comentariosadopcion`
--
ALTER TABLE `comentariosadopcion`
  ADD PRIMARY KEY (`idcometarioadopcion`),
  ADD KEY `comentariosadopcion_fk` (`idadopciona`),
  ADD KEY `comentariosadopcion_fk_1` (`idusuarioa`);

--
-- Indices de la tabla `comentariosaviso`
--
ALTER TABLE `comentariosaviso`
  ADD PRIMARY KEY (`idcomentarioaviso`),
  ADD KEY `comentariosaviso_fk` (`idavisoc`),
  ADD KEY `comentariosaviso_fk_1` (`idusuario`);

--
-- Indices de la tabla `datosusuario`
--
ALTER TABLE `datosusuario`
  ADD PRIMARY KEY (`iddatousuario`);

--
-- Indices de la tabla `enadopcion`
--
ALTER TABLE `enadopcion`
  ADD PRIMARY KEY (`idenadopcion`),
  ADD KEY `enadopcion_idcreador_IDX` (`idcreador`) USING BTREE,
  ADD KEY `enadopcion_fechacreacion_IDX` (`fechacreacion`) USING BTREE;

--
-- Indices de la tabla `solicitudadopcion`
--
ALTER TABLE `solicitudadopcion`
  ADD PRIMARY KEY (`idadoptar`,`idsolicitante`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idusuario`),
  ADD UNIQUE KEY `usuarios_correo_IDX` (`correo`) USING BTREE,
  ADD KEY `usuarios_tipousuario_IDX` (`tipousuario`) USING BTREE;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `avisos`
--
ALTER TABLE `avisos`
  MODIFY `idaviso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comentariosadopcion`
--
ALTER TABLE `comentariosadopcion`
  MODIFY `idcometarioadopcion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comentariosaviso`
--
ALTER TABLE `comentariosaviso`
  MODIFY `idcomentarioaviso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `enadopcion`
--
ALTER TABLE `enadopcion`
  MODIFY `idenadopcion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `avisos`
--
ALTER TABLE `avisos`
  ADD CONSTRAINT `avisos_fk` FOREIGN KEY (`idcreador`) REFERENCES `usuarios` (`idusuario`);

--
-- Filtros para la tabla `comentariosadopcion`
--
ALTER TABLE `comentariosadopcion`
  ADD CONSTRAINT `comentariosadopcion_fk` FOREIGN KEY (`idadopciona`) REFERENCES `enadopcion` (`idenadopcion`),
  ADD CONSTRAINT `comentariosadopcion_fk_1` FOREIGN KEY (`idusuarioa`) REFERENCES `usuarios` (`idusuario`);

--
-- Filtros para la tabla `comentariosaviso`
--
ALTER TABLE `comentariosaviso`
  ADD CONSTRAINT `comentariosaviso_fk` FOREIGN KEY (`idavisoc`) REFERENCES `avisos` (`idaviso`),
  ADD CONSTRAINT `comentariosaviso_fk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`);

--
-- Filtros para la tabla `datosusuario`
--
ALTER TABLE `datosusuario`
  ADD CONSTRAINT `datosusuario_fk` FOREIGN KEY (`iddatousuario`) REFERENCES `usuarios` (`idusuario`);

--
-- Filtros para la tabla `enadopcion`
--
ALTER TABLE `enadopcion`
  ADD CONSTRAINT `enadopcion_fk` FOREIGN KEY (`idcreador`) REFERENCES `usuarios` (`idusuario`);

--
-- Filtros para la tabla `solicitudadopcion`
--
ALTER TABLE `solicitudadopcion`
  ADD CONSTRAINT `solicitudadopcion_fk` FOREIGN KEY (`idsolicitante`) REFERENCES `usuarios` (`idusuario`),
  ADD CONSTRAINT `solicitudadopcion_fk_1` FOREIGN KEY (`idadoptar`) REFERENCES `enadopcion` (`idenadopcion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
