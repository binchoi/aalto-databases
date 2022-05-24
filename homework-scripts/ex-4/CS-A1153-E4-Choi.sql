--ex-4 sql queries

--q3. Property(id, address, city, year, owner, insuranceValue) and Owner(ssNo, name, address)
--3a
DROP TABLE Property;
CREATE TABLE Property(
    id INTEGER PRIMARY KEY,
    address VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    year INTEGER CHECK (year>=1900 AND year<=2100) NOT NULL,
    owner CHAR(11) REFERENCES Owner(ssNo) NOT NULL,
    insuranceValue FLOAT CHECK (insuranceValue>=0.0) NOT NULL
);

DROP TABLE Owner;
CREATE TABLE Owner(
    ssNo CHAR(11) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL
);

--3b insertions
INSERT INTO Owner(ssNo,name,address)
VALUES
("12345678911", "John", "address 1"),
("12345678912", "John2", "address 2"),
("12345678913", "John3", "address 3"),
("12345678914", "John4", "address 4"),
("12345678915", "John5", "address 5"),
("12345678916", "John6", "address 6"),
("12345678917", "John7", "address 7"),
("12345678918", "John8", "address 8"),
("12345678919", "John9", "address 9"),
("12345678910", "John10", "address 0");

SELECT * FROM Owner;

INSERT INTO Property(id, address,city,year,owner,insuranceValue) 
VALUES
(1, "address 1", "CITY 1", 2008, "12345678910", 19.2),
(2, "address 2", "CITY 1", 2038, "12345678911", 190.2),
(3, "address 3", "CITY 1", 1908, "12345678911", 100.0),
(4, "address 4", "CITY 2", 1998, "12345678910", 200.0),
(5, "address 5", "CITY 1", 2028, "12345678915", 300.0),
(6, "address 6", "CITY 1", 2000, "12345678913", 400.0),
(7, "address 7", "CITY 4", 2007, "12345678910", 500.0),
(8, "address 8", "CITY 1", 2003, "12345678912", 77.77),
(9, "address 9", "CITY 5", 2028, "12345678915", 123.45),
(10, "address 10", "CITY 6", 2019, "12345678910", 19.3);

SELECT * FROM Property;

--3c
CREATE TRIGGER CityAllCaps
        BEFORE INSERT
            ON Property
      FOR EACH ROW
          WHEN (NEW.city! = upper(NEW.city) ) 
BEGIN
    INSERT INTO Property VALUES (
                             NEW.id,
                             NEW.address,
                             upper(NEW.city),
                             NEW.year,
                             NEW.owner,
                             NEW.insuranceValue
                         );
    SELECT RAISE(IGNORE);
END;
--test 3c
-- doesn't trigger CityAllCaps
INSERT INTO Property(id, address,city,year,owner,insuranceValue) 
VALUES
(999, "address 1", "CITY 1", 2008, "12345678910", 19.2);
-- triggers CityAllCaps
INSERT INTO Property(id, address,city,year,owner,insuranceValue) 
VALUES
(1000, "address 2", "ciTy 1", 2018, "12345678910", 19.1);



--3d
CREATE TRIGGER insuranceValueFloor
         AFTER UPDATE
            ON Property
      FOR EACH ROW
          WHEN (NEW.insuranceValue < OLD.insuranceValue * 0.75) 
BEGIN
    UPDATE Property
       SET insuranceValue = OLD.insuranceValue * 0.75
     WHERE id = NEW.id;
END;
--test 3d
-- doesn't trigger insuranceValueFloor
UPDATE Property SET insuranceValue = 70 WHERE id = 3;
-- triggers insuranceValueFloor
UPDATE Property SET insuranceValue = 175 WHERE id = 4;


--3e
DROP TRIGGER ownerDeleteProtection;
CREATE TRIGGER ownerDeleteProtection
        BEFORE DELETE
            ON Owner
      FOR EACH ROW
          WHEN EXISTS(
    SELECT 1
      FROM Owner, Property
     WHERE Property.owner=OLD.ssNo
)
BEGIN
    SELECT RAISE(IGNORE);
END;
-- test 3e
-- doesn't trigger ownerDeleteProtection
DELETE FROM Owner WHERE ssNo=="12345678918";
-- triggers ownerDeleteProtection
DELETE FROM Owner WHERE ssNo=="12345678910";

SELECT * FROM Owner;
DELETE FROM Owner WHERE Owner.ssNo="12345670000";

INSERT INTO Owner(ssNo,name,address)
VALUES
("12345670000", "Jfdfdffdohn", "address 100");

DELETE FROM Owner WHERE name="Jfdfdffdohn";
DELETE From Owner WHERE ssNo="12345670000";
SELECT ssNo FROM Owner;

--misc queries
SELECT upper(city) FROM Property WHERE city==lower(city);


SELECT * FROM Owner ;
SELECT COUNT(*) FROM Property WHERE Property.owner == "12345678910";


CREATE TABLE OwnerTest(
    ssNo CHAR(11) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL
);
INSERT INTO OwnerTest(ssNo,name,address)
VALUES
("12345670000", "Jfdfdffdohn", "address 100");
DELETE From OwnerTest WHERE ssNo = "12345670000";
Select * From OwnerTest;