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
--1.항공편 전체 출력(항공편명, 출발지, 출발시간, 도착지, 도착시간)
select r.flightno 항공편면,r.brdDate 출발날짜, dep 출발지, depTime 출발시간, des 도착지, desTime 도착시간, flight_state 상태 from ac_reservation r join ac_flight f
on r.flightno=f.flightno where r.brdDate > to_char(sysdate,'YYYYMMDD') order by depTime;

select DISTINCT r.flightno 항공편면,r.brdDate 출발날짜, dep 출발지, depTime 출발시간, des 도착지, desTime 도착시간, flight_state 상태 from ac_reservation r join ac_flight f
on r.flightno=f.flightno where r.brdDate > to_char(sysdate,'YYYYMMDD') order by r.brddate;

--2.1검색-> 텍스트필드 4개 중 1개만 입력되었을때.->완료
select r.flightno 항공편면,r.brdDate 출발날짜, dep 출발지, depTime 출발시간, des 도착지, desTime 도착시간, flight_state 상태 from ac_flight f, ac_reservation r
where r.brddate > to_date(20200201, 'YYYYMMDD') or f.flightno='' OR dep='' OR des='' order by r.brddate;
--2.2출발날짜&항공편->완료
select DISTINCT f.flightno 항공편면,r.brdDate 출발날짜, dep 출발지, depTime 출발시간, des 도착지, desTime 도착시간, flight_state 상태 from ac_flight f, ac_reservation r
where r.brddate > to_date(20210201, 'YYYYMMDD') AND f.flightno='AC203' order by r.brddate;
--2.3출발날짜&출발지->완료
select DISTINCT f.flightno 항공편면,r.brdDate 출발날짜, dep 출발지, depTime 출발시간, des 도착지, desTime 도착시간, flight_state 상태 from ac_flight f, ac_reservation r
where r.brddate > to_date(20210201, 'YYYYMMDD') AND dep='CJU' order by r.brddate;
--2.4출발날짜&도착지->완료
select DISTINCT f.flightno 항공편면,r.brdDate 출발날짜, dep 출발지, depTime 출발시간, des 도착지, desTime 도착시간, flight_state 상태 from ac_flight f, ac_reservation r
where r.brddate > to_date(20210201, 'YYYYMMDD') AND des='CJU' order by r.brddate;
--2.5항공편&출발지->완료
select DISTINCT f.flightno 항공편면,r.brdDate 출발날짜, dep 출발지, depTime 출발시간, des 도착지, desTime 도착시간, flight_state 상태 from ac_flight f, ac_reservation r
where f.flightno='AC203' AND dep='PUS' order by r.brddate;
--2.6항공편&도착지->완료
select DISTINCT f.flightno 항공편면,r.brdDate 출발날짜, dep 출발지, depTime 출발시간, des 도착지, desTime 도착시간, flight_state 상태 from ac_flight f, ac_reservation r
where f.flightno='AC203' AND des='CJU' order by r.brddate;
--2.7출발지&도착지->완료
select DISTINCT f.flightno 항공편면,r.brdDate 출발날짜, dep 출발지, depTime 출발시간, des 도착지, desTime 도착시간, flight_state 상태 from ac_flight f, ac_reservation r
where dep='PUS' AND des='CJU' order by r.brddate;
--2.8전부다 입력->필요없음
select r.flightno 항공편면,r.brdDate 출발날짜, dep 출발지, depTime 출발시간, des 도착지, desTime 도착시간, flight_state 상태 from ac_flight f, ac_reservation r
where f.flightno='AC203' AND dep='PUS' AND des='CJU' AND r.brddate > to_date(20200201, 'YYYYMMDD') order by r.brddate;


--3.지연상태 수정
update ac_flight set depTime='1200', desTime='1300', flight_state='NORMAL' where flightNo='AC203';

update ac_flight f, ac_reservation r set f.depTime='1234', f.desTime='1234', 








--
update ac_flight set depTime='1234', desTime='1234', flight_state='DELAYED' 
where flightNo=(select r.flightno from ac_reservation r where r.brdDate=to_char(TO_DATE(20210215, 'YYYYMMDD')AND r.flightno='AC203');

--2021년 2월 15일에 출발하는 203편
update ac_flight set depTime='1234', desTime='1234', flight_state='DELAYED' 
where flightno=(select distinct flightno from ac_reservation where brddate=to_date(20210215, 'YYYYMMDD') AND flightno='AC203');

select * from ac_flight where flightno='AC203';----------0212 새벽에 여기까지함



select * from ac_reservation where flightno='AC203' AND brdDate=to_char(TO_DATE(20210215, 'YYYYMMDD'));		

select * from ac_reservation where user_passno='M234784' order by brddate;
 
select * from ac_flight where flightno='AC203';

select r.flightno, f.dep, r.brddate from ac_reservation r, ac_flight f where r.brddate=to_char(TO_DATE('20210215', 'YYYYMMDD')) AND f.dep='PUS';
rollback;
commit;
