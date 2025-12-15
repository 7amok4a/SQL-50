WITH
    ACT1 AS (
        SELECT d.*
        FROM Activity d
            JOIN (
                SELECT player_id, MIN(event_date) AS first_order
                FROM Activity
                GROUP BY
                    player_id
            ) t ON d.player_id = t.player_id
            AND d.event_date = DATE_ADD(t.first_order, INTERVAL 1 DAY)
    )

SELECT ROUND(
        COUNT(*) * 1.0 / (
            SELECT COUNT(DISTINCT player_id)
            FROM Activity
        ), 2
    ) as fraction
FROM ACT1;