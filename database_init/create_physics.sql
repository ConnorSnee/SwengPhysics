DROP database physics;

CREATE DATABASE physics;

CREATE TABLE `physics`.`user`(
     `user_id` int(36) auto_increment,
     `banner_id` int(9) NULL,
     `first_name` VARCHAR(45) NULL,
     `middle_name` VARCHAR(45) NULL,
     `last_name` VARCHAR(45) NULL,
     `username` VARCHAR(45) NULL,
     `role` VARCHAR(45) NULL,
     `email` VARCHAR(45) NULL,
     PRIMARY KEY(`user_id`),
     UNIQUE KEY(`banner_id`));

CREATE TABLE `physics`.`user_permissions`(
    `permission_id` int(36) auto_increment,
    `banner_id` int(9) NULL,
    `can_add_user` BOOLEAN,
    `can_remove_user` BOOLEAN,
    `can_modify_permissions` BOOLEAN,
    `can_request_record` BOOLEAN,
    `can_add_record` BOOLEAN,
    `can_remove_record` BOOLEAN,
    `can_modify_record` BOOLEAN,
    `can_backup_database` BOOLEAN,
    `can_restore_database` BOOLEAN,
    PRIMARY KEY(`permission_id`),
    UNIQUE KEY(`banner_id`));

  CREATE TABLE `physics`.`banner_ids` (
    `banner_index` int(36) auto_increment,
    `username` VARCHAR(45) NULL,
    `banner_id` int(9) NULL,
    PRIMARY KEY(`banner_index`),
    UNIQUE KEY(`username`));

 -- create user requests table
  CREATE TABLE `physics`.`user_requests`(
     `user_request_id` int(36) auto_increment,
     `banner_id` int(9),
     `first_name` varchar(45) NULL,
     `middle_name` VARCHAR(45) NULL,
     `last_name` varchar(45) NULL,
     `username` VARCHAR(45) NULL,
     `role` VARCHAR(45) NULL,
     `email` VARCHAR(60) NULL,
     PRIMARY KEY(`user_request_id`));

 -- create lab requests table
 CREATE TABLE `physics`.`lab_requests`(
     `lab_request_id` INT(36) auto_increment,
     `lab_id` INT(36),
     `dates` VARCHAR(60),
     `time_needed` VARCHAR(60),
     `location_id` INT(36),
     `banner_id` INT(9),
     `num_teams` SMALLINT(5),
     `notes` VARCHAR(250) NULL,
     PRIMARY KEY(`lab_request_id`));

-- create object requests table
CREATE TABLE `physics`.`object_requests`(
		  `object_request_id` INT (36) auto_increment,
            `hashed_serial_num` INT (60),
            `dates` VARCHAR (60),
            `time_needed` VARCHAR (60),
            `classroom` VARCHAR (45),
            `banner_id` INT(9),
            `num_items` INT (36),
            `notes` VARCHAR (250) NULL,
            PRIMARY KEY(`object_request_id`));

CREATE TABLE `physics`.`course`(
      `course_id` INT(36) auto_increment,
      `name` VARCHAR(80),
      PRIMARY KEY(`course_id`));


source sp_add_user.sql;
source sp_change_permissions.sql;
source sp_get_permissions.sql;
source sp_get_user.sql;
source sp_get_banner_id.sql;
source create_backup_user.sql;
source sp_get_all_permissions.sql;
source sp_add_user_request.sql;
source sp_delete_user_request.sql;
source sp_get_all_user_requests.sql;
source sp_get_email.sql;
source sp_get_all_users.sql;
source sp_add_course.sql;
source sp_get_all_courses.sql;
source sp_delete_course.sql;
source sp_remove_user.sql;


/*Following lines are for development purposes only
They add 4 basic users for the 4 different pre-defined roles. Can be used for testing physics.*/

call sp_add_user(111111111,'student','student','student','student','student','student@rowan.edu');
call sp_add_user(222222222,'professor','professor','professor','professor','professor','professor@rowan.edu');
call sp_add_user(333333333,'sys_admin','sys_admin','sys_admin','sys_admin','sys_admin','sys_admin@rowan.edu');
call sp_add_user(444444444,'lab_admin','lab_admin','lab_admin','lab_admin','lab_admin','lab_admin@rowan.edu');
call sp_change_permissions(111111111,0,0,0,1,1,1,1,0,0);
call sp_change_permissions(222222222,0,0,0,1,0,0,0,0,0);
call sp_change_permissions(333333333,0,0,0,0,0,0,0,1,1);
call sp_change_permissions(444444444,1,1,1,1,1,1,1,1,1);
call sp_add_user_request(555555555,'Tom','M','Grello','tomgrello','student','test@test.com');
call sp_add_user_request(666666666,'Ryan',' ','Bell','ryanbell','professor','test@test.com');
call sp_add_user_request(777777777,'Connor', ' ', 'Snee','connorsnee','lab_admin','test@test.com');
call sp_add_user_request(888888888,'Dharmik',' ','Pandya','dharmikpandya','sys_admin','test@test.com');

/*Test course data for request Form*/
call sp_add_course('Introduction to Mechanics');
call sp_add_course('Introduction to Electricity and Magnetism');
call sp_add_course('Thermal/Fluids/Waves/Optics');
call sp_add_course('Physics I w/o Calculus');
call sp_add_course('Physics II w/o Calculus');
call sp_add_course('Physics for Everyday Life');
call sp_add_course('Patterns in Nature II');
call sp_add_course('Modern Physics');
call sp_add_course('Physics of Sound and Music');
call sp_add_course('Introduction to Astronomy');
call sp_add_course('Optics and Light');
call sp_add_course('LAB CANCELLATION (Include Note)');



source create_inventory.sql;
