-- Cabecera del paquete
CREATE OR REPLACE PACKAGE OFICIOS_PKG IS
--Esta línea hace que el paquete sea Serially Reusable (Serialmente Reutilizable),
--en estos paquetes no se pueden usar triggers ni subprogramas invocados por SQL.
   PRAGMA SERIALLY_REUSABLE;

   -- Variables públicas
   v_empleado_id EMPLEADO.NUMEMP%TYPE;

   -- Cursor para ver los oficios de un empleado
   CURSOR cur_oficios IS
      SELECT O.OFICIO
      FROM OFICIOEMPLEADO OE
      JOIN OFICIO O ON OE.OFICIO = O.NUMOFICIO
      WHERE OE.EMPLEADO = v_empleado_id;

   -- Procedimientos
   PROCEDURE listar_oficios(p_empleado_id EMPLEADO.NUMEMP%TYPE);
END OFICIOS_PKG;
/

-- Cuerpo del paquete
CREATE OR REPLACE PACKAGE BODY OFICIOS_PKG IS
--También hay que poner esta línea en el cuerpo
   PRAGMA SERIALLY_REUSABLE;

   PROCEDURE listar_oficios(p_empleado_id EMPLEADO.NUMEMP%TYPE) IS
   -- Si descomentaramos esta línea, el programa daria error por que este procedimiento
   -- no se llama así en la cabecera.
   -- PROCEDURE lista_de_oficios(p_empleado_id EMPLEADO.NUMEMP%TYPE) IS
   BEGIN
      v_empleado_id := p_empleado_id;
      DBMS_OUTPUT.PUT_LINE('Oficios del empleado número ' || v_empleado_id);
    -- Recorrer con el cursor e imprimir el oficio del empleado
      FOR rec IN cur_oficios LOOP
         DBMS_OUTPUT.PUT_LINE('Oficio: ' || rec.OFICIO);
      END LOOP;
   END listar_oficios;
   --END lista_de_oficios;


BEGIN
   -- Parte de inicialización
   -- Esta parte se inicia automáticamente cuando se crea la instancia del paquete por primera vez en la sesión
   v_empleado_id := NULL;
END OFICIOS_PKG;
/
