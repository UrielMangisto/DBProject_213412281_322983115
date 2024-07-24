-- Creating a Surgery-focused view named SurgeryOverview
CREATE VIEW SurgeryOverview AS
SELECT 
    s.SurgeryID,        -- Unique identifier for each surgery
    s.SurgeryDate,      -- Date when the surgery was performed
    s.SurgeryType,      -- Type or category of the surgery
    p.PatientID,        -- Unique identifier for the patient
    p.FullName AS PatientName,  -- Full name of the patient
    d.DoctorID,         -- Unique identifier for the doctor
    d.FullName AS DoctorName,   -- Full name of the doctor
    d.Speciality,       -- Doctor's medical speciality
    sr.RoomID,          -- Unique identifier for the surgery room
    sr.Location AS RoomLocation,  -- Physical location of the surgery room
    m.MedicineID,       -- Unique identifier for medicine used (if any)
    m.MedicineName      -- Name of the medicine used (if any)
FROM 
    Surgery s
    JOIN Patient p ON s.PatientID = p.PatientID  -- Linking surgery to patient
    JOIN Doctor d ON s.DoctorID = d.DoctorID     -- Linking surgery to doctor
    JOIN Surgery_Room sr ON s.RoomID = sr.RoomID  -- Linking surgery to room
    LEFT JOIN Used_In ui ON s.SurgeryID = ui.SurgeryID  -- Linking surgery to medicines used
    LEFT JOIN Medicine m ON ui.MedicineID = m.MedicineID;  -- Getting medicine details
-- Note: LEFT JOIN is used for Used_In1 and Medicine1 as not all surgeries might use medicines
