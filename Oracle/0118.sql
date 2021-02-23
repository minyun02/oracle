--last_day : 달의 마지막날
select sysdate, last_day(sysdate), to_char(last_day(sysdate), 'DD'),
to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS') from dual;

select * from emp;
select empno, ename, hiredate, last_day(hiredate) from emp;

-- add_months(a, b) : 월 +,-처리
select add_months(sysdate, 20), add_months(sysdate, -20) from dual;

--emp테이블에서 사원 입사가 10년된 날짜?
select hiredate, add_months(hiredate, 120) from emp;

--month_between(d, d) : 달의 간격
-- '2020-10-12'과 '2021-06-09'은 몇달 간격인지?
select months_between(to_date('2020-10-12', 'YYYY-MM-DD'), to_date('2021-06-09', 'YYYY-MM-DD')) from dual;

--월로 반올림
select round(to_date('2020/10/12', 'YYYY/MM/DD'), 'YEAR') from dual;
select round(to_date('2020/05/12', 'YYYY/MM/DD'), 'YEAR') from dual;

--일을 월로 반올림
select round(to_date('2020-10-12', 'YYYY-MM-DD'), 'MONTH') from dual;
select round(to_date('2020-10-19', 'YYYY-MM-DD'), 'MONTH') from dual;
select round(to_date('2020-02-15', 'YYYY-MM-DD'), 'MONTH') from dual;

--요일반올림
select round(to_date('2021-01-20 14:20', 'YYYY-MM-DD HH24:MI'), 'DAY') from dual;

--일로 반올림
select to_char(sysdate, 'YYYY-MM-DD HH24:MI'), round(sysdate, 'DD') from dual;
select round(to_date('2021-01-20 14:20', 'YYYY-MM-DD HH24:MI'),'DD') from dual;
select round(to_date('2021-01-20 10:20', 'YYYY-MM-DD HH24:MI'),'DD') from dual;

select sysdate-100, sysdate+1000, sysdate-to_date('2020-10-09', 'YYYY-MM-DD') from dual;
select ename, hiredate, hiredate+1000 from emp;

--그룹함수
--count() : 레코드 수를 구한다
select count(ename) 사원수, count(comm) from emp;
--avg() : 평균
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

--업무별 사원수, 급여의 합계, 급여의 평균, 보너스 합계, 보너스 평균을 구하라.
select * from emp;
select job, count(job), sum(sal), round(avg(sal),1), sum(comm), avg(comm) from emp group by job;
select job, count(empno) 사원수, sum(sal) 급여합계, round(avg(sal),1) 급여평균, sum(comm) 보너스합계,
avg(nvl(comm,0)) 보너스평균 from emp group by job having sum(sal)>=5500;


