


--11.	Show orders with a running total of TotalAmount ordered by OrderDate.
--12.	Show products with a running total quantity sold ordered by ProductID.
--13.	For each customer, show a running total of their spending over their orders.
--14.	For each category, show products with a running average of Price.
--15.	Show each customer order with the difference between that order amount 
--		and the average order amount for that customer.

select* from Orders
select* from Customers

select o.OrderID, o.CustomerID, c.Name, AVG(TotalAmount) over(partition by o.CustomerID)- TotalAmount as diff_amt
from Orders o
join Customers c on o.CustomerID=c.CustomerID
