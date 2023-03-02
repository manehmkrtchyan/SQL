CREATE SCHEMA homework1;

DROP TABLE  IF EXISTS homework1.books;
CREATE TABLE homework1.books(
	books_id INT PRIMARY KEY,
	book_title VARCHAR(30),
	publication_year INT
)

SELECT * FROM homework1.books;

DROP TABLE IF EXISTS homework1.authors; 
CREATE TABLE homework1.authors(
	author_id INT PRIMARY KEY,
	first_name VARCHAR(15),
	last_name VARCHAR(35)
)

ALTER TABLE homework1.authors
	ADD CONSTRAINT fk_books_authors FOREIGN KEY (author_id) REFERENCES homework1.books (books_id);
	
ALTER TABLE homework1.authors ALTER last_name TYPE VARCHAR(10);


DROP TABLE IF EXISTS homework1.imdb
CREATE TABLE IF NOT EXISTS homework1.imdb (actors varchar(300),
	director varchar(50),
	duration real,
	genre varchar(100),
	imdb_rating real,
	link_ varchar(50),
	synopsis text,
	title varchar(100),
	votes decimal,
	page_url varchar(200),
	page_url_cleaned varchar(100),
	release_year decimal,
	release_month int,
	tv_series int
);	

	