
[General]
Version=1

[Preferences]
Username=
Password=2969
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=RINATI
Name=MEDICATION_VISIT
Count=200

[Record]
Name=V_ID
Type=NUMBER
Size=
Data=List(select V_ID from Visit)
Master=

[Record]
Name=M_ID
Type=NUMBER
Size=
Data=List(select m_id from Medicinies)
Master=

