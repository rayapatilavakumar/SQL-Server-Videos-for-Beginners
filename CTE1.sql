/*

Common table Expressions - CTE

What is  CTE ?

Types of CTE

1. Non-Recursive CTE
2. Recursive CTE

How to create and use CTE

*/













;with Cities_CTE
as
(
select * from City
)
--select 1
select * from Cities_CTE

;WITH UsersCTE
AS
(
SELECT  Row_number() Over(Partition BY CountryID ORDER BY ID DESC) Rownum,
CountryID,ID, FirstName from [dbo].[User]
)

SELECT * FROM UsersCTE




;WITH Country_India_UsersCTE
AS
(
SELECT  C.Name, Count(*) AS TotalUsers
FROM 
[dbo].[User]  U
inner  join Country C  on U.CountryID = C.ID
and C.Name='India'
GROUP BY C.Name
),

Country_UnitedStates_UsersCTE
AS
(
SELECT  C.Name, Count(*) AS TotalUsers
FROM 
[dbo].[User]  U
inner  join Country C  on U.CountryID = C.ID
and C.Name='United States'
GROUP BY C.Name
)

select * from Country_India_UsersCTE
union
select * from Country_UnitedStates_UsersCTE




