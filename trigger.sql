-- DATABASE SELECTIE (of maak deze aan in je eigen omgeving)
CREATE DATABASE IF NOT EXISTS dbs;
USE dbs;

-- Tabel 1: klanten
CREATE TABLE IF NOT EXISTS klanten (
    id INT AUTO_INCREMENT PRIMARY KEY,
    naam VARCHAR(100),
    email VARCHAR(100)
);

-- Tabel 2: bestellingen
CREATE TABLE IF NOT EXISTS bestellingen (
    id INT AUTO_INCREMENT PRIMARY KEY,
    klant_id INT,
    product VARCHAR(100),
    bedrag DECIMAL(10,2),
    FOREIGN KEY (klant_id) REFERENCES klanten(id)
);

-- Tabel 3: logboek
CREATE TABLE IF NOT EXISTS logboek (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tabelnaam VARCHAR(50),
    bewerking VARCHAR(10),
    tijdstip DATETIME DEFAULT CURRENT_TIMESTAMP,
    oude_waarde TEXT,
    nieuwe_waarde TEXT
);

-- TRIGGERS VOOR 'klanten'
DELIMITER $$

CREATE TRIGGER trg_klanten_insert AFTER INSERT ON klanten
FOR EACH ROW
BEGIN
    INSERT INTO logboek (tabelnaam, bewerking, nieuwe_waarde)
    VALUES ('klanten', 'INSERT', CONCAT('naam=', NEW.naam, ', email=', NEW.email));
END$$

CREATE TRIGGER trg_klanten_update AFTER UPDATE ON klanten
FOR EACH ROW
BEGIN
    INSERT INTO logboek (tabelnaam, bewerking, oude_waarde, nieuwe_waarde)
    VALUES ('klanten', 'UPDATE',
            CONCAT('naam=', OLD.naam, ', email=', OLD.email),
            CONCAT('naam=', NEW.naam, ', email=', NEW.email));
END$$

CREATE TRIGGER trg_klanten_delete AFTER DELETE ON klanten
FOR EACH ROW
BEGIN
    INSERT INTO logboek (tabelnaam, bewerking, oude_waarde)
    VALUES ('klanten', 'DELETE', CONCAT('naam=', OLD.naam, ', email=', OLD.email));
END$$

-- TRIGGERS VOOR 'bestellingen'
CREATE TRIGGER trg_bestellingen_insert AFTER INSERT ON bestellingen
FOR EACH ROW
BEGIN
    INSERT INTO logboek (tabelnaam, bewerking, nieuwe_waarde)
    VALUES ('bestellingen', 'INSERT',
            CONCAT('klant_id=', NEW.klant_id, ', product=', NEW.product, ', bedrag=', NEW.bedrag));
END$$

CREATE TRIGGER trg_bestellingen_update AFTER UPDATE ON bestellingen
FOR EACH ROW
BEGIN
    INSERT INTO logboek (tabelnaam, bewerking, oude_waarde, nieuwe_waarde)
    VALUES ('bestellingen', 'UPDATE',
            CONCAT('klant_id=', OLD.klant_id, ', product=', OLD.product, ', bedrag=', OLD.bedrag),
            CONCAT('klant_id=', NEW.klant_id, ', product=', NEW.product, ', bedrag=', NEW.bedrag));
END$$

CREATE TRIGGER trg_bestellingen_delete AFTER DELETE ON bestellingen
FOR EACH ROW
BEGIN
    INSERT INTO logboek (tabelnaam, bewerking, oude_waarde)
    VALUES ('bestellingen', 'DELETE',
            CONCAT('klant_id=', OLD.klant_id, ', product=', OLD.product, ', bedrag=', OLD.bedrag));
END$$

DELIMITER ;
