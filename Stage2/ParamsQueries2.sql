-- Returns room details and the number of patients currently in each room, filtered by floor and room availability
SELECT 
    R.room_number, 
    R.Num_of_Beds, 
    R.Availability, 
    D.Floor,
    COUNT(P.P_ID) AS Num_of_Patients
FROM 
    Room R natural join Department D
LEFT JOIN 
    Patient P ON R.room_number = P.room_number
WHERE 
    D.Floor = &<name= "floor_num" type = integer list = "select distinct floor from Department">
    AND R.Availability = &<name=" Availability" type = string list = "select distinct  Availability  from Room">

GROUP BY 
    R.room_number, R.Num_of_Beds, R.Availability, D.Floor
ORDER BY 
    Num_of_Patients DESC
