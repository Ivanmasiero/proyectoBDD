CLEAR SCREEN
SET SERVEROUTPUT ON;
-- Crear tabla temporal para almacenar números
CREATE TABLE tabla_bucles (
    numero NUMBER,
    descripcion VARCHAR2(50)
);

-- Programa PL/SQL que usa un bucle FOR para insertar números pares
DECLARE
    v_NumeroPar NUMBER;        -- Variable para guardar el número par
    v_Contador NUMBER;    -- Contador general

BEGIN
    -- BUCLE LOOP (salida con IF y EXIT)
    DBMS_OUTPUT.PUT_LINE(CHR(10) || 'Inicio del bucle LOOP:');

    v_Contador := 1; -- Inicializar el contador
    LOOP
        v_NumeroPar := v_Contador * 2;
        INSERT INTO tabla_bucles (numero, descripcion)
        VALUES (v_NumeroPar, 'Número par insertado (LOOP)');
        
        DBMS_OUTPUT.PUT_LINE(v_Contador ||'.Insertado número (LOOP): ' || v_NumeroPar);

        v_Contador := v_Contador + 1;

        -- Condición de salida utilizando IF
        IF v_Contador > 10 THEN
            EXIT;
        END IF;
    END LOOP;

    -- BUCLE WHILE
    DBMS_OUTPUT.PUT_LINE(CHR(10) || 'Inicio del bucle WHILE:');

    v_Contador := 1; -- Reiniciar el contador
    WHILE v_Contador <= 10 LOOP
        v_NumeroPar := v_Contador * 2;
        INSERT INTO tabla_bucles (numero, descripcion)
        VALUES (v_NumeroPar + 100, 'Número par insertado (WHILE)');  -- +100 para diferenciar registros

        DBMS_OUTPUT.PUT_LINE(v_Contador ||'.Insertado número (WHILE): ' || (v_NumeroPar + 100));
        v_Contador := v_Contador + 1;
    END LOOP;

    -- BUCLE FOR
    DBMS_OUTPUT.PUT_LINE(CHR(10) || 'Inicio del bucle FOR:');

    FOR i IN 1..10 LOOP
        v_NumeroPar := i * 2;
        INSERT INTO tabla_bucles (numero, descripcion)
        VALUES (v_NumeroPar + 200, 'Número par insertado (FOR)');  -- +200 para diferenciar registros

        DBMS_OUTPUT.PUT_LINE(i ||'.Insertado número (FOR): ' || (v_NumeroPar + 200));
    END LOOP;

    DBMS_OUTPUT.PUT_LINE(CHR(10) ||'Todos los bucles han terminado.');
END;
/

-- Eliminamos la tabla al final 
DROP TABLE tabla_bucles;