-- Creating an Appointment-focused view named AppointmentOverview
CREATE VIEW AppointmentsOverview AS
SELECT 
    a.Appointment_ID,            -- Unique identifier for each appointment
    a.Appointment_Date,          -- Date of the appointment
    a.Reason_For_Visit,           -- Reason or purpose of the visit
    p.PatientID,                -- Unique identifier for the patient
    p.FullName AS PatientName,  -- Full name of the patient
    p.Gender,                   -- Gender of the patient
    p.Insurance,                -- Patient's insurance information
    d.DoctorID,                 -- Unique identifier for the doctor
    d.FullName AS DoctorName,   -- Full name of the doctor
    d.Speciality,               -- Doctor's medical speciality
    mr.Medical_Record_ID,         -- Unique identifier for the medical record
    mr.Diagnosis,               -- Diagnosis given during the appointment (if any)
    mr.Prescribed_Treatments     -- Treatments prescribed during the appointment (if any)
FROM 
    Appointment a
    JOIN Patient p ON a.Patient_ID = p.PatientID  -- Linking appointment to patient
    JOIN Doctor d ON a.Doctor_ID = d.DoctorID     -- Linking appointment to doctor
    LEFT JOIN MedicalRecord mr ON p.PatientID = mr.Patient_ID;  -- Linking to medical record
-- Note: LEFT JOIN is used for MedicalRecord1 as not all appointments might result in a new medical record entry
