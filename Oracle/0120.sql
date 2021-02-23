select * from emp_copy;

--update, insertm delete -> transaction이 필요하다 = commit, rollback
--update : 레코드 수정
-- 사원번호 7499의 부서코드를 40번으로 수정
UPDATE emp_copy set deptno=40 where empno=7499;

--job이 manager인 사원은 급여의 10%를 보너스(comm)로 수정
update emp_copy set comm=(sal*0.1) where job='MANAGER';

--JONES사원이 부서이동 부서=10, 업무='SALESMAN'으로 수정
update emp_copy set deptno=10, job='SALESMAN' where ename='JONES';

--모든 사원이 급여가 10%인상됨...(0, null제외하고)
update emp_copy set sal = sal*1.1;


-- delete: 레코드 삭제
delete from emp_copy where empno=8888;
delete from emp_copy;
rollback;

select * from tab;

--테이블 생성하기
create table member(
    num number(4) primary key,
    username varchar2(20) not null,
    tel varchar2(20) not null,
    email varchar2(30),
    addr varchar2(100),
    writedate date default sysdate
);

select * from tab;
select * from user_tables;
select * from tabs;

--필드 추가 : add
alter table member add (gender char(1) not null);
select * from member;
insert into member(num, username,tel, addr, email, writedate, gender)
values(1, '홍길동', '010-9999-8888', '서울시 마포구 백범로', 'aaaaaaaaa@nate.com', sysdate, 'M');
commit;

alter table member add (hobby varchar(20) default '축구');
alter table member add (intro varchar(20));

--필드 수정
alter table member modify (email varchar2(50));
alter table member modify (username varchar2(12));
alter table member modify (addr varchar2(10));

-- 필드 삭제
alter table member drop column intro;
alter table member drop column hobby;
alter table member drop column gender;
select * from member;

select * from tab;

--테이블 삭제 
drop table emp_sal;
drop table emp_desc;
drop table emp_mgr_sale purge; -- 휴지통에 저장하지 안하고 지움.
--이미 생성된 휴지통 테이블 비우기
purge recyclebin;

desc member;