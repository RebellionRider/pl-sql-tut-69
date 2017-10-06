/*
Strong Ref Cursor with Table based record datatype can not retrive data from single column. 
It will give you an error.
On execution of this program you will get an "PLS-00382: expression is of wrong type" error
*/
SET SERVEROUTPUT ON
DECLARE
    rec_var     employees%ROWTYPE;
    /*Declare a Ref Cursor/pointer Type using TABLE BASED RECORD datatype*/
    TYPE RefCur    IS REF CURSOR RETURN employees%ROWTYPE;
    /*Declare a Cursor Variable of above Ref Cursor Type*/
    cur_var RefCur;
BEGIN
    --Here we are opening our cursor for a select statement which is returining the data from one column only this will cause an error
    OPEN cur_var FOR SELECT salary FROM employees WHERE employee_id = 100;
    FETCH cur_var INTO rec_var;
    CLOSE cur_var;
    --DBMS_OUTPUT.PUT_LINE('Employee '||rec_var.first_name||' has salary '||rec_var.salary||'.');
    DBMS_OUTPUT.PUT_LINE(
        'Employee ' || rec_var.first_name||' has Salary '||rec_var.salary
    );
END;
/
