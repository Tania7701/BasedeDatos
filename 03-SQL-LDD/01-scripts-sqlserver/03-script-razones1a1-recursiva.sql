CREATE DATABASE ejercicio1999;
GO

USE ejercicio1999;
GO

CREATE TABLE Empleado(
Empleadoid int not null identity(1, 1),
Nombre nvarchar(15) not null,
Apellido1 nvarchar(15) not null,
Apellido2 nvarchar(15),
Direccion nvarchar(50) not null,
Salario decimal(10,2) not null,
Jef int,
Departamento int not null,
CONSTRAINT pk_empleado
PRIMARY KEY(Empleadoid),
CONSTRAINT chk_salario
CHECK (salario between 200 and 50000),
CONSTRAINT fk_empleado_jefe
FOREIGN KEY (Jef)
REFERENCES empleado(Empleadoid)
ON DELETE NO ACTION
ON UPDATE NO ACTION 
);
GO


CREATE TABLE Departamento(
Departamentoid int not null identity(1,1),
NombreDepto nvarchar(20) not null,
Estatus char(2) not null,
Administrador int not null,
CONSTRAINT pk_departamento
PRIMARY KEY(Departamentoid),
CONSTRAINT unique_NombreDepto
UNIQUE(NombreDepto),
CONSTRAINT chk_estatus
CHECK(Estatus IN ('SI , NO')),
CONSTRAINT fk_empleado_depto
FOREIGN KEY(Administrador)
REFERENCES Empleado(Empleadoid)
);
GO

ALTER TABLE Empleado
ADD CONSTRAINT fk_empleado_depto1
FOREIGN KEY (departamento)
REFERENCES Departamento(Departamentoid);
GO

CREATE TABLE Ubicacion(
Ubicacionid int not null identity(1,1),
Ubicacion nvarchar(15) not null,
Deptoid int not null,
CONSTRAINT pk_ubicacion
PRIMARY KEY(Ubicacionid),
CONSTRAINT unique_deptoid
UNIQUE(Deptoid),
CONSTRAINT fk_ubicacion_depto
FOREIGN KEY(Deptoid)
REFERENCES Departamento(Departamentoid)
);
GO