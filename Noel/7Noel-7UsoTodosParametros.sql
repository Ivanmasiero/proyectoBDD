DECLARE
    v_op number:=2;
    v_res number:=3;
    v_historial number;
BEGIN
    --Notación posicional
    sumaX(
    v_op,v_res,v_historial
    );
    dbms_output.put_line('El resultado es = ' || v_res || ', Último número sumado = ' || v_historial);
    v_op:=3; --le sumamos un numero distinto
    
    --Notación nominal
    sumaX(
    p_res => v_res,
    p_historial => v_historial,
    p_op => v_op);
    dbms_output.put_line('El resultado es = ' || v_res || ', Último número sumado = ' || v_historial);
    
    --Aquí no pasamos operador para que salga el predeterminado
    sumaX(
    p_res => v_res,
    p_historial => v_historial);
    dbms_output.put_line('El resultado es = ' || v_res || ', Último número sumado = ' || v_historial);
END;
/
