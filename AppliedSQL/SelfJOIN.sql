SELECT a.nombre,
		a.apellido,
		t.nombre,
		t.apellido
FROM platzi.alumnos AS a
	INNER JOIN platzi.alumnos AS t on a.tutor_id = t.id;
	
SELECT CONCAT(a.nombre, ' ', a.apellido)AS alumnos,
		CONCAT(t.nombre, ' ', t.apellido) AS tutor
FROM platzi.alumnos AS a
	INNER JOIN platzi.alumnos AS t on a.tutor_id = t.id;
	

SELECT CONCAT(t.nombre, ' ', t.apellido) AS tutor,
		COUNT(*) AS alumnos_per_tutor
FROM platzi.alumnos AS a
	INNER JOIN platzi.alumnos AS t on a.tutor_id = t.id
GROUP BY tutor
ORDER BY alumnos_per_tutor desc
limit 10;


SELECT AVG(alumnos_per_tutor) AS PROMEDIO_ALUMNOS_PER_TUTOR
FROM (
	SELECT CONCAT(t.nombre, ' ', t.apellido) AS tutor,
		COUNT(*) AS alumnos_per_tutor
	FROM platzi.alumnos AS a
		INNER JOIN platzi.alumnos AS t on a.tutor_id = t.id
	GROUP BY tutor
	ORDER BY alumnos_per_tutor desc
)AS average;
