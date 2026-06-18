# E-Commerce Customer Dissatisfaction & Return Risk Analysis (SQL)
### This project analyzes the Olist Brazilian E-Commerce dataset using MySQL and answers key questions related to sales performance, customer experience, logistics efficiency, and dissatisfaction risk.

## Business Objective
An e-commerce company wants to improve customer satisfaction and reduce losses associated with poor customer experiences and potential product returns. 
The analysis focuses on:
* Business performance and revenue drivers
* Customer satisfaction patterns
* Delivery performance
* High-risk products and sellers

## Dataset
**Source:** [Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) 

## Data Preparation
The following preprocessing steps were performed before analysis:
* Duplicate reviews were identified and removed, and a cleaned review dataset (`order_reviews_cleaned`) was created for subsequent analysis.
* Missing delivery dates were investigated.
* Product category names were translated from Portuguese to English using the category translation table and (`products_cleaned`) was created for analysis.
* Product categories without valid translations were identified.
* Order status values were reviewed and validated.
* Review scores were verified to ensure they remained within the expected 1–5 scale.

## Key Business Questions

**Business Overview**
* How has order volume changed over time?
* What is the order cancellation rate?
* Which product categories generate the highest revenue?
* Which sellers generate the highest sales volume and revenue?

**Customer Experience**
* Which product categories receive the lowest ratings?
* Which sellers receive the lowest ratings?
* Does product price influence customer ratings?

**Delivery Performance**
* Which product categories experience the longest delivery times?
* How do delayed deliveries affect customer ratings?
* Which sellers have the highest delivery delay rates?

**Return Risk Analysis**
* What proportion of orders fall into Low, Medium, and High Risk categories?
* Which product categories have the highest concentration of High Risk orders?
* Which sellers have the highest concentration of High Risk orders?

## Key Findings

**Business Overview**
- Order volume grew from 2 orders (Sept 2016) to 7,000+ monthly by early 2018
- Cancellation rate is 0.63% (625 out of 99,441 orders)
- Health & Beauty leads revenue at R$1.44M; Bed Bath Table leads order volume at 9,417 orders
- Seller `6560211a` handled 1847 orders generating R$122K in revenue, while seller `4869f7a` generated R$229k in revenue with total 1131 orders

**Customer Experience**
- Office Furniture is the lowest rated category at 3.49 avg across 1,263 orders
- Seller `1ca7077d` is the worst rated at 2.20 avg across 114 orders with only R$13K revenue
- Price has no effect on satisfaction; All price buckets score between 4.00 and 4.05

**Delivery Performance**
- Office Furniture has the longest avg delivery time at 20.8 days
- Delayed orders score 2.57 vs 4.29 for on-time orders, showcasing a 1.72 point drop
- Seller `06a2c3af` has the highest delay rate at 24.42% (95 out of 389 orders)

**Return Risk**
- 78.47% Low Risk, 12.76% High Risk, 8.23% Medium Risk; 1 in 5 orders carries dissatisfaction risk
- Office Furniture has the highest High Risk rate at 34% (423 out of 1,244 orders)
- Seller `1ca7077d` has the highest High Risk rate at 74.77% (80 out of 107 orders)

## Conclusion

- Delivery performance is the single most actionable lever for improving satisfaction. Delayed orders score 1.72 points lower regardless of category or price, making logistics optimization a platform-wide priority.
- Office Furniture presents compounded risk across every phase: lowest rating (3.49), longest delivery (20.8 days), and highest High Risk rate (34%), signaling systemic issues beyond pricing alone.
- Price has no effect on customer expectations. Satisfaction scores are flat across all price tiers (4.00–4.05), meaning seller quality standards must be enforced uniformly regardless of what the product costs.
- Several sellers flagged across multiple phases simultaneously represent concentrated reputational and financial risk and warrant priority review independent of their revenue contribution.
