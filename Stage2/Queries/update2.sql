-- Update the StartDate for nurses in the Nurse table
UPDATE Nurse n
SET StartDate = NVL(
    (
        -- Subquery to find the earliest surgery date for nurses where the patient was born in 1985
        SELECT MIN(s.SurgeryDate)
        FROM Surgery s
        JOIN Patient p ON s.PatientID = p.PatientID
        WHERE EXTRACT(YEAR FROM p.BirthDate) = 1985
            AND s.NurseID = n.NurseID
    ),
    -- If no such surgery exists, keep the original StartDate
    n.StartDate
)
-- Apply the update only to nurses who participated in surgeries with patients born in 1985
WHERE n.NurseID IN (
    SELECT DISTINCT s.NurseID
    FROM Surgery s
    JOIN Patient p ON s.PatientID = p.PatientID
    WHERE EXTRACT(YEAR FROM p.BirthDate) = 1985
);
