/*

Principle of Least Privilege 

What is the principle about

How it is related to Dynamic SQL and SQL Injection 

How to make of use this in SQL Server ...

*/

























Use Learning
GO

Drop database if exists Orders

Create database Orders

Use Learning
GO

Declare @Query nvarchar(500)= 'select * from dbo.[User] where '

Declare @TableName nvarchar(50) =''

SET @TableName = ' 1=1;
DROP DATABASE Orders'

SET @Query = @Query + @TableName

Print @query

EXEC (@Query )



sp_helpsrvrolemember 'sysadmin'
sp_srvrolepermission 'sysadmin'


-- Create Login

USE MASTER;
GO

CREATE LOGIN LPLogin1 WITH PASSWORD = '^YHN7ujm';

USE Learning;
GO

-- Create user at DB level
CREATE USER LPUser1 FOR LOGIN LPLogin1;

USE Learning;
GO
-- Create a custom role

CREATE ROLE LPRole1;

-- Grant permissions to the custom role

USE Learning;
GO

GRANT CREATE TABLE TO LPRole1;
GRANT ALTER TO LPRole1;
GRANT SELECT TO LPRole1;
GRANT DELETE TO LPRole1;
GRANT EXECUTE TO LPRole1;
GRANT VIEW DEFINITION TO LPRole1;

-- Assign  role to User

USE Learning;
GO

ALTER ROLE LPRole1 ADD MEMBER LPUser1