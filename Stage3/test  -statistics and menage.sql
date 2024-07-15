DECLARE
    v_p_id patient.P_ID%TYPE;
    v_dep_id DEPARTMENT.DEP_ID%TYPE;
    
    v_ratio_occupancy NUMBER;
    occupancy_to_available NUMBER;  
    
    v_cursor SYS_REFCURSOR;
    total_patients NUMBER;
    total_rooms NUMBER;
    available_rooms NUMBER;
    total_beds NUMBER;
    occupied_rooms NUMBER;
        
  
BEGIN
    v_p_id  := &<name="Patient id" type="integer">;
    v_dep_id  := &<name="Department number" type="integer">;
        
    manage_hospitalization(v_p_id, v_dep_id);

    DBMS_OUTPUT.PUT_LINE('The patient was successfully re-hospitalized. ');

    v_cursor := get_department_statistics(v_dep_id);

    IF v_cursor IS NOT NULL THEN
        FETCH v_cursor INTO
            total_patients,
            total_rooms,
            available_rooms,
            total_beds,
            occupied_rooms;       
        --CLOSE v_cursor;

        IF total_rooms > 0 THEN
          v_ratio_occupancy := (occupied_rooms / total_rooms) * 100;
        ELSE
            v_ratio_occupancy := 0;
        END IF;

        IF available_rooms > 0 THEN
          occupancy_to_available := (occupied_rooms / available_rooms) * 100;
        ELSE
            occupancy_to_available := 0;
        END IF;
        
        
        DBMS_OUTPUT.PUT_LINE('Department Statistics Report');
        DBMS_OUTPUT.PUT_LINE('----------------------------');
        DBMS_OUTPUT.PUT_LINE('Department ID: ' || v_dep_id);
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('   Total Patients: ' || total_patients);
        DBMS_OUTPUT.PUT_LINE('   Total Beds: ' || total_beds);
        DBMS_OUTPUT.PUT_LINE('   Total Rooms: ' || total_rooms);
        DBMS_OUTPUT.PUT_LINE('   Available Rooms: ' || available_rooms);
        DBMS_OUTPUT.PUT_LINE('   Occupied Rooms: ' || occupied_rooms);
        DBMS_OUTPUT.PUT_LINE('   Ratio of Occupied to Total Rooms: ' || TO_CHAR(v_ratio_occupancy, '999.99') || '%');
        DBMS_OUTPUT.PUT_LINE('   Ratio of Occupied to Available Rooms: ' || TO_CHAR(occupancy_to_available, '999.99') || '%');
        DBMS_OUTPUT.PUT_LINE('');
    ELSE
        DBMS_OUTPUT.PUT_LINE('No data found for the specified department.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        ROLLBACK;

END;
