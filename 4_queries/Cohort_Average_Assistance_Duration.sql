SELECT AVG(total) AS average_total_duration 
  from (
    SELECT cohorts.name , SUM(completed_at - started_at) AS total
    FROM assistance_requests 
    JOIN students ON students.id = assistance_requests.student_id
    JOIN cohorts ON students.cohort_id = cohorts.id
    GROUP BY cohorts.name
  ) AS a;


