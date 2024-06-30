CREATE OR REPLACE PROCEDURE schedule_surgery(
    p_surgery_date IN DATE,
    p_surgery_type IN VARCHAR2,
    p_room_id IN NUMBER,
    p_patient_id IN NUMBER,
    p_doctor_id IN NUMBER,
    p_nurse_id IN NUMBER
)
IS
    v_surgery_id NUMBER;
    v_is_future_date NUMBER;
    v_doctor_surgeries NUMBER;
    v_nurse_surgeries NUMBER;
    v_room_suitable NUMBER;
    
    -- Record to store patient details
    TYPE patient_rec IS RECORD (
        full_name VARCHAR2(61),
        birth_date DATE
    );
    v_patient patient_rec;
    
BEGIN
    -- 1. בדיקה שהתאריך המבוקש הוא בעתיד
    SELECT CASE WHEN p_surgery_date > SYSDATE THEN 1 ELSE 0 END
    INTO v_is_future_date
    FROM DUAL;
    
    IF v_is_future_date = 0 THEN
        RAISE_APPLICATION_ERROR(-20006, 'Surgery date must be in the future');
    END IF;
    
    -- 2. בדיקה שהרופא והאחות לא ביצעו כבר 3 ניתוחים או יותר באותו התאריך
    SELECT COUNT(*)
    INTO v_doctor_surgeries
    FROM Surgery
    WHERE DoctorID = p_doctor_id AND SurgeryDate = p_surgery_date;
    
    SELECT COUNT(*)
    INTO v_nurse_surgeries
    FROM Surgery
    WHERE NurseID = p_nurse_id AND SurgeryDate = p_surgery_date;
    
    IF v_doctor_surgeries >= 3 THEN
        RAISE_APPLICATION_ERROR(-20007, 'Doctor has already been scheduled for 3 or more surgeries on this date');
    END IF;
    
    IF v_nurse_surgeries >= 3 THEN
        RAISE_APPLICATION_ERROR(-20008, 'Nurse has already been scheduled for 3 or more surgeries on this date');
    END IF;

    -- Get patient details
    SELECT FirstName || ' ' || LastName, BirthDate INTO v_patient
    FROM Patient
    WHERE PatientID = p_patient_id;
    
    -- Generate new SurgeryID
    SELECT NVL(MAX(SurgeryID), 0) + 1 INTO v_surgery_id FROM Surgery;
    
    -- Insert new surgery
    INSERT INTO Surgery (SurgeryID, SurgeryDate, SurgeryType, RoomID, PatientID, DoctorID, NurseID)
    VALUES (v_surgery_id, p_surgery_date, p_surgery_type, p_room_id, p_patient_id, p_doctor_id, p_nurse_id);
    
    DBMS_OUTPUT.PUT_LINE('Surgery scheduled for patient ' || v_patient.full_name || 
                         ' (DOB: ' || TO_CHAR(v_patient.birth_date, 'DD-MON-YYYY') || 
                         ') on ' || TO_CHAR(p_surgery_date, 'DD-MON-YYYY'));
    
    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20010, 'Patient, Doctor, Nurse, or Room not found');
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20011, 'An error occurred: ' || SQLERRM);
END;
/
