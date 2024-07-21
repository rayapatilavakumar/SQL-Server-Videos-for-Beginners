-- Read Uncommitted Isolation

USE Learning
GO

SET TRANSACTION ISOLATION LEVEL Read Uncommitted

BEGIN TRANSACTION

SELECT * FROM [dbo].[Users]

-- ROLLBACK
-- COMMIT

-- Dirty Reads are "Possible"
-- Phantom Reads are "Possible"





-----------------------------------------------------
-- Read Committed Isolation

USE Learning
GO

SET TRANSACTION ISOLATION LEVEL Read Committed

BEGIN TRANSACTION

SELECT * FROM [dbo].[Users] --with(nolock)

-- ROLLBACK
-- COMMIT

-- Dirty Reads are "Not Possible"
-- Phantom Reads are "Possible"





-----------------------------------------------------

-- Repeatable Read Isolation

USE Learning
GO

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ

BEGIN TRANSACTION

SELECT * FROM [dbo].[Users]

-- ROLLBACK
-- COMMIT

-- Dirty Reads are "Not possible"
-- Phantom Reads are "Possible"
-- Since Update and Deletes are not possible, there 
-- is a gurantee of repeating previous records 
-- without change, but new records can come 


----------------------------------------------------

-- Serializable Isolation

USE Learning
GO

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE

BEGIN TRANSACTION

SELECT * FROM [dbo].[Users] 
---some processing

SELECT * FROM [dbo].[Users] 

--

SELECT * FROM [dbo].[Users] 

-- ROLLBACK
-- COMMIT

-- Phantom Reads are "Not Possible"
-- Repeatable Reads are possible
-- No parallel inserts / updates / Deletes possible
-- on the data in a transaction



----------------------------------------------------

-- Snapshot Isolation

USE Learning
GO

SET TRANSACTION ISOLATION LEVEL SNAPSHOT

BEGIN TRANSACTION

SELECT * FROM [dbo].[Users]

-- ROLLBACK
-- COMMIT

-- Phantom Reads are "Not Possible"
-- Repeatable Reads are possible
-- No parallel inserts / updates / Deletes possible
-- on the data in a transaction


----------------------------------------------------