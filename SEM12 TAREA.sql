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
FROM Orders;SELECT FirstName, LastName, DATEDIFF(YEAR, BirthDate,GETDATE()) AS EDAD FROM Employees;SELECT OrderID, CustomerID, EmployeeID, OrderDate FROM OrdersWHERE OrderDate >= DATEADD(YEAR,-27,GETDATE()) ORDER BY OrderID ASC;SELECT FirstName, LastName, DATEDIFF(YEAR, HireDate,GETDATE()) AS Antiguedad FROM EmployeesWHERE DATEDIFF(YEAR, HireDate, GETDATE())>30;SELECT C.CompanyName, DATEDIFF(DAY, MIN(O.OrderDate), MAX(O.OrderDate)) AS DiasEntrePedidos FROM Customers CINNER JOIN Orders O ON O.CustomerID=C.CustomerID GROUP BY C.CustomerID, C.CompanyName;SELECT C.CustomerID, C.CompanyName, COUNT(O.OrderID) AS NumeroPedidos FROM Customers CINNER JOIN Orders O ON O.CustomerID=C.CustomerIDWHERE YEAR(O.OrderDate)=1997GROUP BY C.CustomerID, C.CompanyNameHAVING COUNT(O.OrderID)>=10;