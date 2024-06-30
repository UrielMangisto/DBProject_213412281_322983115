CREATE OR REPLACE PROCEDURE main_program_2
IS
    v_new_surgery_id NUMBER;
    v_medicines SYS_REFCURSOR;
    v_medicine_id NUMBER;
    v_medicine_name VARCHAR2(200);
    v_dosage NUMBER;
    
    -- פרמטרים לתזמון ניתוח חדש
    v_new_surgery_date DATE := SYSDATE + 7; -- שבוע מהיום
    v_new_surgery_type VARCHAR2(30) := 'Short_surgery';
    v_room_id NUMBER := 1;
    v_patient_id NUMBER := 1;
    v_doctor_id NUMBER := 1;
    v_nurse_id NUMBER := 1;
BEGIN
    -- קריאה לפרוצדורה schedule_surgery
    BEGIN
        schedule_surgery(
            v_new_surgery_date,
            v_new_surgery_type,
            v_room_id,
            v_patient_id,
            v_doctor_id,
            v_nurse_id
        );
        DBMS_OUTPUT.PUT_LINE('Surgery scheduled successfully.');
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Failed to schedule surgery: ' || SQLERRM);
            RETURN;
    END;
    
    -- קבלת ה-ID של הניתוח החדש שנקבע
    SELECT MAX(SurgeryID) INTO v_new_surgery_id FROM Surgery;
    
    -- הצגת מידע על הניתוח החדש שתוזמן
    DBMS_OUTPUT.PUT_LINE('New surgery details:');
    FOR surgery_rec IN (SELECT * FROM Surgery WHERE SurgeryID = v_new_surgery_id) LOOP
        DBMS_OUTPUT.PUT_LINE('Surgery ID: ' || surgery_rec.SurgeryID);
        DBMS_OUTPUT.PUT_LINE('Date: ' || TO_CHAR(surgery_rec.SurgeryDate, 'DD-MM-YYYY'));
        DBMS_OUTPUT.PUT_LINE('Type: ' || surgery_rec.SurgeryType);
        DBMS_OUTPUT.PUT_LINE('Room ID: ' || surgery_rec.RoomID);
        DBMS_OUTPUT.PUT_LINE('Patient ID: ' || surgery_rec.PatientID);
        DBMS_OUTPUT.PUT_LINE('Doctor ID: ' || surgery_rec.DoctorID);
        DBMS_OUTPUT.PUT_LINE('Nurse ID: ' || surgery_rec.NurseID);
    END LOOP;
    
    -- קריאה לפונקציה get_medicines_for_surgery עבור הניתוח החדש
    v_medicines := get_medicines_for_surgery(v_new_surgery_id);
    
    DBMS_OUTPUT.PUT_LINE('Medicines required for the new surgery:');
    LOOP
        FETCH v_medicines INTO v_medicine_id, v_medicine_name, v_dosage;
        EXIT WHEN v_medicines%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('- Medicine ID: ' || v_medicine_id || 
                             ', Name: ' || v_medicine_name || 
                             ' (Dosage: ' || v_dosage || ')');
    END LOOP;
    CLOSE v_medicines;
    
    
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/

-- הרצת התוכנית
BEGIN
    main_program_2;
END;
/
