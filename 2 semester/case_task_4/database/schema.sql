CREATE DATABASE WebCompanyDB;
GO

USE WebCompanyDB;
GO

CREATE TABLE Employees (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(100) NOT NULL,
    Position NVARCHAR(50) NOT NULL,
    HireDate DATE NOT NULL,
    Salary DECIMAL(18, 2)
);
GO

INSERT INTO Employees (FullName, Position, HireDate, Salary) VALUES
(N'Иванов Иван Иванович', N'Директор', '2020-01-15', 150000.00),
(N'Петрова Анна Сергеевна', N'Бухгалтер', '2021-03-22', 75000.00),
(N'Сидоров Петр Алексеевич', N'Разработчик', '2022-07-10', 120000.00);
GO
