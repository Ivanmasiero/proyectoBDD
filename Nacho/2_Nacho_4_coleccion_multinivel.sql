
DECLARE
  TYPE NumTab IS TABLE OF NUMBER INDEX BY BINARY_INTEGER;
  TYPE MultiTab IS TABLE OF NumTab INDEX BY BINARY_INTEGER;
  v_Matrix MultiTab;
BEGIN
  v_Matrix(1)(1) := 100;
  v_Matrix(1)(2) := 200;
  DBMS_OUTPUT.PUT_LINE('v_Matrix(1)(1): ' || v_Matrix(1)(1));
  DBMS_OUTPUT.PUT_LINE('v_Matrix(1)(2): ' || v_Matrix(1)(2));
END;
/
