
[General]
Version=1

[Preferences]
Username=
Password=2867
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=C##URIEL
Name=SURGERY_ROOM
Count=400

[Record]
Name=ROOMID
Type=NUMBER
Size=
Data=Sequence(Start+1,[Inc],[WithinParent])
Master=

[Record]
Name=LOCATION
Type=VARCHAR2
Size=30
Data=List('A','B','C','D','E','F','G','H','I')
Master=

[Record]
Name=ROOMTYPE
Type=VARCHAR2
Size=30
Data=List('General Operating', 'Emergency Operating', 'Laparoscopic Operating')
Master=

