-- Returns patient details and their visit details in a specific department between requested dates, including patients without visits

SELECT    
    P.P_ID, 
    P.P_name, 
    P.Address, 
    P.p_phone, 
    P.Date_of_Birth, 
    P.Date_of_hospitalization, 
    P.Date_of_release, 
    P.Status,
    D.Dep_name, 
    D.Floor,
    V.V_ID, 
    V.Date_of_visit, 
    DV.D_ID, 
    Doc.d_name AS Doctor_name
FROM 
    Patient P,Department D ,Visit V 
LEFT JOIN 
    Doctor_Visit DV ON V.V_ID = DV.V_ID
LEFT JOIN 
    Doctor Doc ON DV.D_ID = Doc.D_ID
WHERE 
    D.Dep_name = &<name="Dep_name" type = string>
    AND V.Date_of_visit BETWEEN  TO_DATE('&start_date', 'DD/MM/YYYY') and TO_DATE('&end_date', 'DD/MM/YYYY')

