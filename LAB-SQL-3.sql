-- Lab | SQL Queries 3


-- How many distinct (different) actors' last names are there?

SELECT count(DISTINCT LAST_NAME)
FROM SAKILA.ACTOR;

-- In how many different languages where the films originally produced? (Use the column language_id from the film table)

SELECT count(DISTINCT LANGUAGE_ID)
FROM SAKILA.FILM;

-- How many movies were released with "PG-13" rating?

SELECT count(*)
FROM SAKILA.FILM
WHERE RATING = 'PG-13';

-- Get 10 the longest movies from 2006.

SELECT *
FROM SAKILA.FILM
WHERE RELEASE_YEAR = '2006' 
ORDER BY LENGTH DESC
LIMIT 10
;

-- How many days has been the company operating (check DATEDIFF() function)?

SELECT * FROM SAKILA.FILM;
SELECT DATEDIFF("2010-01-01", "2003-01-01");

-- Show rental info with additional columns month and weekday. Get 20.

 SELECT *, 
monthname(return_date) AS MONTH_,
CASE
	WHEN weekday(RETURN_DATE) = '0' THEN 'MONDAY'
    WHEN weekday(RETURN_DATE) = '1' THEN 'TUESDAY'
    WHEN weekday(RETURN_DATE) = '2' THEN 'WEDNESDAY'
    WHEN weekday(RETURN_DATE) = '3' THEN 'THURSDAY'
	WHEN weekday(RETURN_DATE) = '4' THEN 'FRIDAY'
    WHEN weekday(RETURN_DATE) = '5' THEN 'SATURDAY'
    WHEN weekday(RETURN_DATE) = '6' THEN 'SUNDAY'
END AS WEEKDAY_
FROM SAKILA.RENTAL
LIMIT 20;


-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

SELECT * FROM SAKILA.RENTAL;

SELECT *,
CASE
	WHEN DAYOFWEEK(RENTAL_DATE) = 1 OR DAYOFWEEK(RENTAL_DATE) = 7 THEN 'WEEKEND'
    ELSE 'WORKDAY'
    END AS DAYS_OF_THE_WEEK
    FROM SAKILA.RENTAL;
    
-- How many rentals were in the last month of activity?

SELECT COUNT(RENTAL_DATE)
FROM SAKILA.RENTAL
WHERE DATE_FORMAT(RENTAL_DATE, '%Y-%M') = '2005-JUNE';








