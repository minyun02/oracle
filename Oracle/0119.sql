--������ �޿��� �հ�
select job, sum(sal) from emp group by job;

select job, sum(sal) from emp where sal>2500 group by rollup(job);

select job, sum(sal) from emp group by rollup(job);

--�μ���(deptno), ������(job) ��� ���ϱ�, �޿��հ�, �޿����
select deptno, job, sum(sal) �հ�޿�, avg(sal) ��ձ޿�, count(ename) ����� 
from emp group by rollup(deptno, job) order by deptno;

select deptno, job, sum(sal) �հ�޿�, avg(sal) ��ձ޿�, count(ename) ����� 
from emp group by cube(deptno, job) order by deptno;

--���� ����� ���ϱ�
select hiredate, count(hiredate) ��������� from emp group by rollup(hiredate);
select to_char(hiredate, 'yyyy/mm') as ddd, count(to_char(hiredate, 'yyyy/mm')) as count from emp group by hiredate order by hiredate;

--���̺� ����
select * from tab;
--           ���̺��
create table emp_copy
as
select * from emp;

--�ʵ��Ϻ�(�����ȣ, �����, �޿�), ���ڵ����� - emp_sal
create table emp_sal as select empno, ename, sal from emp;

-- Manager, Salesman ��������� ���̺� ����
create table emp_mgr_sale as select * from emp where job='MANAGER' or job='SALESMAN';

-- ���̺� ���� ����(���ڵ� ����)                    where�ڿ� � ��쿡�� ���� �ƴ� ������ �ִ´�.
create table emp_desc as select * from emp where 1=2;

select * from emp_copy;
desc emp_copy;

--insert into : ���ڵ� �߰�
insert into emp_copy values(7777, 'ȫ�浿', '�繫��', 7369, sysdate, 3500, 100, 40);
insert into emp_copy(empno, ename) values(8888, '������');
insert into emp_copy(ename, job) values('�̼���', '�ѹ���');
insert into emp_copy(deptno, ename, sal, empno)VALUES(40, 'hong', 4000, 9999);


--transaction : commit(����), rollback(���)
rollback;
commit;
select * from emp_copy;

select * from emp_desc;
select * from emp_mgr_sale;
select * from tab;
select * from emp_sal;

select * from tab;
--emp_desc���̺� emp_copy�� ���ڵ带 �߰�
insert into emp_desc(empno,ename,job,hiredate,sal)
select empno, ename, job, hiredate, sal from emp_copy where deptno in(10, 20);

select * from emp_desc;


