# Diseño Automotriz
Taller SQL para desarrollar un sistema de gestión de base de datos enfocado en un taller automotriz

## Consultas requeridas
#####-

##### 1.Obtener el historial de reparaciones de un vehículo específico
```
SELECT * 
FROM reparacion  r
JOIN vehiculo v ON v.idvehiculo = r.idvehiculo
WHERE v.placa = 'EFG123';

+###################################+##############################+##############################+########################################################################################################################+##############################+##############################+##############################+####################+#########################-+#########################+
| idReparacion | fecha      | costoTotal | descripcion                                    | idServicio | idVehiculo | idVehiculo | placa  | idCliente | idModelo |
+###################################+##############################+##############################+########################################################################################################################+##############################+##############################+##############################+####################+#########################-+#########################+
|           11 | 2024-06-17 |     300.00 | Reparación de problemas mecánicos en el motor  |          4 |         11 |         11 | EFG123 |        10 |        1 |
|           12 | 2024-06-18 |      60.00 | Alineación y balanceo de las ruedas delanteras |          5 |         11 |         11 | EFG123 |        10 |        1 |
|           13 | 2024-06-19 |     200.00 | Reemplazo de llantas desgastadas por nuevas    |          6 |         11 |         11 | EFG123 |        10 |        1 |
+###################################+##############################+##############################+########################################################################################################################+##############################+##############################+##############################+####################+#########################-+#########################+
```

##### 2. Calcular el costo total de todas las reparaciones realizadas por un empleado específico en un período de tiempo
```
SELECT 
    SUM(r.costoTotal) AS costoTotal
FROM 
    reparacion r
JOIN 
    reparacionEmpleado re ON r.idReparacion = re.idReparacion
JOIN 
    empleado e ON re.idEmpleado = e.idEmpleado
WHERE 
    e.idEmpleado = 1
    AND r.fecha BETWEEN '2024-01-01' AND '2024-12-31';

+##############################+
| costoTotal |
+##############################+
|     410.00 |
+##############################+
```
#####  3. Listar todos los clientes y los vehículos que poseen
```

SELECT 
    c.nombre AS cliente_nombre,
    c.apellido1 AS cliente_apellido1,
    v.placa AS vehiculo_placa,
    m.nombreMarca AS vehiculo_marca,
    mo.nombreModelo AS vehiculo_modelo
FROM 
    cliente c
JOIN 
    vehiculo v ON c.idCliente = v.idCliente
JOIN 
    modelo mo ON v.idModelo = mo.idModelo
JOIN 
    marca m ON mo.idMarca = m.idMarca;

+########################################+#############################################-+########################################+########################################+########################################-+
| cliente_nombre | cliente_apellido1 | vehiculo_placa | vehiculo_marca | vehiculo_modelo |
+########################################+#############################################-+########################################+########################################+########################################-+
| Juan           | Pérez             | ABC123         | Toyota         | Corolla         |
| Carlos         | López             | PQR678         | Toyota         | Corolla         |
| Sofía          | Torres            | EFG123         | Toyota         | Corolla         |
| Alberto        | Jiménez           | TUV678         | Toyota         | Corolla         |
| Juan           | Pérez             | DEF456         | Honda          | Civic           |
| Laura          | Fernández         | STU901         | Honda          | Civic           |
| Miguel         | Vargas            | HIJ456         | Honda          | Civic           |
| Patricia       | Núñez             | WXY901         | Honda          | Civic           |
| María          | Gómez             | GHI789         | Ford           | Focus           |
| Pedro          | García            | VWX234         | Ford           | Focus           |
| Carmen         | Castro            | KLM789         | Ford           | Focus           |
| Felipe         | Herrera           | ZAB234         | Ford           | Focus           |
| Luis           | Martínez          | JKL012         | Chevrolet      | Cruze           |
| Elena          | Sánchez           | YZA567         | Chevrolet      | Cruze           |
| Diego          | Rojas             | NOP012         | Chevrolet      | Cruze           |
| Lucía          | Ramos             | CDE567         | Chevrolet      | Cruze           |
| Ana            | Rodríguez         | MNO345         | Nissan         | Sentra          |
| José           | Ramírez           | BCD890         | Nissan         | Sentra          |
| Marta          | Morales           | QRS345         | Nissan         | Sentra          |
| Lucía          | Ramos             | FGH890         | Nissan         | Sentra          |
+########################################+#############################################-+########################################+########################################+########################################-+
```
##### 4.  Obtener la cantidad de piezas en inventario para cada pieza
```
SELECT 
    p.nombrePieza,
    ip.cantidad
FROM 
    pieza p
JOIN 
    inventarioPiezas ip ON p.idPieza = ip.idPieza;
+############################################################+#########################+
| nombrePieza            | cantidad |
+############################################################+#########################+
| Filtro de Aceite       |       50 |
| Filtro de Aceite       |       55 |
| Bujía                  |      100 |
| Bujía                  |       65 |
| Pastillas de Freno     |       75 |
| Pastillas de Freno     |       70 |
| Amortiguador           |       60 |
| Amortiguador           |       85 |
| Filtro de Aire         |       80 |
| Filtro de Aire         |       95 |
| Radiador               |       30 |
| Correa de Distribución |       40 |
| Alternador             |       20 |
| Batería                |       90 |
| Aceite de Motor        |      120 |
+############################################################+#########################+
```
##### 5.Obtener las citas programadas para un día específico
```
    SELECT
    *
FROM
    cita c
WHERE
    c.fechaHora  BETWEEN '2024-06-07 00:00:00' AND '2024-06-07 23:59:59';

    +--------+---------------------+-----------+------------+------------+
| idCita | fechaHora           | idCliente | idVehiculo | idServicio |
+--------+---------------------+-----------+------------+------------+
|      1 | 2024-06-07 09:00:00 |         1 |          1 |          1 |
|      2 | 2024-06-07 10:30:00 |         1 |          2 |          2 |
|      3 | 2024-06-07 11:45:00 |         2 |          3 |          3 |
|      4 | 2024-06-07 13:15:00 |         3 |          4 |          4 |
|      5 | 2024-06-07 14:30:00 |         4 |          5 |          5 |
|      6 | 2024-06-07 15:45:00 |         5 |          1 |          6 |
+--------+---------------------+-----------+------------+------------+
```

##### 6.   Generar una factura para un cliente específico en una fecha determinada
```
SELECT
    *
FROM 
    cliente c
JOIN
    facturacion f ON f.idCliente = c.idCliente
WHERE
    c.idCliente = 1 AND f.fecha = '2024-06-01 10:30:00';
    +-----------+------------+--------+-----------+-----------+-----------+------------------+----------+-----------------+---------------+-----------+---------------------+--------+
| idCliente | documento  | nombre | apellido1 | apellido2 | direccion | email            | idTaller | idTipoDocumento | idFacturacion | idCliente | fecha               | total  |
+-----------+------------+--------+-----------+-----------+-----------+------------------+----------+-----------------+---------------+-----------+---------------------+--------+
|         1 | 1234567890 | Juan   | Pérez     | NULL      | Calle 123 | juan@example.com |        1 |               1 |             1 |         1 | 2024-06-01 10:30:00 | 100.00 |
+-----------+------------+--------+-----------+-----------+-----------+------------------+----------+-----------------+---------------+-----------+---------------------+--------+
```
##### 7. Listar todas las órdenes de compra y sus detalles
```
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

    +---------------+------------+---------+------------------+-----------------------------+---------+----------+--------+------------------------+
| idOrdenCompra | fecha      | total   | proveedor_nombre | Empleado que realiza compra | idPieza | cantidad | precio | nombrePieza            |
+---------------+------------+---------+------------------+-----------------------------+---------+----------+--------+------------------------+
|             1 | 2024-06-01 |  500.00 | Proveedor A      | Juan Perez                  |       1 |       10 |  10.00 | Filtro de Aceite       |
|             1 | 2024-06-01 |  500.00 | Proveedor A      | Juan Perez                  |       2 |       20 |   5.00 | Bujía                  |
|             2 | 2024-06-02 |  750.00 | Proveedor B      | Ana Martinez                |       3 |       15 |   8.00 | Pastillas de Freno     |
|             2 | 2024-06-02 |  750.00 | Proveedor B      | Ana Martinez                |       4 |       12 |  15.00 | Amortiguador           |
|             3 | 2024-06-03 | 1000.00 | Proveedor C      | Carlos Gonzalez             |       5 |       18 |   6.00 | Filtro de Aire         |
|             3 | 2024-06-03 | 1000.00 | Proveedor C      | Carlos Gonzalez             |       6 |       25 |  30.00 | Radiador               |
|             4 | 2024-06-04 |  600.00 | Proveedor D      | Maria Rodriguez             |       7 |       30 |  12.00 | Correa de Distribución |
|             4 | 2024-06-04 |  600.00 | Proveedor D      | Maria Rodriguez             |       8 |        8 |  50.00 | Alternador             |
|             5 | 2024-06-05 |  900.00 | Proveedor E      | Luis Garcia                 |       9 |       22 |  20.00 | Batería                |
|             5 | 2024-06-05 |  900.00 | Proveedor E      | Luis Garcia                 |      10 |       28 |  40.00 | Aceite de Motor        |
|             6 | 2024-06-06 | 1200.00 | Proveedor F      | Sofia Martinez              |       1 |       35 |   9.00 | Filtro de Aceite       |
|             6 | 2024-06-06 | 1200.00 | Proveedor F      | Sofia Martinez              |       2 |       40 |   4.00 | Bujía                  |
|             7 | 2024-06-07 | 1500.00 | Proveedor G      | David Lopez                 |       3 |       45 |   7.00 | Pastillas de Freno     |
|             7 | 2024-06-07 | 1500.00 | Proveedor G      | David Lopez                 |       4 |       10 |  20.00 | Amortiguador           |
|             8 | 2024-06-08 | 1800.00 | Proveedor H      | Elena Perez                 |       5 |       20 |  10.00 | Filtro de Aire         |
|             8 | 2024-06-08 | 1800.00 | Proveedor H      | Elena Perez                 |       6 |       15 |  25.00 | Radiador               |
|             9 | 2024-06-09 | 2000.00 | Proveedor I      | Miguel Torres               |       7 |       25 |  14.00 | Correa de Distribución |
|             9 | 2024-06-09 | 2000.00 | Proveedor I      | Miguel Torres               |       8 |       18 |  55.00 | Alternador             |
|            10 | 2024-06-10 | 2500.00 | Proveedor J      | Lucia Cruz                  |       9 |       30 |  30.00 | Batería                |
|            10 | 2024-06-10 | 2500.00 | Proveedor J      | Lucia Cruz                  |      10 |       35 |  50.00 | Aceite de Motor        |
+---------------+------------+---------+------------------+-----------------------------+---------+----------+--------+------------------------+
```
##### 8.  Obtener el costo total de piezas utilizadas en una reparación específica
```
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

+--------------+------------------+
| idReparacion | costoTotalPiezas |
+--------------+------------------+
|            1 |            61.38 |
+--------------+------------------+
```
##### 9. Obtener el inventario de piezas que necesitan ser reabastecidas (cantidad menor que un umbral)
```
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

+---------+------------------------+-------------+
| idPieza | nombrePieza            | totalPiezas |
+---------+------------------------+-------------+
|       1 | Filtro de Aceite       |         105 |
|       3 | Pastillas de Freno     |         145 |
|       4 | Amortiguador           |         145 |
|       5 | Filtro de Aire         |         175 |
|       6 | Radiador               |          30 |
|       7 | Correa de Distribución |          40 |
|       8 | Alternador             |          20 |
|       9 | Batería                |          90 |
|       2 | Bujía                  |          65 |
+---------+------------------------+-------------+
```
##### 10. Obtener la lista de servicios más solicitados en un período específico
```
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

+------------+------------------------------+----------------+
| idServicio | nombreServicio               | vecesSolicitas |
+------------+------------------------------+----------------+
|          4 | Reparación de Motor          |              3 |
|          6 | Cambio de Llantas            |              2 |
|         10 | Cambio de Pastillas de Freno |              2 |
+------------+------------------------------+----------------+
```
##### 11. Obtener el costo total de reparaciones para cada cliente en un período específico
```
SELECT
    f.idCliente,  SUM(f.total)
FROM
    facturacion f
WHERE
    f.fecha BETWEEN '2024-01-01 00:00:00' AND '2024-12-31 23:59:59'
GROUP BY
    f.idCliente;

+-----------+--------------+
| idCliente | SUM(f.total) |
+-----------+--------------+
|         1 |       200.00 |
|         2 |       150.00 |
|         3 |       200.00 |
|         4 |       600.00 |
|         5 |       120.00 |
|         6 |       300.00 |
|         7 |       200.00 |
|         8 |       150.00 |
|         9 |       100.00 |
|        10 |        80.00 |
+-----------+--------------+
```
##### 12. Listar los empleados con mayor cantidad de reparaciones realizadas en un período específico
```
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

+------------+----------------------------------+----------------------+
| idEmpleado | CONCAT(e.nombre," ",e.apellido1) | COUNT(re.idEmpleado) |
+------------+----------------------------------+----------------------+
|          1 | Juan Perez                       |                    3 |
|          2 | Ana Martinez                     |                    2 |
+------------+----------------------------------+----------------------+
```
##### 13.Obtener las piezas más utilizadas en reparaciones durante un período específico
```
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

+---------+------------------+-------------------+
| idPieza | nombrePieza      | COUNT(rp.idPieza) |
+---------+------------------+-------------------+
|       6 | Radiador         |                 6 |
|       1 | Filtro de Aceite |                 2 |
+---------+------------------+-------------------+
```
##### 14. Calcular el promedio de costo de reparaciones por vehículo
```
SELECT
    AVG(r.costoTotal) as promedioReparaciones
FROM
    reparacion r;
#####15. Obtener el inventario de piezas por proveedor

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

+------------------------+-------------+--------------------+
| nombrePieza            | idProveedor | cantidadDisponible |
+------------------------+-------------+--------------------+
| Filtro de Aceite       |           1 |                105 |
| Filtro de Aceite       |           6 |                105 |
| Bujía                  |           1 |                165 |
| Bujía                  |           6 |                165 |
| Pastillas de Freno     |           2 |                145 |
| Pastillas de Freno     |           7 |                145 |
| Amortiguador           |           2 |                145 |
| Amortiguador           |           7 |                145 |
| Filtro de Aire         |           3 |                175 |
| Filtro de Aire         |           8 |                175 |
| Radiador               |           3 |                 30 |
| Radiador               |           8 |                 30 |
| Correa de Distribución |           4 |                 40 |
| Correa de Distribución |           9 |                 40 |
| Alternador             |           4 |                 20 |
| Alternador             |           9 |                 20 |
| Batería                |           5 |                 90 |
| Batería                |          10 |                 90 |
| Aceite de Motor        |           5 |                120 |
| Aceite de Motor        |          10 |                120 |
+------------------------+-------------+--------------------+
```
##### 16. Listar los clientes que no han realizado reparaciones en el último añoSELECT c.idCliente, c.documento, c.nombre, c.apellido1, c.apellido2, c.direccion, c.email

```
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

+-----------+------------+----------+-----------+-----------+---------------+----------------------+
| idCliente | documento  | nombre   | apellido1 | apellido2 | direccion     | email                |
+-----------+------------+----------+-----------+-----------+---------------+----------------------+
|        11 | 1123456789 | Miguel   | Vargas    | NULL      | Carrera 22    | miguel@example.com   |
|        12 | 1223456789 | Carmen   | Castro    | NULL      | Avenida Sur   | carmen@example.com   |
|        18 | 1823456789 | Lucía    | Ramos     | NULL      | Avenida Oeste | lucia@example.com    |
|        18 | 1823456789 | Lucía    | Ramos     | NULL      | Avenida Oeste | lucia@example.com    |
|        19 | 1923456789 | Javier   | Díaz      | NULL      | Calle 77      | javier@example.com   |
|        20 | 2023456789 | Gabriela | Paredes   | NULL      | Carrera 88    | gabriela@example.com |
+-----------+------------+----------+-----------+-----------+---------------+----------------------+
```
##### 17.  Obtener las ganancias totales del taller en un período específico
```
SELECT 
    SUM(f.total) AS ganancias_totales
FROM 
    facturacion f
WHERE 
    f.fecha BETWEEN '2024-01-01' AND '2024-12-31';
+-------------------+
| ganancias_totales |
+-------------------+
|           2100.00 |
+-------------------+
```
##### 18 . Listar los empleados y el total de horas trabajadas en reparaciones en un
período específico (asumiendo que se registra la duración de cada reparación) */
```
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

+----------+-----------+-----------+------------------------+
| nombre   | apellido1 | apellido2 | total_horas_trabajadas |
+----------+-----------+-----------+------------------------+
| Juan     | Perez     | Gomez     |                     10 |
| Ana      | Martinez  | Lopez     |                      7 |
| Carlos   | Gonzalez  | Diaz      |                      2 |
| Maria    | Rodriguez | Fernandez |                      3 |
| Luis     | Garcia    | Ramirez   |                      5 |
| Sofia    | Martinez  | Vargas    |                      1 |
| David    | Lopez     | Castillo  |                      8 |
| Elena    | Perez     | Rios      |                      6 |
| Miguel   | Torres    | Mendez    |                      2 |
| Lucia    | Cruz      | Hernandez |                      3 |
| Jorge    | Gomez     | Paredes   |                      6 |
| Clara    | Morales   | Jimenez   |                      7 |
| Raul     | Gutierrez | Nieves    |                      4 |
| Adriana  | Ortiz     | Sanchez   |                      3 |
| Pedro    | Medina    | Ortiz     |                      3 |
| Lorena   | Vega      | Salinas   |                      2 |
| Andres   | Rojas     | Pinto     |                      5 |
| Diana    | Castro    | Molina    |                      1 |
| Jose     | Ruiz      | Cano      |                      3 |
| Carolina | Fernandez | Lozano    |                      2 |
+----------+-----------+-----------+------------------------+
```
##### 19. Obtener el listado de servicios prestados por cada empleado en un período específico
```
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

+----------+-----------+-----------+-------------------------------+------------+
| nombre   | apellido1 | apellido2 | nombreServicio                | fecha      |
+----------+-----------+-----------+-------------------------------+------------+
| Juan     | Perez     | Gomez     | Cambio de Aceite              | 2024-06-07 |
| Juan     | Perez     | Gomez     | Reparación de Motor           | 2024-06-17 |
| Juan     | Perez     | Gomez     | Alineación y Balanceo         | 2024-06-18 |
| Ana      | Martinez  | Lopez     | Cambio de Aceite              | 2024-06-07 |
| Ana      | Martinez  | Lopez     | Reparación de Suspensión      | 2024-06-13 |
| Carlos   | Gonzalez  | Diaz      | Revisión de Frenos            | 2024-06-08 |
| Maria    | Rodriguez | Fernandez | Revisión de Frenos            | 2024-06-08 |
| Luis     | Garcia    | Ramirez   | Cambio de Batería             | 2024-06-09 |
| Sofia    | Martinez  | Vargas    | Cambio de Batería             | 2024-06-09 |
| David    | Lopez     | Castillo  | Reparación de Motor           | 2024-06-10 |
| Elena    | Perez     | Rios      | Reparación de Motor           | 2024-06-10 |
| Miguel   | Torres    | Mendez    | Alineación y Balanceo         | 2024-06-11 |
| Lucia    | Cruz      | Hernandez | Alineación y Balanceo         | 2024-06-11 |
| Jorge    | Gomez     | Paredes   | Cambio de Llantas             | 2024-06-12 |
| Clara    | Morales   | Jimenez   | Cambio de Llantas             | 2024-06-12 |
| Raul     | Gutierrez | Nieves    | Reparación de Suspensión      | 2024-06-13 |
| Adriana  | Ortiz     | Sanchez   | Reparación de Suspensión      | 2024-06-13 |
| Pedro    | Medina    | Ortiz     | Revisión de Sistema Eléctrico | 2024-06-14 |
| Lorena   | Vega      | Salinas   | Revisión de Sistema Eléctrico | 2024-06-14 |
| Andres   | Rojas     | Pinto     | Cambio de Aceite              | 2024-06-15 |
| Diana    | Castro    | Molina    | Cambio de Aceite              | 2024-06-15 |
| Jose     | Ruiz      | Cano      | Cambio de Pastillas de Freno  | 2024-06-16 |
| Carolina | Fernandez | Lozano    | Cambio de Pastillas de Freno  | 2024-06-16 |
+----------+-----------+-----------+-------------------------------+------------+
```
### /// COMIENZO DE SUBCONSULTAS 
##### 1. Obtener el cliente que ha gastado más en reparaciones durante el último año.
```
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
+---------------+--------------+
| cliente       | SUM(f.total) |
+---------------+--------------+
| Ana Rodríguez |       600.00 |
+---------------+--------------+
```
##### 2.   Obtener la pieza más utilizada en reparaciones durante el último mes
```
 
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
+-------------+------------+
| nombrePieza | VecesUsada |
+-------------+------------+
| Radiador    |          6 |
+-------------+------------+
```
##### 3. Obtener los proveedores que suministran las piezas más caras

```
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

+-----------------+-------------+--------+
| NombreProveedor | NombrePieza | Precio |
+-----------------+-------------+--------+
| Proveedor I     | Alternador  | 101.00 |
+-----------------+-------------+--------+
```
##### 4. Listar las reparaciones que no utilizaron piezas específicas durante el último año
```
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
+--------------+------------+------------+-----------------------------------------------------------+------------+------------+
| idReparacion | fecha      | costoTotal | descripcion                                               | idServicio | idVehiculo |
+--------------+------------+------------+-----------------------------------------------------------+------------+------------+
|            2 | 2024-06-08 |      80.00 | Inspección y ajuste de frenos                             |          2 |          2 |
|            3 | 2024-06-09 |     120.00 | Reemplazo de batería y verificación del sistema eléctrico |          3 |          3 |
|            4 | 2024-06-10 |     300.00 | Reparación de problemas mecánicos en el motor             |          4 |          4 |
|            5 | 2024-06-11 |      60.00 | Alineación y balanceo de las ruedas delanteras            |          5 |          5 |
|            6 | 2024-06-12 |     200.00 | Reemplazo de llantas desgastadas por nuevas               |          6 |          6 |
|            7 | 2024-06-13 |     150.00 | Reparación de componentes de la suspensión                |          7 |          7 |
|            8 | 2024-06-14 |     100.00 | Diagnóstico y reparación de problemas eléctricos          |          8 |          8 |
|           10 | 2024-06-16 |      80.00 | Reemplazo de pastillas de freno desgastadas               |         10 |         10 |
|           11 | 2024-06-17 |     300.00 | Reparación de problemas mecánicos en el motor             |          4 |         11 |
|           12 | 2024-06-18 |      60.00 | Alineación y balanceo de las ruedas delanteras            |          5 |         11 |
|           13 | 2024-06-19 |     200.00 | Reemplazo de llantas desgastadas por nuevas               |          6 |         11 |
|           14 | 2024-06-20 |     150.00 | Reparación de componentes de la suspensión                |          7 |         14 |
|           15 | 2024-06-21 |     100.00 | Diagnóstico y reparación de problemas eléctricos          |          8 |         15 |
|           16 | 2024-06-22 |      50.00 | Cambio de aceite y filtro de aceite                       |          9 |         16 |
|           17 | 2024-06-23 |      80.00 | Reemplazo de pastillas de freno desgastadas               |         10 |         17 |
|           18 | 2024-06-24 |     300.00 | Reparación de problemas mecánicos en el motor             |          4 |         18 |
+--------------+------------+------------+-----------------------------------------------------------+------------+------------+
```
##### 5.  Obtener las piezas que están en inventario por debajo del 10% del stock inicial
```
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

+---------+------------------------+-------------+--------------+
| idPieza | nombrePieza            | stockActual | stockInicial |
+---------+------------------------+-------------+--------------+
|       1 | Filtro de Aceite       |          50 |           55 |
|       1 | Filtro de Aceite       |          55 |           55 |
|       2 | Bujía                  |         100 |          100 |
|       2 | Bujía                  |          65 |          100 |
|       3 | Pastillas de Freno     |          75 |           75 |
|       3 | Pastillas de Freno     |          70 |           75 |
|       4 | Amortiguador           |          60 |           85 |
|       4 | Amortiguador           |          85 |           85 |
|       5 | Filtro de Aire         |          80 |           95 |
|       5 | Filtro de Aire         |          95 |           95 |
|       6 | Radiador               |          30 |           30 |
|       7 | Correa de Distribución |          40 |           40 |
|       8 | Alternador             |          20 |           20 |
|       9 | Batería                |          90 |           90 |
|      10 | Aceite de Motor        |         120 |          120 |
+---------+------------------------+-------------+--------------+
```
### - PROCEDIMIENTOS ALMACENADOS 

##### 1. Crear un procedimiento almacenado para insertar una nueva reparación.
```
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
```
##### 2. Crear un procedimiento almacenado para actualizar el inventario de una pieza.
```
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
```
##### 3. Crear un procedimiento almacenado para eliminar una cita

```
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
```
##### 4. Crear un procedimiento almacenado para generar una factura
```
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
```
##### 5. Crear un procedimiento almacenado para obtener el historial de reparaciones de un vehículo
```
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
```
##### 6.  Crear un procedimiento almacenado para calcular el costo total de reparaciones de un cliente en un período
```

DELIMITER $$

DROP PROCEDURE IF EXISTS calcularCostoTotalReparaciones;
CREATE PROCEDURE calcularCostoTotalReparaciones(
    IN p_idCliente INT,
    IN p_fechaInicio DATE,
    IN p_fechaFin DATE
)
BEGIN
    ##### Declaración de variables
    DECLARE costoTotal DOUBLE;

    ##### Calcular el costo total de las reparaciones del cliente en el período especificado
    SELECT SUM(r.costoTotal) INTO costoTotal
    FROM reparacion r
    JOIN vehiculo v ON r.idVehiculo = v.idVehiculo
    WHERE v.idCliente = p_idCliente
      AND r.fecha BETWEEN p_fechaInicio AND p_fechaFin;

    ##### Verificar si se encontraron reparaciones
    IF costoTotal IS NULL THEN
        SET costoTotal = 0.0;
    END IF;

    ##### Devolver el costo total
    SELECT costoTotal AS CostoTotal;
END $$

DELIMITER ;

CALL calcularCostoTotalReparaciones(1, '2024-01-01', '2024-12-31');
```

##### 7. Crear un procedimiento almacenado para obtener la lista de vehículos que requieren mantenimiento basado en el kilometraje.
```

DELIMITER $$

DROP PROCEDURE IF EXISTS obtenerVehiculosMantenimiento;
CREATE PROCEDURE obtenerVehiculosMantenimiento()
BEGIN
    ##### Selecciona los vehículos que necesitan mantenimiento basado en el kilometraje
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
```

##### 8.  Crear un procedimiento almacenado para insertar una nueva orden de compra

```

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
```

##### 9.  Crear un procedimiento almacenado para actualizar los datos de un cliente
```

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
```

##### 10. Crear un procedimiento almacenado para obtener los servicios más solicitados en un período
```

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
```
