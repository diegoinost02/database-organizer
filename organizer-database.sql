CREATE DATABASE db_organizer;

USE db_organizer

CREATE TABLE `db_organizer`.`users` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(20) NOT NULL UNIQUE,
    `email` VARCHAR(45) NOT NULL UNIQUE,
    `password` VARCHAR(60) NOT NULL,
    `enabled` TINYINT NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `db_organizer`.`folders` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `user_id` INT NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `db_organizer`.`users` (`id`)
);

CREATE TABLE `db_organizer`.`notes` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(20) NOT NULL,
    `description` TEXT NOT NULL,
    `status` TINYINT NOT NULL,
    `user_id` INT NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `db_organizer`.`users` (`id`)
);

CREATE TABLE `db_organizer`.`notes_folders` (
    `note_id` INT NOT NULL,
    `folder_id` INT NOT NULL,
    PRIMARY KEY (`note_id`, `folder_id`),
    FOREIGN KEY (`note_id`) REFERENCES `db_organizer`.`notes` (`id`),
    FOREIGN KEY (`folder_id`) REFERENCES `db_organizer`.`folders` (`id`)
);

CREATE TABLE `db_organizer`.`roles` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL UNIQUE,
    PRIMARY KEY (`id`)
);

CREATE TABLE `db_organizer`.`users_roles` (
    `user_id` INT NOT NULL,
    `role_id` INT NOT NULL,
    PRIMARY KEY (`user_id`, `role_id`),
    FOREIGN KEY (`user_id`) REFERENCES `db_organizer`.`users` (`id`),
    FOREIGN KEY (`role_id`) REFERENCES `db_organizer`.`roles` (`id`)
);

INSERT INTO
    `db_organizer`.`roles` (`id`, `name`)
VALUES
    ('1', 'ROLE_ADMIN');

INSERT INTO
    `db_organizer`.`roles` (`id`, `name`)
VALUES
    ('2', 'ROLE_USER');