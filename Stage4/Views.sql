-- Hospital_View

CREATE VIEW Hospital_View AS
SELECT distinct
    Hospital.Hospital_ID,
    Hospital.Hospital_Name,
    Department.DEP_name,
    Department.floor,
    Room.room_number,
    Patient.p_name,
    Patient.status,
    Visit.date_of_visit,
    Doctor.d_name,
    Medicinies.n_name
FROM 
    Hospital
JOIN Department ON Hospital.Hospital_ID = Department.Hospital_ID
JOIN Room ON Department.DEP_ID = Room.DEP_ID
JOIN Patient ON Room.room_number = Patient.room_number
JOIN Visit ON Patient.P_ID = Visit.P_ID
JOIN Doctor_Visit ON Visit.V_ID = Doctor_Visit.V_ID
JOIN Doctor ON Doctor_Visit.D_ID = Doctor.D_ID
JOIN Medication_Visit ON Visit.V_ID = Medication_Visit.V_ID
JOIN Medicinies ON Medication_Visit.M_ID = Medicinies.M_ID;


select * from hospital_view;

SELECT distinct p_name, status, room_number
FROM Hospital_View
WHERE Hospital_name = 'Hope Hospital' AND DEP_name = 'General Surgery';


SELECT distinct p_name, status
FROM Hospital_View
WHERE Hospital_Name = 'Hope Hospital';

--BloodBank_View

CREATE VIEW BloodBank_View AS
SELECT 
    bloodbank.BANKID,
    bloodbank.MANAGER,
    bloodbank.CITY,
    blood.BLOODTYPE,
    blood.SIGN,
    order_.ORDERID,
    order_.ORDERDATE,
    order_.AMOUNT,
    donor.FULLNAME,
    donor.GENDER,
    donation.DONATIONDATE
FROM 
    bloodbank
JOIN order_ ON bloodbank.BANKID = order_.BANKID
JOIN blood ON order_.BLOODID = blood.BLOODID
JOIN donor ON blood.BLOODID = donor.BLOODID
JOIN donation ON donor.DONORID = donation.DONORID;


select * from BloodBank_View;

SELECT ORDERID, ORDERDATE, AMOUNT
FROM BloodBank_View
WHERE BANKID = 1;

SELECT FULLNAME, GENDER, DONATIONDATE
FROM BloodBank_View
WHERE CITY = 'Bnei Brak';



