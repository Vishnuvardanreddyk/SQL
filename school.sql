use master 
go

create database school 
go

--find out schema of db
sp_helpdb school go

--Change the db context
use school 
go

----CourseMaster
create table CourseMaster
(
	CID			Integer          Primary Key ,
	Name        Varchar(40 )     NOT NULL ,
	Category    Char(1)			null check(category = 'B' or category = 'M' or category = 'A'),
	Fee       Smallmoney		 NOT NULL check(fee > 0)
)
go
--schema of the table
sp_help 'CourseMaster'

---Read the table data
select * from CourseMaster
go

---insert data
insert into CourseMaster values (10,'java','B',5000)
insert into CourseMaster values (50,'sql','M',1000)
insert into CourseMaster values (80,'python','B',2000)
insert into CourseMaster values (30,'HTML','M',3000)
insert into CourseMaster values (70,'CSS','B',5000)
insert into CourseMaster values (40,'POWER BI','A',6000)
go
-- To Rename or to modified the table column name

sp_rename 'CourseMaster.Name','CourseName','column'


-- creat new table studentMaster
use school 
go

create table StudentMaster
(
	SID    TinyInt         Primary Key ,
	Name	Varchar(40)     NOT NULL ,
	Origin	Char(1)         NOT NULL check(origin ='L' or origin ='F'),
	Type	Char(1)         NOT NULL check(type ='U' or type ='G')
)
go

---Read the table data
select * from StudentMaster
go

---insert data
insert into StudentMaster values (1,'siva','f','G')
insert into StudentMaster values (2,'Durga','L','U')
insert into StudentMaster values (3,'Gopi','L','U')
insert into StudentMaster values (4,'kumari','f','G')
insert into StudentMaster values (5,'babu','L','U')
insert into StudentMaster values (6,'ravi','f','G')

---creat new table EnrollmentMaster
create table EnrollmentMaster
(
	CID				   	Integer	    NOT NULL 	Foreign Key References CourseMaster(CID),
	SID					 Tinyint	NOT NULL    Foreign Key References StudentMaster(SID),
	DOE					 DateTime	NOT NULL ,
	FWF					 Bit		NOT NULL ,
	Grade				Char(1)		NULL		check(grade ='O' or grade ='A' or grade ='B' or grade ='C')
)												---OR (Grade in ('O','A','B','C'))
go

---Read the table data
select * from EnrollmentMaster
go

---insert data
insert into EnrollmentMaster values (10,1,'2020/11/08',0,'O')
insert into EnrollmentMaster values (70,4,'2020/06/30',0,'O')
insert into EnrollmentMaster values (50,2,'2020/12/19',0,'O')
insert into EnrollmentMaster values (30,6,'2020/05/26',0,'O')

insert into EnrollmentMaster values (10,1,'2023/01/08',1,'A')
insert into EnrollmentMaster values (40,2,'2023/06/19',1,'C')
insert into EnrollmentMaster values (70,6,'2023/05/26',0,'O')
insert into EnrollmentMaster values (30,3,'2023/02/05',0,'B')
go

---Read the table data
select * from EnrollmentMaster
go