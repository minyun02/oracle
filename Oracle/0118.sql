--last_day : ���� ��������
select sysdate, last_day(sysdate), to_char(last_day(sysdate), 'DD'),
to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS') from dual;

select * from emp;
select empno, ename, hiredate, last_day(hiredate) from emp;

-- add_months(a, b) : �� +,-ó��
select add_months(sysdate, 20), add_months(sysdate, -20) from dual;

--emp���̺��� ��� �Ի簡 10��� ��¥?
select hiredate, add_months(hiredate, 120) from emp;

--month_between(d, d) : ���� ����
-- '2020-10-12'�� '2021-06-09'�� ��� ��������?
select months_between(to_date('2020-10-12', 'YYYY-MM-DD'), to_date('2021-06-09', 'YYYY-MM-DD')) from dual;

--���� �ݿø�
select round(to_date('2020/10/12', 'YYYY/MM/DD'), 'YEAR') from dual;
select round(to_date('2020/05/12', 'YYYY/MM/DD'), 'YEAR') from dual;

--���� ���� �ݿø�
select round(to_date('2020-10-12', 'YYYY-MM-DD'), 'MONTH') from dual;
select round(to_date('2020-10-19', 'YYYY-MM-DD'), 'MONTH') from dual;
select round(to_date('2020-02-15', 'YYYY-MM-DD'), 'MONTH') from dual;

--���Ϲݿø�
select round(to_date('2021-01-20 14:20', 'YYYY-MM-DD HH24:MI'), 'DAY') from dual;

--�Ϸ� �ݿø�
select to_char(sysdate, 'YYYY-MM-DD HH24:MI'), round(sysdate, 'DD') from dual;
select round(to_date('2021-01-20 14:20', 'YYYY-MM-DD HH24:MI'),'DD') from dual;
select round(to_date('2021-01-20 10:20', 'YYYY-MM-DD HH24:MI'),'DD') from dual;

select sysdate-100, sysdate+1000, sysdate-to_date('2020-10-09', 'YYYY-MM-DD') from dual;
select ename, hiredate, hiredate+1000 from emp;

--�׷��Լ�
--count() : ���ڵ� ���� ���Ѵ�
select count(ename) �����, count(comm) from emp;
--avg() : ���
select avg(sal), avg(nvl(comm, 0)) from emp;

--max, min
select max(sal), min(sal) from emp;

--sum
select sum(sal), sum(comm) from emp;

--STDDEV
select stddev(sal) from emp;

select sum(sal) from emp where deptno=10;
--Group by 
select deptno, sum(sal), round(avg(sal),1) from emp group by deptno order by deptno;

--������ �����, �޿��� �հ�, �޿��� ���, ���ʽ� �հ�, ���ʽ� ����� ���϶�.
select * from emp;
select job, count(job), sum(sal), round(avg(sal),1), sum(comm), avg(comm) from emp group by job;
select job, count(empno) �����, sum(sal) �޿��հ�, round(avg(sal),1) �޿����, sum(comm) ���ʽ��հ�,
avg(nvl(comm,0)) ���ʽ���� from emp group by job having sum(sal)>=5500;


