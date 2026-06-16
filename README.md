# E-Commerce Customer Dissatisfaction & Return Risk Analysis (SQL)
###This project analyzes the Olist Brazilian E-Commerce dataset using MySQL and answers key questions related to sales performance, customer experience, logistics efficiency, and dissatisfaction risk.

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

### Business Overview
* How has order volume changed over time?
* What is the order cancellation rate?
* Which product categories generate the highest revenue?
* Which sellers generate the highest sales volume and revenue?

### Customer Experience
* Which product categories receive the lowest ratings?
* Which sellers receive the lowest ratings?
* Does product price influence customer ratings?

### Delivery Performance
* Which product categories experience the longest delivery times?
* How do delayed deliveries affect customer ratings?
* Which sellers have the highest delivery delay rates?

### Return Risk Analysis
* What proportion of orders fall into Low, Medium, and High Risk categories?
* Which product categories have the highest concentration of High Risk orders?
* Which sellers have the highest concentration of High Risk orders?

## Key Findings
* Order volume increased significantly throughout the observed period, indicating strong business growth.
* Health & Beauty, Watches & Gifts, and Bed Bath Table were among the highest revenue-generating categories.
* Office Furniture showed the lowest average customer ratings among major categories.
* Delayed deliveries received substantially lower ratings compared to on-time deliveries.
* Several product categories and sellers exhibited disproportionately high dissatisfaction rates, making them candidates for operational and quality review.

## Conclusion
The results highlight the importance of delivery performance, seller quality, and category-level monitoring in improving customer satisfaction and reducing dissatisfaction risk.
