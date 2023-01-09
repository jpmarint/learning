SELECT carrera_id, fecha_incorporacion
FROM platzi.alumnos
ORDER BY fecha_incorporacion DESC
LIMIT 1;

SELECT carrera_id, MAX(fecha_incorporacion)
FROM platzi.alumnos
GROUP BY carrera_id
ORDER BY carrera_id;


SELECT MIN(nombre)
from platzi.alumnos;

SELECT tutor_id, MIN(nombre)
from platzi.alumnos
GROUP BY tutor_id
ORDER BY tutor_id;
