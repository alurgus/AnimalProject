CREATE DATABASE humanfriends;
USE humanfriends;

CREATE TABLE dogs (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50),
  birthday DATE,
  commands TEXT
);

CREATE TABLE cats (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50),
  birthday DATE,
  commands TEXT
);

CREATE TABLE hamsters (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50),
  birthday DATE,
  commands TEXT
);

CREATE TABLE horses (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50),
  birthday DATE,
  commands TEXT
);

CREATE TABLE camels (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50),
  birthday DATE,
  commands TEXT
);

CREATE TABLE donkeys (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50),
  birthday DATE,
  commands TEXT
);

CREATE TABLE all_animals (
  name VARCHAR(50),
  birthday DATE,
  commands TEXT,
  source_table VARCHAR(20)
);

ALTER TABLE all_animals
ADD CONSTRAINT unique_animal UNIQUE (name, source_table);

INSERT INTO dogs (name, birthday, commands) VALUES
('Шарик', '2022-02-20', 'сидеть, лежать, голос'),
('Бим', '2021-11-01', 'апорт, место');

INSERT INTO cats (name, birthday, commands) VALUES
('Мурка', '2023-05-15', 'сидеть, лапу'),
('Барсик', '2022-09-30', 'голос, спать');

INSERT INTO hamsters (name, birthday, commands) VALUES
('Хома', '2023-01-10', 'бегать в колесе'),
('Пушок', '2022-03-05', 'прятаться');

INSERT INTO horses (name, birthday, commands) VALUES
('Плотва', '2020-07-01', 'вперёд, стой, шагом'),
('Буцефал', '2019-05-20', 'галоп, поворот');

INSERT INTO camels (name, birthday, commands) VALUES
('Гоша', '2018-02-14', 'идти, лечь, ждать'),
('Верблюдка', '2021-09-09', 'стоять, шаг');

INSERT INTO donkeys (name, birthday, commands) VALUES
('Иа', '2020-04-04', 'нести груз, стоять'),
('Тимка', '2021-12-12', 'шаг, назад');

DELETE FROM camels;

CREATE TABLE horses_and_donkeys AS
SELECT * FROM horses
UNION ALL
SELECT * FROM donkeys;


CREATE TABLE young_animals AS
SELECT 'dog' AS type, name, birthday, commands,
       TIMESTAMPDIFF(MONTH, birthday, CURDATE()) AS age_in_months
FROM dogs
WHERE TIMESTAMPDIFF(YEAR, birthday, CURDATE()) BETWEEN 1 AND 2

UNION ALL

SELECT 'cat', name, birthday, commands,
       TIMESTAMPDIFF(MONTH, birthday, CURDATE())
FROM cats
WHERE TIMESTAMPDIFF(YEAR, birthday, CURDATE()) BETWEEN 1 AND 2

UNION ALL

SELECT 'hamster', name, birthday, commands,
       TIMESTAMPDIFF(MONTH, birthday, CURDATE())
FROM hamsters
WHERE TIMESTAMPDIFF(YEAR, birthday, CURDATE()) BETWEEN 1 AND 2

UNION ALL

SELECT 'horse', name, birthday, commands,
       TIMESTAMPDIFF(MONTH, birthday, CURDATE())
FROM horses
WHERE TIMESTAMPDIFF(YEAR, birthday, CURDATE()) BETWEEN 1 AND 2

UNION ALL

SELECT 'donkey', name, birthday, commands,
       TIMESTAMPDIFF(MONTH, birthday, CURDATE())
FROM donkeys
WHERE TIMESTAMPDIFF(YEAR, birthday, CURDATE()) BETWEEN 1 AND 2;

INSERT INTO all_animals
SELECT name, birthday, commands, 'dogs' FROM dogs;
INSERT INTO all_animals
SELECT name, birthday, commands, 'cats' FROM cats;
INSERT INTO all_animals
SELECT name, birthday, commands, 'hamsters' FROM hamsters;
INSERT INTO all_animals
SELECT name, birthday, commands, 'horses' FROM horses;
INSERT INTO all_animals
SELECT name, birthday, commands, 'donkeys' FROM donkeys;
