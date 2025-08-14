--Consultas Avanzadas 

--Hallar todos los representantes que o bien:
--a) trabajan en daimiel, Navarra, o Castellon; o bien
--b) No tienen Jefe y estan contratados desde junio de 1988; o 
--c) superan su cuota pero tienen ventas de 600000 o menos 


Select r.Num_Empl AS [Numero Empleado], 
	r.Nombre AS [Nombre Empleado],
	r.Fecha_Contrato AS [Fecha de Contrato],
	r.Cuota AS [Cuota de Ventas],
	r.Ventas AS [Ventas Totales],
	o.Ciudad AS [Ciudad de la Oficina],
	r.Jefe AS [Numero de Jefe]
From Representantes AS r
INNER JOIN Oficinas AS o
ON o.Oficina =r.Oficina_Rep
Where (o.Ciudad in ('Daimiel','Navarra','Castellón')) or
		(Jefe IS NULL and Fecha_Contrato >='1988-06-01') or 
		(r.Ventas> Cuota and r.Ventas<=600000)	
;

--Listar todos los pedidos mostrando el numero de pedido,
--su importe y el nombre y limite de credito del cliente 

SELECT p.Importe, p.Importe,c.Empresa,c.Limite_Credito
FROM Pedidos AS p
INNER JOIN Clientes AS C
ON c.Num_Cli = p.Cliente;

--Listar la oficinas con un objetivo superior a 60000, mostrando el nombre
--de la cuidad, nombre del representante y su puesto
SELECT o.Ciudad AS [Oficina] , 
		r.Nombre AS [Representante], 
		r.Puesto AS [Puesto],
		o.Objetivo AS [Objetivo de Ventas]
FROM Oficinas AS o
INNER JOIN Representantes AS r
ON o.Jef = r.Num_Empl
WHERE o.Objetivo > 600000;


--Listar todos los pedidos mostrando el numero de pedido,
--el importe, el nombre y limite de credito del cliente

SELECT pe.Num_Pedido AS [Número Pedido],
	   pe.Importe AS [Importe],
	   c.Empresa AS [Cliente],
	   c.Limite_Credito AS [Limite de Credito]
FROM Pedidos AS pe
INNER JOIN Clientes AS c
ON pe.Cliente = c.Num_Cli; 


SELECT *
FROM Pedidos AS pe
INNER JOIN Clientes AS c
ON pe.Cliente = c.Num_Cli; 

--Listar cada representante mostrando su nombre, la cuidad, 
--region, en que trabajan

SELECT r.Nombre AS [Representante],
	   o.Ciudad AS [Oficina],
	   o.Region AS [Región]
FROM Representantes AS r
INNER JOIN Oficinas AS o
ON r.Oficina_Rep = o.Oficina;

--Listar las oficinas (ciudad), nombres y puestos de sus jefes
SELECT r.Nombre AS [Representante],
	   o.Ciudad AS [Oficina],
	   o.Region AS [Región]
FROM Representantes AS r
INNER JOIN Oficinas AS o
ON r.Num_Empl = o.Jef;


--lsitar los pedidos mostrando el numero de pedido, el importe 
--y la cantidad de cada producto

SELECT pe.Num_Pedido AS [Número Pedido],
	   pe.Importe AS [Importe],
	   pr.Stock AS [Cantidad],
	   pr.Descripcion AS [Descripcion]
	  
FROM Pedidos AS pe
INNER JOIN Productos AS pr
ON pr.Id_producto = pe.Producto
	AND pe.Fab = pr.Id_fab

--Listar los nombres de los empleados y los nombres de sus jefes 

SELECT empl.Nombre AS [Empleado],
	   jefs.Nombre AS [Jefe]
FROM Representantes AS jefs
INNER JOIN Representantes AS empl
ON jefs.Num_Empl = empl.Jefe;

--Listar los pedidos con un importe superior a 25000, incluyendo el nombre del representante, numero de pedido,
--importe, nombre del representante que tomo nota del pedido y el nombre del cliente

Select p.Num_Pedido, p.Importe, r.Nombre, c.Empresa
From Pedidos AS p
INNER JOIN Representantes AS r
ON r.Num_Empl = p.Rep
INNER JOIN Clientes AS c
ON c.Num_Cli = p.Cliente
WHERE p.Importe > 25000;

--Listar los pedidos superiores a 25000 mostrando el numero de pedido, el nombre del cliente que lo encargo 
--y el nombre del representante asignado al cliente, y el importe

SELECT p.Num_Pedido AS [Número de Pedido],
	   c.Empresa AS [Cliente],
	   r.Nombre AS [Representante Cliente],
	   p.Importe AS [Importe]
FROM Representantes AS r
INNER JOIN Clientes AS c
ON r.Num_Empl = c.Rep_Cli
INNER JOIN Pedidos AS p
ON c.Num_Cli = p.Cliente
WHERE importe>25000
;

use BDG1JOINS;
SELECT *
FROM Categoría;
SELECT *
FROM Producto;

/*
INNER JOIN
*/
SELECT *
FROM Categoría AS C
JOIN Producto AS p
ON c.categoriaId = p.categoria;


/*
LEFT JOIN o LEFT OUTER JOIN

La primera tabla que aparece en la lista es la tabla izquierda 
*/
SELECT *
FROM Categoría AS C
LEFT JOIN Producto AS p
ON c.categoriaId = p.categoria;

--Mostrar todas las categorías que no tengas productos asignados
SELECT *
FROM Categoría AS C
LEFT JOIN Producto AS p
ON c.categoriaId = p.categoria
WHERE p.categoria is null
;


/*
RIGHT JOIN 
Toma todos los datos de la tabla derecha y los que coinciden con la tabla izquierda, y los que no coinciden los pone en null
*/

SELECT *
FROM Categoría AS c
RIGHT JOIN Producto AS p
ON c.categoriaId = p.categoria;

--Selecciona todos aquellos productos que no tienen categoría asignada
SELECT p.nombre AS [Nombre del producto],
	   p.precio AS [Precio]
FROM Categoría AS c
RIGHT JOIN Producto AS p
ON c.categoriaId = p.categoria
WHERE categoria is null
;


/*
FULL JOIN 
Obtiene los datos de la tabla izquierda, los datos de la tabla derecha y todas las coincidencias entre las dos
*/
SELECT *
FROM Categoría AS C
FULL JOIN Producto AS p
ON c.categoriaId = p.categoria;


SELECT *
FROM Categoría AS C
CROSS JOIN Producto AS p;


SELECT *
From Categoría AS c,
Producto AS p
WHERE c.categoriaId = p.categoria;


/*
Agregación

count(*) - Cuenta las filas,
count(campo) - Cuenta las filas pero no cuenta los null,
min() - Obtiene el valor mínimo de un campo,
max() - Obtiene el valor máximo de un campo,
avg() - Obtiene la media aritmética o el promedio de un campo,
sum() - Obtiene el total o la sumatoria
*/

use NORTHWND;


--Cuantos clientes hay
SELECT count(*) AS [Número de clientes]
FROM Customers;

--Cuantas ventas se han realizado
SELECT count(*)
FROM Orders;

--Cuantas ventas se realizaron en 1996

SELECT count(*)
FROM Orders
WHERE datepart(year, OrderDate) = 1996;

--Seleccionar la venta de la fecha más antigua que se hizo
SELECT MIN(OrderDate) AS [Fecha de primera venta] FROM
Orders;

--Seleccionar el total que se ha vendido
SELECT SUM(UnitPrice * Quantity) AS [Total de Ventas]
from[Order Details]; 

--Seleccionar el total de ventas entre 1996 y 1997
SELECT SUM(UnitPrice * Quantity) AS [Total de Ventas]
from[Order Details] AS od
INNER JOIN Orders AS o
ON o.OrderID = od.OrderID
WHERE DATEPART(yy, o.OrderDate) between 1996 and 1997
AND o.CustomerID = 'AROUT'
;

--Seleccionar las ventas totales hechas a cada uno de los clientes
SELECT c.CompanyName AS [Cliente],
SUM(UnitPrice * Quantity) AS [Total de Ventas]
from[Order Details] AS od
INNER JOIN Orders AS o
ON o.OrderID = od.OrderID
INNER JOIN Customers AS c
ON c.CustomerID = o.CustomerID
WHERE DATEPART(yy, o.OrderDate) between 1996 and 1997
GROUP BY c.CompanyName
;