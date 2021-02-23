/* 책테이블 */
CREATE TABLE bookstbl (
   isbn NUMBER(5) NOT NULL, /* isbn */
   subject VARCHAR2(200) NOT NULL, /* 책제목 */
   jangre VARCHAR2(20), /* 장르 */
   pub_code NUMBER(5), /* 출판사코드 */
   auther_code NUMBER(5), /* 작가코드 */
   price NUMBER(5), /* 가격 */
   pub_date DATE, /* 출판일 */
   history VARCHAR2(200), /* 줄거리 */
   writedate DATE DEFAULT sysdate NOT NULL, /* 등록일 */
   author_code NUMBER(5) /* 저자코드 */
);

ALTER TABLE TABLE
   ADD
      CONSTRAINT PK_TABLE
      PRIMARY KEY (
         isbn
      );

/* 출판사테이블 */
CREATE TABLE pubTbl (
   pub_code NUMBER(5) NOT NULL, /* 출판사코드 */
   pub_name VARCHAR2(30) NOT NULL, /* 출판사명 */
   pub_tel VARCHAR2(15), /* 연락처 */
   pub_owner VARCHAR2(20), /* 대표 */
   fax VARCHAR2(15), /* 팩스 */
   writedate DATE DEFAULT sysdate NOT NULL /* 등록일 */
);

ALTER TABLE pubTbl
   ADD
      CONSTRAINT PK_pubTbl
      PRIMARY KEY (
         pub_code
      );

/* 작가테이블 */
CREATE TABLE authorTbl (
   author_code NUMBER(5) NOT NULL, /* 저자코드 */
   author VARCHAR2(20) NOT NULL, /* 저자명 */
   debue VARCHAR2(200), /* 데뷔작 */
   debue_date DATE, /* 데뷔년도 */
   email VARCHAR2(200), /* 이메일 */
   writedate DATE DEFAULT sysdate NOT NULL /* 등록일 */
);

ALTER TABLE authorTbl
   ADD
      CONSTRAINT PK_authorTbl
      PRIMARY KEY (
         author_code
      );

ALTER TABLE TABLE
   ADD
      CONSTRAINT FK_pubTbl_TO_TABLE
      FOREIGN KEY (
         pub_code
      )
      REFERENCES pubTbl (
         pub_code
      );

ALTER TABLE TABLE
   ADD
      CONSTRAINT FK_authorTbl_TO_TABLE
      FOREIGN KEY (
         author_code
      )
      REFERENCES authorTbl (
         author_code
      );
      
      
      ----------------------------------------------------------------------------------------------------------------
select * from emp, dapt where emp.deptno = dept.daptno;


select *from emp;
select * from dept;
select * from salgrade;

-- 사원명 급여 부서명을 선택하라
select ename,sal,dname from emp, dept where emp.deptno = dept.deptno;

select ename,sal,dname from emp a, dept b where a.deptno = b.deptno;

select ename,sal,dname from emp a join dept b on a.deptno = b.deptno;


select empno,ename,emp.deptno,dept.deptno,dname, loc 
from emp join dept 
on emp.deptno = dept.deptno;

SELECT empno, ename, emp.deptno, dept.deptno, dname, loc
FROM EMP, DEPT
WHERE EMP.DEPTNO=DEPT.DEPTNO;

--SALESMAN의 사원번호, 이름, 급여, 부서명, 근무지를 출력하여라.
select e.empno, e.ename,e.sal,d.dname,d.loc 
from emp e join dept d on e.deptno=d.deptno where job = 'SALESMAN';

select e.empno, e.ename,e.job , e.sal,d.dname,d.loc from emp e join dept d 
on e.deptno=d.deptno where job ='SALESMAN' order by e.ename asc;

select *from tab;
select * from salgrade;

--사원명 급여,호봉,losal hisal선택하라
--                                                              급여가    losal hisal 사이에 있으면            
select ename,sal,grade,losal, hisal from emp join salgrade on sal between losal and hisal ;



select *from pubtbl;
@d:\publish.sql
rollback;
commit;
@d:\publish2.sql
rollback;

select *from authortbl;
@d:\publish2.sql
select *from  user_constraints;

select * from bookstbl;
@d:\bookstbl.sql

ALTER TABLE bookstbl DROP COLUMN author_code;

select * from tab;

insert into bookstbl values('1234','이것이 자바다','IT','1','1','25000',sysdate,'자바는어렵다.',sysdate);
insert into bookstbl values('1235','쉽게배우는자바','IT','2','1','20000',sysdate,'재미음슴',sysdate);
insert into bookstbl values('1236','스프링프레임워크','IT','3','2','15000',sysdate,'spring framework jjang',sysdate);

commit;