SELECT carrera_id, COUNT(*) AS cuenta
FROM platzi.alumnos
GROUP BY carrera_id
ORDER BY cuenta DESC;

SELECT a.nombre,
		a.apellido,
		a.carrera_id,
		c.id,
		c.carrera
FROM platzi.alumnos AS a
	LEFT JOIN platzi.carreras AS c
	ON a.carrera_id = c.id
WHERE c.id is NULL
order by a.carrera_id;

SELECT a.nombre,
	   a.apellido,
	   a.carrera_id,
	   c.id,
	   c.carrera
FROM platzi.carreras AS c
	FULL OUTER JOIN platzi.alumnos AS a ON c.id = a.carrera_id
ORDER BY a.carrera_id DESC;

SELECT CONCAT(a.nombre, ' ', a.apellido) AS nombre_completo_alumnos,
	c.carrera
FROM platzi.alumnos AS a
	FULL OUTER JOIN platzi.carreras AS c
	ON a.carrera_id = c.id
ORDER BY c.carrera;