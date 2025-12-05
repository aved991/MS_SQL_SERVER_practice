select * from Superstore_Orders
--1. Category and subcategory having the minimum sales in each state

with x as 
(select distinct state_province, category, sub_category,sum(sales) sum_sales, dense_rank() over(partition by state_province order by sum(sales)) as rnk

from Superstore_Orders
group by state_province, category, sub_category)

select  state_province, category, sub_category 
from x
where rnk=1

--2. Category and subcategory having the minimum profit in each state
with x as 
(select state_province, category, sub_category,sum(profit) sum_profit, dense_rank() over(partition by state_province order by sum(profit)) as rnk

from Superstore_Orders
group by state_province, category, sub_category)

select  state_province, category, sub_category 
from x
where rnk=1

--3. Category and subcategory having the minimum number of orders in each state

with x as 
(select state_province, category, sub_category, count(Order_ID) as orders, dense_rank() over(partition by state_province,category order by count(Order_ID)) rnk
from superstore_orders
group by state_province, category, sub_category)

select state_province, category, sub_category
from x
where rnk=1

