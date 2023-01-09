/*
Enter your query below.
Please append a semicolon ";" at the end of the query

Output: sku product_name

*/

SELECT sku, product_name
FROM PRODUCT as p
LEFT JOIN INVOICE_ITEM as i
ON i.product_id = p.id
WHERE invoice_id is NULL
ORDER BY SKU ASC;