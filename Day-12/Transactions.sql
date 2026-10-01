create database BankDB;
use BankDB;
create table accounts(Acc_no int primary key, name varchar(50),
balance decimal(10,2));
insert into accounts values
(101,'Arjun',15000.00),
(102,'Priya',10000.00);
select * from accounts;
select @@autocommit;
set autocommit=0;
start transaction;
update accounts set balance=balance-5000 where acc_no=101;
update accounts set balance=balance+5000 where acc_no=102;
select * from accounts;
commit;
start transaction;
update accounts set balance=balance-2000 where acc_no=101;
select * from accounts;
rollback;
start transaction;
update accounts set balance=balance-1000 where acc_no=101;
select * from accounts;
savepoint after_deduction;
start transaction;
update accounts set balance=balance+1000 where acc_no=102;
select * from accounts;
rollback to after_deduction;
commit;
