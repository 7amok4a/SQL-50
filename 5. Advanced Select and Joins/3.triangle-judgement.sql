SELECT
    x,
    y,
    z,
    CASE
        WHEN x > 0
        and y > 0
        and z > 0
        and (
            x + y > z
            and x + z > y
            and z + y > x
        ) THEN "Yes"
        ELSE "No"
    END as triangle
FROM Triangle