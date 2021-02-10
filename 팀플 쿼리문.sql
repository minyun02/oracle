--CustomBookingChange1
select r.resNo as 예약번호, r.brdDate as 출발일시, r.flightNo as 항공편명, d1.dep_city as 출발지, d1.dep_airport as 출발공항, f.depTime as 출발시간
, d2.des_city as 도착지, d2.des_airport as 도착공항, f.desTime as 도착시간
from ac_reservation r, ac_dep d1, ac_flight f, ac_des d2
where (select u.user_passNo from ac_user u where u.user_name='이지수')=r.user_passNo AND r.flightNo=f.flightNo AND f.dep=d1.dep AND f.des=d2.des order by r.brddate;

--CustomBookingChange3
--table1

--table2
--예약번호의 예약자 정보
select user_name, user_ename, r.user_passno, r.user_exdate, user_nation, user_birth, user_tel, user_email
from ac_user u join ac_reservation r on u.user_passno=r.user_passno where r.resno='Y13SD4'
union all
select com_name, com_ename, com_passno, com_exdate, com_nation, com_birth, com_tel, com_email
from ac_company where resno='Y13SD4';--예약번호는 변수를 통해서 받아야와야한다.
--table3


--항공편조회/수정
--항공편 전체 출력(항공편명, 출발지, 출발시간, 도착지, 도착시간)
select f.flightno 항공편면,r.brdDate 출발날짜, dep 출발지, depTime 출발시간, des 도착지, desTime 도착시간, flight_state 상태 from ac_flight f join ac_reservation r
on r.flightno=f.flightno where r.brdDate > to_char(sysdate,'YYYYMMDD') order by r.brddate;

--검색-> 텍스트필드 4개(날짜, 항공편명, 출발지, 도착지)에 맞는 데이터 출력
select f.flightno 항공편면,r.brdDate 출발날짜, dep 출발지, depTime 출발시간, des 도착지, desTime 도착시간, flight_state 상태 from ac_flight f, ac_reservation r
where f.flightno='' OR dep='' OR des='pus' OR r.brddate > to_date(20190201, 'YYYYMMDD') order by r.brddate;

select * from ac_flight;
