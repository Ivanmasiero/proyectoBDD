
DECLARE
  TYPE NumberTab IS TABLE OF NUMBER;
  v_Numbers NumberTab := NumberTab(10, 20, 30);
BEGIN
  FOR i IN 1..v_Numbers.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE('Elemento ' || i || ': ' || v_Numbers(i));
  END LOOP;
END;
/
