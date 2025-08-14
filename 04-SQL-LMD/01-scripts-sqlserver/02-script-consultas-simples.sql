--Consultas simples
USE NORTHWND;

--Seleccionar todos los clientes
SELECT*
from Customers;

--Seleccionar todos los clientes pero solamente mostrando la clave, el nombre del cliente, la ciudad y el país(Proyección)
SELECT CustomerID, CompanyName, City, Country
FROM Customers; 

--Alias de columna 
SELECT CustomerID AS NumeroCliente, CompanyName AS 'Nombre Cliente', City AS Ciudad, Country AS [Ciudad Chida]
FROM Customers; 


--Campos calculados
--Seleccionar las ordenes de compra mostrando los productos, la cantidad vendida, precio de venta, el descuento y el total
SELECT ProductID AS [Nombre Producto], UnitPrice AS [Precio],
	   Quantity AS [Cantidad], Discount AS [Descuento], 
	   (UnitPrice * Quantity) AS [Importe Sin Descuento],
	   (UnitPrice * Quantity * (1 - Discount)) AS [Importe]
FROM [Order Details];

--Seleccionar las ordenes de compra mostrando el cliente al que se le vendió, el empleado que la realizó, la fecha de la orden, el transportista
--y la fecha de la orden, dividirla en año, mes, día, trimestre
SELECT OrderID AS [Número de Orden], OrderDate AS [Fecha de Orden], CustomerID AS [Cliente], 
	   EmployeeID AS [Empleado], ShipVia AS [Transportista],
	   YEAR(OrderDate) AS [Año de la compra], 
	   MONTH(OrderDate) AS [Mes de la compra], 
	   DAY(OrderDate) AS [Día de la compra]
FROM Orders;

SELECT OrderID AS [Número de Orden], OrderDate AS [Fecha de Orden], CustomerID AS [Cliente], 
	   EmployeeID AS [Empleado], ShipVia AS [Transportista],
	   DATEPART(year, OrderDate) AS [Año de la compra], 
	   DATEPART(mm, OrderDate) AS [Mes de la compra], 
	   DATEPART(d, OrderDate) AS [Día de la compra],
	   DATEPART(qq,OrderDate) AS [Trimestre],
	   DATEPART(week, OrderDate) AS [Semana],
	   DATEPART(WEEKDAY, OrderDate) AS [Día de la semana],
	   DATENAME(WEEKDAY, OrderDate) AS [Nombre día]
FROM Orders
ORDER BY 9 asc; 

--Seleccionar todos los productos que su precio sea mayor a 40.3(mostrar el número del producto, el nombre del producto y el precio unitario)

SELECT ProductID AS [Número de producto],
	   ProductName AS [Nombre producto],
	   UnitPrice AS [Precio]
FROM Products
WHERE UnitPrice > 40.3
;

--Mayor o igual a
SELECT ProductID AS [Número de producto],
	   ProductName AS [Nombre producto],
	   UnitPrice AS [Precio]
FROM Products
WHERE UnitPrice >= 40.3
;

--Igual a
SELECT ProductID AS [Número de producto],
	   ProductName AS [Nombre producto],
	   UnitPrice AS [Precio]
FROM Products
WHERE ProductName = 'Carnarvon Tigers'
;

--Diferente
SELECT ProductID AS [Número de producto],
	   ProductName AS [Nombre producto],
	   UnitPrice AS [Precio]
FROM Products
WHERE ProductName <> 'Carnarvon Tigers'
;

--Diferente
SELECT ProductID AS [Número de producto],
	   ProductName AS [Nombre producto],
	   UnitPrice AS [Precio]
FROM Products
WHERE ProductName != 'Carnarvon Tigers'
;


--Seleccionar todas las ordenes que sean de brasil-rio de janeiro mostrando solo el número de orden, la fecha de orden, país de envío, ciudad y transportista
SELECT OrderID AS [Número de orden],
       OrderDate AS [Fecha de orden],
	   ShipCountry AS [País de envío],
	   ShipCity AS [Ciudad de envío],
	   ShipVia AS [Transportista]
FROM Orders
WHERE ShipCity = 'Rio de Janeiro'
;


--Inner join 
SELECT O.OrderID AS [Número de orden],
       O.OrderDate AS [Fecha de orden],
	   O.ShipCountry AS [País de envío],
	   O.ShipCity AS [Ciudad de envío],
	   S.ShipperID AS [Número de transportista],
	   S.CompanyName AS [Transportista]
FROM Orders AS [O]
INNER JOIN Shippers AS [S]
ON S.ShipperID = O.ShipVia
WHERE ShipCity = 'Rio de Janeiro'
;


--Seleccionar todas las ordenes mostrando lo mismo que la consulta anterior pero todas aquellas que no tengan región de envio
SELECT O.OrderID AS [Número de orden],
       O.OrderDate AS [Fecha de orden],
	   O.ShipCountry AS [País de envío],
	   O.ShipCity AS [Ciudad de envío],
	   S.ShipperID AS [Número de transportista],
	   S.CompanyName AS [Transportista]
FROM Orders AS [O]
INNER JOIN Shippers AS [S]
ON S.ShipperID = O.ShipVia
WHERE ShipRegion is not null
;

--Seleccionar todas las ordenes enviadas a brazil, alemania y mexico que tengan región, ordenar de forma decendente por el shipcountry

SELECT O.OrderID AS [Número de orden],
       O.OrderDate AS [Fecha de orden],
	   O.ShipCountry AS [País de envío],
	   O.ShipCity AS [Ciudad de envío],
	   S.ShipperID AS [Número de transportista],
	   S.CompanyName AS [Transportista]
FROM Orders AS [O]
INNER JOIN Shippers AS [S]
ON S.ShipperID = O.ShipVia
WHERE (ShipCountry = 'Mexico' or
      ShipCountry = 'Germany' or
	  ShipCountry = 'Brazil') and
	  ShipRegion is not null
	  order by ShipRegion;

	  
--Order By -> Ordenar los datos de forma ascendente o descendente

--Seleccionar los empleados ordenados por su país
SELECT (TitleOfCourtesy + '' + FirstName + '' + LastName) AS [Nombre Completo],
country AS [País], City AS [Ciudad]
FROM Employees;

SELECT CONCAT(TitleOfCourtesy , '' , FirstName , '' , LastName) AS [Nombre Completo],
country AS [País], City AS [Ciudad]
FROM Employees
ORDER BY Country ASC
;


SELECT CONCAT(TitleOfCourtesy , '' , FirstName , '' , LastName) AS [Nombre Completo],
country AS [País], City AS [Ciudad]
FROM Employees
ORDER BY Country DESC
;


SELECT CONCAT(TitleOfCourtesy , '' , FirstName , '' , LastName) AS [Nombre Completo],
country AS [País], City AS [Ciudad]
FROM Employees
ORDER BY 2 DESC
;


SELECT CONCAT(TitleOfCourtesy , '' , FirstName , '' , LastName) AS [Nombre Completo],
country AS [País], City AS [Ciudad]
FROM Employees
ORDER BY [Nombre Completo] DESC
;

SELECT CONCAT(TitleOfCourtesy , '' , FirstName , '' , LastName) AS [Nombre Completo],
country AS [País], City AS [Ciudad]
FROM Employees
ORDER BY Country, city
;

SELECT CONCAT(TitleOfCourtesy , '' , FirstName , '' , LastName) AS [Nombre Completo],
country AS [País], City AS [Ciudad]
FROM Employees
ORDER BY Country DESC, city
;

SELECT CONCAT(TitleOfCourtesy , '' , FirstName , '' , LastName) AS [Nombre Completo],
country AS [País], City AS [Ciudad]
FROM Employees
ORDER BY Country DESC, city DESC
;

SELECT CONCAT(TitleOfCourtesy , '' , FirstName , '' , LastName) AS [Nombre Completo],
country AS [País], City AS [Ciudad]
FROM Employees
ORDER BY Country ASC, city DESC
;

SELECT CONCAT(TitleOfCourtesy , '' , FirstName , '' , LastName) AS [Nombre Completo],
country AS [País], City AS [Ciudad]
FROM Employees
ORDER BY 2 ASC, 3 DESC
;

SELECT CONCAT(TitleOfCourtesy , '' , FirstName , '' , LastName) AS [Nombre Completo],
country AS [País], City AS [Ciudad]
FROM Employees
ORDER BY 1 ASC, country DESC, 3 DESC
;

--Cambiar de base de datos
USE BDEJEMPLO2;


--Seleccionar cuantos puestos diferentes tienen los representantes 

SELECT Puesto AS [Puesto del representante],
	   Num_Empl AS [Número de empleado],
	   Nombre AS [Nombre]
FROM Representantes;


--Seleccionar todos los países diferentes de mis clientes

SELECT DISTINCT Country, city
FROM Customers;


SELECT Country, city, CompanyName
FROM Customers
WHERE City = 'Buenos Aires'
ORDER BY 1 ASC
;


SELECT CATEGORYID, SUPPLIERID
FROM Products;


--Cuantos puestos diferentes tienen los representantes 
--Funciones de agregado

SELECT COUNT(DISTINCT Puesto) AS [Número de puestos]
FROM Representantes;

--	Seleccionar el precio mínimo de los productos
SELECT MIN(Precio) AS [Precio mínimo del producto]
FROM Productos
;

--Listar las oficinas cuyas ventas están por debajo del 80% de sus objetivos
--Mostrar ciudad, ventas y el objetivo
SELECT Ciudad, Ventas, Objetivo, (.8 * objetivo) AS [80% del objetivo]
FROM Oficinas
WHERE Ventas <(.8 * objetivo)
;

--Seleccionar los primeros 5 registros de los pedidos
--Num pedido, fecha pedido,producto, cantidad e importe
SELECT TOP 5 Num_Pedido, Fecha_Pedido, Producto, Cantidad, Importe
FROM Pedidos
ORDER BY Importe DESC
;	


--Test de rango (BETWEEN)
--Hallar los pedidos del último trimestre de 1989.
SELECT Num_Pedido, Fecha_Pedido, Fab, Producto, Importe
FROM Pedidos
WHERE Fecha_Pedido BETWEEN '1989-10-01' AND '1989-12-31'
ORDER BY Fecha_Pedido DESC
;

SELECT Num_Pedido, Fecha_Pedido, Fab, Producto, Importe
FROM Pedidos
WHERE datepart(quarter,Fecha_Pedido)=4
ORDER BY Fecha_Pedido DESC
;

--Hallar los pedidos que tienen un importe entre $30,000 y $39,999.99
SELECT Num_Pedido, Fecha_Pedido, Fab, Producto, Importe
FROM Pedidos
WHERE Importe BETWEEN '30000' AND '39999.99'
;

SELECT Num_Pedido, Fecha_Pedido, Fab, Producto, Importe
FROM Pedidos
WHERE Importe>=30000 AND Importe<=39999.99
;

--Listar los representantes cuyas ventas no se encuentran entre el 80 y el 120 por ciento de su cuota
SELECT Nombre, Ventas, Cuota, (.8 * Cuota) AS [80% de la cuota], (1.2 * Cuota) AS [120% de la cuota]
FROM Representantes
WHERE Ventas not between (.8 * Cuota) and (1.2 * Cuota)
;

SELECT Nombre, Ventas, Cuota, (.8 * Cuota) AS [80% de la cuota], (1.2 * Cuota) AS [120% de la cuota]
FROM Representantes
WHERE NOT(Ventas<= (.8 * Cuota) and Ventas>=(1.2 * Cuota));

--Test de pertenencia a conjuntos (IN)
--Hallar los pedidos de 4 representantes en concreto 
SELECT Num_Pedido, Fecha_Pedido, Importe, Rep
FROM Pedidos
WHERE REP IN (107, 109, 101, 103)
;

SELECT Num_Pedido, Fecha_Pedido, Importe, Rep
FROM Pedidos
WHERE REP = 107 OR
	  REP = 109 OR
	  REP = 101 OR
	  REP = 103;


SELECT Num_Pedido, Fecha_Pedido, Importe, Rep
FROM Pedidos
WHERE REP NOT IN (107, 109, 101, 103)
;


SELECT Num_Pedido, Fecha_Pedido, Importe, Rep
FROM Pedidos
WHERE NOT(REP = 107 OR
	  REP = 109 OR
	  REP = 101 OR
	  REP = 103);


--Test de encaje de patrones (Like)

SELECT *
FROM Clientes
WHERE Empresa LIKE 'Ac%'
;

SELECT *
FROM Clientes
WHERE Empresa LIKE '%L'
;

SELECT *
FROM Clientes
WHERE Empresa LIKE '%er%'
;


SELECT *
FROM Clientes
WHERE Empresa LIKE '[A-D]%'
;


SELECT *
FROM Clientes
WHERE Empresa LIKE '[ADf]%'
;


SELECT *
FROM Clientes
WHERE Empresa LIKE '_ilas'
;


SELECT *
FROM Clientes
WHERE Empresa LIKE '____'
;



SELECT *
FROM Clientes
WHERE Empresa LIKE '[^ADf]%'
;


--Hallar todos los representantes que:
--a) Trabajan en Daimiel, Navarra o Castellón; o bien
--b) No tienen jefe y están contratados desde junio de 1988; o
--c) Superan su cuota pero tienen ventas de $600,000 o menos

SELECT Nombre, Fecha_Contrato, Puesto
FROM Representantes
WHERE Oficina_Rep IN (11,12,22) OR
Jefe IS NULL AND Fecha_Contrato >= '1988-06-01' OR
Ventas>Cuota AND Ventas <= 600000
;



