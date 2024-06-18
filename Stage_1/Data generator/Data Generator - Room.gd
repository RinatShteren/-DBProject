
[General]
Version=1

[Preferences]
Username=
Password=2945
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=ROOM
Count=50

[Record]
Name=R_AVAILABILITY
Type=CHAR
Size=10
Data=List('Available', 'Occupied')
Master=

[Record]
Name=ROOM_NUMBER
Type=NUMBER
Size=3
Data=Sequence(800)
Master=

[Record]
Name=NUM_OF_BEDS
Type=NUMBER
Size=1
Data=Random(1, 5)
Master=

[Record]
Name=DEP_ID
Type=NUMBER
Size=7
Data=List(select DEP_ID from DEPARTMENT)
Master=

