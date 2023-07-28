CREATE TABLE Politician (
  VoterID NUMERIC(5) PRIMARY KEY,
  Name VARCHAR(15) NOT NULL,
  Address VARCHAR(50),
  City VARCHAR(20),
  ElectionsLost NUMERIC(2) CHECK (ElectionsLost >= 0)
);

INSERT INTO Politician (VoterID, Name, Address, City, ElectionsLost)
VALUES
  (10001, 'Mohan', '123, KRS Road', 'Mysore', 2),
  (10002, 'Ram', '56, Banashankari', 'Bangalore', 3),
  (10003, 'Eric', '980, BEML layout', 'Mysore', 1),
  (10004, 'William', '786, Vijayanagar', 'Bangalore', 7);

CREATE TABLE Party (
  PartyCode NUMERIC(3) PRIMARY KEY,
  Name VARCHAR(15) NOT NULL,
  HQ VARCHAR(15)
);

INSERT INTO Party (PartyCode, Name, HQ)
VALUES
  (101, 'Party One', 'Delhi'),
  (102, 'Party Two', 'Bombay'),
  (103, 'Party Three', NULL);

CREATE TABLE ElectionResult (
  Year NUMERIC(4),
  Constituency VARCHAR(20) CHECK (Constituency IN ('Bangalore South', 'Bangalore North', 'Mysore')),
  PartyCode NUMERIC(3) REFERENCES Party(PartyCode),
  VoterID NUMERIC(5) REFERENCES Politician(VoterID),
  Votes NUMERIC(6),
  PRIMARY KEY (Year, Constituency)
);

INSERT INTO ElectionResult (Year, Constituency, PartyCode, VoterID, Votes)
VALUES
  (1984, 'Bangalore South', 101, 10003, 12967),
  (1986, 'Mysore', 102, 10004, 80876),
  (1986, 'Bangalore South', 101, 10003, 100000),
  (1986, 'Bangalore North', 102, 10002, 7023),
  (1992, 'Mysore', 103, 10001, 602),
  (1992, 'Bangalore North', 101, 10004, 6021);

SELECT * FROM Politician;