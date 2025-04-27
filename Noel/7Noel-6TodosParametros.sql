create or replace procedure sumaX (
    p_op in number default 0,     --Cuanto queremos sumar
    p_res in out NOCOPY number , --Numero al que queremos sumar
    p_historial out number     --Último número sumado
    ) IS
    BEGIN
        IF p_op=0 THEN
            dbms_output.put_line('No se suma nada');
        ELSE
            p_res:= p_res + p_op;
        END IF;
        p_historial:= p_op;
    END sumaX;
/
DECLARE
    v_op number:=2;
    v_res number:=3;
    v_historial number;
BEGIN
    --Notación nominal
    sumaX(
    v_op,v_res,v_historial
    );
    dbms_output.put_line('El resultado es = ' || v_res || ', Último número sumado = ' || v_historial);
    v_op:=3; --le sumamos un numero distinto
    
    --Notación posicional
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