-- Dynamic SQL - SQL Injection
























-- What is  SQL Injection






















USP_GetUserswithDynamicFilters ' FirstName like ''%mi%'''
Go
USP_GetUserswithDynamicFilters ' LastName like ''%mi%'''
Go
USP_GetUserswithDynamicFilters ' Email like ''%mi%'''
Go


CREATE OR ALTER PROCEDURE USP_GetUserswithDynamicFilters
@Filter  NVARCHAR(100)
AS
BEGIN

DECLARE @DynamicQuery NVARCHAR(MAX) =''

SET @DynamicQuery ='SELECT * FROM [dbo].[user] WHERE '

SET @DynamicQuery  = @DynamicQuery + @Filter


EXEC (@DynamicQuery)

END

Go


-- How to inject SQL

drop table if exists Department

Create table Department (Id bigint, Name NVARCHAR(50))
Go

select * from  dbo.department
GO



USP_GetUserswithDynamicFilters '1=1
DROP TABLE Department --FirstName like ''%mi%'''
Go

drop database if exists [Orders]
go
CREATE DATABASE [Orders]
Go

USP_GetUserswithDynamicFilters '1=1
USE MASTER 
DROP DATABASE  Orders --FirstName like ''%mi%'''


