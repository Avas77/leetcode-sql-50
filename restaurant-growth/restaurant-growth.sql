WITH daily_total AS (SELECT
    visited_on,
    SUM(amount) AS amount
FROM Customer
GROUP BY visited_on)

SELECT
    visited_on,
    SUM(amount) OVER (
        order by visited_on
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS amount,
    ROUND(AVG(amount) OVER (
        order by visited_on
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ), 2) AS average_amount
FROM daily_total
limit 1000 offset 6;