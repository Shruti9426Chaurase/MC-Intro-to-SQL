create database emp;
use emp;
create table manager( first_name varchar(50),
                      last_name varchar(50),
                      manager_id int,
                      dob date, -- YYYY-MM-DD
                      department varchar(50),
                      primary key(manager_id));
                      
insert into employee values( "Amit","Sharma",1,1,"2001-11-02");
insert into employee values( "Pallavi","Krishna",2,1,"2000-12-04");
insert into employee values( "Karan","Kumar",3,1,"2002-05-06");
insert into employee values( "Karan","Kumar",4,3,"2002-05-06");

insert into manager values( "Raj","Chedda",1,"2006-01-22","Finance");
insert into manager values( "Shruti","Chaurase",2,"2006-04-09","HR");
insert into manager values( "Meenakshi","Chedda",3,"2001-03-04","HR",25000);
insert into manager values( "Uday","Gupta",4,"2006-04-09","Logistics",25000);

create table employee( first_name varchar(50),
					   last_name varchar(50),
					   emp_id int,
                       manager_id int not null,
                       dob date, -- YYYY-MM-DD
					   primary key(emp_id),
                       foreign key(manager_id) references manager(manager_id));


select * from manager;
select * from employee;
select * from manager order by dob desc;

set SQL_SAFE_UPDATES = 0;

update manager set department = "HR" where manager_id = 1;
update manager set department = "Finance" where manager_id = 2;
update manager set first_name = "XYZ";
update manager set first_name = "Raj" where manager_id = 1;
update manager set first_name = "shruti" where manager_id = 2;

alter table manager add column salary int;
update manager set salary = 25000;

select employee.emp_id, employee.first_name, manager.manager_id, 
manager.first_name from employee join manager on employee.manager_id = manager.manager_id;

select employee.emp_id, employee.first_name, manager.manager_id, 
manager.first_name from employee right join manager on employee.manager_id = manager.manager_id;

select employee.emp_id, employee.first_name, manager.manager_id, 
manager.first_name from employee left join manager on employee.manager_id = manager.manager_id;

create table store( store_id int,
					location varchar(50),
                    capacity int,
                    primary key(store_id) );
                    
create table item( item_id int,
                   item_name varchar(50),
                   stock int,
                   store_id int,
                   primary key(item_id),
                   foreign key(store_id) references store(store_id) );
                   
insert into store values(100, "Banglore", 500);
insert into store values(101, "Chennai", 450);
insert into store values(102, "Hyderabad", 600);
insert into store values(103, "Delhi", 600);
select * from store;

insert into item values(1, "Samsung LED TV", 95, 100);
insert into item values(2, "Samsung Washing Machine", 96, 100);
insert into item values(3, "Sony LED TV", 80, 101);
insert into item values(4, "Godrej Table", 50, 102);
insert into item values(5, "Green Soul Chair", 55, 103);
select * from item;

select * from item order by stock DESC limit 2;
select max(stock) from item;
select avg(stock) from item;


select * from store where location like "D%";
select * from store where store_id like "%0";
insert into store values(99, "Gurgaon", 200); 
select * from store where store_id like "___"; 

select * from item where item_name like "__d%";
select * from item where item_name like "sam%";
select * from item where item_name like "s%";
