WITH
    ATC AS (
        SELECT p.product_id, p.price, u.units
        FROM Prices as p
            LEFT JOIN UnitsSold as u ON p.product_id = u.product_id
            and u.purchase_date BETWEEN p.start_date AND p.end_date
    )

SELECT product_id, IFNULL(
        ROUND(
            SUM(price * units) / SUM(units), 2
        ), 0
    ) as average_price
FROM ATC
GROUP BY (product_id);



-- another

WITH
    ATC AS (
        SELECT p.product_id, p.price, u.units
        FROM Prices as p
            LEFT JOIN UnitsSold as u ON p.product_id = u.product_id
            and u.purchase_date BETWEEN p.start_date AND p.end_date
    )

SELECT product_id, COALESCE(
        ROUND(
            SUM(price * units) / SUM(units), 2
        ), 0
    ) as average_price
FROM ATC
GROUP BY (product_id);