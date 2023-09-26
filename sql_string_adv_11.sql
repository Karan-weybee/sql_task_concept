SELECT * FROM employees WHERE name = 'John'; 

SELECT * FROM employees WHERE name COLLATE Latin1_General_CI_AI = 'john';

SELECT name, CASE WHEN name = 'John' THEN 'Match' WHEN UPPER(name) = 'JOHN' THEN 'Case-insensitive Match' 
ELSE 'No Match' END AS MatchStatus FROM employees;