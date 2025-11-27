/* What are the most in-demand skills for data analysis?
  - Identify the top 5 in-demand skills for a data analyst
  - Include and focus on all job postings (not only remote job postings and all roles)
  - It will retrieve the top 5 skills with the highest demand in the job market,
    providing insights into the most valuable skills for job seekers.
*/



SELECT
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5




WITH remote_job_skills AS (
    SELECT
        skill_id,
        COUNT(*) as skill COUNT
    FROM
        skills_job_dim AS skills_to_job
    INNER JOIN job_postings_fact AS job_postings ON
    WHERE
        job_postings.job_work_from_home = True AND
        job_postings.job_title_short = 'Data Analyst'
    GROUP BY
        skill_id
        
)

SELECT
    skills.skill_id,
    skills AS skill_name,
    skill_count
FROM remote_job_skills
INNER JOIN skills_dim AS skills ON skills.skill_id = company_id
ORDER BY
    skill_count DESC
LIMIT 5;

/* To sum up, the query helped to identify top 5 most in demand skills in 2023 overall are: SQL, Python, AWS, AZURE and R but
for Data Analyst role skills are: SQL, Excel, Python,Tableau and Power Bi

[
  {
    "skills": "sql",
    "demand_count": "92628"
  },
  {
    "skills": "excel",
    "demand_count": "67031"
  },
  {
    "skills": "python",
    "demand_count": "57326"
  },
  {
    "skills": "tableau",
    "demand_count": "46554"
  },
  {
    "skills": "power bi",
    "demand_count": "39468"
  }
] */