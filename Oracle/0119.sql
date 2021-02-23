--업무별 급여의 합계
select job, sum(sal) from emp group by job;

select job, sum(sal) from emp where sal>2500 group by rollup(job);

select job, sum(sal) from emp group by rollup(job);

--부서별(deptno), 업무별(job) 통계 구하기, 급여합계, 급여평균
select deptno, job, sum(sal) 합계급여, avg(sal) 평균급여, count(ename) 사원수 
from emp group by rollup(deptno, job) order by deptno;

select deptno, job, sum(sal) 합계급여, avg(sal) 평균급여, count(ename) 사원수 
from emp group by cube(deptno, job) order by deptno;

--월별 사원수 구하기
select hiredate, count(hiredate) 월별사원수 from emp group by rollup(hiredate);
select to_char(hiredate, 'yyyy/mm') as ddd, count(to_char(hiredate, 'yyyy/mm')) as count from emp group by hiredate order by hiredate;

--테이블 복사
select * from tab;
--           테이블명
create table emp_copy
as
select * from emp;

--필드일부(사원번호, 사원명, 급여), 레코드포함 - emp_sal
create table emp_sal as select empno, ename, sal from emp;

-- Manager, Salesman 사원만으로 테이블 생성
create table emp_mgr_sale as select * from emp where job='MANAGER' or job='SALESMAN';

-- 테이블 구조 복사(레코드 제외)                    where뒤에 어떤 경우에도 참이 아닌 조건을 넣는다.
create table emp_desc as select * from emp where 1=2;

select * from emp_copy;
desc emp_copy;

--insert into : 레코드 추가
insert into emp_copy values(7777, '홍길동', '사무직', 7369, sysdate, 3500, 100, 40);
insert into emp_copy(empno, ename) values(8888, '세종대');
insert into emp_copy(ename, job) values('이순신', '총무부');
insert into emp_copy(deptno, ename, sal, empno)VALUES(40, 'hong', 4000, 9999);


--transaction : commit(적용), rollback(취소)
rollback;
commit;
select * from emp_copy;

select * from emp_desc;
select * from emp_mgr_sale;
select * from tab;
select * from emp_sal;

select * from tab;
--emp_desc테이블에 emp_copy의 레코드를 추가
insert into emp_desc(empno,ename,job,hiredate,sal)
select empno, ename, job, hiredate, sal from emp_copy where deptno in(10, 20);

select * from emp_desc;


