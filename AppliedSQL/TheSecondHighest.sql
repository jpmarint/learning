SELECT DISTINCT colegiatura
From platzi.alumnos as A1
WHERE 2 = (
	SELECT COUNT (DISTINCT colegiatura)
	FROM platzi.alumnos as A2
	Where A1.colegiatura <= A2.colegiatura
);

SELECT DISTINCT colegiatura
From platzi.alumnos
ORDER BY colegiatura DESC
LIMIT 1
OFFSET 1;

SELECT DISTINCT colegiatura, tutor_id
From platzi.alumnos
Where tutor_id = 20
ORDER BY colegiatura DESC
LIMIT 1
OFFSET 1;

SELECT *
FROM platzi.alumnos as datos_alumnos
INNER JOIN (
	SELECT DISTINCT colegiatura
	From platzi.alumnos
	Where tutor_id = 20
	ORDER BY colegiatura DESC
	LIMIT 1
	OFFSET 1
) as segunda_mayor_colegiatura
ON datos_alumnos.colegiatura = segunda_mayor_colegiatura.colegiatura;

SELECT *
FROM platzi.alumnos as datos_alumnos
WHERE colegiatura =  (
	SELECT DISTINCT colegiatura
	From platzi.alumnos
	Where tutor_id = 20
	ORDER BY colegiatura DESC
	LIMIT 1
	OFFSET 1
);