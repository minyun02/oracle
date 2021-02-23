select * from tab;
select * from member;
select max(num) from member;

insert into member(num, username, tel, writedate, gender)
values(20, 'hong', '010-8888-9999', sysdate, 'F');

alter table member add (gender char(1));
ALTER TABLE member MODIFY (gender CHAR(1) NOT NULL);

update member set gender='M';

insert into member(num, username,tel, addr, email, writedate, gender)
values(1, '홍길동', '010-9999-8888', '서울시 마포구 백범로', 'aaaaaaaaa@nate.com', sysdate, 'M');

--시퀀스
create sequence memSq
start with 1
increment by 1;

create sequence a_sq
start with 10
increment by 10;

select * from member;
insert into member values(a_sq.nextval, 'lee', '010-9999-7777', 'bbbb@naver.com', '서울시 종로구', sysdate, 'M');

select a_sq.nextval, a_sq.currval from dual;

-- 현재 계정에 사용중인 시퀀스 객체 확인하기***
select * from user_sequences;

--시퀀스 수정
alter sequence a_sq
increment by 100;

--시퀀스 삭제
drop sequence a_sq;

--레코드 삭제
delete from member;
commit;

select * from member;
desc member;

alter table member drop column gender;