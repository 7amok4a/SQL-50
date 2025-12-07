SELECT p.product_name, s.year, s.price
FROM Sales as s
    INNER JOIN Product as p USING (product_id);