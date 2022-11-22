SELECT CASE WHEN g.grade < 8 THEN NULL ELSE s.name END,
g.grade, s.marks
FROM students s, grades g
WHERE s.marks BETWEEN min_mark AND max_mark
ORDER BY g.grade DESC, s.name ASC, s.marks ASC;