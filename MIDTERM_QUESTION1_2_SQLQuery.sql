question 1

create table [DIM_PUBS]
(
[PUB_KEY] int identity(1,1) not null,
[PUB_ID] char(4) not null,
[PUB_NAME] varchar(100) null
);

insert into [DIM_PUBS] 
(
pub_id,pub_name
)
select pub_id, pub_name 
from publishers;

select * from DIM_PUBS;

question 2

create table [DIM_DATE]
(
[DATE_KEY] int identity(1,1) not null,
[DATE_STR] char(8) not null,
[DATE_YEAR] int not null,
[DATE_MONTH] int not null,
[DATE_QTR] int not null
);

insert into [DIM_DATE] 
(
DATE_STR,DATE_YEAR,DATE_MONTH,DATE_QTR
)
select 
convert(char(8), ord_date,112) as DATE_STR , 
datepart(year,ord_date) as DATE_YEAR, 
datepart(month,ord_date) as DATE_MONTH,
datepart(quarter,ord_date) as DATE_QTR
from sales

select * from DIM_DATE;