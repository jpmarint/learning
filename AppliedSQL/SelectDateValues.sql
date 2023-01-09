SELECT EXTRACT(YEAR FROM fecha_incorporacion) AS incorpYear
FROM platzi.alumnos;

SELECT DATE_PART('YEAR', fecha_incorporacion) AS incorp_year
FROM platzi.alumnos;

SELECT DATE_PART('YEAR', fecha_incorporacion) AS incorp_year,
		DATE_PART('MONTH', fecha_incorporacion) AS incorp_month,
		DATE_PART('DAY', fecha_incorporacion) AS incorp_day
FROM platzi.alumnos;


SELECT EXTRACT(HOUR FROM fecha_incorporacion) AS incorpHour, fecha_incorporacion
FROM platzi.alumnos;


SELECT DATE_PART('HOUR', fecha_incorporacion) AS incorp_hour,
		DATE_PART('MINUTE', fecha_incorporacion) AS incorp_minute,
		DATE_PART('SECOND', fecha_incorporacion) AS incorp_second,
		fecha_incorporacion
FROM platzi.alumnos;

SELECT DATE_PART('YEAR', fecha_incorporacion) AS incorp_year,
		DATE_PART('MONTH', fecha_incorporacion) AS incorp_month,
		DATE_PART('DAY', fecha_incorporacion) AS incorp_day,
		DATE_PART('HOUR', fecha_incorporacion) AS incorp_hour,
		DATE_PART('MINUTE', fecha_incorporacion) AS incorp_minute,
		DATE_PART('SECOND', fecha_incorporacion) AS incorp_second,
		fecha_incorporacion
FROM platzi.alumnos;


SELECT *
FROM platzi.alumnos
WHERE (EXTRACT(YEAR FROM fecha_incorporacion)) = 2018;

SELECT *
FROM platzi.alumnos
WHERE (DATE_PART('YEAR', fecha_incorporacion)) = 2019;

SELECT *
FROM (
	SELECT *, 
	DATE_PART('YEAR', fecha_incorporacion) AS incorp_year
	FROM platzi.alumnos
)AS alumnos_year
WHERE incorp_year = 2019;

SELECT *
    FROM platzi.alumnos
    WHERE (EXTRACT(YEAR FROM fecha_incorporacion)) = 2018
        AND (EXTRACT(MONTH FROM fecha_incorporacion)) = 05;