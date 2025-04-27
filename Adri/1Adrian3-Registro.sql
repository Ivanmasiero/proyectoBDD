CLEAR SCREEN
SET SERVEROUTPUT ON;
-- Crear tabla de estudiantes
CREATE TABLE estudiantes (
    idestudiante NUMBER(5),
    nombre VARCHAR2(20),
    apellido VARCHAR2(20)
);

-- Crear tabla de respaldo de estudiantes
CREATE TABLE estudiantes_respaldo (
    idestudiante NUMBER(5),
    nombre VARCHAR2(20),
    apellido VARCHAR2(20)
);

-- Insertar un registro de ejemplo en estudiantes
INSERT INTO estudiantes (idestudiante, nombre, apellido)
VALUES (101, 'Juan', 'Pérez');

COMMIT;

-- Programa PL/SQL que usa un registro para copiar datos
DECLARE
    v_Estudiante estudiantes%ROWTYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Inicio de la copia de registro del estudiante');

    -- Recuperamos un estudiante de la tabla
    SELECT *
    INTO v_Estudiante
    FROM estudiantes
    WHERE idestudiante = 101;

    DBMS_OUTPUT.PUT_LINE('Estudiante recuperado: ' || v_estudiante.nombre || ' ' || v_Estudiante.apellido);

    -- Insertamos ese registro en la tabla de respaldo
    INSERT INTO estudiantes_respaldo
    VALUES v_Estudiante;

    DBMS_OUTPUT.PUT_LINE('Estudiante insertado en la tabla de respaldo');
END;
/
drop table estudiantes;
drop table estudiantes_respaldo;