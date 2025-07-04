-- "Low Salary": All the salaries strictly less than $20000.
-- "Average Salary": All the salaries in the inclusive range [$20000, $50000].
-- "High Salary": All the salaries strictly greater than $50000.

WITH income_category AS (SELECT
    account_id,
    income,
    CASE 
        WHEN income < 20000 THEN "Low Salary"
        WHEN income >= 20000 AND income <= 50000 THEN "Average Salary"
        ELSE "High Salary"
    END AS category
FROM Accounts),
category_count AS (
    SELECT
        category,
        COUNT(category) AS category_count
    FROM income_category
    GROUP BY category
),
all_categories AS (SELECT 'Low Salary' AS category
    UNION ALL
    SELECT 'Average Salary'
    UNION ALL
    SELECT 'High Salary'
)

SELECT
    ac.category,
    COALESCE(cc.category_count, 0) AS accounts_count
FROM all_categories AS ac
LEFT JOIN category_count AS cc ON ac.category = cc.category 
ORDER BY accounts_count DESC;