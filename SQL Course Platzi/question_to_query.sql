/*Cuantas etiquetas tiene un blog post*/
select posts.titulo, count(*) num_etiquetas
from posts
	inner join posts_etiquetas on posts.id = posts_etiquetas.post_id
    inner join etiquetas on etiquetas.id = posts_etiquetas.etiqueta_id
group by posts.id
order by num_etiquetas desc;

/* Cuales son los tags que tiene un post */
select posts.titulo, group_concat(nombre)
from posts
	inner join posts_etiquetas on posts.id = posts_etiquetas.post_id
    inner join etiquetas on etiquetas.id = posts_etiquetas.etiqueta_id
group by posts.id;

/* Cuales son los tags que no tiene un posts? */
select * 
from etiquetas
	left join posts_etiquetas on etiquetas.id = posts_etiquetas.etiqueta_id
where posts_etiquetas.etiqueta_id is null;

/* Que categorias tienen más posts */
select c.nombre, count(*) as cantidad_posts
from categorias as c
	inner join posts as p on c.id = p.categoria_id
group by c.id
order by cantidad_posts desc;

/*que usuario publica más*/
select u.nickname, count(*) cant_posts
from usuarios as u
	inner join posts as p on u.id = p.usuario_id
group by u.id
order by cant_posts desc;

/*que usuario publica más y que categorias*/
select u.nickname, count(*) cant_posts, group_concat(nombre)
from usuarios as u
	inner join posts as p on u.id = p.usuario_id
    inner join categorias as c on c.id = p.categoria_id
group by u.id
order by cant_posts desc;

/* que usuarios tenemos que no publican */
select *
from usuarios as u
	left join posts on u.id = posts.usuario_id
where posts.usuario_id is null;

