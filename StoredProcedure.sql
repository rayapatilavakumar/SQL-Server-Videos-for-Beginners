/*

Stored Procedures - Part 2

1. How to Encrypt the code of the Stored Proecedure ?






------------------------

Stored Procedures - Part 1

1. What is a Stored Procedure ?
2. Why we need a Stored Procedure ?
3. How to Ceate a Stored Procedure ?
4. How to Execute a Stored Procedure
5. How to Alter a Stored Procedure
6. How to Drop a Stored Procedure
7. Difference between a View and a Stored Procedure
8. Parameterized Stored Procedures - Input and Output Parameters
9. System Stored Procedures

----------------------------------

*/

CREATE OR ALTER PROCEDURE USP_UserDetails
@FirstnameFilter nvarchar(50),
@CountofRecords int OUTPUT

as
begin

select * from dbo.[User]
where firstname = @FirstnameFilter
ORDER BY FirstName

SELECT @CountofRecords=COUNT(*) FROM  dbo.[User]
end

DECLARE @COUNTVALUE INT
execute USP_UserDetails N'john',@COUNTVALUE OUTPUT
PRINT @COUNTVALUE


select COUNT(*) from dbo.[User]

SP_HELPTEXT USP_UserDetails

SP_WHO
SP_WHO2



















USE [Learning]
GO

CREATE PROCEDURE USP_GetUserDetails
AS
BEGIN

SELECT 

U.ID,	
FirstName,	
LastName,	
email,	
GenderID,	
C.[Name] AS Country,
S.[Name] AS [State],
Ci.[Name] AS City

FROM  [dbo].[User] U

INNER JOIN [dbo].[Country] C ON U.CountryID = C.ID

INNER JOIN [dbo].[State] S ON U.StateID = S.ID

INNER JOIN [dbo].[City] Ci ON U.CityId = Ci.ID



END

GO

execute USP_GetUserDetails




