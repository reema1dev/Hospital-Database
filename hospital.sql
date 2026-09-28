CREATE TABLE Patient (
    PatientID NUMBER PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL,
    Age NUMBER NOT NULL,
    Address VARCHAR2(255) NOT NULL
);

CREATE TABLE PatientPhone (
    PatientID NUMBER,
    Phone VARCHAR2(20),
    PRIMARY KEY (PatientID, Phone),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

CREATE TABLE Doctor (
    DoctorID NUMBER PRIMARY KEY,
    FirstName VARCHAR2(50) NOT NULL,
    MiddleName VARCHAR2(50),
    LastName VARCHAR2(50) NOT NULL,
    Major VARCHAR2(100) NOT NULL,
    Age NUMBER,
    Nationality VARCHAR2(50)
);

CREATE TABLE Department (
    DeptID NUMBER PRIMARY KEY,
    Category VARCHAR2(100),
    DeptName VARCHAR2(100),
    WorkTime VARCHAR2(50)
);

CREATE TABLE DoctorDepartment (
    DoctorID NUMBER PRIMARY KEY,
    DeptID NUMBER,
    Position VARCHAR2(50),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID),
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

CREATE TABLE Appointment (
    AppointmentID NUMBER PRIMARY KEY,
    AppointmentDate DATE,
    AppointmentTime VARCHAR2(10),
    PatientID NUMBER,
    DeptID NUMBER,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

-- Patients
INSERT INTO Patient VALUES (3, 'Sara Ahmed', 24, 'Abha');
INSERT INTO Patient VALUES (4, 'Fahad Ali', 41, 'Dammam');
INSERT INTO Patient VALUES (5, 'Noura Salem', 35, 'Makkah');
INSERT INTO Patient VALUES (1, 'Ahmed Saleh', 30, 'Jeddah');
INSERT INTO Patient VALUES (2, 'Mariam Khalid', 29, 'Riyadh');

-- Patient Phones
INSERT INTO PatientPhone VALUES (3, '0534567890');
INSERT INTO PatientPhone VALUES (4, '0567891234');
INSERT INTO PatientPhone VALUES (5, '0543219876');
INSERT INTO PatientPhone VALUES (1, '0551234567');
INSERT INTO PatientPhone VALUES (2, '0509876543');

-- Doctors
INSERT INTO Doctor VALUES (102, 'Omar', 'Ahmed', 'AlQahtani', 'Neurology', 40, 'Saudi');
INSERT INTO Doctor VALUES (103, 'Lina', 'Mohammed', 'AlHarbi', 'Pediatrics', 36, 'Saudi');
INSERT INTO Doctor VALUES (104, 'Yousef', 'Saleh', 'AlZahrani', 'Orthopedics', 48, 'Saudi');
INSERT INTO Doctor VALUES (100, 'Ali', 'Khalid', 'Mansour', 'Cardiology', 45, 'Saudi');
INSERT INTO Doctor VALUES (101, 'Khalid', 'Abdullah', 'AlHarbi', 'Dermatology', 38, 'Saudi');

-- Departments
INSERT INTO Department VALUES (11, 'Medical', 'Dermatology', '8AM-4PM');
INSERT INTO Department VALUES (12, 'Medical', 'Neurology', '9AM-5PM');
INSERT INTO Department VALUES (13, 'Medical', 'Pediatrics', '8AM-3PM');
INSERT INTO Department VALUES (14, 'Medical', 'Orthopedics', '10AM-6PM');
INSERT INTO Department VALUES (10, 'Medical', 'Cardiology', '8AM-4PM');


-- DoctorDepartment
INSERT INTO DoctorDepartment VALUES (101, 11, 'Consultant');
INSERT INTO DoctorDepartment VALUES (102, 12, 'Senior Consultant');
INSERT INTO DoctorDepartment VALUES (103, 13, 'Specialist');
INSERT INTO DoctorDepartment VALUES (104, 14, 'Consultant');
INSERT INTO DoctorDepartment VALUES (100, 10, 'Senior Consultant');


-- Appointments
INSERT INTO Appointment
VALUES (2, TO_DATE('2025-04-21', 'YYYY-MM-DD'), '11:30', 2, 11);

INSERT INTO Appointment
VALUES (3, TO_DATE('2025-04-22', 'YYYY-MM-DD'), '09:00', 3, 12);

INSERT INTO Appointment
VALUES (4, TO_DATE('2025-04-23', 'YYYY-MM-DD'), '01:00', 4, 13);

INSERT INTO Appointment
VALUES (5, TO_DATE('2025-04-24', 'YYYY-MM-DD'), '03:30', 5, 14);

INSERT INTO Appointment
VALUES (1, TO_DATE('2025-04-20', 'YYYY-MM-DD'), '10:00', 1, 10);

SELECT * FROM Patient;
SELECT * FROM PatientPhone;
SELECT * FROM Doctor;
SELECT * FROM Department;
SELECT * FROM DoctorDepartment;
SELECT * FROM Appointment;

SELECT COUNT(*) FROM Patient;

SELECT INITCAP(Name) FROM Patient;

SELECT 'Dr. ' || FirstName || ' ' || LastName AS Doctor_Name
FROM Doctor;

CREATE INDEX idx_appointment_date
ON Appointment(AppointmentDate);