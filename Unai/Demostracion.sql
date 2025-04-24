BEGIN
  paquete_empleados.agregar_empleado(10, 'Sofía');
  paquete_empleados.agregar_empleado(11, 'Luis');
  DBMS_OUTPUT.PUT_LINE('Total empleados (tabla): ' || paquete_empleados.total_empleados);
  DBMS_OUTPUT.PUT_LINE('Agregados en esta sesión: ' || paquete_empleados.contador_empleados);
END;
/
