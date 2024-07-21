----  Implicit Conversion
USE Learning
GO

SET STATISTICS IO ON
--SET STATISTICS IO OFF

DROP TABLE IF EXISTS Products

-- Create a table
CREATE TABLE Products (
	ID BIGINT Identity(1,1) Primary key,
    ProductCode VARCHAR(20),
    ProductName NVARCHAR(100)
);
Go
-- Create an index on the ProductCode column
CREATE INDEX IX_ProductCode ON Products (ProductCode);
GO
--DROP INDEX IX_ProductCode ON Products
--TRUNCATE TABLE PRODUCTS
-- Insert some sample data
INSERT INTO Products (ProductCode, ProductName)
VALUES 
    ('P0001', 'Product 1'),
    ('P0002', 'Product 2'),
    ('P0003', 'Product 3');
	
SELECT ProductCode FROM Products WHERE ProductCode = 'P0001';
DBCC DROPCLEANBUFFERS
-- Implicit conversion might occur here
SELECT ProductCode FROM Products WHERE ProductCode = N'P0001';

TRUNCATE TABLE PRODUCTS
-- Use a loop to generate and insert 5000 records
DECLARE @Counter INT = 1;

WHILE @Counter <= 5000
BEGIN
    DECLARE @ProductCode VARCHAR(20) = 'P' + RIGHT('000' + CAST(@Counter AS VARCHAR(4)), 4);
    DECLARE @ProductName NVARCHAR(50) = 'Product ' + CAST(@Counter AS NVARCHAR(4));

    INSERT INTO Products (ProductCode, ProductName)
    VALUES (@ProductCode, @ProductName);

    SET @Counter = @Counter + 1;
END;

select count(*) from Products

SELECT ProductCode FROM Products WHERE ProductCode = 'P0001';

DBCC DROPCLEANBUFFERS

-- Implicit conversion might occur here

SELECT ProductCode FROM Products WHERE ProductCode = N'P0001';