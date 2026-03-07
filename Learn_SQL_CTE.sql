
--					task -01

-- step1: find the total sales per customer.

WITH CTE_TOTAL_SALES AS
(
SELECT 
	CustomerID,
	SUM(Sales) AS TotalSales
FROM Sales.Orders
GROUP BY CustomerID
)

--MAIN QUERY
SELECT
C.CustomerID,
C.FirstName, 
FROM Sales.Customers C
LEFT JOIN CTE_TOTAL_SALES