use master
go
---SUPPLIER –CASESTUD 
create database SUPPLIER
go

use SUPPLIER
go

create table SupplierMaster
(
	SID			Integer			Primary Key ,
	NAME		 Varchar(40 )   NOT NULL ,
	CITY		Char(6)			NOT NULL ,
	GRADE		Tinyint			NOT NULL
)
go

select * from SupplierMaster
go

insert into SupplierMaster values (10,'Usman khan', 'delhi', 1 )
insert into SupplierMaster values (20,'siva', 'cumbum', 3 )
insert into SupplierMaster values (30,'babu', 'hyd', 1 )
insert into SupplierMaster values (40,'gopi', 'marka', 1 )

select * from SupplierMaster
go

---create new table
create table PartMaster
(
	PID			TinyInt			 Primary Key ,
	NAME		Varchar(40 )	 NOT NULL, 
	PRICE		 Money		     NOT NULL ,
	CATEGORY	 Tinyint	     NOT NULL, 
	QTYONHAND	 Integer		 NULL
)
go

insert into PartMaster values (1,'light','2260',3,5000)
insert into PartMaster values (2,'batteryes','3560',3,2000)
insert into PartMaster values (3,'SiM','1250',3,2300)
insert into PartMaster values (4,'pipes','2560',3,2560)

select * from PartMaster 
go

create table SupplyMaster
(
	PID				TinyInt			NOT NULL	Foreign Key References PartMaster(PID),
	SID				Integer			NOT NULL	Foreign Key References SupplierMaster(SID),
	DATEOFSUPPLY	DateTime		NOT NULL ,
	CITY			Varchar(40)		NOT NULL ,
	QTYSUPPLIED		Integer			NOT NULL
)
go

select * from SupplyMaster
go

insert into SupplyMaster values(2,20,'2023/01/22','hyd',45)
insert into SupplyMaster values(2,40,'2023/01/22','cumbum',25)
insert into SupplyMaster values(4,30,'2023/01/22','mrk',90)

select * from SupplyMaster
go