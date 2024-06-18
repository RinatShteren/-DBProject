
select  R.ROOM_NUMBER,P.P_NAME
from(select R.ROOM_NUMBER
    from room R,department D,patient P
    where R.ROOM_NUMBER = P.ROOM_NUMBER 
    group by R.ROOM_NUMBER having count( * )>3 )M,Room R,patient P
where M.ROOM_NUMBER = R.Room_Number and P.ROOM_NUMBER = R.Room_Number
    
          
--select count() from room,department where room_number=810
/*
all patient in room with 3 people or more*/
