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
--�װ��� ��ü ���(�װ����, �����, ��߽ð�, ������, �����ð�)
select f.flightno �װ����,r.brdDate ��߳�¥, dep �����, depTime ��߽ð�, des ������, desTime �����ð�, flight_state ���� from ac_flight f join ac_reservation r
on r.flightno=f.flightno where r.brdDate > to_char(sysdate,'YYYYMMDD') order by r.brddate;

--�˻�-> �ؽ�Ʈ�ʵ� 4��(��¥, �װ����, �����, ������)�� �´� ������ ���
select f.flightno �װ����,r.brdDate ��߳�¥, dep �����, depTime ��߽ð�, des ������, desTime �����ð�, flight_state ���� from ac_flight f, ac_reservation r
where f.flightno='' OR dep='' OR des='pus' OR r.brddate > to_date(20190201, 'YYYYMMDD') order by r.brddate;

select * from ac_flight;
