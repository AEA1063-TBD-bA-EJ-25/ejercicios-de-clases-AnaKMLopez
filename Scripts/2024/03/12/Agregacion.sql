USE northwind

SELECT * FROM Products

SELECT COUNT(*) FROM Products
SELECT MAX(UNITPRICE) FROM Products
SELECT MIN(UNITPRICE) FROM Products
SELECT AVG(UNITPRICE) FROM Products
SELECT SUM(UNITPRICE) FROM Products

SELECT CATEGORYID, AVG(UNITPRICE) AS PrecioPromedio FROM Products
    GROUP BY CategoryID
    ORDER BY PrecioPromedio DESC

--Ordenar cuantos productos tengo de cada categoria y ordenarlos de menor a mayor
SELECT CategoryID, COUNT(*) AS Cantidad FROM Products
    GROUP BY CategoryID
    ORDER BY COUNT(*)

--Precio pero aumentamos el 10%
SELECT UNITPRICE * 1.10 AS NuevoPrecio FROM Products

--Cuantos productos tenemos descontinuados
SELECT COUNT(*) FROM Products
    WHERE Discontinued = 1

--De la orden 10250 por cuantos articulos diferentes se pidieron en esa orden
SELECT COUNT(*) FROM [Order Details]
    WHERE OrderID = 10250

--Cual es el importe de la orden 10250
SELECT SUM(UNITPRICE * QUANTITY - Discount * UnitPrice * Quantity) FROM [Order Details]
    WHERE OrderID = 10250

--Cuanto hemos vendido en total desde que empezo la empresa hasta ahora
SELECT SUM(UNITPRICE * QUANTITY - Discount * UnitPrice * Quantity) AS TOTAL FROM [Order Details]

--TABLAS
SELECT * FROM Categories
SELECT * FROM Products
SELECT * FROM Orders
SELECT * FROM [Order Details]
SELECT * FROM Customers

--Cuanto vendimos de Beverages
SELECT SUM([Order Details].UnitPrice * QUANTITY - Discount * [Order Details].UnitPrice * Quantity) FROM [Order Details]
    JOIN Products ON Products.ProductID = [Order Details].[ProductID]
    WHERE CategoryID = 1

--Para cambiar los nombres de las variables 
SELECT SUM([OD].UnitPrice * QUANTITY - Discount * [OD].UnitPrice * Quantity) FROM [Order Details] OD
    JOIN Products P ON P.ProductID = [OD].[ProductID]
    JOIN Categories C ON C.CategoryID = P.CategoryID

--Cuanto vendimos de bebidas en  1997
SELECT SUM(QUANTITY * (1 - Discount) * OD.Unitprice) AS TOTAL  FROM [Order Details] OD
    JOIN Products P ON P.ProductID = OD.ProductID
    JOIN Categories C ON C.CategoryID = P.CategoryID
    JOIN Orders O ON O.OrderID = OD.OrderID
    WHERE 1 = 1
        AND C.categoryname = 'Beverages'
        AND YEAR(OrderDate) = 1997

--Cuanto vendí en 1997 de cada categoría de producto 
SELECT C.CategoryName, SUM(QUANTITY * (1 - Discount) * OD.Unitprice)  AS TotalVendido FROM [Order Details] OD
    JOIN Orders O ON OD.OrderID = O.OrderID
    JOIN Products P ON OD.ProductID = P.ProductID
    JOIN Categories C ON P.CategoryID = C.CategoryID
    WHERE YEAR(O.OrderDate) = 1997
    GROUP BY C.CategoryName
    ORDER BY C.CategoryName ASC;

--El precio total de la orden 10250
SELECT SUM(QUANTITY * (1 - Discount) * OD.Unitprice)  AS TotalVendido FROM [Order Details] OD
    WHERE OrderID = 10250

--DATEPART: ORDENA POR EL NUMERO DEL MES
SELECT C.CategoryName, DATENAME (month, O.OrderDate), SUM(QUANTITY * (1 - Discount) * OD.Unitprice) AS TotalVendido FROM [Order Details] OD
    JOIN Orders O ON OD.OrderID = O.OrderID
    JOIN Products P ON OD.ProductID = P.ProductID
    JOIN Categories C ON P.CategoryID = C.CategoryID
    WHERE YEAR(O.OrderDate) = 1997
    GROUP BY C.CategoryName, DATEPART (month, O.OrderDate), DATENAME (month, O.OrderDate)
    ORDER BY C.CategoryName, DATEPART (month, O.OrderDate) ASC;

SELECT * FROM Employees
SELECT * FROM Suppliers
SELECT * FROM Categories

--Cuales ordenes han sido de menos de 500 dls
--HAVING: 
--TOP: Cuantas filas quiero ver
SELECT * FROM Orders
SELECT OrderID, SUM(UNITPRICE * QUANTITY - Discount * UnitPrice * Quantity) AS TOTAL FROM [Order Details]
    GROUP BY OrderID
    HAVING SUM(UNITPRICE * QUANTITY - Discount * UnitPrice * Quantity) < 500
    ORDER BY TOTAL