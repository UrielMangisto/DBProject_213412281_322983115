CREATE TABLE Doctor
(
  DoctorID INT NOT NULL,
  Speciality VARCHAR2(30) NOT NULL,
  FirstName VARCHAR2(30) NOT NULL,
  StartDate DATE NOT NULL,
  Position VARCHAR2(30) NOT NULL,
  LastName VARCHAR2(30) NOT NULL,
  PRIMARY KEY (DoctorID)
);

CREATE TABLE Nurse
(
  NurseID INT NOT NULL,
  FirstName VARCHAR2(30) NOT NULL,
  StartDate DATE NOT NULL,
  LastName VARCHAR2(30) NOT NULL,
  PRIMARY KEY (NurseID)
);

CREATE TABLE Surgery_Room
(
  RoomID INT NOT NULL,
  Location VARCHAR2(30) NOT NULL,
  RoomType VARCHAR2(30) NOT NULL,
  PRIMARY KEY (RoomID)
);

CREATE TABLE Patient
(
  PatientID INT NOT NULL,
  FirstName VARCHAR2(30) NOT NULL,
  BirthDate DATE NOT NULL,
  LastName VARCHAR2(30) NOT NULL,
  PRIMARY KEY (PatientID)
);

CREATE TABLE Medicine
(
  MedicineID INT NOT NULL,
  Name VARCHAR2(30) NOT NULL,
  Dosage INT NOT NULL,
  PRIMARY KEY (MedicineID)
);

CREATE TABLE Surgery
(
  SurgeryID INT NOT NULL,
  SurgeryDate DATE NOT NULL,
  SurgeryType VARCHAR2(30) NOT NULL,
  RoomID INT NOT NULL,
  PatientID INT NOT NULL,
  DoctorID INT NOT NULL,
  NurseID INT NOT NULL,
  PRIMARY KEY (SurgeryID),
  FOREIGN KEY (RoomID) REFERENCES Surgery_Room(RoomID),
  FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
  FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID),
  FOREIGN KEY (NurseID) REFERENCES Nurse(NurseID)
);

CREATE TABLE Used_In
(
  MedicineID INT NOT NULL,
  SurgeryID INT NOT NULL,
  PRIMARY KEY (MedicineID, SurgeryID),
  FOREIGN KEY (MedicineID) REFERENCES Medicine(MedicineID),
  FOREIGN KEY (SurgeryID) REFERENCES Surgery(SurgeryID)
);
