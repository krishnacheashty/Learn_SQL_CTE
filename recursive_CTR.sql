

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
FROM Series
--OPTION(MAXRECURSION 10 )
-- DEFAULT MAXRECURSION 100,IF WE INCREASE IT BY OPTION(MAXRECURSION 5000) THEN DEFAULT VALUE INCREASE IN 1000.
