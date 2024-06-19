-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-06-2024 a las 01:19:24
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `club nautico`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barco`
--

CREATE TABLE `barco` (
  `ID_Barco` int(11) NOT NULL,
  `Matrícula` varchar(20) DEFAULT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Número_Amarre` int(11) DEFAULT NULL,
  `Cuota` decimal(10,2) DEFAULT NULL,
  `ID_Socio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `barco`
--

INSERT INTO `barco` (`ID_Barco`, `Matrícula`, `Nombre`, `Número_Amarre`, `Cuota`, `ID_Socio`) VALUES
(1, 'ABC123', 'El Velero', 12, 150.00, 1),
(2, 'XYZ456', 'La Perla Negra', 25, 200.00, 2),
(3, 'LMN789', 'El Galeón', 30, 250.00, 3),
(4, 'JKL012', 'La Fragata', 35, 180.00, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patrón`
--

CREATE TABLE `patrón` (
  `ID_Patrón` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Apellidos` varchar(50) DEFAULT NULL,
  `Fecha_Nacimiento` date DEFAULT NULL,
  `Dirección` varchar(100) DEFAULT NULL,
  `Teléfono` varchar(20) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `patrón`
--

INSERT INTO `patrón` (`ID_Patrón`, `Nombre`, `Apellidos`, `Fecha_Nacimiento`, `Dirección`, `Teléfono`, `Email`) VALUES
(1, 'Pedro', 'Martínez', '1990-04-20', 'Calle Luna 100', '555-4321', 'pedro.martinez@example.com'),
(2, 'Ana', 'Gómez', '1985-07-15', 'Calle Sol 200', '555-6789', 'ana.gomez@example.com'),
(3, 'Luis', 'Fernández', '1992-11-05', 'Calle Estrella 300', '555-9876', 'luis.fernandez@example.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salida`
--

CREATE TABLE `salida` (
  `ID_Salida` int(11) NOT NULL,
  `Fecha_Hora_Salida` datetime DEFAULT NULL,
  `Destino` varchar(100) DEFAULT NULL,
  `ID_Barco` int(11) DEFAULT NULL,
  `ID_Patrón` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `salida`
--

INSERT INTO `salida` (`ID_Salida`, `Fecha_Hora_Salida`, `Destino`, `ID_Barco`, `ID_Patrón`) VALUES
(1, '2024-06-15 08:00:00', 'Isla Bonita', 1, 1),
(2, '2024-06-16 09:30:00', 'Puerto Rico', 2, 2),
(3, '2024-06-17 07:00:00', 'Bahía Escondida', 3, 3),
(4, '2024-06-18 10:15:00', 'Playa Azul', 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socio`
--

CREATE TABLE `socio` (
  `ID_Socio` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Apellidos` varchar(50) DEFAULT NULL,
  `Fecha_Nacimiento` date DEFAULT NULL,
  `Dirección` varchar(100) DEFAULT NULL,
  `Teléfono` varchar(20) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `socio`
--

INSERT INTO `socio` (`ID_Socio`, `Nombre`, `Apellidos`, `Fecha_Nacimiento`, `Dirección`, `Teléfono`, `Email`) VALUES
(1, 'Juan', 'Pérez', '1980-05-15', 'Calle Falsa 123', '555-1234', 'juan.perez@example.com'),
(2, 'María', 'López', '1975-09-10', 'Avenida Siempre Viva 456', '555-5678', 'maria.lopez@example.com'),
(3, 'Carlos', 'García', '1988-12-25', 'Calle del Mar 789', '555-8765', 'carlos.garcia@example.com');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `barco`
--
ALTER TABLE `barco`
  ADD PRIMARY KEY (`ID_Barco`),
  ADD KEY `ID_Socio` (`ID_Socio`);

--
-- Indices de la tabla `patrón`
--
ALTER TABLE `patrón`
  ADD PRIMARY KEY (`ID_Patrón`);

--
-- Indices de la tabla `salida`
--
ALTER TABLE `salida`
  ADD PRIMARY KEY (`ID_Salida`),
  ADD KEY `ID_Barco` (`ID_Barco`),
  ADD KEY `ID_Patrón` (`ID_Patrón`);

--
-- Indices de la tabla `socio`
--
ALTER TABLE `socio`
  ADD PRIMARY KEY (`ID_Socio`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `barco`
--
ALTER TABLE `barco`
  MODIFY `ID_Barco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `patrón`
--
ALTER TABLE `patrón`
  MODIFY `ID_Patrón` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `salida`
--
ALTER TABLE `salida`
  MODIFY `ID_Salida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `socio`
--
ALTER TABLE `socio`
  MODIFY `ID_Socio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `barco`
--
ALTER TABLE `barco`
  ADD CONSTRAINT `barco_ibfk_1` FOREIGN KEY (`ID_Socio`) REFERENCES `socio` (`ID_Socio`);

--
-- Filtros para la tabla `salida`
--
ALTER TABLE `salida`
  ADD CONSTRAINT `salida_ibfk_1` FOREIGN KEY (`ID_Barco`) REFERENCES `barco` (`ID_Barco`),
  ADD CONSTRAINT `salida_ibfk_2` FOREIGN KEY (`ID_Patrón`) REFERENCES `patrón` (`ID_Patrón`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
