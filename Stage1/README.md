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
- [Backup](#backup)
- [Restore](#restore)

 


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
```
![image](https://github.com/UrielMangisto/DBProject_2281_3115/assets/116590126/1e10adc3-559d-4754-a7e9-a635beb6aa95)
![image](https://github.com/UrielMangisto/DBProject_2281_3115/assets/116590126/4f94a3bc-0e24-4691-aac9-72ce89a812a3)
![image](https://github.com/UrielMangisto/DBProject_2281_3115/assets/116590126/3c2f8dfe-192e-4151-b78f-a37a923e9ff8)
![image](https://github.com/UrielMangisto/DBProject_2281_3115/assets/116590126/23f37f95-48b7-4621-914a-0d83eafb46c6)
![image](https://github.com/UrielMangisto/DBProject_2281_3115/assets/116590126/60f44013-18c7-4c97-ae52-39a9fa342d51)
![image](https://github.com/UrielMangisto/DBProject_2281_3115/assets/116590126/2d9b91f2-3ae2-48ae-9081-5b037ee9bec6)
![image](https://github.com/UrielMangisto/DBProject_2281_3115/assets/116590126/5308a218-4166-4a7c-9be8-88b0ee61a2fc)

## .desc Command
![צילום מסך 2024-05-29 213434](https://github.com/UrielMangisto/DBProject_2281_3115/assets/116590126/204cc2b9-9786-4471-8c77-c67a6fb3878c)

# Data Insertion Methods
## Using DataGenerator
![תמונה של WhatsApp‏ 2024-05-28 בשעה 15 16 50_f02e2687](https://github.com/UrielMangisto/DBProject_2281_3115/assets/116590126/cfb631ca-ed0e-4ecd-8a8c-dbe4031a894a)

## Using GenerateData

![תמונה של WhatsApp‏ 2024-05-27 בשעה 09 49 06_5c929fff](https://github.com/UrielMangisto/DBProject_2281_3115/assets/116590126/58055397-9a0b-4adb-acff-1c2b6573674e)

## Using Mockaroo
![תמונה של WhatsApp‏ 2024-05-30 בשעה 02 00 36_e80f176a](https://github.com/UrielMangisto/DBProject_2281_3115/assets/116590126/0adb81e1-eed4-48cf-acb1-5995f8fa1336)
![תמונה של WhatsApp‏ 2024-05-30 בשעה 02 01 07_5034235f](https://github.com/UrielMangisto/DBProject_2281_3115/assets/116590126/e4ad3f8d-fd04-4180-9f89-f910c6a15e09)

# csv import screenshots
## doctor
![image](https://github.com/UrielMangisto/DBProject_2281_3115/assets/116590126/3d027c60-4f4a-42cd-aab2-8221056446ce)

![image](https://github.com/UrielMangisto/DBProject_2281_3115/assets/116590126/6f44e191-8928-4112-b0b8-20fed3760fb3)
## medicine
![image](https://github.com/UrielMangisto/DBProject_2281_3115/assets/116590126/e411f051-f32a-4944-9272-556a307d4331)

![image](https://github.com/UrielMangisto/DBProject_2281_3115/assets/116590126/5ff3014e-7502-41a2-be5f-6d1c0b0e83ef)

## patient
![image](https://github.com/UrielMangisto/DBProject_2281_3115/assets/116590126/696233a0-4e79-435c-b5b1-1f2dd97591ad)

![image](https://github.com/UrielMangisto/DBProject_2281_3115/assets/116590126/c4ac9885-c2b5-4e64-be47-4f36fd6be6a2)

# Backup 
![image](https://github.com/UrielMangisto/DBProject_2281_3115/assets/116590126/decbce04-6ad0-4157-aa68-8f0980483dc6)


# Restore

![image](https://github.com/UrielMangisto/DBProject_2281_3115/assets/116590126/9eb9f48b-4ea9-4bbc-8359-1521fab6d66e)
![image](https://github.com/UrielMangisto/DBProject_2281_3115/assets/116590126/6bfe03e7-51b9-427a-8274-63cde3a4fef5)



