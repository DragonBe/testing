-- Setting up an account for our test cases
CREATE DATABASE `in2it_test`;

CREATE USER 'in2it_test'@'localhost' IDENTIFIED BY 'test123';
CREATE USER 'in2it_test'@'192.168.56.1' IDENTIFIED BY 'test123';

GRANT SELECT,INSERT,UPDATE,DELETE ON `in2it_test`.* TO 'in2it_test'@'localhost';
GRANT SELECT,INSERT,UPDATE,DELETE ON `in2it_test`.* TO 'in2it_test'@'192.168.56.1';

USE `in2it_test`;

