/*
Vamos a ver como se comportan las restricciones con el %type
El campo numemp es number(2)
*/

CREATE OR REPLACE FUNCTION poner100(
p_numemp in out empleado.numemp%type
) RETURN NUMBER AS
BEGIN
    p_numemp:=100;
    return p_numemp;
END poner100;
/

declare
v_numemp number;
BEGIN
dbms_output.put_line('Numero de empleado ' ||poner100(v_numemp));
END;
/
