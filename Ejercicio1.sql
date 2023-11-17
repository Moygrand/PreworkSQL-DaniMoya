/*
Ejercicio 1
1. Crear una tabla llamada "Clientes" con las columnas: id (entero, clave primaria),
nombre (texto) y email (texto).*/

CREATE TABLE Clientes (
  id int primary key,
  nombre varchar(255),
  email varchar(255)
)

/*
2. Insertar un nuevo cliente en la tabla "Clientes" con id=1, nombre="Juan" y
email="juan@example.com".*/

INSERT INTO Clientes (id,nombre,email)
values (1,'Juan','juan@example.com')

/*
3. Actualizar el email del cliente con id=1 a "juan@gmail.com".
*/

update Clientes set email='juan@gmail.com' where id=1

/*
4. Eliminar el cliente con id=1 de la tabla "Clientes".*/

delete from clientes where id=1

/*
5. Crear una tabla llamada "Pedidos" con las columnas: id (entero, clave primaria),
cliente_id (entero, clave externa referenciando a la tabla "Clientes"), producto
(texto) y cantidad (entero).*/

create table pedidos(
  id int primary key,
  cliente_id int,
  producto varchar(255),
  cantidad int,
  constraint fk_cliente foreign key (cliente_id) references Clientes(id)
)

/*
6. Insertar un nuevo pedido en la tabla "Pedidos" con id=1, cliente_id=1,
producto="Camiseta" y cantidad=2.*/

insert into pedidos (id, cliente_id, producto, cantidad)
values (1,1,'Camiseta',2)

/*
7. Actualizar la cantidad del pedido con id=1 a 3.
*/

update pedidos set cantidad=3 where id=1

/*
8. Eliminar el pedido con id=1 de la tabla "Pedidos".*/

delete from pedidos where id=1

/*
9. Crear una tabla llamada "Productos" con las columnas: id (entero, clave
primaria), nombre (texto) y precio (decimal).*/

create table productos (
  id int primary key,
  nombre varchar(255),
  precio decimal
)

/*
10. Insertar varios productos en la tabla "Productos" con diferentes valores.*/

insert into productos (id,nombre,precio)
values (1,'Camiseta',5.99),(2,'Polo',12.95),(3,'Pantalones',23)

/*
11. Consultar todos los clientes de la tabla "Clientes".*/

select * from clientes

/*
12. Consultar todos los pedidos de la tabla "Pedidos" junto con los nombres de los
clientes correspondientes.*/

select * from clientes
left join pedidos on clientes.id=pedidos.cliente_id

/*
13. Consultar los productos de la tabla "Productos" cuyo precio sea mayor a $50.*/

select * from productos where precio>50

/*
14. Consultar los pedidos de la tabla "Pedidos" que tengan una cantidad mayor o
igual a 5.*/

select * from pedidos where cantidad>=5

/*
15. Consultar los clientes de la tabla "Clientes" cuyo nombre empiece con la letra
"A"*/

select * from clientes where nombre like 'A%'

/*
16. Realizar una consulta que muestre el nombre del cliente y el total de pedidos
realizados por cada cliente.*/

select C.nombre, Count(*) as TotalPedidos from clientes C
inner join pedidos P on c.id = p.cliente_id
group by c.nombre
/*
17. Realizar una consulta que muestre el nombre del producto y la cantidad total de
pedidos de ese producto.*/

select producto, count(*) as TotalPedidos from pedidos
group by producto

/*
18. Agregar una columna llamada "fecha" a la tabla "Pedidos" de tipo fecha.*/

alter table pedidos
add column fecha date

/*
19. Agregar una clave externa a la tabla "Pedidos" que haga referencia a la tabla
"Productos" en la columna "producto".*/

alter table pedidos
add column producto_id int,
add constraint fk_pedidos foreign key (producto_id) references productos(id)

/*
20. Realizar una consulta que muestre los nombres de los clientes, los nombres de
los productos y las cantidades de los pedidos donde coincida la clave externa.
*/

select c.nombre, prod.nombre, count(ped.*) from clientes C
inner join pedidos ped on ped.cliente_id = c.id
inner join productos prod on prod.id = ped.producto_id
group by c.nombre, prod.nombre