-- Top clients les plus actifs sur les 12 derniers mois
-- Supposons les tables suivantes :
-- customers(id, name, segment, created_at)
-- orders(id, customer_id, status, order_date, total_amount)

SELECT
    c.id AS customer_id,
    c.name AS customer_name,
    COUNT(o.id) AS orders_count,
    SUM(o.total_amount) AS total_revenue
FROM customers c
JOIN orders o ON o.customer_id = c.id
WHERE
    o.status IN ('CONFIRMED', 'SHIPPED', 'COMPLETED')
    AND o.order_date >= (CURRENT_DATE - INTERVAL '12 months')
GROUP BY
    c.id, c.name
ORDER BY
    total_revenue DESC,
    orders_count DESC
LIMIT 20;
