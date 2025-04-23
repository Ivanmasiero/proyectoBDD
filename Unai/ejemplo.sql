-- 1. Borra la tabla si ya existe para evitar errores al volver a ejecutar
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE usuarios_conectados';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

-- 2. Crea una tabla simulando usuarios conectados
CREATE TABLE usuarios_conectados (
  nombre VARCHAR2(100)
);

-- 3. Inserta datos de prueba
INSERT INTO usuarios_conectados VALUES ('Alice');
INSERT INTO usuarios_conectados VALUES ('Bob');
COMMIT;

-- 4. Especificación del paquete (interfaz pública)
CREATE OR REPLACE PACKAGE gestor_sesion AS
  -- Variable pública: total de visitas en la sesión actual
  v_visitas_global NUMBER;

  -- Procedimientos sobrecargados
  PROCEDURE iniciar_sesion; -- Sin parámetros
  PROCEDURE iniciar_sesion(nombre_usuario VARCHAR2); -- Con nombre

  -- Función que devuelve las visitas globales
  FUNCTION visitas_actuales RETURN NUMBER;

  -- Cursor explícito sobre la tabla
  CURSOR usuarios IS SELECT nombre FROM usuarios_conectados;
END gestor_sesion;
/

-- 5. Cuerpo del paquete (implementación interna)
CREATE OR REPLACE PACKAGE BODY gestor_sesion AS
  -- Variables privadas: sólo visibles dentro del paquete
  v_usuario VARCHAR2(100) := 'Invitado';
  v_visitas_sesion NUMBER := 0;

  -- Procedimiento sin parámetros
  PROCEDURE iniciar_sesion IS
  BEGIN
    v_visitas_sesion := v_visitas_sesion + 1;
    v_visitas_global := NVL(v_visitas_global, 0) + 1;
    DBMS_OUTPUT.PUT_LINE('Sesión iniciada como ' || v_usuario);
  END;

  -- Procedimiento con nombre personalizado
  PROCEDURE iniciar_sesion(nombre_usuario VARCHAR2) IS
  BEGIN
    v_usuario := nombre_usuario;
    v_visitas_sesion := v_visitas_sesion + 1;
    v_visitas_global := NVL(v_visitas_global, 0) + 1;
    DBMS_OUTPUT.PUT_LINE('Bienvenido, ' || v_usuario || '. Visitas en esta sesión: ' || v_visitas_sesion);
  END;

  -- Función que devuelve el total de visitas globales
  FUNCTION visitas_actuales RETURN NUMBER IS
  BEGIN
    RETURN v_visitas_global;
  END;

END gestor_sesion;
/

-- 6. Bloque anónimo de prueba: ejecuta funciones y procedimientos del paquete
BEGIN
  -- Inicia sesión como "Carlos"
  gestor_sesion.iniciar_sesion('Carlos');

  -- Inicia otra sesión como el usuario por defecto ("Invitado")
  gestor_sesion.iniciar_sesion;

  -- Muestra el número total de visitas registradas en esta sesión
  DBMS_OUTPUT.PUT_LINE('Total global de visitas: ' || gestor_sesion.visitas_actuales);

  -- Usa el cursor del paquete para mostrar los usuarios conectados
  FOR u IN gestor_sesion.usuarios LOOP
    DBMS_OUTPUT.PUT_LINE('Usuario conectado: ' || u.nombre);
  END LOOP;
END;
/
