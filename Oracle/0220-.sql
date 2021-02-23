-- record 정의

create or replace procedure emp_record(p_empno in emp.empno%type)
is
    -- record형 타입 만들기
    type r_emp is record (
       r_empno emp.empno%type, --사원번호
       r_ename emp.ename%type, --사원이름
       r_hiredate emp.hiredate%type, --입사일
       r_sal emp.sal%type --급여
    );
    s_emp r_emp;
    
begin
    select empno, ename, hiredate, sal
    into s_emp.r_empno, s_emp.r_ename, s_emp.r_hiredate, s_emp.r_sal from emp
    where empno=p_empno;
    dbms_output.put_line('사원번호->'||s_emp.r_empno);
    dbms_output.put_line('사원명->'||s_emp.r_ename);
    dbms_output.put_line('입사일->'||s_emp.r_hiredate);
    dbms_output.put_line('급여->'||s_emp.r_sal);
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
            dbms_output.put_line('선택한 레코드가 없습니다..');
        when TOO_MANY_ROWS then
            dbms_output.put_line('선택한 행의 수가 너무 많습니다.');
        when OTHERS then
            dbms_output.put_line('기타 예외 발생');
end;
execute emp_data;
