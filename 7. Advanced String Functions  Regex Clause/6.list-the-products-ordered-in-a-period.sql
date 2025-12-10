WITH
    ACT1 AS (
        SELECT
            product_id,
            DATE_FORMAT(order_date, '%Y-%m') AS order_dates,
            SUM(unit) as unit
        FROM Orders
        GROUP BY
            product_id,
            order_dates
    )

SELECT p.product_name, a.unit
FROM ACT1 as a
    JOIN Products as p USING (product_id)
WHERE
    unit >= 100
    and order_dates = "2020-02"
ORDER BY order_dates;