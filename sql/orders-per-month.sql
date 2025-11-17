-- Volume de commandes et CA par mois sur les 12 derniers mois

SELECT
    DATE_TRUNC('month', o.order_date) AS month,
    COUNT(o.id) AS orders_count,
    SUM(o.total_amount) AS total_revenue
FROM orders o
WHERE
    o.status IN ('CONFIRMED', 'SHIPPED', 'COMPLETED')
    AND o.order_date >= (CURRENT_DATE - INTERVAL '12 months')
GROUP BY
    DATE_TRUNC('month', o.order_date)
ORDER BY
    month;
