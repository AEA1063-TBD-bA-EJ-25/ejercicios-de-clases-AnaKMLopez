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