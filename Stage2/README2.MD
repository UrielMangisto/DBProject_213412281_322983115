בהתבסס על השאילתות שסיפקת מ-STAGE2, הנה קובץ README מלא ומוכן להעתקה ל-GitHub:

```markdown
# Stage 2 - Query Report

## Table of Contents
1. [General Description](#general-description)
2. [SELECT Queries without Parameters](#select-queries-without-parameters)
    - [Query 1](#query-1)
    - [Query 2](#query-2)
    - [Query 3](#query-3)
    - [Query 4](#query-4)
3. [SELECT Queries with Parameters](#select-queries-with-parameters)
    - [Query 1](#query-1-1)
    - [Query 2](#query-2-1)
    - [Query 3](#query-3-1)
4. [DELETE and UPDATE Queries](#delete-and-update-queries)
    - [DELETE Query 1](#delete-query-1)
    - [DELETE Query 2](#delete-query-2)
    - [UPDATE Query 1](#update-query-1)
    - [UPDATE Query 2](#update-query-2)
5. [Constraints](#constraints)
    - [Constraint 1](#constraint-1)
    - [Constraint 2](#constraint-2)

## General Description

This report includes descriptions in English, screenshots of query executions, and results for:

1. 4 SELECT queries without parameters.
2. 3 SELECT queries with parameters.
3. DELETE and UPDATE queries.
4. Constraints implemented with ALTER TABLE.

## SELECT Queries without Parameters

### Query 1
**Description:**
Retrieve the doctor's first name, last name, the year, month, and number of surgeries.

**Query Code:**
```sql
SELECT d.FirstName, d.LastName, 
       t.year, t.month, t.NumSurgeries
FROM Doctor d
CROSS JOIN (
  SELECT EXTRACT(YEAR FROM s.SurgeryDate) AS year, 
         EXTRACT(MONTH FROM s.SurgeryDate) AS month, 
         COUNT(*) AS NumSurgeries, 
         s.DoctorID 
  FROM Surgery s
  GROUP BY EXTRACT(YEAR FROM s.SurgeryDate), EXTRACT(MONTH FROM s.SurgeryDate), s.DoctorID
) t
WHERE d.DoctorID = t.DoctorID
ORDER BY d.LastName, d.FirstName, t.year, t.month;
```

**Results:**
![Query 1 Execution](images/select_no_param/query1_execution.png)
![Query 1 Result](images/select_no_param/query1_result.png)

### Query 2
**Description:**
Select doctor's first name, last name, specialty, count of surgeries, and average age of patients.

**Query Code:**
```sql
SELECT d.FirstName, d.LastName, d.Speciality, COUNT(s.SurgeryID) AS NumSurgeries, 
       ROUND(AVG(MONTHS_BETWEEN(s.SurgeryDate, p.BirthDate) / 12), 2) AS AvgPatientAge
FROM Doctor d
JOIN Surgery s ON d.DoctorID = s.DoctorID
JOIN Patient p ON s.PatientID = p.PatientID
GROUP BY d.FirstName, d.LastName, d.Speciality
HAVING COUNT(s.SurgeryID) > (
  SELECT AVG(cnt)
  FROM (
    SELECT DoctorID, COUNT(SurgeryID) AS cnt
    FROM Surgery
    GROUP BY DoctorID
  )
)
ORDER BY NumSurgeries DESC;
```

**Results:**
![Query 2 Execution](images/select_no_param/query2_execution.png)
![Query 2 Result](images/select_no_param/query2_result.png)

### Query 3
**Description:**
Retrieve the patient's first name, last name, birth date, number of surgeries, number of medicines, and average medicine dosage.

**Query Code:**
```sql
SELECT p.FirstName, p.LastName, p.BirthDate,
       (SELECT COUNT(DISTINCT s.SurgeryID)
        FROM Surgery s
        WHERE s.PatientID = p.PatientID) AS NumSurgeries,
       (SELECT COUNT(DISTINCT ui.MedicineID)
        FROM Surgery s
        JOIN Used_In ui ON s.SurgeryID = ui.SurgeryID
        WHERE s.PatientID = p.PatientID) AS NumMedicines,
       (SELECT ROUND(AVG(m.Dosage), 2)
        FROM Surgery s
        JOIN Used_In ui ON s.SurgeryID = ui.SurgeryID
        JOIN Medicine m ON ui.MedicineID = m.MedicineID
        WHERE s.PatientID = p.PatientID) AS AvgMedicineDosage
FROM Patient p
ORDER BY NumSurgeries DESC, NumMedicines DESC;
```

**Results:**
![Query 3 Execution](images/select_no_param/query3_execution.png)
![Query 3 Result](images/select_no_param/query3_result.png)

### Query 4
**Description:**
Calculate the average number of surgeries and the maximum number of high-dosage medicines used per doctor, grouped by specialty.

**Query Code:**
```sql
WITH CTE_DoctorStats AS (
 SELECT d.DoctorID, d.FirstName, d.LastName, d.Speciality,
        COUNT(s.SurgeryID) AS NumSurgeries,
        SUM(CASE WHEN m.Dosage > (SELECT AVG(Dosage) FROM Medicine) THEN 1 ELSE 0 END) AS NumHighDosageMedicines
 FROM Doctor d
 LEFT JOIN Surgery s ON d.DoctorID = s.DoctorID
 LEFT JOIN Used_In ui ON s.SurgeryID = ui.SurgeryID
 LEFT JOIN Medicine m ON ui.MedicineID = m.MedicineID
 GROUP BY d.DoctorID, d.FirstName, d.LastName, d.Speciality
)
SELECT Speciality, 
      AVG(NumSurgeries) AS AvgSurgeriesPerDoctor,
      MAX(NumHighDosageMedicines) AS MaxHighDosageMedicinesPerDoctor
FROM CTE_DoctorStats
GROUP BY Speciality
ORDER BY AvgSurgeriesPerDoctor DESC;
```

**Results:**
![Query 4 Execution](images/select_no_param/query4_execution.png)
![Query 4 Result](images/select_no_param/query4_result.png)

## SELECT Queries with Parameters

### Query 1
**Description:**
Retrieve the records of surgeries performed by a specific doctor.

**Query Code:**
```sql
SELECT * FROM Surgery WHERE DoctorID = :doctor_id;
```

**Results:**
![Query 1 with Parameter Execution](images/select_with_param/query1_execution.png)
![Query 1 with Parameter Result](images/select_with_param/query1_result.png)

### Query 2
**Description:**
Retrieve the records of patients who underwent surgery on a specific date.

**Query Code:**
```sql
SELECT * FROM Patient WHERE PatientID IN (
  SELECT PatientID FROM Surgery WHERE SurgeryDate = :surgery_date
);
```

**Results:**
![Query 2 with Parameter Execution](images/select_with_param/query2_execution.png)
![Query 2 with Parameter Result](images/select_with_param/query2_result.png)

### Query 3
**Description:**
Retrieve the records of medicines used in a specific surgery.

**Query Code:**
```sql
SELECT * FROM Medicine WHERE MedicineID IN (
  SELECT MedicineID FROM Used_In WHERE SurgeryID = :surgery_id
);
```

**Results:**
![Query 3 with Parameter Execution](images/select_with_param/query3_execution.png)
![Query 3 with Parameter Result](images/select_with_param/query3_result.png)

## DELETE and UPDATE Queries

### DELETE Query 1
**Description:**
Delete records from the Used_In table for surgeries that meet certain conditions.

**Query Code:**
```sql
DELETE FROM Used_In
WHERE SurgeryID IN (
  SELECT s.SurgeryID
  FROM Surgery s
  JOIN Patient p ON s.PatientID = p.PatientID
  JOIN Doctor d ON s.DoctorID = d.DoctorID
  WHERE MONTHS_BETWEEN(SYSDATE, p.BirthDate) / 12 >= 65
    AND d.Speciality = 'Cardiology'
    AND s.SurgeryDate < ADD_MONTHS(SYSDATE, -6)
    AND NOT EXISTS (
      SELECT 1
      FROM Nurse n
      WHERE n.NurseID = s.NurseID
        AND n.StartDate >= ADD_MONTHS(SYSDATE, -24)
    )
);
COMMIT;
```

**Table Data Before:**
![Table Before DELETE](images/delete/query1_before.png)

**Table Data After:**
![Table After DELETE](images/delete/query1_after.png)

### DELETE Query 2
**Description:**
Delete records from the Patient table for patients who meet certain conditions.

**Query Code:**
```sql
DELETE FROM Patient
WHERE PatientID NOT IN (
    SELECT DISTINCT PatientID
    FROM Surgery
)
AND BirthDate < TO_DATE('1970-01-01', 'YYYY-MM-DD');
COMMIT;
```

**Table Data Before:**
![Table Before DELETE](images/delete/query2_before.png)

**Table Data After:**
![Table After DELETE](images/delete/query2_after.png)

### UPDATE Query 1
**Description:**
Update the dosage of all medicines to the average dosage of medicines used by senior doctors.

**Query Code:**
```sql
UPDATE Medicine m
SET DOSAGE = (
   SELECT AVG(m2.DOSAGE)
   FROM Medicine m2
   JOIN Used_In u ON m2.MedicineID = u.MedicineID
   JOIN Surgery s ON u.SurgeryID = s.SurgeryID
   JOIN Doctor d ON s.DoctorID = d.DoctorID
   WHERE d.Position = 'Senior'


בבקשה, הנה הקוד המלא של README לפי הנתונים שסיפקת:

```markdown
# Stage 2 - Query Report

## Table of Contents
1. [General Description](#general-description)
2. [SELECT Queries without Parameters](#select-queries-without-parameters)
    - [Query 1](#query-1)
    - [Query 2](#query-2)
    - [Query 3](#query-3)
    - [Query 4](#query-4)
3. [SELECT Queries with Parameters](#select-queries-with-parameters)
    - [Query 1](#query-1-1)
    - [Query 2](#query-2-1)
    - [Query 3](#query-3-1)
4. [DELETE and UPDATE Queries](#delete-and-update-queries)
    - [DELETE Query 1](#delete-query-1)
    - [DELETE Query 2](#delete-query-2)
    - [UPDATE Query 1](#update-query-1)
    - [UPDATE Query 2](#update-query-2)
5. [Constraints](#constraints)
    - [Constraint 1](#constraint-1)
    - [Constraint 2](#constraint-2)

## General Description

This report includes descriptions in English, screenshots of query executions, and results for:

1. 4 SELECT queries without parameters.
2. 3 SELECT queries with parameters.
3. DELETE and UPDATE queries.
4. Constraints implemented with ALTER TABLE.

## SELECT Queries without Parameters

### Query 1
**Description:**
Retrieve the doctor's first name, last name, the year, month, and number of surgeries.

**Query Code:**
```sql
SELECT d.FirstName, d.LastName, 
       t.year, t.month, t.NumSurgeries
FROM Doctor d
CROSS JOIN (
  SELECT EXTRACT(YEAR FROM s.SurgeryDate) AS year, 
         EXTRACT(MONTH FROM s.SurgeryDate) AS month, 
         COUNT(*) AS NumSurgeries, 
         s.DoctorID 
  FROM Surgery s
  GROUP BY EXTRACT(YEAR FROM s.SurgeryDate), EXTRACT(MONTH FROM s.SurgeryDate), s.DoctorID
) t
WHERE d.DoctorID = t.DoctorID
ORDER BY d.LastName, d.FirstName, t.year, t.month;
```

**Results:**
![Query 1 Execution](images/select_no_param/query1_execution.png)
![Query 1 Result](images/select_no_param/query1_result.png)

### Query 2
**Description:**
Select doctor's first name, last name, specialty, count of surgeries, and average age of patients.

**Query Code:**
```sql
SELECT d.FirstName, d.LastName, d.Speciality, COUNT(s.SurgeryID) AS NumSurgeries, 
       ROUND(AVG(MONTHS_BETWEEN(s.SurgeryDate, p.BirthDate) / 12), 2) AS AvgPatientAge
FROM Doctor d
JOIN Surgery s ON d.DoctorID = s.DoctorID
JOIN Patient p ON s.PatientID = p.PatientID
GROUP BY d.FirstName, d.LastName, d.Speciality
HAVING COUNT(s.SurgeryID) > (
  SELECT AVG(cnt)
  FROM (
    SELECT DoctorID, COUNT(SurgeryID) AS cnt
    FROM Surgery
    GROUP BY DoctorID
  )
)
ORDER BY NumSurgeries DESC;
```

**Results:**
![Query 2 Execution](images/select_no_param/query2_execution.png)
![Query 2 Result](images/select_no_param/query2_result.png)

### Query 3
**Description:**
Retrieve the patient's first name, last name, birth date, number of surgeries, number of medicines, and average medicine dosage.

**Query Code:**
```sql
SELECT p.FirstName, p.LastName, p.BirthDate,
       (SELECT COUNT(DISTINCT s.SurgeryID)
        FROM Surgery s
        WHERE s.PatientID = p.PatientID) AS NumSurgeries,
       (SELECT COUNT(DISTINCT ui.MedicineID)
        FROM Surgery s
        JOIN Used_In ui ON s.SurgeryID = ui.SurgeryID
        WHERE s.PatientID = p.PatientID) AS NumMedicines,
       (SELECT ROUND(AVG(m.Dosage), 2)
        FROM Surgery s
        JOIN Used_In ui ON s.SurgeryID = ui.SurgeryID
        JOIN Medicine m ON ui.MedicineID = m.MedicineID
        WHERE s.PatientID = p.PatientID) AS AvgMedicineDosage
FROM Patient p
ORDER BY NumSurgeries DESC, NumMedicines DESC;
```

**Results:**
![Query 3 Execution](images/select_no_param/query3_execution.png)
![Query 3 Result](images/select_no_param/query3_result.png)

### Query 4
**Description:**
Calculate the average number of surgeries and the maximum number of high-dosage medicines used per doctor, grouped by specialty.

**Query Code:**
```sql
WITH CTE_DoctorStats AS (
 SELECT d.DoctorID, d.FirstName, d.LastName, d.Speciality,
        COUNT(s.SurgeryID) AS NumSurgeries,
        SUM(CASE WHEN m.Dosage > (SELECT AVG(Dosage) FROM Medicine) THEN 1 ELSE 0 END) AS NumHighDosageMedicines
 FROM Doctor d
 LEFT JOIN Surgery s ON d.DoctorID = s.DoctorID
 LEFT JOIN Used_In ui ON s.SurgeryID = ui.SurgeryID
 LEFT JOIN Medicine m ON ui.MedicineID = m.MedicineID
 GROUP BY d.DoctorID, d.FirstName, d.LastName, d.Speciality
)
SELECT Speciality, 
      AVG(NumSurgeries) AS AvgSurgeriesPerDoctor,
      MAX(NumHighDosageMedicines) AS MaxHighDosageMedicinesPerDoctor
FROM CTE_DoctorStats
GROUP BY Speciality
ORDER BY AvgSurgeriesPerDoctor DESC;
```

**Results:**
![Query 4 Execution](images/select_no_param/query4_execution.png)
![Query 4 Result](images/select_no_param/query4_result.png)

## SELECT Queries with Parameters

### Query 1
**Description:**
Retrieve the records of surgeries performed by a specific doctor.

**Query Code:**
```sql
SELECT * FROM Surgery WHERE DoctorID = :doctor_id;
```

**Results:**
![Query 1 with Parameter Execution](images/select_with_param/query1_execution.png)
![Query 1 with Parameter Result](images/select_with_param/query1_result.png)

### Query 2
**Description:**
Retrieve the records of patients who underwent surgery on a specific date.

**Query Code:**
```sql
SELECT * FROM Patient WHERE PatientID IN (
  SELECT PatientID FROM Surgery WHERE SurgeryDate = :surgery_date
);
```

**Results:**
![Query 2 with Parameter Execution](images/select_with_param/query2_execution.png)
![Query 2 with Parameter Result](images/select_with_param/query2_result.png)

### Query 3
**Description:**
Retrieve the records of medicines used in a specific surgery.

**Query Code:**
```sql
SELECT * FROM Medicine WHERE MedicineID IN (
  SELECT MedicineID FROM Used_In WHERE SurgeryID = :surgery_id
);
```

**Results:**
![Query 3 with Parameter Execution](images/select_with_param/query3_execution.png)
![Query 3 with Parameter Result](images/select_with_param/query3_result.png)

## DELETE and UPDATE Queries

### DELETE Query 1
**Description:**
Delete records from the Used_In table for surgeries that meet certain conditions.

**Query Code:**
```sql
DELETE FROM Used_In
WHERE SurgeryID IN (
  SELECT s.SurgeryID
  FROM Surgery s
  JOIN Patient p ON s.PatientID = p.PatientID
  JOIN Doctor d ON s.DoctorID = d.DoctorID
  WHERE MONTHS_BETWEEN(SYSDATE, p.BirthDate) / 12 >= 65
    AND d.Speciality = 'Cardiology'
    AND s.SurgeryDate < ADD_MONTHS(SYSDATE, -6)
    AND NOT EXISTS (
      SELECT 1
      FROM Nurse n
      WHERE n.NurseID = s.NurseID
        AND n.StartDate >= ADD_MONTHS(SYSDATE, -24)
    )
);
COMMIT;
```

**Table Data Before:**
![Table Before DELETE](images/delete/query1_before.png)

**Table Data After:**
![Table After DELETE](images/delete/query1_after.png)

### DELETE Query 2
**Description:**
Delete records from the Patient table for patients who meet certain conditions.

**Query Code:**
```sql
DELETE FROM Patient
WHERE PatientID NOT IN (
    SELECT DISTINCT PatientID
    FROM Surgery
)
AND BirthDate < TO_DATE('1970-01-01', 'YYYY-MM-DD');
COMMIT;
```

**Table Data Before:**
![Table Before DELETE](images/delete/query2_before.png)

**Table Data After:**
![Table After DELETE](images/delete/query2_after.png)

### UPDATE Query 1
**Description:**
Update the dosage of all medicines to the average dosage of medicines used by senior doctors.

**Query Code:**
```sql
UPDATE Medicine m
SET DOSAGE = (
   SELECT AVG(m2.DOSAGE)
   FROM Medicine m2
   JOIN Used_In u ON m2.MedicineID = u.MedicineID
   JOIN Surgery s ON u.SurgeryID = s.SurgeryID
   JOIN Doctor d ON s.DoctorID = d.DoctorID
   WHERE d.Position = 'Senior'
);
COMMIT;
```

**Table Data Before:**
![Table Before

## UPDATE Queries (continued)

### UPDATE Query 2
**Description:**
Update the number of operating rooms assigned to surgeons with more than 5 surgeries.

**Query Code:**
```sql
UPDATE Surgeon
SET NumOperatingRooms = (
  SELECT COUNT(DISTINCT o.RoomID)
  FROM Operating_Room o
  JOIN Surgery s ON o.SurgeryID = s.SurgeryID
  WHERE s.SurgeonID = Surgeon.SurgeonID
  GROUP BY s.SurgeonID
  HAVING COUNT(s.SurgeryID) > 5
)
WHERE EXISTS (
  SELECT 1
  FROM Surgery s
  WHERE s.SurgeonID = Surgeon.SurgeonID
  HAVING COUNT(s.SurgeryID) > 5
);
COMMIT;
```

**Table Data Before:**
![Table Before UPDATE](images/update/query2_before.png)

**Table Data After:**
![Table After UPDATE](images/update/query2_after.png)

## Constraints

### Constraint 1
**Description:**
Ensure that no two patients can have the same Social Security Number (SSN).

**Query Code:**
```sql
ALTER TABLE Patient ADD CONSTRAINT unique_ssn UNIQUE (SSN);
```

**Results:**
![Constraint 1 Execution](images/constraints/constraint1_execution.png)

### Constraint 2
**Description:**
Ensure that the dosage of any medicine is positive and less than 1000.

**Query Code:**
```sql
ALTER TABLE Medicine ADD CONSTRAINT chk_dosage CHECK (Dosage > 0 AND Dosage < 1000);
```

**Results:**
![Constraint 2 Execution](images/constraints/constraint2_execution.png)

---

This README provides a comprehensive overview of the queries executed and the results obtained during Stage 2 of the project. The screenshots and descriptions ensure clarity and reproducibility. If you have any questions or need further assistance, feel free to reach out.
