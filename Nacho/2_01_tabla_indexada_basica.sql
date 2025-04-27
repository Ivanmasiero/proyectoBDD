
DECLARE
  TYPE NameTab IS TABLE OF VARCHAR2(50) INDEX BY BINARY_INTEGER;
  v_Names NameTab;
BEGIN
  v_Names(1) := 'Ana';
  v_Names(10) := 'Luis';
  v_Names(-5) := 'Carlos';
  DBMS_OUTPUT.PUT_LINE('Nombre en 1: ' || v_Names(1));
  DBMS_OUTPUT.PUT_LINE('Nombre en 10: ' || v_Names(10));
  DBMS_OUTPUT.PUT_LINE('Nombre en -5: ' || v_Names(-5));
END;
/
