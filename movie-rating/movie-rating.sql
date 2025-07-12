WITH user_rate_count AS (SELECT
    usr.name,
    COUNT(mr.user_id) AS rating_count
FROM MovieRating AS mr
INNER JOIN Users AS usr ON mr.user_id = usr.user_id
GROUP BY usr.user_id
ORDER BY rating_count DESC, usr.name ASC), 
movies_avg_count AS (
    SELECT 
        mov.title,
        AVG(mr.rating) AS average_rating
    FROM MovieRating AS mr
    INNER JOIN Movies AS mov ON mr.movie_id = mov.movie_id
    WHERE created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY mov.movie_id
    ORDER BY average_rating DESC, mov.title ASC
)

SELECT * FROM (
    SELECT name AS results FROM user_rate_count LIMIT 1
) AS a
UNION ALL
SELECT * FROM (
    SELECT title AS results FROM movies_avg_count LIMIT 1
) AS b;