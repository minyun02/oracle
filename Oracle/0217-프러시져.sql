set serveroutput on;

declare 
    --변수 선언 영역
    msg varchar2(20) default 'gildong';
begin
    --실행문 영역
    --대입문
    msg := '홍길동';
    dbms_output.put_line(msg);
end;

-- procedure 생성하기
--사원번호 입력받아 사원의 정보(사원명, 담당업무, 급여를 선택하는 프로시져를 만든다.)
--                          프로시저명
create or replace procedure emp_select(p_empno in number)
is
    --변수 선언 영억
    s_ename varchar2(20);
    s_job varchar2(20);
    s_sal number(7,2);
begin
    --실행문 영역
    select ename, job, sal into s_ename, s_job, s_sal from emp where empno=p_empno;
    dbms_output.put_line('사원명->'|| s_ename);
    dbms_output.put_line('업무->'|| s_job);
    dbms_output.put_line('급여->'|| s_sal);
    dbms_output.put_line('처리 종료 됨');
end;

--prodecure 소스 코드 확인하기 - 데이터 사전
select * from tab;
select * from user_sequences;
select * from user_constraints;
select * from user_source where name='EMP_SELECT';
select * from emp;
--실행
execute EMP_SELECT(7900);

-- %type : 실제 필드의 데이터형과 자릿수를 적용하는 변수 선언시
-- 레코드 추가하는 프로시저
-- 사원번호, 사원명, 급여, 부서코드를 추가
create or replace procedure emp_insert(p_empno emp.empno%type, p_ename emp.ename%type,
                                        p_sal emp.sal%type, p_deptno emp.deptno%type)
is
    
begin
    insert into emp(empno, ename, sal, deptno) values(p_empno, p_ename, p_sal, p_deptno);
    commit;
    dbms_output.put_line(p_empno||'->레코드가 추가됨');
end;

select * from user_source;
select * from emp;
execute emp_insert(1234, 'XXXX', 5000, 30);
execute emp_insert(1235, 'YYYY', 5000, 30);

-- 7369, 7499
-- 레코드 1개의 모든 필드를 선택하는 프로시저 생성
create or replace procedure emp_record(p_empno emp.empno%type)
is
    r_emp emp%rowtype;
begin
    select empno, ename, mgr, job, hiredate, sal, comm, deptno 
    into r_emp.empno, r_emp.ename, r_emp.mgr, r_emp.job, r_emp.hiredate, r_emp.sal, r_emp.comm, r_emp.deptno 
    from emp where empno=p_empno;
    dbms_output.put_line('사원명='|| r_emp.ename||'입사일='|| r_emp.hiredate);
end;

execute emp_record(7499);
-- 프로시저명 emp_update
--사원번호, 급여, 부서번호, 보너스를 입력받아
--입력받은 사원번호의 급여, 부서번호, 보너스를 수정하는 프로시저 생성하라
create or replace procedure emp_update(p_empno emp.empno%type, p_sal emp.sal%type, p_deptno emp.deptno%type, p_comm emp.comm%type)
is
    
begin
    update emp set sal=p_sal, deptno=p_deptno, comm=p_comm
    where empno=p_empno;
    dbms_output.put_line(p_empno||'업데이트완료');
end;
execute emp_update(1234, 900, 10, 100);
select * from emp;
------------------------------------
create or replace procedure emp_update(p_empno emp.empno%type, p_sal emp.sal%type, p_deptno emp.deptno%type, p_comm emp.comm%type)
is
    e_rec emp%rowtype;
begin
    update emp set sal=p_sal, deptno=p_deptno, comm=p_comm
    where empno=p_empno;
    
    select empno, ename, sal, comm into e_rec.empno, e_rec.ename, e_rec.sal, e_rec.comm from emp where empno=p_empno;
    dbms_output.put_line('사원번호='||e_rec.empno);
    dbms_output.put_line('이름='||e_rec.ename);
    dbms_output.put_line('급여='||e_rec.sal);
    dbms_output.put_line('보너스='||e_rec.comm);
end;
execute emp_update(1234, 7000, 50, 100);

select * from user_source;

---------------in : 입력 매개변수, out : 출력 매개변수, in out(생략) : 변수1개로 입력과 출력할 수 있다.
--사원번호를 입력 받아 이름을 선택하여 프로시저 외부로 데이터 보내기

create or replace procedure emp_name_search(pempno in emp.empno%type, p_ename out emp.ename%type)
is
begin
    select ename into p_ename from emp where empno=pempno;
end;
variable s_ename varchar2(20);
execute emp_name_search(7876, :s_ename);
print s_ename;

desc member;
select * from user_sequences;
select * from member;
--회원등록 프로시져
--num -> memsq
--이름, 연락처, 이메일, 주소 -> 입력
--writedate -> sysdate
create or replace procedure mem_insert(m_username in member.username%type, m_tel in member.tel%type, 
                                    m_email in member.email%type, m_addr in member.addr%type,
                                    m_result out number)
is
begin
    m_result := 1;
    insert into member values(memsq.nextval, m_username, m_tel, m_email, m_addr, sysdate);
    dbms_output.put_line('레코드 추가 성공');
    
    exception
        when others then
            m_result := 0;
end;
select * from member;

create or replace procedure mem_update(m_username in member.username%type, m_tel in member.tel%type,
                                        m_email in member.email%type, m_addr in member.addr%type)
is
    
begin
    update member set tel=m_tel, email=m_email, addr=m_addr
    where username=m_username;
    dbms_output.put_line('레코드 수정 성공');
end;
-------------------------------
create or replace procedure mem_update(p_username in member.username%type, p_tel in member.tel%type,
                                        p_email in member.email%type, p_addr in member.addr%type)
is
begin
    update member set tel=p_tel, email=p_email, addr=p_addr where username=p_username;
end;
---------------------------------