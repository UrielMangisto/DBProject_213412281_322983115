-- Query 1: Analyzing the number of surgeries by type in the last month
SELECT SurgeryType, COUNT(*) AS SurgeryCount
FROM SurgeryDetails
WHERE SurgeryDate >= ADD_MONTHS(SYSDATE, -1)  -- Filtering surgeries from the last month
GROUP BY SurgeryType
ORDER BY SurgeryCount DESC;                   -- Sorting by number of surgeries in descending order

-- Query 2: Identifying doctors performing a high number of surgeries
SELECT DoctorName, COUNT(*) AS SurgeryCount
FROM SurgeryDetails
GROUP BY DoctorName
HAVING COUNT(*) > 5                           -- Filtering doctors with more than 5 surgeries
ORDER BY SurgeryCount DESC;                   -- Sorting by number of surgeries in descending order
