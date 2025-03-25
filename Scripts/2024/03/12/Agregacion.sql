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

--Cuanto vendimos de Chai


--Cuanto vendimos en 1997


--TABLAS
SELECT * FROM Categories
SELECT * FROM Products
SELECT * FROM Orders

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

