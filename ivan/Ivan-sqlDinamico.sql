--1. EJECUTAR DLL (CREATE, ALTER, DROP)
--2. SELECICIONAR DESDE TABLAS O COLUMNAS VARIABLES 
--3. Construir consultas en tiempo de ejecución (a través de variables)
--4. DCL (control de permisos: grant,revoke)
--5. TODO EN BLOQUE SEPARADO POR PUNTO Y COMA
declare
v_accion VARCHAR2(300);
v_edad number;
v_nombre VARCHAR2(30);
v_nombreTabla varchar2(30);
begin
    
    --(1)
    v_nombreTabla:='prueba_test';
    v_accion:='create table '||v_nombreTabla||' (id number(2), nombre varchar2(30))';
    execute immediate v_accion;
    --(2)
    execute immediate 'insert into '||v_nombreTabla||' (id,nombre) values (1,''pepe'')';
    --(3)
    execute immediate 'select nombre from '||v_nombreTabla||' where id = 1' into v_nombre;
    --(1)
    dbms_output.put_line(v_nombre);
    execute immediate 'drop table '||v_nombreTabla;
    --(4)
    execute immediate 'grant select on empleado to tema4';
    execute immediate 'revoke select on empleado from tema4';
    --(5)
    v_accion:='
    declare
    v_edad number(2);
    begin 
        for i in 1..9 loop
            select edad into v_edad from empleado where numemp = i;
            dbms_output.put_line(''Empleado numero -> ''||i||''  Edad-> ''||v_edad);     
        end loop;
    end;';
    execute immediate v_accion;     
    
end;




