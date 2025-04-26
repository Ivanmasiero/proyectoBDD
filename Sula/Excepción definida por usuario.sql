set serveroutput on;

DECLARE
  e_muchosEmpleados EXCEPTION;
  v_cuenta number;
  v_maximo number:=5;
BEGIN
  select count(*)
    into v_cuenta
    from EMPLEADO
    where ALOJAMIENTO = 5;

  if v_cuenta >= v_maximo then
    RAISE e_MuchosEmpleados;
  end if;

  dbms_output.put_line('Hay ' || v_cuenta || ' empleados');
EXCEPTION
  when e_MuchosEmpleados then
    dbms_output.put_line('ERROR: el alojamiento 2 tiene ' || v_cuenta ||' empleados (máx permitido ' || v_maximo||').');
END;






