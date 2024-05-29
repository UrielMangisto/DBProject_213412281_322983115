# Surgery Room Management System
Contributors: Uriel Mangisto 213412281, Omer Avidar 322983115

## System: Hospital Data Management System
### Selected Unit: Surgery Room Department

# DBProject_2281_3115

## Table of Contents
- [Title Page](#title-page)
- [Introduction](#introduction)
- [ERD and DSD Diagrams](#erd-and-dsd-diagrams)
- [Design Decisions](#design-decisions)
- [Create Table Commands](#create-table-commands)
- [Data Insertion Methods](#data-insertion-methods)
- [Backup and Restore](#backup-and-restore)

## Title Page
**Project Title:** project in Data Bases  
**System:** Medical data management system  
**Selected Unit:** Surgery Room Department

## Introduction
DBProject_2281_3115 is a database project designed for the Surgery Room Department. The project manages data related to surgeries, patients, surgeons, operating rooms, surgical instruments, and post-operative care. The main functionalities include:
- Storing doctor and nurse information
- Storing patient information
- Scheduling and managing surgeries
- Maintaining surgical records
- Documenting medicines used during surgeries

## ERD and DSD Diagrams
**ERD Diagram:**  
![image](https://github.com/UrielMangisto/DBProject_2281_3115/assets/116572127/0aa46089-ba9d-423f-9331-d6a7e8994b65)

**DSD Diagram:**  
![image](https://github.com/UrielMangisto/DBProject_2281_3115/assets/116572127/6e917abe-ac66-49df-bf68-6376cc9b411e)

## Design Decisions
### Design Choices:
- **Normalization:** The database schema was normalized to the third normal form (3NF) to eliminate redundancy and ensure data integrity.
  - **1NF (First Normal Form):** Ensures that the data in each table is atomic, meaning each column contains unique and indivisible values. For instance, in the `Patient` table, each patient has a single `FirstName` and `LastName` in separate columns.
  - **2NF (Second Normal Form):** Ensures that the data is in 1NF and that all non-key attributes are fully dependent on the primary key. For example, in the `Surgery` table, `SurgeryDate`, `SurgeryType`, `RoomID`, `PatientID`, `DoctorID`, and `NurseID` are all dependent on the `SurgeryID`.
  - **3NF (Third Normal Form):** Ensures that the data is in 2NF and that all attributes are only dependent on the primary key. This helps to eliminate transitive dependency. For instance, `Doctor` and `Patient` tables contain only information directly related to doctors and patients respectively, with no redundant data.
  
- **Indexing:** Indexes were added on primary and foreign keys to improve query performance.
  - **Primary Keys:** Each table has a primary key to uniquely identify each record. For example, `DoctorID` in the `Doctor` table and `PatientID` in the `Patient` table.
  - **Foreign Keys:** Foreign keys are used to link related tables and maintain referential integrity. For instance, `PatientID` in the `Surgery` table references the `Patient` table.
  - **Indexes:** Indexes on primary and foreign keys improve the efficiency of operations like search, insert, update, and delete by reducing the time taken to locate records.
  
- **Data Types:** Appropriate data types were chosen for each field to optimize storage and performance.
  - **VARCHAR2:** Used for variable-length strings such as names and specialties (e.g., `FirstName`, `LastName`, `Speciality`).
  - **DATE:** Used for date values such as `StartDate`, `BirthDate`, and `SurgeryDate` to ensure proper date formatting and operations.
  - **INT:** Used for numeric identifiers such as `DoctorID`, `PatientID`, `RoomID`, `MedicineID` for efficient storage and indexing.

### Justifications:
- **Normalization:** By normalizing the schema, we reduce redundancy and prevent anomalies during data operations.
  - **Redundancy Reduction:** Eliminates duplicate data which reduces the amount of data storage required and ensures consistency across the database.
  - **Data Integrity:** Ensures that updates, deletions, and insertions are performed without introducing anomalies, maintaining the consistency of the database.

- **Indexing:** Indexing significantly improves the speed of data retrieval operations, which is crucial for a responsive medical system.
  - **Query Performance:** Indexes make search operations faster, which is vital for quickly retrieving patient and surgery records in a medical setting.
  - **Efficiency:** Indexes help in efficiently executing joins between tables, especially in complex queries involving multiple tables.

- **Data Types:** Choosing the right data types ensures efficient use of storage and enhances query performance.
  - **Storage Optimization:** Ensures that data is stored in the most efficient format, reducing the overall storage requirements.
  - **Performance:** Optimizes the performance of queries and data manipulation operations by ensuring that the data is stored in the most appropriate format.

## Data Insertion Methods
### Using DataGenerator
![תמונה של WhatsApp‏ 2024-05-28 בשעה 15 16 57_1fb34496](https://github.com/UrielMangisto/DBProject_2281_3115/assets/116572127/d80a2f9c-df42-4f23-9e1d-7f0cc0fca08b)

### Using Mockaroo
![image](https://github.com/UrielMangisto/DBProject_2281_3115/assets/116572127/adb22509-1c3c-4d73-976c-123896dacf3a)

### Using GenerateData
![תמונה של WhatsApp‏ 2024-05-27 בשעה 09 49 02_50404025](https://github.com/UrielMangisto/DBProject_2281_3115/assets/116572127/a94263fa-3e9c-4e53-adc4-f28d3c82d364)

## Create Table Commands
```sql
CREATE TABLE Doctor
(
  DoctorID INT NOT NULL,
  FirstName VARCHAR2(30) NOT NULL,
  LastName VARCHAR2(30) NOT NULL,
  Speciality VARCHAR2(30) NOT NULL,
  StartDate DATE NOT NULL,
  Position VARCHAR2(30) NOT NULL,
  PRIMARY KEY (DoctorID)
);

CREATE TABLE Nurse
(
  NurseID INT NOT NULL,
  FirstName VARCHAR2(30) NOT NULL,
  LastName VARCHAR2(30) NOT NULL,
  StartDate DATE NOT NULL,
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
  LastName VARCHAR2(30) NOT NULL,
  BirthDate DATE NOT NULL,
  PRIMARY KEY (PatientID)
);

CREATE TABLE Medicine
(
  MedicineID INT NOT NULL,
  MedicineName VARCHAR2(200) NOT NULL,
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
...
