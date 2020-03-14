-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-03-2020 a las 17:01:36
-- Versión del servidor: 10.1.35-MariaDB
-- Versión de PHP: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `yummyeat`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `ID_CLIENTE` int(11) NOT NULL,
  `CODIGO_COOKIE` char(32) DEFAULT NULL,
  `NOMBRE_CLIENTE` varchar(30) NOT NULL,
  `APELLIDOS_CLIENTE` varchar(40) NOT NULL,
  `TELEFONO_CLIENTE` char(11) NOT NULL,
  `DIRECCION_CLIENTE` varchar(120) DEFAULT NULL,
  `EMAIL_CLIENTE` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`ID_CLIENTE`, `CODIGO_COOKIE`, `NOMBRE_CLIENTE`, `APELLIDOS_CLIENTE`, `TELEFONO_CLIENTE`, `DIRECCION_CLIENTE`, `EMAIL_CLIENTE`) VALUES
(1, '', 'Jose Luis ', 'Sánchez Gómez', '629034519', 'C/ Sevilla 4, 3 A, 28901, Getafe, Madrid', 'Joseluis12@gmail.com'),
(2, NULL, 'Julia', 'Gutiérrez Serrano', '612893018', 'C/ Martin Velasco 17, 5 D, 28320, Pinto, Madrid', 'JuliaGS@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido_menu`
--

CREATE TABLE `detalle_pedido_menu` (
  `NUMERO_PEDIDO` int(11) NOT NULL,
  `ID_MENU` int(11) NOT NULL,
  `PRECIO_UNITARIO_MENU` decimal(10,2) NOT NULL,
  `UNIDADES_MENU` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido_producto`
--

CREATE TABLE `detalle_pedido_producto` (
  `NUMERO_PEDIDO` int(11) NOT NULL,
  `ID_PRODUCTO` int(11) NOT NULL,
  `PRECIO_UNITARIO_PRODUCTO` decimal(10,2) NOT NULL,
  `UNIDADES_PRODUCTO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `ID_MENU` int(11) NOT NULL,
  `ID_RESTAURANTE` char(4) NOT NULL,
  `NOMBRE_MENU` varchar(70) NOT NULL,
  `DESCRIPCION_MENU` varchar(150) NOT NULL,
  `PRECIO_MENU` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `NUMERO_PEDIDO` int(11) NOT NULL,
  `ID_RESTAURANTE` char(4) NOT NULL,
  `ID_CLIENTE` int(11) NOT NULL,
  `ID_REPARTIDOR` int(11) NOT NULL,
  `DIRECCION_ENTREGA` varchar(60) DEFAULT NULL COMMENT 'NULL -> PEDIDO NO CONFIRMADO',
  `PRECIO_PEDIDO` decimal(10,2) NOT NULL,
  `FECHA_PEDIDO_REALIZADO` datetime DEFAULT NULL COMMENT 'NULL -> PEDIDO NO CONFIRMADO',
  `FECHA_PEDIDO_ENTREGADO` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `ID_PRODUCTO` int(11) NOT NULL,
  `ID_RESTAURANTE` char(4) NOT NULL,
  `NOMBRE_PRODUCTO` varchar(40) NOT NULL,
  `DESCRIPCION_PRODUCTO` varchar(150) NOT NULL,
  `PRECIO_PRODUCTO` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_menu`
--

CREATE TABLE `productos_menu` (
  `ID_MENU` int(11) NOT NULL,
  `ID_PRODUCTO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `repartidor`
--

CREATE TABLE `repartidor` (
  `ID_REPARTIDOR` int(11) NOT NULL,
  `DNI_REPARTIDOR` char(11) NOT NULL,
  `NOMBRE_REPARTIDOR` varchar(30) NOT NULL,
  `APELLIDOS_REPARTIDOR` varchar(40) NOT NULL,
  `TELEFONO_REPARTIDOR` char(11) NOT NULL,
  `DIRECCION_REPARTIDOR` varchar(60) NOT NULL,
  `EMAIL_REPARTIDOR` varchar(40) NOT NULL,
  `SALARIO_REPARTIDOR` decimal(10,2) NOT NULL,
  `DISPONIBILIDAD` int(11) NOT NULL COMMENT '0 -> NO DISPONIBLE 1 -> DISPONIBLE',
  `ZONA_REPARTIDOR` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `repartidor`
--

INSERT INTO `repartidor` (`ID_REPARTIDOR`, `DNI_REPARTIDOR`, `NOMBRE_REPARTIDOR`, `APELLIDOS_REPARTIDOR`, `TELEFONO_REPARTIDOR`, `DIRECCION_REPARTIDOR`, `EMAIL_REPARTIDOR`, `SALARIO_REPARTIDOR`, `DISPONIBILIDAD`, `ZONA_REPARTIDOR`) VALUES
(1, '49251235M', 'Luis', 'Benítez García', '611230197', 'C/ José Rizal 17, 28930, Getafe, Madrid', 'Luisbenitez08@gmail.com', '1124.34', 1, 'Getafe'),
(2, '529017356L', 'Sara', 'Jiménez Cuenca', '617200982', 'C/ Anselmo Lorenzo\r\n 2, 3 A, 28430, Alcorcón, Madrid', 'Sarajimenez14@gmail.com', '1267.65', 1, 'Madrid'),
(3, '50192230J', 'Marcos', 'Serrano Escudero', '639178210', 'C/ del Alcalde Juan Durán y Pelayo 2, 4 B, 28530, Leganés, M', 'Marcosse12@gmail.com', '1098.00', 1, 'Alcorcón'),
(4, '42911203L', 'Maria', 'García López', '633912768', 'C/ del Abedul 7, 28234, Ciempozuelos, Madrid', 'MariaGJ16@gmail.com', '1190.12', 1, 'Leganés'),
(5, '47822368P', 'Estebán', 'Díaz Martínez', '617349987', 'C/ del Alcalde Manuel Gómez 6, 1 A, 28340, Leganés, Madrid', 'EstebanD12@gmail.com', '1134.98', 1, 'Pinto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restaurante`
--

CREATE TABLE `restaurante` (
  `ID_RESTAURANTE` char(4) NOT NULL,
  `NOMBRE_RESTAURANTE` varchar(40) NOT NULL,
  `TELEFONO_RESTAURANTE` char(11) NOT NULL,
  `DIRECCION_RESTAURANTE` varchar(120) NOT NULL,
  `LOCALIDAD_RESTAURANTE` varchar(30) NOT NULL,
  `EMAIL_RESTAURANTE` varchar(40) NOT NULL,
  `ESPECIALIDAD_RESTAURANTE` varchar(40) NOT NULL,
  `DESTACADO_RESTAURANTE` int(11) NOT NULL COMMENT '0 -> NO D 1 -> DESTA'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `restaurante`
--

INSERT INTO `restaurante` (`ID_RESTAURANTE`, `NOMBRE_RESTAURANTE`, `TELEFONO_RESTAURANTE`, `DIRECCION_RESTAURANTE`, `LOCALIDAD_RESTAURANTE`, `EMAIL_RESTAURANTE`, `ESPECIALIDAD_RESTAURANTE`, `DESTACADO_RESTAURANTE`) VALUES
('DPAL', 'Domino\'s Pizza', '910900973', 'Calle Pablo Picasso, 40, 28922 Alcorcón, Madrid', 'Alcorcón', 'DominosPizzaAlcorcon@gmail.com', 'Pizzas', 1),
('DPFU', 'Domino\'s Pizza', '916085663', 'Av. de Europa, 14, 28943 Fuenlabrada, Madrid', 'Fuenlabrada', 'DominosPizzaFuenlabrada@gmai.com', 'Pizzas', 1),
('DPMA', 'Domino\'s Pizza', '916840212', 'Calle Arboleda, 24, 28901 Madrid', 'Madrid', 'DominosPizzaMadrid@gmail.com', 'Pizzas', 1),
('DPPI', 'Domino\'s Pizza', '910901532', 'Av. de Antonio López, 4, 28320 Pinto, Madrid', 'Pinto', 'DominosPizzaPinto@gmail.com', 'Pizzas', 1),
('DPVA', 'Domino\'s Pizza', '910906177', 'Av. de España, 6, 28342 Valdemoro, Madrid', 'Valdemoro', 'DominosPizzaValdemoro@gmail.com', 'Pizzas', 1),
('FHFU', 'Foster\'s Hollywood', '916075582', 'C.C. La Estación, Calle de Hungría, s / n, 28943 Fuenlabrada, Madrid', 'Fuenlabrada', 'FosterHFuenlabrada@gmail.com', 'Comida Internacional', 0),
('FHGE', 'Foster\'s Hollywood', '916213189', 'Nassica Centro Comercial y de Ocio Ctra. de Andalucía, Salida 17, 28906 Getafe, Madrid', 'Getafe', 'FosterHGetafe@gmail.com', 'Comida Internacional', 0),
('FHPI', 'Foster\'s Hollywood', '916927967', 'Calle Pablo Picasso, 10, 28320 Pinto, Madrid', 'Pinto', 'FosterHPinto@gmail.com', 'Comida Internacional', 0),
('JACO', 'Jade Colonial', '916842062', 'Calle de la Magdalena, 33, 28906 Getafe, Madrid', 'Getafe', 'Jadecolonialgetafe@gmail.com', 'Comida Japonesa', 0),
('MCDG', 'McDonald\'s', '916213143', 'Avda. Rio Guadalquivir, 18 Centro Comercial Nassica, 28906 Getafe, Madrid', 'Getafe', 'McDonalsGetafe@gmil.com', 'Hamburguesas', 0),
('MCDM', 'McDonald\'s', '915313711', 'Calle de la Montera, 47, 28013 Madrid', 'Madrid', 'McDonalsMadrid@gmil.com', 'Hamburguesas', 0),
('MCDP', 'McDonald\'s', '912 91 08 6', 'Ctra. de Andalucía N-IV, Km.20,2 - 28320, 28320 Pinto, Madrid', 'Pinto', 'McDonalsPinto@gmil.com', 'Hamburguesas', 0),
('MCDV', 'McDonald\'s', '916991992', 'Avda. de España, 4 esquina Emilia Pardo Bazan, 28342 Valdemoro, Madrid', 'Valdemoro', 'McDonalsValdemoro@gmil.com', 'Hamburguesas', 0),
('OKSU', 'Ok Sushi', '910181920', 'Calle Arboleda, 14, 28901 Getafe, Madrid', 'Getafe', 'Oksushigetafe@gmail.com', 'Comida Japonesa', 0),
('SDFA', 'Sublime dreams food', '914861073', 'Calle Oslo, 53, 28922 Alcorcón, Madrid', 'Alcorcón', 'Subliemdfalcorcon@gmail.com', 'Hamburguesas', 0),
('SDFM', 'Sublime dreams food', '910224197', 'Calle de Concepción Jerónima, 28, 28012 Madrid', 'Madrid', 'sublimedfmadrid@gmail.com', 'Hamburguesas', 0),
('TGBA', 'The Good Burger', '916428312', 'Av. de América, 7, 9, 28922 Alcorcón, Madrid', 'Alcorcón', 'Thegoodburgeralcorcon@gmail.com', 'Hamburguesas', 0),
('TGBF', 'The Good Burger', '915672170', 'Centro Comercial Plaza Loranca, Av. de Pablo Iglesias, 17, 2', 'Fuenlabrada', 'Thegoodburgerfuenlabrada@gmailcom', 'Hamburguesas', 1),
('TGBG', 'The Good Burger', '912548209', 'Av. Río Guadalquivir, 13, 28906 Getafe, Madrid', 'Getafe', 'Thegoodburgergetafe@gmailcom', 'Hamburguesas', 1),
('TGBL', 'The Good Burger', '916850891', 'C.C. Parquesur, Av. de Gran Bretaña, S / N, 28916 Leganés, Madrid', 'Leganés', 'Thegoodburgerleganes@gmail.com', 'Hamburguesas', 1),
('TGBM', 'The Good Burger', '912081896', 'Calle de Maqueda, 138, 28024 Madrid', 'Madrid', 'Thegoodburgermadrid@gmail.com', 'Hamburguesas', 1),
('VIPG', 'VIPS', '912156209', 'Av. Río Guadalquivir, 13, 28906 Getafe, Madrid', 'Getafe', 'Vipsgetafe@gmail.com', 'Comida Internacional', 0),
('VIPM', 'VIPS', '917283201', 'Calle de la Ribera de Curtidores, 43, 28005 Madrid', 'Madrid', 'Vipsmadrid@gmail.com', 'Comida Internacional', 0),
('VIPV', 'VIPS', '916724189', 'Av. de España, 10, 12, 28340 Valdemoro, Madrid', 'Valdemoro', 'Vipsvaldemoro@gmail.com', 'Comida Internacional', 0),
('VMGE', 'Venganza Malinche', '914495515', 'Calle Ricardo de la Vega, 1, 28903 Getafe, Madrid', 'Getafe', 'Venganzamalgetafe@gmail.com', 'Comida Mexicana', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`ID_CLIENTE`),
  ADD UNIQUE KEY `EMAIL_CLIENTE` (`EMAIL_CLIENTE`);

--
-- Indices de la tabla `detalle_pedido_menu`
--
ALTER TABLE `detalle_pedido_menu`
  ADD PRIMARY KEY (`NUMERO_PEDIDO`,`ID_MENU`),
  ADD KEY `ID_MENU` (`ID_MENU`);

--
-- Indices de la tabla `detalle_pedido_producto`
--
ALTER TABLE `detalle_pedido_producto`
  ADD PRIMARY KEY (`NUMERO_PEDIDO`,`ID_PRODUCTO`),
  ADD KEY `ID_PRODUCTO` (`ID_PRODUCTO`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`ID_MENU`),
  ADD KEY `ID_RESTAURANTE` (`ID_RESTAURANTE`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`NUMERO_PEDIDO`),
  ADD KEY `ID_CLIENTE` (`ID_CLIENTE`),
  ADD KEY `ID_RESTAURANTE` (`ID_RESTAURANTE`),
  ADD KEY `ID_REPARTIDOR` (`ID_REPARTIDOR`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`ID_PRODUCTO`),
  ADD KEY `ID_RESTAURANTE` (`ID_RESTAURANTE`);

--
-- Indices de la tabla `productos_menu`
--
ALTER TABLE `productos_menu`
  ADD PRIMARY KEY (`ID_MENU`,`ID_PRODUCTO`),
  ADD KEY `ID_PRODUCTO` (`ID_PRODUCTO`);

--
-- Indices de la tabla `repartidor`
--
ALTER TABLE `repartidor`
  ADD PRIMARY KEY (`ID_REPARTIDOR`),
  ADD UNIQUE KEY `ALTER_KEY2` (`DNI_REPARTIDOR`);

--
-- Indices de la tabla `restaurante`
--
ALTER TABLE `restaurante`
  ADD PRIMARY KEY (`ID_RESTAURANTE`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `ID_CLIENTE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `ID_MENU` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `NUMERO_PEDIDO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `ID_PRODUCTO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `repartidor`
--
ALTER TABLE `repartidor`
  MODIFY `ID_REPARTIDOR` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedido_menu`
--
ALTER TABLE `detalle_pedido_menu`
  ADD CONSTRAINT `detalle_pedido_menu_ibfk_1` FOREIGN KEY (`NUMERO_PEDIDO`) REFERENCES `pedido` (`NUMERO_PEDIDO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_pedido_menu_ibfk_2` FOREIGN KEY (`ID_MENU`) REFERENCES `menu` (`ID_MENU`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_pedido_producto`
--
ALTER TABLE `detalle_pedido_producto`
  ADD CONSTRAINT `detalle_pedido_producto_ibfk_1` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `producto` (`ID_PRODUCTO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_pedido_producto_ibfk_2` FOREIGN KEY (`NUMERO_PEDIDO`) REFERENCES `pedido` (`NUMERO_PEDIDO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`ID_RESTAURANTE`) REFERENCES `restaurante` (`ID_RESTAURANTE`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `cliente` (`ID_CLIENTE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`ID_RESTAURANTE`) REFERENCES `restaurante` (`ID_RESTAURANTE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pedido_ibfk_3` FOREIGN KEY (`ID_REPARTIDOR`) REFERENCES `repartidor` (`ID_REPARTIDOR`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`ID_RESTAURANTE`) REFERENCES `restaurante` (`ID_RESTAURANTE`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos_menu`
--
ALTER TABLE `productos_menu`
  ADD CONSTRAINT `productos_menu_ibfk_1` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `producto` (`ID_PRODUCTO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_menu_ibfk_2` FOREIGN KEY (`ID_MENU`) REFERENCES `menu` (`ID_MENU`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
