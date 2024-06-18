-- This query retrieves the top N nurses based on the number of surgeries they assisted
-- for a specific type of surgery and within a given date range.
-- It prompts the user to provide the following inputs:
-- 1. Surgery type
-- 2. Start date of the date range
-- 3. End date of the date range
-- 4. The number of top nurses to retrieve (N)

SELECT * FROM (
    SELECT n.NurseID, n.FirstName, n.LastName, COUNT(*) AS SurgeryCount
    FROM Nurse n
    JOIN Surgery s ON n.NurseID = s.NurseID
    WHERE s.SurgeryType = '&Enter_Surgery_Type'
      AND s.SurgeryDate BETWEEN TO_DATE('&Enter_Start_Date','DD-MM-YYYY') 
                             AND TO_DATE('&Enter_End_Date', 'DD-MM-YYYY')
    GROUP BY n.NurseID, n.FirstName, n.LastName
    ORDER BY COUNT(*) DESC
)
WHERE ROWNUM <= &Enter_Top_N_Nurses;