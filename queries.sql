-- write your queries here

-- 1 create a table that joins the two tables regardless of its relation with one another
-- in order to do this , you must do a full outer join , you can do the shorthand alliase so that it will be easier
SELECT * FROM owner o FULL OUTER JOIN vehicles v ON o.id = v.owner_id;

-- 2 count the number of cars each person has , the names should be ordered in ascending order
SELECT first_name,last_name, count(owner_id) FROM owners o JOIN vehicles v ON o.id = v.owner_id
GROUP BY (first_name,last_name) ORDER BY first_name;

-- 3 create a table with a persons car showing the average price and the number of 
-- vehicles that person has , avg must be above 10,000 and minimum 2 cars
SELECT first_name,last_name, ROUND(AVG(price)) 
 as average , COUNT(owner_id)
 FROM owners o JOIN vehicles v ON o.id = v.owner_id 
 GROUP BY (first_name,last_name) HAVING ROUND(AVG(price))> 10000 
 AND count(owner_id) >= 2 
 ORDER BY first_name DESC;
