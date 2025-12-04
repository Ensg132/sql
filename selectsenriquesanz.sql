use peliculas_db;

-- 1
select nombre,nacionalidad from director where nombre != "John Doe" and nacionalidad not like "estado%" and nacionalidad not like "brit%" order by nombre;

-- 2
select concat(pais,"  ",count(id_cliente)) as "Numero Clientes" from cliente group by pais order by "Numero Clientes" desc ;
-- 3
select id_plataforma,genero,min(anyo) from peliculas where genero != "drama" and anyo > 1980 group by id_plataforma,genero order by min(anyo),genero desc ;


