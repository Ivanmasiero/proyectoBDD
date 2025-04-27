/*
  EJEMPLO 5: ATAJO EFICIENTE
  
  Para cuando necesitamos:
  - Resultados rápidos sin mucha preparación
  - Como hacer una consulta rápida en una reunión
  - Sin preocuparnos por detalles técnicos
*/

BEGIN
   DBMS_OUTPUT.PUT_LINE(' ALOJAMIENTOS LEJANOS (>50KM) ');
   DBMS_OUTPUT.PUT_LINE('----------------------------------');
   
   -- Consulta directa en el FOR (como nota rápida)
   FOR casa IN (
      SELECT NUMALOJ, ALOJAMIENTO, DIRECCION, DISTANCIA
      FROM ALOJAMIENTO
      WHERE DISTANCIA > 50              -- Solo los lejanos
      ORDER BY DISTANCIA DESC           -- Del más lejano al menos
   ) LOOP
      -- "casa" contiene automáticamente todos los campos
      DBMS_OUTPUT.PUT_LINE(
         'Lugar: ' || RPAD(casa.ALOJAMIENTO, 15) ||
         ' | Ubicación: ' || RPAD(casa.DIRECCION, 25) ||
         ' | Distancia: ' || casa.DISTANCIA || ' km'
      );
   END LOOP;
   
   -- ¿Cuántos encontramos? (contador automático)
   DBMS_OUTPUT.PUT_LINE('----------------------------------');
   DBMS_OUTPUT.PUT_LINE('Total lugares remotos: ' || SQL%ROWCOUNT);
END;
/
commit;
/