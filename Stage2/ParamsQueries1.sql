
select 
  P.P_ID,
  P.STATUS,
  P.P_NAME,
  P.DATE_OF_HOSPITALIZATION,
  P.DATE_OF_RELEASE
from patient P 
JOIN 
     visit V ON V.P_ID= P.P_ID
where P.STATUS = &<name="patient status"
                type=string
                list ="select  distinct STATUS from patient"
                 hint=" only patients with this status will be listed">
        AND V.Date_of_visit = TO_DATE('&visit_date', 'DD/MM/YYYY') 


