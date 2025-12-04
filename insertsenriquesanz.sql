use peliculas_db;
-- 1
insert into director(nombre,nacionalidad) values("Guillermo del Toro","Espanyol");

insert into peliculas(titulo,id_director,id_plataforma,anyo,genero) values("Frankestein",14,1,2025,"Terror");

-- 2

select * from plataforma;
update plataforma set ganancias=ganancias*1.1 where (millDeSuscrip > 100 and anyoComienzo <2014) or (millDeSuscrip > 200 and ganancias > 2000000 and anyoComienzo > 2014);

