SELECT students.name AS students_name, cohorts.name AS cohorts_name, cohorts.start_date AS cohorts_start_date, students.start_date AS students_start_data
FROM students INNER JOIN cohorts on cohorts.id = cohort_id
WHERE cohorts.start_date != students.start_date
ORDER BY cohorts_start_date