/*
Question: What are the top-paying data analyst jobs?
--Identify the top 10 highest-paying Data Analyst roles that are available remotely.
--Focuses on job postings with specified salaries (remove nulls).
--Why? Highlight the top-paying opportunities for Data Analysts
*/

SELECT
    job_id,
    cd.name AS company_name,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM
    job_postings_fact
LEFT JOIN company_dim cd 
    ON job_postings_fact.company_id = cd.company_id
WHERE
    job_title_short = 'Data Analyst' 
    AND job_location = 'Anywhere'   
    AND salary_year_avg IS NOT NULL        
ORDER BY
    salary_year_avg DESC
LIMIT 10        

/*

--Mantys is offering a Data Analyst role with the highest salary on the list, averaging $650,000 per year.
--Meta has a Director of Analytics role listed with a yearly average salary of $336,500.
--AT&T is looking for an Associate Director- Data Insights, offering $255,829.5 per year.
--Pinterest Job Advertisements is searching for a Data Analyst, Marketing, with a salary of $232,423.
--Uclahealthcareers lists a Data Analyst (Hybrid/Remote) position with an average salary of $217,000.
--SmartAsset has a Principal Data Analyst (Remote) role with a salary of $205,000.
--Inclusively offers a Director, Data Analyst - HYBRID position at $189,309 per year.
--Motional seeks a Principal Data Analyst, AV Performance Analysis with a salary of $189,000.
--Another role by SmartAsset for a Principal Data Analyst offers $186,000.
--Get It Recruit - Information Technology is looking for an ERM Data Analyst with an average salary of $184,000.

[
  {
    "job_id": 226942,
    "company_name": "Mantys",
    "job_title": "Data Analyst",
    "salary_year_avg": "650000.0"
  },
  {
    "job_id": 547382,
    "company_name": "Meta",
    "job_title": "Director of Analytics",
    "salary_year_avg": "336500.0"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5"
  },
  {
    "job_id": 99305,
    "company_name": "Pinterest Job Advertisements",
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0"
  },
  {
    "job_id": 1021647,
    "company_name": "Uclahealthcareers",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0"
  },
  {
    "job_id": 310660,
    "company_name": "Motional",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0"
  },
  {
    "job_id": 1749593,
    "company_name": "SmartAsset",
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0"
  },
  {
    "job_id": 387860,
    "company_name": "Get It Recruit - Information Technology",
    "job_title": "ERM Data Analyst",
    "salary_year_avg": "184000.0"
  }
]
*/