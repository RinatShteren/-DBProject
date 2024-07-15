    DECLARE
        v_p_id  VISIT.P_ID%TYPE;
        v_medications SYS.ODCIVARCHAR2LIST;
    BEGIN
        v_p_id := '&p_id';
        --  ������� ����� ��������� ������ �������
       update_visits_for_patients();

        -- ����� �������� ����� ���� �������
        v_medications := get_patient_medications(v_p_id);

        -- ����� ���� �������
        FOR i IN 1..v_medications.COUNT LOOP
            DBMS_OUTPUT.PUT_LINE('medication: ' || i ||' is '||v_medications(i));
        END LOOP;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('����� ������� ������. ������: ' || SQLERRM);
    END;
    
