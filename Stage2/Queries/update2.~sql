-- This query updates the StartDate for nurses who have assisted in more than one surgery
-- to the date of their earliest surgery
UPDATE Nurse n
SET StartDate = ( -- This subquery finds the earliest surgery date for each nurse
   SELECT MIN(s.SurgeryDate)
   FROM Surgery s
   WHERE s.NurseID = n.NurseID -- Match the nurse ID with the surgeries they assisted in
)
WHERE EXISTS ( -- This subquery checks if the nurse has assisted in more than one surgery
   SELECT 1
   FROM Surgery s
   WHERE s.NurseID = n.NurseID
   GROUP BY s.NurseID
   HAVING COUNT(DISTINCT s.SurgeryID) > 1 -- Count the distinct surgery IDs for each nurse
)
COMMIT; -- Commit the changes to the database