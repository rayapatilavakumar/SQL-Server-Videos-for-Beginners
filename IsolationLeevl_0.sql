/*  Isolation: one of the ACID Properties

1) What is Isolation
2) What is Repeatable Read
3) What is Dirty Read
4) What is Phantom Read
5) Different Isolation Levels in SQL Server
6) Demo

Isolation - Ability of DBMS to manage multiple concurrent transaction without affecting each other and prevent 
unexpected behaviours

Repeatable Read - If a transaction select few rows, it will have to see the same set of rows in subsequent selects during the same 
transaction, even if other transactions modify/ insert the data

Dirty Read - New records inserted into the table from other transactions, these records may be committed or rolled back due to 
errors

Phantom Read - New records inserted into the table from other completed transactions 

*/
