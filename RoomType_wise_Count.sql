create table airbnb_searches 
(
user_id int,
date_searched date,
filter_room_types varchar(200)
);
delete from airbnb_searches;
insert into airbnb_searches values
(1,'2022-01-01','entire home,private room')
,(2,'2022-01-02','entire home,shared room')
,(3,'2022-01-02','private room,shared room')
,(4,'2022-01-03','private room')



select  @@VERSION

select string_split(filter_room_types,',') as value from airbnb_searches

select value as Room_Type,count(*) as Total_Searches
from 
airbnb_searches
cross  apply
string_split(filter_room_types,',')
group by value