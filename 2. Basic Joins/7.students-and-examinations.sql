WITH
    ACT AS (
        SELECT student_id, s.student_name, e.subject_name
        FROM Students as s
            JOIN Examinations as e USING (student_id)
    ),
    ACT1 AS (
        SELECT *
        FROM Students
            CROSS JOIN Subjects
    )

SELECT ACT1.student_id, ACT1.student_name, ACT1.subject_name, COUNT(ACT.subject_name) as attended_exams
FROM ACT1
    LEFT JOIN ACT ON ACT1.student_id = ACT.student_id
    AND ACT1.subject_name = ACT.subject_name
GROUP BY
    ACT1.student_id,
    ACT1.subject_name,
    ACT1.student_name
ORDER BY student_id, subject_name;