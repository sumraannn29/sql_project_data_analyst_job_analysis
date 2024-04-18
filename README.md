# Introduction 
Dive into the data job market! Focusing on data
analyst roles (remote), this project explores & top-paying jobs
where high demand meets high salary in data analytics.

SQL queries? Check them out here: [sql_project folder](/sql_project/)
# Background
Driven by a quest to navigate the data analyst job
market more effectively, this project was born
from a desire to pinpoint top-paid and in-demand
skills, streamlining other's work to find optimal
jobs.

I got this data set from a SQL Course by Luke Barousse. It's packed with insights on job titles, salaries, locations, and essential skills.

### The questions I wanted to answer through my SQL queries were:

1. What are the top-paying data analyst remote jobs?
2. What skills are required for these top-paying remote jobs?
3. What skills are most in demand for data analysts?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?

# Tools I Used
For my deep dive into the data analyst job market,
I harnessed the power of several key tools:

- **SQL:** The backbone of my analysis, allowing me to
query the database and unearth critical insights.
- **PostgreSQL:** The chosen database management
system, ideal for handling the job posting data.
- **Visual Studio Code:** My go-tg for database
management and executing SQL queries.
- **Git & GitHub:** Essential for version control and
sharing my SQL scripts and analysis, ensuring
collaboration and project tracking.

# The Analysis
Each query for this project aimed at investigating
specific aspects of the data analyst job market.
Here's how I approached each question:

### 1. Top Paying Data Analyst Remote Jobs
To identify the highest-paying roles, I filtered
data analyst positions by average yearly salary
and location, focusing on remote jobs. This query
highlights the high paying opportunities in the
field.
```sql
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
```
- **Salary Range and Distribution**
  - The highest average annual salary is offered by **Mantys** for a Data Analyst role at **$650,000**, which is significantly higher than the other salaries listed, suggesting a possible outlier or a highly specialized role.
  - The rest of the salaries range from **$184,000 to $336,500**, with most salaries clustering around the **$200,000 to $250,000** mark. This indicates a generally high compensation level for top remote data analyst positions but with **Mantys** as an exceptional case.

- **Company and Role Diversity**
  - The roles vary from standard Data Analyst positions to more senior roles such as Director of Analytics and Associate Director of Data Insights. Higher titles generally correlate with higher salaries, indicating the value of experience and leadership in data roles.
  - Companies like **Meta, AT&T, and SmartAsset** appear in this list, which includes both tech-focused firms and those with broader business models, showing that high-paying data analyst roles are available across various sectors.

- **Implications for Career Development**
  - The diversity in job titles suggests multiple career paths within data analytics, from hands-on analytical roles to strategic, director-level positions.
  - Investing in learning advanced analytical tools and gaining experience in data-driven decision-making could lead to opportunities in higher-paying, senior positions.
  - The widespread geographical availability (remote positions) enhances opportunities for candidates regardless of their physical location, making these roles accessible to a broader audience.
![Top paying remote data analyst jobs](/sql_project\assets\Top_Paying_Data_Analyst_Jobs_2023.png/)



*Bar graph visualizing the salary for the top 10
salaries for data analysts jobs (remote); Generated using python from my SQL query results*
```python
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Data
data = {
    "company_name": ["Mantys", "Meta", "AT&T", "Pinterest Job Advertisements", "Uclahealthcareers", "SmartAsset", "Inclusively", "Motional", "SmartAsset", "Get It Recruit - Information Technology"],
    "job_title": ["Data Analyst", "Director of Analytics", "Associate Director- Data Insights", "Data Analyst, Marketing", "Data Analyst (Hybrid/Remote)", "Principal Data Analyst (Remote)", "Director, Data Analyst - HYBRID", "Principal Data Analyst, AV Performance Analysis", "Principal Data Analyst", "ERM Data Analyst"],
    "salary_year_avg": [650000, 336500, 255829.5, 232423, 217000, 205000, 189309, 189000, 186000, 184000]
}

df = pd.DataFrame(data)

# Plotting
plt.figure(figsize=(12, 8))
sns.barplot(x='salary_year_avg', y='job_title', hue='company_name', data=df, dodge=False, palette='viridis')
plt.title('Top Paying Remote Data Analyst Jobs - 2023')
plt.xlabel('Average Yearly Salary ($)')
plt.ylabel('Job Title')
plt.legend(title='Company Name', bbox_to_anchor=(1.05, 1), loc='upper left')
plt.grid(True)


plt.savefig(r'C:\Users\sumra\OneDrive\Desktop\Top_Paying_Data_Analyst_Jobs_2023.png', bbox_inches='tight')

# Show the plot
plt.show()

# Close the figure
plt.close()
```
### 2. Skills for Top Paying Jobs

To understand what skills are required for the top-paying jobs, I joined the job postings with the skills data, providing insights into what
employers value for high-compensation roles.

```sql
WITH top_paying_jobs AS
(
SELECT
    job_id,
    cd.name AS company_name,
    job_title,
    salary_year_avg
FROM
    job_postings_fact
LEFT JOIN company_dim cd 
    ON job_postings_fact.company_id = cd.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL        
ORDER BY
    salary_year_avg DESC
LIMIT 10
)

SELECT 
    tpj.*,
    skills
FROM 
    top_paying_jobs tpj
INNER JOIN skills_job_dim sjd ON tpj.job_id = sjd.job_id
INNER JOIN skills_dim sd ON sjd.skill_id = sd.skill_id
ORDER BY
    salary_year_avg DESC
```
### Essential Skills for Top Salaries:

- **SQL, Python, and Tableau** are the most commonly required skills across these high-paying roles, appearing in 8, 7, and 6 job postings respectively. This highlights their fundamental importance in the data analytics field.
- Advanced analytical skills like **R, Snowflake, Pandas**, and familiarity with cloud services such as **Azure** and **AWS** are also in demand, demonstrating the industry's lean towards big data technologies and cloud computing.
- The prevalence of tools like **Databricks, Jupyter, Power BI**, and **Excel** suggests that data visualization, manipulation, and presentation are crucial competencies for these roles.

### Technology Diversification:

- The demand for version control and collaboration tools like **Git, Bitbucket, Atlassian suite** (Jira, Confluence), indicates the importance of collaborative development and DevOps practices even in data-centric roles.
- Knowledge of both structured and unstructured databases (SQL databases like **Oracle** and NoSQL options like **Couchbase**) is valued, pointing to varied data infrastructures in use.

### Advanced and Niche Skills:

- Specialized skills such as **Pyspark** and **Hadoop** suggest that jobs with the highest salaries require the ability to work with large-scale data processing frameworks.
- Proficiency in programming languages beyond Python and R, such as **Go (Golang)** and familiarity with software development processes, are indicative of the  of the crossover between data analysis and software engineering roles.

![skills for top paying jobs](sql_project\assets\Top_10_Skills_Frequency_Top_Paying_Data_Analyst_Jobs.png)

*Bar graph visualizing the count of skills for the top 10 paying remote jobs for data analysts; generated using python from my SQL query results*

```python
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# data from the CSV file from sql query
skills_data = pd.read_csv(r'C:\Users\sumra\OneDrive\Desktop\skills_data.csv')

# take the top 10.
skills_frequency = skills_data['skills'].value_counts().reset_index().head(10)
skills_frequency.columns = ['Skill', 'Frequency']

# Now let's plot the skills frequency for the top 10 skills.
plt.figure(figsize=(12, 8)) 
sns.barplot(x='Frequency', y='Skill', data=skills_frequency, color='blue')  # Using a single color for the bar plot.

# Adding the title and labels
plt.title('Top 10 Skills in Top-Paying Data Analyst Remote Jobs')
plt.xlabel('Frequency')
plt.ylabel('Skills')

# Saving the figure.
plt.savefig(r'C:\Users\sumra\OneDrive\Desktop\Top_10_Skills_Frequency_Top_Paying_Data_Analyst_Jobs.png')

# Displaying the plot
plt.show()
```
### 3. In-Demand Skills for Data Analysts

This query helped identify the skills most frequently requested in job postings, directing focus to areas with high demand.

```sql
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
```


1. **SQL**: Dominates the field with a demand in **7291** job postings, highlighting its status as the quintessential tool for managing and querying relational databases.

2. **Excel**: Shows enduring relevance with **4611** job postings requiring it, signifying its ubiquity and utility for a broad array of data tasks from simple to moderately complex.

3. **Python**: Emerges as a top programming language in **4330** job postings for data analysis, reflecting its powerful ecosystem and the growing trend towards automation and advanced data processing.

4. **Tableau**: Is sought after in **3745** job postings, emphasizing the need for data analysts to communicate complex data insights through intuitive visualizations.

5. **Power BI**: Rounds out the top five with **2609** job postings, showcasing the importance of interactive data visualization and business intelligence tools for decision-making and strategic planning.

| Skills  | Demand Count |
|---------|--------------|
| sql     | 92628        |
| excel   | 67031        |
| python  | 57326        |
| tableau | 46554        |
| power bi| 39468        |

*Table of the demand for the top 5 skills in data
analyst job postings*

### Strategic Insights for Job Seekers:

- Mastery of **SQL and Excel** is imperative, serving as the bedrock for a career in data analysis.
  
- Expertise in **Python** is crucial for those looking to engage in more sophisticated analytical work.

- Proficiency in **Tableau and Power BI** indicates a strong aptitude for transforming data into actionable business insights.


## 4. Skills Based on Salary

Exploring the average salaries associated with different skills revealed which skills are the highest paying.

```sql
SELECT
    skills,
    ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_location = 'Anywhere'
GROUP BY
    skills
ORDER BY
   avg_salary DESC
LIMIT 30;
```
### Analysis of Top Skills Based on Salary for Data Analyst Remote Positions:

- ### Top 10 Data Analyst Skills by Salary Analysis:

- **PySpark**: At the forefront with an average salary of **$208,172**, emphasizing the importance of big data processing in distributed environments.
  
- **Bitbucket**: Commands an average salary of **$189,155**, underscoring the significance of version control and source code management.

- **Watson & Couchbase**: Both at **$160,515**, indicating a high valuation on cognitive computing and the ability to manage unstructured data via NoSQL databases.

- **DataRobot**: With an average salary of **$155,486**, reflecting the growing demand for automated machine learning and accelerated model deployment.

- **GitLab**: A robust **$154,500** salary points to the integration of source control with CI/CD as a desirable skill set in the data field.

- **Swift**: Surprisingly on the list with **$153,750**, possibly due to data analysis within iOS ecosystems or the development of analytics tools.

- **Jupyter**: At **$152,777**, Jupyter notebooks are highlighted as a pivotal tool for interactive data science and visualization work.

- **Pandas**: The go-to Python library for data manipulation, with a commanding salary of **$151,821**, shows the necessity of efficient data transformation.

- **Golang**: Positions itself with a notable average salary of **$145,000**, reflecting its use in data pipeline and infrastructure work.

### Other Noteworthy Skills:

- Tools like **Elasticsearch, Numpy**, and **Databricks** are recognized for their roles in search analytics, numerical computing, and unified analytics, respectively.
- **Linux** continues to be relevant for systems programming, while **Kubernetes**, **Atlassian**, and **Jenkins** are sought after for skills in container orchestration, project management, and continuous integration.
- The presence of **Twilio, Airflow**, and **Scikit-learn** reveals the need for expertise in communication APIs, workflow automation, and machine learning libraries.
- The inclusion of database technologies like **PostgreSQL, GCP, MicroStrategy**, and **Hadoop** reflects the diverse ecosystem wherein data analysts operate.

The analysis underscores a clear trend: expertise in big data technologies, data science automation, and a robust technical infrastructure correlates with the highest salary offerings in the field of Data Analytics.


| Rank | Skill      | Average Salary |
|------|------------|----------------|
| 1    | PySpark    | $208,172       |
| 2    | Bitbucket  | $189,155       |
| 3    | Watson     | $160,515       |
| 4    | Couchbase  | $160,515       |
| 5    | DataRobot  | $155,486       |
| 6    | GitLab     | $154,500       |
| 7    | Swift      | $153,750       |
| 8    | Jupyter    | $152,777       |
| 9    | Pandas     | $151,821       |
| 10   | Golang     | $145,000       |

*Table of the average salary for the top 10 paying skills for data analysts*

## 5. Most Optimal Skills to Learn

Combining insights from demand and salary data, this query aimed to pinpoint skills that are both in high demand and have high salaries,
offering a strategic focus for skill development.

```sql
WITH skills_demand AS 
(
    SELECT
        sd.skill_id,
        sd.skills AS demand_skills,
        COUNT(sjd.job_id) AS demand_count
    FROM 
        job_postings_fact jpf
    INNER JOIN skills_job_dim sjd ON jpf.job_id = sjd.job_id
    INNER JOIN skills_dim sd ON sjd.skill_id = sd.skill_id
    WHERE
        jpf.job_title_short = 'Data Analyst' AND
        jpf.salary_year_avg IS NOT NULL AND
        jpf.job_location = 'Anywhere'
    GROUP BY
        sd.skill_id, sd.skills
), 
average_sal AS 
(
    SELECT
        sjd.skill_id,
        sd.skills AS salary_skills,
        ROUND(AVG(jpf.salary_year_avg),0) AS avg_salary
    FROM 
        job_postings_fact jpf
    INNER JOIN skills_job_dim sjd ON jpf.job_id = sjd.job_id
    INNER JOIN skills_dim sd ON sjd.skill_id = sd.skill_id
    WHERE
        jpf.job_title_short = 'Data Analyst' AND
        jpf.salary_year_avg IS NOT NULL AND
        jpf.job_location = 'Anywhere'
    GROUP BY
        sjd.skill_id, sd.skills
)

SELECT
    sd.skill_id,
    sd.demand_skills,
    sd.demand_count,
    sal.avg_salary
FROM
    skills_demand sd
INNER JOIN average_sal sal ON sd.skill_id = sal.skill_id
WHERE 
    sd.demand_count>10
ORDER BY
    sal.avg_salary DESC,
    sd.demand_count DESC
LIMIT 25;
```

| skill_id | demand_skills | demand_count | avg_salary |
|----------|---------------|--------------|------------|
| 8        | go            | 27           | 115320     |
| 234      | confluence    | 11           | 114210     |
| 97       | hadoop        | 22           | 113193     |
| 80       | snowflake     | 37           | 112948     |
| 74       | azure         | 34           | 111225     |
| 77       | bigquery      | 13           | 109654     |
| 76       | aws           | 32           | 108317     |
| 4        | java          | 17           | 106906     |
| 194      | ssis          | 12           | 106683     |
| 233      | jira          | 20           | 104918     |

*Table of most optimal skills for data analyst stored by salary*
# What I Learned

- The process of combining SQL query results with data visualization techniques has reinforced the idea that **data storytelling** is as important as data extraction.
  
- The **interconnectivity of various technologies** within the data field was a significant learning point, highlighting the importance of having a broad skill set that covers different aspects of data handling and analysis.
  
- Through the exploration of the data, it became clear that there is a distinct correlation between the specialization of skills and salary potential. The **value of expertise** in specific high-tech areas such as big data, cloud computing, and machine learning has been underscored.
  
- Understanding market trends and aligning skill development with those trends is crucial. This project has shown that the **job market is dynamic**, and data analysts need to continually adapt and upgrade their skills.

# Conclusions

- The job market for data analysts is rapidly evolving, with a clear demand for skills that support big data and data science applications. It's evident that professionals with advanced analytics and programming skills can command higher salaries.

- Skills like **SQL** and **Python** remain fundamental, but to differentiate and command top salaries, data analysts should consider developing proficiency in specialized technologies like **PySpark**, **DataRobot**, and **Elasticsearch**.

- There's an emerging pattern where analytical skills coupled with **DevOps** and **software development practices** are increasingly sought after. This reflects a trend where data analysts are expected to participate not just in analysis but also in the deployment and operationalization of data solutions.

- For those looking to enter the field or aiming to progress their careers, the analysis suggests that investing in learning and development across a variety of high-demand and high-salary skills will likely offer the greatest return on investment and job security.

The findings from this project can serve as a guide for data analysts in prioritizing skill acquisition and provide insights for educational institutions in shaping data analytics curricula that are aligned with market needs.
