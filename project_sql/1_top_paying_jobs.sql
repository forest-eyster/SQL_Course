/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely.
- Focused on job postings specified salaries (remove nulls).
- Why? Highlight the top-paying opportunities for Data Analyst, offering insight into employment optionsand location flexibility.
*/

-- Query 1
SELECT
    job_id,
    company_dim.name AS company_name,
    job_title,
    job_location,
    salary_year_avg,
    job_posted_date
FROM
    job_postings_fact
        LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' 
    AND job_location = 'Anywhere' -- remote
    -- AND job_location LIKE '%, FL' -- local
    AND salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;