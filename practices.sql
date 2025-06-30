CREATE DATABASE Practices;

USE Practices; -- Switch to the Practices database

SELECT * FROM MySQL;


--Create a table named "MySQL" with columns ID, FirstName, LastName, Address, and Salary into the "Practices" database.
CREATE TABLE MySQL (
    ID INT PRIMARY KEY,        -- Unique identifier for each record
    FirstName NVARCHAR(50),    -- First name column with a max length of 50 characters
    LastName NVARCHAR(50),     -- Last name column with a max length of 50 characters
    Address NVARCHAR(255),     -- Address column with a max length of 255 characters
    Salary DECIMAL(10, 2)      -- Salary column that accepts numbers with 2 decimal places
);


--Insert 5 rows of data into the table of your choice.
INSERT INTO MySQL (ID, FirstName, LastName, Address, Salary) 
	VALUES 
		(1, 'John', 'Doe', '123 Elm Street, Springfield', 55000.00),
		(2, 'Jane', 'Smith', '456 Oak Avenue, Metropolis', 62000.00),
		(3, 'Michael', 'Brown', '789 Pine Drive, Gotham', 58000.00),
		(4, 'Emily', 'Davis', '321 Maple Lane, Smallville', 60000.00),
		(5, 'David', 'Wilson', '654 Birch Street, Star City', 53000.00);


--Add one more "Gender" column in the "MySQL" table.
ALTER TABLE MySQL
ADD Gender NVARCHAR(10);

UPDATE MySQL
SET Gender = CASE 
    WHEN ID = 1 THEN 'Male'
    WHEN ID = 2 THEN 'Female'
    WHEN ID = 3 THEN 'Male'
    WHEN ID = 4 THEN 'Female'
    WHEN ID = 5 THEN 'Male'
    ELSE NULL -- Optional: Handle cases where ID does not match
END;