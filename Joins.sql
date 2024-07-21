Create table Employee (ID Bigint identity(1,1), Name NVARCHAR(50), DepartMentId bigint)
GO
Create table Department (DepartMentId bigint identity(1,1), Name NVARCHAR(50))

insert into Department values ('Dept1')
insert into Department values ('Dept2')
insert into Department values ('Dept3')

insert into Employee values ('Emp1',NULL)
insert into Employee values ('Emp2',1)
insert into Employee values ('Emp3',2)
insert into Employee values ('Emp4',1)
insert into Employee values ('Emp5',100)

select E.Name, D.Name from  Employee E 
inner  join Department D on E.DepartMentId = D.DepartMentId


select E.Name, D.Name from  Employee E 
left  join Department D on E.DepartMentId = D.DepartMentId

select E.Name, D.Name from  Employee E 
right  join Department D on E.DepartMentId = D.DepartMentId

