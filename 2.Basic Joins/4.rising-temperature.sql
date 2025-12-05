WITH
    X AS (
        SELECT
            id,
            temperature,
            recordDate,
            lag(temperature) OVER (
                ORDER BY recordDate
            ) AS prev_temp,
            lag(recordDate) OVER (
                ORDER BY recordDate
            ) AS prev_day
        FROM Weather
    )
SELECT id
FROM X
WHERE
    prev_temp IS NOT NULL
    AND DATEDIFF(recordDate, prev_day) = 1
    AND temperature > prev_temp;