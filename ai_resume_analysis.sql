USE test;
SELECT * FROM test.ai_resume_screening;

#Identiying the success rate is important. TO get knowing how many people are shortlisted at the beginning!
SELECT 
    shortlisted, 
    COUNT(*) AS total_count,
    (COUNT(*) /(SELECT COUNT(*) FROM `test`.`ai_resume_screening`)) * 100 AS percentage
FROM `test`.`ai_resume_screening`
GROUP BY shortlisted;
-- 69.8% CANDIATES HAVE BEEN SHORTLISTED


#And also identifying shortlisting criteras in various aspects
SELECT 
    shortlisted,
    AVG(years_experience) AS avg_exp,
    AVG(skills_match_score) AS avg_skills,
    AVG(project_count) AS avg_projects,
    AVG(github_activity) AS avg_github
FROM `test`.`ai_resume_screening`
GROUP BY shortlisted;
-- Based on the provided results, 
-- THE SELECTED CANDIDATES AVERAGIING 9 YEARS OF EXPERIENCE, WHILE REJECTED BEING AROUND 2 TO 3 YEARS
-- HAVING AROUND 79 SKILLS TO AROUND 60 WHICH ARE REJECTED
-- 12 PROJECTS COMPARED TO 6 WHICH ARE REJECTED
-- ASTONISHING GITHUB IMPRESSIONS AROUND 400, WHILE REJECTED AVERAGING 150


#Finding out some of the elite candidates 
Select AVG(github_activity), avg(project_count)
from ai_resume_screening
where years_experience>10 and shortlisted = 'yes';
-- AVEREAGE GITHUB ACTIVITY OF SHORLISTED 10 YEARS EXPERIENCE IS 484
-- AND THEIR PROJECT COUNT IS ESTIMATED AROUND 14

#Skills scores
select education_level, avg(skills_match_score) as skills_by_education
from ai_resume_screening
where project_count >=5
group by education_level
-- BASED ON THE OBTAINED RESULTS, PHD CANDIDATES HAVE MORE SKILLS FOLLOWED BY MASTERS, BACHELORS 

#Gap analysis
SELECT *
FROM `test`.`ai_resume_screening`
WHERE education_level = 'Masters'
  AND skills_match_score > 80
  AND shortlisted = 'No'
ORDER BY years_experience DESC;
--  It seems the AI "punishes" highly skilled candidates if they don't have proof of work on GitHub. 
-- The AI might be rejecting candidates if their resume is too "thin" (150) or too "bloated" (800+), even if they are geniuses. 

Select shortlisted, avg(resume_length)
from test.ai_resume_screening
group by shortlisted;
-- If the average "Yes" resume is 633 and the average "No" is only 430, this AI isn't just looking for skills—it is biased toward longer resumes.
--  In the recruiting world, this is a "hidden pattern" where the machine equates quantity of text with quality of candidate.


select education_level, avg(github_activity) as avg_github
from test.ai_resume_screening
where shortlisted = 'Yes'
group by education_level;
-- In the world of Data Science, you just discovered a "Feature Invariance." 
-- This means the AI doesn't care if you have a PhD or just High School; if you want to be shortlisted, it expects your portfolio activity.


select count(*)
from ai_resume_screening
where project_count<5
and shortlisted = 'Yes'
-- This tells us that while 5 projects isn't a "hard" rule that breaks the system, it is a very high hurdle. The AI clearly prefers candidates with a larger portfolio.


#Diving deep using subqueries

Select
 avg(skills_match_score) as rule_breaker_skills,
(select avg(skills_match_score) from ai_resume_screening) as global_avg_score
from ai_resume_screening
where project_count <5
and shortlisted = 'yes';
-- The "Rule Breakers" (those with < 5 projects) have an average skill score of ~78.7, while the general average is only ~73.7.
--  This 5-point jump proves that the AI essentially says: "If you have a small portfolio, your skills better be significantly higher than average to get a 'Yes'."


#Competitive Ranking

Select * from
 (SELECT 
    education_level, 
    skills_match_score,
    years_experience,
    ROW_NUMBER() OVER(
        PARTITION BY education_level 
        ORDER BY skills_match_score DESC) as rank_number
        from ai_resume_screening
    ) as ranked_table
where rank_number = 1;
-- The AI is a "Skills First" machine.
-- Even the High School candidate and the PhD candidate both hit a perfect 100 score. This shows that the scoring system itself is objective—it allows anyone from any background to reach the top.

#Final query for elite comparison
SELECT
	education_level,
    skills_match_score as winner_score,
    group_avg,
    (skills_match_score - group_avg) as gap_to_average
FROM (
	SELECT
		education_level,
        skills_match_score,
        -- The Ranker
        Row_Number() Over(Partition by education_level order by skills_match_score desc) as rn,
        avg(skills_match_score) over(partition by education_level) as group_avg
        from ai_resume_screening
        ) as final_table
        where rn = 1;
-- The High School winner is a true "Outlier." They are 31.7 points above their peers, while the PhD winner is only 21 points above theirs.
-- In this AI system, it is much harder to be a "Super Good" if you only have a High School degree. You have to work almost 50% harder than a PhD to stand out from the crowd! 









