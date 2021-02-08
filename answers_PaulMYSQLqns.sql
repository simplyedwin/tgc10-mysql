-- Question 1 IT Fair Schema--
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

-- Question 2 Boardgame Schema --
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

-- Question 3 Salesperson--
-- 1 create database sales;
create database sales;

-- 2 Create the tables salespersons and closed_details
create table Salepersons(
    id int unsigned auto_increment primary key,
    name varchar(50) not null,
    commission_rate float not null
)engine=innodb; 

create table Closed_deals(
    id int unsigned auto_increment primary key,
    deal_size float not null,
    customer_name varchar(100) not null,
    product_name varchar(100) not null,
    salesperson_id int unsigned not null,
    foreign key (salesperson_id) references Salepersons(id)
)engine=innodb;

-- 3 Insert the following sales records:
insert into Salepersons (name,commission_rate) values
    ("Alan Tay",0.05),
    ("Mandy Wikes",0.09);

insert into Closed_deals(deal_size,customer_name,product_name,salesperson_id) values
    (300000,"Phua Chua Kang","SuperComputer",1),
    (460000,"Elon Musk","AI System",2);

-- Question 4 TV Series Database --
-- 1. Create a new database named tv_shows
create database tv_shows;

-- 2. Create the tables above
create table Tv_series(
    show_id int unsigned auto_increment primary key,
    series_name varchar(45) not null,
    plot_summary text not null
)engine=innodb;

create table Episodes(
    episode_id int unsigned auto_increment primary key,
    title varchar(45) not null,
    duration int unsigned not null,
    synposis text not null,
    show_id int unsigned not null,
    foreign key (show_id) references Tv_series(show_id)
)engine=innodb;

-- 3. Insert in the following data
insert into Tv_series (series_name,plot_summary) values
    ("Days Of Our Lives","All about Jean hate and love relationship"),
    ("Star Trek: Discovery","Adventure of Star Trek Discovery in the present and future");

insert into Episodes (title,duration,synposis,show_id) values
    ("Episode 1: Jean fell in love with Dave",1,"Jean met Dave at school and they both fell in love.",1),
    ("Episode 101: Jean met Dave Mk 2",1,"Jean realized that the Dave she knew all along was actually the twin
brother of the real Dave.",1),
    ("Episode 1: Michael Burnham starts a war",1,"Michael hated Klingons and purposely started a war to kill them.",2);

-- Q5 - Movie Database

/*
1. Create a database named movies
2. Create the three tables above
3. Create the rows for the table based on the description below:
    ● Liv Tyler (female) and Viggo Mortensen (male) star in the Lord of the Rings movie.
    ● Robert Downey Junior starred in the Ironman, Avengers , Avengers: Endgame and
    Avengers: Infinity Wars
    ● Jeff Bridges starred in Ironman

4. Write a SQL query that shows all the movies that Robert Downey Junior has starred
in
*/

-- 1
create database movies;

-- 2
create table Movies(
    movie_id int unsigned auto_increment primary key,
    title varchar(100) not null
)engine=innodb;

create table Actors(
    actor_id int unsigned auto_increment primary key,
    firstname varchar(100) not null,
    lastname varchar(100) not null,
    gender tinyint not null
)engine=innodb;

create table Castings (
    movie_id int unsigned not null,
    foreign key (movie_id) references Movies(movie_id),
    actor_id int unsigned not null,
    foreign key (actor_id) references Actors(actor_id)
)engine=innodb;

-- 3
insert into Movies(title) values
    ("Lord of the Rings"),
    ("Ironman"),
    ("Avengers"),
    ("Avengers:Endgame"),
    ("Avengers:Infinity Wars");

insert into Actors(firstname,lastname,gender) values
    ("Liv","Tyler",0),
    ("Viggo", "Mortensen",1),
    ("Robert","Downey",1),
    ("Jeff", "Bridges",1);

insert into Castings(movie_id,actor_id) values
    (1,1),
    (1,2),
    (2,3),
    (3,3),
    (4,3),
    (5,3),
    (2,4);

-- 4

select * from Movies join Castings on Movies.movie_id = Castings.movie_id join Actors on Castings.actor_id = Actors.actor_id
where firstname = "Robert";

-- Q6 - Employee and Roles
/*
1. Create a database named hr
2. Create the three tables above
3. Create the rows in each database that can capture the information below:
*/

-- 1 
create database hr;

-- 2 
create table Employees(
    id int unsigned auto_increment primary key,
    lastname varchar(100) not null,
    gender varchar(1) not null,
    firstname varchar(100) not null,
    date_joined datetime not null
)engine=innodb;

create table Role(
    id int unsigned auto_increment primary key,
    title text not null
)engine=innodb;

create table Appointments(
    id int unsigned auto_increment primary key,
    date_appointed datetime not null,
    employee_id int unsigned not null,
    foreign key (employee_id) references Employees(id),
    role_id int unsigned not null,
    foreign key (role_id) references Role(id)
)engine=innodb;

-- 3
insert into Role(title) values
    ("Vice President"),
    ("Manager"),
    ("Business Developer");

insert into Employees(lastname,gender,firstname,date_joined) values
    ("Richardson","M","Alan","2015-6-18"),
    ("Kay","F","Mary","2016-7-21");

insert into Appointments(date_appointed,employee_id,role_id) values
    ("2015-6-18",1,2),
    ("2019-6-20",1,1),
    ("2016-7-21",2,3);

-- Final ShowDown
create database dog_walk_services;

create table Dog_walkers(
    id int unsigned auto_increment primary key,
    name char not null,
    contact_number not null
)engine=innodb;

create table Dog_owners(
    id int unsigned auto_increment primary key,
    name char not null,
    contact_number char not null,
    address char not null
)engine=innodb;

create table Dogs(
    id int unsigned auto_increment primary key,
    name char not null,
    breed char,
    dog_owner_id int unsigned not null,
    foreign key (dog_owner_id) references Dog_owners(dog_owner_id)
)engine=innodb;

create table Advertisments(
    



)engine=innodb; 