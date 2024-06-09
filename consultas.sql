-- Active: 1717012450849@@127.0.0.1@3306@tallerautomotriz

-- 1.Obtener el historial de reparaciones de un vehículo específico

SELECT 
    * 
FROM 
    reparacion  r
JOIN 
    vehiculo v ON v.idvehiculo = r.idvehiculo
WHERE 
    v.placa = 'EFG123';

/* 2. Calcular el costo total de todas las reparaciones realizadas por un empleado
específico en un período de tiempo */

SELECT 
    SUM(r.costoTotal) AS costoTotal
FROM 
    reparacion r
JOIN 
    reparacionEmpleado re ON r.idReparacion = re.idReparacion
JOIN 
    empleado e ON re.idEmpleado = e.idEmpleado
WHERE 
    e.idEmpleado = 1 AND r.fecha BETWEEN '2024-01-01' AND '2024-12-31';
 -- Comprobacion
 SELECT 
    *
FROM 
    reparacion r
JOIN 
    reparacionEmpleado re ON r.idReparacion = re.idReparacion
JOIN 
    empleado e ON re.idEmpleado = e.idEmpleado
WHERE 
    e.idEmpleado = 1;

--  3. Listar todos los clientes y los vehículos que poseen

SELECT 
    c.nombre AS cliente_nombre, c.apellido1 AS cliente_apellido1, v.placa AS vehiculo_placa, m.nombreMarca AS vehiculo_marca, mo.nombreModelo AS vehiculo_modelo
FROM 
    cliente c
JOIN 
    vehiculo v ON c.idCliente = v.idCliente
JOIN 
    modelo mo ON v.idModelo = mo.idModelo
JOIN 
    marca m ON mo.idMarca = m.idMarca;

-- 4. Obtener la cantidad de piezas en inventario para cada pieza
SELECT 
    p.nombrePieza,ip.cantidad
FROM 
    pieza p
JOIN 
    inventarioPiezas ip ON p.idPieza = ip.idPieza;

--5. Obtener las citas programadas para un día específico
SELECT
    *
FROM
    cita c
WHERE
    c.fechaHora  BETWEEN '2024-06-07 00:00:00' AND '2024-06-07 23:59:59';

-- 6.   Generar una factura para un cliente específico en una fecha determinada

SELECT
    *
FROM 
    cliente c
JOIN
    facturacion f ON f.idCliente = c.idCliente
WHERE
    c.idCliente = 1 AND f.fecha = '2024-06-01 10:30:00';

-- 7. Listar todas las órdenes de compra y sus detalles

SELECT 
    oc.idOrdenCompra, oc.fecha, oc.total, p.nombre AS proveedor_nombre, CONCAT(e.nombre,' ',e.apellido1) AS 'Empleado que realiza compra', od.idPieza, od.cantidad, od.precio, pi.nombrePieza
FROM 
    ordenCompra oc
JOIN 
    ordenDetalle od ON oc.idOrdenCompra = od.idOrdenCompra
JOIN 
    proveedor p ON oc.idProveedor = p.idProveedor
JOIN 
    empleado e ON oc.idEmpleado = e.idEmpleado
JOIN 
    pieza pi ON od.idPieza = pi.idPieza;

-- 8.  Obtener el costo total de piezas utilizadas en una reparación específica
SELECT 
    r.idReparacion, SUM(rp.cantidad * p.precioVenta) AS costoTotalPiezas
FROM 
    reparacion r
JOIN 
    reparacionPiezas rp ON r.idReparacion = rp.idReparacion
JOIN 
    pieza p ON rp.idPieza = p.idPieza
WHERE 
    r.idReparacion = 1
GROUP BY 
    r.idReparacion;

-- 9. Obtener el inventario de piezas que necesitan ser reabastecidas (cantidad menor que un umbral)
SELECT 
    p.idPieza, p.nombrePieza, SUM(i.cantidad) AS totalPiezas
FROM 
    pieza p
JOIN 
    inventarioPiezas i ON p.idPieza = i.idPieza
WHERE
     i.cantidad < 100
GROUP BY 
p.idPieza, p.nombrePieza;
