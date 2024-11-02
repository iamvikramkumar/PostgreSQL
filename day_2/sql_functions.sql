create table employees(emp_id serial, emp_name varchar(20),emp_salary decimal, emp_join_date date,             
		emp_email varchar(20),emp_is_married boolean,emp_gender char(1),emp_phone varchar(20));

select *from employees;

insert into employees(emp_name,emp_salary,emp_join_date,emp_email,emp_is_married,emp_gender) 
			values('arun',45000.25,'2021-08-22','arun@capg.com',true,'m'),
					('taruni',55000.25,'2002-07-26','taruni@capg.com',true,'f'),
					('varun',25000.25,'2022-10-14','varun@capg.com',false,'m'),
					('ramani',55000.25,'2000-11-22','ramani@capg.com',true,'f'),
					('charun',85000.25,'2003-11-12','charun@capg.com',true,'m');

update employees set emp_phone='040-256-356' where emp_id=2;
update employees set emp_phone='044-456-358' where emp_id=4;
update employees set emp_phone='044-356-356' where emp_id=3;

--string functions--
select emp_name,length(emp_name) as emp_name_length from employees;
select emp_name,upper(emp_name) as emp_name_upper from employees;
select emp_name,lower(emp_name) as emp_name_lower from employees;
select emp_name,trim(emp_name) as emp_name_trim from employees;
select emp_name,concat(emp_name,' :: ',emp_email) as full_info from employees;
select emp_name, substring(emp_name,2,5) as emp_email_substring from employees;
select emp_name,emp_email, replace(emp_email,'@capg.com','@capgemini.com') 
		as new_email_domain from employees;


--math functions--
select *from employees;
update employees set emp_salary=-emp_salary where emp_id not in(1);
select emp_id,emp_name,abs(emp_salary) as emp_sal from employees;

select emp_id,emp_name,floor(emp_salary)as emp_floor , ceil(emp_salary) as emp_ceil , round(emp_salary) as emp_round from employees;
select emp_id, sqrt(emp_id),emp_name from employees;
select emp_id, mod(emp_id,1) from employees;

--date and time functions--
select *from employees;
select now() as current_timestamp;
select current_date as today_date;
select current_time as time_now;

select emp_id,emp_name, emp_join_date, extract(YEAR FROM emp_join_date) as year, 
										extract(MONTH from emp_join_date) as month,
										extract (DAY from emp_join_date) as day from employees;


ALTER TABLE EMPLOYEES ADD COLUMN EMP_CREATED_AT TIME;
SELECT *FROM EMPLOYEES;
UPDATE employees set emp_created_at='11:15:28';

select emp_id,emp_name, emp_join_date, extract(YEAR FROM emp_join_date) as year, 
										extract(MONTH from emp_join_date) as month,
										extract (DAY from emp_join_date) as day from employees;

select emp_id,emp_name, emp_created_at, extract(HOUR FROM emp_created_at) as hours, 
										extract(MINUTE from emp_created_at) as minutes,
										extract (SECOND from emp_created_at) as seconds from employees;


select emp_id,emp_name, emp_join_date, age(current_date,emp_join_date) as days_served from employees;


--grouping functions--

select *from employees;
select sum(emp_salary) as total_salary_of_all_employees from employees;
select count(emp_id) as total_emp_count from employees;

select max(emp_salary) as emp_max_salary from employees;
select min(emp_salary) as emp_min_salary from employees;

select avg(emp_salary) as emp_avg_salary from employees;


--window functions--
select row_number() OVER(), emp_name,emp_salary from employees;

SELECT rank() over(order by emp_salary desc),emp_name,emp_salary from employees;
SELECT rank() over(order by emp_salary),emp_name,emp_salary from employees;

select lead(emp_salary,2) over() as emp_salary_with_lag,emp_name,emp_salary from employees;
select * from employees order by emp_salary;

--Lag funtion:-  it returns a value from the previous row within the same result set.

--syntax:-   lag(column,offset,default value) over(order by emp_id)

--Lead function:-  it returns a value from the next row within  the same ressultset.

--syntax:-  lead(column, offset,default_value)  OVRER(order by column)

select lag(emp_id,1,0) over(order by emp_id) as prev_emp_id , emp_id,emp_name,emp_salary from employees;
select  emp_id,emp_name,emp_salary, lead(emp_salary,1) over(order by emp_salary) as next_emp_salary from employees;


--NOTE: if you do not specify default_value, it will return null
































