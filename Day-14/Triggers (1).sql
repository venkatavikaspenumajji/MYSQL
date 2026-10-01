 create database instagram_demo;
 use instagram_demo;
 create table users(
 user_id int primary key auto_increment,name varchar(100));
 create table posts(
 post_id int primary key auto_increment,user_id int,caption varchar(255),likes int default 0);
 create table post_likes(
 like_id int primary key auto_increment, user_id int, post_id int);
 CREATE TABLE post_history(
	history_id INT PRIMARY KEY AUTO_INCREMENT,
    post_id INT,
    old_caption VARCHAR(50),
    new_caption VARCHAR(50),
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE deleted_likes(
	like_id INT,
    user_id INT,
    post_id INT,
    deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);INSERT INTO users(name)
VALUES ('Rahul'), ('Priya'), ('Arun');

INSERT INTO posts(user_id, caption, likes)
VALUES
(1, 'My First Post', 0),
(1, 'My Travel Photo', 0),
(1, 'My New Bike', 0);
Delimiter //
create trigger increase_post_likes after insert on post_likes for each row begin update posts
set likes=likes+1 where post_id=new.post_id;
end //
Delimiter //
create trigger decrease_post_likes after delete on post_likes for each row begin update posts
set likes=likes-1 where post_id=old.post_id;
end //
DELIMITER //
CREATE TRIGGER after_post_update
AFTER UPDATE ON posts
FOR EACH ROW
BEGIN
    IF OLD.caption <> NEW.caption THEN
        INSERT INTO post_history(post_id, old_caption, new_caption)
        VALUES (OLD.post_id, OLD.caption, NEW.caption);
    END IF;
END //
delimiter //
create trigger check_post_likes before insert on posts for each row begin
if new.likes<0 then set new.likes=0;
end if;
end //
show triggers;
drop trigger check_post_likes;
show triggers;