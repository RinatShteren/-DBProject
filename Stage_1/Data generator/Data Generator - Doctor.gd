
[General]
Version=1

[Preferences]
Username=
Password=2586
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=RINATI
Name=DOCTOR
Count=200

[Record]
Name=D_ID
Type=NUMBER
Size=3
Data=Sequence(3)
Master=

[Record]
Name=d_name
Type=CHAR
Size=15
Data=FirstName +' ' + LastName
Master=

[Record]
Name=d_phone
Type=NUMBER
Size=3
Data=Sequence(700, [], [])
Master=

[Record]
Name=SPECIALLIZATION
Type=CHAR
Size=30
Data=List(
='Cardiology', 'Oncology', 'Gynecology', 'Pediatrics', 'Neurology',
='Orthopedics', 'Urology', 'Gastroenterology', 'Dermatology', 'Radiology',
='Psychiatry', 'Ophthalmology', 'Otolaryngology', 'Nephrology', 'Endocrinology',
='Hematology', 'Pulmonology', 'Rheumatology', 'Infectious Disease', 'Allergy and Immunology',
='General Surgery', 'Thoracic Surgery', 'Vascular Surgery', 'Neurosurgery', 'Plastic Surgery',
='Oral and Maxillofacial Surgery', 'Trauma Surgery', 'Transplant Surgery', 'Emergency Medicine', 'Anesthesiology',
='Intensive Care Medicine', 'Neonatology', 'Burn Medicine', 'Rehabilitation Medicine', 'Palliative Medicine',
='Nuclear Medicine', 'Pathology', 'Clinical Laboratory Medicine', 'Pharmacology', 'Nutrition and Dietetics',
='Occupational Medicine', 'Physical Medicine and Rehabilitation', 'Speech-Language Pathology', 'Social Medicine', 'Pain Medicine',
='Genetic Medicine', 'Family Medicine', 'Internal Medicine', 'Sports Medicine', 'Geriatric Medicine',
='Obstetrics', 'Hepatology', 'Neonatal-Perinatal Medicine', 'Medical Toxicology', 'Clinical Neurophysiology',
='Interventional Cardiology', 'Pediatric Cardiology', 'Pediatric Hematology-Oncology', 'Pediatric Endocrinology', 'Pediatric Gastroenterology',
='Pediatric Nephrology', 'Pediatric Pulmonology', 'Pediatric Rheumatology', 'Pediatric Infectious Disease', 'Pediatric Allergy and Immunology',
='Pediatric Neurology', 'Pediatric Surgery', 'Adolescent Medicine', 'Addiction Medicine', 'Aerospace Medicine',
='Critical Care Medicine', 'Hospice and Palliative Medicine', 'Sleep Medicine', 'Pain Medicine', 'Preventive Medicine',
='Public Health Medicine', 'Hyperbaric Medicine', 'Occupational and Environmental Medicine', 'Military Medicine', 'Legal Medicine',
='Radiation Oncology', 'Diagnostic Radiology', 'Interventional Radiology', 'Nuclear Radiology', 'Neuroradiology',
='Molecular Genetic Pathology', 'Cytopathology', 'Forensic Pathology', 'Clinical Pathology', 'Anatomic Pathology',
='Transfusion Medicine', 'Medical Microbiology', 'Chemical Pathology', 'Clinical Immunology', 'Clinical Pharmacology',
='Endocrine Surgery', 'Colorectal Surgery', 'Surgical Oncology', 'Pediatric Urology', 'Pediatric Orthopedics'
=)
Master=

