-- 1. Find all universities in USA and China. The result
-- should have two columns university and country.
-- First should be listed the universities in USA.
select country_name,university_name from universities.university  as un
left join universities.country con 
on un.country_id = con.id
where country_name in ('United States of America','China')
order by country_name = 'United States of America' desc


-- 2. Find all time top 10 universities with the most number of students. 
-- The result should be sorted from highest to lowest number of students.
select university_name,sum(num_students) as number_of_students from universities.university_year  as yea
left join universities.university un 
on un.id = yea.university_id
group by un.university_name
order by number_of_students desc


-- 3. Find the university name that had the most 
-- international students in 2016. The result should show 
-- the university name and the percentage of international students.

-- as university_id is not unique I count the sum of the percentage
select university_name,year,sum(pct_international_students) as per_of_int_students 
from universities.university_year  as yea
left join universities.university un 
on un.id = yea.university_id
where year = '2016'
group by un.university_name,yea.year
order by number_of_students desc

-- 4. Select the universities,  with their  highest
-- ever value of male percentage among students.
-- Show the result without null values.
select university_name, sum(pct_female_students) as per_of_female_students 
from universities.university_year  as yea
left join universities.university un 
on un.id = yea.university_id
group by un.university_name
having sum(pct_female_students) is not null

-- 5. List top 3 countries that have the most ranked universities along with 
-- the number of universities.


SELECT con.country_name, count(con.id) AS number_of_universities 
FROM universities.university AS un
LEFT JOIN universities.country AS con ON un.country_id = con.id
GROUP BY con.country_name
ORDER BY number_of_universities DESC
LIMIT 3;

 

-- 6. Create view that will show the name of the universities along with their score in 2016.

create view University_scores as
SELECT un.university_name, yea_r.year,yea_r.score
FROM universities.university AS un
LEFT JOIN universities.university_ranking_year AS yea_r ON yea_r.university_id = un.id
where yea_r.year = '2016'

select * from University_scores

-- 7. Set the column name of score as universite_score in the view
ALTER VIEW University_scores RENAME COLUMN score TO universite_score;

-- 8. Show all criterias for Center for World University Rankings system.

select system_name,criteria_name
from universities.ranking_system as rank_s
join universities.ranking_criteria rank_k
on rank_s.id = rank_k.ranking_system_id
where system_name = 'Center for World University Rankings'



select * from universities.ranking_system
select * from universities.ranking_criteria
select * from universities.university
select * from universities.university_year
select * from universities.country
select * from universities.university_ranking_year

SELECT conname AS constraint_name,
conrelid::regclass AS table_name,
pg_get_constraintdef(c.oid) AS constraint_def
FROM pg_constraint c
WHERE contype = 'f' -- p, c, u
ORDER BY conname;

