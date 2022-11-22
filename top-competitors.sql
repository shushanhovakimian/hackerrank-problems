SELECT s.hacker_id, name
FROM hackers h 
JOIN submissions s ON h.hacker_id = s.hacker_id 
JOIN challenges ch ON s.challenge_id = ch.challenge_id
JOIN difficulty d ON ch.difficulty_level = d.difficulty_level
WHERE d.score = s.score
GROUP BY s.hacker_id, name
HAVING COUNT(s.challenge_id) > 1
ORDER BY COUNT(s.challenge_id) DESC, s.hacker_id ASC;