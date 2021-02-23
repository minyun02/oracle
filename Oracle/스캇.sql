select * from emp;
select ename, sal from emp;
--부서코드가 10, 20인 레코드를 선책하라.
select * from emp where deptno=10 or deptno=20;
select * from emp where deptno in(10, 20);

--부서코드가 10, 20을 제외한 레코드를 선택하라.
select * from emp where deptno not in(10,20);
select empno, ename from emp where empno in(7900, 7934);
select empno, ename from emp where empno not in (7900, 7934);
--급여가 2000~3000불 사이인 사원을 선택하라.
select * from emp where sal between 2000 and 3000;
select * from emp where sal not between 2000 and 3000;
select * from emp where ename like 'S%';
select * from emp where ename like '%S';
select * from emp where ename like '%A%';

--두번째 문자가 A인 경우만 선택하라.
select * from emp where ename like '_A%';
--이름에서 세번째 문자가 A인 사원 제외하고 선택하라.
select * from emp where ename not like '__A%';

select * from emp where comm is null;
select * from emp where comm is not null;

--문제1. 사원목록 중 사원번호, 사원명, 입사일, 급여를 선택하되 급여가 2500에서 3500분 사이인 사원을 급여순으로 선택하라.
select empno, ename, hiredate, sal from emp where sal between 2500 and 3500 order by sal desc;
--문제2. 부서코드가 20, 30번 부서인 사원과 입사일이 12월인 사원을 사원번호순으로 선택하라.
select * from emp where deptno in(20, 30) or hiredate like '___06%' order by empno;

--과제1.
select empno, ename, sal from emp;

--과제2.
select empno, ename, sal, job from emp order by ename;

--과제3.
select * from emp where hiredate like '___05%';

--과제4.
select * from emp where ename like '%A%' or sal>=3000;

--과제5 EMP테이블의 레코드 중 업무가 SALESMAN이거나 MANAGER인 사원을 선택하라
select * from emp where job in('SALESMAN', 'MANAGER');

--과제6 EMP테이블의 사원 중 급여가 3000달러 이상이고, 보너스를 받지 않는 사원을 선택하라
select * from emp where sal>=3000 and comm is null;
select * from emp where sal>3000 and (comm is null or comm<1);
select * from emp where sal>3000 and nvl(comm,0)<=0;
--과제7 EMP테이블의 사원 중 급여가 2000~4000달러 인 사원과 보너스를 받는 사원을 선택하여 급여를 내림차순으로 정렬하여 선택하라..
select * from emp where comm is not null OR sal between 2000 and 4000 order by sal desc;
select * from emp where comm>0 OR sal between 2000 and 4000 order by sal desc;

--과제8 현재 계정의 테이블 목록을 확인하는 쿼리문을 작성하라
desc emp;
select * from tab;

--과제9 EMP테이블의 사원 중 사원번호, 이름, 업무, 입사일, 급여을 부서코드가 10, 20인 사원을 업무는 오름차순, 급여는 내림차순으로 정렬하여 선택하라.
select empno, ename, job, hiredate, sal from emp where deptno in(10, 20) order by job, sal desc;





-- smith는 급여가 800불입니다.
-- allen은 급여가 1600불입니다.
--literal
select ename || '는 급여가 ' || sal || '불입니다.' as "설명" from emp;

--중복행 제거
select job from emp;
select distinct job from emp;
select distinct deptno, job from emp order by deptno;




-- 숫자 함수
-- abs() : 절대치
select abs(-85) 절대치 from dual;
select sysdate from dual;
--ceil() : 올림
select ceil(10.1), ceil(-10.1) from dual;
--floor() : 버림
select floor(10.9), floor(-10.1) from dual;
--mod() : 나머지 
--pwer() : 
select mod(12,5), power(3,4) from dual;

select round(1245.3142, 1) from dual;

select round(1245.124, -2) from dual;

select trunc(7.5597, 2), trunc(5254.26, -2) from dual;

select trunc(7.5597, 2), round(7.5597, 2) from dual;

select sal, mod(sal,30) from emp where deptno=10;

--급여를 10%인상하여 선택하라.
select ename, sal, sal*1.1, round(sal*1.1, -1) 인상후 from emp;

-- concat : 문자연결
select concat(ename, '님') 사원명, hiredate from emp;

select * from emp;

-- initcap(첫번째문자 대문자), lower(소문자로), upper(대문자로)
select initcap('java spring mybatis'), lower('JAVA SPRING MYbatis'), upper('java spring mybatis') from dual;

--LPAD, RPAD : 빈자리를 문자로 채우기
select LPAD(ename,10, '*'), RPAD(ename, 10, '-') from emp;

-- SUBSTR(문자, 시작위치, 개수);
select job, substr(job, 2, 4), substr(job, -3, 2) from emp;

-- length() : 문자수
select length(ename), ename from emp;

--[문제] 이름을 글자길이의 50%만큼 출력하고 나머지 문자는 ‘*’으로 표시하여라. 
select RPAD((substr(ename, 1, length(ename)/2)), length(ename), '*') from emp;

