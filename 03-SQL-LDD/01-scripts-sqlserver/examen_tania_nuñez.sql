--Crear la base de datos
CREATE DATABASE Empresa1;
GO

--Usar la base de datos 
USE Empresa1;
GO

--Crear la tabla Departamentos
CREATE TABLE Departamentos(
IdDepartamento int not null primary key,
Nombre varchar(100) not null,
CONSTRAINT unique_nombre
UNIQUE(Nombre)
);
GO


--Crear la tabla Puestos
CREATE TABLE Puestos(
IdPuesto int not null primary key,
Nombre varchar(100) not null,
SueldoBase decimal(10,2) not null,
CONSTRAINT unique_nombre1
UNIQUE(Nombre),
CONSTRAINT chk_sueldo
CHECK (SueldoBase > 0)
);
GO

--Crear la tabla Empleados
CREATE TABLE Empleados(
IdEmpleado int not null identity(1,1) primary key,
Nombre varchar(100) not null,
ApellidoPaterno varchar(100) not null,
ApellidoMaterno varchar(100) null,
CURP char(18) not null,
FechaNacimiento date not null,
FechaIngreso date not null,
IdDepartamento int not null,
IdPuesto int not null,
Genero char(1) null,
EstadoEmpleado varchar(20) null,
CONSTRAINT fk_empleados_departamento
FOREIGN KEY(IdDepartamento)
REFERENCES Departamentos(IdDepartamento),
CONSTRAINT fk_empleados_puesto
FOREIGN KEY(IdPuesto)
REFERENCES Puestos(IdPuesto),
CONSTRAINT unique_curp
UNIQUE(CURP),
CONSTRAINT chk_genero
CHECK(Genero IN ('M', 'F')),
CONSTRAINT chk_estadoEmpleado
CHECK(EstadoEmpleado IN ('Activo', 'Inactivo', 'Suspendido')),
CONSTRAINT chk_fechaIn
CHECK (2000>getdate()),
CONSTRAINT chk_fechaNa
CHECK (FechaNacimiento<getdate())
);
GO

--Crear la tabla Asistencias
CREATE TABLE Asistencias(
IdAsistencia int not null primary key,
IdEmpleado int not null,
Fecha date not null,
HoraEntrada time(7) not null,
HoraSalida time(7) null,
CONSTRAINT fk_asistencias_empleados
FOREIGN KEY(IdEmpleado)
REFERENCES Empleados(IdEmpleado)
);
GO

--Crear la tabla Incidencias
CREATE TABLE Incidencias(
IdIncidencia int not null primary key,
IdEmpleado int not null,
Fecha date not null,
TipoIncidencia varchar(50) null,
Descripcion varchar(255) not null,
CONSTRAINT fk_incidencias_empleado
FOREIGN KEY(IdEmpleado)
REFERENCES Empleados(IdEmpleado)
);
GO




--Crear la tabla Usuarios
CREATE TABLE Usuarios(
IdUsuario int not null identity(1,1) primary key,
IdEmpleado int not null,
Usuario varchar(50) not null,
ContrasenaHash varchar(255) not null,
Rol varchar(20) not null,
CONSTRAINT fk_usuarios_empleados
FOREIGN KEY(IdEmpleado)
REFERENCES Empleados(IdEmpleado),
CONSTRAINT unique_usuario
UNIQUE(Usuario),
CONSTRAINT chk_rol
CHECK(Rol IN ('ADMIN', 'RRHH', 'CONSULTA'))
);
GO