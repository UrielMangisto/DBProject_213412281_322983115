-- Update the position of doctors who have performed surgeries involving patients born in a specific year range 
-- (e.g., 1970 to 1980) to 'Senior Doctor'
UPDATE Doctor d
SET Position = 'Senior'
WHERE d.DoctorID IN (
    SELECT DISTINCT s.DoctorID
    FROM Surgery s
    JOIN Patient p ON s.PatientID = p.PatientID
    WHERE EXTRACT(YEAR FROM p.BirthDate) BETWEEN 1970 AND 1980
);
