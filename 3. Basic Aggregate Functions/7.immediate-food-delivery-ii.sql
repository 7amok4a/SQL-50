WITH
    ACT1 AS (
        SELECT d.*
        FROM Delivery d
            JOIN (
                SELECT customer_id, MIN(order_date) AS first_order
                FROM Delivery
                GROUP BY
                    customer_id
            ) t ON d.customer_id = t.customer_id
            AND d.order_date = t.first_order
    )

SELECT ROUND(
        COUNT(*) * 100.0 / (
            SELECT COUNT(*)
            FROM ACT1
        ), 2
    ) AS immediate_percentage
FROM ACT1
WHERE
    order_date = customer_pref_delivery_date;