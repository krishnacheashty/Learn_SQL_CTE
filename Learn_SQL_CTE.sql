
--					task -01

-- step1: find the total sales per customer.(Standalone CTE)

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
C.LastName,
cts.TotalSales
FROM Sales.Customers C
LEFT JOIN CTE_TOTAL_SALES cts
ON cts.CustomerID=C.CustomerID




-- step1: find the total sales per customer.(Standalone CTE)

WITH CTE_TOTAL_SALES AS
(
SELECT 
	CustomerID,
	SUM(Sales) AS TotalSales
FROM Sales.Orders 
GROUP BY CustomerID
)
--2# find the last order date per customer.(Standalone CTE)
,CTE_Last_order AS
(
SELECT
	CustomerID,
	MAX(OrderDate) LAST_ORDER_DATE
FROM Sales.Orders
GROUP BY CustomerID
)

--MAIN QUERY

SELECT
C.CustomerID,
C.FirstName,
C.LastName,
cts.TotalSales,
clo.LAST_ORDER_DATE
FROM Sales.Customers C
LEFT JOIN CTE_TOTAL_SALES cts
ON cts.CustomerID=C.CustomerID
LEFT JOIN CTE_Last_order clo
ON clo.CustomerID=C.CustomerID


