/*
SQL Server - View - Introduction





























What is a View ?
































Why we need a View ?

1) Code Reusability, 

--> fixing issues
--> adding new columns

2) Ease of use for other teams in the organization

--> Like a Reports creation team
--> Non-technical users, who do not have in depth SQL skills

3) Security

--> Row level
--> Column level










How to create a View ?

*/

SELECT 
* 
FROM [dbo].[User]

SELECT 
* 
FROM [dbo].[Country]

SELECT 
* 
FROM [dbo].[State]

SELECT 
* 
FROM [dbo].[City]


-- Plain Query using Inner join

SELECT 
U.ID,	
FirstName,	
LastName,	
email,	
[Password],	
GenderID,	
Phone,	
DOB,	
SSN,	
AADHARNumber, 
C.[Name] AS Country,
S.[Name] AS [State],
Ci.[Name] AS City

FROM  [dbo].[User] U

INNER JOIN [dbo].[Country] C ON U.CountryID = C.ID

INNER JOIN [dbo].[State] S ON U.StateID = S.ID

INNER JOIN [dbo].[City] Ci ON U.CityId = Ci.ID

Go

-- Create or Alter View

CREATE OR ALTER VIEW VW_AllUserDetails
AS

SELECT 
U.ID,	
FirstName,	
LastName,	
email,	
[Password],	
GenderID,	
Phone,	
DOB,	
SSN,	
AADHARNumber, 
C.[Name] AS Country,
S.[Name] AS [State],
Ci.[Name] AS City

FROM  [dbo].[User] U

INNER JOIN [dbo].[Country] C ON U.CountryID = C.ID

INNER JOIN [dbo].[State] S ON U.StateID = S.ID

INNER JOIN [dbo].[City] Ci ON U.CityId = Ci.ID



GO

SELECT * FROM VW_AllUserDetails

-- Drop View
DROP VIEW VW_AllUserDetails


Go

-- Security

-- Row Level

CREATE OR ALTER VIEW VW_IndiaUserDetails
AS
SELECT 
U.ID,	
FirstName,	
LastName,	
email,	
[Password],	
GenderID,	
Phone,	
DOB,	
SSN,	
AADHARNumber, 
C.[Name] AS Country,
S.[Name] AS [State],
Ci.[Name] AS City

FROM  [dbo].[User] U

INNER JOIN [dbo].[Country] C ON U.CountryID = C.ID

INNER JOIN [dbo].[State] S ON U.StateID = S.ID

INNER JOIN [dbo].[City] Ci ON U.CityId = Ci.ID

Where C.[Name]='India'

GO

SELECT * FROM VW_IndiaUserDetails

GO

-- Column Level Security

CREATE OR ALTER VIEW VW_UserDetails
AS
SELECT 
U.ID,	
FirstName,	
LastName,	
email,	
GenderID,	
Phone,	
DOB,	
C.[Name] AS Country,
S.[Name] AS [State],
Ci.[Name] AS City

FROM  [dbo].[User] U

INNER JOIN [dbo].[Country] C ON U.CountryID = C.ID

INNER JOIN [dbo].[State] S ON U.StateID = S.ID

INNER JOIN [dbo].[City] Ci ON U.CityId = Ci.ID

GO


select * from VW_AllUserDetails
select * from VW_IndiaUserDetails
SELECT * FROM VW_UserDetails

--Synonym



