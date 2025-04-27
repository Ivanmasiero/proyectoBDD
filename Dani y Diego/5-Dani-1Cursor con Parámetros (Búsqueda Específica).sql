/*
  EJEMPLO 4: BUSCADOR ESPECIALIZADO
  
  Como un filtro inteligente que:
  - Puede buscar por diferentes niveles de habilidad
  - Muestra empleados y sus oficios
  - Se adapta a lo que necesitamos en el momento
*/
DECLARE
   -- Definimos un cursor que acepta parámetros
   CURSOR buscador_habilidades(p_nivel VARCHAR2) IS
      SELECT E.NOMBRE, O.OFICIO, OE.CALIFICACION  
      FROM EMPLEADO E
      JOIN OFICIOEMPLEADO OE ON E.NUMEMP = OE.EMPLEADO  
      JOIN OFICIO O ON OE.OFICIO = O.NUMOFICIO
      WHERE OE.CALIFICACION = p_nivel  
      ORDER BY E.NOMBRE;
      
   -- Variable para el nivel de búsqueda
   v_nivel_busqueda VARCHAR2(16) := 'Avanzado';
BEGIN
   -- Primera búsqueda: Nivel avanzado
   DBMS_OUTPUT.PUT_LINE('EMPLEADOS ' || v_nivel_busqueda || '');
   DBMS_OUTPUT.PUT_LINE('----------------------------');
   
   -- Usamos "registro" como variable de bucle para mayor claridad
   FOR registro IN buscador_habilidades(v_nivel_busqueda) LOOP
      DBMS_OUTPUT.PUT_LINE(
         'Nombre: ' || RPAD(registro.NOMBRE, 20) ||
         ' | Oficio: ' || RPAD(registro.OFICIO, 20) ||
         ' | Nivel: ' || registro.CALIFICACION  
      );
   END LOOP;
   
   -- Segunda búsqueda: Nivel experto
   DBMS_OUTPUT.PUT_LINE(CHR(10) || 'LOS EXPERTOS ');
   DBMS_OUTPUT.PUT_LINE('----------------------------');
   
   -- Misma variable de bucle "registro" para consistencia
   FOR registro IN buscador_habilidades('Experto') LOOP
      DBMS_OUTPUT.PUT_LINE(
         'Nombre: ' || RPAD(registro.NOMBRE, 20) ||
         ' | Especialidad: ' || registro.OFICIO
      );
   END LOOP;
END;
/
commit;
/