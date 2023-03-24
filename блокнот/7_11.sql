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
SELECT pack_animals.id, pack_animals.name, pack_animals.animals, 
		horse.breed, donkey.breed,
		horse.command, donkey.command,
		horse.gender, donkey.gender,
		horse.birthday, donkey.birthday 		 
FROM pack_animals
LEFT JOIN horse ON pack_animals.id = horse.id
LEFT JOIN donkey ON pack_animals.id = donkey.id
WHERE animals = 'horse' OR animals = 'donkey';
