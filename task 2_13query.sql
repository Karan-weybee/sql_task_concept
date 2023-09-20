1. Given SQL query will execute successfully: 

  TRUE/FALSE SELECT last_name, job_id, salary AS Sal FROM employees;  ans :- TRUE


2. Identity errors in the following statement:
   SELECT employee_id, last_name, sal*12 ANNUAL SALARY FROM employees;

    SELECT employee_id, last_name, salary*12 as ANNUAL_SALARY FROM employees

3. Write a query to determine the structure of the table 'DEPARTMENTS'

 select * from departments

4. Write a query to determine the unique Job IDs from the EMPLOYEES table.

   select distinct job_id from employees

5.  Write a query to display the employee number, lastname, salary (oldsalary), salary increased by 15.5% name
    it has NewSalary and subtract the (NewSalary from OldSalary) name the column as Increment.

	select phone_number,last_name,salary as oldsalary , salary+salary*15.5/100 as newsalary  from employees

6. Write a query to display the minimum, maximum, sum and average salary for each job type.

    select min(salary) as minimum,max(salary) as maximum,sum(salary) as sumAll , avg(salary) as average , job_id from employees 
	group by JOB_ID

7. The HR department needs to find the names and hire dates of all employees who were hired 
   before their managers, along with their managers’ names and hire dates.

    select e1.EMPLOYEE_ID,e1.FIRST_NAME,e1.LAST_NAME,e1.HIRE_DATE,e2.MANAGER_ID,e2.FIRST_NAME,e2.LAST_NAME,e2.HIRE_DATE from employees e1
	inner join employees e2 on e1.EMPLOYEE_ID=e2.MANAGER_ID 
	where e1.HIRE_DATE>e2.HIRE_DATE

8. Create a report for the HR department that displays employee last names, department numbers, and all the employees 
   who work in the same department as a given employee.

  ans 1:- select employees.last_name,employees.DEPARTMENT_ID ,departments.department_name from employees inner join departments on employees.DEPARTMENT_ID=departments.DEPARTMENT_ID order by employees.DEPARTMENT_ID
  ans 2:- select e2.* from employees e1 inner join employees e2 on e1.EMPLOYEE_ID=e2.manager_ID where e1.LAST_NAME='king'
	    
9. Find the highest, lowest, sum, and average salary of all employees. 
   Label the columns Maximum, Minimum, Sum, and Average, respectively. 
   Round your results to the nearest whole number.


   select round(min(salary),0) as minimum,round(max(salary),0) as maximum,round(sum(salary),0) as sumAll , round(avg(salary),0) as average from employees 


10. Create a report that displays list of employees whose salary is more than the salary of 
    any employee from department 60.

	select * from employees where salary > any (select salary from employees where department_id = 60)

11.  Create a report that displays last name and salary of every employee who reports to 
     King(Use any manager name instead of King).

	 select last_name,salary from employees e1 where e1.manager_id = any (select employee_id from employees where last_name='king')

12. Write a query to display the list of department IDs for departments that 
    do not contain the job Id ST_CLERK(Add this job ST_CLERK to Job table). Use SET Operator for this query

	select * from jobs
	insert into jobs values('st_clerk','clerk',50000,60000)
	select distinct department_id from employees where job_id not in ('st_clerk')
	EXCEPT
	select distinct department_id from employees where job_id in ('st_clerk')


13.Write a query to display the list of employees who work in department 50 and 80. 
   Show employee Id, job Id and department Id by using set operators. - Add 50 and 80 department Id to department table

   select employee_id,job_id,department_id from employees where department_id in (50)
   union
   select employee_id,job_id,department_id from employees where department_id in (80)
