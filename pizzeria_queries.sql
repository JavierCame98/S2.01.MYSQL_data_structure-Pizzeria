USE pizzeria;

SELECT
    c.nombre AS Cliente,
    l.nombre AS Ciudad,
    p.nombre AS Provincia
FROM cliente c
         JOIN localidad l ON c.id_localidad = l.id_localidad
         JOIN provincia p ON l.id_provincia = p.id_provincia;

SELECT
    pe.id_pedido,
    pe.fecha,
    cl.nombre AS Cliente,
    t.nombre AS Tienda,
    e.nombre AS Repartidor,
    r.fecha_entrega
FROM pedido pe
         JOIN cliente cl ON pe.id_cliente = cl.id_cliente
         JOIN tienda t ON pe.id_tienda = t.id_tienda
         LEFT JOIN reparto r ON pe.id_pedido = r.id_pedido
         LEFT JOIN empleado e ON r.id_empleado = e.id_empleado;

SELECT SUM(pp.cantidad) AS total_bebidas_vendidas
FROM pedido_producto pp
         JOIN producto p ON pp.id_producto = p.id_producto
         JOIN pedido pe ON pp.id_pedido = pe.id_pedido
         JOIN tienda t ON pe.id_tienda = t.id_tienda
         JOIN localidad l ON t.id_localidad = l.id_localidad
WHERE p.tipo_producto = 'Bebida'
  AND l.nombre = 'Barcelona';


SELECT e.nombre, e.apellido, COUNT(r.id_pedido) AS total_pedidos_repartidos
FROM empleado e
         JOIN reparto r ON e.id_empleado = r.id_empleado
WHERE e.id_empleado = 1;