Select *
from platzi.alumnos
fetch first 1 rows only;

Select *
from platzi.alumnos
limit 1;

Select *
from (
	Select row_number() over() as row_id, *
	From platzi.alumnos
) As alumnos_with_rown_num
Where row_id = 1;
