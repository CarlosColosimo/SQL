-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-06-2024 a las 01:31:02
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
-- Base de datos: `aeropuerto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aeropuerto`
--

CREATE TABLE `aeropuerto` (
  `ID_Aeropuerto` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Ciudad` varchar(100) NOT NULL,
  `Pais` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `aeropuerto`
--

INSERT INTO `aeropuerto` (`ID_Aeropuerto`, `Nombre`, `Ciudad`, `Pais`) VALUES
(1, 'JFK International', 'New York', 'USA'),
(2, 'Heathrow', 'London', 'UK'),
(3, 'Charles de Gaulle', 'Paris', 'France');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compania`
--

CREATE TABLE `compania` (
  `ID_Compania` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compania`
--

INSERT INTO `compania` (`ID_Compania`, `Nombre`) VALUES
(1, 'Airways International'),
(2, 'SkyHigh Airlines'),
(3, 'BlueSky Aviation');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pasajero`
--

CREATE TABLE `pasajero` (
  `ID_Pasajero` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellidos` varchar(50) NOT NULL,
  `Edad` int(11) NOT NULL,
  `Numero_Asiento` varchar(10) NOT NULL,
  `ID_Vuelo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pasajero`
--

INSERT INTO `pasajero` (`ID_Pasajero`, `Nombre`, `Apellidos`, `Edad`, `Numero_Asiento`, `ID_Vuelo`) VALUES
(1, 'John', 'Doe', 30, '12A', 1),
(2, 'Jane', 'Smith', 25, '14B', 1),
(3, 'Alice', 'Johnson', 35, '16C', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_avion`
--

CREATE TABLE `tipo_avion` (
  `ID_Tipo_Avion` int(11) NOT NULL,
  `Modelo` varchar(50) NOT NULL,
  `Capacidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_avion`
--

INSERT INTO `tipo_avion` (`ID_Tipo_Avion`, `Modelo`, `Capacidad`) VALUES
(1, 'Boeing 737', 200),
(2, 'Airbus A320', 180),
(3, 'Embraer 190', 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vuelo`
--

CREATE TABLE `vuelo` (
  `ID_Vuelo` int(11) NOT NULL,
  `Numero_Vuelo` varchar(20) NOT NULL,
  `ID_Compania` int(11) NOT NULL,
  `ID_Tipo_Avion` int(11) NOT NULL,
  `Tipo` enum('Salida','Llegada') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vuelo`
--

INSERT INTO `vuelo` (`ID_Vuelo`, `Numero_Vuelo`, `ID_Compania`, `ID_Tipo_Avion`, `Tipo`) VALUES
(1, 'AI123', 1, 1, 'Salida'),
(2, 'SH456', 2, 2, 'Llegada'),
(3, 'BS789', 3, 3, 'Salida');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vuelo_llegada`
--

CREATE TABLE `vuelo_llegada` (
  `ID_Vuelo` int(11) NOT NULL,
  `Hora_Aterrizaje` datetime NOT NULL,
  `ID_Aeropuerto_Origen` int(11) NOT NULL,
  `Puerta_Salida` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vuelo_llegada`
--

INSERT INTO `vuelo_llegada` (`ID_Vuelo`, `Hora_Aterrizaje`, `ID_Aeropuerto_Origen`, `Puerta_Salida`) VALUES
(2, '2024-06-20 18:30:00', 1, 'D4');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vuelo_salida`
--

CREATE TABLE `vuelo_salida` (
  `ID_Vuelo` int(11) NOT NULL,
  `Hora_Salida` datetime NOT NULL,
  `ID_Aeropuerto_Destino` int(11) NOT NULL,
  `Puerta_Embarque` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vuelo_salida`
--

INSERT INTO `vuelo_salida` (`ID_Vuelo`, `Hora_Salida`, `ID_Aeropuerto_Destino`, `Puerta_Embarque`) VALUES
(1, '2024-06-20 14:00:00', 2, 'G5'),
(3, '2024-06-21 09:00:00', 3, 'H2');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aeropuerto`
--
ALTER TABLE `aeropuerto`
  ADD PRIMARY KEY (`ID_Aeropuerto`);

--
-- Indices de la tabla `compania`
--
ALTER TABLE `compania`
  ADD PRIMARY KEY (`ID_Compania`);

--
-- Indices de la tabla `pasajero`
--
ALTER TABLE `pasajero`
  ADD PRIMARY KEY (`ID_Pasajero`),
  ADD KEY `ID_Vuelo` (`ID_Vuelo`);

--
-- Indices de la tabla `tipo_avion`
--
ALTER TABLE `tipo_avion`
  ADD PRIMARY KEY (`ID_Tipo_Avion`);

--
-- Indices de la tabla `vuelo`
--
ALTER TABLE `vuelo`
  ADD PRIMARY KEY (`ID_Vuelo`),
  ADD KEY `ID_Compania` (`ID_Compania`),
  ADD KEY `ID_Tipo_Avion` (`ID_Tipo_Avion`);

--
-- Indices de la tabla `vuelo_llegada`
--
ALTER TABLE `vuelo_llegada`
  ADD PRIMARY KEY (`ID_Vuelo`),
  ADD KEY `ID_Aeropuerto_Origen` (`ID_Aeropuerto_Origen`);

--
-- Indices de la tabla `vuelo_salida`
--
ALTER TABLE `vuelo_salida`
  ADD PRIMARY KEY (`ID_Vuelo`),
  ADD KEY `ID_Aeropuerto_Destino` (`ID_Aeropuerto_Destino`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aeropuerto`
--
ALTER TABLE `aeropuerto`
  MODIFY `ID_Aeropuerto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `compania`
--
ALTER TABLE `compania`
  MODIFY `ID_Compania` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pasajero`
--
ALTER TABLE `pasajero`
  MODIFY `ID_Pasajero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_avion`
--
ALTER TABLE `tipo_avion`
  MODIFY `ID_Tipo_Avion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `vuelo`
--
ALTER TABLE `vuelo`
  MODIFY `ID_Vuelo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pasajero`
--
ALTER TABLE `pasajero`
  ADD CONSTRAINT `pasajero_ibfk_1` FOREIGN KEY (`ID_Vuelo`) REFERENCES `vuelo` (`ID_Vuelo`);

--
-- Filtros para la tabla `vuelo`
--
ALTER TABLE `vuelo`
  ADD CONSTRAINT `vuelo_ibfk_1` FOREIGN KEY (`ID_Compania`) REFERENCES `compania` (`ID_Compania`),
  ADD CONSTRAINT `vuelo_ibfk_2` FOREIGN KEY (`ID_Tipo_Avion`) REFERENCES `tipo_avion` (`ID_Tipo_Avion`);

--
-- Filtros para la tabla `vuelo_llegada`
--
ALTER TABLE `vuelo_llegada`
  ADD CONSTRAINT `vuelo_llegada_ibfk_1` FOREIGN KEY (`ID_Vuelo`) REFERENCES `vuelo` (`ID_Vuelo`),
  ADD CONSTRAINT `vuelo_llegada_ibfk_2` FOREIGN KEY (`ID_Aeropuerto_Origen`) REFERENCES `aeropuerto` (`ID_Aeropuerto`);

--
-- Filtros para la tabla `vuelo_salida`
--
ALTER TABLE `vuelo_salida`
  ADD CONSTRAINT `vuelo_salida_ibfk_1` FOREIGN KEY (`ID_Vuelo`) REFERENCES `vuelo` (`ID_Vuelo`),
  ADD CONSTRAINT `vuelo_salida_ibfk_2` FOREIGN KEY (`ID_Aeropuerto_Destino`) REFERENCES `aeropuerto` (`ID_Aeropuerto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
