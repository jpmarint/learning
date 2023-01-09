
SELECT *
FROM (
	SELECT ROW_NUMBER() OVER() AS  row_id, *
	FROM platzi.alumnos
)AS alulmnos_platzi
WHERE row_id IN (1,5,10,15,12,20);

SELECT *
FROM platzi.alumnos
WHERE id IN (
	SELECT id
	FROM platzi.alumnos
	WHERE tutor_id = 30
);

SELECT *
FROM platzi.alumnos
WHERE id NOT IN (
	SELECT id
	FROM platzi.alumnos
	WHERE tutor_id = 30
);