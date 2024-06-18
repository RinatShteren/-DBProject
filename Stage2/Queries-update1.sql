
update patient P
set P.STATUS = 'released'
where p.p_id= (select P.P_ID
      from room R JOIN patient P ON R.ROOM_NUMBER=P.ROOM_NUMBER
      where p.date_of_release = TO_DATE('04/01/2024', 'DD/MM/YYYY'))

select P.STATUS,p.p_name,p.date_of_release from patient p
