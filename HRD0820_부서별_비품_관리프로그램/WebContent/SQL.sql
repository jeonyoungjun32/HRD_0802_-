create table equipment_list_14(
EQUIPMENT_NO char(6) not null,
EQUIPMENT_NAME varchar2(50),
EQUIPMENT_GROUP char(1),
EQUIPMENT_PRICE number,
REG_DATE date,
EQUIPMENT_STATUS CHAR(1),
EQUIPMENT_UNIT VARCHAR2(20),
primary key(EQUIPMENT_NO)
);
select * from equipment_list_14
insert into equipment_list_14 values('170001','의자','2','50000','17/04/06','Y','개');
insert into equipment_list_14 values('170002','책상','2','60000','17/04/09','Y','개');
insert into equipment_list_14 values('170003','사무pc','1','250000','17/04/09','Y','대');
insert into equipment_list_14 values('170004','복합기','1','200000','17/04/09','Y','대');
insert into equipment_list_14 values('170005','서랍장','2','35000','17/05/06','N','개');
insert into equipment_list_14 values('170006','A4용지','1','25000','17/01/03','Y','BOX');
insert into equipment_list_14 values('170007','B5용지','1','20000','17/01/06','Y','BOX');

create table equipment_postulat_14(
REQ_NO NUMBER NOT NULL,
EQUIPMENT_NO CHAR(6) NOT NULL,
REQ_DATE DATE,
REQ_QTY NUMBER,
REQ_DEPT CHAR(2),
PRIMARY KEY(REQ_NO)
);

--insert.jsp
select NVL(max(EQUIPMENT_NO),0)+1
from equipment_list_14

--insertPro
select EQUIPMENT_NO, EQUIPMENT_NAME, 
EQUIPMENT_GROUP, EQUIPMENT_PRICE, REG_DATE,
EQUIPMENT_STATUS,EQUIPMENT_UNIT

--insert2.jsp
select REQ_NO, EQUIPMENT_NO, REQ_DATE, REQ_QTY, REQ_DEPT

--select.jsp 이건 아닐세
select EQUIPMENT_NO, EQUIPMENT_NAME, 
decode(EQUIPMENT_GROUP,'1','기계기구','2','집기비품'),
to_char(REG_DATE,'yyyy-mm-dd'), 
decode(EQUIPMENT_STATUS,'Y','사용','N','미사용'),
EQUIPMENT_UNIT
from equipment_list_14 
order by 1 desc

--select2.jsp 비품구매현황조회
select decode(REQ_DEPT,'A1','총무','A2','회계','B1','경영','B2','인사')as REQ_DEPT,
count(REQ_DEPT),
sum(REQ_QTY),
sum(REQ_QTY)*EQUIPMENT_PRICE
from equipment_dept_14 natural join equipment_postulat_14 natural join equipment_list_14
group by REQ_DEPT


select decode(REQ_DEPT,'A1','총무','A2','회계','B1','경영','B2','인사')as REQ_DEPT,
count(REQ_DEPT),
sum(REQ_QTY)
from equipment_dept_14 natural join equipment_postulat_14 
group by REQ_DEPT

--부서명, 신청건수 ,비품 총 개수    구했는데  총 구입금액이 어렵네
select decode(REQ_DEPT,'A1','총무','A2','회계','B1','경영','B2','인사'),
count(equipment_no),
sum(REQ_QTY),
to_char(sum(price), '999,999,999')
from equipment_dept_14 natural join (select req_dept, EQUiPMENT_NO, req_qty, equipment_price*req_qty as price
									 from EQUIPMENT_LIST_14 natural join equipment_postulat_14)
group by REQ_DEPT


select req_dept, p.EQUiPMENT_NO, req_qty, equipment_price*req_qty as price
from EQUIPMENT_LIST_14 natural join equipment_postulat_14 



insert into equipment_postulat_14 values('10001','170001','17/12/01','10','A1');
insert into equipment_postulat_14 values('10002','170002','17/12/01','10','A1');
insert into equipment_postulat_14 values('10003','170001','18/02/12','5','A2');
insert into equipment_postulat_14 values('10004','170002','18/02/12','5','A2');
insert into equipment_postulat_14 values('10005','170006','18/02/14','10','A2');
insert into equipment_postulat_14 values('10006','170007','18/03/03','2','A2');
insert into equipment_postulat_14 values('10007','170007','18/03/04','2','B2');
insert into equipment_postulat_14 values('10008','170006','18/03/10','4','A1');
insert into equipment_postulat_14 values('10009','170006','18/04/01','4','B1');
insert into equipment_postulat_14 values('100010','170006','18/04/06','2','B2');
insert into equipment_postulat_14 values('100011','170007','18/05/01','10','A2');
insert into equipment_postulat_14 values('100012','170005','18/05/01','1','B1');
insert into equipment_postulat_14 values('100013','170007','18/05/11','5','A1');
insert into equipment_postulat_14 values('100014','170007','18/05/12','5','A2');
insert into equipment_postulat_14 values('100015','170004','18/06/14','2','B1');

create table equipment_dept_14(
REQ_DEPT CHAR(2) NOT NULL,
DNAME VARCHAR2(20) NOT NULL,
LOC VARCHAR2(20),
PRIMARY KEY(REQ_DEPT)
);

insert into equipment_dept_14 values('A1','총무','세종');
insert into equipment_dept_14 values('A2','회계','세종');
insert into equipment_dept_14 values('B1','경영','세종');
insert into equipment_dept_14 values('B2','인사','대전');



