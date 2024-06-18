
select p_name
from ( select *
        from patient
        where status= ' under treatment' )p_in_t,department
where cuurent_num_of_patient >15 and floor = 3 and p_id = p_in_t.p_id


/*
patient currently under treatment from all departments with more then 15 current num of patients
and in third floor
*/
