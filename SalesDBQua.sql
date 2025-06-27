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


--NULL Operation
SELECT 
    CustomerID, 
    FirstName, 
    LastName, 
    FirstName + ' ' + COALESCE(LastName, '') AS FullName, 
    Score,
	COALESCE(Score, 0) + 10 AS ScoreWithBonus
FROM 
    Sales.Customers;


SELECT 
	OrderID,
	Sales,
	Quantity,
	Sales/ NULLIF (Quantity,0) AS price
FROM 
	Sales.Orders;

SELECT 
    OrderID,
    Sales,
    CASE
        WHEN Sales > 50 THEN 'High'
        WHEN Sales <= 20 THEN 'Medium'
		ELSE 'LOW'
    END Category
FROM 
    Sales.Orders;

SELECT 
    Category,
    SUM(Sales) AS TotalSales
FROM (
    SELECT 
        OrderID,
        Sales,
        CASE
            WHEN Sales > 50 THEN 'High'
            WHEN Sales > 20 THEN 'Medium'
            ELSE 'Low'
        END AS Category
    FROM 
        Sales.Orders
) t
GROUP BY 
    Category
ORDER BY
	TotalSales DESC;


-- Retrieve employee details with gender displayed as full text
SELECT 
    EmployeeID,
    CONCAT(FirstName,' ',LastName) AS Name,
    --Gender,
	CASE 
		WHEN Gender = 'F' THEN 'Female'
		WHEN Gender = 'M' THEN 'Male'
		ELSE 'Not Avaiable'
	END GenderFF
FROM 
    Sales.Employees;

-- Retrieve customer details with abbreviated country code
SELECT 
    CustomerID,
    FirstName,
    LastName,
    Country,
    CASE
        WHEN Country = 'Germany' THEN 'DE'
        WHEN Country = 'USA' THEN 'US'
        ELSE 'n/a'
    END AS CountryCode
FROM 
    Sales.Customers;

