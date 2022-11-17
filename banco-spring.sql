-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-11-2022 a las 19:10:26
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `banco-spring`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` bigint(20) NOT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `saldo` double DEFAULT NULL,
  `usuario` varchar(255) DEFAULT NULL,
  `gestor_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `correo`, `password`, `saldo`, `usuario`, `gestor_id`) VALUES
(4, 'Cliente1@email.com', '1234', 40.1, 'Cliente1', 3),
(5, 'Cliente2@email.com', '1234', 40.1, 'Cliente2', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gestor`
--

CREATE TABLE `gestor` (
  `id` bigint(20) NOT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `usuario` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `gestor`
--

INSERT INTO `gestor` (`id`, `correo`, `password`, `usuario`) VALUES
(3, 'Gestor1@email.com', '1234', 'Gestor1'),
(4, 'Gestor2@email.com', '1234', 'Gestor2'),
(5, 'gestor3@email.com', '1234', 'gestor3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensaje`
--

CREATE TABLE `mensaje` (
  `id` bigint(20) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `texto` varchar(255) DEFAULT NULL,
  `id_origen` bigint(20) NOT NULL,
  `id_destino` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transferencia`
--

CREATE TABLE `transferencia` (
  `id` bigint(20) NOT NULL,
  `concepto` varchar(255) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `importe` double DEFAULT NULL,
  `id_beneficiario` bigint(20) NOT NULL,
  `id_ordenante` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD KEY `FKr8e7s5b3emp5b0smg8u0i94j6` (`gestor_id`);

--
-- Indices de la tabla `gestor`
--
ALTER TABLE `gestor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `mensaje`
--
ALTER TABLE `mensaje`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKiyxmtl0w0f96mppsr4m1usw9g` (`id_origen`),
  ADD KEY `FKevd10dsy97ik1acpxfujvisel` (`id_destino`);

--
-- Indices de la tabla `transferencia`
--
ALTER TABLE `transferencia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK27uq624505812hemfv75yym6v` (`id_beneficiario`),
  ADD KEY `FKjof7vrqr2cl96xkm19fj0ldvb` (`id_ordenante`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `gestor`
--
ALTER TABLE `gestor`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `mensaje`
--
ALTER TABLE `mensaje`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `transferencia`
--
ALTER TABLE `transferencia`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `FKr8e7s5b3emp5b0smg8u0i94j6` FOREIGN KEY (`gestor_id`) REFERENCES `gestor` (`id`);

--
-- Filtros para la tabla `mensaje`
--
ALTER TABLE `mensaje`
  ADD CONSTRAINT `FKevd10dsy97ik1acpxfujvisel` FOREIGN KEY (`id_destino`) REFERENCES `gestor` (`id`),
  ADD CONSTRAINT `FKiyxmtl0w0f96mppsr4m1usw9g` FOREIGN KEY (`id_origen`) REFERENCES `gestor` (`id`);

--
-- Filtros para la tabla `transferencia`
--
ALTER TABLE `transferencia`
  ADD CONSTRAINT `FK27uq624505812hemfv75yym6v` FOREIGN KEY (`id_beneficiario`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `FKjof7vrqr2cl96xkm19fj0ldvb` FOREIGN KEY (`id_ordenante`) REFERENCES `cliente` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
