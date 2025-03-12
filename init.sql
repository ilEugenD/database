CREATE DATABASE data_test

CREATE TABLE Clients (
    Client_ID INT PRIMARY KEY,
    First_name VARCHAR(50) CHECK (First_name !=''),
    Second_name VARCHAR(50) CHECK (First_name !=''),
    Middle_name VARCHAR(50),
    Passport_number VARCHAR(20) NOT NULL,
    Birth_date DATE
);

CREATE TABLE Addresses (
    Address_ID INT PRIMARY KEY,
    Client_ID INT NOT NULL,
    Address VARCHAR(255) CHECK (Address !=''),
    FOREIGN KEY (Client_ID) REFERENCES Clients(Client_ID)
);

CREATE TABLE Contracts (
    Contract_number INT PRIMARY KEY,
    Date_of_singing DATE,
    Client_ID INT NOT NULL,
    FOREIGN KEY (Client_ID) REFERENCES Clients(Client_ID)
);

CREATE TABLE Accounts (
    Account_number INT PRIMARY KEY,
    Client_ID INT NOT NULL,
    FOREIGN KEY (Client_ID) REFERENCES Clients(Client_ID)
);
