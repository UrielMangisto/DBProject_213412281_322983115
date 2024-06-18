-- This query retrieves information about surgeries, patients, doctors, and medicines
-- based on the following criteria:
-- 1. Doctor's specialty (provided by the user)
-- 2. Minimum patient age (provided by the user)
-- 3. Minimum medicine dosage (provided by the user)
-- The results are ordered by surgery date in descending order

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