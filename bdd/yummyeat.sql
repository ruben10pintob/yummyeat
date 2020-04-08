-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-04-2020 a las 23:27:59
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
  `DESCRIPCION_PRODUCTO` varchar(300) NOT NULL,
  `CATEGORIA_PRODUCTO` varchar(50) NOT NULL,
  `PRECIO_PRODUCTO` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`ID_PRODUCTO`, `NOMBRE_PRODUCTO`, `DESCRIPCION_PRODUCTO`, `CATEGORIA_PRODUCTO`, `PRECIO_PRODUCTO`) VALUES
(1, 'New York MeatBalls', 'Salsa de tomate, queso 100% mozzarella, pepperoni, meatballs, salsa BBQ por encima y queso cheddar en los bordes.', 'Principal', '12.90'),
(2, 'Oklahoma Bacon Crispy', 'Salsa BBQ original, queso 100% mozzarella, pepperoni, york, bacon cripy y queso cheddar en el borde.', 'Principal', '12.90'),
(3, 'Texas BBQ Crispy', 'Salsa BBQ Texas, queso 100% mozzarella, bacon crispy, bacon, pollo a la parrilla, carne de vacuno, queso cheddar en el borde y salsa.', 'Principal', '12.90'),
(4, 'Cremozza al estilo Bourbon', 'Base de crema fresca, queso 100% mozzarella, bacon, pollo a la parrilla, cebolla y salsa Bourbon', 'Principal', '11.90'),
(5, 'Cremozza BBQ', 'Base de crema fresca, queso 100% mozzarella, bacon, pollo a la parrila, cebolla, salsa barbacoa.', 'Principal', '11.90'),
(6, 'Cabramelizada', 'Crema fresca, queso 100% mozzarella, queso de cabra, cebolla caramelizada.', 'Principal', '11.90'),
(7, 'Cheesix', 'Crema fresca, queso 100% mozzarella, cheddar, emmental, parmesano, gorgonzola, queso de cabra.', 'Principal', '11.90'),
(8, 'Pecado Carnal', 'Salsa de tomate, extra de queso 100% mozzarella, carne de vacuno, bacon, pepperoni, york.', 'Principal', '10.90'),
(9, 'Carbonara', 'Crema fresca, queso 100% mozzarella, bacon, champiñon y cebolla.', 'Principal', '10.90'),
(10, 'Extravaganzza', 'Sala de tomate, mozzarella, carne de vacuno, pepperoni, York, bacon, cebolla, pimiento verde, champiñon y aceitunas negras.', 'Principal', '10.90'),
(11, 'Barbacoa', 'Salsa barbacoa, queso 100% mozzarella, carne de vacuno, cebolla, bacon, maiz', 'Principal', '10.90'),
(12, 'Hawaiana Plus', 'Salsa de tomate, extra de queso 100% mozzarella, doble de York y piña.', 'Principal', '10.90'),
(13, 'Pollo a la Parrilla', 'Salsa de tomate, queso 100% mozzarella, doble de pollo a la parrilla, cebolla, champiñon y maíz.', 'Principal', '10.90'),
(14, 'Cuatro  Quesos', 'Salsa de tomate, queso 100% mozzarella, cheddar, emmental y gorgonzola.', 'Principal', '10.90'),
(15, 'Tony Pepperoni', 'Salsa de tomate, extra de queso 100% mozzarella y doble de pepperoni.', 'Principal', '10.90'),
(16, 'Patanegra', 'Salsa de tomate, queso 100% mozzarella, jamón serrano, aceite de oliva, aceitunas negras, tomate natural y orégano.', 'Principal', '10.90'),
(17, 'Campiña', 'Salsa de tomate, extra de queso 100% mozzarella, champiñón, pimiento verde, cebolla, aceitunas negras y tomate natural.', 'Principal', '10.90'),
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
(41, 'CERVEZA MAHOU', 'Cervaza Mahou 5 estrellas 33cl', 'Bebida', '0.00'),
(42, 'COCACOLA', 'Cocacola lata 33cl', 'Bebida', '0.00'),
(43, 'Kas Limón', 'Kas Limón lata 33cl.', 'Bebida', '1.50'),
(44, 'Agua', 'Agua sin gas 50cl.', 'Bebida', '1.10'),
(46, 'BACON & CHEESE FRIES', 'No te pierdas nuestras Bacon & Cheese Fries, uno de los platos más icónicos de Foster’s Hollywood: deliciosas y crujientes patatas fritas con mix de q', 'Entrante', '9.95'),
(47, 'NACHOS SAN FERNANDO', 'Un clásico indispensable en tu mesa: Nachos San Fernando, el más puro estilo Foster’s Hollywood. Totopos servidos con quesos fundidos, chili con carne', 'Entrante', '9.95'),
(48, 'BBQ & RANCH CHICKEN FLATBREAD', 'Fina masa cubierta de mix de quesos, salsa barbacoa, pechuga marinada, bacon crispy, salsa ranchera y perejil.', 'Entrante', '9.95'),
(49, 'HOLLYWOOD COMBO', 'Fingers de queso, aros de cebolla, delicias de jalapeños y Foster Chicken Pops (muslitos de alita de pollo), con salsa ranchera y barbacoa, para dip', 'Entrante', '9.95'),
(50, 'FOSTERS CHICKEN POPS', '\r\nMuslitos de alita de pollo marinados en salsa Búfalo picante, acompañados con apio fresco y salsa de queso azul para dipear.', 'Entrante', '9.95'),
(51, 'MAC & CHEESE', '\r\nMacarrones con crema de queso empanados con cereal de maíz sobre salsa de tomate y albahaca, y queso Parmigiano Reggiano rallado.', 'Entrante', '9.95'),
(52, 'GUACAMOLE HECHO EN TU MESA', 'Preparado en tu mesa con aguacate, cebolla, jalapeño, cilantro, sal, lima y Tabasco a tu gusto. Acompañado de totopos para dipear.', 'Entrante', '9.95'),
(53, 'CHOICE CHICKEN FINGERS', '\r\nPechuga de pollo empanada. Elige una salsa: barboca o miel mostaza.', 'Entrante', '9.95'),
(54, ' PULLED SMOKED CHESSE FRIES', '¡Empieza a lo grande con nuestras Pulled Smoked Cheese Fries! Deliciosas y crujientes patatas fritas gratinadas con queso Cheddar ahumado y mix de que', 'Entrante', '9.95'),
(55, 'FINGERS DE QUESO GRAND CENTRAL', 'Queso Gouda empanado. Elige una salsa: ranchera, BBQ o frambuesa.', 'Entrante', '9.95'),
(56, 'AROS DE CEBOLLA', 'Nuestra auténtica receta americana.', 'Entrante', '9.95'),
(57, 'TEX & CHEESE FRIES', 'Patatas fritas acompañadas de mix de quesos, pico de gallo, chili con carne, jalapeños, salsa ranchera, salsa Smoked Red Pepper y cilantro.', 'Entrante', '9.95'),
(58, 'FAJITAS EL PASO', '\r\nCarne de vacuno, pollo o mixtas. Servidas en una sartén caliente y cocinadas con cebolla y pimientos. Envuelve todo en las tortillas de harina de tr', 'Principal', '11.90'),
(59, 'CHICKEN ENCHILADA', 'Tortilla roja de trigo y tomate, rellena de pollo a la parrilla, mix de quesos fundidos y salsa Satay, coronada con salsa\r\nde tomatillo verde ligerame', 'Principal', '11.90'),
(60, 'BURRITO MONTERREY', 'Tortilla de trigo y tomate rellena de tiras de pechuga de pollo marinada a la parrilla, arroz salvaje, mix de quesos, maíz y vinagreta Garden.', 'Principal', '11.90'),
(61, 'SONORA CHICKEN TACOS', 'Tortillas de trigo rellenas de pechuga marinada a la parrilla con ensalada campestre, mix de quesos, vinagreta Garden y lima. Con arroz salvaje y sals', 'Principal', '11.90'),
(62, 'CALIFORNIA SALAD', 'Aquí eres tú el que elige: pide tu Ensalada California clásica o vegetariana. Mezcla de lechugas, queso Feta, arroz basmati, tomates cherry, aguacate, nueces y maíz, coronado con delicioso pollo a la parrilla con especias BBQ, servido con vinagreta Gingersoy y cilantro.', 'Principal', '11.90'),
(63, 'FOSTER CAESAR SALAD', 'Pechuga de pollo a la parrilla, lechuga romana, croutons, queso grana padano, aliñado con salsa parmesana.', 'Principal', '11.90'),
(64, 'MEDITERRANEAN SALAD', 'Paleta ibérica en tiras, queso de cabra, tomates cherry y pasas sobre mezcla de lechugas. Alíñala con la salsa que más te guste, mostaza y miel, aceite y vinagre o nuestra vinagreta dulce Vin Brulé con matices de vino.', 'Principal', '11.90'),
(65, 'SANTA MÓNICA', 'Pollo empanado en trozos, bacon crujiente, mezcla de quesos rallados y tomate sobre una mezcla de lechugas. Elige tu salsa entre susa, queso azul, mostaza y miel o aceite y vinagre.', 'Principal', '11.90'),
(66, ' THE NEWYORKER 325 GRS', 'Jugoso entrecotte sazonado y preparado en nuestra parrilla. Servido con nuestra deliciosa salsa Steakhouse.', 'Principal', '14.90'),
(67, 'FLANK STEAK 300 GRS', 'Corte argentino, vacío de vacuno marinado en cerveza negra. Preparado a la parrilla con carbón vegetal y acompañado con salsa Steakhouse.', 'Principal', '14.90'),
(68, 'SALISBURY STEAKS', 'Sabrosa carne de vacuno aderezada, servida con salsa de champiñones, cebolla pochada y mezcla de quesos fundidos. No te pierdas nuestro delicioso Salisbury Steak acompañado de ensalada de lechuga, tomate y jalapeños.', 'Principal', '14.90'),
(69, 'BEEF BONE', 'Carne de vacuno cocinada lentamente y terminada a la parrilla con salsa BBQ, con cebolla frita, tomate cherry y cilantro. Con 4 tortillas de trigo para montar tus propios tacos con salsa Smoked Red Pepper, pico de gallo, guacamole y lima. Con patatas Dipper, cebollino y salsa Smoked Red Pepper.', 'Principal', '14.90'),
(70, 'NATIONAL STAR RIBS', 'El mejor costillar.', 'Principal', '16.90'),
(71, 'CAVATAPPI CHICKEN PASTA', 'Pasta con crema elaborada con nata, mezcla de queso, cebolla caramelizada y salsa Búfalo picante. Te servimos nuestro Cavatappi Chicken Pasta con pechuga de pollo al estilo cajún o la parrilla y tostadas de pan.', 'Principal', '12.90'),
(72, 'TERIYAKI CHICKEN BROCHETTE', 'Brochetas de pollo rebozados y especiados, pimiento rojo, pimiento verde y cebolla pochada, con salsa teiyaki sobre arroz basmati, con semillas de sésamo y cilantro.', 'Principal', '10.90'),
(73, 'CHICKEN & RICE WOK', 'Pops de pollo rebozados y especiados, caramelizados con salsa Teriyaki, pimiento rojo y verde, cebolla pochada y arroz Basmati. Coronado con semillas de sésamo y cilantro. ', 'Principal', '11.90'),
(74, 'CAESAR SANDWICH', 'Pechuga de pollo a la parrilla, bacon crujiente, lechuga romana y salsa parmesana en pan con semillas y copos de avena.', 'Principal', '10.90'),
(75, 'SOUTHERN CHICKEN SANDWICH', 'Contramuslos de pollo rebozados al estilo sureño con pan Pretzel, lechuga trocadero, tomate, queso Cheddar y bacon ahumado con madera de haya. Con salsa de miel mostaza, pepinillo picado, mango y un toque de yuzu, jugo oriental que aporta el contraste dulce-ácido.', 'Principal', '11.90'),
(76, 'PULLED PORK SANDWICH', 'El Pulled Pork Sandwich, renovado: carne de cerdo deshilachada, con salsa BBQ, cheddar ahumado, lechuga romana aderezada con salsa Yuzu y pepinillos con toques dulces y ácidos. Servidos con nuestras patatas Dipper. La combinación perfecta de sabores.', 'Principal', '11.90'),
(77, 'BLACK LABEL BURGER', 'Disfruta la receta original de la Black Label Burger: Pan con sabor a trufa, queso Cheddar y cebolla morada confitada al Oporto. Acompañado de mayonesa con sabor a trufa, lechuga trocadero, tomate, pepinillo pickle y patatas fritas con queso Parmigiano Reggiano. Puedes cambiar las patatas fritas por', 'Principal', '14.90'),
(78, 'RACLETTE BURGER', 'Carne de vacuno, pan rústico con semillas, salsa Mayo Chipotle, salteado de cebolla y pimientos, pepinillos, cebolla frita y bacon crispy. Acompañada de patatas Dipper y salsa Mayo Chipotle.', 'Principal', '13.90'),
(79, 'ORLEANS BURGER', 'Pollo rebozado al estilo sureño sobre base de guacamole y coronado con chili con carne, servido en pan de cristal, acompañada de patatas Dipper. Y antes de que disfrutes del primer mordisco, la culminamos en tu mesa rallando queso Cheddar madurado.', 'Principal', '13.90'),
(80, 'SMOKED BURGER', 'Prueba la carne de nuestra Smoked Burger, ahumada artesanalmente al estilo Low & Slow con humo de nogal. En pan de cristal, servida con salsa Mayo Smoked Bacon, queso Cheddar ahumado y cebolla pochada, acompañado de patatas Dipper con especias BBQ, lechuga trocadero, tomate, rúcula y pepinillo pickl', 'Principal', '12.90'),
(81, ' TRUFFLED BURGER', 'Carne de vacuno con boletus y aceite de trufa. En pan de trufa con champiñones Portobello, cebolla pochada y  lascas de queso Grana Padano y acompañada de patatas dipper y queso parmesano, Mayo Truffled, rúcula y tomate.', 'Principal', '12.90'),
(82, ' FOSTER CAESAR BURGER', 'Carne de vacuno con queso grana padano, bourbon style bacon, lechuga romana, tomate, salsa parmesana y pan rústico de semillas.', 'Principal', '12.90'),
(83, 'GORGONZOLA BURGER', 'Gorgonzola fundido, cebolla caramelizada, nueces, tomate, rúcula, mayonesa balsámica y pan rústico de semillas', 'Principal', '11.90'),
(84, 'PHILADELPHIA ONION BURGER', '\r\nPhiladelphia, cebolla caramelizada, tomate en rodajas, carne de vacuno, mezcla de lechugas, mayonesa y pan clásico.', 'Principal', '11.90'),
(85, 'TRIBECA BURGER', 'Queso monterrey jack, aguacate y cebolla caramelizada sobre carne de vacuno, rúcula, tomate, salsa de miel mostaza y pan rústico de semillas.', 'Principal', '11.90'),
(86, 'PULLED PORK BURGER', 'Carne de cerdo deshilachada sobre hamburguesa de vacuno con salsa BBQ, queso Cheddar, tomate y lechuga batavia. Con pan clásico y salsa Mayo Smoked Bacon.', 'Principal', '11.90'),
(87, 'THE VEGGIE BURGER', 'Burger de arroz integral, quinoa, beans, salsa BBQ, lechuga trocadero, tomate, aguacate, cebolla morada, maíz, mayonesa garden y queso monterrey jack. En pan rústico de semillas. ', 'Principal', '11.90'),
(88, 'BBQ EGG BURGER', '¡Con huevo a la plancha! Cebolla pochada, bacon ahumado con madera de haya, lechuga batavia, tomate, salsa barbacoa y, por supuesto, carne de vacuno en pan clásico.', 'Principal', '11.90'),
(89, 'DIRECTOR’S CHOICE', 'Director’s Choice, tu Burger de siempre, ahora con los ingredientes que prefieras. Pide nuestra receta recomendada Foster’s Hollywod: Carne de vacuno con queso Cheddar, bacon ahumado con madera de haya, cebolla morada a la plancha, tomate, lechuga Batavia, pan clásico y mayonesa. Además, ¡personal', 'Principal', '10.90'),
(90, ' DIRECTOR’S CHICKEN BURGER', 'Filete de pechuga de pollo a la parrilla, queso Cheddar fundido, bacon, mezcla de lechugas, cebolla morada, tomate en rodajas, mayonesa y pan clásico.', 'Principal', '10.90'),
(91, 'BACON BURGER', 'Bacon, carne de vacuno, patatas fritas, mezcla de lechugas, tomate en rodajas, mayonesa y pan clásico.', 'Principal', '10.90'),
(92, 'CHEESE BURGER', 'Queso cheddar fundido sobre carne de vacuno, lechuga batavia, tomate, mayonesa y pan clásico.', 'Principal', '9.95'),
(93, 'ALL STAR BROWNIE', 'Brownie caliente de chocolate, acompañado de helado de vainilla, cubierto con nueces y nuestra salsa de chocolate caliente.', 'Postre', '7.95'),
(94, 'CHEESE & CHOCOLATE CAKE', 'Tarta de queso con una base de bizcocho de chocolate, servida con nata y chocolate caliente.', 'Postre', '6.95'),
(95, 'PANCAKES PARADISE', 'Tortitas servidas con nata, plátano, nueces, pepitas de chocolate negro y bañadas en sirope de arce y dulce de leche.', 'Postre', '8.95'),
(96, 'NEW YORK CHEESECAKE', 'Tarta de queso, elaborada con philadelphia y acompañada de salsa y frutos del bosque.', 'Postre', '6.95'),
(97, 'AMAZING CHOCO BALL', 'Esfera de chocolate que derretimos frente a ti con chocolate caliente, con interior cremoso de frosting de Oreo® y con trocitos de Chips Ahoy®.', 'Postre', '7.95'),
(98, ' DEATH BY CHOCOLATE', 'Base de bizcocho de chocolate, con helado de chocolate cubierto con una crujiente capa de chocolate blanco\r\ny salsa de chocolate, pepitas de chocolate puro, chispas de azúcar oro y un toque de leche condensada.', 'Postre', '7.95'),
(99, 'DEVIL FOOD CAKE', 'Delicioso bizcocho de chocolate relleno de crema de chocolate, cubierto con chocolate fondant y bañado con nuestra salsa de chocolate y trocitos de galleta Chips Ahoy®.', 'Postre', '7.95'),
(100, 'BANOFFEE CHEESECAKE', 'Tarta de queso y plátano sobre una base de galleta, con dulce de leche y acompañado de plátano en rodajas.', 'Postre', '6.95'),
(101, 'OREO COOKIES SUNDAE', 'El suculento broche final: Oreo Cookies Sundae. Dos bolas de helado de vainilla con galletas Oreo, salsa de chocolate y nata.', 'Postre', '5.95'),
(102, 'COPA DE HELADO BEN & JERRY', 'Dos bolas de delicioso helado: chocolate fudge Brownie, strwberry cheesecake o vainilla cookie dough.', 'Postre', '5.95'),
(103, 'EL GRAND MILKSHAKE AMERICANO', '¡Aquí está nuestro batido americano de siempre! Delicioso batido cremoso y frío de chocolate, vainilla o fresa y servido con barquillo y nata. Atrévete a probar El Gran Milkshake Americano.', 'Postre', '5.95'),
(104, 'WAFFLY JERRY', 'Tres minigofres con helado de vainilla Cookie Dough de Ben & Jerry’s, con dulce de leche y pepitas de chocolate negro.', 'Postre', '4.95'),
(105, 'NACHOS SUBLIME', 'Nachos con queso fundido, jalapeño crujiente, juancamole, judías, carne marinada, crema agria, pico de gallo con salsa de tomate verde.', 'Entrante', '12.00'),
(106, 'TEQUEÑOS', 'Tequeños variados, 3 uds. de queso y 3 uds. de pizza, acompañados de salsa sweet chili.', 'Entrante', '7.00'),
(107, 'CHIKEN TENDERTENDER', 'Crujientes tiras de pollo a la parrilla, en nuestra mezcla secreta y acompañadas de salsa BBQ.', 'Entrante', '9.00'),
(108, 'JUANCAMOLE', 'Exquisito guacamole casero con totopos fritos de maíz.', 'Entrante', '7.00'),
(109, 'HUMMUS AL PESTO', 'Crema de garbanzos con salsa pesto, bastones de zanahoria, acompañada de totopos de maíz.', 'Entrante', '6.00'),
(110, 'HUEVOS ROTOS', 'Chips de boniato, alioli healthy, huevos fritos y picadillo de jamón ibérico.', 'Entrante', '11.00'),
(111, 'STRAWBERRY SALAD', 'Brotes tiernos, fresas, crujiente de cebolla, queso brie, nueces y balsámico de chocolate. (disponibilidad según temporada)', 'Principal', '10.00'),
(112, 'SUBLIME SALAD', 'Ensalada de rúcula, compota de manzana, queso brie, cacahuete, arándano deshidratado y balsámico de trufa.', 'Principal', '10.00'),
(113, 'TEMPLADA SALAD', 'Original ensalada templada con bacon tostado, medallón de queso de cabra, nueces, espinaca y miel de caña.', 'Principal', '10.00'),
(114, 'SUBLIME', '180gr de carne a elegir, salsa de crema de cacahuete, bacon, cebolla caramelizada, queso cheddar, salsa sublime y brotes tiernos.', 'Principal', '13.00'),
(115, 'MEXICAN', '180gr de carne a elegir, guacamole, relish de pepinillo agridulce alemán crema agria, tomate rallado, jalapeño y brotes tiernos.', 'Principal', '13.00'),
(116, 'AVARICE', '180gr de carne a elegir, queso brie, bacon tostado, cebolla crujiente, balsámico de Pedro Ximénez y brotes tiernos.', 'Principal', '11.00'),
(117, 'PURE GLUTTONY', '180gr de carne a elegir, medallón de queso de cabra, bacon, nueces, espinaca fresca y miel de caña.', 'Principal', '11.00'),
(118, 'APPLE', '180gr de carne a elegir, compota de manzana, bacon tostado, queso brie, nueces, rúcula y balsámico de trufa.', 'Principal', '11.00'),
(119, 'CLASSIC', '180gr de carne a elegir, relish de pepinillo, bacon tostado, tomate triturado, cebolla caramelizada, queso cheddar y mayonesa sriracha “ligeramente picante”.', 'Principal', '11.00'),
(120, 'BLUE CHEESE', '180gr de carne a elegir, crema de cabrales, confitura de pimiento, cebolla crujiente y brotes tiernos.', 'Principal', '11.00'),
(121, 'BASIC', '180gr de carne a elegir, queso cheddar y bacon tostado a la parrilla.', 'Principal', '8.00'),
(122, 'DREAMS', '180gr de carne a elegir, cebolla caramelizada, mouse de pato, confitura de pimiento casera, huevo frito y brotes tiernos.', 'Principal', '13.00'),
(123, 'BOURBON', 'Hamburguesa de ternera, medallón de queso de cabra, cebolla caramelizada, salsa bourbon y brotes tiernos.', 'Principal', '12.00'),
(124, 'VEGGIES', 'Hamburguesa de soja bbq, cebolla caramelizada, col morada, relish de pepinillo agridulce alemán, y rúcula.', 'Principal', '10.00'),
(125, 'RIBS BBQ', 'Carne de costillas asadas a fuego lento durante 6 h, queso cheddar salsa bbq, bacon y huevo frito.', 'Principal', '10.00'),
(126, 'IBÉRICA', 'Hamburguesa de tenera, jamón ibérico, queso curado, tomate rallado con aceite de oliva y huevo frito.', 'Principal', '12.00'),
(127, 'CINNAMON', 'Hamburguesa de ternera, mousse de pato, cebolla, caramelizada, compota de manzana, alioli de canela y rúcula.', 'Principal', '12.00'),
(128, 'CARNIVOROUS', 'Hamburguesa de ternera, carne de costillas asadas, doble de queso cheddar, cebolla crujiente, bacon y salsa BBQ.', 'Principal', '15.00'),
(129, 'SWEET BACON', 'Hamburguesa de ternera con mermelada de bacon, queso brie, cebolla frita y caramelizada y baconesa.', 'Principal', '12.00'),
(130, 'DONUS HAMBURGER', 'Hamburguesa de ternera con doble de bacon y cheddar, onus tostado, huevo frito, salsa bbq sublime, todo sobre donas tostados a la parrilla.', 'Principal', '11.00'),
(131, 'CHEESE PORN', '180gr de ternera, aros de cebolla a la cerveza, medallón de queso de cabra, cebolla caramelizada, bacon tostado y salsa Jack Daniel´s original, bañada con salsa de queso cheddar por encima de nuestro jugoso pan.', 'Principal', '14.00'),
(132, 'SUBLIME FIT', 'Hamburguesa de solomillo de pollo de corral desgrasada a la zanahoria, queso rico en proteína, pimiento del piquillo, huevo a la plancha, brotes tiernos y pan proteico multicereal.', 'Principal', '12.00'),
(133, 'HEALTHY', 'Hamburguesa de solomillo de pollo de corral desgrasada a la zanahoria, col morada, crema de queso omega 3, relish de pepinillo, tomate triturado y brotes tiernos sobre pan proteico multicereal.', 'Principal', '11.00'),
(134, 'MEXICAN FIT', 'Hamburguesa de solomillo de pollo de corral desgrasada a la zanahoria, relish de pepinillo, juancamole, jalapeño, tomate triturado y brotes tiernos, sobre pan proteico multicereal.', 'Principal', '12.00'),
(135, 'CHEESE FIT', 'Hamburguesa de solomillo de pollo de corral desgrasada a la zanahoria, con queso de cabra rico en omega 3, relish de pepinillo y brotes tiernos, sobre pan proteico multicereal.', 'Principal', '10.00'),
(136, 'HUMMUS FIT', 'Hamburguesa de solomillo de pollo de corral desgrasada a la zanahoria, hummus, col morada, ali oli healthy y brotes tiernos, sobre pan proteico multicereal.', 'Principal', '10.00'),
(137, 'SANDWICH INVERSO DE CABRA', 'Ternera a la parrilla, rellena de queso de cabra, cebolla caramelizada, y Pedro Ximénez con guarnición.', 'Principal', '11.00'),
(138, 'HAMBURGUESA A LA PARRILLA', '360gr. de nuestra hamburguesa a la parrilla, sin pan y con guarnición.', 'Principal', '11.00'),
(139, 'SUBLIME ICE CREAM', 'Helado de avellana con chocolate Sublime. Rodajas de plátano, crema de cacahuete, donus tostado a la parrilla y coronando nuestro brownie de chocolate con caramelo salado, nata montada y galleta oreo. Ideal para compartir.\r\n\r\nDisfruta de tu día trampa', 'Postre', '9.00'),
(140, 'BROWNIE', 'Auténtico brownie al estilo USA con caramelo salado y rocas de chocolate, acompañado de helado de vainilla y donus tostado a la parrilla.', 'Postre', '6.00'),
(141, 'FIT CHEESE CAKE', 'Tarta de queso desgrasado con crema de chocolate Sublime sin azúcar.', 'Postre', '6.00'),
(142, 'DONUS LOVER', 'Crema de mantequilla de cacahuete, bacon tostado, chocolate Sublime, Kinder bueno, nata montada y galleta oreo entre dos donus tostados a la parrilla.', 'Postre', '6.00'),
(143, 'AMERICAN COOKIES CAKE', 'Tarta de queso y American black cookies con dulce de leche, chocolate y donus tostado a la parrilla.', 'Postre', '6.00'),
(144, 'QUESADILLA CON CARNE AL PASTOR Y QUESO', 'Dos tortillas de trigo rellenas de carne al pastor y queso fundido.', 'Entrante', '10.00'),
(145, 'CHILE CHEESE NACHOS', 'Nachos de maíz recubiertos de chili con carne, queso cheddar fundido, pico de gallo, frijoles, jalapeños, crema agria y guacamole.', 'Entrante', '9.00'),
(146, 'NACHOS TEX MEX', 'Tex Mex\r\n\r\nNachos de maíz, mezcla de quesos, cebolla roja, chorizo picado, chiles jalapeños, cilantro y crema agria.', 'Entrante', '8.00'),
(147, 'NACHOS CON HUMMUS', 'Nachos de maíz acompañados de Hummus de garbanzo y pico de gallo.', 'Entrante', '8.00'),
(148, 'NACHOS CON GUACAMOLE', 'Nachos de maíz acompañados de Guacamole y pico de gallo.', 'Entrante', '8.00'),
(149, 'PATATAS RUSTIC', 'Gajos de patata fritas con dos salsas: salsa especial VIPS y Baconesa.', 'Entrante', '7.00'),
(150, 'AROS DE CEBOLLA', 'Aros de cebolla con Parmesano, orégano, cayena y dos salsas.', 'Entrante', '7.00'),
(151, 'QUESADILLA DE JAMÓN Y QUESO', 'Dos tortillas de harina de trigo, jamón York, queso Cheddar fundido, pico de gallo, crema agria y guacamole.', 'Entrante', '8.00'),
(152, 'CROQUETAS', 'Croquetas de jamón, Mozzarella y pan rallado al estilo japonés. Acompañadas de tomate seco, cebolla crujiente y salsas mayonesa de hierbas y tomate.', 'Entrante', '7.00'),
(153, 'CHICKEN FINGERS', 'Fingers de pollo Cornflakes con salsa BBQ Chipotle y salsa Mostaza & Miel.', 'Entrante', '7.00'),
(154, 'COMBO DE ENTRANTES VIPS', 'Combo de: Aros de cebolla con salsa especial VIPS, Quesadilla de jamón York y queso con pico de gallo, crema agria y guacamole, Croquetas y Nachos Tex Mex.', 'Entrante', '9.00'),
(155, 'VIPS SALAD', 'Ensalada con langostinos salteados, dados de aguacate, tomate cherry, tomate seco y croutons sobre lechuga romana y rúcula. Aliñada con nuestra salsa César.', 'Principal', '10.00'),
(156, 'ENSALADA SICILIANA', 'Tomates Cherry, natural e italiano seco, mezcla de lechuga romana y rúcula, perlas de Mozzarella, aceitunas negras y vinagreta de especias.', 'Principal', '10.00'),
(157, 'ENSALADA VEGGIE', 'Ensalada de bulgur, espinaca, rúcula, lombarda, aguacate, calabacín asado, brotes de cebolla, anacardos, pipas de calabaza y vinagreta.', 'Principal', '10.00'),
(158, 'ENSALADA CÉSAR', 'Lechuga española, queso Parmesano, croutons de pan tostado, pollo crujiente y salsa César.', 'Principal', '10.00'),
(159, 'ENSALADA LOUISIANA', 'Dados de pollo, salsa de Bourbon y melaza, salsa ranch, mezcla de lechugas, pimiento rojo, bacon ahumado y cebolla frita.', 'Principal', '11.00'),
(160, 'ENSALADA TOSCANA', 'Pollo a la plancha, bacon ahumado, queso Gorgonzola, croutons de pan tostado, tomate y mezcla de lechugas.', 'Principal', '10.70'),
(161, 'PIZZA BACON&CREAM', 'Bacon crujiente, champiñones y ajetes sobre Mozzarella fundida y una cremosa salsa blanca en base de focaccia.', 'Principal', '11.00'),
(162, 'PIZZA PEPPERONI', 'Trozos de peperoni crujiente, deliciosa mezcla de quesos y albahaca.', 'Principal', '11.00'),
(163, 'PIZZA MARGARITA', 'Mozzarella fresca fundida y orégano.', 'Principal', '10.00'),
(164, 'PIZZA CAPRESE', 'Tomates cherry sobre una capa de mozzarrella fresca fundida con tomatitos secos.', 'Principal', '10.00'),
(165, 'PIZZA CHICKEN BBQ', 'Dados de pollo acompañados de pimiento rojo, cebolla roja, salsa BBQ Chipotle y perejil sobre Mozzarella fundida.', 'Principal', '11.00'),
(166, 'BOWL BEEF TERIYAKI', 'Tiras de carne de vacuno y verduras orientales salteadas sobre base de noodles de trigo, acompañado de anacardos, sésamo y salsa Teriyaki, ligeramente picante.', 'Principal', '11.00'),
(167, 'BOWL SALMÓN POKE', 'Dados de salmón* marinado en salsa Poke (Soja-Sriracha) sobre una base de arroz, acompañado con aguacate, pepino, rúcula, lombarda y anacardos con un toque de sésamo.', 'Principal', '11.00'),
(168, 'BOWL FALAFEL VEGGIE', 'Falafel con base de bulgur y espinacas, acompañado de pimientos y calabacín asado, queso feta y aceituna negra. Servido con salsa de crema agria con un toque de cilantro.', 'Principal', '11.00'),
(169, 'BOWL LAGONSTINOS SRIRACHA', 'Langostinos salteados con base de arroz y verduras asadas, acompañado de rúcula y salsa Sriracha.', 'Principal', '11.00'),
(170, 'BOWL POLLO ORIENTAL', 'Tiras de pechuga de pollo salteadas, salsa agridulce de soja y piña, pimientos rojos, brócoli, anacardos, sésamo y arroz blanco.', 'Principal', '11.00'),
(171, 'FAJITAS MEXICANAS', 'Fajitas mexicanas de carne a elegir entre: tinga de pollo o cochinita pibil.', 'Principal', '12.00'),
(172, 'SUPREMA DE POLLO', 'Pechuga de pollo a la plancha, ensalada de lechuga, pico de gallo y salsa vinagreta.', 'Principal', '11.00'),
(173, 'MERLUZA A LA ROMANA', 'Lomo de merluza a la romana acompañado de arroz con verduras.', 'Principal', '12.00'),
(174, 'PECHUGA DE POLLO VILLAROY', 'Dos pechugas de pollo envueltas en bechamel y empanadas, huevo frito, ensalada de lechugas, tomate, patatas fritas y salsa de tomate Concassé.', 'Principal', '12.00'),
(175, 'BBQ COSTILLAS VIPS', 'Costillas de cerdo a la BBQ, con aros de cebolla, patatas fritas y salsa BBQ Chipotle.', 'Principal', '14.00'),
(176, 'ENTRECOT ', 'Entrecot de novillo argentino con salsa chimichurri, patatas gajo, judías verdes salteadas y tomate a la plancha.', 'Principal', '15.00'),
(177, 'VIPS BURGUER', 'Doble hamburguesa de vacuno con quesos americano y cheddar, bacon, cebolla roja, pepinillo y salsa BBQ ahumada sobre pan brioche.', 'Principal', '12.00'),
(178, 'BBQ CHICKEN BISTRO', 'Hamburguesa de pechuga de pollo a la plancha en pan brioche tostado, con salsa BBQ Chipotle, cebolla frita, bacon ahumado, queso Cheddar, cebolla roja, pepinillo suave, tomate natural, lechuga Batavia y mayonesa.', 'Principal', '12.00'),
(179, 'VIPS VEGGIE BURGER', 'Hamburguesa de falafel con tzatziki ,queso feta, chutney de tomate seco, lechuga batavia, tomate y cebolla roja en pan brioche.', 'Principal', '11.00'),
(180, 'AGUACATE CHICKEN BURGER', 'Pechuga de pollo a la plancha en pan de mollete, aguacate, tomate seco, cebolla a la plancha, rodajas de tomate, lechuga y salsa de yogur.', 'Principal', '13.00'),
(181, 'ITALIAN DELI', 'Hamburguesa en pan brioche tostado, queso gorgonzola, bacon ahumado, cebolla roja, pepinillo suave, tomate natural y lechuga.', 'Principal', '12.00'),
(182, 'PAMPERA', 'Doble hamburguesa en pan de mollete, bacon, rúcula, queso Provolone y queso Americano cebolla caramelizada y mayonesa de Chimichurri.', 'Principal', '12.00'),
(183, 'THE BIG TOWER', 'Hamburguesa en pan brioche tostado, un aro de cebolla, huevo, queso, bacon, pepinillo y salsa especial.\r\n', 'Principal', '12.00'),
(184, 'FUNDY O\'CLOCK', 'Pan rústico, jamón York, pavo cocido, huevos revueltos y queso Chedda fundido.', 'Principal', '11.00'),
(185, 'JAMÓN YORK Y QUESO', 'Pan blanco o integral tostado a la plancha, jamón York y queso fundido.', 'Principal', '10.20'),
(186, 'FOCACCIA MILANO', 'Pan de Focaccia, pechuga de pollo empanada, queso estilo Parmesano, orégano, cayena, Provolone fundida, salsa de tomate, cebolla roja a la plancha, mayonesa de Pesto, hojas de albahaca y perejil.', 'Principal', '10.00'),
(187, 'VIPS CLUB', 'Pan blanco, tres pisos de pollo, bacon, jamón York, queso americano y queso Emmental, mayonesa, tomate y lechuga.', 'Principal', '11.00'),
(188, 'VIPS ROLL BROOKLYN ', 'Pan enrollado, pollo a la parrilla, jamón York, queso fundido, pepinillo, suave, cebolla caramelizada y salsa Baconesa.', 'Principal', '10.00'),
(189, 'SÁNDWICH CALIFORNIA', 'Sándwich de pan de doce cereales y semillas con verduras asadas y hortalizas: aguacate, pimientos rojos, calabacín, espinacas, brotes de cebolla, albahaca y cebolla frita, con queso de cabra, vinagreta de hierbas y guarnición de chips de verduras.', 'Principal', '11.00'),
(190, 'SÁNDWICH KENTUCKY', 'Carne pulled pork con salsa BBQ Chipotle y queso fundido en pan integral. Servido con salsa BBQ Chipotle.', 'Principal', '11.00'),
(191, 'OREO SURPRISE', 'Galletas Oreo recubiertas con nuestra famosa masa de tortitas VIPS', 'Postre', '5.00'),
(192, 'TORTITAS CON OREO', 'Con salsa de chocolate blanco, plátano natural y trocitos de Oreo.', 'Postre', '5.00'),
(193, 'TORTITAS VIPS', 'Tortitas recién hechas con nata montada VIPS y sirope de chocolate.', 'Postre', '5.00'),
(194, 'BATIDO CON OREO', 'Batido de helado de chocolate blanco, galletas Oreo y nata montada VIPS.', 'Postre', '4.00'),
(195, 'BROWNIE', 'Bizcocho caliente de chocolate, con nueces, cubierto por un helado de vainilla y con salsa de chocolate fundido.', 'Postre', '5.00');

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
(36, 'DPVA'),
(46, 'FHFU'),
(47, 'FHFU'),
(48, 'FHFU'),
(49, 'FHFU'),
(50, 'FHFU'),
(51, 'FHFU'),
(52, 'FHFU'),
(53, 'FHFU'),
(54, 'FHFU'),
(55, 'FHFU'),
(56, 'FHFU'),
(57, 'FHFU'),
(58, 'FHFU'),
(59, 'FHFU'),
(60, 'FHFU'),
(61, 'FHFU'),
(62, 'FHFU'),
(63, 'FHFU'),
(64, 'FHFU'),
(65, 'FHFU'),
(66, 'FHFU'),
(67, 'FHFU'),
(68, 'FHFU'),
(69, 'FHFU'),
(70, 'FHFU'),
(71, 'FHFU'),
(72, 'FHFU'),
(73, 'FHFU'),
(74, 'FHFU'),
(75, 'FHFU'),
(76, 'FHFU'),
(77, 'FHFU'),
(78, 'FHFU'),
(79, 'FHFU'),
(80, 'FHFU'),
(81, 'FHFU'),
(82, 'FHFU'),
(83, 'FHFU'),
(84, 'FHFU'),
(85, 'FHFU'),
(86, 'FHFU'),
(87, 'FHFU'),
(88, 'FHFU'),
(89, 'FHFU'),
(90, 'FHFU'),
(91, 'FHFU'),
(92, 'FHFU'),
(93, 'FHFU'),
(94, 'FHFU'),
(95, 'FHFU'),
(96, 'FHFU'),
(97, 'FHFU'),
(98, 'FHFU'),
(99, 'FHFU'),
(100, 'FHFU'),
(101, 'FHFU'),
(102, 'FHFU'),
(103, 'FHFU'),
(104, 'FHFU'),
(46, 'FHGE'),
(47, 'FHGE'),
(48, 'FHGE'),
(49, 'FHGE'),
(50, 'FHGE'),
(51, 'FHGE'),
(52, 'FHGE'),
(53, 'FHGE'),
(54, 'FHGE'),
(55, 'FHGE'),
(56, 'FHGE'),
(57, 'FHGE'),
(58, 'FHGE'),
(59, 'FHGE'),
(60, 'FHGE'),
(61, 'FHGE'),
(62, 'FHGE'),
(63, 'FHGE'),
(64, 'FHGE'),
(65, 'FHGE'),
(66, 'FHGE'),
(67, 'FHGE'),
(68, 'FHGE'),
(69, 'FHGE'),
(70, 'FHGE'),
(71, 'FHGE'),
(72, 'FHGE'),
(73, 'FHGE'),
(74, 'FHGE'),
(75, 'FHGE'),
(76, 'FHGE'),
(77, 'FHGE'),
(78, 'FHGE'),
(79, 'FHGE'),
(80, 'FHGE'),
(81, 'FHGE'),
(82, 'FHGE'),
(83, 'FHGE'),
(84, 'FHGE'),
(85, 'FHGE'),
(86, 'FHGE'),
(87, 'FHGE'),
(88, 'FHGE'),
(89, 'FHGE'),
(90, 'FHGE'),
(91, 'FHGE'),
(92, 'FHGE'),
(93, 'FHGE'),
(94, 'FHGE'),
(95, 'FHGE'),
(96, 'FHGE'),
(97, 'FHGE'),
(98, 'FHGE'),
(99, 'FHGE'),
(100, 'FHGE'),
(101, 'FHGE'),
(102, 'FHGE'),
(103, 'FHFU'),
(104, 'FHGE'),
(46, 'FHPI'),
(47, 'FHPI'),
(48, 'FHPI'),
(49, 'FHPI'),
(50, 'FHPI'),
(51, 'FHPI'),
(52, 'FHPI'),
(53, 'FHPI'),
(54, 'FHPI'),
(55, 'FHPI'),
(56, 'FHPI'),
(57, 'FHPI'),
(58, 'FHPI'),
(59, 'FHPI'),
(60, 'FHPI'),
(61, 'FHPI'),
(62, 'FHPI'),
(63, 'FHPI'),
(64, 'FHPI'),
(65, 'FHPI'),
(66, 'FHPI'),
(67, 'FHPI'),
(68, 'FHPI'),
(69, 'FHPI'),
(70, 'FHPI'),
(71, 'FHPI'),
(72, 'FHPI'),
(73, 'FHPI'),
(74, 'FHPI'),
(75, 'FHPI'),
(76, 'FHPI'),
(77, 'FHPI'),
(78, 'FHPI'),
(79, 'FHPI'),
(80, 'FHPI'),
(81, 'FHPI'),
(82, 'FHPI'),
(83, 'FHPI'),
(84, 'FHPI'),
(85, 'FHPI'),
(86, 'FHPI'),
(87, 'FHPI'),
(88, 'FHPI'),
(89, 'FHPI'),
(90, 'FHPI'),
(91, 'FHPI'),
(92, 'FHPI'),
(93, 'FHPI'),
(94, 'FHPI'),
(95, 'FHPI'),
(96, 'FHPI'),
(97, 'FHPI'),
(98, 'FHPI'),
(99, 'FHPI'),
(100, 'FHPI'),
(101, 'FHPI'),
(102, 'FHPI'),
(103, 'FHPI'),
(104, 'FHPI'),
(105, 'SDFA'),
(105, 'SDFM'),
(106, 'SDFA'),
(106, 'SDFM'),
(107, 'SDFA'),
(107, 'SDFM'),
(108, 'SDFA'),
(108, 'SDFM'),
(109, 'SDFM'),
(109, 'SDFM'),
(110, 'SDFA'),
(110, 'SDFM'),
(111, 'SDFA'),
(111, 'SDFM'),
(112, 'SDFA'),
(112, 'SDFM'),
(113, 'SDFA'),
(113, 'SDFM'),
(114, 'SDFA'),
(114, 'SDFM'),
(115, 'SDFA'),
(115, 'SDFM'),
(116, 'SDFA'),
(116, 'SDFM'),
(117, 'SDFA'),
(117, 'SDFM'),
(118, 'SDFA'),
(118, 'SDFM'),
(119, 'SDFA'),
(119, 'SDFM'),
(120, 'SDFA'),
(120, 'SDFM'),
(121, 'SDFA'),
(121, 'SDFM'),
(122, 'SDFA'),
(122, 'SDFM'),
(123, 'SDFA'),
(123, 'SDFM'),
(124, 'SDFA'),
(124, 'SDFM'),
(125, 'SDFA'),
(125, 'SDFM'),
(126, 'SDFA'),
(126, 'SDFM'),
(127, 'SDFA'),
(127, 'SDFM'),
(128, 'SDFA'),
(128, 'SDFM'),
(129, 'SDFA'),
(129, 'SDFM'),
(130, 'SDFA'),
(130, 'SDFM'),
(131, 'SDFA'),
(131, 'SDFM'),
(132, 'SDFA'),
(132, 'SDFM'),
(133, 'SDFA'),
(133, 'SDFM'),
(134, 'SDFA'),
(134, 'SDFM'),
(135, 'SDFA'),
(135, 'SDFM'),
(136, 'SDFA'),
(136, 'SDFM'),
(137, 'SDFA'),
(137, 'SDFM'),
(138, 'SDFA'),
(138, 'SDFM'),
(139, 'SDFM'),
(139, 'SDFM'),
(140, 'SDFA'),
(140, 'SDFM'),
(141, 'SDFA'),
(141, 'SDFA'),
(142, 'SDFA'),
(142, 'SDFM'),
(143, 'SDFA'),
(143, 'SDFM'),
(41, 'DPAL'),
(41, 'DPFU'),
(41, 'DPMA'),
(41, 'DPPI'),
(41, 'DPVA'),
(42, 'DPAL'),
(42, 'DPFU'),
(42, 'DPMA'),
(42, 'DPPI'),
(42, 'DPVA'),
(43, 'DPAL'),
(43, 'DPFU'),
(43, 'DPMA'),
(43, 'DPPI'),
(43, 'DPVA'),
(44, 'DPAL'),
(44, 'DPFU'),
(44, 'DPMA'),
(44, 'DPPI'),
(44, 'DPVA'),
(37, 'FHFU'),
(37, 'FHGE'),
(37, 'FHPI'),
(38, 'FHFU'),
(38, 'FHGE'),
(38, 'FHPI'),
(39, 'FHFU'),
(39, 'FHGE'),
(39, 'FHPI'),
(40, 'FHFU'),
(40, 'FHGE'),
(40, 'FHPI'),
(41, 'FHFU'),
(41, 'FHGE'),
(41, 'FHPI'),
(42, 'FHFU'),
(42, 'FHGE'),
(42, 'FHPI'),
(43, 'FHFU'),
(43, 'FHGE'),
(43, 'FHPI'),
(44, 'FHFU'),
(44, 'FHGE'),
(44, 'FHPI'),
(37, 'SDFA'),
(37, 'SDFM'),
(38, 'SDFA'),
(38, 'SDFM'),
(39, 'SDFA'),
(39, 'SDFM'),
(40, 'SDFA'),
(40, 'SDFM'),
(41, 'SDFA'),
(41, 'SDFM'),
(42, 'SDFA'),
(42, 'SDFM'),
(43, 'SDFA'),
(43, 'SDFM'),
(44, 'SDFA'),
(44, 'SDFM'),
(37, 'VIPG'),
(37, 'VIPM'),
(37, 'VIPV'),
(38, 'VIPG'),
(38, 'VIPM'),
(38, 'VIPV'),
(39, 'VIPG'),
(39, 'VIPM'),
(39, 'VIPV'),
(40, 'VIPG'),
(40, 'VIPM'),
(40, 'VIPV'),
(41, 'VIPG'),
(41, 'VIPM'),
(41, 'VIPV'),
(42, 'VIPG'),
(42, 'VIPM'),
(42, 'VIPV'),
(43, 'VIPG'),
(43, 'VIPM'),
(43, 'VIPV'),
(44, 'VIPG'),
(44, 'VIPM'),
(44, 'VIPV'),
(144, 'VIPG'),
(144, 'VIPM'),
(144, 'VIPV'),
(145, 'VIPG'),
(145, 'VIPM'),
(145, 'VIPV'),
(146, 'VIPG'),
(146, 'VIPM'),
(146, 'VIPV'),
(147, 'VIPG'),
(147, 'VIPM'),
(147, 'VIPV'),
(148, 'VIPG'),
(148, 'VIPM'),
(148, 'VIPV'),
(149, 'VIPG'),
(149, 'VIPM'),
(149, 'VIPV'),
(150, 'VIPG'),
(150, 'VIPM'),
(150, 'VIPV'),
(151, 'VIPG'),
(151, 'VIPM'),
(151, 'VIPV'),
(152, 'VIPG'),
(152, 'VIPM'),
(152, 'VIPV'),
(153, 'VIPG'),
(153, 'VIPM'),
(153, 'VIPV'),
(154, 'VIPG'),
(154, 'VIPM'),
(154, 'VIPV'),
(155, 'VIPG'),
(155, 'VIPM'),
(155, 'VIPV'),
(156, 'VIPG'),
(156, 'VIPM'),
(156, 'VIPV'),
(157, 'VIPG'),
(157, 'VIPM'),
(157, 'VIPV'),
(158, 'VIPG'),
(158, 'VIPM'),
(158, 'VIPV'),
(159, 'VIPG'),
(159, 'VIPM'),
(159, 'VIPV'),
(160, 'VIPG'),
(160, 'VIPM'),
(160, 'VIPV'),
(161, 'VIPG'),
(161, 'VIPM'),
(161, 'VIPV'),
(162, 'VIPG'),
(162, 'VIPM'),
(162, 'VIPV'),
(163, 'VIPG'),
(163, 'VIPM'),
(163, 'VIPV'),
(164, 'VIPG'),
(164, 'VIPM'),
(164, 'VIPV'),
(165, 'VIPG'),
(165, 'VIPM'),
(165, 'VIPV'),
(166, 'VIPG'),
(166, 'VIPM'),
(166, 'VIPV'),
(167, 'VIPG'),
(167, 'VIPM'),
(167, 'VIPV'),
(168, 'VIPG'),
(168, 'VIPM'),
(168, 'VIPV'),
(169, 'VIPG'),
(169, 'VIPM'),
(169, 'VIPV'),
(170, 'VIPG'),
(170, 'VIPM'),
(170, 'VIPV'),
(171, 'VIPG'),
(171, 'VIPM'),
(171, 'VIPV'),
(172, 'VIPG'),
(172, 'VIPM'),
(172, 'VIPV'),
(173, 'VIPG'),
(173, 'VIPM'),
(173, 'VIPV'),
(174, 'VIPG'),
(174, 'VIPM'),
(174, 'VIPV'),
(175, 'VIPG'),
(175, 'VIPM'),
(175, 'VIPV'),
(176, 'VIPG'),
(176, 'VIPM'),
(176, 'VIPV'),
(177, 'VIPG'),
(177, 'VIPM'),
(177, 'VIPV'),
(178, 'VIPG'),
(178, 'VIPM'),
(178, 'VIPV'),
(179, 'VIPG'),
(179, 'VIPM'),
(179, 'VIPV'),
(180, 'VIPG'),
(180, 'VIPM'),
(180, 'VIPV'),
(181, 'VIPG'),
(181, 'VIPM'),
(181, 'VIPV'),
(182, 'VIPG'),
(182, 'VIPM'),
(182, 'VIPV'),
(183, 'VIPG'),
(183, 'VIPM'),
(183, 'VIPV'),
(184, 'VIPG'),
(184, 'VIPM'),
(184, 'VIPV'),
(185, 'VIPG'),
(185, 'VIPM'),
(185, 'VIPV'),
(186, 'VIPG'),
(186, 'VIPM'),
(186, 'VIPV'),
(187, 'VIPG'),
(187, 'VIPM'),
(187, 'VIPV'),
(188, 'VIPG'),
(188, 'VIPM'),
(188, 'VIPV'),
(189, 'VIPG'),
(189, 'VIPM'),
(189, 'VIPV'),
(190, 'VIPG'),
(190, 'VIPM'),
(190, 'VIPV'),
(191, 'VIPG'),
(191, 'VIPM'),
(191, 'VIPV'),
(192, 'VIPG'),
(192, 'VIPM'),
(192, 'VIPV'),
(193, 'VIPG'),
(193, 'VIPM'),
(193, 'VIPV'),
(194, 'VIPG'),
(194, 'VIPM'),
(194, 'VIPV'),
(195, 'VIPG'),
(195, 'VIPM'),
(195, 'VIPV');

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
  MODIFY `ID_PRODUCTO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=196;

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
