SELECT conname AS constraint_name,
conrelid::regclass AS table_name,
pg_get_constraintdef(c.oid) AS constraint_def
FROM pg_constraint c
WHERE contype = 'f' -- p, c, u
ORDER BY conname;

select * from universities.country 
select * from universities.ranking_criteria
select * from universities.ranking_system
select * from universities.university 
select * from universities.university_ranking_year
select * from universities.university_year

-- 1. Find all universities in USA and China. The result
-- should have two columns university and country.
-- First should be listed the universities in USA.
select university_name, country_name
from universities.university
join universities.country 
on country.id = university.country_id
where country_name in ('China', 'United States of America', 'Uruguay')
order by country_name = 'United States of America' desc 

-- 2. Find all time top 10 universities with the most number of students. 
-- The result should be sorted from highest to lowest number of students.
select university_name, sum(num_students) as total
from universities.university 
join universities.university_year
on university.id = university_year.university_id
group by university_name 
order by total desc 
limit 10

-- 3. Find the university name that had the most 
-- international students in 2016. The result should show 
-- the university name and the percentage of international students.
select university_name, pct_international_students 
from universities.university
join universities.university_year
on university.id = university_year.university_id
where year = 2016 
order by (pct_international_students * num_students) / 100.0 desc
limit 1

-- 4. Select the universities,  with their  highest
-- ever value of male percentage among students.
-- Show the result without null values.
select university_name, sum(pct_female_students)
from universities.university
join universities.university_year
on universities.university_year.university_id = universities.university.id
group by university_name
having sum(pct_female_students) is not null

-- 5. List top 3 countries that have the most ranked universities along with 
-- the number of universities.
select country_name, count(university_name)
from universities.country
join universities.university
on universities.university.country_id = universities.country.id
group by country_name
order by count(university_name) desc
limit 3

-- 6. Create view that will show the name of the universities along with their score in 2016.
create view uni_scores  as
select university_name, score
from universities.university
join universities.university_ranking_year
on universities.university.id = universities.university_ranking_year.university_id 

select * from uni_scores

-- 7. Set the column name of score as universite_score in the view
alter view uni_scores rename column scores to university_score
select * from uni_scores

-- 8. Show all criterias for Center for World University Rankings system.
select criteria_name
from universities.ranking_criteria
join universities.ranking_system
on universities.ranking_system.id = universities.ranking_criteria.ranking_system_id
where system_name = 'Center for World University Rankings'

