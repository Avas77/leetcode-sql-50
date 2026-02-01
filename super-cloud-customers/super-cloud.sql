SELECT 
  contract.customer_id
FROM customer_contracts AS contract
LEFT JOIN products AS prod ON contract.product_id = prod.product_id
GROUP BY contract.customer_id
HAVING COUNT(DISTINCT prod.product_category) = 3
ORDER BY contract.customer_id;