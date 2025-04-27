set serveroutput on;

DECLARE
  v_salario number := 10;
  v_min number:=0.50;
  v_max number:=5;
BEGIN
  if v_salario < v_min or v_salario > v_max then
    raise_application_error(-20001,'Sueldo fuera de rango: ' || v_salario ||'. Debe estar entre ' || v_min || ' y '|| v_max);
  end if;

  insert into empleado(numemp, nombre, edad, alojamiento, sueldo)
  values (99, 'Prueba', 30, 1, v_salario);
  commit;
EXCEPTION
  when others then
    dbms_output.put_line('Error: ' || SQLCODE || ' - ' || SQLERRM);
END;






