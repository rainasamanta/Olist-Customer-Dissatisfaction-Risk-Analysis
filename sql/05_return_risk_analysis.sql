-- Q11: What % of orders fall into each risk bucket?
SELECT 
CASE 
WHEN r.review_score <= 2 THEN 'High Risk'
WHEN r.review_score = 3 THEN 'Medium Risk'
ELSE 'Low Risk'
END AS risk_level,
COUNT(DISTINCT o.order_id) AS total_orders,
ROUND(COUNT(DISTINCT o.order_id) * 100.0 / 
(SELECT COUNT(DISTINCT order_id) FROM orders WHERE order_status = 'delivered'), 2) AS percentage
FROM orders AS o
JOIN order_reviews AS r ON o.order_id = r.order_id
WHERE o.order_status = 'delivered'
GROUP BY risk_level
ORDER BY total_orders DESC;

-- Q12: Which categories have highest % of High Risk orders?
SELECT 
pc.product_category,
COUNT(DISTINCT oi.order_id) AS total_orders,
SUM(CASE WHEN r.review_score <= 2 THEN 1 ELSE 0 END) AS high_risk_orders,
ROUND(SUM(CASE WHEN r.review_score <= 2 THEN 1 ELSE 0 END) * 100.0 / 
COUNT(DISTINCT oi.order_id), 2) AS high_risk_percent
FROM order_items AS oi
JOIN products_cleaned AS pc ON oi.product_id = pc.product_id
JOIN orders AS o ON oi.order_id = o.order_id
JOIN order_reviews AS r ON o.order_id = r.order_id
WHERE o.order_status = 'delivered'
AND pc.product_category IS NOT NULL
GROUP BY pc.product_category
HAVING COUNT(DISTINCT oi.order_id) > 50
ORDER BY high_risk_percent DESC
LIMIT 10;

-- Q13: Which sellers have highest High Risk order rates?
SELECT 
oi.seller_id,
COUNT(DISTINCT oi.order_id) AS total_orders,
SUM(CASE WHEN r.review_score <= 2 THEN 1 ELSE 0 END) AS high_risk_orders,
ROUND(SUM(CASE WHEN r.review_score <= 2 THEN 1 ELSE 0 END) * 100.0 / 
COUNT(DISTINCT oi.order_id), 2) AS high_risk_percent
FROM order_items AS oi
JOIN orders AS o ON oi.order_id = o.order_id
JOIN order_reviews AS r ON o.order_id = r.order_id
WHERE o.order_status = 'delivered'
GROUP BY oi.seller_id
HAVING COUNT(DISTINCT oi.order_id) > 100
ORDER BY high_risk_percent DESC
LIMIT 10;