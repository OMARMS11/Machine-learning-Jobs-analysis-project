SELECT 
        job_id,
        job_title,
        company_dim.name,
        job_location,
        job_posted_date::DATE,
        salary_year_avg

FROM job_postings_fact
LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id

WHERE   job_title_short = 'Machine Learning Engineer' AND 
        salary_year_avg IS NOT NULL 

ORDER BY salary_year_avg DESC

LIMIT 10;
