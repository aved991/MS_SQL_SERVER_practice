-- difference in salary department wise

with x as 
(select *,
max(SALARY) over (partition by dept_name order by dept_name) as high_,
min(SALARY) over (partition by dept_name order by dept_name) as low_

from employee)

select dept_name, high_-low_ as diff
from x