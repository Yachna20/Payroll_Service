--UC1-create database
create database Payroll;
--UC2-Create table
create table EmployeePayroll(id int primary key identity(1,1),Name varchar(200),Salary bigint,startdate date);
--UC3-Insert
insert into EmployeePayroll values('Yachna',2000,'2020-4-5'),('Bill',25000,'2018-5-6');
--UC4
select * from EmployeePayroll;
--UC5
select * from EmployeePayroll where name='Bill';
insert into EmployeePayroll values('Raj',4000,'2016-3-18'),('Neha',26000,'2015-7-4'),('Priya',28000,'2017-3-6'); 
select * from EmployeePayroll where startdate between CAST('2018-1-1'as date) and GETDATE();
--UC6
insert into EmployeePayroll values('Charlie',25000,'2015-1-1');
alter table EmployeePayroll add Gender varchar(10);
update EmployeePayroll set Gender='M' where Name='Bill'or Name='Charlie';
--UC7
select SUM(salary)as empSalary from EmployeePayroll;
select Min(salary)as MinSalary from EmployeePayroll;
select Max(salary)as MaxSalary from EmployeePayroll;
select Avg(salary)as AvgSalary from EmployeePayroll;
select count(id)as TotalRecord from EmployeePayroll where Gender = 'M' ;
--UC8
alter table EmployeePayroll add Phone bigint;
alter table EmployeePayroll add Empaddress varchar(200) not null default 'Pune';
alter table EmployeePayroll add Department varchar(200) not null default 'IT';
select * from EmployeePayroll;
--UC9add Basic Pay,Deductions, Taxable Pay,Income Tax, Net Pay for that remove salary column
alter table EmployeePayroll
drop column salary;
alter table EmployeePayroll
add BasicPay bigint NULL,Deductions bigint not null default 0.00,TaxablePay bigint not null default 0.00,IncomeTax bigint not null default 0.00,
NetPay bigint not null default 0.00;
update EmployeePayroll SET BasicPay=30000 where Name='Yachna'
update EmployeePayroll SET BasicPay=45000 where Name='Bill'
update EmployeePayroll SET BasicPay=50000 where Name='Raj'
update EmployeePayroll SET BasicPay=90000 where Name='Neha'
update EmployeePayroll SET BasicPay=80000 where Name='Priya'
update EmployeePayroll SET BasicPay=35000 where Name='Charlie'


--UC10 Create 2 differnt id with same name but differnt department
insert into EmployeePayroll values('Terissa','2018-6-22','F',8987036336,'Pune','Sales',25000,0.00,0.00,0.00,0.00),
('Terissa','2020-6-5','F',9786789543,'Pune','Marketing',35000,0.00,0.00,0.00,0.00);
