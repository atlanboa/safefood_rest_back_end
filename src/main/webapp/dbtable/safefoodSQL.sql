create database safefood;
use safefood;

CREATE TABLE food(
	code varchar(50) primary key,
    name varchar(50),
    supportpereat varchar(50),
    calory varchar(50),
    carbo varchar(50),
    protein varchar(50),
    fat varchar(50),
    sugar varchar(50),
    natrium varchar(50),
    chole varchar(50),
    fattyacid varchar(50),
    transfat varchar(50),
    maker varchar(50),
    material varchar(500),
    img varchar(50),
    allergy varchar(50)
);

CREATE TABLE userInfo(
	id VARCHAR(50) PRIMARY KEY,
    pass VARCHAR(30) NOT NULL,
    name VARCHAR(30) NOT NULL,
    address VARCHAR(50) NOT NULL,
    phone VARCHAR(30) NOT NULL,
    allergy VARCHAR(50)
);

CREATE TABLE notice(
	no INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    content TEXT,
    writer VARCHAR(50) NOT NULL,
    hit INT NOT NULL,
    time DATE NOT NULL
);