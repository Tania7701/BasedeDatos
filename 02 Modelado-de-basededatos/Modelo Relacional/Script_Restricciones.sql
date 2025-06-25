--Crear Base de Datos
CREATE DATABASE restriccionesbdg1;

--Utilizar la base de datos
USE restriccionesbdg1;

--Crear la tabla categoria
CREATE TABLE categoria(
categoriaid int,
nombre nvarchar(30)
);

insert into categoria
values(1, 'Carnes Frias');

insert into categoria
values(1, 'Vinos y Licores');

insert into categoria
values(null, 'Ropa');

SELECT*FROM categoria;

drop table categoria;

CREATE TABLE categoria(
categoriaid int not null,
nombre nvarchar(30),
constraint pk_categoria
primary key(categoriaid)
);

insert into categoria
values(1, 'Carnes Frias');

insert into categoria
values(2, 'Vinos y Licores');

insert into categoria
values(3, 'Ropa');

insert into categoria
values(4, 'Ropa');

SELECT*FROM categoria;

drop table categoria;

CREATE TABLE categoria(
categoriaid int not null,
nombre nvarchar(30) not null,
constraint pk_categoria
primary key(categoriaid),
constraint unique_nombre
unique(nombre)
);

insert into categoria
values(1, 'Carnes Frias');

insert into categoria
values(2, 'Vinos y Licores');

insert into categoria
values(8, 'Ropa');

CREATE TABLE categoria(
categoriaid int not null,
nombre nvarchar(30) not null,
constraint pk_categoria
primary key(categoriaid),
constraint unique_nombre
unique(nombre)
);

drop table producto;
create table producto (
productoid int not null,
nombreprod nvarchar(20) not null,
precio money not null,
existencia numeric(10,2) not null,
categoria int,
constraint pk_producto
primary key(productoid), 
constraint unique_nombreprod
unique (nombreprod),
constraint chk_precio
check(precio>0 and precio<=4000),
constraint chk_existencia
check(existencia>=0),
constraint fk_producto_categoria
foreign key (categoria)
references categoria (categoriaid)

);


insert into producto
values(1, 'Tonayan', 4000, 4, 2);

insert into producto
values(2, 'Tonayan2', 1250.6, 40, 2);

insert into producto
values(3, 'Bucañas', 200, 8, 2);

insert into producto
values(4, 'Calzon Chino', 6.3, 890, 8);


SELECT*FROM producto;

SELECT*FROM producto as p
INNER JOIN categoria as c
ON c.categoriaid=p.categoria;


