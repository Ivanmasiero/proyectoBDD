
DECLARE
  TYPE NumTab IS TABLE OF NUMBER;
  v_Tab NumTab := NumTab(10, 20, 30, 40);
BEGIN
  v_Tab.DELETE(2);
  v_Tab.EXTEND;
  v_Tab(v_Tab.LAST) := 50;
  v_Tab.TRIM;
  FOR i IN v_Tab.FIRST..v_Tab.LAST LOOP
    IF v_Tab.EXISTS(i) THEN
      DBMS_OUTPUT.PUT_LINE('Elemento ' || i || ': ' || v_Tab(i));
    END IF;
  END LOOP;
END;
/
