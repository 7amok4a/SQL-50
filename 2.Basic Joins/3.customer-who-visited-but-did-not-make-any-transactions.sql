SELECT customer_id, COUNT(visit_id) as count_no_trans
FROM Visits as v
    LEFT JOIN Transactions as t USING (visit_id)
WHERE
    ISNULL(t.transaction_id)
GROUP BY
    customer_id;

--by window function
SELECT DISTINCT
    customer_id,
    COUNT(visit_id) over (
        partition by
            customer_id
    ) as count_no_trans
FROM Visits as v
    LEFT JOIN Transactions as t USING (visit_id)
WHERE
    ISNULL(t.transaction_id);

-- order to write  of sql statment
-- SELECT
-- FROM
-- JOIN
-- WHERE
-- GROUP BY
-- ORDER BY

-- ✔ الترتيب الحقيقي لتنفيذ الاستعلام (منطقياً)

-- 1️⃣ FROM
-- 2️⃣ JOIN (وتطبيق شروط الربط ON/USING)
-- 3️⃣ WHERE
-- 4️⃣ GROUP BY
-- 5️⃣ SELECT
-- 6️⃣ ORDER BY