WITH CTE AS(
  SELECT
    h.hacker_id, name,
    COUNT(DISTINCT challenge_id) AS num
  FROM
    hackers h
    JOIN challenges ch ON h.hacker_id = ch.hacker_id
  GROUP BY
    h.hacker_id, h.name
  ORDER BY
    num DESC,
    h.hacker_id DESC
),

CTE2 AS(
  SELECT
   *, ROW_NUMBER() OVER(
    PARTITION BY num
    ORDER BY hacker_id ASC
  ) AS row_num
FROM CTE
)
SELECT
  hacker_id,
  name,
  num
FROM
  CTE2
WHERE
  (row_num = 1)
  OR (num = (SELECT MAX(NUM)
            FROM CTE2))
ORDER BY num DESC, hacker_id DESC;