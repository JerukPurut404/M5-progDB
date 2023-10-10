-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema dbfirst
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dbfirst
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dbfirst` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `dbfirst` ;

-- -----------------------------------------------------
-- Table `dbfirst`.`articles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbfirst`.`articles` ;

CREATE TABLE IF NOT EXISTS `dbfirst`.`articles` (
  `article_id` INT NOT NULL,
  `title` VARCHAR(100) NULL DEFAULT NULL,
  `content` TEXT NULL DEFAULT NULL,
  `author_id` INT NULL DEFAULT NULL,
  `creation_date` TIMESTAMP NULL DEFAULT NULL,
  `modification_date` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`article_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dbfirst`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbfirst`.`users` ;

CREATE TABLE IF NOT EXISTS `dbfirst`.`users` (
  `user_id` INT NOT NULL,
  `username` VARCHAR(50) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `password` VARCHAR(50) NULL DEFAULT NULL,
  `registration_date` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dbfirst`.`comments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbfirst`.`comments` ;

CREATE TABLE IF NOT EXISTS `dbfirst`.`comments` (
  `comment_id` INT NOT NULL,
  `article_id` INT NULL DEFAULT NULL,
  `user_id` INT NULL DEFAULT NULL,
  `comment_text` TEXT NULL DEFAULT NULL,
  `comment_date` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  INDEX `article_id` (`article_id` ASC) VISIBLE,
  INDEX `user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `comments_ibfk_1`
    FOREIGN KEY (`article_id`)
    REFERENCES `dbfirst`.`articles` (`article_id`),
  CONSTRAINT `comments_ibfk_2`
    FOREIGN KEY (`user_id`)
    REFERENCES `dbfirst`.`users` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
