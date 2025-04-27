--Cabecera del paquete
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
   PROCEDURE contar_empleados;
   PROCEDURE mostrar_empleados;
END EMPLEADOS_PKG;
/


--Cuerpo del paquete
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
      FOR rec IN cur_empleados LOOP
         DBMS_OUTPUT.PUT_LINE(
            'Empleado: ' || rec.nombre || 
            ', Sueldo: ' || NVL(TO_CHAR(rec.sueldo), 'SIN SUELDO')
         );
      END LOOP;
   END mostrar_empleados;

BEGIN
   -- Parte de inicialización
   v_total_empleados := 0;
END EMPLEADOS_PKG;
/
