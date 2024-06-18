SELECT p.FirstName, p.LastName, p.BirthDate,
       -- Correlated subquery to count the number of distinct surgeries for each patient
       (SELECT COUNT(DISTINCT s.SurgeryID)
        FROM Surgery s
        WHERE s.PatientID = p.PatientID) AS NumSurgeries,
       -- Correlated subquery to count the number of distinct medicines used for each patient
       (SELECT COUNT(DISTINCT ui.MedicineID)
        FROM Surgery s
        JOIN Used_In ui ON s.SurgeryID = ui.SurgeryID
        WHERE s.PatientID = p.PatientID) AS NumMedicines,
       -- Correlated subquery to calculate the average dosage of medicines used for each patient
       (SELECT ROUND(AVG(m.Dosage), 2)
        FROM Surgery s
        JOIN Used_In ui ON s.SurgeryID = ui.SurgeryID
        JOIN Medicine m ON ui.MedicineID = m.MedicineID
        WHERE s.PatientID = p.PatientID) AS AvgMedicineDosage
FROM Patient p
-- Order the results by the number of surgeries in descending order, 
-- then by the number of distinct medicines in descending order
ORDER BY NumSurgeries DESC, NumMedicines DESC;