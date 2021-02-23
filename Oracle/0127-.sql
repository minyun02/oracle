--문제1 사원테이블에서 사원명, 입사일, 담당업무, 부서코드를 선택하되 
--'ADAMS'와 같은 업무를 하는 사원이거나 'SCOTT'과 같은 부서인 사원을 선택하라.
select ename, hiredate, job, deptno from emp where job=(select job from emp where ename='ADAMS') 
OR deptno=(select deptno from emp where ename='SCOTT');

--문제2 사원테이블에서 사원번호가 7521인 사원과 업무가 같고 급여가 7934인 사원보다
---많은 사원의 사번, 이름, 업무, 입사일자, 급여를 출력하세요.
select empno, ename, job, hiredate, sal from emp
where job=(select job from emp where empno=7521) OR sal>(select sal from emp where empno=7934);

select * from emp where sal<(select avg(sal) from emp);

select deptno, min(sal) from emp group by deptno
having min(sal)>(select min(sal) from emp where deptno=20);

--문제1 사원테이블의 사원의 급여가 10번부서의 평균급여보다 많이 받는 업무를 하는 -> 
--          업무별 평균급여를 선택하라.
select job, avg(sal) from emp group by job
having avg(sal)>(select avg(sal) from emp where deptno=10);

select sal from emp where deptno=10;
select ename, sal from emp where sal=2450 or sal=5000 or sal=1300;
select ename, sal from emp where sal in (2450, 5000, 1300);

select ename, sal from emp where sal in (select sal from emp where deptno=20);
--20번 부서의 급여와 같지 않은 사원을 선택하라.
select ename, sal from emp where sal not in (select sal from emp where deptno=20);

--부서별로 급여를 가장 많이 받는 사원의 사원번호, 사원명, 급여, 부서코드를 출력하라.
select empno, ename, sal, deptno from emp where sal in (select max(sal) from emp group by deptno);

--문제 업무별로 최대 급여를 받는 사원의 사원번호와 이름, 업무, 급여을 출력하세요.
select max(sal) from emp group by job;

select empno, ename, job, sal from emp where sal in (select max(sal) from emp group by job);

select * from emp;

delete from emp where deptno in(40,50);
commit;
--ANY : 여러개중 하나만 만족해도 참
select sal from emp where job='SALESMAN'; -- 1600 1250 1250 1500

--업무가 'SALESMAN'인 사원의 최소급여보다
--많으면서 부서번호가 20번이 아닌 사원의 이름과 급여, 부서코드를 출력하라.
select ename, sal, deptno from emp
where sal > ANY(select sal from emp where job='SALESMAN');

--문제 사원테이블의 사원 중 KING이 속한 부서의 사원보다 늦게 입사한 사원의 사원명, 업무, 급여, 입사일을 선택하라.
select ename, job, sal, hiredate from emp 
where hiredate > ANY(select hiredate from emp where deptno=(select deptno from emp where ename='KING'));


--ALL : 모든 조건에 다 만족하는 경우 참

-- 업무가 'SALESMAN'인 사원의 최대급여보다
-- 많으면서 부서번호가 20번이 아닌 사원의 이름과 급여를 출력하라.

select ename, sal, job from emp where sal > ALL(select sal from emp where job='SALESMAN') and deptno!=20;

--다중열 서브쿼리
select empno, ename, sal, deptno from emp
where (sal, deptno) in (select sal, deptno from emp where deptno=30 and comm is not null);

--업무별로 최소 급여를 받는 사원의 사번, 이름, 업무, 부서번호를 출력하세요. 단, 업무별로 정렬하세요.
select empno, ename, job, sal, deptno from emp
where (job, sal) in (select job, min(sal) from emp group by job) order by job;
