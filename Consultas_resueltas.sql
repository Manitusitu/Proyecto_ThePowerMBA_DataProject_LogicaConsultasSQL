--1. Crea el esquema de la BBDD.
CREATE SCHEMA shaquila; --Con este comando podemos crear un esquema

--2. Muestra los nombres de todas las películas con una clasificación por edades de ‘R’.

select f.title --seleccionamos los nombres de peliculas
from film f -- de la tabla peliculas
where f.rating = 'R'; -- especificamos que la clasificacion de edades sea R

-- 3. Encuentra los nombres de los actores que tengan un “actor_id” entre 30 y 40.
select a.first_name -- ponemos que queremos los nombres
from actor a -- de la tabla actor
where a.actor_id between 30 and 40; -- especificamos que este entre el id 30 y 40

--4. Obtén las películas cuyo idioma coincide con el idioma original.
select * -- Buscamos las pelis
from film f -- de la tabla film
where f.language_id = f.original_language_id; -- que coincidan con el idioma original

-- 5. Ordena las películas por duración de forma ascendente.
select * --Cogemos las peliculas
from film f  -- de la tabla film
order by f.length asc; -- y decimos que queremos ordenarlas por la duracion y ademas que sea ascendente

--6. Encuentra el nombre y apellido de los actores que tengan ‘Allen’ en su apellido.

select a.first_name , a.last_name --Seleccionamos el nombre y el apellido
from actor a -- de la gente de la tabla actores
where a.last_name in ('ALLEN') ; --los cuales tengan ALLEN como apellido


--7. Encuentra la cantidad total de películas en cada clasificación de la tabla “film” y muestra la clasificación junto con el recuento.
select f.rating, count(f.film_id ) as "Total_Peliculas" -- Ponemos el rating y la cantidad de peliculas
from film f --de la tabla film
group by f.rating; -- y lo agrupamos por el rating

--8. Encuentra el título de todas las películas que son ‘PG-13’ o tienen una duración mayor a 3 horas en la tabla film.

select f.title --Buscamos los titulos
from film f -- de la tabla film
where f.rating = 'PG-13' or f.length > 180; -- filtramos por rating PG-13 o que tenga una duracion mayor a 3 horas

--9. Encuentra la variabilidad de lo que costaría reemplazar las películas.
select variance(f.replacement_cost ) as Variabilidad --Calculamos la variabilidad de las peliculas
from film f;


--10. Encuentra la mayor y menor duración de una película de nuestra BBDD.

select MAX(f.length ) as "mayor_duracion", MIN(f.length ) as "menor_duracion" --Calculamos la mayor duracion y la menor duracion de todas las peliculas
from film f;


--11. Encuentra lo que costó el antepenúltimo alquiler ordenado por día.
select p.amount --seleccionamos la cantidad
from payment p --de la tabla de pagos
order by p.payment_date desc --ordenamos las fechas para hacer que salgan primero las mas recientes
limit 1 -- limitamos el que solo salga una cantidad
offset 2; --Nos saltamos los dos primeros pagos para llegar el tercero que es el que nos interesa.

--12. Encuentra el título de las películas en la tabla “film” que no sean ni ‘NC17’ ni ‘G’ en cuanto a su clasificación.
select f.title --Seleccionamos los titulos de peliculas
from film f -- De la tabla film
where f.rating <> 'G' and 
	f.rating <> 'NC-17'; -- Y especificamos que las peliculas no sean ni ‘NC17’ ni ‘G’
	
--13. Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra la clasificación junto con el promedio de duración.
select f.rating , round(AVG(f.length),2) as "PROMEDIO_PELICULAS" -- Ponemos el rating y el promedio de la duracion
from film f -- de la tabla peliculas
group by f.rating ; --y lo ordenamos por el rating
	
--14. Encuentra el título de todas las películas que tengan una duración mayor a 180 minutos.
select f.title 
from film f  
where f.length > 180;

	
--15. ¿Cuánto dinero ha generado en total la empresa?
select SUM(p.amount ) TOTAL_GENERADO
from payment p ;
	
--16. Muestra los 10 clientes con mayor valor de id.
select c.customer_id 
from customer c
order by c.customer_id desc
limit 10;

	
--17. Encuentra el nombre y apellido de los actores que aparecen en la película con título ‘Egg Igby’.
select a.first_name, a.last_name 
from actor a , film_actor fa , film f 
where f.title = 'EGG IGBY' and a.actor_id = fa.actor_id and fa.film_id  = f.film_id ;


--18. Selecciona todos los nombres de las películas únicos.

select distinct f.title --Usamos distinct para devolver valores que no este repetidos, es decir unicos.
from film f ;
	
--19. Encuentra el título de las películas que son comedias y tienen una duración mayor a 180 minutos en la tabla “film”.
select f.title --Seleccionamos los titulos 
from film f, film_category fc, category c --Ponemos las tablas con las que queremos trabajar
where c."name" = 'Comedy' and f.length > 180 and --ponemos las condiciones
	f.film_id = fc.film_id and c.category_id = fc.category_id ; --y ponemos las relaciones
	
--20. Encuentra las categorías de películas que tienen un promedio de duración superior a 110 minutos y muestra el nombre de la categoría junto con el promedio de duración.
select c."name"  , AVG(f.length) as "Promedio_Peliculas"
from category c , film f, film_category fc  
where f.film_id  = fc.film_id and c.category_id = fc.category_id
group by c.category_id 
having AVG(f.length) > 110 ;

	
--21. ¿Cuál es la media de duración del alquiler de las películas?
select AVG(f.rental_duration) as "Media_duracion_alquiler"
from film f;

--22. Crea una columna con el nombre y apellidos de todos los actores y actrices.
select concat(a.first_name, ' ', a.last_name) as "Nombre_completo_actor" -- Usamos la funcion concat para combinar dos columnas distintas
from actor a;
--23. Números de alquiler por día, ordenados por cantidad de alquiler de forma descendente.
select date(r.rental_date) as "dia", count(r.rental_id ) as "Numero_alquileres" --Ponemos la funcion date para coger los dias y luego contamos los pedidos
from rental r
group by date(r.rental_date) 
order by count (r.rental_id) desc;

--24. Encuentra las películas con una duración superior al promedio.
select f.title, f.length 
from film f
where f.length > (select avg(f.length) from film f); --Aqui se ha tenido que usar una subconsulta para poder comparar la duracion de las peliculas con el promedio

--25. Averigua el número de alquileres registrados por mes.
select date_trunc('month',r.rental_date ) as "Mes", count(r.rental_id ) as "Numeros_alquiler"
from rental r
group by date_trunc('month',r.rental_date )
order by date_trunc('month',r.rental_date );

--26. Encuentra el promedio, la desviación estándar y varianza del total pagado.
select AVG("total_pagado") as "Promedio_total_pagado", stddev("total_pagado") as "Desviacion_Estandar_total_pagado", variance("total_pagado") as "Varianza_total_pagado"
from (select p.payment_id, SUM(p.amount ) as "total_pagado"
	from payment p
	group by p.payment_id ) as subconsulta;

--27. ¿Qué películas se alquilan por encima del precio medio?
select f.title
from film f
where f.rental_rate > (select AVG(f2.rental_rate) from film f2);

--28. Muestra el id de los actores que hayan participado en más de 40 películas.
select a.actor_id, count(fa.film_id) as "numero_peliculas"
from actor a, film_actor fa
where a.actor_id = fa.actor_id
group by a.actor_id
having count(fa.film_id) > 40;

--29. Obtener todas las películas y, si están disponibles en el inventario, mostrar la cantidad disponible.
select f.film_id, f.title,  count(i.film_id ) as cantidad_disponible
from film f, inventory i  
where f.film_id = i.film_id
group by f.film_id
order by f.film_id ;

--30. Obtener los actores y el número de películas en las que ha actuado.
select a.actor_id, a.first_name , a.last_name, count(fa.film_id ) as numero_peliculas
from actor a , film_actor fa
where a.actor_id = fa.actor_id
group by a.actor_id
order by a.actor_id asc;


--31. Obtener todas las películas y mostrar los actores que han actuado en ellas, incluso si algunas películas no tienen actores asociados.
select f.film_id , f.title, a.actor_id, concat(a.first_name ,' ' , a.last_name ) as "actor_asociado" 
from film f
left join film_actor fa -- En esta ocasion usamos el left join ya que en este caso queremos que sea capaz de salir las peliculas que no tengan actores, de esta forma puede salir null
on f.film_id = fa.film_id 
left join actor a 
on fa.actor_id   = a.actor_id
order by f.film_id ;

-- 32. Obtener todos los actores y mostrar las películas en las que han actuado, incluso si algunos actores no han actuado en ninguna película.
select a.actor_id , concat(a.first_name ,' ' , a.last_name ) as "actor", f.film_id , f.title 
from actor a 
left join film_actor fa 
on a.actor_id = fa.actor_id 
left join film f 
on fa.film_id = f.film_id 
order by a.actor_id ;


--33. Obtener todas las películas que tenemos y todos los registros de alquiler.
select f.film_id , f.title, r.rental_id , r.rental_date 
from film f
inner join inventory i 
on f.film_id = i.film_id 
inner join rental r 
on i.inventory_id = r.inventory_id
order by f.film_id ;

--34. Encuentra los 5 clientes que más dinero se hayan gastado con nosotros.
select c.customer_id, concat(c.first_name, ' ', c.last_name) as "Cliente", SUM(p.amount ) as "Total_gastado" --Sacamos los nombres de los clientes y el total que han gastado
from payment p, customer c 
where c.customer_id = p.customer_id
group by c.customer_id
order by SUM(p.amount) desc -- Al ponerlo en orden descendente hacemos que los numeros mas grandes salgan primero
limit 5; -- Lo limitamos a los primeros 5 como dice el enunciado



--35. Selecciona todos los actores cuyo primer nombre es 'Johnny'.
select a.actor_id , a.first_name, a.last_name 
from actor a 
where a.first_name = 'JOHNNY';

--36. Renombra la columna “first_name” como Nombre y “last_name” como Apellido.
alter table actor -- Usamos el comando alter table para decir que vamos a alterar una tabla en especifico
rename column "first_name" to "nombre"; -- y luego usamos el comando rename para cambiar el nombre de la columna

alter table actor
rename column "last_name" to "apellido";


--37. Encuentra el ID del actor más bajo y más alto en la tabla actor.
select MIN(a.actor_id ) as "actor_id_ mas_bajo" , MAX(a.actor_id ) as "actor_id_mas_alto" 
from actor a ;


--38. Cuenta cuántos actores hay en la tabla “actor”.
select count(a.actor_id ) as "numero_actores"
from actor a ;

--39. Selecciona todos los actores y ordénalos por apellido en orden ascendente.
select *
from actor a 
order by a.apellido asc;

--40. Selecciona las primeras 5 películas de la tabla “film”.
select f.title 
from film f 
order by f.film_id asc 
limit 5;

--41. Agrupa los actores por su nombre y cuenta cuántos actores tienen el mismo nombre. ¿Cuál es el nombre más repetido?
select a.nombre, count(a.nombre)
from actor a 
group by a.nombre;

--El nombre mas repetido es entre PENELOPE, KENNETH y JULIA con 4 veces cada uno

--42. Encuentra todos los alquileres y los nombres de los clientes que los realizaron.
select r.rental_id , r.rental_date , concat(c.first_name, ' ', c.last_name) as "Nombre_cliente"
from rental r
inner join customer c 
on r.customer_id = c.customer_id 
order by r.rental_id ;


-- 43. Muestra todos los clientes y sus alquileres si existen, incluyendo aquellos que no tienen alquileres.
select *
from customer c 
left join rental r 
on c.customer_id = r.customer_id ;

--44. Realiza un CROSS JOIN entre las tablas film y category. ¿Aporta valor esta consulta? ¿Por qué? Deja después de la consulta la contestación.
select *
from film f 
cross join category c 
;

-- No, esta consulta no aporta valor ya que va a dar resultados erroneos como decir que una pelicula la cual es de terror ahora saldra como una infantil o viceversa
--45. Encuentra los actores que han participado en películas de la categoría 'Action'.
select a.actor_id, concat(a.nombre, ' ', a.apellido) as nombre_actor
from actor a , film_actor fa , film f, film_category fc , category c 
where a.actor_id = fa.actor_id and 
fa.film_id = f.film_id  and 
f.film_id = fc.film_id and 
fc.category_id  = c.category_id and 
c."name" = 'Action' ;

--46. Encuentra todos los actores que no han participado en películas.
select *
from actor a
left join film_actor fa 
on a.actor_id = fa.actor_id
where fa.actor_id is null;

--47. Selecciona el nombre de los actores y la cantidad de películas en las que han participado.
select a.actor_id , concat(a.nombre , ' ', a.apellido ) as "nombre_actor", count(fa.film_id    )
from actor a, film_actor fa
where a.actor_id = fa.actor_id 
group by a.actor_id
order by a.actor_id ;

--48. Crea una vista llamada “actor_num_peliculas” que muestre los nombres de los actores y el número de películas en las que han participado.
create view actor_num_peliculas as
select concat(a.nombre , ' ', a.apellido ) as "nombre_actor", count(fa.film_id    )
from actor a, film_actor fa
where a.actor_id = fa.actor_id 
group by a.actor_id
order by a.actor_id; 

select *
from actor_num_peliculas anp ;

--49. Calcula el número total de alquileres realizados por cada cliente.
select c.customer_id , concat(c.first_name , ' ', c.last_name ) as "nombre_cliente", count(r.rental_id ) as "total_alquileres"
from customer c, rental r
where c.customer_id = r.customer_id 
group by c.customer_id ;
--50. Calcula la duración total de las películas en la categoría 'Action'.
select SUM(f.length) as "duracion_total" 
from film f, film_category fc , category c 
where f.film_id = fc.film_id and 
fc.category_id = c.category_id and 
c."name" = 'Action'
;
--51. Crea una tabla temporal llamada “cliente_rentas_temporal” para almacenar el total de alquileres por cliente.
create temporary table cliente_rentas_temporal as 
select  c.customer_id , concat(c.first_name , ' ', c.last_name ) as "nombre_cliente", count(r.rental_id ) as "total_alquileres"
from customer c, rental r
where c.customer_id = r.customer_id 
group by c.customer_id ;

select "customer_id" ,"nombre_cliente", "total_alquileres"
from cliente_rentas_temporal
order by "customer_id";

--52. Crea una tabla temporal llamada “peliculas_alquiladas” que almacene las películas que han sido alquiladas al menos 10 veces.
create temporary table peliculas_alquiladas as
select f.film_id, f.title, count(r.rental_id) as "numero_alquiler"
from film f, inventory i, rental r
where f.film_id = i.film_id and
i.inventory_id = r.inventory_id
group by f.film_id
having count(r.rental_id) >= 10;

select "film_id", "title", "numero_alquiler"
from peliculas_alquiladas;

--53. Encuentra el título de las películas que han sido alquiladas por el cliente con el nombre ‘Tammy Sanders’ y que aún no se han devuelto. Ordena los resultados alfabéticamente por título de película.
select  f.title 
from film f, inventory i , store s , customer c , rental r 
where f.film_id = i.film_id and 
i.store_id = s.store_id and 
s.store_id  = c.store_id  and 
r.customer_id = c.customer_id and 
c.first_name = 'TAMMY' and c.last_name = 'SANDERS' and 
r.return_date is null
order by f.title asc ;

--54. Encuentra los nombres de los actores que han actuado en al menos una  película que pertenece a la categoría ‘Sci-Fi’. Ordena los resultados alfabéticamente por apellido.
select a.nombre, a.apellido
from actor a
join film_actor fa
on a.actor_id  = fa.actor_id 
join film f
on fa.film_id = f.film_id 
join film_category fc 
on f.film_id = fc.film_id 
join category c 
on fc.category_id = c.category_id
where c."name" = 'Sci-Fi'
order by a.apellido ;

--55. Encuentra el nombre y apellido de los actores que han actuado en películas que se alquilaron después de que la película ‘Spartacus Cheaper’ se alquilara por primera vez. Ordena los resultados alfabéticamente por apellido.
select distinct a.nombre, a.apellido 
from actor a
join film_actor fa 
on a.actor_id = fa.actor_id 
join film f 
on fa.film_id = f.film_id 
join inventory i 
on f.film_id = i.film_id 
join rental r 
on i.inventory_id  = r.inventory_id
where r.rental_date > ( -- En este caso tenemos que poner una subconsulta en el where para poder sacar la fecha en la que se estreno la pelicula
	select min(r2.rental_date)
	from rental r2
	join inventory i 
	on r2.inventory_id = i.inventory_id 
	join film f2 
	on i.film_id  = f2.film_id
	where f.title = 'SPARTACUS CHEAPER'
)
order by a.apellido;

--56. Encuentra el nombre y apellido de los actores que no han actuado en ninguna película de la categoría ‘Music’.
select a.nombre , a.apellido
from actor a 
join film_actor fa 
on a.actor_id = fa.actor_id 
join film f
on fa.film_id = f.film_id 
join film_category fc 
on f.film_id = fc.film_id 
join category c 
on fc.category_id = c.category_id 
where c."name" <> 'Music';
--57. Encuentra el título de todas las películas que fueron alquiladas por más de 8 días.
select distinct f.title 
from film f 
join inventory i 
on f.film_id = i.film_id
join rental r 
on i.inventory_id = r.inventory_id
where r.return_date::date - r.rental_date::date > 8; --Para poder hacer este ejercicio en el que hay que calcular fechas usamos los dos puntos para convertir las fechas en tipo date y luego lo restamos

-- 58. Encuentra el título de todas las películas que son de la misma categoría que ‘Animation’.
select f.title
from film f
join film_category fc 
on f.film_id = fc.film_id 
join category c 
on fc.category_id = c.category_id 
where c."name" = 'Animation'
;
--59. Encuentra los nombres de las películas que tienen la misma duración que la película con el título ‘Dancing Fever’. Ordena los resultados alfabéticamente por título de película.
select f.title
from film f
where f.length = (
	select f2.length 
	from film f2 
	where f2.title = 'DANCING FEVER'
);


--60. Encuentra los nombres de los clientes que han alquilado al menos 7 películas distintas. Ordena los resultados alfabéticamente por apellido.
select c.first_name , c.last_name, count(r.rental_id ) as "numero_alquileres"
from customer c
join rental r 
on c.customer_id = r.customer_id
group by c.customer_id
having count(r.rental_id ) >= 7 
order by c.last_name 
 ;
--61. Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría junto con el recuento de alquileres.
select c."name" , count(r.rental_id ) as recuento_alquileres
from film f 
join film_category fc 
on f.film_id = fc.film_id 
join category c 
on fc.category_id = c.category_id
join inventory i 
on f.film_id = i.inventory_id 
join rental r 
on i.inventory_id = r.inventory_id 
group by c.category_id ;

--62. Encuentra el número de películas por categoría estrenadas en 2006.
select c."name", count(f.film_id ) as numero_peliculas_2006
from category c  
join film_category fc 
on c.category_id  = fc.category_id 
join film f 
on fc.film_id = f.film_id
where f.release_year = 2006
group by c.category_id ;
--63. Obtén todas las combinaciones posibles de trabajadores con las tiendas que tenemos.
select *
from staff s 
cross join store s2 ;



--64. Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas.

select c.customer_id, c.first_name , c.last_name, count(r.rental_id ) as numero_peliculas_alquiladas
from customer c 
join rental r 
on c.customer_id = r.customer_id
group by c.customer_id 
order by c.customer_id ;

