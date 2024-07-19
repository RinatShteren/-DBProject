-- יצירת טבלת Hospital
CREATE TABLE Hospital (
    Hospital_ID INT NOT NULL PRIMARY KEY,
    Manager VARCHAR(30) NOT NULL,
    Phone_Number INT NOT NULL,
    Address VARCHAR(100) NOT NULL,
    Hospital_Name VARCHAR(50) NOT NULL
);

-- הוספת עמודת Hospital_ID בטבלת order_
ALTER TABLE order_
ADD Hospital_ID INT;

-- הוספת קשר מפתח זר בין order_ ל-Hospital
ALTER TABLE order_
ADD CONSTRAINT fk_order_hospital
FOREIGN KEY (Hospital_ID) REFERENCES Hospital(Hospital_ID);

--פונקציה לעדכון השדה של HOSPITAL_ID 
CREATE OR REPLACE FUNCTION get_random_hospital_id
RETURN NUMBER
IS
  v_hospital_id Hospital.Hospital_ID%TYPE;
BEGIN
  SELECT Hospital_ID
  INTO v_hospital_id
  FROM (SELECT Hospital_ID FROM Hospital ORDER BY DBMS_RANDOM.VALUE)
  WHERE ROWNUM = 1;

  RETURN v_hospital_id;
END;


--תוכנית ראשית לעדכון השדה בהזמנה
DECLARE
  CURSOR order_cursor IS SELECT ORDERID FROM order_;
  v_order_id order_.ORDERID%TYPE;
BEGIN
  FOR order_rec IN order_cursor LOOP
    v_order_id := order_rec.ORDERID;
    UPDATE order_
    SET Hospital_ID = get_random_hospital_id()
    WHERE ORDERID = v_order_id;
  END LOOP;
  COMMIT;
END;

-- הוספת עמודת Hospital_ID בטבלת department
ALTER TABLE department
ADD Hospital_ID INT;

-- הוספת קשר מפתח זר בין department ל-Hospital
ALTER TABLE department
ADD CONSTRAINT fk_department_hospital
FOREIGN KEY (Hospital_ID) REFERENCES Hospital(Hospital_ID);

-- מחיקת עמודת HOSPITAL מטבלת order_
ALTER TABLE order_
DROP COLUMN HOSPITAL;

-- עדכון טבלת department עם Hospital_ID קבוע 14
UPDATE department
SET Hospital_ID = 14;

INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(1, 'John Doe', 1234567890, '123 Main St, City, Country', 'General Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(2, 'Jane Smith', 2345678901, '456 Elm St, City, Country', 'City Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(3, 'Jim Brown', 3456789012, '789 Oak St, City, Country', 'Regional Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(4, 'Lucy Gray', 4567890123, '101 Maple St, City, Country', 'University Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(5, 'Sam Green', 5678901234, '202 Pine St, City, Country', 'Central Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(6, 'Anna White', 6789012345, '303 Cedar St, City, Country', 'Community Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(7, 'Robert Black', 7890123456, '404 Birch St, City, Country', 'Memorial Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(8, 'Emily Blue', 8901234567, '505 Spruce St, City, Country', 'Children''s Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(9, 'Tom Yellow', 9012345678, '606 Fir St, City, Country', 'Women''s Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(10, 'Susan Red', 9123456789, '707 Willow St, City, Country', 'Veterans Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(11, 'Chris Orange', 1023456789, '808 Poplar St, City, Country', 'St. Mary''s Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(12, 'Katie Purple', 1123456789, '909 Walnut St, City, Country', 'St. John''s Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(13, 'Adam Gold', 1223456789, '1010 Chestnut St, City, Country', 'Mercy Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(14, 'Sophie Silver', 1323456789, '1111 Aspen St, City, Country', 'Hope Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(15, 'Nick Bronze', 1423456789, '1212 Redwood St, City, Country', 'Faith Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(16, 'Laura Copper', 1523456789, '1313 Sequoia St, City, Country', 'Grace Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(17, 'Daniel Platinum', 1623456789, '1414 Dogwood St, City, Country', 'Charity Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(18, 'Megan Iron', 1723456789, '1515 Magnolia St, City, Country', 'St. Luke''s Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(19, 'Kevin Steel', 1823456789, '1616 Cypress St, City, Country', 'St. Paul''s Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(20, 'Ella Nickel', 1923456789, '1717 Sycamore St, City, Country', 'St. Peter''s Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(21, 'Brian Zinc', 2023456789, '1818 Hickory St, City, Country', 'Good Samaritan Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(22, 'Rachel Lead', 2123456789, '1919 Willow St, City, Country', 'Holy Cross Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(23, 'James Mercury', 2223456789, '2020 Pine St, City, Country', 'Holy Family Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(24, 'Amanda Cobalt', 2323456789, '2121 Oak St, City, Country', 'Sacred Heart Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(25, 'David Titanium', 2423456789, '2222 Maple St, City, Country', 'Blessed Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(26, 'Linda Chromium', 2523456789, '2323 Elm St, City, Country', 'Providence Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(27, 'Michael Manganese', 2623456789, '2424 Fir St, City, Country', 'Saint Francis Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(28, 'Jessica Carbon', 2723456789, '2525 Cedar St, City, Country', 'Saint Joseph Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(29, 'George Silicon', 2823456789, '2626 Birch St, City, Country', 'Saint George Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(30, 'Lisa Boron', 2923456789, '2727 Spruce St, City, Country', 'Saint Thomas Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(31, 'Peter Neon', 3023456789, '2828 Willow St, City, Country', 'Saint Anne Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(32, 'Karen Argon', 3123456789, '2929 Pine St, City, Country', 'Saint Michael Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(33, 'Paul Krypton', 3223456789, '3030 Oak St, City, Country', 'Saint Patrick Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(34, 'Alice Xenon', 3323456789, '3131 Maple St, City, Country', 'Saint Vincent Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(35, 'Joe Radon', 3423456789, '3232 Elm St, City, Country', 'Saint Lawrence Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(36, 'Betty Francium', 3523456789, '3333 Fir St, City, Country', 'Saint Claire Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(37, 'Henry Radium', 3623456789, '3434 Cedar St, City, Country', 'Saint Elizabeth Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(38, 'Nancy Actinium', 3723456789, '3535 Birch St, City, Country', 'Saint Monica Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(39, 'Victor Thorium', 3823456789, '3636 Spruce St, City, Country', 'Saint Gabriel Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(40, 'Eve Protactinium', 3923456789, '3737 Willow St, City, Country', 'Saint Gregory Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(41, 'Oscar Uranium', 4023456789, '3838 Pine St, City, Country', 'Saint Philip Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(42, 'Grace Neptunium', 4123456789, '3939 Oak St, City, Country', 'Saint Nicholas Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(43, 'Tom Plutonium', 4223456789, '4040 Maple St, City, Country', 'Saint Andrew Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(44, 'Eva Americium', 4323456789, '4141 Elm St, City, Country', 'Saint Martha Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(45, 'Mark Curium', 4423456789, '4242 Fir St, City, Country', 'Saint Helena Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(46, 'Rose Berkelium', 4523456789, '4343 Cedar St, City, Country', 'Saint Barbara Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(47, 'Jack Californium', 4623456789, '4444 Birch St, City, Country', 'Saint David Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(48, 'Cindy Einsteinium', 4723456789, '4545 Spruce St, City, Country', 'Saint Martin Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(49, 'Harry Fermium', 4823456789, '4646 Willow St, City, Country', 'Saint Peter Hospital');
INSERT INTO Hospital (Hospital_ID, Manager, Phone_Number, Address, Hospital_Name) VALUES
(50, 'Julie Mendelevium', 4923456789, '4747 Pine St, City, Country', 'Saint Paul Hospital');






