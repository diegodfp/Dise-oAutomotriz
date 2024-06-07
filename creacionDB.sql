-- Active: 1717105247149@@127.0.0.1@3306@dbGarden

-- CREACION Y USO DE LA BASE DE DATOS

DROP DATABASE IF EXISTS tallerAutomotriz;

CREATE DATABASE tallerAutomotriz;
USE tallerAutomotriz;

/* INICIO CREACION DE LAS TABLAS */ 

-- creacion tabla pais y ciudad --

CREATE TABLE IF NOT EXISTS pais(
    idPais INT AUTO_INCREMENT PRIMARY KEY,
    nombrePais VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS ciudad(
    idCiudad INT AUTO_INCREMENT PRIMARY KEY,
    nombreCiudad VARCHAR(50) NOT NULL,
    idPais INT,
    Foreign Key (idPais) REFERENCES pais(idPais)
);
-- creacion tabla TIPO DE Documento --
CREATE TABLE IF NOT EXISTS tipoDocumento(
    idTipoDocumento INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(50) NOT NULL
);

-- creacion tabla Sede taller y su tabla telefono -- 
CREATE TABLE IF NOT EXISTS sedeTaller(
    idTaller INT AUTO_INCREMENT PRIMARY KEY,
    nombreTaller VARCHAR(45) NOT  NULL,
    direccion VARCHAR(100) NOT NULL,
    idCiudad INT,
    Foreign Key (idCiudad) REFERENCES ciudad(idCiudad)
);

CREATE TABLE IF NOT EXISTS telefonoTaller(
    idTelefonoTaller INT AUTO_INCREMENT PRIMARY KEY,
    fijo VARCHAR(10),
    celPrincipal VARCHAR(15) NOT NULL,
    celSecundario VARCHAR(15),
    idTaller INT,
    Foreign Key (idTaller) REFERENCES sedeTaller(idTaller)
);

/* creacion tablas cargo/Empleado/ telEmpleado */

CREATE TABLE IF NOT EXISTS cargo(
    idCargo INT AUTO_INCREMENT PRIMARY KEY,
    nombreCargo VARCHAR(25) NOT NULL,
    salarioBase DOUBLE(10,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS empleado(
    idEmpleado INT AUTO_INCREMENT PRIMARY KEY,
    documento VARCHAR(15) NOT NULL,
    nombre VARCHAR(25) NOT NULL,
    apellido1 VARCHAR(25) NOT NULL,
    apellido2 VARCHAR(25) ,
    idTaller INT,
    idCargo INT,
    idTipoDocumento INT,
    Foreign Key (idTaller) REFERENCES sedeTaller(idTaller),
    Foreign Key (idCargo) REFERENCES cargo(idCargo),
    Foreign Key (idTipoDocumento) REFERENCES tipoDocumento(idTipoDocumento)
);

CREATE TABLE IF NOT EXISTS telefonoEmpleado(
    idTelefonoEmpleado INT AUTO_INCREMENT PRIMARY KEY,
    fijo VARCHAR(10),
    celPrincipal VARCHAR(15) NOT NULL,
    celSecundario VARCHAR(15),
    idEmpleado INT,
    Foreign Key (idEmpleado) REFERENCES empleado(idEmpleado)
);

/* CREACION TABLA CLIENTE - TELEFONO/CLIENTE - VEHICULO/MARCA/MODELO */

CREATE TABLE IF NOT EXISTS cliente(
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    documento VARCHAR(15) UNIQUE NOT NULL,
    nombre VARCHAR(25) NOT NULL,
    apellido1 VARCHAR(25) NOT NULL,
    apellido2 VARCHAR(25) ,
    direccion VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    idTaller INT,
    idTipoDocumento INT,
    Foreign Key (idTaller) REFERENCES sedeTaller(idTaller),
    Foreign Key (idTipoDocumento) REFERENCES tipoDocumento(idTipoDocumento)
);

CREATE TABLE IF NOT EXISTS telefonoCliente(
    idTelefonoCliente INT AUTO_INCREMENT PRIMARY KEY,
    fijo VARCHAR(10),
    celPrincipal VARCHAR(15) NOT NULL,
    celSecundario VARCHAR(15),
    idCliente INT,
    Foreign Key (idCliente) REFERENCES cliente(idCliente)
);


CREATE TABLE IF NOT EXISTS marca(
    idMarca INT AUTO_INCREMENT PRIMARY KEY,
    nombreMarca VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS modelo(
    idModelo INT AUTO_INCREMENT PRIMARY KEY,
    nombreModelo VARCHAR(20) NOT NULL,
    idMarca INT,
    Foreign Key (idMarca) REFERENCES marca(idMarca)
);

CREATE TABLE IF NOT EXISTS vehiculo(
    idVehiculo INT AUTO_INCREMENT,
    placa VARCHAR(10) NOT NULL UNIQUE,
    idCliente INT,
    idModelo INT,
    PRIMARY KEY(idVehiculo, idCliente),
    Foreign Key (idModelo) REFERENCES modelo(idModelo),
    Foreign Key (idCliente) REFERENCES cliente(idCliente)
);

/* CREACION TABLA PROVEEDOR Y TELEFONO PROVEEDOR */ 

CREATE TABLE IF NOT EXISTS proveedor(
    idProveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    nombreContacto VARCHAR(50) NOT NULL,
    idCiudad INT,
    idTaller INT,
    Foreign Key (idCiudad) REFERENCES ciudad(idCiudad),
    Foreign Key (idTaller) REFERENCES sedeTaller(idTaller) 
);

CREATE TABLE IF NOT EXISTS telefonoProveedor(
    idTelefonoProveedor INT AUTO_INCREMENT PRIMARY KEY,
    fijo VARCHAR(10),
    celPrincipal VARCHAR(15) NOT NULL,
    celSecundario VARCHAR(15),
    idProveedor INT,
    Foreign Key (idProveedor) REFERENCES proveedor(idProveedor)
);

/* CREACION TABLA PIEZAS  / INVENTARIO  / UBICACION */

CREATE TABLE IF NOT EXISTS pieza(
    idPieza INT AUTO_INCREMENT PRIMARY KEY,
    nombrePieza VARCHAR(40) NOT NULL,
    descripcion TEXT
);

CREATE TABLE IF NOT EXISTS ubicacion(
    idUbicacion INT AUTO_INCREMENT PRIMARY KEY,
    descripcion TEXT NOT NULL,
    nombreUbicacion VARCHAR(40) NOT NULL,
    idTaller INT,
    Foreign Key (idTaller) REFERENCES sedeTaller(idTaller)
);

CREATE TABLE IF NOT EXISTS inventario(
    idInventario INT AUTO_INCREMENT PRIMARY KEY,
    idUbicacion INT,
    descripcion TEXT,
    Foreign Key (idUbicacion) REFERENCES ubicacion(idUbicacion)
);

-- CREACION RELACION MUCHOS A MUCHOS DE INVENTARIO Y PIEZAS --

CREATE TABLE IF NOT EXISTS inventarioPiezas(
    idInventario INT,
    idPieza INT,
    PRIMARY KEY(idInventario, idPieza),
    Foreign Key (idInventario) REFERENCES inventario(idInventario),
    Foreign Key (idPieza) REFERENCES pieza(idPieza),
    cantidad INT NOT NULL
);

-- CREACION RELACION MUCHOS A MUCHOS DE PIEZAS Y PROVEEDORES
CREATE TABLE IF NOT EXISTS proveedoresPiezas(
    idProveedor INT,
    idPieza INT,
    PRIMARY KEY(idProveedor, idPieza),
    Foreign Key (idProveedor) REFERENCES proveedor(idProveedor),
    Foreign Key (idPieza) REFERENCES pieza(idPieza),
    precio DOUBLE(10,2) NOT NULL
);

-- CREACION TABLA ORDEN DE COMPRA Y ORDEN DETALLE 

CREATE TABLE IF NOT EXISTS ordenCompra(
    idOrdenCompra INT AUTO_INCREMENT,
    fecha DATE NOT NULL,
    total DOUBLE(10,2) NOT NULL,
    idProveedor INT,
    idEmpleado INT,
    PRIMARY KEY(idOrdenCompra),
    Foreign Key (idProveedor) REFERENCES proveedor(idProveedor),
    Foreign Key (idEmpleado) REFERENCES empleado(idEmpleado)
);

CREATE TABLE IF NOT EXISTS ordenDetalle(
    idOrdenCompra INT,
    idPieza INT,
    cantidad INT NOT NULL,
    precio DOUBLE (10,2) NOT NULL,
    PRIMARY KEY (idOrdenCompra, idPieza),
    Foreign Key (idOrdenCompra) REFERENCES ordenCompra(idOrdenCompra),
    Foreign Key (idPieza) REFERENCES pieza(idPieza)
);

/* CREANDO TABLA SERVICIO Y REPARACION */ 
CREATE TABLE IF NOT EXISTS servicio(
    idServicio INT AUTO_INCREMENT PRIMARY KEY,
    nombreServicio VARCHAR(40) NOT NULL,
    descripcion TEXT NOT NULL,
    costo DOUBLE(10,2) NOT NULL,
    idTaller INT,
    Foreign Key (idTaller) REFERENCES sedeTaller(idTaller)
);

CREATE TABLE IF NOT EXISTS reparacion(
    idReparacion INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    costoTotal DOUBLE(10,2) NOT NULL,
    descripcion  TEXT,
    idServicio INT,
    idvehiculo  INT,
    Foreign Key (idServicio) REFERENCES servicio(idServicio),
    Foreign Key (idvehiculo) REFERENCES vehiculo(idvehiculo)
);

/* CREACION TABLA CITA */ 

CREATE TABLE IF NOT EXISTS cita(
    idCita INT AUTO_INCREMENT,
    fechaHora DATETIME NOT NULL,
    idCliente INT,
    idVehiculo INT,
    idServicio INT,
    PRIMARY KEY(idCita, idCliente, idVehiculo, idServicio),
    Foreign Key (idCliente) REFERENCES vehiculo(idCliente),
    Foreign Key (idVehiculo) REFERENCES vehiculo(idVehiculo),
    Foreign Key (idServicio) REFERENCES servicio(idServicio)
);

/* CREACION TABLA INTERMEDIA ENTRE EMPLEADO Y REPARACION */

CREATE TABLE IF NOT EXISTS reparacionEmpleado(
    idReparacion INT,
    idEmpleado INT,
    duracionHoras INT NOT NULL,
    notas TEXT,
    PRIMARY KEY(idReparacion, idEmpleado),
    Foreign Key (idReparacion) REFERENCES reparacion(idReparacion),
    Foreign Key (idEmpleado) REFERENCES empleado(idEmpleado)
);

/* CREACION FACTURACION  Y FACTURA DETALLES */ 

CREATE TABLE IF NOT EXISTS facturacion(
    idFacturacion INT,
    idCliente INT,
    fecha DATETIME NOT NULL,
    total DOUBLE(10,2) NOT NULL,
    PRIMARY KEY(idFacturacion),
    Foreign Key (idCliente) REFERENCES cliente(idCliente)
);

CREATE TABLE IF NOT EXISTS facturaDetalles(
    idFacturacion INT,
    idReparacion INT,
    cantidad INT NOT NULL,
    precio DOUBLE(10,2) NOT NULL,
    PRIMARY KEY(idFacturacion, idReparacion),
    Foreign Key (idFacturacion) REFERENCES facturacion(idFacturacion),
    Foreign Key (idReparacion) REFERENCES reparacion(idReparacion)
);



