SELECT ProductName, UnitPrice FROM Products
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Products);

SELECT EMPLOYEEID,FirstName, LastName, Title FROM Employees
WHERE Title = (SELECT Title FROM Employees WHERE EmployeeID = 1);

SELECT ProductId, ProductName FROM Products
WHERE ProductID NOT IN (SELECT ProductID FROM [Order Details]);

SELECT CustomerID, CompanyName FROM Customers
WHERE CustomerID NOT IN (SELECT CustomerID FROM Orders);

SELECT DISTINCT C.CustomerID,P.ProductName, OD.UnitPrice FROM Customers C
INNER JOIN Orders O ON O.CustomerID=C.CustomerID
INNER JOIN [Order Details] OD ON OD.OrderID=O.OrderID
INNER JOIN Products P ON P.ProductID=OD.ProductID
WHERE P.UnitPrice=(SELECT DISTINCT MAX(UnitPrice) FROM Products);

SELECT OrderID, DATEDIFF(day, OrderDate, ShippedDate) AS DiasDeEntrega
FROM Orders;

SELECT ShippedDate, DATEADD(day, 5, ShippedDate) AS NewDate FROM ORDERS;

SELECT ProductID, UPPER(LTRIM(RTRIM(ProductName))) AS ProductNameUpper
FROM Products;

SELECT OrderID, CONVERT(VARCHAR(10), OrderDate, 103) AS FechaPedidoFormatoBritanico
FROM Orders;