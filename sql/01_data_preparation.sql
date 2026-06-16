CREATE DATABASE olist;
USE olist;

-- product_cleaned table with category names in english
CREATE TABLE products_cleaned AS
SELECT
p.product_id,
t.product_category_name_english AS product_category,
p.product_weight_g
FROM products p
LEFT JOIN product_category_name_translation t
ON p.product_category_name = t.product_category_name;

-- 1. NULL delivery dates
SELECT COUNT(*) AS null_delivery_dates
FROM orders
WHERE order_delivered_customer_date IS NULL;

-- 2. Duplicate reviews per order
SELECT order_id, COUNT(*) AS count
FROM order_reviews
GROUP BY order_id
HAVING count > 1;

-- 3. Untranslated categories
SELECT COUNT(*) AS untranslated_products
FROM products p
LEFT JOIN product_category_name_translation t
ON p.product_category_name = t.product_category_name
WHERE t.product_category_name_english IS NULL;

-- 4. Order status values
SELECT order_status, COUNT(*) AS count
FROM orders
GROUP BY order_status
ORDER BY count DESC;

-- 5. Review scores are valid
SELECT review_score, COUNT(*) AS count
FROM order_reviews
GROUP BY review_score
ORDER BY review_score;
