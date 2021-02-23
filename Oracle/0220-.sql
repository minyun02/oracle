-- record ����

create or replace procedure emp_record(p_empno in emp.empno%type)
is
    -- record�� Ÿ�� �����
    type r_emp is record (
       r_empno emp.empno%type, --�����ȣ
       r_ename emp.ename%type, --����̸�
       r_hiredate emp.hiredate%type, --�Ի���
       r_sal emp.sal%type --�޿�
    );
    s_emp r_emp;
    
begin
    select empno, ename, hiredate, sal
    into s_emp.r_empno, s_emp.r_ename, s_emp.r_hiredate, s_emp.r_sal from emp
    where empno=p_empno;
    dbms_output.put_line('�����ȣ->'||s_emp.r_empno);
    dbms_output.put_line('�����->'||s_emp.r_ename);
    dbms_output.put_line('�Ի���->'||s_emp.r_hiredate);
    dbms_output.put_line('�޿�->'||s_emp.r_sal);
end;
set SERVEROUTPUT ON;
execute emp_record(7566);

select * from emp;

select * from user_source;

execute emp_record(4251);

create or replace procedure emp_data
is
    s_empno emp.empno%type;
    s_ename emp.ename%type;
begin
    select empno, ename into s_empno, s_ename from emp where empno=7566;
    dbms_output.put_line(s_empno||', '||s_ename);
    
    exception
        when NO_DATA_FOUND then
            dbms_output.put_line('������ ���ڵ尡 �����ϴ�..');
        when TOO_MANY_ROWS then
            dbms_output.put_line('������ ���� ���� �ʹ� �����ϴ�.');
        when OTHERS then
            dbms_output.put_line('��Ÿ ���� �߻�');
end;
execute emp_data;
