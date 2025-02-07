CREATE DATABASE `linkedin`;

USE `linkedin`;


CREATE TABLE `users` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `username` VARCHAR(255) NOT NULL UNIQUE,
    `password` VARCHAR(128) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `schools` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `type` ENUM('Primary', 'Secondary', 'Higher Education') NOT NULL,
    `location` VARCHAR(255) NOT NULL,
    `founding_year` SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `companies` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `industry` ENUM('Technology', 'Education', 'Business') NOT NULL,
    `location` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `users_connections` (
    `user1_id` INT,
    `user2_id` INT,
    PRIMARY KEY (`user1_id`, `user2_id`)
    FOREIGN KEY (`user1_id`) REFERENCES `users`(`id`)
    FOREIGN KEY (`user2_id`) REFERENCES `users`(`id`)
);

CREATE TABLE `school_connections` (
    `user_id` INT,
    `school_id` INT,
    `start_date` DATE NOT NULL,
    `end_date` DATE,
    `degree_type` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`user_id`, `school_id`)
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`)
    FOREIGN KEY (`school_id`) REFERENCES `schools`(`id`)
);

CREATE TABLE `companies_connections` (
    `user_id` INT,
    `company_id` INT,
    `start_date` DATE NOT NULL,
    `end_date` DATE,,
    PRIMARY KEY (`user_id`, `company_id`)
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`)
    FOREIGN KEY (`company_id`) REFERENCES `companies`(`id`)
);
