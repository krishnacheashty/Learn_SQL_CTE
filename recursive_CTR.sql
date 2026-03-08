

--								Task 01

--Generate a sequence of Number from 1 to 20

--Anchor Query
WITH Series AS (
	--Anchor Query
	SELECT 
	1 AS MyNumbe

	UNION ALL 
	SELECT
	MyNumbe+1
	FROM Series
	WHERE MyNumbe <20

)
--main query

SELECT *
FROM Series;
--OPTION(MAXRECURSION 10 )
-- DEFAULT MAXRECURSION 100,IF WE INCREASE IT BY OPTION(MAXRECURSION 5000) THEN DEFAULT VALUE INCREASE IN 1000.


								-- Task 02
	-- show the employee hierarchy by displaying each employee's 
	--level within the organization.
WITH CTE_Level_Organization AS
	(
		-- Anchor query
		SELECT 
			EmployeeID,
			FirstName,
			ManagerID,
			1 AS Level
		FROM Sales.Employees
		WHERE ManagerID IS NULL
		UNION ALL 
		--RECURSIVE QUERY
		SELECT
			E.EmployeeID,
			E.FirstName,
			E.ManagerID,
			Level + 1
		FROM Sales.Employees AS E
		INNER JOIN CTE_Level_Organization clo
		ON E.ManagerID=clo.EmployeeID

	)

	--MAIN QUERY

SELECT 
*
FROM CTE_Level_Organization


