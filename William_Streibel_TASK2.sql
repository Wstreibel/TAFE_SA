-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema 001175263
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `001175263` ;

-- -----------------------------------------------------
-- Schema 001175263
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `001175263` DEFAULT CHARACTER SET utf8 ;
USE `001175263` ;

-- -----------------------------------------------------
-- Table `001175263`.`school`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `001175263`.`school` ;

CREATE TABLE IF NOT EXISTS `001175263`.`school` (
  `SchoolName` VARCHAR(20) NOT NULL,
  `Address` VARCHAR(80) NOT NULL,
  `PhoneNumber` VARCHAR(15) NULL,
  `Email` VARCHAR(45) NULL,
  PRIMARY KEY (`SchoolName`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Insert `001175263`.`school`
-- -----------------------------------------------------
INSERT INTO `001175263`.`school` (`SchoolName`, `Address`, `PhoneNumber`, `Email`) VALUE
  ('Koala Academy', '123 Kangaroo Street, Sydney NSW 2000', '+61 2 1234 5678', 'info@koalaacademy.edu.au');

-- Testing Table school
SELECT *
FROM school;

-- -----------------------------------------------------
-- Table `001175263`.`teacher`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `001175263`.`teacher` ;

CREATE TABLE IF NOT EXISTS `001175263`.`teacher` (
  `TeacherID` INT(8) NOT NULL COMMENT 'Must start with the number 4. Max 8 characteres',
  `FirstName` VARCHAR(15) NOT NULL,
  `MiddleNameInitials` VARCHAR(5) NULL,
  `LastName` VARCHAR(15) NOT NULL,
  `Email` VARCHAR(45) NULL,
  `PhoneNumber` VARCHAR(15) NULL,
  `SchoolName` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`TeacherID`),
  INDEX `fk_teacher_school1_idx` (`SchoolName` ASC) VISIBLE,
  CONSTRAINT `fk_teacher_school1`
    FOREIGN KEY (`SchoolName`)
    REFERENCES `001175263`.`school` (`SchoolName`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Insert `001175263`.`teacher`
-- -----------------------------------------------------
INSERT INTO `001175263`.`teacher` (`TeacherID`, `FirstName`, `MiddleNameInitials`, `LastName`, `Email`, `PhoneNumber`, `SchoolName`) VALUES
  (40052186, 'Oliver', 'R', 'Green', 'oliver.green@koalaacademy.edu.au', '+61 9876 54321', 'Koala Academy'),
  (41002594, 'Emily', NULL, 'Patel', 'emily.brown@koalaacademy.edu.au', '+61 8765 43210', 'Koala Academy'),
  (46508475, 'Thomas', 'J', 'Gonzales', 'thomas.smith@koalaacademy.edu.au', '+61 7654 32109', 'Koala Academy'),
  (44503365, 'Sophia', NULL, 'Lee', 'sophia.lee@koalaacademy.edu.au', '+61 6543 21098', 'Koala Academy');

-- Testing Table teacher
SELECT *
FROM teacher;

-- -----------------------------------------------------
-- Table `001175263`.`student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `001175263`.`student` ;

CREATE TABLE IF NOT EXISTS `001175263`.`student` (
  `StudentID` INT(8) NOT NULL COMMENT 'Must start with the number 1. Max 8 characteres',
  `FirstName` VARCHAR(15) NOT NULL,
  `MiddleNameInitials` VARCHAR(5) NULL,
  `LastName` VARCHAR(15) NOT NULL,
  `Gender` VARCHAR(15) NULL,
  `PhoneNumber` VARCHAR(15) NULL,
  `ResidencialAddress` VARCHAR(80) NULL,
  `Email` VARCHAR(45) NULL,
  `Nacionality` VARCHAR(15) NULL,
  `DateOfBirth` DATE NOT NULL,
  `DateOfEnrolmentSchool` DATE NOT NULL,
  `SchoolName` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`StudentID`),
  INDEX `fk_student_school1_idx` (`SchoolName` ASC) VISIBLE,
  CONSTRAINT `fk_student_school1`
    FOREIGN KEY (`SchoolName`)
    REFERENCES `001175263`.`school` (`SchoolName`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Insert `001175263`.`student`
-- -----------------------------------------------------
INSERT INTO `001175263`.`student` (`StudentID`, `FirstName`, `MiddleNameInitials`, `LastName`, `Gender`, `PhoneNumber`, `ResidencialAddress`, `Email`, `Nacionality`, `DateOfBirth`, `DateOfEnrolmentSchool`, `SchoolName`) VALUES
  (15548552, 'William', NULL, 'Streibel', 'Male', '+61 4269 92624', '3/107 Beach Street, Grange, South Australia, Australia, 5022', 'william.streibel@student.tafesa.edu.au', 'Brazilian', '1986-06-02', '2020-09-01', 'Koala Academy'),
  (11258465, 'Samantha', 'M', 'Miller', 'Female', '+61 3456 78901', '123 Koala Close, Perth WA 6000', 'samantha.miller@koalaacademy.edu.au', 'German', '1990-02-15', '2020-02-02', 'Koala Academy'),
  (11255236, 'Lucas', 'A', 'Garcia', 'Male', '+61 4567 89012', '987 Wombat Circuit, Adelaide SA 5000', 'lucas.garcia@koalaacademy.edu.au', 'Spanish', '1995-11-21', '2020-01-06', 'Koala Academy'),
  (19855684, 'Hiroshi', NULL, 'Nakamura', 'Male', '+61 5678 90123', '456 Kangaroo Street, Sydney NSW 2000', 'hiroshi.nakamura@koalaacademy.edu.au', 'Japanese', '1992-09-08', '2020-02-14', 'Koala Academy'),
  (14478624, 'Nina', 'L', 'Andersen', 'Female', '+61 6789 01234', '789 Wallaby Road, Melbourne VIC 3000', 'nina.andersen@koalaacademy.edu.au', 'French', '1991-07-13', '2020-01-27', 'Koala Academy'),
  (13365596, 'Juan', 'P', 'Vargas', 'Male', '+61 7890 12345', '123 Kangaroo Close, Darwin NT 0800', 'juan.vargas@koalaacademy.edu.au', 'Colombian', '1994-03-29', '2020-01-30', 'Koala Academy');

-- Testing Table student
SELECT *
FROM student;

-- -----------------------------------------------------
-- Table `001175263`.`subject`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `001175263`.`subject` ;

CREATE TABLE IF NOT EXISTS `001175263`.`subject` (
  `SubjectName` VARCHAR(9) NOT NULL COMMENT 'Subject names have maximum 9 Characters – a combination of characters and numbers',
  `SubjectDescription` VARCHAR(150) NULL,
  `CostOfSubject` DECIMAL(7,2) NOT NULL,
  `DurationInHours` INT(3) NOT NULL,
  `NumberOfAssessmentsItems` INT(2) NULL,
  `Coordinator` INT(8) NOT NULL,
  PRIMARY KEY (`SubjectName`),
  INDEX `fk_subject_teacher_idx` (`Coordinator` ASC) VISIBLE,
  CONSTRAINT `fk_subject_teacher`
    FOREIGN KEY (`Coordinator`)
    REFERENCES `001175263`.`teacher` (`TeacherID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Insert `001175263`.`subject`
-- -----------------------------------------------------
INSERT INTO `001175263`.`subject` (`SubjectName`, `SubjectDescription`, `CostOfSubject`, `DurationInHours`, `NumberOfAssessmentsItems`, `Coordinator`) VALUES
  ('AI_Models', 'Learn about different AI models and their applications', 250.99, 60, 3, 40052186),
  ('ML_DeepL', 'Explore the intricacies of deep learning in machine learning', 299.50, 80, 4, 46508475),
  ('NN_Tensor', 'Get hands-on experience with neural networks using Tensorflow', 215.75, 50, 2, 41002594),
  ('RNN_LSTM', 'Learn about recurrent neural networks and long short-term memory models', 279.99, 70, 3, 44503365),
  ('AI_NLP', 'Explore natural language processing and its application in AI', 205.50, 40, 2, 40052186);

-- Testing Table subject
SELECT *
FROM subject;

-- -----------------------------------------------------
-- Table `001175263`.`enrolment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `001175263`.`enrolment` ;

CREATE TABLE IF NOT EXISTS `001175263`.`enrolment` (
  `StudentID` INT(8) NOT NULL,
  `SubjectName` VARCHAR(9) NOT NULL,
  `DateOfEnrolment` DATE NOT NULL,
  `Grade` VARCHAR(4) NULL COMMENT 'format of 4 Characters being Pass, Cred, Dist, Fail',
  `Result` INT(3) NULL COMMENT 'format of a Numeric value between 0 and 100',
  `DateGradeReceived` DATE NULL,
  PRIMARY KEY (`StudentID`, `SubjectName`),
  INDEX `fk_enrolment_subject1_idx` (`SubjectName` ASC) VISIBLE,
  CONSTRAINT `fk_enrolment_student1`
    FOREIGN KEY (`StudentID`)
    REFERENCES `001175263`.`student` (`StudentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_enrolment_subject1`
    FOREIGN KEY (`SubjectName`)
    REFERENCES `001175263`.`subject` (`SubjectName`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Insert `001175263`.`enrolment`
-- -----------------------------------------------------
INSERT INTO `001175263`.`enrolment` (`StudentID`, `SubjectName`, `DateOfEnrolment`, `Grade`, `Result`, `DateGradeReceived`) VALUES
  -- William Streibel subjects
  (15548552, 'AI_Models', '2020-09-02', 'Dist', 85, '2020-12-15'),
  (15548552, 'ML_DeepL', '2020-09-02', 'Cred', 70, '2020-12-17'),
  (15548552, 'RNN_LSTM', '2020-09-02', 'Pass', 60, '2020-12-20'),
  (15548552, 'NN_Tensor', '2020-09-02', 'Fail', 40, '2020-12-12'),
  (15548552, 'AI_NLP', '2020-09-02', 'Cred', 75, '2020-12-21'),
  -- Samantha M Miller subjects
  (11258465, 'NN_Tensor', '2020-02-03', 'Fail', 45, '2020-12-12'),
  (11258465, 'ML_DeepL', '2020-02-03', 'Pass', 50, '2020-12-17'),
  (11258465, 'RNN_LSTM', '2020-03-02', 'Dist', 90, '2020-12-20'),
  (11258465, 'AI_NLP', '2020-03-02', 'Cred', 70, '2020-12-21'),
  -- Lucas A Garcia subjects
  (11255236, 'AI_Models', '2020-01-07', 'Dist', 80, '2020-12-15'),
  (11255236, 'ML_DeepL', '2020-01-07', 'Cred', 65, '2020-12-17'),
  (11255236, 'NN_Tensor', '2020-01-07', 'Cred', 75, '2020-12-12'),
  -- Hiroshi  Nakamura subjects
  (19855684, 'AI_NLP', '2020-02-15', 'Dist', 90, '2020-12-21'),
  (19855684, 'RNN_LSTM', '2020-02-15', 'Dist', 95, '2020-12-20'),
  (19855684, 'AI_Models', '2020-02-14', 'Dist', 80, '2020-12-15'),
  (19855684, 'NN_Tensor', '2020-02-14', 'Dist', 85, '2020-12-12'),
  -- Nina L Andersen subjects
  (14478624, 'AI_Models', '2020-01-28', 'Cred', 70, '2020-12-15'),
  (14478624, 'NN_Tensor', '2020-01-28', 'Dist', 85, '2020-12-12'),
  (14478624, 'RNN_LSTM', '2020-01-28', 'Pass', 60, '2020-12-20'),
  -- Juan P Vargas subjects
  (13365596, 'AI_NLP', '2020-01-31', 'Fail', 40, '2020-12-21'),
  (13365596, 'AI_Models', '2020-01-31', 'Cred', 75, '2020-12-15'),
  (13365596, 'NN_Tensor', '2020-01-31', 'Dist', 85, '2020-12-12'),
  (13365596, 'ML_DeepL', '2020-01-31', 'Pass', 60, '2020-12-17');

-- Testing Table enrolment
SELECT *
FROM enrolment;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Run Queries & Testing
-- -----------------------------------------------------
/* A query that outputs the students first and last name concatenated together as “Full Name” as well as their Phone number. List all students in the Database  */
SELECT CONCAT(FirstName, ' ',
	CASE
		WHEN MiddleNameInitials IS NOT NULL
        THEN CONCAT(MiddleNameInitials,'. ')
        ELSE ''
	END, LastName) AS 'Full_Name', PhoneNumber
FROM student
ORDER BY Full_Name;

/* A query that counts all students in the database and provides a single value to represent total students in the database */
SELECT COUNT(StudentID) AS 'Count_Of_Student'
from student;

/* A query that counts students enrolled in each subject and provides a single value to represent total subject enrolments for each subject */
SELECT SubjectName, COUNT(StudentID) AS 'Count_Of_Student'
FROM enrolment
GROUP BY SubjectName;

/* A query that shows the Highest (Max) Result for all students in a Subject */
SELECT SubjectName, MAX(Result) AS 'Highest_Result'
FROM enrolment
GROUP BY SubjectName;

/* A query that shows the Lowest (Min) Result for all students in a Subject */
SELECT SubjectName, MIN(Result) AS 'Lowest_Result'
FROM enrolment
GROUP BY SubjectName;

/* A query that shows all results of a specific student */
SELECT CONCAT(FirstName, ' ',
	CASE
		WHEN MiddleNameInitials IS NOT NULL
        THEN CONCAT(MiddleNameInitials,'. ')
        ELSE ''
	END, LastName) AS 'Student_Name', subject.SubjectName AS 'Subject_Name', subject.SubjectDescription AS 'Description', enrolment.Result, enrolment.Grade
FROM enrolment
JOIN student ON enrolment.StudentID = student.StudentID
JOIN subject ON enrolment.SubjectName = subject.SubjectName
WHERE student.StudentID = '15548552'; -- Change the StudentID number to check another result. To check the full list of StudentID, use the code at the comment below:
/*
SELECT StudentID, CONCAT(FirstName, ' ', CASE WHEN MiddleNameInitials IS NOT NULL THEN CONCAT(MiddleNameInitials,'. ') ELSE '' END, LastName) AS 'Student_Name' FROM student;
*/

/* A query that shows the results of all students in specific subject */
SELECT subject.SubjectName AS 'Subject_Name', CONCAT(FirstName, ' ',
	CASE
		WHEN MiddleNameInitials IS NOT NULL
        THEN CONCAT(MiddleNameInitials,'. ')
        ELSE ''
	END, LastName) AS 'Student_Name', enrolment.Result, enrolment.Grade
FROM enrolment
JOIN student ON enrolment.StudentID = student.StudentID
JOIN subject ON enrolment.SubjectName = subject.SubjectName
WHERE subject.SubjectName = 'RNN_LSTM' -- Change the SubjectName to check another result. To check the full list of SubjectName, use the code at the comment below: 
ORDER BY Student_Name; 
/*
SELECT SubjectName, SubjectDescription FROM subject;
*/

-- -----------------------------------------------------
-- Alter Tables and Update
-- -----------------------------------------------------
/* Add the column LanguageSpokenHome in student table */

SELECT *
FROM student;

ALTER TABLE student
ADD LanguageSpokenHome VARCHAR(15);

UPDATE student
SET LanguageSpokenHome = 'Spanish'
WHERE StudentID = 11255236;

UPDATE student
SET LanguageSpokenHome = 'German'
WHERE StudentID = 11258465;

UPDATE student
SET LanguageSpokenHome = 'Spanish'
WHERE StudentID = 13365596;

UPDATE student
SET LanguageSpokenHome = 'French'
WHERE StudentID = 14478624;

UPDATE student
SET LanguageSpokenHome = 'Portuguese'
WHERE StudentID = 15548552;

UPDATE student
SET LanguageSpokenHome = 'Japanese'
WHERE StudentID = 19855684;

SELECT *
FROM student;

/* Change a Subject Coordinator to another */
SELECT *
FROM subject;
-- The original Coordinator of the Subject NN_Tensor is Emily Patel, ID 41002594

UPDATE subject
SET Coordinator = 46508475
WHERE SubjectName = 'NN_Tensor';

SELECT *
FROM subject;
-- The new Coordinator of the Subject NN_Tensor is Thomas J. Gonzales, ID 46508475

/* Deleting a Teacher */
-- A query that identify a teacher who is not coordinating any subjects
SELECT *
FROM teacher
WHERE TeacherID NOT IN (
  SELECT Coordinator
  FROM subject);
-- The teacher that is not coordinating any Subject is Emily Patel, ID 41002594

SELECT *
FROM teacher;

DELETE FROM teacher
WHERE TeacherID = 41002594;

SELECT *
FROM teacher;
-- The teacher deleted is Emily Patel, ID 41002594 