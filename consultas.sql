-- Active: 1717105247149@@127.0.0.1@3306@tallerAutomotriz

-- 1.Obtener el historial de reparaciones de un vehículo específico

SELECT * 
FROM reparacion  r
JOIN vehiculo v ON v.idvehiculo = r.idvehiculo
WHERE v.placa = 'EFG123';