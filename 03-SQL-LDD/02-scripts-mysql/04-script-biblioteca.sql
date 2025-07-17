CREATE DATABASE Biblioteca;
USE Biblioteca;

CREATE TABLE LECTORES (
    numlector INT PRIMARY KEY,
    nombre VARCHAR(30),
    apellidopaterno VARCHAR(30),
    apellidomaterno VARCHAR(30),
    nummembresia INT
);

CREATE TABLE LIBROS (
    numlibro INT PRIMARY KEY,
    numISBN INT,
    Cantidad INT,
    titulo VARCHAR(50),
    autor VARCHAR(40)
);

CREATE TABLE PRESTA (
    numlector INT,
    numlibro INT,
    PRIMARY KEY (numlector, numlibro),
    FOREIGN KEY (numlector) REFERENCES LECTORES(numlector),
    FOREIGN KEY (numlibro) REFERENCES LIBROS(numlibro)
);