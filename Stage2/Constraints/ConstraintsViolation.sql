
-- negative dosage
INSERT INTO Medicine (MedicineID, MedicineName, Dosage)
VALUES (100000, 'Aspirin', -10);

-- no position inserted
INSERT INTO Doctor (DoctorID, FirstName, LastName, Speciality, StartDate)
VALUES (100000, 'John', 'Doe', 'Cardiology', TO_DATE('2022-01-01', 'YYYY-MM-DD'));
-- for the printing
SELECT * FROM Doctor WHERE DoctorID = 100000;

-- it is not one of the 3 from the constraint
INSERT INTO Surgery (SurgeryID, SurgeryDate, SurgeryType, RoomID, PatientID, DoctorID, NurseID)
VALUES (100000, TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'Complex_surgery', 1, 1, 1, 1);
