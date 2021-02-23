select * from authortbl;
select * from bookstbl;
select * from pubtbl;

select * from emp;
select * from dept;
select * from salgrade;

--isbn, 책제목, 가격, 작가명, 이메일, 출판사명, 출판사연락처
select isbn, subject, price, pub_name, pub_tel, author, email
from bookstbl b join pubtbl p on b.pub_code=p.pub_code
join authortbl a on b.auther_code= a.author_code;

--emp, dept, salgrade
--사원번호, 사원명, 담당업무, 급여, 부서명, 위치, 호봉을 선택하라.
select empno, ename, job, sal, dname, loc, grade
from emp e join dept d on e.deptno=d.deptno
join salgrade s on e.sal between s.losal and s.hisal;

--self join
select e1.empno, e1.ename, e1.sal, e1.mgr, e2.empno 상급사원번호, e2.ename 상급사원명, e2.sal 상급급여
from emp e1 join emp e2 on e1.mgr = e2.empno;

--문제 emp테이블에서 "누구의 관리자는 누구이다"는 내용을 출력하시오
select RPAD(e1.ename,16, '의 관리자는'), RPAD(e2.ename,10,'이다*') from emp e1 join emp e2 on e1.mgr = e2.empno;

select e1.ename || '의 관리자는' || e2.ename || '이다.' as info from emp e1 join emp e2 on e1.mgr=e2.empno;

--                                                                              Right outer join->null데이터가 왼쪽에 있으면 right outer join
select ename, sal, e.deptno, d.deptno, dname from emp e join dept d on e.deptno(+)=d.deptno;
select ename, sal, e.deptno, d.deptno, dname from emp e right outer join dept d on e.deptno=d.deptno;

--left outer join
select d.deptno, dname, ename, sal, e.deptno from dept d join emp e on d.deptno=e.deptno(+);
select d.deptno, dname, ename, sal, e.deptno from dept d left outer join emp e on d.deptno= e.deptno;

--full outer join
select d.deptno, dname, ename, sal, e.deptno from dept d full outer join emp e on d.deptno=e.deptno;
select ename, sal, e.deptno, d.deptno, dname from emp e full outer join dept d on e.deptno=d.deptno;

--20번 부서의 평균급여보다 많이 받는 사원을 선택하라.
select b.empno, b.ename, b.job, b.sal, b.deptno from
(select * from emp where sal>(select avg(sal) from emp where deptno=20)) a, emp b
where a.empno=b.empno and b.mgr is not null and b.deptno!=20;

--pdf27 -> 8페이지 5문제 풀어오기
--문제1 emp테이블에서 모든 사원에 대한 이름, 부서번호, 부서명을 출력하는 문장을 작성하세요. (부서번호순으로 오름차순 정렬하라.)
select e.ename, e.deptno, d.dname from emp e join dept d on e.deptno=d.deptno order by e.deptno;

--문제2 emp테이블에서 NEW YORK에서 근무하고 있는 사원에 대하여 이름, 업무, 급여, 부서명을 출력하는 SELECT문을 작성하세요.
select e.ename, e.job, e.sal, d.dname from emp e join dept d on e.deptno=d.deptno AND d.loc='NEW YORK';
--문제3 EMP테이블에서 보너스를 받는 사원에 대하여 이름, 부서명, 위치를 출력하는 SELECT문을 작성하세요.
select e.ename, d.dname, d.loc from emp e join dept d on e.deptno=d.deptno and e.comm is not null OR nvl(comm, 0);
--문제4 EMP테이블에서 이름 중 L자가 있는 사원에 대해 이름, 업무, 부서명, 위치를 출력하는 문장을 작성하세요.
select e.ename, e.job, d.dname, d.loc from emp e join dept d on e.deptno=d.deptno and e.ename like '%L%';
--문제5 아래의 결과를 출력하는 문장을 작성하세요 (관리자가 없는 King을 포함하여 모든 사원을 출력)
select e1.ename as Employee, e1.empno as Emp#, e2.ename as Manager, e2.mgr as Mgr#
from emp e1 join emp e2 on e1.Mgr=e2.empno;
