-- Query 1: Appointments in the last six months
SELECT 
    Appointment_Date,  -- The date of the appointment
    PatientName,       -- The name of the patient
    DoctorName,        -- The name of the doctor
    Reason_For_Visit   -- The reason for the visit
FROM 
    AppointmentsOverview  -- The view that contains appointment data
WHERE 
    Appointment_Date BETWEEN ADD_MONTHS(TRUNC(SYSDATE), -6) AND SYSDATE;
    -- The appointment date is between six months ago and today
    -- ADD_MONTHS(TRUNC(SYSDATE), -6) calculates the date exactly six months ago from today
    -- TRUNC(SYSDATE) truncates the current date to midnight (the start of the current day)
    -- SYSDATE represents the current date and time

-- Query 2: Appointments with doctors from the busiest speciality
SELECT 
    Appointment_Date,
    PatientName,
    DoctorName,
    Speciality,
    Reason_For_Visit
FROM 
    AppointmentsOverview
WHERE 
    Speciality = (
        SELECT Speciality
        FROM AppointmentsOverview
        GROUP BY Speciality
        ORDER BY COUNT(*) DESC
        FETCH FIRST 1 ROW ONLY
    );
