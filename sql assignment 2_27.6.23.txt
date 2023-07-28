CREATE TABLE Customer (
  CID NUMERIC(4) CONSTRAINT PK_Customer PRIMARY KEY CHECK (CID >= 1000),
  CName VARCHAR(30) NOT NULL,
  EmailID VARCHAR(30) UNIQUE
);

INSERT INTO Customer (CID, CName, EmailID)
VALUES
  (1000, 'Rajesh', 'Rajesh_R'),
  (1001, 'Maya', 'Maya_s'),
  (1002, 'Ashok', 'Ashok'),
  (1003, 'KumaraVel', 'Kumar_Vel'),
  (1004, 'Mahesh', 'Mahesh_m');

CREATE TABLE Loan (
  Loanno VARCHAR(5) CONSTRAINT PK_Loan PRIMARY KEY CHECK (Loanno LIKE 'L%'),
  Ldate DATE NOT NULL,
  Amount NUMERIC(10,2) NOT NULL,
  Type VARCHAR(20) CHECK (Type IN ('personal', 'two wheeler', 'house loan'))
);

INSERT INTO Loan (Loanno, Ldate, Amount, Type)
VALUES
  ('L0001', TO_DATE('20-JAN-2006', 'DD-MON-YYYY'), 45000, 'personal'),
  ('L0002', TO_DATE('02-FEB-2004', 'DD-MON-YYYY'), 35000, 'two wheeler'),
  ('L0003', TO_DATE('01-MAR-2005', 'DD-MON-YYYY'), 500000, 'house loan'),
  ('L0004', TO_DATE('14-MAY-2005', 'DD-MON-YYYY'), 100000, 'personal'),
  ('L0005', TO_DATE('16-JUL-2004', 'DD-MON-YYYY'), 80000, 'personal'),
  ('L0006', TO_DATE('30-DEC-2005', 'DD-MON-YYYY'), 700000, 'house loan');


CREATE TABLE Customer_loan (
  CID NUMERIC(4),
  Loanno VARCHAR(5),
  CONSTRAINT PK_Customer_loan PRIMARY KEY (CID, Loanno),
  CONSTRAINT FK_Customer_loan_Customer FOREIGN KEY (CID) REFERENCES Customer (CID),
  CONSTRAINT FK_Customer_loan_Loan FOREIGN KEY (Loanno) REFERENCES Loan (Loanno)
);

INSERT INTO Customer_loan (CID, Loanno)
VALUES
  (1001, 'L0001'),
  (1002, 'L0001'),
  (1003, 'L0004'),
  (1002, 'L0004'),
  (1003, 'L0006'),
  (1004, 'L0003'),
  (1002, 'L0005'),
  (1003, 'L0005'),
  (1001, 'L0002'),
  (1004, 'L0002');

SELECT * FROM Customer;