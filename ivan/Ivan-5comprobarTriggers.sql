--DAMOS DE ALTA CLIENTES, PRODUCTO Y VENTAS
--/*
insert into producto (id,nombre,cantidad) values(1,'agua',100);
insert into producto (id,nombre,cantidad) values(2,'arroz',100);
insert into producto (id,nombre,cantidad) values(3,'leche',100);

insert into cliente (id,nombre) values(1,'pepe');
insert into cliente (id,nombre) values(2,'manolo');

insert into venta (id,clienteID,fecha,pagado) values (1,1,SYSDATE,0);
insert into venta (id,clienteID,fecha,pagado) values (2,1,SYSDATE,0);
insert into venta (id,clienteID,fecha,pagado) values (3,1,SYSDATE,0);
--*/
--COMPROBACION TRIGGER T_COMPRUEBA********
--Da error
--insert into detalle_venta(ventaID,productoID,cantidad) values (1,1,101);

--DEJAMOS SIN EXISTENCIAS
--insert into detalle_venta(ventaID,productoID,cantidad) values (2,1,100);

--COMPROBACION TRIGGER T_STOCK*********
--da error
--insert into detalle_venta(ventaID,productoID,cantidad) values (3,1,10);

--ACTUALIZO LAS EXISTENCIAS
--update producto set cantidad=100 where id=1; 

--y ahora si me deja dar de alta otra venta
--insert into detalle_venta(ventaID,productoID,cantidad) values (3,1,100);

--COMPROBACION TRIGGER T_MOROSOS**********
--da error al meter la cuarta cuenta sin pagar
--insert into venta (id,clienteID,fecha,pagado) values (4,1,SYSDATE,0);

--pero si lo insertamos como cuenta pagada si nos deja
--insert into venta (id,clienteID,fecha,pagado) values (4,1,SYSDATE,1);




