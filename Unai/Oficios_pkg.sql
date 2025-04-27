--Cabecera del paquete
CREATE OR REPLACE PACKAGE OFICIOS_PKG IS
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

--Cuerpo del paquete
CREATE OR REPLACE PACKAGE BODY OFICIOS_PKG IS
   PRAGMA SERIALLY_REUSABLE;

   PROCEDURE listar_oficios(p_empleado_id EMPLEADO.NUMEMP%TYPE) IS
   --Si descomentaramos esta línea, el programa daria error por que este procedimiento
   --no se llama así en la cabecera.
   --PROCEDURE lista_de_oficios(p_empleado_id EMPLEADO.NUMEMP%TYPE) IS
   BEGIN
      v_empleado_id := p_empleado_id;

      FOR rec IN cur_oficios LOOP
         DBMS_OUTPUT.PUT_LINE('Oficio: ' || rec.OFICIO);
      END LOOP;
   END listar_oficios;
   --END lista_de_oficios;


BEGIN
   -- Parte de inicialización (opcional)
   v_empleado_id := NULL;
END OFICIOS_PKG;
/
