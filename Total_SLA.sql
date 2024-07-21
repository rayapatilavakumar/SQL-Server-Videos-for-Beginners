create table tickets
(
ticket_id varchar(10),
create_date date,
resolved_date date
);
delete from tickets;
insert into tickets values
(1,'2022-08-01','2022-08-03')
,(2,'2022-08-01','2022-08-12')
,(3,'2022-08-01','2022-08-16');
create table holidays
(
holiday_date date
,reason varchar(100)
);
delete from holidays;
insert into holidays values
('2022-08-11','Rakhi'),('2022-08-15','Independence day');

select * from tickets

select * from holidays

select DATEDIFF(day,create_date, resolved_date) as TotalDays from tickets

select  ticket_id, DATEDIFF(day,create_date, resolved_date)-
 ( datepart(WEEK,resolved_date)-datepart(WEEK,create_date)) *2  
 -count(h.holiday_date) as Businessdays
  from tickets T
  left join holidays H on H.holiday_date between create_date and resolved_date

  group by ticket_id, create_date, resolved_date