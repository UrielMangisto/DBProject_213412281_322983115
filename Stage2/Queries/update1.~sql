-- This query updates the dosage of all medicines to the average dosage of medicines used by senior doctors
UPDATE Medicine m
SET DOSAGE = ( -- This subquery calculates the average dosage of medicines used by senior doctors
   SELECT AVG(m2.DOSAGE)
   FROM Medicine m2
   JOIN Used_In u ON m2.MedicineID = u.MedicineID
   JOIN Surgery s ON u.SurgeryID = s.SurgeryID
   JOIN Doctor d ON s.DoctorID = d.DoctorID
   WHERE d.Position = 'Senior' -- Consider only senior doctors
       AND m2.MedicineID IN ( -- Consider only medicines used by senior doctors
           SELECT DISTINCT u2.MedicineID
           FROM Used_In u2
           JOIN Surgery s2 ON u2.SurgeryID = s2.SurgeryID
           JOIN Doctor d2 ON s2.DoctorID = d2.DoctorID
           WHERE d2.Position = 'Senior')
)
COMMIT; -- Commit the changes to the database