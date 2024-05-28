# Database Project

## Project Overview

This project involves designing and implementing a database with at least six entities, each with a minimum of three attributes. The design includes two significant DATE attributes and follows 3NF normalization. The project includes creating ERD and DSD diagrams, SQL scripts for table creation, data insertion, and data retrieval, as well as backing up the database.

## Folder Structure

- `ERDPlus Files`: Contains the ERD and DSD diagrams.
- `SQL Scripts`: Contains the SQL scripts for creating, dropping, inserting, and selecting tables.
- `Data Generation Methods`: Contains subfolders for different data generation methods used.

## SQL Scripts

- `createTables.sql`: Script to create all the tables.
- `dropTables.sql`: Script to drop all the tables in the correct order.
- `insertTables.sql`: Script to insert data into the tables.
- `selectAll.sql`: Script to select all data from the tables.

## Data Generation Methods

We used three methods to populate the database with data:

1. **Data Generator**:
   - Files are in the `DGFiles` folder.
2. **Mockaroo**:
   - Files are in the `mockarooFiles` folder.
3. **Generatedata**:
   - Files are in the `generatedataFiles` folder.

Each method's folder contains the necessary configuration and data files.

## Database Backup

- The backup of the database is saved as `backup.sql`. It includes `CREATE TABLE` commands and insert statements for all data.

## How to Use

1. **Create Tables**: Run `createTables.sql` to create the database tables.
2. **Insert Data**: Use `insertTables.sql` to populate the tables with data.
3. **Select Data**: Run `selectAll.sql` to retrieve all data from the tables.
4. **Drop Tables**: Use `dropTables.sql` to drop the tables when needed.

## ERD and DSD

- The ERD and DSD diagrams are available in the `ERDPlus Files` folder.

## Project Report

The project report includes detailed information about the design decisions, normalization process, and data generation methods. It is available as `README.md` or `project_report.pdf`.

## Contributors

- Uriel Mangisto
- [Other contributors]

## Contact

For any questions or suggestions, please contact [your email].

