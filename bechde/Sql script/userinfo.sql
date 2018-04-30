CREATE TABLE `bechde`.`user_info` (
  `user_id` VARCHAR(20) NOT NULL,
  `name` VARCHAR(30) NOT NULL,
  `phone_no` CHAR(10) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `dob` DATE NOT NULL,
  `college` VARCHAR(30) NULL,
  `branch` CHAR(2) NULL,
  `about` VARCHAR(150) NULL,
  `password` VARCHAR(20) NOT NULL,
  `security_ans` VARCHAR(45) NOT NULL,
  `security_ques_no` INT NOT NULL,
  PRIMARY KEY (`user_id`),
  INDEX `security_ques_no_idx` (`security_ques_no` ASC),
  CONSTRAINT `security_ques_no`
    FOREIGN KEY (`security_ques_no`)
    REFERENCES `bechde`.`security_ques` (`security_ques_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
COMMENT = 'website k liye database';
