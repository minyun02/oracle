select * from tab;
select * from user_constraints where table_name='EMPLOYEE_INFO';

--서브쿼리

select * from (select empno, ename, sal from emp);

--단일행 서브 쿼리 : scott과 같은 업무를 하는 사원을 선택하라.
select empno, ename, sal, job, deptno from emp where job=(select job from emp where ename='SCOTT');
-- 10번 부서의 급여평균보다 많이 받는 사원은?
select avg(sal) from emp where deptno=10;
select * from emp where sal>2916.66666;

select * from emp where sal>(select avg(sal) from emp where deptno=10);

--사원번호 7698과 같은 업무를 하는 사원중 급여가 2500불 이상인 사원을 선택하라.
select * from emp where job=(select job from emp where empno=7698) and sal>=2500;

