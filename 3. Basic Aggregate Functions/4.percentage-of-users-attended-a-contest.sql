SELECT contest_id, ROUND(
        (
            COUNT(user_id) / @x := (
                SELECT COUNT(*)
                FROM Users
            )
        ) * 100, 2
    ) as percentage
FROM Register
GROUP BY
    contest_id
ORDER BY percentage DESC, contest_id;