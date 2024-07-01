CREATE OR REPLACE FUNCTION get_medicines_for_surgery(p_surgery_id IN NUMBER)
RETURN SYS_REFCURSOR
IS
    v_medicines SYS_REFCURSOR;
BEGIN
    OPEN v_medicines FOR
        SELECT m.MedicineID, m.MedicineName, m.Dosage
        FROM Medicine m
        JOIN Used_In ui ON m.MedicineID = ui.MedicineID
        WHERE ui.SurgeryID = p_surgery_id;
    
    RETURN v_medicines;
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20002, 'An error occurred: ' || SQLERRM);
END;
/
