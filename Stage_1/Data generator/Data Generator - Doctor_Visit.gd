
[General]
Version=1

[Preferences]
Username=
Password=2546
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=RINATI
Name=DOCTOR_VISIT
Count=200

[Record]
Name=V_ID
Type=NUMBER
Size=
Data=List(select v_id from visit)
Master=

[Record]
Name=D_ID
Type=NUMBER
Size=
Data=List(select D_id from doctor)
Master=

