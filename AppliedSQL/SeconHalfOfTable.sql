Select * from platzi.alumnos
where id > (
	select count(*)/2
	from platzi.alumnos
);


SELECT * 
FROM platzi.alumnos
OFFSET ( 
	SELECT COUNT(*)/2 FROM platzi.alumnos 
);


SELECT ROW_NUMBER() OVER() AS row_id, *
FROM platzi.alumnos
OFFSET(
	SELECT COUNT(*)/2
	FROM platzi.alumnos
);