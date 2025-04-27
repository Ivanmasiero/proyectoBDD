/*
  EJEMPLO 4: BUSCADOR ESPECIALIZADO
  
  Como un filtro inteligente que:
  - Puede buscar por diferentes niveles de habilidad
  - Muestra empleados y sus oficios
  - Se adapta a lo que necesitamos en el momento
*/

DECLARE
   -- Definimos un buscador configurable
   CURSOR buscador_habilidades(p_nivel VARCHAR2) IS
      SELECT E.NOMBRE, O.OFICIO, OE.CALIFICACIÓN
      FROM EMPLEADO E
      JOIN OFICIOEMPLEADO OE ON E.NUMEMP = OE.EMPLEADO
      JOIN OFICIO O ON OE.OFICIO = O.NUMOFICIO
      WHERE OE.CALIFICACIÓN = p_nivel  -- El filtro variable
      ORDER BY E.NOMBRE;
      
   -- Nivel inicial de búsqueda
   v_mi_nivel VARCHAR2(16) := 'Avanzado';
BEGIN
   -- Primera búsqueda: Nivel avanzado
   DBMS_OUTPUT.PUT_LINE(' EMPLEADOS ' || v_mi_nivel ||'');
   DBMS_OUTPUT.PUT_LINE('----------------------------');
   
   FOR resultado IN buscador_habilidades(v_mi_nivel) LOOP
      DBMS_OUTPUT.PUT_LINE(
         'Nombre: ' || RPAD(resultado.NOMBRE, 20) ||
         ' | Oficio: ' || RPAD(resultado.OFICIO, 20) ||
         ' | Nivel: ' || resultado.CALIFICACIÓN
      );
   END LOOP;
   
   -- Segunda búsqueda directa: Expertos
   DBMS_OUTPUT.PUT_LINE(CHR(10) || ' LOS EXPERTOS ');
   DBMS_OUTPUT.PUT_LINE('----------------------------');
   
   FOR resultado IN buscador_habilidades('Experto') LOOP
      DBMS_OUTPUT.PUT_LINE(
         'Nombre: ' || RPAD(resultado.NOMBRE, 20) ||
         ' | Especialidad: ' || resultado.OFICIO
      );
   END LOOP;
END;
/