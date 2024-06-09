# Diseño Automotriz
Taller SQL para desarrollar un sistema de gestión de base de datos enfocado en un taller automotriz

## Consultas requeridas
---

##### 1.Obtener el historial de reparaciones de un vehículo específico
```
SELECT * 
FROM reparacion  r
JOIN vehiculo v ON v.idvehiculo = r.idvehiculo
WHERE v.placa = 'EFG123';

+--------------+------------+------------+------------------------------------------------+------------+------------+------------+--------+-----------+----------+
| idReparacion | fecha      | costoTotal | descripcion                                    | idServicio | idVehiculo | idVehiculo | placa  | idCliente | idModelo |
+--------------+------------+------------+------------------------------------------------+------------+------------+------------+--------+-----------+----------+
|           11 | 2024-06-17 |     300.00 | Reparación de problemas mecánicos en el motor  |          4 |         11 |         11 | EFG123 |        10 |        1 |
|           12 | 2024-06-18 |      60.00 | Alineación y balanceo de las ruedas delanteras |          5 |         11 |         11 | EFG123 |        10 |        1 |
|           13 | 2024-06-19 |     200.00 | Reemplazo de llantas desgastadas por nuevas    |          6 |         11 |         11 | EFG123 |        10 |        1 |
+--------------+------------+------------+------------------------------------------------+------------+------------+------------+--------+-----------+----------+
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

+------------+
| costoTotal |
+------------+
|     410.00 |
+------------+
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

+----------------+-------------------+----------------+----------------+-----------------+
| cliente_nombre | cliente_apellido1 | vehiculo_placa | vehiculo_marca | vehiculo_modelo |
+----------------+-------------------+----------------+----------------+-----------------+
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
+----------------+-------------------+----------------+----------------+-----------------+
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
+------------------------+----------+
| nombrePieza            | cantidad |
+------------------------+----------+
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
+------------------------+----------+
```
##### 5.Obtener las citas programadas para un día específico
```

```