SET SERVEROUTPUT ON
--Solo podemos utilizar DML (insert, update, delete, drop y select) 
--y TCL (Commit, Rollback y savepoints)
--Utiliza acoplamiento temprano (tarda mas en compilar pero menos en ejecutar)

--DDL Definición de datos
--No podemos hacer:
/*
begin
     create table libro(
     id number);
end;
*/
--Daría un error de compilación

--Pero sí podemos hacer:
create table libro (
    id number,
    titulo varchar2(50),
    autor varchar(40));
--No es un bloque de pl/sql sino uno de SQL

--DML Manipulación de datos

--Insert
begin
    insert into libro (id, titulo, autor)
    values(1, 'Don Quijote de la Mancha', 'Miguel de Cervantes');
    
    insert into libro (id, titulo, autor)
    values(2, 'Harry Potter y el caliz de fuego', 'J. K. Rowling');
    
    insert into libro (id, titulo, autor)
    values(3, 'Arsene Lupin. Caballero ladron', 'Lewis Carroll');
    
    insert into libro (id, titulo, autor)
    values(4, 'El codigo Da Vinci', 'Leonardo');
    
    commit;
end;
/

--Update
begin
    update libro
    set autor='Dan Brown'
    where id=4;
    commit;
end;
/

--Delete
declare
v_idLibro libro.id%type;
begin
    v_idlibro:=1;
    delete from libro
    where id=v_idlibro;
    commit;
end;
/

/*No se debe hacer:
declare
    id number:=1;
begin
    delete from libro
    where id=id;
    commit;
end;
/
--Ya que si la variable se llama igual que la columna borra todo
*/

--Select
declare
    v_titulo libro.titulo%type;
begin
    select titulo into v_titulo
    from libro
    where id=2;
    dbms_output.put_line(v_titulo);
end;
/

select * from libro