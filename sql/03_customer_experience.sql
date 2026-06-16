-- Q5: Which categories receive the lowest average ratings?
SELECT 
pc.product_category,
ROUND(AVG(r.review_score), 2) AS avg_rating,
COUNT(DISTINCT oi.order_id) AS total_orders
FROM order_items AS oi
JOIN products_cleaned AS pc ON oi.product_id = pc.product_id
JOIN order_reviews_cleaned AS r ON oi.order_id = r.order_id
WHERE pc.product_category IS NOT NULL
GROUP BY pc.product_category
HAVING COUNT(DISTINCT oi.order_id) > 50
ORDER BY avg_rating ASC
LIMIT 10;

-- Q6: Which sellers have worst review scores with high order volume?
SELECT 
oi.seller_id,
ROUND(AVG(r.review_score), 2) AS avg_rating,
COUNT(DISTINCT oi.order_id) AS total_orders,
ROUND(SUM(oi.price), 2) AS total_revenue
FROM order_items AS oi
JOIN order_reviews_cleaned AS r ON oi.order_id = r.order_id
JOIN orders AS o ON oi.order_id = o.order_id
WHERE o.order_status != 'canceled'
GROUP BY oi.seller_id
HAVING COUNT(DISTINCT oi.order_id) > 100
ORDER BY avg_rating ASC
LIMIT 10;

-- Q7: Does product price affect review score?
SELECT 
CASE 
WHEN oi.price < 50 THEN 'Under RS 50'
WHEN oi.price BETWEEN 50 AND 150 THEN 'RS 50 - RS 150'
WHEN oi.price BETWEEN 151 AND 300 THEN 'RS 151 - RS 300'
WHEN oi.price BETWEEN 301 AND 500 THEN 'RS 301 - RS 500'
ELSE 'Above RS 500'
END AS price_bucket,
ROUND(AVG(r.review_score), 2) AS avg_rating,
COUNT(DISTINCT oi.order_id) AS total_orders
FROM order_items AS oi
JOIN order_reviews_cleaned AS r ON oi.order_id = r.order_id
WHERE oi.price > 0
GROUP BY price_bucket
ORDER BY MIN(oi.price) ASC;
