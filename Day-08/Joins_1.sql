CREATE DATABASE join_practice;
USE join_practice;

/*
inner join
equi join
non-equi join
natural join
self join
outer join
	left join
	right join
	full join
cross join
*/

CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100),
    city VARCHAR(100)
);


CREATE TABLE posts (
    post_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    caption VARCHAR(255),
    foreign key (user_id) references users(user_id)
);

INSERT INTO users (username, city) VALUES
('rahul', 'Hyderabad'),
('sneha', 'Bangalore'),
('arjun', 'Chennai'),
('meena', 'Mumbai'),
('kiran', 'Delhi'),
('anita', 'Pune'),
('vikram', 'Kolkata'),
('divya', 'Jaipur'),
('rohit', 'Ahmedabad'),
('pooja', 'Lucknow');

INSERT INTO posts (user_id, caption) VALUES
(1, 'Morning workout'),
(2, 'Learning SQL joins'),
(3, 'Data analytics journey'),
(1, 'Weekend trip'),
(4, 'Office presentation'),
(5, 'Startup ideas'),
(1, 'Test post without valid user'),
(3, 'Python practice'),
(7, 'Cloud computing basics'),
(2, 'Another invalid user post');

select * from posts;
select * from users;

SELECT u.username, p.caption FROM users u INNER JOIN posts p ON u.user_id = p.user_id;
-- Equi Join
select u.username, p.caption from users u,posts p where u.user_id = p.user_id;

select u.username, p.caption from users u,posts p where u.user_id <> p.user_id;

select * from users natural join posts;

SELECT u.username, p.caption FROM users u right JOIN posts p ON u.user_id = p.user_id
union
SELECT u.username, p.caption FROM users u left JOIN posts p ON u.user_id = p.user_id;
select u.username, p.caption from users u cross join posts p;