use master 
go

create database  INDIAN_BANK
go

use INDIAN_BANK
go
---create table ProductMaster

create table ProductMaster 
(
	PID				CHAR(2)		Primary Key ,
	ProductName		VARCHAR(15)	NOT NULL
)
go

insert into ProductMaster values('SB','saving account')
insert into ProductMaster values('KM','current account')
insert into ProductMaster values('SV','lone account')

select * from ProductMaster
go

--create table REGION MASTER 
create table RegionMaster 
(
RID			INTEGER Primary Key, 
RegionName	CHAR(6) NOT NULL
)
go

insert into RegionMaster values(1,'South')
insert into RegionMaster values(2,'North')
insert into RegionMaster values(3,'West')
insert into RegionMaster values(4,'East')

select * from RegionMaster
go

--create table BRANCH MASTER

create table BranchMaster
(
	BRID				CHAR(3)		Primary Key ,
	BranchName			VARCHAR(30) NOT NULL ,
	BranchAddress		VARCHAR(50) NOT NULL ,
	RID					INT			NOT NULL 	Foreign Key References RegionMaster(RID)
)
go

insert into BranchMaster values('BR1','Goa','goa bus stand 523312',2)
insert into BranchMaster values('MR1','cumbum','cumbum bus stand 523307',3)
insert into BranchMaster values('SR1','markapur','mrk bus stand 523316',1)

select *from BranchMaster
go
---create table USER MASTER

create table UserMaster
(
	UserID			INTEGER		Primary Key, 
	UserName		VARCHAR(30) NOT NULL ,
	Designation		CHAR(1)		NOT NULL check(Designation in ('M','C','T','O')) 
)
go

insert into UserMaster values (1,'siva','O')
insert into UserMaster values (2,'srinu','T')
insert into UserMaster values (3,'kumari','M')
insert into UserMaster values (4,'venkayamma','C')

select * from UserMaster 
go

---create table ACCOUNT MASTER

create table AccountMaster
(
	ACID			INTEGER Primary Key ,
	Name			VARCHAR(40)		NOT NULL ,
	Address			VARCHAR(50)		NOT NULL ,
	BRID			CHAR(3)			NOT NULL Foreign Key References BranchMaster(BRID),
	PID				CHAR(2)   NOT NULL Foreign Key References ProductMaster(PID),
	DateOFOpening	DATETIME  NOT NULL ,
	ClearBalance	 MONEY      NULL ,
	UnclearBalance  MONEY		 NULL ,
	Status			 CHAR(1)    NOT NULL check(Status in ('O','I','C'))
)
go
select * from AccountMaster
go

insert into AccountMaster values(101,'vishnu','markapur','BR1','SV','2023/01/26',1000,200,'O')
insert into AccountMaster values(102,'gopi','ongole','SR1','SB','2023/02/10',70,10,'C')
insert into AccountMaster values(103,'siva','tarlupadu','MR1','KM','2023/03/05',500,0,'I')
go

select * from AccountMaster
go

---create table TRANSACTION MASTER
create table TransactionMaster
(
TransactionNumber int       Primary Key Identity(1,1), 
DateOFTransaction DATETIME NOT NULL ,
ACID	          INTEGER  NOT NULL Foreign Key References AccountMaster(ACID),
BRID			   CHAR(3) NOT NULL Foreign Key References BranchMaster(BRID),
TXN_TYPE           CHAR(3) NOT NULL check(TXN_TYPE in('CW','CD','CQD')),
CHQ_NO            INTEGER           NULL ,
CHQ_DATE          SMALLDATETIME     NULL ,
TXN_AMOUNT         MONEY            NOT NULL, 
UserID             INTEGER          NOT NULL Foreign Key references UserMaster(UserID)
)
select * from TransactionMaster

insert into TransactionMaster values('2023/01/23',101,'BR1','CW',NULL,'2023/02/21',1500,1)
insert into TransactionMaster values('2023/03/23',102,'SR1','CQD',NULL,'2023/03/09',250,4)
insert into TransactionMaster values('2023/02/23',103,'MR1','CD',0,'2023/05/12',750,3)


select * from TransactionMaster

--- addd check condesion in up table or
---Add Chect constraint to TransactionMaster table

alter table TransactionMaster
add check (TXN_AMOUNT >= 0);
 
