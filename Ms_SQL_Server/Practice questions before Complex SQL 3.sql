select * from Customers
select * from Orders
select * from OrderDetails
select * from products


--1.	List all orders with a ROW_NUMBER assigned by OrderDate (latest orders first).

select *, DENSE_RANK()
over(order by OrderDate) rnk
from Orders


--2.	List all products with a ROW_NUMBER ordered by Price descending.

select *, dense_rank() over(order by price)  rnk
from products

--3.	Show all customers with a RANK based on total amount spent (highest spender first).
select * from Customers
select * from Orders

select c.CustomerID, c.name, sum(TotalAmount) Amt, 
	dense_rank() over(order by sum(TotalAmount) desc) rnk
from customers c

join orders o on c.customerID = o.customerID
group by c.CustomerID, c.name

--4.	Show all orders with a DENSE_RANK on TotalAmount so ties have the same rank.

select *, 
	dense_rank() over(order by TotalAmount) rnk
from Orders

--5.	Find the ROW_NUMBER of products within each Category ordered by Price descending.

select * from products

select category,price, row_number() over(partition by category order by price desc) row_
from products


--6.	Show each customer’s orders along with a ROW_NUMBER for their orders ordered by OrderDate.
select * from Customers
select * from Orders

select c.Name,OrderID,OrderDate, row_number() over(order by OrderDate) row_
from Orders o

join customers c on o.CustomerID=c.CustomerID


--7.	For each customer, rank their orders by TotalAmount highest to lowest.

select c.Name,o.CustomerID,sum(TotalAmount) amt, row_number() over(order by sum(TotalAmount) desc) row_
from Orders o

join customers c on o.CustomerID = c.CustomerID
group by c.Name,o.CustomerID



--8.	For each product category, rank products by Price.


--9.	List each product with the average Price of products in its category using AVG() OVER (PARTITION BY Category).
--10.	Show each order detail with total quantity of products ordered in that order using SUM() OVER (PARTITION BY OrderID).
