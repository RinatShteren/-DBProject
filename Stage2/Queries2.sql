
select d_Name, count(m_id) AS count_of_Medication 
from Medication_Visit M,Doctor_Visit D,doctor DR
 where M.v_id = D.V_ID and DR.D_ID = D.D_ID 
 group by d_Name
/*
The query returns how many medications each doctor prescribed
with parameters
*/
