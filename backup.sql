prompt PL/SQL Developer import file
prompt Created on יום שישי 31 מאי 2024 by USER
set feedback off
set define off
prompt Creating DEPARTMENT...
create table DEPARTMENT
(
  cuurent_num_of_patient INTEGER not null,
  dep_name               VARCHAR2(30) not null,
  floor                  INTEGER not null,
  dep_id                 INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DEPARTMENT
  add primary key (DEP_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating DOCTOR...
create table DOCTOR
(
  d_id            INTEGER not null,
  d_name          VARCHAR2(30) not null,
  d_phone         INTEGER not null,
  speciallization VARCHAR2(30) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DOCTOR
  add primary key (D_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating ROOM...
create table ROOM
(
  availability VARCHAR2(30) not null,
  room_number  INTEGER not null,
  num_of_beds  INTEGER not null,
  dep_id       INTEGER
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROOM
  add primary key (ROOM_NUMBER)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROOM
  add foreign key (DEP_ID)
  references DEPARTMENT (DEP_ID);

prompt Creating PATIENT...
create table PATIENT
(
  p_id                    INTEGER not null,
  status                  VARCHAR2(30) not null,
  address                 VARCHAR2(20) not null,
  date_of_birth           DATE not null,
  p_name                  VARCHAR2(30) not null,
  p_phone                 INTEGER not null,
  date_of_hospitalization DATE not null,
  date_of_release         DATE,
  room_number             INTEGER
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PATIENT
  add primary key (P_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PATIENT
  add foreign key (ROOM_NUMBER)
  references ROOM (ROOM_NUMBER);

prompt Creating VISIT...
create table VISIT
(
  v_id          INTEGER not null,
  date_of_visit DATE not null,
  p_id          INTEGER
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table VISIT
  add primary key (V_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table VISIT
  add foreign key (P_ID)
  references PATIENT (P_ID);

prompt Creating DOCTOR_VISIT...
create table DOCTOR_VISIT
(
  v_id INTEGER not null,
  d_id INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DOCTOR_VISIT
  add primary key (V_ID, D_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DOCTOR_VISIT
  add foreign key (V_ID)
  references VISIT (V_ID);
alter table DOCTOR_VISIT
  add foreign key (D_ID)
  references DOCTOR (D_ID);

prompt Creating MEDICINIES...
create table MEDICINIES
(
  qualitity_available_in_stock INTEGER not null,
  m_id                         INTEGER not null,
  n_name                       VARCHAR2(30) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MEDICINIES
  add primary key (M_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating MEDICATION_VISIT...
create table MEDICATION_VISIT
(
  v_id INTEGER not null,
  m_id INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MEDICATION_VISIT
  add primary key (V_ID, M_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MEDICATION_VISIT
  add foreign key (V_ID)
  references VISIT (V_ID);
alter table MEDICATION_VISIT
  add foreign key (M_ID)
  references MEDICINIES (M_ID);

prompt Disabling triggers for DEPARTMENT...
alter table DEPARTMENT disable all triggers;
prompt Disabling triggers for DOCTOR...
alter table DOCTOR disable all triggers;
prompt Disabling triggers for ROOM...
alter table ROOM disable all triggers;
prompt Disabling triggers for PATIENT...
alter table PATIENT disable all triggers;
prompt Disabling triggers for VISIT...
alter table VISIT disable all triggers;
prompt Disabling triggers for DOCTOR_VISIT...
alter table DOCTOR_VISIT disable all triggers;
prompt Disabling triggers for MEDICINIES...
alter table MEDICINIES disable all triggers;
prompt Disabling triggers for MEDICATION_VISIT...
alter table MEDICATION_VISIT disable all triggers;
prompt Disabling foreign key constraints for ROOM...
alter table ROOM disable constraint SYS_C008438;
prompt Disabling foreign key constraints for PATIENT...
alter table PATIENT disable constraint SYS_C008447;
prompt Disabling foreign key constraints for VISIT...
alter table VISIT disable constraint SYS_C008451;
prompt Disabling foreign key constraints for DOCTOR_VISIT...
alter table DOCTOR_VISIT disable constraint SYS_C008460;
alter table DOCTOR_VISIT disable constraint SYS_C008461;
prompt Disabling foreign key constraints for MEDICATION_VISIT...
alter table MEDICATION_VISIT disable constraint SYS_C008455;
alter table MEDICATION_VISIT disable constraint SYS_C008456;
prompt Deleting MEDICATION_VISIT...
delete from MEDICATION_VISIT;
commit;
prompt Deleting MEDICINIES...
delete from MEDICINIES;
commit;
prompt Deleting DOCTOR_VISIT...
delete from DOCTOR_VISIT;
commit;
prompt Deleting VISIT...
delete from VISIT;
commit;
prompt Deleting PATIENT...
delete from PATIENT;
commit;
prompt Deleting ROOM...
delete from ROOM;
commit;
prompt Deleting DOCTOR...
delete from DOCTOR;
commit;
prompt Deleting DEPARTMENT...
delete from DEPARTMENT;
commit;
prompt Loading DEPARTMENT...
insert into DEPARTMENT (cuurent_num_of_patient, dep_name, floor, dep_id)
values (89, 'Palliative Care', 3, 1);
insert into DEPARTMENT (cuurent_num_of_patient, dep_name, floor, dep_id)
values (103, 'Rheumatology', 4, 2);
insert into DEPARTMENT (cuurent_num_of_patient, dep_name, floor, dep_id)
values (66, 'Infectious Diseases', 0, 3);
insert into DEPARTMENT (cuurent_num_of_patient, dep_name, floor, dep_id)
values (10, 'Anesthesiology', 1, 4);
insert into DEPARTMENT (cuurent_num_of_patient, dep_name, floor, dep_id)
values (188, 'Geriatrics', 0, 5);
insert into DEPARTMENT (cuurent_num_of_patient, dep_name, floor, dep_id)
values (174, 'Plastic Surgery', 5, 6);
insert into DEPARTMENT (cuurent_num_of_patient, dep_name, floor, dep_id)
values (38, 'Burn Unit', 6, 7);
insert into DEPARTMENT (cuurent_num_of_patient, dep_name, floor, dep_id)
values (65, 'Hepatology', 2, 8);
insert into DEPARTMENT (cuurent_num_of_patient, dep_name, floor, dep_id)
values (96, 'General Surgery', 0, 9);
insert into DEPARTMENT (cuurent_num_of_patient, dep_name, floor, dep_id)
values (13, 'Clinical Laboratory', 5, 10);
insert into DEPARTMENT (cuurent_num_of_patient, dep_name, floor, dep_id)
values (61, 'Endocrinology', 2, 11);
insert into DEPARTMENT (cuurent_num_of_patient, dep_name, floor, dep_id)
values (119, 'Plastic Surgery', 5, 12);
insert into DEPARTMENT (cuurent_num_of_patient, dep_name, floor, dep_id)
values (181, 'Gastroenterology', 4, 13);
insert into DEPARTMENT (cuurent_num_of_patient, dep_name, floor, dep_id)
values (111, 'Palliative Care', 0, 14);
insert into DEPARTMENT (cuurent_num_of_patient, dep_name, floor, dep_id)
values (177, 'Ophthalmology', 3, 15);
insert into DEPARTMENT (cuurent_num_of_patient, dep_name, floor, dep_id)
values (54, 'Neonatology', 5, 16);
insert into DEPARTMENT (cuurent_num_of_patient, dep_name, floor, dep_id)
values (56, 'Internal Medicine', 0, 17);
insert into DEPARTMENT (cuurent_num_of_patient, dep_name, floor, dep_id)
values (24, 'Allergy', 4, 18);
insert into DEPARTMENT (cuurent_num_of_patient, dep_name, floor, dep_id)
values (27, 'ENT', 0, 19);
insert into DEPARTMENT (cuurent_num_of_patient, dep_name, floor, dep_id)
values (68, 'Allergy', 4, 20);
commit;
prompt 20 records loaded
prompt Loading DOCTOR...
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (3, 'Lin Stigers', 700, 'Colorectal Surgery');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (4, 'Bernard Brickel', 701, 'Pain Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (5, 'Carolyn Boothe', 702, 'Clinical Pharmacology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (6, 'Kate MacPherson', 703, 'Occupational Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (7, 'Pat Biehn', 704, 'Orthopedics');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (8, 'Rick Coburn', 705, 'Nuclear Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (9, 'Gates Paltrow', 706, 'Rheumatology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (10, 'Anita Cheadle', 707, 'Interventional Radiology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (11, 'Lenny Hong', 708, 'Family Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (12, 'Andrea Kirshner', 709, 'Oncology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (13, 'Bebe Blaine', 710, 'Pain Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (14, 'Franz Bridges', 711, 'Sports Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (15, 'Jann Harry', 712, 'Pediatric Endocrinology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (16, 'Wallace Ceasar', 713, 'Rheumatology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (17, 'Sally Mahoney', 714, 'Hospice and Palliative Medicin');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (18, 'Rhea Gough', 715, 'Pediatric Cardiology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (19, 'Davey Askew', 716, 'Speech-Language Pathology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (20, 'Embeth Rosas', 717, 'Pediatrics');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (21, 'Sal Shand', 718, 'Burn Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (22, 'Ryan Ermey', 719, 'Speech-Language Pathology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (23, 'Carolyn Voight', 720, 'Allergy and Immunology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (24, 'Grant Miles', 721, 'Medical Toxicology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (25, 'Gary Broza', 722, 'Emergency Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (26, 'Shirley Fariq', 723, 'Speech-Language Pathology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (27, 'Mark Postlethwa', 724, 'Aerospace Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (28, 'Mike DiFranco', 725, 'General Surgery');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (29, 'Raul Conroy', 726, 'Neuroradiology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (30, 'Dick McGovern', 727, 'Clinical Pathology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (31, 'Lauren Levy', 728, 'Infectious Disease');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (32, 'Gabrielle Salt', 729, 'Pediatric Gastroenterology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (33, 'Demi Loveless', 730, 'Cytopathology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (34, 'Mindy Chesnutt', 731, 'Gynecology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (35, 'Mary Briscoe', 732, 'Pain Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (36, 'Christmas Colli', 733, 'Pediatric Gastroenterology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (37, 'Marisa Close', 734, 'Nuclear Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (38, 'Spencer DeVito', 735, 'Transplant Surgery');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (39, 'Julianne Agluka', 736, 'Rheumatology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (40, 'Stephanie Moore', 737, 'Public Health Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (41, 'Terry Rispoli', 738, 'Infectious Disease');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (42, 'Saul Ifans', 739, 'Genetic Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (43, 'Winona Sawa', 740, 'Allergy and Immunology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (44, 'Oded Sampson', 741, 'Pediatric Pulmonology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (45, 'Jesse James', 742, 'Forensic Pathology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (46, 'Roscoe Tomei', 743, 'Internal Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (47, 'Judi Hershey', 744, 'General Surgery');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (48, 'Debby Wilkinson', 745, 'Pediatric Pulmonology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (49, 'Maureen Balaban', 746, 'Oncology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (50, 'Saul Dafoe', 747, 'Preventive Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (51, 'Edgar Adkins', 748, 'Pediatric Orthopedics');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (52, 'Quentin El-Sahe', 749, 'Forensic Pathology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (53, 'Buddy Pearce', 750, 'Pediatric Pulmonology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (54, 'Quentin Bratt', 751, 'Nutrition and Dietetics');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (55, 'Janeane Conditi', 752, 'Nuclear Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (56, 'Simon Tisdale', 753, 'Transplant Surgery');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (57, 'Treat Holmes', 754, 'Hepatology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (58, 'Manu Wahlberg', 755, 'Pediatric Urology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (59, 'Oded Bonneville', 756, 'Neurology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (60, 'Miles Reno', 757, 'Nuclear Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (61, 'Ellen Oates', 758, 'Pediatric Rheumatology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (62, 'Carrie-Anne Vai', 759, 'Anesthesiology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (63, 'Frank Stanton', 760, 'Pediatric Orthopedics');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (64, 'Roger Wright', 761, 'Pediatric Urology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (65, 'Sal Blair', 762, 'Pediatric Infectious Disease');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (66, 'Millie Thornton', 763, 'Nuclear Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (67, 'Heather Peterso', 764, 'Genetic Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (68, 'Ty Hornsby', 765, 'Surgical Oncology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (69, 'Ahmad Clark', 766, 'Geriatric Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (70, 'Meg Nivola', 767, 'Clinical Pharmacology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (71, 'Anthony Berkley', 768, 'Clinical Neurophysiology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (72, 'Gina Pfeiffer', 769, 'Pediatric Urology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (73, 'Geraldine Green', 770, 'Pediatric Neurology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (74, 'Lee Capshaw', 771, 'Clinical Pharmacology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (75, 'Bo Condition', 772, 'Pharmacology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (76, 'Gates Prowse', 773, 'Pharmacology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (77, 'Sydney Sampson', 774, 'Ophthalmology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (78, 'Ani McDiarmid', 775, 'Pediatric Nephrology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (79, 'Etta Peniston', 776, 'Interventional Radiology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (80, 'Ramsey Sisto', 777, 'Molecular Genetic Pathology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (81, 'Mike Raye', 778, 'Pediatric Rheumatology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (82, 'Julio Ward', 779, 'Pathology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (83, 'Martha Carradin', 780, 'Clinical Laboratory Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (84, 'Lari Marshall', 781, 'Nephrology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (85, 'Rose Loring', 782, 'Obstetrics');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (86, 'Earl Peebles', 783, 'Interventional Radiology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (87, 'Gordie Madonna', 784, 'Medical Microbiology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (88, 'Suzanne Bogguss', 785, 'Endocrine Surgery');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (89, 'Wade Lawrence', 786, 'Gastroenterology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (90, 'Jerry Branagh', 787, 'Infectious Disease');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (91, 'Timothy Lang', 788, 'Emergency Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (92, 'Alfie Mewes', 789, 'Ophthalmology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (93, 'Corey Brando', 790, 'Adolescent Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (94, 'Roger Payne', 791, 'Pediatric Orthopedics');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (95, 'Darius DiBiasio', 792, 'Addiction Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (96, 'Gloria Larter', 793, 'Pathology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (97, 'Norm Favreau', 794, 'Pediatric Gastroenterology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (98, 'Hazel Epps', 795, 'General Surgery');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (99, 'Glen Sawa', 796, 'Military Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (100, 'Gina Mitra', 797, 'Palliative Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (101, 'Radney Bragg', 798, 'Pediatric Endocrinology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (102, 'Kyra Rebhorn', 799, 'Legal Medicine');
commit;
prompt 100 records committed...
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (103, 'Junior Gertner', 800, 'Preventive Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (104, 'Ozzy Duke', 801, 'Pediatric Orthopedics');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (105, 'Jimmy Jane', 802, 'Pediatric Rheumatology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (106, 'Vondie Lipnicki', 803, 'Obstetrics');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (107, 'Vickie Salt', 804, 'Family Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (108, 'Lennie Tempest', 805, 'Cardiology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (109, 'Bret Bright', 806, 'Rheumatology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (110, 'Meredith Platt', 807, 'Nutrition and Dietetics');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (111, 'Miles Wayans', 808, 'Dermatology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (112, 'Julio Dupree', 809, 'Hematology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (113, 'Fats Coltrane', 810, 'Allergy and Immunology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (114, 'Lari Shaw', 811, 'Burn Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (115, 'Tzi Gibson', 812, 'Nuclear Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (116, 'Davey Randal', 813, 'Forensic Pathology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (117, 'Josh Holly', 814, 'Physical Medicine and Rehabili');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (118, 'Bo Union', 815, 'Obstetrics');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (119, 'Brendan Levy', 816, 'Neurosurgery');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (120, 'Radney Vicious', 817, 'Plastic Surgery');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (121, 'Tia Lennix', 818, 'Nuclear Radiology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (122, 'Frances Mac', 819, 'Hyperbaric Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (123, 'Belinda Plowrig', 820, 'General Surgery');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (124, 'Gil Zahn', 821, 'Neurology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (125, 'Jesse Rapaport', 822, 'Social Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (126, 'Davy McKellen', 823, 'Infectious Disease');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (127, 'Helen Weaving', 824, 'Medical Microbiology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (128, 'Scarlett Baldwi', 825, 'Colorectal Surgery');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (129, 'Carlos Busey', 826, 'Pain Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (130, 'Wayman Forster', 827, 'Oral and Maxillofacial Surgery');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (131, 'Chad Berry', 828, 'Hematology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (132, 'Candice O''Neal', 829, 'Forensic Pathology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (133, 'Sylvester MacIs', 830, 'Preventive Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (134, 'Rita Ramirez', 831, 'Interventional Cardiology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (135, 'Lindsey Carlton', 832, 'Pathology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (136, 'Mili Mann', 833, 'Aerospace Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (137, 'Talvin Sinatra', 834, 'Transplant Surgery');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (138, 'Mika Kidman', 835, 'Transfusion Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (139, 'Meg Guilfoyle', 836, 'Radiology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (140, 'Javon Madonna', 837, 'Nutrition and Dietetics');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (141, 'Pat Henriksen', 838, 'Genetic Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (142, 'Emma Monk', 839, 'Vascular Surgery');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (143, 'Lee McGregor', 840, 'Rheumatology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (144, 'Sharon Oldman', 841, 'General Surgery');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (145, 'Colm Cobbs', 842, 'Cardiology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (146, 'Alex Busey', 843, 'Pediatric Pulmonology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (147, 'Fiona Lloyd', 844, 'Geriatric Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (148, 'Dabney Apple', 845, 'Anatomic Pathology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (149, 'Azucar Williams', 846, 'Pediatric Surgery');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (150, 'Jared Tambor', 847, 'Pediatric Endocrinology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (151, 'Jessica Popper', 848, 'Pediatric Surgery');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (152, 'Tanya Parm', 849, 'Occupational and Environmental');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (153, 'Barbara Holbroo', 850, 'Radiation Oncology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (154, 'Sam O''Donnell', 851, 'Pediatrics');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (155, 'Sarah Tolkan', 852, 'Forensic Pathology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (156, 'Lindsay Rebhorn', 853, 'Transfusion Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (157, 'Wayne Weaver', 854, 'Occupational and Environmental');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (158, 'Daryle Cazale', 855, 'Medical Microbiology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (159, 'Bruce Arkin', 856, 'Cytopathology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (160, 'Rolando Daniels', 857, 'Internal Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (161, 'Lindsey Rossell', 858, 'Medical Toxicology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (162, 'Sean Armstrong', 859, 'Transplant Surgery');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (163, 'Phoebe Broza', 860, 'Preventive Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (164, 'Sandra Miles', 861, 'Family Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (165, 'Teena Presley', 862, 'Surgical Oncology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (166, 'Brian Buscemi', 863, 'Emergency Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (167, 'Mia Tyler', 864, 'Pediatrics');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (168, 'Sander Dillane', 865, 'Medical Microbiology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (169, 'Bobbi Cole', 866, 'Clinical Immunology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (170, 'Sarah Flemyng', 867, 'Geriatric Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (171, 'Alice Berkoff', 868, 'Neurosurgery');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (172, 'First McLean', 869, 'Adolescent Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (173, 'Katrin Solido', 870, 'Public Health Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (174, 'Leo Irving', 871, 'Transplant Surgery');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (175, 'Ashton Quatro', 872, 'Public Health Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (176, 'Taryn Gershon', 873, 'Rheumatology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (177, 'Diane Stevenson', 874, 'Colorectal Surgery');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (178, 'Chet Brooke', 875, 'Intensive Care Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (179, 'Busta Lithgow', 876, 'Otolaryngology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (180, 'Peter Rooker', 877, 'Pediatric Neurology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (181, 'Brooke Hopkins', 878, 'Genetic Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (182, 'Tom Webb', 879, 'Hepatology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (183, 'Sander Aaron', 880, 'Pediatric Hematology-Oncology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (184, 'Rip Tomlin', 881, 'Otolaryngology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (185, 'Jean-Claude Alm', 882, 'Ophthalmology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (186, 'Hugo Emmett', 883, 'Transfusion Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (187, 'Stellan Pullman', 884, 'Pediatric Rheumatology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (188, 'Wang Furay', 885, 'Pediatric Surgery');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (189, 'Rachael Clayton', 886, 'Chemical Pathology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (190, 'Martha Madonna', 887, 'Oncology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (191, 'Rip Charles', 888, 'Vascular Surgery');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (192, 'Franz Love', 889, 'Gynecology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (193, 'Shawn Stanton', 890, 'Molecular Genetic Pathology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (194, 'Lou Jolie', 891, 'Otolaryngology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (195, 'Lionel Kinski', 892, 'Neonatal-Perinatal Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (196, 'Val Noseworthy', 893, 'Pediatric Surgery');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (197, 'Rupert Gray', 894, 'Allergy and Immunology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (198, 'Leonardo Moody', 895, 'Palliative Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (199, 'Peabo Hornsby', 896, 'Pharmacology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (200, 'Bebe Goodman', 897, 'Geriatric Medicine');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (201, 'Cliff Torino', 898, 'Urology');
insert into DOCTOR (d_id, d_name, d_phone, speciallization)
values (202, 'Kasey Thornton', 899, 'Vascular Surgery');
commit;
prompt 200 records loaded
prompt Loading ROOM...
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Occupied', 800, 3, 9);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Occupied', 801, 4, 6);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Available', 802, 2, 15);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Occupied', 803, 1, 4);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Available', 804, 2, 14);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Available', 805, 4, 11);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Occupied', 806, 5, 7);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Available', 807, 1, 10);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Occupied', 808, 2, 5);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Occupied', 809, 1, 8);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Occupied', 810, 1, 19);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Available', 811, 2, 15);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Available', 812, 5, 10);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Available', 813, 5, 12);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Available', 814, 2, 10);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Occupied', 815, 3, 16);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Occupied', 816, 1, 13);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Occupied', 817, 1, 9);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Occupied', 818, 4, 2);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Occupied', 819, 4, 18);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Occupied', 820, 2, 2);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Available', 821, 5, 14);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Available', 822, 4, 18);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Occupied', 823, 4, 15);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Available', 824, 5, 14);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Available', 825, 4, 10);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Available', 826, 3, 10);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Occupied', 827, 2, 7);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Available', 828, 2, 6);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Available', 829, 2, 9);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Occupied', 830, 3, 20);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Available', 831, 4, 10);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Occupied', 832, 1, 7);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Occupied', 833, 1, 4);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Available', 834, 3, 3);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Occupied', 835, 1, 6);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Available', 836, 2, 14);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Occupied', 837, 1, 12);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Occupied', 838, 5, 10);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Available', 839, 3, 15);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Occupied', 840, 4, 6);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Available', 841, 5, 4);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Available', 842, 2, 5);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Occupied', 843, 5, 9);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Occupied', 844, 1, 11);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Occupied', 845, 4, 11);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Occupied', 846, 5, 9);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Available', 847, 4, 20);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Occupied', 848, 1, 2);
insert into ROOM (availability, room_number, num_of_beds, dep_id)
values ('Available', 849, 3, 10);
commit;
prompt 50 records loaded
prompt Loading PATIENT...
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (235, ' under treatment', ' 04884 Laura Springs', to_date('04-07-1972', 'dd-mm-yyyy'), ' Kimberly Bowen', 250, to_date('28-01-2024', 'dd-mm-yyyy'), to_date('07-12-2023', 'dd-mm-yyyy'), 802);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (236, ' released', ' 5667 Joshua Traffic', to_date('09-07-2002', 'dd-mm-yyyy'), ' Shelly Barrett', 846, to_date('05-02-2024', 'dd-mm-yyyy'), to_date('12-03-2024', 'dd-mm-yyyy'), 813);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (237, ' under treatment', ' 931 Chung Burg', to_date('22-04-1982', 'dd-mm-yyyy'), ' Marc Torres', 180, to_date('07-02-2024', 'dd-mm-yyyy'), to_date('11-07-2023', 'dd-mm-yyyy'), 846);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (238, ' deceased', ' 03453 Snow Forest A', to_date('08-10-2013', 'dd-mm-yyyy'), ' Linda Clark', 667, to_date('27-05-2024', 'dd-mm-yyyy'), to_date('01-01-2099', 'dd-mm-yyyy'), 805);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (239, ' deceased', ' 99760 Jeff Port', to_date('18-02-1959', 'dd-mm-yyyy'), ' Brittany Olson', 615, to_date('25-04-2024', 'dd-mm-yyyy'), to_date('01-01-2099', 'dd-mm-yyyy'), 830);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (241, ' released', ' 53975 Skinner Hollo', to_date('08-04-1993', 'dd-mm-yyyy'), ' Jose Davis', 791, to_date('11-06-2023', 'dd-mm-yyyy'), to_date('01-01-2099', 'dd-mm-yyyy'), 801);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (242, ' released', ' 615 Laura Ford Apt.', to_date('10-09-1962', 'dd-mm-yyyy'), ' Karen Mcknight', 670, to_date('09-12-2023', 'dd-mm-yyyy'), to_date('21-08-2023', 'dd-mm-yyyy'), 816);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (243, ' under treatment', ' 173 Walter Corner', to_date('30-04-1952', 'dd-mm-yyyy'), ' Lisa Neal', 203, to_date('28-06-2023', 'dd-mm-yyyy'), to_date('07-08-2023', 'dd-mm-yyyy'), 847);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (244, ' released', ' 951 Charles Haven A', to_date('02-07-1966', 'dd-mm-yyyy'), ' Michelle Stewart', 809, to_date('26-04-2024', 'dd-mm-yyyy'), to_date('01-01-2099', 'dd-mm-yyyy'), 848);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (245, ' released', ' 39993 Mason Squares', to_date('14-05-1944', 'dd-mm-yyyy'), ' Crystal Wise', 645, to_date('02-09-2023', 'dd-mm-yyyy'), to_date('01-01-2099', 'dd-mm-yyyy'), 801);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (246, ' deceased', ' 29244 Catherine Jun', to_date('18-03-1950', 'dd-mm-yyyy'), ' Julie Brown', 449, to_date('17-07-2023', 'dd-mm-yyyy'), to_date('01-01-2099', 'dd-mm-yyyy'), 810);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (247, ' released', ' 809 Tiffany Lodge', to_date('24-07-1951', 'dd-mm-yyyy'), ' Shelby Carter', 671, to_date('26-03-2024', 'dd-mm-yyyy'), to_date('01-01-2099', 'dd-mm-yyyy'), 824);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (248, ' under treatment', ' 6796 Hoover Meadow', to_date('21-02-1982', 'dd-mm-yyyy'), ' Kathryn Simon', 961, to_date('15-04-2024', 'dd-mm-yyyy'), to_date('24-11-2023', 'dd-mm-yyyy'), 816);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (249, ' released', ' 941 Jessica Rest', to_date('18-03-1947', 'dd-mm-yyyy'), ' Ryan Martinez Jr.', 847, to_date('16-08-2023', 'dd-mm-yyyy'), to_date('24-09-2023', 'dd-mm-yyyy'), 842);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (250, ' released', ' 38684 Patel Shoals', to_date('27-09-1956', 'dd-mm-yyyy'), ' Austin Gates', 896, to_date('16-03-2024', 'dd-mm-yyyy'), to_date('31-01-2024', 'dd-mm-yyyy'), 802);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (200, ' under treatment', ' 1421 Catherine Vall', to_date('28-08-1944', 'dd-mm-yyyy'), ' Jessica Anthony', 487, to_date('23-02-2024', 'dd-mm-yyyy'), to_date('05-12-2023', 'dd-mm-yyyy'), 848);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (201, ' under treatment', ' 8839 Timothy Viaduc', to_date('18-11-1989', 'dd-mm-yyyy'), ' Mary Smith', 392, to_date('01-06-2023', 'dd-mm-yyyy'), to_date('29-10-2023', 'dd-mm-yyyy'), 811);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (202, ' released', ' 514 Rich Glens Suit', to_date('01-08-1974', 'dd-mm-yyyy'), ' Robert Matthews Jr.', 530, to_date('04-09-2023', 'dd-mm-yyyy'), to_date('01-01-2099', 'dd-mm-yyyy'), 822);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (203, ' deceased', ' 614 Nicole Branch', to_date('21-12-1984', 'dd-mm-yyyy'), ' Catherine Fletcher', 171, to_date('15-12-2023', 'dd-mm-yyyy'), to_date('01-01-2099', 'dd-mm-yyyy'), 822);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (204, ' released', ' 6184 Moore Mews Apt', to_date('30-11-2008', 'dd-mm-yyyy'), ' Catherine King', 687, to_date('23-03-2024', 'dd-mm-yyyy'), to_date('01-01-2099', 'dd-mm-yyyy'), 821);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (205, ' released', ' 3678 Michael Mounta', to_date('26-03-1999', 'dd-mm-yyyy'), ' Jaclyn Gonzales', 320, to_date('01-02-2024', 'dd-mm-yyyy'), to_date('01-01-2099', 'dd-mm-yyyy'), 801);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (207, ' released', ' 5054 Kyle Ville', to_date('25-05-2014', 'dd-mm-yyyy'), ' Laura Church', 675, to_date('14-07-2023', 'dd-mm-yyyy'), to_date('28-11-2023', 'dd-mm-yyyy'), 815);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (208, ' under treatment', ' 4445 Webb Heights A', to_date('11-06-1970', 'dd-mm-yyyy'), ' Alexander Mathews', 243, to_date('17-12-2023', 'dd-mm-yyyy'), to_date('04-01-2024', 'dd-mm-yyyy'), 820);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (209, ' released', ' 063 Lopez Garden Su', to_date('19-04-2010', 'dd-mm-yyyy'), ' Jessica Curtis', 749, to_date('29-04-2024', 'dd-mm-yyyy'), to_date('28-01-2024', 'dd-mm-yyyy'), 831);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (210, ' deceased', ' 90894 Nicole Shore ', to_date('30-06-1990', 'dd-mm-yyyy'), ' William Gill', 451, to_date('24-05-2024', 'dd-mm-yyyy'), to_date('01-01-2099', 'dd-mm-yyyy'), 808);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (211, ' under treatment', ' 887 Kennedy Square ', to_date('26-07-1991', 'dd-mm-yyyy'), ' Crystal Hodge', 665, to_date('21-06-2023', 'dd-mm-yyyy'), to_date('01-01-2099', 'dd-mm-yyyy'), 843);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (212, ' deceased', ' 8116 Lawrence Fall', to_date('06-11-1979', 'dd-mm-yyyy'), ' Adam Ramos', 617, to_date('22-03-2024', 'dd-mm-yyyy'), to_date('27-06-2023', 'dd-mm-yyyy'), 831);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (213, ' deceased', ' 0351 Gordon Harbor ', to_date('02-08-1980', 'dd-mm-yyyy'), ' Joseph Porter', 145, to_date('29-05-2024', 'dd-mm-yyyy'), to_date('03-01-2024', 'dd-mm-yyyy'), 845);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (214, ' deceased', ' 3338 Cynthia Road', to_date('15-10-1947', 'dd-mm-yyyy'), ' Dean Conner', 761, to_date('16-01-2024', 'dd-mm-yyyy'), to_date('01-01-2099', 'dd-mm-yyyy'), 821);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (215, ' deceased', ' 5890 Russell Drive ', to_date('14-02-1963', 'dd-mm-yyyy'), ' Brett Weiss', 259, to_date('20-01-2024', 'dd-mm-yyyy'), to_date('01-01-2099', 'dd-mm-yyyy'), 805);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (216, ' released', ' 206 Romero Isle', to_date('14-04-1985', 'dd-mm-yyyy'), ' Brooke Pennington', 932, to_date('06-07-2023', 'dd-mm-yyyy'), to_date('08-05-2024', 'dd-mm-yyyy'), 815);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (217, ' released', ' 072 Norman Springs', to_date('26-05-2006', 'dd-mm-yyyy'), ' Mrs. Katie Wheeler', 480, to_date('14-01-2024', 'dd-mm-yyyy'), to_date('23-07-2023', 'dd-mm-yyyy'), 846);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (218, ' deceased', ' 90270 Ford Crest', to_date('14-05-2005', 'dd-mm-yyyy'), ' Troy Kim', 534, to_date('01-02-2024', 'dd-mm-yyyy'), to_date('29-09-2023', 'dd-mm-yyyy'), 841);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (219, ' deceased', ' 79545 Miles Springs', to_date('21-10-1957', 'dd-mm-yyyy'), ' Donna Johnson', 994, to_date('16-02-2024', 'dd-mm-yyyy'), to_date('12-10-2023', 'dd-mm-yyyy'), 827);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (220, ' released', ' 07444 Jones River', to_date('31-05-2005', 'dd-mm-yyyy'), ' James Wheeler', 637, to_date('21-02-2024', 'dd-mm-yyyy'), to_date('01-01-2099', 'dd-mm-yyyy'), 849);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (221, ' released', ' 8700 Chelsea Pines ', to_date('30-09-1954', 'dd-mm-yyyy'), ' Erica Haney', 822, to_date('20-09-2023', 'dd-mm-yyyy'), to_date('01-01-2099', 'dd-mm-yyyy'), 843);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (222, ' released', ' 76692 Garcia Prairi', to_date('21-11-2013', 'dd-mm-yyyy'), ' Tara Huber', 555, to_date('28-12-2023', 'dd-mm-yyyy'), to_date('01-01-2099', 'dd-mm-yyyy'), 838);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (223, ' released', ' 8823 Graves Ville S', to_date('26-07-1998', 'dd-mm-yyyy'), ' Jennifer Barnes', 985, to_date('01-07-2023', 'dd-mm-yyyy'), to_date('01-01-2099', 'dd-mm-yyyy'), 806);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (224, ' deceased', ' 7804 Spencer Mills ', to_date('30-09-1975', 'dd-mm-yyyy'), ' Jeffrey Rivera', 531, to_date('14-12-2023', 'dd-mm-yyyy'), to_date('01-01-2099', 'dd-mm-yyyy'), 805);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (225, ' released', ' 1694 Amanda Pike', to_date('22-11-1982', 'dd-mm-yyyy'), ' Jay Ellison', 804, to_date('07-09-2023', 'dd-mm-yyyy'), to_date('01-01-2099', 'dd-mm-yyyy'), 831);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (226, ' deceased', ' 37727 Shannon Roads', to_date('23-12-1946', 'dd-mm-yyyy'), ' Jordan Black', 538, to_date('01-04-2024', 'dd-mm-yyyy'), to_date('01-01-2099', 'dd-mm-yyyy'), 836);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (227, ' deceased', ' 948 Smith Roads', to_date('23-01-1983', 'dd-mm-yyyy'), ' Courtney Martin', 813, to_date('28-04-2024', 'dd-mm-yyyy'), to_date('01-01-2099', 'dd-mm-yyyy'), 849);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (228, ' deceased', ' 46485 Bowers Island', to_date('07-09-1974', 'dd-mm-yyyy'), ' Curtis Anderson', 462, to_date('13-08-2023', 'dd-mm-yyyy'), to_date('27-12-2023', 'dd-mm-yyyy'), 839);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (229, ' released', ' 4028 Jason Shore Su', to_date('06-03-1975', 'dd-mm-yyyy'), ' Jennifer Jones', 639, to_date('06-06-2023', 'dd-mm-yyyy'), to_date('01-01-2099', 'dd-mm-yyyy'), 834);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (230, ' deceased', ' 36860 Thomas Shores', to_date('11-06-1962', 'dd-mm-yyyy'), ' Barbara Oneal', 908, to_date('31-10-2023', 'dd-mm-yyyy'), to_date('12-10-2023', 'dd-mm-yyyy'), 812);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (231, ' deceased', ' 792 Scott Cape Suit', to_date('16-07-2005', 'dd-mm-yyyy'), ' Shannon Hancock', 956, to_date('15-01-2024', 'dd-mm-yyyy'), to_date('08-06-2023', 'dd-mm-yyyy'), 839);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (232, ' under treatment', ' 810 Myers Mill', to_date('06-09-1984', 'dd-mm-yyyy'), ' Jillian Russell', 752, to_date('13-07-2023', 'dd-mm-yyyy'), to_date('01-01-2099', 'dd-mm-yyyy'), 814);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (233, ' deceased', ' 973 Kayla Pass', to_date('09-01-1970', 'dd-mm-yyyy'), ' Ashley Hansen', 227, to_date('30-10-2023', 'dd-mm-yyyy'), to_date('02-10-2023', 'dd-mm-yyyy'), 808);
insert into PATIENT (p_id, status, address, date_of_birth, p_name, p_phone, date_of_hospitalization, date_of_release, room_number)
values (234, ' deceased', ' 61591 William Estat', to_date('12-08-1969', 'dd-mm-yyyy'), ' Carl Beasley', 556, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('02-04-2024', 'dd-mm-yyyy'), 846);
commit;
prompt 49 records loaded
prompt Loading VISIT...
insert into VISIT (v_id, date_of_visit, p_id)
values (100, to_date('26-07-2001', 'dd-mm-yyyy'), 221);
insert into VISIT (v_id, date_of_visit, p_id)
values (101, to_date('02-04-2016', 'dd-mm-yyyy'), 221);
insert into VISIT (v_id, date_of_visit, p_id)
values (102, to_date('21-02-2004', 'dd-mm-yyyy'), 213);
insert into VISIT (v_id, date_of_visit, p_id)
values (103, to_date('15-08-2002', 'dd-mm-yyyy'), 202);
insert into VISIT (v_id, date_of_visit, p_id)
values (104, to_date('12-09-2019', 'dd-mm-yyyy'), 235);
insert into VISIT (v_id, date_of_visit, p_id)
values (105, to_date('12-03-2011', 'dd-mm-yyyy'), 217);
insert into VISIT (v_id, date_of_visit, p_id)
values (106, to_date('16-02-2001', 'dd-mm-yyyy'), 200);
insert into VISIT (v_id, date_of_visit, p_id)
values (107, to_date('27-01-2001', 'dd-mm-yyyy'), 250);
insert into VISIT (v_id, date_of_visit, p_id)
values (108, to_date('20-05-2021', 'dd-mm-yyyy'), 204);
insert into VISIT (v_id, date_of_visit, p_id)
values (109, to_date('14-07-2009', 'dd-mm-yyyy'), 215);
insert into VISIT (v_id, date_of_visit, p_id)
values (110, to_date('21-05-2006', 'dd-mm-yyyy'), 235);
insert into VISIT (v_id, date_of_visit, p_id)
values (111, to_date('01-03-1998', 'dd-mm-yyyy'), 227);
insert into VISIT (v_id, date_of_visit, p_id)
values (112, to_date('08-05-1998', 'dd-mm-yyyy'), 244);
insert into VISIT (v_id, date_of_visit, p_id)
values (113, to_date('17-09-2005', 'dd-mm-yyyy'), 241);
insert into VISIT (v_id, date_of_visit, p_id)
values (114, to_date('19-07-1994', 'dd-mm-yyyy'), 247);
insert into VISIT (v_id, date_of_visit, p_id)
values (115, to_date('18-09-2022', 'dd-mm-yyyy'), 232);
insert into VISIT (v_id, date_of_visit, p_id)
values (116, to_date('28-10-2004', 'dd-mm-yyyy'), 227);
insert into VISIT (v_id, date_of_visit, p_id)
values (117, to_date('04-07-1997', 'dd-mm-yyyy'), 210);
insert into VISIT (v_id, date_of_visit, p_id)
values (118, to_date('08-10-1993', 'dd-mm-yyyy'), 250);
insert into VISIT (v_id, date_of_visit, p_id)
values (119, to_date('22-09-2017', 'dd-mm-yyyy'), 200);
insert into VISIT (v_id, date_of_visit, p_id)
values (120, to_date('20-10-1993', 'dd-mm-yyyy'), 224);
insert into VISIT (v_id, date_of_visit, p_id)
values (121, to_date('15-11-2005', 'dd-mm-yyyy'), 225);
insert into VISIT (v_id, date_of_visit, p_id)
values (122, to_date('10-02-2004', 'dd-mm-yyyy'), 246);
insert into VISIT (v_id, date_of_visit, p_id)
values (123, to_date('19-01-2010', 'dd-mm-yyyy'), 247);
insert into VISIT (v_id, date_of_visit, p_id)
values (124, to_date('20-09-2012', 'dd-mm-yyyy'), 242);
insert into VISIT (v_id, date_of_visit, p_id)
values (125, to_date('12-06-2003', 'dd-mm-yyyy'), 250);
insert into VISIT (v_id, date_of_visit, p_id)
values (126, to_date('20-07-2011', 'dd-mm-yyyy'), 218);
insert into VISIT (v_id, date_of_visit, p_id)
values (127, to_date('06-09-2018', 'dd-mm-yyyy'), 244);
insert into VISIT (v_id, date_of_visit, p_id)
values (128, to_date('24-10-2018', 'dd-mm-yyyy'), 210);
insert into VISIT (v_id, date_of_visit, p_id)
values (129, to_date('13-08-2023', 'dd-mm-yyyy'), 207);
commit;
prompt 30 records loaded
prompt Loading DOCTOR_VISIT...
insert into DOCTOR_VISIT (v_id, d_id)
values (109, 91);
insert into DOCTOR_VISIT (v_id, d_id)
values (108, 54);
insert into DOCTOR_VISIT (v_id, d_id)
values (126, 111);
insert into DOCTOR_VISIT (v_id, d_id)
values (114, 188);
insert into DOCTOR_VISIT (v_id, d_id)
values (123, 176);
insert into DOCTOR_VISIT (v_id, d_id)
values (119, 38);
insert into DOCTOR_VISIT (v_id, d_id)
values (115, 98);
insert into DOCTOR_VISIT (v_id, d_id)
values (102, 178);
insert into DOCTOR_VISIT (v_id, d_id)
values (124, 139);
insert into DOCTOR_VISIT (v_id, d_id)
values (120, 80);
insert into DOCTOR_VISIT (v_id, d_id)
values (116, 165);
insert into DOCTOR_VISIT (v_id, d_id)
values (117, 141);
insert into DOCTOR_VISIT (v_id, d_id)
values (115, 151);
insert into DOCTOR_VISIT (v_id, d_id)
values (114, 32);
insert into DOCTOR_VISIT (v_id, d_id)
values (110, 63);
insert into DOCTOR_VISIT (v_id, d_id)
values (108, 58);
insert into DOCTOR_VISIT (v_id, d_id)
values (124, 17);
insert into DOCTOR_VISIT (v_id, d_id)
values (126, 5);
insert into DOCTOR_VISIT (v_id, d_id)
values (101, 39);
insert into DOCTOR_VISIT (v_id, d_id)
values (121, 65);
insert into DOCTOR_VISIT (v_id, d_id)
values (126, 3);
insert into DOCTOR_VISIT (v_id, d_id)
values (100, 23);
insert into DOCTOR_VISIT (v_id, d_id)
values (125, 3);
insert into DOCTOR_VISIT (v_id, d_id)
values (123, 186);
insert into DOCTOR_VISIT (v_id, d_id)
values (111, 20);
insert into DOCTOR_VISIT (v_id, d_id)
values (101, 142);
insert into DOCTOR_VISIT (v_id, d_id)
values (103, 40);
insert into DOCTOR_VISIT (v_id, d_id)
values (117, 132);
insert into DOCTOR_VISIT (v_id, d_id)
values (112, 181);
insert into DOCTOR_VISIT (v_id, d_id)
values (125, 25);
insert into DOCTOR_VISIT (v_id, d_id)
values (121, 98);
insert into DOCTOR_VISIT (v_id, d_id)
values (117, 163);
insert into DOCTOR_VISIT (v_id, d_id)
values (104, 111);
insert into DOCTOR_VISIT (v_id, d_id)
values (100, 188);
insert into DOCTOR_VISIT (v_id, d_id)
values (104, 30);
insert into DOCTOR_VISIT (v_id, d_id)
values (123, 7);
insert into DOCTOR_VISIT (v_id, d_id)
values (124, 24);
insert into DOCTOR_VISIT (v_id, d_id)
values (120, 102);
insert into DOCTOR_VISIT (v_id, d_id)
values (100, 3);
insert into DOCTOR_VISIT (v_id, d_id)
values (120, 51);
insert into DOCTOR_VISIT (v_id, d_id)
values (110, 163);
insert into DOCTOR_VISIT (v_id, d_id)
values (113, 160);
insert into DOCTOR_VISIT (v_id, d_id)
values (112, 65);
insert into DOCTOR_VISIT (v_id, d_id)
values (122, 183);
insert into DOCTOR_VISIT (v_id, d_id)
values (118, 199);
insert into DOCTOR_VISIT (v_id, d_id)
values (114, 107);
insert into DOCTOR_VISIT (v_id, d_id)
values (114, 84);
insert into DOCTOR_VISIT (v_id, d_id)
values (121, 107);
insert into DOCTOR_VISIT (v_id, d_id)
values (104, 195);
insert into DOCTOR_VISIT (v_id, d_id)
values (122, 33);
insert into DOCTOR_VISIT (v_id, d_id)
values (123, 117);
insert into DOCTOR_VISIT (v_id, d_id)
values (114, 136);
insert into DOCTOR_VISIT (v_id, d_id)
values (110, 20);
insert into DOCTOR_VISIT (v_id, d_id)
values (129, 58);
insert into DOCTOR_VISIT (v_id, d_id)
values (105, 128);
insert into DOCTOR_VISIT (v_id, d_id)
values (102, 11);
insert into DOCTOR_VISIT (v_id, d_id)
values (110, 171);
insert into DOCTOR_VISIT (v_id, d_id)
values (121, 88);
insert into DOCTOR_VISIT (v_id, d_id)
values (120, 176);
insert into DOCTOR_VISIT (v_id, d_id)
values (120, 69);
insert into DOCTOR_VISIT (v_id, d_id)
values (113, 81);
insert into DOCTOR_VISIT (v_id, d_id)
values (101, 27);
insert into DOCTOR_VISIT (v_id, d_id)
values (104, 179);
insert into DOCTOR_VISIT (v_id, d_id)
values (113, 33);
insert into DOCTOR_VISIT (v_id, d_id)
values (103, 79);
insert into DOCTOR_VISIT (v_id, d_id)
values (103, 162);
insert into DOCTOR_VISIT (v_id, d_id)
values (113, 73);
insert into DOCTOR_VISIT (v_id, d_id)
values (126, 135);
insert into DOCTOR_VISIT (v_id, d_id)
values (104, 119);
insert into DOCTOR_VISIT (v_id, d_id)
values (112, 139);
insert into DOCTOR_VISIT (v_id, d_id)
values (126, 147);
insert into DOCTOR_VISIT (v_id, d_id)
values (122, 126);
insert into DOCTOR_VISIT (v_id, d_id)
values (105, 44);
insert into DOCTOR_VISIT (v_id, d_id)
values (103, 62);
insert into DOCTOR_VISIT (v_id, d_id)
values (119, 100);
insert into DOCTOR_VISIT (v_id, d_id)
values (122, 164);
insert into DOCTOR_VISIT (v_id, d_id)
values (107, 123);
insert into DOCTOR_VISIT (v_id, d_id)
values (106, 33);
insert into DOCTOR_VISIT (v_id, d_id)
values (121, 130);
insert into DOCTOR_VISIT (v_id, d_id)
values (115, 189);
insert into DOCTOR_VISIT (v_id, d_id)
values (106, 133);
insert into DOCTOR_VISIT (v_id, d_id)
values (113, 175);
insert into DOCTOR_VISIT (v_id, d_id)
values (128, 15);
insert into DOCTOR_VISIT (v_id, d_id)
values (100, 25);
insert into DOCTOR_VISIT (v_id, d_id)
values (107, 128);
insert into DOCTOR_VISIT (v_id, d_id)
values (109, 171);
insert into DOCTOR_VISIT (v_id, d_id)
values (111, 96);
insert into DOCTOR_VISIT (v_id, d_id)
values (103, 92);
insert into DOCTOR_VISIT (v_id, d_id)
values (126, 159);
insert into DOCTOR_VISIT (v_id, d_id)
values (103, 57);
insert into DOCTOR_VISIT (v_id, d_id)
values (110, 37);
insert into DOCTOR_VISIT (v_id, d_id)
values (113, 189);
insert into DOCTOR_VISIT (v_id, d_id)
values (109, 159);
insert into DOCTOR_VISIT (v_id, d_id)
values (127, 88);
insert into DOCTOR_VISIT (v_id, d_id)
values (126, 130);
insert into DOCTOR_VISIT (v_id, d_id)
values (110, 138);
insert into DOCTOR_VISIT (v_id, d_id)
values (120, 182);
insert into DOCTOR_VISIT (v_id, d_id)
values (120, 55);
insert into DOCTOR_VISIT (v_id, d_id)
values (122, 177);
insert into DOCTOR_VISIT (v_id, d_id)
values (118, 80);
commit;
prompt 100 records committed...
insert into DOCTOR_VISIT (v_id, d_id)
values (113, 16);
insert into DOCTOR_VISIT (v_id, d_id)
values (116, 77);
insert into DOCTOR_VISIT (v_id, d_id)
values (107, 125);
insert into DOCTOR_VISIT (v_id, d_id)
values (113, 51);
insert into DOCTOR_VISIT (v_id, d_id)
values (121, 152);
insert into DOCTOR_VISIT (v_id, d_id)
values (128, 44);
insert into DOCTOR_VISIT (v_id, d_id)
values (105, 70);
insert into DOCTOR_VISIT (v_id, d_id)
values (119, 7);
insert into DOCTOR_VISIT (v_id, d_id)
values (125, 112);
insert into DOCTOR_VISIT (v_id, d_id)
values (102, 130);
insert into DOCTOR_VISIT (v_id, d_id)
values (127, 20);
insert into DOCTOR_VISIT (v_id, d_id)
values (118, 114);
insert into DOCTOR_VISIT (v_id, d_id)
values (126, 151);
insert into DOCTOR_VISIT (v_id, d_id)
values (101, 166);
insert into DOCTOR_VISIT (v_id, d_id)
values (112, 19);
insert into DOCTOR_VISIT (v_id, d_id)
values (109, 107);
insert into DOCTOR_VISIT (v_id, d_id)
values (116, 74);
insert into DOCTOR_VISIT (v_id, d_id)
values (108, 38);
insert into DOCTOR_VISIT (v_id, d_id)
values (108, 103);
insert into DOCTOR_VISIT (v_id, d_id)
values (116, 29);
insert into DOCTOR_VISIT (v_id, d_id)
values (107, 168);
insert into DOCTOR_VISIT (v_id, d_id)
values (106, 27);
insert into DOCTOR_VISIT (v_id, d_id)
values (124, 150);
insert into DOCTOR_VISIT (v_id, d_id)
values (107, 110);
insert into DOCTOR_VISIT (v_id, d_id)
values (129, 124);
insert into DOCTOR_VISIT (v_id, d_id)
values (124, 42);
insert into DOCTOR_VISIT (v_id, d_id)
values (129, 137);
insert into DOCTOR_VISIT (v_id, d_id)
values (100, 38);
insert into DOCTOR_VISIT (v_id, d_id)
values (114, 129);
insert into DOCTOR_VISIT (v_id, d_id)
values (123, 114);
insert into DOCTOR_VISIT (v_id, d_id)
values (116, 147);
insert into DOCTOR_VISIT (v_id, d_id)
values (114, 182);
insert into DOCTOR_VISIT (v_id, d_id)
values (120, 60);
insert into DOCTOR_VISIT (v_id, d_id)
values (102, 89);
insert into DOCTOR_VISIT (v_id, d_id)
values (123, 42);
insert into DOCTOR_VISIT (v_id, d_id)
values (103, 176);
insert into DOCTOR_VISIT (v_id, d_id)
values (127, 91);
insert into DOCTOR_VISIT (v_id, d_id)
values (118, 33);
insert into DOCTOR_VISIT (v_id, d_id)
values (124, 144);
insert into DOCTOR_VISIT (v_id, d_id)
values (111, 111);
insert into DOCTOR_VISIT (v_id, d_id)
values (102, 92);
insert into DOCTOR_VISIT (v_id, d_id)
values (112, 150);
insert into DOCTOR_VISIT (v_id, d_id)
values (105, 66);
insert into DOCTOR_VISIT (v_id, d_id)
values (109, 176);
insert into DOCTOR_VISIT (v_id, d_id)
values (113, 184);
insert into DOCTOR_VISIT (v_id, d_id)
values (104, 140);
insert into DOCTOR_VISIT (v_id, d_id)
values (114, 45);
insert into DOCTOR_VISIT (v_id, d_id)
values (128, 45);
insert into DOCTOR_VISIT (v_id, d_id)
values (105, 53);
insert into DOCTOR_VISIT (v_id, d_id)
values (129, 121);
insert into DOCTOR_VISIT (v_id, d_id)
values (120, 146);
insert into DOCTOR_VISIT (v_id, d_id)
values (106, 28);
insert into DOCTOR_VISIT (v_id, d_id)
values (104, 135);
insert into DOCTOR_VISIT (v_id, d_id)
values (100, 108);
insert into DOCTOR_VISIT (v_id, d_id)
values (126, 116);
insert into DOCTOR_VISIT (v_id, d_id)
values (115, 188);
insert into DOCTOR_VISIT (v_id, d_id)
values (126, 53);
insert into DOCTOR_VISIT (v_id, d_id)
values (114, 58);
insert into DOCTOR_VISIT (v_id, d_id)
values (119, 112);
insert into DOCTOR_VISIT (v_id, d_id)
values (122, 12);
insert into DOCTOR_VISIT (v_id, d_id)
values (109, 125);
insert into DOCTOR_VISIT (v_id, d_id)
values (105, 81);
insert into DOCTOR_VISIT (v_id, d_id)
values (104, 83);
insert into DOCTOR_VISIT (v_id, d_id)
values (128, 54);
insert into DOCTOR_VISIT (v_id, d_id)
values (125, 126);
insert into DOCTOR_VISIT (v_id, d_id)
values (120, 6);
insert into DOCTOR_VISIT (v_id, d_id)
values (109, 22);
insert into DOCTOR_VISIT (v_id, d_id)
values (115, 134);
insert into DOCTOR_VISIT (v_id, d_id)
values (110, 123);
insert into DOCTOR_VISIT (v_id, d_id)
values (106, 117);
insert into DOCTOR_VISIT (v_id, d_id)
values (108, 72);
insert into DOCTOR_VISIT (v_id, d_id)
values (100, 102);
insert into DOCTOR_VISIT (v_id, d_id)
values (109, 161);
insert into DOCTOR_VISIT (v_id, d_id)
values (122, 43);
insert into DOCTOR_VISIT (v_id, d_id)
values (119, 102);
insert into DOCTOR_VISIT (v_id, d_id)
values (110, 166);
insert into DOCTOR_VISIT (v_id, d_id)
values (127, 23);
insert into DOCTOR_VISIT (v_id, d_id)
values (128, 21);
insert into DOCTOR_VISIT (v_id, d_id)
values (100, 142);
insert into DOCTOR_VISIT (v_id, d_id)
values (125, 177);
insert into DOCTOR_VISIT (v_id, d_id)
values (107, 41);
insert into DOCTOR_VISIT (v_id, d_id)
values (119, 114);
insert into DOCTOR_VISIT (v_id, d_id)
values (110, 81);
insert into DOCTOR_VISIT (v_id, d_id)
values (118, 84);
insert into DOCTOR_VISIT (v_id, d_id)
values (119, 183);
insert into DOCTOR_VISIT (v_id, d_id)
values (121, 189);
insert into DOCTOR_VISIT (v_id, d_id)
values (120, 27);
insert into DOCTOR_VISIT (v_id, d_id)
values (115, 144);
insert into DOCTOR_VISIT (v_id, d_id)
values (100, 184);
insert into DOCTOR_VISIT (v_id, d_id)
values (122, 69);
insert into DOCTOR_VISIT (v_id, d_id)
values (124, 101);
insert into DOCTOR_VISIT (v_id, d_id)
values (106, 161);
insert into DOCTOR_VISIT (v_id, d_id)
values (128, 37);
insert into DOCTOR_VISIT (v_id, d_id)
values (110, 69);
commit;
prompt 194 records loaded
prompt Loading MEDICINIES...
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (143, 400, 'Posaconazole');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (23, 401, 'Amikacin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (111, 402, 'Dapsone');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (94, 403, 'Pomalidomide');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (149, 404, 'Brexucabtagene');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (168, 405, 'Elotuzumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (151, 406, 'Azithromycin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (167, 407, 'Carboplatin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (166, 408, 'Copanlisib');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (42, 409, 'Mebendazole');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (47, 410, 'Minocycline');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (55, 411, 'Ceftriaxone');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (31, 412, 'Umbralisib');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (135, 413, 'Sulfamethoxazole');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (131, 414, 'Tacrolimus');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (54, 415, 'Atenolol');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (96, 416, 'Adalimumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (5, 417, 'Lisocabtagene');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (178, 418, 'Odronextamab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (12, 419, 'Permethrin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (117, 420, 'Idarubicin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (52, 421, 'Ifosfamide');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (102, 422, 'Umbralisib');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (37, 423, 'Sildenafil');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (32, 424, 'Ibrutinib');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (33, 425, 'Belatacept');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (108, 426, 'Tocilizumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (146, 427, 'Levothyroxine');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (200, 428, 'Vinblastine');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (162, 429, 'Loratadine');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (110, 430, 'Copanlisib');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (86, 431, 'Praziquantel');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (90, 432, 'Trimethoprim');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (149, 433, 'Teclistamab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (8, 434, 'Nitrofurantoin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (122, 435, 'Tetracycline');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (49, 436, 'Pomalidomide');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (26, 437, 'Cyclophosphamide');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (33, 438, 'Clarithromycin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (174, 439, 'Ivermectin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (125, 440, 'Lenalidomide');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (115, 441, 'Daratumumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (148, 442, 'Adalimumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (132, 443, 'Ethambutol');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (146, 444, 'Cisplatin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (168, 445, 'Cetirizine');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (117, 446, 'Carfilzomib');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (119, 447, 'Abatacept');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (73, 448, 'Voriconazole');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (71, 449, 'Finasteride');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (34, 450, 'Moxifloxacin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (129, 451, 'Copanlisib');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (14, 452, 'Streptomycin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (106, 453, 'Lindane');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (116, 454, 'Tacrolimus');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (19, 455, 'Isavuconazole');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (88, 456, 'Fidaxomicin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (175, 457, 'Ceftriaxone');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (153, 458, 'Ibuprofen');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (67, 459, 'Lisocabtagene');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (168, 460, 'Isavuconazole');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (192, 461, 'Voclosporin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (29, 462, 'Copanlisib');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (92, 463, 'Bedaquiline');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (76, 464, 'Voriconazole');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (32, 465, 'Voclosporin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (101, 466, 'Cyclophosphamide');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (135, 467, 'Venetoclax');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (42, 468, 'Belantamab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (49, 469, 'Aspirin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (38, 470, 'Odronextamab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (108, 471, 'Venetoclax');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (34, 472, 'Venetoclax');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (144, 473, 'Metformin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (128, 474, 'Rituximab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (198, 475, 'Cabazitaxel');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (133, 476, 'Cyclosporine');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (10, 477, 'Sarilumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (43, 478, 'Tadalafil');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (34, 479, 'Zanubrutinib');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (191, 480, 'Albuterol');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (134, 481, 'Cefepime');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (71, 482, 'Cefotaxime');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (29, 483, 'Etanercept');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (133, 484, 'Alemtuzumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (154, 485, 'Linezolid');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (3, 486, 'Tofacitinib');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (66, 487, 'Pyrazinamide');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (139, 488, 'Ustekinumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (194, 489, 'Basiliximab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (93, 490, 'Ruxolitinib');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (157, 491, 'Sildenafil');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (71, 492, 'Rifampin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (143, 493, 'Cefepime');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (70, 494, 'Atorvastatin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (67, 495, 'Colchicine');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (177, 496, 'Belantamab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (116, 497, 'Epirubicin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (20, 498, 'Acalabrutinib');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (92, 499, 'Spironolactone');
commit;
prompt 100 records committed...
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (48, 500, 'Azithromycin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (59, 501, 'Guselkumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (129, 502, 'Clofazimine');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (7, 503, 'Alemtuzumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (44, 504, 'Posaconazole');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (134, 505, 'Natalizumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (82, 506, 'Guselkumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (173, 507, 'Gentamicin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (178, 508, 'Finasteride');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (47, 509, 'Natalizumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (135, 510, 'Mebendazole');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (0, 511, 'Bedaquiline');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (61, 512, 'Golimumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (160, 513, 'Praziquantel');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (43, 514, 'Pentostatin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (196, 515, 'Busulfan');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (119, 516, 'Belantamab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (145, 517, 'Cyclophosphamide');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (50, 518, 'Tigecycline');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (140, 519, 'Carboplatin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (60, 520, 'Aztreonam');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (18, 521, 'Voclosporin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (146, 522, 'Metformin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (59, 523, 'Finasteride');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (16, 524, 'Erythromycin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (125, 525, 'Umbralisib');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (181, 526, 'Nitrofurantoin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (137, 527, 'Finasteride');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (133, 528, 'Amlodipine');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (88, 529, 'Pentostatin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (46, 530, 'Decitabine');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (200, 531, 'Delamanid');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (38, 532, 'Fedratinib');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (130, 533, 'Hydroxyurea');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (116, 534, 'Fluconazole');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (160, 535, 'Ciprofloxacin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (160, 536, 'Daunorubicin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (139, 537, 'Tildrakizumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (151, 538, 'Mitoxantrone');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (25, 539, 'Pyrazinamide');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (113, 540, 'Ustekinumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (114, 541, 'Inotuzumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (65, 542, 'Rituximab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (69, 543, 'Idelalisib');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (150, 544, 'Mebendazole');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (165, 545, 'Losartan');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (155, 546, 'Famotidine');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (159, 547, 'Allopurinol');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (67, 548, 'Terbinafine');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (75, 549, 'Streptomycin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (193, 550, 'Axicabtagene');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (55, 551, 'Mycophenolate');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (182, 552, 'Elotuzumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (28, 553, 'Furosemide');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (180, 554, 'Teclistamab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (69, 555, 'Allopurinol');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (163, 556, 'Mycophenolate');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (97, 557, 'Aspirin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (161, 558, 'Ixazomib');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (78, 559, 'Secukinumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (134, 560, 'Brexucabtagene');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (93, 561, 'Atenolol');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (109, 562, 'Natalizumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (114, 563, 'Axicabtagene');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (32, 564, 'Gentamicin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (183, 565, 'Lenalidomide');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (61, 566, 'Pomalidomide');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (104, 567, 'Tadalafil');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (30, 568, 'Certolizumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (62, 569, 'Belantamab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (129, 570, 'Pomalidomide');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (177, 571, 'Zanubrutinib');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (22, 572, 'Vinorelbine');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (95, 573, 'Thalidomide');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (158, 574, 'Amphotericin B');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (139, 575, 'Itraconazole');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (173, 576, 'Avacopan');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (16, 577, 'Copanlisib');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (62, 578, 'Thalidomide');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (101, 579, 'Sirolimus');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (125, 580, 'Methotrexate');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (194, 581, 'Acalabrutinib');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (18, 582, 'Bleomycin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (74, 583, 'Ixazomib');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (78, 584, 'Mesalamine');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (52, 585, 'Sirolimus');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (111, 586, 'Daunorubicin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (130, 587, 'Venetoclax');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (118, 588, 'Vinblastine');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (70, 589, 'Delamanid');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (59, 590, 'Gentamicin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (116, 591, 'Etanercept');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (19, 592, 'Adalimumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (120, 593, 'Methotrexate');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (188, 594, 'Amikacin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (143, 595, 'Vancomycin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (103, 596, 'Basiliximab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (190, 597, 'Voclosporin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (76, 598, 'Digoxin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (26, 599, 'Atenolol');
commit;
prompt 200 records committed...
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (160, 600, 'Cladribine');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (56, 601, 'Vinorelbine');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (57, 602, 'Metformin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (96, 603, 'Digoxin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (39, 604, 'Belatacept');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (125, 605, 'Belantamab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (187, 606, 'Tacrolimus');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (163, 607, 'Spironolactone');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (93, 608, 'Vancomycin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (29, 609, 'Trimethoprim');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (71, 610, 'Ethambutol');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (54, 611, 'Gemtuzumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (88, 612, 'Selinexor');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (196, 613, 'Ocrelizumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (163, 614, 'Secukinumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (110, 615, 'Cefotaxime');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (179, 616, 'Hydroxyurea');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (170, 617, 'Mitoxantrone');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (110, 618, 'Belatacept');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (36, 619, 'Atenolol');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (142, 620, 'Moxifloxacin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (104, 621, 'Clindamycin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (175, 622, 'Mycophenolate');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (125, 623, 'Idecabtagene');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (79, 624, 'Erythromycin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (10, 625, 'Pretomanid');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (115, 626, 'Ifosfamide');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (42, 627, 'Certolizumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (170, 628, 'Sarilumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (175, 629, 'Axicabtagene');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (122, 630, 'Venetoclax');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (167, 631, 'Decitabine');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (100, 632, 'Baricitinib');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (127, 633, 'Levofloxacin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (29, 634, 'Vardenafil');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (101, 635, 'Tocilizumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (147, 636, 'Vardenafil');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (190, 637, 'Belatacept');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (176, 638, 'Dapsone');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (139, 639, 'Paclitaxel');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (126, 640, 'Tocilizumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (171, 641, 'Vardenafil');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (136, 642, 'Tisagenlecleucel');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (101, 643, 'Bleomycin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (1, 644, 'Tildrakizumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (30, 645, 'Albendazole');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (113, 646, 'Bendamustine');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (127, 647, 'Sulfamethoxazole');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (159, 648, 'Azathioprine');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (107, 649, 'Secukinumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (192, 650, 'Rifampin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (32, 651, 'Idecabtagene');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (142, 652, 'Etoposide');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (108, 653, 'Griseofulvin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (56, 654, 'Etanercept');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (31, 655, 'Upadacitinib');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (51, 656, 'Brexucabtagene');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (56, 657, 'Axicabtagene');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (169, 658, 'Isoniazid');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (19, 659, 'Bleomycin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (3, 660, 'Ixazomib');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (8, 661, 'Aspirin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (10, 662, 'Pretomanid');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (12, 663, 'Mosunetuzumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (52, 664, 'Doxorubicin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (128, 665, 'Fludarabine');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (189, 666, 'Rifampin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (162, 667, 'Pretomanid');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (179, 668, 'Delamanid');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (124, 669, 'Copanlisib');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (200, 670, 'Pentostatin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (120, 671, 'Vardenafil');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (137, 672, 'Sulfamethoxazole');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (56, 673, 'Anidulafungin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (62, 674, 'Paracetamol');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (173, 675, 'Trimethoprim');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (161, 676, 'Cladribine');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (94, 677, 'Caspofungin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (5, 678, 'Gentamicin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (137, 679, 'Cefotaxime');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (146, 680, 'Pomalidomide');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (45, 681, 'Ifosfamide');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (26, 682, 'Ixazomib');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (13, 683, 'Risankizumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (76, 684, 'Tadalafil');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (43, 685, 'Docetaxel');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (104, 686, 'Imipenem');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (11, 687, 'Atenolol');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (128, 688, 'Ethambutol');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (199, 689, 'Tamsulosin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (81, 690, 'Ciltacabtagene');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (131, 691, 'Odronextamab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (25, 692, 'Amikacin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (14, 693, 'Aztreonam');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (3, 694, 'Risankizumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (102, 695, 'Streptomycin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (69, 696, 'Simvastatin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (161, 697, 'Sirolimus');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (127, 698, 'Sulfamethoxazole');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (98, 699, 'Axicabtagene');
commit;
prompt 300 records committed...
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (18, 700, 'Streptomycin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (12, 701, 'Tobramycin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (183, 702, 'Ranitidine');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (5, 703, 'Clopidogrel');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (38, 704, 'Dapsone');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (153, 705, 'Daunorubicin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (105, 706, 'Doxycycline');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (51, 707, 'Golimumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (114, 708, 'Ceftriaxone');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (35, 709, 'Tofacitinib');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (26, 710, 'Clarithromycin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (2, 711, 'Ixekizumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (118, 712, 'Tocilizumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (12, 713, 'Risankizumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (130, 714, 'Elotuzumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (122, 715, 'Etoposide');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (155, 716, 'Vinorelbine');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (119, 717, 'Furosemide');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (166, 718, 'Paracetamol');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (90, 719, 'Sarilumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (147, 720, 'Fludarabine');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (28, 721, 'Atorvastatin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (30, 722, 'Mitoxantrone');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (83, 723, 'Odronextamab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (107, 724, 'Minocycline');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (166, 725, 'Aspirin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (11, 726, 'Ceftriaxone');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (22, 727, 'Ranitidine');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (53, 728, 'Rituximab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (181, 729, 'Metformin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (88, 730, 'Clofazimine');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (180, 731, 'Inotuzumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (199, 732, 'Thalidomide');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (190, 733, 'Alemtuzumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (98, 734, 'Amphotericin B');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (146, 735, 'Loncastuximab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (198, 736, 'Inotuzumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (176, 737, 'Rituximab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (170, 738, 'Clopidogrel');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (168, 739, 'Delamanid');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (54, 740, 'Duvelisib');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (152, 741, 'Hydroxyurea');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (12, 742, 'Loratadine');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (37, 743, 'Tamsulosin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (102, 744, 'Selinexor');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (86, 745, 'Leflunomide');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (71, 746, 'Rituximab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (155, 747, 'Lenalidomide');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (33, 748, 'Idarubicin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (195, 749, 'Clindamycin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (141, 750, 'Tisagenlecleucel');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (143, 751, 'Cefepime');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (199, 752, 'Thalidomide');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (187, 753, 'Brodalumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (49, 754, 'Fluconazole');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (34, 755, 'Azacitidine');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (169, 756, 'Hydroxyurea');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (83, 757, 'Daratumumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (198, 758, 'Fluconazole');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (13, 759, 'Tadalafil');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (157, 760, 'Levofloxacin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (192, 761, 'Terbinafine');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (164, 762, 'Avacopan');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (124, 763, 'Colchicine');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (104, 764, 'Spironolactone');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (41, 765, 'Tobramycin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (170, 766, 'Micafungin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (142, 767, 'Omeprazole');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (26, 768, 'Cladribine');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (92, 769, 'Dapsone');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (11, 770, 'Fedratinib');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (4, 771, 'Copanlisib');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (29, 772, 'Sulfamethoxazole');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (190, 773, 'Ibrutinib');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (50, 774, 'Leflunomide');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (5, 775, 'Bleomycin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (176, 776, 'Docetaxel');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (197, 777, 'Isoniazid');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (67, 778, 'Upadacitinib');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (155, 779, 'Furosemide');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (22, 780, 'Idelalisib');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (181, 781, 'Mesalamine');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (178, 782, 'Mebendazole');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (95, 783, 'Ciprofloxacin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (22, 784, 'Gentamicin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (165, 785, 'Hydrochlorothiazide');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (16, 786, 'Minocycline');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (191, 787, 'Digoxin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (182, 788, 'Nitrofurantoin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (40, 789, 'Allopurinol');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (172, 790, 'Meropenem');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (162, 791, 'Guselkumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (182, 792, 'Sildenafil');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (46, 793, 'Adalimumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (97, 794, 'Polatuzumab');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (102, 795, 'Imipenem');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (167, 796, 'Griseofulvin');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (2, 797, 'Tetracycline');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (73, 798, 'Paclitaxel');
insert into MEDICINIES (qualitity_available_in_stock, m_id, n_name)
values (45, 799, 'Ciprofloxacin');
commit;
prompt 400 records loaded
prompt Loading MEDICATION_VISIT...
insert into MEDICATION_VISIT (v_id, m_id)
values (120, 468);
insert into MEDICATION_VISIT (v_id, m_id)
values (120, 535);
insert into MEDICATION_VISIT (v_id, m_id)
values (100, 723);
insert into MEDICATION_VISIT (v_id, m_id)
values (115, 646);
insert into MEDICATION_VISIT (v_id, m_id)
values (117, 650);
insert into MEDICATION_VISIT (v_id, m_id)
values (110, 414);
insert into MEDICATION_VISIT (v_id, m_id)
values (101, 552);
insert into MEDICATION_VISIT (v_id, m_id)
values (108, 510);
insert into MEDICATION_VISIT (v_id, m_id)
values (102, 649);
insert into MEDICATION_VISIT (v_id, m_id)
values (117, 562);
insert into MEDICATION_VISIT (v_id, m_id)
values (108, 520);
insert into MEDICATION_VISIT (v_id, m_id)
values (114, 632);
insert into MEDICATION_VISIT (v_id, m_id)
values (123, 718);
insert into MEDICATION_VISIT (v_id, m_id)
values (129, 789);
insert into MEDICATION_VISIT (v_id, m_id)
values (105, 534);
insert into MEDICATION_VISIT (v_id, m_id)
values (118, 408);
insert into MEDICATION_VISIT (v_id, m_id)
values (126, 786);
insert into MEDICATION_VISIT (v_id, m_id)
values (129, 506);
insert into MEDICATION_VISIT (v_id, m_id)
values (117, 584);
insert into MEDICATION_VISIT (v_id, m_id)
values (129, 538);
insert into MEDICATION_VISIT (v_id, m_id)
values (107, 754);
insert into MEDICATION_VISIT (v_id, m_id)
values (111, 771);
insert into MEDICATION_VISIT (v_id, m_id)
values (104, 692);
insert into MEDICATION_VISIT (v_id, m_id)
values (103, 644);
insert into MEDICATION_VISIT (v_id, m_id)
values (115, 701);
insert into MEDICATION_VISIT (v_id, m_id)
values (104, 461);
insert into MEDICATION_VISIT (v_id, m_id)
values (122, 795);
insert into MEDICATION_VISIT (v_id, m_id)
values (109, 596);
insert into MEDICATION_VISIT (v_id, m_id)
values (123, 632);
insert into MEDICATION_VISIT (v_id, m_id)
values (101, 568);
insert into MEDICATION_VISIT (v_id, m_id)
values (123, 544);
insert into MEDICATION_VISIT (v_id, m_id)
values (101, 774);
insert into MEDICATION_VISIT (v_id, m_id)
values (125, 538);
insert into MEDICATION_VISIT (v_id, m_id)
values (114, 619);
insert into MEDICATION_VISIT (v_id, m_id)
values (125, 630);
insert into MEDICATION_VISIT (v_id, m_id)
values (121, 451);
insert into MEDICATION_VISIT (v_id, m_id)
values (127, 786);
insert into MEDICATION_VISIT (v_id, m_id)
values (112, 423);
insert into MEDICATION_VISIT (v_id, m_id)
values (108, 439);
insert into MEDICATION_VISIT (v_id, m_id)
values (102, 702);
insert into MEDICATION_VISIT (v_id, m_id)
values (102, 439);
insert into MEDICATION_VISIT (v_id, m_id)
values (107, 742);
insert into MEDICATION_VISIT (v_id, m_id)
values (118, 428);
insert into MEDICATION_VISIT (v_id, m_id)
values (107, 638);
insert into MEDICATION_VISIT (v_id, m_id)
values (106, 687);
insert into MEDICATION_VISIT (v_id, m_id)
values (127, 487);
insert into MEDICATION_VISIT (v_id, m_id)
values (119, 430);
insert into MEDICATION_VISIT (v_id, m_id)
values (105, 563);
insert into MEDICATION_VISIT (v_id, m_id)
values (111, 621);
insert into MEDICATION_VISIT (v_id, m_id)
values (123, 438);
insert into MEDICATION_VISIT (v_id, m_id)
values (124, 675);
insert into MEDICATION_VISIT (v_id, m_id)
values (122, 458);
insert into MEDICATION_VISIT (v_id, m_id)
values (126, 516);
insert into MEDICATION_VISIT (v_id, m_id)
values (126, 694);
insert into MEDICATION_VISIT (v_id, m_id)
values (108, 751);
insert into MEDICATION_VISIT (v_id, m_id)
values (116, 591);
insert into MEDICATION_VISIT (v_id, m_id)
values (101, 650);
insert into MEDICATION_VISIT (v_id, m_id)
values (103, 637);
insert into MEDICATION_VISIT (v_id, m_id)
values (120, 473);
insert into MEDICATION_VISIT (v_id, m_id)
values (125, 650);
insert into MEDICATION_VISIT (v_id, m_id)
values (102, 441);
insert into MEDICATION_VISIT (v_id, m_id)
values (113, 635);
insert into MEDICATION_VISIT (v_id, m_id)
values (107, 692);
insert into MEDICATION_VISIT (v_id, m_id)
values (118, 599);
insert into MEDICATION_VISIT (v_id, m_id)
values (104, 715);
insert into MEDICATION_VISIT (v_id, m_id)
values (107, 661);
insert into MEDICATION_VISIT (v_id, m_id)
values (114, 417);
insert into MEDICATION_VISIT (v_id, m_id)
values (121, 467);
insert into MEDICATION_VISIT (v_id, m_id)
values (112, 693);
insert into MEDICATION_VISIT (v_id, m_id)
values (117, 636);
insert into MEDICATION_VISIT (v_id, m_id)
values (122, 672);
insert into MEDICATION_VISIT (v_id, m_id)
values (127, 650);
insert into MEDICATION_VISIT (v_id, m_id)
values (128, 505);
insert into MEDICATION_VISIT (v_id, m_id)
values (122, 506);
insert into MEDICATION_VISIT (v_id, m_id)
values (125, 668);
insert into MEDICATION_VISIT (v_id, m_id)
values (105, 752);
insert into MEDICATION_VISIT (v_id, m_id)
values (108, 436);
insert into MEDICATION_VISIT (v_id, m_id)
values (124, 431);
insert into MEDICATION_VISIT (v_id, m_id)
values (119, 714);
insert into MEDICATION_VISIT (v_id, m_id)
values (100, 536);
insert into MEDICATION_VISIT (v_id, m_id)
values (106, 482);
insert into MEDICATION_VISIT (v_id, m_id)
values (100, 713);
insert into MEDICATION_VISIT (v_id, m_id)
values (104, 632);
insert into MEDICATION_VISIT (v_id, m_id)
values (119, 614);
insert into MEDICATION_VISIT (v_id, m_id)
values (115, 648);
insert into MEDICATION_VISIT (v_id, m_id)
values (114, 636);
insert into MEDICATION_VISIT (v_id, m_id)
values (125, 522);
insert into MEDICATION_VISIT (v_id, m_id)
values (116, 450);
insert into MEDICATION_VISIT (v_id, m_id)
values (125, 757);
insert into MEDICATION_VISIT (v_id, m_id)
values (128, 642);
insert into MEDICATION_VISIT (v_id, m_id)
values (102, 631);
insert into MEDICATION_VISIT (v_id, m_id)
values (127, 498);
insert into MEDICATION_VISIT (v_id, m_id)
values (117, 593);
insert into MEDICATION_VISIT (v_id, m_id)
values (112, 626);
insert into MEDICATION_VISIT (v_id, m_id)
values (120, 757);
insert into MEDICATION_VISIT (v_id, m_id)
values (101, 460);
insert into MEDICATION_VISIT (v_id, m_id)
values (101, 765);
insert into MEDICATION_VISIT (v_id, m_id)
values (100, 753);
insert into MEDICATION_VISIT (v_id, m_id)
values (102, 780);
insert into MEDICATION_VISIT (v_id, m_id)
values (105, 467);
commit;
prompt 100 records committed...
insert into MEDICATION_VISIT (v_id, m_id)
values (106, 695);
insert into MEDICATION_VISIT (v_id, m_id)
values (127, 409);
insert into MEDICATION_VISIT (v_id, m_id)
values (112, 708);
insert into MEDICATION_VISIT (v_id, m_id)
values (128, 790);
insert into MEDICATION_VISIT (v_id, m_id)
values (102, 538);
insert into MEDICATION_VISIT (v_id, m_id)
values (106, 471);
insert into MEDICATION_VISIT (v_id, m_id)
values (119, 661);
insert into MEDICATION_VISIT (v_id, m_id)
values (102, 472);
insert into MEDICATION_VISIT (v_id, m_id)
values (120, 616);
insert into MEDICATION_VISIT (v_id, m_id)
values (125, 501);
insert into MEDICATION_VISIT (v_id, m_id)
values (120, 769);
insert into MEDICATION_VISIT (v_id, m_id)
values (112, 488);
insert into MEDICATION_VISIT (v_id, m_id)
values (113, 785);
insert into MEDICATION_VISIT (v_id, m_id)
values (127, 470);
insert into MEDICATION_VISIT (v_id, m_id)
values (125, 600);
insert into MEDICATION_VISIT (v_id, m_id)
values (113, 628);
insert into MEDICATION_VISIT (v_id, m_id)
values (111, 528);
insert into MEDICATION_VISIT (v_id, m_id)
values (112, 602);
insert into MEDICATION_VISIT (v_id, m_id)
values (127, 514);
insert into MEDICATION_VISIT (v_id, m_id)
values (114, 505);
insert into MEDICATION_VISIT (v_id, m_id)
values (114, 563);
insert into MEDICATION_VISIT (v_id, m_id)
values (125, 545);
insert into MEDICATION_VISIT (v_id, m_id)
values (124, 538);
insert into MEDICATION_VISIT (v_id, m_id)
values (111, 689);
insert into MEDICATION_VISIT (v_id, m_id)
values (104, 789);
insert into MEDICATION_VISIT (v_id, m_id)
values (104, 670);
insert into MEDICATION_VISIT (v_id, m_id)
values (122, 773);
insert into MEDICATION_VISIT (v_id, m_id)
values (123, 768);
insert into MEDICATION_VISIT (v_id, m_id)
values (120, 550);
insert into MEDICATION_VISIT (v_id, m_id)
values (103, 686);
insert into MEDICATION_VISIT (v_id, m_id)
values (101, 513);
insert into MEDICATION_VISIT (v_id, m_id)
values (103, 726);
insert into MEDICATION_VISIT (v_id, m_id)
values (123, 420);
insert into MEDICATION_VISIT (v_id, m_id)
values (124, 794);
insert into MEDICATION_VISIT (v_id, m_id)
values (113, 506);
insert into MEDICATION_VISIT (v_id, m_id)
values (119, 457);
insert into MEDICATION_VISIT (v_id, m_id)
values (106, 726);
insert into MEDICATION_VISIT (v_id, m_id)
values (128, 553);
insert into MEDICATION_VISIT (v_id, m_id)
values (100, 725);
insert into MEDICATION_VISIT (v_id, m_id)
values (128, 596);
insert into MEDICATION_VISIT (v_id, m_id)
values (112, 778);
insert into MEDICATION_VISIT (v_id, m_id)
values (112, 676);
insert into MEDICATION_VISIT (v_id, m_id)
values (114, 477);
insert into MEDICATION_VISIT (v_id, m_id)
values (127, 679);
insert into MEDICATION_VISIT (v_id, m_id)
values (109, 443);
insert into MEDICATION_VISIT (v_id, m_id)
values (124, 553);
insert into MEDICATION_VISIT (v_id, m_id)
values (113, 422);
insert into MEDICATION_VISIT (v_id, m_id)
values (108, 624);
insert into MEDICATION_VISIT (v_id, m_id)
values (101, 430);
insert into MEDICATION_VISIT (v_id, m_id)
values (103, 696);
insert into MEDICATION_VISIT (v_id, m_id)
values (123, 532);
insert into MEDICATION_VISIT (v_id, m_id)
values (127, 742);
insert into MEDICATION_VISIT (v_id, m_id)
values (124, 504);
insert into MEDICATION_VISIT (v_id, m_id)
values (109, 512);
insert into MEDICATION_VISIT (v_id, m_id)
values (126, 765);
insert into MEDICATION_VISIT (v_id, m_id)
values (112, 671);
insert into MEDICATION_VISIT (v_id, m_id)
values (125, 430);
insert into MEDICATION_VISIT (v_id, m_id)
values (105, 595);
insert into MEDICATION_VISIT (v_id, m_id)
values (108, 470);
insert into MEDICATION_VISIT (v_id, m_id)
values (114, 432);
insert into MEDICATION_VISIT (v_id, m_id)
values (112, 434);
insert into MEDICATION_VISIT (v_id, m_id)
values (101, 753);
insert into MEDICATION_VISIT (v_id, m_id)
values (129, 511);
insert into MEDICATION_VISIT (v_id, m_id)
values (119, 415);
insert into MEDICATION_VISIT (v_id, m_id)
values (121, 794);
insert into MEDICATION_VISIT (v_id, m_id)
values (123, 548);
insert into MEDICATION_VISIT (v_id, m_id)
values (109, 521);
insert into MEDICATION_VISIT (v_id, m_id)
values (123, 686);
insert into MEDICATION_VISIT (v_id, m_id)
values (107, 556);
insert into MEDICATION_VISIT (v_id, m_id)
values (117, 770);
insert into MEDICATION_VISIT (v_id, m_id)
values (104, 482);
insert into MEDICATION_VISIT (v_id, m_id)
values (100, 423);
insert into MEDICATION_VISIT (v_id, m_id)
values (120, 573);
insert into MEDICATION_VISIT (v_id, m_id)
values (103, 635);
insert into MEDICATION_VISIT (v_id, m_id)
values (101, 621);
insert into MEDICATION_VISIT (v_id, m_id)
values (108, 669);
insert into MEDICATION_VISIT (v_id, m_id)
values (110, 470);
insert into MEDICATION_VISIT (v_id, m_id)
values (114, 702);
insert into MEDICATION_VISIT (v_id, m_id)
values (121, 444);
insert into MEDICATION_VISIT (v_id, m_id)
values (111, 425);
insert into MEDICATION_VISIT (v_id, m_id)
values (108, 731);
insert into MEDICATION_VISIT (v_id, m_id)
values (109, 722);
insert into MEDICATION_VISIT (v_id, m_id)
values (100, 485);
insert into MEDICATION_VISIT (v_id, m_id)
values (121, 447);
insert into MEDICATION_VISIT (v_id, m_id)
values (126, 721);
insert into MEDICATION_VISIT (v_id, m_id)
values (102, 409);
insert into MEDICATION_VISIT (v_id, m_id)
values (120, 781);
insert into MEDICATION_VISIT (v_id, m_id)
values (111, 792);
insert into MEDICATION_VISIT (v_id, m_id)
values (101, 618);
insert into MEDICATION_VISIT (v_id, m_id)
values (108, 733);
insert into MEDICATION_VISIT (v_id, m_id)
values (112, 482);
insert into MEDICATION_VISIT (v_id, m_id)
values (101, 464);
insert into MEDICATION_VISIT (v_id, m_id)
values (126, 481);
insert into MEDICATION_VISIT (v_id, m_id)
values (118, 545);
insert into MEDICATION_VISIT (v_id, m_id)
values (125, 569);
insert into MEDICATION_VISIT (v_id, m_id)
values (106, 408);
insert into MEDICATION_VISIT (v_id, m_id)
values (100, 442);
insert into MEDICATION_VISIT (v_id, m_id)
values (119, 523);
insert into MEDICATION_VISIT (v_id, m_id)
values (118, 513);
insert into MEDICATION_VISIT (v_id, m_id)
values (108, 614);
commit;
prompt 200 records loaded
prompt Enabling foreign key constraints for ROOM...
alter table ROOM enable constraint SYS_C008438;
prompt Enabling foreign key constraints for PATIENT...
alter table PATIENT enable constraint SYS_C008447;
prompt Enabling foreign key constraints for VISIT...
alter table VISIT enable constraint SYS_C008451;
prompt Enabling foreign key constraints for DOCTOR_VISIT...
alter table DOCTOR_VISIT enable constraint SYS_C008460;
alter table DOCTOR_VISIT enable constraint SYS_C008461;
prompt Enabling foreign key constraints for MEDICATION_VISIT...
alter table MEDICATION_VISIT enable constraint SYS_C008455;
alter table MEDICATION_VISIT enable constraint SYS_C008456;
prompt Enabling triggers for DEPARTMENT...
alter table DEPARTMENT enable all triggers;
prompt Enabling triggers for DOCTOR...
alter table DOCTOR enable all triggers;
prompt Enabling triggers for ROOM...
alter table ROOM enable all triggers;
prompt Enabling triggers for PATIENT...
alter table PATIENT enable all triggers;
prompt Enabling triggers for VISIT...
alter table VISIT enable all triggers;
prompt Enabling triggers for DOCTOR_VISIT...
alter table DOCTOR_VISIT enable all triggers;
prompt Enabling triggers for MEDICINIES...
alter table MEDICINIES enable all triggers;
prompt Enabling triggers for MEDICATION_VISIT...
alter table MEDICATION_VISIT enable all triggers;
set feedback on
set define on
prompt Done.
