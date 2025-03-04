# Introduction

Hello, welcome to my Analysis on the 2023 job market. This analysis project foucuses on top-paying jobs, in-demand skills, and where high demand meets high salary for data analyst roles.

This analysis project was inspired by Luke Barousse and driven by my desire to find the top-paying and in-demand skills for myself and others to help navigate the data analysis job market.

- The data comes from Luke Barousse: [CSV Dataset Folder](https://drive.google.com/drive/folders/1egWenKd_r3LRpdCf4SsqTeFZ1ZdY3DNx)

- Looking for the SQL queries, check out this link: [project_sql folder](/project_sql/)

### The quetions I wanted to answer through my analysis were:
- What are the top-paying data analyst jobs?
- What skills are required for the top-paying data analyst jobs?
- What are the most in-demand skills for Data Analyst?
- What are the top skills based on salary?
- What are the most optimal skills to learn  for data analyst?



# Tools I Used
For my analysis I used these specific key tools to help improve my skills on my journey to become a data analyst:
- SQL
- PostgreSQL
- Visual Studio Code
- Tableau
- Git & GitHub 

# The Analysis
The questions that I want to answer for this analysis are to help me navigate the job market. I'm specificly looking for data analyst jobs. Here is how I approched each question:

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

Here is the breakdown to the query: 

We can see that their is a wide range of salaries among positons related to data analyst. The average highest paided job is Data Analyst coming in $650,000 a year dropping around to $184,000 a year. This shows there is significant salary potentional. 

![Top_Paying_Remote](assets/Top_Paying_Jobs_Anywhere.png)
*This graph was created in Tableau to easily visulize the query.*

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
*This graph was created in Tableau to easily visulize the query.*
### 2) What skills are required for the top-paying data analyst jobs?
### 3) What are the most in-demand skills for Data Analyst?
### 4) What are the top skills based on salary?
### 5) What are the most optimal skills to learn  for data analyst?

# What I Learned
# Conclusions
