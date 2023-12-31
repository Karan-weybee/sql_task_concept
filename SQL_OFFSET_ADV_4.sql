-- offset practice

select * from EMPLOYEES order by EMPLOYEEID
offset 2 rows
fetch next 2 rows only

SELECT * FROM EMPLOYEES WHERE EMPLOYEEID IN (
select EMPLOYEEID from EMPLOYEES order by EMPLOYEEID
offset 2 rows
fetch next 2 rows only)

SELECT * FROM EMPLOYEES WHERE EMPLOYEEID IN (
select EMPLOYEEID from EMPLOYEES order by EMPLOYEEID DESC
offset 2 rows
)
ORDER BY EMPLOYEEID 

SELECT * FROM EMPLOYEES ORDER BY EMPLOYEEID 
OFFSET 0 ROWS
FETCH NEXT 3 ROWS ONLY

--BELOW DATA FOR GIVING AS A TASK

SELECT * FROM EMPLOYEES WHERE EMPLOYEEID IN (
SELECT EMPLOYEEID FROM EMPLOYEES ORDER BY EMPLOYEEID 
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY
)
OR EMPLOYEEID IN(
SELECT EMPLOYEEID FROM EMPLOYEES ORDER BY EMPLOYEEID 
OFFSET 3 ROWS
FETCH NEXT 1 ROWS ONLY
)