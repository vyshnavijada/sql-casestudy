-- Creating the Patient table
CREATE TABLE Patient (
  PatientID INT PRIMARY KEY,
  Name VARCHAR(100),
  Address VARCHAR(100),
  DateOfBirth DATE,
  ContactNumber VARCHAR(20)
);

-- Creating the Medical History table
CREATE TABLE MedicalHistory (
  MedicalHistoryID INT PRIMARY KEY,
  PatientID INT,
  Diagnosis VARCHAR(100),
  Treatment VARCHAR(100),
  Surgery VARCHAR(100),
  Medication VARCHAR(100),
  FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

-- Creating the Lab Results table
CREATE TABLE LabResults (
  LabResultID INT PRIMARY KEY,
  PatientID INT,
  TestType VARCHAR(100),
  TestResult VARCHAR(100),
  FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

-- Creating the Prescriptions table
CREATE TABLE Prescriptions (
  PrescriptionID INT PRIMARY KEY,
  PatientID INT,
  MedicationName VARCHAR(100),
  Dosage VARCHAR(50),
  Frequency VARCHAR(50),
  FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

-- Creating the Outcome table
CREATE TABLE Outcome (
  OutcomeID INT PRIMARY KEY,
  PatientID INT,
  ReadmissionRate FLOAT,
  MedicationAdherence FLOAT,
  FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

-- Example queries:

-- Get all patients
SELECT * FROM Patient;

-- Get patient's medical history
SELECT * FROM MedicalHistory WHERE PatientID = 1;

-- Get patient's lab results
SELECT * FROM LabResults WHERE PatientID = 1;

-- Get patient's prescriptions
SELECT * FROM Prescriptions WHERE PatientID = 1;

-- Get patient's outcomes
SELECT * FROM Outcome WHERE PatientID = 1;
