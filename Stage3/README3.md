# שלב ג: תכנות

### הקדמה

בשלב זה נכתבו תוכניות ב-PL/SQL על טבלאות בסיס הנתונים. התוכניות נועדו להיות לא טריוויאליות ולכלול אלמנטים שונים של תכנות.

### קבצי התוכניות

התוכניות נכתבו והועלו כקבצים נפרדים, כל אחד בשם המתאים לו:

- `count_surgeries_by_doctor.sql` - פונקציה לספירת ניתוחים של רופא.
- `get_medicines_for_surgery.sql` - פונקציה לקבלת התרופות המשמשות לניתוח.
- `schedule_surgery.sql` - פרוצדורה לתזמון ניתוח.
- `update_doctor_position.sql` - פרוצדורה לעדכון מיקום הרופא.
- `main_program_1.sql` - תוכנית ראשית ראשונה.
- `main_program_2.sql` - תוכנית ראשית שנייה.

### דוח פרויקט: שלב ג

#### פונקציה: `count_surgeries_by_doctor`

- **תיאור**: הפונקציה סופרת את מספר הניתוחים שביצע רופא מסוים.
- **קוד**:

```sql
CREATE OR REPLACE FUNCTION count_surgeries_by_doctor(p_doctor_id IN NUMBER)
RETURN NUMBER
IS
    v_surgery_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_surgery_count
    FROM Surgery 
    WHERE DoctorID = p_doctor_id;

    RETURN v_surgery_count;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20001, 'An error occurred: ' || SQLERRM);
END;
/
```


#### פונקציה: `get_medicines_for_surgery`

- **תיאור**: הפונקציה מחזירה רשימה של תרופות המשמשות לניתוח מסוים.
- **קוד**:

```sql
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
```


#### פרוצדורה: `schedule_surgery`

- **תיאור**: הפרוצדורה מתזמנת ניתוח חדש ובודקת שהרופא והאחות אינם משובצים ביותר מדי ניתוחים ביום זה.
- **קוד**:

```sql
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
    
    TYPE patient_rec IS RECORD (
        full_name VARCHAR2(61),
        birth_date DATE
    );
    v_patient patient_rec;
    
BEGIN
    SELECT CASE WHEN p_surgery_date > SYSDATE THEN 1 ELSE 0 END
    INTO v_is_future_date
    FROM DUAL;
    
    IF v_is_future_date = 0 THEN
        RAISE_APPLICATION_ERROR(-20006, 'Surgery date must be in the future');
    END IF;
    
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

    SELECT FirstName || ' ' || LastName, BirthDate INTO v_patient
    FROM Patient
    WHERE PatientID = p_patient_id;
    
    SELECT NVL(MAX(SurgeryID), 0) + 1 INTO v_surgery_id FROM Surgery;
    
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
```


#### פרוצדורה: `update_doctor_position`

- **תיאור**: הפרוצדורה מעדכנת את המיקום של רופא מסוים.
- **קוד**:

```sql
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
```


#### תוכנית ראשית: `main_program_1`

- **תיאור**: התוכנית הראשית הראשונה מזמנת את הפונקציה `count_surgeries_by_doctor` ואת הפרוצדורה `update_doctor_position`.
- **קוד**:

```sql
CREATE OR REPLACE PROCEDURE main_program_1
IS
    v_doctor_id NUMBER := 15;
    v_surgery_count NUMBER;
    v_new_position VARCHAR2(30);
BEGIN
    v_surgery_count := count_surgeries_by_doctor(v_doctor_id);
    DBMS_OUTPUT.PUT_LINE('Doctor ID ' || v_doctor_id || ' has performed ' || v_surgery_count || ' surgeries.');
    
    IF v_surgery_count > 10 THEN
        v_new_position := 'Senior';
    ELSIF v_surgery_count > 5 THEN
        v_new_position := 'Resident';
    ELSE
        v_new_position := 'Junior';
    END IF;
    
    update_doctor_position(v_doctor_id, v_new_position);
    
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
```

- **הוכחה**: תמונת "לפני" ותמונת "אחרי" של הרופא עם ID = 15.
![DoctorEmmieBefore](https://github.com/UrielMangisto/DBProject_2281_3115/assets/116590126/aae80256-187f-4837-82ba-8e5f0d41a8d3)
![DoctorEmmieAfter](https://github.com/UrielMangisto/DBProject_2281_3115/assets/116590126/ea44f07a-8095-47de-8cda-f43467307fdc)


#### תוכנית ראשית: `main_program_2`

- **תיאור**: התוכנית הראשית השנייה מז

מנת את הפונקציה `get_medicines_for_surgery` ואת הפרוצדורה `schedule_surgery`.
- **קוד**:

```sql
CREATE OR REPLACE PROCEDURE main_program_2
IS
    v_surgery_date DATE := SYSDATE + 1;
    v_surgery_type VARCHAR2(30) := 'Appendectomy';
    v_room_id NUMBER := 101;
    v_patient_id NUMBER := 5;
    v_doctor_id NUMBER := 10;
    v_nurse_id NUMBER := 3;
    v_medicines SYS_REFCURSOR;
    v_medicine_id NUMBER;
    v_medicine_name VARCHAR2(50);
    v_dosage VARCHAR2(30);
BEGIN
    schedule_surgery(v_surgery_date, v_surgery_type, v_room_id, v_patient_id, v_doctor_id, v_nurse_id);
    
    v_medicines := get_medicines_for_surgery(v_surgery_id => v_surgery_id);
    
    DBMS_OUTPUT.PUT_LINE('Medicines for the scheduled surgery:');
    LOOP
        FETCH v_medicines INTO v_medicine_id, v_medicine_name, v_dosage;
        EXIT WHEN v_medicines%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Medicine ID: ' || v_medicine_id || ', Name: ' || v_medicine_name || ', Dosage: ' || v_dosage);
    END LOOP;
    
    CLOSE v_medicines;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
```

- **הוכחה**: תמונות "לפני" ו"אחרי" של טבלאות `USED_IN` ו-`SURGERY` כדי להראות שנוסף ניתוח חדש ושמספר השורות השתנה בטבלת השימושים (ושהשימושים שנוספו הם באותו ניתוח שהוסף).
![UsedInBefor](https://github.com/UrielMangisto/DBProject_2281_3115/assets/116590126/349d4bdd-1b75-4172-8aa6-f7e404f363b3)
![UsedInAfter](https://github.com/UrielMangisto/DBProject_2281_3115/assets/116590126/f0fe2542-5e9f-4fa0-a005-4fd942d7b595)
![SurgeryBefore](https://github.com/UrielMangisto/DBProject_2281_3115/assets/116590126/3eb5d137-e47c-4671-8609-81ee493cf67b)
![SurgeryAfter](https://github.com/UrielMangisto/DBProject_2281_3115/assets/116590126/07a41b47-3c39-48aa-a79b-4d45276dd36e)

  

---
