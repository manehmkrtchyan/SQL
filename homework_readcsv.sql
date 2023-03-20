 -- 1. Create the following tables and check if there is no such table.
			-- Each book can have many authors, and each author can have written many books. 
			-- Create corresponding relationship between the tables.
				-- 	books table:
				-- 		book_id,
				-- 		book_title,
				-- 		publication_year

				-- 	authors table:
				-- 		author_id,
				-- 		first_name,
				-- 		last_name
CREATE TABLE if not exists books(book_id int primary key,
				  book_title varchar(50),
				  publication_year smallint)
				  
CREATE TABLE if not exists authors(author_id int primary key,
				  first_name varchar(50),
				  last_name varchar(50))
				  
CREATE TABLE authors_books (
  book_id int NOT NULL,
  author_id int NOT NULL,
  PRIMARY KEY (author_id, book_id),
  FOREIGN KEY (author_id) REFERENCES authors(author_id) ON UPDATE CASCADE,
  FOREIGN KEY (book_id) REFERENCES books(book_id) ON UPDATE CASCADE
);

-- 2. Increase number of characters of last_name by 10 in authors table.
alter table authors alter column last_name type varchar(60)
-- 3. Create imdb table with following attributes and try to add data in it from imdb.csv file.

				-- imdb table:
							-- actors,
							-- director
							-- duration
							-- genre
							-- imdb_rating
							-- title
							-- votes
							-- release_year
							-- release_month
create table if not exists imdb (actors varchar(300),
director varchar(50),
duration real,
genre varchar(100),
imdb_rating real,
link varchar(50),
synopsis text,
title varchar(300),
votes decimal,
page_url varchar(100),
page_url_cleaned varchar(100),
release_year decimal,
release_month int,
tv_series int
);	

COPY imdb FROM '/Users/levon/imdb.csv' csv header DELIMITER ',';

ALTER TABLE imdb DROP COLUMN link;
ALTER TABLE imdb DROP COLUMN synopsis;
ALTER TABLE imdb DROP COLUMN page_url
ALTER TABLE imdb DROP COLUMN page_url_cleaned
ALTER TABLE imdb DROP column tv_series
-- 4. Find the directors whose name starts with A.
select director from imdb 
where  director like 'A%'
-- 5. Find all films in "comedy" genre. Can have multiple tags.
select genre, title from imdb
where genre like '%Comedy%'
-- 6. Remove the rows that has null values in release_year column.
delete from imdb
where release_year is null
-- 7. Find the films which rating is in range 7-9
select title, imdb_rating from imdb
where imdb_rating between 7 and 9
