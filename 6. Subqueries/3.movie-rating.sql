WITH
    ACT1 AS (
        SELECT user_id, COUNT(*) AS c
        FROM MovieRating
        GROUP BY
            user_id
    ),
    ACT2 AS (
        SELECT user_id, c
        FROM ACT1
        WHERE
            c = (
                SELECT MAX(c)
                FROM ACT1
            )
    ),
    ACT3 AS (
        SELECT name
        FROM Users
            JOIN ACT2 USING (user_id)
        ORDER BY name
        LIMIT 1
    ),
    ACT4 AS (
        SELECT movie_id, AVG(rating) AS avg_rating
        FROM MovieRating
        WHERE
            created_at BETWEEN '2020-02-01' AND '2020-02-29'
        GROUP BY
            movie_id
    ),
    ACT5 AS (
        SELECT m.title AS name
        FROM ACT4 a
            JOIN Movies m USING (movie_id)
        WHERE
            a.avg_rating = (
                SELECT MAX(avg_rating)
                FROM ACT4
            )
        ORDER BY m.title
        LIMIT 1
    ),
    ACT6 AS (
        SELECT name AS results
        FROM ACT3
        UNION ALL
        SELECT name AS results
        FROM ACT5
    )
SELECT *
FROM ACT6;