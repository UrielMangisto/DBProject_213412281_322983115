prompt PL/SQL Developer Export Tables for user C##URIEL@XE
prompt Created by o1029 on יום שלישי 28 מאי 2024
set feedback off
set define off

prompt Dropping DOCTOR...
drop table DOCTOR cascade constraints;
prompt Dropping MEDICINE...
drop table MEDICINE cascade constraints;
prompt Dropping NURSE...
drop table NURSE cascade constraints;
prompt Dropping PATIENT...
drop table PATIENT cascade constraints;
prompt Dropping SURGERY_ROOM...
drop table SURGERY_ROOM cascade constraints;
prompt Dropping SURGERY...
drop table SURGERY cascade constraints;
prompt Dropping USED_IN...
drop table USED_IN cascade constraints;
prompt Creating DOCTOR...
create table DOCTOR
(
  doctorid   INTEGER not null,
  firstname  VARCHAR2(30) not null,
  lastname   VARCHAR2(30) not null,
  speciality VARCHAR2(30) not null,
  startdate  DATE not null,
  position   VARCHAR2(30) not null
);
alter table DOCTOR
  add primary key (DOCTORID);

prompt Creating MEDICINE...
create table MEDICINE
(
  medicineid   INTEGER not null,
  medicinename VARCHAR2(200) not null,
  dosage       INTEGER not null
);
alter table MEDICINE
  add primary key (MEDICINEID);

prompt Creating NURSE...
create table NURSE
(
  nurseid   INTEGER not null,
  firstname VARCHAR2(30) not null,
  lastname  VARCHAR2(30) not null,
  startdate DATE not null
);
alter table NURSE
  add primary key (NURSEID);

prompt Creating PATIENT...
create table PATIENT
(
  patientid INTEGER not null,
  firstname VARCHAR2(30) not null,
  lastname  VARCHAR2(30) not null,
  birthdate DATE not null
);
alter table PATIENT
  add primary key (PATIENTID);

prompt Creating SURGERY_ROOM...
create table SURGERY_ROOM
(
  roomid   INTEGER not null,
  location VARCHAR2(30) not null,
  roomtype VARCHAR2(30) not null
);
alter table SURGERY_ROOM
  add primary key (ROOMID);

prompt Creating SURGERY...
create table SURGERY
(
  surgeryid   INTEGER not null,
  surgerydate DATE not null,
  surgerytype VARCHAR2(30) not null,
  roomid      INTEGER not null,
  patientid   INTEGER not null,
  doctorid    INTEGER not null,
  nurseid     INTEGER not null
);
alter table SURGERY
  add primary key (SURGERYID);
alter table SURGERY
  add foreign key (ROOMID)
  references SURGERY_ROOM (ROOMID);
alter table SURGERY
  add foreign key (PATIENTID)
  references PATIENT (PATIENTID);
alter table SURGERY
  add foreign key (DOCTORID)
  references DOCTOR (DOCTORID);
alter table SURGERY
  add foreign key (NURSEID)
  references NURSE (NURSEID);

prompt Creating USED_IN...
create table USED_IN
(
  medicineid INTEGER not null,
  surgeryid  INTEGER not null
);
alter table USED_IN
  add primary key (MEDICINEID, SURGERYID);
alter table USED_IN
  add foreign key (MEDICINEID)
  references MEDICINE (MEDICINEID);
alter table USED_IN
  add foreign key (SURGERYID)
  references SURGERY (SURGERYID);

prompt Disabling triggers for DOCTOR...
alter table DOCTOR disable all triggers;
prompt Disabling triggers for MEDICINE...
alter table MEDICINE disable all triggers;
prompt Disabling triggers for NURSE...
alter table NURSE disable all triggers;
prompt Disabling triggers for PATIENT...
alter table PATIENT disable all triggers;
prompt Disabling triggers for SURGERY_ROOM...
alter table SURGERY_ROOM disable all triggers;
prompt Disabling triggers for SURGERY...
alter table SURGERY disable all triggers;
prompt Disabling triggers for USED_IN...
alter table USED_IN disable all triggers;
prompt Disabling foreign key constraints for SURGERY...
alter table SURGERY disable constraint SYS_C008760;
alter table SURGERY disable constraint SYS_C008761;
alter table SURGERY disable constraint SYS_C008762;
alter table SURGERY disable constraint SYS_C008763;
prompt Disabling foreign key constraints for USED_IN...
alter table USED_IN disable constraint SYS_C008772;
alter table USED_IN disable constraint SYS_C008773;
prompt Loading DOCTOR...
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (1, 'Sol', 'Wythill', 'Oncology', to_date('23-05-1993', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (2, 'Miguela', 'Lemonby', 'Dermatology', to_date('29-04-1990', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (3, 'Opal', 'Zum Felde', 'Oncology', to_date('04-07-1996', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (4, 'Florence', 'Labern', 'Neurology', to_date('18-07-1997', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (5, 'Hulda', 'Idale', 'Oncology', to_date('01-11-1989', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (6, 'Risa', 'Wasiela', 'Cardiology', to_date('01-03-1991', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (7, 'Ray', 'Bream', 'Dermatology', to_date('21-08-1987', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (8, 'Colby', 'Blunsden', 'Surgery', to_date('27-08-1989', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (9, 'Anjanette', 'Garbar', 'Neurology', to_date('26-01-1999', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (10, 'Virginie', 'Halegarth', 'Surgery', to_date('01-12-1991', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (11, 'Thain', 'Jaher', 'Surgery', to_date('27-07-1991', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (12, 'Francisca', 'Allcott', 'Cardiology', to_date('06-03-1990', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (13, 'Weston', 'Toop', 'Oncology', to_date('16-08-1989', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (14, 'Leigh', 'Vakhrushev', 'Dermatology', to_date('30-01-1997', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (15, 'Emmie', 'Gibbetts', 'Oncology', to_date('17-07-1994', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (16, 'Johan', 'Colebourn', 'Cardiology', to_date('09-04-1994', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (17, 'Brooke', 'Aasaf', 'Pediatrics', to_date('01-03-1988', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (18, 'Phoebe', 'Rames', 'Pediatrics', to_date('26-12-1987', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (19, 'Tallie', 'Dunne', 'Neurology', to_date('28-10-1986', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (20, 'Aretha', 'Blaker', 'Pediatrics', to_date('11-09-1995', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (21, 'Shurlocke', 'Singleton', 'Pediatrics', to_date('07-02-1996', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (22, 'Ethelda', 'Gormley', 'Oncology', to_date('31-05-1993', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (23, 'Keenan', 'Sutlieff', 'Cardiology', to_date('28-11-1994', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (24, 'Torey', 'McGarvey', 'Cardiology', to_date('15-11-1994', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (25, 'Jonathon', 'Dickens', 'Neurology', to_date('12-08-2000', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (26, 'Jacenta', 'McGibbon', 'Pediatrics', to_date('26-08-1994', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (27, 'Karlie', 'Dran', 'Surgery', to_date('22-01-1988', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (28, 'Evy', 'Wickmann', 'Psychiatry', to_date('02-07-1989', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (29, 'Karlens', 'Boldison', 'Dermatology', to_date('22-02-1998', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (30, 'Anatole', 'Beckingham', 'Cardiology', to_date('11-08-1989', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (31, 'Brit', 'Cod', 'Cardiology', to_date('21-01-1993', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (32, 'Georgine', 'Morcomb', 'Cardiology', to_date('13-09-1988', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (33, 'Troy', 'Hellwich', 'Surgery', to_date('20-07-1989', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (34, 'Sammy', 'Kedwell', 'Dermatology', to_date('16-11-1985', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (35, 'Price', 'Gilhooley', 'Oncology', to_date('25-10-1995', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (36, 'Abbi', 'Crooks', 'Surgery', to_date('16-11-1990', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (37, 'Ikey', 'Mordey', 'Cardiology', to_date('14-01-1992', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (38, 'Gayleen', 'Freddi', 'Pediatrics', to_date('02-02-2000', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (39, 'Domenic', 'Culter', 'Dermatology', to_date('10-12-1987', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (40, 'Tallulah', 'Broun', 'Pediatrics', to_date('20-10-1989', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (41, 'Celesta', 'Pattington', 'Dermatology', to_date('21-01-1994', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (42, 'Yorgos', 'Baptie', 'Pediatrics', to_date('14-11-1990', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (43, 'Janaya', 'Ewin', 'Psychiatry', to_date('01-02-2000', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (44, 'Star', 'Ellen', 'Surgery', to_date('18-12-1996', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (45, 'Urbano', 'Hamelyn', 'Oncology', to_date('17-03-1991', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (46, 'Kiri', 'Di Lucia', 'Psychiatry', to_date('17-04-1990', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (47, 'Randy', 'Chree', 'Psychiatry', to_date('11-09-1987', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (48, 'Sidonnie', 'Noddles', 'Surgery', to_date('09-09-1992', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (49, 'Reinold', 'Drife', 'Pediatrics', to_date('14-03-1993', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (50, 'Deeanne', 'Abbett', 'Cardiology', to_date('02-05-1989', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (51, 'Roanna', 'Yirrell', 'Oncology', to_date('07-04-1991', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (52, 'Gifford', 'Sarfatti', 'Pediatrics', to_date('29-04-1997', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (53, 'Andrey', 'Gilbank', 'Oncology', to_date('07-11-1996', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (54, 'Shae', 'Gidney', 'Dermatology', to_date('09-12-1992', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (55, 'Chrysa', 'Berr', 'Psychiatry', to_date('17-11-1990', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (56, 'Nathalia', 'Acory', 'Cardiology', to_date('25-02-1990', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (57, 'Brier', 'Mabson', 'Neurology', to_date('04-08-1995', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (58, 'Marrilee', 'Clyma', 'Pediatrics', to_date('04-01-1999', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (59, 'Valdemar', 'Leyden', 'Psychiatry', to_date('12-12-1995', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (60, 'Merrily', 'Rye', 'Surgery', to_date('20-07-1988', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (61, 'Eugenius', 'Barajas', 'Psychiatry', to_date('02-06-1990', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (62, 'Romonda', 'Willcock', 'Dermatology', to_date('21-01-1988', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (63, 'Ailey', 'Agney', 'Dermatology', to_date('08-10-1998', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (64, 'Derk', 'Brewitt', 'Surgery', to_date('10-07-1996', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (65, 'Husein', 'Brigden', 'Psychiatry', to_date('09-10-1996', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (66, 'Rollins', 'Laverenz', 'Dermatology', to_date('26-06-1998', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (67, 'Winna', 'Balderstone', 'Neurology', to_date('08-05-1996', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (68, 'Lia', 'Hess', 'Cardiology', to_date('07-06-1999', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (69, 'Micheal', 'Giovanizio', 'Psychiatry', to_date('12-12-1998', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (70, 'Salomon', 'Ahlin', 'Cardiology', to_date('07-09-1985', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (71, 'Jehu', 'Meeland', 'Neurology', to_date('24-06-1997', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (72, 'Merle', 'Muris', 'Neurology', to_date('10-11-1989', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (73, 'Didi', 'Straw', 'Neurology', to_date('22-01-1989', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (74, 'Miof mela', 'Erickssen', 'Neurology', to_date('02-05-1991', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (75, 'Gratia', 'Rocks', 'Pediatrics', to_date('05-01-1992', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (76, 'Sharity', 'Braxton', 'Psychiatry', to_date('24-12-1992', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (77, 'Burtie', 'Dysert', 'Dermatology', to_date('01-11-1999', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (78, 'Radcliffe', 'Arrandale', 'Oncology', to_date('28-07-1994', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (79, 'Reinwald', 'Yapp', 'Surgery', to_date('12-11-1989', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (80, 'Humfrid', 'Dallewater', 'Pediatrics', to_date('27-07-1996', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (81, 'Dori', 'Castagno', 'Surgery', to_date('10-01-1985', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (82, 'Elise', 'Flello', 'Surgery', to_date('11-10-1999', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (83, 'Olly', 'Cowburn', 'Cardiology', to_date('12-07-1993', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (84, 'Artemus', 'Collibear', 'Oncology', to_date('01-04-1996', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (85, 'Sibyl', 'Stiant', 'Surgery', to_date('01-08-1992', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (86, 'Quinn', 'Cogdon', 'Psychiatry', to_date('14-04-1996', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (87, 'Max', 'Owen', 'Cardiology', to_date('18-12-1988', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (88, 'Stormy', 'Drawmer', 'Oncology', to_date('04-12-1998', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (89, 'Austen', 'Gorden', 'Pediatrics', to_date('07-09-1995', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (90, 'Diahann', 'Burchill', 'Oncology', to_date('25-08-1990', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (91, 'Derrik', 'Mafham', 'Pediatrics', to_date('10-07-1994', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (92, 'Laughton', 'Stenners', 'Surgery', to_date('21-07-1995', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (93, 'Lonny', 'Capron', 'Oncology', to_date('15-06-1988', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (94, 'Brett', 'Shemelt', 'Cardiology', to_date('17-10-1996', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (95, 'Alecia', 'Pockett', 'Pediatrics', to_date('02-10-1994', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (96, 'Nada', 'La Grange', 'Psychiatry', to_date('17-09-1999', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (97, 'Perle', 'Keoghan', 'Neurology', to_date('27-05-1994', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (98, 'Lani', 'Wherton', 'Psychiatry', to_date('13-09-1985', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (99, 'Upton', 'Scard', 'Cardiology', to_date('17-03-1994', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (100, 'Reese', 'Imlaw', 'Pediatrics', to_date('10-11-1986', 'dd-mm-yyyy'), 'Consultant');
commit;
prompt 100 records committed...
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (101, 'Geneva', 'Bonanno', 'Dermatology', to_date('27-09-1988', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (102, 'Tremain', 'Currington', 'Dermatology', to_date('27-01-2000', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (103, 'Consolata', 'Pietron', 'Cardiology', to_date('17-03-1989', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (104, 'Addy', 'Crebott', 'Oncology', to_date('21-06-2000', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (105, 'Deny', 'Doick', 'Psychiatry', to_date('28-08-1997', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (106, 'Geno', 'Cogger', 'Surgery', to_date('10-08-1986', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (107, 'Benetta', 'Toopin', 'Dermatology', to_date('23-09-2000', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (108, 'Weston', 'Turbat', 'Oncology', to_date('01-04-1992', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (109, 'Roselle', 'Cowup', 'Neurology', to_date('29-03-1991', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (110, 'Morty', 'Cornu', 'Surgery', to_date('24-05-1986', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (111, 'Aldrich', 'Hearon', 'Pediatrics', to_date('07-01-2000', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (112, 'Murdoch', 'Burger', 'Neurology', to_date('13-05-1997', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (113, 'Morgen', 'Cuxson', 'Pediatrics', to_date('17-04-1994', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (114, 'Abdul', 'Juarez', 'Pediatrics', to_date('22-08-1994', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (115, 'Francene', 'Measham', 'Dermatology', to_date('12-03-1986', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (116, 'Claudina', 'Robion', 'Oncology', to_date('28-03-1999', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (117, 'Ware', 'Heaseman', 'Surgery', to_date('24-02-1985', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (118, 'Inness', 'Lindenfeld', 'Surgery', to_date('04-06-1994', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (119, 'Jilli', 'Ellerman', 'Dermatology', to_date('03-02-1985', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (120, 'Carson', 'Trouel', 'Dermatology', to_date('07-09-2000', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (121, 'Cash', 'Warren', 'Cardiology', to_date('24-12-1997', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (122, 'Kelcy', 'Stidever', 'Oncology', to_date('16-01-1994', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (123, 'Marje', 'Cullotey', 'Neurology', to_date('14-01-2000', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (124, 'Gradey', 'Labrow', 'Dermatology', to_date('02-03-1990', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (125, 'Barrie', 'Burren', 'Pediatrics', to_date('22-07-1986', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (126, 'Salim', 'Greenhow', 'Pediatrics', to_date('03-09-1996', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (127, 'Kimberlee', 'Mitchiner', 'Cardiology', to_date('16-09-1985', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (128, 'Humberto', 'Clout', 'Neurology', to_date('15-08-1990', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (129, 'Lee', 'Drayn', 'Dermatology', to_date('24-11-1988', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (130, 'Junette', 'Abrahm', 'Cardiology', to_date('02-06-1998', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (131, 'Johannah', 'Crewe', 'Psychiatry', to_date('15-11-1998', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (132, 'Kerk', 'Pointon', 'Neurology', to_date('08-02-1997', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (133, 'Niki', 'Lunam', 'Dermatology', to_date('28-06-1995', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (134, 'Adler', 'Robiou', 'Neurology', to_date('30-05-1987', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (135, 'Mariska', 'Frill', 'Psychiatry', to_date('08-10-1996', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (136, 'Saree', 'Capstake', 'Neurology', to_date('13-11-1991', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (137, 'Sallyanne', 'Sandland', 'Psychiatry', to_date('25-05-1992', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (138, 'Nady', 'Elfes', 'Dermatology', to_date('28-10-1987', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (139, 'Shell', 'Lavarack', 'Dermatology', to_date('10-12-1999', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (140, 'Vivien', 'Mutimer', 'Dermatology', to_date('03-01-1999', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (141, 'Sande', 'Knifton', 'Surgery', to_date('21-05-1998', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (142, 'Lydon', 'Grice', 'Cardiology', to_date('26-03-1997', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (143, 'Clarie', 'Yeoland', 'Cardiology', to_date('03-07-1995', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (144, 'Dannie', 'Ricciardo', 'Neurology', to_date('11-10-1995', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (145, 'Alexina', 'Lyon', 'Psychiatry', to_date('25-12-1999', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (146, 'Rutger', 'Sarver', 'Surgery', to_date('20-03-2000', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (147, 'Angelique', 'Lattos', 'Oncology', to_date('21-02-1988', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (148, 'Yale', 'Sorrell', 'Pediatrics', to_date('02-07-1992', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (149, 'Arleta', 'McLanaghan', 'Oncology', to_date('01-10-1986', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (150, 'Paul', 'Goering', 'Oncology', to_date('16-04-1992', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (151, 'Libbi', 'Meiner', 'Surgery', to_date('19-01-1998', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (152, 'Kalindi', 'Mcimmie', 'Pediatrics', to_date('20-08-1987', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (153, 'Cristin', 'Arpur', 'Dermatology', to_date('09-10-1985', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (154, 'Bartlet', 'Stolting', 'Cardiology', to_date('03-12-1987', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (155, 'Fallon', 'Casajuana', 'Neurology', to_date('10-06-1992', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (156, 'Kerwinn', 'Davidofski', 'Dermatology', to_date('02-10-1990', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (157, 'Maurise', 'Bande', 'Oncology', to_date('11-09-1987', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (158, 'Lorena', 'Nibloe', 'Surgery', to_date('04-06-1989', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (159, 'Ronda', 'Wreath', 'Dermatology', to_date('21-12-1990', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (160, 'Radcliffe', 'Witcombe', 'Oncology', to_date('14-02-1990', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (161, 'Krysta', 'Nassie', 'Cardiology', to_date('23-07-1994', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (162, 'Dorothee', 'Follis', 'Pediatrics', to_date('19-05-1990', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (163, 'Ellwood', 'Neiland', 'Pediatrics', to_date('19-06-1990', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (164, 'Joye', 'Millam', 'Cardiology', to_date('05-08-1988', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (165, 'Samuel', 'Ayree', 'Pediatrics', to_date('25-08-1995', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (166, 'Bendix', 'Getty', 'Pediatrics', to_date('07-06-1996', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (167, 'Myrta', 'Quickenden', 'Cardiology', to_date('10-12-1996', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (168, 'Ryon', 'Riby', 'Cardiology', to_date('06-11-1994', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (169, 'Marjorie', 'Redhead', 'Oncology', to_date('10-09-1986', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (170, 'Paige', 'Whooley', 'Neurology', to_date('24-02-1990', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (171, 'Wendy', 'Cheesley', 'Psychiatry', to_date('03-10-1989', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (172, 'Wood', 'Mattes', 'Neurology', to_date('26-10-1985', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (173, 'Marilyn', 'Peerless', 'Surgery', to_date('09-11-1986', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (174, 'Alfonso', 'Scoggins', 'Dermatology', to_date('03-11-1995', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (175, 'Dunc', 'Barnewall', 'Oncology', to_date('09-06-1989', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (176, 'Herrick', 'Fabler', 'Dermatology', to_date('09-10-1989', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (177, 'Dennie', 'Brosnan', 'Psychiatry', to_date('16-04-1986', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (178, 'Trista', 'Clemmow', 'Dermatology', to_date('23-12-1993', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (179, 'Casey', 'Dougherty', 'Surgery', to_date('17-10-1995', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (180, 'Flynn', 'Kubicka', 'Neurology', to_date('30-11-1991', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (181, 'Amie', 'Cortin', 'Neurology', to_date('11-07-1991', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (182, 'Ulrike', 'MacAlees', 'Pediatrics', to_date('20-05-1995', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (183, 'Billy', 'Caile', 'Pediatrics', to_date('19-06-1985', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (184, 'Mag', 'Boner', 'Neurology', to_date('09-05-1993', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (185, 'Avie', 'Morteo', 'Oncology', to_date('07-08-1996', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (186, 'Lucienne', 'Astbury', 'Surgery', to_date('03-05-1988', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (187, 'Margalo', 'Flancinbaum', 'Surgery', to_date('19-06-1985', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (188, 'Frazer', 'Breslin', 'Oncology', to_date('15-02-1989', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (189, 'Cora', 'Musson', 'Cardiology', to_date('04-12-1989', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (190, 'Dorolisa', 'Marquand', 'Neurology', to_date('08-05-1987', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (191, 'Sibbie', 'Lamball', 'Dermatology', to_date('11-02-1996', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (192, 'Hillary', 'Brougham', 'Dermatology', to_date('19-02-1989', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (193, 'Jackqueline', 'Pennings', 'Oncology', to_date('13-02-1989', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (194, 'Burty', 'Wigfield', 'Cardiology', to_date('21-01-1988', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (195, 'Rickey', 'Sedworth', 'Neurology', to_date('08-10-1989', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (196, 'Shani', 'Kenny', 'Cardiology', to_date('13-09-1999', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (197, 'Chelsae', 'Bussell', 'Cardiology', to_date('22-07-1999', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (198, 'Theresita', 'Pisculli', 'Pediatrics', to_date('09-05-1995', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (199, 'Olivette', 'Swiggs', 'Dermatology', to_date('14-12-1999', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (200, 'Amalia', 'Klempke', 'Neurology', to_date('17-08-1997', 'dd-mm-yyyy'), 'Junior');
commit;
prompt 200 records committed...
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (201, 'Humberto', 'Pym', 'Psychiatry', to_date('13-08-1992', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (202, 'Sashenka', 'Lidster', 'Cardiology', to_date('11-03-1990', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (203, 'Annetta', 'LLelweln', 'Neurology', to_date('29-12-1986', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (204, 'Jeana', 'Zwicker', 'Psychiatry', to_date('10-06-1986', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (205, 'Stevy', 'Burnsell', 'Cardiology', to_date('23-02-1999', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (206, 'Timothy', 'Rainbow', 'Oncology', to_date('21-08-1997', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (207, 'Meredithe', 'Letixier', 'Oncology', to_date('13-04-1985', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (208, 'Ettie', 'Wadforth', 'Oncology', to_date('07-06-1989', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (209, 'Selena', 'Monger', 'Neurology', to_date('04-06-1988', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (210, 'Marketa', 'Christoffe', 'Oncology', to_date('05-08-1991', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (211, 'Jobi', 'Wraith', 'Pediatrics', to_date('29-07-1992', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (212, 'Frederique', 'Ripper', 'Surgery', to_date('21-02-1993', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (213, 'Regen', 'Iveson', 'Cardiology', to_date('27-01-1998', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (214, 'Jodi', 'McCullum', 'Dermatology', to_date('22-11-1991', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (215, 'Leonardo', 'Nornable', 'Oncology', to_date('26-06-1993', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (216, 'Toddy', 'Tattershaw', 'Pediatrics', to_date('10-07-1988', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (217, 'Lina', 'Ralls', 'Dermatology', to_date('24-10-2000', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (218, 'Melloney', 'Baford', 'Neurology', to_date('27-07-1987', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (219, 'Mathilde', 'Bussell', 'Pediatrics', to_date('25-10-1988', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (220, 'Mara', 'Fernehough', 'Dermatology', to_date('29-08-1999', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (221, 'Desdemona', 'Mayhew', 'Psychiatry', to_date('19-04-1987', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (222, 'Slade', 'MacNamara', 'Surgery', to_date('15-04-1992', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (223, 'Charissa', 'Sinclair', 'Surgery', to_date('04-04-1988', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (224, 'Jaquelyn', 'Geindre', 'Oncology', to_date('17-12-1997', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (225, 'Kleon', 'Benezet', 'Neurology', to_date('23-05-1988', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (226, 'Briant', 'Heartfield', 'Dermatology', to_date('01-05-1985', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (227, 'L;urette', 'Angrave', 'Dermatology', to_date('08-12-1985', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (228, 'Everard', 'MacDiarmid', 'Cardiology', to_date('24-01-1998', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (229, 'Zachary', 'Guichard', 'Oncology', to_date('28-04-1999', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (230, 'Fredra', 'Dabney', 'Oncology', to_date('04-06-1997', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (231, 'Patrizia', 'Francescotti', 'Oncology', to_date('16-07-1987', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (232, 'Andrea', 'Charlet', 'Neurology', to_date('09-04-1995', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (233, 'Falkner', 'Welden', 'Surgery', to_date('02-07-1992', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (234, 'Letizia', 'Revett', 'Pediatrics', to_date('19-12-1987', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (235, 'Frants', 'Hoggins', 'Oncology', to_date('04-02-1985', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (236, 'Goldarina', 'Brotherick', 'Oncology', to_date('07-01-1995', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (237, 'Giselle', 'Shwenn', 'Oncology', to_date('14-10-1990', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (238, 'Barri', 'Tallow', 'Cardiology', to_date('23-06-1992', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (239, 'Fredi', 'Sein', 'Neurology', to_date('27-03-1992', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (240, 'Deina', 'Tincey', 'Psychiatry', to_date('23-03-1990', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (241, 'Zsazsa', 'Twydell', 'Psychiatry', to_date('12-01-1990', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (242, 'Maryl', 'Ketcher', 'Pediatrics', to_date('09-09-2000', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (243, 'Arnie', 'Corbould', 'Pediatrics', to_date('19-01-1990', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (244, 'Micheline', 'Reyson', 'Oncology', to_date('06-04-1997', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (245, 'Vito', 'Dawes', 'Dermatology', to_date('14-04-1991', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (246, 'Sheffy', 'Dilke', 'Cardiology', to_date('15-02-1994', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (247, 'Lodovico', 'Saye', 'Neurology', to_date('31-03-1994', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (248, 'Lucia', 'McElane', 'Neurology', to_date('07-12-1992', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (249, 'Holly', 'Silcox', 'Oncology', to_date('07-01-2000', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (250, 'Lucas', 'Benam', 'Psychiatry', to_date('24-08-1991', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (251, 'Pierce', 'Kenwell', 'Psychiatry', to_date('08-02-1986', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (252, 'Terra', 'De Mars', 'Neurology', to_date('13-05-1990', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (253, 'Maximilien', 'Slimings', 'Cardiology', to_date('19-02-1990', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (254, 'Hal', 'Seton', 'Dermatology', to_date('18-05-1992', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (255, 'Valerie', 'Rosenbarg', 'Surgery', to_date('28-01-1992', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (256, 'Rudd', 'Woodroffe', 'Surgery', to_date('12-08-1996', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (257, 'Eustacia', 'Gamblin', 'Dermatology', to_date('14-11-1988', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (258, 'Murdock', 'Kitteringham', 'Surgery', to_date('07-04-1998', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (259, 'Mar', 'Petrosian', 'Dermatology', to_date('06-03-1991', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (260, 'Jaimie', 'Lamplugh', 'Pediatrics', to_date('11-05-1997', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (261, 'Doris', 'Paske', 'Cardiology', to_date('29-11-1994', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (262, 'Boigie', 'Hancox', 'Psychiatry', to_date('01-08-1986', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (263, 'Curr', 'Ruckhard', 'Surgery', to_date('26-10-1986', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (264, 'Evered', 'Cardenosa', 'Oncology', to_date('30-07-1988', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (265, 'Libbey', 'MacDermot', 'Pediatrics', to_date('13-05-1989', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (266, 'Vince', 'Frood', 'Oncology', to_date('01-12-1987', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (267, 'Karlotte', 'Ronan', 'Oncology', to_date('26-03-1990', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (268, 'Cynthea', 'Youthed', 'Dermatology', to_date('04-12-1986', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (269, 'Cindra', 'Tardiff', 'Dermatology', to_date('18-09-1985', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (270, 'Kassi', 'Carmel', 'Psychiatry', to_date('05-12-1996', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (271, 'Corry', 'Haitlie', 'Pediatrics', to_date('04-02-1986', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (272, 'Bradney', 'Cockett', 'Psychiatry', to_date('08-11-1988', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (273, 'Courtney', 'Guinn', 'Cardiology', to_date('20-12-2000', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (274, 'Mame', 'Liddiatt', 'Surgery', to_date('05-04-1998', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (275, 'Glennie', 'Bessey', 'Psychiatry', to_date('05-08-2000', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (276, 'Thornie', 'Buckmaster', 'Dermatology', to_date('29-08-1990', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (277, 'Grannie', 'Labusquiere', 'Neurology', to_date('27-01-1996', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (278, 'Kalie', 'Storre', 'Psychiatry', to_date('15-10-1989', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (279, 'Gwenette', 'Week', 'Surgery', to_date('06-10-1999', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (280, 'Granthem', 'Lippett', 'Neurology', to_date('20-01-1988', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (281, 'Rog', 'Drabble', 'Psychiatry', to_date('20-03-1989', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (282, 'Walker', 'McBain', 'Neurology', to_date('23-04-1987', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (283, 'Dilan', 'Gumbley', 'Neurology', to_date('27-07-1993', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (284, 'Bunnie', 'Lydster', 'Dermatology', to_date('21-11-1992', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (285, 'Morry', 'Vickers', 'Psychiatry', to_date('04-10-1986', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (286, 'Bobbi', 'Metzel', 'Cardiology', to_date('21-08-1992', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (287, 'Yorgo', 'Leger', 'Neurology', to_date('24-10-1998', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (288, 'Dennet', 'Thring', 'Psychiatry', to_date('23-01-1988', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (289, 'Quillan', 'Laxon', 'Dermatology', to_date('22-09-1985', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (290, 'Miranda', 'Procter', 'Surgery', to_date('07-12-1992', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (291, 'Lynea', 'Champley', 'Surgery', to_date('23-08-1999', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (292, 'Lucila', 'Shay', 'Neurology', to_date('06-06-1995', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (293, 'Matthew', 'Pennings', 'Pediatrics', to_date('22-06-1988', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (294, 'Lita', 'Marcome', 'Cardiology', to_date('18-04-1997', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (295, 'Almeda', 'Craise', 'Cardiology', to_date('16-07-1996', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (296, 'Der', 'Crowley', 'Psychiatry', to_date('04-06-1996', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (297, 'Heidi', 'Ruckman', 'Surgery', to_date('27-03-2000', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (298, 'Thibaud', 'Cotilard', 'Surgery', to_date('17-02-1996', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (299, 'Leilah', 'Ledekker', 'Dermatology', to_date('13-01-1994', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (300, 'Catherin', 'Merlin', 'Neurology', to_date('11-06-1986', 'dd-mm-yyyy'), 'Fellow');
commit;
prompt 300 records committed...
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (301, 'Pat', 'O''Murtagh', 'Oncology', to_date('13-05-1992', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (302, 'Kale', 'Merkle', 'Dermatology', to_date('27-03-1986', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (303, 'Chloris', 'Ros', 'Pediatrics', to_date('26-09-1991', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (304, 'Ric', 'Laban', 'Dermatology', to_date('01-10-1986', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (305, 'Robers', 'Enefer', 'Neurology', to_date('21-01-1988', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (306, 'Silvester', 'Venners', 'Dermatology', to_date('01-02-1991', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (307, 'Rodrique', 'Serraillier', 'Oncology', to_date('02-02-1987', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (308, 'Lacee', 'Lauderdale', 'Psychiatry', to_date('26-04-1991', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (309, 'Lilian', 'McWilliam', 'Surgery', to_date('15-08-1990', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (310, 'Harmony', 'Penman', 'Pediatrics', to_date('20-10-1993', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (311, 'Carlene', 'Casey', 'Pediatrics', to_date('31-12-1993', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (312, 'Jocelin', 'Nare', 'Oncology', to_date('16-01-1988', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (313, 'Francklin', 'Sugar', 'Pediatrics', to_date('03-09-1999', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (314, 'Rheba', 'Dumini', 'Dermatology', to_date('09-07-1997', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (315, 'Bobette', 'Ebbings', 'Cardiology', to_date('29-01-1993', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (316, 'Redford', 'Belvin', 'Oncology', to_date('24-10-1985', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (317, 'Raquel', 'Laughrey', 'Oncology', to_date('05-10-1990', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (318, 'Nan', 'Manthorpe', 'Cardiology', to_date('06-02-1999', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (319, 'Mona', 'Wallsam', 'Surgery', to_date('11-03-1998', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (320, 'Friedrick', 'Charker', 'Neurology', to_date('25-05-1992', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (321, 'Tait', 'Mauvin', 'Oncology', to_date('12-04-1996', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (322, 'Berni', 'Gerhardt', 'Neurology', to_date('10-06-1993', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (323, 'Walliw', 'Genner', 'Pediatrics', to_date('13-11-1990', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (324, 'Karine', 'Easman', 'Surgery', to_date('03-05-1990', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (325, 'Mead', 'Donkersley', 'Dermatology', to_date('17-07-1990', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (326, 'Eamon', 'O''Siaghail', 'Dermatology', to_date('22-10-1992', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (327, 'Rayshell', 'Spowage', 'Pediatrics', to_date('06-09-1996', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (328, 'Jo-ann', 'Mayall', 'Cardiology', to_date('28-11-2000', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (329, 'Griff', 'Waine', 'Oncology', to_date('29-06-1992', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (330, 'Wolfgang', 'Cheltnam', 'Oncology', to_date('16-03-1986', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (331, 'Albie', 'Hazelden', 'Cardiology', to_date('13-03-1997', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (332, 'Shane', 'Ramalhete', 'Cardiology', to_date('06-11-1997', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (333, 'Allyce', 'Stubbeley', 'Dermatology', to_date('03-05-1986', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (334, 'Clarissa', 'MacPeice', 'Pediatrics', to_date('23-10-1999', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (335, 'Isidora', 'Seager', 'Oncology', to_date('06-03-1996', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (336, 'Binnie', 'McCoole', 'Oncology', to_date('07-04-1994', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (337, 'Antonio', 'Queyeiro', 'Cardiology', to_date('01-12-1994', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (338, 'Dolf', 'Heart', 'Oncology', to_date('10-07-1991', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (339, 'Sayres', 'Colebeck', 'Pediatrics', to_date('13-01-1992', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (340, 'Oliviero', 'Harwell', 'Psychiatry', to_date('03-06-1994', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (341, 'Nadia', 'Simonutti', 'Oncology', to_date('02-09-1991', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (342, 'Jaymie', 'Challice', 'Surgery', to_date('08-08-1993', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (343, 'Gustaf', 'Dowley', 'Pediatrics', to_date('20-01-1986', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (344, 'Nicolina', 'Christaeas', 'Neurology', to_date('12-03-1990', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (345, 'Kriste', 'Vallis', 'Pediatrics', to_date('18-04-1986', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (346, 'Mitchel', 'Slaney', 'Oncology', to_date('19-04-1995', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (347, 'Ashien', 'Flann', 'Surgery', to_date('06-08-1999', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (348, 'Amalea', 'Filpo', 'Psychiatry', to_date('27-11-1999', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (349, 'Kessiah', 'Bishopp', 'Dermatology', to_date('14-08-1992', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (350, 'Welby', 'Klimaszewski', 'Pediatrics', to_date('12-07-1994', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (351, 'Yasmeen', 'Carlan', 'Surgery', to_date('22-01-1998', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (352, 'Godard', 'Bogeys', 'Neurology', to_date('06-10-1997', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (353, 'Darryl', 'Belsey', 'Dermatology', to_date('13-03-1990', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (354, 'Archer', 'Haswell', 'Psychiatry', to_date('16-05-1997', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (355, 'Hetti', 'Yole', 'Oncology', to_date('07-10-2000', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (356, 'Vida', 'Ridout', 'Cardiology', to_date('02-02-1985', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (357, 'Harlie', 'Burdge', 'Oncology', to_date('23-11-1993', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (358, 'Stella', 'Brodway', 'Cardiology', to_date('11-07-1998', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (359, 'Nyssa', 'Isaacson', 'Dermatology', to_date('14-07-1990', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (360, 'Quinn', 'Gartside', 'Neurology', to_date('22-07-1991', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (361, 'Stanleigh', 'Simonnot', 'Cardiology', to_date('11-03-2000', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (362, 'Bartram', 'Ayris', 'Dermatology', to_date('16-08-1997', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (363, 'Martie', 'Hugett', 'Cardiology', to_date('09-07-1988', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (364, 'Celestine', 'Challace', 'Neurology', to_date('31-03-2000', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (365, 'Orv', 'McDyer', 'Neurology', to_date('12-03-1991', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (366, 'Lucio', 'Fewster', 'Pediatrics', to_date('26-10-1995', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (367, 'Phip', 'Delos', 'Oncology', to_date('24-03-1996', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (368, 'Prue', 'Stallen', 'Neurology', to_date('29-01-1986', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (369, 'Francois', 'Setch', 'Cardiology', to_date('16-05-1994', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (370, 'Franky', 'Prudence', 'Psychiatry', to_date('13-02-1989', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (371, 'Willetta', 'Wheaton', 'Pediatrics', to_date('12-03-1988', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (372, 'Teodorico', 'Girodias', 'Surgery', to_date('21-01-1990', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (373, 'Keen', 'Grassot', 'Neurology', to_date('02-12-1985', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (374, 'Janka', 'Ondricek', 'Neurology', to_date('02-03-1995', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (375, 'Fannie', 'Penrith', 'Pediatrics', to_date('21-04-1995', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (376, 'Melvyn', 'Willgoss', 'Oncology', to_date('03-10-1992', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (377, 'Carney', 'Cupper', 'Cardiology', to_date('21-03-1994', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (378, 'Ellis', 'Steiner', 'Dermatology', to_date('07-05-1999', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (379, 'Wileen', 'Kelsey', 'Neurology', to_date('13-04-1998', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (380, 'Baron', 'Plaskitt', 'Psychiatry', to_date('07-04-1988', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (381, 'Conrado', 'Harkness', 'Oncology', to_date('16-12-1998', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (382, 'Caleb', 'Khilkov', 'Pediatrics', to_date('20-01-1987', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (383, 'Bryanty', 'Edscer', 'Cardiology', to_date('12-08-1992', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (384, 'Joni', 'Willows', 'Oncology', to_date('02-11-1985', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (385, 'Cassandry', 'Latour', 'Neurology', to_date('03-08-1989', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (386, 'Nance', 'Light', 'Cardiology', to_date('22-03-1993', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (387, 'Matti', 'Pennone', 'Cardiology', to_date('21-03-1993', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (388, 'Antonetta', 'Ironside', 'Neurology', to_date('21-08-1990', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (389, 'Borden', 'Scarffe', 'Dermatology', to_date('04-02-1991', 'dd-mm-yyyy'), 'Resident');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (390, 'Nicholas', 'Germain', 'Oncology', to_date('06-01-1997', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (391, 'Robinette', 'Meneo', 'Psychiatry', to_date('12-07-2000', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (392, 'Ahmad', 'O''Henery', 'Psychiatry', to_date('15-12-2000', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (393, 'Umeko', 'O''Hollegan', 'Cardiology', to_date('27-07-1992', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (394, 'Jarred', 'Westbrook', 'Neurology', to_date('28-08-1994', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (395, 'Burnard', 'Breheny', 'Pediatrics', to_date('17-01-1986', 'dd-mm-yyyy'), 'Senior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (396, 'Fredek', 'Willatts', 'Dermatology', to_date('04-12-1997', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (397, 'Christie', 'Skelhorn', 'Cardiology', to_date('25-05-1987', 'dd-mm-yyyy'), 'Consultant');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (398, 'Jacquelin', 'Elsdon', 'Neurology', to_date('19-11-1986', 'dd-mm-yyyy'), 'Fellow');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (399, 'Fonzie', 'Randales', 'Pediatrics', to_date('24-10-1995', 'dd-mm-yyyy'), 'Junior');
insert into DOCTOR (doctorid, firstname, lastname, speciality, startdate, position)
values (400, 'Quinn', 'Glencrosche', 'Neurology', to_date('03-07-1985', 'dd-mm-yyyy'), 'Consultant');
commit;
prompt 400 records loaded
prompt Loading MEDICINE...
insert into MEDICINE (medicineid, medicinename, dosage)
values (1, 'Abilify', 239);
insert into MEDICINE (medicineid, medicinename, dosage)
values (2, 'Triamcinolone Acetonide', 262);
insert into MEDICINE (medicineid, medicinename, dosage)
values (3, 'Diovan', 349);
insert into MEDICINE (medicineid, medicinename, dosage)
values (4, 'Hydrochlorothiazide', 169);
insert into MEDICINE (medicineid, medicinename, dosage)
values (5, 'Ibuprofen (Rx)', 287);
insert into MEDICINE (medicineid, medicinename, dosage)
values (6, 'Cymbalta', 99);
insert into MEDICINE (medicineid, medicinename, dosage)
values (7, 'Plavix', 349);
insert into MEDICINE (medicineid, medicinename, dosage)
values (8, 'Lidoderm', 322);
insert into MEDICINE (medicineid, medicinename, dosage)
values (9, 'Lovaza', 343);
insert into MEDICINE (medicineid, medicinename, dosage)
values (10, 'Ciprofloxacin HCl', 199);
insert into MEDICINE (medicineid, medicinename, dosage)
values (11, 'Triamcinolone Acetonide', 155);
insert into MEDICINE (medicineid, medicinename, dosage)
values (12, 'Tamsulosin HCl', 343);
insert into MEDICINE (medicineid, medicinename, dosage)
values (13, 'Alendronate Sodium', 81);
insert into MEDICINE (medicineid, medicinename, dosage)
values (14, 'Synthroid', 66);
insert into MEDICINE (medicineid, medicinename, dosage)
values (15, 'Oxycodone/APAP', 283);
insert into MEDICINE (medicineid, medicinename, dosage)
values (16, 'Advair Diskus', 26);
insert into MEDICINE (medicineid, medicinename, dosage)
values (17, 'Cymbalta', 217);
insert into MEDICINE (medicineid, medicinename, dosage)
values (18, 'Sertraline HCl', 280);
insert into MEDICINE (medicineid, medicinename, dosage)
values (19, 'Penicillin VK', 341);
insert into MEDICINE (medicineid, medicinename, dosage)
values (20, 'Levoxyl', 282);
insert into MEDICINE (medicineid, medicinename, dosage)
values (21, 'Ranitidine HCl', 16);
insert into MEDICINE (medicineid, medicinename, dosage)
values (22, 'Allopurinol', 151);
insert into MEDICINE (medicineid, medicinename, dosage)
values (23, 'Oxycodone/APAP', 329);
insert into MEDICINE (medicineid, medicinename, dosage)
values (24, 'Folic Acid', 82);
insert into MEDICINE (medicineid, medicinename, dosage)
values (25, 'Gianvi', 148);
insert into MEDICINE (medicineid, medicinename, dosage)
values (26, 'Namenda', 299);
insert into MEDICINE (medicineid, medicinename, dosage)
values (27, 'Amoxicillin', 265);
insert into MEDICINE (medicineid, medicinename, dosage)
values (28, 'Hydrocodone/APAP', 168);
insert into MEDICINE (medicineid, medicinename, dosage)
values (29, 'Symbicort', 171);
insert into MEDICINE (medicineid, medicinename, dosage)
values (30, 'Fluconazole', 155);
insert into MEDICINE (medicineid, medicinename, dosage)
values (31, 'Niaspan', 230);
insert into MEDICINE (medicineid, medicinename, dosage)
values (33, 'Abilify', 29);
insert into MEDICINE (medicineid, medicinename, dosage)
values (34, 'Citalopram HBr', 308);
insert into MEDICINE (medicineid, medicinename, dosage)
values (35, 'Hydrochlorothiazide', 163);
insert into MEDICINE (medicineid, medicinename, dosage)
values (36, 'Amlodipine Besylate', 142);
insert into MEDICINE (medicineid, medicinename, dosage)
values (37, 'Omeprazole (Rx)', 222);
insert into MEDICINE (medicineid, medicinename, dosage)
values (38, 'Albuterol', 298);
insert into MEDICINE (medicineid, medicinename, dosage)
values (39, 'Albuterol', 311);
insert into MEDICINE (medicineid, medicinename, dosage)
values (40, 'Lidoderm', 186);
insert into MEDICINE (medicineid, medicinename, dosage)
values (41, 'Benicar', 108);
insert into MEDICINE (medicineid, medicinename, dosage)
values (42, 'LevothyroxineSodium', 176);
insert into MEDICINE (medicineid, medicinename, dosage)
values (43, 'Endocet', 28);
insert into MEDICINE (medicineid, medicinename, dosage)
values (44, 'Januvia', 336);
insert into MEDICINE (medicineid, medicinename, dosage)
values (45, 'Simvastatin', 325);
insert into MEDICINE (medicineid, medicinename, dosage)
values (46, 'Actos', 292);
insert into MEDICINE (medicineid, medicinename, dosage)
values (47, 'Proair HFA', 224);
insert into MEDICINE (medicineid, medicinename, dosage)
values (48, 'Spiriva Handihaler', 150);
insert into MEDICINE (medicineid, medicinename, dosage)
values (49, 'Naproxen', 253);
insert into MEDICINE (medicineid, medicinename, dosage)
values (51, 'Albuterol', 167);
insert into MEDICINE (medicineid, medicinename, dosage)
values (52, 'Seroquel', 169);
insert into MEDICINE (medicineid, medicinename, dosage)
values (53, 'Cialis', 272);
insert into MEDICINE (medicineid, medicinename, dosage)
values (54, 'Metformin HCl', 83);
insert into MEDICINE (medicineid, medicinename, dosage)
values (55, 'Levoxyl', 232);
insert into MEDICINE (medicineid, medicinename, dosage)
values (56, 'Cephalexin', 330);
insert into MEDICINE (medicineid, medicinename, dosage)
values (57, 'Tri-Sprintec', 320);
insert into MEDICINE (medicineid, medicinename, dosage)
values (58, 'Alendronate Sodium', 212);
insert into MEDICINE (medicineid, medicinename, dosage)
values (59, 'Paroxetine HCl', 177);
insert into MEDICINE (medicineid, medicinename, dosage)
values (60, 'Risperidone', 313);
insert into MEDICINE (medicineid, medicinename, dosage)
values (61, 'Lovaza', 304);
insert into MEDICINE (medicineid, medicinename, dosage)
values (62, 'Tamsulosin HCl', 338);
insert into MEDICINE (medicineid, medicinename, dosage)
values (63, 'Advair Diskus', 171);
insert into MEDICINE (medicineid, medicinename, dosage)
values (64, 'Fluconazole', 308);
insert into MEDICINE (medicineid, medicinename, dosage)
values (65, 'Lantus', 280);
insert into MEDICINE (medicineid, medicinename, dosage)
values (66, 'Glyburide', 210);
insert into MEDICINE (medicineid, medicinename, dosage)
values (67, 'Gianvi', 321);
insert into MEDICINE (medicineid, medicinename, dosage)
values (68, 'Hydrocodone/APAP', 69);
insert into MEDICINE (medicineid, medicinename, dosage)
values (69, 'Tamsulosin HCl', 193);
insert into MEDICINE (medicineid, medicinename, dosage)
values (70, 'Fluticasone Propionate', 88);
insert into MEDICINE (medicineid, medicinename, dosage)
values (71, 'Alendronate Sodium', 186);
insert into MEDICINE (medicineid, medicinename, dosage)
values (72, 'Citalopram HBR', 149);
insert into MEDICINE (medicineid, medicinename, dosage)
values (73, 'Enalapril Maleate', 339);
insert into MEDICINE (medicineid, medicinename, dosage)
values (74, 'Citalopram HBR', 97);
insert into MEDICINE (medicineid, medicinename, dosage)
values (75, 'APAP/Codeine', 262);
insert into MEDICINE (medicineid, medicinename, dosage)
values (76, 'Prednisone', 41);
insert into MEDICINE (medicineid, medicinename, dosage)
values (77, 'Zetia', 339);
insert into MEDICINE (medicineid, medicinename, dosage)
values (78, 'Benicar HCT', 73);
insert into MEDICINE (medicineid, medicinename, dosage)
values (79, 'Enalapril Maleate', 281);
insert into MEDICINE (medicineid, medicinename, dosage)
values (80, 'Levothyroxine Sodium', 220);
insert into MEDICINE (medicineid, medicinename, dosage)
values (81, 'Amoxicillin Trihydrate/Potassium Clavulanate', 181);
insert into MEDICINE (medicineid, medicinename, dosage)
values (82, 'Benicar', 244);
insert into MEDICINE (medicineid, medicinename, dosage)
values (83, 'Glipizide', 51);
insert into MEDICINE (medicineid, medicinename, dosage)
values (84, 'Amitriptyline HCl', 247);
insert into MEDICINE (medicineid, medicinename, dosage)
values (85, 'Nexium', 134);
insert into MEDICINE (medicineid, medicinename, dosage)
values (86, 'Lantus', 27);
insert into MEDICINE (medicineid, medicinename, dosage)
values (87, 'Carvedilol', 96);
insert into MEDICINE (medicineid, medicinename, dosage)
values (89, 'Januvia', 309);
insert into MEDICINE (medicineid, medicinename, dosage)
values (90, 'Klor-Con M20', 245);
insert into MEDICINE (medicineid, medicinename, dosage)
values (91, 'Oxycodone/APAP', 45);
insert into MEDICINE (medicineid, medicinename, dosage)
values (92, 'Proair HFA', 16);
insert into MEDICINE (medicineid, medicinename, dosage)
values (93, 'Lipitor', 54);
insert into MEDICINE (medicineid, medicinename, dosage)
values (94, 'Hydrocodone/APAP', 153);
insert into MEDICINE (medicineid, medicinename, dosage)
values (95, 'Loestrin 24 Fe', 44);
insert into MEDICINE (medicineid, medicinename, dosage)
values (96, 'Lantus', 250);
insert into MEDICINE (medicineid, medicinename, dosage)
values (97, 'Amlodipine Besylate', 154);
insert into MEDICINE (medicineid, medicinename, dosage)
values (98, 'Metoprolol Succinatee', 49);
insert into MEDICINE (medicineid, medicinename, dosage)
values (99, 'LevothyroxineSodium', 251);
insert into MEDICINE (medicineid, medicinename, dosage)
values (100, 'Pantoprazole Sodium', 68);
insert into MEDICINE (medicineid, medicinename, dosage)
values (101, 'Bystolic', 305);
insert into MEDICINE (medicineid, medicinename, dosage)
values (102, 'Symbicort', 45);
insert into MEDICINE (medicineid, medicinename, dosage)
values (103, 'Diazepam', 149);
commit;
prompt 100 records committed...
insert into MEDICINE (medicineid, medicinename, dosage)
values (104, 'Cialis', 126);
insert into MEDICINE (medicineid, medicinename, dosage)
values (105, 'Methylprednisolone', 311);
insert into MEDICINE (medicineid, medicinename, dosage)
values (106, 'Metoprolol Succinate', 29);
insert into MEDICINE (medicineid, medicinename, dosage)
values (107, 'Famotidine', 340);
insert into MEDICINE (medicineid, medicinename, dosage)
values (108, 'Proair HFA', 225);
insert into MEDICINE (medicineid, medicinename, dosage)
values (109, 'Metoprolol Succinatee', 109);
insert into MEDICINE (medicineid, medicinename, dosage)
values (110, 'Venlafaxine HCl ER', 53);
insert into MEDICINE (medicineid, medicinename, dosage)
values (111, 'Clindamycin HCl', 116);
insert into MEDICINE (medicineid, medicinename, dosage)
values (112, 'Plavix', 100);
insert into MEDICINE (medicineid, medicinename, dosage)
values (113, 'Ranitidine HCl', 247);
insert into MEDICINE (medicineid, medicinename, dosage)
values (114, 'Sertraline HCl', 42);
insert into MEDICINE (medicineid, medicinename, dosage)
values (115, 'Metoprolol Succinatee', 231);
insert into MEDICINE (medicineid, medicinename, dosage)
values (116, 'Folic Acid', 186);
insert into MEDICINE (medicineid, medicinename, dosage)
values (117, 'Gabapentin', 266);
insert into MEDICINE (medicineid, medicinename, dosage)
values (118, 'Lovastatin', 126);
insert into MEDICINE (medicineid, medicinename, dosage)
values (119, 'Levaquin', 153);
insert into MEDICINE (medicineid, medicinename, dosage)
values (120, 'Flovent HFA', 34);
insert into MEDICINE (medicineid, medicinename, dosage)
values (121, 'Atenolol', 346);
insert into MEDICINE (medicineid, medicinename, dosage)
values (122, 'Abilify', 211);
insert into MEDICINE (medicineid, medicinename, dosage)
values (123, 'Promethazine HCl', 229);
insert into MEDICINE (medicineid, medicinename, dosage)
values (124, 'Carisoprodol', 295);
insert into MEDICINE (medicineid, medicinename, dosage)
values (125, 'Simvastatin', 230);
insert into MEDICINE (medicineid, medicinename, dosage)
values (126, 'Nexium', 331);
insert into MEDICINE (medicineid, medicinename, dosage)
values (127, 'Lidoderm', 277);
insert into MEDICINE (medicineid, medicinename, dosage)
values (128, 'Ranitidine HCl', 326);
insert into MEDICINE (medicineid, medicinename, dosage)
values (129, 'Prednisone', 290);
insert into MEDICINE (medicineid, medicinename, dosage)
values (130, 'Oxycodone HCl', 29);
insert into MEDICINE (medicineid, medicinename, dosage)
values (131, 'Pantoprazole Sodium', 181);
insert into MEDICINE (medicineid, medicinename, dosage)
values (132, 'Cyclobenzaprin HCl', 117);
insert into MEDICINE (medicineid, medicinename, dosage)
values (133, 'Amitriptyline HCl', 65);
insert into MEDICINE (medicineid, medicinename, dosage)
values (134, 'Zyprexa', 208);
insert into MEDICINE (medicineid, medicinename, dosage)
values (135, 'Cymbalta', 94);
insert into MEDICINE (medicineid, medicinename, dosage)
values (136, 'Carisoprodol', 122);
insert into MEDICINE (medicineid, medicinename, dosage)
values (137, 'Nasonex', 134);
insert into MEDICINE (medicineid, medicinename, dosage)
values (138, 'Lorazepam', 152);
insert into MEDICINE (medicineid, medicinename, dosage)
values (139, 'Lyrica', 188);
insert into MEDICINE (medicineid, medicinename, dosage)
values (140, 'Symbicort', 201);
insert into MEDICINE (medicineid, medicinename, dosage)
values (141, 'Clindamycin HCl', 107);
insert into MEDICINE (medicineid, medicinename, dosage)
values (142, 'Lovastatin', 104);
insert into MEDICINE (medicineid, medicinename, dosage)
values (143, 'Pantoprazole Sodium', 34);
insert into MEDICINE (medicineid, medicinename, dosage)
values (144, 'Omeprazole (Rx)', 329);
insert into MEDICINE (medicineid, medicinename, dosage)
values (145, 'Synthroid', 81);
insert into MEDICINE (medicineid, medicinename, dosage)
values (146, 'Venlafaxine HCl ER', 283);
insert into MEDICINE (medicineid, medicinename, dosage)
values (147, 'Venlafaxine HCl ER', 305);
insert into MEDICINE (medicineid, medicinename, dosage)
values (148, 'Cephalexin', 284);
insert into MEDICINE (medicineid, medicinename, dosage)
values (149, 'Lovastatin', 147);
insert into MEDICINE (medicineid, medicinename, dosage)
values (150, 'Januvia', 240);
insert into MEDICINE (medicineid, medicinename, dosage)
values (151, 'Endocet', 312);
insert into MEDICINE (medicineid, medicinename, dosage)
values (152, 'Januvia', 324);
insert into MEDICINE (medicineid, medicinename, dosage)
values (153, 'Nasonex', 296);
insert into MEDICINE (medicineid, medicinename, dosage)
values (154, 'TriNessa', 186);
insert into MEDICINE (medicineid, medicinename, dosage)
values (155, 'Ciprofloxacin HCl', 297);
insert into MEDICINE (medicineid, medicinename, dosage)
values (156, 'LevothyroxineSodium', 131);
insert into MEDICINE (medicineid, medicinename, dosage)
values (157, 'Doxycycline Hyclate', 130);
insert into MEDICINE (medicineid, medicinename, dosage)
values (158, 'Hydrochlorothiazide', 119);
insert into MEDICINE (medicineid, medicinename, dosage)
values (159, 'Amphetamine Salts', 301);
insert into MEDICINE (medicineid, medicinename, dosage)
values (160, 'Penicillin VK', 238);
insert into MEDICINE (medicineid, medicinename, dosage)
values (161, 'Benicar', 139);
insert into MEDICINE (medicineid, medicinename, dosage)
values (162, 'Trazodone HCl', 202);
insert into MEDICINE (medicineid, medicinename, dosage)
values (163, 'Cialis', 103);
insert into MEDICINE (medicineid, medicinename, dosage)
values (164, 'Gabapentin', 126);
insert into MEDICINE (medicineid, medicinename, dosage)
values (165, 'Digoxin', 322);
insert into MEDICINE (medicineid, medicinename, dosage)
values (166, 'Penicillin VK', 256);
insert into MEDICINE (medicineid, medicinename, dosage)
values (167, 'Citalopram HBr', 57);
insert into MEDICINE (medicineid, medicinename, dosage)
values (168, 'Amlodipine Besylate', 214);
insert into MEDICINE (medicineid, medicinename, dosage)
values (169, 'TriNessa', 231);
insert into MEDICINE (medicineid, medicinename, dosage)
values (170, 'Metoprolol Succinatee', 145);
insert into MEDICINE (medicineid, medicinename, dosage)
values (171, 'Promethazine HCl', 161);
insert into MEDICINE (medicineid, medicinename, dosage)
values (172, 'Metoprolol Succinate', 38);
insert into MEDICINE (medicineid, medicinename, dosage)
values (173, 'Benicar', 250);
insert into MEDICINE (medicineid, medicinename, dosage)
values (174, 'LevothyroxineSodium', 93);
insert into MEDICINE (medicineid, medicinename, dosage)
values (175, 'Crestor', 140);
insert into MEDICINE (medicineid, medicinename, dosage)
values (176, 'Diazepam', 144);
insert into MEDICINE (medicineid, medicinename, dosage)
values (177, 'Endocet', 19);
insert into MEDICINE (medicineid, medicinename, dosage)
values (178, 'Tricor', 202);
insert into MEDICINE (medicineid, medicinename, dosage)
values (179, 'Metoprolol Tartrate', 130);
insert into MEDICINE (medicineid, medicinename, dosage)
values (180, 'Metformin HCl', 92);
insert into MEDICINE (medicineid, medicinename, dosage)
values (181, 'Glipizide', 194);
insert into MEDICINE (medicineid, medicinename, dosage)
values (182, 'Metoprolol Succinate', 215);
insert into MEDICINE (medicineid, medicinename, dosage)
values (183, 'Enalapril Maleate', 94);
insert into MEDICINE (medicineid, medicinename, dosage)
values (184, 'Tramadol HCl', 69);
insert into MEDICINE (medicineid, medicinename, dosage)
values (185, 'Carvedilol', 157);
insert into MEDICINE (medicineid, medicinename, dosage)
values (186, 'Tricor', 31);
insert into MEDICINE (medicineid, medicinename, dosage)
values (187, 'Singulair', 78);
insert into MEDICINE (medicineid, medicinename, dosage)
values (188, 'Alendronate Sodium', 158);
insert into MEDICINE (medicineid, medicinename, dosage)
values (189, 'Cyclobenzaprin HCl', 181);
insert into MEDICINE (medicineid, medicinename, dosage)
values (190, 'Prednisone', 276);
insert into MEDICINE (medicineid, medicinename, dosage)
values (191, 'Lyrica', 106);
insert into MEDICINE (medicineid, medicinename, dosage)
values (192, 'Pravastatin Sodium', 118);
insert into MEDICINE (medicineid, medicinename, dosage)
values (193, 'Cephalexin', 302);
insert into MEDICINE (medicineid, medicinename, dosage)
values (194, 'Januvia', 62);
insert into MEDICINE (medicineid, medicinename, dosage)
values (195, 'Venlafaxine HCl ER', 98);
insert into MEDICINE (medicineid, medicinename, dosage)
values (196, 'Doxycycline Hyclate', 269);
insert into MEDICINE (medicineid, medicinename, dosage)
values (197, 'Metoprolol Tartrate', 27);
insert into MEDICINE (medicineid, medicinename, dosage)
values (198, 'Clonazepam', 157);
insert into MEDICINE (medicineid, medicinename, dosage)
values (199, 'Cymbalta', 79);
insert into MEDICINE (medicineid, medicinename, dosage)
values (200, 'Atenolol', 200);
insert into MEDICINE (medicineid, medicinename, dosage)
values (201, 'Vytorin', 80);
insert into MEDICINE (medicineid, medicinename, dosage)
values (202, 'Nexium', 235);
insert into MEDICINE (medicineid, medicinename, dosage)
values (203, 'Amoxicillin Trihydrate/Potassium Clavulanate', 63);
commit;
prompt 200 records committed...
insert into MEDICINE (medicineid, medicinename, dosage)
values (204, 'Folic Acid', 333);
insert into MEDICINE (medicineid, medicinename, dosage)
values (205, 'Zetia', 166);
insert into MEDICINE (medicineid, medicinename, dosage)
values (206, 'Gabapentin', 169);
insert into MEDICINE (medicineid, medicinename, dosage)
values (207, 'Nasonex', 345);
insert into MEDICINE (medicineid, medicinename, dosage)
values (208, 'Furosemide', 203);
insert into MEDICINE (medicineid, medicinename, dosage)
values (209, 'Oxycontin', 322);
insert into MEDICINE (medicineid, medicinename, dosage)
values (210, 'Crestor', 243);
insert into MEDICINE (medicineid, medicinename, dosage)
values (211, 'Oxycodone HCl', 321);
insert into MEDICINE (medicineid, medicinename, dosage)
values (212, 'Hydrochlorothiazide', 276);
insert into MEDICINE (medicineid, medicinename, dosage)
values (213, 'Trazodone HCl', 192);
insert into MEDICINE (medicineid, medicinename, dosage)
values (214, 'Namenda', 236);
insert into MEDICINE (medicineid, medicinename, dosage)
values (215, 'Cymbalta', 293);
insert into MEDICINE (medicineid, medicinename, dosage)
values (216, 'Amitriptyline HCl', 112);
insert into MEDICINE (medicineid, medicinename, dosage)
values (217, 'Vytorin', 300);
insert into MEDICINE (medicineid, medicinename, dosage)
values (218, 'Pravastatin Sodium', 243);
insert into MEDICINE (medicineid, medicinename, dosage)
values (219, 'Sulfamethoxazole/Trimethoprim', 41);
insert into MEDICINE (medicineid, medicinename, dosage)
values (220, 'Vytorin', 225);
insert into MEDICINE (medicineid, medicinename, dosage)
values (221, 'Gianvi', 89);
insert into MEDICINE (medicineid, medicinename, dosage)
values (222, 'Diazepam', 267);
insert into MEDICINE (medicineid, medicinename, dosage)
values (223, 'Crestor', 338);
insert into MEDICINE (medicineid, medicinename, dosage)
values (224, 'Lovastatin', 248);
insert into MEDICINE (medicineid, medicinename, dosage)
values (225, 'Bystolic', 151);
insert into MEDICINE (medicineid, medicinename, dosage)
values (226, 'Alprazolam', 184);
insert into MEDICINE (medicineid, medicinename, dosage)
values (227, 'Diazepam', 254);
insert into MEDICINE (medicineid, medicinename, dosage)
values (228, 'Advair Diskus', 94);
insert into MEDICINE (medicineid, medicinename, dosage)
values (229, 'Ciprofloxacin HCl', 173);
insert into MEDICINE (medicineid, medicinename, dosage)
values (230, 'Amphetamine Salts', 177);
insert into MEDICINE (medicineid, medicinename, dosage)
values (231, 'Meloxicam', 188);
insert into MEDICINE (medicineid, medicinename, dosage)
values (234, 'Ciprofloxacin HCl', 92);
insert into MEDICINE (medicineid, medicinename, dosage)
values (235, 'Hydrochlorothiazide', 119);
insert into MEDICINE (medicineid, medicinename, dosage)
values (236, 'Cymbalta', 199);
insert into MEDICINE (medicineid, medicinename, dosage)
values (237, 'Tamsulosin HCl', 88);
insert into MEDICINE (medicineid, medicinename, dosage)
values (238, 'Benicar HCT', 82);
insert into MEDICINE (medicineid, medicinename, dosage)
values (239, 'Metoprolol Tartrate', 333);
insert into MEDICINE (medicineid, medicinename, dosage)
values (240, 'Gabapentin', 76);
insert into MEDICINE (medicineid, medicinename, dosage)
values (242, 'Nexium', 82);
insert into MEDICINE (medicineid, medicinename, dosage)
values (243, 'Loestrin 24 Fe', 226);
insert into MEDICINE (medicineid, medicinename, dosage)
values (244, 'Tricor', 34);
insert into MEDICINE (medicineid, medicinename, dosage)
values (245, 'Cephalexin', 291);
insert into MEDICINE (medicineid, medicinename, dosage)
values (246, 'Diazepam', 221);
insert into MEDICINE (medicineid, medicinename, dosage)
values (247, 'Methylprednisolone', 58);
insert into MEDICINE (medicineid, medicinename, dosage)
values (248, 'Warfarin Sodium', 245);
insert into MEDICINE (medicineid, medicinename, dosage)
values (249, 'Amoxicillin', 104);
insert into MEDICINE (medicineid, medicinename, dosage)
values (250, 'Folic Acid', 199);
insert into MEDICINE (medicineid, medicinename, dosage)
values (251, 'Metoprolol Succinate', 60);
insert into MEDICINE (medicineid, medicinename, dosage)
values (252, 'Loestrin 24 Fe', 235);
insert into MEDICINE (medicineid, medicinename, dosage)
values (253, 'Lorazepam', 145);
insert into MEDICINE (medicineid, medicinename, dosage)
values (254, 'Pantoprazole Sodium', 99);
insert into MEDICINE (medicineid, medicinename, dosage)
values (255, 'Albuterol', 73);
insert into MEDICINE (medicineid, medicinename, dosage)
values (256, 'Tramadol HCl', 177);
insert into MEDICINE (medicineid, medicinename, dosage)
values (257, 'Paroxetine HCl', 124);
insert into MEDICINE (medicineid, medicinename, dosage)
values (258, 'Enalapril Maleate', 113);
insert into MEDICINE (medicineid, medicinename, dosage)
values (259, 'Albuterol', 345);
insert into MEDICINE (medicineid, medicinename, dosage)
values (260, 'Diazepam', 131);
insert into MEDICINE (medicineid, medicinename, dosage)
values (261, 'Viagra', 306);
insert into MEDICINE (medicineid, medicinename, dosage)
values (262, 'APAP/Codeine', 34);
insert into MEDICINE (medicineid, medicinename, dosage)
values (263, 'Losartan Potassium', 229);
insert into MEDICINE (medicineid, medicinename, dosage)
values (264, 'Crestor', 235);
insert into MEDICINE (medicineid, medicinename, dosage)
values (265, 'Citalopram HBr', 185);
insert into MEDICINE (medicineid, medicinename, dosage)
values (266, 'Nasonex', 316);
insert into MEDICINE (medicineid, medicinename, dosage)
values (267, 'Potassium Chloride', 125);
insert into MEDICINE (medicineid, medicinename, dosage)
values (268, 'Fluoxetine HCl', 178);
insert into MEDICINE (medicineid, medicinename, dosage)
values (269, 'Hydrochlorothiazide', 297);
insert into MEDICINE (medicineid, medicinename, dosage)
values (270, 'Vytorin', 196);
insert into MEDICINE (medicineid, medicinename, dosage)
values (271, 'Nexium', 163);
insert into MEDICINE (medicineid, medicinename, dosage)
values (272, 'Plavix', 286);
insert into MEDICINE (medicineid, medicinename, dosage)
values (273, 'Meloxicam', 346);
insert into MEDICINE (medicineid, medicinename, dosage)
values (274, 'Hydrochlorothiazide', 268);
insert into MEDICINE (medicineid, medicinename, dosage)
values (275, 'Januvia', 67);
insert into MEDICINE (medicineid, medicinename, dosage)
values (276, 'Amphetamine Salts', 30);
insert into MEDICINE (medicineid, medicinename, dosage)
values (277, 'Lovastatin', 134);
insert into MEDICINE (medicineid, medicinename, dosage)
values (278, 'Clindamycin HCl', 286);
insert into MEDICINE (medicineid, medicinename, dosage)
values (279, 'Zyprexa', 101);
insert into MEDICINE (medicineid, medicinename, dosage)
values (280, 'Viagra', 318);
insert into MEDICINE (medicineid, medicinename, dosage)
values (281, 'Tramadol HCl', 105);
insert into MEDICINE (medicineid, medicinename, dosage)
values (282, 'Folic Acid', 157);
insert into MEDICINE (medicineid, medicinename, dosage)
values (283, 'Venlafaxine HCl ER', 189);
insert into MEDICINE (medicineid, medicinename, dosage)
values (284, 'Plavix', 257);
insert into MEDICINE (medicineid, medicinename, dosage)
values (285, 'Diovan', 280);
insert into MEDICINE (medicineid, medicinename, dosage)
values (286, 'Nasonex', 67);
insert into MEDICINE (medicineid, medicinename, dosage)
values (287, 'Doxycycline Hyclate', 92);
insert into MEDICINE (medicineid, medicinename, dosage)
values (288, 'Warfarin Sodium', 38);
insert into MEDICINE (medicineid, medicinename, dosage)
values (289, 'Symbicort', 339);
insert into MEDICINE (medicineid, medicinename, dosage)
values (290, 'Diovan', 136);
insert into MEDICINE (medicineid, medicinename, dosage)
values (291, 'Clindamycin HCl', 309);
insert into MEDICINE (medicineid, medicinename, dosage)
values (292, 'Omeprazole (Rx)', 317);
insert into MEDICINE (medicineid, medicinename, dosage)
values (293, 'Metoprolol Tartrate', 69);
insert into MEDICINE (medicineid, medicinename, dosage)
values (294, 'Diovan', 40);
insert into MEDICINE (medicineid, medicinename, dosage)
values (295, 'Tricor', 225);
insert into MEDICINE (medicineid, medicinename, dosage)
values (296, 'Lovastatin', 288);
insert into MEDICINE (medicineid, medicinename, dosage)
values (297, 'Seroquel', 241);
insert into MEDICINE (medicineid, medicinename, dosage)
values (298, 'Ciprofloxacin HCl', 51);
insert into MEDICINE (medicineid, medicinename, dosage)
values (299, 'Metoprolol Succinate', 72);
insert into MEDICINE (medicineid, medicinename, dosage)
values (300, 'Amphetamine Salts', 136);
insert into MEDICINE (medicineid, medicinename, dosage)
values (301, 'Folic Acid', 125);
insert into MEDICINE (medicineid, medicinename, dosage)
values (302, 'Ciprofloxacin HCl', 196);
insert into MEDICINE (medicineid, medicinename, dosage)
values (303, 'Klor-Con M20', 164);
insert into MEDICINE (medicineid, medicinename, dosage)
values (304, 'Cheratussin AC', 186);
insert into MEDICINE (medicineid, medicinename, dosage)
values (305, 'Alprazolam', 200);
insert into MEDICINE (medicineid, medicinename, dosage)
values (306, 'Namenda', 19);
commit;
prompt 300 records committed...
insert into MEDICINE (medicineid, medicinename, dosage)
values (307, 'Methylprednisolone', 252);
insert into MEDICINE (medicineid, medicinename, dosage)
values (308, 'Digoxin', 275);
insert into MEDICINE (medicineid, medicinename, dosage)
values (309, 'Glipizide', 174);
insert into MEDICINE (medicineid, medicinename, dosage)
values (310, 'APAP/Codeine', 210);
insert into MEDICINE (medicineid, medicinename, dosage)
values (311, 'Lipitor', 345);
insert into MEDICINE (medicineid, medicinename, dosage)
values (312, 'Plavix', 104);
insert into MEDICINE (medicineid, medicinename, dosage)
values (313, 'Potassium Chloride', 73);
insert into MEDICINE (medicineid, medicinename, dosage)
values (314, 'Prednisone', 69);
insert into MEDICINE (medicineid, medicinename, dosage)
values (315, 'Amlodipine Besylate', 97);
insert into MEDICINE (medicineid, medicinename, dosage)
values (316, 'Doxycycline Hyclate', 228);
insert into MEDICINE (medicineid, medicinename, dosage)
values (317, 'Lexapro', 18);
insert into MEDICINE (medicineid, medicinename, dosage)
values (318, 'Advair Diskus', 109);
insert into MEDICINE (medicineid, medicinename, dosage)
values (319, 'Benicar HCT', 148);
insert into MEDICINE (medicineid, medicinename, dosage)
values (320, 'Tramadol HCl', 305);
insert into MEDICINE (medicineid, medicinename, dosage)
values (321, 'Sulfamethoxazole/Trimethoprim', 144);
insert into MEDICINE (medicineid, medicinename, dosage)
values (322, 'Tri-Sprintec', 30);
insert into MEDICINE (medicineid, medicinename, dosage)
values (323, 'Nexium', 151);
insert into MEDICINE (medicineid, medicinename, dosage)
values (324, 'Methylprednisolone', 247);
insert into MEDICINE (medicineid, medicinename, dosage)
values (325, 'Oxycontin', 76);
insert into MEDICINE (medicineid, medicinename, dosage)
values (326, 'Diovan', 252);
insert into MEDICINE (medicineid, medicinename, dosage)
values (327, 'Simvastatin', 67);
insert into MEDICINE (medicineid, medicinename, dosage)
values (328, 'Lidoderm', 301);
insert into MEDICINE (medicineid, medicinename, dosage)
values (329, 'TriNessa', 64);
insert into MEDICINE (medicineid, medicinename, dosage)
values (330, 'Lipitor', 182);
insert into MEDICINE (medicineid, medicinename, dosage)
values (331, 'Metformin HCl', 130);
insert into MEDICINE (medicineid, medicinename, dosage)
values (332, 'LevothyroxineSodium', 305);
insert into MEDICINE (medicineid, medicinename, dosage)
values (333, 'Digoxin', 186);
insert into MEDICINE (medicineid, medicinename, dosage)
values (334, 'Venlafaxine HCl ER', 144);
insert into MEDICINE (medicineid, medicinename, dosage)
values (335, 'Atenolol', 97);
insert into MEDICINE (medicineid, medicinename, dosage)
values (336, 'Glyburide', 136);
insert into MEDICINE (medicineid, medicinename, dosage)
values (337, 'Carvedilol', 278);
insert into MEDICINE (medicineid, medicinename, dosage)
values (338, 'Clonazepam', 118);
insert into MEDICINE (medicineid, medicinename, dosage)
values (339, 'Azithromycin', 62);
insert into MEDICINE (medicineid, medicinename, dosage)
values (340, 'Meloxicam', 271);
insert into MEDICINE (medicineid, medicinename, dosage)
values (341, 'Digoxin', 210);
insert into MEDICINE (medicineid, medicinename, dosage)
values (342, 'Niaspan', 319);
insert into MEDICINE (medicineid, medicinename, dosage)
values (344, 'Zolpidem Tartrate', 80);
insert into MEDICINE (medicineid, medicinename, dosage)
values (345, 'Clindamycin HCl', 98);
insert into MEDICINE (medicineid, medicinename, dosage)
values (346, 'Diazepam', 298);
insert into MEDICINE (medicineid, medicinename, dosage)
values (347, 'Loestrin 24 Fe', 332);
insert into MEDICINE (medicineid, medicinename, dosage)
values (348, 'Suboxone', 220);
insert into MEDICINE (medicineid, medicinename, dosage)
values (349, 'Prednisone', 263);
insert into MEDICINE (medicineid, medicinename, dosage)
values (350, 'Lovaza', 318);
insert into MEDICINE (medicineid, medicinename, dosage)
values (351, 'Warfarin Sodium', 52);
insert into MEDICINE (medicineid, medicinename, dosage)
values (352, 'Fluoxetine HCl', 220);
insert into MEDICINE (medicineid, medicinename, dosage)
values (353, 'Lidoderm', 146);
insert into MEDICINE (medicineid, medicinename, dosage)
values (354, 'Metoprolol Succinate', 305);
insert into MEDICINE (medicineid, medicinename, dosage)
values (355, 'Singulair', 201);
insert into MEDICINE (medicineid, medicinename, dosage)
values (356, 'Triamcinolone Acetonide', 225);
insert into MEDICINE (medicineid, medicinename, dosage)
values (357, 'Nuvaring', 313);
insert into MEDICINE (medicineid, medicinename, dosage)
values (358, 'Alprazolam', 214);
insert into MEDICINE (medicineid, medicinename, dosage)
values (359, 'Ciprofloxacin HCl', 27);
insert into MEDICINE (medicineid, medicinename, dosage)
values (360, 'Meloxicam', 72);
insert into MEDICINE (medicineid, medicinename, dosage)
values (361, 'Benicar HCT', 301);
insert into MEDICINE (medicineid, medicinename, dosage)
values (362, 'Cyclobenzaprin HCl', 91);
insert into MEDICINE (medicineid, medicinename, dosage)
values (363, 'Prednisone', 199);
insert into MEDICINE (medicineid, medicinename, dosage)
values (364, 'Lorazepam', 101);
insert into MEDICINE (medicineid, medicinename, dosage)
values (365, 'Promethazine HCl', 106);
insert into MEDICINE (medicineid, medicinename, dosage)
values (366, 'Clindamycin HCl', 194);
insert into MEDICINE (medicineid, medicinename, dosage)
values (367, 'Klor-Con M20', 99);
insert into MEDICINE (medicineid, medicinename, dosage)
values (368, 'Seroquel', 184);
insert into MEDICINE (medicineid, medicinename, dosage)
values (369, 'Premarin', 240);
insert into MEDICINE (medicineid, medicinename, dosage)
values (370, 'Azithromycin', 265);
insert into MEDICINE (medicineid, medicinename, dosage)
values (371, 'Lorazepam', 295);
insert into MEDICINE (medicineid, medicinename, dosage)
values (372, 'Sulfamethoxazole/Trimethoprim', 267);
insert into MEDICINE (medicineid, medicinename, dosage)
values (373, 'Seroquel', 199);
insert into MEDICINE (medicineid, medicinename, dosage)
values (374, 'Omeprazole (Rx)', 159);
insert into MEDICINE (medicineid, medicinename, dosage)
values (375, 'Sulfamethoxazole/Trimethoprim', 333);
insert into MEDICINE (medicineid, medicinename, dosage)
values (376, 'Triamcinolone Acetonide', 245);
insert into MEDICINE (medicineid, medicinename, dosage)
values (377, 'Naproxen', 115);
insert into MEDICINE (medicineid, medicinename, dosage)
values (378, 'Hydrocodone/APAP', 295);
insert into MEDICINE (medicineid, medicinename, dosage)
values (379, 'Potassium Chloride', 152);
insert into MEDICINE (medicineid, medicinename, dosage)
values (380, 'Zyprexa', 236);
insert into MEDICINE (medicineid, medicinename, dosage)
values (381, 'Ranitidine HCl', 309);
insert into MEDICINE (medicineid, medicinename, dosage)
values (382, 'Oxycodone HCl', 137);
insert into MEDICINE (medicineid, medicinename, dosage)
values (383, 'Sertraline HCl', 118);
insert into MEDICINE (medicineid, medicinename, dosage)
values (384, 'Benicar HCT', 275);
insert into MEDICINE (medicineid, medicinename, dosage)
values (385, 'Januvia', 205);
insert into MEDICINE (medicineid, medicinename, dosage)
values (386, 'Metoprolol Succinatee', 185);
insert into MEDICINE (medicineid, medicinename, dosage)
values (387, 'Alendronate Sodium', 110);
insert into MEDICINE (medicineid, medicinename, dosage)
values (388, 'Amoxicillin Trihydrate/Potassium Clavulanate', 197);
insert into MEDICINE (medicineid, medicinename, dosage)
values (389, 'Namenda', 190);
insert into MEDICINE (medicineid, medicinename, dosage)
values (390, 'Januvia', 250);
insert into MEDICINE (medicineid, medicinename, dosage)
values (391, 'Tramadol HCl', 22);
insert into MEDICINE (medicineid, medicinename, dosage)
values (392, 'Prednisone', 185);
insert into MEDICINE (medicineid, medicinename, dosage)
values (393, 'Plavix', 229);
insert into MEDICINE (medicineid, medicinename, dosage)
values (394, 'Lovastatin', 293);
insert into MEDICINE (medicineid, medicinename, dosage)
values (395, 'Lovastatin', 25);
insert into MEDICINE (medicineid, medicinename, dosage)
values (396, 'Spiriva Handihaler', 160);
insert into MEDICINE (medicineid, medicinename, dosage)
values (397, 'Gianvi', 208);
insert into MEDICINE (medicineid, medicinename, dosage)
values (398, 'Ciprofloxacin HCl', 329);
insert into MEDICINE (medicineid, medicinename, dosage)
values (399, 'Actos', 202);
insert into MEDICINE (medicineid, medicinename, dosage)
values (400, 'Enalapril Maleate', 189);
insert into MEDICINE (medicineid, medicinename, dosage)
values (401, 'Cephalexin', 305);
insert into MEDICINE (medicineid, medicinename, dosage)
values (402, 'Ibuprofen (Rx)', 122);
insert into MEDICINE (medicineid, medicinename, dosage)
values (403, 'LevothyroxineSodium', 101);
insert into MEDICINE (medicineid, medicinename, dosage)
values (404, 'Lantus Solostar', 268);
insert into MEDICINE (medicineid, medicinename, dosage)
values (405, 'Namenda', 148);
insert into MEDICINE (medicineid, medicinename, dosage)
values (406, 'Zetia', 122);
insert into MEDICINE (medicineid, medicinename, dosage)
values (407, 'Oxycontin', 62);
commit;
prompt 400 records committed...
insert into MEDICINE (medicineid, medicinename, dosage)
values (408, 'Naproxen', 227);
insert into MEDICINE (medicineid, medicinename, dosage)
values (409, 'Allopurinol', 56);
insert into MEDICINE (medicineid, medicinename, dosage)
values (410, 'Loestrin 24 Fe', 176);
insert into MEDICINE (medicineid, medicinename, dosage)
values (411, 'Gabapentin', 109);
insert into MEDICINE (medicineid, medicinename, dosage)
values (412, 'Alendronate Sodium', 89);
insert into MEDICINE (medicineid, medicinename, dosage)
values (413, 'Clonazepam', 131);
insert into MEDICINE (medicineid, medicinename, dosage)
values (414, 'Ciprofloxacin HCl', 260);
insert into MEDICINE (medicineid, medicinename, dosage)
values (415, 'Alendronate Sodium', 50);
insert into MEDICINE (medicineid, medicinename, dosage)
values (416, 'Atenolol', 306);
insert into MEDICINE (medicineid, medicinename, dosage)
values (417, 'Tri-Sprintec', 150);
insert into MEDICINE (medicineid, medicinename, dosage)
values (418, 'Synthroid', 31);
insert into MEDICINE (medicineid, medicinename, dosage)
values (419, 'Folic Acid', 327);
insert into MEDICINE (medicineid, medicinename, dosage)
values (420, 'Pravastatin Sodium', 241);
insert into MEDICINE (medicineid, medicinename, dosage)
values (421, 'LevothyroxineSodium', 202);
insert into MEDICINE (medicineid, medicinename, dosage)
values (422, 'Singulair', 60);
insert into MEDICINE (medicineid, medicinename, dosage)
values (423, 'Premarin', 268);
insert into MEDICINE (medicineid, medicinename, dosage)
values (424, 'Meloxicam', 317);
insert into MEDICINE (medicineid, medicinename, dosage)
values (425, 'Glyburide', 42);
insert into MEDICINE (medicineid, medicinename, dosage)
values (426, 'Proair HFA', 83);
insert into MEDICINE (medicineid, medicinename, dosage)
values (427, 'Amoxicillin', 342);
insert into MEDICINE (medicineid, medicinename, dosage)
values (428, 'Ventolin HFA', 310);
insert into MEDICINE (medicineid, medicinename, dosage)
values (429, 'Plavix', 88);
insert into MEDICINE (medicineid, medicinename, dosage)
values (430, 'Vytorin', 109);
insert into MEDICINE (medicineid, medicinename, dosage)
values (431, 'Sulfamethoxazole/Trimethoprim', 28);
insert into MEDICINE (medicineid, medicinename, dosage)
values (432, 'Simvastatin', 204);
insert into MEDICINE (medicineid, medicinename, dosage)
values (433, 'Potassium Chloride', 224);
insert into MEDICINE (medicineid, medicinename, dosage)
values (434, 'Crestor', 323);
insert into MEDICINE (medicineid, medicinename, dosage)
values (435, 'Lovaza', 189);
insert into MEDICINE (medicineid, medicinename, dosage)
values (436, 'Amoxicillin', 272);
insert into MEDICINE (medicineid, medicinename, dosage)
values (437, 'Atenolol', 38);
insert into MEDICINE (medicineid, medicinename, dosage)
values (438, 'Abilify', 206);
insert into MEDICINE (medicineid, medicinename, dosage)
values (439, 'Amitriptyline HCl', 266);
insert into MEDICINE (medicineid, medicinename, dosage)
values (440, 'Celebrex', 32);
insert into MEDICINE (medicineid, medicinename, dosage)
values (441, 'Tamsulosin HCl', 259);
insert into MEDICINE (medicineid, medicinename, dosage)
values (442, 'Metoprolol Succinate', 58);
insert into MEDICINE (medicineid, medicinename, dosage)
values (443, 'Digoxin', 128);
insert into MEDICINE (medicineid, medicinename, dosage)
values (444, 'Cymbalta', 37);
insert into MEDICINE (medicineid, medicinename, dosage)
values (445, 'Alendronate Sodium', 189);
insert into MEDICINE (medicineid, medicinename, dosage)
values (446, 'Glyburide', 259);
insert into MEDICINE (medicineid, medicinename, dosage)
values (447, 'Lexapro', 80);
insert into MEDICINE (medicineid, medicinename, dosage)
values (448, 'Benicar HCT', 331);
insert into MEDICINE (medicineid, medicinename, dosage)
values (449, 'Alprazolam', 348);
insert into MEDICINE (medicineid, medicinename, dosage)
values (450, 'Metoprolol Succinatee', 294);
insert into MEDICINE (medicineid, medicinename, dosage)
values (451, 'Prednisone', 174);
insert into MEDICINE (medicineid, medicinename, dosage)
values (452, 'Folic Acid', 99);
insert into MEDICINE (medicineid, medicinename, dosage)
values (453, 'Lantus', 108);
insert into MEDICINE (medicineid, medicinename, dosage)
values (454, 'Oxycodone/APAP', 138);
insert into MEDICINE (medicineid, medicinename, dosage)
values (455, 'Plavix', 301);
insert into MEDICINE (medicineid, medicinename, dosage)
values (456, 'Oxycodone HCl', 314);
insert into MEDICINE (medicineid, medicinename, dosage)
values (457, 'Crestor', 213);
insert into MEDICINE (medicineid, medicinename, dosage)
values (458, 'Folic Acid', 96);
insert into MEDICINE (medicineid, medicinename, dosage)
values (459, 'Amlodipine Besylate', 310);
insert into MEDICINE (medicineid, medicinename, dosage)
values (460, 'Sulfamethoxazole/Trimethoprim', 335);
insert into MEDICINE (medicineid, medicinename, dosage)
values (461, 'Januvia', 246);
insert into MEDICINE (medicineid, medicinename, dosage)
values (462, 'Symbicort', 315);
insert into MEDICINE (medicineid, medicinename, dosage)
values (463, 'Lovaza', 205);
insert into MEDICINE (medicineid, medicinename, dosage)
values (464, 'Gabapentin', 53);
insert into MEDICINE (medicineid, medicinename, dosage)
values (465, 'Citalopram HBR', 35);
insert into MEDICINE (medicineid, medicinename, dosage)
values (466, 'Amlodipine Besylate', 122);
insert into MEDICINE (medicineid, medicinename, dosage)
values (467, 'Crestor', 349);
insert into MEDICINE (medicineid, medicinename, dosage)
values (468, 'Symbicort', 287);
insert into MEDICINE (medicineid, medicinename, dosage)
values (469, 'Clindamycin HCl', 125);
insert into MEDICINE (medicineid, medicinename, dosage)
values (470, 'Penicillin VK', 53);
insert into MEDICINE (medicineid, medicinename, dosage)
values (471, 'Warfarin Sodium', 266);
insert into MEDICINE (medicineid, medicinename, dosage)
values (472, 'Lidoderm', 136);
insert into MEDICINE (medicineid, medicinename, dosage)
values (473, 'Pravastatin Sodium', 146);
insert into MEDICINE (medicineid, medicinename, dosage)
values (474, 'APAP/Codeine', 177);
insert into MEDICINE (medicineid, medicinename, dosage)
values (475, 'Cymbalta', 233);
insert into MEDICINE (medicineid, medicinename, dosage)
values (476, 'Synthroid', 153);
insert into MEDICINE (medicineid, medicinename, dosage)
values (477, 'Metoprolol Succinate', 204);
insert into MEDICINE (medicineid, medicinename, dosage)
values (478, 'TriNessa', 99);
insert into MEDICINE (medicineid, medicinename, dosage)
values (479, 'Oxycontin', 151);
insert into MEDICINE (medicineid, medicinename, dosage)
values (480, 'Clindamycin HCl', 136);
insert into MEDICINE (medicineid, medicinename, dosage)
values (481, 'Hydrocodone/APAP', 228);
insert into MEDICINE (medicineid, medicinename, dosage)
values (482, 'Ranitidine HCl', 209);
insert into MEDICINE (medicineid, medicinename, dosage)
values (483, 'Ventolin HFA', 280);
insert into MEDICINE (medicineid, medicinename, dosage)
values (484, 'Viagra', 310);
insert into MEDICINE (medicineid, medicinename, dosage)
values (485, 'Nexium', 256);
insert into MEDICINE (medicineid, medicinename, dosage)
values (486, 'Vytorin', 23);
insert into MEDICINE (medicineid, medicinename, dosage)
values (487, 'Tricor', 94);
insert into MEDICINE (medicineid, medicinename, dosage)
values (488, 'Oxycontin', 152);
insert into MEDICINE (medicineid, medicinename, dosage)
values (489, 'Metoprolol Succinatee', 164);
insert into MEDICINE (medicineid, medicinename, dosage)
values (490, 'Singulair', 337);
insert into MEDICINE (medicineid, medicinename, dosage)
values (491, 'Fluconazole', 18);
insert into MEDICINE (medicineid, medicinename, dosage)
values (492, 'Lantus Solostar', 124);
insert into MEDICINE (medicineid, medicinename, dosage)
values (493, 'Citalopram HBr', 211);
insert into MEDICINE (medicineid, medicinename, dosage)
values (494, 'Alprazolam', 213);
insert into MEDICINE (medicineid, medicinename, dosage)
values (495, 'Vytorin', 289);
insert into MEDICINE (medicineid, medicinename, dosage)
values (496, 'Oxycodone HCl', 110);
insert into MEDICINE (medicineid, medicinename, dosage)
values (497, 'Lovastatin', 236);
insert into MEDICINE (medicineid, medicinename, dosage)
values (498, 'Oxycodone HCl', 172);
insert into MEDICINE (medicineid, medicinename, dosage)
values (499, 'Risperidone', 57);
insert into MEDICINE (medicineid, medicinename, dosage)
values (500, 'LevothyroxineSodium', 163);
commit;
prompt 493 records loaded
prompt Loading NURSE...
insert into NURSE (nurseid, firstname, lastname, startdate)
values (1, 'Cherry', 'Grant', to_date('28-08-1999', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (2, 'Garth', 'McGovern', to_date('22-08-1998', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (3, 'Anna', 'Gosdin', to_date('09-11-1995', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (4, 'Kathleen', 'Moorer', to_date('19-10-1995', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (5, 'Jon', 'Jones', to_date('11-02-1984', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (6, 'Ray', 'Oszajca', to_date('07-03-1984', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (7, 'Maria', 'Roy Parnell', to_date('30-10-1984', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (8, 'Elisabeth', 'Paxton', to_date('24-11-1983', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (9, 'Reese', 'Rubinek', to_date('22-12-1987', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (10, 'Austin', 'Fiennes', to_date('07-08-1987', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (11, 'Mitchell', 'Jay', to_date('06-11-1998', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (12, 'Larenz', 'Levine', to_date('19-02-1983', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (13, 'Jon', 'Pryce', to_date('12-04-1983', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (14, 'Praga', 'Jeffreys', to_date('21-02-1999', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (15, 'Harrison', 'Deejay', to_date('20-08-1985', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (16, 'Mia', 'Cazale', to_date('25-03-1992', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (17, 'Kazem', 'Sutherland', to_date('31-05-1986', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (18, 'Juice', 'Bradford', to_date('26-05-1987', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (19, 'Ben', 'Daniels', to_date('25-12-1989', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (20, 'Rose', 'Barrymore', to_date('04-08-1983', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (21, 'Vern', 'Mac', to_date('16-04-1994', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (22, 'Kid', 'Atlas', to_date('06-12-1985', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (23, 'Forest', 'Campbell', to_date('18-06-1988', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (24, 'Teena', 'Davidtz', to_date('30-07-1995', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (25, 'Rowan', 'Crosby', to_date('11-04-1998', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (26, 'Rosario', 'Zane', to_date('03-02-1999', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (27, 'Lili', 'Perez', to_date('29-11-1988', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (28, 'Frank', 'Bryson', to_date('12-12-1982', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (29, 'Kris', 'Northam', to_date('20-03-1986', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (30, 'Carrie', 'Quinn', to_date('09-03-1996', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (31, 'Christian', 'Lowe', to_date('17-07-1987', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (32, 'Frances', 'Miles', to_date('26-12-1986', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (33, 'Colleen', 'Stamp', to_date('14-10-1987', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (34, 'Roy', 'Greene', to_date('25-12-1987', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (35, 'Matt', 'Stevenson', to_date('30-05-1981', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (36, 'Ellen', 'Gryner', to_date('22-11-1991', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (37, 'Linda', 'Liu', to_date('06-08-1983', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (38, 'Rosie', 'Goldblum', to_date('22-08-1984', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (39, 'Lea', 'Bening', to_date('09-03-1999', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (40, 'Jackie', 'Quinones', to_date('13-01-1999', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (41, 'Jon', 'Badalucco', to_date('01-04-1983', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (42, 'Mac', 'Raye', to_date('24-02-1999', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (43, 'Norm', 'Beckham', to_date('11-11-1997', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (44, 'Wes', 'Haynes', to_date('27-07-1995', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (45, 'Meredith', 'Gore', to_date('27-09-1982', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (46, 'Carla', 'Laws', to_date('11-04-1985', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (47, 'Tracy', 'Waits', to_date('27-05-1998', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (48, 'Faye', 'Koteas', to_date('08-01-1999', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (49, 'Robby', 'Tisdale', to_date('22-06-1996', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (50, 'Jamie', 'Cumming', to_date('10-03-1984', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (51, 'Zooey', 'Gleeson', to_date('24-12-1997', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (52, 'Rueben', 'Lucas', to_date('27-05-1984', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (53, 'Cornell', 'Maguire', to_date('01-04-1984', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (54, 'Suzanne', 'Furtado', to_date('11-09-1998', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (55, 'Kimberly', 'Goldblum', to_date('26-09-1981', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (56, 'Debra', 'Scorsese', to_date('26-05-1985', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (57, 'Mykelti', 'Deschanel', to_date('13-06-1998', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (58, 'Miranda', 'Ticotin', to_date('30-03-1999', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (59, 'Rosanne', 'Chan', to_date('16-10-1981', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (60, 'Brooke', 'Olin', to_date('10-03-1986', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (61, 'Liam', 'Stallone', to_date('01-11-1981', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (62, 'Martha', 'Holbrook', to_date('29-09-1990', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (63, 'Shirley', 'Nakai', to_date('16-05-1996', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (64, 'Tilda', 'Brock', to_date('28-06-1985', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (65, 'Gordon', 'Kristofferson', to_date('22-03-1991', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (66, 'Roy', 'Warwick', to_date('24-03-1994', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (67, 'Art', 'Paxton', to_date('07-11-1986', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (68, 'Eugene', 'Osmond', to_date('19-05-1999', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (69, 'Geoffrey', 'Williams', to_date('28-04-1987', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (70, 'Mary', 'Coolidge', to_date('04-06-1982', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (71, 'Hilton', 'Phillippe', to_date('28-06-1995', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (72, 'Joan', 'Galecki', to_date('31-05-1994', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (73, 'Mandy', 'Lawrence', to_date('07-02-1996', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (74, 'Judy', 'Ojeda', to_date('13-05-1993', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (75, 'Dan', 'Rain', to_date('25-09-1991', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (76, 'Trick', 'Squier', to_date('06-09-1987', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (77, 'Veruca', 'Rucker', to_date('18-12-1991', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (78, 'Holland', 'Hurt', to_date('30-12-1990', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (79, 'Matt', 'Himmelman', to_date('09-11-1999', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (80, 'Lesley', 'Burstyn', to_date('15-04-1995', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (81, 'Randy', 'Reubens', to_date('18-01-1998', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (82, 'Jody', 'Avital', to_date('07-12-1986', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (83, 'Gilbert', 'Day-Lewis', to_date('30-09-1985', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (84, 'Buffy', 'Blair', to_date('12-11-1995', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (85, 'Noah', 'Carradine', to_date('22-12-1983', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (86, 'Vendetta', 'Farris', to_date('18-05-1982', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (87, 'Gordon', 'Birch', to_date('09-09-1985', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (88, 'Morris', 'Kurtz', to_date('04-09-1980', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (89, 'Bridgette', 'Carrere', to_date('06-05-1986', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (90, 'Viggo', 'McGill', to_date('10-04-1994', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (91, 'Stanley', 'Bello', to_date('01-12-1984', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (92, 'Gates', 'Pacino', to_date('03-11-1986', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (93, 'Wendy', 'Chinlund', to_date('23-04-1982', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (94, 'Grace', 'Janney', to_date('09-10-1994', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (95, 'Judge', 'Wiedlin', to_date('04-10-1998', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (96, 'Jeremy', 'Marshall', to_date('15-04-1995', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (97, 'Joey', 'Garr', to_date('06-07-1991', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (98, 'Ryan', 'Macht', to_date('18-01-1998', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (99, 'Carlene', 'Torn', to_date('18-03-1994', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (100, 'Colin', 'Gano', to_date('20-12-1999', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into NURSE (nurseid, firstname, lastname, startdate)
values (101, 'Roger', 'Costa', to_date('20-09-1986', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (102, 'Chazz', 'Perrineau', to_date('21-07-1993', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (103, 'Rachael', 'Woodward', to_date('20-09-1994', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (104, 'Rachel', 'Vinton', to_date('28-11-1999', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (105, 'Fairuza', 'Ryan', to_date('21-06-1998', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (106, 'Rosco', 'Day-Lewis', to_date('30-09-1989', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (107, 'Matthew', 'Callow', to_date('04-01-1996', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (108, 'Jeanne', 'McKean', to_date('22-08-1990', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (109, 'Rueben', 'Danger', to_date('10-01-1984', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (110, 'Vickie', 'Schock', to_date('25-05-1997', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (111, 'Gil', 'Downie', to_date('28-09-1985', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (112, 'Karen', 'Warren', to_date('10-08-1996', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (113, 'Thelma', 'Chilton', to_date('16-12-1995', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (114, 'Tracy', 'Sizemore', to_date('16-06-1986', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (115, 'Jena', 'Murray', to_date('05-11-1984', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (116, 'Murray', 'Goodman', to_date('02-02-1991', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (117, 'Jean-Claude', 'Uggams', to_date('01-09-1990', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (118, 'Casey', 'Pepper', to_date('30-08-1995', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (119, 'Bridgette', 'Stuermer', to_date('02-05-1993', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (120, 'Micky', 'Robbins', to_date('09-03-1995', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (121, 'Chris', 'Green', to_date('09-03-1982', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (122, 'Stanley', 'McFadden', to_date('04-11-1998', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (123, 'Angie', 'Apple', to_date('16-05-1988', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (124, 'Martha', 'Woodward', to_date('22-06-1992', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (125, 'France', 'Domino', to_date('29-06-1991', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (126, 'Jarvis', 'Theron', to_date('10-01-1997', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (127, 'Rory', 'Raybon', to_date('21-06-1987', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (128, 'Christmas', 'Dolenz', to_date('09-11-1980', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (129, 'Domingo', 'Donovan', to_date('05-10-1986', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (130, 'Kathy', 'Baez', to_date('08-06-1990', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (131, 'Crispin', 'Lindo', to_date('01-08-1994', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (132, 'Sandra', 'Kane', to_date('08-03-1988', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (133, 'Eddie', 'Marley', to_date('12-10-1994', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (134, 'Rebecca', 'Hatchet', to_date('15-05-1989', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (135, 'Carolyn', 'Goldwyn', to_date('03-12-1991', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (136, 'Deborah', 'Moorer', to_date('17-03-1983', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (137, 'Bernard', 'Rea', to_date('07-11-1988', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (138, 'Hal', 'Scheider', to_date('14-02-1988', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (139, 'Liv', 'Detmer', to_date('21-04-1985', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (140, 'Denis', 'Carmen', to_date('03-06-1998', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (141, 'Hazel', 'Hall', to_date('22-07-1983', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (142, 'Burt', 'Palminteri', to_date('26-11-1990', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (143, 'Frances', 'Rhys-Davies', to_date('13-11-1995', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (144, 'Collin', 'Anderson', to_date('18-05-1986', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (145, 'Pam', 'McDormand', to_date('05-08-1991', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (146, 'Geoffrey', 'Moody', to_date('28-11-1983', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (147, 'Curt', 'Dunaway', to_date('28-11-1995', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (148, 'Roscoe', 'Holly', to_date('04-01-1996', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (149, 'Jesus', 'McElhone', to_date('09-02-1983', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (150, 'Diamond', 'Donelly', to_date('19-07-1992', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (151, 'Spike', 'Llewelyn', to_date('29-09-1991', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (152, 'Annette', 'Ranger', to_date('11-07-1980', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (153, 'Heath', 'Orbit', to_date('30-09-1992', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (154, 'Diane', 'Mollard', to_date('04-12-1987', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (155, 'Miko', 'Wolf', to_date('19-04-1981', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (156, 'Howie', 'Everett', to_date('23-06-1993', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (157, 'Phil', 'Haggard', to_date('16-10-1984', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (158, 'Rita', 'El-Saher', to_date('04-08-1991', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (159, 'Alice', 'Sanders', to_date('08-05-1999', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (160, 'Jeffery', 'Hyde', to_date('03-07-1994', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (161, 'Ivan', 'Stanton', to_date('24-08-1991', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (162, 'Martin', 'Adkins', to_date('09-09-1992', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (163, 'Denis', 'Herndon', to_date('17-02-1988', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (164, 'Joan', 'Lerner', to_date('14-05-1991', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (165, 'Cevin', 'Lorenz', to_date('21-01-1986', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (166, 'Edward', 'Peet', to_date('12-07-1996', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (167, 'Ray', 'Gooding', to_date('11-03-1996', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (168, 'Desmond', 'Allison', to_date('23-10-1989', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (169, 'Trini', 'Lang', to_date('23-04-1992', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (170, 'Kathy', 'Witherspoon', to_date('11-08-1988', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (171, 'Nicolas', 'Kutcher', to_date('16-04-1993', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (172, 'Sissy', 'Rydell', to_date('25-10-1987', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (173, 'Jann', 'Lane', to_date('29-09-1986', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (174, 'Alfred', 'Loggia', to_date('30-03-1983', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (175, 'Blair', 'Shearer', to_date('05-02-1994', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (176, 'Oliver', 'Hatchet', to_date('19-10-1995', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (177, 'Matt', 'Frampton', to_date('27-11-1982', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (178, 'Doug', 'Berkley', to_date('29-09-1990', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (179, 'Bryan', 'Palmer', to_date('15-08-1988', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (180, 'Boz', 'Moraz', to_date('13-05-1989', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (181, 'Benjamin', 'Sedaka', to_date('16-08-1981', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (182, 'Julie', 'Moore', to_date('07-05-1982', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (183, 'Merle', 'Tierney', to_date('18-01-1982', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (184, 'Earl', 'Berkley', to_date('06-02-1986', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (185, 'Pat', 'Bello', to_date('19-05-1991', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (186, 'Katrin', 'Michael', to_date('21-10-1996', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (187, 'Crispin', 'Frost', to_date('26-11-1991', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (188, 'Rufus', 'Blanchett', to_date('15-01-1983', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (189, 'Dionne', 'Edmunds', to_date('08-03-1989', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (190, 'Gloria', 'Malkovich', to_date('04-11-1997', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (191, 'LeVar', 'Milsap', to_date('18-04-1995', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (192, 'Mae', 'Laurie', to_date('30-04-1996', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (193, 'Madeline', 'Mahood', to_date('23-05-1997', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (194, 'Carolyn', 'Rankin', to_date('04-06-1996', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (195, 'Philip', 'Forrest', to_date('27-01-1984', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (196, 'Jason', 'Dutton', to_date('29-08-1989', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (197, 'Buffy', 'Loggia', to_date('30-08-1996', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (198, 'Raul', 'Albright', to_date('29-12-1996', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (199, 'Rory', 'Phifer', to_date('15-09-1990', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (200, 'Oro', 'Flemyng', to_date('13-01-1983', 'dd-mm-yyyy'));
commit;
prompt 200 records committed...
insert into NURSE (nurseid, firstname, lastname, startdate)
values (201, 'Greg', 'Imbruglia', to_date('18-06-1980', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (202, 'Edie', 'Loring', to_date('29-08-1991', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (203, 'Pelvic', 'Payton', to_date('14-09-1992', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (204, 'Morgan', 'Reubens', to_date('04-06-1998', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (205, 'Julianne', 'Garr', to_date('08-05-1981', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (206, 'Pete', 'Fox', to_date('17-06-1991', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (207, 'Leo', 'Arkenstone', to_date('16-05-1988', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (208, 'Darren', 'Dern', to_date('21-11-1983', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (209, 'William', 'Graham', to_date('29-05-1984', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (210, 'Joanna', 'Mantegna', to_date('26-09-1988', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (211, 'Devon', 'Giannini', to_date('27-09-1981', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (212, 'Ethan', 'Orlando', to_date('18-09-1982', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (213, 'Rosanne', 'Farina', to_date('13-02-1988', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (214, 'Judi', 'Hynde', to_date('03-09-1989', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (215, 'Cledus', 'Atlas', to_date('14-06-1999', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (216, 'Debby', 'Zevon', to_date('16-02-1999', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (217, 'Miko', 'Schneider', to_date('24-12-1997', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (218, 'Raymond', 'Payne', to_date('31-01-1981', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (219, 'Christina', 'Rodgers', to_date('15-06-1987', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (220, 'Shelby', 'Patrick', to_date('04-03-1997', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (221, 'Jackson', 'Curry', to_date('18-03-1983', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (222, 'Sal', 'Close', to_date('27-06-1980', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (223, 'Diane', 'Furtado', to_date('08-04-1980', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (224, 'Angela', 'Tomlin', to_date('06-04-1994', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (225, 'Jeff', 'Krabbe', to_date('19-10-1991', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (226, 'Bonnie', 'DiBiasio', to_date('28-07-1983', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (227, 'Sigourney', 'Tripplehorn', to_date('10-09-1980', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (228, 'Johnette', 'Shandling', to_date('11-01-1996', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (229, 'Angie', 'Aglukark', to_date('13-04-1984', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (230, 'Sally', 'Paquin', to_date('17-01-1988', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (231, 'Dar', 'Dickinson', to_date('08-09-1992', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (232, 'Campbell', 'Firth', to_date('02-01-1984', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (233, 'Derek', 'de Lancie', to_date('04-07-1991', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (234, 'Garland', 'Jamal', to_date('07-01-1998', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (235, 'Kelly', 'Arnold', to_date('07-05-1995', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (236, 'Nina', 'Armatrading', to_date('30-08-1992', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (237, 'Rodney', 'Choice', to_date('11-09-1986', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (238, 'Donna', 'Hubbard', to_date('28-11-1997', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (239, 'Tramaine', 'Loeb', to_date('06-09-1990', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (240, 'Raul', 'Sartain', to_date('22-06-1997', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (241, 'Charlie', 'Lange', to_date('08-03-1987', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (242, 'Rosie', 'Curtis', to_date('19-12-1989', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (243, 'Derek', 'Miles', to_date('27-01-1983', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (244, 'Kate', 'Margolyes', to_date('02-06-1980', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (245, 'Jack', 'Presley', to_date('17-01-1986', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (246, 'Dar', 'Dunn', to_date('20-06-1994', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (247, 'Billy', 'Blige', to_date('17-03-1993', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (248, 'Harold', 'Griffiths', to_date('23-08-1984', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (249, 'Angela', 'Jordan', to_date('08-01-1999', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (250, 'Richard', 'Craven', to_date('01-09-1996', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (251, 'Clarence', 'Kinski', to_date('12-04-1994', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (252, 'Daryl', 'Esposito', to_date('12-09-1994', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (253, 'Lou', 'Weaver', to_date('18-12-1996', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (254, 'Temuera', 'Westerberg', to_date('15-07-1989', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (255, 'Collin', 'Paxton', to_date('21-04-1983', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (256, 'Buddy', 'Cornell', to_date('13-01-1984', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (257, 'Joe', 'Marsden', to_date('23-03-1999', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (258, 'Orlando', 'Crudup', to_date('12-05-1986', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (259, 'Eileen', 'Rhymes', to_date('03-05-1985', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (260, 'Kristin', 'Mills', to_date('31-03-1996', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (261, 'William', 'Horton', to_date('25-02-1988', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (262, 'Isaac', 'Alston', to_date('08-04-1982', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (263, 'Nikka', 'Wen', to_date('05-06-1993', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (264, 'Gordie', 'Gray', to_date('26-08-1991', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (265, 'Terrence', 'Roy Parnell', to_date('05-03-1990', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (266, 'Willem', 'Thomas', to_date('04-10-1988', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (267, 'Tal', 'Blige', to_date('29-01-1992', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (268, 'Rose', 'Holmes', to_date('04-10-1995', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (269, 'Frederic', 'Raybon', to_date('27-08-1993', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (270, 'Harry', 'Porter', to_date('07-04-1990', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (271, 'Reese', 'Craven', to_date('30-01-1997', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (272, 'Lee', 'Heslov', to_date('12-03-1991', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (273, 'Hilary', 'Evett', to_date('12-11-1998', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (274, 'Isabella', 'Schiavelli', to_date('29-10-1996', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (275, 'Gabrielle', 'Quaid', to_date('03-07-1989', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (276, 'Benicio', 'O''Donnell', to_date('02-09-1999', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (277, 'Rade', 'Skaggs', to_date('06-06-1980', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (278, 'Anjelica', 'Mulroney', to_date('22-12-1991', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (279, 'Rip', 'Gleeson', to_date('24-08-1986', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (280, 'Milla', 'Marley', to_date('28-06-1985', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (281, 'Curt', 'Schwarzenegger', to_date('12-07-1987', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (282, 'Tracy', 'O''Donnell', to_date('14-10-1999', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (283, 'Tal', 'Westerberg', to_date('09-10-1997', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (284, 'George', 'Stanley', to_date('31-03-1997', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (285, 'Rip', 'Saxon', to_date('12-02-1992', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (286, 'Busta', 'Fariq', to_date('25-04-1980', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (287, 'Scarlett', 'Bush', to_date('23-06-1997', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (288, 'Delbert', 'Visnjic', to_date('11-03-1989', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (289, 'Courtney', 'Kravitz', to_date('01-08-1980', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (290, 'Holland', 'Atkins', to_date('07-05-1987', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (291, 'Darius', 'El-Saher', to_date('01-06-1994', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (292, 'Sandra', 'Heron', to_date('24-11-1988', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (293, 'Devon', 'Eastwood', to_date('26-01-1989', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (294, 'Rickie', 'Drive', to_date('27-07-1987', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (295, 'Tim', 'Young', to_date('13-04-1998', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (296, 'Teena', 'Holy', to_date('25-09-1982', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (297, 'Delbert', 'Feliciano', to_date('17-10-1987', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (298, 'David', 'English', to_date('04-04-1985', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (299, 'Sonny', 'Sevigny', to_date('28-10-1992', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (300, 'Marley', 'McLachlan', to_date('30-09-1995', 'dd-mm-yyyy'));
commit;
prompt 300 records committed...
insert into NURSE (nurseid, firstname, lastname, startdate)
values (301, 'Mel', 'Heatherly', to_date('04-09-1984', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (302, 'Scott', 'Lachey', to_date('02-07-1981', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (303, 'Tramaine', 'Kramer', to_date('12-09-1987', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (304, 'Nicholas', 'Jenkins', to_date('04-07-1987', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (305, 'Tyrone', 'Bandy', to_date('27-08-1983', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (306, 'Harrison', 'Spall', to_date('12-01-1982', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (307, 'Fairuza', 'Shepard', to_date('22-12-1986', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (308, 'Malcolm', 'Mraz', to_date('13-06-1990', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (309, 'Adam', 'Hart', to_date('09-11-1997', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (310, 'Queen', 'Arquette', to_date('30-09-1992', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (311, 'Lupe', 'Feuerstein', to_date('22-02-1997', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (312, 'Linda', 'McConaughey', to_date('28-04-1982', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (313, 'Tori', 'Visnjic', to_date('04-02-1983', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (314, 'Devon', 'Shearer', to_date('19-12-1986', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (315, 'Brothers', 'Child', to_date('23-05-1982', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (316, 'Judd', 'DeVita', to_date('07-04-1989', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (317, 'Rhett', 'Margulies', to_date('19-11-1981', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (318, 'Sissy', 'Union', to_date('17-06-1993', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (319, 'Amy', 'Newman', to_date('13-12-1999', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (320, 'Richie', 'Stamp', to_date('05-02-1981', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (321, 'Bret', 'Penn', to_date('15-05-1993', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (322, 'Lizzy', 'Serbedzija', to_date('25-05-1999', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (323, 'Kurtwood', 'Scheider', to_date('26-05-1993', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (324, 'Terence', 'Elliott', to_date('20-05-1985', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (325, 'Ed', 'Baranski', to_date('31-05-1989', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (326, 'Orlando', 'Moorer', to_date('01-03-1987', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (327, 'Ethan', 'Mellencamp', to_date('01-09-1986', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (328, 'Rachel', 'Adler', to_date('23-10-1991', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (329, 'Jann', 'Daniels', to_date('23-03-1982', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (330, 'Lynette', 'Coverdale', to_date('17-03-1989', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (331, 'Julianne', 'Moore', to_date('28-07-1986', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (332, 'Joey', 'Beck', to_date('26-06-1983', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (333, 'Carl', 'Venora', to_date('07-10-1993', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (334, 'Frederic', 'Lennix', to_date('30-11-1989', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (335, 'Marty', 'Lipnicki', to_date('14-09-1986', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (336, 'Holland', 'Hingle', to_date('03-09-1996', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (337, 'Alice', 'Solido', to_date('26-04-1982', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (338, 'Ani', 'Malkovich', to_date('05-08-1988', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (339, 'Larenz', 'Vicious', to_date('24-06-1990', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (340, 'Whoopi', 'Kleinenberg', to_date('26-07-1995', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (341, 'Jessica', 'Burton', to_date('21-06-1986', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (342, 'Kid', 'Stiller', to_date('01-09-1982', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (343, 'Leon', 'Leto', to_date('28-02-1996', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (344, 'Beverley', 'Wilson', to_date('11-08-1993', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (345, 'Julie', 'Connick', to_date('17-11-1991', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (346, 'Goran', 'Neill', to_date('23-01-1995', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (347, 'Matt', 'Goldwyn', to_date('27-08-1991', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (348, 'Michael', 'Bening', to_date('05-01-1998', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (349, 'Willem', 'Maguire', to_date('23-01-1991', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (350, 'Kelli', 'Brooks', to_date('02-12-1994', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (351, 'Rosanna', 'Williams', to_date('06-12-1991', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (352, 'Dionne', 'Popper', to_date('04-12-1998', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (353, 'Luke', 'Hershey', to_date('15-08-1991', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (354, 'Tim', 'Harrelson', to_date('06-09-1985', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (355, 'Mike', 'Margulies', to_date('26-10-1996', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (356, 'Judy', 'Norton', to_date('30-11-1989', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (357, 'Pamela', 'Duchovny', to_date('07-02-1993', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (358, 'Fiona', 'Dysart', to_date('31-07-1999', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (359, 'Arnold', 'Cruise', to_date('23-01-1992', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (360, 'Humberto', 'Curtis-Hall', to_date('04-04-1991', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (361, 'Denise', 'Dysart', to_date('29-11-1997', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (362, 'Hal', 'Holden', to_date('13-08-1982', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (363, 'Shirley', 'DeVita', to_date('15-05-1981', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (364, 'Julio', 'Botti', to_date('20-08-1992', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (365, 'Rickie', 'Patrick', to_date('29-06-1986', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (366, 'Embeth', 'Wolf', to_date('10-02-1999', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (367, 'Goran', 'Biggs', to_date('08-05-1982', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (368, 'Robert', 'Sledge', to_date('11-10-1996', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (369, 'Phil', 'Madonna', to_date('07-03-1992', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (370, 'Shannon', 'Shearer', to_date('07-11-1989', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (371, 'Alec', 'Wheel', to_date('02-02-1984', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (372, 'Gladys', 'Lucien', to_date('22-08-1990', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (373, 'Maureen', 'Sainte-Marie', to_date('26-12-1995', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (374, 'Sona', 'Mantegna', to_date('30-11-1982', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (375, 'Maria', 'Puckett', to_date('12-03-1989', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (376, 'Nathan', 'Swayze', to_date('22-08-1995', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (377, 'LeVar', 'Carrington', to_date('05-08-1986', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (378, 'Lucy', 'Dillon', to_date('25-03-1981', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (379, 'Hector', 'Durning', to_date('21-02-1988', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (380, 'Marisa', 'Saxon', to_date('24-07-1993', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (381, 'Lauren', 'Mohr', to_date('30-12-1995', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (382, 'Dianne', 'Lauper', to_date('16-12-1995', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (383, 'Miranda', 'Houston', to_date('11-09-1998', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (384, 'Alicia', 'Goodman', to_date('27-08-1989', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (385, 'April', 'McIntyre', to_date('11-12-1985', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (386, 'David', 'Deejay', to_date('11-09-1999', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (387, 'Loren', 'O''Hara', to_date('10-04-1988', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (388, 'Loretta', 'Emmerich', to_date('07-07-1999', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (389, 'Kylie', 'Jamal', to_date('19-08-1985', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (390, 'Alfie', 'Flanery', to_date('27-08-1998', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (391, 'France', 'Getty', to_date('03-01-1982', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (392, 'Ruth', 'Popper', to_date('07-04-1991', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (393, 'Ronny', 'Hynde', to_date('06-11-1985', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (394, 'Humberto', 'Webb', to_date('17-10-1987', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (395, 'Dave', 'Secada', to_date('30-04-1984', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (396, 'Martha', 'Silverman', to_date('04-09-1999', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (397, 'Jaime', 'Lachey', to_date('26-12-1999', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (398, 'Charlize', 'Maxwell', to_date('03-01-1998', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (399, 'Willem', 'Lennox', to_date('11-12-1986', 'dd-mm-yyyy'));
insert into NURSE (nurseid, firstname, lastname, startdate)
values (400, 'Chely', 'Harrison', to_date('16-09-1993', 'dd-mm-yyyy'));
commit;
prompt 400 records loaded
prompt Loading PATIENT...
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (1, 'Channing', 'Craig', to_date('10-04-1949', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (2, 'Allistair', 'Lott', to_date('23-07-1950', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (3, 'Olga', 'Buck', to_date('09-04-1982', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (4, 'Allen', 'Stevenson', to_date('28-04-1961', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (5, 'Thane', 'Weeks', to_date('07-05-1954', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (6, 'Octavia', 'Nash', to_date('11-01-1992', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (7, 'Nathaniel', 'Bates', to_date('24-05-1952', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (8, 'Nell', 'Fox', to_date('18-07-1966', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (9, 'Amena', 'Acosta', to_date('28-07-1994', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (10, 'Autumn', 'Cameron', to_date('19-06-1982', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (11, 'Xena', 'Ruiz', to_date('28-07-1983', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (12, 'Samuel', 'Fitzgerald', to_date('10-01-1962', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (13, 'Callie', 'Short', to_date('20-07-1953', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (14, 'Tasha', 'Valentine', to_date('22-01-1952', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (15, 'Patience', 'Spence', to_date('17-04-1946', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (16, 'Hedda', 'Ellison', to_date('06-05-1980', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (17, 'Jerry', 'Figueroa', to_date('15-01-1992', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (18, 'Hall', 'Floyd', to_date('17-09-1960', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (19, 'Eugenia', 'Leach', to_date('23-04-1990', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (20, 'Madeson', 'Cobb', to_date('28-04-1955', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (21, 'Athena', 'Stout', to_date('28-07-1988', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (22, 'Tyler', 'Golden', to_date('16-10-1962', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (23, 'Keaton', 'Browning', to_date('25-07-1946', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (24, 'Jonas', 'Morales', to_date('07-11-1960', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (25, 'Germane', 'Mendoza', to_date('22-06-1976', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (26, 'Gay', 'Dean', to_date('23-07-1988', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (27, 'Harper', 'Houston', to_date('19-05-1992', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (28, 'Jin', 'Dillard', to_date('18-03-1954', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (29, 'Harrison', 'Pitts', to_date('14-11-1977', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (30, 'Colorado', 'Stanton', to_date('23-09-1948', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (31, 'Leslie', 'Jordan', to_date('24-02-1988', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (32, 'Rudyard', 'Dillon', to_date('20-01-1996', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (33, 'Tyler', 'Cole', to_date('31-07-1972', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (34, 'Audra', 'Knapp', to_date('18-09-1948', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (35, 'Gisela', 'Kline', to_date('18-12-1986', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (36, 'Britanni', 'Bentley', to_date('31-07-1964', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (37, 'Beau', 'Roman', to_date('16-04-1995', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (38, 'Alma', 'Wolf', to_date('14-05-1969', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (39, 'Allistair', 'Patel', to_date('14-06-1953', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (40, 'Wylie', 'Andrews', to_date('20-02-1972', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (41, 'Jakeem', 'Short', to_date('04-03-1979', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (42, 'Odessa', 'Barr', to_date('08-02-1950', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (43, 'Oleg', 'Cooke', to_date('12-09-1995', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (44, 'Michael', 'Hunt', to_date('01-03-1995', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (45, 'Aladdin', 'Duncan', to_date('27-12-1958', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (46, 'Vivien', 'Gilliam', to_date('09-07-1959', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (47, 'Joy', 'Horn', to_date('09-07-1980', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (48, 'Baxter', 'Keith', to_date('27-03-1980', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (49, 'Aurora', 'Snider', to_date('11-06-1966', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (50, 'Moana', 'Morse', to_date('11-12-1993', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (51, 'Carter', 'Cantu', to_date('25-02-1990', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (52, 'Tate', 'Pugh', to_date('06-01-1955', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (53, 'Maite', 'Santos', to_date('16-03-1972', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (54, 'Quamar', 'Dawson', to_date('10-08-1951', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (55, 'Piper', 'Vinson', to_date('01-06-1984', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (56, 'Linda', 'Dunlap', to_date('24-06-1988', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (57, 'Kadeem', 'Douglas', to_date('13-09-1968', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (58, 'Chanda', 'Robbins', to_date('07-02-1949', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (59, 'Iliana', 'Keller', to_date('17-02-1951', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (60, 'Tanek', 'Atkins', to_date('13-07-1966', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (61, 'Janna', 'Jackson', to_date('25-09-1958', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (62, 'Beau', 'Mcdaniel', to_date('19-08-1981', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (63, 'Ora', 'Chapman', to_date('15-07-1955', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (64, 'Julie', 'Pollard', to_date('31-08-1959', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (65, 'Asher', 'Hogan', to_date('14-02-1989', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (66, 'Alma', 'Dickerson', to_date('30-01-1984', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (67, 'Davis', 'Mcgee', to_date('16-12-1983', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (68, 'Jessica', 'Browning', to_date('12-04-1971', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (69, 'Olivia', 'Stein', to_date('26-03-1967', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (70, 'Geoffrey', 'Mckinney', to_date('31-01-1971', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (71, 'Jada', 'Moody', to_date('27-09-1971', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (72, 'Denton', 'Sellers', to_date('20-05-1952', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (73, 'Veda', 'Greer', to_date('12-09-1996', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (74, 'Lewis', 'Baird', to_date('26-11-1946', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (75, 'Mara', 'Gregory', to_date('03-12-1977', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (76, 'Odysseus', 'Franks', to_date('17-10-1961', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (77, 'Thaddeus', 'Webb', to_date('20-04-1955', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (78, 'Paul', 'Boone', to_date('11-09-1993', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (79, 'Malachi', 'Browning', to_date('21-07-1969', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (80, 'Whilemina', 'Hart', to_date('30-03-1952', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (81, 'Jescie', 'Nash', to_date('28-03-1959', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (82, 'Dustin', 'Tran', to_date('25-02-1951', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (83, 'Keane', 'Bradshaw', to_date('23-02-1951', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (84, 'Ginger', 'Preston', to_date('27-11-1967', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (85, 'Kennedy', 'Mcconnell', to_date('23-06-1982', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (86, 'Francesca', 'Newton', to_date('24-03-1965', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (87, 'Aurelia', 'Miranda', to_date('05-11-1987', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (88, 'Perry', 'Maxwell', to_date('16-04-1971', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (89, 'Seth', 'Tran', to_date('07-05-1975', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (90, 'Ima', 'Dixon', to_date('15-04-1987', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (91, 'Xander', 'Bullock', to_date('27-11-1989', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (92, 'Murphy', 'Douglas', to_date('24-06-1971', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (93, 'Vance', 'Pena', to_date('06-04-1987', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (94, 'Zelenia', 'Lambert', to_date('12-12-1962', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (95, 'Caleb', 'Wynn', to_date('12-06-1981', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (96, 'Hyacinth', 'Mcdonald', to_date('07-10-1968', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (97, 'Latifah', 'Strickland', to_date('11-08-1991', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (98, 'Dominic', 'Atkins', to_date('27-11-1987', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (99, 'Brianna', 'Bell', to_date('11-04-1967', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (100, 'Violet', 'Hughes', to_date('14-01-1968', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (101, 'Dorothy', 'Wallace', to_date('25-05-1975', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (102, 'Serena', 'Terry', to_date('24-03-1988', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (103, 'Hamilton', 'Wiley', to_date('26-10-1946', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (104, 'Aquila', 'Rodriguez', to_date('02-12-1975', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (105, 'Vaughan', 'Tucker', to_date('23-02-1954', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (106, 'Patrick', 'Willis', to_date('08-07-1982', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (107, 'Chaim', 'Olsen', to_date('14-02-1963', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (108, 'Kristen', 'Rivas', to_date('22-11-1957', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (109, 'Urielle', 'Bond', to_date('06-04-1963', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (110, 'Pamela', 'Fox', to_date('03-09-1982', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (111, 'Fitzgerald', 'Copeland', to_date('30-10-1990', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (112, 'Deanna', 'Parker', to_date('14-12-1961', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (113, 'Hamish', 'Estes', to_date('05-11-1994', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (114, 'Damian', 'Stewart', to_date('07-04-1988', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (115, 'Todd', 'Gallagher', to_date('02-06-1975', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (116, 'Timothy', 'Walsh', to_date('23-09-1954', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (117, 'Brynne', 'Burris', to_date('21-11-1947', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (118, 'Aspen', 'Waller', to_date('07-09-1983', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (119, 'Aphrodite', 'Burt', to_date('22-03-1988', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (120, 'Ayanna', 'Farrell', to_date('22-04-1968', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (121, 'Calista', 'Hunter', to_date('06-12-1982', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (122, 'Clark', 'Keller', to_date('12-07-1986', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (123, 'Thor', 'Bray', to_date('23-07-1960', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (124, 'Porter', 'Pate', to_date('13-09-1951', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (125, 'Avye', 'Chambers', to_date('22-07-1966', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (126, 'Wylie', 'Kaufman', to_date('22-07-1989', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (127, 'Stacy', 'Wilcox', to_date('04-07-1978', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (128, 'Sydney', 'Good', to_date('04-07-1980', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (129, 'Quinn', 'Barr', to_date('24-06-1982', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (130, 'Kasper', 'Briggs', to_date('15-01-1966', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (131, 'Hoyt', 'Brooks', to_date('18-07-1989', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (132, 'Jessamine', 'Espinoza', to_date('23-12-1959', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (133, 'Micah', 'Ball', to_date('26-03-1953', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (134, 'Tarik', 'Melendez', to_date('22-07-1964', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (135, 'Hop', 'Stephens', to_date('24-01-1994', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (136, 'Travis', 'Aguilar', to_date('01-05-1958', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (137, 'Leah', 'Fuller', to_date('20-07-1960', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (138, 'Lara', 'Vinson', to_date('15-06-1946', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (139, 'Fletcher', 'Lyons', to_date('13-12-1963', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (140, 'Chastity', 'Castro', to_date('22-05-1970', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (141, 'Jaquelyn', 'Gutierrez', to_date('17-03-1975', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (142, 'Boris', 'Martin', to_date('19-06-1958', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (143, 'Vielka', 'Cardenas', to_date('09-11-1954', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (144, 'Risa', 'Moss', to_date('15-10-1977', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (145, 'Eliana', 'Burch', to_date('07-10-1984', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (146, 'Jelani', 'Morrow', to_date('11-12-1952', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (147, 'Haviva', 'Graves', to_date('10-10-1972', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (148, 'MacKenzie', 'Porter', to_date('31-07-1985', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (149, 'Ramona', 'Welch', to_date('01-02-1965', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (150, 'Jescie', 'Noel', to_date('21-10-1946', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (151, 'Haviva', 'Johnston', to_date('31-12-1994', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (152, 'Delilah', 'Burgess', to_date('19-05-1997', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (153, 'Joan', 'Buckner', to_date('04-11-1986', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (154, 'Georgia', 'Harris', to_date('28-05-1981', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (155, 'Jessamine', 'Hyde', to_date('05-08-1960', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (156, 'Shaine', 'Berg', to_date('20-08-1958', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (157, 'Dieter', 'Lane', to_date('04-03-1989', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (158, 'Signe', 'Browning', to_date('29-07-1975', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (159, 'Jaquelyn', 'Cameron', to_date('12-11-1976', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (160, 'Chaim', 'Luna', to_date('01-06-1955', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (161, 'Mona', 'Key', to_date('04-01-1986', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (162, 'Rana', 'Farley', to_date('10-12-1979', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (163, 'Andrew', 'Pickett', to_date('19-07-1952', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (164, 'Amir', 'Nguyen', to_date('21-10-1984', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (165, 'Emmanuel', 'Hutchinson', to_date('01-07-1976', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (166, 'Joelle', 'Puckett', to_date('27-08-1996', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (167, 'Yolanda', 'Gallagher', to_date('24-01-1972', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (168, 'Charde', 'Watkins', to_date('14-06-1993', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (169, 'Shad', 'Rowland', to_date('09-07-1977', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (170, 'Adam', 'Dejesus', to_date('03-12-1965', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (171, 'Tamara', 'Meyer', to_date('21-01-1997', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (172, 'Lane', 'Clements', to_date('29-07-1983', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (173, 'Dante', 'Austin', to_date('26-11-1960', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (174, 'Cherokee', 'Coleman', to_date('12-06-1972', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (175, 'Macaulay', 'Callahan', to_date('22-04-1992', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (176, 'Gannon', 'Terrell', to_date('07-04-1958', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (177, 'Henry', 'Foreman', to_date('03-02-1995', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (178, 'Lana', 'Rich', to_date('30-04-1953', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (179, 'Mariam', 'Frank', to_date('20-02-1957', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (180, 'Caesar', 'Townsend', to_date('29-04-1950', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (181, 'Kirsten', 'Stephenson', to_date('16-06-1995', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (182, 'Ulysses', 'Cole', to_date('27-12-1951', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (183, 'Amy', 'Hess', to_date('22-12-1983', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (184, 'Mariko', 'Robles', to_date('29-08-1979', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (185, 'Quin', 'Berger', to_date('17-07-1990', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (186, 'Lucius', 'Richardson', to_date('24-10-1971', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (187, 'Uriel', 'Hale', to_date('04-10-1951', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (188, 'Joel', 'Hardin', to_date('15-02-1997', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (189, 'Quemby', 'Parrish', to_date('01-04-1968', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (190, 'Duncan', 'Burns', to_date('26-09-1995', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (191, 'Hayley', 'Strickland', to_date('22-11-1977', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (192, 'Sonya', 'Mckee', to_date('26-03-1963', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (193, 'Kadeem', 'Clay', to_date('14-08-1962', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (194, 'Stuart', 'Haley', to_date('14-06-1974', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (195, 'Griffin', 'Emerson', to_date('16-03-1957', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (196, 'Kiona', 'Crane', to_date('18-09-1947', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (197, 'Connor', 'Williamson', to_date('26-10-1957', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (198, 'Cairo', 'Stephens', to_date('14-04-1979', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (199, 'Angelica', 'Benjamin', to_date('08-12-1979', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (200, 'Audra', 'Gamble', to_date('23-03-1976', 'dd-mm-yyyy'));
commit;
prompt 200 records committed...
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (201, 'Ima', 'Baker', to_date('08-12-1985', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (202, 'Alexa', 'Alvarez', to_date('12-06-1972', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (203, 'Asher', 'Horne', to_date('27-10-1949', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (204, 'Jocelyn', 'Finch', to_date('05-11-1986', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (205, 'Jorden', 'Beach', to_date('17-09-1950', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (206, 'Joshua', 'Curtis', to_date('29-11-1947', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (207, 'Lillith', 'Woodard', to_date('20-08-1948', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (208, 'Rhea', 'Benson', to_date('01-09-1995', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (209, 'Nina', 'Collier', to_date('09-06-1967', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (210, 'Keane', 'Morales', to_date('18-06-1948', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (211, 'Quinn', 'Valentine', to_date('01-05-1955', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (212, 'Carissa', 'Collier', to_date('29-11-1956', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (213, 'Zoe', 'Witt', to_date('20-02-1951', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (214, 'Scarlet', 'Mcfadden', to_date('23-03-1963', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (215, 'Alma', 'Rios', to_date('01-07-1981', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (216, 'Uma', 'Holt', to_date('30-10-1993', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (217, 'Daryl', 'Mendoza', to_date('15-09-1962', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (218, 'Jessamine', 'Sexton', to_date('23-12-1963', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (219, 'Alexa', 'Norton', to_date('18-05-1973', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (220, 'Vaughan', 'Conner', to_date('22-03-1950', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (221, 'Desiree', 'Grant', to_date('27-10-1945', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (222, 'Melinda', 'O''donnell', to_date('30-12-1996', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (223, 'Ursula', 'Craig', to_date('03-11-1978', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (224, 'Breanna', 'Elliott', to_date('16-12-1956', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (225, 'Vielka', 'Horn', to_date('25-01-1973', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (226, 'Gary', 'Little', to_date('09-01-1997', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (227, 'Thane', 'Alexander', to_date('29-09-1976', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (228, 'Zeus', 'Yang', to_date('11-09-1953', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (229, 'Dominic', 'Mckinney', to_date('02-07-1982', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (230, 'Oren', 'Walton', to_date('11-12-1955', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (231, 'Chelsea', 'Key', to_date('06-04-1988', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (232, 'Brendan', 'Tanner', to_date('19-11-1977', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (233, 'Caryn', 'Freeman', to_date('26-07-1967', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (234, 'Cody', 'Osborne', to_date('13-06-1949', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (235, 'Wayne', 'Hall', to_date('06-10-1968', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (236, 'Burton', 'Thornton', to_date('12-05-1957', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (237, 'Dahlia', 'Mathews', to_date('14-04-1984', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (238, 'Sybil', 'Rowland', to_date('01-12-1957', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (239, 'Mason', 'Munoz', to_date('02-08-1983', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (240, 'Belle', 'Sherman', to_date('12-03-1983', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (241, 'Ishmael', 'Long', to_date('09-04-1974', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (242, 'Octavia', 'Mccullough', to_date('19-07-1946', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (243, 'Gary', 'Middleton', to_date('02-05-1989', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (244, 'Fletcher', 'Santana', to_date('05-01-1951', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (245, 'Vernon', 'Atkins', to_date('25-09-1988', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (246, 'Acton', 'Glenn', to_date('22-08-1970', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (247, 'Kermit', 'Ellis', to_date('27-06-1982', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (248, 'Audrey', 'Maxwell', to_date('28-05-1991', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (249, 'Stephen', 'Casey', to_date('08-03-1990', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (250, 'Marcia', 'Cannon', to_date('20-08-1974', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (251, 'Dieter', 'Slater', to_date('25-01-1959', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (252, 'Kai', 'Marquez', to_date('28-05-1969', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (253, 'Gary', 'Knight', to_date('21-08-1972', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (254, 'Prescott', 'Blackwell', to_date('29-10-1985', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (255, 'Hoyt', 'Huber', to_date('22-12-1994', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (256, 'Levi', 'Whitley', to_date('27-06-1979', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (257, 'Jared', 'Davenport', to_date('16-04-1974', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (258, 'Sara', 'Garcia', to_date('04-11-1996', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (259, 'Sigourney', 'Daniel', to_date('14-08-1989', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (260, 'Kylan', 'Byrd', to_date('23-10-1973', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (261, 'Stella', 'Hines', to_date('10-10-1957', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (262, 'Thane', 'Clayton', to_date('08-06-1945', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (263, 'Tate', 'Vasquez', to_date('18-05-1948', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (264, 'Rana', 'Berger', to_date('20-09-1952', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (265, 'Dolan', 'Hayes', to_date('31-03-1988', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (266, 'Castor', 'Chavez', to_date('18-07-1964', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (267, 'Uma', 'Jordan', to_date('21-11-1965', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (268, 'Quail', 'Thomas', to_date('16-09-1969', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (269, 'Kirby', 'Noble', to_date('10-02-1983', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (270, 'Dieter', 'Beck', to_date('12-06-1996', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (271, 'Erich', 'Yates', to_date('19-01-1975', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (272, 'Philip', 'Byrd', to_date('28-10-1991', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (273, 'Marsden', 'Pena', to_date('24-10-1993', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (274, 'Nina', 'Murray', to_date('24-09-1996', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (275, 'Kirk', 'West', to_date('02-08-1965', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (276, 'Devin', 'Downs', to_date('05-06-1966', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (277, 'Delilah', 'Park', to_date('01-07-1950', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (278, 'Riley', 'Valentine', to_date('26-10-1987', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (279, 'Jacqueline', 'Holman', to_date('26-01-1991', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (280, 'Colorado', 'Davenport', to_date('16-12-1980', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (281, 'Haviva', 'Pennington', to_date('28-06-1947', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (282, 'Damon', 'Dominguez', to_date('13-06-1967', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (283, 'Raymond', 'Hampton', to_date('09-04-1949', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (284, 'Yetta', 'Bray', to_date('07-08-1974', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (285, 'Conan', 'Pena', to_date('31-03-1947', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (286, 'Amos', 'Lawson', to_date('18-10-1982', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (287, 'Athena', 'Holt', to_date('22-09-1986', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (288, 'Emerson', 'Michael', to_date('10-01-1985', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (289, 'Camille', 'Cardenas', to_date('26-09-1974', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (290, 'Axel', 'Evans', to_date('28-09-1955', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (291, 'Dexter', 'Gregory', to_date('08-06-1951', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (292, 'Wade', 'Morrow', to_date('03-06-1946', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (293, 'Willow', 'Mayer', to_date('11-04-1955', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (294, 'Abigail', 'Haney', to_date('14-11-1954', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (295, 'Caryn', 'Mcleod', to_date('07-07-1956', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (296, 'Tamekah', 'Silva', to_date('31-12-1979', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (297, 'Alfreda', 'Dorsey', to_date('19-09-1976', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (298, 'Lucy', 'Williams', to_date('02-02-1982', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (299, 'Harlan', 'Guerra', to_date('15-04-1994', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (300, 'Nathan', 'Moody', to_date('03-07-1949', 'dd-mm-yyyy'));
commit;
prompt 300 records committed...
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (301, 'Logan', 'Berg', to_date('23-06-1992', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (302, 'Marah', 'Bishop', to_date('06-06-1995', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (303, 'Keely', 'Pennington', to_date('24-09-1971', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (304, 'Donna', 'Dyer', to_date('13-11-1952', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (305, 'Nathan', 'Pickett', to_date('28-11-1992', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (306, 'Timothy', 'Morse', to_date('04-01-1968', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (307, 'Kerry', 'Skinner', to_date('03-04-1971', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (308, 'Tyrone', 'Berger', to_date('10-09-1963', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (309, 'Claudia', 'Hodges', to_date('29-11-1947', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (310, 'Raphael', 'Hendricks', to_date('15-07-1945', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (311, 'Carly', 'Holloway', to_date('26-05-1987', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (312, 'Meghan', 'Bates', to_date('19-06-1977', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (313, 'Erica', 'Brewer', to_date('02-09-1957', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (314, 'Ira', 'Freeman', to_date('10-09-1947', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (315, 'Fletcher', 'Reid', to_date('14-08-1968', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (316, 'Noelle', 'Potts', to_date('18-12-1946', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (317, 'Chancellor', 'Coleman', to_date('24-04-1985', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (318, 'Dacey', 'Benson', to_date('04-02-1978', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (319, 'Keely', 'Welch', to_date('25-05-1954', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (320, 'Ian', 'Burnett', to_date('05-02-1958', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (321, 'Malachi', 'Merritt', to_date('03-05-1970', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (322, 'Quinn', 'Everett', to_date('20-05-1975', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (323, 'Bernard', 'Kramer', to_date('15-03-1963', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (324, 'Macey', 'Potter', to_date('15-07-1980', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (325, 'Xaviera', 'Mccall', to_date('28-09-1992', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (326, 'Salvador', 'Buckley', to_date('15-06-1954', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (327, 'Griffin', 'Gallegos', to_date('20-03-1997', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (328, 'Yeo', 'Turner', to_date('16-01-1970', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (329, 'Bethany', 'Mayer', to_date('09-01-1982', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (330, 'Fleur', 'Manning', to_date('26-05-1958', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (331, 'Giselle', 'Russo', to_date('10-09-1979', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (332, 'Vincent', 'Mcintyre', to_date('14-12-1962', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (333, 'Malachi', 'Livingston', to_date('24-11-1948', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (334, 'Kibo', 'Vazquez', to_date('10-11-1968', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (335, 'Stuart', 'Branch', to_date('18-11-1971', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (336, 'Meghan', 'Brennan', to_date('22-09-1976', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (337, 'Wang', 'Luna', to_date('21-06-1953', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (338, 'Elmo', 'Fields', to_date('05-06-1996', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (339, 'Levi', 'Hines', to_date('25-03-1949', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (340, 'Jonas', 'Reynolds', to_date('08-07-1962', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (341, 'MacKensie', 'Battle', to_date('19-01-1953', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (342, 'Savannah', 'Schroeder', to_date('13-02-1986', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (343, 'Samson', 'Fitzpatrick', to_date('07-04-1964', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (344, 'Adria', 'Branch', to_date('03-07-1949', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (345, 'Lee', 'Malone', to_date('01-03-1992', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (346, 'Isaiah', 'Cross', to_date('31-08-1966', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (347, 'Michelle', 'Smith', to_date('07-01-1995', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (348, 'Shea', 'Griffith', to_date('27-01-1992', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (349, 'Murphy', 'Fletcher', to_date('04-10-1964', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (350, 'Neil', 'Cantu', to_date('15-01-1979', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (351, 'Mark', 'Stevenson', to_date('11-08-1983', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (352, 'Clarke', 'Weiss', to_date('02-08-1967', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (353, 'Kyle', 'Peterson', to_date('26-01-1947', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (354, 'Ciara', 'Cotton', to_date('14-02-1959', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (355, 'Ella', 'Ferguson', to_date('28-11-1978', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (356, 'Austin', 'Mcneil', to_date('22-04-1981', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (357, 'Mara', 'Hensley', to_date('20-11-1993', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (358, 'Kathleen', 'Ball', to_date('07-10-1945', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (359, 'Kieran', 'Wiley', to_date('16-10-1990', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (360, 'Cassidy', 'Cobb', to_date('09-08-1957', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (361, 'Medge', 'Howe', to_date('09-01-1950', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (362, 'Whitney', 'Sims', to_date('17-01-1974', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (363, 'Joseph', 'Bridges', to_date('15-08-1975', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (364, 'Jayme', 'Graham', to_date('06-04-1966', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (365, 'Guy', 'Potter', to_date('16-10-1951', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (366, 'Nyssa', 'Murray', to_date('16-05-1949', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (367, 'Melissa', 'Travis', to_date('12-07-1965', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (368, 'Blossom', 'Payne', to_date('21-07-1983', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (369, 'Margaret', 'Hess', to_date('23-05-1952', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (370, 'Morgan', 'Stewart', to_date('18-06-1984', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (371, 'Chloe', 'Holcomb', to_date('30-09-1970', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (372, 'Duncan', 'Charles', to_date('19-10-1971', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (373, 'Xander', 'Acevedo', to_date('09-02-1981', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (374, 'John', 'Matthews', to_date('17-09-1955', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (375, 'Rahim', 'Dale', to_date('26-04-1974', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (376, 'Guinevere', 'Rivas', to_date('12-04-1953', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (377, 'Neil', 'Hubbard', to_date('01-01-1982', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (378, 'Evangeline', 'Morris', to_date('01-07-1966', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (379, 'Marvin', 'Morrison', to_date('21-06-1991', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (380, 'Zia', 'Wilder', to_date('19-09-1992', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (381, 'Diana', 'Puckett', to_date('11-08-1952', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (382, 'Phoebe', 'Vincent', to_date('21-11-1958', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (383, 'Jared', 'Nielsen', to_date('08-02-1988', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (384, 'Marcia', 'Wall', to_date('23-04-1988', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (385, 'Jesse', 'Wallace', to_date('24-04-1961', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (386, 'Cherokee', 'Hartman', to_date('06-09-1958', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (387, 'Isabella', 'Wilcox', to_date('25-03-1962', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (388, 'Juliet', 'Sears', to_date('14-04-1979', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (389, 'Donovan', 'Daniels', to_date('06-09-1994', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (390, 'Tanner', 'Mason', to_date('26-10-1958', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (391, 'Owen', 'Copeland', to_date('11-05-1987', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (392, 'Deirdre', 'Mosley', to_date('01-04-1946', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (393, 'Laurel', 'Ruiz', to_date('30-01-1963', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (394, 'Indigo', 'Kaufman', to_date('09-06-1968', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (395, 'Charity', 'Erickson', to_date('10-02-1958', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (396, 'Joy', 'Valenzuela', to_date('17-08-1985', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (397, 'Farrah', 'Spears', to_date('09-05-1955', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (398, 'Rowan', 'Harrell', to_date('02-09-1960', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (399, 'Forrest', 'Williamson', to_date('30-03-1964', 'dd-mm-yyyy'));
insert into PATIENT (patientid, firstname, lastname, birthdate)
values (400, 'Raphael', 'Becker', to_date('23-06-1994', 'dd-mm-yyyy'));
commit;
prompt 400 records loaded
prompt Loading SURGERY_ROOM...
insert into SURGERY_ROOM (roomid, location, roomtype)
values (1, 'G', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (2, 'C', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (3, 'C', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (4, 'A', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (5, 'E', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (6, 'C', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (7, 'H', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (8, 'D', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (9, 'E', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (10, 'H', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (11, 'A', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (12, 'C', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (13, 'C', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (14, 'I', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (15, 'D', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (16, 'G', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (17, 'G', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (18, 'C', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (19, 'C', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (20, 'C', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (21, 'D', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (22, 'E', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (23, 'G', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (24, 'H', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (25, 'B', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (26, 'F', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (27, 'H', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (28, 'A', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (29, 'C', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (30, 'G', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (31, 'G', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (32, 'H', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (33, 'I', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (34, 'I', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (35, 'H', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (36, 'H', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (37, 'B', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (38, 'A', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (39, 'H', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (40, 'A', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (41, 'C', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (42, 'D', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (43, 'B', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (44, 'D', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (45, 'G', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (46, 'H', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (47, 'G', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (48, 'E', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (49, 'H', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (50, 'B', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (51, 'D', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (52, 'B', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (53, 'C', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (54, 'D', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (55, 'B', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (56, 'H', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (57, 'H', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (58, 'E', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (59, 'G', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (60, 'C', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (61, 'H', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (62, 'D', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (63, 'F', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (64, 'D', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (65, 'A', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (66, 'H', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (67, 'H', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (68, 'A', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (69, 'I', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (70, 'I', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (71, 'G', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (72, 'A', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (73, 'D', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (74, 'C', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (75, 'G', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (76, 'G', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (77, 'I', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (78, 'G', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (79, 'D', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (80, 'H', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (81, 'G', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (82, 'H', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (83, 'C', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (84, 'C', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (85, 'G', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (86, 'A', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (87, 'A', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (88, 'I', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (89, 'B', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (90, 'I', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (91, 'H', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (92, 'A', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (93, 'A', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (94, 'F', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (95, 'G', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (96, 'F', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (97, 'E', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (98, 'F', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (99, 'A', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (100, 'A', 'Laparoscopic Operating');
commit;
prompt 100 records committed...
insert into SURGERY_ROOM (roomid, location, roomtype)
values (101, 'B', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (102, 'I', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (103, 'E', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (104, 'H', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (105, 'I', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (106, 'I', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (107, 'G', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (108, 'F', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (109, 'F', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (110, 'C', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (111, 'D', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (112, 'F', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (113, 'G', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (114, 'D', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (115, 'B', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (116, 'G', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (117, 'I', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (118, 'A', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (119, 'F', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (120, 'B', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (121, 'I', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (122, 'A', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (123, 'H', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (124, 'B', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (125, 'A', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (126, 'H', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (127, 'G', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (128, 'B', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (129, 'C', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (130, 'C', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (131, 'E', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (132, 'H', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (133, 'F', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (134, 'E', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (135, 'C', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (136, 'I', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (137, 'C', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (138, 'I', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (139, 'E', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (140, 'E', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (141, 'G', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (142, 'I', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (143, 'B', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (144, 'E', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (145, 'E', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (146, 'C', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (147, 'F', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (148, 'I', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (149, 'I', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (150, 'E', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (151, 'F', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (152, 'H', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (153, 'B', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (154, 'B', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (155, 'F', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (156, 'G', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (157, 'D', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (158, 'F', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (159, 'G', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (160, 'C', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (161, 'E', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (162, 'H', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (163, 'C', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (164, 'A', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (165, 'I', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (166, 'A', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (167, 'C', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (168, 'C', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (169, 'H', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (170, 'C', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (171, 'E', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (172, 'B', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (173, 'F', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (174, 'H', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (175, 'D', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (176, 'A', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (177, 'H', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (178, 'E', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (179, 'E', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (180, 'C', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (181, 'E', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (182, 'D', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (183, 'A', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (184, 'D', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (185, 'H', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (186, 'H', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (187, 'E', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (188, 'C', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (189, 'B', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (190, 'B', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (191, 'A', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (192, 'A', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (193, 'G', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (194, 'F', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (195, 'H', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (196, 'A', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (197, 'E', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (198, 'D', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (199, 'C', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (200, 'I', 'Emergency Operating');
commit;
prompt 200 records committed...
insert into SURGERY_ROOM (roomid, location, roomtype)
values (201, 'E', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (202, 'A', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (203, 'D', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (204, 'G', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (205, 'G', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (206, 'E', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (207, 'A', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (208, 'B', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (209, 'I', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (210, 'I', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (211, 'I', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (212, 'G', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (213, 'B', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (214, 'B', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (215, 'C', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (216, 'E', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (217, 'E', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (218, 'G', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (219, 'F', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (220, 'C', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (221, 'B', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (222, 'F', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (223, 'B', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (224, 'A', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (225, 'H', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (226, 'D', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (227, 'I', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (228, 'B', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (229, 'G', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (230, 'F', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (231, 'A', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (232, 'C', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (233, 'C', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (234, 'I', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (235, 'D', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (236, 'C', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (237, 'F', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (238, 'I', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (239, 'C', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (240, 'B', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (241, 'B', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (242, 'G', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (243, 'B', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (244, 'D', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (245, 'B', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (246, 'E', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (247, 'F', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (248, 'B', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (249, 'G', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (250, 'B', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (251, 'G', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (252, 'H', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (253, 'I', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (254, 'C', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (255, 'H', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (256, 'C', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (257, 'F', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (258, 'I', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (259, 'E', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (260, 'D', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (261, 'A', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (262, 'H', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (263, 'G', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (264, 'H', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (265, 'E', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (266, 'D', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (267, 'F', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (268, 'E', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (269, 'C', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (270, 'C', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (271, 'E', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (272, 'C', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (273, 'B', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (274, 'F', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (275, 'H', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (276, 'E', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (277, 'G', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (278, 'D', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (279, 'H', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (280, 'G', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (281, 'F', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (282, 'B', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (283, 'F', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (284, 'H', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (285, 'I', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (286, 'B', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (287, 'B', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (288, 'E', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (289, 'D', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (290, 'E', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (291, 'F', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (292, 'D', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (293, 'E', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (294, 'G', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (295, 'F', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (296, 'F', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (297, 'H', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (298, 'E', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (299, 'F', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (300, 'A', 'General Operating');
commit;
prompt 300 records committed...
insert into SURGERY_ROOM (roomid, location, roomtype)
values (301, 'A', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (302, 'F', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (303, 'D', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (304, 'C', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (305, 'G', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (306, 'A', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (307, 'F', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (308, 'G', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (309, 'B', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (310, 'H', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (311, 'A', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (312, 'E', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (313, 'C', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (314, 'E', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (315, 'F', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (316, 'I', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (317, 'A', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (318, 'A', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (319, 'E', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (320, 'C', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (321, 'G', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (322, 'C', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (323, 'I', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (324, 'D', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (325, 'C', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (326, 'B', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (327, 'C', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (328, 'G', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (329, 'I', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (330, 'C', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (331, 'B', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (332, 'I', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (333, 'D', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (334, 'H', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (335, 'H', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (336, 'B', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (337, 'I', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (338, 'D', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (339, 'H', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (340, 'G', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (341, 'F', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (342, 'C', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (343, 'C', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (344, 'D', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (345, 'A', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (346, 'A', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (347, 'I', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (348, 'F', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (349, 'E', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (350, 'C', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (351, 'C', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (352, 'A', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (353, 'C', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (354, 'A', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (355, 'A', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (356, 'A', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (357, 'H', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (358, 'I', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (359, 'G', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (360, 'D', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (361, 'I', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (362, 'D', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (363, 'C', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (364, 'F', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (365, 'I', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (366, 'F', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (367, 'I', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (368, 'I', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (369, 'C', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (370, 'E', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (371, 'F', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (372, 'H', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (373, 'H', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (374, 'E', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (375, 'A', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (376, 'C', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (377, 'H', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (378, 'F', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (379, 'D', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (380, 'G', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (381, 'D', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (382, 'B', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (383, 'D', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (384, 'E', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (385, 'B', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (386, 'F', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (387, 'H', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (388, 'I', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (389, 'F', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (390, 'E', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (391, 'H', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (392, 'D', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (393, 'A', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (394, 'D', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (395, 'A', 'General Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (396, 'D', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (397, 'F', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (398, 'A', 'Laparoscopic Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (399, 'B', 'Emergency Operating');
insert into SURGERY_ROOM (roomid, location, roomtype)
values (400, 'B', 'General Operating');
commit;
prompt 400 records loaded
prompt Loading SURGERY...
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (1, to_date('20-04-2021', 'dd-mm-yyyy'), 'Short_surgery', 138, 22, 312, 8);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (2, to_date('24-03-2018', 'dd-mm-yyyy'), 'Intermediate_surgerie', 56, 225, 158, 288);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (3, to_date('05-12-2012', 'dd-mm-yyyy'), 'Long_surgery', 75, 1, 191, 211);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (4, to_date('23-09-2020', 'dd-mm-yyyy'), 'Short_surgery', 128, 128, 242, 218);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (5, to_date('13-04-2018', 'dd-mm-yyyy'), 'Intermediate_surgerie', 162, 92, 309, 30);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (6, to_date('06-08-2012', 'dd-mm-yyyy'), 'Intermediate_surgerie', 207, 174, 51, 234);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (7, to_date('14-06-2014', 'dd-mm-yyyy'), 'Short_surgery', 378, 108, 375, 52);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (8, to_date('30-01-2020', 'dd-mm-yyyy'), 'Long_surgery', 273, 195, 134, 115);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (9, to_date('06-07-2022', 'dd-mm-yyyy'), 'Short_surgery', 353, 158, 53, 294);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (10, to_date('30-12-2021', 'dd-mm-yyyy'), 'Short_surgery', 318, 153, 375, 163);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (11, to_date('10-08-2015', 'dd-mm-yyyy'), 'Long_surgery', 198, 83, 261, 29);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (12, to_date('04-03-2016', 'dd-mm-yyyy'), 'Intermediate_surgerie', 355, 385, 353, 236);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (13, to_date('15-08-2020', 'dd-mm-yyyy'), 'Intermediate_surgerie', 227, 87, 64, 107);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (14, to_date('14-07-2015', 'dd-mm-yyyy'), 'Intermediate_surgerie', 242, 172, 105, 370);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (15, to_date('29-04-2021', 'dd-mm-yyyy'), 'Long_surgery', 397, 343, 33, 370);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (16, to_date('31-12-2013', 'dd-mm-yyyy'), 'Long_surgery', 245, 358, 337, 256);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (17, to_date('18-01-2011', 'dd-mm-yyyy'), 'Intermediate_surgerie', 8, 360, 373, 110);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (18, to_date('22-08-2021', 'dd-mm-yyyy'), 'Short_surgery', 127, 242, 36, 158);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (19, to_date('10-09-2017', 'dd-mm-yyyy'), 'Long_surgery', 346, 169, 224, 395);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (20, to_date('15-05-2021', 'dd-mm-yyyy'), 'Long_surgery', 293, 297, 362, 354);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (21, to_date('26-11-2010', 'dd-mm-yyyy'), 'Long_surgery', 192, 341, 238, 397);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (22, to_date('14-02-2023', 'dd-mm-yyyy'), 'Long_surgery', 167, 322, 145, 282);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (23, to_date('27-12-2021', 'dd-mm-yyyy'), 'Intermediate_surgerie', 282, 292, 250, 347);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (24, to_date('05-03-2019', 'dd-mm-yyyy'), 'Intermediate_surgerie', 341, 374, 71, 269);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (25, to_date('28-09-2017', 'dd-mm-yyyy'), 'Short_surgery', 62, 71, 331, 257);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (26, to_date('18-06-2023', 'dd-mm-yyyy'), 'Intermediate_surgerie', 275, 306, 291, 26);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (27, to_date('12-10-2018', 'dd-mm-yyyy'), 'Long_surgery', 188, 105, 53, 38);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (28, to_date('06-06-2019', 'dd-mm-yyyy'), 'Intermediate_surgerie', 264, 241, 331, 190);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (29, to_date('13-06-2010', 'dd-mm-yyyy'), 'Intermediate_surgerie', 341, 291, 49, 337);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (30, to_date('16-02-2020', 'dd-mm-yyyy'), 'Intermediate_surgerie', 88, 19, 234, 96);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (31, to_date('03-09-2018', 'dd-mm-yyyy'), 'Intermediate_surgerie', 2, 299, 85, 336);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (32, to_date('31-05-2016', 'dd-mm-yyyy'), 'Long_surgery', 30, 144, 17, 261);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (33, to_date('05-02-2017', 'dd-mm-yyyy'), 'Short_surgery', 353, 291, 356, 37);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (34, to_date('09-01-2010', 'dd-mm-yyyy'), 'Long_surgery', 91, 55, 176, 149);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (35, to_date('02-01-2017', 'dd-mm-yyyy'), 'Long_surgery', 348, 118, 400, 266);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (36, to_date('07-09-2011', 'dd-mm-yyyy'), 'Intermediate_surgerie', 90, 70, 115, 322);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (37, to_date('01-04-2013', 'dd-mm-yyyy'), 'Short_surgery', 123, 381, 144, 127);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (38, to_date('22-03-2013', 'dd-mm-yyyy'), 'Short_surgery', 267, 221, 235, 133);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (39, to_date('20-07-2019', 'dd-mm-yyyy'), 'Long_surgery', 192, 48, 87, 139);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (40, to_date('15-08-2015', 'dd-mm-yyyy'), 'Long_surgery', 89, 109, 360, 264);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (41, to_date('23-05-2012', 'dd-mm-yyyy'), 'Intermediate_surgerie', 193, 190, 123, 184);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (42, to_date('19-07-2017', 'dd-mm-yyyy'), 'Intermediate_surgerie', 272, 23, 37, 267);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (43, to_date('01-11-2023', 'dd-mm-yyyy'), 'Intermediate_surgerie', 229, 330, 217, 303);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (44, to_date('06-08-2011', 'dd-mm-yyyy'), 'Short_surgery', 310, 44, 386, 217);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (45, to_date('05-09-2014', 'dd-mm-yyyy'), 'Short_surgery', 371, 387, 232, 62);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (46, to_date('31-12-2010', 'dd-mm-yyyy'), 'Short_surgery', 339, 367, 36, 32);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (47, to_date('09-10-2011', 'dd-mm-yyyy'), 'Short_surgery', 381, 87, 319, 328);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (48, to_date('12-11-2021', 'dd-mm-yyyy'), 'Intermediate_surgerie', 229, 174, 215, 160);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (49, to_date('10-08-2022', 'dd-mm-yyyy'), 'Long_surgery', 195, 230, 178, 183);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (50, to_date('07-07-2018', 'dd-mm-yyyy'), 'Short_surgery', 102, 90, 157, 201);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (51, to_date('10-03-2023', 'dd-mm-yyyy'), 'Long_surgery', 239, 292, 384, 205);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (52, to_date('07-11-2010', 'dd-mm-yyyy'), 'Short_surgery', 210, 149, 59, 156);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (53, to_date('06-05-2012', 'dd-mm-yyyy'), 'Long_surgery', 331, 139, 302, 251);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (54, to_date('15-11-2017', 'dd-mm-yyyy'), 'Intermediate_surgerie', 145, 110, 170, 278);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (55, to_date('29-12-2017', 'dd-mm-yyyy'), 'Long_surgery', 13, 148, 385, 374);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (56, to_date('26-05-2015', 'dd-mm-yyyy'), 'Intermediate_surgerie', 316, 239, 254, 9);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (57, to_date('05-10-2013', 'dd-mm-yyyy'), 'Intermediate_surgerie', 92, 93, 363, 397);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (58, to_date('23-12-2012', 'dd-mm-yyyy'), 'Long_surgery', 281, 8, 180, 179);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (59, to_date('24-01-2014', 'dd-mm-yyyy'), 'Short_surgery', 18, 103, 134, 185);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (60, to_date('04-01-2015', 'dd-mm-yyyy'), 'Long_surgery', 247, 225, 116, 356);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (61, to_date('19-11-2020', 'dd-mm-yyyy'), 'Short_surgery', 283, 252, 255, 343);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (62, to_date('05-02-2014', 'dd-mm-yyyy'), 'Short_surgery', 149, 234, 49, 124);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (63, to_date('07-10-2013', 'dd-mm-yyyy'), 'Short_surgery', 278, 280, 252, 369);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (64, to_date('18-02-2015', 'dd-mm-yyyy'), 'Intermediate_surgerie', 3, 317, 125, 370);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (65, to_date('24-01-2011', 'dd-mm-yyyy'), 'Short_surgery', 170, 206, 241, 195);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (66, to_date('21-06-2022', 'dd-mm-yyyy'), 'Intermediate_surgerie', 146, 328, 138, 361);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (67, to_date('24-05-2011', 'dd-mm-yyyy'), 'Long_surgery', 260, 340, 274, 346);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (68, to_date('01-07-2023', 'dd-mm-yyyy'), 'Long_surgery', 74, 91, 232, 98);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (69, to_date('04-03-2017', 'dd-mm-yyyy'), 'Long_surgery', 172, 46, 321, 56);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (70, to_date('24-03-2019', 'dd-mm-yyyy'), 'Short_surgery', 271, 385, 180, 317);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (71, to_date('17-11-2011', 'dd-mm-yyyy'), 'Long_surgery', 330, 367, 275, 353);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (72, to_date('19-11-2016', 'dd-mm-yyyy'), 'Long_surgery', 350, 262, 286, 225);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (73, to_date('28-04-2016', 'dd-mm-yyyy'), 'Short_surgery', 285, 64, 318, 72);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (74, to_date('07-05-2014', 'dd-mm-yyyy'), 'Short_surgery', 103, 122, 272, 363);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (75, to_date('31-01-2019', 'dd-mm-yyyy'), 'Intermediate_surgerie', 138, 377, 17, 398);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (76, to_date('14-07-2023', 'dd-mm-yyyy'), 'Long_surgery', 163, 69, 199, 52);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (77, to_date('07-10-2010', 'dd-mm-yyyy'), 'Intermediate_surgerie', 225, 272, 291, 95);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (78, to_date('19-06-2016', 'dd-mm-yyyy'), 'Intermediate_surgerie', 303, 393, 395, 223);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (79, to_date('28-06-2021', 'dd-mm-yyyy'), 'Short_surgery', 319, 57, 27, 38);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (80, to_date('18-02-2015', 'dd-mm-yyyy'), 'Intermediate_surgerie', 249, 296, 221, 110);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (81, to_date('15-09-2022', 'dd-mm-yyyy'), 'Short_surgery', 95, 156, 74, 178);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (82, to_date('08-12-2020', 'dd-mm-yyyy'), 'Short_surgery', 42, 309, 60, 384);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (83, to_date('27-12-2016', 'dd-mm-yyyy'), 'Short_surgery', 331, 318, 199, 185);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (84, to_date('08-11-2011', 'dd-mm-yyyy'), 'Short_surgery', 235, 310, 153, 198);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (85, to_date('07-12-2016', 'dd-mm-yyyy'), 'Short_surgery', 384, 239, 338, 285);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (86, to_date('01-03-2016', 'dd-mm-yyyy'), 'Intermediate_surgerie', 344, 398, 75, 153);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (87, to_date('08-03-2021', 'dd-mm-yyyy'), 'Long_surgery', 10, 286, 318, 132);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (88, to_date('02-11-2010', 'dd-mm-yyyy'), 'Short_surgery', 52, 331, 272, 35);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (89, to_date('20-08-2015', 'dd-mm-yyyy'), 'Intermediate_surgerie', 80, 290, 382, 40);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (90, to_date('14-02-2022', 'dd-mm-yyyy'), 'Intermediate_surgerie', 171, 180, 42, 326);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (91, to_date('31-05-2017', 'dd-mm-yyyy'), 'Long_surgery', 49, 112, 111, 212);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (92, to_date('17-06-2016', 'dd-mm-yyyy'), 'Intermediate_surgerie', 77, 118, 396, 155);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (93, to_date('21-10-2015', 'dd-mm-yyyy'), 'Long_surgery', 124, 138, 244, 89);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (94, to_date('18-11-2021', 'dd-mm-yyyy'), 'Long_surgery', 17, 174, 374, 87);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (95, to_date('23-06-2015', 'dd-mm-yyyy'), 'Long_surgery', 211, 3, 23, 68);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (96, to_date('06-04-2019', 'dd-mm-yyyy'), 'Long_surgery', 393, 94, 259, 210);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (97, to_date('16-05-2015', 'dd-mm-yyyy'), 'Intermediate_surgerie', 170, 321, 339, 292);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (98, to_date('01-10-2022', 'dd-mm-yyyy'), 'Intermediate_surgerie', 237, 325, 44, 127);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (99, to_date('06-05-2010', 'dd-mm-yyyy'), 'Short_surgery', 55, 288, 318, 168);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (100, to_date('20-12-2020', 'dd-mm-yyyy'), 'Short_surgery', 377, 76, 23, 307);
commit;
prompt 100 records committed...
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (101, to_date('13-10-2022', 'dd-mm-yyyy'), 'Intermediate_surgerie', 285, 163, 224, 339);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (102, to_date('28-05-2010', 'dd-mm-yyyy'), 'Intermediate_surgerie', 97, 57, 47, 398);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (103, to_date('09-10-2021', 'dd-mm-yyyy'), 'Long_surgery', 199, 95, 106, 125);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (104, to_date('24-02-2022', 'dd-mm-yyyy'), 'Intermediate_surgerie', 214, 54, 108, 170);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (105, to_date('02-04-2022', 'dd-mm-yyyy'), 'Long_surgery', 367, 69, 85, 392);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (106, to_date('19-09-2018', 'dd-mm-yyyy'), 'Short_surgery', 351, 355, 203, 80);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (107, to_date('19-12-2019', 'dd-mm-yyyy'), 'Intermediate_surgerie', 95, 272, 291, 254);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (108, to_date('04-03-2014', 'dd-mm-yyyy'), 'Short_surgery', 338, 171, 347, 124);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (109, to_date('15-11-2019', 'dd-mm-yyyy'), 'Short_surgery', 90, 45, 151, 154);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (110, to_date('14-01-2023', 'dd-mm-yyyy'), 'Long_surgery', 138, 266, 71, 180);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (111, to_date('08-08-2015', 'dd-mm-yyyy'), 'Intermediate_surgerie', 342, 111, 47, 353);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (112, to_date('19-04-2017', 'dd-mm-yyyy'), 'Long_surgery', 392, 347, 74, 302);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (113, to_date('20-07-2017', 'dd-mm-yyyy'), 'Long_surgery', 173, 51, 31, 355);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (114, to_date('13-09-2018', 'dd-mm-yyyy'), 'Short_surgery', 213, 229, 394, 358);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (115, to_date('17-01-2022', 'dd-mm-yyyy'), 'Long_surgery', 316, 318, 23, 103);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (116, to_date('11-10-2011', 'dd-mm-yyyy'), 'Short_surgery', 115, 316, 325, 88);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (117, to_date('06-03-2012', 'dd-mm-yyyy'), 'Intermediate_surgerie', 176, 168, 381, 273);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (118, to_date('25-05-2020', 'dd-mm-yyyy'), 'Intermediate_surgerie', 93, 229, 271, 370);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (119, to_date('09-12-2014', 'dd-mm-yyyy'), 'Long_surgery', 327, 189, 264, 301);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (120, to_date('15-06-2012', 'dd-mm-yyyy'), 'Short_surgery', 159, 98, 170, 168);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (121, to_date('31-12-2019', 'dd-mm-yyyy'), 'Intermediate_surgerie', 15, 201, 85, 72);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (122, to_date('02-04-2010', 'dd-mm-yyyy'), 'Long_surgery', 337, 376, 50, 143);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (123, to_date('21-05-2014', 'dd-mm-yyyy'), 'Intermediate_surgerie', 300, 228, 63, 109);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (124, to_date('28-06-2022', 'dd-mm-yyyy'), 'Short_surgery', 28, 82, 377, 21);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (125, to_date('20-11-2014', 'dd-mm-yyyy'), 'Short_surgery', 14, 299, 177, 373);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (126, to_date('14-06-2015', 'dd-mm-yyyy'), 'Long_surgery', 344, 310, 348, 74);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (127, to_date('12-07-2011', 'dd-mm-yyyy'), 'Intermediate_surgerie', 182, 178, 139, 338);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (128, to_date('01-04-2019', 'dd-mm-yyyy'), 'Intermediate_surgerie', 334, 349, 386, 28);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (129, to_date('02-02-2017', 'dd-mm-yyyy'), 'Short_surgery', 267, 200, 74, 240);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (130, to_date('10-04-2023', 'dd-mm-yyyy'), 'Short_surgery', 80, 226, 394, 348);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (131, to_date('05-09-2017', 'dd-mm-yyyy'), 'Short_surgery', 79, 82, 335, 350);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (132, to_date('10-02-2014', 'dd-mm-yyyy'), 'Short_surgery', 195, 13, 221, 206);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (133, to_date('15-05-2012', 'dd-mm-yyyy'), 'Long_surgery', 137, 310, 139, 400);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (134, to_date('09-10-2011', 'dd-mm-yyyy'), 'Short_surgery', 125, 332, 101, 92);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (135, to_date('28-06-2013', 'dd-mm-yyyy'), 'Long_surgery', 105, 368, 46, 185);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (136, to_date('04-04-2019', 'dd-mm-yyyy'), 'Short_surgery', 142, 184, 119, 370);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (137, to_date('10-08-2021', 'dd-mm-yyyy'), 'Short_surgery', 276, 196, 172, 82);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (138, to_date('16-08-2012', 'dd-mm-yyyy'), 'Long_surgery', 58, 328, 258, 342);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (139, to_date('21-09-2020', 'dd-mm-yyyy'), 'Long_surgery', 369, 159, 166, 315);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (140, to_date('01-10-2018', 'dd-mm-yyyy'), 'Long_surgery', 157, 161, 289, 116);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (141, to_date('23-09-2014', 'dd-mm-yyyy'), 'Intermediate_surgerie', 366, 108, 222, 288);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (142, to_date('18-05-2011', 'dd-mm-yyyy'), 'Intermediate_surgerie', 347, 105, 52, 45);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (143, to_date('10-05-2018', 'dd-mm-yyyy'), 'Long_surgery', 282, 209, 170, 229);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (144, to_date('03-08-2013', 'dd-mm-yyyy'), 'Intermediate_surgerie', 41, 50, 393, 232);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (145, to_date('30-10-2016', 'dd-mm-yyyy'), 'Long_surgery', 192, 330, 124, 277);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (146, to_date('30-12-2018', 'dd-mm-yyyy'), 'Short_surgery', 181, 80, 310, 276);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (147, to_date('17-01-2023', 'dd-mm-yyyy'), 'Short_surgery', 389, 62, 309, 228);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (148, to_date('04-06-2015', 'dd-mm-yyyy'), 'Short_surgery', 97, 205, 356, 335);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (149, to_date('26-11-2016', 'dd-mm-yyyy'), 'Short_surgery', 32, 352, 165, 88);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (150, to_date('18-07-2022', 'dd-mm-yyyy'), 'Long_surgery', 20, 346, 72, 295);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (151, to_date('10-12-2013', 'dd-mm-yyyy'), 'Intermediate_surgerie', 323, 240, 138, 59);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (152, to_date('16-10-2016', 'dd-mm-yyyy'), 'Short_surgery', 147, 289, 92, 327);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (153, to_date('25-01-2013', 'dd-mm-yyyy'), 'Long_surgery', 384, 266, 69, 280);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (154, to_date('09-09-2023', 'dd-mm-yyyy'), 'Intermediate_surgerie', 71, 251, 82, 208);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (155, to_date('04-11-2021', 'dd-mm-yyyy'), 'Intermediate_surgerie', 89, 247, 169, 370);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (156, to_date('17-05-2021', 'dd-mm-yyyy'), 'Short_surgery', 70, 376, 167, 86);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (157, to_date('24-06-2013', 'dd-mm-yyyy'), 'Long_surgery', 202, 388, 314, 94);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (158, to_date('28-12-2011', 'dd-mm-yyyy'), 'Short_surgery', 285, 7, 8, 275);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (159, to_date('17-12-2020', 'dd-mm-yyyy'), 'Long_surgery', 274, 13, 241, 184);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (160, to_date('07-12-2022', 'dd-mm-yyyy'), 'Intermediate_surgerie', 262, 57, 177, 169);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (161, to_date('12-09-2020', 'dd-mm-yyyy'), 'Short_surgery', 72, 308, 168, 51);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (162, to_date('04-02-2012', 'dd-mm-yyyy'), 'Long_surgery', 290, 310, 189, 27);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (163, to_date('11-11-2012', 'dd-mm-yyyy'), 'Short_surgery', 374, 344, 228, 9);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (164, to_date('01-06-2016', 'dd-mm-yyyy'), 'Short_surgery', 28, 387, 57, 353);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (165, to_date('15-06-2013', 'dd-mm-yyyy'), 'Short_surgery', 304, 164, 51, 163);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (166, to_date('30-01-2010', 'dd-mm-yyyy'), 'Long_surgery', 33, 2, 303, 14);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (167, to_date('31-05-2010', 'dd-mm-yyyy'), 'Intermediate_surgerie', 54, 18, 259, 162);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (168, to_date('07-06-2013', 'dd-mm-yyyy'), 'Long_surgery', 293, 250, 313, 395);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (169, to_date('16-03-2023', 'dd-mm-yyyy'), 'Short_surgery', 351, 133, 227, 178);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (170, to_date('05-04-2023', 'dd-mm-yyyy'), 'Short_surgery', 365, 145, 160, 179);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (171, to_date('04-02-2019', 'dd-mm-yyyy'), 'Intermediate_surgerie', 129, 284, 72, 324);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (172, to_date('25-04-2020', 'dd-mm-yyyy'), 'Intermediate_surgerie', 241, 350, 379, 212);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (173, to_date('13-04-2013', 'dd-mm-yyyy'), 'Short_surgery', 354, 161, 214, 245);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (174, to_date('13-04-2021', 'dd-mm-yyyy'), 'Intermediate_surgerie', 333, 127, 225, 55);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (175, to_date('01-10-2015', 'dd-mm-yyyy'), 'Short_surgery', 71, 7, 287, 321);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (176, to_date('16-07-2020', 'dd-mm-yyyy'), 'Intermediate_surgerie', 281, 31, 298, 295);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (177, to_date('18-10-2019', 'dd-mm-yyyy'), 'Short_surgery', 13, 308, 124, 4);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (178, to_date('29-07-2018', 'dd-mm-yyyy'), 'Long_surgery', 12, 192, 259, 391);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (179, to_date('25-01-2022', 'dd-mm-yyyy'), 'Long_surgery', 43, 222, 10, 126);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (180, to_date('24-02-2017', 'dd-mm-yyyy'), 'Long_surgery', 129, 110, 129, 347);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (181, to_date('30-08-2011', 'dd-mm-yyyy'), 'Short_surgery', 379, 119, 325, 105);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (182, to_date('19-01-2018', 'dd-mm-yyyy'), 'Long_surgery', 53, 391, 91, 191);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (183, to_date('15-06-2022', 'dd-mm-yyyy'), 'Short_surgery', 253, 122, 358, 288);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (184, to_date('10-11-2023', 'dd-mm-yyyy'), 'Intermediate_surgerie', 26, 154, 282, 135);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (185, to_date('10-05-2012', 'dd-mm-yyyy'), 'Intermediate_surgerie', 174, 223, 231, 148);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (186, to_date('02-11-2014', 'dd-mm-yyyy'), 'Short_surgery', 361, 361, 112, 398);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (187, to_date('22-05-2018', 'dd-mm-yyyy'), 'Intermediate_surgerie', 37, 65, 307, 387);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (188, to_date('12-10-2018', 'dd-mm-yyyy'), 'Intermediate_surgerie', 277, 163, 372, 183);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (189, to_date('25-05-2010', 'dd-mm-yyyy'), 'Intermediate_surgerie', 240, 157, 214, 250);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (190, to_date('02-04-2018', 'dd-mm-yyyy'), 'Short_surgery', 293, 334, 292, 180);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (191, to_date('21-08-2010', 'dd-mm-yyyy'), 'Short_surgery', 268, 15, 71, 311);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (192, to_date('22-10-2013', 'dd-mm-yyyy'), 'Intermediate_surgerie', 311, 291, 199, 278);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (193, to_date('24-03-2020', 'dd-mm-yyyy'), 'Short_surgery', 100, 10, 242, 235);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (194, to_date('28-06-2022', 'dd-mm-yyyy'), 'Intermediate_surgerie', 384, 158, 130, 265);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (195, to_date('03-08-2020', 'dd-mm-yyyy'), 'Intermediate_surgerie', 286, 195, 2, 364);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (196, to_date('10-01-2017', 'dd-mm-yyyy'), 'Intermediate_surgerie', 71, 184, 62, 207);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (197, to_date('15-04-2015', 'dd-mm-yyyy'), 'Intermediate_surgerie', 262, 300, 44, 52);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (198, to_date('23-05-2023', 'dd-mm-yyyy'), 'Long_surgery', 400, 358, 317, 77);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (199, to_date('29-07-2011', 'dd-mm-yyyy'), 'Intermediate_surgerie', 154, 378, 214, 187);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (200, to_date('23-05-2013', 'dd-mm-yyyy'), 'Long_surgery', 127, 351, 385, 315);
commit;
prompt 200 records committed...
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (201, to_date('08-07-2011', 'dd-mm-yyyy'), 'Long_surgery', 230, 70, 396, 216);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (202, to_date('19-09-2011', 'dd-mm-yyyy'), 'Intermediate_surgerie', 112, 11, 136, 315);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (203, to_date('14-04-2016', 'dd-mm-yyyy'), 'Intermediate_surgerie', 244, 193, 137, 123);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (204, to_date('28-04-2019', 'dd-mm-yyyy'), 'Intermediate_surgerie', 114, 351, 275, 294);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (205, to_date('19-01-2023', 'dd-mm-yyyy'), 'Long_surgery', 255, 8, 336, 275);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (206, to_date('18-07-2012', 'dd-mm-yyyy'), 'Long_surgery', 400, 250, 179, 152);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (207, to_date('01-03-2011', 'dd-mm-yyyy'), 'Long_surgery', 141, 65, 389, 184);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (208, to_date('06-06-2016', 'dd-mm-yyyy'), 'Intermediate_surgerie', 297, 212, 206, 188);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (209, to_date('08-04-2015', 'dd-mm-yyyy'), 'Long_surgery', 1, 199, 303, 98);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (210, to_date('01-09-2017', 'dd-mm-yyyy'), 'Long_surgery', 272, 196, 391, 253);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (211, to_date('03-10-2010', 'dd-mm-yyyy'), 'Long_surgery', 73, 368, 181, 265);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (212, to_date('19-10-2014', 'dd-mm-yyyy'), 'Intermediate_surgerie', 257, 271, 25, 32);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (213, to_date('24-03-2022', 'dd-mm-yyyy'), 'Short_surgery', 141, 95, 396, 398);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (214, to_date('06-10-2019', 'dd-mm-yyyy'), 'Short_surgery', 222, 106, 241, 24);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (215, to_date('16-05-2020', 'dd-mm-yyyy'), 'Short_surgery', 75, 18, 239, 367);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (216, to_date('26-03-2023', 'dd-mm-yyyy'), 'Intermediate_surgerie', 305, 242, 285, 111);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (217, to_date('10-01-2011', 'dd-mm-yyyy'), 'Short_surgery', 75, 313, 168, 65);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (218, to_date('22-01-2023', 'dd-mm-yyyy'), 'Short_surgery', 301, 160, 215, 288);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (219, to_date('02-12-2013', 'dd-mm-yyyy'), 'Intermediate_surgerie', 62, 77, 56, 53);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (220, to_date('07-11-2023', 'dd-mm-yyyy'), 'Short_surgery', 21, 305, 98, 246);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (221, to_date('07-11-2021', 'dd-mm-yyyy'), 'Intermediate_surgerie', 177, 257, 336, 341);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (222, to_date('22-08-2016', 'dd-mm-yyyy'), 'Long_surgery', 121, 57, 238, 179);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (223, to_date('17-06-2020', 'dd-mm-yyyy'), 'Intermediate_surgerie', 46, 393, 269, 324);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (224, to_date('01-08-2020', 'dd-mm-yyyy'), 'Short_surgery', 316, 225, 323, 102);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (225, to_date('11-03-2013', 'dd-mm-yyyy'), 'Intermediate_surgerie', 163, 369, 19, 205);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (226, to_date('23-08-2021', 'dd-mm-yyyy'), 'Intermediate_surgerie', 377, 250, 216, 264);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (227, to_date('15-05-2013', 'dd-mm-yyyy'), 'Long_surgery', 57, 54, 158, 330);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (228, to_date('24-06-2022', 'dd-mm-yyyy'), 'Intermediate_surgerie', 222, 91, 69, 125);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (229, to_date('05-08-2010', 'dd-mm-yyyy'), 'Long_surgery', 384, 197, 302, 191);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (230, to_date('30-07-2017', 'dd-mm-yyyy'), 'Short_surgery', 303, 394, 306, 295);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (231, to_date('28-06-2019', 'dd-mm-yyyy'), 'Intermediate_surgerie', 211, 81, 275, 91);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (232, to_date('28-05-2017', 'dd-mm-yyyy'), 'Intermediate_surgerie', 3, 286, 128, 302);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (233, to_date('24-03-2016', 'dd-mm-yyyy'), 'Short_surgery', 49, 297, 126, 233);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (234, to_date('24-02-2012', 'dd-mm-yyyy'), 'Intermediate_surgerie', 242, 232, 111, 379);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (235, to_date('25-12-2016', 'dd-mm-yyyy'), 'Intermediate_surgerie', 84, 332, 189, 54);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (236, to_date('12-09-2019', 'dd-mm-yyyy'), 'Short_surgery', 197, 273, 133, 346);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (237, to_date('13-04-2013', 'dd-mm-yyyy'), 'Short_surgery', 367, 350, 99, 326);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (238, to_date('04-01-2018', 'dd-mm-yyyy'), 'Long_surgery', 152, 92, 2, 374);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (239, to_date('16-06-2011', 'dd-mm-yyyy'), 'Short_surgery', 222, 240, 168, 274);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (240, to_date('01-11-2010', 'dd-mm-yyyy'), 'Intermediate_surgerie', 174, 217, 238, 105);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (241, to_date('14-05-2023', 'dd-mm-yyyy'), 'Short_surgery', 217, 318, 233, 21);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (242, to_date('27-12-2019', 'dd-mm-yyyy'), 'Short_surgery', 28, 221, 157, 314);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (243, to_date('22-01-2012', 'dd-mm-yyyy'), 'Intermediate_surgerie', 173, 171, 375, 14);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (244, to_date('08-08-2023', 'dd-mm-yyyy'), 'Long_surgery', 230, 222, 126, 198);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (245, to_date('14-03-2022', 'dd-mm-yyyy'), 'Intermediate_surgerie', 343, 207, 13, 339);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (246, to_date('29-02-2016', 'dd-mm-yyyy'), 'Long_surgery', 254, 136, 135, 258);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (247, to_date('29-11-2018', 'dd-mm-yyyy'), 'Intermediate_surgerie', 244, 212, 396, 177);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (248, to_date('20-11-2021', 'dd-mm-yyyy'), 'Short_surgery', 394, 400, 143, 77);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (249, to_date('22-08-2019', 'dd-mm-yyyy'), 'Long_surgery', 73, 74, 378, 116);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (250, to_date('16-08-2021', 'dd-mm-yyyy'), 'Intermediate_surgerie', 281, 4, 168, 357);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (251, to_date('29-10-2021', 'dd-mm-yyyy'), 'Intermediate_surgerie', 184, 379, 294, 160);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (252, to_date('18-05-2021', 'dd-mm-yyyy'), 'Intermediate_surgerie', 373, 161, 153, 308);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (253, to_date('15-11-2011', 'dd-mm-yyyy'), 'Short_surgery', 165, 241, 41, 365);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (254, to_date('13-11-2020', 'dd-mm-yyyy'), 'Intermediate_surgerie', 22, 46, 184, 359);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (255, to_date('03-05-2010', 'dd-mm-yyyy'), 'Long_surgery', 388, 254, 376, 329);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (256, to_date('17-10-2019', 'dd-mm-yyyy'), 'Long_surgery', 211, 332, 118, 286);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (257, to_date('01-07-2014', 'dd-mm-yyyy'), 'Short_surgery', 174, 151, 121, 270);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (258, to_date('18-12-2021', 'dd-mm-yyyy'), 'Intermediate_surgerie', 386, 365, 148, 126);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (259, to_date('05-11-2022', 'dd-mm-yyyy'), 'Intermediate_surgerie', 34, 43, 102, 127);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (260, to_date('16-12-2014', 'dd-mm-yyyy'), 'Long_surgery', 78, 95, 9, 166);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (261, to_date('02-06-2023', 'dd-mm-yyyy'), 'Short_surgery', 348, 232, 311, 4);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (262, to_date('30-08-2017', 'dd-mm-yyyy'), 'Intermediate_surgerie', 121, 2, 132, 385);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (263, to_date('28-04-2012', 'dd-mm-yyyy'), 'Long_surgery', 132, 261, 108, 202);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (264, to_date('24-04-2013', 'dd-mm-yyyy'), 'Short_surgery', 382, 354, 238, 227);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (265, to_date('09-11-2014', 'dd-mm-yyyy'), 'Short_surgery', 48, 2, 165, 365);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (266, to_date('06-06-2020', 'dd-mm-yyyy'), 'Short_surgery', 194, 12, 111, 97);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (267, to_date('12-06-2015', 'dd-mm-yyyy'), 'Short_surgery', 317, 47, 157, 160);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (268, to_date('05-12-2014', 'dd-mm-yyyy'), 'Short_surgery', 213, 329, 210, 51);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (269, to_date('12-05-2012', 'dd-mm-yyyy'), 'Long_surgery', 293, 390, 311, 47);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (270, to_date('05-05-2018', 'dd-mm-yyyy'), 'Long_surgery', 92, 169, 281, 61);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (271, to_date('22-01-2013', 'dd-mm-yyyy'), 'Long_surgery', 146, 90, 213, 344);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (272, to_date('23-10-2016', 'dd-mm-yyyy'), 'Short_surgery', 97, 170, 212, 342);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (273, to_date('15-01-2012', 'dd-mm-yyyy'), 'Short_surgery', 25, 278, 388, 133);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (274, to_date('20-10-2018', 'dd-mm-yyyy'), 'Short_surgery', 45, 97, 306, 328);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (275, to_date('31-08-2010', 'dd-mm-yyyy'), 'Long_surgery', 136, 201, 244, 38);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (276, to_date('10-07-2020', 'dd-mm-yyyy'), 'Short_surgery', 294, 400, 213, 154);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (277, to_date('27-06-2016', 'dd-mm-yyyy'), 'Long_surgery', 112, 83, 110, 204);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (278, to_date('20-02-2013', 'dd-mm-yyyy'), 'Short_surgery', 379, 21, 284, 257);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (279, to_date('04-11-2018', 'dd-mm-yyyy'), 'Intermediate_surgerie', 118, 287, 347, 98);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (280, to_date('10-05-2016', 'dd-mm-yyyy'), 'Intermediate_surgerie', 203, 177, 2, 352);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (281, to_date('27-06-2010', 'dd-mm-yyyy'), 'Short_surgery', 257, 347, 259, 87);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (282, to_date('12-02-2015', 'dd-mm-yyyy'), 'Intermediate_surgerie', 391, 347, 245, 381);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (283, to_date('24-03-2017', 'dd-mm-yyyy'), 'Short_surgery', 121, 367, 399, 1);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (284, to_date('22-07-2013', 'dd-mm-yyyy'), 'Short_surgery', 107, 394, 242, 102);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (285, to_date('17-07-2017', 'dd-mm-yyyy'), 'Intermediate_surgerie', 53, 161, 388, 21);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (286, to_date('18-04-2020', 'dd-mm-yyyy'), 'Short_surgery', 352, 67, 168, 112);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (287, to_date('17-03-2013', 'dd-mm-yyyy'), 'Short_surgery', 178, 8, 33, 129);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (288, to_date('12-04-2019', 'dd-mm-yyyy'), 'Intermediate_surgerie', 32, 387, 51, 376);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (289, to_date('13-09-2014', 'dd-mm-yyyy'), 'Long_surgery', 145, 219, 71, 44);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (290, to_date('04-07-2011', 'dd-mm-yyyy'), 'Short_surgery', 227, 385, 127, 54);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (291, to_date('30-07-2014', 'dd-mm-yyyy'), 'Intermediate_surgerie', 258, 382, 136, 72);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (292, to_date('15-11-2021', 'dd-mm-yyyy'), 'Intermediate_surgerie', 136, 281, 314, 89);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (293, to_date('13-09-2011', 'dd-mm-yyyy'), 'Short_surgery', 328, 81, 56, 214);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (294, to_date('25-05-2010', 'dd-mm-yyyy'), 'Intermediate_surgerie', 334, 375, 159, 159);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (295, to_date('17-06-2013', 'dd-mm-yyyy'), 'Intermediate_surgerie', 324, 151, 281, 152);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (296, to_date('04-04-2020', 'dd-mm-yyyy'), 'Long_surgery', 224, 154, 307, 59);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (297, to_date('20-03-2016', 'dd-mm-yyyy'), 'Long_surgery', 164, 77, 161, 47);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (298, to_date('06-01-2022', 'dd-mm-yyyy'), 'Long_surgery', 311, 257, 260, 97);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (299, to_date('23-04-2023', 'dd-mm-yyyy'), 'Intermediate_surgerie', 113, 382, 70, 184);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (300, to_date('26-11-2015', 'dd-mm-yyyy'), 'Short_surgery', 383, 30, 64, 393);
commit;
prompt 300 records committed...
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (301, to_date('01-06-2010', 'dd-mm-yyyy'), 'Long_surgery', 132, 228, 283, 388);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (302, to_date('06-08-2011', 'dd-mm-yyyy'), 'Short_surgery', 24, 300, 104, 251);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (303, to_date('17-11-2015', 'dd-mm-yyyy'), 'Long_surgery', 246, 75, 17, 251);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (304, to_date('25-01-2023', 'dd-mm-yyyy'), 'Long_surgery', 350, 296, 48, 96);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (305, to_date('13-04-2022', 'dd-mm-yyyy'), 'Short_surgery', 88, 195, 138, 96);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (306, to_date('13-11-2010', 'dd-mm-yyyy'), 'Long_surgery', 389, 155, 89, 145);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (307, to_date('25-07-2022', 'dd-mm-yyyy'), 'Intermediate_surgerie', 258, 329, 344, 307);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (308, to_date('05-11-2013', 'dd-mm-yyyy'), 'Intermediate_surgerie', 396, 141, 168, 107);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (309, to_date('21-06-2013', 'dd-mm-yyyy'), 'Short_surgery', 272, 249, 123, 365);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (310, to_date('21-01-2020', 'dd-mm-yyyy'), 'Intermediate_surgerie', 124, 205, 104, 285);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (311, to_date('05-07-2010', 'dd-mm-yyyy'), 'Intermediate_surgerie', 354, 325, 107, 209);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (312, to_date('26-07-2020', 'dd-mm-yyyy'), 'Short_surgery', 142, 24, 106, 159);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (313, to_date('30-12-2014', 'dd-mm-yyyy'), 'Long_surgery', 15, 70, 106, 265);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (314, to_date('05-08-2011', 'dd-mm-yyyy'), 'Long_surgery', 23, 145, 23, 238);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (315, to_date('19-06-2020', 'dd-mm-yyyy'), 'Long_surgery', 93, 337, 251, 168);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (316, to_date('17-12-2019', 'dd-mm-yyyy'), 'Short_surgery', 95, 166, 173, 262);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (317, to_date('08-10-2023', 'dd-mm-yyyy'), 'Long_surgery', 193, 169, 138, 308);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (318, to_date('03-09-2021', 'dd-mm-yyyy'), 'Intermediate_surgerie', 362, 387, 328, 126);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (319, to_date('09-10-2023', 'dd-mm-yyyy'), 'Long_surgery', 396, 163, 181, 31);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (320, to_date('10-06-2016', 'dd-mm-yyyy'), 'Short_surgery', 314, 264, 294, 18);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (321, to_date('01-10-2021', 'dd-mm-yyyy'), 'Intermediate_surgerie', 191, 338, 290, 36);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (322, to_date('19-07-2023', 'dd-mm-yyyy'), 'Long_surgery', 216, 289, 53, 348);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (323, to_date('01-04-2013', 'dd-mm-yyyy'), 'Long_surgery', 75, 192, 264, 181);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (324, to_date('15-06-2018', 'dd-mm-yyyy'), 'Short_surgery', 195, 36, 315, 150);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (325, to_date('08-05-2020', 'dd-mm-yyyy'), 'Intermediate_surgerie', 200, 320, 21, 45);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (326, to_date('31-10-2013', 'dd-mm-yyyy'), 'Long_surgery', 318, 5, 49, 333);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (327, to_date('07-12-2021', 'dd-mm-yyyy'), 'Long_surgery', 92, 285, 257, 70);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (328, to_date('16-02-2019', 'dd-mm-yyyy'), 'Long_surgery', 187, 184, 31, 270);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (329, to_date('10-09-2018', 'dd-mm-yyyy'), 'Intermediate_surgerie', 36, 309, 260, 18);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (330, to_date('29-09-2019', 'dd-mm-yyyy'), 'Long_surgery', 232, 371, 384, 305);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (331, to_date('17-12-2013', 'dd-mm-yyyy'), 'Short_surgery', 341, 84, 56, 368);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (332, to_date('24-01-2023', 'dd-mm-yyyy'), 'Short_surgery', 231, 187, 149, 54);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (333, to_date('14-12-2014', 'dd-mm-yyyy'), 'Long_surgery', 84, 68, 225, 396);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (334, to_date('22-03-2013', 'dd-mm-yyyy'), 'Short_surgery', 251, 2, 260, 86);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (335, to_date('17-04-2023', 'dd-mm-yyyy'), 'Intermediate_surgerie', 153, 351, 370, 349);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (336, to_date('17-10-2021', 'dd-mm-yyyy'), 'Intermediate_surgerie', 118, 117, 165, 262);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (337, to_date('30-01-2015', 'dd-mm-yyyy'), 'Long_surgery', 369, 283, 157, 71);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (338, to_date('01-05-2010', 'dd-mm-yyyy'), 'Long_surgery', 26, 24, 57, 117);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (339, to_date('29-07-2011', 'dd-mm-yyyy'), 'Intermediate_surgerie', 132, 126, 126, 87);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (340, to_date('26-04-2015', 'dd-mm-yyyy'), 'Intermediate_surgerie', 184, 81, 373, 366);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (341, to_date('07-02-2011', 'dd-mm-yyyy'), 'Short_surgery', 149, 132, 386, 97);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (342, to_date('03-12-2021', 'dd-mm-yyyy'), 'Long_surgery', 318, 30, 305, 308);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (343, to_date('21-07-2015', 'dd-mm-yyyy'), 'Long_surgery', 107, 111, 192, 291);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (344, to_date('08-03-2010', 'dd-mm-yyyy'), 'Short_surgery', 320, 88, 398, 16);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (345, to_date('04-06-2012', 'dd-mm-yyyy'), 'Short_surgery', 34, 283, 318, 237);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (346, to_date('02-08-2022', 'dd-mm-yyyy'), 'Short_surgery', 269, 52, 375, 304);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (347, to_date('13-08-2013', 'dd-mm-yyyy'), 'Short_surgery', 19, 283, 228, 155);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (348, to_date('28-11-2021', 'dd-mm-yyyy'), 'Intermediate_surgerie', 108, 336, 252, 320);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (349, to_date('05-12-2018', 'dd-mm-yyyy'), 'Intermediate_surgerie', 233, 116, 149, 324);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (350, to_date('28-04-2021', 'dd-mm-yyyy'), 'Intermediate_surgerie', 206, 175, 101, 390);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (351, to_date('11-05-2012', 'dd-mm-yyyy'), 'Short_surgery', 124, 126, 261, 40);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (352, to_date('02-03-2012', 'dd-mm-yyyy'), 'Short_surgery', 90, 336, 315, 156);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (353, to_date('01-04-2019', 'dd-mm-yyyy'), 'Short_surgery', 122, 373, 101, 59);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (354, to_date('11-05-2011', 'dd-mm-yyyy'), 'Intermediate_surgerie', 368, 157, 325, 212);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (355, to_date('16-03-2019', 'dd-mm-yyyy'), 'Long_surgery', 129, 294, 190, 174);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (356, to_date('26-03-2011', 'dd-mm-yyyy'), 'Intermediate_surgerie', 150, 47, 244, 309);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (357, to_date('10-04-2014', 'dd-mm-yyyy'), 'Long_surgery', 338, 29, 390, 21);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (358, to_date('08-09-2021', 'dd-mm-yyyy'), 'Short_surgery', 354, 286, 365, 120);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (359, to_date('07-06-2012', 'dd-mm-yyyy'), 'Short_surgery', 44, 94, 5, 186);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (360, to_date('08-02-2022', 'dd-mm-yyyy'), 'Short_surgery', 232, 244, 3, 230);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (361, to_date('26-03-2010', 'dd-mm-yyyy'), 'Short_surgery', 200, 188, 309, 312);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (362, to_date('06-12-2019', 'dd-mm-yyyy'), 'Intermediate_surgerie', 99, 261, 8, 348);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (363, to_date('30-11-2019', 'dd-mm-yyyy'), 'Short_surgery', 370, 399, 343, 256);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (364, to_date('08-07-2012', 'dd-mm-yyyy'), 'Intermediate_surgerie', 178, 112, 223, 218);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (365, to_date('19-01-2023', 'dd-mm-yyyy'), 'Short_surgery', 50, 211, 46, 21);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (366, to_date('27-04-2014', 'dd-mm-yyyy'), 'Intermediate_surgerie', 376, 93, 35, 3);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (367, to_date('03-05-2014', 'dd-mm-yyyy'), 'Short_surgery', 398, 378, 163, 294);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (368, to_date('27-07-2022', 'dd-mm-yyyy'), 'Short_surgery', 286, 58, 281, 235);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (369, to_date('25-07-2010', 'dd-mm-yyyy'), 'Intermediate_surgerie', 130, 56, 17, 319);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (370, to_date('23-11-2020', 'dd-mm-yyyy'), 'Intermediate_surgerie', 23, 236, 60, 298);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (371, to_date('23-07-2014', 'dd-mm-yyyy'), 'Long_surgery', 252, 63, 346, 347);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (372, to_date('05-05-2012', 'dd-mm-yyyy'), 'Short_surgery', 206, 158, 109, 140);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (373, to_date('21-10-2010', 'dd-mm-yyyy'), 'Long_surgery', 368, 60, 134, 373);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (374, to_date('22-02-2021', 'dd-mm-yyyy'), 'Intermediate_surgerie', 290, 138, 102, 389);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (375, to_date('09-05-2017', 'dd-mm-yyyy'), 'Long_surgery', 234, 328, 18, 224);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (376, to_date('02-01-2020', 'dd-mm-yyyy'), 'Short_surgery', 147, 218, 123, 146);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (377, to_date('28-04-2013', 'dd-mm-yyyy'), 'Long_surgery', 302, 126, 192, 87);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (378, to_date('16-05-2021', 'dd-mm-yyyy'), 'Intermediate_surgerie', 318, 25, 278, 255);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (379, to_date('24-01-2010', 'dd-mm-yyyy'), 'Short_surgery', 318, 302, 8, 353);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (380, to_date('09-02-2018', 'dd-mm-yyyy'), 'Intermediate_surgerie', 20, 267, 86, 310);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (381, to_date('18-09-2022', 'dd-mm-yyyy'), 'Intermediate_surgerie', 326, 355, 182, 70);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (382, to_date('14-01-2019', 'dd-mm-yyyy'), 'Short_surgery', 139, 298, 226, 195);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (383, to_date('12-05-2022', 'dd-mm-yyyy'), 'Intermediate_surgerie', 144, 206, 215, 259);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (384, to_date('27-10-2010', 'dd-mm-yyyy'), 'Short_surgery', 96, 277, 83, 238);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (385, to_date('04-02-2022', 'dd-mm-yyyy'), 'Short_surgery', 254, 288, 127, 24);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (386, to_date('04-03-2015', 'dd-mm-yyyy'), 'Intermediate_surgerie', 1, 169, 246, 147);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (387, to_date('07-05-2022', 'dd-mm-yyyy'), 'Long_surgery', 364, 8, 116, 267);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (388, to_date('24-03-2010', 'dd-mm-yyyy'), 'Short_surgery', 399, 299, 32, 224);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (389, to_date('02-07-2017', 'dd-mm-yyyy'), 'Short_surgery', 19, 382, 250, 366);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (390, to_date('24-03-2017', 'dd-mm-yyyy'), 'Long_surgery', 19, 308, 170, 36);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (391, to_date('11-10-2018', 'dd-mm-yyyy'), 'Long_surgery', 87, 313, 388, 30);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (392, to_date('12-01-2017', 'dd-mm-yyyy'), 'Long_surgery', 19, 232, 118, 210);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (393, to_date('01-02-2010', 'dd-mm-yyyy'), 'Intermediate_surgerie', 94, 104, 257, 266);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (394, to_date('17-06-2018', 'dd-mm-yyyy'), 'Short_surgery', 153, 330, 359, 353);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (395, to_date('04-07-2021', 'dd-mm-yyyy'), 'Intermediate_surgerie', 68, 272, 60, 288);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (396, to_date('30-06-2019', 'dd-mm-yyyy'), 'Intermediate_surgerie', 346, 15, 143, 167);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (397, to_date('10-05-2021', 'dd-mm-yyyy'), 'Long_surgery', 31, 258, 156, 111);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (398, to_date('20-05-2023', 'dd-mm-yyyy'), 'Long_surgery', 104, 290, 19, 143);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (399, to_date('07-04-2013', 'dd-mm-yyyy'), 'Intermediate_surgerie', 14, 113, 388, 240);
insert into SURGERY (surgeryid, surgerydate, surgerytype, roomid, patientid, doctorid, nurseid)
values (400, to_date('15-08-2010', 'dd-mm-yyyy'), 'Intermediate_surgerie', 239, 243, 217, 312);
commit;
prompt 400 records loaded
prompt Loading USED_IN...
insert into USED_IN (medicineid, surgeryid)
values (30, 363);
insert into USED_IN (medicineid, surgeryid)
values (195, 338);
insert into USED_IN (medicineid, surgeryid)
values (405, 316);
insert into USED_IN (medicineid, surgeryid)
values (278, 314);
insert into USED_IN (medicineid, surgeryid)
values (41, 264);
insert into USED_IN (medicineid, surgeryid)
values (320, 382);
insert into USED_IN (medicineid, surgeryid)
values (45, 306);
insert into USED_IN (medicineid, surgeryid)
values (301, 182);
insert into USED_IN (medicineid, surgeryid)
values (400, 348);
insert into USED_IN (medicineid, surgeryid)
values (357, 278);
insert into USED_IN (medicineid, surgeryid)
values (65, 330);
insert into USED_IN (medicineid, surgeryid)
values (52, 192);
insert into USED_IN (medicineid, surgeryid)
values (331, 382);
insert into USED_IN (medicineid, surgeryid)
values (209, 300);
insert into USED_IN (medicineid, surgeryid)
values (229, 87);
insert into USED_IN (medicineid, surgeryid)
values (106, 394);
insert into USED_IN (medicineid, surgeryid)
values (157, 96);
insert into USED_IN (medicineid, surgeryid)
values (460, 233);
insert into USED_IN (medicineid, surgeryid)
values (408, 296);
insert into USED_IN (medicineid, surgeryid)
values (294, 306);
insert into USED_IN (medicineid, surgeryid)
values (30, 371);
insert into USED_IN (medicineid, surgeryid)
values (294, 318);
insert into USED_IN (medicineid, surgeryid)
values (472, 343);
insert into USED_IN (medicineid, surgeryid)
values (36, 223);
insert into USED_IN (medicineid, surgeryid)
values (119, 355);
insert into USED_IN (medicineid, surgeryid)
values (468, 324);
insert into USED_IN (medicineid, surgeryid)
values (7, 262);
insert into USED_IN (medicineid, surgeryid)
values (201, 250);
insert into USED_IN (medicineid, surgeryid)
values (54, 105);
insert into USED_IN (medicineid, surgeryid)
values (322, 343);
insert into USED_IN (medicineid, surgeryid)
values (278, 234);
insert into USED_IN (medicineid, surgeryid)
values (491, 259);
insert into USED_IN (medicineid, surgeryid)
values (180, 348);
insert into USED_IN (medicineid, surgeryid)
values (296, 113);
insert into USED_IN (medicineid, surgeryid)
values (479, 19);
insert into USED_IN (medicineid, surgeryid)
values (368, 378);
insert into USED_IN (medicineid, surgeryid)
values (81, 174);
insert into USED_IN (medicineid, surgeryid)
values (494, 63);
insert into USED_IN (medicineid, surgeryid)
values (293, 301);
insert into USED_IN (medicineid, surgeryid)
values (495, 392);
insert into USED_IN (medicineid, surgeryid)
values (374, 248);
insert into USED_IN (medicineid, surgeryid)
values (290, 86);
insert into USED_IN (medicineid, surgeryid)
values (186, 375);
insert into USED_IN (medicineid, surgeryid)
values (240, 86);
insert into USED_IN (medicineid, surgeryid)
values (299, 352);
insert into USED_IN (medicineid, surgeryid)
values (427, 29);
insert into USED_IN (medicineid, surgeryid)
values (30, 139);
insert into USED_IN (medicineid, surgeryid)
values (167, 92);
insert into USED_IN (medicineid, surgeryid)
values (86, 49);
insert into USED_IN (medicineid, surgeryid)
values (197, 323);
insert into USED_IN (medicineid, surgeryid)
values (469, 31);
insert into USED_IN (medicineid, surgeryid)
values (100, 84);
insert into USED_IN (medicineid, surgeryid)
values (103, 74);
insert into USED_IN (medicineid, surgeryid)
values (115, 321);
insert into USED_IN (medicineid, surgeryid)
values (90, 74);
insert into USED_IN (medicineid, surgeryid)
values (186, 278);
insert into USED_IN (medicineid, surgeryid)
values (282, 47);
insert into USED_IN (medicineid, surgeryid)
values (135, 375);
insert into USED_IN (medicineid, surgeryid)
values (361, 56);
insert into USED_IN (medicineid, surgeryid)
values (20, 271);
insert into USED_IN (medicineid, surgeryid)
values (327, 113);
insert into USED_IN (medicineid, surgeryid)
values (407, 29);
insert into USED_IN (medicineid, surgeryid)
values (364, 34);
insert into USED_IN (medicineid, surgeryid)
values (271, 398);
insert into USED_IN (medicineid, surgeryid)
values (212, 110);
insert into USED_IN (medicineid, surgeryid)
values (51, 340);
insert into USED_IN (medicineid, surgeryid)
values (299, 360);
insert into USED_IN (medicineid, surgeryid)
values (350, 12);
insert into USED_IN (medicineid, surgeryid)
values (453, 253);
insert into USED_IN (medicineid, surgeryid)
values (471, 326);
insert into USED_IN (medicineid, surgeryid)
values (271, 32);
insert into USED_IN (medicineid, surgeryid)
values (128, 300);
insert into USED_IN (medicineid, surgeryid)
values (153, 154);
insert into USED_IN (medicineid, surgeryid)
values (201, 335);
insert into USED_IN (medicineid, surgeryid)
values (357, 173);
insert into USED_IN (medicineid, surgeryid)
values (159, 10);
insert into USED_IN (medicineid, surgeryid)
values (342, 162);
insert into USED_IN (medicineid, surgeryid)
values (273, 343);
insert into USED_IN (medicineid, surgeryid)
values (463, 233);
insert into USED_IN (medicineid, surgeryid)
values (446, 112);
insert into USED_IN (medicineid, surgeryid)
values (99, 222);
insert into USED_IN (medicineid, surgeryid)
values (118, 373);
insert into USED_IN (medicineid, surgeryid)
values (454, 115);
insert into USED_IN (medicineid, surgeryid)
values (235, 182);
insert into USED_IN (medicineid, surgeryid)
values (438, 272);
insert into USED_IN (medicineid, surgeryid)
values (21, 244);
insert into USED_IN (medicineid, surgeryid)
values (59, 231);
insert into USED_IN (medicineid, surgeryid)
values (345, 110);
insert into USED_IN (medicineid, surgeryid)
values (497, 153);
insert into USED_IN (medicineid, surgeryid)
values (72, 238);
insert into USED_IN (medicineid, surgeryid)
values (77, 276);
insert into USED_IN (medicineid, surgeryid)
values (25, 335);
insert into USED_IN (medicineid, surgeryid)
values (496, 251);
insert into USED_IN (medicineid, surgeryid)
values (168, 302);
insert into USED_IN (medicineid, surgeryid)
values (346, 329);
insert into USED_IN (medicineid, surgeryid)
values (352, 201);
insert into USED_IN (medicineid, surgeryid)
values (470, 61);
insert into USED_IN (medicineid, surgeryid)
values (47, 161);
insert into USED_IN (medicineid, surgeryid)
values (496, 286);
insert into USED_IN (medicineid, surgeryid)
values (130, 42);
commit;
prompt 100 records committed...
insert into USED_IN (medicineid, surgeryid)
values (304, 277);
insert into USED_IN (medicineid, surgeryid)
values (352, 373);
insert into USED_IN (medicineid, surgeryid)
values (3, 6);
insert into USED_IN (medicineid, surgeryid)
values (369, 191);
insert into USED_IN (medicineid, surgeryid)
values (20, 7);
insert into USED_IN (medicineid, surgeryid)
values (209, 292);
insert into USED_IN (medicineid, surgeryid)
values (490, 194);
insert into USED_IN (medicineid, surgeryid)
values (251, 113);
insert into USED_IN (medicineid, surgeryid)
values (387, 315);
insert into USED_IN (medicineid, surgeryid)
values (376, 170);
insert into USED_IN (medicineid, surgeryid)
values (337, 399);
insert into USED_IN (medicineid, surgeryid)
values (145, 64);
insert into USED_IN (medicineid, surgeryid)
values (260, 79);
insert into USED_IN (medicineid, surgeryid)
values (371, 176);
insert into USED_IN (medicineid, surgeryid)
values (58, 143);
insert into USED_IN (medicineid, surgeryid)
values (167, 73);
insert into USED_IN (medicineid, surgeryid)
values (245, 191);
insert into USED_IN (medicineid, surgeryid)
values (178, 341);
insert into USED_IN (medicineid, surgeryid)
values (471, 373);
insert into USED_IN (medicineid, surgeryid)
values (243, 255);
insert into USED_IN (medicineid, surgeryid)
values (120, 62);
insert into USED_IN (medicineid, surgeryid)
values (460, 231);
insert into USED_IN (medicineid, surgeryid)
values (139, 41);
insert into USED_IN (medicineid, surgeryid)
values (214, 39);
insert into USED_IN (medicineid, surgeryid)
values (53, 69);
insert into USED_IN (medicineid, surgeryid)
values (303, 341);
insert into USED_IN (medicineid, surgeryid)
values (92, 200);
insert into USED_IN (medicineid, surgeryid)
values (499, 329);
insert into USED_IN (medicineid, surgeryid)
values (82, 315);
insert into USED_IN (medicineid, surgeryid)
values (497, 19);
insert into USED_IN (medicineid, surgeryid)
values (337, 40);
insert into USED_IN (medicineid, surgeryid)
values (240, 189);
insert into USED_IN (medicineid, surgeryid)
values (398, 122);
insert into USED_IN (medicineid, surgeryid)
values (359, 308);
insert into USED_IN (medicineid, surgeryid)
values (148, 31);
insert into USED_IN (medicineid, surgeryid)
values (12, 49);
insert into USED_IN (medicineid, surgeryid)
values (389, 245);
insert into USED_IN (medicineid, surgeryid)
values (55, 123);
insert into USED_IN (medicineid, surgeryid)
values (132, 208);
insert into USED_IN (medicineid, surgeryid)
values (70, 242);
insert into USED_IN (medicineid, surgeryid)
values (481, 211);
insert into USED_IN (medicineid, surgeryid)
values (494, 140);
insert into USED_IN (medicineid, surgeryid)
values (81, 371);
insert into USED_IN (medicineid, surgeryid)
values (93, 58);
insert into USED_IN (medicineid, surgeryid)
values (260, 384);
insert into USED_IN (medicineid, surgeryid)
values (225, 23);
insert into USED_IN (medicineid, surgeryid)
values (105, 209);
insert into USED_IN (medicineid, surgeryid)
values (491, 132);
insert into USED_IN (medicineid, surgeryid)
values (352, 357);
insert into USED_IN (medicineid, surgeryid)
values (374, 166);
insert into USED_IN (medicineid, surgeryid)
values (40, 157);
insert into USED_IN (medicineid, surgeryid)
values (239, 149);
insert into USED_IN (medicineid, surgeryid)
values (117, 63);
insert into USED_IN (medicineid, surgeryid)
values (104, 368);
insert into USED_IN (medicineid, surgeryid)
values (151, 171);
insert into USED_IN (medicineid, surgeryid)
values (213, 281);
insert into USED_IN (medicineid, surgeryid)
values (107, 19);
insert into USED_IN (medicineid, surgeryid)
values (129, 225);
insert into USED_IN (medicineid, surgeryid)
values (100, 31);
insert into USED_IN (medicineid, surgeryid)
values (108, 343);
insert into USED_IN (medicineid, surgeryid)
values (302, 286);
insert into USED_IN (medicineid, surgeryid)
values (236, 54);
insert into USED_IN (medicineid, surgeryid)
values (203, 367);
insert into USED_IN (medicineid, surgeryid)
values (334, 277);
insert into USED_IN (medicineid, surgeryid)
values (132, 165);
insert into USED_IN (medicineid, surgeryid)
values (345, 337);
insert into USED_IN (medicineid, surgeryid)
values (477, 13);
insert into USED_IN (medicineid, surgeryid)
values (482, 362);
insert into USED_IN (medicineid, surgeryid)
values (290, 206);
insert into USED_IN (medicineid, surgeryid)
values (103, 96);
insert into USED_IN (medicineid, surgeryid)
values (448, 85);
insert into USED_IN (medicineid, surgeryid)
values (309, 346);
insert into USED_IN (medicineid, surgeryid)
values (305, 152);
insert into USED_IN (medicineid, surgeryid)
values (13, 183);
insert into USED_IN (medicineid, surgeryid)
values (259, 381);
insert into USED_IN (medicineid, surgeryid)
values (240, 306);
insert into USED_IN (medicineid, surgeryid)
values (415, 1);
insert into USED_IN (medicineid, surgeryid)
values (85, 306);
insert into USED_IN (medicineid, surgeryid)
values (44, 109);
insert into USED_IN (medicineid, surgeryid)
values (426, 30);
insert into USED_IN (medicineid, surgeryid)
values (215, 196);
insert into USED_IN (medicineid, surgeryid)
values (18, 175);
insert into USED_IN (medicineid, surgeryid)
values (107, 141);
insert into USED_IN (medicineid, surgeryid)
values (319, 127);
insert into USED_IN (medicineid, surgeryid)
values (86, 145);
insert into USED_IN (medicineid, surgeryid)
values (430, 368);
insert into USED_IN (medicineid, surgeryid)
values (346, 387);
insert into USED_IN (medicineid, surgeryid)
values (272, 59);
insert into USED_IN (medicineid, surgeryid)
values (397, 252);
insert into USED_IN (medicineid, surgeryid)
values (93, 134);
insert into USED_IN (medicineid, surgeryid)
values (489, 303);
insert into USED_IN (medicineid, surgeryid)
values (189, 303);
insert into USED_IN (medicineid, surgeryid)
values (4, 288);
insert into USED_IN (medicineid, surgeryid)
values (220, 108);
insert into USED_IN (medicineid, surgeryid)
values (110, 113);
insert into USED_IN (medicineid, surgeryid)
values (193, 229);
insert into USED_IN (medicineid, surgeryid)
values (23, 82);
insert into USED_IN (medicineid, surgeryid)
values (286, 364);
insert into USED_IN (medicineid, surgeryid)
values (396, 362);
insert into USED_IN (medicineid, surgeryid)
values (325, 114);
commit;
prompt 200 records committed...
insert into USED_IN (medicineid, surgeryid)
values (384, 130);
insert into USED_IN (medicineid, surgeryid)
values (348, 177);
insert into USED_IN (medicineid, surgeryid)
values (230, 195);
insert into USED_IN (medicineid, surgeryid)
values (279, 73);
insert into USED_IN (medicineid, surgeryid)
values (153, 139);
insert into USED_IN (medicineid, surgeryid)
values (439, 327);
insert into USED_IN (medicineid, surgeryid)
values (48, 362);
insert into USED_IN (medicineid, surgeryid)
values (165, 318);
insert into USED_IN (medicineid, surgeryid)
values (167, 292);
insert into USED_IN (medicineid, surgeryid)
values (469, 318);
insert into USED_IN (medicineid, surgeryid)
values (450, 137);
insert into USED_IN (medicineid, surgeryid)
values (314, 341);
insert into USED_IN (medicineid, surgeryid)
values (423, 35);
insert into USED_IN (medicineid, surgeryid)
values (156, 120);
insert into USED_IN (medicineid, surgeryid)
values (133, 180);
insert into USED_IN (medicineid, surgeryid)
values (91, 224);
insert into USED_IN (medicineid, surgeryid)
values (253, 395);
insert into USED_IN (medicineid, surgeryid)
values (494, 47);
insert into USED_IN (medicineid, surgeryid)
values (72, 109);
insert into USED_IN (medicineid, surgeryid)
values (263, 72);
insert into USED_IN (medicineid, surgeryid)
values (286, 218);
insert into USED_IN (medicineid, surgeryid)
values (264, 346);
insert into USED_IN (medicineid, surgeryid)
values (6, 400);
insert into USED_IN (medicineid, surgeryid)
values (385, 369);
insert into USED_IN (medicineid, surgeryid)
values (196, 335);
insert into USED_IN (medicineid, surgeryid)
values (40, 125);
insert into USED_IN (medicineid, surgeryid)
values (189, 222);
insert into USED_IN (medicineid, surgeryid)
values (223, 68);
insert into USED_IN (medicineid, surgeryid)
values (219, 49);
insert into USED_IN (medicineid, surgeryid)
values (283, 392);
insert into USED_IN (medicineid, surgeryid)
values (427, 382);
insert into USED_IN (medicineid, surgeryid)
values (209, 391);
insert into USED_IN (medicineid, surgeryid)
values (455, 354);
insert into USED_IN (medicineid, surgeryid)
values (403, 33);
insert into USED_IN (medicineid, surgeryid)
values (400, 208);
insert into USED_IN (medicineid, surgeryid)
values (414, 371);
insert into USED_IN (medicineid, surgeryid)
values (453, 273);
insert into USED_IN (medicineid, surgeryid)
values (403, 303);
insert into USED_IN (medicineid, surgeryid)
values (262, 345);
insert into USED_IN (medicineid, surgeryid)
values (71, 104);
insert into USED_IN (medicineid, surgeryid)
values (82, 322);
insert into USED_IN (medicineid, surgeryid)
values (26, 249);
insert into USED_IN (medicineid, surgeryid)
values (20, 289);
insert into USED_IN (medicineid, surgeryid)
values (122, 138);
insert into USED_IN (medicineid, surgeryid)
values (175, 299);
insert into USED_IN (medicineid, surgeryid)
values (446, 257);
insert into USED_IN (medicineid, surgeryid)
values (208, 234);
insert into USED_IN (medicineid, surgeryid)
values (289, 177);
insert into USED_IN (medicineid, surgeryid)
values (458, 203);
insert into USED_IN (medicineid, surgeryid)
values (477, 122);
insert into USED_IN (medicineid, surgeryid)
values (317, 55);
insert into USED_IN (medicineid, surgeryid)
values (184, 317);
insert into USED_IN (medicineid, surgeryid)
values (262, 270);
insert into USED_IN (medicineid, surgeryid)
values (335, 42);
insert into USED_IN (medicineid, surgeryid)
values (22, 203);
insert into USED_IN (medicineid, surgeryid)
values (458, 3);
insert into USED_IN (medicineid, surgeryid)
values (6, 139);
insert into USED_IN (medicineid, surgeryid)
values (405, 144);
insert into USED_IN (medicineid, surgeryid)
values (206, 139);
insert into USED_IN (medicineid, surgeryid)
values (457, 316);
insert into USED_IN (medicineid, surgeryid)
values (487, 342);
insert into USED_IN (medicineid, surgeryid)
values (62, 126);
insert into USED_IN (medicineid, surgeryid)
values (225, 284);
insert into USED_IN (medicineid, surgeryid)
values (435, 378);
insert into USED_IN (medicineid, surgeryid)
values (416, 118);
insert into USED_IN (medicineid, surgeryid)
values (11, 231);
insert into USED_IN (medicineid, surgeryid)
values (494, 293);
insert into USED_IN (medicineid, surgeryid)
values (281, 287);
insert into USED_IN (medicineid, surgeryid)
values (258, 356);
insert into USED_IN (medicineid, surgeryid)
values (163, 339);
insert into USED_IN (medicineid, surgeryid)
values (329, 63);
insert into USED_IN (medicineid, surgeryid)
values (287, 176);
insert into USED_IN (medicineid, surgeryid)
values (352, 54);
insert into USED_IN (medicineid, surgeryid)
values (29, 392);
insert into USED_IN (medicineid, surgeryid)
values (80, 258);
insert into USED_IN (medicineid, surgeryid)
values (444, 194);
insert into USED_IN (medicineid, surgeryid)
values (307, 315);
insert into USED_IN (medicineid, surgeryid)
values (178, 140);
insert into USED_IN (medicineid, surgeryid)
values (49, 360);
insert into USED_IN (medicineid, surgeryid)
values (271, 221);
insert into USED_IN (medicineid, surgeryid)
values (179, 258);
insert into USED_IN (medicineid, surgeryid)
values (181, 209);
insert into USED_IN (medicineid, surgeryid)
values (179, 246);
insert into USED_IN (medicineid, surgeryid)
values (165, 92);
insert into USED_IN (medicineid, surgeryid)
values (435, 59);
insert into USED_IN (medicineid, surgeryid)
values (128, 100);
insert into USED_IN (medicineid, surgeryid)
values (31, 95);
insert into USED_IN (medicineid, surgeryid)
values (303, 364);
insert into USED_IN (medicineid, surgeryid)
values (187, 315);
insert into USED_IN (medicineid, surgeryid)
values (148, 308);
insert into USED_IN (medicineid, surgeryid)
values (45, 210);
insert into USED_IN (medicineid, surgeryid)
values (48, 398);
insert into USED_IN (medicineid, surgeryid)
values (220, 137);
insert into USED_IN (medicineid, surgeryid)
values (475, 171);
insert into USED_IN (medicineid, surgeryid)
values (68, 373);
insert into USED_IN (medicineid, surgeryid)
values (421, 162);
insert into USED_IN (medicineid, surgeryid)
values (298, 361);
insert into USED_IN (medicineid, surgeryid)
values (42, 237);
insert into USED_IN (medicineid, surgeryid)
values (184, 321);
insert into USED_IN (medicineid, surgeryid)
values (62, 170);
commit;
prompt 300 records committed...
insert into USED_IN (medicineid, surgeryid)
values (238, 288);
insert into USED_IN (medicineid, surgeryid)
values (102, 364);
insert into USED_IN (medicineid, surgeryid)
values (311, 150);
insert into USED_IN (medicineid, surgeryid)
values (263, 343);
insert into USED_IN (medicineid, surgeryid)
values (289, 352);
insert into USED_IN (medicineid, surgeryid)
values (379, 338);
insert into USED_IN (medicineid, surgeryid)
values (77, 241);
insert into USED_IN (medicineid, surgeryid)
values (498, 182);
insert into USED_IN (medicineid, surgeryid)
values (273, 309);
insert into USED_IN (medicineid, surgeryid)
values (268, 223);
insert into USED_IN (medicineid, surgeryid)
values (493, 314);
insert into USED_IN (medicineid, surgeryid)
values (20, 290);
insert into USED_IN (medicineid, surgeryid)
values (11, 147);
insert into USED_IN (medicineid, surgeryid)
values (36, 26);
insert into USED_IN (medicineid, surgeryid)
values (394, 3);
insert into USED_IN (medicineid, surgeryid)
values (452, 395);
insert into USED_IN (medicineid, surgeryid)
values (46, 134);
insert into USED_IN (medicineid, surgeryid)
values (87, 300);
insert into USED_IN (medicineid, surgeryid)
values (156, 159);
insert into USED_IN (medicineid, surgeryid)
values (429, 314);
insert into USED_IN (medicineid, surgeryid)
values (117, 377);
insert into USED_IN (medicineid, surgeryid)
values (230, 59);
insert into USED_IN (medicineid, surgeryid)
values (217, 79);
insert into USED_IN (medicineid, surgeryid)
values (280, 235);
insert into USED_IN (medicineid, surgeryid)
values (439, 311);
insert into USED_IN (medicineid, surgeryid)
values (497, 30);
insert into USED_IN (medicineid, surgeryid)
values (357, 257);
insert into USED_IN (medicineid, surgeryid)
values (213, 326);
insert into USED_IN (medicineid, surgeryid)
values (263, 120);
insert into USED_IN (medicineid, surgeryid)
values (484, 19);
insert into USED_IN (medicineid, surgeryid)
values (263, 261);
insert into USED_IN (medicineid, surgeryid)
values (72, 69);
insert into USED_IN (medicineid, surgeryid)
values (195, 70);
insert into USED_IN (medicineid, surgeryid)
values (224, 8);
insert into USED_IN (medicineid, surgeryid)
values (388, 136);
insert into USED_IN (medicineid, surgeryid)
values (76, 115);
insert into USED_IN (medicineid, surgeryid)
values (336, 180);
insert into USED_IN (medicineid, surgeryid)
values (95, 180);
insert into USED_IN (medicineid, surgeryid)
values (84, 132);
insert into USED_IN (medicineid, surgeryid)
values (130, 275);
insert into USED_IN (medicineid, surgeryid)
values (153, 206);
insert into USED_IN (medicineid, surgeryid)
values (251, 260);
insert into USED_IN (medicineid, surgeryid)
values (5, 355);
insert into USED_IN (medicineid, surgeryid)
values (150, 22);
insert into USED_IN (medicineid, surgeryid)
values (178, 361);
insert into USED_IN (medicineid, surgeryid)
values (96, 189);
insert into USED_IN (medicineid, surgeryid)
values (313, 344);
insert into USED_IN (medicineid, surgeryid)
values (420, 325);
insert into USED_IN (medicineid, surgeryid)
values (458, 349);
insert into USED_IN (medicineid, surgeryid)
values (284, 121);
insert into USED_IN (medicineid, surgeryid)
values (140, 176);
insert into USED_IN (medicineid, surgeryid)
values (480, 13);
insert into USED_IN (medicineid, surgeryid)
values (300, 337);
insert into USED_IN (medicineid, surgeryid)
values (242, 139);
insert into USED_IN (medicineid, surgeryid)
values (361, 291);
insert into USED_IN (medicineid, surgeryid)
values (53, 252);
insert into USED_IN (medicineid, surgeryid)
values (287, 239);
insert into USED_IN (medicineid, surgeryid)
values (231, 109);
insert into USED_IN (medicineid, surgeryid)
values (116, 43);
insert into USED_IN (medicineid, surgeryid)
values (486, 358);
insert into USED_IN (medicineid, surgeryid)
values (456, 43);
insert into USED_IN (medicineid, surgeryid)
values (143, 183);
insert into USED_IN (medicineid, surgeryid)
values (250, 130);
insert into USED_IN (medicineid, surgeryid)
values (58, 205);
insert into USED_IN (medicineid, surgeryid)
values (166, 200);
insert into USED_IN (medicineid, surgeryid)
values (371, 55);
insert into USED_IN (medicineid, surgeryid)
values (431, 305);
insert into USED_IN (medicineid, surgeryid)
values (59, 201);
insert into USED_IN (medicineid, surgeryid)
values (325, 108);
insert into USED_IN (medicineid, surgeryid)
values (302, 326);
insert into USED_IN (medicineid, surgeryid)
values (306, 346);
insert into USED_IN (medicineid, surgeryid)
values (158, 34);
insert into USED_IN (medicineid, surgeryid)
values (291, 106);
insert into USED_IN (medicineid, surgeryid)
values (175, 39);
insert into USED_IN (medicineid, surgeryid)
values (391, 350);
insert into USED_IN (medicineid, surgeryid)
values (25, 286);
insert into USED_IN (medicineid, surgeryid)
values (39, 216);
insert into USED_IN (medicineid, surgeryid)
values (417, 390);
insert into USED_IN (medicineid, surgeryid)
values (69, 279);
insert into USED_IN (medicineid, surgeryid)
values (158, 253);
insert into USED_IN (medicineid, surgeryid)
values (410, 342);
insert into USED_IN (medicineid, surgeryid)
values (356, 30);
insert into USED_IN (medicineid, surgeryid)
values (221, 121);
insert into USED_IN (medicineid, surgeryid)
values (363, 310);
insert into USED_IN (medicineid, surgeryid)
values (385, 189);
insert into USED_IN (medicineid, surgeryid)
values (234, 290);
insert into USED_IN (medicineid, surgeryid)
values (402, 171);
insert into USED_IN (medicineid, surgeryid)
values (30, 198);
insert into USED_IN (medicineid, surgeryid)
values (402, 110);
insert into USED_IN (medicineid, surgeryid)
values (498, 340);
insert into USED_IN (medicineid, surgeryid)
values (34, 243);
insert into USED_IN (medicineid, surgeryid)
values (198, 43);
insert into USED_IN (medicineid, surgeryid)
values (198, 76);
insert into USED_IN (medicineid, surgeryid)
values (372, 258);
insert into USED_IN (medicineid, surgeryid)
values (151, 202);
insert into USED_IN (medicineid, surgeryid)
values (373, 92);
insert into USED_IN (medicineid, surgeryid)
values (182, 370);
insert into USED_IN (medicineid, surgeryid)
values (190, 39);
insert into USED_IN (medicineid, surgeryid)
values (155, 221);
insert into USED_IN (medicineid, surgeryid)
values (150, 380);
commit;
prompt 400 records committed...
insert into USED_IN (medicineid, surgeryid)
values (344, 16);
insert into USED_IN (medicineid, surgeryid)
values (52, 118);
insert into USED_IN (medicineid, surgeryid)
values (118, 369);
insert into USED_IN (medicineid, surgeryid)
values (117, 319);
insert into USED_IN (medicineid, surgeryid)
values (177, 114);
insert into USED_IN (medicineid, surgeryid)
values (216, 225);
insert into USED_IN (medicineid, surgeryid)
values (102, 312);
insert into USED_IN (medicineid, surgeryid)
values (25, 213);
insert into USED_IN (medicineid, surgeryid)
values (171, 122);
insert into USED_IN (medicineid, surgeryid)
values (312, 161);
insert into USED_IN (medicineid, surgeryid)
values (22, 356);
insert into USED_IN (medicineid, surgeryid)
values (259, 299);
insert into USED_IN (medicineid, surgeryid)
values (288, 243);
insert into USED_IN (medicineid, surgeryid)
values (296, 102);
insert into USED_IN (medicineid, surgeryid)
values (42, 199);
insert into USED_IN (medicineid, surgeryid)
values (59, 109);
insert into USED_IN (medicineid, surgeryid)
values (500, 352);
insert into USED_IN (medicineid, surgeryid)
values (222, 23);
insert into USED_IN (medicineid, surgeryid)
values (481, 215);
insert into USED_IN (medicineid, surgeryid)
values (68, 164);
insert into USED_IN (medicineid, surgeryid)
values (361, 240);
insert into USED_IN (medicineid, surgeryid)
values (285, 254);
insert into USED_IN (medicineid, surgeryid)
values (280, 66);
insert into USED_IN (medicineid, surgeryid)
values (117, 385);
insert into USED_IN (medicineid, surgeryid)
values (78, 384);
insert into USED_IN (medicineid, surgeryid)
values (115, 355);
insert into USED_IN (medicineid, surgeryid)
values (468, 233);
insert into USED_IN (medicineid, surgeryid)
values (317, 33);
insert into USED_IN (medicineid, surgeryid)
values (157, 47);
insert into USED_IN (medicineid, surgeryid)
values (407, 320);
insert into USED_IN (medicineid, surgeryid)
values (201, 76);
insert into USED_IN (medicineid, surgeryid)
values (423, 379);
insert into USED_IN (medicineid, surgeryid)
values (46, 293);
insert into USED_IN (medicineid, surgeryid)
values (286, 103);
insert into USED_IN (medicineid, surgeryid)
values (287, 15);
insert into USED_IN (medicineid, surgeryid)
values (486, 86);
insert into USED_IN (medicineid, surgeryid)
values (326, 340);
insert into USED_IN (medicineid, surgeryid)
values (470, 269);
insert into USED_IN (medicineid, surgeryid)
values (267, 242);
insert into USED_IN (medicineid, surgeryid)
values (278, 129);
insert into USED_IN (medicineid, surgeryid)
values (421, 25);
insert into USED_IN (medicineid, surgeryid)
values (225, 177);
insert into USED_IN (medicineid, surgeryid)
values (30, 354);
insert into USED_IN (medicineid, surgeryid)
values (495, 237);
insert into USED_IN (medicineid, surgeryid)
values (361, 2);
insert into USED_IN (medicineid, surgeryid)
values (82, 75);
insert into USED_IN (medicineid, surgeryid)
values (458, 307);
insert into USED_IN (medicineid, surgeryid)
values (270, 49);
insert into USED_IN (medicineid, surgeryid)
values (48, 68);
insert into USED_IN (medicineid, surgeryid)
values (342, 334);
insert into USED_IN (medicineid, surgeryid)
values (74, 307);
insert into USED_IN (medicineid, surgeryid)
values (416, 214);
insert into USED_IN (medicineid, surgeryid)
values (82, 1);
insert into USED_IN (medicineid, surgeryid)
values (371, 193);
insert into USED_IN (medicineid, surgeryid)
values (268, 12);
insert into USED_IN (medicineid, surgeryid)
values (4, 198);
insert into USED_IN (medicineid, surgeryid)
values (86, 135);
insert into USED_IN (medicineid, surgeryid)
values (164, 45);
insert into USED_IN (medicineid, surgeryid)
values (12, 271);
insert into USED_IN (medicineid, surgeryid)
values (189, 30);
insert into USED_IN (medicineid, surgeryid)
values (97, 60);
insert into USED_IN (medicineid, surgeryid)
values (201, 31);
insert into USED_IN (medicineid, surgeryid)
values (147, 178);
insert into USED_IN (medicineid, surgeryid)
values (321, 362);
insert into USED_IN (medicineid, surgeryid)
values (460, 234);
insert into USED_IN (medicineid, surgeryid)
values (73, 175);
insert into USED_IN (medicineid, surgeryid)
values (152, 259);
insert into USED_IN (medicineid, surgeryid)
values (350, 61);
insert into USED_IN (medicineid, surgeryid)
values (273, 137);
insert into USED_IN (medicineid, surgeryid)
values (399, 30);
insert into USED_IN (medicineid, surgeryid)
values (493, 177);
insert into USED_IN (medicineid, surgeryid)
values (498, 124);
insert into USED_IN (medicineid, surgeryid)
values (342, 141);
insert into USED_IN (medicineid, surgeryid)
values (15, 257);
insert into USED_IN (medicineid, surgeryid)
values (469, 170);
insert into USED_IN (medicineid, surgeryid)
values (236, 318);
insert into USED_IN (medicineid, surgeryid)
values (198, 300);
insert into USED_IN (medicineid, surgeryid)
values (462, 132);
insert into USED_IN (medicineid, surgeryid)
values (109, 206);
insert into USED_IN (medicineid, surgeryid)
values (494, 142);
insert into USED_IN (medicineid, surgeryid)
values (115, 80);
insert into USED_IN (medicineid, surgeryid)
values (224, 167);
insert into USED_IN (medicineid, surgeryid)
values (83, 70);
insert into USED_IN (medicineid, surgeryid)
values (218, 122);
insert into USED_IN (medicineid, surgeryid)
values (168, 198);
insert into USED_IN (medicineid, surgeryid)
values (288, 264);
insert into USED_IN (medicineid, surgeryid)
values (168, 368);
insert into USED_IN (medicineid, surgeryid)
values (149, 222);
insert into USED_IN (medicineid, surgeryid)
values (340, 196);
insert into USED_IN (medicineid, surgeryid)
values (439, 196);
insert into USED_IN (medicineid, surgeryid)
values (219, 65);
insert into USED_IN (medicineid, surgeryid)
values (417, 184);
insert into USED_IN (medicineid, surgeryid)
values (133, 138);
insert into USED_IN (medicineid, surgeryid)
values (384, 5);
insert into USED_IN (medicineid, surgeryid)
values (193, 140);
insert into USED_IN (medicineid, surgeryid)
values (408, 194);
insert into USED_IN (medicineid, surgeryid)
values (229, 28);
insert into USED_IN (medicineid, surgeryid)
values (117, 330);
insert into USED_IN (medicineid, surgeryid)
values (186, 173);
insert into USED_IN (medicineid, surgeryid)
values (410, 272);
commit;
prompt 500 records committed...
insert into USED_IN (medicineid, surgeryid)
values (179, 161);
insert into USED_IN (medicineid, surgeryid)
values (92, 263);
insert into USED_IN (medicineid, surgeryid)
values (17, 251);
insert into USED_IN (medicineid, surgeryid)
values (41, 386);
insert into USED_IN (medicineid, surgeryid)
values (115, 387);
insert into USED_IN (medicineid, surgeryid)
values (161, 322);
insert into USED_IN (medicineid, surgeryid)
values (337, 203);
insert into USED_IN (medicineid, surgeryid)
values (463, 93);
insert into USED_IN (medicineid, surgeryid)
values (497, 316);
insert into USED_IN (medicineid, surgeryid)
values (305, 155);
insert into USED_IN (medicineid, surgeryid)
values (260, 157);
insert into USED_IN (medicineid, surgeryid)
values (367, 103);
insert into USED_IN (medicineid, surgeryid)
values (408, 30);
insert into USED_IN (medicineid, surgeryid)
values (135, 168);
insert into USED_IN (medicineid, surgeryid)
values (40, 28);
insert into USED_IN (medicineid, surgeryid)
values (248, 166);
insert into USED_IN (medicineid, surgeryid)
values (347, 136);
insert into USED_IN (medicineid, surgeryid)
values (185, 275);
insert into USED_IN (medicineid, surgeryid)
values (282, 319);
insert into USED_IN (medicineid, surgeryid)
values (458, 94);
insert into USED_IN (medicineid, surgeryid)
values (81, 333);
insert into USED_IN (medicineid, surgeryid)
values (480, 179);
insert into USED_IN (medicineid, surgeryid)
values (153, 261);
insert into USED_IN (medicineid, surgeryid)
values (48, 295);
insert into USED_IN (medicineid, surgeryid)
values (23, 110);
insert into USED_IN (medicineid, surgeryid)
values (386, 372);
insert into USED_IN (medicineid, surgeryid)
values (169, 70);
insert into USED_IN (medicineid, surgeryid)
values (376, 237);
insert into USED_IN (medicineid, surgeryid)
values (130, 369);
insert into USED_IN (medicineid, surgeryid)
values (239, 263);
insert into USED_IN (medicineid, surgeryid)
values (481, 130);
insert into USED_IN (medicineid, surgeryid)
values (500, 43);
insert into USED_IN (medicineid, surgeryid)
values (340, 364);
insert into USED_IN (medicineid, surgeryid)
values (265, 228);
insert into USED_IN (medicineid, surgeryid)
values (199, 299);
insert into USED_IN (medicineid, surgeryid)
values (376, 4);
insert into USED_IN (medicineid, surgeryid)
values (41, 381);
insert into USED_IN (medicineid, surgeryid)
values (267, 392);
insert into USED_IN (medicineid, surgeryid)
values (259, 150);
insert into USED_IN (medicineid, surgeryid)
values (294, 15);
insert into USED_IN (medicineid, surgeryid)
values (76, 128);
insert into USED_IN (medicineid, surgeryid)
values (106, 126);
insert into USED_IN (medicineid, surgeryid)
values (300, 121);
insert into USED_IN (medicineid, surgeryid)
values (135, 144);
insert into USED_IN (medicineid, surgeryid)
values (265, 59);
insert into USED_IN (medicineid, surgeryid)
values (456, 281);
insert into USED_IN (medicineid, surgeryid)
values (103, 3);
insert into USED_IN (medicineid, surgeryid)
values (392, 322);
insert into USED_IN (medicineid, surgeryid)
values (465, 18);
insert into USED_IN (medicineid, surgeryid)
values (342, 133);
insert into USED_IN (medicineid, surgeryid)
values (24, 350);
insert into USED_IN (medicineid, surgeryid)
values (466, 355);
insert into USED_IN (medicineid, surgeryid)
values (176, 12);
insert into USED_IN (medicineid, surgeryid)
values (456, 265);
insert into USED_IN (medicineid, surgeryid)
values (497, 9);
insert into USED_IN (medicineid, surgeryid)
values (262, 264);
insert into USED_IN (medicineid, surgeryid)
values (152, 307);
insert into USED_IN (medicineid, surgeryid)
values (267, 167);
insert into USED_IN (medicineid, surgeryid)
values (27, 181);
insert into USED_IN (medicineid, surgeryid)
values (39, 155);
insert into USED_IN (medicineid, surgeryid)
values (58, 47);
insert into USED_IN (medicineid, surgeryid)
values (388, 168);
insert into USED_IN (medicineid, surgeryid)
values (256, 203);
insert into USED_IN (medicineid, surgeryid)
values (80, 2);
insert into USED_IN (medicineid, surgeryid)
values (163, 2);
insert into USED_IN (medicineid, surgeryid)
values (256, 81);
insert into USED_IN (medicineid, surgeryid)
values (19, 259);
insert into USED_IN (medicineid, surgeryid)
values (99, 166);
insert into USED_IN (medicineid, surgeryid)
values (53, 238);
insert into USED_IN (medicineid, surgeryid)
values (61, 185);
insert into USED_IN (medicineid, surgeryid)
values (479, 210);
insert into USED_IN (medicineid, surgeryid)
values (462, 233);
insert into USED_IN (medicineid, surgeryid)
values (381, 316);
insert into USED_IN (medicineid, surgeryid)
values (485, 128);
insert into USED_IN (medicineid, surgeryid)
values (247, 156);
insert into USED_IN (medicineid, surgeryid)
values (180, 181);
insert into USED_IN (medicineid, surgeryid)
values (144, 9);
insert into USED_IN (medicineid, surgeryid)
values (200, 152);
insert into USED_IN (medicineid, surgeryid)
values (48, 318);
insert into USED_IN (medicineid, surgeryid)
values (174, 266);
insert into USED_IN (medicineid, surgeryid)
values (2, 150);
insert into USED_IN (medicineid, surgeryid)
values (158, 245);
insert into USED_IN (medicineid, surgeryid)
values (449, 247);
insert into USED_IN (medicineid, surgeryid)
values (335, 41);
insert into USED_IN (medicineid, surgeryid)
values (119, 2);
insert into USED_IN (medicineid, surgeryid)
values (159, 22);
insert into USED_IN (medicineid, surgeryid)
values (67, 156);
insert into USED_IN (medicineid, surgeryid)
values (354, 94);
insert into USED_IN (medicineid, surgeryid)
values (22, 357);
insert into USED_IN (medicineid, surgeryid)
values (207, 122);
insert into USED_IN (medicineid, surgeryid)
values (348, 382);
insert into USED_IN (medicineid, surgeryid)
values (342, 113);
insert into USED_IN (medicineid, surgeryid)
values (36, 355);
insert into USED_IN (medicineid, surgeryid)
values (137, 341);
insert into USED_IN (medicineid, surgeryid)
values (351, 166);
insert into USED_IN (medicineid, surgeryid)
values (226, 75);
insert into USED_IN (medicineid, surgeryid)
values (190, 28);
insert into USED_IN (medicineid, surgeryid)
values (27, 80);
insert into USED_IN (medicineid, surgeryid)
values (90, 165);
insert into USED_IN (medicineid, surgeryid)
values (432, 161);
commit;
prompt 600 records committed...
insert into USED_IN (medicineid, surgeryid)
values (202, 176);
insert into USED_IN (medicineid, surgeryid)
values (402, 323);
insert into USED_IN (medicineid, surgeryid)
values (381, 281);
insert into USED_IN (medicineid, surgeryid)
values (334, 200);
insert into USED_IN (medicineid, surgeryid)
values (478, 360);
insert into USED_IN (medicineid, surgeryid)
values (191, 343);
insert into USED_IN (medicineid, surgeryid)
values (237, 25);
insert into USED_IN (medicineid, surgeryid)
values (4, 225);
insert into USED_IN (medicineid, surgeryid)
values (133, 222);
insert into USED_IN (medicineid, surgeryid)
values (4, 325);
insert into USED_IN (medicineid, surgeryid)
values (286, 197);
insert into USED_IN (medicineid, surgeryid)
values (238, 173);
insert into USED_IN (medicineid, surgeryid)
values (61, 134);
insert into USED_IN (medicineid, surgeryid)
values (161, 319);
insert into USED_IN (medicineid, surgeryid)
values (222, 295);
insert into USED_IN (medicineid, surgeryid)
values (347, 292);
insert into USED_IN (medicineid, surgeryid)
values (21, 368);
insert into USED_IN (medicineid, surgeryid)
values (6, 321);
insert into USED_IN (medicineid, surgeryid)
values (299, 50);
insert into USED_IN (medicineid, surgeryid)
values (252, 285);
insert into USED_IN (medicineid, surgeryid)
values (273, 389);
insert into USED_IN (medicineid, surgeryid)
values (17, 268);
insert into USED_IN (medicineid, surgeryid)
values (327, 284);
insert into USED_IN (medicineid, surgeryid)
values (348, 373);
insert into USED_IN (medicineid, surgeryid)
values (213, 284);
insert into USED_IN (medicineid, surgeryid)
values (186, 376);
insert into USED_IN (medicineid, surgeryid)
values (236, 292);
insert into USED_IN (medicineid, surgeryid)
values (150, 287);
insert into USED_IN (medicineid, surgeryid)
values (84, 297);
insert into USED_IN (medicineid, surgeryid)
values (174, 181);
insert into USED_IN (medicineid, surgeryid)
values (141, 152);
insert into USED_IN (medicineid, surgeryid)
values (223, 179);
insert into USED_IN (medicineid, surgeryid)
values (171, 112);
insert into USED_IN (medicineid, surgeryid)
values (268, 325);
insert into USED_IN (medicineid, surgeryid)
values (457, 361);
insert into USED_IN (medicineid, surgeryid)
values (396, 266);
insert into USED_IN (medicineid, surgeryid)
values (66, 239);
insert into USED_IN (medicineid, surgeryid)
values (92, 254);
insert into USED_IN (medicineid, surgeryid)
values (37, 388);
insert into USED_IN (medicineid, surgeryid)
values (239, 392);
insert into USED_IN (medicineid, surgeryid)
values (442, 340);
insert into USED_IN (medicineid, surgeryid)
values (131, 246);
insert into USED_IN (medicineid, surgeryid)
values (344, 162);
insert into USED_IN (medicineid, surgeryid)
values (353, 321);
insert into USED_IN (medicineid, surgeryid)
values (364, 77);
insert into USED_IN (medicineid, surgeryid)
values (3, 163);
insert into USED_IN (medicineid, surgeryid)
values (142, 81);
insert into USED_IN (medicineid, surgeryid)
values (412, 347);
insert into USED_IN (medicineid, surgeryid)
values (130, 77);
insert into USED_IN (medicineid, surgeryid)
values (41, 131);
insert into USED_IN (medicineid, surgeryid)
values (254, 340);
insert into USED_IN (medicineid, surgeryid)
values (3, 238);
insert into USED_IN (medicineid, surgeryid)
values (154, 234);
insert into USED_IN (medicineid, surgeryid)
values (133, 339);
insert into USED_IN (medicineid, surgeryid)
values (298, 398);
insert into USED_IN (medicineid, surgeryid)
values (248, 100);
insert into USED_IN (medicineid, surgeryid)
values (364, 126);
insert into USED_IN (medicineid, surgeryid)
values (360, 368);
insert into USED_IN (medicineid, surgeryid)
values (3, 153);
insert into USED_IN (medicineid, surgeryid)
values (178, 364);
insert into USED_IN (medicineid, surgeryid)
values (133, 364);
insert into USED_IN (medicineid, surgeryid)
values (407, 44);
insert into USED_IN (medicineid, surgeryid)
values (34, 57);
insert into USED_IN (medicineid, surgeryid)
values (446, 106);
insert into USED_IN (medicineid, surgeryid)
values (262, 62);
insert into USED_IN (medicineid, surgeryid)
values (263, 212);
insert into USED_IN (medicineid, surgeryid)
values (336, 148);
insert into USED_IN (medicineid, surgeryid)
values (261, 82);
insert into USED_IN (medicineid, surgeryid)
values (463, 31);
insert into USED_IN (medicineid, surgeryid)
values (183, 243);
insert into USED_IN (medicineid, surgeryid)
values (40, 5);
insert into USED_IN (medicineid, surgeryid)
values (133, 95);
insert into USED_IN (medicineid, surgeryid)
values (406, 105);
insert into USED_IN (medicineid, surgeryid)
values (462, 259);
insert into USED_IN (medicineid, surgeryid)
values (378, 37);
insert into USED_IN (medicineid, surgeryid)
values (410, 285);
insert into USED_IN (medicineid, surgeryid)
values (263, 181);
insert into USED_IN (medicineid, surgeryid)
values (461, 84);
insert into USED_IN (medicineid, surgeryid)
values (130, 89);
insert into USED_IN (medicineid, surgeryid)
values (65, 344);
insert into USED_IN (medicineid, surgeryid)
values (309, 196);
insert into USED_IN (medicineid, surgeryid)
values (430, 123);
insert into USED_IN (medicineid, surgeryid)
values (118, 173);
insert into USED_IN (medicineid, surgeryid)
values (290, 255);
insert into USED_IN (medicineid, surgeryid)
values (53, 219);
insert into USED_IN (medicineid, surgeryid)
values (107, 167);
insert into USED_IN (medicineid, surgeryid)
values (210, 133);
insert into USED_IN (medicineid, surgeryid)
values (357, 157);
insert into USED_IN (medicineid, surgeryid)
values (382, 273);
insert into USED_IN (medicineid, surgeryid)
values (104, 113);
insert into USED_IN (medicineid, surgeryid)
values (376, 222);
insert into USED_IN (medicineid, surgeryid)
values (272, 134);
insert into USED_IN (medicineid, surgeryid)
values (251, 282);
insert into USED_IN (medicineid, surgeryid)
values (66, 224);
insert into USED_IN (medicineid, surgeryid)
values (254, 215);
insert into USED_IN (medicineid, surgeryid)
values (196, 333);
insert into USED_IN (medicineid, surgeryid)
values (402, 143);
insert into USED_IN (medicineid, surgeryid)
values (117, 102);
insert into USED_IN (medicineid, surgeryid)
values (267, 239);
insert into USED_IN (medicineid, surgeryid)
values (164, 200);
commit;
prompt 700 records committed...
insert into USED_IN (medicineid, surgeryid)
values (115, 317);
insert into USED_IN (medicineid, surgeryid)
values (86, 392);
insert into USED_IN (medicineid, surgeryid)
values (260, 137);
insert into USED_IN (medicineid, surgeryid)
values (68, 47);
insert into USED_IN (medicineid, surgeryid)
values (484, 158);
insert into USED_IN (medicineid, surgeryid)
values (12, 9);
insert into USED_IN (medicineid, surgeryid)
values (170, 145);
insert into USED_IN (medicineid, surgeryid)
values (432, 142);
insert into USED_IN (medicineid, surgeryid)
values (231, 352);
insert into USED_IN (medicineid, surgeryid)
values (437, 88);
insert into USED_IN (medicineid, surgeryid)
values (230, 105);
insert into USED_IN (medicineid, surgeryid)
values (466, 123);
insert into USED_IN (medicineid, surgeryid)
values (51, 293);
insert into USED_IN (medicineid, surgeryid)
values (465, 267);
insert into USED_IN (medicineid, surgeryid)
values (204, 398);
insert into USED_IN (medicineid, surgeryid)
values (405, 337);
insert into USED_IN (medicineid, surgeryid)
values (474, 375);
insert into USED_IN (medicineid, surgeryid)
values (125, 83);
insert into USED_IN (medicineid, surgeryid)
values (144, 201);
insert into USED_IN (medicineid, surgeryid)
values (118, 307);
insert into USED_IN (medicineid, surgeryid)
values (293, 17);
insert into USED_IN (medicineid, surgeryid)
values (493, 305);
insert into USED_IN (medicineid, surgeryid)
values (190, 273);
insert into USED_IN (medicineid, surgeryid)
values (7, 322);
insert into USED_IN (medicineid, surgeryid)
values (474, 207);
insert into USED_IN (medicineid, surgeryid)
values (115, 180);
insert into USED_IN (medicineid, surgeryid)
values (406, 261);
insert into USED_IN (medicineid, surgeryid)
values (195, 147);
insert into USED_IN (medicineid, surgeryid)
values (148, 171);
insert into USED_IN (medicineid, surgeryid)
values (187, 217);
insert into USED_IN (medicineid, surgeryid)
values (120, 134);
insert into USED_IN (medicineid, surgeryid)
values (473, 70);
insert into USED_IN (medicineid, surgeryid)
values (91, 175);
insert into USED_IN (medicineid, surgeryid)
values (46, 85);
insert into USED_IN (medicineid, surgeryid)
values (333, 144);
insert into USED_IN (medicineid, surgeryid)
values (46, 262);
insert into USED_IN (medicineid, surgeryid)
values (266, 41);
insert into USED_IN (medicineid, surgeryid)
values (419, 41);
insert into USED_IN (medicineid, surgeryid)
values (126, 108);
insert into USED_IN (medicineid, surgeryid)
values (61, 67);
insert into USED_IN (medicineid, surgeryid)
values (378, 193);
insert into USED_IN (medicineid, surgeryid)
values (457, 284);
insert into USED_IN (medicineid, surgeryid)
values (119, 15);
insert into USED_IN (medicineid, surgeryid)
values (401, 20);
insert into USED_IN (medicineid, surgeryid)
values (470, 33);
insert into USED_IN (medicineid, surgeryid)
values (65, 232);
insert into USED_IN (medicineid, surgeryid)
values (452, 362);
insert into USED_IN (medicineid, surgeryid)
values (279, 184);
insert into USED_IN (medicineid, surgeryid)
values (53, 31);
insert into USED_IN (medicineid, surgeryid)
values (494, 122);
insert into USED_IN (medicineid, surgeryid)
values (301, 213);
insert into USED_IN (medicineid, surgeryid)
values (96, 15);
insert into USED_IN (medicineid, surgeryid)
values (246, 350);
insert into USED_IN (medicineid, surgeryid)
values (228, 139);
insert into USED_IN (medicineid, surgeryid)
values (420, 179);
insert into USED_IN (medicineid, surgeryid)
values (97, 154);
insert into USED_IN (medicineid, surgeryid)
values (470, 391);
insert into USED_IN (medicineid, surgeryid)
values (143, 268);
insert into USED_IN (medicineid, surgeryid)
values (225, 331);
insert into USED_IN (medicineid, surgeryid)
values (293, 138);
insert into USED_IN (medicineid, surgeryid)
values (178, 64);
insert into USED_IN (medicineid, surgeryid)
values (452, 75);
insert into USED_IN (medicineid, surgeryid)
values (400, 230);
insert into USED_IN (medicineid, surgeryid)
values (172, 45);
insert into USED_IN (medicineid, surgeryid)
values (85, 386);
insert into USED_IN (medicineid, surgeryid)
values (435, 2);
insert into USED_IN (medicineid, surgeryid)
values (27, 287);
insert into USED_IN (medicineid, surgeryid)
values (196, 54);
insert into USED_IN (medicineid, surgeryid)
values (456, 196);
insert into USED_IN (medicineid, surgeryid)
values (439, 200);
insert into USED_IN (medicineid, surgeryid)
values (277, 49);
insert into USED_IN (medicineid, surgeryid)
values (66, 337);
insert into USED_IN (medicineid, surgeryid)
values (421, 209);
insert into USED_IN (medicineid, surgeryid)
values (173, 80);
insert into USED_IN (medicineid, surgeryid)
values (89, 204);
insert into USED_IN (medicineid, surgeryid)
values (278, 76);
insert into USED_IN (medicineid, surgeryid)
values (313, 384);
insert into USED_IN (medicineid, surgeryid)
values (273, 189);
insert into USED_IN (medicineid, surgeryid)
values (420, 314);
insert into USED_IN (medicineid, surgeryid)
values (457, 399);
insert into USED_IN (medicineid, surgeryid)
values (43, 215);
insert into USED_IN (medicineid, surgeryid)
values (150, 14);
insert into USED_IN (medicineid, surgeryid)
values (6, 278);
insert into USED_IN (medicineid, surgeryid)
values (481, 44);
insert into USED_IN (medicineid, surgeryid)
values (8, 363);
insert into USED_IN (medicineid, surgeryid)
values (132, 109);
insert into USED_IN (medicineid, surgeryid)
values (155, 312);
insert into USED_IN (medicineid, surgeryid)
values (368, 156);
insert into USED_IN (medicineid, surgeryid)
values (24, 390);
insert into USED_IN (medicineid, surgeryid)
values (367, 147);
insert into USED_IN (medicineid, surgeryid)
values (74, 260);
insert into USED_IN (medicineid, surgeryid)
values (457, 194);
insert into USED_IN (medicineid, surgeryid)
values (299, 239);
insert into USED_IN (medicineid, surgeryid)
values (16, 97);
insert into USED_IN (medicineid, surgeryid)
values (227, 224);
insert into USED_IN (medicineid, surgeryid)
values (377, 174);
insert into USED_IN (medicineid, surgeryid)
values (418, 227);
insert into USED_IN (medicineid, surgeryid)
values (248, 127);
insert into USED_IN (medicineid, surgeryid)
values (235, 127);
insert into USED_IN (medicineid, surgeryid)
values (138, 388);
commit;
prompt 800 records committed...
insert into USED_IN (medicineid, surgeryid)
values (25, 49);
insert into USED_IN (medicineid, surgeryid)
values (105, 251);
insert into USED_IN (medicineid, surgeryid)
values (310, 372);
insert into USED_IN (medicineid, surgeryid)
values (25, 236);
insert into USED_IN (medicineid, surgeryid)
values (375, 71);
insert into USED_IN (medicineid, surgeryid)
values (267, 86);
insert into USED_IN (medicineid, surgeryid)
values (148, 123);
insert into USED_IN (medicineid, surgeryid)
values (184, 197);
insert into USED_IN (medicineid, surgeryid)
values (369, 392);
insert into USED_IN (medicineid, surgeryid)
values (20, 142);
insert into USED_IN (medicineid, surgeryid)
values (178, 185);
insert into USED_IN (medicineid, surgeryid)
values (442, 91);
insert into USED_IN (medicineid, surgeryid)
values (337, 79);
insert into USED_IN (medicineid, surgeryid)
values (53, 391);
insert into USED_IN (medicineid, surgeryid)
values (476, 330);
insert into USED_IN (medicineid, surgeryid)
values (79, 295);
insert into USED_IN (medicineid, surgeryid)
values (473, 104);
insert into USED_IN (medicineid, surgeryid)
values (109, 89);
insert into USED_IN (medicineid, surgeryid)
values (83, 221);
insert into USED_IN (medicineid, surgeryid)
values (372, 191);
insert into USED_IN (medicineid, surgeryid)
values (174, 255);
insert into USED_IN (medicineid, surgeryid)
values (180, 100);
insert into USED_IN (medicineid, surgeryid)
values (474, 90);
insert into USED_IN (medicineid, surgeryid)
values (284, 146);
insert into USED_IN (medicineid, surgeryid)
values (388, 166);
insert into USED_IN (medicineid, surgeryid)
values (466, 332);
insert into USED_IN (medicineid, surgeryid)
values (62, 327);
insert into USED_IN (medicineid, surgeryid)
values (445, 213);
insert into USED_IN (medicineid, surgeryid)
values (8, 80);
insert into USED_IN (medicineid, surgeryid)
values (110, 302);
insert into USED_IN (medicineid, surgeryid)
values (218, 7);
insert into USED_IN (medicineid, surgeryid)
values (411, 357);
insert into USED_IN (medicineid, surgeryid)
values (301, 126);
insert into USED_IN (medicineid, surgeryid)
values (221, 25);
insert into USED_IN (medicineid, surgeryid)
values (349, 333);
insert into USED_IN (medicineid, surgeryid)
values (192, 211);
insert into USED_IN (medicineid, surgeryid)
values (339, 135);
insert into USED_IN (medicineid, surgeryid)
values (188, 34);
insert into USED_IN (medicineid, surgeryid)
values (468, 207);
insert into USED_IN (medicineid, surgeryid)
values (83, 351);
insert into USED_IN (medicineid, surgeryid)
values (7, 369);
insert into USED_IN (medicineid, surgeryid)
values (252, 110);
insert into USED_IN (medicineid, surgeryid)
values (342, 328);
insert into USED_IN (medicineid, surgeryid)
values (257, 297);
insert into USED_IN (medicineid, surgeryid)
values (3, 381);
insert into USED_IN (medicineid, surgeryid)
values (373, 357);
insert into USED_IN (medicineid, surgeryid)
values (130, 212);
insert into USED_IN (medicineid, surgeryid)
values (145, 45);
insert into USED_IN (medicineid, surgeryid)
values (389, 397);
insert into USED_IN (medicineid, surgeryid)
values (390, 186);
insert into USED_IN (medicineid, surgeryid)
values (75, 135);
insert into USED_IN (medicineid, surgeryid)
values (110, 312);
insert into USED_IN (medicineid, surgeryid)
values (159, 27);
insert into USED_IN (medicineid, surgeryid)
values (439, 32);
insert into USED_IN (medicineid, surgeryid)
values (225, 12);
insert into USED_IN (medicineid, surgeryid)
values (379, 322);
insert into USED_IN (medicineid, surgeryid)
values (366, 298);
insert into USED_IN (medicineid, surgeryid)
values (164, 193);
insert into USED_IN (medicineid, surgeryid)
values (181, 384);
insert into USED_IN (medicineid, surgeryid)
values (279, 302);
insert into USED_IN (medicineid, surgeryid)
values (242, 211);
insert into USED_IN (medicineid, surgeryid)
values (211, 393);
insert into USED_IN (medicineid, surgeryid)
values (371, 346);
insert into USED_IN (medicineid, surgeryid)
values (230, 311);
insert into USED_IN (medicineid, surgeryid)
values (380, 228);
insert into USED_IN (medicineid, surgeryid)
values (499, 78);
insert into USED_IN (medicineid, surgeryid)
values (367, 389);
insert into USED_IN (medicineid, surgeryid)
values (57, 193);
insert into USED_IN (medicineid, surgeryid)
values (435, 274);
insert into USED_IN (medicineid, surgeryid)
values (276, 223);
insert into USED_IN (medicineid, surgeryid)
values (227, 172);
insert into USED_IN (medicineid, surgeryid)
values (27, 254);
insert into USED_IN (medicineid, surgeryid)
values (356, 280);
insert into USED_IN (medicineid, surgeryid)
values (445, 277);
insert into USED_IN (medicineid, surgeryid)
values (375, 20);
insert into USED_IN (medicineid, surgeryid)
values (230, 266);
insert into USED_IN (medicineid, surgeryid)
values (147, 32);
insert into USED_IN (medicineid, surgeryid)
values (194, 227);
insert into USED_IN (medicineid, surgeryid)
values (488, 144);
insert into USED_IN (medicineid, surgeryid)
values (192, 389);
insert into USED_IN (medicineid, surgeryid)
values (171, 362);
insert into USED_IN (medicineid, surgeryid)
values (388, 187);
insert into USED_IN (medicineid, surgeryid)
values (457, 384);
insert into USED_IN (medicineid, surgeryid)
values (294, 32);
insert into USED_IN (medicineid, surgeryid)
values (470, 54);
insert into USED_IN (medicineid, surgeryid)
values (238, 313);
insert into USED_IN (medicineid, surgeryid)
values (335, 86);
insert into USED_IN (medicineid, surgeryid)
values (464, 220);
insert into USED_IN (medicineid, surgeryid)
values (129, 74);
insert into USED_IN (medicineid, surgeryid)
values (275, 241);
insert into USED_IN (medicineid, surgeryid)
values (347, 93);
insert into USED_IN (medicineid, surgeryid)
values (160, 307);
insert into USED_IN (medicineid, surgeryid)
values (157, 335);
insert into USED_IN (medicineid, surgeryid)
values (84, 58);
insert into USED_IN (medicineid, surgeryid)
values (412, 69);
insert into USED_IN (medicineid, surgeryid)
values (120, 195);
insert into USED_IN (medicineid, surgeryid)
values (420, 176);
insert into USED_IN (medicineid, surgeryid)
values (332, 384);
insert into USED_IN (medicineid, surgeryid)
values (214, 344);
insert into USED_IN (medicineid, surgeryid)
values (397, 89);
commit;
prompt 900 records committed...
insert into USED_IN (medicineid, surgeryid)
values (82, 173);
insert into USED_IN (medicineid, surgeryid)
values (59, 392);
insert into USED_IN (medicineid, surgeryid)
values (293, 285);
insert into USED_IN (medicineid, surgeryid)
values (187, 177);
insert into USED_IN (medicineid, surgeryid)
values (97, 71);
insert into USED_IN (medicineid, surgeryid)
values (281, 145);
insert into USED_IN (medicineid, surgeryid)
values (156, 391);
insert into USED_IN (medicineid, surgeryid)
values (427, 228);
insert into USED_IN (medicineid, surgeryid)
values (215, 43);
insert into USED_IN (medicineid, surgeryid)
values (338, 65);
insert into USED_IN (medicineid, surgeryid)
values (451, 119);
insert into USED_IN (medicineid, surgeryid)
values (172, 324);
insert into USED_IN (medicineid, surgeryid)
values (39, 74);
insert into USED_IN (medicineid, surgeryid)
values (57, 318);
insert into USED_IN (medicineid, surgeryid)
values (142, 222);
insert into USED_IN (medicineid, surgeryid)
values (265, 306);
insert into USED_IN (medicineid, surgeryid)
values (92, 271);
insert into USED_IN (medicineid, surgeryid)
values (172, 130);
insert into USED_IN (medicineid, surgeryid)
values (228, 29);
insert into USED_IN (medicineid, surgeryid)
values (271, 360);
insert into USED_IN (medicineid, surgeryid)
values (427, 92);
insert into USED_IN (medicineid, surgeryid)
values (34, 229);
insert into USED_IN (medicineid, surgeryid)
values (497, 33);
insert into USED_IN (medicineid, surgeryid)
values (214, 310);
insert into USED_IN (medicineid, surgeryid)
values (275, 111);
insert into USED_IN (medicineid, surgeryid)
values (108, 10);
insert into USED_IN (medicineid, surgeryid)
values (303, 219);
insert into USED_IN (medicineid, surgeryid)
values (84, 53);
insert into USED_IN (medicineid, surgeryid)
values (202, 295);
insert into USED_IN (medicineid, surgeryid)
values (236, 220);
insert into USED_IN (medicineid, surgeryid)
values (372, 103);
insert into USED_IN (medicineid, surgeryid)
values (113, 307);
insert into USED_IN (medicineid, surgeryid)
values (329, 18);
insert into USED_IN (medicineid, surgeryid)
values (200, 379);
insert into USED_IN (medicineid, surgeryid)
values (154, 112);
insert into USED_IN (medicineid, surgeryid)
values (353, 88);
insert into USED_IN (medicineid, surgeryid)
values (45, 191);
insert into USED_IN (medicineid, surgeryid)
values (56, 116);
insert into USED_IN (medicineid, surgeryid)
values (196, 270);
insert into USED_IN (medicineid, surgeryid)
values (25, 117);
insert into USED_IN (medicineid, surgeryid)
values (291, 324);
insert into USED_IN (medicineid, surgeryid)
values (243, 34);
insert into USED_IN (medicineid, surgeryid)
values (41, 228);
insert into USED_IN (medicineid, surgeryid)
values (157, 142);
insert into USED_IN (medicineid, surgeryid)
values (338, 105);
insert into USED_IN (medicineid, surgeryid)
values (481, 104);
insert into USED_IN (medicineid, surgeryid)
values (168, 204);
insert into USED_IN (medicineid, surgeryid)
values (482, 194);
insert into USED_IN (medicineid, surgeryid)
values (131, 314);
insert into USED_IN (medicineid, surgeryid)
values (465, 372);
insert into USED_IN (medicineid, surgeryid)
values (462, 57);
insert into USED_IN (medicineid, surgeryid)
values (149, 161);
insert into USED_IN (medicineid, surgeryid)
values (136, 251);
insert into USED_IN (medicineid, surgeryid)
values (308, 8);
insert into USED_IN (medicineid, surgeryid)
values (208, 83);
insert into USED_IN (medicineid, surgeryid)
values (185, 94);
insert into USED_IN (medicineid, surgeryid)
values (230, 100);
insert into USED_IN (medicineid, surgeryid)
values (284, 262);
insert into USED_IN (medicineid, surgeryid)
values (128, 336);
insert into USED_IN (medicineid, surgeryid)
values (265, 31);
insert into USED_IN (medicineid, surgeryid)
values (134, 206);
insert into USED_IN (medicineid, surgeryid)
values (357, 163);
insert into USED_IN (medicineid, surgeryid)
values (434, 71);
insert into USED_IN (medicineid, surgeryid)
values (231, 154);
insert into USED_IN (medicineid, surgeryid)
values (346, 93);
insert into USED_IN (medicineid, surgeryid)
values (483, 124);
insert into USED_IN (medicineid, surgeryid)
values (430, 120);
insert into USED_IN (medicineid, surgeryid)
values (441, 59);
insert into USED_IN (medicineid, surgeryid)
values (197, 290);
insert into USED_IN (medicineid, surgeryid)
values (127, 186);
insert into USED_IN (medicineid, surgeryid)
values (337, 366);
insert into USED_IN (medicineid, surgeryid)
values (71, 86);
insert into USED_IN (medicineid, surgeryid)
values (470, 398);
insert into USED_IN (medicineid, surgeryid)
values (406, 263);
insert into USED_IN (medicineid, surgeryid)
values (347, 241);
insert into USED_IN (medicineid, surgeryid)
values (34, 329);
insert into USED_IN (medicineid, surgeryid)
values (367, 372);
insert into USED_IN (medicineid, surgeryid)
values (200, 183);
insert into USED_IN (medicineid, surgeryid)
values (41, 52);
insert into USED_IN (medicineid, surgeryid)
values (324, 319);
insert into USED_IN (medicineid, surgeryid)
values (466, 29);
insert into USED_IN (medicineid, surgeryid)
values (214, 87);
insert into USED_IN (medicineid, surgeryid)
values (82, 343);
insert into USED_IN (medicineid, surgeryid)
values (254, 149);
insert into USED_IN (medicineid, surgeryid)
values (81, 327);
insert into USED_IN (medicineid, surgeryid)
values (173, 223);
insert into USED_IN (medicineid, surgeryid)
values (443, 340);
insert into USED_IN (medicineid, surgeryid)
values (295, 162);
insert into USED_IN (medicineid, surgeryid)
values (240, 129);
insert into USED_IN (medicineid, surgeryid)
values (101, 62);
insert into USED_IN (medicineid, surgeryid)
values (418, 374);
insert into USED_IN (medicineid, surgeryid)
values (244, 34);
insert into USED_IN (medicineid, surgeryid)
values (462, 87);
insert into USED_IN (medicineid, surgeryid)
values (132, 350);
insert into USED_IN (medicineid, surgeryid)
values (408, 237);
insert into USED_IN (medicineid, surgeryid)
values (427, 386);
insert into USED_IN (medicineid, surgeryid)
values (320, 64);
insert into USED_IN (medicineid, surgeryid)
values (361, 77);
insert into USED_IN (medicineid, surgeryid)
values (495, 258);
insert into USED_IN (medicineid, surgeryid)
values (437, 111);
commit;
prompt 1000 records committed...
insert into USED_IN (medicineid, surgeryid)
values (257, 68);
insert into USED_IN (medicineid, surgeryid)
values (204, 369);
insert into USED_IN (medicineid, surgeryid)
values (292, 305);
insert into USED_IN (medicineid, surgeryid)
values (388, 238);
insert into USED_IN (medicineid, surgeryid)
values (216, 321);
insert into USED_IN (medicineid, surgeryid)
values (319, 116);
insert into USED_IN (medicineid, surgeryid)
values (62, 314);
insert into USED_IN (medicineid, surgeryid)
values (220, 317);
insert into USED_IN (medicineid, surgeryid)
values (43, 47);
insert into USED_IN (medicineid, surgeryid)
values (25, 114);
insert into USED_IN (medicineid, surgeryid)
values (153, 338);
insert into USED_IN (medicineid, surgeryid)
values (25, 120);
insert into USED_IN (medicineid, surgeryid)
values (145, 187);
insert into USED_IN (medicineid, surgeryid)
values (291, 137);
insert into USED_IN (medicineid, surgeryid)
values (175, 127);
insert into USED_IN (medicineid, surgeryid)
values (404, 283);
insert into USED_IN (medicineid, surgeryid)
values (467, 40);
insert into USED_IN (medicineid, surgeryid)
values (209, 131);
insert into USED_IN (medicineid, surgeryid)
values (483, 232);
insert into USED_IN (medicineid, surgeryid)
values (353, 258);
insert into USED_IN (medicineid, surgeryid)
values (229, 224);
insert into USED_IN (medicineid, surgeryid)
values (53, 340);
insert into USED_IN (medicineid, surgeryid)
values (433, 226);
insert into USED_IN (medicineid, surgeryid)
values (186, 1);
insert into USED_IN (medicineid, surgeryid)
values (449, 371);
insert into USED_IN (medicineid, surgeryid)
values (315, 347);
insert into USED_IN (medicineid, surgeryid)
values (416, 64);
insert into USED_IN (medicineid, surgeryid)
values (496, 180);
insert into USED_IN (medicineid, surgeryid)
values (242, 339);
insert into USED_IN (medicineid, surgeryid)
values (314, 248);
insert into USED_IN (medicineid, surgeryid)
values (184, 156);
insert into USED_IN (medicineid, surgeryid)
values (128, 106);
insert into USED_IN (medicineid, surgeryid)
values (406, 152);
insert into USED_IN (medicineid, surgeryid)
values (313, 347);
insert into USED_IN (medicineid, surgeryid)
values (447, 169);
insert into USED_IN (medicineid, surgeryid)
values (191, 193);
insert into USED_IN (medicineid, surgeryid)
values (299, 266);
insert into USED_IN (medicineid, surgeryid)
values (176, 179);
insert into USED_IN (medicineid, surgeryid)
values (256, 156);
insert into USED_IN (medicineid, surgeryid)
values (117, 144);
insert into USED_IN (medicineid, surgeryid)
values (468, 157);
insert into USED_IN (medicineid, surgeryid)
values (60, 52);
insert into USED_IN (medicineid, surgeryid)
values (158, 9);
insert into USED_IN (medicineid, surgeryid)
values (224, 54);
insert into USED_IN (medicineid, surgeryid)
values (100, 38);
insert into USED_IN (medicineid, surgeryid)
values (119, 321);
insert into USED_IN (medicineid, surgeryid)
values (158, 32);
insert into USED_IN (medicineid, surgeryid)
values (339, 51);
insert into USED_IN (medicineid, surgeryid)
values (205, 96);
insert into USED_IN (medicineid, surgeryid)
values (266, 387);
insert into USED_IN (medicineid, surgeryid)
values (428, 251);
insert into USED_IN (medicineid, surgeryid)
values (421, 49);
insert into USED_IN (medicineid, surgeryid)
values (135, 60);
insert into USED_IN (medicineid, surgeryid)
values (447, 210);
insert into USED_IN (medicineid, surgeryid)
values (321, 32);
insert into USED_IN (medicineid, surgeryid)
values (247, 31);
insert into USED_IN (medicineid, surgeryid)
values (335, 289);
insert into USED_IN (medicineid, surgeryid)
values (458, 364);
insert into USED_IN (medicineid, surgeryid)
values (158, 43);
insert into USED_IN (medicineid, surgeryid)
values (102, 63);
insert into USED_IN (medicineid, surgeryid)
values (408, 387);
insert into USED_IN (medicineid, surgeryid)
values (281, 200);
insert into USED_IN (medicineid, surgeryid)
values (300, 123);
insert into USED_IN (medicineid, surgeryid)
values (23, 22);
insert into USED_IN (medicineid, surgeryid)
values (447, 143);
insert into USED_IN (medicineid, surgeryid)
values (456, 151);
insert into USED_IN (medicineid, surgeryid)
values (489, 289);
insert into USED_IN (medicineid, surgeryid)
values (61, 260);
insert into USED_IN (medicineid, surgeryid)
values (152, 397);
insert into USED_IN (medicineid, surgeryid)
values (3, 143);
insert into USED_IN (medicineid, surgeryid)
values (496, 63);
insert into USED_IN (medicineid, surgeryid)
values (65, 382);
insert into USED_IN (medicineid, surgeryid)
values (224, 227);
insert into USED_IN (medicineid, surgeryid)
values (339, 150);
insert into USED_IN (medicineid, surgeryid)
values (18, 122);
insert into USED_IN (medicineid, surgeryid)
values (26, 157);
insert into USED_IN (medicineid, surgeryid)
values (51, 68);
insert into USED_IN (medicineid, surgeryid)
values (254, 59);
insert into USED_IN (medicineid, surgeryid)
values (385, 278);
insert into USED_IN (medicineid, surgeryid)
values (431, 153);
insert into USED_IN (medicineid, surgeryid)
values (157, 347);
insert into USED_IN (medicineid, surgeryid)
values (408, 70);
insert into USED_IN (medicineid, surgeryid)
values (20, 180);
insert into USED_IN (medicineid, surgeryid)
values (140, 94);
insert into USED_IN (medicineid, surgeryid)
values (456, 51);
insert into USED_IN (medicineid, surgeryid)
values (370, 16);
insert into USED_IN (medicineid, surgeryid)
values (217, 338);
insert into USED_IN (medicineid, surgeryid)
values (326, 145);
insert into USED_IN (medicineid, surgeryid)
values (265, 17);
insert into USED_IN (medicineid, surgeryid)
values (163, 6);
insert into USED_IN (medicineid, surgeryid)
values (162, 281);
insert into USED_IN (medicineid, surgeryid)
values (412, 318);
insert into USED_IN (medicineid, surgeryid)
values (107, 146);
insert into USED_IN (medicineid, surgeryid)
values (377, 2);
insert into USED_IN (medicineid, surgeryid)
values (259, 229);
insert into USED_IN (medicineid, surgeryid)
values (63, 8);
insert into USED_IN (medicineid, surgeryid)
values (307, 142);
insert into USED_IN (medicineid, surgeryid)
values (272, 309);
insert into USED_IN (medicineid, surgeryid)
values (225, 298);
insert into USED_IN (medicineid, surgeryid)
values (197, 50);
commit;
prompt 1100 records committed...
insert into USED_IN (medicineid, surgeryid)
values (447, 200);
insert into USED_IN (medicineid, surgeryid)
values (488, 29);
insert into USED_IN (medicineid, surgeryid)
values (34, 104);
insert into USED_IN (medicineid, surgeryid)
values (17, 284);
insert into USED_IN (medicineid, surgeryid)
values (26, 262);
insert into USED_IN (medicineid, surgeryid)
values (328, 236);
insert into USED_IN (medicineid, surgeryid)
values (168, 162);
insert into USED_IN (medicineid, surgeryid)
values (349, 67);
insert into USED_IN (medicineid, surgeryid)
values (373, 66);
insert into USED_IN (medicineid, surgeryid)
values (336, 386);
insert into USED_IN (medicineid, surgeryid)
values (180, 185);
insert into USED_IN (medicineid, surgeryid)
values (312, 344);
insert into USED_IN (medicineid, surgeryid)
values (333, 360);
insert into USED_IN (medicineid, surgeryid)
values (134, 302);
insert into USED_IN (medicineid, surgeryid)
values (277, 256);
insert into USED_IN (medicineid, surgeryid)
values (323, 311);
insert into USED_IN (medicineid, surgeryid)
values (27, 198);
insert into USED_IN (medicineid, surgeryid)
values (385, 188);
insert into USED_IN (medicineid, surgeryid)
values (457, 69);
insert into USED_IN (medicineid, surgeryid)
values (3, 233);
insert into USED_IN (medicineid, surgeryid)
values (158, 178);
insert into USED_IN (medicineid, surgeryid)
values (79, 185);
insert into USED_IN (medicineid, surgeryid)
values (222, 133);
insert into USED_IN (medicineid, surgeryid)
values (246, 56);
insert into USED_IN (medicineid, surgeryid)
values (347, 218);
insert into USED_IN (medicineid, surgeryid)
values (103, 243);
insert into USED_IN (medicineid, surgeryid)
values (305, 311);
insert into USED_IN (medicineid, surgeryid)
values (33, 350);
insert into USED_IN (medicineid, surgeryid)
values (11, 250);
insert into USED_IN (medicineid, surgeryid)
values (90, 328);
insert into USED_IN (medicineid, surgeryid)
values (430, 73);
insert into USED_IN (medicineid, surgeryid)
values (73, 371);
insert into USED_IN (medicineid, surgeryid)
values (282, 243);
insert into USED_IN (medicineid, surgeryid)
values (53, 149);
insert into USED_IN (medicineid, surgeryid)
values (118, 83);
insert into USED_IN (medicineid, surgeryid)
values (179, 53);
insert into USED_IN (medicineid, surgeryid)
values (415, 344);
insert into USED_IN (medicineid, surgeryid)
values (298, 7);
insert into USED_IN (medicineid, surgeryid)
values (5, 307);
insert into USED_IN (medicineid, surgeryid)
values (461, 323);
insert into USED_IN (medicineid, surgeryid)
values (284, 358);
insert into USED_IN (medicineid, surgeryid)
values (116, 374);
insert into USED_IN (medicineid, surgeryid)
values (211, 246);
insert into USED_IN (medicineid, surgeryid)
values (281, 139);
insert into USED_IN (medicineid, surgeryid)
values (361, 136);
insert into USED_IN (medicineid, surgeryid)
values (263, 198);
insert into USED_IN (medicineid, surgeryid)
values (217, 94);
insert into USED_IN (medicineid, surgeryid)
values (486, 254);
insert into USED_IN (medicineid, surgeryid)
values (261, 99);
insert into USED_IN (medicineid, surgeryid)
values (207, 327);
insert into USED_IN (medicineid, surgeryid)
values (297, 23);
insert into USED_IN (medicineid, surgeryid)
values (450, 113);
insert into USED_IN (medicineid, surgeryid)
values (292, 284);
insert into USED_IN (medicineid, surgeryid)
values (185, 62);
insert into USED_IN (medicineid, surgeryid)
values (457, 392);
insert into USED_IN (medicineid, surgeryid)
values (359, 256);
insert into USED_IN (medicineid, surgeryid)
values (54, 317);
insert into USED_IN (medicineid, surgeryid)
values (500, 35);
insert into USED_IN (medicineid, surgeryid)
values (437, 79);
insert into USED_IN (medicineid, surgeryid)
values (304, 269);
insert into USED_IN (medicineid, surgeryid)
values (62, 305);
insert into USED_IN (medicineid, surgeryid)
values (137, 212);
insert into USED_IN (medicineid, surgeryid)
values (209, 140);
insert into USED_IN (medicineid, surgeryid)
values (145, 242);
insert into USED_IN (medicineid, surgeryid)
values (402, 262);
insert into USED_IN (medicineid, surgeryid)
values (138, 218);
insert into USED_IN (medicineid, surgeryid)
values (31, 393);
insert into USED_IN (medicineid, surgeryid)
values (165, 161);
insert into USED_IN (medicineid, surgeryid)
values (413, 50);
insert into USED_IN (medicineid, surgeryid)
values (268, 393);
insert into USED_IN (medicineid, surgeryid)
values (23, 127);
insert into USED_IN (medicineid, surgeryid)
values (489, 25);
insert into USED_IN (medicineid, surgeryid)
values (412, 254);
insert into USED_IN (medicineid, surgeryid)
values (454, 363);
insert into USED_IN (medicineid, surgeryid)
values (276, 133);
insert into USED_IN (medicineid, surgeryid)
values (301, 281);
insert into USED_IN (medicineid, surgeryid)
values (435, 377);
insert into USED_IN (medicineid, surgeryid)
values (24, 352);
insert into USED_IN (medicineid, surgeryid)
values (481, 68);
insert into USED_IN (medicineid, surgeryid)
values (328, 194);
insert into USED_IN (medicineid, surgeryid)
values (24, 359);
insert into USED_IN (medicineid, surgeryid)
values (198, 400);
insert into USED_IN (medicineid, surgeryid)
values (124, 332);
insert into USED_IN (medicineid, surgeryid)
values (122, 131);
insert into USED_IN (medicineid, surgeryid)
values (39, 228);
insert into USED_IN (medicineid, surgeryid)
values (384, 321);
insert into USED_IN (medicineid, surgeryid)
values (162, 81);
insert into USED_IN (medicineid, surgeryid)
values (107, 183);
insert into USED_IN (medicineid, surgeryid)
values (491, 264);
insert into USED_IN (medicineid, surgeryid)
values (246, 376);
insert into USED_IN (medicineid, surgeryid)
values (275, 161);
insert into USED_IN (medicineid, surgeryid)
values (416, 299);
insert into USED_IN (medicineid, surgeryid)
values (429, 102);
insert into USED_IN (medicineid, surgeryid)
values (53, 282);
insert into USED_IN (medicineid, surgeryid)
values (116, 162);
insert into USED_IN (medicineid, surgeryid)
values (5, 353);
insert into USED_IN (medicineid, surgeryid)
values (334, 350);
insert into USED_IN (medicineid, surgeryid)
values (318, 132);
insert into USED_IN (medicineid, surgeryid)
values (124, 7);
insert into USED_IN (medicineid, surgeryid)
values (59, 134);
commit;
prompt 1200 records committed...
insert into USED_IN (medicineid, surgeryid)
values (62, 333);
insert into USED_IN (medicineid, surgeryid)
values (200, 51);
insert into USED_IN (medicineid, surgeryid)
values (333, 57);
insert into USED_IN (medicineid, surgeryid)
values (154, 62);
insert into USED_IN (medicineid, surgeryid)
values (314, 370);
insert into USED_IN (medicineid, surgeryid)
values (207, 174);
insert into USED_IN (medicineid, surgeryid)
values (245, 146);
insert into USED_IN (medicineid, surgeryid)
values (237, 224);
insert into USED_IN (medicineid, surgeryid)
values (127, 162);
insert into USED_IN (medicineid, surgeryid)
values (170, 146);
insert into USED_IN (medicineid, surgeryid)
values (205, 340);
insert into USED_IN (medicineid, surgeryid)
values (350, 143);
insert into USED_IN (medicineid, surgeryid)
values (410, 122);
insert into USED_IN (medicineid, surgeryid)
values (492, 152);
insert into USED_IN (medicineid, surgeryid)
values (346, 218);
insert into USED_IN (medicineid, surgeryid)
values (162, 65);
insert into USED_IN (medicineid, surgeryid)
values (4, 14);
insert into USED_IN (medicineid, surgeryid)
values (200, 268);
insert into USED_IN (medicineid, surgeryid)
values (6, 286);
insert into USED_IN (medicineid, surgeryid)
values (275, 177);
insert into USED_IN (medicineid, surgeryid)
values (279, 127);
insert into USED_IN (medicineid, surgeryid)
values (254, 136);
insert into USED_IN (medicineid, surgeryid)
values (251, 304);
insert into USED_IN (medicineid, surgeryid)
values (297, 142);
insert into USED_IN (medicineid, surgeryid)
values (246, 171);
insert into USED_IN (medicineid, surgeryid)
values (145, 170);
insert into USED_IN (medicineid, surgeryid)
values (352, 149);
insert into USED_IN (medicineid, surgeryid)
values (219, 169);
insert into USED_IN (medicineid, surgeryid)
values (222, 298);
insert into USED_IN (medicineid, surgeryid)
values (293, 284);
insert into USED_IN (medicineid, surgeryid)
values (359, 397);
insert into USED_IN (medicineid, surgeryid)
values (64, 399);
insert into USED_IN (medicineid, surgeryid)
values (24, 249);
insert into USED_IN (medicineid, surgeryid)
values (188, 139);
insert into USED_IN (medicineid, surgeryid)
values (164, 233);
insert into USED_IN (medicineid, surgeryid)
values (303, 222);
insert into USED_IN (medicineid, surgeryid)
values (168, 222);
insert into USED_IN (medicineid, surgeryid)
values (357, 125);
insert into USED_IN (medicineid, surgeryid)
values (117, 281);
insert into USED_IN (medicineid, surgeryid)
values (75, 318);
insert into USED_IN (medicineid, surgeryid)
values (130, 272);
insert into USED_IN (medicineid, surgeryid)
values (67, 262);
insert into USED_IN (medicineid, surgeryid)
values (157, 369);
insert into USED_IN (medicineid, surgeryid)
values (179, 216);
insert into USED_IN (medicineid, surgeryid)
values (124, 229);
insert into USED_IN (medicineid, surgeryid)
values (353, 228);
insert into USED_IN (medicineid, surgeryid)
values (490, 205);
insert into USED_IN (medicineid, surgeryid)
values (341, 191);
insert into USED_IN (medicineid, surgeryid)
values (413, 147);
insert into USED_IN (medicineid, surgeryid)
values (289, 111);
insert into USED_IN (medicineid, surgeryid)
values (291, 192);
insert into USED_IN (medicineid, surgeryid)
values (272, 276);
insert into USED_IN (medicineid, surgeryid)
values (153, 72);
insert into USED_IN (medicineid, surgeryid)
values (67, 283);
insert into USED_IN (medicineid, surgeryid)
values (427, 356);
insert into USED_IN (medicineid, surgeryid)
values (495, 399);
insert into USED_IN (medicineid, surgeryid)
values (267, 340);
insert into USED_IN (medicineid, surgeryid)
values (347, 10);
insert into USED_IN (medicineid, surgeryid)
values (243, 211);
insert into USED_IN (medicineid, surgeryid)
values (479, 52);
insert into USED_IN (medicineid, surgeryid)
values (346, 399);
insert into USED_IN (medicineid, surgeryid)
values (384, 370);
insert into USED_IN (medicineid, surgeryid)
values (330, 337);
insert into USED_IN (medicineid, surgeryid)
values (13, 280);
insert into USED_IN (medicineid, surgeryid)
values (91, 150);
insert into USED_IN (medicineid, surgeryid)
values (444, 314);
insert into USED_IN (medicineid, surgeryid)
values (379, 90);
insert into USED_IN (medicineid, surgeryid)
values (407, 395);
insert into USED_IN (medicineid, surgeryid)
values (281, 227);
insert into USED_IN (medicineid, surgeryid)
values (2, 236);
insert into USED_IN (medicineid, surgeryid)
values (19, 238);
insert into USED_IN (medicineid, surgeryid)
values (430, 213);
insert into USED_IN (medicineid, surgeryid)
values (266, 384);
insert into USED_IN (medicineid, surgeryid)
values (211, 283);
insert into USED_IN (medicineid, surgeryid)
values (224, 117);
insert into USED_IN (medicineid, surgeryid)
values (71, 226);
insert into USED_IN (medicineid, surgeryid)
values (1, 21);
insert into USED_IN (medicineid, surgeryid)
values (163, 173);
insert into USED_IN (medicineid, surgeryid)
values (216, 116);
insert into USED_IN (medicineid, surgeryid)
values (52, 85);
insert into USED_IN (medicineid, surgeryid)
values (114, 31);
insert into USED_IN (medicineid, surgeryid)
values (423, 157);
insert into USED_IN (medicineid, surgeryid)
values (431, 284);
insert into USED_IN (medicineid, surgeryid)
values (131, 218);
insert into USED_IN (medicineid, surgeryid)
values (482, 367);
insert into USED_IN (medicineid, surgeryid)
values (355, 289);
insert into USED_IN (medicineid, surgeryid)
values (493, 266);
insert into USED_IN (medicineid, surgeryid)
values (189, 171);
insert into USED_IN (medicineid, surgeryid)
values (376, 140);
insert into USED_IN (medicineid, surgeryid)
values (214, 32);
insert into USED_IN (medicineid, surgeryid)
values (242, 160);
insert into USED_IN (medicineid, surgeryid)
values (100, 67);
insert into USED_IN (medicineid, surgeryid)
values (96, 243);
insert into USED_IN (medicineid, surgeryid)
values (40, 185);
insert into USED_IN (medicineid, surgeryid)
values (257, 299);
insert into USED_IN (medicineid, surgeryid)
values (367, 5);
insert into USED_IN (medicineid, surgeryid)
values (171, 93);
insert into USED_IN (medicineid, surgeryid)
values (309, 333);
insert into USED_IN (medicineid, surgeryid)
values (63, 167);
insert into USED_IN (medicineid, surgeryid)
values (77, 102);
commit;
prompt 1300 records committed...
insert into USED_IN (medicineid, surgeryid)
values (380, 229);
insert into USED_IN (medicineid, surgeryid)
values (203, 213);
insert into USED_IN (medicineid, surgeryid)
values (37, 62);
insert into USED_IN (medicineid, surgeryid)
values (476, 278);
insert into USED_IN (medicineid, surgeryid)
values (224, 290);
insert into USED_IN (medicineid, surgeryid)
values (425, 44);
insert into USED_IN (medicineid, surgeryid)
values (404, 87);
insert into USED_IN (medicineid, surgeryid)
values (5, 141);
insert into USED_IN (medicineid, surgeryid)
values (436, 32);
insert into USED_IN (medicineid, surgeryid)
values (306, 273);
insert into USED_IN (medicineid, surgeryid)
values (315, 223);
insert into USED_IN (medicineid, surgeryid)
values (85, 370);
insert into USED_IN (medicineid, surgeryid)
values (5, 14);
insert into USED_IN (medicineid, surgeryid)
values (477, 349);
insert into USED_IN (medicineid, surgeryid)
values (14, 244);
insert into USED_IN (medicineid, surgeryid)
values (262, 177);
insert into USED_IN (medicineid, surgeryid)
values (408, 123);
insert into USED_IN (medicineid, surgeryid)
values (263, 82);
insert into USED_IN (medicineid, surgeryid)
values (178, 259);
insert into USED_IN (medicineid, surgeryid)
values (81, 399);
insert into USED_IN (medicineid, surgeryid)
values (433, 170);
insert into USED_IN (medicineid, surgeryid)
values (426, 305);
insert into USED_IN (medicineid, surgeryid)
values (19, 378);
insert into USED_IN (medicineid, surgeryid)
values (497, 324);
insert into USED_IN (medicineid, surgeryid)
values (338, 23);
insert into USED_IN (medicineid, surgeryid)
values (480, 57);
insert into USED_IN (medicineid, surgeryid)
values (199, 300);
insert into USED_IN (medicineid, surgeryid)
values (308, 230);
insert into USED_IN (medicineid, surgeryid)
values (245, 55);
insert into USED_IN (medicineid, surgeryid)
values (13, 290);
insert into USED_IN (medicineid, surgeryid)
values (494, 30);
insert into USED_IN (medicineid, surgeryid)
values (115, 65);
insert into USED_IN (medicineid, surgeryid)
values (339, 321);
insert into USED_IN (medicineid, surgeryid)
values (40, 106);
insert into USED_IN (medicineid, surgeryid)
values (263, 115);
insert into USED_IN (medicineid, surgeryid)
values (335, 235);
insert into USED_IN (medicineid, surgeryid)
values (353, 67);
insert into USED_IN (medicineid, surgeryid)
values (397, 310);
insert into USED_IN (medicineid, surgeryid)
values (180, 213);
insert into USED_IN (medicineid, surgeryid)
values (219, 130);
insert into USED_IN (medicineid, surgeryid)
values (308, 349);
insert into USED_IN (medicineid, surgeryid)
values (160, 300);
insert into USED_IN (medicineid, surgeryid)
values (273, 381);
insert into USED_IN (medicineid, surgeryid)
values (427, 369);
insert into USED_IN (medicineid, surgeryid)
values (67, 189);
insert into USED_IN (medicineid, surgeryid)
values (102, 271);
insert into USED_IN (medicineid, surgeryid)
values (206, 290);
insert into USED_IN (medicineid, surgeryid)
values (103, 370);
insert into USED_IN (medicineid, surgeryid)
values (144, 255);
insert into USED_IN (medicineid, surgeryid)
values (168, 350);
insert into USED_IN (medicineid, surgeryid)
values (386, 364);
insert into USED_IN (medicineid, surgeryid)
values (13, 47);
insert into USED_IN (medicineid, surgeryid)
values (312, 57);
insert into USED_IN (medicineid, surgeryid)
values (499, 257);
insert into USED_IN (medicineid, surgeryid)
values (310, 47);
insert into USED_IN (medicineid, surgeryid)
values (200, 32);
insert into USED_IN (medicineid, surgeryid)
values (473, 280);
insert into USED_IN (medicineid, surgeryid)
values (473, 283);
insert into USED_IN (medicineid, surgeryid)
values (222, 391);
insert into USED_IN (medicineid, surgeryid)
values (161, 17);
insert into USED_IN (medicineid, surgeryid)
values (341, 235);
insert into USED_IN (medicineid, surgeryid)
values (280, 5);
insert into USED_IN (medicineid, surgeryid)
values (48, 170);
insert into USED_IN (medicineid, surgeryid)
values (71, 31);
insert into USED_IN (medicineid, surgeryid)
values (364, 35);
insert into USED_IN (medicineid, surgeryid)
values (29, 313);
insert into USED_IN (medicineid, surgeryid)
values (91, 323);
insert into USED_IN (medicineid, surgeryid)
values (33, 232);
insert into USED_IN (medicineid, surgeryid)
values (463, 296);
insert into USED_IN (medicineid, surgeryid)
values (406, 376);
insert into USED_IN (medicineid, surgeryid)
values (28, 317);
insert into USED_IN (medicineid, surgeryid)
values (38, 170);
insert into USED_IN (medicineid, surgeryid)
values (313, 319);
insert into USED_IN (medicineid, surgeryid)
values (193, 36);
insert into USED_IN (medicineid, surgeryid)
values (366, 132);
insert into USED_IN (medicineid, surgeryid)
values (256, 90);
insert into USED_IN (medicineid, surgeryid)
values (98, 36);
insert into USED_IN (medicineid, surgeryid)
values (116, 396);
insert into USED_IN (medicineid, surgeryid)
values (252, 313);
insert into USED_IN (medicineid, surgeryid)
values (108, 55);
insert into USED_IN (medicineid, surgeryid)
values (275, 121);
insert into USED_IN (medicineid, surgeryid)
values (364, 288);
insert into USED_IN (medicineid, surgeryid)
values (434, 114);
insert into USED_IN (medicineid, surgeryid)
values (281, 224);
insert into USED_IN (medicineid, surgeryid)
values (292, 127);
insert into USED_IN (medicineid, surgeryid)
values (156, 239);
insert into USED_IN (medicineid, surgeryid)
values (477, 59);
insert into USED_IN (medicineid, surgeryid)
values (274, 251);
insert into USED_IN (medicineid, surgeryid)
values (326, 152);
insert into USED_IN (medicineid, surgeryid)
values (269, 3);
insert into USED_IN (medicineid, surgeryid)
values (21, 207);
insert into USED_IN (medicineid, surgeryid)
values (314, 133);
insert into USED_IN (medicineid, surgeryid)
values (112, 143);
insert into USED_IN (medicineid, surgeryid)
values (197, 77);
insert into USED_IN (medicineid, surgeryid)
values (253, 17);
insert into USED_IN (medicineid, surgeryid)
values (57, 189);
insert into USED_IN (medicineid, surgeryid)
values (300, 134);
insert into USED_IN (medicineid, surgeryid)
values (136, 338);
insert into USED_IN (medicineid, surgeryid)
values (393, 349);
insert into USED_IN (medicineid, surgeryid)
values (55, 159);
commit;
prompt 1400 records committed...
insert into USED_IN (medicineid, surgeryid)
values (342, 203);
insert into USED_IN (medicineid, surgeryid)
values (249, 383);
insert into USED_IN (medicineid, surgeryid)
values (15, 239);
insert into USED_IN (medicineid, surgeryid)
values (419, 155);
insert into USED_IN (medicineid, surgeryid)
values (474, 363);
insert into USED_IN (medicineid, surgeryid)
values (253, 263);
insert into USED_IN (medicineid, surgeryid)
values (348, 24);
insert into USED_IN (medicineid, surgeryid)
values (388, 131);
insert into USED_IN (medicineid, surgeryid)
values (279, 301);
insert into USED_IN (medicineid, surgeryid)
values (70, 272);
insert into USED_IN (medicineid, surgeryid)
values (463, 192);
insert into USED_IN (medicineid, surgeryid)
values (268, 141);
insert into USED_IN (medicineid, surgeryid)
values (287, 332);
insert into USED_IN (medicineid, surgeryid)
values (219, 127);
insert into USED_IN (medicineid, surgeryid)
values (399, 104);
insert into USED_IN (medicineid, surgeryid)
values (252, 126);
insert into USED_IN (medicineid, surgeryid)
values (379, 218);
insert into USED_IN (medicineid, surgeryid)
values (224, 398);
insert into USED_IN (medicineid, surgeryid)
values (182, 130);
insert into USED_IN (medicineid, surgeryid)
values (257, 135);
insert into USED_IN (medicineid, surgeryid)
values (290, 164);
insert into USED_IN (medicineid, surgeryid)
values (304, 55);
insert into USED_IN (medicineid, surgeryid)
values (500, 305);
insert into USED_IN (medicineid, surgeryid)
values (495, 240);
insert into USED_IN (medicineid, surgeryid)
values (37, 139);
insert into USED_IN (medicineid, surgeryid)
values (84, 141);
insert into USED_IN (medicineid, surgeryid)
values (149, 103);
insert into USED_IN (medicineid, surgeryid)
values (95, 166);
insert into USED_IN (medicineid, surgeryid)
values (136, 311);
insert into USED_IN (medicineid, surgeryid)
values (359, 366);
insert into USED_IN (medicineid, surgeryid)
values (248, 139);
insert into USED_IN (medicineid, surgeryid)
values (219, 251);
insert into USED_IN (medicineid, surgeryid)
values (82, 215);
insert into USED_IN (medicineid, surgeryid)
values (357, 230);
insert into USED_IN (medicineid, surgeryid)
values (253, 202);
insert into USED_IN (medicineid, surgeryid)
values (260, 129);
insert into USED_IN (medicineid, surgeryid)
values (132, 239);
insert into USED_IN (medicineid, surgeryid)
values (62, 266);
insert into USED_IN (medicineid, surgeryid)
values (247, 399);
insert into USED_IN (medicineid, surgeryid)
values (17, 339);
insert into USED_IN (medicineid, surgeryid)
values (353, 243);
insert into USED_IN (medicineid, surgeryid)
values (55, 215);
insert into USED_IN (medicineid, surgeryid)
values (5, 238);
insert into USED_IN (medicineid, surgeryid)
values (458, 59);
insert into USED_IN (medicineid, surgeryid)
values (454, 97);
insert into USED_IN (medicineid, surgeryid)
values (383, 117);
insert into USED_IN (medicineid, surgeryid)
values (352, 29);
insert into USED_IN (medicineid, surgeryid)
values (457, 163);
insert into USED_IN (medicineid, surgeryid)
values (415, 146);
insert into USED_IN (medicineid, surgeryid)
values (467, 339);
insert into USED_IN (medicineid, surgeryid)
values (278, 213);
insert into USED_IN (medicineid, surgeryid)
values (108, 6);
insert into USED_IN (medicineid, surgeryid)
values (370, 399);
insert into USED_IN (medicineid, surgeryid)
values (43, 115);
insert into USED_IN (medicineid, surgeryid)
values (369, 209);
insert into USED_IN (medicineid, surgeryid)
values (41, 331);
insert into USED_IN (medicineid, surgeryid)
values (292, 46);
insert into USED_IN (medicineid, surgeryid)
values (125, 219);
insert into USED_IN (medicineid, surgeryid)
values (495, 397);
insert into USED_IN (medicineid, surgeryid)
values (293, 307);
insert into USED_IN (medicineid, surgeryid)
values (453, 93);
insert into USED_IN (medicineid, surgeryid)
values (498, 162);
insert into USED_IN (medicineid, surgeryid)
values (286, 19);
insert into USED_IN (medicineid, surgeryid)
values (180, 280);
insert into USED_IN (medicineid, surgeryid)
values (168, 336);
insert into USED_IN (medicineid, surgeryid)
values (269, 314);
insert into USED_IN (medicineid, surgeryid)
values (381, 203);
insert into USED_IN (medicineid, surgeryid)
values (240, 265);
insert into USED_IN (medicineid, surgeryid)
values (312, 240);
insert into USED_IN (medicineid, surgeryid)
values (398, 147);
insert into USED_IN (medicineid, surgeryid)
values (478, 121);
insert into USED_IN (medicineid, surgeryid)
values (161, 148);
insert into USED_IN (medicineid, surgeryid)
values (122, 161);
insert into USED_IN (medicineid, surgeryid)
values (320, 207);
insert into USED_IN (medicineid, surgeryid)
values (151, 261);
insert into USED_IN (medicineid, surgeryid)
values (288, 23);
insert into USED_IN (medicineid, surgeryid)
values (294, 84);
insert into USED_IN (medicineid, surgeryid)
values (51, 214);
insert into USED_IN (medicineid, surgeryid)
values (443, 33);
insert into USED_IN (medicineid, surgeryid)
values (115, 250);
insert into USED_IN (medicineid, surgeryid)
values (333, 288);
insert into USED_IN (medicineid, surgeryid)
values (352, 76);
insert into USED_IN (medicineid, surgeryid)
values (256, 94);
insert into USED_IN (medicineid, surgeryid)
values (351, 38);
insert into USED_IN (medicineid, surgeryid)
values (214, 335);
insert into USED_IN (medicineid, surgeryid)
values (406, 241);
insert into USED_IN (medicineid, surgeryid)
values (3, 201);
insert into USED_IN (medicineid, surgeryid)
values (481, 153);
insert into USED_IN (medicineid, surgeryid)
values (307, 385);
insert into USED_IN (medicineid, surgeryid)
values (49, 167);
insert into USED_IN (medicineid, surgeryid)
values (76, 191);
insert into USED_IN (medicineid, surgeryid)
values (392, 155);
insert into USED_IN (medicineid, surgeryid)
values (76, 36);
insert into USED_IN (medicineid, surgeryid)
values (10, 116);
insert into USED_IN (medicineid, surgeryid)
values (39, 79);
insert into USED_IN (medicineid, surgeryid)
values (489, 152);
insert into USED_IN (medicineid, surgeryid)
values (92, 290);
insert into USED_IN (medicineid, surgeryid)
values (191, 276);
insert into USED_IN (medicineid, surgeryid)
values (163, 87);
insert into USED_IN (medicineid, surgeryid)
values (391, 286);
commit;
prompt 1500 records committed...
insert into USED_IN (medicineid, surgeryid)
values (282, 242);
insert into USED_IN (medicineid, surgeryid)
values (484, 8);
insert into USED_IN (medicineid, surgeryid)
values (196, 198);
insert into USED_IN (medicineid, surgeryid)
values (114, 342);
insert into USED_IN (medicineid, surgeryid)
values (498, 93);
insert into USED_IN (medicineid, surgeryid)
values (108, 17);
insert into USED_IN (medicineid, surgeryid)
values (443, 32);
insert into USED_IN (medicineid, surgeryid)
values (313, 281);
insert into USED_IN (medicineid, surgeryid)
values (354, 95);
insert into USED_IN (medicineid, surgeryid)
values (484, 245);
insert into USED_IN (medicineid, surgeryid)
values (110, 246);
insert into USED_IN (medicineid, surgeryid)
values (47, 97);
insert into USED_IN (medicineid, surgeryid)
values (323, 208);
insert into USED_IN (medicineid, surgeryid)
values (150, 299);
insert into USED_IN (medicineid, surgeryid)
values (439, 268);
insert into USED_IN (medicineid, surgeryid)
values (74, 203);
insert into USED_IN (medicineid, surgeryid)
values (157, 97);
insert into USED_IN (medicineid, surgeryid)
values (179, 389);
insert into USED_IN (medicineid, surgeryid)
values (124, 341);
insert into USED_IN (medicineid, surgeryid)
values (175, 341);
insert into USED_IN (medicineid, surgeryid)
values (54, 245);
insert into USED_IN (medicineid, surgeryid)
values (166, 4);
insert into USED_IN (medicineid, surgeryid)
values (494, 306);
insert into USED_IN (medicineid, surgeryid)
values (15, 209);
insert into USED_IN (medicineid, surgeryid)
values (118, 189);
insert into USED_IN (medicineid, surgeryid)
values (212, 308);
insert into USED_IN (medicineid, surgeryid)
values (6, 304);
insert into USED_IN (medicineid, surgeryid)
values (36, 226);
insert into USED_IN (medicineid, surgeryid)
values (103, 291);
insert into USED_IN (medicineid, surgeryid)
values (464, 258);
insert into USED_IN (medicineid, surgeryid)
values (487, 200);
insert into USED_IN (medicineid, surgeryid)
values (370, 15);
insert into USED_IN (medicineid, surgeryid)
values (435, 221);
insert into USED_IN (medicineid, surgeryid)
values (173, 55);
insert into USED_IN (medicineid, surgeryid)
values (176, 139);
insert into USED_IN (medicineid, surgeryid)
values (296, 207);
insert into USED_IN (medicineid, surgeryid)
values (16, 179);
insert into USED_IN (medicineid, surgeryid)
values (285, 309);
insert into USED_IN (medicineid, surgeryid)
values (47, 220);
insert into USED_IN (medicineid, surgeryid)
values (223, 380);
insert into USED_IN (medicineid, surgeryid)
values (310, 29);
insert into USED_IN (medicineid, surgeryid)
values (66, 141);
insert into USED_IN (medicineid, surgeryid)
values (409, 103);
insert into USED_IN (medicineid, surgeryid)
values (210, 314);
insert into USED_IN (medicineid, surgeryid)
values (200, 368);
insert into USED_IN (medicineid, surgeryid)
values (263, 200);
insert into USED_IN (medicineid, surgeryid)
values (282, 130);
insert into USED_IN (medicineid, surgeryid)
values (500, 176);
insert into USED_IN (medicineid, surgeryid)
values (153, 313);
insert into USED_IN (medicineid, surgeryid)
values (279, 211);
insert into USED_IN (medicineid, surgeryid)
values (65, 384);
insert into USED_IN (medicineid, surgeryid)
values (107, 30);
insert into USED_IN (medicineid, surgeryid)
values (132, 16);
insert into USED_IN (medicineid, surgeryid)
values (402, 245);
insert into USED_IN (medicineid, surgeryid)
values (483, 61);
insert into USED_IN (medicineid, surgeryid)
values (417, 266);
insert into USED_IN (medicineid, surgeryid)
values (315, 306);
insert into USED_IN (medicineid, surgeryid)
values (49, 116);
insert into USED_IN (medicineid, surgeryid)
values (309, 375);
insert into USED_IN (medicineid, surgeryid)
values (336, 164);
insert into USED_IN (medicineid, surgeryid)
values (82, 252);
insert into USED_IN (medicineid, surgeryid)
values (46, 102);
insert into USED_IN (medicineid, surgeryid)
values (365, 186);
insert into USED_IN (medicineid, surgeryid)
values (454, 175);
insert into USED_IN (medicineid, surgeryid)
values (294, 254);
insert into USED_IN (medicineid, surgeryid)
values (440, 191);
insert into USED_IN (medicineid, surgeryid)
values (321, 349);
insert into USED_IN (medicineid, surgeryid)
values (254, 329);
insert into USED_IN (medicineid, surgeryid)
values (336, 257);
insert into USED_IN (medicineid, surgeryid)
values (342, 252);
insert into USED_IN (medicineid, surgeryid)
values (260, 396);
insert into USED_IN (medicineid, surgeryid)
values (332, 369);
insert into USED_IN (medicineid, surgeryid)
values (462, 290);
insert into USED_IN (medicineid, surgeryid)
values (302, 331);
insert into USED_IN (medicineid, surgeryid)
values (21, 334);
insert into USED_IN (medicineid, surgeryid)
values (181, 12);
insert into USED_IN (medicineid, surgeryid)
values (408, 133);
insert into USED_IN (medicineid, surgeryid)
values (208, 272);
insert into USED_IN (medicineid, surgeryid)
values (353, 375);
insert into USED_IN (medicineid, surgeryid)
values (471, 129);
insert into USED_IN (medicineid, surgeryid)
values (285, 107);
insert into USED_IN (medicineid, surgeryid)
values (240, 262);
insert into USED_IN (medicineid, surgeryid)
values (294, 188);
insert into USED_IN (medicineid, surgeryid)
values (384, 55);
insert into USED_IN (medicineid, surgeryid)
values (263, 185);
insert into USED_IN (medicineid, surgeryid)
values (312, 307);
insert into USED_IN (medicineid, surgeryid)
values (397, 75);
insert into USED_IN (medicineid, surgeryid)
values (466, 224);
insert into USED_IN (medicineid, surgeryid)
values (28, 235);
insert into USED_IN (medicineid, surgeryid)
values (92, 220);
insert into USED_IN (medicineid, surgeryid)
values (187, 75);
insert into USED_IN (medicineid, surgeryid)
values (27, 126);
insert into USED_IN (medicineid, surgeryid)
values (31, 187);
insert into USED_IN (medicineid, surgeryid)
values (21, 149);
commit;
prompt 1594 records loaded
prompt Enabling foreign key constraints for SURGERY...
alter table SURGERY enable constraint SYS_C008760;
alter table SURGERY enable constraint SYS_C008761;
alter table SURGERY enable constraint SYS_C008762;
alter table SURGERY enable constraint SYS_C008763;
prompt Enabling foreign key constraints for USED_IN...
alter table USED_IN enable constraint SYS_C008772;
alter table USED_IN enable constraint SYS_C008773;
prompt Enabling triggers for DOCTOR...
alter table DOCTOR enable all triggers;
prompt Enabling triggers for MEDICINE...
alter table MEDICINE enable all triggers;
prompt Enabling triggers for NURSE...
alter table NURSE enable all triggers;
prompt Enabling triggers for PATIENT...
alter table PATIENT enable all triggers;
prompt Enabling triggers for SURGERY_ROOM...
alter table SURGERY_ROOM enable all triggers;
prompt Enabling triggers for SURGERY...
alter table SURGERY enable all triggers;
prompt Enabling triggers for USED_IN...
alter table USED_IN enable all triggers;

set feedback on
set define on
prompt Done
