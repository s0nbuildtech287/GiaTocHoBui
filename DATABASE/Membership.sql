--1 CREATE DATABASE
create database Membership
use Membership

--2 CREATE TABLE
create table Individuals
(IndividualID int primary key not null,
FirstName nvarchar(30) not null,
LastName nvarchar(30) not null,
Address nvarchar(30) not null,
Phone varchar(12))

create table Groups
(GroupID int primary key not null,
Groupname nvarchar(30) not null,
Dues money default 0 check (Dues >= 0),)

create table GroupMembership
(Groupid int not null,
Individualid int not null,
foreign key (Individualid) references Individuals(IndividualID),
foreign key (Groupid) references Groups(GroupID),)

--Thêm các dữ liệu vào bảng
insert into Individuals
values (1, 'John', 'Doe', '123 Main St', '1234567890'),
(2, 'Jane', 'Smith', '456 Elm St', '0987654321'),
(3, 'Emily', 'Johnson', '789 Oak St', '1122334455');

insert into Groups
values (1, 'Book Club', 10),
(2, 'Fitness Group', 20),
(3, 'Cooking Class', 15);

insert into GroupMembership values
(1, 1),  -- John Doe tham gia Book Club
(1, 2),  -- Jane Smith tham gia Book Club
(2, 3),  -- Emily Johnson tham gia Fitness Group
(3, 1),  -- John Doe tham gia Cooking Class
(3, 2);  -- Jane Smith tham gia Cooking Class

select * from Individuals;
select * from Groups;
select * from GroupMembership;


-- 3 CREATE INDEX
create clustered index ix_groupmembership_groupid
on GroupMembership (Groupid);

create nonclustered index ix_groupmembership_individualid
on GroupMembership (Individualid);

-- 4 ALTER TABLE
alter table Individuals
add Duespaid bit not null default 0;

--5 
ALTER TABLE Invoices
ADD CONSTRAINT CHK_PaymentDate_Null
CHECK (
    (PaymentTotal = 0 AND PaymentDate IS NULL) OR 
    (PaymentTotal > 0 AND PaymentDate IS NOT NULL)
);

ALTER TABLE Invoices
ADD CONSTRAINT CHK_PaymentTotal_CreditTotal
CHECK (PaymentTotal + CreditTotal <= InvoiceTotal);



--6
drop table GroupMembership;

create table GroupMembership
(Groupid int not null,
Individualid int not null,
primary key (Groupid, Individualid),
constraint uq_GroupMembership unique (Groupid,Individualid),
foreign key (Groupid) references Groups(GroupID),
foreign key (Individualid) references Individuals(IndividualID),)
