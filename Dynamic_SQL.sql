-- Dynamic SQL Statements

select * from dbo.[user]






















-- Filter the data based on First Name 
Declare @DynamicQuery NVARCHAR(MAX) =''
Declare @Filter NVARCHAR(100) =''

SET @DynamicQuery ='SELECT * FROM [dbo].[user] WHERE '

SET @Filter = 'FirstName like ''%mi%'''

SET @DynamicQuery  = @DynamicQuery + @Filter

Print @DynamicQuery

EXEC (@DynamicQuery)

GO




-- Filter the data based on Last Name

Declare @DynamicQuery NVARCHAR(MAX) =''
Declare @Filter NVARCHAR(100) =''

SET @DynamicQuery ='SELECT * FROM [dbo].[user] WHERE '

SET @Filter = 'LastName like ''%mi%'''

SET @DynamicQuery  = @DynamicQuery + @Filter

Print @DynamicQuery

EXEC (@DynamicQuery)
GO


SELECT * FROM [dbo].[user] WHERE LastName like '%mi%'

USP_GetUserswithDynamicFilters 'email like ''%mi%'''
go
USP_GetUserswithDynamicFilters 'FirstName like ''%mi%'''
go
USP_GetUserswithDynamicFilters 'LastName like ''%mi%'''
go

Create OR Alter procedure USP_GetUserswithDynamicFilters
@Filter  NVARCHAR(100)
as
begin

Declare @DynamicQuery NVARCHAR(MAX) =''

SET @DynamicQuery ='SELECT * FROM [dbo].[user] WHERE '

SET @DynamicQuery  = @DynamicQuery + @Filter

--Print @DynamicQuery

EXEC (@DynamicQuery)
end