Create table adobe_transactions ( customer_id int, product nvarchar(50), revenue decimal (10,2))

insert into adobe_transactions values(123, 'Photoshop',50)

insert into adobe_transactions values(123, 'Premeir Pro',100)

insert into adobe_transactions values(123, 'After Effects',50)

insert into adobe_transactions values(234, 'Illustrator',200)

insert into adobe_transactions values(234, 'Premeir Pro',100)

insert into adobe_transactions values(234, 'Photoshopo',40)




with CustomerswithPhotoshop
as(

select customer_id,Revenue from adobe_transactions
where product='Photoshop'
),

CustomerswithoutPhotoshop 
as
(
select customer_id,sum(revenue) as revenue from adobe_transactions
where product not in ('Photoshop')
group by customer_id
) 

select C1.customer_id, c2.revenue -c1.revenue  
from CustomerswithPhotoshop c1
join CustomerswithoutPhotoshop c2 on C1.customer_id =C2.customer_id