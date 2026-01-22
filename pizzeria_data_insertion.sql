USE pizzeria;

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