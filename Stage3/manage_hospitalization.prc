CREATE OR REPLACE PROCEDURE manage_hospitalization(
    p_id IN NUMBER,
    dep_id IN NUMBER
  --  hospitalization_date IN DATE
) IS
    v_room_number Room.room_number%TYPE;
    v_availability Room.availability%TYPE;
    v_num_of_beds Room.num_of_beds%TYPE;
    v_dep_id Room.DEP_ID%TYPE;
    v_date PATIENT.DATE_OF_HOSPITALIZATION%TYPE;
    
    v_status PATIENT.status%TYPE;
    v_address PATIENT.address%TYPE;
    v_date_of_birth PATIENT.date_of_birth%TYPE;
    v_p_name PATIENT.p_name%TYPE;
    v_p_phone PATIENT.p_phone%TYPE;
    v_date_of_release PATIENT.date_of_release%TYPE;
BEGIN
    -- בדיקה אם יש חדר פנוי במחלקה המבוקשת
  
    
    
    
    FOR r IN (SELECT room_number, availability, num_of_beds FROM Room WHERE DEP_ID = dep_id AND availability = 'Available') LOOP
        v_room_number := r.room_number;
        v_availability := r.availability;
        v_num_of_beds := r.num_of_beds;
        v_dep_id := dep_id; -- שמירת מזהה המחלקה המקורי
        EXIT;
    END LOOP;

    IF v_room_number IS NULL THEN
        -- בדיקה אם יש חדרים פנויים במחלקות אחרות
        FOR r IN (SELECT room_number, availability, num_of_beds, DEP_ID FROM Room WHERE availability = 'Available') LOOP
            v_room_number := r.room_number;
            v_availability := r.availability;
            v_num_of_beds := r.num_of_beds;
            v_dep_id := r.DEP_ID; --עדכון מזהה המחלקה לחדר הפנוי שנמצ 
             DBMS_OUTPUT.PUT_LINE(':המטופל נוסף למחלקה'||r.DEP_ID||'עקב חוסר מקום');

            EXIT;
        END LOOP;
    END IF;


    IF v_room_number IS NULL THEN
        -- אם אין חדר פנוי
        RAISE_APPLICATION_ERROR(-20001, 'אין חדר פנוי לאשפוז');
    ELSE
        -- עדכון חדר ותפוסה
        UPDATE Room
        SET availability = 'Occupied'
        WHERE room_number = v_room_number;

        -- עדכון מספר המטופלים במחלקה
        UPDATE Department
        SET cuurent_num_of_patient = cuurent_num_of_patient + 1
        WHERE DEP_ID = v_dep_id;
--

  

        -- שליפת פרטי המטופל
        BEGIN
            SELECT date_of_hospitalization, status, address, date_of_birth, p_name, p_phone, date_of_release
            INTO v_date, v_status, v_address, v_date_of_birth, v_p_name, v_p_phone, v_date_of_release
            FROM Patient
            WHERE P_ID = p_id
            AND ROWNUM = 1;

            DBMS_OUTPUT.PUT_LINE('נמצאו פרטי המטופל: ' || v_p_name || ', ' || v_date);
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                DBMS_OUTPUT.PUT_LINE('לא נמצאו פרטים עבור המטופל עם ת.ז.: ' || p_id);
                -- במקרה ואין נתונים קיימים, השתמש בערכים ברירת מחדל
                v_date := SYSDATE;
                v_status := 'In_treatment';
                v_address := 'Unknown';
                v_date_of_birth := SYSDATE;
                v_p_name := 'Unknown';
                v_p_phone := 0;
                v_date_of_release := NULL;
        END;

        -- עדכון פרטי האשפוז של המטופל
        UPDATE Patient
        SET date_of_hospitalization = v_date,
            room_number = v_room_number,
            status = v_status,
            address = v_address,
            date_of_birth = v_date_of_birth,
            p_name = v_p_name,
            p_phone = v_p_phone,
            date_of_release = v_date_of_release
        WHERE P_ID = p_id;

  
        -- עדכון פרטי האשפוז של המטופל
        --INSERT INTO Patient (P_ID, date_of_hospitalization, room_number, status)
         --VALUES (224, v_date,800, 'In_treatment');

       -- VALUES (p_id, v_date,v_room_number, 'In_treatment');

        --COMMIT;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('error'||SQLERRM);
      
END;
/
