SELECT ROUND(COUNT(CASE WHEN delivery_m = 'immediate' AND my_rank = 1 THEN 1 ELSE NULL END) / COUNT(DISTINCT customer_id) * 100, 2) AS immediate_percentage
FROM (
    SELECT delivery_id, customer_id, order_date, customer_pref_delivery_date AS delivery,
    CASE WHEN order_date = customer_pref_delivery_date THEN 'immediate' ELSE 'scheduled' END AS delivery_m,
    RANK() OVER (PARTITION BY customer_id ORDER BY order_date) AS my_rank
    FROM Delivery
) AS my_delivery_rank;