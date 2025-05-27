-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema football_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema football_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `football_db` DEFAULT CHARACTER SET utf8 ;
USE `football_db` ;

-- -----------------------------------------------------
-- Table `football_db`.`Stadiums`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `football_db`.`Stadiums` (
  `stadium_id` INT NOT NULL AUTO_INCREMENT,
  `stadium_name` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `capacity` VARCHAR(45) NULL,
  `year_built` DATE NULL,
  PRIMARY KEY (`stadium_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `football_db`.`Managers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `football_db`.`Managers` (
  `manager_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `date_of_birth` DATE NULL,
  `nationality` VARCHAR(45) NULL,
  `current_club` INT NULL,
  PRIMARY KEY (`manager_id`),
  INDEX `current club_idx` (`current_club` ASC) VISIBLE,
  CONSTRAINT `current club`
    FOREIGN KEY (`current_club`)
    REFERENCES `football_db`.`Clubs` (`club_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `football_db`.`Clubs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `football_db`.`Clubs` (
  `club_id` INT NOT NULL AUTO_INCREMENT,
  `club_name` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `stadium_id` INT NULL,
  `year_founded` YEAR(4) NULL,
  `manager_id` INT NULL,
  PRIMARY KEY (`club_id`),
  INDEX `stadium_ID_idx` (`stadium_id` ASC) VISIBLE,
  INDEX `manager_idx` (`manager_id` ASC) VISIBLE,
  CONSTRAINT `stadium_ID`
    FOREIGN KEY (`stadium_id`)
    REFERENCES `football_db`.`Stadiums` (`stadium_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `manager`
    FOREIGN KEY (`manager_id`)
    REFERENCES `football_db`.`Managers` (`manager_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `football_db`.`Players`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `football_db`.`Players` (
  `player_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `date_of_birth` DATE NULL,
  `current_club_id` INT NULL,
  `nationality` VARCHAR(45) NULL,
  `height` VARCHAR(45) NULL,
  `squad_number` INT NULL,
  PRIMARY KEY (`player_id`),
  INDEX `Player_Current_Club_idx` (`current_club_id` ASC) VISIBLE,
  CONSTRAINT `Player_Current_Club`
    FOREIGN KEY (`current_club_id`)
    REFERENCES `football_db`.`Clubs` (`club_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `football_db`.`Fixtures`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `football_db`.`Fixtures` (
  `fixture_id` INT NOT NULL AUTO_INCREMENT,
  `matchday` INT NULL,
  `home_team_id` INT NOT NULL,
  `away_team_id` INT NOT NULL,
  `stadium_id` INT NULL,
  `home_team_score` INT ZEROFILL NULL,
  `away_team_score` INT ZEROFILL NULL,
  `attendance` INT NULL,
  `referee` VARCHAR(45) NULL,
  PRIMARY KEY (`fixture_id`),
  INDEX `home team_idx` (`home_team_id` ASC) VISIBLE,
  INDEX `away team_idx` (`away_team_id` ASC) VISIBLE,
  INDEX `stadium_idx` (`stadium_id` ASC) VISIBLE,
  CONSTRAINT `home team`
    FOREIGN KEY (`home_team_id`)
    REFERENCES `football_db`.`Clubs` (`club_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `away team`
    FOREIGN KEY (`away_team_id`)
    REFERENCES `football_db`.`Clubs` (`club_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `stadium`
    FOREIGN KEY (`stadium_id`)
    REFERENCES `football_db`.`Stadiums` (`stadium_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
