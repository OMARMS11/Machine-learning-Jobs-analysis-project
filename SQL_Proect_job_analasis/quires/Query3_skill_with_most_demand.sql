--What are the most demand skill in my role?

SELECT  skills,
        COUNT(job_postings_fact.job_id) AS job_count
        
FROM skills_job_dim

INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
INNER JOIN job_postings_fact ON skills_job_dim.job_id = job_postings_fact.job_id
WHERE job_title_short = 'Machine Learning Engineer' 

GROUP BY skills_dim.skill_id

ORDER BY job_count DESC
limit 10;





