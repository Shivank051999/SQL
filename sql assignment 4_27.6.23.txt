CREATE TABLE Trainers (
  Trainer_ID NUMERIC(6),
  Trainer_Name VARCHAR(20) NOT NULL,
  Location VARCHAR(12) CHECK (Location IN ('Bangalore', 'Mysore')),
  CONSTRAINT PK_Trainers PRIMARY KEY (Trainer_ID),
  CONSTRAINT CK_Trainers_Location CHECK (Location = 'Bangalore' OR Location = 'Mysore')
);

INSERT INTO Trainers (Trainer_ID, Trainer_Name, Location)
VALUES
  (5990, 'Sundar', 'Mysore'),
  (10009, 'Seema', 'Bangalore'),
  (59912, 'Mahesh', 'Bangalore'),
  (7688, 'Das', 'Mysore');

CREATE TABLE Courses (
  Course_ID CHAR(2),
  Course_Name VARCHAR(12) NOT NULL,
  Credit_points NUMERIC(2) CHECK (Credit_points > 0),
  CONSTRAINT PK_Courses PRIMARY KEY (Course_ID),
  CONSTRAINT CK_Courses_CreditPoints CHECK (Credit_points > 0)
);

INSERT INTO Courses (Course_ID, Course_Name, Credit_points)
VALUES
  ('C1', 'CHSSC', 5),
  ('C2', 'PF', 10),
  ('C3', 'RDBMS', 5);

CREATE TABLE Course_Delivery (
  Trainer_ID NUMERIC(6) REFERENCES Trainers (Trainer_ID),
  Course_ID CHAR(2) REFERENCES Courses (Course_ID),
  Course_Date DATE,
  CONSTRAINT PK_Course_Delivery PRIMARY KEY (Trainer_ID, Course_ID, Course_Date)
);

INSERT INTO Course_Delivery (Trainer_ID, Course_ID, Course_Date)
VALUES
  (59912, 'C3', TO_DATE('01-NOV-2006', 'DD-MON-YYYY')),
  (5990, 'C1', TO_DATE('10-NOV-2006', 'DD-MON-YYYY')),
  (5990, 'C2', TO_DATE('21-NOV-2006', 'DD-MON-YYYY')),
  (7688, 'C3', TO_DATE('11-NOV-2006', 'DD-MON-YYYY')),
  (5990, 'C3', TO_DATE('12-NOV-2006', 'DD-MON-YYYY')),
  (59912, 'C1', TO_DATE('28-NOV-2006', 'DD-MON-YYYY'));

SELECT * FROM Trainers;