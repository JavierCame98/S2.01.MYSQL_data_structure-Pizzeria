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

INSERT INTO provincia (nombre) VALUES
                                   ('Barcelona'),
                                   ('Madrid');

INSERT INTO localidad (nombre, id_provincia) VALUES
                                                 ('Barcelona', 1),
                                                 ('Hospitalet de Llobregat', 1),
                                                 ('Madrid', 2);

INSERT INTO cliente
(nombre, apellido, direccion, codigo_postal, telefono, id_localidad)
VALUES
    ('Laura', 'Martínez', 'C/ Aragó 120', '08015', '600111222', 1),
    ('Carlos', 'Pérez', 'Av. Diagonal 350', '08013', '600333444', 1),
    ('Marta', 'Gómez', 'C/ Mayor 22', '28901', '600555666', 3);

INSERT INTO tienda
(nombre, direccion, codigo_postal, id_localidad)
VALUES
    ('Pizzeria Centro', 'C/ Gran Via 45', '08010', 1),
    ('Pizzeria Norte', 'Av. Madrid 120', '28901', 3);

INSERT INTO empleado
(nombre, nif, telefono, categoria, id_tienda)
VALUES
    ('Juan López', '12345678A', '611111111', 'cocinero', 1),
    ('Ana Ruiz', '23456789B', '622222222', 'repartidor', 1),
    ('Pedro Sánchez', '34567890C', '633333333', 'repartidor', 2);

INSERT INTO categoria_pizza (nombre) VALUES
                                   ('Clásicas'),
                                   ('Especiales'),
                                   ('Vegetarianas');

INSERT INTO producto
(nombre, tipo_producto, descripcion, imagen, precio, id_categoria)
VALUES
    ('Pizza Margarita', 'Pizza', 'Tomate y mozzarella', 'margarita.jpg', 9.50, 1),
    ('Pizza Barbacoa', 'Pizza', 'Carne y salsa BBQ', 'barbacoa.jpg', 11.00, 2),
    ('Hamburguesa Clásica', 'Hamburguesa', 'Ternera y queso', 'burger.jpg', 8.00, NULL),
    ('Coca-Cola', 'Bebida', 'Refresco 33cl', 'cola.jpg', 2.50, NULL);

INSERT INTO pedido
(fecha, tipo_entrega, precio_total, id_cliente, id_tienda)
VALUES
    ('2025-03-01 13:30:00', 'domicilio', 22.00, 1, 1),
    ('2025-03-02 20:15:00', 'recogida', 11.00, 2, 1),
    ('2025-03-03 21:00:00', 'domicilio', 13.50, 3, 2);

INSERT INTO pedido_producto (id_pedido, id_producto, cantidad)
VALUES
    (1, 1, 1),
    (1, 4, 2),
    (2, 2, 1),
    (3, 3, 1),
    (3, 4, 1);

INSERT INTO reparto
(id_pedido, id_empleado, fecha_entrega)
VALUES
    (1, 2, '2025-03-01 14:00:00'),
    (3, 3, '2025-03-03 21:35:00');

