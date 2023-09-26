select * from EMPLOYEES
sp_addtype 'karan','varchar(20)'
select * from employees where name = 'john'

declare @jay karan;
set @jay ='str'
print(@jay)

sp_droptype 'karan'

CREATE TYPE dbo.PersonType AS TABLE ( FirstName VARCHAR(50), LastName VARCHAR(50), Age INT );

--CREATE TYPE gender AS ENUM ('Male', 'Female', 'Other');