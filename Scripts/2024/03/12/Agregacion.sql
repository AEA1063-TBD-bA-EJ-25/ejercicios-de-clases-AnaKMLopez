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
