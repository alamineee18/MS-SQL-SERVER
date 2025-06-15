SELECT TOP (1000) [id]
      ,[first_name]
      ,[country]
      ,[score]
  FROM [MyDataBase].[dbo].[customers]


SELECT *
FROM customers
WHERE country = 'Germany'

SELECT *
FROM orders;

SELECT 123 AS Static_number

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


UPDATE customers
SET score = 0,
    country = 'UK'
WHERE id = 10;