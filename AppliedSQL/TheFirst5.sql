Select *
From platzi.alumnos
Fetch First 5 Rows only;

Select *
From platzi.alumnos
Limit 5;

Select *
from (
	Select row_number() over() as row_id, *
	From platzi.alumnos
) As alumnos_with_row_num
where row_id between 1 and 5;

Select *
from (
	Select row_number() over() as row_id, *
	From platzi.alumnos
) As alumnos_with_row_num
where row_id <= 5;

