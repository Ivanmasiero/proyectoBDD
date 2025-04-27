/*
  EJEMPLO 3:  CURSOR Y JOIN
  
  Aquí jugamos a conectar pistas por asi decirlo:
  - Unimos información de empleados con sus alojamientos
  - Como quien cruza datos en una investigación
  - Todo queda ordenado y presentado claramente
*/

DECLARE
   -- Creamos una "tabla mental" combinando ambas fuentes
   CURSOR empleados_con_vivienda IS
      SELECT E.NUMEMP, E.NOMBRE AS NOMBRE_EMP, 
             A.ALOJAMIENTO AS NOMBRE_CASA, A.DIRECCION
      FROM EMPLEADO E
      JOIN ALOJAMIENTO A ON E.ALOJAMIENTO = A.NUMALOJ  -- La clave que los relaciona
      ORDER BY A.ALOJAMIENTO, E.NOMBRE;
      
   -- Variable que guardará cada "ficha combinada"
   r_registro empleados_con_vivienda%ROWTYPE;
BEGIN
   DBMS_OUTPUT.PUT_LINE('REPORTE: EMPLEADOS Y SUS VIVIENDAS');
   DBMS_OUTPUT.PUT_LINE('=====================================');
   
   -- El FOR hace todo el trabajo pesado por nosotros
   FOR r_registro IN empleados_con_vivienda LOOP
      DBMS_OUTPUT.PUT_LINE(
         'Empleado: ' || RPAD(r_registro.NOMBRE_EMP, 20) ||
         ' | Reside en: ' || RPAD(r_registro.NOMBRE_CASA, 15) ||
         ' | Dirección: ' || r_registro.DIRECCION
      );
   END LOOP;
   
   -- Sin necesidad de limpiar El FOR cierra todo automático
END;
/