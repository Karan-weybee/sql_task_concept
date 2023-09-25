CREATE TABLE EMPLOYEES(
EMPLOYEEID INT PRIMARY KEY,
NAME VARCHAR(20),
DEPARTMENT VARCHAR(20),
SALARY DECIMAL(10,0)
)

SELECT * FROM EMPLOYEES

/*INSERT INTO EMPLOYEES VALUES
(4,'SARAH','MARKETING',48000),
(5,'DAVID','OPERATIONS',42000)*/

SELECT EmployeeID, Name, Department, Salary, 
ROW_NUMBER() OVER (
ORDER BY Salary ASC
) AS RowNumber 
FROM employees;

SELECT TOP 3 EmployeeID, Name, Department, Salary, 
ROW_NUMBER() OVER (
ORDER BY Salary ASC
) AS RowNumber 
FROM employees;

SELECT EmployeeID, Name, Department, Salary, 
RANK() OVER (
ORDER BY Salary ASC
) AS RANK_NUM 
FROM employees;

SELECT EmployeeID, Name, Department, Salary, 
DENSE_RANK() OVER (
ORDER BY Salary ASC
) AS RANK_DENSE 
FROM employees;

SELECT TOP 3 EmployeeID, Name, Department, Salary, 
NTILE(3) OVER (
ORDER BY Salary ASC
) AS NTILE_NUM 
FROM employees;


WITH EMP_DATA AS (
SELECT *, 
ROW_NUMBER() OVER (
ORDER BY Salary ASC
) AS RowNumber 
FROM employees
)
SELECT * FROM EMP_data WHERE RowNumber between 2 and 4 ;
