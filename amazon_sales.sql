use sales_db;
show tables ;


-- 1. Total revenue
SELECT SUM(final_price) AS total_revenue
FROM amazon_sales;


-- 2. Total revenue by category
SELECT
    category,
    SUM(final_price) AS revenue
FROM amazon_sales
GROUP BY category
ORDER BY revenue DESC;


-- 3. Average rating by category
SELECT
    category,
    AVG(rating) AS avg_rating
FROM amazon_sales
GROUP BY category
ORDER BY avg_rating DESC;


-- 4. Categories with revenue above average category revenue
SELECT
    category,
    SUM(final_price) AS revenue
FROM amazon_sales
GROUP BY category
HAVING SUM(final_price) > (
    SELECT AVG(category_revenue)
    FROM (
        SELECT SUM(final_price) AS category_revenue
        FROM amazon_sales
        GROUP BY category
    ) AS t
);


-- 5. Products priced above the overall average price
SELECT
    product_id,
    category,
    final_price
FROM amazon_sales
WHERE final_price > (
    SELECT AVG(final_price)
    FROM amazon_sales
)
ORDER BY final_price DESC;


-- 6. Highest-rated products
SELECT
    product_id,
    category,
    rating
FROM amazon_sales
WHERE rating = (
    SELECT MAX(rating)
    FROM amazon_sales
);


-- 7. Revenue by payment method
SELECT
    payment_method,
    SUM(final_price) AS revenue
FROM amazon_sales
GROUP BY payment_method
ORDER BY revenue DESC;


-- 8. Top 3 products by price within each category
WITH ranked_products AS (
    SELECT
        product_id,
        category,
        final_price,
        RANK() OVER (
            PARTITION BY category
            ORDER BY final_price DESC
        ) AS rnk
    FROM amazon_sales
)
SELECT
    product_id,
    category,
    final_price,
    rnk
FROM ranked_products
WHERE rnk <= 3;


-- 9. Rank categories by revenue
WITH category_sales AS (
    SELECT
        category,
        SUM(final_price) AS revenue
    FROM amazon_sales
    GROUP BY category
)
SELECT
    category,
    revenue,
    DENSE_RANK() OVER (
        ORDER BY revenue DESC
    ) AS revenue_rank
FROM category_sales;


-- 10. Running total of revenue by purchase date
SELECT
    purchase_date,
    final_price,
    SUM(final_price) OVER (
        ORDER BY purchase_date
    ) AS running_revenue
FROM amazon_sales
ORDER BY purchase_date;


-- 11. Compare current sale with previous sale
SELECT
    purchase_date,
    final_price,
    LAG(final_price) OVER (
        ORDER BY purchase_date
    ) AS previous_sale
FROM amazon_sales;


-- 12. Return rate by category
SELECT
    category,
    COUNT(*) AS total_orders,
    SUM(
        CASE
            WHEN is_returned = 1 THEN 1
            ELSE 0
        END
    ) AS returned_orders,
    ROUND(
        SUM(
            CASE
                WHEN is_returned = 1 THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS return_rate
FROM amazon_sales
GROUP BY category
ORDER BY return_rate DESC;


-- 13. Top 3 brands by revenue
WITH brand_sales AS (
    SELECT
        brand,
        SUM(final_price) AS revenue
    FROM amazon_sales
    GROUP BY brand
),
ranked_brands AS (
    SELECT
        brand,
        revenue,
        DENSE_RANK() OVER (
            ORDER BY revenue DESC
        ) AS rnk
    FROM brand_sales
)
SELECT
    brand,
    revenue,
    rnk
FROM ranked_brands
WHERE rnk <= 3;


-- 14. Monthly revenue with running total
WITH monthly_sales AS (
    SELECT
        DATE_FORMAT(purchase_date, '%Y-%m') AS month,
        SUM(final_price) AS revenue
    FROM amazon_sales
    GROUP BY DATE_FORMAT(purchase_date, '%Y-%m')
)
SELECT
    month,
    revenue,
    SUM(revenue) OVER (
        ORDER BY month
    ) AS running_revenue
FROM monthly_sales
ORDER BY month;


-- 15. Sellers with above-average seller rating
SELECT
    seller_id,
    seller_rating
FROM amazon_sales
WHERE seller_rating > (
    SELECT AVG(seller_rating)
    FROM amazon_sales
)
GROUP BY seller_id, seller_rating
ORDER BY seller_rating DESC;