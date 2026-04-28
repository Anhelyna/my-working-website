drop table if exists users;

create table if not exists users (
    id int auto_increment primary key,
    fname varchar(30) not null,
    lname varchar(30) not null,
    email varchar(50) not null,
    phone_number varchar(20) not null
);

insert into users(fname, lname, email, phone_number) values (
    "test_fname",
    "test_lname",
    "example@email.com",
    "250-123-4567"
);

drop table if exists emails;

create table if not exists emails (
    id int auto_increment primary key,
    email varchar(50) not null
);