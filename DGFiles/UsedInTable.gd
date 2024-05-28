
[General]
Version=1

[Preferences]
Username=
Password=2855
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=C##URIEL
Name=USED_IN
Count=800

[Record]
Name=MEDICINEID
Type=NUMBER
Size=
Data=List(select MEDICINEID from MEDICINE)
Master=

[Record]
Name=SURGERYID
Type=NUMBER
Size=
Data=List(select SURGERYID from SURGERY)
Master=

