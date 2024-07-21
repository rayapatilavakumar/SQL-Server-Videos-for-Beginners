-- Create the Sales table
--CREATE TABLE Sales (
--    Id INT PRIMARY KEY,
--    SaleDate DATE,
--    Amount INT
--);

---- Insert sample data
--INSERT INTO Sales (Id, SaleDate, Amount) VALUES
--(1, '2023-07-01', 100),
--(2, '2023-07-02', 200),
--(3, '2023-07-03', 150),
--(4, '2023-07-04', 300),
--(5, '2023-07-05', 250);
------------------------------------
-- Running total using pre-SQL Server 2012 method (Correlated Subquery)

SELECT 
    s1.Id,
    s1.SaleDate,
    s1.Amount,
    (SELECT SUM(s2.Amount)
     FROM Sales AS s2
     WHERE s2.SaleDate <= s1.SaleDate) AS RunningTotal
FROM 
    Sales AS s1
ORDER BY 
    s1.SaleDate;

-- Running average using pre-SQL Server 2012 method (Correlated Subquery)
SELECT 
    s1.Id,
    s1.SaleDate,
    s1.Amount,
    (SELECT AVG(s2.Amount)
     FROM Sales AS s2
     WHERE s2.SaleDate <= s1.SaleDate) AS RunningAverage
FROM 
    Sales AS s1
ORDER BY 
    s1.SaleDate;

-- Running total using SQL Server 2012 window functions
SELECT
    Id,
    SaleDate,
    Amount,
    SUM(Amount) OVER (ORDER BY SaleDate ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS RunningTotal
FROM
    Sales
ORDER BY
    SaleDate;

-- Running average using SQL Server 2012 window functions
SELECT
    Id,
    SaleDate,
    Amount,
    AVG(Amount) OVER (ORDER BY SaleDate ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS RunningAverage
FROM
    Sales
ORDER BY
    SaleDate;


	
	SELECT
    Id,
    SaleDate,
    Amount,
    FIRST_VALUE(Amount) OVER (ORDER BY SaleDate) AS FirstAmount,
    LAST_VALUE(Amount) OVER (ORDER BY SaleDate ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS LastAmount
FROM
    Sales
ORDER BY
    SaleDate;


	SELECT
    Id,
    SaleDate,
    Amount,
    LAG(Amount, 0) OVER (ORDER BY SaleDate) AS PreviousAmount,
    LEAD(Amount, 1) OVER (ORDER BY SaleDate) AS NextAmount
FROM
    Sales
ORDER BY
    SaleDate;

	SELECT
    Id,
    SaleDate,
    Amount,
    NTILE(2) OVER (ORDER BY Amount desc) AS Bucket
FROM
    Sales
ORDER BY
    Amount desc;
