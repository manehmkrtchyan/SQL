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
create table if not exists books(
	book_id int primary key,
	book_title varchar(15), 
	publication_year int
);
create table if not exists authors(
	author_id int primary key,
	first_name varchar(15),
	last_name varchar(20)
);
create table if not exists books_authors(
	book_id int not null,
	author_id int not null,
	primary key(book_id, author_id),
	foreign key (book_id) references books(book_id),
	foreign key (author_id) references authors(author_id)
);

-- 2. Increase number of characters of last_name by 10 in authors table.
alter table authors alter last_name type varchar(10);

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
create table if not exists imdb(
	actors varchar(300),
	director varchar(50),
	duration real,
	genre varchar(100),
	imdb_rating real,
	link_ varchar(50),
	synopsis text,
	title varchar(300),
	votes decimal,
	page_url varchar(100),
	page_url_cleaned varchar(100),
	release_year decimal,
	release_month int,
	tv_series int
);
copy imdb from '/Users/mane/sql/imdb.csv' csv header delimiter ',';
alter table imdb drop column link_;
alter table imdb drop column synopsis;
alter table imdb drop column page_url;
alter table imdb drop column page_url_cleaned;
alter table imdb drop column tv_series;

-- 4. Find the directors whose name starts with A.
select director from imdb where director like 'A%';

-- 5. Find all films in "comedy" genre. Can have multiple tags.
select * from imdb where genre like '%Comedy%';

-- 6. Remove the rows that have null values in release_year column.
delete from imdb where release_year is null;

-- 7. Find the films which rating is in range 7-9.
select * from imdb where imdb_rating between 7 and 9;


