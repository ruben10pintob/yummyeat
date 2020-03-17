-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-03-2020 a las 01:45:55
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
  `NOMBRE_PRODUCTO` varchar(40) NOT NULL,
  `DESCRIPCION_PRODUCTO` varchar(150) NOT NULL,
  `CATEGORIA_PRODUCTO` varchar(50) DEFAULT NULL,
  `PRECIO_PRODUCTO` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`ID_PRODUCTO`, `NOMBRE_PRODUCTO`, `DESCRIPCION_PRODUCTO`, `CATEGORIA_PRODUCTO`, `PRECIO_PRODUCTO`) VALUES
(1, 'New York MeatBalls', 'Salsa de tomate, queso 100% mozzarella, pepperoni, meatballs, salsa BBQ por encima y queso cheddar en los bordes.', 'Comida principal', '12.90'),
(2, 'Oklahoma Bacon Crispy', 'Salsa BBQ original, queso 100% mozzarella, pepperoni, york, bacon cripy y queso cheddar en el borde.', 'Comida principal', '12.90'),
(3, 'Texas BBQ Crispy', 'Salsa BBQ Texas, queso 100% mozzarella, bacon crispy, bacon, pollo a la parrilla, carne de vacuno, queso cheddar en el borde y salsa.', 'Comida principal', '12.90'),
(4, 'Cremozza al estilo Bourbon', 'Base de crema fresca, queso 100% mozzarella, bacon, pollo a la parrilla, cebolla y salsa Bourbon', 'Comida principal', '11.90'),
(5, 'Cremozza BBQ', 'Base de crema fresca, queso 100% mozzarella, bacon, pollo a la parrila, cebolla, salsa barbacoa.', 'Comida principal', '11.90'),
(6, 'Cabramelizada', 'Crema fresca, queso 100% mozzarella, queso de cabra, cebolla caramelizada.', 'Comida principal', '11.90'),
(7, 'Cheesix', 'Crema fresca, queso 100% mozzarella, cheddar, emmental, parmesano, gorgonzola, queso de cabra.', 'Comida principal', '11.90'),
(8, 'Pecado Carnal', 'Salsa de tomate, extra de queso 100% mozzarella, carne de vacuno, bacon, pepperoni, york.', 'Comida principal', '10.90'),
(9, 'Carbonara', 'Crema fresca, queso 100% mozzarella, bacon, champiñon y cebolla.', 'Comida principal', '10.90'),
(10, 'Extravaganzza', 'Sala de tomate, mozzarella, carne de vacuno, pepperoni, York, bacon, cebolla, pimiento verde, champiñon y aceitunas negras.', 'Comida principal', '10.90'),
(11, 'Barbacoa', 'Salsa barbacoa, queso 100% mozzarella, carne de vacuno, cebolla, bacon, maiz', 'Comida principal', '10.90'),
(12, 'Hawaiana Plus', 'Salsa de tomate, extra de queso 100% mozzarella, doble de York y piña.', 'Comida principal', '10.90'),
(13, 'Pollo a la Parrilla', 'Salsa de tomate, queso 100% mozzarella, doble de pollo a la parrilla, cebolla, champiñon y maíz.', 'Comida principal', '10.90'),
(14, 'Cuatro  Quesos', 'Salsa de tomate, queso 100% mozzarella, cheddar, emmental y gorgonzola.', 'Comida principal', '10.90'),
(15, 'Tony Pepperoni', 'Salsa de tomate, extra de queso 100% mozzarella y doble de pepperoni.', 'Comida principal', '10.90'),
(16, 'Patanegra', 'Salsa de tomate, queso 100% mozzarella, jamón serrano, aceite de oliva, aceitunas negras, tomate natural y orégano.', 'Comida principal', '10.90'),
(17, 'Campiña', 'Salsa de tomate, extra de queso 100% mozzarella, champiñón, pimiento verde, cebolla, aceitunas negras y tomate natural.', 'Comida principal', '10.90'),
(19, 'Cheese &  Bacon Fries', 'Nuestras patatas con bacon crispy y deliciosa salsa cheddar.', 'Complemento', '7.90'),
(20, 'Patatas Grill', 'Crujientes patatas horneadas acompañadas de una salsa a elegir.', 'Complemento', '7.90'),
(21, 'Combo de pollo', 'Strippers, Kickers y Alitas (17 uds).', 'Complemento', '9.90'),
(22, 'Combo de alitas', 'Alitas en salsa Bourbon, Mostaza y miel y Barbacoa (18 uds).', 'Complemento', '9.90'),
(23, 'Alitas de pollo', 'Sabrosas alitas de pollo marinadas (6uds).', 'Complemento', '6.90'),
(24, 'Alitas de polllo con salsa', 'Sabrosas alitas de pollo marinadas con salsa.', 'Complemento', '7.90'),
(25, 'Kickers', 'Pequeñas pechugas de pollo empanadas, con rebozado picante (6uds).', 'Complemento', '6.90'),
(26, 'Strippers', 'Tiras de pollo empanadas (5uds).', 'Complemento', '6.90'),
(27, 'Camembits', 'Deliciosos bocados de queso que se funden en tu boca.', 'Complemento', '6.90'),
(28, 'Pan de ajo con queso', 'Crujiente pan de ajo tostado con queso 100% mozzarella fundido (4 o 6 uds).', 'Complemento', '0.00'),
(29, 'Brownkie', 'Una deliciosa unión de cookies y brownie fundido.', 'Postre', '4.95'),
(30, 'Chococheese', 'Cremoso volcán de queso con una esponjosa base de brownie de chocolate.', 'Postre', '4.95'),
(35, 'Cookies', 'Deliciosas galletas con pepitas de chocolate.', 'Postre', '3.95'),
(36, 'Vulcano de chocolate', 'Delicioso bizcocho de chocolate relleno de chocolate fundido.', 'Postre', '3.95'),
(37, 'Pepsi', 'Pepsi clásica lata 33cl.', 'Bebida', '1.50'),
(38, 'Pepsi Max', 'Pepsi Maaxlata 33cl.', 'Bebida', '1.50'),
(39, 'Red Bull', 'Red Bull lata 25cl.', 'Bebida', '2.30'),
(40, 'Kas Naranja', 'Kas Naranja lata 33cl.', 'Bebida', '1.50'),
(43, 'Kas Limón', 'Kas Limón lata 33cl.', 'Bebida', '1.50'),
(44, 'Agua', 'Agua sin gas 50cl.', 'Bebida', '1.10');

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
-- Estructura de tabla para la tabla `producto_restaurante`
--

CREATE TABLE `producto_restaurante` (
  `ID_PRODUCTO` int(4) NOT NULL,
  `ID_RESTAURANTE` char(4) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto_restaurante`
--

INSERT INTO `producto_restaurante` (`ID_PRODUCTO`, `ID_RESTAURANTE`) VALUES
(1, 'DPAL'),
(2, 'DPAL'),
(3, 'DPAL'),
(4, 'DPAL'),
(5, 'DPAL'),
(6, 'DPAL'),
(7, 'DPAL'),
(8, 'DPAL'),
(9, 'DPAL'),
(10, 'DPAL'),
(11, 'DPAL'),
(12, 'DPAL'),
(13, 'DPAL'),
(14, 'DPAL'),
(15, 'DPAL'),
(16, 'DPAL'),
(17, 'DPAL'),
(19, 'DPAL'),
(20, 'DPAL'),
(21, 'DPAL'),
(22, 'DPAL'),
(23, 'DPAL'),
(24, 'DPAL'),
(25, 'DPAL'),
(26, 'DPAL'),
(27, 'DPAL'),
(28, 'DPAL'),
(29, 'DPAL'),
(30, 'DPAL'),
(37, 'DPAL'),
(38, 'DPAL'),
(39, 'DPAL'),
(40, 'DPAL'),
(35, 'DPAL'),
(36, 'DPAL'),
(1, 'DPFU'),
(2, 'DPFU'),
(3, 'DPFU'),
(4, 'DPFU'),
(5, 'DPFU'),
(6, 'DPFU'),
(7, 'DPFU'),
(8, 'DPFU'),
(9, 'DPFU'),
(10, 'DPFU'),
(11, 'DPFU'),
(12, 'DPFU'),
(13, 'DPFU'),
(14, 'DPFU'),
(15, 'DPFU'),
(16, 'DPFU'),
(17, 'DPFU'),
(19, 'DPFU'),
(20, 'DPFU'),
(21, 'DPFU'),
(22, 'DPFU'),
(23, 'DPFU'),
(24, 'DPFU'),
(25, 'DPFU'),
(26, 'DPFU'),
(27, 'DPFU'),
(28, 'DPFU'),
(29, 'DPFU'),
(30, 'DPFU'),
(37, 'DPFU'),
(38, 'DPFU'),
(39, 'DPFU'),
(40, 'DPFU'),
(35, 'DPFU'),
(36, 'DPFU'),
(1, 'DPMA'),
(2, 'DPMA'),
(3, 'DPMA'),
(4, 'DPMA'),
(5, 'DPMA'),
(6, 'DPMA'),
(7, 'DPMA'),
(8, 'DPMA'),
(9, 'DPMA'),
(10, 'DPMA'),
(11, 'DPMA'),
(12, 'DPMA'),
(13, 'DPMA'),
(14, 'DPMA'),
(15, 'DPMA'),
(16, 'DPMA'),
(17, 'DPMA'),
(19, 'DPMA'),
(20, 'DPMA'),
(21, 'DPMA'),
(22, 'DPMA'),
(23, 'DPMA'),
(24, 'DPMA'),
(25, 'DPMA'),
(26, 'DPMA'),
(27, 'DPMA'),
(28, 'DPMA'),
(29, 'DPMA'),
(30, 'DPMA'),
(37, 'DPMA'),
(38, 'DPMA'),
(39, 'DPMA'),
(40, 'DPMA'),
(35, 'DPMA'),
(36, 'DPMA'),
(1, 'DPPI'),
(2, 'DPPI'),
(3, 'DPPI'),
(4, 'DPPI'),
(5, 'DPPI'),
(6, 'DPPI'),
(7, 'DPPI'),
(8, 'DPPI'),
(9, 'DPPI'),
(10, 'DPPI'),
(11, 'DPPI'),
(12, 'DPPI'),
(13, 'DPPI'),
(14, 'DPPI'),
(15, 'DPPI'),
(16, 'DPPI'),
(17, 'DPPI'),
(19, 'DPPI'),
(20, 'DPPI'),
(21, 'DPPI'),
(22, 'DPPI'),
(23, 'DPPI'),
(24, 'DPPI'),
(25, 'DPPI'),
(26, 'DPPI'),
(27, 'DPPI'),
(28, 'DPPI'),
(29, 'DPPI'),
(30, 'DPPI'),
(37, 'DPPI'),
(38, 'DPPI'),
(39, 'DPPI'),
(40, 'DPPI'),
(35, 'DPPI'),
(36, 'DPPI'),
(1, 'DPVA'),
(2, 'DPVA'),
(3, 'DPVA'),
(4, 'DPVA'),
(5, 'DPVA'),
(6, 'DPVA'),
(7, 'DPVA'),
(8, 'DPVA'),
(9, 'DPVA'),
(10, 'DPVA'),
(11, 'DPVA'),
(12, 'DPVA'),
(13, 'DPVA'),
(14, 'DPVA'),
(15, 'DPVA'),
(16, 'DPVA'),
(17, 'DPVA'),
(19, 'DPVA'),
(20, 'DPVA'),
(21, 'DPVA'),
(22, 'DPVA'),
(23, 'DPVA'),
(24, 'DPVA'),
(25, 'DPVA'),
(26, 'DPVA'),
(27, 'DPVA'),
(28, 'DPVA'),
(29, 'DPVA'),
(30, 'DPVA'),
(37, 'DPVA'),
(38, 'DPVA'),
(39, 'DPVA'),
(40, 'DPVA'),
(35, 'DPVA'),
(36, 'DPVA');

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
  ADD PRIMARY KEY (`ID_PRODUCTO`);

--
-- Indices de la tabla `productos_menu`
--
ALTER TABLE `productos_menu`
  ADD PRIMARY KEY (`ID_MENU`,`ID_PRODUCTO`),
  ADD KEY `ID_PRODUCTO` (`ID_PRODUCTO`);

--
-- Indices de la tabla `producto_restaurante`
--
ALTER TABLE `producto_restaurante`
  ADD KEY `ID_PRODUCTO` (`ID_PRODUCTO`),
  ADD KEY `ID_RESTAURANTE` (`ID_RESTAURANTE`);

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
  MODIFY `ID_PRODUCTO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

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
-- Filtros para la tabla `productos_menu`
--
ALTER TABLE `productos_menu`
  ADD CONSTRAINT `productos_menu_ibfk_1` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `producto` (`ID_PRODUCTO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_menu_ibfk_2` FOREIGN KEY (`ID_MENU`) REFERENCES `menu` (`ID_MENU`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto_restaurante`
--
ALTER TABLE `producto_restaurante`
  ADD CONSTRAINT `producto_restaurante_ibfk_1` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `producto` (`ID_PRODUCTO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `producto_restaurante_ibfk_2` FOREIGN KEY (`ID_RESTAURANTE`) REFERENCES `restaurante` (`ID_RESTAURANTE`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
