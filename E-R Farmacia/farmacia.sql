-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-06-2024 a las 23:50:14
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `farmacia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `codigo_cliente` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `es_credito` tinyint(1) DEFAULT NULL,
  `datos_bancarios` varchar(255) DEFAULT NULL,
  `fecha_pago` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`codigo_cliente`, `nombre`, `direccion`, `telefono`, `es_credito`, `datos_bancarios`, `fecha_pago`) VALUES
(1, 'Juan Pérez', 'Calle Luna 456', '555-1234', 1, 'Banco XYZ, Cuenta 123456789', '2024-07-01'),
(2, 'María López', 'Calle Sol 789', '555-5678', 0, NULL, NULL),
(3, 'Carlos García', 'Avenida Estrella 101', '555-9101', 1, 'Banco ABC, Cuenta 987654321', '2024-07-15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `codigo_compra` int(11) NOT NULL,
  `codigo_cliente` int(11) DEFAULT NULL,
  `codigo_medicamento` int(11) DEFAULT NULL,
  `unidades_compradas` int(11) DEFAULT NULL,
  `fecha_compra` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`codigo_compra`, `codigo_cliente`, `codigo_medicamento`, `unidades_compradas`, `fecha_compra`) VALUES
(1, 1, 1, 10, '2024-06-01'),
(2, 2, 2, 5, '2024-06-05'),
(3, 3, 3, 15, '2024-06-10'),
(4, 1, 2, 7, '2024-06-12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `familias`
--

CREATE TABLE `familias` (
  `codigo_familia` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `familias`
--

INSERT INTO `familias` (`codigo_familia`, `nombre`) VALUES
(1, 'Antibióticos'),
(2, 'Analgesicos'),
(3, 'Antiinflamatorios');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laboratorios`
--

CREATE TABLE `laboratorios` (
  `codigo_laboratorio` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `nombre_contacto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `laboratorios`
--

INSERT INTO `laboratorios` (`codigo_laboratorio`, `nombre`, `telefono`, `direccion`, `fax`, `nombre_contacto`) VALUES
(1, 'Laboratorio A', '123-456-789', 'Calle Falsa 123', '123-456-780', 'Dr. Pérez'),
(2, 'Laboratorio B', '987-654-321', 'Avenida Siempre Viva 742', '987-654-320', 'Dra. García');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamentos`
--

CREATE TABLE `medicamentos` (
  `codigo_medicamento` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `unidades_stock` int(11) DEFAULT NULL,
  `unidades_vendidas` int(11) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `requiere_receta` tinyint(1) DEFAULT NULL,
  `codigo_laboratorio` int(11) DEFAULT NULL,
  `codigo_familia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `medicamentos`
--

INSERT INTO `medicamentos` (`codigo_medicamento`, `nombre`, `tipo`, `unidades_stock`, `unidades_vendidas`, `precio`, `requiere_receta`, `codigo_laboratorio`, `codigo_familia`) VALUES
(1, 'Amoxicilina', 'Comprimido', 100, 20, 10.50, 1, 1, 1),
(2, 'Paracetamol', 'Comprimido', 200, 50, 5.00, 0, 2, 2),
(3, 'Ibuprofeno', 'Jarabe', 150, 30, 8.75, 0, 2, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`codigo_cliente`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`codigo_compra`),
  ADD KEY `codigo_cliente` (`codigo_cliente`),
  ADD KEY `codigo_medicamento` (`codigo_medicamento`);

--
-- Indices de la tabla `familias`
--
ALTER TABLE `familias`
  ADD PRIMARY KEY (`codigo_familia`);

--
-- Indices de la tabla `laboratorios`
--
ALTER TABLE `laboratorios`
  ADD PRIMARY KEY (`codigo_laboratorio`);

--
-- Indices de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  ADD PRIMARY KEY (`codigo_medicamento`),
  ADD KEY `codigo_laboratorio` (`codigo_laboratorio`),
  ADD KEY `codigo_familia` (`codigo_familia`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`codigo_cliente`) REFERENCES `clientes` (`codigo_cliente`),
  ADD CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`codigo_medicamento`) REFERENCES `medicamentos` (`codigo_medicamento`);

--
-- Filtros para la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  ADD CONSTRAINT `medicamentos_ibfk_1` FOREIGN KEY (`codigo_laboratorio`) REFERENCES `laboratorios` (`codigo_laboratorio`),
  ADD CONSTRAINT `medicamentos_ibfk_2` FOREIGN KEY (`codigo_familia`) REFERENCES `familias` (`codigo_familia`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
