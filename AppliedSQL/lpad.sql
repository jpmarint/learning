SELECT lpad('sql', 15, '+')

SELECT lpad('sql', id, '+')
FROM platzi.alumnos
WHERE id < 10;

SELECT lpad('😊', id, '😂')
FROM platzi.alumnos
WHERE id < 10;


SELECT lpad('*', cast(row_id as int), '*')
FROM (
	SELECT ROW_NUMBER() OVER(order by carrera_id) AS row_id, *
	FROM platzi.alumnos
)AS alumnos_with_row_id
where row_id <= 5
order by carrera_id;

SELECT rpad('😊', id, '😂')
FROM platzi.alumnos
WHERE id < 10;