-- rename tebles
rename Doctor to Doctor1;
rename Nurse to Nurse1;
rename Patient to Patient1;
rename Medicine to Medicine1;
rename Surgery to Surgery1;
rename Surgery_Room to Surgery_Room1;
rename Used_In to Used_In1;


--count tables
SELECT COUNT(*) FROM DOCTOR1;
SELECT COUNT(*) FROM DOCTORS;

SELECT COUNT(*) FROM PATIENT1;
SELECT COUNT(*) FROM PATIENTS;


--count differences
SELECT * FROM DOCTORS D WHERE D.DOCTOR_ID NOT IN (SELECT DOCTORID FROM DOCTOR1); --ALL THE DOCTORS (400) ARE DIFFERENT


SELECT * FROM PATIENTS P WHERE P.PATIENT_ID NOT IN (SELECT PATIENTID FROM PATIENT1);--ALL THE PATIENTS (400) ARE DIFFERENT

--merge doctors and doctor1:

--preprocessing doctor1:

ALTER TABLE Doctor1
ADD FullName VARCHAR2(61);

UPDATE Doctor1
SET FullName = FirstName || ' ' || LastName;

ALTER TABLE Doctor1
DROP COLUMN FirstName;

ALTER TABLE Doctor1
DROP COLUMN LastName;

ALTER TABLE Doctor1
ADD ContactInformation VARCHAR2(50) NULL;

ALTER TABLE Doctor1 MODIFY Position VARCHAR2(30) NULL;


--inserting:
INSERT INTO Doctor1 (DoctorID, FullName, Speciality, StartDate, Position, ContactInformation)
SELECT Doctor_ID, Name, Specialty, Date_of_Start_working, 'Unknown', Contact_Information
FROM Doctors;

--merge patients and patient1:

--preprocessing patient1:

ALTER TABLE Patient1
ADD Gender VARCHAR2(10) NULL;
ALTER TABLE Patient1
ADD ContactInformation VARCHAR2(50) NULL;
ALTER TABLE Patient1
ADD Insurance VARCHAR2(10) NULL;

ALTER TABLE Patient1
ADD FullName VARCHAR2(61);

UPDATE Patient1
SET FullName = FirstName || ' ' || LastName;

ALTER TABLE Patient1
DROP COLUMN FirstName;
ALTER TABLE Patient1
DROP COLUMN LastName;

--inserting:
INSERT INTO Patient1 (PatientID, FullName, BirthDate, Gender, ContactInformation, Insurance)
SELECT Patient_ID, Name, Date_of_Birth, Gender, Contact_Information, Insurance
FROM Patients;


-- CONSTRAINTS CANCLETION
ALTER TABLE Appointment DROP CONSTRAINT SYS_C008867;
ALTER TABLE Appointment DROP CONSTRAINT SYS_C008866;
ALTER TABLE MedicalRecord DROP CONSTRAINT SYS_C008875;
ALTER TABLE Billing DROP CONSTRAINT SYS_C008889;

-- TABLES DROPPING
DROP TABLE DocPat;
DROP TABLE Doctors;
DROP TABLE Patients;

-- ADDING CONSTRAINTS AGAIN
ALTER TABLE Appointment
ADD CONSTRAINT fk_patient
FOREIGN KEY (PATIENT_ID)
REFERENCES PATIENT1 (PATIENTID);

ALTER TABLE Appointment
ADD CONSTRAINT fk_doctor
FOREIGN KEY (DOCTOR_ID)
REFERENCES DOCTOR1 (DOCTORID);

ALTER TABLE MedicalRecord
ADD CONSTRAINT fk_patient1
FOREIGN KEY (PATIENT_ID)
REFERENCES PATIENT1 (PATIENTID);

ALTER TABLE Billing
ADD CONSTRAINT fk_patient2
FOREIGN KEY (PATIENT_ID)
REFERENCES PATIENT1 (PATIENTID);

-- RENAME BACK:
rename Doctor1 to Doctor;
rename Nurse1 to Nurse;
rename Patient1 to Patient;
rename Medicine1 to Medicine;
rename Surgery1 to Surgery;
rename Surgery_Room1 to Surgery_Room;
rename Used_In1 to Used_In;
