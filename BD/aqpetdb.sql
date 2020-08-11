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
  `id_aviso` int(11) NOT NULL,
  `id_creador` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `mensaje` varchar(200) NOT NULL,
  `imagen1` varchar(40) NOT NULL DEFAULT '-',
  `imagen2` varchar(40) NOT NULL DEFAULT '-',
  `activo` tinyint(1) NOT NULL DEFAULT 0,
  `fecha_creacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios_adopcion`
--

CREATE TABLE `comentarios_adopcion` (
  `id_cometario_adopcion` int(11) NOT NULL,
  `id_usuarioa` int(11) NOT NULL,
  `id_adopciona` int(11) NOT NULL,
  `comentario` varchar(200) NOT NULL,
  `ts_fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios_aviso`
--

CREATE TABLE `comentarios_aviso` (
  `id_comentario_aviso` int(11) NOT NULL,
  `id_avisoc` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `comentario` varchar(200) NOT NULL,
  `ts_fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_usuario`
--

CREATE TABLE `datos_usuario` (
  `id_dato_usuario` int(11) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enadopcion`
--

CREATE TABLE `en_adopcion` (
  `id_en_adopcion` int(11) NOT NULL,
  `id_creador` int(11) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `imagen1` varchar(30) NOT NULL DEFAULT '-',
  `imagen2` varchar(30) NOT NULL DEFAULT '-',
  `imagen3` varchar(30) NOT NULL DEFAULT '-',
  `fecha_creacion` date NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudadopcion`
--

CREATE TABLE `solicitud_adopcion` (
  `id_adoptar` int(11) NOT NULL,
  `id_solicitante` int(11) NOT NULL,
  `fecha_solicitud` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `tipo_usuario` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `avisos`
--
ALTER TABLE `avisos`
  ADD PRIMARY KEY (`id_aviso`),
  ADD KEY `avisos_idcreador_IDX` (`id_creador`) USING BTREE;

--
-- Indices de la tabla `comentariosadopcion`
--
ALTER TABLE `comentarios_adopcion`
  ADD PRIMARY KEY (`id_cometario_adopcion`),
  ADD KEY `comentariosadopcion_fk` (`id_adopciona`),
  ADD KEY `comentariosadopcion_fk_1` (`id_usuarioa`);

--
-- Indices de la tabla `comentariosaviso`
--
ALTER TABLE `comentarios_aviso`
  ADD PRIMARY KEY (`id_comentario_aviso`),
  ADD KEY `comentariosaviso_fk` (`id_avisoc`),
  ADD KEY `comentariosaviso_fk_1` (`id_usuario`);

--
-- Indices de la tabla `datosusuario`
--
ALTER TABLE `datos_usuario`
  ADD PRIMARY KEY (`id_dato_usuario`);

--
-- Indices de la tabla `enadopcion`
--
ALTER TABLE `en_adopcion`
  ADD PRIMARY KEY (`id_en_adopcion`),
  ADD KEY `enadopcion_idcreador_IDX` (`id_creador`) USING BTREE,
  ADD KEY `enadopcion_fechacreacion_IDX` (`fecha_creacion`) USING BTREE;

--
-- Indices de la tabla `solicitudadopcion`
--
ALTER TABLE `solicitud_adopcion`
  ADD PRIMARY KEY (`id_adoptar`,`id_solicitante`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `usuarios_correo_IDX` (`correo`) USING BTREE,
  ADD KEY `usuarios_tipousuario_IDX` (`tipo_usuario`) USING BTREE;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `avisos`
--
ALTER TABLE `avisos`
  MODIFY `id_aviso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comentariosadopcion`
--
ALTER TABLE `comentarios_adopcion`
  MODIFY `id_cometario_adopcion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comentariosaviso`
--
ALTER TABLE `comentarios_aviso`
  MODIFY `id_comentario_aviso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `enadopcion`
--
ALTER TABLE `en_adopcion`
  MODIFY `id_en_adopcion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `avisos`
--
ALTER TABLE `avisos`
  ADD CONSTRAINT `avisos_fk` FOREIGN KEY (`id_creador`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `comentariosadopcion`
--
ALTER TABLE `comentarios_adopcion`
  ADD CONSTRAINT `comentariosadopcion_fk` FOREIGN KEY (`id_adopciona`) REFERENCES `en_adopcion` (`id_en_adopcion`),
  ADD CONSTRAINT `comentariosadopcion_fk_1` FOREIGN KEY (`id_usuarioa`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `comentariosaviso`
--
ALTER TABLE `comentarios_aviso`
  ADD CONSTRAINT `comentariosaviso_fk` FOREIGN KEY (`id_avisoc`) REFERENCES `avisos` (`id_aviso`),
  ADD CONSTRAINT `comentariosaviso_fk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `datosusuario`
--
ALTER TABLE `datos_usuario`
  ADD CONSTRAINT `datosusuario_fk` FOREIGN KEY (`id_dato_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `enadopcion`
--
ALTER TABLE `en_adopcion`
  ADD CONSTRAINT `enadopcion_fk` FOREIGN KEY (`id_creador`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `solicitudadopcion`
--
ALTER TABLE `solicitud_adopcion`
  ADD CONSTRAINT `solicitudadopcion_fk` FOREIGN KEY (`id_solicitante`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `solicitudadopcion_fk_1` FOREIGN KEY (`id_adoptar`) REFERENCES `en_adopcion` (`id_en_adopcion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
