SELECT cust.customer_id, cust.name, concat('+', countryC.country_code, cust.phone_number)
FROM customers as cust
LEFT JOIN country_codes as countryC
ON cust.country = countryC.country
ORDER BY cust.customer_id