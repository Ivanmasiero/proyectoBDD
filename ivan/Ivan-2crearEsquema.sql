--CREAMOS UN ESQUEMA BASICO CLIENTE-PRODUCTO-VENTA-DETALLE_VENTA
create table producto(
id number(3),
nombre VARCHAR2(30),
cantidad number(5),
CONSTRAINT pk_productoID primary key (id)
);

create table cliente (
id number(3),
nombre varchar2(30),
CONSTRAINT pk_clienteID primary key (id)
);

create table venta(
id number (3),
clienteID number(3),
pagado number(1),
fecha date,
CONSTRAINT pk_ventaID primary key (id),
CONSTRAINT fk_clienteID foreign key (clienteID) references cliente(id)
);

create table detalle_venta(
ventaID number(3),
productoID number(3),
cantidad number(5),
CONSTRAINT pk_detalle_ventaID primary key (ventaID,productoID),
CONSTRAINT fk_ventaID foreign key (ventaID) REFERENCES venta(id),
CONSTRAINT fk_productoID foreign key (productoID) REFERENCES producto(id)
);




