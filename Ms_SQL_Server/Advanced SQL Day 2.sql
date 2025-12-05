-- find employee whose salary is less than avg salary

select* from employee;

with x as
(select DEPT_NAME, emp_ID, emp_NAME, SALARY, AVG(SALARY) over (partition by DEPT_NAME order by DEPT_NAME ) as sal

from employee)

select DEPT_NAME, emp_ID, emp_NAME, SALARY, sal
from x
where SALARY < sal

