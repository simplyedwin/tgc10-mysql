--to create new table
create table medicine(
medicine_id int unsigned auto_increment primary key,
name varchar(50) not null,
description text not null
)engine=innodb;

create table Vets(
    vet_id int unsigned auto_increment primary key,
    fname varchar(50) not null,
    lname varchar(50) not null
)engine=innodb;

create table PetOwners(
    petowner_id int unsigned auto_increment primary key,
    fname varchar(50) not null,
    lname varchar(50) not null,
    mobile_number varchar(20) not null
)engine=innodb;

create table Pets(
    pet_id int unsigned auto_increment primary key,
    name varchar(50) not null,
    petowner_id int unsigned not null,
    foreign key (petowner_id) references PetOwners(petowner_id)
)engine=innodb;

--Problems about Foreign Key
--> Cannot insert a pet for an non existent pet owner
--> Cannot delete a pet owner if pet exists in the pet table

--modify table (Vets) by adding a column (office_number)
alter table Vets add office_number varchar(20) not null;
alter table PetOwners add email varchar(50) not null;

--modify table (Vets) by renaming a column
alter table Vets rename office_number to office_numbers;

--to add a new row
insert into Vets (fname, lname,office_number)
    values ("Xavier","Tan","+6512121212");

insert into PetOwners(fname,lname,mobile_number)
    values("YX","N","91319113");

--to add many new row
insert into PetOwners(fname,lname,mobile_number) values
    ("Papa","N","918281388"),
    ("Mama","N","832883938"),
    ("Tom","Joe","82183131231");

--update rows in a table
update PetOwners set email="papa@gmail.com" where fname="Papa";
update PetOwners set email="mama@gmail.com" where fname="Mama";

--delete a row
delete from PetOwners where petowner_id = 2;

--delete an entire table 
drop table PetOwners

--selet all columns
select * from Pets

--select firstname, lastName, email, jobtitle columns from employees table 
select firstname, lastName, email, jobtitle from employees;

--select firstname, lastName, email columns from employees table who are sale reps 
select firstname, lastName, email from employees where jobtitle ="Sale Reps";

--select all rows from customers table who are from USA and credit limit above 20000 
select * from customer where countries = USA and creditLimit > 20000;

-- selet all rows from employees  whose jobtitles has a start substring of sales
SELECT * FROM employees where jobtitle like 'Sales%';

-- selet all rows from employees  whose jobtitles has a end substring of sales
SELECT * FROM employees where jobtitle like '%Sales';

-- selet all rows from employees  whose jobtitles has a substring of sales
SELECT * FROM employees where jobtitle like '%Sales%';

/* see all the payments that take place on the first day of every month */
select * from payments where DAY(paymentDate) = 1;

/*see all the payments that take place in the month of June, 2004 */
select * from payments where MONTH(paymentDate) = 6 and YEAR(paymentDate)=2004;

/*see all the payments that take place between June 2003 and August 2003*/
select * from payments where MONTH(paymentDate) >=6 and MONTH(paymentDate) <= 8 and YEAR(paymentDate)=2003;

--> MONTH() YEAR() DAY() only apply on datetime data type