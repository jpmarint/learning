SELECT *
from generate_series(1,4);

SELECT *
from generate_series(5,1,-2);

SELECT *
from generate_series(1.1,4,1.3);

SELECT current_date + s.a as dates
from generate_series(0,14,7) as s(a);

SELECT *
FROM generate_series('2020-09-01 00:00:00'::timestamp,
					 '2020-09-04 12:00:00', '10 hours');
					 
SELECT a.id,
		a.nombre,
		a.apellido,
		a.carrera_id,
		s.a
from platzi.alumnos as a
	inner join generate_series(0,10) as s(a)
	on s.a = a.carrera_id
order by a.carrera_id;

SELECT lpad('😍', generate_series(1,20,2), '😁');

-- Generate independent ordinality --
SELECT  *
FROM    generate_series(1,10) WITH ordinality;