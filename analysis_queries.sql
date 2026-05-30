-- Monthly Revenue Trend
SELECT 
    DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS month,
    ROUND(SUM(p.payment_value), 2) AS total_revenue,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM orders o
JOIN payments p ON o.order_id = p.order_id
WHERE o.order_status = 'delivered'
GROUP BY month
ORDER BY month;

-- Top 10 Product Categories by Revenue
SELECT 
	p.product_category_name as category,
    ROUND(SUM(oi.price),2) as total_revenue,
    COUNT(DISTINCT oi.order_id) as total_orders,
    ROUND(AVG(oi.price)) as avg_order_price
from order_items oi
join products p on oi.product_id = p.product_id
where p.product_category_name is NOT NULL
group by p.product_category_name
order by total_revenue desc
limit 10;


-- Average Order Value
with total_amount as(
	select order_id, sum(payment_value) as order_total
    from payments
    group by order_id)
    select round(avg(order_total),2) as avg_order_value, round(min(order_total),2) as min_order_value, round(max(order_total),2) as max_order_value
    from total_amount;


-- Customer Order Frequency
SELECT 
    order_count,
    COUNT(*) AS num_customers,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS percentage
FROM (
    SELECT 
        customer_unique_id,
        COUNT(o.order_id) AS order_count
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    WHERE o.order_status = 'delivered'
    GROUP BY customer_unique_id
) AS customer_orders
GROUP BY order_count
ORDER BY order_count;


-- RFM Base Table 
SELECT 
    c.customer_unique_id,
    DATEDIFF(
        (SELECT MAX(order_purchase_timestamp) FROM orders),
        MAX(o.order_purchase_timestamp)
    ) AS recency_days,
    COUNT(DISTINCT o.order_id) AS frequency,
    ROUND(SUM(p.payment_value), 2) AS monetary
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_unique_id;


-- Payment Method Breakdown
SELECT 
    payment_type,
    COUNT(*) AS total_transactions,
    ROUND(SUM(payment_value), 2) AS total_value,
    ROUND(AVG(payment_value), 2) AS avg_value
FROM payments
GROUP BY payment_type
ORDER BY total_transactions DESC;
