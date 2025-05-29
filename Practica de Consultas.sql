USE Northwind;
-- TABLAS
SELECT * FROM Orders
SELECT * FROM Shippers
SELECT * FROM Customers
SELECT * FROM Employees
SELECT * FROM EmployeeTerritories
SELECT * FROM Territories
SELECT * FROM Region
SELECT * FROM [Order Details]
SELECT * FROM Products
SELECT * FROM Categories
SELECT * FROM CustomerCustomerDemo
SELECT * FROM CustomerDemographics

--****************** CONSULTAS *****************
--4) Cuáles bebidas maneja la empresa
SELECT P.ProductID, P.ProductName FROM Products P
    JOIN Categories C ON P.CategoryID = C.CategoryID
    WHERE P.CategoryID = 1

--5) Generar la lista de los cumpleaños de los empleados
SELECT EmployeeID, LastName, FirstName, BirthDate, DAY(BirthDate) AS dia, MONTH(BirthDate) AS mes FROM Employees
    ORDER BY mes, dia;

--6) La lista de cumpleaños y cuántos cumplirán
SELECT EmployeeID, LastName, FirstName, DAY(BirthDate) AS dia, MONTH(BirthDate) AS mes, DATEDIFF(year, BirthDate, getdate()) FROM Employees
    ORDER BY mes, dia;

--7) Antigüedad de los empleados en la empresa
SELECT EmployeeID, LastName, FirstName, DATEDIFF(YEAR, HireDate, GETDATE()) AS Antigüedad FROM Employees

--8) Edad que tenían los empleados al ingresar a la empresa
SELECT EmployeeID, LastName, FirstName,  DATEDIFF(year, BirthDate, HireDate) AS edad_al_ingresar FROM Employees

--9) Productos a surtir en el siguiente pedido
SELECT od.OrderID, od.ProductID,  od.Quantity FROM Orders O
    JOIN [Order Details] OD ON O.OrderID = OD.OrderID;    

--10) Órdenes en las cuales vendimos un producto que hoy ya no se maneja
SELECT od.OrderID, od.ProductID, od.Quantity, OD.Discount FROM Orders O
    JOIN [Order Details] OD ON O.OrderID = OD.OrderID
    JOIN Products P ON OD.ProductID = P.ProductID
    WHERE P.Discontinued = 1;

SELECT * from [Products]

--11) Clientes que han comprado productos lacteos -- CATEGORyID 4
SELECT O.OrderID, O.CustomerID, CM.CompanyName, P.ProductName FROM Orders O
    JOIN [Order Details] OD ON O.OrderID = OD.OrderID
    JOIN Customers CM ON O.CustomerID = CM.CustomerID
    JOIN Products P ON OD.ProductID = P.ProductID
    JOIN Categories C ON P.CategoryID = C.CategoryID
        WHERE C.CategoryID = 4

--12) Cuanto fue el importe de la venta 10268
SELECT * FROM [Order Subtotals]
    WHERE OrderID = 10248

SELECT OrderID, SUM(Quantity * UnitPrice) AS ImporteTotal FROM [Order Details]
    WHERE OrderID = 10248
    GROUP BY OrderID;

--13 Cuanto fue el importe de las ventas 10268, 10270 y 10275
SELECT OrderID, SUM(Quantity * UnitPrice) AS ImporteTotal FROM [Order Details]
    WHERE OrderID IN (10248, 10270 , 10275)
    GROUP BY OrderID;

--14) Cuanto fue el total por todas las ventas de la 10268 a la 10275
SELECT OrderID, SUM(Quantity * UnitPrice) AS ImporteTotal FROM [Order Details]
    WHERE OrderID BETWEEN 10268 AND 10275
    GROUP BY OrderID;

--15) Cuanto fue el importe de ventas del día 6 de junio del 1997
SELECT O.OrderID, SUM(OD.Quantity * OD.UnitPrice) AS ImporteVentas FROM Orders O
    JOIN [Order Details] od ON O.OrderID = OD.OrderID
    WHERE O.OrderDate = '1997-06-06'
    GROUP BY O.OrderID;

--16 ) Cuanto fue  el importe de ventas de la segunda semana de junio del 1997
SELECT O.OrderID, SUM(OD.Quantity * OD.UnitPrice) AS ImporteVentas FROM Orders O
    JOIN [Order Details] od ON O.OrderID = OD.OrderID
    WHERE DATEPART(YEAR, o.OrderDate) = 1997 --Año
        AND DATEPART(MONTH, o.OrderDate) = 6 --Mes
        AND DATEPART(WEEK, o.OrderDate) = DATEPART(WEEK, '1997-06-08') --Semana
    GROUP BY O.OrderID;

--17) Cuanto fue  el importe de ventas del tercer trimestre  del 1997
SELECT O.OrderID, SUM(OD.Quantity * OD.UnitPrice) AS ImporteVentas FROM Orders O
    JOIN [Order Details] od ON O.OrderID = OD.OrderID
    WHERE YEAR(o.OrderDate) = 1997
        AND DATEPART(QUARTER, o.OrderDate) = 3 --Quarter es uso exclusivo para un Trimestre
        GROUP BY O.OrderID;

--18) Cuales ordenes se colocaron en dia feriado 
SELECT OrderID, OrderDate FROM Orders
    WHERE OrderDate IN ('1997-01-01', '1997-12-25', '1997-07-04'); 

--19) De la semana del 8 al 14 de junio 1997, cuales órdenes superan los $500
SELECT o.OrderID, SUM(od.Quantity * od.UnitPrice) AS ImporteTotal FROM Orders o
    JOIN [Order Details] od ON o.OrderID = od.OrderID
    WHERE o.OrderDate BETWEEN '1997-06-08' AND '1997-06-14'
    GROUP BY o.OrderID
    HAVING SUM(od.Quantity * od.UnitPrice) > 500;


--20) Cuáles clientes compraron algo la segunda semana de junio del 1997 y también la tercera
SELECT c.CustomerID, c.CompanyName FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    WHERE o.OrderDate BETWEEN '1997-06-08' AND '1997-06-14'
    AND c.CustomerID IN (
        SELECT CustomerID 
        FROM Orders
        WHERE OrderDate BETWEEN '1997-06-15' AND '1997-06-21'
        );
