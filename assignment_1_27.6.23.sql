CREATE TABLE Collection (
  CID VARCHAR(5) PRIMARY KEY,
  Title VARCHAR(20) NOT NULL
);

INSERT INTO Collection (CID, Title)
VALUES
  ('CD001', 'TOM AND JERRY'),
  ('CD002', 'HUMTUM'),
  ('CD003', 'ROCKY'),
  ('CD004', 'RAMBO'),
  ('CD005', 'THE MYTH');
CREATE TABLE Member (
  MID VARCHAR(5) PRIMARY KEY,
  Member_Name VARCHAR(15) NOT NULL,
  Address VARCHAR(25) NOT NULL
);

INSERT INTO Member (MID, Member_Name, Address)
VALUES
  ('M001', 'S.K.Ahuja', 'Hudson Nagar'),
  ('M002', 'M.Shantiraman', 'Bandra West'),
  ('M003', 'K.L.Dsouza', 'Bandra East'),
  ('M004', 'James Dan', 'Majestic'),
  ('M005', 'Kim Jouang', 'LBS');
CREATE TABLE Transaction (
  TId NUMERIC(6) PRIMARY KEY,
  CID VARCHAR(20),
  MID VARCHAR(5),
  Issue_date DATE NOT NULL,
  Return_date DATE,
  FOREIGN KEY (CID) REFERENCES Collection(CID),
  FOREIGN KEY (MID) REFERENCES Member(MID)
);

INSERT INTO Transaction (TId, CID, MID, Issue_date, Return_date)
VALUES
  (10000, 'CD001', 'M001', TO_DATE('21-JAN-2007', 'DD-MON-YYYY'), TO_DATE('31-JAN-2007', 'DD-MON-YYYY')),
  (10001, 'CD002', 'M004', TO_DATE('22-JAN-2007', 'DD-MON-YYYY'), TO_DATE('2-FEB-2007', 'DD-MON-YYYY')),
  (10002, 'CD001', 'M002', TO_DATE('1-FEB-2007', 'DD-MON-YYYY'), TO_DATE('4-FEB-2007', 'DD-MON-YYYY')),
  (10003, 'CD002', 'M001', TO_DATE('3-FEB-2007', 'DD-MON-YYYY'), TO_DATE('4-FEB-2007', 'DD-MON-YYYY')),
  (10004, 'CD004', 'M003', TO_DATE('19-FEB-2007', 'DD-MON-YYYY'), NULL);

SELECT * FROM TRANSACTION;