USE MyDataBase;
SELECT *
FROM customers;

SELECT *
FROM orders;

SELECT 123 AS Static_number
----create table
CREATE TABLE person(
	id INT NOT NULL,
	person_name VARCHAR(50) NOT NULL,
	birth_date DATE,
	phone VARCHAR(15) NOT NULL,
	CONSTRAINT pk_persons PRIMARY KEY (id)
)

--add new columan to a table 
ALTER TABLE person
ADD email VARCHAR(50) NOT NULL

SELECT *
FROM person

--insert new data in a table
INSERT INTO customers(id, first_name, country, score)
VALUES 
  (6, 'Anna', 'USA', 0),
  (7, 'Sam', NULL, 100),
  (8, 'USA', 'Max', NULL),
  (9, 'Andreas', 'Germany', NULL),
  (10, 'Sahra', NULL, NULL);

-- update a value in a table
UPDATE customers
SET score = 0,
    country = 'UK'
WHERE id = 10;

-- Function
SELECT 
	first_name,
	country,
	CONCAT(first_name, ' ', country) AS NameCountry,
	UPPER(first_name) AS upName,
	LOWER(first_name) AS lowName
FROM customers;

SELECT 
	first_name,
	LEN(first_name) AS NameLen,
	TRIM(first_name) AS trimName,
	LEN(TRIM(first_name)) AS lenTrimName,
	LEFT(TRIM(first_name), 2) AS fristTWOchr,
	RIGHT(TRIM(first_name), 2) AS lastTWOchr
FROM customers;