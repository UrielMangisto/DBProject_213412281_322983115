-- This query deletes records from the Used_In table for surgeries that meet the following conditions:
-- 1. The patient was 65 years or older at the time of surgery
-- 2. The surgery was performed by a cardiologist
-- 3. The surgery took place more than 6 months ago
-- 4. The nurse assisting in the surgery started working more than 2 years ago
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