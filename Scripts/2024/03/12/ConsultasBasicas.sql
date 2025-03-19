USE northwind

SELECT * FROM Employees

SELECT * FROM Products

SELECT * FROM Suppliers

SELECT * FROM Orders

SELECT * FROM [Order Details]

SELECT employeeid, lastname, firstname 
    FROM Employees

SELECT productname, unitprice 
    FROM Products

SELECT productname, unitprice 
    FROM Products
    WHERE ProductID = 1

SELECT productname, unitprice, categoryid
    FROM Products
    WHERE UnitPrice > 30

SELECT productname, unitprice, categoryid
    FROM Products
    WHERE UnitPrice < 30

SELECT productname, unitprice, categoryid
    FROM Products
    WHERE UnitPrice = 30

SELECT productname, unitprice, categoryid
    FROM Products
    WHERE UnitPrice <= 30

SELECT productname, unitprice, categoryid
    FROM Products
    WHERE UnitPrice BETWEEN 30 AND 40

SELECT productid, productname, unitprice, categoryid
    FROM Products
    WHERE productid IN (4, 8, 20, 55)

SELECT productid, productname, unitprice, categoryid
    FROM Products
    WHERE productid IN (NULL)

--Da todos los productos que tenga una C al principio de su nombre
SELECT productid, productname, unitprice, categoryid
    FROM Products
    WHERE productname LIKE 'c%'

--Da todos los productos que tengan alguna C en su nombre
SELECT productid, productname, unitprice, categoryid
    FROM Products
    WHERE productname LIKE 'c%'

--Da todos los productos que su nombre termine con S
SELECT productid, productname, unitprice, categoryid
    FROM Products
    WHERE productname LIKE '%s'

--Da todos los productos que su nombre tenga 3 letras y luego siga la letra A
SELECT productid, productname, unitprice, categoryid
    FROM Products
    WHERE productname LIKE '___a%'

--El rango de nombre de productos, de la A a la C
SELECT productid, productname, unitprice, categoryid
    FROM Products
    WHERE productname LIKE '[a-c]%'

--Los nombre que empiecen por A o con C
SELECT productid, productname, unitprice, categoryid
    FROM Products
    WHERE productname LIKE '[a,c]%'

--Muestra donde la regio sea NULL
SELECT * FROM Employees
    WHERE region IS NULL

--Muestra donde la regio NO sea NULL
SELECT * FROM Employees
    WHERE NOT region IS NULL

--Muestra donde la unitprice NO sea entre 30 y 40
SELECT productname, unitprice, categoryid
    FROM Products
    WHERE UnitPrice NOT BETWEEN 30 AND 40

--
SELECT productid, productname, unitprice, categoryid
    FROM Products
    WHERE productname LIKE 'a%'
        OR 
            unitprice = 30

--
SELECT productid, productname, unitprice, categoryid
    FROM Products
    WHERE productname LIKE 'u%'
        AND 
            unitprice = 30


SELECT productid, productname, unitprice, categoryid
    FROM Products
    WHERE UnitPrice IN (30, 40)


SELECT productid, productname, unitprice, categoryid
    FROM Products
    WHERE UnitPrice BETWEEN 30 AND 40
        AND CategoryID = 2

--Order by para ordenarlo
SELECT productid, productname, unitprice, categoryid
    FROM Products
    WHERE UnitPrice BETWEEN 30 AND 40
        ORDER BY ProductName

SELECT productid, productname, unitprice, categoryid, Discontinued
    FROM Products
    WHERE UnitPrice BETWEEN 30 AND 40
        ORDER BY Discontinued

--Ordenado por categoria y despues por nombre del producto
SELECT productid, productname, unitprice, categoryid, Discontinued
    FROM Products
    ORDER BY CategoryID, ProductName

--Ordenado por categoria y despues por el precio unitario
SELECT productid, productname, unitprice, categoryid, Discontinued
    FROM Products
    ORDER BY CategoryID, UnitPrice

--ORDENADOS POR PRECIOS DEL MENOR AL MAYOR
SELECT productid, productname, unitprice, categoryid, Discontinued
    FROM Products
    ORDER BY CategoryID, UnitPrice DESC

--ORDENADOS POR PRECIOS DEL MAYOR AL MENOR
SELECT productid, productname, unitprice, categoryid, Discontinued
    FROM Products
    ORDER BY CategoryID ASC, UnitPrice DESC

--Quitar duplicados con DISTINCT
SELECT DISTINCT Country
FROM Suppliers
ORDER BY Country

--DISTINCT Regresa filas unicas y distintas (toma toda la fila como un elemento)
SELECT DISTINCT Country, CompanyName
FROM Suppliers
ORDER BY Country

-- __ AS __ renombra tablas
SELECT DISTINCT Country AS Pais, CompanyName AS Proveedor
FROM Suppliers
ORDER BY Country

--Es lo mismo que usar AS
SELECT DISTINCT Pais = Country, Proveedor = CompanyName
FROM Suppliers
ORDER BY Country


SELECT ProductName, UnitPrice FROM Products

--En consultas puedo agregar una expresion
SELECT ProductName, PrecioNuevo = UnitPrice * 1.10 FROM Products

SELECT ProductName, Sabor = 'Muy rico', PrecioNuevo = UnitPrice * 1.10 FROM Products

SELECT * FROM Employees

--Da la edad del empleado con el DATEDIFF
SELECT DATEDIFF(year, BirthDate, getdate()) FROM Employees

-- 19-03-25
SELECT * FROM Products, Categories
SELECT * FROM Products
    JOIN Categories on Products.categoryid = Categories.categoryid

SELECT productid, productname, unitprice, categoryname from Products
    join Categories on Products.categoryid = Categories.categoryid

SELECT orderId, CompanyName FROM Orders
    JOIN Customers ON Customers.CustomerID = orders.CustomerID

SELECT orderId, lastname FROM Orders
    JOIN Employees ON Employees.EmployeeID = orders.EmployeeID

SELECT orderID from orders
    join Customers on Customers.customerID = orders.customerID

SELECT orderId, lastname from orders
    JOIN Employees ON Employees.EmployeeID = orders.EmployeeID
    JOIN Customers ON Customers.customerID = orders.customerID

SELECT orderId, lastname, CompanyName, OrderDate, RequiredDate, Shippeddate, DATEDIFF(DAY, orderdate, ShippedDate) from orders
    JOIN Employees ON Employees.EmployeeID = orders.EmployeeID
    JOIN Customers ON Customers.customerID = orders.customerID
    WHERE OrderID = 10252

SELECT orderId, lastname, CompanyName, OrderDate, RequiredDate, Shippeddate, DATEDIFF(DAY, orderdate, ShippedDate) from orders
    JOIN Employees ON Employees.EmployeeID = orders.EmployeeID
    JOIN Customers ON Customers.customerID = orders.customerID

SELECT orderId, lastname, CompanyName, OrderDate, RequiredDate, Shippeddate, DATEDIFF(DAY, orderdate, ShippedDate) from orders
    JOIN Employees ON Employees.EmployeeID = orders.EmployeeID
    JOIN Customers ON Customers.customerID = orders.customerID
    WHERE DATEDIFF(DAY, orderdate, ShippedDate) > 0