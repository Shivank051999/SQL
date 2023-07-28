\\assignment 1
SELECT m.MID, m.Member_Name, m.Address
FROM Member m
WHERE m.MID IN (SELECT t.MID FROM Transaction t WHERE t.Return_date IS NULL);

SELECT c.Title FROM Collection c
JOIN Transaction t ON c.CID = t.CID
GROUP BY c.Title
HAVING COUNT(*) = 
(
    SELECT COUNT(*) FROM Transaction 
    GROUP BY CID 
    ORDER BY COUNT(*) DESC 
	FETCH FIRST 1 ROWS ONLY
);

SELECT c.Title, m.Member_Name
FROM Collection c
JOIN Transaction t ON c.CID = t.CID
JOIN Member m ON m.MID = t.MID
WHERE t.Issue_date = DATE '2007-02-03';

\\assignment 2
SELECT l.Loanno FROM Loan l
JOIN Customer_loan cl ON l.Loanno = cl.Loanno
JOIN Customer c ON c.CID = cl.CID
WHERE c.EmailID = 'Maya_s';

SELECT c.CName FROM Customer c
JOIN Customer_loan cl ON c.CID = cl.CID
GROUP BY c.CID, c.CName
HAVING COUNT(*) = 
(
    SELECT COUNT(*)
    FROM Customer_loan
    GROUP BY CID
    ORDER BY COUNT(*) DESC
	FETCH FIRST 1 ROWS ONLY
);

SELECT * FROM LOAN
SELECT l.Loan_Type, COUNT(*) AS "Number of People" FROM Loan l
JOIN Customer_loan cl ON l.Loanno = cl.Loanno
GROUP BY l.Loan_Type;

SELECT c.CName FROM Customer c
LEFT JOIN Customer_loan cl ON c.CID = cl.CID
WHERE cl.CID IS NULL;

\\assignment 3
SELECT * FROM Politician
WHERE Name LIKE '%a%' AND City = 'Bangalore';

SELECT p.Name AS "Politician Name", pt.Name AS "Party Name" FROM Politician p
JOIN ElectionResult er ON p.VoterID = er.VoterID
JOIN Party pt ON pt.PartyCode = er.PartyCode
WHERE er.Constituency = 'Mysore' AND er.Year = 1986;

SELECT p.* FROM Politician p
JOIN ElectionResult er ON p.VoterID = er.VoterID
WHERE er.Year > 1990
ORDER BY er.Votes DESC;

SELECT pt.Name AS "Party Name", pt.HQ, COUNT(*) AS "Total Wins" FROM Party pt
JOIN ElectionResult er ON pt.PartyCode = er.PartyCode
GROUP BY pt.PartyCode, pt.Name, pt.HQ;

\\assignment 4
SELECT t.* FROM Trainers t
JOIN Course_Delivery cd ON t.Trainer_ID = cd.Trainer_ID;

SELECT t.* FROM Trainers t
WHERE NOT EXISTS 
(
    SELECT c.Course_ID FROM Courses c
    WHERE NOT EXISTS 
	(
        SELECT * FROM Course_Delivery cd
        WHERE cd.Trainer_ID = t.Trainer_ID
          AND cd.Course_ID = c.Course_ID
    )
);

SELECT t.Trainer_Name, c.Course_Name FROM Trainers t
JOIN Course_Delivery cd ON t.Trainer_ID = cd.Trainer_ID
JOIN Courses c ON c.Course_ID = cd.Course_ID
WHERE cd.Course_Date > DATE '2006-11-15';

SELECT c.Course_Name FROM Courses c
JOIN Course_Delivery cd ON c.Course_ID = cd.Course_ID
GROUP BY c.Course_ID, c.Course_Name
HAVING COUNT(DISTINCT cd.Trainer_ID) > 1;

\\assignment 5
SELECT bd.AID, a.AName, SUM(bd.SeatsBooked) AS "Total Travelers" FROM Booking_Details bd
JOIN Agent a ON bd.AID = a.AID
WHERE bd.DateOfJourney = DATE '2006-12-04'
GROUP BY bd.AID, a.AName;

SELECT DISTINCT a.AName, a.ALocation FROM Agent a
JOIN Booking_Details bd ON a.AID = bd.AID
JOIN Route r ON bd.RID = r.RID
WHERE r.Source = 'MYS' AND r.Destination = 'BANG';

SELECT r.Source, r.Destination, a.AName FROM Route r
JOIN Booking_Details bd ON r.RID = bd.RID
JOIN Agent a ON bd.AID = a.AID
WHERE EXTRACT(MONTH FROM bd.DateOfJourney) = 12;

SELECT r.* FROM Route r
JOIN Booking_Details bd ON r.RID = bd.RID
GROUP BY r.RID, r.Source, r.Destination, r.NoOfSeats
HAVING SUM(bd.SeatsBooked) > 40;
