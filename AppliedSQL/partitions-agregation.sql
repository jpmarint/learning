-- - ROW_NUMBER(): nos da el numero de la tupla que estamos utilizando en ese momento.
-- - OVER([PARTITION BY column] [ORDER BY column DIR]): nos deja Particionar y Ordenar la window function.
-- - PARTITION BY(column/s): es un group by para la window function, se coloca dentro de OVER.
-- - FIRST_VALUE(column): devuelve el primer valor de una serie de datos.
-- - LAST_VALUE(column): Devuelve el ultimo valor de una serie de datos.
-- - NTH_VALUE(column, row_number): Recibe la columna y el numero de row que queremos devolver de una serie de datos
-- - RANK(): nos dice el lugar que ocupa de acuerdo a el orden de cada tupla, deja gaps entre los valores.
-- - DENSE_RANK(): Es un rango mas denso que trata de eliminar los gaps que nos deja RANK.
-- - PERCENT_RANK(): Categoriza de acuerdo a lugar que ocupa igual que los anteriores pero por porcentajes.


-- Obtener el número de tupla sin un orden en particular --
SELECT ROW_NUMBER() OVER() AS row_id, *
FROM platzi.alumnos;

-- Obtener el número de tupla cuando ordenamos por fecha de incorporacion --
SELECT ROW_NUMBER() OVER(ORDER BY fecha_incorporacion) AS row_id, *
FROM platzi.alumnos;

-- Obtener el valor de un atributo de la primera tupla del window frame actual (global por default) --
SELECT FIRST_VALUE(colegiatura) OVER() AS row_id, *
FROM platzi.alumnos;

-- Obtener el valor de un atributo de la primera tupla del window frame actual --
-- La colegiatura de la persona que se inscribió primero por carrera --
SELECT FIRST_VALUE(colegiatura) OVER(PARTITION BY carrera_id ORDER BY fecha_incorporacion) AS row_id, *
FROM platzi.alumnos;

-- Obtener el valor de un atributo de la ultima tupla del window frame actual --
-- La colegiatura de la persona que se inscribió al final por carrera --
SELECT LAST_VALUE(colegiatura) OVER(PARTITION BY carrera_id ORDER BY fecha_incorporacion) AS row_id, *
FROM platzi.alumnos;

-- Obtener el valor de un atributo de la tupla numero n = 3 del window frame actual --
-- La colegiatura de la persona que se inscribió en lugar 3 por carrera --
SELECT nth_value(colegiatura, 3) OVER(PARTITION BY carrera_id ORDER BY fecha_incorporacion) AS row_id, *
FROM platzi.alumnos;

-- Rank Simple: Por cada elemento cuenta 1 generando espacios en el rank --
SELECT 	*,
		RANK() OVER (PARTITION BY carrera_id ORDER BY colegiatura DESC) AS brand_rank
FROM	platzi.alumnos
ORDER BY carrera_id, brand_rank;

-- Rank Simple: Por cada grupo de lementos iguales cuenta 1 generando rank "denso" --
SELECT 	*,
		DENSE_RANK() OVER (PARTITION BY carrera_id ORDER BY colegiatura DESC) AS brand_rank
FROM	platzi.alumnos
ORDER BY carrera_id, brand_rank;

-- Percent Rank: Genera una distribución percentual siguiendo la fórmula (rank - 1) / (total rows - 1) --
SELECT 	*,
		PERCENT_RANK() OVER (PARTITION BY carrera_id ORDER BY colegiatura ASC) AS brand_rank
FROM	platzi.alumnos
ORDER BY carrera_id, brand_rank;