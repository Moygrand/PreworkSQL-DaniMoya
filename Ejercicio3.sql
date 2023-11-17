/*1. Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave
primaria), "nombre" (texto) y "precio" (numérico).*/

create table productos (
  id serial primary key,
  nombre varchar(255),
  precio int
)

/*
2. Inserta al menos cinco registros en la tabla "Productos".*/

insert into productos (nombre, precio)
values ('agua', 1),('leche', 2),('aceite de oliva', 30),('mermelada',2),('carne',7)

/*
3. Actualiza el precio de un producto en la tabla "Productos".*/

update productos set precio=35 where id=3

/*
4. Elimina un producto de la tabla "Productos".*/

delete from productos where id=3

/*
5. Realiza una consulta que muestre los nombres de los usuarios junto con los
nombres de los productos que han comprado (utiliza un INNER JOIN con la
tabla "Productos").*/

-- Entiendo que esto es una relación N:N y que debe haber una tabla intermediaria que recoja todas las compras que han hecho los usuarios y que si lo que se busca es saber qué productos se han comprado, se debe hacer un group by productos, por si un cliente ha comprado más de una vez el mismo producto, este no aparezca duplicado.

create table compras (
  id serial primary key,
  usuario_id int,
  producto_id int,
  constraint fk_usuario foreign key (usuario_id) references usuarios(id),
  constraint fk_producto foreign key (producto_id) references productos(id)
 )

 insert into compras (usuario_id,producto_id)
 values (1,4),(3,5)(3,2),(3,2),(3,1),(1,5)

select u.nombre,p.nombre from usuarios u
inner join compras c on u.id = c.usuario_id
inner join productos p on c.producto_id = p.id
group by u.nombre,p.nombre