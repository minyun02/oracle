set serveroutput on;

declare 
    --���� ���� ����
    msg varchar2(20) default 'gildong';
begin
    --���๮ ����
    --���Թ�
    msg := 'ȫ�浿';
    dbms_output.put_line(msg);
end;

-- procedure �����ϱ�
--�����ȣ �Է¹޾� ����� ����(�����, ������, �޿��� �����ϴ� ���ν����� �����.)
--                          ���ν�����
create or replace procedure emp_select(p_empno in number)
is
    --���� ���� ����
    s_ename varchar2(20);
    s_job varchar2(20);
    s_sal number(7,2);
begin
    --���๮ ����
    select ename, job, sal into s_ename, s_job, s_sal from emp where empno=p_empno;
    dbms_output.put_line('�����->'|| s_ename);
    dbms_output.put_line('����->'|| s_job);
    dbms_output.put_line('�޿�->'|| s_sal);
    dbms_output.put_line('ó�� ���� ��');
end;

--prodecure �ҽ� �ڵ� Ȯ���ϱ� - ������ ����
select * from tab;
select * from user_sequences;
select * from user_constraints;
select * from user_source where name='EMP_SELECT';
select * from emp;
--����
execute EMP_SELECT(7900);

-- %type : ���� �ʵ��� ���������� �ڸ����� �����ϴ� ���� �����
-- ���ڵ� �߰��ϴ� ���ν���
-- �����ȣ, �����, �޿�, �μ��ڵ带 �߰�
create or replace procedure emp_insert(p_empno emp.empno%type, p_ename emp.ename%type,
                                        p_sal emp.sal%type, p_deptno emp.deptno%type)
is
    
begin
    insert into emp(empno, ename, sal, deptno) values(p_empno, p_ename, p_sal, p_deptno);
    commit;
    dbms_output.put_line(p_empno||'->���ڵ尡 �߰���');
end;

select * from user_source;
select * from emp;
execute emp_insert(1234, 'XXXX', 5000, 30);
execute emp_insert(1235, 'YYYY', 5000, 30);

-- 7369, 7499
-- ���ڵ� 1���� ��� �ʵ带 �����ϴ� ���ν��� ����
create or replace procedure emp_record(p_empno emp.empno%type)
is
    r_emp emp%rowtype;
begin
    select empno, ename, mgr, job, hiredate, sal, comm, deptno 
    into r_emp.empno, r_emp.ename, r_emp.mgr, r_emp.job, r_emp.hiredate, r_emp.sal, r_emp.comm, r_emp.deptno 
    from emp where empno=p_empno;
    dbms_output.put_line('�����='|| r_emp.ename||'�Ի���='|| r_emp.hiredate);
end;

execute emp_record(7499);
-- ���ν����� emp_update
--�����ȣ, �޿�, �μ���ȣ, ���ʽ��� �Է¹޾�
--�Է¹��� �����ȣ�� �޿�, �μ���ȣ, ���ʽ��� �����ϴ� ���ν��� �����϶�
create or replace procedure emp_update(p_empno emp.empno%type, p_sal emp.sal%type, p_deptno emp.deptno%type, p_comm emp.comm%type)
is
    
begin
    update emp set sal=p_sal, deptno=p_deptno, comm=p_comm
    where empno=p_empno;
    dbms_output.put_line(p_empno||'������Ʈ�Ϸ�');
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
    dbms_output.put_line('�����ȣ='||e_rec.empno);
    dbms_output.put_line('�̸�='||e_rec.ename);
    dbms_output.put_line('�޿�='||e_rec.sal);
    dbms_output.put_line('���ʽ�='||e_rec.comm);
end;
execute emp_update(1234, 7000, 50, 100);

select * from user_source;

---------------in : �Է� �Ű�����, out : ��� �Ű�����, in out(����) : ����1���� �Է°� ����� �� �ִ�.
--�����ȣ�� �Է� �޾� �̸��� �����Ͽ� ���ν��� �ܺη� ������ ������

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
--ȸ����� ���ν���
--num -> memsq
--�̸�, ����ó, �̸���, �ּ� -> �Է�
--writedate -> sysdate
create or replace procedure mem_insert(m_username in member.username%type, m_tel in member.tel%type, 
                                    m_email in member.email%type, m_addr in member.addr%type,
                                    m_result out number)
is
begin
    m_result := 1;
    insert into member values(memsq.nextval, m_username, m_tel, m_email, m_addr, sysdate);
    dbms_output.put_line('���ڵ� �߰� ����');
    
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
    dbms_output.put_line('���ڵ� ���� ����');
end;
-------------------------------
create or replace procedure mem_update(p_username in member.username%type, p_tel in member.tel%type,
                                        p_email in member.email%type, p_addr in member.addr%type)
is
begin
    update member set tel=p_tel, email=p_email, addr=p_addr where username=p_username;
end;
---------------------------------