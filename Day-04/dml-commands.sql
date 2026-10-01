SELECT @@sql_safe_updates;
SET sql_safe_updates = 0;

INSERT INTO users (userid, username, fullname, email, pass_word)
VALUES (1, 'bharat_dasari', 'Bharat', 'bharat@gmail.com', 'bharat123');

SELECT * FROM users;

INSERT INTO users (userid, username, fullname, email, pass_word)
VALUES(2, 'avinash', 'Avinash', 'avinash@gmail.com', 'avi123'),
(3, 'ganesh', 'Ganesh', 'ganesh@gmail.com', 'ganesh123');


INSERT INTO users VALUES (5, 'lokesh', 'Lokesh', 'lokesh@gmail.com', 'lokesh123', 'Python developer', True, '2026-09-12 09:44:45');
INSERT INTO users VALUES (6, 'srinivas', 'Srinivias', 'srinivas@gmail.com', 'srinivas123', 'Python Engineer', False, '2026-09-12 09:48:45');


UPDATE users
SET bio = 'Coder'
WHERE userid = 2;

UPDATE users
SET is_verified = False
WHERE userid = 5;

UPDATE users
SET pass_word = 'avinash123'
WHERE email = 'avinash@gmail.com';

DELETE FROM users
WHERE userid = 6;

DELETE FROM users
WHERE username = 'ganesh';