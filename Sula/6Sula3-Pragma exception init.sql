set serveroutput on;

DECLARE
  e_sinNulos exception;
  pragma exception_init(e_sinNulos, -1400);
BEGIN
  insert into oficioempleado(empleado, oficio, calificacion)
  values (77,null,'Ponnos un 10 Julio');
  commit;
EXCEPTION
  when e_sinNulos then
    dbms_output.put_line('Error controlado: no se permiten nulos');
END;





