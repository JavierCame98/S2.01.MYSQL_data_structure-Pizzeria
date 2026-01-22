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