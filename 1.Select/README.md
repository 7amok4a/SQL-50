# Select Statment and helper 

- ***to read data and print it***
- `AS` -> use to make alias (for column name) 
- `LIKE` -> use to compare string values 
- `% , _` -> `%` : 0 -> n  ,  `_` : 1
- `COLLATE` -> character sets and collations  
```sql
SELECT 1 + 1 ;  -- print  -> 2 
SELECT 'Hello SQL' ; -- print -> Hello SQL
SELECT "My" , "name" , "ahmed" , 22 ; 
SElECT 1 AS number ; 
SELECT "'ahmed'" ; -- embed different qoutes  print-> 'ahmed' 
SELECT "\'ahmed\'" ; -- escape '' 
SELECT 1 = 2 ; 
SELECT 1 <> 2 ; -- can use != 
SELECT "ahmed" LIKE "%m%" ; 
SELECT "ahmed" LIKE "_hme_" ; 

-- built in function 
SELECT ABS(-5) ; -- 5
SELECT ASCII('a') ; -- askcode for a 97 
SELECT CHAR(97) ; -- a 

-- data and time 
SELECT ADDDATE('2022-12-08' , 24) ;  -- add 24 day 
SELECT DAY('2022-12-08') , DAYNAME('2022-12-08'), 
	MONTH('2022-12-08') , MONTHNAME('2022-12-08') ; 

SELECT CURDATE() ; -- current date  
```


- String Functions 
```sql 
SELECT CONCAT('my', 'name', 'is', 'prince');
SELECT CONCAT_WS(' ', 'my', 'name', 'is', 'prince'); --with sperator 
SELECT LENGTH('ahmed');
SELECT LENGTH(CONCAT_WS(' ', 'my', 'name', 'is', 'prince'));
SELECT LOWER('AHMED');
SELECT LEFT('This is the a text', 10);
SELECT RIGHT('This is the a text', 10);
SELECT SUBSTR('This is a long text', 6, 10);
SELECT TRIM(' bar ');
SELECT TRIM(LEADING 'x' FROM 'xbarx'); --start with x remove x in start 
SELECT TRIM(TRAILING 'x' FROM 'xbarx'); -- remove x in end 
SELECT TRIM(BOTH 'x' FROM 'xbarx'); -- both remove 
```

- Boolean 
```sql 
SELECT TRUE, FALSE;
SELECT 'b' IN ('a' , 'b', 'c', 'd', 'e', 'f');
SELECT 'b' NOT IN ('a' , 'b', 'c', 'd', 'e', 'f');
SELECT instr("abcdefg", "f") IS TRUE;
SELECT instr("abcdefg", "x") IS TRUE;
SELECT ISNULL(NULL);
SELECT ISNULL(1/0);
SELECT ISNULL('');

SELECT 5 between 1 AND 10;

SELECT IF(5 > 4, "TRUE", "FALSE");
```


- Select with tables 
```sql 
SELECT actor_id FROM sakila.actor;
SELECT count(actor_id) FROM sakila.actor;
SELECT DISTINCT actor_id FROM sakila.actor;

USE sakila; --instead of sakila.
SELECT actor_id, first_name FROM actor LIMIT 5; -- give 5 rows 
SELECT actor_id, first_name FROM actor LIMIT 5, 10; --skip firt 5 rows 
SELECT actor_id, first_name, 'dummy text' FROM actor LIMIT 5;
SELECT actor_id, first_name, curdate() FROM actor LIMIT 5;
SELECT actor_id, first_name, last_update FROM actor LIMIT 5;
SELECT * FROM actor;
```

- Sorting 
```sql 
SELECT actor_id, first_name, last_name, last_update FROM actor ORDER BY first_name;

SELECT actor_id, first_name, last_name, last_update FROM actor ORDER BY first_name, last_name; -- if first_name duplicate sort by last_name 
```


- Union 
```sql 
(SELECT actor_id, first_name FROM actor LIMIT 5, 10)

UNION

(SELECT actor_id, first_name FROM actor LIMIT 50 , 10);
```


- Where 
```sql 
SELECT * FROM film_text WHERE film_id < 10;
SELECT * FROM film_text WHERE film_id between 16 and 90;
SELECT * FROM film_text WHERE length(title) < 10;
SELECT * FROM film_text WHERE title LIKE "Ar%";
SELECT * FROM film_text WHERE locate("drama", description);
SELECT *, locate("drama", description) FROM film_text WHERE locate("drama", description);
```

- Group By  -> with Aggregation function  
```sql 
SELECT customer_id, count(rental_id) FROM rental GROUP BY customer_id;

SELECT customer_id, count(rental_id) FROM rental GROUP BY customer_id ORDER BY customer_id DESC;

SELECT customer_id, count(rental_id) FROM rental GROUP BY customer_id ORDER BY count(rental_id) DESC;

SELECT customer_id, sum(amount) FROM payment GROUP BY customer_id ORDER BY sum(amount) DESC;
```


- Having 
```sql
SELECT customer_id, sum(amount) FROM payment GROUP BY customer_id WHERE sum(amount) > 150 ORDER BY sum(amount) DESC; -- error!

SELECT customer_id, sum(amount) FROM payment GROUP BY customer_id HAVING sum(amount) > 150 ORDER BY sum(amount) DESC;
```