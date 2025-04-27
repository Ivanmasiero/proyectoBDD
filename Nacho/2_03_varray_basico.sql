
DECLARE
  TYPE Grades IS VARRAY(5) OF NUMBER(3);
  v_Grades Grades := Grades(80, 90);
BEGIN
  v_Grades.EXTEND;
  v_Grades(3) := 85;
  FOR i IN 1..v_Grades.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE('Nota ' || i || ': ' || v_Grades(i));
  END LOOP;
END;
/
