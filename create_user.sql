CREATE DATABASE web2012 DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

GRANT ALL ON web2012.* TO 'web'@'127.0.0.1' IDENTIFIED BY 'asdf';

use web2012;


CREATE TABLE users (
	id INT AUTO_INCREMENT PRIMARY KEY, 
	userid VARCHAR(100) NOT NULL UNIQUE,
	pwd VARCHAR(255) NOT NULL, 
	name VARCHAR(100),
	year VARCHAR(50),
	gender VARCHAR(100) NOT NULL,
	status VARCHAR(300)
);

CREATE TABLE location (
	user_id VARCHAR(100) PRIMARY KEY, 
	lat VARCHAR(300),
	lng VARCHAR(300),
	login_flag int(1)
);