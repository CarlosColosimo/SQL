-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-06-2024 a las 23:27:08
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
-- Base de datos: `gimnasio “siempre en forma”`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aparato`
--

CREATE TABLE `aparato` (
  `codigo_aparato` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `estado_conservacion` varchar(50) DEFAULT NULL,
  `numero_sala` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `aparato`
--

INSERT INTO `aparato` (`codigo_aparato`, `descripcion`, `estado_conservacion`, `numero_sala`) VALUES
(101, 'Cinta de Correr', 'Bueno', 1),
(102, 'Bicicleta Estática', 'Excelente', 1),
(103, 'Máquina de Pesas', 'Regular', 2),
(104, 'Banco de Pesas', 'Bueno', 2),
(105, 'Elíptica', 'Bueno', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia`
--

CREATE TABLE `asistencia` (
  `numero_socio` int(11) NOT NULL,
  `codigo_clase` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `asistencia`
--

INSERT INTO `asistencia` (`numero_socio`, `codigo_clase`) VALUES
(1, 1001),
(1, 1002),
(2, 1003),
(3, 1004),
(4, 1001),
(4, 1003);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clase`
--

CREATE TABLE `clase` (
  `codigo_clase` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `dia_hora` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `numero_sala` int(11) DEFAULT NULL,
  `dni_monitor` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clase`
--

INSERT INTO `clase` (`codigo_clase`, `descripcion`, `dia_hora`, `numero_sala`, `dni_monitor`) VALUES
(1001, 'Aerobic Avanzado', '2024-06-20 13:00:00', 3, '12345678A'),
(1002, 'Pilates Básico', '2024-06-20 15:00:00', 3, '23456789B'),
(1003, 'Yoga Intermedio', '2024-06-21 13:00:00', 3, '23456789B'),
(1004, 'Step Avanzado', '2024-06-21 21:00:00', 3, '12345678A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monitor`
--

CREATE TABLE `monitor` (
  `dni` varchar(10) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `titulacion` tinyint(1) DEFAULT NULL,
  `experiencia_profesional` text DEFAULT NULL,
  `preparacion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `monitor`
--

INSERT INTO `monitor` (`dni`, `nombre`, `telefono`, `titulacion`, `experiencia_profesional`, `preparacion`) VALUES
('12345678A', 'Juan Pérez', '600123456', 1, '5 años en gimnasios', 'Aerobic, Step'),
('23456789B', 'María López', '600234567', 1, '3 años en gimnasios', 'Yoga, Pilates'),
('34567890C', 'Carlos Gómez', '600345678', 0, '1 año en gimnasios', 'Aerobic'),
('45678901D', 'Ana Martínez', '600456789', 1, '4 años en gimnasios', 'Step, Stretching');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pistasquash`
--

CREATE TABLE `pistasquash` (
  `numero_pista` int(11) NOT NULL,
  `ubicacion` varchar(255) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `numero_sala` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pistasquash`
--

INSERT INTO `pistasquash` (`numero_pista`, `ubicacion`, `estado`, `numero_sala`) VALUES
(1, 'Segundo Piso', 'Bueno', 4),
(2, 'Segundo Piso', 'Excelente', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservapista`
--

CREATE TABLE `reservapista` (
  `numero_reserva` int(11) NOT NULL,
  `numero_socio` int(11) DEFAULT NULL,
  `numero_pista` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reservapista`
--

INSERT INTO `reservapista` (`numero_reserva`, `numero_socio`, `numero_pista`, `fecha`, `hora`) VALUES
(1, 1, 1, '2024-06-22', '09:00:00'),
(2, 2, 1, '2024-06-22', '10:00:00'),
(3, 3, 2, '2024-06-22', '11:00:00'),
(4, 4, 2, '2024-06-22', '12:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sala`
--

CREATE TABLE `sala` (
  `numero_sala` int(11) NOT NULL,
  `metros_cuadrados` int(11) DEFAULT NULL,
  `ubicacion` varchar(255) DEFAULT NULL,
  `tipo_sala` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sala`
--

INSERT INTO `sala` (`numero_sala`, `metros_cuadrados`, `ubicacion`, `tipo_sala`) VALUES
(1, 100, 'Planta Baja', 'Cardio'),
(2, 150, 'Planta Baja', 'Muscular'),
(3, 200, 'Primer Piso', 'General'),
(4, 75, 'Segundo Piso', 'Squash'),
(5, 75, 'Segundo Piso', 'Squash');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socio`
--

CREATE TABLE `socio` (
  `numero_socio` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `profesion` varchar(255) DEFAULT NULL,
  `datos_bancarios` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `socio`
--

INSERT INTO `socio` (`numero_socio`, `nombre`, `direccion`, `telefono`, `profesion`, `datos_bancarios`) VALUES
(1, 'Luis García', 'Calle Mayor, 1', '600567890', 'Ingeniero', 'ES1234567890123456789012'),
(2, 'Marta Fernández', 'Calle Menor, 2', '600678901', 'Abogada', 'ES2345678901234567890123'),
(3, 'Pablo Rodríguez', 'Avenida Principal, 3', '600789012', 'Profesor', 'ES3456789012345678901234'),
(4, 'Laura Sánchez', 'Plaza Central, 4', '600890123', 'Médica', 'ES4567890123456789012345');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aparato`
--
ALTER TABLE `aparato`
  ADD PRIMARY KEY (`codigo_aparato`),
  ADD KEY `numero_sala` (`numero_sala`);

--
-- Indices de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD PRIMARY KEY (`numero_socio`,`codigo_clase`),
  ADD KEY `codigo_clase` (`codigo_clase`);

--
-- Indices de la tabla `clase`
--
ALTER TABLE `clase`
  ADD PRIMARY KEY (`codigo_clase`),
  ADD KEY `numero_sala` (`numero_sala`),
  ADD KEY `dni_monitor` (`dni_monitor`);

--
-- Indices de la tabla `monitor`
--
ALTER TABLE `monitor`
  ADD PRIMARY KEY (`dni`);

--
-- Indices de la tabla `pistasquash`
--
ALTER TABLE `pistasquash`
  ADD PRIMARY KEY (`numero_pista`),
  ADD KEY `numero_sala` (`numero_sala`);

--
-- Indices de la tabla `reservapista`
--
ALTER TABLE `reservapista`
  ADD PRIMARY KEY (`numero_reserva`),
  ADD KEY `numero_socio` (`numero_socio`),
  ADD KEY `numero_pista` (`numero_pista`);

--
-- Indices de la tabla `sala`
--
ALTER TABLE `sala`
  ADD PRIMARY KEY (`numero_sala`);

--
-- Indices de la tabla `socio`
--
ALTER TABLE `socio`
  ADD PRIMARY KEY (`numero_socio`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aparato`
--
ALTER TABLE `aparato`
  ADD CONSTRAINT `aparato_ibfk_1` FOREIGN KEY (`numero_sala`) REFERENCES `sala` (`numero_sala`);

--
-- Filtros para la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD CONSTRAINT `asistencia_ibfk_1` FOREIGN KEY (`numero_socio`) REFERENCES `socio` (`numero_socio`),
  ADD CONSTRAINT `asistencia_ibfk_2` FOREIGN KEY (`codigo_clase`) REFERENCES `clase` (`codigo_clase`);

--
-- Filtros para la tabla `clase`
--
ALTER TABLE `clase`
  ADD CONSTRAINT `clase_ibfk_1` FOREIGN KEY (`numero_sala`) REFERENCES `sala` (`numero_sala`),
  ADD CONSTRAINT `clase_ibfk_2` FOREIGN KEY (`dni_monitor`) REFERENCES `monitor` (`dni`);

--
-- Filtros para la tabla `pistasquash`
--
ALTER TABLE `pistasquash`
  ADD CONSTRAINT `pistasquash_ibfk_1` FOREIGN KEY (`numero_sala`) REFERENCES `sala` (`numero_sala`);

--
-- Filtros para la tabla `reservapista`
--
ALTER TABLE `reservapista`
  ADD CONSTRAINT `reservapista_ibfk_1` FOREIGN KEY (`numero_socio`) REFERENCES `socio` (`numero_socio`),
  ADD CONSTRAINT `reservapista_ibfk_2` FOREIGN KEY (`numero_pista`) REFERENCES `pistasquash` (`numero_pista`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
