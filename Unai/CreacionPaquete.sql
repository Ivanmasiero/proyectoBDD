CREATE OR REPLACE PACKAGE paquete_empleados IS
  -- Tipo para el cursor de los oficios
  TYPE cursor_oficioempleado IS REF CURSOR;

  -- Contadores
  llamadas NUMBER := 0;
  contador_empleados NUMBER := 0;

  -- Funciones públicas
  FUNCTION obtener_datos_empleado(p_numemp NUMBER) RETURN VARCHAR2;
  FUNCTION obtener_oficios_empleado(p_numemp NUMBER) RETURN cursor_oficioempleado;
  FUNCTION obtener_alojamiento_empleado(p_numemp NUMBER) RETURN VARCHAR2;

  -- Procedimientos públicos
  PROCEDURE agregar_empleado(p_numemp NUMBER, p_nombre CHAR);
  FUNCTION total_empleados RETURN NUMBER;
END paquete_empleados;
/

CREATE OR REPLACE PACKAGE BODY paquete_empleados IS

  FUNCTION obtener_datos_empleado(p_numemp NUMBER) RETURN VARCHAR2 IS
    v_nombre EMPLEADO.NOMBRE%TYPE;
    v_sueldo EMPLEADO.SUELDO%TYPE;
  BEGIN
    llamadas := llamadas + 1;
    SELECT NOMBRE, SUELDO INTO v_nombre, v_sueldo
    FROM EMPLEADO
    WHERE NUMEMP = p_numemp;
    RETURN 'Nombre: ' || v_nombre || ', Sueldo: ' || v_sueldo;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RETURN 'Empleado no encontrado.';
  END;

  FUNCTION obtener_oficios_empleado(p_numemp NUMBER) RETURN cursor_oficioempleado IS
    c_oficios cursor_oficioempleado;
  BEGIN
    llamadas := llamadas + 1;
    OPEN c_oficios FOR
      SELECT O.OFICIO, OE.CALIFICACION
      FROM OFICIOEMPLEADO OE
      JOIN OFICIO O ON OE.OFICIO = O.NUMOFICIO
      WHERE OE.EMPLEADO = p_numemp;
    RETURN c_oficios;
  END;

  FUNCTION obtener_alojamiento_empleado(p_numemp NUMBER) RETURN VARCHAR2 IS
    v_info VARCHAR2(200);
  BEGIN
    llamadas := llamadas + 1;
    SELECT 'Alojamiento: ' || A.ALOJAMIENTO || ', Responsable: ' || A.RESPONSABLE
    INTO v_info
    FROM EMPLEADO E
    JOIN ALOJAMIENTO A ON E.ALOJAMIENTO = A.NUMALOJ
    WHERE E.NUMEMP = p_numemp;
    RETURN v_info;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RETURN 'Alojamiento no encontrado.';
  END;

  PROCEDURE agregar_empleado(p_numemp NUMBER, p_nombre CHAR) IS
  BEGIN
    INSERT INTO EMPLEADO(NUMEMP, NOMBRE) VALUES(p_numemp, p_nombre);
    contador_empleados := contador_empleados + 1;
  END;

  FUNCTION total_empleados RETURN NUMBER IS
    v_total NUMBER;
  BEGIN
    SELECT COUNT(*) INTO v_total FROM EMPLEADO;
    RETURN v_total;
  END;

END paquete_empleados;
/
