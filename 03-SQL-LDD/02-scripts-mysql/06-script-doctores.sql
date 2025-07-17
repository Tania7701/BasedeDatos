## Crear la base de datos
CREATE DATABASE Hospital;
USE Hospital;


CREATE TABLE DOCTORES (
    Ntmdoctor INT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellidopaterno VARCHAR(50) NOT NULL,
    Apellidomaterno VARCHAR(50) NOT NULL
);


CREATE TABLE PACIENTES (
    Ntmpaciente INT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellidopaterno VARCHAR(50) NOT NULL,
    Apellidomaterno VARCHAR(50) NOT NULL
);


CREATE TABLE ATENCION (
    Ntmdoctor INT NOT NULL,
    Ntmpaciente INT NOT NULL,
    Fecha DATE NOT NULL,
    PRIMARY KEY (Ntmdoctor, Ntmpaciente, fecha),
    FOREIGN KEY (Ntmdoctor) REFERENCES DOCTORES(Ntmdoctor),
    FOREIGN KEY (Ntmpaciente) REFERENCES PACIENTES(Ntmpaciente)
);