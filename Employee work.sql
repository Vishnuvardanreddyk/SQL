use master 
go

create database  Employee
go

use Employee
go
---- creat table table name EmployeeDetails

create table EmployeeDetails
(
EmployeeID   INTEGER		 Primary Key,
EmployeeName  varchar(30)		NOT NULL,
Designation   varchar(20)       NOT NULL,
DateOfJoining  date             NOT NULL,
Password       varchar(20)      NOT NULL
)
go

select * from  EmployeeDetails
go

----creat table table name SeatDetails
create table SeatDetails
(
SetNo     varchar(30)  Primary key,
Wing      char(1)  NOT NULL,
Floor      int      NOT NULL,
BuildingName  varchar(30)  NOT NULL,
IsAlloted      varchar(3)   NOT NULL
)
go

select * from  SeatDetails
go

---create table table name  EmployeeSeatMapping

create table EmployeeSeatMapping
(
SetNo                varchar(30) NOT NULL Foreign Key References SeatDetails(SetNo),
EmployeeID           int    NOT NULL      Foreign Key References EmployeeDetails(EmployeeID),
DateOfAllocation   date     NOT NULL
)
go

select * from EmployeeSeatMapping
go

---- create table SeatRequest
create table SeatRequest
(
SetNo  varchar(30) NOT NULL Foreign Key References SeatDetails(SetNo),
EmployeeID           int    NOT NULL      Foreign Key References EmployeeDetails(EmployeeID),
DateOfrequest    date NOT NULL,
Status           varchar(20) NOT NULL,
Reason       varchar(30) not null
)

select * from SeatRequest
go

