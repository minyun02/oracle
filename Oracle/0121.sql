select * from tab;
select * from member;
select max(num) from member;

insert into member(num, username, tel, writedate, gender)
values(20, 'hong', '010-8888-9999', sysdate, 'F');

alter table member add (gender char(1));
ALTER TABLE member MODIFY (gender CHAR(1) NOT NULL);

update member set gender='M';

insert into member(num, username,tel, addr, email, writedate, gender)
values(1, 'ȫ�浿', '010-9999-8888', '����� ������ �����', 'aaaaaaaaa@nate.com', sysdate, 'M');

--������
create sequence memSq
start with 1
increment by 1;

create sequence a_sq
start with 10
increment by 10;

select * from member;
insert into member values(a_sq.nextval, 'lee', '010-9999-7777', 'bbbb@naver.com', '����� ���α�', sysdate, 'M');

select a_sq.nextval, a_sq.currval from dual;

-- ���� ������ ������� ������ ��ü Ȯ���ϱ�***
select * from user_sequences;

--������ ����
alter sequence a_sq
increment by 100;

--������ ����
drop sequence a_sq;

--���ڵ� ����
delete from member;
commit;

select * from member;
desc member;

alter table member drop column gender;