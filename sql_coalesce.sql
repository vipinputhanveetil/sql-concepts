-- Create the Employees table
CREATE OR REPLACE TABLE Employees (
    EmployeeID INT,
    FirstName VARCHAR(50),
    MiddleName VARCHAR(50),
    LastName VARCHAR(50)
);

-- Insert sample data into the Employees table
INSERT INTO Employees (EmployeeID, FirstName, MiddleName, LastName)
VALUES 
(1, 'John', NULL, 'Doe'),
(2, 'Jane', 'A.', 'Smith'),
(3, 'Mike', NULL, 'Johnson'),
(4, 'Emily', 'R.', 'Davis');

SELECT 
    FirstName,
    COALESCE(MiddleName, 'N/A') AS MiddleName,
    LastName
FROM 
    Employees;

CREATE OR REPLACE TABLE Contacts (
    ContactID INT,
    ContactName VARCHAR(50),
    Phone1 VARCHAR(15),
    Phone2 VARCHAR(15),
    Phone3 VARCHAR(15)
);

INSERT INTO Contacts (ContactID, ContactName, Phone1, Phone2, Phone3)
VALUES 
(1, 'Alice', '123-456-7890', NULL, '321-654-0987'),
(2, 'Bob', NULL, '987-654-3210', NULL),
(3, 'Charlie', NULL, NULL, NULL),
(4, 'Diana', '555-123-4567', '555-234-5678', '555-345-6789');

SELECT 
    ContactName,
    COALESCE(Phone1, Phone2, Phone3, 'No Phone') AS PrimaryPhone
FROM 
    Contacts;
