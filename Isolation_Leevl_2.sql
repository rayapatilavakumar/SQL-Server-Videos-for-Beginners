-- Read Uncommitted Isolation

USE Learning
GO

SET TRANSACTION ISOLATION LEVEL Read Uncommitted

SELECT * FROM [dbo].[Users]

BEGIN TRAN

UPDATE [dbo].[Users] SET Phone=888932 WHERE id=1 --  Possible

DELETE FROM [dbo].[Users] WHERE id=2 --  Possible

INSERT INTO [dbo].[Users] VALUES 
('Bruce', 'Swayne','bruce@example.com',
newid(),1,767667,'1987-09-22',null,null,1,1,1) -- Possible

--ROLLBACK

-----------------------------------------------------
-- Read Committed Isolation

USE Learning
GO

SET TRANSACTION ISOLATION LEVEL Read Committed

SELECT * FROM [dbo].[Users]

BEGIN TRAN

UPDATE [dbo].[Users] SET Phone=888932 WHERE id=1 --  Possible

DELETE FROM [dbo].[Users] WHERE id=1 --  Possible

INSERT INTO [dbo].[Users] VALUES 
('Bruce', 'Swayne','bruce@example.com',
newid(),1,767667,'1987-09-22',null,null,1,1,1) -- Possible

--ROLLBACK

-- Commit

-----------------------------------------------------

-- Repeatable Read Isolation

USE Learning
GO

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ

SELECT * FROM [dbo].[Users]

BEGIN TRAN

UPDATE [dbo].[Users] SET Phone=888932 WHERE id=3 -- Not Possible

DELETE FROM [dbo].[Users] WHERE id=3 -- Not Possible

INSERT INTO [dbo].[Users] VALUES 
('Gim', 'Gordon','gim@example.com',
newid(),1,767667,'1987-09-22',null,null,1,1,1) -- Possible

--ROLLBACK

commit

-----------------------------------------------------

-- Serializable Isolation

USE Learning
GO

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE

SELECT * FROM users

BEGIN TRAN

UPDATE users SET Phone=8889399 WHERE  countryid =1 -- Not Possible

DELETE FROM users WHERE id=2 -- Not Possible

INSERT INTO users VALUES 
('Bruce1', 'Swayne1','bruce1@example.com',
newid(),1,767667,'1987-09-22',null,null,1,1,1) -- Not Possible

ROLLBACK

----------------------------------------------------

-- Snapshot Isolation

USE Learning
GO

SET TRANSACTION ISOLATION LEVEL SNAPSHOT

SELECT * FROM users

BEGIN TRAN

UPDATE users SET Phone=888932 WHERE id=2 -- Possible

DELETE FROM users WHERE id=3 -- Possible

INSERT INTO users VALUES 
('Bruce10', 'Swayne10','bruce10@example.com',
newid(),1,767667,'1987-09-22',null,null,1,1,1) -- Possible

commit
ROLLBACK
-----------------------------------------------------