-- 1. Utilizando la base de datos de movies, queremos conocer, por un lado, los
-- títulos y el nombre del género de todas las series de la base de datos.
select title, gg.name from series ss left join genres gg on ss.genre_id = gg.id;

-- 2. Por otro, necesitamos listar los títulos de los episodios junto con el nombre y
-- apellido de los actores que trabajan en cada uno de ellos.
select ee.title, concat(aa.first_name, ' ', aa.last_name) actors -- ee.title 
from episodes ee left join actor_episode ae on ee.id = ae.episode_id left join actors aa on ae.actor_id = aa.id;

-- 3. Para nuestro próximo desafío, necesitamos obtener a todos los actores o actrices (mostrar nombre y apellido) 
-- que han trabajado en cualquier película de la saga de La Guerra de las galaxias.
select concat(first_name, ' ', last_name) actors, mm.title from movies mm join actor_movie am on mm.id = am.movie_id right join actors aa on aa.id = am.actor_id where mm.title like 'La Guerra de las galaxias%';

-- 4. Crear un listado a partir de la tabla de películas, mostrar un reporte de la
-- cantidad de películas por nombre de género.
select genre_id, gg.name, count(*) from movies mm, genres gg where mm.genre_id = gg.id group by genre_id;