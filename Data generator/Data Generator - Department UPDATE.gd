
[General]
Version=1

[Preferences]
Username=
Password=2812
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=RINATI
Name=DEPARTMENT
Count=20

[Record]
Name=CUURENT_NUM_OF_PATIENT
Type=NUMBER
Size=
Data=Random(0, 200)
Master=

[Record]
Name=DEP_NAME
Type=VARCHAR2
Size=30
Data=List('Cardiology', 'Neurology', 'Oncology', 'Orthopedics', 'Pediatrics','Gynecology', 'Urology', 'Dermatology', 'Gastroenterology', 'Ophthalmology','ENT', 'Nephrology', 'Endocrinology', 'Hematology', 'Rheumatology','Psychiatry', 'Pulmonology', 'Allergy', 'Infectious Diseases', 'Geriatrics', 'Emergency Medicine', 'Anesthesiology', 'Surgery', 'Radiology', 'Pathology', 'Rehabilitation', 'Palliative Care', 'Plastic Surgery', 'Neurosurgery', 'Vascular Surgery', 'Thoracic Surgery', 'General Surgery', 'Trauma Surgery', 'Transplant Surgery', 'Colorectal Surgery', 'Hepatology', 'Pain Management', 'Intensive Care Unit', 'Burn Unit', 'Neonatology', 'Obstetrics', 'Family Medicine', 'Internal Medicine', 'Sports Medicine', 'Occupational Therapy', 'Speech Therapy', 'Nutrition and Dietetics', 'Genetics', 'Clinical Laboratory', 'Pharmacy')
Master=

[Record]
Name=FLOOR
Type=NUMBER
Size=
Data=Random(0, 6)
Master=

[Record]
Name=DEP_ID
Type=NUMBER
Size=
Data=Sequence(1)
Master=

