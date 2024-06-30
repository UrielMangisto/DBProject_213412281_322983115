CREATE OR REPLACE PROCEDURE main_program_1
IS
    v_doctor_id NUMBER := 1; -- נניח שזה ה-ID של הרופא שאנו רוצים לבדוק
    v_surgery_count NUMBER;
    v_new_position VARCHAR2(30);
BEGIN
    -- קריאה לפונקציה count_surgeries_by_doctor
    v_surgery_count := count_surgeries_by_doctor(v_doctor_id);
    DBMS_OUTPUT.PUT_LINE('Doctor ID ' || v_doctor_id || ' has performed ' || v_surgery_count || ' surgeries.');
    
    -- קביעת התפקיד החדש בהתאם למספר הניתוחים
    IF v_surgery_count > 10 THEN
        v_new_position := 'Senior';
    ELSIF v_surgery_count > 5 THEN
        v_new_position := 'Resident';
    ELSE
        v_new_position := 'Junior';
    END IF;
    
    -- קריאה לפרוצדורה update_doctor_position
    update_doctor_position(v_doctor_id, v_new_position);
    
    -- הצגת המידע המעודכן
    DBMS_OUTPUT.PUT_LINE('Updated doctor information:');
    FOR doctor_rec IN (SELECT * FROM Doctor WHERE DoctorID = v_doctor_id) LOOP
        DBMS_OUTPUT.PUT_LINE('Name: ' || doctor_rec.FirstName || ' ' || doctor_rec.LastName);
        DBMS_OUTPUT.PUT_LINE('Specialty: ' || doctor_rec.Speciality);
        DBMS_OUTPUT.PUT_LINE('Position: ' || doctor_rec.Position);
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/

-- הרצת התוכנית
BEGIN
    main_program_1;
END;
/
