/*
Este código concatena las un número con una letra.
Con este programa podemos ver como funcionan las restricciones.
*/

create or replace function concatena(
    p_numero number,
    --p_letra varchar(1); --esto no funciona, ya que hereda las restricciones del parametro real
    p_letra char
    ) RETURN VARCHAR AS
    v_aux varchar(9); 
    BEGIN
        v_aux:= p_numero||p_letra;
        return v_aux;
    END concatena;
/
--Lo de arriba compilará, pero al utilizarlo no funciona, ya que concatena 9 y lo intenta guardar en 8.
declare
--al concatenar suma mas de 9
v_texto varchar(8);
v_numero number(8,0):=12345678;
v_letra char(1):='L';
BEGIN
v_texto:=concatena(v_numero,v_letra);
dbms_output.put_line(v_texto);

END;
/
