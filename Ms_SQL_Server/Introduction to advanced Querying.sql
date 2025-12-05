--top 2 worst performing days for each city

--select * from Superstore_Orders

--with X as
--(select city, Order_Date_n , sum(profit) Profit_, dense_rank() over(partition by city order by sum(profit)) rnk
--from Superstore_Orders
--group by city, Order_Date_n )

--Select city, Order_Date_n
--from X
--where rnk<=2)

