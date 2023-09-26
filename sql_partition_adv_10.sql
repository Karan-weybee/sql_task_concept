select * from employees
select * from DEPARTMENTS

select employees.EMPLOYEE_ID,employees.FIRST_NAME,DEPARTMENTS.DEPARTMENT_ID,
count(employees.EMPLOYEE_ID) over(partition by DEPARTMENTS.DEPARTMENT_ID)
from employees
inner join departments 
on employees.DEPARTMENT_ID=DEPARTMENTS.DEPARTMENT_ID

--when we use group by departmentid but also print the employee name and count for department is so 
