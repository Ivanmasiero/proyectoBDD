--El valor real se pasa al procedimiento, se comporta como constante y no se modifica
create or replace procedure sumaIn (
    p_op1 in number,
    p_op2 in number,
    p_res in number) is
    BEGIN
        --si descomentamos las lineas de abajo da error; los parametros IN son constantes.
        --p_res:= p_op1+p_op2;
        dbms_output.put_line('SumaIn dentro del procedimiento es: ' ||p_res);
        dbms_output.put_line('Resultado dentro del procedimiento es: ' || (p_op1+p_op2));
    END sumaIn;
    /
create or replace procedure sumaOut (
    p_op1 out number,
    p_op2 out number,
    p_res out number) is
    BEGIN
        p_res:= p_op1+p_op2;
        dbms_output.put_line('SumaOut dentro del procedimiento es: ' ||p_res);
        dbms_output.put_line('Resultado dentro del procedimiento es: ' || (p_op1+p_op2));

    END sumaOut;
    /
create or replace procedure sumaInOut (
    p_op1 in out number,
    p_op2 in out number,
    p_res in out number) is
    BEGIN
        p_res:= p_op1+p_op2;
        dbms_output.put_line('SumaInOut dentro del procedimiento es: ' ||p_res);
        dbms_output.put_line('Resultado dentro del procedimiento es: ' || (p_op1+p_op2));

    END sumaInOut;
    /

    DECLARE
    v_op1 number:= 1;
    v_op2 number:= 2;
    v_res number;
    BEGIN
        dbms_output.put_line('SumaIn');
        sumaIn(v_op1,v_op2,v_res);
        dbms_output.put_line('SumaIn fuera del procedimiento es dentro del procedimiento es: ' || v_res);
        dbms_output.put_line('');
        dbms_output.put_line('');
        dbms_output.put_line('');
        
        dbms_output.put_line('SumaOut');
        v_op1:= 1;
        v_op2:= 2;
        v_res:=0;
        sumaOut(v_op1,v_op2,v_res);
        dbms_output.put_line('SumaOut fuera del procedimiento es dentro del procedimiento es: ' || v_res);
        dbms_output.put_line('');
        dbms_output.put_line('');
        dbms_output.put_line('');
        
        dbms_output.put_line('SumaInOut');
        v_op1:= 1;
        v_op2:= 2;
        v_res:=0;
        sumaInOut(v_op1,v_op2,v_res);
        dbms_output.put_line('SumaInOut fuera del procedimiento es dentro del procedimiento es: ' || v_res);
    END;
    /