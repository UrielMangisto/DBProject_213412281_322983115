WITH RoomUsage AS ( -- This CTE calculates the usage count of each surgery room for a specific surgery type and date range
   SELECT sr.RoomID, sr.Location, sr.RoomType, COUNT(*) AS UsageCount
   FROM Surgery_Room sr
   JOIN Surgery s ON sr.RoomID = s.RoomID
   WHERE s.SurgeryType = '&Enter_Surgery_Type'
     AND s.SurgeryDate BETWEEN TO_DATE('&Enter_Start_Date', 'DD-MM-YYYY') 
                            AND TO_DATE('&Enter_End_Date', 'DD-MM-YYYY')
   GROUP BY sr.RoomID, sr.Location, sr.RoomType
),
AverageUsage AS ( -- This CTE calculates the average usage count across all surgery rooms
   SELECT AVG(UsageCount) AS AvgUsage
   FROM RoomUsage
)
-- This query selects the surgery rooms with usage count higher than the average
-- The rooms are ordered in descending order of usage count
SELECT ru.RoomID, ru.Location, ru.RoomType, ru.UsageCount
FROM RoomUsage ru
CROSS JOIN AverageUsage au
WHERE ru.UsageCount > au.AvgUsage
ORDER BY ru.UsageCount DESC;