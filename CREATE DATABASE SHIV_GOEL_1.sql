CREATE DATABASE SHIV_GOEL_1
CREATE TABLE shiv_1(urn numeric(12), student_name varchar(20), father_name varchar(20));
INSERT INTO shiv_1(urn, student_name, father_name)
VALUES
(11, 'ram', 'suresh'),
(12, 'aman', 'prem'),
(13, 'prem', 'chand');

SELECT * FROM shiv_1
TRUNCATE shiv_1

UPDATE shiv_1
SET student_name = 'raman'
WHERE urn = 13; 

DELETE FROM shiv_1
WHERE urn = 13;

ALTER TABLE shiv_1
ADD COLUMN pincode numeric(6);

ALTER TABLE shiv_1
DROP COLUMN pincode;

ALTER TABLE shiv_1
ADD COLUMN pincode numeric(6);

ALTER TABLE shiv_1
DROP COLUMN pincode;
ALTER TABLE shiv_1
ADD COLUMN pincode numeric(6);

ALTER TABLE shiv_1
DROP COLUMN pincode;

SELECT DISTINCT student_name FROM shiv_1;
