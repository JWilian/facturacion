-- CRUD
-- creat
insert into cliente (nombrecliente, nroidentificacion, direccioncliente) values("Jorge","46934688","Lima");
select nombrecliente as nombre, nroidentificacion as DNI, direccioncliente as Direccion from cliente;
select nombrecliente as nombre, nroidentificacion as DNI, direccioncliente as Direccion from cliente where nroidentificacion="46934688";
update cliente set nombrecliente = "Jorge Quispe", nroidentificacion = "47240056", direccioncliente = "Cercado de Lima" where idcliente = 1;
delete from cliente where idcliente = 1;
select * from cliente;