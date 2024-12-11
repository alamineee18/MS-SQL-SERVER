CREATE DATABASE SQL_Traning;
USE SQL_Traning;

CREATE TABLE COUNTERS
(
	CountryID	INT,
	CountryCode CHAR(2),
	CountryName	VARCHAR(20)
);

INSERT INTO COUNTERS(CountryID, CountryCode, CountryName) VALUES (01, 'US', 'United States');

INSERT INTO COUNTERS(CountryID,CountryName, CountryCode) VALUES (01, 'Bangladesh', 'BN');

INSERT INTO COUNTERS(CountryID,CountryName, CountryCode) VALUES (03, 'Canada', 'CN');

UPDATE COUNTERS SET CountryID = 2 WHERE CountryCode = 'BN';

SELECT * FROM COUNTERS;