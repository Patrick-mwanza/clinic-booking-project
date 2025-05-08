USE Clinicdb;
-- table: Patients
    CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    birth_date DATE NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    phone VARCHAR(30) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE
);

-- Table: Doctors
CREATE TABLE Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100) NOT NULL,
    phone VARCHAR(30) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE
);

-- Table: Appointments
CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    notes TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id) ON DELETE CASCADE,
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id) ON DELETE CASCADE
);

-- Table: Treatments
CREATE TABLE Treatments (
    treatment_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL,
    treatment_description TEXT NOT NULL,
    cost DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id) ON DELETE CASCADE
);


-- Table: Payments
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT UNIQUE NOT NULL,
    amount_paid DECIMAL(10,2) NOT NULL,
    payment_date DATE NOT NULL,
    payment_method ENUM('Cash', 'Card', 'Insurance') NOT NULL,
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id) ON DELETE CASCADE
);

-- Data: Patients
INSERT INTO Patients (first_name, last_name, birth_date, gender, phone, email)
VALUES 
('Joseph', 'Kangethe', '1999-01-15', 'Male', '0712345678', 'josephkangethe7@gmail.com'),
('Mary', 'Okoth', '1985-07-30', 'Female', '0723456789', 'maryokoth@gmail.com') ,
('Veronica', 'mwamba', '2005-06-20', 'Female', '0723336789', 'veronicamwamba77@gmail.com');


-- Data: Doctors
INSERT INTO Doctors (full_name, specialization, phone, email)
VALUES 
('Dr. Patrick Mwanza', 'Cardiology', '0798109651', 'munyaopatrick002@gmail.com'),
('Dr. David Murage', 'Neurologist', '0729858901', 'davidmurage22@gmail.com') ,
('Dr.Reachel Chege', 'Gynecologist', '0188678500', 'reachelchege@gmail.com');

-- Data: Appointments
INSERT INTO Appointments (patient_id, doctor_id, appointment_date, status, notes)
VALUES
(1, 1, '2025-05-01 09:30:00', 'Completed', 'Follow-up after ECG'),
(2, 2, '2025-05-02 10:00:00', 'Scheduled', 'Initial consultation') ,
(3, 3, '2025-05-03 11:30:00', 'Cancelled', 'Emergency cancellation');


-- Data: Treatments
INSERT INTO Treatments (appointment_id, treatment_description, cost)
VALUES
(1, 'ECG Scan and analysis', 1500.00),
(1, 'Blood Pressure Monitoring', 500.00),
(2, 'Skin Rash Cream Prescription', 800.00);

-- Data: Payments
INSERT INTO Payments (appointment_id, amount_paid, payment_date, payment_method)
VALUES
(1, 2000.00, '2025-05-01', 'Card'),
(2, 2000.00, '2025-05-01', 'cash'),
(3, 2000.00, '2025-05-02', 'insurance');
    