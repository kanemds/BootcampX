SELECT cohorts.name AS cohorts_name, COUNT(students.id) AS student_count
FROM cohorts
JOIN students ON cohorts.id = cohort_id
GROUP BY cohorts.name
HAVING COUNT(cohort_id) >=  18
ORDER BY student_count;