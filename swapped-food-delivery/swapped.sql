WITH order_count AS (SELECT 
  COUNT(order_id) AS total_orders
FROM orders)

SELECT
  CASE 
    WHEN order_id % 2 != 0 AND total_orders != order_id THEN order_id + 1
    WHEN order_id % 2 != 0 AND total_orders = order_id THEN order_id
    ELSE order_id - 1
  END AS corrected_order_id,
  item
FROM orders
CROSS JOIN order_count
ORDER BY corrected_order_id;