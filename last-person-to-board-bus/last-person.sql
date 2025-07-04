WITH running_weight AS (SELECT
    person_name,
    weight,
    turn,
    SUM(weight) OVER (
        ORDER BY turn
    ) AS total_weight
FROM Queue
ORDER BY turn)

SELECT
    person_name
FROM running_weight
WHERE total_weight <= 1000
ORDER BY total_weight DESC
LIMIT 1;