--Al compilarse en la base de datos, se puede acceder desde cualquier bloque (a no ser de que se borre el procedimiento/funcion, claro)
create or replace function tieneCasa(
    p_emp in number) RETURN BOOLEAN AS
v_aloj number;
BEGIN
    select alojamiento into v_aloj from empleado
    where numemp = p_emp;
    IF (v_aloj is not null) THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END tieneCasa;
/

create or replace procedure cuantosTienenCasa(
p_res out number)
IS
    v_emp number;
    v_max number;
    BEGIN
    --hay que inicializarlo de nuevo; al pasarse nulo, no funciona como se espera (también se podría poner como in out, pero podría alterar los resultados)
    p_res:=0;
        select count(*) into v_max from empleado;
        for i IN 1 .. v_max LOOP
            IF tieneCasa(i) THEN
                dbms_output.put_line('el empleado '|| i || ' tiene casa');
                p_res:= p_res+1;
            END IF;
        END LOOP;
    END cuantosTienenCasa;
/


--se puede usar desde otro bloque como se ve aquí abajo
DECLARE
v_res number:= 0;
BEGIN
    cuantosTienenCasa(v_res);
    dbms_output.put_line(v_res || ' empleado/s tienen casa');

END;
/