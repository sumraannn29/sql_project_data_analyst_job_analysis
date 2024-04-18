/*
Question: What are the most in-demand skills for data analysts?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market,
providing insights into the most valuable skills for job seekers.
*/

SELECT
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;

/*

[
  {
    "skill_id": 0,
    "skill_name": "sql",
    "skill_count": "7291"
  },
  {
    "skill_id": 181,
    "skill_name": "excel",
    "skill_count": "4611"
  },
  {
    "skill_id": 1,
    "skill_name": "python",
    "skill_count": "4330"
  },
  {
    "skill_id": 182,
    "skill_name": "tableau",
    "skill_count": "3745"
  },
  {
    "skill_id": 183,
    "skill_name": "power bi",
    "skill_count": "2609"
  }
]

*/