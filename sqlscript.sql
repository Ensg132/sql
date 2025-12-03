-- CREAR BASE DE DATOS
create schema BDU3Avanzado charset utf8mb4 collate utf8mb4_es_0900_ai_ci;

-- ejemplo de creacion de tablas
CREATE {DATABASE | SCHEMA} [IF NOT EXISTS] nombre_bd
[especificación_create [especificación_create…]];

especificación_create:
{ [DEFAULT] CHARACTER SET juego_de_caracteres 
| [DEFAULT] COLLATE nombre_de_colación }

-- constraint foreign key 
CREATE TABLE empleados (
dni VARCHAR(10) PRIMARY KEY,
nombre_emp VARCHAR(30) NOT NULL,
especialidad VARCHAR(20),
fecha_alta DATE,
dpt VARCHAR(4) NOT NULL,
CONSTRAINT emp_dpt_fk FOREIGN KEY(dpt) REFERENCES departamentos(cod_dpt)
);
-- alteracion de tabla 
opción_alter: 
{ RENAME nombre_tabla_nuevo
| RENAME COLUMN nombre_columna TO nuevo_nombre
| ADD restricción_tabla
| ADD nombre_columna tipo_datos [definición_columna] [{FIRST | AFTER nombre_columna}] 
| ADD PRIMARY KEY (nombre_col1 [,nombre_col2…])
| DROP {nombre_columna | CONSTRAINT nombre_restricción}
| DROP PRIMARY KEY
| MODIFY nombre_columna tipo_datos [definición_columna] 
  [{FIRST | AFTER nombre_columna}] }
  
-- cambiar calave orimaria
ALTER TABLE nombre_tabla DROP PRIMARY KEY;
ALTER TABLE nombre_tabla ADD PRIMARY KEY(nombre_col1 [,nombre_col2…]);

-- borrar contenido de tabla 
TRUNCATE TABLE nombre_tabla;

-- actualizar datos
UPDATE nombre_tabla
SET columna1={expresión | DEFAULT | NULL} [, columna2…]…
[WHERE condición]

-- insertar datos
INSERT INTO departamentos (nombre_dpt, ubicacion, cod_dpt)
VALUES ('Informática', 'Planta sótano U3' , 'INF');
-- eliminar datos
DELETE FROM nombre_tabla [WHERE condición]
-- commit
-- DESACER LO ECHO
ROLLBACK;
-- usar autocomiut
SET autocommit=0; -- desactivar
SET autocommit=1; -- activar
-- guardar punto para rollback 
SAVEPOINT nombre;
ROLLBACK TO nombre;
RELEASE SAVEPOINT nombre;

-- crear indices
CREATE INDEX nombre ON [esquema.]nombre_tabla
({nombre_columna | expr} [ASC | DESC] [,{nombre_columna…}]);
CREATE INDEX nombre ON tabla (columna1 [,columna2…]);
-- ver indices
SHOW INDEX FROM nombre_tabla;

-- eliminar indices
DROP INDEX nombre_indice ON nombre_tabla;.
-- select
SELECT [DISTINCT] expr_col1 [AS nom_alias] [,expr_col2 [AS nom_alias]]…
FROM nom_tabla1 [nom_alias]
[WHERE condiciones]
[ORDER BY expr_col1 [DESC] [, expr_col2 [DESC]]…];

-- comparadores
is not null
between
not in
not like

-- ACTUALIZAR INDICES
ANALYZE TABLE nombre_tabla;

-- funciones agregadas
sum()
avg()
count()
max()
min()
-- group by
SELECT [DISTINCT] expr_col1 [AS nom_alias] [,expr_col2 [AS nom_alias]]...
FROM nom_tabla1 [nom_alias]
[WHERE condiciones]
[GROUP BY grupos]
[HAVING condicionesDeGrupo]
[ORDER BY expr_col1 [DESC] [, expr_col2 [DESC]]...];
-- ejemplos de agrupaciones
-- equivalente a realizar DISTINCT
SELECT col_A FROM tabla GROUP BY col_A;

-- funciones de agregación sobre toda la tabla
SELECT MAX(col_A), MIN(col_A), COUNT(*) FROM tabla;

-- funciones de agregación sobre columna "col_A" en grupos según columna "col_B"
SELECT MAX(col_A), MIN(col_A), COUNT(*) FROM tabla GROUP BY col_B;

-- lo mismo. Agrupar por columna "col_B" permite mostrar esa columna
SELECT col_B, MAX(col_A), MIN(col_A), COUNT(*) FROM tabla GROUP BY col_B;

-- comprobcadion del full_geoup_by
SELECT @@sql_mode;
-- desactivarlo 
SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

-- activarlo
SET SESSION sql_mode = CONCAT(@@sql_mode, ',ONLY_FULL_GROUP_BY');

