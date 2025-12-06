WITH
    ACT AS (
        SELECT
            machine_id,
            process_id,
            a1.activity_type as start_type,
            SUM(a1.timestamp) as s1,
            a2.activity_type as end_type,
            SUM(a2.timestamp) as s2,
            COUNT(machine_id) as c
        FROM Activity as a1
            JOIN Activity as a2 USING (machine_id, process_id)
        WHERE (
                a1.activity_type = 'start'
                and a2.activity_type = 'end'
            )
        GROUP BY
            machine_id
    )

SELECT machine_id, round(avg(s2 - s1) / c, 3) as processing_time
FROM ACT
GROUP BY
    machine_id;