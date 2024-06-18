delete from
(
select
       P.DATE_OF_RELEASE,p.p_name ,d.dep_name
from patient P,department D, room R
where TO_DATE(date_of_release, 'DD/MM/YYYY') < TO_DATE('01/01/2030', 'DD/MM/YYYY')
      and P.ROOM_NUMBER=R.ROOM_NUMBER and R.DEP_ID=D.DEP_ID and  D.DEP_NAME = any
                                                                 (select D.DEP_NAME
                                                                 from patient P,department D, room R 
                                                                 where P.ROOM_NUMBER=R.ROOM_NUMBER and R.DEP_ID=D.DEP_ID  
                                                                 group by D.DEP_NAME having count (*) >7)
) 




/*patients that release befor 2030 and they stayed in department that cuttent number OF patients bigger then 7 */


select P.p_id from department D,room R,patient P where D.dep_name= 'Clinical Laboratory' AND d.dep_id=r.dep_id AND p.room_number= r.room_number
