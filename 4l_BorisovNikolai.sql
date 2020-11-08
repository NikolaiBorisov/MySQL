#1
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `female_workers` AS
    SELECT 
        `employees`.`emp_no` AS `emp_no`,
        `employees`.`birth_date` AS `birth_date`,
        `employees`.`first_name` AS `first_name`,
        `employees`.`last_name` AS `last_name`,
        `employees`.`gender` AS `gender`,
        `employees`.`hire_date` AS `hire_date`
    FROM
        `employees`
    WHERE
        (`employees`.`gender` = 'F')
#1
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `monthly_salary` AS
    SELECT 
        `salaries`.`emp_no` AS `emp_no`,
        `salaries`.`salary` AS `salary`,
        `salaries`.`from_date` AS `from_date`,
        `salaries`.`to_date` AS `to_date`,
        (`salaries`.`salary` / 12) AS `monthly_salary`
    FROM
        `salaries`

# Function
CREATE DEFINER=`root`@`localhost` FUNCTION `manager`(entered_first_name varchar(14), entered_last_name varchar(16)) RETURNS char(255) CHARSET utf8mb4
    READS SQL DATA
BEGIN
DECLARE name_manager int;
    set name_manager = (
        select 
           emp_no
        from 
            employees 
        where 
            first_name like entered_first_name
            and 
            last_name like entered_last_name
    );
    set @name_manager = name_manager;
    return concat((
        select 
            emp_no
        from 
            employees
        where 
            emp_no = name_manager
            and
            first_name like entered_first_name
            and 
            last_name like entered_last_name
    ),': ', entered_first_name,' ', entered_last_name);
END

#Trigger
CREATE DEFINER = CURRENT_USER TRIGGER `employees`.`new_emp_AFTER_INSERT` AFTER INSERT ON `employees` FOR EACH ROW
BEGIN
insert into salaries set emp_no = NEW.emp_no, salary = 30000, from_date = curdate(), to_date = curdate() ;
END

DROP TRIGGER IF EXISTS `employees`.`new_emp_AFTER_INSERT`;

DELIMITER $$
USE `employees`$$
CREATE DEFINER = CURRENT_USER TRIGGER `employees`.`new_emp_AFTER_INSERT` AFTER INSERT ON `employees` FOR EACH ROW
BEGIN
insert into salaries set emp_no = NEW.emp_no, salary = 30000, from_date = curdate(), to_date = curdate() ;
END$$
DELIMITER ;