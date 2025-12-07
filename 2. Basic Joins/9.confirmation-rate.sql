WITH
    ACT1 AS (
        SELECT user_id, c.time_stamp, c.action
        FROM Signups as s
            LEFT JOIN Confirmations as c USING (user_id)
    )

SELECT user_id, ROUND(
        COALESCE(
            SUM(action = 'confirmed') / COUNT(action), 0
        ), 2
    ) AS confirmation_rate
FROM ACT1
GROUP BY
    user_id;