
create  table  company(id INT Primary key, name varchar(20) UNIQUE, location varchar(20) NOT NULL, 
						capital_amount decimal check(capital_amount>50000), established_date date NOT NULL);

insert into company values(1001,'CapGemini','Hyderabad',80000,'1967-10-1');

insert into company values(1002,'CTS','Chennai',70000,'1994-1-26');

insert into company values(1003,'Wipro','Hyderabad',51000,'1945-12-29');

insert into company values(1004,'Infosys','Bangalore',64000,'1981-7-2');

select *from company;


create table employees(emp_id int primary key, emp_name varchar(20) UNIQUE,emp_salary decimal NOT NULL, emp_role varchar(20), 
							emp_company_id  int references company(id) on delete cascade on update cascade);

select *from company;
select *from employees;

insert into employees values(1,'arun',45000.25,'developer',1001);
insert into employees values(2,'varun',55000.25,'system-engineer',1002);

insert into employees values(3,'charun',65000.25,'architect',1002);

insert into employees values(4,'karun',75000.25,'architect',1004);

--delete from employees where emp_id=4;

--delete from company where id=1004;

--drop table employees;

drop table employees;
select *from employees;
select *from company;

update company set id=2222 where id=1002; -- this is to update company id with new id




