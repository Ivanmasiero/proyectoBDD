DECLARE
    v_res number;
    v_op1 number:=3;
    v_op2 number:=2;
BEGIN
--FUNCION DE SUMA
    v_res:=fSuma(v_op1,v_op2);
    dbms_output.put_line('resultado de Funcion de suma es = ' || v_res);
    dbms_output.put_line('resultado de Funcion de suma in Line es = ' || fSuma(v_op1,v_op2));
    
    --La linea de abajo da error, ya que una funcion tiene que ser parte de otra instrucción
    --¿A quién le asignaría el resultado?
    --fSuma(v_op1,v_op2);
    
--PROCEDIMIENTO DE SUMA
    --La línea de abajo da error, ya que un procedimiento es una instrucción PL/SQL,y no puede ser parte de otra
    --v_res:=pSuma(v_op1,v_op2,v_res);
    pSuma(v_op1,v_op2,v_res);
    dbms_output.put_line('resultado de Procedimiento de suma es = ' || v_res);

END;
/