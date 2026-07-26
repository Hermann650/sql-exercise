--DDL
CREATE DATABASE announcement_db;
USE announcement_db;
CREATE TABLE announcement (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    number VARCHAR(60) NOT NULL UNIQUE,
    photoURL TEXT NOT NULL
);

CREATE TABLE signage (
    id INT AUTO_INCREMENT PRIMARY KEY,
    event_date  DATE NOT NULL,
    location VARCHAR(100) NOT NULL,
    photoURL TEXT NOT NULL,
    name CHAR(40) NOT NULL,
    announcement_id INT NOT NULL,
    FOREIGN KEY (announcement_id) REFERENCES announcement(id)
);

CREATE TABLE content (
    id INT AUTO_INCREMENT PRIMARY KEY,
    event_date  DATE NOT NULL,
    location VARCHAR(100) NOT NULL,
    event_time TIME NOT NULL,
    day ENUM('SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'),
    uniform CHAR(30) NOT NULL,
    openingText TEXT NOT NULL,
    closing TEXT NOT NULL,
    announcement_id INT NOT NULL,
    FOREIGN KEY (announcement_id) REFERENCES announcement(id)
);