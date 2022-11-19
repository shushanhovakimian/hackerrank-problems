/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
SELECT DISTINCT(n),
        (CASE WHEN p is NULL THEN 'Root' WHEN t2_p is NULL THEN 'Leaf' ELSE 'Inner' END)
FROM (SELECT t1.*, t2.p as t2_p 
      FROM BST t1 LEFT JOIN BST t2 
      ON t1.n = t2.p) AS temp_t ORDER BY n;