CREATE OR REPLACE PROCEDURE update_doctor_position(
    p_doctor_id IN NUMBER,
    p_new_position IN VARCHAR2
)
IS
    v_doctor_name VARCHAR2(61);
BEGIN
    SELECT FirstName || ' ' || LastName INTO v_doctor_name
    FROM Doctor
    WHERE DoctorID = p_doctor_id;
    
    UPDATE Doctor
    SET Position = p_new_position
    WHERE DoctorID = p_doctor_id;
    
    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20003, 'Doctor not found');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Updated position for Dr. ' || v_doctor_name || ' to ' || p_new_position);
    END IF;
    
    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20004, 'Doctor not found');
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20005, 'An error occurred: ' || SQLERRM);
END;
/
