-- trigger : update, insert, delete문이 실행되기 전후에 처리할 실행을 생성한다.
select * from all_triggers;
--트리거 생성
create or replace trigger dept_trigger
    before
    update on dept
    for each row
    
    begin
        dbms_output.put_line('update전 ->'|| :old.dname);
        dbms_output.put_line('update후 ->'|| :new.dname);
    end;
    
set SERVEROUTPUT ON;
select * from dept;
update dept set dname='세일즈맨' where deptno=30; 

--사원등록(insert)하거나 사원을 수정(update), 사원 삭제(delete)하면 급여의 총합계와 급여의 평균을 구하여 출력하는 트리거를 생성한다.
create or replace trigger sal_trigger
AFTER
insert or update or delete on emp
--for each row
declare
    tot number;
    ave number;
begin
    select sum(sal), avg(sal) into tot, ave from emp;
    dbms_output.put_line('급여 합계='|| tot);
    dbms_output.put_line('급여 평균='|| ave);
end;

select sum(sal), avg(sal) from emp;
insert into emp(empno, ename, sal) values(7879, 'gildong1', 7000);

-- 여러행의 레코드 선택을 처리할 수 있다.
-- 부서코드를 입력받아 사원번호, 사원명, 입사일, 급여, 부서코드를 선책하는 프로시저

create or replace procedure emp_cursor(p_deptno in emp.deptno%type)
is
    --커서 정의
    cursor deptno_select is
    select empno, ename, hiredate, sal, deptno from emp where deptno=p_deptno;
    
    
    r_emp emp%rowtype;
begin
    --커서 Open
    open deptno_select;
    --커서 Fetch
    loop
        fetch deptno_select into r_emp.empno, r_emp.ename, r_emp.hiredate, r_emp.sal, r_emp.deptno;
        exit when deptno_select%NOTFOUND;
        dbms_output.put_line(r_emp.empno||', '||r_emp.ename||', '||r_emp.hiredate||', '||r_emp.sal||', '||r_emp.deptno);
    end loop;
    --커서 close
    close deptno_select;
    dbms_output.put_line('실행완료......');
end;

execute emp_cursor(30);

--member 모든 레코드 선택
create or replace procedure mem_all(r_mem out sys_refcursor)
is
begin
    open r_mem for
    select num, username, tel, email, addr, writedate from member order by username;
end;

--member 이메일주소 검색
create or replace procedure mem_search(p_email in member.email%type, search_mem out sys_refcursor)
is

begin
    open search_mem for
    select * from member where email like '%'||p_email||'%' order by num;
end;

--프로시저 삭제
select * from user_source;
drop procedure emp_data;