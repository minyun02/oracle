select * from emp_copy;

--update, insertm delete -> transaction�� �ʿ��ϴ� = commit, rollback
--update : ���ڵ� ����
-- �����ȣ 7499�� �μ��ڵ带 40������ ����
UPDATE emp_copy set deptno=40 where empno=7499;

--job�� manager�� ����� �޿��� 10%�� ���ʽ�(comm)�� ����
update emp_copy set comm=(sal*0.1) where job='MANAGER';

--JONES����� �μ��̵� �μ�=10, ����='SALESMAN'���� ����
update emp_copy set deptno=10, job='SALESMAN' where ename='JONES';

--��� ����� �޿��� 10%�λ��...(0, null�����ϰ�)
update emp_copy set sal = sal*1.1;


-- delete: ���ڵ� ����
delete from emp_copy where empno=8888;
delete from emp_copy;
rollback;

select * from tab;

--���̺� �����ϱ�
create table member(
    num number(4) primary key,
    username varchar2(20) not null,
    tel varchar2(20) not null,
    email varchar2(30),
    addr varchar2(100),
    writedate date default sysdate
);

select * from tab;
select * from user_tables;
select * from tabs;

--�ʵ� �߰� : add
alter table member add (gender char(1) not null);
select * from member;
insert into member(num, username,tel, addr, email, writedate, gender)
values(1, 'ȫ�浿', '010-9999-8888', '����� ������ �����', 'aaaaaaaaa@nate.com', sysdate, 'M');
commit;

alter table member add (hobby varchar(20) default '�౸');
alter table member add (intro varchar(20));

--�ʵ� ����
alter table member modify (email varchar2(50));
alter table member modify (username varchar2(12));
alter table member modify (addr varchar2(10));

-- �ʵ� ����
alter table member drop column intro;
alter table member drop column hobby;
alter table member drop column gender;
select * from member;

select * from tab;

--���̺� ���� 
drop table emp_sal;
drop table emp_desc;
drop table emp_mgr_sale purge; -- �����뿡 �������� ���ϰ� ����.
--�̹� ������ ������ ���̺� ����
purge recyclebin;

desc member;