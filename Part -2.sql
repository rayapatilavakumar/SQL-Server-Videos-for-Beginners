--  SQL Server Query Performence Improvements - Part 2

SELECT ProductCode FROM dbo.Products WHERE ProductCode = 'P0001';


































-- Implicit Type Conversion

Declare @IntVar int = 90

Declare @VarcharVar Varchar(20) = 9

select @IntVar+@VarcharVar+1 as Total

---


Declare @variable1  datetime = GETDATE()

Declare @variable2 bigint = 100

select @variable1 as Variable1

select @variable2 as Variable2

-- Will throw an error 

--set @variable2 = @variable1

--








-- Explicit Type Conversion

set @variable2 = cast( @variable1 as BIGINT)

select @variable2 as  Variable2withCasting

set @variable2 = Convert( BIGINT,@variable1 )

select @variable2 as  Variable2withConversion























----  How Implicit Conversion affects query performence

USE Learning
GO
SET STATISTICS IO ON
--SET STATISTICS IO OFF

DROP TABLE IF EXISTS dbo.Products

-- Create a table
CREATE TABLE dbo.Products (
	ID BIGINT Identity(1,1) Primary key,
    ProductCode VARCHAR(20),
    ProductName NVARCHAR(100)
);
Go
-- Create an index on the ProductCode column
CREATE INDEX IX_ProductCode ON dbo.Products (ProductCode);
GO

-- Insert some sample data
INSERT INTO dbo.Products (ProductCode, ProductName)
VALUES 
    ('P0001', 'Product 1'),
    ('P0002', 'Product 2'),
    ('P0003', 'Product 3');
	
DECLARE @VARCHARvarible VARCHAR(20)='P0001'

SELECT ProductCode FROM dbo.Products WHERE ProductCode = @VARCHARvarible;

DBCC DROPCLEANBUFFERS

-- Implicit conversion might occur here

DECLARE @NVARCHARvarible NVARCHAR(20)= N'P0001'
SELECT ProductCode FROM dbo.Products WHERE ProductCode = @NVARCHARvarible;

GO












--TRUNCATE TABLE dbo.PRODUCTS
-- Use a loop to generate and insert 5000 records
DECLARE @Counter INT = 1;

WHILE @Counter <= 5000
BEGIN
    DECLARE @ProductCode VARCHAR(20) = 'P' + RIGHT('000' + CAST(@Counter AS VARCHAR(10)), 10);
    DECLARE @ProductName NVARCHAR(50) = 'Product ' + CAST(@Counter AS NVARCHAR(10));

    INSERT INTO dbo.Products (ProductCode, ProductName)
    VALUES (@ProductCode, @ProductName);

    SET @Counter = @Counter + 1;
END;

select count(*) from Products


DECLARE @VARCHARvarible VARCHAR(20)='P0001'

SELECT ProductCode FROM dbo.Products WHERE ProductCode = @VARCHARvarible;

DBCC DROPCLEANBUFFERS

-- Implicit conversion might occur here

DECLARE @NVARCHARvarible NVARCHAR(20)= N'P0001'
SELECT ProductCode FROM dbo.Products WHERE ProductCode = @NVARCHARvarible;









