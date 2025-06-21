USE SalesDB;

SELECT * 
FROM Sales.Customers;

SELECT * 
FROM Sales.Employees;

SELECT * 
FROM Sales.Orders;

-- Add a new column named CreationTime to the sales.order table
ALTER TABLE sales.orders
ADD CreationTime DATETIME2; -- Adjust the data type if needed

SELECT * 
FROM Sales.Products;


SELECT 
	FirstName,
	LastName
FROM Sales.Customers

UNION

SELECT 
	FirstName,
	LastName
FROM Sales.Employees;

SELECT
    OrderID,
    CreationTime,
	GETDATE() Today,
	DATEPART(year, CreationTime) Year_dp,
	YEAR(CreationTime) Year,
	MONTH(CreationTime) Month,
	DAY(CreationTime) Day
FROM Sales.Orders
