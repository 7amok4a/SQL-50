SELECT
    e1.employee_id,
    e1.name,
    COUNT(e1.employee_id) as reports_count,
    ROUND(
        SUM(e2.age) / COUNT(e1.employee_id)
    ) as average_age
FROM Employees as e1
    JOIN Employees as e2 ON e1.employee_id = e2.reports_to
GROUP BY
    e1.employee_id
ORDER BY e1.employee_id;