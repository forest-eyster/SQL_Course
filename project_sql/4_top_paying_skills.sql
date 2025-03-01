/*
Question: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Foucuses on roles with specified salaries, regaurdless of location
- Why? It reveals how different skills impact salary levels for Data Analyst and help identify the most financially rewarding skills to aquire or improve.
*/

-- Query 4
SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 2) AS average_salary
FROM 
    job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY 
    average_salary DESC
LIMIT 10;