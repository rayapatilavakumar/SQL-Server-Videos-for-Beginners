/*

ACID Properties of a relational DBMS 

Atomicity

Consistency

Isolation

Durabilty

Demonstration using SQL Server

*/

















CREATE TABLE BankAccounts (
    AccountId INT PRIMARY KEY Identity(1,1),
    AccountHolderName VARCHAR(100),
    Balance DECIMAL(10, 2),
    CHECK (balance >= 10000)
);



select * from BankAccounts

insert into BankAccounts values('John',20000)

insert into BankAccounts values('Bruce',32000)

insert into BankAccounts values('Harry',68000)



select * from BankAccounts








-- Atomocity

-- Either all are none

-- we can acheive this with the help of transactions

BEGIN TRY
BEGIN TRAN

update BankAccounts set Balance = Balance-500 where AccountId=1

--select 1/0 -- Intentionally raising an issue with divide by zero

update BankAccounts set Balance = Balance+500 where AccountId=2

PRINT 'Transaction Committed Successfully!'
COMMIT

END TRY
BEGIN CATCH

PRINT 'Transaction Rolled back'
ROLLBACK
END CATCH





-- Consistency

-- Before and after the transaction DB should be in a consistent state

-- we can acheive this with the help of check constraints, transactions, triggers etc

update BankAccounts set Balance=-100 where AccountId=1

insert into BankAccounts values('Jim',200)












-- Isolation

-- Multipe simlutaneous transactions should not interfere with other transactions

-- we can acheive this with the help of different Isolation levels

-- Read Committed, Read Uncomitted
-- Repeatable Read
-- Snapshot, Serializable

Begin Tran


select Balance as Beforeupdate from  BankAccounts where AccountId=1

update BankAccounts set Balance=Balance+10000 where AccountId=1

select Balance as Afterupdate from  BankAccounts where AccountId=1

--rollback

commit









--  Durability

-- All the  committed transactions should be  persisted even incase of system failures

-- Transaction Log files