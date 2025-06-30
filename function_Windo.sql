USE SalesDB;

SELECT * 
FROM Sales.Customers;

SELECT * 
FROM Sales.Employees;

SELECT * 
FROM Sales.Orders;

/* Find the total sales for each product
   Additionally provide details such as order ID, order date */
SELECT 
    OrderID,
	OrderDate,
	ProductID,
    SUM(Sales) AS TotalSales
FROM Sales.Orders
GROUP BY
	OrderID,
	OrderDate,
	ProductID
