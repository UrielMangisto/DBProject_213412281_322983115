WITH NurseDiversity AS ( -- This CTE calculates diversity metrics for each nurse based on recent surgeries
   SELECT n.NurseID, n.FirstName, n.LastName,
          COUNT(DISTINCT s.DoctorID) AS UniqueDoctos, -- Count of unique doctors the nurse worked with
          COUNT(DISTINCT s.SurgeryType) AS UniqueSurgeryTypes, -- Count of unique surgery types the nurse assisted in
          COUNT(*) AS TotalSurgeries -- Total number of surgeries the nurse assisted in
   FROM Nurse n
   JOIN Surgery s ON n.NurseID = s.NurseID
   WHERE s.SurgeryDate >= ADD_MONTHS(SYSDATE, -&Enter_Months_Back) -- Consider surgeries within the specified month range
   GROUP BY n.NurseID, n.FirstName, n.LastName
)
-- This query selects the top nurses based on a diversity score, which is a combination of unique doctors and surgery types
-- The diversity score is calculated as a percentage of the total surgeries
-- Nurses with fewer total surgeries than the specified minimum are excluded
-- The result is ordered in descending order of diversity score and limited to the specified number of top nurses
SELECT NurseID, FirstName, LastName, UniqueDoctos, UniqueSurgeryTypes, TotalSurgeries,
      ROUND((UniqueDoctos + UniqueSurgeryTypes) * 100.0 / (2 * TotalSurgeries), 2) AS DiversityScore
FROM NurseDiversity
WHERE TotalSurgeries >= &Enter_Minimum_Surgeries
ORDER BY DiversityScore DESC
FETCH FIRST &Enter_Top_N_Nurses ROWS ONLY;