-- This query deletes records from the Patient table for patients who meet the following conditions:
-- 1. They have not undergone any surgery
-- 2. Their birth date is before January 1, 1970

DELETE FROM Patient
WHERE PatientID NOT IN (
    SELECT DISTINCT PatientID
    FROM Surgery
)
AND BirthDate < TO_DATE('1970-01-01', 'YYYY-MM-DD');
COMMIT;