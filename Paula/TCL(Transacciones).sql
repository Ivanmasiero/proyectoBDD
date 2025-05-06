--TLC Instrucciones de control de transacciones

--Commit
begin
    insert into libro (id, titulo, autor)
    values(5, 'Hamlet', 'Shakespeare');
    commit;
end;
/

--Rollback
--Insertamos un libro y dentro del mismo bloque hacemos rollback
begin
    insert into libro (id, titulo, autor)
    values(6, 'El Señor de los Anillos', 'J.R.R. Tolkien');
    rollback;
end;
/

select * from libro;

--Savepoints
begin
    insert into libro (id, titulo, autor)
    values(7, 'El hobbit', 'J.R.R. Tolkien');
    savepoint A;
    
    insert into libro (id, titulo, autor)
    values(8, 'El gran Gatsby', 'F. Scott Fitzgerald');
    savepoint B;
    
    insert into libro (id, titulo, autor)
    values(9, 'Las aventuras de Pinocho', 'Carlo Collodi');
    savepoint C;
    
    rollback to A;
    commit;
end;
/

select * from libro;
    
