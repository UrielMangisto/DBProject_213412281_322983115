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

6. **טיפול בטבלאות קישור**:
   יצרנו ישויות קישור ב-ERD במקרים של קשרי רבים לרבים ב-DSD.

7. **זיהוי מפתחות ראשיים**:
   זיהינו את המפתח הראשי עבור כל ישות בהתבסס על הגדרות ה-`PRIMARY KEY` ב-DSD.

8. **התאמות והרחבות**:
   ביצענו התאמות נוספות בהתבסס על הבנתנו את צרכי המערכת.

9. **נרמול**:
   בחנו את המבנה שיצרנו כדי לוודא שהוא עומד בעקרונות הנרמול.

10. **תיעוד**:
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

