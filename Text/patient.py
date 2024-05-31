import pandas as pd
from faker import Faker

# Initialize Faker
fake = Faker()
# Define maximum lengths
max_length_address = 19
max_length_name = 20
# Unique Generated data
unique_person_ids = [200 + i for i in range(50)]
unique_phone_numbers = [fake.unique.random_number(digits=3, fix_len=True) for _ in range(50)]
unique_room_number = [800 + i for i in range(50)]
# Define possible statuses
statuses = ['released', 'deceased', 'under treatment']
# Generate 50 rows of random data for Patients
patients_data = [
    {   'P_ID': unique_person_ids[i],
        'status': fake.random.choice(statuses),
        'address': fake.street_address()[:max_length_address],
        'date_of_birth': fake.date_of_birth(minimum_age=10, maximum_age=80),
        'p_name': fake.name()[:max_length_name],
        'p_phone': unique_phone_numbers[i],
        'date_of_hospitalization': fake.date_between(start_date='-1y', end_date='today'),
        'date_of_release': fake.date_between(start_date='-1y', end_date='today') if fake.random.choice([True, False]) else None,
        'room_number': unique_room_number[i] }
    for i in range(50)
]
# Create the DataFrame
patients_df = pd.DataFrame(patients_data)
# Prepare the records without the INSERT INTO statement
records = []
for index, row in patients_df.iterrows():
    values = (
        row['P_ID'], row['status'], row['address'], row['date_of_birth'],
        row['p_name'], row['p_phone'], row['date_of_hospitalization'],
        f"{row['date_of_release']}" if row['date_of_release'] else "2099-01-01 ", row['room_number']
    )
    record = f"{values[0]}, {values[1]}, {values[2]}, {values[3]}, {values[4]}, {values[5]}, {values[6]}, {values[7]}, {values[8]} "
    records.append(record)
# Write the records to a file
with open('patients50.txt', 'w') as file:
    for record in records:
        file.write(record + '\n')
