CREATE OR REPLACE FUNCTION get_department_statistics (
    dep_id IN NUMBER
) RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
        SELECT 
            (SELECT COUNT(*) 
             FROM patient p
             JOIN room r ON r.room_number = p.room_number
             WHERE r.dep_id = dep_id) AS total_patients,
            (SELECT COUNT(*)
             FROM Room
             WHERE DEP_ID = dep_id) AS total_rooms,
            (SELECT COUNT(*)
             FROM Room
             WHERE DEP_ID = dep_id AND availability = 'Available') AS available_rooms,
            (SELECT SUM(num_of_beds)
             FROM Room
             WHERE DEP_ID = dep_id) AS total_beds,
            (SELECT COUNT(*)
             FROM Room
             WHERE DEP_ID = dep_id AND availability = 'Occupied') AS occupied_rooms
        FROM dual;
    RETURN v_cursor;
END;
/
