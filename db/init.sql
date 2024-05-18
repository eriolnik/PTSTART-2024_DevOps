

-- Проверка, существует ли пользователь replicator, и создание его, если он не существует
DO $$ 
BEGIN
  IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'replicator') THEN
    CREATE USER replicator WITH REPLICATION ENCRYPTED PASSWORD 'Qq123456';
  END IF;
END $$;

-- Создание слота репликации
SELECT pg_create_physical_replication_slot('replication_slot');

-- Создание базы данных new_database, если она еще не существует
DO $$ 
BEGIN
  IF NOT EXISTS (SELECT FROM pg_database WHERE datname = 'db_bot1') THEN
    CREATE DATABASE new_database;
  END IF;
END $$;

-- Создание таблицы emails, если она еще не существует
CREATE TABLE IF NOT EXISTS mail(
    mailID SERIAL PRIMARY KEY,
    mail VARCHAR(255)
);

-- Создание таблицы phone, если она еще не существует
CREATE TABLE IF NOT EXISTS phone(
    phoneID SERIAL PRIMARY KEY,
    phone VARCHAR(255)
);

INSERT INTO phone(phone) VALUES
('89765437789'),
('+79657659987');

INSERT INTO mail(mail) VALUES
('test1@ya.ru'),
('test2@gmail.com');
