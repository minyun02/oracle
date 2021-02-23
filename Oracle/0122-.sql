select * from member;

select * from emp;

select * from dept;

insert into emp (empno, deptno) values(7777, 50);

select * from emp;

rollback;

-- deptno -> primary key(유일한 값, + not null)
-- dname -> unique key (유일한 값)

--제약조건 설정
alter table dept add constraint dept_pk_deptno primary key(deptno);

insert into dept (dname, loc) values('총무부', '마포구'); --not null 값이 없어서 에러
insert into dept (deptno, dname, loc) values(10, '총무부', '마포구'); --deptno 중복 에러
insert into dept (deptno, dname, loc) values(50, '총무부', '마포구');

alter table dept add constraint dept_uk_dname unique(dname);
insert into dept (deptno, dname, loc) values(60, '총무부', '영등포구'); --총무부 중복이어서 에러
insert into dept (deptno, dname, loc) values(60, '기획부', '영등포구');

--제약 조건 확인하기
select * from user_constraints;

--check : 값의 범위설정
--급여 필드는 500~10000까지만 등록되도록 설정.

alter table emp add constraint emp_ck_sal check (sal between 500 and 10000);

insert into emp(empno, ename, sal, deptno) values(9999, 'ABCD', 12000, 50); --제약 조건보다 높은 값으로 에러
insert into emp(empno, ename, sal, deptno) values(9999, 'ABCD', 8000, 50);
select * from emp;
select * from dept;

alter table emp add constraint emp_ck_comm check (comm in (0, 100, 200, 300, 400, 500, 1400));
insert into emp (empno, ename, comm, deptno) values(8888, 'BBBBB', 350, 40); --comm제약 조건에 해당하지않아서 에러
insert into emp (empno, ename, comm, deptno) values(8888, 'BBBBB', 400, 40);

--외래키 설정
--emp 테이블의 deptno는 dept테이블의 deptno를 참조한다.
alter table emp add constraint emp_pk_deptno foreign key(deptno) references dept(deptno);
insert into emp(empno, ename, deptno) values (7777, 'XXXX', 80); --deptno에 설정한 제약조건에 위배
insert into emp(empno, ename, deptno) values (7777, 'XXXX', 50);

select * from user_constraints;
--제약조건 삭제
alter table dept drop constraint dept_uk_dname;

select * from member;