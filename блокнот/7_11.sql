DROP  SCHEMA `human_friends`;
CREATE SCHEMA `human_friends`;


USE human_friends;
DROP TABLE IF EXISTS pets;
CREATE TABLE pets (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(45),  
  animals ENUM('dog', 'cat', 'hamster') NOT NULL
  );
 
 DROP TABLE IF EXISTS pack_animals;
 CREATE TABLE pack_animals (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(45),  
  animals ENUM('horse', 'camel', 'donkey') NOT NULL
  );
 
 CREATE TABLE dog (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    breed VARCHAR(60), 
    command VARCHAR(45),
    gender ENUM('f', 'm', 'x') NOT NULL,
    birthday DATE,
    FOREIGN KEY (id) REFERENCES pets(id)
);

CREATE TABLE cat (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    breed VARCHAR(60), 
    command VARCHAR(45),
    gender ENUM('f', 'm', 'x') NOT NULL,
    birthday DATE,
    FOREIGN KEY (id) REFERENCES pets(id)
);

CREATE TABLE hamster (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    breed VARCHAR(60), 
    command VARCHAR(45),
    gender ENUM('f', 'm', 'x') NOT NULL,
    birthday DATE,
    FOREIGN KEY (id) REFERENCES pets(id)
);

CREATE TABLE horse (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    breed VARCHAR(60), 
    command VARCHAR(45),
    gender ENUM('f', 'm', 'x') NOT NULL,
    birthday DATE,
    FOREIGN KEY (id) REFERENCES pack_animals(id)
);

CREATE TABLE camel (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    breed VARCHAR(60), 
    command VARCHAR(45),
    gender ENUM('f', 'm', 'x') NOT NULL,
    birthday DATE,
    FOREIGN KEY (id) REFERENCES pack_animals(id)
);

CREATE TABLE donkey (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    breed VARCHAR(60), 
    command VARCHAR(45),
    gender ENUM('f', 'm', 'x') NOT NULL,
    birthday DATE,
    FOREIGN KEY (id) REFERENCES pack_animals(id)
);
 
INSERT INTO pets  (name, animals) VALUES
    ('Нэнс', 'cat' ),
    ('Том', 'cat'),
	('Рэкс', 'dog'),
	('Шэри', 'cat'),
	('Элвин', 'hamster'),
	('Хома', 'hamster'),
	('Прыгун', 'hamster'),
    ('Эльза', 'dog');
   
INSERT INTO dog  (id, breed, command, gender, birthday) VALUES
    (3, 'Аляскинский кли-кай', 'Сидеть', 'm', '2020-05-23'),    
    (8, 'Немецкая овчарка', 'Фас', 'f', '2014-09-01');
	
INSERT INTO cat  (id, breed, command, gender, birthday) VALUES
    (1, 'Скоттиш-страйт', 'Играть', 'm', '2022-05-15'),
	(2, 'Корат', 'Играть', 'm', '2021-04-21'),       
    (4, 'Египетский мау', 'Играть', 'f', '2016-08-10');
	
INSERT INTO hamster  (id, breed, command, gender, birthday) VALUES
    (5, 'Сирийские', 'Есть', 'm', '2022-11-23'),
	(6, 'Китайские', 'Есть', 'm', '2022-10-27'),       
    (7, 'Кэмпбелл', 'Есть', 'f', '2022-11-17');
     
   
INSERT INTO pack_animals  (name, animals) VALUES
    ('Ланцелот', 'camel' ),
    ('Сахара', 'camel'),
	('Буран', 'horse'),
	('Снежок', 'camel'),
	('Аладин', 'donkey'),
	('Седой', 'horse'),
	('Маисей', 'donkey'),
    ('Маша', 'horse');
	
	
INSERT INTO camel(id, breed, command, gender, birthday) VALUES
    (1, 'Двугорбый азиатский верблюд', 'Поднять', 'm', '2022-01-01'),
    (2, 'Нар', 'Поднять', 'f', '2017-06-06'),
	(4, 'Одногорбый африканский верблюд', 'Поднять', 'm', '2023-01-06');
   
   
INSERT INTO horse(id, breed, command, gender, birthday) VALUES
    (3, 'Дестриэ', 'Галоп', 'm', '2014-09-10'),
    (6, 'Йили', 'Галоп', 'm', '2017-06-06'),
	(8, 'Цинчжоу', 'Галоп', 'f', '2022-10-06');
	
INSERT INTO donkey(id, breed, command, gender, birthday) VALUES
    (5, 'Пуату', 'Вперед', 'm', '2022-11-15'),
    (7, 'Мамонт', 'Вперед', 'm', '2018-08-17');
   
   

## Объединение таблицы лошадей и ослов в одну таблицу.
DROP TABLE IF EXISTS pack_animal_new;
create table pack_animal_new (id INT NOT NULL AUTO_INCREMENT PRIMARY KEY)
select  id, 
        command, 
        birthday 
from horse union 
select  id, 
        command, 
        birthday
from donkey;

SELECT * FROM pack_animal_new;

SELECT pack_animals.id, pack_animals.name, pack_animals.animals,		
		pack_animal_new.command,		
		pack_animal_new.birthday		 
FROM pack_animals
LEFT JOIN pack_animal_new ON pack_animals.id = pack_animal_new.id;

SELECT pack_animals.id, pack_animals.name, pack_animals.animals, 
		horse.breed, donkey.breed,
		horse.command, donkey.command,
		horse.gender, donkey.gender,
		horse.birthday, donkey.birthday 		 
FROM pack_animals
LEFT JOIN horse ON pack_animals.id = horse.id
LEFT JOIN donkey ON pack_animals.id = donkey.id
WHERE animals = 'horse' OR animals = 'donkey';

## Удаление таблицы верблюдов
SELECT * FROM camel;  
DELETE FROM camel;   
SELECT * FROM pack_animals;
SELECT * FROM pack_animals  WHERE animals  = 'camel';   
DELETE FROM pack_animals  WHERE animals  = 'camel';

## Создание таблицы, в которой все животные в возрасте от 1 до 3 лет.
DROP TABLE IF EXISTS new_pets;
CREATE TABLE new_pets (id INT NOT NULL AUTO_INCREMENT PRIMARY KEY)
SELECT  id, 
        command, 
        birthday 
FROM dog UNION  
SELECT  id, 
        command, 
        birthday
FROM cat UNION 
SELECT  id, 
        command, 
        birthday
FROM hamster;

SELECT * FROM new_pets; 


SELECT pets.id, name, animals,		
		new_pets.command,		
		new_pets.birthday
FROM pets
LEFT JOIN new_pets ON new_pets.id = pets.id;

CREATE TABLE animals(id_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY)
SELECT  id, 
        name, 
        animals
FROM pets UNION 
SELECT  id, 
        name, 
        animals
FROM pack_animals;
SELECT * FROM animals a ;


DROP TABLE IF EXISTS human_friend;
CREATE TABLE human_friend(
	id_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id INT,
	command VARCHAR(45),
    birthday DATE,
	FOREIGN KEY (id_id) REFERENCES animals(id_id)
);

INSERT into human_friend (id, command, birthday)
SELECT  id, 
        command, 
        birthday
FROM new_pets UNION 
SELECT  id, 
        command, 
        birthday
FROM pack_animal_new;

SELECT * FROM human_friend;
SELECT animals.id_id, name, animals,		
		command, birthday
FROM animals
LEFT JOIN human_friend ON human_friend.id_id = animals.id_id;


DROP TABLE IF EXISTS young_animals;

CREATE TABLE young_animals(id_age INT NOT NULL AUTO_INCREMENT PRIMARY KEY)
SELECT  id_id, 
        command, 
        birthday,
       ((DATEDIFF(current_date(), birthday))/30) AS months       
FROM human_friend
WHERE  (DATEDIFF(current_date(), birthday))/365 > 1 
AND (DATEDIFF(current_date(), birthday))/365 < 3;

SELECT * FROM young_animals;

SELECT animals.id_id, name, animals,		
		command, birthday, months
FROM animals
JOIN young_animals ON young_animals.id_id = animals.id_id;

## Объединить все таблицы в одну, при этом сохраняя поля, указывающие на прошлую принадлежность к старым таблицам.

DROP TABLE IF EXISTS new_animals;
CREATE TABLE new_animals (id_an INT NOT NULL AUTO_INCREMENT PRIMARY KEY)
SELECT  id, 
        command,
        birthday,
        'cat' AS old_table
FROM cat UNION 
SELECT  id, 
        command,
        birthday,
        'dog' AS old_table
FROM dog UNION
SELECT  id, 
        command,
        birthday,
        'hamster' AS old_table
FROM hamster UNION 
SELECT  id, 
        command,
        birthday,
        'horse' AS old_table
FROM horse UNION
SELECT  id, 
        command,
        birthday,
        'donkey' AS old_table
FROM donkey;

SELECT * FROM new_animals;

SELECT animals.id_id, name, animals,		
		command, birthday, old_table
FROM animals
LEFT JOIN new_animals ON new_animals.id = animals.id
WHERE animals = old_table;
