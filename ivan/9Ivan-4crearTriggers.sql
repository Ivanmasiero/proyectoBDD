--Trigger para validar la cantidad
create or replace trigger t_comprueba
before insert or update on detalle_venta
for each row
declare
v_cantidad producto.cantidad%type;
begin
    select cantidad
    into v_cantidad
    from producto
    where id=:new.ProductoID;
    
    if v_cantidad<:new.cantidad then
    raise_application_error (-20001,'stock insuficiente');
    end if;
end;
/
--Trigger para quitar las existencias de nuestro stock al vender
CREATE OR REPLACE TRIGGER t_stock
AFTER INSERT OR UPDATE ON detalle_venta
FOR EACH ROW
BEGIN
    -- Si es una inserción, restamos la cantidad vendida del stock
    IF INSERTING THEN
        UPDATE producto
        SET cantidad = cantidad - :NEW.cantidad
        WHERE id = :NEW.productoID;

    -- Si es una actualización, devolvemos la cantidad anterior y restamos la nueva cantidad
    ELSIF UPDATING THEN
        UPDATE producto
        SET cantidad = cantidad + :OLD.cantidad - :NEW.cantidad
        WHERE id = :NEW.productoID;
    END IF;
END;
/
--TRIGGER PARA COMPROBAR QUE UN CLIENTE NO SE PASE DE LISTO Y NO PAGUE MAS DE 3 CUENTAS
--PROBLEMA CON TABLA MUTANTES
--QUIERO COMPROBAR ANTES DE INSERTAR EN CADA COLUMNA QUE ESE CLIENTE NO TENGA MAS DE 3 CUENTAS A DEBER
--NECESITO BEFORE EACH ROW Y AFTER STATEMENT    
create or replace trigger t_morosos
for insert or update on venta
compound trigger
--creo un array para ir metiendo todos los clientes que voy insertando en venta
type t_cliente is table of venta.clienteID%type index by binary_integer;
a_cliente t_cliente;
    before each row is
    --Los voy insertando
    I binary_integer:=a_cliente.count;
    begin
        I:=I+1;
        a_cliente(I):=:new.clienteID;
    end before each row;
--despues de haber guardado todos mis clientes insertados    
after statement is
I BINARY_INTEGER;
v_sinPagar number(1);
v_maxSinPagar number :=3;
begin
    I:=a_cliente.first;
    --bucle para recorrer todos los clientes del array
    while I is not null loop
        --cuento cuantas cuentas sin pagar tiene el cliente de la posicion i
        select count(*)
        into v_sinPagar
        from venta
        where clienteID=a_cliente(I) and pagado=0;
        --como tenga mas de 3 cuentas me lo calzo
        if v_sinPagar > v_maxSinPagar then
            raise_application_error(-20000,'Como maximo 3 ventas sin pagar');
        end if;
        I:=a_cliente.next(I);
    end loop;
end after statement;
end;
/





