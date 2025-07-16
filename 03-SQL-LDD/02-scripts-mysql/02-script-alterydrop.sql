# Crear base de datos empresapatito
CREATE DATABASE empresapatito;

-- Usar la base de datos
USE empresapatito;


# Crear una tabla empleados
CREATE TABLE empleados(
Idempleado INT not null,
Nombre VARCHAR(100) not null,
Puesto VARCHAR(50), 
FechaIngreso DATE,
Salario DECIMAL(10,2),
CONSTRAINT pk_empleados
PRIMARY KEY(Idempleado)
);


# Agregar una columna en la tabla empleados
ALTER TABLE empleados
ADD COLUMN CorreoElectronico VARCHAR(100);



# Modificar el tipo de dato de un campo
ALTER TABLE empleados
MODIFY COLUMN Salario DECIMAL(12,2) not null;


# Renombrar un campo
ALTER TABLE empleados
RENAME COLUMN CorreoElectronico to Email;




SELECT*FROM empleados;

# Crear tabla departamentos
CREATE TABLE departamentos(
IdDepartamento INT not null auto_increment PRIMARY KEY,
NombreDepto VARCHAR(100)
);


# Agregar un campo a la tabla empleados
# Para que sea una foreign key
ALTER TABLE empleados 
ADD COLUMN IdDepartamento INT not null;


# Agregar llave foranea
ALTER TABLE empleados
ADD CONSTRAINT fk_empleados_departamentos
FOREIGN KEY (IdDepartamento)
REFERENCES departamentos(IdDepartamento);


# Eliminar la clave primaria de empleados
ALTER TABLE empleados
DROP PRIMARY KEY;


# Eliminar la foreign key de la tabla empleados
ALTER TABLE empleados
DROP FOREIGN KEY fk_empleados_departamentos;

# Eliminar el auto_increment
ALTER TABLE departamentos
MODIFY COLUMN IdDepartamento INT NOT NULL;


# Eliminar la primary key de departamento
ALTER TABLE departamentos
DROP PRIMARY KEY;


# Crear un constraint de verificacion en salario
ALTER TABLE empleados
ADD CONSTRAINT chk_salario
CHECK (Salario > 0.0);


CREATE TABLE Categoria(
Id INT not null PRIMARY KEY DEFAULT -1,
Nombre VARCHAR(20),
Estatus CHAR(1) DEFAULT 'A'
);


INSERT INTO Categoria
VALUES (1, 'Carnes', 'D');

SELECT*FROM Categoria;


INSERT INTO Categoria
VALUES (DEFAULT, 'Carnes', Default);

SELECT*FROM Categoria;


DROP TABLE Categoria




# Eliminar la columna Email
ALTER TABLE empleados,
DROP COLUMN Email;

SELECT*FROM empleados

# Eliminar tabla 
ALTER TABLE empleados
ADD CONSTRAINT pk_empleados
PRIMARY KEY(IdEmpleado);


ALTER TABLE departamentos
ADD CONSTRAINT pk_departamentos
PRIMARY KEY(IdDepartamento);


# Eliminar las tablas
DROP TABLE empleados;


DROP TABLE departamentos;


DROP TABLE Categoria;



# Eliminar la base de datos
DROP DATABASE empresapatito;

