drop table member;


create table member(
memno char(4) Primary Key, 
name varchar2(30) not null,
address varchar2(100)not null,
hiredate date,
gender char(1),
tel1 char(3),
tel2 char(4),
tel3 char(4)
);

---------------select.jsp-------------------------
select memno,name,to_char(hiredate,'yyyy.mm.dd.') as hiredate,
--case gender when 'M' then '남' when 'F' then '여'
case gender when 'M' then '남' else '여' end as gender,
tel1,tel2,tel3
from member;

--가장 빠른 방법
select memno,name,address,
to_char(hiredate,'yyyy-mm.dd.')as hiredate,
decode(gender,'M','남','F','여')as gender,
tel1,tel2,tel3
from member;

---------------------------------update.jsp-----------------
select memno,name,address,
to_char(hiredate,'yyyy.mm.dd.'),
gender, 
tel1,tel2,tel3
from member
where memno ='1007';




insert into member values('1001','김고객','경북 경산시 중방동','02/01/01','F','010','1234','1001');
insert into member values('1002','이고객','경북 경산시 삼북동','02/02/01','M','010','1234','1002');
insert into member values('1003','박고객','경북 경산시 옥산동동','02/03/01','M','010','1234','1003');
insert into member values('1004','조고객','대구 광역시 달서구','02/04/01','M','010','1234','1004');
insert into member values('1005','유고객','대전 광역시 유성구','02/05/01','M','010','1234','1005');
insert into member values('1006','여고객','대구 광역시 수성구','02/06/01','M','010','1234','1006');
insert into member values('1007','남고객','충남 금산군 중도리','02/07/01','F','010','1234','1007');
insert into member values('1008','황고객','서울 특별시 관악구','02/08/01','F','010','1234','1008');
insert into member values('1009','전고객','서울 특별시 강서구','02/09/01','F','010','1234','1009');

select * from member;

create table grade(memgrade number(1) not null,
loprice number(30) not null,
hiprice number(30) not null	
);

insert into grade values(1,150001,500000);
insert into grade values(2,100001,500000);
insert into grade values(3,5001,150000);
insert into grade values(4,1,50000);

select * from grade;
drop table grade;

create table buy(
memno char(4), 
prodno char(4),
product varchar2(20)not null,
price number(30),
bno number(30),
primary key(memno, prodno) --묶어서 사용해야된다
);

select * from buy;
drop table buy;

insert into buy values('1009','0001','긴 바지','30000','4');
insert into buy values('1009','0002','점퍼','100000','1');
insert into buy values('1006','0004','긴팔 셔츠','25000','1');
insert into buy values('1006','0002','점퍼','100000','1');
insert into buy values('1005','0003','반팔','20000','3');
insert into buy values('1002','0003','반팔 셔츠','20000','2');
insert into buy values('1002','0004','긴팔 셔츠','25000','1');
insert into buy values('1001','0004','긴팔 셔츠','25000','1');
insert into buy values('1001','0005','긴팔 후드티','23000','2');



------------------select2.jsp----------------------
select memno,name,price,bno
from member natural join buy

select memno, name,sum(price*bno)
from member natural join buy
group by memno, name;

--순서2. 비등가조인(join ~ on)
select decode(memgrade,'1','VIP','2','Gold','3','Silver','4','Normal') as memgrade, memno, name, totalprice
from grade join(select memno,name,sum(price*bno)as totalprice 
from member natural join buy 
group by memno,name)
on(totalprice between loprice and hiprice) --비등가 조인조건 
order by totalprice desc;

--비등가 조인 방법 -2 
select decode(memgrade,'1','VIP','2','Gold','3','Silver','4','Normal') as memgrade, memno, name, totalprice
from grade join(select memno,name,sum(price*bno)as totalprice 
from member natural join buy 
group by memno,name)
on(totalprice >= loprice and totalprice <= hiprice) --비등가 조인조건 
order by totalprice desc;




--순서2. 비등가조인(where) 방법-1
select decode(memgrade,'1','VIP','2','Gold','3','Silver','4','Normal') as memgrade, memno, name, totalprice
from grade ,(select memno,name,sum(price*bno)as totalprice from member natural join buy group by memno,name)
where(totalprice between loprice and hiprice) --비등가 조인조건 
order by totalprice desc;

--비등가 조인 방법 (where) 방법  -2 
select decode(memgrade,'1','VIP','2','Gold','3','Silver','4','Normal') as memgrade, memno, name, totalprice
from grade join(select memno,name,sum(price*bno)as totalprice from member natural join buy group by memno,name)
on(totalprice >= loprice and totalprice <= hiprice) --비등가 조인조건 
order by totalprice desc;







