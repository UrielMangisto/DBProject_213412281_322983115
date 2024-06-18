-- This query calculates the average number of surgeries and the maximum number of high-dosage medicines used per doctor, grouped by specialty
WITH CTE_DoctorStats AS ( -- This CTE calculates the number of surgeries and high-dosage medicines used per doctor
 SELECT d.DoctorID, d.FirstName, d.LastName, d.Speciality,
        COUNT(s.SurgeryID) AS NumSurgeries, -- Count of surgeries performed by the doctor
        SUM(CASE WHEN m.Dosage > (SELECT AVG(Dosage) FROM Medicine) THEN 1 ELSE 0 END) AS NumHighDosageMedicines -- Count of high-dosage medicines used by the doctor
 FROM Doctor d
 LEFT JOIN Surgery s ON d.DoctorID = s.DoctorID
 LEFT JOIN Used_In ui ON s.SurgeryID = ui.SurgeryID
 LEFT JOIN Medicine m ON ui.MedicineID = m.MedicineID
 GROUP BY d.DoctorID, d.FirstName, d.LastName, d.Speciality
)
-- This query calculates the average number of surgeries and the maximum number of high-dosage medicines used per doctor, grouped by specialty
-- The result is ordered in descending order of the average number of surgeries per doctor
SELECT Speciality, 
      AVG(NumSurgeries) AS AvgSurgeriesPerDoctor, -- Average number of surgeries per doctor for each specialty
      MAX(NumHighDosageMedicines) AS MaxHighDosageMedicinesPerDoctor -- Maximum number of high-dosage medicines used by any doctor in each specialty
FROM CTE_DoctorStats
GROUP BY Speciality
ORDER BY AvgSurgeriesPerDoctor DESC;