--CustomBookingChange1
select r.resNo as 예약번호, r.brdDate as 출발일시, r.flightNo as 항공편명, d1.dep_city as 출발지, d1.dep_airport as 출발공항, f.depTime as 출발시간
, d2.des_city as 도착지, d2.des_airport as 도착공항, f.desTime as 도착시간
from ac_reservation r, ac_dep d1, ac_flight f, ac_des d2
where (select u.user_passNo from ac_user u where u.userNo=1)=r.user_passNo AND r.flightNo=f.flightNo AND f.dep=d1.dep AND f.des=d2.des;

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
select flightno, dep, depTime, des, desTime from ac_flight;





