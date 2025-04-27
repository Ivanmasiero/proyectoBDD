-- Contar empleados
BEGIN
   EMPLEADOS_PKG.contar_empleados;
   DBMS_OUTPUT.PUT_LINE('Total de empleados: ' || EMPLEADOS_PKG.v_total_empleados);
END;
/

-- Mostrar empleados
BEGIN
   EMPLEADOS_PKG.mostrar_empleados;
END;
/
