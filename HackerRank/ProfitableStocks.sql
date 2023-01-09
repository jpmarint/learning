/*
Enter your query below.
Please append a semicolon ";" at the end of the query
*/
SELECT pToday.stock_code
FROM price_today as pToday
INNER JOIN price_tomorrow as pTom
ON pToday.stock_code = pTom.stock_code
WHERE pTom.price > pToday.price
ORDER BY stock_code ASC;