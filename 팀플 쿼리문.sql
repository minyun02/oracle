--CustomBookingChange1
select r.resNo as �����ȣ, r.brdDate as ����Ͻ�, r.flightNo as �װ����, d1.dep_city as �����, d1.dep_airport as ��߰���, f.depTime as ��߽ð�
, d2.des_city as ������, d2.des_airport as ��������, f.desTime as �����ð�
from ac_reservation r, ac_dep d1, ac_flight f, ac_des d2
where (select u.user_passNo from ac_user u where u.user_name='������')=r.user_passNo AND r.flightNo=f.flightNo AND f.dep=d1.dep AND f.des=d2.des order by r.brddate;

--CustomBookingChange3
--table1

--table2
--�����ȣ�� ������ ����
select user_name, user_ename, r.user_passno, r.user_exdate, user_nation, user_birth, user_tel, user_email
from ac_user u join ac_reservation r on u.user_passno=r.user_passno where r.resno='Y13SD4'
union all
select com_name, com_ename, com_passno, com_exdate, com_nation, com_birth, com_tel, com_email
from ac_company where resno='Y13SD4';--�����ȣ�� ������ ���ؼ� �޾ƾ߿;��Ѵ�.
--table3


--�װ�����ȸ/����
--1.�װ��� ��ü ���(�װ����, �����, ��߽ð�, ������, �����ð�)
select r.flightno �װ����,r.brdDate ��߳�¥, dep �����, depTime ��߽ð�, des ������, desTime �����ð�, flight_state ���� from ac_reservation r join ac_flight f
on r.flightno=f.flightno where r.brdDate > to_char(sysdate,'YYYYMMDD') order by depTime;

select DISTINCT r.flightno �װ����,r.brdDate ��߳�¥, dep �����, depTime ��߽ð�, des ������, desTime �����ð�, flight_state ���� from ac_reservation r join ac_flight f
on r.flightno=f.flightno where r.brdDate > to_char(sysdate,'YYYYMMDD') order by r.brddate;

--2.1�˻�-> �ؽ�Ʈ�ʵ� 4�� �� 1���� �ԷµǾ�����.->�Ϸ�
select r.flightno �װ����,r.brdDate ��߳�¥, dep �����, depTime ��߽ð�, des ������, desTime �����ð�, flight_state ���� from ac_flight f, ac_reservation r
where r.brddate > to_date(20200201, 'YYYYMMDD') or f.flightno='' OR dep='' OR des='' order by r.brddate;
--2.2��߳�¥&�װ���->�Ϸ�
select DISTINCT f.flightno �װ����,r.brdDate ��߳�¥, dep �����, depTime ��߽ð�, des ������, desTime �����ð�, flight_state ���� from ac_flight f, ac_reservation r
where r.brddate > to_date(20210201, 'YYYYMMDD') AND f.flightno='AC203' order by r.brddate;
--2.3��߳�¥&�����->�Ϸ�
select DISTINCT f.flightno �װ����,r.brdDate ��߳�¥, dep �����, depTime ��߽ð�, des ������, desTime �����ð�, flight_state ���� from ac_flight f, ac_reservation r
where r.brddate > to_date(20210201, 'YYYYMMDD') AND dep='CJU' order by r.brddate;
--2.4��߳�¥&������->�Ϸ�
select DISTINCT f.flightno �װ����,r.brdDate ��߳�¥, dep �����, depTime ��߽ð�, des ������, desTime �����ð�, flight_state ���� from ac_flight f, ac_reservation r
where r.brddate > to_date(20210201, 'YYYYMMDD') AND des='CJU' order by r.brddate;
--2.5�װ���&�����->�Ϸ�
select DISTINCT f.flightno �װ����,r.brdDate ��߳�¥, dep �����, depTime ��߽ð�, des ������, desTime �����ð�, flight_state ���� from ac_flight f, ac_reservation r
where f.flightno='AC203' AND dep='PUS' order by r.brddate;
--2.6�װ���&������->�Ϸ�
select DISTINCT f.flightno �װ����,r.brdDate ��߳�¥, dep �����, depTime ��߽ð�, des ������, desTime �����ð�, flight_state ���� from ac_flight f, ac_reservation r
where f.flightno='AC203' AND des='CJU' order by r.brddate;
--2.7�����&������->�Ϸ�
select DISTINCT f.flightno �װ����,r.brdDate ��߳�¥, dep �����, depTime ��߽ð�, des ������, desTime �����ð�, flight_state ���� from ac_flight f, ac_reservation r
where dep='PUS' AND des='CJU' order by r.brddate;
--2.8���δ� �Է�->�ʿ����
select r.flightno �װ����,r.brdDate ��߳�¥, dep �����, depTime ��߽ð�, des ������, desTime �����ð�, flight_state ���� from ac_flight f, ac_reservation r
where f.flightno='AC203' AND dep='PUS' AND des='CJU' AND r.brddate > to_date(20200201, 'YYYYMMDD') order by r.brddate;


--3.�������� ����
update ac_flight set depTime='1200', desTime='1300', flight_state='NORMAL' where flightNo='AC203';

update ac_flight f, ac_reservation r set f.depTime='1234', f.desTime='1234', 








--
update ac_flight set depTime='1234', desTime='1234', flight_state='DELAYED' 
where flightNo=(select r.flightno from ac_reservation r where r.brdDate=to_char(TO_DATE(20210215, 'YYYYMMDD')AND r.flightno='AC203');

--2021�� 2�� 15�Ͽ� ����ϴ� 203��
update ac_flight set depTime='1234', desTime='1234', flight_state='DELAYED' 
where flightno=(select distinct flightno from ac_reservation where brddate=to_date(20210215, 'YYYYMMDD') AND flightno='AC203');

select * from ac_flight where flightno='AC203';----------0212 ������ ���������



select * from ac_reservation where flightno='AC203' AND brdDate=to_char(TO_DATE(20210215, 'YYYYMMDD'));		

select * from ac_reservation where user_passno='M234784' order by brddate;
 
select * from ac_flight where flightno='AC203';

select r.flightno, f.dep, r.brddate from ac_reservation r, ac_flight f where r.brddate=to_char(TO_DATE('20210215', 'YYYYMMDD')) AND f.dep='PUS';
rollback;
commit;
