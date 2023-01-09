-- Create Extension dblink;

-- select * from pasajero
-- join
-- dblink('dbname=remota
-- 	    port=5432
-- 	    host=127.0.0.1
-- 	    user=usuario_consulta
-- 	    password=etc123',
-- 	   'SELECT id, fecha FROM vip')
-- 	   As datos_remotos (id integer, fecha date)
 
-- using (id);

-- begin;
-- select true;

-- select now();


CREATE Extension fuzzystrmatch;
select Levenshtein ('oswaldo', 'osvaldo')
select difference ('beard', 'bird')
