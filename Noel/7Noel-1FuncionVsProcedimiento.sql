/*
En este codigo simplemente definimos un procedimiento y una función para sumar
Aquí vamos a ver las diferencias entre procedimientos y funciones.

Los procedimientos cuentan como una instrucción PL/SQL como tal,
contrario a las funciones, que, como siempre, devuelven un valor,
tienen que formar parte de otra instrucción.
*/
create or replace procedure pSuma (
    p_op1 in number,
    p_op2 in number,
    p_res out number) IS
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
    
