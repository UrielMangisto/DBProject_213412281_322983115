# Stage 2- Database Queries

This README provides an overview of several database queries designed for analyzing hospital data, including SELECT, DELETE, UPDATE, and PARAMSELECT queries.

### SELECT Queries

1. **Monthly Surgery Count per Doctor**
   - Displays the number of surgeries each doctor performed, grouped by month and year.
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

2. **Doctors with Above-Average Surgeries**
   - Lists doctors who performed more surgeries than the average, including specialization, number of surgeries, and average patient age.
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

3. **Patient Surgery and Medicine Details**
   - Shows patients' details, the number of surgeries, different medicines administered, and the average dosage.
   ```sql
   SELECT p.FirstName, p.LastName, p.BirthDate, COUNT(s.SurgeryID) AS SurgeryCount, COUNT(DISTINCT m.MedicineID) AS UniqueMedicines, AVG(m.Dosage) AS AvgDosage
   FROM Patient p
   JOIN Surgery s ON p.PatientID = s.PatientID
   JOIN Used_In ui ON s.SurgeryID = ui.SurgeryID
   JOIN Medicine m ON ui.MedicineID = m.MedicineID
   GROUP BY p.FirstName, p.LastName, p.BirthDate
   ORDER BY SurgeryCount DESC, UniqueMedicines DESC;
   ```

4. **Specialty Surgery and Medicine Statistics**
   - For each medical specialty, displays the average number of surgeries per doctor and the maximum number of medicines with above-average dosage used.
   ```sql
   WITH DoctorStats AS (
     SELECT d.Speciality, d.DoctorID, COUNT(s.SurgeryID) AS SurgeryCount, COUNT(CASE WHEN m.Dosage > (SELECT AVG(Dosage) FROM Medicine) THEN 1 END) AS HighDosageMedicines
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

### DELETE Queries

1. **Delete Specific Surgeries from Used_In**
   - Deletes rows from the Used_In table for surgeries where the patient was 65+, performed by a cardiologist, over 6 months ago, without a recent nurse.
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

2. **Delete Patients without Surgeries**
   - Deletes patients who haven't had surgeries and were born before a specific date.
   ```sql
   DELETE FROM Patient
   WHERE PatientID NOT IN (SELECT DISTINCT PatientID FROM Surgery)
     AND BirthDate < TO_DATE('01-01-1970', 'DD-MM-YYYY');
   ```

### UPDATE Queries

1. **Update Medicine Costs**
   - Updates the cost of medicines used in surgeries performed by doctors with a specific role to the average cost of those medicines.
   ```sql
   UPDATE Medicine m
   SET m.Cost = (
     SELECT AVG(m2.Cost)
     FROM Medicine m2
     JOIN Used_In ui ON m2.MedicineID = ui.MedicineID
     JOIN Surgery s ON ui.SurgeryID = s.SurgeryID
     JOIN Doctor d ON s.DoctorID = d.DoctorID
     WHERE d.Role = 'Chief of Surgery'
   )
   WHERE m.MedicineID IN (
     SELECT m3.MedicineID
     FROM Medicine m3
     JOIN Used_In ui2 ON m3.MedicineID = ui2.MedicineID
     JOIN Surgery s2 ON ui2.SurgeryID = s2.SurgeryID
     JOIN Doctor d2 ON s2.DoctorID = d2.DoctorID
     WHERE d2.Role = 'Chief of Surgery'
   );
   ```

2. **Update Nurse Start Dates**
   - Updates the start date of nurses who participated in more than one surgery to the date of their first surgery.
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
   - Finds surgeries by a doctor with a specific specialty, where the patient is older than a given age and the surgery used a medicine costing more than a specified amount.
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

2. **Top N Nurses by Surgery Type**
   - Finds the top N nurses who assisted in the most surgeries of a specific type within a date range.
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

3. **Surgery Room Usage**
   - Lists surgery rooms used for a specific surgery type more than the average usage for that type, within a specified date range.
   ```sql
   WITH RoomUsage AS (
     SELECT sr.RoomID, sr.Location, sr.RoomType, COUNT(*) AS UsageCount
     FROM Surgery_Room sr
     JOIN Surgery s ON sr.RoomID = s.RoomID
     WHERE s.SurgeryType = '&Enter_Surgery_Type'
       AND s.SurgeryDate BETWEEN TO_DATE('&Enter_Start_Date', 'DD-MM-YYYY') AND TO_DATE('&Enter_End_Date', 'DD-MM-YYYY')
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
