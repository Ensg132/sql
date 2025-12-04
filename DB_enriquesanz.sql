CREATE schema if not exists BD_enriquesanz charset utf8mb4 collate utf8mb4_es_0900_ai_ci;
use BD_enriquesanz;
create table empresaConstructora(
idSucursal int auto_increment primary key,
direccion varchar(100),
telefono varchar(12) default "+34666666666"
);

create table obras(
idObra int auto_increment primary key,
direccion varchar(100),
presupuesto float
);


create table albañiles(
dni char(10) primary key,
nombre varchar(30) not null,
telefono varchar(12) not null,
edad int,
idSucursal int ,
especialidad varchar(15),
idObra int,
constraint isu_alb_fk foreign key(idSucursal) references empresaConstructora(idSucursal) on delete set null,
constraint iob_alb_fk foreign key(idObra) references obras(idObra) on update cascade on delete cascade ,
constraint eda_alb_ck check (edad >= 18 and edad <= 65),
constraint esp_alb_ck check(especialidad= "electricista" or especialidad= "fontanero" or especialidad= "peon" or especialidad= "oficial de primera")
);

alter table albañiles modify nombre varchar(30) not null unique;
commit;
