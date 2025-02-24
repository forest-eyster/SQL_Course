-- SQL Pratice Problem 6
-- For January
CREATE TABLE january_jobs AS 
	SELECT * 
	FROM job_postings_fact
	WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

-- For February
CREATE TABLE february_jobs AS 
	SELECT * 
	FROM job_postings_fact
	WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

-- For March
CREATE TABLE march_jobs AS 
	SELECT * 
	FROM job_postings_fact
	WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

-- SQL Pratice Problem 7
-- Get the number of job postings per skill for remote jobs
WITH remote_job_skills AS (
  SELECT 
		skill_id, 
		COUNT(*) as skill_count
  FROM 
		skills_job_dim AS skills_to_job
	-- only get the relevant job postings
  INNER JOIN job_postings_fact AS job_postings ON job_postings.job_id = skills_to_job.job_id
  WHERE 
		job_postings.job_work_from_home = True
		-- If you only want to search for data analyst jobs (like Luke does in the video)
		--job_postings.job_title_short = 'Data Analyst'
  GROUP BY 
		skill_id
)

-- Return the skill id, name, and count of how many times its asked for
SELECT 
	skills.skill_id, 
	skills as skill_name, 
	skill_count
FROM remote_job_skills
-- Get the skill name
INNER JOIN skills_dim AS skills ON skills.skill_id = remote_job_skills.skill_id
ORDER BY 
	skill_count DESC
LIMIT 5;

-- SQL Pratice Problem 8
SELECT
	quarter1_job_postings.job_title_short,
	quarter1_job_postings.job_location,
	quarter1_job_postings.job_via,
	quarter1_job_postings.job_posted_date::DATE
FROM
-- Gets all rows from January, February, and March job postings 
	(
		SELECT *
		FROM january_jobs
		UNION ALL
		SELECT *
		FROM february_jobs
		UNION ALL 
		SELECT *
		FROM march_jobs
	) AS quarter1_job_postings 
WHERE
	quarter1_job_postings.salary_year_avg > 70000
	--AND job_postings.job_title_short = 'Data Analyst'
ORDER BY
	quarter1_job_postings.salary_year_avg DESC;

-- delete this line later
