CREATE TABLE Route (
  RID VARCHAR(4),
  Source VARCHAR(5) NOT NULL,
  Destination VARCHAR(5) NOT NULL,
  NoOfSeats NUMERIC(3) CHECK (NoOfSeats BETWEEN 0 AND 50),
  CONSTRAINT PK_Route PRIMARY KEY (RID),
  CONSTRAINT CK_Route_RID CHECK (RID LIKE 'R%')
);

INSERT INTO Route (RID, Source, Destination, NoOfSeats)
VALUES
  ('R001', 'MYS', 'BANG', 50),
  ('R002', 'MYS', 'TVM', 40),
  ('R003', 'MYS', 'CHN', 30),
  ('R004', 'MYS', 'PUNE', 45);

CREATE TABLE Agent (
  AID VARCHAR(4),
  AName VARCHAR(25) NOT NULL,
  ALocation VARCHAR(15) CHECK (ALocation IN ('Gokulam', 'Central City', 'VNagar', 'SPuram')),
  CONSTRAINT PK_Agent PRIMARY KEY (AID),
  CONSTRAINT CK_Agent_AID CHECK (AID LIKE 'A%')
);

INSERT INTO Agent (AID, AName, ALocation)
VALUES
  ('A001', 'John', 'Gokulam'),
  ('A002', 'Luke', 'VNagar'),
  ('A003', 'Mark', 'Central City'),
  ('A004', 'Mathew', 'SPuram');

CREATE TABLE Booking_Details (
  RID VARCHAR(4) REFERENCES Route (RID),
  AID VARCHAR(4) REFERENCES Agent (AID),
  SeatsBooked NUMERIC(3) CHECK (SeatsBooked BETWEEN 1 AND 50),
  DateOfJourney DATE NOT NULL,
  CONSTRAINT PK_Booking_Details PRIMARY KEY (RID, AID),
  CONSTRAINT CK_Booking_Details_SeatsBooked CHECK (SeatsBooked BETWEEN 1 AND 50)
);

INSERT INTO Booking_Details (RID, AID, SeatsBooked, DateOfJourney)
VALUES
  ('R001', 'A001', 20, TO_DATE('12-Jan-2006', 'DD-MON-YYYY')),
  ('R001', 'A004', 40, TO_DATE('20-Jan-2006', 'DD-MON-YYYY')),
  ('R002', 'A003', 30, TO_DATE('10-Dec-2006', 'DD-MON-YYYY')),
  ('R003', 'A003', 15, TO_DATE('04-Dec-2006', 'DD-MON-YYYY')),
  ('R003', 'A004', 25, TO_DATE('04-Dec-2006', 'DD-MON-YYYY')),
  ('R004', 'A003', 45, TO_DATE('12-Dec-2006', 'DD-MON-YYYY'));

SELECT * FROM Booking_Details;