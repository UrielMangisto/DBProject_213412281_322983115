# Stage 2- Database Queries

This README provides an overview of several database queries designed for analyzing hospital data, including SELECT, DELETE, UPDATE, and PARAMSELECT queries.

### SELECT Queries

1. **Monthly Surgery Count per Doctor**
   - מציג את מספר הניתוחים שכל רופא ביצע, מקובצים לפי חודש ושנה.
   ```sql
   SELECT d.FirstName, d.LastName, EXTRACT(MONTH FROM s.SurgeryDate) AS Month, EXTRACT(YEAR FROM s.SurgeryDate) AS Year, COUNT(s.SurgeryID) AS SurgeryCount
   FROM Doctor d
   CROSS JOIN (
     SELECT SurgeryID, DoctorID, SurgeryDate
     FROM Surgery
   ) s
   ON d.DoctorID = s.DoctorID
   GROUP BY d.FirstName, d.LastName, EXTRACT(MONTH FROM s.SurgeryDate), EXTRACT(YEAR FROM s.SurgeryDate)
   ORDER BY d.FirstName, d.LastName, Year, Month;
   ```
![Example Image](https://github.com/UrielMangisto/DBProject_2281_3115/blob/main/Stage2/Images/Select1Proof.png)

2. **Doctors with Above-Average Surgeries**
   - מפרט רופאים שביצעו יותר ניתוחים מהממוצע, כולל התמחות, מספר ניתוחים וגיל ממוצע של המטופל
      ```sql
      WITH DoctorSurgeryStats AS (
     SELECT d.DoctorID, d.FirstName, d.LastName, d.Speciality, COUNT(s.SurgeryID) AS SurgeryCount, AVG(MONTHS_BETWEEN(SYSDATE, p.BirthDate)/12) AS AvgPatientAge
     FROM Doctor d
     JOIN Surgery s ON d.DoctorID = s.DoctorID
     JOIN Patient p ON s.PatientID = p.PatientID
     GROUP BY d.DoctorID, d.FirstName, d.LastName, d.Speciality
      ),
      AverageSurgeryCount AS (
        SELECT AVG(SurgeryCount) AS AvgCount
        FROM DoctorSurgeryStats
      )
      SELECT d.FirstName, d.LastName, d.Speciality, d.SurgeryCount, d.AvgPatientAge
      FROM DoctorSurgeryStats d
      JOIN AverageSurgeryCount a ON d.SurgeryCount > a.AvgCount
      ORDER BY d.SurgeryCount DESC;
      ```
  ![Example Image](https://github.com/UrielMangisto/DBProject_2281_3115/blob/main/Stage2/Images/Select2Proof.png)

3. **Patient Surgery and Medicine Details**
   - מציג את פרטי המטופלים, מספר הניתוחים, תרופות שונות שניתנו והמינון הממוצע.
   ```sql
   SELECT p.FirstName, p.LastName, p.BirthDate, COUNT(s.SurgeryID) AS SurgeryCount, COUNT(DISTINCT m.MedicineID) AS UniqueMedicines, AVG(m.Dosage) AS AvgDosage
   FROM Patient p
   JOIN Surgery s ON p.PatientID = s.PatientID
   JOIN Used_In ui ON s.SurgeryID = ui.SurgeryID
   JOIN Medicine m ON ui.MedicineID = m.MedicineID
   GROUP BY p.FirstName, p.LastName, p.BirthDate
   ORDER BY SurgeryCount DESC, UniqueMedicines DESC;
   ```
  ![Example Image](https://github.com/UrielMangisto/DBProject_2281_3115/blob/main/Stage2/Images/Select3Proof.png)


4. **Specialty Surgery and Medicine Statistics**
   - עבור כל התמחות רפואית, מציג את מספר הניתוחים הממוצע לרופא ואת המספר המרבי של תרופות בשימוש במינון גבוה מהממוצע.
   ```sql
     WITH DoctorStats AS (
     SELECT d.Speciality, d.DoctorID, COUNT(s.SurgeryID) AS SurgeryCount, COUNT(CASE WHEN                m.Dosage > (SELECT AVG(Dosage) FROM Medicine) THEN 1 END) AS HighDosageMedicines
     FROM Doctor d
     JOIN Surgery s ON d.DoctorID = s.DoctorID
     JOIN Used_In ui ON s.SurgeryID = ui.SurgeryID
     JOIN Medicine m ON ui.MedicineID = m.MedicineID
     GROUP BY d.Speciality, d.DoctorID
   )
   SELECT Speciality, AVG(SurgeryCount) AS AvgSurgeryCount, MAX(HighDosageMedicines) AS MaxHighDosageMedicines
   FROM DoctorStats
   GROUP BY Speciality
   ORDER BY AvgSurgeryCount DESC;
   ```

  ![Example Image](https://github.com/UrielMangisto/DBProject_2281_3115/blob/main/Stage2/Images/Select4Proof.png)


### DELETE Queries

1. **Delete Specific Surgeries from Used_In**
   - מחק שורות מטבלת Used In עבור ניתוחים שבהם המטופל היה בן 65+, שבוצע על ידי קרדיולוג, לפני למעלה מ-6 חודשים, ללא אחות חדשה.
   ```sql
   DELETE FROM Used_In
   WHERE SurgeryID IN (
     SELECT s.SurgeryID
     FROM Surgery s
     JOIN Patient p ON s.PatientID = p.PatientID
     JOIN Doctor d ON s.DoctorID = d.DoctorID
     WHERE MONTHS_BETWEEN(SYSDATE, p.BirthDate)/12 >= 65
       AND d.Speciality = 'Cardiology'
       AND s.SurgeryDate < ADD_MONTHS(SYSDATE, -6)
       AND NOT EXISTS (
         SELECT 1
         FROM Nurse n
         WHERE n.NurseID = s.NurseID
           AND n.StartDate >= ADD_MONTHS(SYSDATE, -24)
       )
   );
   ```
 ![Example Image](https://github.com/UrielMangisto/DBProject_2281_3115/blob/main/Stage2/Images/DeleteProofA1.jpg)
  
2. **Delete Patients without Surgeries**
   - מוחק מטופלים שלא עברו ניתוחים ונולדו לפני תאריך מסוים
   ```sql
   DELETE FROM Patient
   WHERE PatientID NOT IN (SELECT DISTINCT PatientID FROM Surgery)
     AND BirthDate < TO_DATE('01-01-1970', 'DD-MM-YYYY');
   ```
 ![Example Image](https://github.com/UrielMangisto/DBProject_2281_3115/blob/main/Stage2/Images/DeleteProof2.jpg)






### UPDATE Queries

1. **Update Medicine Dosage**
   - מעדכן את הרופאים שניתחו אנשים שנולדו בים 1970 ל 1980 לדרגת רופא בכיר 

```sql
UPDATE Doctor d
SET Position = 'Senior'
WHERE d.DoctorID IN (
    SELECT DISTINCT s.DoctorID
    FROM Surgery s
    JOIN Patient p ON s.PatientID = p.PatientID
    WHERE EXTRACT(YEAR FROM p.BirthDate) BETWEEN 1970 AND 1980
);
  
```
![Example Image](https://github.com/UrielMangisto/DBProject_2281_3115/blob/main/Stage2/Images/UpdateProof1.jpg)


2. **Update Nurse Start Dates**
   - מעדכן את תאריך התחלת העבודה של אחיות שהשתתפו ביותר מניתוח אחד למועד הניתוח הראשון
   ```sql
   UPDATE Nurse n
   SET n.StartDate = (
     SELECT MIN(s.SurgeryDate)
     FROM Surgery s
     WHERE s.NurseID = n.NurseID
   )
   WHERE n.NurseID IN (
     SELECT NurseID
     FROM Surgery
     GROUP BY NurseID
     HAVING COUNT(SurgeryID) > 1
   );
   ```

### PARAMSELECT Queries

1. **Surgeries by Doctor Specialty and Patient Age**
   - מוצא ניתוחים על ידי רופא עם התמחות ספציפית, כאשר המטופל מבוגר מגיל נתון ובניתוח נעשה שימוש בתרופה שהמינון יותר ממינון מוגדר
   ```sql
   SELECT s.SurgeryID, s.SurgeryDate, s.SurgeryType, p.FirstName AS PatientFirstName, p.LastName AS PatientLastName, d.FirstName AS DoctorFirstName, d.LastName AS DoctorLastName, m.MedicineName, m.Cost AS MedicineCost
   FROM Surgery s
   JOIN Patient p ON s.PatientID = p.PatientID
   JOIN Doctor d ON s.DoctorID = d.DoctorID
   JOIN Used_In ui ON s.SurgeryID = ui.SurgeryID
   JOIN Medicine m ON ui.MedicineID = m.MedicineID
   WHERE d.Speciality = '&Enter_Doctor_Speciality'
     AND MONTHS_BETWEEN(SYSDATE, p.BirthDate)/12 > &Enter_Minimum_Patient_Age
     AND m.Cost > &Enter_Minimum_Medicine_Cost
   ORDER BY s.SurgeryDate DESC;
   ```
![Example Image](https://github.com/UrielMangisto/DBProject_2281_3115/blob/main/Stage2/Images/ParamProof1.png)


2. **Top N Nurses by Surgery Type**
   - מוצא מספר אחיוות לפי הזנת המשתמש שהשתתפו בהכי הרבה ניתוחים בטווח מסויים 
   ```sql
   SELECT * FROM (
     SELECT n.NurseID, n.FirstName, n.LastName, COUNT(*) AS SurgeryCount
     FROM Nurse n
     JOIN Surgery s ON n.NurseID = s.NurseID
     WHERE s.SurgeryType = '&Enter_Surgery_Type'
       AND s.SurgeryDate BETWEEN TO_DATE('&Enter_Start_Date','DD-MM-YYYY') AND TO_DATE('&Enter_End_Date', 'DD-MM-YYYY')
     GROUP BY n.NurseID, n.FirstName, n.LastName
     ORDER BY COUNT(*) DESC
   )
   WHERE ROWNUM <= &Enter_Top_N_Nurses;
   ```
![Example Image](https://github.com/UrielMangisto/DBProject_2281_3115/blob/main/Stage2/Images/ParamProof2.png)


3. **Surgery Room Usage**
   -  מפרט את חדרי הניתוח המשמשים לסוג ניתוח ספציפי יותר מהשימוש הממוצע לסוג זה, בטווח תאריכים מוגדר על ידי המשתמש
   ```sql
   WITH RoomUsage AS ( -- This CTE calculates the usage count of each surgery room for a specific surgery type and date range
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
![Example Image](https://github.com/UrielMangisto/DBProject_2281_3115/blob/main/Stage2/Images/ParamProof3.png)


4. **Nurse Diversity Metrics**
   - מוצא אחיות שעבדו עם המערך המגוון ביותר של רופאים וסוגי ניתוחים, מחושב מהניתוחים אחרונים
   ```sql
   WITH NurseDiversity AS ( -- This CTE calculates diversity metrics for each nurse based on recent surgeries
   SELECT n.NurseID, n.FirstName, n.LastName,
          COUNT(DISTINCT s.DoctorID) AS UniqueDoctos, -- Count of unique doctors the nurse worked with
          COUNT(DISTINCT s.SurgeryType) AS UniqueSurgeryTypes, -- Count of unique surgery types the nurse assisted in
          COUNT(*) AS TotalSurgeries -- Total number of surgeries the nurse assisted in
   FROM Nurse n
   JOIN Surgery s ON n.NurseID = s.NurseID
   WHERE s.SurgeryDate >= ADD_MONTHS(SYSDATE, -&Enter_Months_Back) -- Consider surgeries within the specified month range
   GROUP BY n.NurseID, n.FirstName, n.LastName
   )
   SELECT NurseID, FirstName, LastName, UniqueDoctos, UniqueSurgeryTypes, TotalSurgeries,
         ROUND((UniqueDoctos + UniqueSurgeryTypes) * 100.0 / (2 * TotalSurgeries), 2) AS DiversityScore
   FROM NurseDiversity
   WHERE TotalSurgeries >= &Enter_Minimum_Surgeries
   ORDER BY DiversityScore DESC
   FETCH FIRST &Enter_Top_N_Nurses ROWS ONLY;
   ```
![Example Image](https://github.com/UrielMangisto/DBProject_2281_3115/blob/main/Stage2/Images/ParamProof4.png)



## Constraints
### 1. **CHECK Constraint on Dosage in Medicine Table**
   ```sql
   ALTER TABLE Medicine
   ADD CONSTRAINT chk_medicine_dosage_positive CHECK (Dosage > 0);
   ```
![Example Image](https://github.com/UrielMangisto/DBProject_2281_3115/blob/main/Stage2/Images/CONSTRAINTVIO1.jpg)

### 2. **DEFAULT Constraint on Position in Doctor Table**
   ```sql
   ALTER TABLE Doctor
   MODIFY Position VARCHAR2(30) DEFAULT 'Junior';
   ```
![Example Image](https://github.com/UrielMangisto/DBProject_2281_3115/blob/main/Stage2/Images/CONSTRAINTVIO2.jpg)

### 3. **CHECK Constraint on SurgeryType in Surgery Table**

   ```sql
   ALTER TABLE Surgery
   ADD CONSTRAINT chk_surgery_type CHECK (SurgeryType IN ('Short_surgery','Intermediate_surgerie','Long_surgery'));
   ```
![Example Image](https://github.com/UrielMangisto/DBProject_2281_3115/blob/main/Stage2/Images/CONSTRAINTVIO3.jpg)

