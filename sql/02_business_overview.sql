-- Q1: What is the monthly order volume trend?
SELECT 
YEAR(order_purchase_timestamp) AS year,
MONTH(order_purchase_timestamp) AS month,
COUNT(order_id) AS total_orders
FROM orders
WHERE order_status != 'canceled'
GROUP BY year, month
ORDER BY year, month;

-- Q2: What is the overall cancellation rate?
SELECT
COUNT(*) AS total_orders,
SUM(CASE WHEN order_status = 'canceled' THEN 1 ELSE 0 END) AS canceled_orders,
ROUND(
SUM(CASE WHEN order_status = 'canceled' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS cancellation_rate_percent
FROM orders;

-- Q3: What is total revenue by category?
SELECT 
pc.product_category,
ROUND(SUM(oi.price + oi.freight_value), 2) AS total_revenue,
COUNT(DISTINCT oi.order_id) AS total_orders
FROM order_items AS oi
JOIN products_cleaned AS pc 
ON oi.product_id = pc.product_id
WHERE pc.product_category IS NOT NULL
GROUP BY pc.product_category
ORDER BY total_revenue DESC
LIMIT 10;

-- Q4: Who are the top 10 sellers by order volume?
SELECT 
oi.seller_id,
COUNT(DISTINCT oi.order_id) AS total_orders,
ROUND(SUM(oi.price), 2) AS total_revenue
FROM order_items AS oi
JOIN orders AS o 
ON oi.order_id = o.order_id
WHERE o.order_status != 'canceled'
GROUP BY oi.seller_id
ORDER BY total_orders DESC
LIMIT 10;