-- How to fix SQL Injection

-- 1. STOP SQL injection using QUOTENAME function

drop table if exists Department

Create table Department (Id bigint, Name NVARCHAR(50))
Go

select * from  dbo.department
GO

Declare @Query nvarchar(50) = 'select * from '

Declare @TableName nvarchar(50) ='Department'

--SET @TableName = 'Go
--DROP TABLE DEPARTMENT'


SET @Query = @Query + @TableName

PRINT @Query

EXEC (@Query )

Go

Declare @Query nvarchar(50) = 'select * from '

Declare @TableName nvarchar(50) ='Department'

SET @TableName = 'Go
DROP TABLE DEPARTMENT'

SET @Query = @Query + QUOTENAME(@TableName)

Print @query

EXEC (@Query )

select * from Department
select * from [Department]

select * from [Go
DROP TABLE DEPARTMENT]


select QUOTENAME('Department')

--2. STOP SQL injection using parameters
Go

CREATE OR ALTER PROCEDURE USP_GetUserswithoutSQLInjection_V1
@FilterValue  NVARCHAR(100)
AS
BEGIN

DECLARE @DynamicQuery NVARCHAR(MAX);
DECLARE @ParmDefinition NVARCHAR(500);

SET @ParmDefinition = N'@FilterParameter NVARCHAR(100)';

SET @DynamicQuery =N'SELECT * FROM [dbo].[user] where FirstName like  @FilterParameter ';

--SET @DynamicQuery ='SELECT * FROM [dbo].[user] WHERE '

EXECUTE sp_executesql @DynamicQuery,
    @ParmDefinition,
    @FilterParameter = @FilterValue;
END
GO

USP_GetUserswithoutSQLInjection_V1 N'%mi%'

Drop table if exists dbo.department
Go
Create table Department (Id bigint, Name NVARCHAR(50))
Go
select * from  dbo.department
GO

USP_GetUserswithoutSQLInjection_V1 N'1=1
DROP TABLE Department --FirstName like ''%mi%'''

DROP DATABASE IF EXISTS [Orders]
Go
CREATE DATABASE [Orders]
Go

USP_GetUserswithoutSQLInjection_V1 N'1=1
USE MASTER 
DROP DATABASE  Orders --FirstName like ''%mi%'''
