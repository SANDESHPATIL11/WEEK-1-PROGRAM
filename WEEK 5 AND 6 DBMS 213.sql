CREATE TABLE Department (
    DeptNO INT PRIMARY KEY,
    DeptName VARCHAR(100) NOT NULL,
    Location VARCHAR(100)
);

CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100) NOT NULL
    DeptNO INT,
    MGR_NO INT,
    HireDate Date,
    Salary DECIMAL(10, 2),
    FOREIGN KEY (DeptNO) REFERENCES Department(DeptNO)
);

CREATE TABLE Project (
    ProjID INT PRIMARY KEY,
    ProjName VARCHAR(100) NOT NULL,
    PLOC VARCHAR(50),
    Budget DECIMAL(12, 2)
);

CREATE TABLE AssignedTo (
    EmpID INT,
    ProjID INT,
    Role VARCHAR(50),
    AssignedDate DATE,
    PRIMARY KEY (EmpID, ProjID),
    FOREIGN KEY (EmpID) REFERENCES Employee(EmpID),
    FOREIGN KEY (ProjID) REFERENCES Project(ProjID)
);
CREATE TABLE Incentives (
    IncentiveID INT PRIMARY KEY,
    EmpID INT,
    IncentiveType VARCHAR(50),
    Amount DECIMAL(10, 2),
    DateGiven DATE,
    FOREIGN KEY (EmpID) REFERENCES Employee(EmpID)
    );
    
    INSERT INTO Department (DeptID, DeptName, Location) VALUES
(1, 'Human Resources', 'MUMBAI'),
(2, 'Engineering', 'BANGALORE'),
(3, 'Marketing', 'Chicago'),
(4, 'Finance', 'Boston'),
(5, 'IT Support', 'Seattle');

INSERT INTO Employee (EmpID, EmpName, Gender, DOB, DeptID, Salary) VALUES
(101, 'Alice Johnson', 'F', '1985-04-12', 2, 95000.00),
(102, 'Bob Smith', 'M', '1990-06-23', 1, 60000.00),
(103, 'Charlie Lee', 'M', '1988-11-05', 3, 72000.00),
(104, 'Diana Prince', 'F', '1992-02-17', 4, 85000.00),
(105, 'Ethan Brown', 'M', '1987-09-30', 5, 58000.00);

INSERT INTO Project (ProjID, ProjName, StartDate, EndDate, Budget) VALUES
(201, 'Apollo Upgrade', '2025-01-01', '2025-06-30', 500000.00),
(202, 'HR Portal Revamp', '2025-03-15', '2025-08-15', 200000.00),
(203, 'Marketing Blitz', '2025-04-01', '2025-07-31', 150000.00),
(204, 'Finance Tracker', '2025-02-01', '2025-05-31', 300000.00),
(205, 'IT Infrastructure', '2025-01-20', '2025-12-31', 400000.00);

INSERT INTO AssignedTo (EmpID, ProjID, Role, AssignedDate) VALUES
(101, 201, 'Lead Developer', '2025-01-05'),
(102, 202, 'HR Analyst', '2025-03-20'),
(103, 203, 'Marketing Strategist', '2025-04-05'),
(104, 204, 'Financial Analyst', '2025-02-10'),
(105, 205, 'IT Technician', '2025-01-25');

INSERT INTO Incentives (IncentiveID, EmpID, IncentiveType, Amount, DateGiven) VALUES
(301, 101, 'Performance Bonus', 5000.00, '2025-07-01'),
(302, 102, 'Attendance Bonus', 1000.00, '2025-06-15'),
(303, 103, 'Sales Bonus', 3000.00, '2025-08-01'),
(304, 104, 'Project Completion', 4000.00, '2025-06-30'),
(305, 105, 'Tech Excellence', 2500.00, '2025-09-01');

SELECT DISTINCT E.EMPNO
FROM EMPLOYEE employeeJOIN ASSIGNED TO A ON E.EMPNO=A.EMPNO
JOIN PROJECT P ON A.PNO=P.PNO
WHERE P.PLOC IN ('BANGALORE');

SELECT EMPNO FROM EMPLOYEE 
 WHERE EMPNO NOT IN (SELECT EMPNO FROM INCENTIVES);
 
 SELECT E.EMPNO,E.NAME,D.NAME AS DEPARTMENT 
 A.JOB_ROLE, D.LOC AS DEPARTEMNTLOCATION ,P.PLOC AS PROJECT_LOCATION,
 FROM EMPLOYEE E
 JOIN DEPT D ON E.DEPTNO=D.DEPT.NO
 JOIN ASIGNED TO A ON E.EMPNO=A.EMPNO
 JOIN PROJECT P ON A.PNO=P.PNO
 WHERE P.PLOC =P.PLOC;
 
 SELECT ENAME AS MANAGER_NAME FROM EMPLOYEE 
 WHERE EMPNO IS (
 SELECT MGR_NO HAVING COUNT (*)=
 (SELECT MAX(CNT)
 FROM (
 SELECT MGR_NO,COUNT(*) AS CNT 
 FROM EMPLOYEEEGROUP BY MGRNO )));
 
 SELECT M.ENAME AAS MANAGER_NAME FROM EMPLOYEE M 
  WHERE M.EMPNO IN 
  ( SELECT DISTINCT MGR_NO FROM EMPLOYEEE 00
   AND M.SAL >( SELCT AVG9E.SAL) FROM EMPLOYEE E 
   WHERE M.EMPNO= E.MGR_NO
   );
   
 SEWLECT E.ENAME AS EMPLOYEE_NAME FROM EMPLOYEE 
 JOIN EMPLOYEE M ON E.MGR_NO=M.EMP.NO 
 
 
 

