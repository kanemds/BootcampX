const cohortName = process.argv[2];


const values = [`%${cohortName}%`];

const { Pool } = require('pg');

const pool = new Pool({
  user: 'dev',
  password:'123',
  host:'localhost',
  database:'bootcampx'
});

pool.query(`
  SELECT DISTINCT cohorts.name as cohort, teachers.name as teacher
  FROM teachers
  JOIN assistance_requests ON teacher_id = teachers.id
  JOIN students ON student_id = students.id
  JOIN cohorts ON cohort_id = cohorts.id
  WHERE cohorts.name LIKE $1
  ORDER BY teacher;
`, values)
  .then(res => {
    res.rows.forEach(user => {
      console.log(`${user.cohort}: ${user.teacher}`);
    });
  }).catch(err => console.error(`query error`,err.stack));