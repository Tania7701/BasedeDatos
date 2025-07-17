CREATE DATABASE Cursos;
USE Cursos;

CREATE TABLE Estudiante (
    numestudiante INT NOT NULL PRIMARY KEY,
    matricula INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellidopaterno VARCHAR(50) NOT NULL,
    apellidomaterno VARCHAR(50) NOT NULL
);

CREATE TABLE Curso (
    numcurso INT NOT NULL PRIMARY KEY,
    codigo INT NOT NULL,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE Inscripcion (
    numestudiante INT NOT NULL,
    numcurso INT NOT NULL,
    fechaInscripcion DATE NOT NULL,
    CONSTRAINT pk_inscripcion PRIMARY KEY (numestudiante, numcurso),
    CONSTRAINT fk_inscripcion_estudiante FOREIGN KEY (numestudiante)
        REFERENCES Estudiante (numestudiante),
    CONSTRAINT fk_inscripcion_curso FOREIGN KEY (numcurso)
        REFERENCES Curso (numcurso)
);