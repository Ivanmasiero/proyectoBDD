-- Activar salida de mensajes
CLEAR SCREEN
SET SERVEROUTPUT ON;

-- Crear tabla simple de productos
CREATE TABLE productos (
    id NUMBER,
    nombre VARCHAR2(50),
    precio NUMBER
);

-- Programa PL/SQL que inserta productos y clasifica según el precio
DECLARE
    v_Precio NUMBER := 48; -- Variable para precio (puedes cambiarlo)
    v_Categoria VARCHAR2(20);
BEGIN
    -- Insertamos un producto
    INSERT INTO productos (id, nombre, precio)
    VALUES (1, 'Producto A', v_Precio);

    -- Usamos CASE para asignar una categoría según el precio
    CASE 
        WHEN v_Precio < 20 THEN
            v_Categoria := 'Barato';
        WHEN v_Precio BETWEEN 20 AND 50 THEN
            v_Categoria := 'Normal';
        ELSE
            v_Categoria := 'Caro';
    END CASE;

    DBMS_OUTPUT.PUT_LINE('El producto es de categoría: ' || v_Categoria);

    -- Usamos IF para comprobar si es caro
    IF v_Precio > 49 THEN
        DBMS_OUTPUT.PUT_LINE('¡Advertencia: Producto muy caro!');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Precio razonable.');
    END IF;
END;
/

-- Borrar tabla al final (opcional)
DROP TABLE productos;