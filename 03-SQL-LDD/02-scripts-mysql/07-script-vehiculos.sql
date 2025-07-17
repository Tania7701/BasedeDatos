CREATE DATABASE Vehiculos;
USE Vehiculos;

CREATE TABLE SUCURSAL (
    numsucursal INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    ubicacion VARCHAR(50) NOT NULL
);

CREATE TABLE VEHICULO (
    numvehiculo INT PRIMARY KEY,
    marca VARCHAR(40) NOT NULL,
    ano DATE NOT NULL,
    modelo VARCHAR(40) NOT NULL,
    placa VARCHAR(10) NOT NULL,
    numsucursal INT NOT NULL,
    FOREIGN KEY (numsucursal) REFERENCES SUCURSAL(numsucursal)
);

CREATE TABLE CLIENTE (
    numcli INT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    apellidopaterno VARCHAR(50) NOT NULL,
    apellidomaterno VARCHAR(40) NOT NULL,
    Curp CHAR(50) NOT NULL,
    Telefono VARCHAR(40) NOT NULL,
    Calle VARCHAR(50) NOT NULL,
    Num VARCHAR(20) NOT NULL,
    Ciudad VARCHAR(50) NOT NULL
);

CREATE TABLE RENTA (
    NumeCliente INT NOT NULL,
    numvehiculo INT NOT NULL,
    numdissprestados INT NOT NULL,
    Fechainicio DATE NOT NULL,
    Fechatemino DATE NOT NULL,
    PRIMARY KEY (NumeCliente, numvehiculo, Fechainicio),
    FOREIGN KEY (NumeCliente) REFERENCES CLIENTE(numcli),
    FOREIGN KEY (numvehiculo) REFERENCES VEHICULO(numvehiculo)
);