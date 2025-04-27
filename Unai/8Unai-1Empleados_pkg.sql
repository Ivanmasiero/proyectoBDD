-- Cabecera del paquete
-- En esta parte se declararán variables, tipos, procedimientos, cursores, funciones, constantes y/o excepciones agrupadas bajo un mismo nombre

CREATE OR REPLACE PACKAGE EMPLEADOS_PKG IS
-- Variables públicas
v_total_empleados NUMBER;

-- Tipo de dato para un empleado
TYPE t_empleado IS RECORD (
    nombre EMPLEADO.NOMBRE%TYPE,
    sueldo EMPLEADO.SUELDO%TYPE
);

-- Cursor para recorrer empleados
CURSOR cur_empleados IS
    SELECT NOMBRE, SUELDO FROM EMPLEADO;

-- Procedimientos 
-- Podemos modificar el acceso de partes del paquete como datos o procedimientos
-- En este caso daria error al descomentar la linea porque no puede compilarse referenciando a un paquete que no existe
PROCEDURE contar_empleados; --ACCESSIBLE BY EMPLEADOS2_PKG;
PROCEDURE mostrar_empleados;
END EMPLEADOS_PKG;
/


-- Cuerpo del paquete
-- Esta parte no es necesaria si el paquete no tiene cursores ni subprogramas
CREATE OR REPLACE PACKAGE BODY EMPLEADOS_PKG IS

-- Procedimiento para contar empleados
PROCEDURE contar_empleados IS
BEGIN
    SELECT COUNT(*) INTO v_total_empleados
    FROM EMPLEADO;
END contar_empleados;

-- Procedimiento para mostrar empleados
PROCEDURE mostrar_empleados IS
BEGIN
    -- Recorrer con el cursor e imprimir el nombre del empleado y su sueldo
    FOR rec IN cur_empleados LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Empleado: ' || rec.nombre || 
            ', Sueldo: ' || NVL(TO_CHAR(rec.sueldo), 'SIN SUELDO')
        );
    END LOOP;
END mostrar_empleados;

BEGIN
-- Parte de inicialización
-- Esta parte se inicia automáticamente cuando se crea la instancia del paquete por primera vez en la sesión
    v_total_empleados := 0;
END EMPLEADOS_PKG;
/
