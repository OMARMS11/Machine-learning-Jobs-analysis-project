SELECT 
        job_title,
        company_dim.name AS company_name,
        salary_year_avg,
        skills_dim.skills

FROM job_postings_fact
LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.company_id
INNER JOIN skills_dim ON skills_dim.skill_id =  skills_job_dim.skill_id

WHERE   job_title_short = 'Machine Learning Engineer' AND 
        salary_year_avg IS NOT NULL 

ORDER BY salary_year_avg DESC

LIMIT 10