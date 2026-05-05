-- Question 1.
ALTER TABLE BookingItems
ADD CONSTRAINT Customers_FK_BID
FOREIGN KEY (BookID) REFERENCES Bookings(ID);

-- Question 2.
SELECT b.ID, b.bookDate, c.Name
FROM Bookings b, Customers c, BookingItems bi, Inventory i
WHERE c.ID = b.custID AND
      b.ID = bi.bookID AND
      i.ID = bi.itemID AND
      (i.description = 'Cadillac' OR i.description = 'Mustang')
ORDER BY b.ID;

-- Question 3.
SELECT c.Name, c.email, SUM(i.price)
FROM Bookings b, Customers c, BookingItems bi, Inventory i
WHERE c.ID = b.custID AND
      b.ID = bi.bookID AND
      i.ID = bi.itemID AND
      b.bookDate < SYSDATE
GROUP BY c.Name, c.email
HAVING SUM(i.price) > 200
ORDER BY C.name;

-- Question 4.
SELECT i.Type, Count(BookID)
FROM BookingItems bi, Inventory i
WHERE i.ID = bi.itemID (+)
GROUP BY i.Type
ORDER BY i.Type;

SELECT i.Type, COUNT(bi.BookID)
FROM Inventory i
LEFT OUTER JOIN BookingItems bi
  ON i.ID = bi.itemID
GROUP BY i.Type 
ORDER BY i.Type;

--Question 5.
SELECT ID, name, email
FROM Customers 
WHERE ID NOT IN (SELECT b.custID
             FROM Bookings b, BookingItems bi, Inventory i
             WHERE bi.bookID = b.ID AND
                   bi.itemID = i.ID AND
                   i.type = 'Car')
ORDER BY ID, email;

--Question 6.
SELECT c.ID, c.email, COUNT(tmp.ItemID) Items, NVL(SUM(tmp.price),0) Spend
FROM Customers c, (SELECT bi.ItemID, i.price, b.custID
                   FROM Bookings b, BookingItems bi, Inventory i
                   WHERE b.ID = bi.bookID AND
                         i.ID = bi.itemID AND
                         i.type = 'SUV') tmp
WHERE c.ID = tmp.custID (+)
GROUP BY c.ID, c.email
ORDER BY c.ID;;


SELECT 
    c.ID, 
    c.email, 
    COUNT(tmp.ItemID) AS Items, 
    NVL(SUM(tmp.price), 0) AS Spend
FROM Customers c
LEFT JOIN (
    SELECT 
        bi.ItemID, 
        i.price, 
        b.custID
    FROM Bookings b
    JOIN BookingItems bi 
        ON b.ID = bi.bookID
    JOIN Inventory i 
        ON i.ID = bi.itemID
    WHERE i.type = 'SUV'
) tmp
ON c.ID = tmp.custID
GROUP BY c.ID, c.email
ORDER BY c.ID;

-- Question 7

SELECT constraint_name
FROM user_constraints
WHERE table_name = 'APPOINTMENTS' AND constraint_type = 'R';


-- Question 8

SELECT a.appID || ' - ' || 
          SUBSTR(c.name,1,1) || '.' || SUBSTR(c.name,INSTR(c.name,' ')) ||
          ' is receiving a ' ||
          DECODE(SUBSTR(a.SID,4,3), 'PHY', 'Physical',
                                    'MED', 'Medical',
                                    'TRE', 'Technical Treatment') ||
          ' service from therapist ' || therapist
FROM Clients c, Appointments a
WHERE c.CID = a.CID  
ORDER BY a.appID;


-- Question 9

SELECT Therapist,
       SUM(DECODE(SUBSTR(a.SID,4,3), 'PHY', 1, 0)) Physical,
       SUM(DECODE(SUBSTR(a.SID,4,3), 'MED', 1, 0)) Medical,
       SUM(DECODE(SUBSTR(a.SID,4,3), 'TRE', 1, 0)) Tech_Treatment,
       '$' || SUM(Price) Income
FROM Clients c, Services s, Appointments a
WHERE c.CID = a.CID  AND 
      s.SID = a.SID  AND
      c.insurance = 'NI'
GROUP BY Therapist
ORDER BY Therapist;
