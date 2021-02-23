--문제1 emp테이블에서 모든 사원에 대한 이름, 부서번호, 부서명을 출력하는 문장을 작성하세요. (부서번호순으로 오름차순 정렬하라.)
select e.ename, e.deptno, d.dname from emp e join dept d on e.deptno=d.deptno order by e.deptno;

select ename, emp.deptno, dname from emp join dept on emp.deptno=dept.deptno order by emp.deptno;

--문제2 emp테이블에서 NEW YORK에서 근무하고 있는 사원에 대하여 이름, 업무, 급여, 부서명을 출력하는 SELECT문을 작성하세요.
select e.ename, e.job, e.sal, d.dname from emp e join dept d on e.deptno=d.deptno AND d.loc='NEW YORK';

select ename, job, sal, dname from emp join dept on emp.deptno=dept.deptno where dept.loc='NEW YORK';

--문제3 EMP테이블에서 보너스를 받는 사원에 대하여 이름, 부서명, 위치를 출력하는 SELECT문을 작성하세요.
select e.ename, d.dname, d.loc from emp e join dept d on e.deptno=d.deptno and e.comm is not null OR nvl(comm, 0);

select ename, dname, loc from emp join dept on emp.deptno=dept.deptno where comm>0;

--문제4 EMP테이블에서 이름 중 L자가 있는 사원에 대해 이름, 업무, 부서명, 위치를 출력하는 문장을 작성하세요.
select e.ename, e.job, d.dname, d.loc from emp e join dept d on e.deptno=d.deptno and e.ename like '%L%';

select ename, job, dname, loc from emp join dept on emp.deptno=dept.deptno
where ename like '%L%';

select e.ename, e.job, dname, loc from (select ename, job, deptno from emp where ename Like '%L%') e join dept
on e.deptno=dept.deptno;

--문제5 아래의 결과를 출력하는 문장을 작성하세요 (관리자가 없는 King을 포함하여 모든 사원을 출력)
select e1.ename as Employee, e1.empno as Emp#, e2.ename as Manager, e2.mgr as Mgr#
from emp e1 join emp e2 on e1.Mgr=e2.empno;

select a.ename, a.empno, b.ename, b.empno from emp a left outer join emp b on a.mgr=b.empno;

-- using
select ename, sal, deptno from emp join dept using(deptno);


-- view : 가상테이블
select * from emp;

-- 사원번호, 사원명, 급여, 입사일 필드가 있는 view 생성
create or replace view emp_view
as
select empno, ename, sal, hiredate from emp;

select * from tab;
select * from emp_view;
select * from emp;

insert into emp_view values(7777, '홍길동', 4000, sysdate);

create or replace view emp_view_10
as
select * from emp where deptno=10;

select * from emp_view_10;

insert into emp_view_10(empno, ename, sal, deptno) values(8888, 'AAAA', 1201, 20);

create or replace view emp_view_20
as
select * from emp where deptno=20
with check option;

insert into emp_view_20(empno, ename, sal, deptno) values(9999, 'BBBB', 2542, 20);

create or replace view emp_view_30
as
select * from emp where deptno=30
with read only;

select * from emp_view_30;

insert into emp_view_30(empno, ename, sal, deptno) values(9999, 'BBBB', 5215, 30);

desc emp;
desc dept;

create or replace view emp_dept
as
select empno, ename, sal, deptno, dname from emp join dept using(deptno);

select * from emp_dept;

insert into emp_dept values(5555, 'CCCC',5999, 70, '영업부');
insert into emp_dept(empno, ename, sal, deptno) values(5555, 'CCCC',5999, 40);

select * from tab;

drop view emp_dept;
drop view emp_view;
drop view emp_view_10;
drop view emp_view_20;
drop view emp_view_30;