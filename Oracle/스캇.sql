select * from emp;
select ename, sal from emp;
--�μ��ڵ尡 10, 20�� ���ڵ带 ��å�϶�.
select * from emp where deptno=10 or deptno=20;
select * from emp where deptno in(10, 20);

--�μ��ڵ尡 10, 20�� ������ ���ڵ带 �����϶�.
select * from emp where deptno not in(10,20);
select empno, ename from emp where empno in(7900, 7934);
select empno, ename from emp where empno not in (7900, 7934);
--�޿��� 2000~3000�� ������ ����� �����϶�.
select * from emp where sal between 2000 and 3000;
select * from emp where sal not between 2000 and 3000;
select * from emp where ename like 'S%';
select * from emp where ename like '%S';
select * from emp where ename like '%A%';

--�ι�° ���ڰ� A�� ��츸 �����϶�.
select * from emp where ename like '_A%';
--�̸����� ����° ���ڰ� A�� ��� �����ϰ� �����϶�.
select * from emp where ename not like '__A%';

select * from emp where comm is null;
select * from emp where comm is not null;

--����1. ������ �� �����ȣ, �����, �Ի���, �޿��� �����ϵ� �޿��� 2500���� 3500�� ������ ����� �޿������� �����϶�.
select empno, ename, hiredate, sal from emp where sal between 2500 and 3500 order by sal desc;
--����2. �μ��ڵ尡 20, 30�� �μ��� ����� �Ի����� 12���� ����� �����ȣ������ �����϶�.
select * from emp where deptno in(20, 30) or hiredate like '___06%' order by empno;

--����1.
select empno, ename, sal from emp;

--����2.
select empno, ename, sal, job from emp order by ename;

--����3.
select * from emp where hiredate like '___05%';

--����4.
select * from emp where ename like '%A%' or sal>=3000;

--����5 EMP���̺��� ���ڵ� �� ������ SALESMAN�̰ų� MANAGER�� ����� �����϶�
select * from emp where job in('SALESMAN', 'MANAGER');

--����6 EMP���̺��� ��� �� �޿��� 3000�޷� �̻��̰�, ���ʽ��� ���� �ʴ� ����� �����϶�
select * from emp where sal>=3000 and comm is null;
select * from emp where sal>3000 and (comm is null or comm<1);
select * from emp where sal>3000 and nvl(comm,0)<=0;
--����7 EMP���̺��� ��� �� �޿��� 2000~4000�޷� �� ����� ���ʽ��� �޴� ����� �����Ͽ� �޿��� ������������ �����Ͽ� �����϶�..
select * from emp where comm is not null OR sal between 2000 and 4000 order by sal desc;
select * from emp where comm>0 OR sal between 2000 and 4000 order by sal desc;

--����8 ���� ������ ���̺� ����� Ȯ���ϴ� �������� �ۼ��϶�
desc emp;
select * from tab;

--����9 EMP���̺��� ��� �� �����ȣ, �̸�, ����, �Ի���, �޿��� �μ��ڵ尡 10, 20�� ����� ������ ��������, �޿��� ������������ �����Ͽ� �����϶�.
select empno, ename, job, hiredate, sal from emp where deptno in(10, 20) order by job, sal desc;





-- smith�� �޿��� 800���Դϴ�.
-- allen�� �޿��� 1600���Դϴ�.
--literal
select ename || '�� �޿��� ' || sal || '���Դϴ�.' as "����" from emp;

--�ߺ��� ����
select job from emp;
select distinct job from emp;
select distinct deptno, job from emp order by deptno;




-- ���� �Լ�
-- abs() : ����ġ
select abs(-85) ����ġ from dual;
select sysdate from dual;
--ceil() : �ø�
select ceil(10.1), ceil(-10.1) from dual;
--floor() : ����
select floor(10.9), floor(-10.1) from dual;
--mod() : ������ 
--pwer() : 
select mod(12,5), power(3,4) from dual;

select round(1245.3142, 1) from dual;

select round(1245.124, -2) from dual;

select trunc(7.5597, 2), trunc(5254.26, -2) from dual;

select trunc(7.5597, 2), round(7.5597, 2) from dual;

select sal, mod(sal,30) from emp where deptno=10;

--�޿��� 10%�λ��Ͽ� �����϶�.
select ename, sal, sal*1.1, round(sal*1.1, -1) �λ��� from emp;

-- concat : ���ڿ���
select concat(ename, '��') �����, hiredate from emp;

select * from emp;

-- initcap(ù��°���� �빮��), lower(�ҹ��ڷ�), upper(�빮�ڷ�)
select initcap('java spring mybatis'), lower('JAVA SPRING MYbatis'), upper('java spring mybatis') from dual;

--LPAD, RPAD : ���ڸ��� ���ڷ� ä���
select LPAD(ename,10, '*'), RPAD(ename, 10, '-') from emp;

-- SUBSTR(����, ������ġ, ����);
select job, substr(job, 2, 4), substr(job, -3, 2) from emp;

-- length() : ���ڼ�
select length(ename), ename from emp;

--[����] �̸��� ���ڱ����� 50%��ŭ ����ϰ� ������ ���ڴ� ��*������ ǥ���Ͽ���. 
select RPAD((substr(ename, 1, length(ename)/2)), length(ename), '*') from emp;

