--�����ȣ�� �Է¹޾� �����ȣ, �����, �μ����� �����ϴ� ���ν��� ����
-- 10:ȸ�Ժ�, 20:��ȹ��, 30:�λ��, 40:�Ѱ���

create or replace procedure emp_search(p_empno in emp.empno%type)
is
    s_deptno emp.deptno%type;
    s_ename emp.ename%type;
    s_dname varchar2(20);
begin
    select ename, deptno into s_ename, s_deptno from emp where empno=p_empno;
    -- 7499
    if s_deptno=10 then
        s_dname := 'ȸ���';
    elsif s_dname=20 then
        s_dname := '��ȹ��';
    elsif s_deptno=30 then
        s_dname := '�λ��';
    elsif s_deptno=40 then
        s_dname := '�Ѱ���';
    else
        s_dname := '�ش�μ��� �����ϴ�.';
    end if;
    
    dbms_output.put_line(p_empno||', '||s_ename||', '||s_deptno||', '||s_dname);
end;
set serveroutput on;
execute emp_search(7499);


--loop��                                 3������
create or replace procedure loop_test(i in number)
is
    p_i number default 1000;
    p_max number;
begin
    p_max := p_i + i; --1003
    LOOP
        insert into emp(empno, ename) values(p_i, 'A'||p_i);
        p_i := p_i + 1;
    
    EXIT WHEN p_i > p_max;
    END LOOP;
end;

execute loop_test(5);

--job�� null�� ���ڵ带 �����ϴ� ���ν���
-- ���ν����� : emp_del()
create or replace procedure emp_del(i in number)
is
    p_i number default 0;
    p_max number;
begin
    p_max := p_i + 1;
    LOOP
    DELETE FROM emp WHERE job is null;
    p_i := p_i + 1;
    dbms_output.put_line(p_i||'���� ����');
        
    EXIT WHEN p_i > p_max;
    END LOOP;
end;
execute emp_del(24);

-------------------------------
create or replace procedure emp_del
is
begin
    delete from emp where job is null;
    commit;
end;
execute emp_del;

-------------table ���� �����ϱ�
create or replace procedure emp_table_for
is
    -- ���̺� ���� ���� 1Į���� ������ �� �ִ�  ������ �����.
    type empno_table is table of emp.empno%type index by binary_integer;
    type ename_table is table of emp.ename%type index by binary_integer;
    type sal_table is table of emp.sal%type index by binary_integer;
    
    --���� ����
    p_empno empno_table;
    p_ename ename_table;
    p_sal sal_table;
    
    idx integer := 0;--index�� ����� ����
begin
    --select empno, ename, sal from emp order by ename;
    for d in (select empno, ename, sal from emp order by ename) loop
        idx := idx + 1; --1
        
        p_empno(idx) := d.empno;
        p_ename(idx) := d.ename;
        p_sal(idx) := d.sal;
    end loop;
    -----table�� ������ ���� ���-----
    for i in 1..idx loop -- 1���� 14���� �ݺ�
        dbms_output.put_line(p_empno(i)|| ', '|| p_ename(i)||', '|| p_sal(i));
    end loop;
end;
execute emp_table_for;
-----------------------------------------------
create or replace procedure emp_while_test
is
    i number := 1;
begin
    while i<100 loop
        insert into emp(empno, ename) values(1000+i, 'AAA'||i);
        exit when i>31;
        i := i + 10;
    end loop;
end;
execute emp_while_test;

select * from emp;


