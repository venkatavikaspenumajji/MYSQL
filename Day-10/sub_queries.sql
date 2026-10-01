CREATE DATABASE south_music_db;
USE south_music_db;

-- =========================================
-- 2. Create Tables
-- =========================================

CREATE TABLE singers (
    singer_id INT PRIMARY KEY,
    singer_name VARCHAR(100),.
    
    language VARCHAR(20),
    followers INT
);

CREATE TABLE songs (
    song_id INT PRIMARY KEY,
    title VARCHAR(150),
    movie VARCHAR(150),
    singer_id INT,
    language VARCHAR(20),
    plays INT,
    likes INT,
    release_year INT,
    FOREIGN KEY (singer_id) REFERENCES singers(singer_id)
);

-- =========================================
-- 3. Insert Real Singers
-- =========================================

INSERT INTO singers VALUES
(1, 'Sid Sriram', 'Telugu', 3200000),
(2, 'S. P. Balasubrahmanyam', 'Telugu', 5000000),
(3, 'Shreya Ghoshal', 'Telugu', 4100000),
(4, 'Anirudh Ravichander', 'Tamil', 4800000),
(5, 'A. R. Rahman', 'Tamil', 7000000),
(6, 'K. S. Chithra', 'Tamil', 3600000);

-- =========================================
-- 4. Insert Real Songs
-- =========================================

INSERT INTO songs VALUES
(101, 'Samajavaragamana', 'Ala Vaikunthapurramuloo', 1, 'Telugu', 8500000, 600000, 2020),
(102, 'Inkem Inkem Inkem Kaavaale', 'Geetha Govindam', 1, 'Telugu', 7800000, 550000, 2018),
(103, 'Tere Mere Beech Mein', 'Ek Duuje Ke Liye', 2, 'Hindi', 4000000, 250000, 1981),
(104, 'Neeve Neeve', 'Darling', 3, 'Telugu', 5200000, 300000, 2010),
(105, 'Why This Kolaveri Di', '3', 4, 'Tamil', 9000000, 700000, 2011),
(106, 'Arabic Kuthu', 'Beast', 4, 'Tamil', 8800000, 650000, 2022),
(107, 'Munbe Vaa', 'Sillunu Oru Kaadhal', 5, 'Tamil', 6100000, 420000, 2006),
(108, 'Kannalane', 'Bombay', 6, 'Tamil', 4500000, 280000, 1995);

select title, plays from songs where
plays=(select max(plays) from songs);

select title, plays from songs where
likes=(select max(likes) from songs);

SELECT singer_name, followers FROM singers
WHERE followers = (SELECT MAX(followers) FROM singers);

select title, release_year from songs where
release_year=(select max(release_year) from songs);

select title, plays from songs where plays>any(select plays from songs where language='telugu');

select singer_name, followers from singers where followers>any
(select followers from singers where language='tamil');

select title,plays from songs where plays>all(select plays from songs where language='tamil');

select singer_name from singers where followers>all(select followers from songs where language='telugu');

select singer_name from singers where singer_id=(select singer_id from songs where plays=(select max(plays) from songs));

select title,likes from songs where singer_id=(select singer_id from singers where
followers=(select max(followers) from singers)) order by likes desc limit 1;

select s1.title, s1.language, s1.plays from songs s1 where s1.plays>
(select avg(plays) from songs s2 where s2.language=s1.language);

select s1.title,s1.singer_id,s1.plays from songs s1 where 
s1.plays=(select max(plays) from songs s2 where s2.singer_id=s1.singer_id);

select s1.title,s1.likes from songs s1 where 
s1.likes>(select avg(s2.likes) from songs s2 where s2.singer_id=s1.singer_id);