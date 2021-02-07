--Question 1
--1. Create a database named lt-fair
create database It_fair;

--2. Create the table above
create table Laptops(
laptop_id int unsigned auto_increment primary key,
model_name varchar(100) not null,
ram tinyint not null,
cpu_clock_speed float not null,
video_card varchar(200) not null,
price float not null
)engine=innodb;

--3. Insert a few laptops (at least 3)
insert into Laptops (model_name,ram,cpu_clock_speed,video_card,price) values
    ("Yoga",64,1.6,"GTX2000",1866),
    ("Aftershock",64,2.2,"GTX2100",1760),
    ("Asus",64,1.8,"GTX1900",1966);

--Question 2
--1. Create a new database with the name boardgamedb
create database boardgamedb;

--2. Create the boardgames table with the columns shown above.
create table Boardgames(
    boardgame_id int unsigned auto_increment primary key,
    title varchar(200) not null,
    play_time int unsigned not null,
    year_published int unsigned not null,
    description text not null,
    retail_price float not null
)engine=innodb;

--3. Add in the following board games with the MySQL insert statements.
insert into Boardgames (title,play_time,year_published,description,retail_price) values
    ("Saints Petersburg",90,2004,"Help Czar Peter builds the grandest city ever",30.00),
    ("Stone Age",90,2008,"Score the most civilization points as
the headsman of your tribe",50),
("Quadropolis",60,2015,"Build the best city by strategically
placing your archiect",90);