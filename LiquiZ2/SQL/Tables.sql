-- MySQL Script generated by MySQL Workbench
-- Wed Oct  1 15:51:35 2014
-- Model: New Model    Version: 1.0
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema LiquiZ
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LiquiZ` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `LiquiZ` ;

-- -----------------------------------------------------
-- Table `LiquiZ`.`Policies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LiquiZ`.`Policies` ;

CREATE TABLE IF NOT EXISTS `LiquiZ`.`Policies` (
  `PolID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(255) NOT NULL,
  `Attempts` INT NOT NULL DEFAULT 1,
  `Timed` BIT(1) NOT NULL DEFAULT 0,
  `TimeLimit` INT NULL,
  `ShowAns` BIT(1) NOT NULL DEFAULT 0,
  `Scored` BIT(1) NOT NULL DEFAULT 1,
  `Grade` INT NOT NULL,
  `ShuffleQues` BIT(1) NOT NULL DEFAULT 0,
  `ShuffleAns` BIT(1) NOT NULL DEFAULT 0,
  `AccessCode` VARCHAR(255) NULL,
  PRIMARY KEY (`PolID`),
  UNIQUE INDEX `PolID_UNIQUE` (`PolID` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LiquiZ`.`DisplayElements`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LiquiZ`.`DisplayElements` ;

CREATE TABLE IF NOT EXISTS `LiquiZ`.`DisplayElements` (
  `DispElID` INT NOT NULL AUTO_INCREMENT COMMENT 'Not sure I\'ll need this but needed for diagram I think',
  `Type` CHAR(4) NOT NULL,
  PRIMARY KEY (`DispElID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LiquiZ`.`Quizzes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LiquiZ`.`Quizzes` ;

CREATE TABLE IF NOT EXISTS `LiquiZ`.`Quizzes` (
  `QuizID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(255) NULL,
  `Desc` INT NULL,
  `Policy` INT NOT NULL,
  `Privacy` CHAR(1) NOT NULL,
  PRIMARY KEY (`QuizID`),
  UNIQUE INDEX `QID_UNIQUE` (`QuizID` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LiquiZ`.`Questions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LiquiZ`.`Questions` ;

CREATE TABLE IF NOT EXISTS `LiquiZ`.`Questions` (
  `QuesID` INT NOT NULL AUTO_INCREMENT,
  `Points` INT NOT NULL,
  `Level` INT NULL,
  `QType` CHAR(4) NOT NULL,
  PRIMARY KEY (`QuesID`),
  UNIQUE INDEX `QuesID_UNIQUE` (`QuesID` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LiquiZ`.`Courses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LiquiZ`.`Courses` ;

CREATE TABLE IF NOT EXISTS `LiquiZ`.`Courses` (
  `CourseID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(255) NOT NULL,
  `Privacy` CHAR(1) NOT NULL,
  PRIMARY KEY (`CourseID`),
  UNIQUE INDEX `CID_UNIQUE` (`CourseID` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LiquiZ`.`CoursesQuizzes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LiquiZ`.`CoursesQuizzes` ;

CREATE TABLE IF NOT EXISTS `LiquiZ`.`CoursesQuizzes` (
  `Course` INT NULL,
  `Quiz` INT NULL,
  `Sequence` INT NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LiquiZ`.`QuesCon`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LiquiZ`.`QuesCon` ;

CREATE TABLE IF NOT EXISTS `LiquiZ`.`QuesCon` (
  `QuesConID` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`QuesConID`)
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LiquiZ`.`QuizzesQuesCons`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LiquiZ`.`QuizzesQuesCons` ;

CREATE TABLE IF NOT EXISTS `LiquiZ`.`QuizzesQuesCons` (
  `Quiz` INT NOT NULL,
  `QuesCon` INT NOT NULL,
  `Sequence` INT NOT NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LiquiZ`.`QuesConElements`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LiquiZ`.`QuesConElements` ;

CREATE TABLE IF NOT EXISTS `LiquiZ`.`QuesConElements` (
  `QuesCon` INT NOT NULL,
  `Sequence` INT NOT NULL,
  `Element` INT NULL,
  `Ques` INT NULL,
  `Type` CHAR(4) NOT NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LiquiZ`.`Answers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LiquiZ`.`Answers` ;

CREATE TABLE IF NOT EXISTS `LiquiZ`.`Answers` (
  `AnsID` INT NOT NULL AUTO_INCREMENT,
  `Response` INT NULL,
  `Element` INT NULL COMMENT 'The DispEl that represents the answer',
  `LowBound` INT NULL COMMENT 'to accept a range of numbers (lower bound)',
  `HighBound` INT NULL COMMENT 'to accept a range of numbers (upper bound)',
  PRIMARY KEY (`AnsID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LiquiZ`.`DispElSeq`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LiquiZ`.`DispElSeq` ;

CREATE TABLE IF NOT EXISTS `LiquiZ`.`DispElSeq` (
  `DispEl` INT NOT NULL,
  `Element` VARCHAR(255) NOT NULL,
  `Sequence` INT NOT NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LiquiZ`.`StdSet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LiquiZ`.`StdSet` ;

CREATE TABLE IF NOT EXISTS `LiquiZ`.`StdSet` (
  `StdSetID`  INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`StdSetId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LiquiZ`.`StdChoices`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LiquiZ`.`StdChoices` ;

CREATE TABLE IF NOT EXISTS `LiquiZ`.`StdChoices` (
  `StdSetID` INT NOT NULL,
  `Element` INT NOT NULL,
  `Sequence` INT NOT NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LiquiZ`.`QuesAnsSeq`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LiquiZ`.`QuesAnsSeq` ;

CREATE TABLE IF NOT EXISTS `LiquiZ`.`QuesAnsSeq` (
  `Ques` INT NOT NULL,
  `Ans` INT NULL,
  `StdSet` INT NULL,
  `StdChoice` INT NULL, -- Sequence, so we can set correct
  `Sequence` INT NULL,
  `Correct` BIT(1) NULL) -- 0/1
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LiquiZ`.`Users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LiquiZ`.`Users` ;

CREATE TABLE IF NOT EXISTS `LiquiZ`.`Users` (
  `UserID` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(255) NOT NULL,
  `LastName` VARCHAR(255) NOT NULL,
  `Username` VARCHAR(255) NOT NULL,
  `Password` VARCHAR(255) NOT NULL,
  `Email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`UserID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LiquiZ`.`UserPermissions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LiquiZ`.`UserPermissions` ;

CREATE TABLE IF NOT EXISTS `LiquiZ`.`UserPermissions` (
  `User` INT NOT NULL,
  `Entity` INT NULL COMMENT 'Course or Quiz... other Users?',
  `EType` CHAR(4) NULL COMMENT 'Course or Quiz... other Users?',
  `Permissions` INT NULL COMMENT 'each bit represents a permission')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LizuiZ`.`Responses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LiquiZ`.`Responses` ;

CREATE TABLE IF NOT EXISTS `LiquiZ`.`Responses` (
  `ResponseID` INT NOT NULL AUTO_INCREMENT,
  `Element` INT NOT NULL,
  PRIMARY KEY (`ResponseID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LiquiZ`.`StudentResponses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LiquiZ`.`StudentResponses` ;

CREATE TABLE IF NOT EXISTS `LiquiZ`.`StudentResponses` (
  `Student` INT NOT NULL,
  `Ques` INT NOT NULL,
  `Response` INT NOT NULL,
  `Correct` BIT(1) NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LiquiZ`.`StudentGradesOnQuizzes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LiquiZ`.`StudentGradesOnQuizzes` ;

CREATE TABLE IF NOT EXISTS `LiquiZ`.`StudentGradesOnQuizzes` (
  `Student` INT NOT NULL,
  `Quiz` INT NOT NULL,
  `Score` INT NOT NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LiquiZ`.`StudentGrades`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LiquiZ`.`StudentGrades` ;

CREATE TABLE IF NOT EXISTS `LiquiZ`.`StudentGrades` (
  `Student` INT NOT NULL,
  `Grade` DOUBLE NOT NULL)
ENGINE = InnoDB;

DROP TABLE IF EXISTS `LiquiZ`.`ViewAnsToQues` ;
DROP TABLE IF EXISTS `LiquiZ`.`ViewQuiz` ;
DROP TABLE IF EXISTS `LiquiZ`.`ViewQuizWAns` ;
DROP VIEW IF EXISTS `LiquiZ`.`ViewAnsToQues` ;
DROP VIEW IF EXISTS `LiquiZ`.`ViewQuiz` ;
DROP VIEW IF EXISTS `LiquiZ`.`ViewQuizWAns` ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
