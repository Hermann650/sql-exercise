CREATE DATABASE hospital_db;
CREATE TABLE dokter (
        id INT AUTO_INCREMENT PRIMARY KEY,
        fullname VARCHAR(75) NOT NULL,
        spesialis VARCHAR(50) NOT NULL
)
CREATE TABLE pasien (
        id INT AUTO_INCREMENT PRIMARY KEY,
    	dokter_id INT NOT NULL,
        FOREIGN KEY (dokter_id) REFERENCES dokter(id),
        fullname VARCHAR(75) NOT NULL,
        pekerjaan VARCHAR(50) NULL,
        tanggal_lahir DATE NOT NULL,
        alamat VARCHAR(100) NOT NULL
)
ALTER TABLE pasien DROP COLUMN pekerjaan;
ALTER TABLE pasien DROP COLUMN fullname;
ALTER TABLE dokter DROP COLUMN fullname;
ALTER TABLE pasien ADD first_name VARCHAR(100) NOT NULL;
ALTER TABLE pasien ADD last_name VARCHAR(100) NOT NULL;
ALTER TABLE dokter ADD first_name VARCHAR(100) NOT NULL;
ALTER TABLE dokter ADD last_name VARCHAR(100) NOT NULL;
ALTER TABLE pasien MODIFY alamat CHAR(100) NOT NULL;
ALTER TABLE pasien ADD jenis_kelamin ENUM('Pria', 'Wanita');