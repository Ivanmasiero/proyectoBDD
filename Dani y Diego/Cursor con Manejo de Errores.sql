/*
  EJEMPLO 6: SEGURO ANTIFALLOS
  
  Como un buen sistema debe:
  - Prepararse para lo inesperado
  - Limpiar después de sí mismo
  - Informar claramente cuando algo sale mal
*/

DECLARE
   -- Nuestro listado de empleados especiales
   CURSOR empleados_especiales IS
      SELECT NUMEMP, NOMBRE, SUELDO
      FROM EMPLEADO
      WHERE SUELDO > 3000
      ORDER BY SUELDO DESC;
      
   -- Variables para guardar datos
   v_codigo EMPLEADO.NUMEMP%TYPE;
   v_nombre EMPLEADO.NOMBRE%TYPE;
   v_sueldo EMPLEADO.SUELDO%TYPE;
   
   -- Contadores
   v_total_personas NUMBER := 0;
   v_total_sueldos NUMBER := 0;
BEGIN
   -- Verificamos si el listado no está abierto ya
   IF NOT empleados_especiales%ISOPEN THEN
      OPEN empleados_especiales;  -- Abrimos nuestro archivo
   END IF;
   
   DBMS_OUTPUT.PUT_LINE(' PLANILLA DE SALARIOS ALTOS ');
   DBMS_OUTPUT.PUT_LINE('-----------------------------');
   
   -- Intentamos procesar cada registro
   LOOP
      BEGIN  -- Iniciamos un bloque seguro
         FETCH empleados_especiales INTO v_codigo, v_nombre, v_sueldo;
         
         -- Terminamos de revisar
         EXIT WHEN empleados_especiales%NOTFOUND;
         
         -- Sumamos a nuestros contadores
         v_total_personas := v_total_personas + 1;
         v_total_sueldos := v_total_sueldos + v_sueldo;
         
         -- Mostramos la información
         DBMS_OUTPUT.PUT_LINE(
            'ID: ' || LPAD(v_codigo, 2) ||  -- Aseguramos 2 dígitos
            ' | ' || RPAD(v_nombre, 20) ||
            ' | Salario: ' || TO_CHAR(v_sueldo, '$99,999.99')
         );
         
      EXCEPTION  -- Por si algo sale mal con este registro
         WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error con empleado ' || v_codigo || ': ' || SQLERRM);
      END;
   END LOOP;
   
   -- Resumen final
   DBMS_OUTPUT.PUT_LINE('-----------------------------');
   DBMS_OUTPUT.PUT_LINE('Total empleados: ' || v_total_personas);
   DBMS_OUTPUT.PUT_LINE('Masa salarial: ' || TO_CHAR(v_total_sueldos, '$999,999.99'));
   DBMS_OUTPUT.PUT_LINE('Promedio: ' || TO_CHAR(v_total_sueldos/v_total_personas, '$999,999.99'));
   
   -- Cerramos el cursor si sigue abierto
   IF empleados_especiales%ISOPEN THEN
      CLOSE empleados_especiales;
   END IF;
   
EXCEPTION  -- Manejo de errores generales
   WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('No encontramos empleados con esos requisitos');
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Error inesperado: ' || SQLERRM);
      -- Aseguramos cerrar el cursor si hubo error
      IF empleados_especiales%ISOPEN THEN
         CLOSE empleados_especiales;
      END IF;
END;
/