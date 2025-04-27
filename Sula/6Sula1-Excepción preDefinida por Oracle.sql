set serveroutput on;

DECLARE
  v_nombre empleado.nombre%type;
BEGIN
  select nombre
    into v_nombre
    from empleado
    where numemp = 99;  -- Ponemos un numemp qque no exista

   dbms_output.put_line('Empleado: ' || v_nombre);
EXCEPTION
  when NO_DATA_FOUND then
    dbms_output.put_line('No se encontró el empleado 99.');
END;






