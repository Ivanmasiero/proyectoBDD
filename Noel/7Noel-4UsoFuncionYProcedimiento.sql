DECLARE
v_res number:= 0;
BEGIN
    cuantosTienenCasa(v_res);
    dbms_output.put_line(v_res || ' empleado/s tienen casa');
END;
/