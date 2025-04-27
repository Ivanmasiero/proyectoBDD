create or replace procedure pSuma (
    p_op1 in number,
    p_op2 in number,
    p_res out number) is
BEGIN
    p_res:= p_op1+p_op2;
END;
/

create or replace function fSuma (
    p_op1 number, --se podrían declarar como IN si quisiesemos que actuasen como constantes
    p_op2 number) RETURN NUMBER AS
    BEGIN
    RETURN (p_op1+p_op2);
END;
/
    