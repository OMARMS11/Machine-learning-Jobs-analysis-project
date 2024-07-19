WITH skill_with_most_salary AS (
    SELECT 
            sjd.skill_id,
           
            AVG(jpf.salary_year_avg)::INt AS avg_salary

    FROM
        skills_job_dim AS sjd
    INNER JOIN skills_dim  AS sd ON sd.skill_id = sjd.skill_id
    INNER JOIN job_postings_fact AS jpf ON jpf.job_id = sjd.job_id

    WHERE   salary_year_avg IS NOT NULL 
            AND job_title_short = 'Data Analyst'
            AND job_work_from_home = TRUE
           

    GROUP BY 
            sjd.skill_id
), skill_with_most_demand AS (
    SELECT
        skills_job_dim.skill_id,
        
        COUNT(job_postings_fact.job_id) AS job_count
            
    FROM 
        skills_job_dim

    INNER JOIN 
        skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id

    INNER JOIN 
        job_postings_fact ON skills_job_dim.job_id = job_postings_fact.job_id

    WHERE
        job_title_short = 'Data Analyst' 
        AND job_work_from_home = TRUE
        AND salary_year_avg IS NOT NULL 

    GROUP BY
        skills_job_dim.skill_id

    ORDER by
        job_count DESC
)


SELECT
    skills AS skill,
    job_count,
    avg_salary

FROM 
    skill_with_most_demand 

INNER JOIN 
    skill_with_most_salary ON skill_with_most_demand.skill_id = skill_with_most_salary.skill_id
INNER JOIN
    skills_dim ON skills_dim.skill_id = skill_with_most_demand.skill_id

LIMIT 10;


