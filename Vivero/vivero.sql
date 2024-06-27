-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-06-2024 a las 23:00:39
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
-- Base de datos: `vivero`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacion`
--

CREATE TABLE `asignacion` (
  `EmpleadoDNI` int(11) NOT NULL,
  `CodigoZona` int(11) NOT NULL,
  `CodigoTienda` int(11) DEFAULT NULL,
  `FechaInicio` date NOT NULL,
  `FechaFin` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `asignacion`
--

INSERT INTO `asignacion` (`EmpleadoDNI`, `CodigoZona`, `CodigoTienda`, `FechaInicio`, `FechaFin`) VALUES
(101, 1, 1, '2022-01-01', '2022-06-30'),
(102, 2, 1, '2022-07-01', '2022-12-31'),
(103, 3, 2, '2022-01-01', '2022-12-31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientevip`
--

CREATE TABLE `clientevip` (
  `DNI` int(11) NOT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `FechaIncorporacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `clientevip`
--

INSERT INTO `clientevip` (`DNI`, `Nombre`, `Direccion`, `Telefono`, `FechaIncorporacion`) VALUES
(201, 'Ana Rodríguez', 'Calle Luna 789', '678-9012', '2023-01-15'),
(202, 'Luis Fernández', 'Av. Sol 456', '789-0123', '2023-02-20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallepedido`
--

CREATE TABLE `detallepedido` (
  `NumeroPedido` int(11) NOT NULL,
  `CodigoProducto` int(11) NOT NULL,
  `Unidades` int(11) DEFAULT NULL,
  `Descuento` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `detallepedido`
--

INSERT INTO `detallepedido` (`NumeroPedido`, `CodigoProducto`, `Unidades`, `Descuento`) VALUES
(1, 1, 2, 10.00),
(1, 2, 1, 5.00),
(2, 3, 1, 15.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `DNI` int(11) NOT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`DNI`, `Nombre`, `Telefono`) VALUES
(101, 'Juan Pérez', '345-6789'),
(102, 'María López', '456-7890'),
(103, 'Carlos García', '567-8901');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `NumeroPedido` int(11) NOT NULL,
  `ClienteDNI` int(11) DEFAULT NULL,
  `CodigoTienda` int(11) DEFAULT NULL,
  `EmpleadoDNI` int(11) DEFAULT NULL,
  `FechaRealizacion` date DEFAULT NULL,
  `PrecioPortes` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`NumeroPedido`, `ClienteDNI`, `CodigoTienda`, `EmpleadoDNI`, `FechaRealizacion`, `PrecioPortes`) VALUES
(1, 201, 1, 101, '2023-03-10', 10.00),
(2, 202, 2, 103, '2023-03-15', 5.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `CodigoProducto` int(11) NOT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `Tipo` enum('Planta','Accesorio','Decoracion') DEFAULT NULL,
  `Descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`CodigoProducto`, `Nombre`, `Tipo`, `Descripcion`) VALUES
(1, 'Rosa', 'Planta', 'Requiere riego diario y sol directo.'),
(2, 'Maceta de barro', 'Accesorio', 'Maceta de barro tamaño mediano.'),
(3, 'Enano de jardín', 'Decoracion', 'Figura decorativa para el jardín.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productovivero`
--

CREATE TABLE `productovivero` (
  `CodigoProducto` int(11) NOT NULL,
  `CodigoTienda` int(11) NOT NULL,
  `Precio` decimal(10,2) DEFAULT NULL,
  `Stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `productovivero`
--

INSERT INTO `productovivero` (`CodigoProducto`, `CodigoTienda`, `Precio`, `Stock`) VALUES
(1, 1, 150.00, 20),
(1, 2, 155.00, 15),
(2, 1, 50.00, 100),
(2, 2, 55.00, 80),
(3, 1, 200.00, 5),
(3, 2, 205.00, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stockzona`
--

CREATE TABLE `stockzona` (
  `CodigoProducto` int(11) NOT NULL,
  `CodigoZona` int(11) NOT NULL,
  `Stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `stockzona`
--

INSERT INTO `stockzona` (`CodigoProducto`, `CodigoZona`, `Stock`) VALUES
(1, 1, 10),
(1, 2, 5),
(2, 1, 50),
(2, 2, 30),
(3, 3, 3),
(3, 4, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vivero`
--

CREATE TABLE `vivero` (
  `CodigoTienda` int(11) NOT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `vivero`
--

INSERT INTO `vivero` (`CodigoTienda`, `Telefono`, `Direccion`) VALUES
(1, '123-4567', 'Av. Siempre Viva 123'),
(2, '234-5678', 'Calle Falsa 456');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zona`
--

CREATE TABLE `zona` (
  `CodigoZona` int(11) NOT NULL,
  `CodigoTienda` int(11) DEFAULT NULL,
  `Nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `zona`
--

INSERT INTO `zona` (`CodigoZona`, `CodigoTienda`, `Nombre`) VALUES
(1, 1, 'Zona Exterior Regadío'),
(2, 1, 'Interior Climatizada'),
(3, 2, 'Zona Exterior Regadío'),
(4, 2, 'Zona de Caja');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignacion`
--
ALTER TABLE `asignacion`
  ADD PRIMARY KEY (`EmpleadoDNI`,`CodigoZona`,`FechaInicio`),
  ADD KEY `CodigoZona` (`CodigoZona`),
  ADD KEY `CodigoTienda` (`CodigoTienda`);

--
-- Indices de la tabla `clientevip`
--
ALTER TABLE `clientevip`
  ADD PRIMARY KEY (`DNI`);

--
-- Indices de la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  ADD PRIMARY KEY (`NumeroPedido`,`CodigoProducto`),
  ADD KEY `CodigoProducto` (`CodigoProducto`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`DNI`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`NumeroPedido`),
  ADD KEY `ClienteDNI` (`ClienteDNI`),
  ADD KEY `CodigoTienda` (`CodigoTienda`),
  ADD KEY `EmpleadoDNI` (`EmpleadoDNI`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`CodigoProducto`);

--
-- Indices de la tabla `productovivero`
--
ALTER TABLE `productovivero`
  ADD PRIMARY KEY (`CodigoProducto`,`CodigoTienda`),
  ADD KEY `CodigoTienda` (`CodigoTienda`);

--
-- Indices de la tabla `stockzona`
--
ALTER TABLE `stockzona`
  ADD PRIMARY KEY (`CodigoProducto`,`CodigoZona`),
  ADD KEY `CodigoZona` (`CodigoZona`);

--
-- Indices de la tabla `vivero`
--
ALTER TABLE `vivero`
  ADD PRIMARY KEY (`CodigoTienda`);

--
-- Indices de la tabla `zona`
--
ALTER TABLE `zona`
  ADD PRIMARY KEY (`CodigoZona`),
  ADD KEY `CodigoTienda` (`CodigoTienda`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignacion`
--
ALTER TABLE `asignacion`
  ADD CONSTRAINT `asignacion_ibfk_1` FOREIGN KEY (`EmpleadoDNI`) REFERENCES `empleado` (`DNI`),
  ADD CONSTRAINT `asignacion_ibfk_2` FOREIGN KEY (`CodigoZona`) REFERENCES `zona` (`CodigoZona`),
  ADD CONSTRAINT `asignacion_ibfk_3` FOREIGN KEY (`CodigoTienda`) REFERENCES `vivero` (`CodigoTienda`);

--
-- Filtros para la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  ADD CONSTRAINT `detallepedido_ibfk_1` FOREIGN KEY (`NumeroPedido`) REFERENCES `pedido` (`NumeroPedido`),
  ADD CONSTRAINT `detallepedido_ibfk_2` FOREIGN KEY (`CodigoProducto`) REFERENCES `producto` (`CodigoProducto`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`ClienteDNI`) REFERENCES `clientevip` (`DNI`),
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`CodigoTienda`) REFERENCES `vivero` (`CodigoTienda`),
  ADD CONSTRAINT `pedido_ibfk_3` FOREIGN KEY (`EmpleadoDNI`) REFERENCES `empleado` (`DNI`);

--
-- Filtros para la tabla `productovivero`
--
ALTER TABLE `productovivero`
  ADD CONSTRAINT `productovivero_ibfk_1` FOREIGN KEY (`CodigoProducto`) REFERENCES `producto` (`CodigoProducto`),
  ADD CONSTRAINT `productovivero_ibfk_2` FOREIGN KEY (`CodigoTienda`) REFERENCES `vivero` (`CodigoTienda`);

--
-- Filtros para la tabla `stockzona`
--
ALTER TABLE `stockzona`
  ADD CONSTRAINT `stockzona_ibfk_1` FOREIGN KEY (`CodigoProducto`) REFERENCES `producto` (`CodigoProducto`),
  ADD CONSTRAINT `stockzona_ibfk_2` FOREIGN KEY (`CodigoZona`) REFERENCES `zona` (`CodigoZona`);

--
-- Filtros para la tabla `zona`
--
ALTER TABLE `zona`
  ADD CONSTRAINT `zona_ibfk_1` FOREIGN KEY (`CodigoTienda`) REFERENCES `vivero` (`CodigoTienda`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
