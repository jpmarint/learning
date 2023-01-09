USE platziblog;

SELECT titulo as encabezado, fecha_publicacion as publicado_en, estatus as estado
FROM posts;

SELECT count(*) as numero_posts
FROM posts;

SELECT *
FROM usuarios
	left join posts on usuarios.id = posts.usuario_id;

SELECT *
FROM usuarios
	left join posts on usuarios.id = posts.usuario_id
    where posts.usuario_id is null;


SELECT *
FROM usuarios
	right join posts on usuarios.id = posts.usuario_id;
    
SELECT *
FROM usuarios
	right join posts on usuarios.id = posts.usuario_id
    where posts.usuario_id is null;
    
SELECT *
FROM usuarios
	inner join posts on usuarios.id = posts.usuario_id;
    
SELECT *
FROM usuarios
	left join posts on usuarios.id = posts.usuario_id
    where posts.usuario_id is null
union
SELECT *
FROM usuarios
	right join posts on usuarios.id = posts.usuario_id
    where posts.usuario_id is null;
    
SELECT *
FROM posts
where estatus != 'activo';

SELECT *
FROM posts
where titulo LIKE '%escandalo%';

SELECT *
FROM posts
where titulo LIKE '%roja';

SELECT *
FROM posts
where fecha_publicacion between '2023-01-01' and '2025-12-31';

SELECT *
FROM posts
where id between 50 and 60;

SELECT *
FROM posts
where year(fecha_publicacion) = '2025';

SELECT *
FROM posts
where usuario_id is not null
and estatus = 'activo'
and id<50
and categoria_id=2
and year(fecha_publicacion) ='2025';

select estatus, count(*) post_qty
from posts
group by estatus;

select year(fecha_publicacion) as post_year, count(*) as post_qty
from posts
group by post_year;

select monthname(fecha_publicacion) as post_month, count(*) as post_qty
from posts
group by post_month;

select estatus, monthname(fecha_publicacion) as post_month, count(*) as post_qty
from posts
group by estatus, post_month;

select *
from posts
order by fecha_publicacion desc;

select *
from posts
order by titulo asc;

select *
from posts
order by usuario_id desc;

select *
from posts
order by fecha_publicacion asc
limit 5;

select monthname(fecha_publicacion) as post_month, estatus, count(*) as post_quantity
from posts
group by estatus, post_month
having post_quantity > 2
order by post_month;