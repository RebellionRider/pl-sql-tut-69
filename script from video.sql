SET SERVEROUTPUT ON;
DECLARE
    TYPE my_rec IS RECORD (
        emp_sal employees.salary%TYPE
        );
    TYPE RefCur IS REF CURSOR RETURN my_rec;
    cur_var REFCUR;
    at_var  employees.salary%TYPE;
BEGIN
    OPEN cur_var FOR SELECT salary FROM employees WHERE employee_id = 100;
    FETCH cur_var INTO at_var;
    CLOSE cur_var;
    DBMS_OUTPUT.PUT_LINE('Salary of the employee is '||at_var);
END;
/