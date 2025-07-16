-- Crear base de datos empresapatito
CREATE DATABASE empresapatito;
GO
-- Usar la base de datos
USE empresapatito;
GO

-- Crear una tabla empleados
CREATE TABLE empleados(
Idempleado INT not null,
Nombre VARCHAR(100) not null,
Puesto VARCHAR(50), 
FechaIngreso DATE,
Salario DECIMAL(10,2),
CONSTRAINT pk_empleados
PRIMARY KEY(Idempleado)
);
GO

-- Agregar una columna en la tabla empleados
ALTER TABLE empleados
ADD CorreoElectronico VARCHAR(100);
GO


-- Modificar el tipo de dato de un campo
ALTER TABLE empleados
ALTER COLUMN Salario MONEY not null;


-- Renombrar un campo
EXEC sp_rename 'empleados.CorreoElectronico',
               'Email', 'COLUMN';
GO



SELECT*FROM empleados;

-- Crear tabla departamentos
CREATE TABLE departamentos(
IdDepartamento INT not null IDENTITY(1,1) PRIMARY KEY,
NombreDepto VARCHAR(100)
);
GO

-- Agregar un campo a la tabla empleados
-- Para que sea una foreign key
ALTER TABLE empleados 
ADD IdDepartamento INT not null;
GO

-- Agregar llave foranea
ALTER TABLE empleados
ADD CONSTRAINT fk_empleados_departamentos
FOREIGN KEY (IdDepartamento)
REFERENCES departamentos(IdDepartamento);
GO

-- Eliminar la clave primaria de empleados
ALTER TABLE empleados
DROP CONSTRAINT pk_empleados;
GO

-- Eliminar la foreign key de la tabla empleados
ALTER TABLE empleados
DROP CONSTRAINT fk_empleados_departamentos;


-- Eliminar la primary key de departamento
ALTER TABLE departamentos
DROP CONSTRAINT PK__departam__787A433DFFFDFDF3;
GO

-- Crear un constraint de verificacion en salario
ALTER TABLE empleados
ADD CONSTRAINT chk_salario
CHECK (Salario > 0.0);
GO

CREATE TABLE Categoria(
Id INT not null PRIMARY KEY DEFAULT -1,
Nombre VARCHAR(20),
Estatus CHAR(1) DEFAULT 'A'
);
GO

INSERT INTO Categoria
VALUES (1, 'Carnes', 'D');

SELECT*FROM Categoria;


INSERT INTO Categoria
VALUES (DEFAULT, 'Carnes', Default);



DROP TABLE Categoria




-- Eliminar la columna Email
ALTER TABLE empleados
DROP COLUMN Email;

SELECT*FROM empleados

-- Eliminar tabla 
ALTER TABLE empleados
ADD CONSTRAINT pk_empleados
PRIMARY KEY(IdEmpleado);
GO

ALTER TABLE departamentos
ADD CONSTRAINT pk_departamentos
PRIMARY KEY(IdDepartamento);
GO

-- Eliminar las tablas
DROP TABLE empleados;
GO

DROP TABLE departamentos;
GO

DROP TABLE Categoria;
GO


USE master;
GO
-- Eliminar la base de datos
DROP DATABASE empresapatito;
GO
