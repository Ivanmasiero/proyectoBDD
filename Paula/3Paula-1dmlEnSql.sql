SET SERVEROUTPUT ON
--Solo podemos utilizar DML (insert, update, delete, drop y select) 
--y TCL (Commit, Rollback y savepoints)
--Utiliza acoplamiento temprano (tarda mas en compilar pero menos en ejecutar)

--***********DDL****************
--NO PODEMOS HACER:
/*
BEGIN
     CREATE TABLE PEPE(
     ID NUMEBER);
END;
*/

--PERO SI:
create table alumno (
    id number,
    nombre varchar2(30));


--**********DML***************

--INSERT*********
begin
    insert into alumno (id,nombre)
    values (1,'Ivan');
    insert into alumno (id,nombre)
    values (2,'Jose');
    insert into alumno (id,nombre)
    values (3,'Mario');
    commit;
end;
/
--UPDATE*********
begin 
    update alumno
    set nombre = 'pepe'
    where id =1;
    commit;
end;
/
--DELETE**********
begin
    delete from alumno
    where id < 3;
    commit;
end;
/
--SELECT**********
declare
v_alumno alumno.nombre%type;
begin
    select nombre
    into v_alumno
    from alumno
    where id = 3;
    dbms_output.put_line(v_alumno);
end;