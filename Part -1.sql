-- Types of issues

-- 1. Bad code / logic
-- 2. Blocking and locking
-- 3. SQL Server software configuration
-- 4. Server hardware configuration where SQL Server instance is running
-- 5. Connectivity (Network, bandwidth..) issues


























-- Ways to identify issues
-- 1. I/O operations
-- 2. Executino Plan
-- 3. SP_who, SP_who2 
-- 4. SQL Server Reports, DMV
-- 5. open source SPs to Identify issues  SP_Whoisactive etc

select * from dbo.Products

set statistics io on
set statistics io off

exec SP_who
exec SP_who2










-- using Schema

select * from  dbo.Users

-- using SET NO Count ON

set nocount on
set nocount off

-- Selecting only required columns

select ID, Name, email from  dbo.Users

select * from  dbo.Users

