SELECT name, b.bonus
FROM Employee as e
    LEFT JOIN Bonus as b ON (e.empId = b.empId)
WHERE
    ISNULL(b.bonus)
    OR b.bonus < 1000;