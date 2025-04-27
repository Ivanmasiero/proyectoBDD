/*
  EJEMPLO 2: EL RECORRIDO PASO A PASO
  
  Aquí tomamos el control total:
  - Preparamos una lista de empleados bien pagados
  - La revisamos uno por uno como un jefe revisando hojas de vida
  - Contamos cuántos cumplen el requisito
*/

DECLARE
   -- Preparamos nuestro "listado de candidatos"
   CURSOR lista_empleados IS 
      SELECT NUMEMP, NOMBRE, SUELDO 
      FROM EMPLEADO 
      ORDER BY SUELDO DESC;  -- Del mejor pagado al menos
      
   -- Variables para guardar los datos de cada persona
   v_codigo EMPLEADO.NUMEMP%TYPE;
   v_nombre EMPLEADO.NOMBRE%TYPE;
   v_salario EMPLEADO.SUELDO%TYPE;
BEGIN
   -- Abrimos nuestro archivo (el cursor)
   OPEN lista_empleados;
   
   DBMS_OUTPUT.PUT_LINE(' TOP EMPLEADOS POR SALARIO ');
   DBMS_OUTPUT.PUT_LINE('------------------------------');
   
   -- Empezamos a revisar cada registro
   LOOP
      -- Tomamos un registro del listado
      FETCH lista_empleados INTO v_codigo, v_nombre, v_salario;
      
      -- Llegamos al final del listado
      EXIT WHEN lista_empleados%NOTFOUND;
      
      -- Mostramos la información bonita
      DBMS_OUTPUT.PUT_LINE(
         'ID: ' || v_codigo || 
         ' | ' || RPAD(v_nombre, 20) ||  -- Aseguramos que los nombres queden alineados
         ' | Salario: ' || TO_CHAR(v_salario, '$999,999.99')  -- Formato de dinero
      );
   END LOOP;
   
   -- Resumen final
   DBMS_OUTPUT.PUT_LINE('------------------------------');
   DBMS_OUTPUT.PUT_LINE('Total superempleados: ' || lista_empleados%ROWCOUNT || ' estrellas');
   
   -- Cerramos el archivo (importante para no gastar memoria)
   CLOSE lista_empleados;
END;
/
commit;
/