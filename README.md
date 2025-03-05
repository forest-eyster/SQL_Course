# Introduction

Hello, welcome to my Analysis on the 2023 job market. This analysis project focuses on top-paying jobs, in-demand skills, and where high demand meets high salary for data analyst roles.

This analysis project was inspired by Luke Barousse and driven by my desire to find the top-paying and in-demand skills for myself and others to help navigate the data analysis job market.

- The data comes from Luke Barousse: [CSV Dataset Folder](https://drive.google.com/drive/folders/1egWenKd_r3LRpdCf4SsqTeFZ1ZdY3DNx)

- Looking for the SQL queries, check out this link: [project_sql folder](/project_sql/)

### The questions I wanted to answer through my analysis were:
- What are the top-paying data analyst jobs?
- What skills are required for the top-paying data analyst jobs?
- What are the skills most in demand by a data analyst?
- What are the top skills based on salary?
- What are the most optimal skills to learn for a data analyst?


# Tools I Used
For my analysis, I used these specific key tools to help improve my skills on my journey to become a data analyst:
- SQL
- PostgreSQL
- Visual Studio Code
- Tableau
- Git & GitHub

# The Analysis
The questions that I want to answer for this analysis are to help me navigate the job market. I'm specifically looking for data analyst jobs. Here is how I approached each question:

### 1) What are the top-paying data analyst jobs?
To identify the top-paying jobs, I queried the average yearly salary, and filtered the location. Once by remote jobs and second by my local location, I live in Florida.

Below are the queries:
``` sql
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
    AND salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;
```
*This query is filtering the top 10 jobs for only data analyst and remote positions.*

![Top_Paying_Remote](assets/Top_Paying_Jobs_Anywhere.png)
*This graph was created in Tableau to easily visualize the query.*

Here is the breakdown of the query:

We can see that there is a wide range of salaries among positions related to data analyst. The average highest paid job is Data Analyst, coming in at $650,000 a year, dropping around to $184,000 a year. This shows there is significant salary potential. There is also a wide range of data analyst roles such as Director of Analytics, Marketing Data Analyst, and even ERM Data Analyst. There is a lot of exploring for a data analyst.

Now let's switch the filter to help me locally. To do that, I only need to change the job comparison to look for cities in Florida.

``` sql
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
    AND job_location LIKE '%, FL' -- local
    AND salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;
```
*This query is filtering the top 10 jobs for only data analyst and local positions to me.*

![Top_Paying_Remote](assets/Top_Paying_Jobs_Florida.png)
*This graph was created in Tableau to easily visualize the query.*

Here is the breakdown of the query:

For this query we have a dramatic change. The new highest yearly salary average is $375,000 to $150,000. This is because we are looking at a specified location instead of anywhere. So if I want a higher yearly salary, I would need to look outside of Florida. There is still a wide variety of jobs from the Head of Infrastructure and Management & Data Analysis to Mid-Level BI Analyst.

### 2) What skills are required for the top-paying data analyst jobs?

To find the required skills for the highest-paying job, I need to join more datasets. I already know the highest-paying jobs and will keep it as a subquery for my new query. I need to filter the different skills associated with these highest paying jobs.

Below are the queries:

``` sql
WITH top_paying_jobs AS(
    SELECT
        job_id,
        company_dim.name AS company_name,
        job_title,
        salary_year_avg
    FROM
        job_postings_fact
        LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst'
        AND job_location = 'Anywhere' -- remote
        AND salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills_dim.skills
FROM 
    top_paying_jobs
    INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;
```

![Top_Skills_Remote](assets/Skill_Count_TPJ_Remote.png)
*This graph was created in Tableau to visualize the skill count for the highest paying remote jobs.*

Here is the breakdown of the query:

We can see from the query that SQL, Python, and Tableau are the top three skills that are used for the highest-paying jobs. SQL is used in eight of the jobs that are in the top ten highest paying jobs. This makes SQL a highly valued skill as a data analyst. Following the top three skills, we have R, Snowflake, Pandas, and Excel. These are important skills, but just not as highly valued.

Now I want to change focus on location again.

```sql
WITH top_paying_jobs AS(
    SELECT
        job_id,
        company_dim.name AS company_name,
        job_title,
        salary_year_avg
    FROM
        job_postings_fact
        LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst'
        AND job_location LIKE '%, FL' -- local
        AND salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills_dim.skills
FROM 
    top_paying_jobs
    INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;
```

![Top_Skills_Florida](assets/Skill_Count_TPJ_Florida.png)
*This graph was created in Tableau to visualize the skill count for the highest paying Florida jobs.*

Here is the breakdown of the query:

In this query, there is a less skill count. The top skills are SQL, Excel, Tableau, and Oracle. The following skills are Word, SQL Server, and Flow. With this, we can see a slight skill change focus by location. However, SQL and Tableau are essential skills in the highest-paying jobs in Florida.

### 3) What are the skills most in demand by a data analyst?
### 4) What are the top skills based on salary?
### 5) What are the most optimal skills to learn for a data analyst?

# What I Learned
# Conclusions
