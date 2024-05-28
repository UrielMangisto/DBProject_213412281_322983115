# Project Title: Surgery Room Management System
Contributors: Uriel Mangisto, [Other Contributors]

## System: Hospital Data Management System
### Selected Unit: Surgery Room Department

## Introduction
Our project is focused on managing the data of the surgery room department in a hospital. The main functionalities include:

- Storing doctor information
- Storing nurse information
- Managing surgery room details
- Storing patient information
- Documenting surgeries
- Managing medicine used in surgeries

## ERD and DSD Diagrams

### ERD Diagram
![image](https://github.com/UrielMangisto/DBProject_2281_3115/assets/116572127/151473ee-a9c9-4198-b148-8c7d17dbf6c0)

### DSD Diagram
![image](https://github.com/UrielMangisto/DBProject_2281_3115/assets/116572127/de1181c1-0b87-409c-b076-e8e96ab3058a)

## Design Decisions

### Design Choices:
- **Normalization:** The database schema was normalized to the third normal form (3NF) to eliminate redundancy and ensure data integrity.
- **Indexing:** Indexes were added on primary and foreign keys to improve query performance.
- **Data Types:** Appropriate data types were chosen for each field to optimize storage and performance.

### Justifications:
- **Normalization:** By normalizing the schema, we reduce redundancy and prevent anomalies during data operations.
- **Indexing:** Indexing significantly improves the speed of data retrieval operations, which is crucial for a responsive medical system.
- **Data Types:** Choosing the right data types ensures efficient use of storage and enhances query performance.

## Create Table Commands

```sql
CREATE TABLE Doctor (
  DoctorID INT NOT NULL,
  FirstName VARCHAR2(30) NOT NULL,
  LastName VARCHAR2(30) NOT NULL,
  Speciality VARCHAR2(30) NOT NULL,
  StartDate DATE NOT NULL,
  Position VARCHAR2(30) NOT NULL,
  PRIMARY KEY (DoctorID)
);

CREATE TABLE Nurse (
  NurseID INT NOT NULL,
  FirstName VARCHAR2(30) NOT NULL,
  LastName VARCHAR2(30) NOT NULL,
  StartDate DATE NOT NULL,
  PRIMARY KEY (NurseID)
);

CREATE TABLE Surgery_Room (
  RoomID INT NOT NULL,
  Location VARCHAR2(30) NOT NULL,
  RoomType VARCHAR2(30) NOT NULL,
  PRIMARY KEY (RoomID)
);

CREATE TABLE Patient (
  PatientID INT NOT NULL,
  FirstName VARCHAR2(30) NOT NULL,
  LastName VARCHAR2(30) NOT NULL,
  BirthDate DATE NOT NULL,
  PRIMARY KEY (PatientID)
);

CREATE TABLE Medicine (
  MedicineID INT NOT NULL,
  MedicineName VARCHAR2(200) NOT NULL,
  Dosage INT NOT NULL,
  PRIMARY KEY (MedicineID)
);

CREATE TABLE Surgery (
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

CREATE TABLE Used_In (
  MedicineID INT NOT NULL,
  SurgeryID INT NOT NULL,
  PRIMARY KEY (MedicineID, SurgeryID),
  FOREIGN KEY (MedicineID) REFERENCES Medicine(MedicineID),
  FOREIGN KEY (SurgeryID) REFERENCES Surgery(SurgeryID)
);
