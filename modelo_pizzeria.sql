SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS pedido_detalle;
DROP TABLE IF EXISTS pedido;
DROP TABLE IF EXISTS producto;
DROP TABLE IF EXISTS pedido_producto;
DROP TABLE IF EXISTS categoria_pizza;
DROP TABLE IF EXISTS empleado;
DROP TABLE IF EXISTS tienda;
DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS localidad;
DROP TABLE IF EXISTS provincia;
DROP TABLE IF EXISTS reparto;

SET FOREIGN_KEY_CHECKS = 1;

USE pizzeria_db;

DROP TABLE IF EXISTS provincia;
CREATE TABLE provincia (
                           id_provincia INT AUTO_INCREMENT PRIMARY KEY,
                           nombre VARCHAR(40) NOT NULL
);

DROP TABLE IF EXISTS localidad;
CREATE TABLE localidad (
                           id_localidad INT AUTO_INCREMENT PRIMARY KEY,
                           nombre VARCHAR(50) NOT NULL,
                           id_provincia INT,
                           FOREIGN KEY (id_provincia) REFERENCES provincia(id_provincia)
);

DROP TABLE IF EXISTS cliente;
CREATE TABLE cliente (
                         id_cliente INT AUTO_INCREMENT PRIMARY KEY,
                         nombre VARCHAR(20) NOT NULL,
                         apellido VARCHAR(30),
                         direccion VARCHAR(40) NOT NULL,
                         codigo_postal VARCHAR(10) NOT NULL,
                         telefono VARCHAR(15) NOT NULL,
                         id_localidad INT,
                         FOREIGN KEY (id_localidad) REFERENCES localidad(id_localidad)
);




CREATE TABLE tienda (
                        id_tienda INT AUTO_INCREMENT PRIMARY KEY,
                        nombre VARCHAR(100) NOT NULL,
                        direccion VARCHAR(100),
                        codigo_postal INT(10),
                        id_localidad INT,
                        FOREIGN KEY (id_localidad) REFERENCES localidad(id_localidad)
);

CREATE TABLE pedido (
                        id_pedido INT AUTO_INCREMENT PRIMARY KEY,
                        fecha DATETIME NOT NULL,
                        tipo_entrega ENUM('domicilio','recogida') NOT NULL,
                        precio_total DECIMAL(8,2),
                        id_cliente INT,
                        id_tienda INT,
                        FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
                        FOREIGN KEY (id_tienda) REFERENCES tienda(id_tienda)
);

CREATE TABLE categoria_pizza (
                           id_categoria INT AUTO_INCREMENT PRIMARY KEY,
                           nombre VARCHAR(50)
);

CREATE TABLE producto (
                          id_producto INT AUTO_INCREMENT PRIMARY KEY,
                          nombre VARCHAR(50) NOT NULL,
                          tipo_producto ENUM('Pizza','Hamburguesa', 'Bebida') NOT NULL,
                          descripcion VARCHAR(100),
                          imagen VARCHAR(100),
                          precio DECIMAL(10,2),
                          id_categoria INT,
                          FOREIGN KEY (id_categoria) REFERENCES categoria_pizza(id_categoria)
);

CREATE TABLE pedido_producto (
                                 id_pedido INT,
                                 id_producto INT,
                                 cantidad INT(20) NOT NULL,
                                 PRIMARY KEY (id_pedido, id_producto),
                                 FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
                                 FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);


CREATE TABLE empleado (
                          id_empleado INT AUTO_INCREMENT PRIMARY KEY,
                          nombre VARCHAR(50) NOT NULL,
                          nif VARCHAR(12) NOT NULL,
                          telefono VARCHAR(12) NOT NULL,
                          categoria ENUM('cocinero', 'repartidor') NOT NULL,
                          id_tienda INT,
                          FOREIGN KEY (id_tienda) REFERENCES tienda(id_tienda)
);

CREATE TABLE reparto (
                         id_pedido INT NOT NULL PRIMARY KEY,
                         id_empleado INT NOT NULL,
                         fecha_entrega DATETIME,
                         FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
                         FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
);