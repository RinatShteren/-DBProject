select n_name , MM.QUALITITY_AVAILABLE_IN_STOCK
from medicinies MM,(
     select M.m_id
     from visit V, medication_visit MV, medicinies M
     where  TO_DATE(V.DATE_OF_VISIT, 'DD/MM/YYYY') > TO_DATE('01/01/2000', 'DD/MM/YYYY') and V.V_ID=MV.V_ID and M.M_ID = MV.M_ID)DATES
where MM.QUALITITY_AVAILABLE_IN_STOCK<10 and MM.M_ID = DATES.M_ID


/*medications 
with low avilebility and pruduct after 01/01/2000 */
