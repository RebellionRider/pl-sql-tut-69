REM Prac Sheet 1 Ref Cursor
SET SERVEROUTPUT ON
DECLARE
    rec_var     employees%ROWTYPE;
    /*Declare a Ref Cursor/pointer Type*/
    TYPE RefCur    IS REF CURSOR RETURN employees%ROWTYPE;
    /*Declare a Cursor Variable of above Ref Cursor Type*/
    cur_var RefCur;
BEGIN
    OPEN cur_var FOR SELECT salary FROM employees WHERE employee_id = 100;
    FETCH cur_var INTO rec_var;
    CLOSE cur_var;
    --DBMS_OUTPUT.PUT_LINE('Employee '||rec_var.first_name||' has salary '||rec_var.salary||'.');
    DBMS_OUTPUT.PUT_LINE(
        'Employee ' || rec_var.first_name||' has Salary '||rec_var.salary
    );
END;
/