CREATE FUNCTION dbo.ChkValidEmail(@EMAIL varchar(100))RETURNS bit as
BEGIN     
  DECLARE @bitEmailVal int
  DECLARE @EmailText varchar(100)

  SET @EmailText=ltrim(rtrim(isnull(@EMAIL,'')))

  SET @bitEmailVal = case when @EmailText = '' then 0
                          when @EmailText like '% %' then 0
                          when @EmailText like ('%["(),:;<>\]%') then 0
                          when substring(@EmailText,0,len(@EmailText)) like ('%[!#$%&*+/=?^`_{|]%') then 0
                          when substring(@EmailText,CHARINDEX('@',@EmailText),len(@EmailText)) like ('%[!#$%&*+/=?^`_{|]%') then 0
                          when (left(@EmailText,1) like ('[-_.+]') or right(@EmailText,1) like ('[-_.+]')) then 0                                                                                    
                          when (@EmailText like '%[%' or @EmailText like '%]%') then 0
                          when @EmailText LIKE '%@%@%' then 0
						  when @EmailText LIKE '%..%' then 0
                          when @EmailText NOT LIKE '_%@_%._%' then 0
                          else 1 
                      end
  RETURN @bitEmailVal
END 
GO

drop function dbo.ChkValidEmail
select dbo.ChkValidEmail('.@GMAIL.COM')

--Create a tabular function that accepts one parameter as employee department and return the employees working in that department.

select * from DEPARTMENTS

create function emp_work_dep(@departmentname varchar(20))
returns table
as 
return (
select * from employees
where employees.DEPARTMENT_ID = any (select DEPARTMENTS.DEPARTMENT_ID from DEPARTMENTS where DEPARTMENTS.DEPARTMENT_NAME=@departmentname)
);

drop function emp_work_dep
select * from dbo.emp_work_dep('Executive')

--Create a function that returns the data of employee records based on the page number passed. 
--Parameters required are PageNumber, PageSize (Hint: use Row_Number, Partition by)

CREATE function EMP_REC(
@PAGENUMBER INT
)
returns table
as 
return (
WITH EMP_DATA AS (
SELECT *, 
ROW_NUMBER() OVER (
ORDER BY FIRST_NAME
) AS RowNumber 
FROM employees
)
SELECT * FROM EMP_data WHERE RowNumber between (@PAGENUMBER-1)*10+1 and (@PAGENUMBER-1)*10 + 10);

drop function EMP_REC
select * from EMP_REC(3)

--‘Select EmpId, FirstName, LastName, PhoneNumber, Email from Employees’ 
--check the execution plan for the given query and save it. Now, optimize the query and then check the execution plan and save it.

  SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,PHONE_NUMBER,EMAIL FROM EMPLOYEES

--Create a stored procedure that prints the employee info in the following format: 
--'employeename' hired on 'hiredate' has a salary package of 'salarypackage'

select * from employees

CREATE PROCEDURE EMP_INFO(
@EMPLOYEE_ID INT
)
AS
BEGIN 
declare @name varchar(20)
declare @salary_emp decimal(8,2)
declare @hiredate date

select @name = FIRST_NAME, @salary_emp = salary,@hiredate =hire_date FROM  EMPLOYEES WHERE EMPLOYEE_ID=@EMPLOYEE_ID
--select  FROM EMPLOYEES WHERE EMPLOYEE_ID=@EMPLOYEE_ID
--select @hiredate =hire_date FROM EMPLOYEES WHERE EMPLOYEE_ID=@EMPLOYEE_ID


print concat(@name,' hired on ',@hiredate,' has a salary package ',@salary_emp)

END;

DROP PROCEDURE EMP_INFO
EXEC EMP_INFO @EMPLOYEE_ID=101


DECLARE @COUNTER INT = 0

DECLARE abc_cursor cursor static for select EMPLOYEE_ID FROM employees 

OPEN ABC_CURSOR
   FETCH FIRST FROM ABC_CURSOR 

WHILE @@FETCH_STATUS!=-1 AND @COUNTER <10
BEGIN

   SET @COUNTER = @COUNTER + 1
   DECLARE @ABC INT
   FETCH NEXT FROM ABC_CURSOR INTO @ABC
   EXEC EMP_INFO @EMPLOYEE_ID=@ABC
   
END;

CLOSE ABC_CURSOR
DEALLOCATE ABC_CURSOR
