# Crime Management System DBMS

A Crime Management System project developed using PHP and MySQL. This system is designed to streamline the process of registering, assigning, and managing crime cases within law enforcement agencies. The system includes three types of users — **Admin**, **NCO** (Non-Commissioned Officer), and **CID** (Crime Investigation Department) — each with distinct roles and permissions. The project demonstrates the use of a database management system (DBMS) to organize and manage crime cases in an efficient, structured way.

## Table of Contents
- [Project Overview](#project-overview)
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Database Structure](#database-structure)
- [Usage](#usage)
- [Screenshots](#screenshots)
- [Future Enhancements](#future-enhancements)


## Project Overview
The Crime Management System allows different types of users to interact with crime cases as per their assigned roles:
- **Admin**: Manages users and the overall system configuration.
- **NCO**: Registers crime cases and assigns them to CID officers.
- **CID**: Views and updates progress on the cases assigned to them.

This project is built to support law enforcement agencies in managing and tracking criminal cases from registration through investigation, providing a structured way to handle sensitive data and case information.

## Features
### User Roles and Permissions
- **Admin**:
  - Can add, edit, and remove users (NCOs and CIDs).
  - Manages system-wide configurations and reports.
- **NCO (Non-Commissioned Officer)**:
  - Registers new crime cases with essential case details.
  - Assigns cases to CID officers based on their availability and expertise.
- **CID (Crime Investigation Department)**:
  - Views the cases assigned to them.
  - Updates the status and progress of each assigned case.

### Case Management
- Record case details, including date, type, description, and involved parties.
- Assign and track case progress with case status updates.

### Reports and Statistics
- Generate reports to review the status of cases by category, date, or officer assignment.
- Monitor case resolution rates and other performance metrics.

## Technologies Used
- **Frontend**: HTML, CSS, JavaScript
- **Backend**: PHP
- **Database**: MySQL

## Database Structure
The database is structured with tables to handle:
- **Users**: Stores information for admins, NCOs, and CID officers with role-based access.
- **Cases**: Stores case information, including case type, description, date, and status.
- **Assignments**: Manages case assignments between NCOs and CIDs, tracking case progress and updates.

> For detailed information on each table and its columns, refer to the `/db_schema.sql` file or the documentation folder.

## Usage
1. **Admin Login**: Log in as Admin to manage users and monitor system-wide activity.
2. **NCO Login**: Log in as NCO to register new cases and assign them to CID officers.
3. **CID Login**: Log in as CID to view assigned cases and update their status.
 Admin passowrd - admin123
 nco and cid password - 1234

## Screenshots

### Example Screenshots
1. **Login Screen**
   ![Login Screen](<img width="960" alt="{000573F1-7E71-4AB2-9DAF-50BF1FEB48F9}" src="https://github.com/user-attachments/assets/0bd83a76-6574-4696-a528-c3d50f3e5ae8">
)

2. **Admin Dashboard**
   ![Admin Dashboard](<img width="960" alt="{3AE2BB06-80C6-4079-A2AB-D5E897C4157E}" src="https://github.com/user-attachments/assets/7e24c7d7-5774-4291-8f85-537d7b283d7e">
   <img width="949" alt="{22B9175B-9C89-4860-BAED-8E6614FBED61}" src="https://github.com/user-attachments/assets/7d67fbd9-378b-4232-8b01-69e9180d74d7">
   <img width="960" alt="{F937053D-9D05-4394-949C-738FA8DF26B3}" src="https://github.com/user-attachments/assets/19be4e10-8eff-446c-b04c-a0862a2e1a41">
   <img width="951" alt="{A82DD941-ACB7-4C41-A827-5FFC6E2FA34C}" src="https://github.com/user-attachments/assets/3a0f517b-1aff-4a95-8a7e-7146ca7b2e2c">



)

4. **Case Registration Screen (NCO)**
   ![Case Registration](<img width="960" alt="{81A6A7C3-45E8-4E64-92A0-430CB0D7B1B5}" src="https://github.com/user-attachments/assets/8fa19e4e-9fd1-486c-8410-f24f406c005e">
   <img width="948" alt="{CDD579CB-8614-4ABB-824E-5AA6E25E84BD}" src="https://github.com/user-attachments/assets/6569ce16-b005-4627-a06d-6fd9b202cf82">

)

6. **Assigned Cases View (CID)**
   ![Assigned Cases](<img width="960" alt="{15C0426B-2595-4EC2-8437-CF0D1153E5E8}" src="https://github.com/user-attachments/assets/17b08881-580a-4a9b-83b4-f81f8ca943c5">
)

