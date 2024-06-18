-- Select doctor's first name, last name, specialty, count of surgeries, and average age of patients
SELECT d.FirstName, d.LastName, d.Speciality, COUNT(s.SurgeryID) AS NumSurgeries, 
       ROUND(AVG(MONTHS_BETWEEN(s.SurgeryDate, p.BirthDate) / 12), 2) AS AvgPatientAge
FROM Doctor d
-- Join the Doctor table with the Surgery table based on DoctorID
JOIN Surgery s ON d.DoctorID = s.DoctorID
-- Join with the Patient table based on PatientID
JOIN Patient p ON s.PatientID = p.PatientID
-- Group the results by doctor's first name, last name, and specialty
GROUP BY d.FirstName, d.LastName, d.Speciality
-- Filter the results to include only doctors who have performed more surgeries than the average
HAVING COUNT(s.SurgeryID) > (
  -- Subquery to calculate the average number of surgeries per doctor
  SELECT AVG(cnt)
  FROM (
    -- Inner subquery to count the number of surgeries for each doctor
    SELECT DoctorID, COUNT(SurgeryID) AS cnt
    FROM Surgery
    GROUP BY DoctorID
  )
)
-- Order the results by the count of surgeries in descending order
ORDER BY NumSurgeries DESC;