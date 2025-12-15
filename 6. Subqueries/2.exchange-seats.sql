SELECT
    id,
    CASE
        WHEN id % 2 = 0 THEN LAG(student) OVER (
            ORDER BY id
        )
        WHEN id % 2 <> 0
        AND LEAD(student) OVER (
            ORDER BY id
        ) IS NULL THEN student
        ELSE LEAD(student) OVER (
            ORDER BY id
        )
    END AS student
FROM Seat