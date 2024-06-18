import csv
from datetime import datetime, timedelta

# יצירת רשימת מספרים בתחום 111 עד 999
numbers = list(range(111, 1000))

# יצירת רשימת תאריכים מ-1.1.2020 עד 1.1.2024
start_date = datetime(2020, 1, 1)
end_date = datetime(2024, 1, 1)
dates = [(start_date + timedelta(days=x)).strftime("%d/%m/%Y") for x in range((end_date - start_date).days)]

# שם הקובץ
csv_file = "numbers_and_dates.csv"

# כתיבת שתי הרשימות לקובץ CSV
with open(csv_file, 'w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(["Number", "Date"])
    for num, date in zip(numbers, dates):
        writer.writerow([num, date])

print(f"המספרים והתאריכים נכתבו בהצלחה לקובץ {csv_file}")
