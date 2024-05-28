
[General]
Version=1

[Preferences]
Username=
Password=2769
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=C##URIEL
Name=NURSE
Count=400

[Record]
Name=NURSEID
Type=NUMBER
Size=
Data=Sequence(Start+1,[Inc],[WithinParent])
Master=

[Record]
Name=FIRSTNAME
Type=VARCHAR2
Size=30
Data=FirstName
Master=

[Record]
Name=LASTNAME
Type=VARCHAR2
Size=30
Data=LastName
Master=

[Record]
Name=STARTDATE
Type=DATE
Size=
Data=Random(01/01/2000, 01/01/2024)
Master=

