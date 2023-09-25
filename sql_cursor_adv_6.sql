select * from employees

Declare @employeeid int,
@name varchar(20),
@Department varchar(20),
@salary decimal(10,0)

Declare abcd cursor static for select employeeid
from employees 

open abcd;
fetch first from abcd

WHILE @@FETCH_STATUS = 0
 BEGIN
 FETCH NEXT FROM abcd;
 END;

CLOSE abcd;
DEALLOCATE abcd;
GO