CREATE TABLE Doctor
(
  D_ID INT ,
  d_name  VARCHAR(30) NOT NULL,
  d_phone INT NOT NULL,
  speciallization VARCHAR(30) NOT NULL,
  PRIMARY KEY (D_ID)
);

CREATE TABLE Medicinies
(
  qualitity_available_in_stock INT NOT NULL,
  M_ID INT NOT NULL,
  n_name VARCHAR(30)  NOT NULL,
  PRIMARY KEY (M_ID)
);

CREATE TABLE Department
(
  cuurent_num_of_patient INT NOT NULL,
  DEP_name VARCHAR(30)  NOT NULL,
  floor INT NOT NULL,
  DEP_ID INT NOT NULL,
  PRIMARY KEY (DEP_ID)
);

CREATE TABLE Room
(
  availability VARCHAR(30) NOT NULL,
  room_number INT NOT NULL,
  num_of_beds INT NOT NULL,
  DEP_ID INT ,
  PRIMARY KEY (room_number),
  FOREIGN KEY (DEP_ID) REFERENCES Department(DEP_ID)
);

CREATE TABLE Patient
(
  P_ID INT NOT NULL,
  status VARCHAR(30) NOT NULL,
  address  VARCHAR(20) NOT NULL,
  date_of_birth DATE NOT NULL,
  p_name VARCHAR(30)  NOT NULL,
  p_phone INT NOT NULL,
  date_of_hospitalization DATE NOT NULL,
  date_of_release DATE,
  room_number INT,
  PRIMARY KEY (P_ID),
  FOREIGN KEY (room_number) REFERENCES Room(room_number)
);

CREATE TABLE Visit
(
  V_ID INT NOT NULL,
  date_of_visit DATE NOT NULL,
  P_ID INT ,
  PRIMARY KEY (V_ID),
  FOREIGN KEY (P_ID) REFERENCES Patient(P_ID)
);

CREATE TABLE Medication_Visit
(
  V_ID INT NOT NULL,
  M_ID INT NOT NULL,
  PRIMARY KEY (V_ID, M_ID),
  FOREIGN KEY (V_ID) REFERENCES Visit(V_ID),
  FOREIGN KEY (M_ID) REFERENCES Medicinies(M_ID)
);

CREATE TABLE Doctor_Visit
(
  V_ID INT NOT NULL,
  D_ID INT NOT NULL,
  PRIMARY KEY (V_ID, D_ID),
  FOREIGN KEY (V_ID) REFERENCES Visit(V_ID),
  FOREIGN KEY (D_ID) REFERENCES Doctor(D_ID)
);
