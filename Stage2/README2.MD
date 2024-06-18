# Stage 2 - Database Project

## Table of Contents
- [Introduction](#introduction)
- [SELECT Queries](#select-queries)
  - [Query 1](#query-1)
  - [Query 2](#query-2)
  - [Query 3](#query-3)
  - [Query 4](#query-4)
- [SELECT Queries with Parameters](#select-queries-with-parameters)
  - [Params Query 1](#params-query-1)
  - [Params Query 2](#params-query-2)
  - [Params Query 3](#params-query-3)
  - [Params Query 4](#params-query-4)
- [UPDATE Queries](#update-queries)
  - [UPDATE Query 1](#update-query-1)
  - [UPDATE Query 2](#update-query-2)
- [DELETE Queries](#delete-queries)
  - [DELETE Query 1](#delete-query-1)
  - [DELETE Query 2](#delete-query-2)
- [Constraints](#constraints)
  - [Constraint 1](#constraint-1)
  - [Constraint 2](#constraint-2)

## Introduction
This document provides detailed descriptions, code, and results for various database operations including SELECT, UPDATE, DELETE queries, and constraints. The results include query executions and screenshots of the data before and after the operations.

## SELECT Queries

### Query 1
Goal: Display the number of surgeries performed by each doctor, grouped by month and year.

Explanation: The query calculates the number of surgeries per doctor for each month and year using a subquery. A CROSS JOIN with the doctors table allows displaying this data alongside doctor details, even without a direct foreign key link.

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
![Query 1 Result](images/select/query1_result.png)

### Query 2
Goal: List doctors who performed more surgeries than the average, with details on their specialization, number of surgeries, and average patient age.

Explanation: The query shows doctors' names, specialization, surgery count, and average patient age. The HAVING clause ensures doctors performed more surgeries than the average, sorted by descending surgery count.
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
![Query 2 Result](images/select/query2_result.png)

### Query 3
Goal: Display patients, their birthdates, number of surgeries, number of different medicines administered, and the average dosage.

Explanation: The query lists patients' names, birthdates, number of surgeries, different medicines, and average dosage. Subqueries calculate specific patient information, sorted by descending number of surgeries and different medicines.

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
![Query 3 Result](images/select/query3_result.png)

### Query 4
Goal: For each medical specialty, show the average number of surgeries per doctor and the maximum number of medicines with above-average dosage used in surgeries.

Explanation: Using a CTE, the query calculates statistics for each doctor, including surgeries and medicines with above-average dosage. The main query calculates the average surgeries per doctor and the maximum high-dosage medicines per specialty, sorted by descending average surgeries.

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
![Query 4 Result](images/select/query4_result.png)

## SELECT Queries with Parameters

### Params Query 1
Goal: Find surgeries performed by a doctor with a specific specialty, where the patient is older than a given age and the surgery used a medicine costing more than a specified amount.

Explanation: The query displays surgeries by doctors with a specific specialty, filtering patients older than a given age and using medicines costing more than a specified amount.

**Query Code:**
```sql
SELECT s.SurgeryID, s.SurgeryDate, s.SurgeryType,
       p.FirstName AS PatientFirstName, p.LastName AS PatientLastName,
       d.FirstName AS DoctorFirstName, d.LastName AS DoctorLastName,
       m.MedicineName AS MedicineName, m.Dosage AS MedicineCost
FROM Surgery s
JOIN Patient p ON s.PatientID = p.PatientID
JOIN Doctor d ON s.DoctorID = d.DoctorID
JOIN Used_In ui ON s.SurgeryID = ui.SurgeryID
JOIN Medicine m ON ui.MedicineID = m.MedicineID
WHERE d.Speciality = '&Enter_Doctor_Speciality'
  AND MONTHS_BETWEEN(SYSDATE, p.BirthDate)/12 > &Enter_Minimum_Patient_Age
  AND m.Dosage > &Enter_Minimum_Medicine_Cost
ORDER BY s.SurgeryDate DESC;
```

### Params Query 2
Goal: Find the top N nurses who assisted in the most surgeries of a specific type within a date range.

Explanation: The query shows the top N nurses based on the number of specific-type surgeries they assisted in, within a specified date range.

**Query Code:**
```sql
SELECT * FROM (
    SELECT n.NurseID, n.FirstName, n.LastName, COUNT(*) AS SurgeryCount
    FROM Nurse n
    JOIN Surgery s ON n.NurseID = s.NurseID
    WHERE s.SurgeryType = '&Enter_Surgery_Type'
      AND s.SurgeryDate BETWEEN TO_DATE('&Enter_Start_Date','DD-MM-YYYY') 
                             AND TO_DATE('&Enter_End_Date', 'DD-MM-YYYY')
    GROUP BY n.NurseID, n.FirstName, n.LastName
    ORDER BY COUNT(*) DESC
)
WHERE ROWNUM <= &Enter_Top_N_Nurses;
```

### Params Query 3
Goal: Find all surgery rooms used for a specific surgery type more than the average usage for that type, within a specified date range.

Explanation: The query lists surgery rooms used more than the average for a specific type within a date range.

**Query Code:**
```sql
WITH RoomUsage AS (
   SELECT sr.RoomID, sr.Location, sr.RoomType, COUNT(*) AS UsageCount
   FROM Surgery_Room sr
   JOIN Surgery s ON sr.RoomID = s.RoomID
   WHERE s.SurgeryType = '&Enter_Surgery_Type'
     AND s.SurgeryDate BETWEEN TO_DATE('&Enter_Start_Date', 'DD-MM-YYYY') 
                            AND TO_DATE('&Enter_End_Date', 'DD-MM-YYYY')
   GROUP BY sr.RoomID, sr.Location, sr.RoomType
),
AverageUsage AS (
   SELECT AVG(UsageCount) AS AvgUsage
   FROM RoomUsage
)
SELECT ru.RoomID, ru.Location, ru.RoomType, ru.UsageCount
FROM RoomUsage ru
CROSS JOIN AverageUsage au
WHERE ru.UsageCount > au.AvgUsage
ORDER BY ru.UsageCount DESC;
```

### Params Query 4
Goal: Find nurses who worked with the most diverse set of doctors and surgery types.

Explanation: The query displays nurses who worked with the most diverse set of doctors and surgery types, using diversity metrics calculated from recent surgeries.

**Query Code:**
```sql
WITH NurseDiversity AS (
   SELECT n.NurseID, n.FirstName, n.LastName,
          COUNT(DISTINCT s.DoctorID) AS UniqueDoctos,
          COUNT(DISTINCT s.SurgeryType) AS UniqueSurgeryTypes,
          COUNT(*) AS TotalSurgeries
   FROM Nurse n
   JOIN Surgery s ON n.NurseID = s.NurseID
   WHERE s.SurgeryDate >= ADD_MONTHS(SYSDATE, -&Enter_Months_Back)
   GROUP BY n.NurseID, n.FirstName, n.LastName
)
SELECT NurseID, FirstName, LastName, UniqueDoctos, UniqueSurgeryTypes, TotalSurgeries,
      ROUND((UniqueDoctos + UniqueSurgeryTypes) * 100.0

```markdown
# Stage 2 - Database Project

## Table of Contents
- [Introduction](#introduction)
- [SELECT Queries](#select-queries)
  - [Query 1](#query-1)
  - [Query 2](#query-2)
  - [Query 3](#query-3)
  - [Query 4](#query-4)
- [SELECT Queries with Parameters](#select-queries-with-parameters)
  - [Params Query 1](#params-query-1)
  - [Params Query 2](#params-query-2)
  - [Params Query 3](#params-query-3)
  - [Params Query 4](#params-query-4)
- [UPDATE Queries](#update-queries)
  - [UPDATE Query 1](#update-query-1)
  - [UPDATE Query 2](#update-query-2)
- [DELETE Queries](#delete-queries)
  - [DELETE Query 1](#delete-query-1)
  - [DELETE Query 2](#delete-query-2)
- [Constraints](#constraints)
  - [Constraint 1](#constraint-1)
  - [Constraint 2](#constraint-2)

## Introduction
This document provides detailed descriptions, code, and results for various database operations including SELECT, UPDATE, DELETE queries, and constraints. The results include query executions and screenshots of the data before and after the operations.

## SELECT Queries

### Query 1
**Description:** Select the doctor's first name, last name, and the year, month, and number of surgeries.

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
![Query 1 Result](images/select/query1_result.png)

### Query 2
**Description:** Select doctor's first name, last name, specialty, count of surgeries, and average age of patients.

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
![Query 2 Result](images/select/query2_result.png)

### Query 3
**Description:** Select patient’s first name, last name, birth date, number of surgeries, number of distinct medicines, and average medicine dosage.

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
![Query 3 Result](images/select/query3_result.png)

### Query 4
**Description:** Calculate the average number of surgeries and the maximum number of high-dosage medicines used per doctor, grouped by specialty.

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
![Query 4 Result](images/select/query4_result.png)

## SELECT Queries with Parameters

### Params Query 1
**Description:** Retrieve information about surgeries, patients, doctors, and medicines based on doctor’s specialty, minimum patient age, and minimum medicine dosage.

**Query Code:**
```sql
SELECT s.SurgeryID, s.SurgeryDate, s.SurgeryType,
       p.FirstName AS PatientFirstName, p.LastName AS PatientLastName,
       d.FirstName AS DoctorFirstName, d.LastName AS DoctorLastName,
       m.MedicineName AS MedicineName, m.Dosage AS MedicineCost
FROM Surgery s
JOIN Patient p ON s.PatientID = p.PatientID
JOIN Doctor d ON s.DoctorID = d.DoctorID
JOIN Used_In ui ON s.SurgeryID = ui.SurgeryID
JOIN Medicine m ON ui.MedicineID = m.MedicineID
WHERE d.Speciality = '&Enter_Doctor_Speciality'
  AND MONTHS_BETWEEN(SYSDATE, p.BirthDate)/12 > &Enter_Minimum_Patient_Age
  AND m.Dosage > &Enter_Minimum_Medicine_Cost
ORDER BY s.SurgeryDate DESC;
```

### Params Query 2
**Description:** Retrieve the top N nurses based on the number of surgeries they assisted for a specific type of surgery and within a given date range.

**Query Code:**
```sql
SELECT * FROM (
    SELECT n.NurseID, n.FirstName, n.LastName, COUNT(*) AS SurgeryCount
    FROM Nurse n
    JOIN Surgery s ON n.NurseID = s.NurseID
    WHERE s.SurgeryType = '&Enter_Surgery_Type'
      AND s.SurgeryDate BETWEEN TO_DATE('&Enter_Start_Date','DD-MM-YYYY') 
                             AND TO_DATE('&Enter_End_Date', 'DD-MM-YYYY')
    GROUP BY n.NurseID, n.FirstName, n.LastName
    ORDER BY COUNT(*) DESC
)
WHERE ROWNUM <= &Enter_Top_N_Nurses;
```

### Params Query 3
**Description:** Select surgery rooms with usage count higher than the average for a specific surgery type and date range.

**Query Code:**
```sql
WITH RoomUsage AS (
   SELECT sr.RoomID, sr.Location, sr.RoomType, COUNT(*) AS UsageCount
   FROM Surgery_Room sr
   JOIN Surgery s ON sr.RoomID = s.RoomID
   WHERE s.SurgeryType = '&Enter_Surgery_Type'
     AND s.SurgeryDate BETWEEN TO_DATE('&Enter_Start_Date', 'DD-MM-YYYY') 
                            AND TO_DATE('&Enter_End_Date', 'DD-MM-YYYY')
   GROUP BY sr.RoomID, sr.Location, sr.RoomType
),
AverageUsage AS (
   SELECT AVG(UsageCount) AS AvgUsage
   FROM RoomUsage
)
SELECT ru.RoomID, ru.Location, ru.RoomType, ru.UsageCount
FROM RoomUsage ru
CROSS JOIN AverageUsage au
WHERE ru.UsageCount > au.AvgUsage
ORDER BY ru.UsageCount DESC;
```

### Params Query 4
**Description:** Select top nurses based on a diversity score for recent surgeries, considering the number of unique doctors, surgery types, and total surgeries.

**Query Code:**
```sql
WITH NurseDiversity AS (
   SELECT n.NurseID, n.FirstName, n.LastName,
          COUNT(DISTINCT s.DoctorID) AS UniqueDoctos,
          COUNT(DISTINCT s.SurgeryType) AS UniqueSurgeryTypes,
          COUNT(*) AS TotalSurgeries
   FROM Nurse n
   JOIN Surgery s ON n.NurseID = s.NurseID
   WHERE s.SurgeryDate >= ADD_MONTHS(SYSDATE, -&Enter_Months_Back)
   GROUP BY n.NurseID, n.FirstName, n.LastName
)
SELECT NurseID, FirstName, LastName, UniqueDoctos, UniqueSurgeryTypes, TotalSurgeries,
      ROUND((UniqueDoctos + UniqueSurgeryTypes) * 100.0

Here are the remaining sections for the Stage 2 document:

```markdown
## UPDATE Queries

### UPDATE Query 1
**Description:** Update the dosage of all medicines used in surgeries performed by a specific doctor, increasing by a given percentage.

**Query Code:**
```sql
UPDATE Medicine
SET Dosage = Dosage * (1 + &Enter_Percentage_Increase / 100)
WHERE MedicineID IN (
  SELECT ui.MedicineID
  FROM Used_In ui
  JOIN Surgery s ON ui.SurgeryID = s.SurgeryID
  WHERE s.DoctorID = &Enter_Doctor_ID
);
```

**Results Before Update:**
![Update Query 1 - Before](images/update/update1_before.png)

**Results After Update:**
![Update Query 1 - After](images/update/update1_after.png)

### UPDATE Query 2
**Description:** Update the birth date of all patients older than a given age to a new specified birth date.

**Query Code:**
```sql
UPDATE Patient
SET BirthDate = TO_DATE('&Enter_New_BirthDate', 'DD-MM-YYYY')
WHERE MONTHS_BETWEEN(SYSDATE, BirthDate) / 12 > &Enter_Age;
```

**Results Before Update:**
![Update Query 2 - Before](images/update/update2_before.png)

**Results After Update:**
![Update Query 2 - After](images/update/update2_after.png)

## DELETE Queries

### DELETE Query 1
**Description:** Delete surgeries older than a given number of years.

**Query Code:**
```sql
DELETE FROM Surgery
WHERE SurgeryDate < ADD_MONTHS(SYSDATE, -(&Enter_Years * 12));
```

**Results Before Delete:**
![Delete Query 1 - Before](images/delete/delete1_before.png)

**Results After Delete:**
![Delete Query 1 - After](images/delete/delete1_after.png)

### DELETE Query 2
**Description:** Delete all patients who have never had a surgery.

**Query Code:**
```sql
DELETE FROM Patient
WHERE PatientID NOT IN (SELECT DISTINCT PatientID FROM Surgery);
```

**Results Before Delete:**
![Delete Query 2 - Before](images/delete/delete2_before.png)

**Results After Delete:**
![Delete Query 2 - After](images/delete/delete2_after.png)

## Constraints

### Constraint 1
**Description:** Add a unique constraint to ensure that no two doctors have the same first name and last name.

**Constraint Code:**
```sql
ALTER TABLE Doctor
ADD CONSTRAINT UC_DoctorName UNIQUE (FirstName, LastName);
```

### Constraint 2
**Description:** Add a check constraint to ensure that medicine dosages are positive.

**Constraint Code:**
```sql
ALTER TABLE Medicine
ADD CONSTRAINT CHK_PositiveDosage CHECK (Dosage > 0);
```

**Results Before Constraints:**
![Constraint - Before](images/constraints/constraint_before.png)

**Results After Constraints:**
![Constraint - After](images/constraints/constraint_after.png)
```

This document includes the remaining sections covering `UPDATE Queries`, `DELETE Queries`, and `Constraints`. Each query is explained with its description, SQL code, and results before and after the query execution. This should provide a complete overview of the database operations for your project.
