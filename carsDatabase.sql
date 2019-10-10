
-- Created a database for cars.

CREATE DATABASE cars_db;
USE cars_db;

-- Created a table with 3 columns: make, model and year

CREATE TABLE favorite_cars
(
    make VARCHAR(50),
    model VARCHAR(50),
    year INT
);

-- Seeded the table with data

INSERT INTO favorite_cars (make, model, year)
VALUES 
    ('Aston Martin', 'DB5', 1964),
    ('Bugatti', 'Type 57SC Atlantic', 1936),
    ('DeLorean', 'DMC-12', 1981);

-- Wrote a query to add in three cars at once

INSERT INTO favorite_cars (make, model, year)
VALUES
    ('Austin Healey', '3000', 1959),
    ('Ferrari', '250 GTO', 1962),
    ('Shelby', 'Cobra Mk1', 1962);

-- Wrote a query to add in Prices and Colors for each of these cars

ALTER TABLE favorite_cars
	ADD price INT,
	ADD color VARCHAR(50);

-- Updated the table to include a Price and Color for each car

UPDATE favorite_cars
	SET price = 72605, color = 'Pearl' 
    WHERE make = 'Austin Healey';
    
UPDATE favorite_cars
	SET price = 70000000, color = 'Red' 
    WHERE make = 'Ferrari';
    
UPDATE favorite_cars
    SET price = 1595000, color = 'Green' 
    WHERE make = 'Shelby';
    
-- Wrote a query to put the Make and Model together in one column

SELECT CONCAT(make, ' ', model) AS 'car type' 
    FROM favorite_cars;

-- Wrote a new query that adds an additional column to the results to show how many cars have the same Make.

SELECT * ,
    (SELECT COUNT(*) 
        FROM favorite_cars
        WHERE make = c.make) AS 'count' 
        FROM favorite_cars AS c;