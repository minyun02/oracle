-- trigger : update, insert, delete���� ����Ǳ� ���Ŀ� ó���� ������ �����Ѵ�.
select * from all_triggers;
--Ʈ���� ����
create or replace trigger dept_trigger
    before
    update on dept
    for each row
    
    begin
        dbms_output.put_line('update�� ->'|| :old.dname);
        dbms_output.put_line('update�� ->'|| :new.dname);
    end;
    
set SERVEROUTPUT ON;
select * from dept;
update dept set dname='�������' where deptno=30; 

--������(insert)�ϰų� ����� ����(update), ��� ����(delete)�ϸ� �޿��� ���հ�� �޿��� ����� ���Ͽ� ����ϴ� Ʈ���Ÿ� �����Ѵ�.
create or replace trigger sal_trigger
AFTER
insert or update or delete on emp
--for each row
declare
    tot number;
    ave number;
begin
    select sum(sal), avg(sal) into tot, ave from emp;
    dbms_output.put_line('�޿� �հ�='|| tot);
    dbms_output.put_line('�޿� ���='|| ave);
end;

select sum(sal), avg(sal) from emp;
insert into emp(empno, ename, sal) values(7879, 'gildong1', 7000);

-- �������� ���ڵ� ������ ó���� �� �ִ�.
-- �μ��ڵ带 �Է¹޾� �����ȣ, �����, �Ի���, �޿�, �μ��ڵ带 ��å�ϴ� ���ν���

create or replace procedure emp_cursor(p_deptno in emp.deptno%type)
is
    --Ŀ�� ����
    cursor deptno_select is
    select empno, ename, hiredate, sal, deptno from emp where deptno=p_deptno;
    
    
    r_emp emp%rowtype;
begin
    --Ŀ�� Open
    open deptno_select;
    --Ŀ�� Fetch
    loop
        fetch deptno_select into r_emp.empno, r_emp.ename, r_emp.hiredate, r_emp.sal, r_emp.deptno;
        exit when deptno_select%NOTFOUND;
        dbms_output.put_line(r_emp.empno||', '||r_emp.ename||', '||r_emp.hiredate||', '||r_emp.sal||', '||r_emp.deptno);
    end loop;
    --Ŀ�� close
    close deptno_select;
    dbms_output.put_line('����Ϸ�......');
end;

execute emp_cursor(30);

--member ��� ���ڵ� ����
create or replace procedure mem_all(r_mem out sys_refcursor)
is
begin
    open r_mem for
    select num, username, tel, email, addr, writedate from member order by username;
end;

--member �̸����ּ� �˻�
create or replace procedure mem_search(p_email in member.email%type, search_mem out sys_refcursor)
is

begin
    open search_mem for
    select * from member where email like '%'||p_email||'%' order by num;
end;

--���ν��� ����
select * from user_source;
drop procedure emp_data;