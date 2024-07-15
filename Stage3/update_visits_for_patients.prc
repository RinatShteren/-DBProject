CREATE OR REPLACE PROCEDURE update_visits_for_patients IS
    CURSOR patient_cursor IS
        SELECT DISTINCT P.P_ID
        FROM Patient P
        JOIN Visit V ON P.P_ID = V.P_ID
        WHERE P.status = 'released'AND P.DATE_OF_RELEASE > TO_DATE( '01/01/2023', 'DD/MM/YYYY');

    v_p_id Patient.P_ID%TYPE;
    v_new_v_id Visit.V_ID%TYPE ;
    v_m_id Medicinies.M_ID%TYPE;
BEGIN
    OPEN patient_cursor;
    LOOP
        FETCH patient_cursor INTO v_p_id;
        EXIT WHEN patient_cursor%NOTFOUND;

        BEGIN
      
            -- הוספת ביקור חדש
            SELECT NVL(MAX(V_ID), 0) + 1 INTO v_new_v_id FROM Visit;
            INSERT INTO Visit (V_ID, date_of_visit, P_ID)
            VALUES (v_new_v_id, SYSDATE, v_p_id);
            
            DBMS_OUTPUT.PUT_LINE('VISIT OF PATIENT: ' || v_p_id ||' ADDED TO Visit, VISIT NO IS: '||v_new_v_id);  
        -- בדיקה אם יש תרופה שסופקה בשני ביקורים שונים של המטופל
            FOR medication IN (
                SELECT MV.M_ID, COUNT(*)
                FROM Medication_Visit MV
                JOIN Visit V ON MV.V_ID = V.V_ID
                WHERE V.P_ID = v_p_id 
                GROUP BY MV.M_ID
                HAVING COUNT(*) >=2
            ) LOOP
                v_m_id := medication.M_ID;

                -- הוספת רשומת ביקור-תרופה חדשה
                INSERT INTO Medication_Visit (V_ID, M_ID)
                VALUES ( v_new_v_id, v_m_id);

               DBMS_OUTPUT.PUT_LINE('MEDICATION WITH ID: ' || v_m_id||' OF PATIENT: ' || v_p_id ||
               ' ADDED TO Medication_Visit, VISIT NO IS: '||v_new_v_id);          
              END LOOP;   
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('ERROR WHILE UPDATE MEDICATION ID: '||v_m_id ||' OF PATIENT: ' || v_p_id || ' ERROR IS: ' || SQLERRM);
        END;
    END LOOP;

    CLOSE patient_cursor;
    COMMIT;
END;
/
