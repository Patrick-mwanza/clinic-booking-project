# clinic-booking-project
#  Clinic Booking System Database

## Project Title
**Clinic Booking System Database with MySQL**

---

##  Description

This project is a relational **MySQL database** designed to support a small clinic's operations. It manages:

- **Patients**: Personal and contact information
- **Doctors**: Specializations and contact info
- **Appointments**: Scheduling between patients and doctors
- **Treatments**: Medical procedures or prescriptions given during appointments
- **Payments**: Records of payment for services rendered

The system maintains data integrity through proper use of:
- Primary and Foreign Keys
- One-to-many and one-to-one relationships
- Constraints (NOT NULL, UNIQUE, ENUMs)
- Cascading deletes for relational consistency

---

##  How to Run / Set Up the Project

###  Requirements:
- MySQL Server or MySQL Workbench

###  Steps:

1. **Clone or download this repository** to your machine.
2. **Open MySQL Workbench** (or any SQL tool of your choice).
3. **Create a new database**:
   ```sql
   CREATE DATABASE clinicdb;
   USE clinicdb;

