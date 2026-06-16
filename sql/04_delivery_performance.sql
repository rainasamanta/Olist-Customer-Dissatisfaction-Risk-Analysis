-- Q8: Which categories have longest average delivery times?
SELECT 
pc.product_category,
ROUND(AVG(DATEDIFF(o.order_delivered_customer_date, o.order_purchase_timestamp)), 1) AS avg_delivery_days,
COUNT(DISTINCT oi.order_id) AS total_orders
FROM order_items AS oi
JOIN products_cleaned AS pc ON oi.product_id = pc.product_id
JOIN orders AS o ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered'
AND pc.product_category IS NOT NULL
GROUP BY pc.product_category
HAVING total_orders > 50
ORDER BY avg_delivery_days DESC
LIMIT 10;

-- Q9: Do delayed orders receive lower ratings?
SELECT 
CASE 
WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date THEN 'Delayed'
ELSE 'On Time'
END AS delivery_status,
ROUND(AVG(r.review_score), 2) AS avg_rating,
COUNT(DISTINCT o.order_id) AS total_orders
FROM orders AS o
JOIN order_reviews AS r ON o.order_id = r.order_id
WHERE o.order_status = 'delivered'
GROUP BY delivery_status;

-- Q10: Which sellers cause most delivery delays?
SELECT 
oi.seller_id,
COUNT(DISTINCT oi.order_id) AS total_orders,
SUM(CASE WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date THEN 1 ELSE 0 END) AS delayed_orders,
ROUND(SUM(CASE WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date THEN 1 ELSE 0 END) * 100.0 / COUNT(DISTINCT oi.order_id), 2) AS delay_rate_percent
FROM order_items AS oi
JOIN orders AS o ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY oi.seller_id
HAVING COUNT(DISTINCT oi.order_id) > 100
ORDER BY delay_rate_percent DESC
LIMIT 10;
