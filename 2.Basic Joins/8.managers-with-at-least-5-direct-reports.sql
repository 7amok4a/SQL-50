WITH
    ACT1 AS (
        SELECT e1.id, e1.name
        FROM Employee as e1
            JOIN Employee as e2 ON e1.id = e2.managerId
    ),
    ACT2 AS (
        SELECT name, COUNT(id) as number
        FROM ACT1
        GROUP BY
            id
    )
SELECT name
FROM ACT2
WHERE
    number >= 5;