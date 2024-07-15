CREATE OR REPLACE FUNCTION get_patient_medications(p_id IN NUMBER) RETURN SYS.ODCIVARCHAR2LIST IS
    -- הגדרת משתנים לאחסון שמות התרופות ורשימת התרופות
    v_medications SYS.ODCIVARCHAR2LIST := SYS.ODCIVARCHAR2LIST();
    v_med_name Medicinies.n_name%TYPE;
    v_med_id Medicinies.M_ID%TYPE;
BEGIN
    -- לולאה לחזרה על כל התרופות המשויכות לחולה
    FOR medication IN (SELECT M.M_ID, M.n_name, M.QUALITITY_AVAILABLE_IN_STOCK
                       FROM Medication_Visit MV
                       JOIN Visit V ON MV.V_ID = V.V_ID
                       JOIN Medicinies M ON MV.M_ID = M.M_ID
                       WHERE V.P_ID = p_id) LOOP

        v_med_name := medication.n_name;
        v_med_id := medication.M_ID;

        -- בדיקת מלאי התרופה
        IF medication.QUALITITY_AVAILABLE_IN_STOCK = 0 THEN
            BEGIN
                -- חידוש מלאי תרופות
                UPDATE Medicinies
                SET qualitity_available_in_stock = QUALITITY_AVAILABLE_IN_STOCK + 10
                WHERE M_ID = v_med_id;

                -- הדפסת הודעה שהמלאי התעדכן
                DBMS_OUTPUT.PUT_LINE(': ' || v_med_name);
            EXCEPTION
                -- טיפול בשגיאות במהלך חידוש המלאי
                WHEN OTHERS THEN
                    DBMS_OUTPUT.PUT_LINE('ERROR WHEN updated stock for the medicine: ' || v_med_name || 'ERROR: ' || SQLERRM);
            END;
       END IF;

        -- הוספת שם התרופה לרשימת התרופות
        v_medications.EXTEND;
        v_medications(v_medications.COUNT) := v_med_name;
    END LOOP;

    -- החזרת רשימת התרופות
    RETURN v_medications;
EXCEPTION
    -- טיפול בשגיאות במהלך קבלת התרופות
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERROR WHILE SETTING MEDICATIONS TO PATIENT: ' || p_id || 'ERROR: ' || SQLERRM);
        RETURN SYS.ODCIVARCHAR2LIST();
END;
/
