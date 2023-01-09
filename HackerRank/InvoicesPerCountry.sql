/*
Enter your query below.
Please append a semicolon ";" at the end of the query
*/

SELECT co.country_name, count(*), avg(i.total_price)
FROM country co, 
    city ci, 
    customer cu,
    invoice i
WHERE co.id = ci.country_id AND ci.id = cu.city_id AND cu.id = i.customer_id
GROUP BY co.country_name
having avg(i.total_price) > (select avg(total_price) from invoice)