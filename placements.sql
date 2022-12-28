
WITH temp_tbl AS(SELECT s.id, s.name, f.friend_id, p.salary, p1.salary AS friend_salary
FROM students s LEFT JOIN friends f ON s.id = f.id
LEFT JOIN packages p ON f.id = p.id 
LEFT JOIN packages p1 ON f.friend_id = p1.id )

select name from temp_tbl
where salary < friend_salary
order by friend_salary;