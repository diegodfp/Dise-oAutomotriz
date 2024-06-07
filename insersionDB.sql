USE tallerAutomotriz;

/* INSERST PAIS   -  CIUDAD - TIPO DE DOCUMENTO --  SEDE TALLER */
INSERT INTO pais (nombrePais) VALUES 
('Colombia'),
('Argentina'),
('Brasil'),
('Perú'),
('Chile');

-- Inserciones en la tabla 'ciudad'
INSERT INTO ciudad (nombreCiudad, idPais) VALUES 
('Bogotá', 1),
('Bucaramanga', 1),
('Medellín', 1),
('Cali', 1),
('Cartagena', 1);

-- Inserciones en la tabla 'sedeTaller'
INSERT INTO sedeTaller (nombreTaller, direccion, idCiudad) VALUES 
('Taller Bogotá', 'Calle 123 #45-67', 1),
('Taller Bucaramanga', 'Carrera 89 #12-34', 2);

-- Inserciones en la tabla 'tipoDocumento'
INSERT INTO tipoDocumento (descripcion) VALUES 
('Cédula de Ciudadanía'),
('Tarjeta de Identidad'),
('Cédula de Extranjería'),
('Pasaporte'),
('Registro Civil');

/* INSERTS PARA LAS TABLAS RELACIONADAS CON EL EMPLEADO ( CARGO - EMPLEADO - TELEFONOS EMPLEADO) */
-- Inserciones en la tabla 'cargo'
INSERT INTO cargo (nombreCargo, salarioBase) VALUES 
('Mecánico', 2000000),
('Representante de Ventas', 1800000),
('Recepcionista', 1500000),
('Gerente', 5000000),
('Asistente Administrativo', 1200000),
('Supervisor', 2500000),
('Jefe de Taller', 3000000),
('Contador', 2200000),
('Auxiliar de Mantenimiento', 1100000),
('Analista de Datos', 1900000);

-- INSERTS  EMPLEADOS
INSERT INTO empleado (documento, nombre, apellido1, apellido2, idTaller, idCargo, idTipoDocumento) VALUES 
('1234567890', 'Juan', 'Perez', 'Gomez', 1, 1, 1),
('2345678901', 'Ana', 'Martinez', 'Lopez', 1, 2, 1),
('3456789012', 'Carlos', 'Gonzalez', 'Diaz', 1, 3, 1),
('4567890123', 'Maria', 'Rodriguez', 'Fernandez', 1, 4, 1),
('5678901234', 'Luis', 'Garcia', 'Ramirez', 1, 5, 1),
('6789012345', 'Sofia', 'Martinez', 'Vargas', 2, 1, 1),
('7890123456', 'David', 'Lopez', 'Castillo', 2, 2, 1),
('8901234567', 'Elena', 'Perez', 'Rios', 2, 3, 1),
('9012345678', 'Miguel', 'Torres', 'Mendez', 2, 4, 1),
('0123456789', 'Lucia', 'Cruz', 'Hernandez', 2, 5, 1),
('1123456789', 'Jorge', 'Gomez', 'Paredes', 1, 1, 1),
('1223456789', 'Clara', 'Morales', 'Jimenez', 1, 2, 1),
('1323456789', 'Raul', 'Gutierrez', 'Nieves', 1, 3, 1),
('1423456789', 'Adriana', 'Ortiz', 'Sanchez', 1, 4, 1),
('1523456789', 'Pedro', 'Medina', 'Ortiz', 1, 5, 1),
('1623456789', 'Lorena', 'Vega', 'Salinas', 2, 1, 1),
('1723456789', 'Andres', 'Rojas', 'Pinto', 2, 2, 3),
('1823456789', 'Diana', 'Castro', 'Molina', 2, 3, 3),
('1923456789', 'Jose', 'Ruiz', 'Cano', 2, 4, 3),
('2023456789', 'Carolina', 'Fernandez', 'Lozano', 2, 5, 3);
;
-- INSERTS TELEFONOS EMPLEADOS
INSERT INTO telefonoEmpleado (fijo, celPrincipal, celSecundario, idEmpleado) VALUES 
('1111111', '3000000001', '3000000002', 1),
('1111112', '3000000011', '3000000012', 2),
('1111113', '3000000021', '3000000022', 3),
('1111114', '3000000031', '3000000032', 4),
('1111115', '3000000041', '3000000042', 5),
('1111116', '3000000051', '3000000052', 6),
('1111117', '3000000061', '3000000062', 7),
('1111118', '3000000071', '3000000072', 8),
('1111119', '3000000081', '3000000082', 9),
('1111120', '3000000091', '3000000092', 10),
('1111121', '3000000101', '3000000102', 11),
('1111122', '3000000111', '3000000112', 12),
('1111123', '3000000121', '3000000122', 13),
('1111124', '3000000131', '3000000132', 14),
('1111125', '3000000141', '3000000142', 15),
('1111126', '3000000151', '3000000152', 16),
('1111127', '3000000161', '3000000162', 17),
('1111128', '3000000171', '3000000172', 18),
('1111129', '3000000181', '3000000182', 19),
('1111130', '3000000191', '3000000192', 20);

/* INSERTS PARA TODOS LOS DATOS RELACIONADOS A CLIENTE (CLIENTE - TELEFONO - VEHICULO  - MARCA - MODELO ) */ 
INSERT INTO cliente (documento, nombre, apellido1, apellido2, direccion, email, idTaller, idTipoDocumento) VALUES 
('1234567890', 'Juan', 'Pérez', NULL, 'Calle 123', 'juan@example.com', 1, 1),
('2345678901', 'María', 'Gómez', NULL, 'Carrera 456', 'maria@example.com', 2, 2),
('3456789012', 'Luis', 'Martínez', NULL, 'Avenida Principal', 'luis@example.com', 1, 1),
('4567890123', 'Ana', 'Rodríguez', NULL, 'Calle Secundaria', 'ana@example.com', 2, 3),
('5678901234', 'Carlos', 'López', NULL, 'Carrera 789', 'carlos@example.com', 1, 4),
('6789012345', 'Laura', 'Fernández', NULL, 'Avenida Central', 'laura@example.com', 2, 5),
('7890123456', 'Pedro', 'García', NULL, 'Calle Principal', 'pedro@example.com', 1, 1),
('8901234567', 'Elena', 'Sánchez', NULL, 'Avenida Norte', 'elena@example.com', 2, 2),
('9012345678', 'José', 'Ramírez', NULL, 'Carrera 101', 'jose@example.com', 1, 3),
('0123456789', 'Sofía', 'Torres', NULL, 'Calle 11', 'sofia@example.com', 2, 4),
('1123456789', 'Miguel', 'Vargas', NULL, 'Carrera 22', 'miguel@example.com', 1, 5),
('1223456789', 'Carmen', 'Castro', NULL, 'Avenida Sur', 'carmen@example.com', 2, 1),
('1323456789', 'Diego', 'Rojas', NULL, 'Calle 33', 'diego@example.com', 1, 2),
('1423456789', 'Marta', 'Morales', NULL, 'Carrera 44', 'marta@example.com', 2, 3),
('1523456789', 'Alberto', 'Jiménez', NULL, 'Avenida Este', 'alberto@example.com', 1, 4),
('1623456789', 'Patricia', 'Núñez', NULL, 'Calle 55', 'patricia@example.com', 2, 5),
('1723456789', 'Felipe', 'Herrera', NULL, 'Carrera 66', 'felipe@example.com', 1, 1),
('1823456789', 'Lucía', 'Ramos', NULL, 'Avenida Oeste', 'lucia@example.com', 2, 2),
('1923456789', 'Javier', 'Díaz', NULL, 'Calle 77', 'javier@example.com', 1, 3),
('2023456789', 'Gabriela', 'Paredes', NULL, 'Carrera 88', 'gabriela@example.com', 2, 4);


INSERT INTO telefonoCliente (fijo, celPrincipal, celSecundario, idCliente) VALUES 
('1111111', '3000000001', '3000000002', 1),
('1111112', '3000000011', '3000000012', 2),
('1111113', '3000000021', '3000000022', 3),
('1111114', '3000000031', '3000000032', 4),
('1111115', '3000000041', '3000000042', 5),
('1111116', '3000000051', '3000000052', 6),
('1111117', '3000000061', '3000000062', 7),
('1111118', '3000000071', '3000000072', 8),
('1111119', '3000000081', '3000000082', 9),
('1111120', '3000000091', '3000000092', 10),
('1111121', '3000000101', '3000000102', 11),
('1111122', '3000000111', '3000000112', 12),
('1111123', '3000000121', '3000000122', 13),
('1111124', '3000000131', '3000000132', 14),
('1111125', '3000000141', '3000000142', 15),
('1111126', '3000000151', '3000000152', 16),
('1111127', '3000000161', '3000000162', 17),
('1111128', '3000000171', '3000000172', 18),
('1111129', '3000000181', '3000000182', 19),
('1111130', '3000000191', '3000000192', 20);

-- Inserciones en la tabla 'vehiculo', 'modelo' y 'marca'
INSERT INTO marca (nombreMarca) VALUES 
('Toyota'),
('Honda'),
('Ford'),
('Chevrolet'),
('Nissan');

INSERT INTO modelo (nombreModelo, idMarca) VALUES 
('Corolla', 1),
('Civic', 2),
('Focus', 3),
('Cruze', 4),
('Sentra', 5);

INSERT INTO vehiculo (placa, idCliente, idModelo) VALUES 
('ABC123', 1, 1),
('DEF456', 1, 2),
('GHI789', 2, 3),
('JKL012', 3, 4),
('MNO345', 4, 5),
('PQR678', 5, 1),
('STU901', 6, 2),
('VWX234', 7, 3),
('YZA567', 8, 4),
('BCD890', 9, 5),
('EFG123', 10, 1),
('HIJ456', 11, 2),
('KLM789', 12, 3),
('NOP012', 13, 4),
('QRS345', 14, 5),
('TUV678', 15, 1),
('WXY901', 16, 2),
('ZAB234', 17, 3),
('CDE567', 18, 4),
('FGH890', 18, 5);

/* -- INSERTS PARA TABLA PROVEEDORES CON SUS TELEFONOS -* */
-- Inserciones en la tabla 'proveedor'
INSERT INTO proveedor (nombre, nombreContacto, idCiudad, idTaller) VALUES 
('Proveedor A', 'Carlos Mejia', 1, 1),
('Proveedor B', 'Ana Lopez', 2, 2),
('Proveedor C', 'Miguel Sanchez', 3, 1),
('Proveedor D', 'Laura Perez', 4, 2),
('Proveedor E', 'Juan Ramirez', 5, 1),
('Proveedor F', 'Sofia Torres', 1, 2),
('Proveedor G', 'Pedro Fernandez', 2, 1),
('Proveedor H', 'Elena Gomez', 3, 2),
('Proveedor I', 'Jorge Martinez', 4, 1),
('Proveedor J', 'Clara Rodriguez', 5, 2);

-- Inserciones en la tabla 'telefonoProveedor'
INSERT INTO telefonoProveedor (fijo, celPrincipal, celSecundario, idProveedor) VALUES 
('1111001', '3100000001', '3100000002', 1),
('1111002', '3100000011', '3100000012', 2),
('1111003', '3100000021', '3100000022', 3),
('1111004', '3100000031', '3100000032', 4),
('1111005', '3100000041', '3100000042', 5),
('1111006', '3100000051', '3100000052', 6),
('1111007', '3100000061', '3100000062', 7),
('1111008', '3100000071', '3100000072', 8),
('1111009', '3100000081', '3100000082', 9),
('1111010', '3100000091', '3100000092', 10);

/* INSERSION DATOS PARA LAS TABLAS DE PIEZA - UBICACION E INVENTARIO */ 

-- Inserciones en la tabla 'pieza'
INSERT INTO pieza (nombrePieza, descripcion) VALUES 
('Filtro de Aceite', 'Filtro de aceite para motor'),
('Bujía', 'Bujía de encendido'),
('Pastillas de Freno', 'Juego de pastillas de freno delanteras'),
('Amortiguador', 'Amortiguador delantero derecho'),
('Filtro de Aire', 'Filtro de aire del motor'),
('Radiador', 'Radiador de motor'),
('Correa de Distribución', 'Correa de distribución para motor'),
('Alternador', 'Alternador para sistema eléctrico'),
('Batería', 'Batería de 12V'),
('Aceite de Motor', 'Aceite sintético 5W-30');

-- Inserciones en la tabla 'ubicacion'
INSERT INTO ubicacion (descripcion, nombreUbicacion, idTaller) VALUES 
('Almacén principal en taller Bogotá', 'Almacén Bogotá', 1),
('Depósito de repuestos en taller Bucaramanga', 'Depósito Bucaramanga', 2),
('Almacén secundario en taller Bogotá', 'Almacén Secundario Bogotá', 1),
('Zona de repuestos en taller Bucaramanga', 'Zona Repuestos Bucaramanga', 2),
('Área de almacenamiento en taller Bogotá', 'Área Almacenamiento Bogotá', 1);

-- Inserciones en la tabla 'inventario'
INSERT INTO inventario (idUbicacion, descripcion) VALUES 
(1, 'Inventario principal de piezas en el almacén de Bogotá'),
(2, 'Inventario de repuestos en el depósito de Bucaramanga'),
(3, 'Inventario secundario de piezas en el almacén secundario de Bogotá'),
(4, 'Inventario de repuestos adicionales en la zona de repuestos de Bucaramanga'),
(5, 'Inventario de piezas en el área de almacenamiento de Bogotá');

/* INSERTS PARA LAS TABLAS RELACIONADAS DE MUCHOS A MUCHOS ENTRE PIEZA E INVENTARIO
Y PIEZAS - PROVEEDOR */ 
-- Inserciones en la tabla 'inventarioPiezas'
INSERT INTO inventarioPiezas (idInventario, idPieza, cantidad) VALUES 
(1, 1, 50),
(1, 2, 100),
(1, 3, 75),
(2, 4, 60),
(2, 5, 80),
(3, 6, 30),
(3, 7, 40),
(4, 8, 20),
(4, 9, 90),
(5, 10, 120),
(5, 1, 55),
(5, 2, 65),
(5, 3, 70),
(3, 4, 85),
(4, 5, 95);
-- Inserciones en la tabla 'proveedoresPiezas'
INSERT INTO proveedoresPiezas (idProveedor, idPieza, precio) VALUES 
(1, 1, 15.50),
(1, 2, 5.75),
(2, 3, 30.00),
(2, 4, 25.50),
(3, 5, 20.75),
(3, 6, 80.00),
(4, 7, 35.50),
(4, 8, 100.00),
(5, 9, 55.00),
(5, 10, 45.25),
(6, 1, 16.00),
(6, 2, 6.00),
(7, 3, 31.00),
(7, 4, 26.00),
(8, 5, 21.00),
(8, 6, 81.00),
(9, 7, 36.00),
(9, 8, 101.00),
(10, 9, 56.00),
(10, 10, 46.00);


-- INSERTS PARA LA  TABLA ORDEN DE COMPRA Y ORDEN DETALLE 
INSERT INTO ordenCompra (fecha, total, idProveedor, idEmpleado) VALUES 
('2024-06-01', 500.00, 1, 1),
('2024-06-02', 750.00, 2, 2),
('2024-06-03', 1000.00, 3, 3),
('2024-06-04', 600.00, 4, 4),
('2024-06-05', 900.00, 5, 5),
('2024-06-06', 1200.00, 6, 6),
('2024-06-07', 1500.00, 7, 7),
('2024-06-08', 1800.00, 8, 8),
('2024-06-09', 2000.00, 9, 9),
('2024-06-10', 2500.00, 10, 10);
INSERT INTO ordenDetalle (idOrdenCompra, idPieza, cantidad, precio) VALUES 
(1, 1, 10, 10.00),
(1, 2, 20, 5.00),
(2, 3, 15, 8.00),
(2, 4, 12, 15.00),
(3, 5, 18, 6.00),
(3, 6, 25, 30.00),
(4, 7, 30, 12.00),
(4, 8, 8, 50.00),
(5, 9, 22, 20.00),
(5, 10, 28, 40.00),
(6, 1, 35, 9.00),
(6, 2, 40, 4.00),
(7, 3, 45, 7.00),
(7, 4, 10, 20.00),
(8, 5, 20, 10.00),
(8, 6, 15, 25.00),
(9, 7, 25, 14.00),
(9, 8, 18, 55.00),
(10, 9, 30, 30.00),
(10, 10, 35, 50.00);

/* INSERTS PARA LAS  TABLAS SERVICIO Y REPARACION */ 

INSERT INTO servicio (nombreServicio, descripcion, costo, idTaller) VALUES 
('Cambio de Aceite', 'Incluye cambio de aceite y filtro de aceite.', 50.00, 1),
('Revisión de Frenos', 'Inspección y ajuste de frenos.', 80.00, 1),
('Cambio de Batería', 'Reemplazo de batería y verificación del sistema eléctrico.', 120.00, 1),
('Reparación de Motor', 'Reparación de problemas mecánicos en el motor.', 300.00, 1),
('Alineación y Balanceo', 'Alineación y balanceo de las ruedas delanteras.', 60.00, 1),
('Cambio de Llantas', 'Reemplazo de llantas desgastadas por nuevas.', 200.00, 2),
('Reparación de Suspensión', 'Reparación de componentes de la suspensión.', 150.00, 2),
('Revisión de Sistema Eléctrico', 'Diagnóstico y reparación de problemas eléctricos.', 100.00, 2),
('Cambio de Aceite', 'Incluye cambio de aceite y filtro de aceite.', 50.00, 2),
('Cambio de Pastillas de Freno', 'Reemplazo de pastillas de freno desgastadas.', 80.00, 2);

INSERT INTO reparacion (fecha, costoTotal, descripcion, idServicio, idvehiculo) VALUES 
('2024-06-07', 50.00, 'Cambio de aceite y filtro de aceite', 1, 1),            -- Servicio: Cambio de Aceite, Vehículo: ABC123
('2024-06-08', 80.00, 'Inspección y ajuste de frenos', 2, 2),                   -- Servicio: Revisión de Frenos, Vehículo: DEF456
('2024-06-09', 120.00, 'Reemplazo de batería y verificación del sistema eléctrico', 3, 3), -- Servicio: Cambio de Batería, Vehículo: GHI789
('2024-06-10', 300.00, 'Reparación de problemas mecánicos en el motor', 4, 4),   -- Servicio: Reparación de Motor, Vehículo: JKL012
('2024-06-11', 60.00, 'Alineación y balanceo de las ruedas delanteras', 5, 5),   -- Servicio: Alineación y Balanceo, Vehículo: MNO345
('2024-06-12', 200.00, 'Reemplazo de llantas desgastadas por nuevas', 6, 6),      -- Servicio: Cambio de Llantas, Vehículo: PQR678
('2024-06-13', 150.00, 'Reparación de componentes de la suspensión', 7, 7),        -- Servicio: Reparación de Suspensión, Vehículo: STU901
('2024-06-14', 100.00, 'Diagnóstico y reparación de problemas eléctricos', 8, 8), -- Servicio: Revisión de Sistema Eléctrico, Vehículo: VWX234
('2024-06-15', 50.00, 'Cambio de aceite y filtro de aceite', 9, 9),               -- Servicio: Cambio de Aceite, Vehículo: YZA567
('2024-06-16', 80.00, 'Reemplazo de pastillas de freno desgastadas', 10, 10);    -- Servicio: Cambio de Pastillas de Freno, Vehículo: BCD890

INSERT INTO reparacion (fecha, costoTotal, descripcion, idServicio, idvehiculo) VALUES 
('2024-06-17', 300.00, 'Reparación de problemas mecánicos en el motor', 4, 11),   -- Servicio: Reparación de Motor, Vehículo: EFG123
('2024-06-18', 60.00, 'Alineación y balanceo de las ruedas delanteras', 5, 11),   -- Servicio: Alineación y Balanceo, Vehículo: HIJ456
('2024-06-19', 200.00, 'Reemplazo de llantas desgastadas por nuevas', 6, 11),      -- Servicio: Cambio de Llantas, Vehículo: KLM789
('2024-06-20', 150.00, 'Reparación de componentes de la suspensión', 7, 14),        -- Servicio: Reparación de Suspensión, Vehículo: NOP012
('2024-06-21', 100.00, 'Diagnóstico y reparación de problemas eléctricos', 8, 15),  -- Servicio: Revisión de Sistema Eléctrico, Vehículo: QRS345
('2024-06-22', 50.00, 'Cambio de aceite y filtro de aceite', 9, 16),                -- Servicio: Cambio de Aceite, Vehículo: TUV678
('2024-06-23', 80.00, 'Reemplazo de pastillas de freno desgastadas', 10, 17),      -- Servicio: Cambio de Pastillas de Freno, Vehículo: WXY901
('2024-06-24', 300.00, 'Reparación de problemas mecánicos en el motor', 4, 18);     -- Servicio: Reparación de Motor, Vehículo: ZAB234

/* INSERTS TABLA CITA */ 

INSERT INTO cita (fechaHora, idCliente, idVehiculo, idServicio) VALUES 
('2024-06-07 09:00:00', 1, 1, 1),  -- Juan Pérez, vehículo placa ABC123, servicio Cambio de Aceite
('2024-06-07 10:30:00', 1, 2, 2),  -- Juan Pérez, vehículo placa DEF456, servicio Revisión de Frenos
('2024-06-07 11:45:00', 2, 3, 3),  -- María Gómez, vehículo placa GHI789, servicio Cambio de Batería
('2024-06-07 13:15:00', 3, 4, 4),  -- Luis Martínez, vehículo placa JKL012, servicio Reparación de Motor
('2024-06-07 14:30:00', 4, 5, 5),  -- Ana Rodríguez, vehículo placa MNO345, servicio Alineación y Balanceo
('2024-06-07 15:45:00', 5, 1, 6),  -- Carlos López, vehículo placa PQR678, servicio Cambio de Llantas
('2024-06-08 09:00:00', 6, 2, 7),  -- Laura Fernández, vehículo placa STU901, servicio Reparación de Suspensión
('2024-06-08 10:30:00', 7, 3, 8),  -- Pedro García, vehículo placa VWX234, servicio Revisión de Sistema Eléctrico
('2024-06-08 11:45:00', 8, 4, 9),  -- Elena Sánchez, vehículo placa YZA567, servicio Cambio de Aceite
('2024-06-08 13:15:00', 9, 5, 10),  -- José Ramírez, vehículo placa BCD890, servicio Cambio de Pastillas de Freno
('2024-06-08 14:30:00', 10, 1, 1), -- Sofía Torres, vehículo placa EFG123, servicio Cambio de Aceite
('2024-06-08 15:45:00', 11, 2, 2), -- Miguel Vargas, vehículo placa HIJ456, servicio Revisión de Frenos
('2024-06-09 09:00:00', 12, 3, 3), -- Carmen Castro, vehículo placa KLM789, servicio Cambio de Batería
('2024-06-09 10:30:00', 13, 4, 4), -- Diego Rojas, vehículo placa NOP012, servicio Reparación de Motor
('2024-06-09 11:45:00', 14, 5, 5), -- Marta Morales, vehículo placa QRS345, servicio Alineación y Balanceo
('2024-06-09 13:15:00', 15, 1, 6), -- Alberto Jiménez, vehículo placa TUV678, servicio Cambio de Llantas
('2024-06-09 14:30:00', 16, 2, 7), -- Patricia Núñez, vehículo placa WXY901, servicio Reparación de Suspensión
('2024-06-09 15:45:00', 17, 3, 8), -- Felipe Herrera, vehículo placa ZAB234, servicio Revisión de Sistema Eléctrico
('2024-06-10 09:00:00', 18, 4, 9), -- Lucía Ramos, vehículo placa CDE567, servicio Cambio de Aceite
('2024-06-10 10:30:00', 18, 5, 10); -- Lucía Ramos, vehículo placa CDE567, servicio Cambio de Pastillas de Freno


/* INSERTS TABLA INTERMEDIA ENTRE EMPLEADO Y REPARACION */

INSERT INTO reparacionEmpleado (idReparacion, idEmpleado, duracionHoras, notas) VALUES 
(1, 1, 3, 'Reparación completada satisfactoriamente.'),
(1, 2, 4, 'Se requirió tiempo adicional para completar la reparación.'),
(2, 3, 2, 'Revisión de frenos finalizada sin problemas.'),
(2, 4, 3, 'Se encontraron algunos problemas adicionales durante la revisión.'),
(3, 5, 5, 'Reemplazo de batería realizado con éxito.'),
(3, 6, 1, 'Verificación del sistema eléctrico completada.'),
(4, 7, 8, 'Reparación del motor completada.'),
(4, 8, 6, 'Se necesitó más tiempo debido a la complejidad de la reparación.'),
(5, 9, 2, 'Alineación y balanceo finalizados.'),
(5, 10, 3, 'Se realizó un ajuste adicional en el sistema de dirección.'),
(6, 11, 6, 'Cambio de llantas completado.'),
(6, 12, 7, 'Se requirió tiempo adicional debido a problemas con una de las llantas.'),
(7, 13, 4, 'Reparación de suspensión finalizada.'),
(7, 14, 3, 'Se realizó un ajuste adicional en el amortiguador.'),
(8, 15, 3, 'Revisión del sistema eléctrico completada sin problemas.'),
(8, 16, 2, 'Se realizaron algunas reparaciones menores en los cables eléctricos.'),
(9, 17, 5, 'Cambio de aceite y filtro completado.'),
(9, 18, 1, 'Se realizó una inspección adicional del motor.'),
(10, 19, 3, 'Cambio de pastillas de freno completado.'),
(10, 20, 2, 'Se realizó una inspección adicional del sistema de frenos.');


/* INSERTS DE FACTURAS Y DETALLES FACTURAS */ 

-- Inserts para la tabla facturacion
INSERT INTO facturacion (idFacturacion, idCliente, fecha, total) VALUES 
(1, 1, '2024-06-01 10:30:00', 100.00),
(2, 2, '2024-06-02 11:00:00', 150.00),
(3, 3, '2024-06-03 09:45:00', 200.00),
(4, 4, '2024-06-04 12:15:00', 400.00),
(5, 5, '2024-06-05 15:00:00', 120.00),
(6, 6, '2024-06-06 08:45:00', 300.00),
(7, 7, '2024-06-07 11:30:00', 200.00),
(8, 8, '2024-06-08 10:15:00', 150.00),
(9, 9, '2024-06-09 13:00:00', 100.00),
(10, 10, '2024-06-10 14:30:00', 80.00);

-- Inserts para la tabla facturaDetalles
INSERT INTO facturaDetalles (idFacturacion, idReparacion, cantidad, precio) VALUES 
(1, 1, 1, 100.00),
(2, 2, 1, 150.00),
(3, 3, 1, 200.00),
(4, 4, 1, 400.00),
(5, 5, 1, 120.00),
(6, 6, 1, 300.00),
(7, 7, 1, 200.00),
(8, 8, 1, 150.00),
(9, 9, 1, 100.00),
(10, 10, 1, 80.00);