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
    

/* /// COMIENZO DE SUBCONSULTAS */
-- 1. Obtener el cliente que ha gastado más en reparaciones durante el último año.

SELECT 
    CONCAT(c.nombre," ",c.apellido1) AS cliente , SUM(f.total)
FROM  
    cliente c
JOIN
    facturacion f ON f.idCliente = c.idCliente
WHERE
    c.idCliente = (
        SELECT 
            f.idCliente
        FROM
            facturacion f
        GROUP BY
            f.idCliente
        ORDER BY
            SUM(f.total) DESC LIMIT 1
    ) AND f.fecha BETWEEN '2024-01-01 00:00:00' AND '2024-12-31 23:59:59'
GROUP BY f.idCliente;

-- 2.   Obtener la pieza más utilizada en reparaciones durante el último mes

 
SELECT 
    p.nombrePieza  , SUM(rp.cantidad) VecesUsada
FROM  
    pieza p
JOIN
    reparacionPiezas rp ON rp.idPieza = p.idPieza
JOIN
    reparacion r ON r.idReparacion = rp.idReparacion
WHERE
    p.idPieza = (
        SELECT 
            rp.idPieza
        FROM
            reparacionPiezas rp
        GROUP BY
            rp.idPieza
        ORDER BY
            SUM(rp.cantidad) DESC LIMIT 1
    )        AND r.fecha BETWEEN '2024-05-01 00:00:00' AND '2024-06-30 23:59:59'                 
GROUP BY rp.idPieza;

    -- 3. Obtener los proveedores que suministran las piezas más caras
SELECT 
    pr.nombre AS NombreProveedor,
    p.nombrePieza AS NombrePieza,
    pp.precio AS Precio
FROM 
    proveedoresPiezas pp
JOIN 
    proveedor pr ON pp.idProveedor = pr.idProveedor
JOIN 
    pieza p ON pp.idPieza = p.idPieza
WHERE 
    pp.precio = (SELECT MAX(precio) FROM proveedoresPiezas);

-- 4. Listar las reparaciones que no utilizaron piezas específicas durante el último año

SELECT 
    r.idReparacion, r.fecha, r.costoTotal, r.descripcion, r.idServicio, r.idVehiculo
FROM 
    reparacion r
WHERE 
    r.idReparacion NOT IN (
        SELECT 
            rp.idReparacion
        FROM 
            reparacionPiezas rp
        WHERE 
            rp.idPieza = 1
    ) AND r.fecha  BETWEEN '2024-01-01 00:00:00' AND '2024-12-31 23:59:59'
    ;

-- 5.  Obtener las piezas que están en inventario por debajo del 10% del stock inicial
SELECT 
    p.idPieza,
    p.nombrePieza,
    ip.cantidad AS stockActual,
    si.stockInicial
FROM 
    pieza p
JOIN 
    inventarioPiezas ip ON p.idPieza = ip.idPieza
JOIN 
    (SELECT 
         idPieza, 
         MAX(cantidad) AS stockInicial
     FROM 
         inventarioPiezas
     GROUP BY 
         idPieza) si ON p.idPieza = si.idPieza;

/* --- PROCEDIMIENTOS ALMACENADOS --- */ 

-- 1. Crear un procedimiento almacenado para insertar una nueva reparación.

DELIMITER $$
DROP PROCEDURE IF EXISTS insertarNuevaReparacion;
CREATE PROCEDURE insertarNuevaReparacion(
    IN fecha DATE,
    IN costoTotal DOUBLE(10,2),
    IN descripcion TEXT,
    IN idServicio TINYINT,
    IN idVehiculo TINYINT
)
BEGIN
    DECLARE mensaje VARCHAR(100);
    INSERT INTO reparacion  (idReparacion, fecha, costoTotal, descripcion, idServicio, idVehiculo)
    VALUES (NULL, fecha, costoTotal, descripcion, idServicio, idVehiculo);
    IF ROW_COUNT() > 0 THEN
        SET mensaje = 'El registro se ha creado correctamente.';
    ELSE
        SET mensaje = 'Error al crear el registro.';
    END IF;
    SELECT mensaje AS 'Mensaje';
END $$
DELIMITER ;

CALL insertarNuevaReparacion('2024-06-11',200.00,'Reparacion Agregada con PROCEDURE', 1, 1);

-- 2. Crear un procedimiento almacenado para actualizar el inventario de una pieza.

DELIMITER $$
DROP PROCEDURE IF EXISTS actualizarInventarioPieza;
CREATE PROCEDURE actualizarInventarioPieza(
    IN idPiezaBusqueda INT,
    IN nuevaCantidad INT
)
BEGIN
    DECLARE mensaje VARCHAR(100);
    DECLARE piezaExiste INT;

    SELECT COUNT(*) INTO piezaExiste
    FROM inventarioPiezas
    WHERE idPieza = idPiezaBusqueda;

    IF piezaExiste > 0 THEN
        UPDATE inventarioPiezas
        SET cantidad = nuevaCantidad
        WHERE idPieza = idPiezaBusqueda;
        SET mensaje = 'Registro actualizado correctamente';
    ELSE
        SET mensaje = 'Error al crear el registro. asegurese de ingresar bien el id';
    END IF;
    SELECT mensaje AS 'Mensaje';
END $$

DELIMITER ;

CALL actualizarInventarioPieza(1, 500);

SELECT * from inventariopiezas;

-- 3. Crear un procedimiento almacenado para eliminar una cita


DELIMITER $$

DROP PROCEDURE IF EXISTS eliminarCita;
CREATE PROCEDURE eliminarCita(
    IN idCitaBusqueda INT
)
BEGIN
    DECLARE mensaje VARCHAR(100);
    DECLARE citaExiste INT;

    SELECT COUNT(*) INTO citaExiste
    FROM cita
    WHERE idCita = idCitaBusqueda;

    IF citaExiste > 0 THEN
        DELETE FROM cita
        WHERE idCita = idCitaBusqueda;
        SET mensaje = 'Cita eliminada correctamente';
    ELSE
        SET mensaje = 'Error: La cita no existe';
    END IF;

    SELECT mensaje AS 'Mensaje';
END $$

DELIMITER ;

SELECT * from cita;

CALL eliminarCita(1);

-- 4. Crear un procedimiento almacenado para generar una factura

DELIMITER $$

DROP PROCEDURE IF EXISTS generarFactura;
CREATE PROCEDURE generarFactura(
    IN p_idCliente INT,
    IN p_fecha DATETIME,
    IN p_total DOUBLE
)
BEGIN
    DECLARE mensaje VARCHAR(100);


    INSERT INTO facturacion (idCliente, fecha, total)
    VALUES (p_idCliente, p_fecha, p_total);


    SET mensaje = 'Factura creada correctamente';


    SELECT mensaje AS 'Mensaje';
END $$

DELIMITER ;

--5. Crear un procedimiento almacenado para obtener el historial de reparaciones de un vehículo
DELIMITER $$

DROP PROCEDURE IF EXISTS obtenerHistorialReparaciones;
CREATE PROCEDURE obtenerHistorialReparaciones(
    IN p_placa VARCHAR(10)
)
BEGIN

    DECLARE vehiculoID INT;

   
    SELECT idVehiculo INTO vehiculoID
    FROM vehiculo
    WHERE placa = p_placa;

    
    IF vehiculoID IS NULL THEN
        SELECT 'Vehículo no encontrado' AS Mensaje;
    ELSE
        
        SELECT r.fecha, r.descripcion, r.costoTotal, s.nombreServicio
        FROM reparacion r
        JOIN servicio s ON r.idServicio = s.idServicio
        WHERE r.idVehiculo = vehiculoID
        ORDER BY r.fecha DESC;
    END IF;
END $$

DELIMITER ;

CALL obtenerHistorialReparaciones('ABC123');

-- 6.  Crear un procedimiento almacenado para calcular el costo total de reparaciones de un cliente en un período

DELIMITER $$

DROP PROCEDURE IF EXISTS calcularCostoTotalReparaciones;
CREATE PROCEDURE calcularCostoTotalReparaciones(
    IN p_idCliente INT,
    IN p_fechaInicio DATE,
    IN p_fechaFin DATE
)
BEGIN
    -- Declaración de variables
    DECLARE costoTotal DOUBLE;

    -- Calcular el costo total de las reparaciones del cliente en el período especificado
    SELECT SUM(r.costoTotal) INTO costoTotal
    FROM reparacion r
    JOIN vehiculo v ON r.idVehiculo = v.idVehiculo
    WHERE v.idCliente = p_idCliente
      AND r.fecha BETWEEN p_fechaInicio AND p_fechaFin;

    -- Verificar si se encontraron reparaciones
    IF costoTotal IS NULL THEN
        SET costoTotal = 0.0;
    END IF;

    -- Devolver el costo total
    SELECT costoTotal AS CostoTotal;
END $$

DELIMITER ;

CALL calcularCostoTotalReparaciones(1, '2024-01-01', '2024-12-31');

-- 7. Crear un procedimiento almacenado para obtener la lista de vehículos que requieren mantenimiento basado en el kilometraje.

DELIMITER $$

DROP PROCEDURE IF EXISTS obtenerVehiculosMantenimiento;
CREATE PROCEDURE obtenerVehiculosMantenimiento()
BEGIN
    -- Selecciona los vehículos que necesitan mantenimiento basado en el kilometraje
    SELECT 
        v.idVehiculo, 
        v.placa, 
        v.kilometraje, 
        m.nombreModelo, 
        m.kilometrajeMantenimiento
    FROM 
        vehiculo v
    JOIN 
        modelo m ON v.idModelo = m.idModelo
    WHERE 
        v.kilometraje >= m.kilometrajeMantenimiento;
END $$

DELIMITER ;

CALL obtenerVehiculosMantenimiento();

-- 8.  Crear un procedimiento almacenado para insertar una nueva orden de compra


DELIMITER $$

DROP PROCEDURE IF EXISTS insertarOrdenCompra;
CREATE PROCEDURE insertarOrdenCompra(
    IN p_fecha DATE,
    IN p_total DOUBLE,
    IN p_idProveedor INT,
    IN p_idEmpleado INT
)
BEGIN
    DECLARE last_insert_id INT;

    INSERT INTO ordenCompra (fecha, total, idProveedor, idEmpleado)
    VALUES (p_fecha, p_total, p_idProveedor, p_idEmpleado);
    
    
    SET last_insert_id = LAST_INSERT_ID();

END $$

DELIMITER ;

-- 9.  Crear un procedimiento almacenado para actualizar los datos de un cliente

DELIMITER $$

CREATE PROCEDURE actualizarCliente(
    IN p_idCliente INT,
    IN p_documento VARCHAR(15),
    IN p_nombre VARCHAR(25),
    IN p_apellido1 VARCHAR(25),
    IN p_apellido2 VARCHAR(25),
    IN p_direccion VARCHAR(50),
    IN p_email VARCHAR(50)
)
BEGIN
    UPDATE cliente
    SET 
        documento = p_documento,
        nombre = p_nombre,
        apellido1 = p_apellido1,
        apellido2 = p_apellido2,
        direccion = p_direccion,
        email = p_email
    WHERE idCliente = p_idCliente;

    SELECT 'Cliente actualizado correctamente' AS mensaje;
END $$

DELIMITER ;

CALL actualizarCliente(1, '123456789', 'Juan', 'Perez', 'Gomez', 'Calle 123', 'juan@example.com');

-- 10. Crear un procedimiento almacenado para obtener los servicios más solicitados en un período

DELIMITER $$

CREATE PROCEDURE obtenerServiciosMasSolicitados(
    IN fechaInicio DATE,
    IN fechaFin DATE
)
BEGIN
    SELECT s.nombreServicio, COUNT(*) AS vecesSolicitado
    FROM cita c
    INNER JOIN servicio s ON c.idServicio = s.idServicio
    WHERE c.fechaHora BETWEEN fechaInicio AND fechaFin
    GROUP BY s.nombreServicio
    ORDER BY vecesSolicitado DESC;
END $$

DELIMITER ;

CALL obtenerServiciosMasSolicitados('2024-01-01', '2024-12-31');
