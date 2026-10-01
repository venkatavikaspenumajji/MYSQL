create database instagramdb;
use instagramdb;
show databases;
create table Users(
	Userid int primary key,
    Username VARCHAR(50) UNIQUE NOT NULL, 
    Fullname VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Password VARCHAR(20) UNIQUE NOT NULL,
    Bio Text,
    IsVerified boolean default False,
    createdat datetime default current_timestamp
);
desc Users;
select * from Users;
alter table users add column PhoneNumber varchar(15);
alter table users modify fullname varchar(150);
alter table users drop column PhoneNumber;
alter table users rename userinfo;
desc Userinfo;
truncate table userinfo;
drop table userinfo;

create table posts(
	PostID int primary key,
    userid int not null,
    caption text,
    imageurl varchar(50) not null,
    likescount int default 0,
    createdat timestamp default current_timestamp,
    foreign key (userid) references users(userid)
);

create table comments(
	commentid int primary key,
    postid int not null,
    userid int not null,
    commenttext varchar(255) not null,
    createdat datetime default current_timestamp,
    foreign key (postid) references posts(postid),
    foreign key (userid) references users(userid)
);