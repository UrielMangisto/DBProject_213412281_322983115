-- Select the doctor's first name, last name, and the year, month, and number of surgeries
SELECT d.FirstName, d.LastName, 
       t.year, t.month, t.NumSurgeries
FROM Doctor d
-- Cross join with a subquery to get the year, month, and count of surgeries for each doctor
CROSS JOIN (
  SELECT EXTRACT(YEAR FROM s.SurgeryDate) AS year, -- Extract the year from the surgery date
         EXTRACT(MONTH FROM s.SurgeryDate) AS month, -- Extract the month from the surgery date
         COUNT(*) AS NumSurgeries, -- Count the number of surgeries
         s.DoctorID -- Include the doctor ID
  FROM Surgery s
  -- Group the results by year, month, and doctor ID to get the count for each combination
  GROUP BY EXTRACT(YEAR FROM s.SurgeryDate), EXTRACT(MONTH FROM s.SurgeryDate), s.DoctorID
) t
-- Join the doctor table with the subquery based on the doctor ID
WHERE d.DoctorID = t.DoctorID
-- Order the results by last name, first name, year, and month
ORDER BY d.LastName, d.FirstName, t.year, t.month;