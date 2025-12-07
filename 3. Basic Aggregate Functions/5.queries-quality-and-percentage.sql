WITH
    ACT1 AS (
        SELECT query_name, result, position, SUM(rating / position) as rp, COUNT(query_name) as cn
        FROM Queries
        GROUP BY
            query_name
    ),
    ACT2 AS (
        SELECT query_name, COUNT(rating) as rc
        FROM Queries
        WHERE
            rating < 3
        GROUP BY
            query_name
    )

SELECT
    ACT1.query_name,
    ROUND(ACT1.rp / ACT1.cn, 2) as quality,
    COALESCE(
        ROUND((ACT2.rc / ACT1.cn) * 100, 2),
        0
    ) as poor_query_percentage
FROM ACT1
    LEFT JOIN ACT2 USING (query_name);