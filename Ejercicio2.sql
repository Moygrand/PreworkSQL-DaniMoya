/*Nivel de dificultad: Fácil
1. Crea una base de datos llamada "MiBaseDeDatos".*/

create database MiBaseDeDatos

/*2. Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave
primaria), "nombre" (texto) y "edad" (entero).*/

create table Usuarios (
  id serial primary key,
  nombre varchar (255),
  edad int
)

/*
3. Inserta dos registros en la tabla "Usuarios".*/

insert into usuarios (nombre, edad)
values ('Daniel',32),('Merche',25),('Marc',40)

/*
4. Actualiza la edad de un usuario en la tabla "Usuarios".*/

update usuarios set edad=38 where id=3

/*
5. Elimina un usuario de la tabla "Usuarios".*/

delete from usuarios where id=3

/*
Nivel de dificultad: Moderado
1. Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave
primaria), "nombre" (texto) y "pais" (texto).*/

create table Ciudades(
  id serial primary key,
  nombre varchar(255),
  pais varchar (255)
)

/*
2. Inserta al menos tres registros en la tabla "Ciudades".*/

insert into ciudades (nombre, pais)
values ('Madrid', 'España'), ('Paris', 'Francia'), ('Ibiza', 'España')

/*
3. Crea una foreign key en la tabla "Usuarios" que se relacione con la columna "id"
de la tabla "Ciudades".*/

alter table usuarios
add column ciudad_id int,
add constraint fk_ciudad foreign key (ciudad_id) references ciudades(id)

/*
4. Realiza una consulta que muestre los nombres de los usuarios junto con el
nombre de su ciudad y país (utiliza un LEFT JOIN).*/

select * from usuarios
left join ciudades on usuarios.ciudad_id = ciudades.id

/*
5. Realiza una consulta que muestre solo los usuarios que tienen una ciudad
asociada (utiliza un INNER JOIN).*/
select * from usuarios
inner join ciudades on usuarios.ciudad_id = ciudades.id