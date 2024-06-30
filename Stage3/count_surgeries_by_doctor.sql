CREATE OR REPLACE FUNCTION count_surgeries_by_doctor(p_doctor_id IN NUMBER)
RETURN NUMBER
IS
    v_surgery_count NUMBER;
    
    CURSOR doctor_surgeries IS
        SELECT COUNT(*) 
        FROM Surgery 
        WHERE DoctorID = p_doctor_id;
        
BEGIN
    OPEN doctor_surgeries;
    FETCH doctor_surgeries INTO v_surgery_count;
    CLOSE doctor_surgeries;
    
    RETURN v_surgery_count;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20001, 'An error occurred: ' || SQLERRM);
END;
/
