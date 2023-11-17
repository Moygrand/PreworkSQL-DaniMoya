/*Nivel de dificultad: Experto
1. Crea una tabla llamada "Pedidos" con las columnas: "id" (entero, clave
primaria), "id_usuario" (entero, clave foránea de la tabla "Usuarios") y
"id_producto" (entero, clave foránea de la tabla "Productos").*/

create table pedidos (
  id serial primary key,
  usuario_id int,
  producto_id int,
  constraint fk_usuario foreign key (usuario_id) references usuarios(id),
  constraint fk_producto foreign key (producto_id) references productos(id)
 )

/*
2. Inserta al menos tres registros en la tabla "Pedidos" que relacionen usuarios con
productos.*/

insert into pedidos (usuario_id, producto_id)
select usuario_id,producto_id from compras

/*
3. Realiza una consulta que muestre los nombres de los usuarios y los nombres de
los productos que han comprado, incluidos aquellos que no han realizado
ningún pedido (utiliza LEFT JOIN y COALESCE).*/

select u.nombre,coalesce(p.nombre,'NADA') from usuarios u
left join compras c on u.id = c.usuario_id
left join productos p on c.producto_id = p.id
group by u.nombre,p.nombre
/*
4. Realiza una consulta que muestre los nombres de los usuarios que han
realizado un pedido, pero también los que no han realizado ningún pedido
(utiliza LEFT JOIN).*/

select u.nombre from usuarios u
left join compras c on u.id = c.usuario_id
left join productos p on c.producto_id = p.id
group by u.nombre

/*
5. Agrega una nueva columna llamada "cantidad" a la tabla "Pedidos" y actualiza
los registros existentes con un valor (utiliza ALTER TABLE y UPDATE)*/

alter table pedidos
add column cantidad int

update pedidos set cantidad=1