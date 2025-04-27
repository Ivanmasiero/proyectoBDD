/*
  EJEMPLO 1: EL ASISTENTE DE ORACLE
  
  Imagina que Oracle tiene un ayudante invisible que:
  - Se encarga de las consultas simples por ti
  - Aparece cuando haces UPDATE, INSERT o DELETE
  - Lleva cuenta de cuántos registros afectaste
*/

BEGIN
   -- Le decimos al asistente: "Aumenta los sueldos en 5% a quienes viven en alojamiento 1"
   UPDATE EMPLEADO 
   SET SUELDO = SUELDO * 1.05
   WHERE ALOJAMIENTO = 1;
   
   -- Preguntamos: "¿Cuántos empleados actualizaste?"
   DBMS_OUTPUT.PUT_LINE('Empleados beneficiados: ' || SQL%ROWCOUNT || ' personas');
   
   -- Verificamos si nuestro cambio hizo efecto
   IF SQL%FOUND THEN
      DBMS_OUTPUT.PUT_LINE('Aumento aplicado con éxito');
   ELSE
      DBMS_OUTPUT.PUT_LINE('Nadie vive en ese alojamiento');
   END IF;
END;
/
commit;
/