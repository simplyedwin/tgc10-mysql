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