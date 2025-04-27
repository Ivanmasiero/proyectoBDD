--TCL (Lenguaje de transicion de datos)
--COMMIT, ROLLBACK Y SAVEPOINTS
--Nos permitira guardar las transaciones o volver a tras.


--ROLLBACK****************
--PONER -- EN LA SIGUIENTE LINEA
/*
begin
    insert into alumno(id, nombre) values (2,'ivan');
    insert into alumno(id, nombre) values (3,'pedro');
    insert into alumno(id, nombre) values (4,'juan');
end;
/
rollback;
/
select * from alumno;
--*/


--COMMIT*****************
--PONER -- EN LA SIGUIENTE LINEA
/*
begin
    insert into alumno(id, nombre) values (2,'ivan');
    insert into alumno(id, nombre) values (3,'pedro');
    insert into alumno(id, nombre) values (4,'juan');
    commit;
end;
/
rollback;
/
select * from alumno;
--*/


--SAVEPOINTS*****************
--PONER -- EN LA SIGUIENTE LINEA
/*
begin
    insert into alumno(id, nombre) values (5,'cristiano');
    savepoint a;
    insert into alumno(id, nombre) values (6,'benzema');
    savepoint b;
    insert into alumno(id, nombre) values (7,'bale');
    savepoint c;
    rollback to a;
end;
/
select * from alumno;
--*/