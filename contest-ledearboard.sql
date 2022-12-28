
WITH temp_t AS (
SELECT s.hacker_id, name, MAX(score) AS t_score
FROM hackers h JOIN submissions s ON h.hacker_id = s.hacker_id
GROUP BY s.hacker_id, name, challenge_id)

SELECT hacker_id, name, SUM(t_score) AS s_score
FROM temp_t
GROUP BY hacker_id, name
HAVING SUM(t_score) > 0
ORDER BY s_score DESC, hacker_id ASC;