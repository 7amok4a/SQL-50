WITH
    ACT1 AS (
        SELECT product_id, MIN(year) AS first_year
        FROM Sales
        GROUP BY
            product_id
    )
SELECT s.product_id, s.year AS first_year, s.quantity, s.price
FROM Sales s
    JOIN ACT1 A ON s.product_id = A.product_id
    AND s.year = A.first_year;