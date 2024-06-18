delete from
(
select *
from medicinies M 
join medication_visit MV on M.M_ID=MV.M_ID
join  visit V  on MV.V_ID = V.V_ID
where v.date_of_visit BETWEEN TO_DATE('01/01/1900', 'DD/MM/YYYY') AND TO_DATE('01/01/2000', 'DD/MM/YYYY') and
     M.QUALITITY_AVAILABLE_IN_STOCK IN (select  M.QUALITITY_AVAILABLE_IN_STOCK
                                       from  medicinies M , Medication_Visit MV
                                       where M.QUALITITY_AVAILABLE_IN_STOCK <10))

                                     
      
/*Delete all medications provided during visits between the years 1900 and 2000 that have fewer than 10 items.*/



select * from medication_visit M where M.m_id=771
