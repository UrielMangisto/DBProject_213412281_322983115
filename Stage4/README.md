# תוכן העניינים

1. [תרשימי DSD ו-ERD](#תרשימי-DSD-ו-ERD)
   - [DSD של המידע שנכנס](#DSD-של-המידע-שנכנס)
   - [ERD של המידע הנכנס למערכת](#ERD-של-המידע-הנכנס-למערכת)
   - [DSD של המערכת המשולבת](#DSD-של-המערכת-המשולבת)
   - [ERD של המערכת המשולבת](#ERD-של-המערכת-המשולבת)

2. [ניתוח מעבר מ-DSD ל-ERD](#ניתוח-מעבר-מ-DSD-ל-ERD)

3. [החלטות אינטגרציה](#החלטות-אינטגרציה)

4. [תהליך והפקודות](#תהליך-והפקודות)

5. [חלק ב- מבטים ושאילתות](#חלק-ב--מבטים-ושאילתות)
   - [מבט: SurgeryOverview](#מבט-SurgeryOverview)
     - [שליפת נתונים מהמבט](#שליפת-נתונים-מהמבט-SurgeryOverview)
     - [שאילתות מהמבט](#שאילתות-מהמבט-SurgeryOverview)
   - [מבט: AppointmentsOverview](#מבט-AppointmentsOverview)
     - [שליפת נתונים מהמבט](#שליפת-נתונים-מהמבט-AppointmentsOverview)
     - [שאילתות מהמבט](#שאילתות-מהמבט-AppointmentsOverview)

## תרשימי DSD ו-ERD

### DSD של המידע שנכנס

![image](https://github.com/user-attachments/assets/54da6467-7867-4427-961f-e301381914c4)

### ERD של המידע הנכנס למערכת

![image](https://github.com/user-attachments/assets/e6fe032e-397d-4730-a8b7-f5e01f5d3b9b)

### DSD של המערכת המשולבת

![image](https://github.com/user-attachments/assets/ee1ac701-3dc0-43d1-9e64-5a6e285cfecb)

### ERD של המערכת המשולבת

![image](https://github.com/user-attachments/assets/5086ffeb-dee7-49e6-9d71-22218c6065a0)

## ניתוח מעבר מ-DSD ל-ERD

1. **ניתוח ה-DSD**:
   התחלנו בניתוח ה-`Data Structure Diagram` (DSD) שהופק מקוד ה-PL/SQL.

2. **זיהוי ישויות**:
   מתוך ה-DSD, זיהינו את הישויות העיקריות במערכת, כמו '`רופא`', '`מטופל`', '`פגישה`' וכו'.

3. **הגדרת תכונות**:
   לכל ישות, הגדרנו את התכונות שלה בהתבסס על העמודות בטבלאות ה-DSD.

4. **זיהוי קשרים**:
   ניתחנו את הקשרים בין הטבלאות ב-DSD, בעיקר על ידי בחינת מפתחות זרים.

5. **הגדרת סוגי קשרים**:
   עבור כל קשר שזיהינו, הגדרנו את סוג הקשר (אחד לאחד, אחד לרבים, או רבים לרבים).

6.  **זיהוי מפתחות ראשיים**:
   זיהינו את המפתח הראשי עבור כל ישות בהתבסס על הגדרות ה-`PRIMARY KEY` ב-DSD.

 7. **תיעוד**:
    תיעדנו את ה-ERD באופן ויזואלי, כולל ישויות, תכונות וקשרים.

## החלטות אינטגרציה

1. **מטרת האינטגרציה**:
   לאחד את מערכת ניהול הניתוחים עם מערכת קביעת הפגישות.

2. **שילוב טבלאות המטופלים**:
   איחדנו את טבלאות המטופלים כדי ליצור מאגר מידע אחד, והוספנו שדות כמו '`Gender`', '`Contact Information`', '`Insurance`'.

3. **שילוב טבלאות הרופאים**:
   איחוד טבלאות הרופאים מאפשר ניהול מרכזי של כל הרופאים, והוספנו שדה לפרטי קשר.

5. **הוספת טבלת `Appointment`**:
   הוספנו טבלה שמאפשרת מעקב אחר כל הפגישות המתוכננות.

6. **הוספת טבלת `MedicalRecord`**:
   מאפשרת שמירה מרוכזת של כל המידע הרפואי של המטופל.

7. **הוספת טבלאות `Treatment` ו-`Billing`**:
   מאפשרות מעקב אחר עלויות הטיפול ומצב התשלומים.

8. **שינויים במבנה הנתונים**:
   איחוד שדות '`Last Name`' '`First Name`' לשדה '`Full Name`'.

9. **טיפול בערכים חסרים חדשים**:
   אפשרנו ערכי NULL או הגדרנו ערכי ברירת מחדל כמו '`Unknown`'.

10. **טיפול בערכים חסרים קיימים**:
   אפשרנו ערכי NULL עבור שדות קיימים שאינם מופיעים במערכת השנייה.

## תהליך והפקודות

בתהליך האינטגרציה נעשה שימוש בפקודות SQL למיזוג הנתונים.
ראשית, שינינו את כל שמות הטבלאות שלנו בכדי למנוע מצב של 'התנגשות' בין המידע שלנו למידע שקיבלנו.

```sql
-- rename tebles
rename Doctor to Doctor1;
rename Nurse to Nurse1;
rename Patient to Patient1;
rename Medicine to Medicine1;
rename Surgery to Surgery1;
rename Surgery_Room to Surgery_Room1;
rename Used_In to Used_In1;
```

לאחר מכן בדקנו את מספר הרשומות בעלות אותו מספר מזהה (ID) בטבלאות 'רופא' ו 'מטופל' (כלומר אין התנגשות במידע).
```sql
--count tables
SELECT COUNT(*) FROM DOCTOR1;
SELECT COUNT(*) FROM DOCTORS;

SELECT COUNT(*) FROM PATIENT1;
SELECT COUNT(*) FROM PATIENTS;


--count differences
SELECT * FROM DOCTORS D WHERE D.DOCTOR_ID NOT IN (SELECT DOCTORID FROM DOCTOR1); --ALL THE DOCTORS (400) ARE DIFFERENT


SELECT * FROM PATIENTS P WHERE P.PATIENT_ID NOT IN (SELECT PATIENTID FROM PATIENT1);--ALL THE PATIENTS (400) ARE DIFFERENT
```


לפני איחוד הטבלאות של הישות 'רופא' ביצענו הכנה מקדימה: 
- איחדנו בין השדות שם פרטי ושם משפחה לשדה אחד 'שם מלא'
- הוספנו את השדה 'פרטי קשר' והגדרנו אותו כ Null.
- הגדרנו את השדה המקורי 'תפקיד' כ Null
  

```sql
--merge doctors and doctor1:

--preprocessing doctor1:

ALTER TABLE Doctor1
ADD FullName VARCHAR2(61);

UPDATE Doctor1
SET FullName = FirstName || ' ' || LastName;

ALTER TABLE Doctor1
DROP COLUMN FirstName;

ALTER TABLE Doctor1
DROP COLUMN LastName;

ALTER TABLE Doctor1
ADD ContactInformation VARCHAR2(50) NULL;

ALTER TABLE Doctor1 MODIFY Position VARCHAR2(30) NULL;
```

לאחר ההכנה המקידמה ביצענו את ההכנסה של כל הרשומות מטבלת 'Doctors' שקיבלנו לטבלת 'Doctor1' המקורית, כולל הכנסה של השדות החדשים.
```sql
--inserting:
INSERT INTO Doctor1 (DoctorID, FullName, Speciality, StartDate, Position, ContactInformation)
SELECT Doctor_ID, Name, Specialty, Date_of_Start_working, 'Unknown', Contact_Information
FROM Doctors;
```

בדומה לטבלת 'Doctor' ביצענו את אותם תהליכים גם עבור טבלת 'Patient'

- הוספנו את השדה 'מגדר' והגדרנו אותו כ Null.
- הוספנו את השדה 'פרטי קשר' והגדרנו אותו כ Null.
- הוספנו את השדה 'ביטוח' והגדרנו אותו כ Null.
-  איחדנו בין השדות שם פרטי ושם משפחה לשדה אחד 'שם מלא'

  


```sql
--merge patients and patient1:

--preprocessing patient1:

ALTER TABLE Patient1
ADD Gender VARCHAR2(10) NULL;
ALTER TABLE Patient1
ADD ContactInformation VARCHAR2(50) NULL;
ALTER TABLE Patient1
ADD Insurance VARCHAR2(10) NULL;

ALTER TABLE Patient1
ADD FullName VARCHAR2(61);

UPDATE Patient1
SET FullName = FirstName || ' ' || LastName;

ALTER TABLE Patient1
DROP COLUMN FirstName;
ALTER TABLE Patient1
DROP COLUMN LastName;
```


לאחר ההכנה המקידמה ביצענו את ההכנסה של כל הרשומות מטבלת 'Patients' שקיבלנו לטבלת 'Patient1' המקורית, כולל הכנסה של השדות החדשים.


```sql
--inserting:
INSERT INTO Patient1 (PatientID, FullName, BirthDate, Gender, ContactInformation, Insurance)
SELECT Patient_ID, Name, Date_of_Birth, Gender, Contact_Information, Insurance
FROM Patients;
```

על מנת למחוק את הטבלאות 'Patients' ו 'Doctors'  היינו  צריכים למחוק את האילוצים של הטבלאות שמגדירות את המספרים המזהים שלהן כמפתח זר

```sql
-- CONSTRAINTS CANCLETION
ALTER TABLE Appointment DROP CONSTRAINT SYS_C008867;
ALTER TABLE Appointment DROP CONSTRAINT SYS_C008866;
ALTER TABLE MedicalRecord DROP CONSTRAINT SYS_C008875;
ALTER TABLE Billing DROP CONSTRAINT SYS_C008889;
```

מחיקת הטבלאות לאחר הורדת האילוצים .
בהתאם להחלטות שביצענו לאחר ניתוח המידע הסרנו גם את טבלת DocPat מפני שהמידע בטבלה זאת אינו תורם לנו (ניתן להגיע אליו מניתוח פשוט של המידע מטבלת הפגישות והניתוחים)
```sql
-- TABLES DROPPING
DROP TABLE DocPat;
DROP TABLE Doctors;
DROP TABLE Patients;
```

לאחר מחיקת האילוצים והקישור לטבלאות שנמחקו, יצרנו את האילוצים המצאימים לטבלאות המאוחדות שלנו שטיפלנו בהן קודם לכן.

```sql
-- ADDING CONSTRAINTS AGAIN
ALTER TABLE Appointment
ADD CONSTRAINT fk_patient
FOREIGN KEY (PATIENT_ID)
REFERENCES PATIENT1 (PATIENTID);

ALTER TABLE Appointment
ADD CONSTRAINT fk_doctor
FOREIGN KEY (DOCTOR_ID)
REFERENCES DOCTOR1 (DOCTORID);

ALTER TABLE MedicalRecord
ADD CONSTRAINT fk_patient1
FOREIGN KEY (PATIENT_ID)
REFERENCES PATIENT1 (PATIENTID);

ALTER TABLE Billing
ADD CONSTRAINT fk_patient2
FOREIGN KEY (PATIENT_ID)
REFERENCES PATIENT1 (PATIENTID);
```


החזרנו את שמות הטבלאות לשמות המקוריים 
```sql
-- RENAME BACK:
rename Doctor1 to Doctor;
rename Nurse1 to Nurse;
rename Patient1 to Patient;
rename Medicine1 to Medicine;
rename Surgery1 to Surgery;
rename Surgery_Room1 to Surgery_Room;
rename Used_In1 to Used_In;
```


# חלק ב- מבטים ושאילתות
כמובן! הנה התיאור והשליפות של המבט והשאילתות:

### מבט: `SurgeryOverview`

**תיאור המבט:**
`SurgeryOverview` מספק מידע מרכזי על ניתוחים, כולל תאריך הניתוח, סוג הניתוח, פרטי המטופל והצוות הרפואי, מיקום חדר הניתוח ופרטי תרופות ששימשו.


**הקוד:**
```sql
-- Creating a Surgery-focused view named SurgeryOverview
CREATE VIEW SurgeryOverview AS
SELECT 
    s.SurgeryID,        -- Unique identifier for each surgery
    s.SurgeryDate,      -- Date when the surgery was performed
    s.SurgeryType,      -- Type or category of the surgery
    p.PatientID,        -- Unique identifier for the patient
    p.FullName AS PatientName,  -- Full name of the patient
    d.DoctorID,         -- Unique identifier for the doctor
    d.FullName AS DoctorName,   -- Full name of the doctor
    d.Speciality,       -- Doctor's medical speciality
    sr.RoomID,          -- Unique identifier for the surgery room
    sr.Location AS RoomLocation,  -- Physical location of the surgery room
    m.MedicineID,       -- Unique identifier for medicine used (if any)
    m.MedicineName      -- Name of the medicine used (if any)
FROM 
    Surgery s
    JOIN Patient p ON s.PatientID = p.PatientID  -- Linking surgery to patient
    JOIN Doctor d ON s.DoctorID = d.DoctorID     -- Linking surgery to doctor
    JOIN Surgery_Room sr ON s.RoomID = sr.RoomID  -- Linking surgery to room
    LEFT JOIN Used_In ui ON s.SurgeryID = ui.SurgeryID  -- Linking surgery to medicines used
    LEFT JOIN Medicine m ON ui.MedicineID = m.MedicineID;  -- Getting medicine details
-- Note: LEFT JOIN is used for Used_In1 and Medicine1 as not all surgeries might use medicines
```

**שליפת נתונים מהמבט:**
![image](https://github.com/user-attachments/assets/c2060ea6-ffa1-499c-b556-2e82e839e576)


### שאילתות מהמבט `SurgeryOverview`

**שאילתא 1: מספר הניתוחים לפי סוג בחודש האחרון**

**תיאור:**
מטרת השאילתא היא לנתח את מספר הניתוחים לפי סוגם שבוצעו בחודש האחרון.

**קוד השאילתא:**
```sql
SELECT SurgeryType, COUNT(*) AS SurgeryCount
FROM SurgeryOverview
WHERE SurgeryDate >= ADD_MONTHS(SYSDATE, -1)
GROUP BY SurgeryType
ORDER BY SurgeryCount DESC;
```

**שאילתא 2: זיהוי רופאים שמבצעים מספר גבוה של ניתוחים**

**תיאור:**
מטרת השאילתא היא לזהות רופאים שביצעו יותר מ-5 ניתוחים ולהציג את מספר הניתוחים שבוצעו.

**קוד השאילתא:**
```sql
SELECT DoctorName, COUNT(*) AS SurgeryCount
FROM SurgeryOverview
GROUP BY DoctorName
HAVING COUNT(*) > 5
ORDER BY SurgeryCount DESC;
```

### מבט: `AppointmentsOverview`

**תיאור המבט:**
`AppointmentsOverview` מכיל מידע על פגישות, כולל תאריך הפגישה, סיבת הביקור, פרטי המטופל והרופא, וכן אבחנות וטיפולים שניתנו.


**הקוד:**
```sql
-- Creating an Appointment-focused view named AppointmentOverview
CREATE VIEW AppointmentsOverview AS
SELECT 
    a.Appointment_ID,            -- Unique identifier for each appointment
    a.Appointment_Date,          -- Date of the appointment
    a.Reason_For_Visit,           -- Reason or purpose of the visit
    p.PatientID,                -- Unique identifier for the patient
    p.FullName AS PatientName,  -- Full name of the patient
    p.Gender,                   -- Gender of the patient
    p.Insurance,                -- Patient's insurance information
    d.DoctorID,                 -- Unique identifier for the doctor
    d.FullName AS DoctorName,   -- Full name of the doctor
    d.Speciality,               -- Doctor's medical speciality
    mr.Medical_Record_ID,         -- Unique identifier for the medical record
    mr.Diagnosis,               -- Diagnosis given during the appointment (if any)
    mr.Prescribed_Treatments     -- Treatments prescribed during the appointment (if any)
FROM 
    Appointment a
    JOIN Patient p ON a.Patient_ID = p.PatientID  -- Linking appointment to patient
    JOIN Doctor d ON a.Doctor_ID = d.DoctorID     -- Linking appointment to doctor
    LEFT JOIN MedicalRecord mr ON p.PatientID = mr.Patient_ID;  -- Linking to medical record
-- Note: LEFT JOIN is used for MedicalRecord1 as not all appointments might result in a new medical record entry
```
**שליפת נתונים מהמבט:**
![image](https://github.com/user-attachments/assets/e7fe5ec8-a86e-4faa-9f23-5c25f5416d82)

### שאילתות מהמבט `AppointmentsOverview`

**שאילתא 1: פגישות בששת החודשים האחרונים**

**תיאור:**
השאילתא מציגה פגישות שהתקיימו בששת החודשים האחרונים, כולל תאריך הפגישה, שם המטופל והרופא, וסיבת הביקור.

**קוד השאילתא:**
```sql
SELECT 
    Appointment_Date, 
    PatientName, 
    DoctorName, 
    Reason_For_Visit
FROM 
    AppointmentsOverview
WHERE 
    Appointment_Date BETWEEN ADD_MONTHS(TRUNC(SYSDATE), -6) AND SYSDATE;
```

**שאילתא 2: פגישות עם רופאים מההתמחות העמוסה ביותר**

**תיאור:**
השאילתא מזהה פגישות עם רופאים מההתמחות בעלת מספר הפגישות הגבוה ביותר.

**קוד השאילתא:**
```sql
SELECT 
    Appointment_Date,
    PatientName,
    DoctorName,
    Speciality,
    Reason_For_Visit
FROM 
    AppointmentsOverview
WHERE 
    Speciality = (
        SELECT Speciality
        FROM AppointmentsOverview
        GROUP BY Speciality
        ORDER BY COUNT(*) DESC
        FETCH FIRST 1 ROW ONLY
    );
```





