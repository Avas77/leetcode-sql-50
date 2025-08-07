SELECT 
    p.product_name,
    SUM(o.unit) AS unit
FROM Products AS p
INNER JOIN Orders AS o ON p.product_id = o.product_id 
WHERE YEAR(o.order_date)='2020' AND MONTH(o.order_date)='02'
GROUP BY p.product_id, p.product_name
HAVING unit >= 100;