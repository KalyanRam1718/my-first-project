use [Rupesh]

select * from [dbo].[employees]

-- Top 2 salaried employees
select emp_id, emp_name, salary, department from (
select *, 
DENSE_RANK() over(order by salary desc) rnk
from [dbo].[employees]) x
where x.rnk <= 2

-- Identifying the Duplicates

select * from [dbo].[employees]

select emp_id, emp_name, salary, department from(
select *,
ROW_NUMBER() over(partition by emp_name order by emp_id) D
from [dbo].[employees]) x
where x.D <> 1

