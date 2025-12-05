
select* from superstore_orders

--1 category and sub category by sale and which product maximum sale ?

select category, sub_category, sum(Sales) Total_Sales
from superstore_orders

group by category, sub_category
order by sum(Sales) desc

--2. In which city has the maximum sales been achieved 

select top 1 City, sum(Sales) Total_Sales
from superstore_orders

group by City
order by sum(Sales) desc

--3. In which city has the minimum sales been achieved?

select top 1 City, sum(Sales) Total_Sales
from superstore_orders

group by City
order by sum(Sales) 

--4. Find order ID that have been received twice or more ?
 
select Order_ID, COUNT(Order_ID) order_counts
from superstore_orders

group by Order_ID
having COUNT(Order_ID)>=2
order by COUNT(Order_ID)

--5. Select the category, Sub category on which maximum discount was given and how much profit did the company get from it?

select category , Sub_category, SUM(Discount) total_discount, SUM(Profit) Profit_
from Superstore_Orders

group by category , Sub_category
order by SUM(Discount), SUM(Profit) 

--6.Find customers name who have ordered more than twice?

select customer_name, COUNT(Order_ID) orders_
from Superstore_Orders

group by Customer_Name
having COUNT(Order_ID)>2
order by COUNT(Order_ID)

--7.In which year has the maximum sales been done

select YEAR(Order_Date_N) year_, SUM(sales) sales_
from Superstore_Orders

group by YEAR(Order_Date_N)
order by SUM(sales)

--8 in which month of every year has the most sales been done?

with x as
(select YEAR(Order_Date_N) year_, month(Order_Date_N) months_, SUM(sales) sales_,
DENSE_RANK() over(partition by YEAR(Order_Date_N) order by SUM(sales) desc) rnk
from Superstore_Orders
group by YEAR(Order_Date_N), month(Order_Date_N))

select year_, months_
from x 
where rnk = 1

--9. How many days the delivery average take after a customer  place an order?

