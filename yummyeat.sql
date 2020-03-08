DROP DATABASE IF EXISTS YUMMYEAT;
CREATE DATABASE YUMMYEAT;
USE YUMMYEAT;

CREATE TABLE CLIENTE (
	ID_CLIENTE INT NOT NULL AUTO_INCREMENT,
	DNI_CLIENTE CHAR(11) NOT NULL,
	NOMBRE_CLIENTE VARCHAR(30) NOT NULL,
	APELLIDOS_CLIENTE VARCHAR(40) NOT NULL,
	TELEFONO_CLIENTE CHAR(11) NOT NULL,
	DIRECCION_CLIENTE VARCHAR(60) NOT NULL,
	EMAIL_CLIENTE VARCHAR(40) NOT NULL,
	TIPO_CLIENTE CHAR(1) NOT NULL COMMENT '0 -> NO REGISTRADO 1 -> REGISTRADO',
 PRIMARY KEY (ID_CLIENTE)) ENGINE = INNODB;

CREATE TABLE RESTAURANTE (
	ID_RESTAURANTE CHAR(4) NOT NULL,
	NOMBRE_RESTAURANTE VARCHAR(40) NOT NULL,
	TELEFONO_RESTAURANTE CHAR(11) NOT NULL,
	DIRECCION_RESTAURANTE VARCHAR(60) NOT NULL,
	EMAIL_RESTAURANTE VARCHAR(40) NOT NULL,
 PRIMARY KEY (ID_RESTAURANTE)) ENGINE = INNODB;

CREATE TABLE REPARTIDOR (
	ID_REPARTIDOR INT NOT NULL AUTO_INCREMENT,
	ID_ESTABLECIMIENTO CHAR(3) NOT NULL,
	DNI_REPARTIDOR CHAR(11) NOT NULL,
	NOMBRE_REPARTIDOR VARCHAR(30) NOT NULL,
	APELLIDOS_REPARTIDOR VARCHAR(40) NOT NULL,
	TELEFONO_REPARTIDOR CHAR(11) NOT NULL,
	DIRECCION_REPARTIDOR VARCHAR(60) NOT NULL,
	EMAIL_REPARTIDOR VARCHAR(40) NOT NULL,
	SALARIO_REPARTIDOR DECIMAL(10,2) NOT NULL,
	INICIO_CONTRATO DATETIME NOT NULL,
	FIN_CONTRATO DATETIME NOT NULL,
 PRIMARY KEY (ID_REPARTIDOR)) ENGINE = INNODB;

CREATE TABLE ESTABLECIMIENTO (
	ID_ESTABLECIMIENTO CHAR(3) NOT NULL,
	TELEFONO_ESTABLECIMIENTO CHAR(11) NOT NULL,
	DIRECCION_ESTABLECIMIENTO VARCHAR(60) NOT NULL,
	EMAIL_ESTABLECIMIENTO VARCHAR(40) NOT NULL,
 PRIMARY KEY (ID_ESTABLECIMIENTO)) ENGINE = INNODB;

CREATE TABLE PRODUCTO (
	ID_PRODUCTO CHAR(4) NOT NULL,
	ID_RESTAURANTE CHAR(4) NOT NULL,
	NOMBRE_PRODUCTO VARCHAR(40) NOT NULL,
	PRECIO_PRODUCTO DECIMAL(10,2) NOT NULL,
 PRIMARY KEY (ID_PRODUCTO)) ENGINE = INNODB;

CREATE TABLE PEDIDO (
	NUMERO_PEDIDO INT NOT NULL AUTO_INCREMENT,
	ID_ESTABLECIMIENTO CHAR(3) NOT NULL,
	ID_RESTAURANTE CHAR(4) NOT NULL,
	ID_CLIENTE INT NOT NULL,
	ID_REPARTIDOR INT NOT NULL,
	PRECIO_PEDIDO DECIMAL(10,2) NOT NULL,
	FECHA_PEDIDO_ENTREGADO DATETIME NOT NULL,
	FECHA_PEDIDO_REALIZADO DATETIME,
 PRIMARY KEY (NUMERO_PEDIDO)) ENGINE = INNODB;

CREATE TABLE DETALLE_PEDIDO_PRODUCTO (
	NUMERO_PEDIDO INT NOT NULL,
	ID_PRODUCTO CHAR(4) NOT NULL,
	UNIDADES_PRODUCTO INT NOT NULL,
 PRIMARY KEY (NUMERO_PEDIDO,ID_PRODUCTO)) ENGINE = INNODB;

CREATE TABLE MENU (
	ID_MENU CHAR(4) NOT NULL,
	ID_RESTAURANTE CHAR(4) NOT NULL,
	NOMBRE_MENU VARCHAR(30) NOT NULL,
	PRECIO_MENU DECIMAL(10,2) NOT NULL,
 PRIMARY KEY (ID_MENU)) ENGINE = INNODB;

CREATE TABLE PRODUCTOS_MENU (
	ID_MENU CHAR(4) NOT NULL,
	ID_PRODUCTO CHAR(4) NOT NULL,
 PRIMARY KEY (ID_MENU,ID_PRODUCTO)) ENGINE = INNODB;

CREATE TABLE DETALLE_PEDIDO_MENU (
	NUMERO_PEDIDO INT NOT NULL,
	ID_MENU CHAR(4) NOT NULL,
	UNIDADES_MENU CHAR(20) NOT NULL,
 PRIMARY KEY (NUMERO_PEDIDO,ID_MENU)) ENGINE = INNODB;


ALTER TABLE CLIENTE ADD UNIQUE ALTER_KEY1 (DNI_CLIENTE);
ALTER TABLE REPARTIDOR ADD UNIQUE ALTER_KEY2 (DNI_REPARTIDOR);


ALTER TABLE PEDIDO ADD FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE (ID_CLIENTE) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE PRODUCTO ADD FOREIGN KEY (ID_RESTAURANTE) REFERENCES RESTAURANTE (ID_RESTAURANTE) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE PEDIDO ADD FOREIGN KEY (ID_RESTAURANTE) REFERENCES RESTAURANTE (ID_RESTAURANTE) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE MENU ADD FOREIGN KEY (ID_RESTAURANTE) REFERENCES RESTAURANTE (ID_RESTAURANTE) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE PEDIDO ADD FOREIGN KEY (ID_REPARTIDOR) REFERENCES REPARTIDOR (ID_REPARTIDOR) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE REPARTIDOR ADD FOREIGN KEY (ID_ESTABLECIMIENTO) REFERENCES ESTABLECIMIENTO (ID_ESTABLECIMIENTO) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE PEDIDO ADD FOREIGN KEY (ID_ESTABLECIMIENTO) REFERENCES ESTABLECIMIENTO (ID_ESTABLECIMIENTO) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE DETALLE_PEDIDO_PRODUCTO ADD FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTO (ID_PRODUCTO) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE PRODUCTOS_MENU ADD FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTO (ID_PRODUCTO) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE DETALLE_PEDIDO_PRODUCTO ADD FOREIGN KEY (NUMERO_PEDIDO) REFERENCES PEDIDO (NUMERO_PEDIDO) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE DETALLE_PEDIDO_MENU ADD FOREIGN KEY (NUMERO_PEDIDO) REFERENCES PEDIDO (NUMERO_PEDIDO) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE PRODUCTOS_MENU ADD FOREIGN KEY (ID_MENU) REFERENCES MENU (ID_MENU) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE DETALLE_PEDIDO_MENU ADD FOREIGN KEY (ID_MENU) REFERENCES MENU (ID_MENU) ON DELETE CASCADE ON UPDATE CASCADE;