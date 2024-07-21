create table Friends ( Id bigint IDENTITY(1,1) primary key, UserId bigint,FriendId bigint)
create table Likes ( Id bigint IDENTITY(1,1) primary key, UserId bigint,Pageid Char(1))

--insert into friends 
--select 1,2
--union all
--select 1,3
--union all
--select 1,4
--union all
--select 2,1
--union all
--select 3,1
--union all
--select 3,4
--union all
--select 4,1
--union all
--select 4,3

select * from friends



insert into Likes 
select 1,'A'
union all
select 1,'B'
union all
select 1,'C'
union all
select 2,'A'
union all
select 3,'B'
union all
select 3,'C'
union all
select 4,'B'

