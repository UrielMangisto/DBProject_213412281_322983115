
[General]
Version=1

[Preferences]
Username=
Password=2604
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=C##URIEL
Name=SURGERY
Count=400

[Record]
Name=SURGERYID
Type=NUMBER
Size=
Data=Sequence(Start, [Inc], [WithinParent])
Master=

[Record]
Name=SURGERYDATE
Type=DATE
Size=
Data=Random(01/01/2010, 01/12/2023)
Master=

[Record]
Name=SURGERYTYPE
Type=VARCHAR2
Size=30
Data=List('Short_surgery', 'Intermediate_surgerie', 'Long_surgery')
Master=

[Record]
Name=ROOMID
Type=NUMBER
Size=
Data=List(select RoomId from Surgery_Room)
Master=

[Record]
Name=PATIENTID
Type=NUMBER
Size=
Data=List(select PATIENTID from PATIENT)
Master=

[Record]
Name=DOCTORID
Type=NUMBER
Size=
Data=List(select DOCTORID from DOCTOR)
Master=

[Record]
Name=NURSEID
Type=NUMBER
Size=
Data=List(select NURSEID from NURSE)
Master=

