SELECT 
        sd.skills AS skill,
        AVG(jpf.salary_year_avg)::INt AS avg_salary

FROM
    skills_job_dim AS sjd
INNER JOIN skills_dim  AS sd ON sd.skill_id = sjd.skill_id
INNER JOIN job_postings_fact AS jpf ON jpf.job_id = sjd.job_id

WHERE   salary_year_avg IS NOT NULL 
        AND job_title_short = 'Machine Learning Engineer'
        

GROUP BY 
        sd.skills

ORDER BY
      avg_salary DESC 
