set serveroutput on;

-- Creamos aqui la tabla donde pondremos los errores
create table errores(
codigo number, 
mensaje varchar2(200), 
descripcion varchar2(200));
DECLARE
  v_codigo number;
  v_mensaje  varchar2(200);
BEGIN
  -- Dividimos por 0 para forzar un error 
  dbms_output.put_line(10 / 0);
  
EXCEPTION
  when zero_divide then
    v_codigo := sqlcode;
    v_mensaje  := sqlerrm;

    insert into errores(codigo,mensaje, descripcion)
    values (v_codigo, v_mensaje, 'Has dividido por 0 tonto');
    commit;
END;
/
--Seleccionamos *de la tabla y después la borramos
select * from errores;
drop table errores;





