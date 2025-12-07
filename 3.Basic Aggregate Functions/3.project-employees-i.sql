WITH
    ACT AS (
        SELECT project_id, employee_id, e.name, e.experience_years
        FROM Project as p
            JOIN Employee as e USING (employee_id)
    )

SELECT project_id, ROUND(AVG(experience_years), 2) as average_years
FROM ACT
GROUP BY (project_id);