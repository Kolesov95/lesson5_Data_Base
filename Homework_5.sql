-- create database if not exists homework_5;

-- Задание № 1.1

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME,
  updated_at DATETIME 
) COMMENT = 'Покупатели';

INSERT INTO users (name, birthday_at) VALUES
  ('Геннадий', '1990-10-05'),
  ('Наталья', '1984-11-12'),
  ('Александр', '1985-05-20'),
  ('Сергей', '1988-02-14'),
  ('Иван', '1998-01-12'),
  ('Мария', '1992-08-29');
 
update users set created_at = now(), updated_at = now()

-- Задание № 1.2

DROP TABLE IF EXISTS users_2;
CREATE TABLE users_2 (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at VARCHAR(55),
  updated_at VARCHAR(55) 
) COMMENT = 'Покупатели';

INSERT INTO users_2 (name, created_at, updated_at) VALUES
  ('Геннадий', '20.10.2017 8:10', '21.11.2018 13:10'),
  ('Наталья', '24.12.2019 9:16', '26.12.2019 13:10');
 
SELECT STR_TO_DATE(created_at, '%d.%m.%Y %k:%i') created_at , STR_TO_DATE(updated_at , '%d.%m.%Y %k:%i') updated_at from users_2;

update users_2 
set
	created_at = STR_TO_DATE(created_at, '%d.%m.%Y %k:%i'),
	updated_at = STR_TO_DATE(updated_at , '%d.%m.%Y %k:%i');
alter table users_2 change created_at created_at datetime default current_timestamp;
alter table users_2 change updated_at updated_at datetime default current_timestamp on update current_timestamp; 

-- Задание № 3

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
  id SERIAL PRIMARY KEY,
  storehouse_id INT UNSIGNED,
  product_id INT UNSIGNED,
  value INT UNSIGNED COMMENT 'Запас товарной позиции на складе',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Запасы на складе';

insert into storehouses_products (storehouse_id, product_id, value)
values
(5, 10, 12),
(12, 5, 0),
(4, 12, 5),
(3, 33, 0),
(4, 5, 54),
(1, 2, 3),
(4, 5, 6),
(12, 5, 0);

select * from storehouses_products order by if (value > 0, 0, 1), value;

-- Задание № 4

select name, date_format(birthday_at , '%M') as birthday_at from users 
where 
date_format(birthday_at , '%M') = 'May'
or 
date_format(birthday_at , '%M') = 'October';

-- Задание № 5

DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название раздела',
  UNIQUE unique_name(name(10))
) COMMENT = 'Разделы интернет-магазина';

INSERT INTO catalogs VALUES
  (NULL, 'Процессоры'),
  (NULL, 'Материнские платы'),
  (NULL, 'Видеокарты'),
  (NULL, 'Жесткие диски'),
  (NULL, 'Оперативная память');
 

select id, name from catalogs where id in (5, 1, 2) order by field (id, 5, 1, 2);


-- Задание № 2.1

select avg(timestampdiff(year, birthday_at, now())) average_age from users;

-- Задание № 2.2

-- select date_format(birthday_at, '%a') as week_day, count(*) from users group by date_format(birthday_at, '%a'); 

select date_format(date_format(birthday_at, "%d.%m.2020"), '%a') as week_day, count(*) from users group by week_day; 


-- Задание № 3.3 Для этого задания буду использовать столбец id из таблицы users;
-- Посмотрел в ответе как делать, но делать не стал, потому что сам бы не додумался до этого)



 