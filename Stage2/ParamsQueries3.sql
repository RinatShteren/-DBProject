SELECT 
    D.D_ID, 
    D.d_name, 
    D.speciallization, 
    COUNT(V.V_ID) AS num_of_visits
FROM 
    Doctor D
JOIN 
    Doctor_Visit DV ON D.D_ID = DV.D_ID
JOIN 
    Visit V ON DV.V_ID = V.V_ID
GROUP BY 
    D.D_ID, 
    D.d_name, 
    D.speciallization
HAVING COUNT(V.V_ID) > &<name = "enter_a_num"
                         type = integer
                         hint=" only patients with this number of visits or above will be listed">
ORDER BY 
    num_of_visits DESC;
