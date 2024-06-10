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

-- 10. Obtener la lista de servicios más solicitados en un período específico

SELECT
    s.idServicio, s.nombreServicio, COUNT(r.idServicio) AS vecesSolicitas
FROM
    reparacion r
JOIN
    servicio s ON s.idServicio = r.idServicio
WHERE
    r.fecha BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY
    s.idServicio, s.nombreServicio
ORDER BY
    COUNT(r.idServicio) DESC LIMIT 3;

-- 11. Obtener el costo total de reparaciones para cada cliente en un período específico

SELECT
    f.idCliente,  SUM(f.total)
FROM
    facturacion f
WHERE
    f.fecha BETWEEN '2024-01-01 00:00:00' AND '2024-12-31 23:59:59'
GROUP BY
    f.idCliente;

-- 12. Listar los empleados con mayor cantidad de reparaciones realizadas en un período específico

SELECT
    re.idEmpleado, CONCAT(e.nombre," ",e.apellido1), COUNT(re.idEmpleado)
FROM
    reparacionempleado re
JOIN
    reparacion r ON r.idReparacion = re.idReparacion
JOIN
    empleado e ON e.idEmpleado = re.idEmpleado
WHERE
    r.fecha BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY
    re.idEmpleado
ORDER BY
    COUNT(re.idEmpleado) DESC LIMIT 2;

-- 13.Obtener las piezas más utilizadas en reparaciones durante un período específico

SELECT
    rp.idPieza, p.nombrePieza, COUNT(rp.idPieza)
FROM
    reparacionPiezas rp
JOIN
    reparacion r ON r.idReparacion = rp.idReparacion
JOIN
    pieza p ON p.idPieza = rp.idPieza
WHERE
    r.fecha BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY
    rp.idPieza
ORDER BY
    COUNT(rp.idPieza) DESC LIMIT 2;

-- 14. Calcular el promedio de costo de reparaciones por vehículo
SELECT
    AVG(r.costoTotal) as promedioReparaciones
FROM
    reparacion r;
--15. Obtener el inventario de piezas por proveedor

SELECT
    p.nombrePieza, pp.idProveedor, SUM(ip.cantidad) as cantidadDisponible
FROM
    pieza p
JOIN   
    inventariopiezas ip ON p.idPieza = ip.idPieza
JOIN
    proveedorespiezas pp ON p.idPieza = pp.idPieza
GROUP BY 
    p.nombrePieza, pp.idProveedor ;

-- 16. Listar los clientes que no han realizado reparaciones en el último añoSELECT c.idCliente, c.documento, c.nombre, c.apellido1, c.apellido2, c.direccion, c.email
SELECT 
    c.idCliente, c.documento, c.nombre, c.apellido1, c.apellido2, c.direccion, c.email
FROM 
    cliente c
LEFT JOIN 
    vehiculo v ON c.idCliente = v.idCliente
LEFT JOIN 
    reparacion r ON v.idVehiculo = r.idVehiculo AND r.fecha >= CURDATE() - INTERVAL 1 YEAR
WHERE 
    r.idReparacion IS NULL;

-- 17.  Obtener las ganancias totales del taller en un período específico

SELECT 
    SUM(f.total) AS ganancias_totales
FROM 
    facturacion f
WHERE 
    f.fecha BETWEEN '2024-01-01' AND '2024-12-31';

/* 18 . Listar los empleados y el total de horas trabajadas en reparaciones en un
período específico (asumiendo que se registra la duración de cada reparación) */
 SELECT e.nombre, e.apellido1, e.apellido2, SUM(re.duracionHoras) AS total_horas_trabajadas
FROM 
    empleado e
JOIN 
    reparacionEmpleado re ON e.idEmpleado = re.idEmpleado
JOIN 
    reparacion r ON re.idReparacion = r.idReparacion
WHERE 
    r.fecha BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY 
    e.idEmpleado, e.nombre, e.apellido1, e.apellido2;

-- 19. Obtener el listado de servicios prestados por cada empleado en un período específico

SELECT 
    e.nombre, e.apellido1, e.apellido2, s.nombreServicio, r.fecha
FROM 
    empleado e
JOIN 
    reparacionEmpleado re ON e.idEmpleado = re.idEmpleado
JOIN 
    reparacion r ON re.idReparacion = r.idReparacion
JOIN 
    servicio s ON r.idServicio = s.idServicio
WHERE 
    r.fecha BETWEEN '2024-01-01' AND '2024-12-31'
ORDER BY 
    e.idEmpleado, r.fecha;
    


