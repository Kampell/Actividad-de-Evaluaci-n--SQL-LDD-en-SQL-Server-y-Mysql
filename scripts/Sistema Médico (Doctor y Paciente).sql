CREATE TABLE Doctor (
    IDDoctor INT PRIMARY KEY,
    Especialidad NVARCHAR(20),
    Edad INT,
    Nombre NVARCHAR(100),
    Apellido1 NVARCHAR(30),
    Apellido2 NVARCHAR(20)
);

CREATE TABLE Paciente (
    NumeroPaciente INT PRIMARY KEY,
    NombreCompleto NVARCHAR(255),
    Apellido1 NVARCHAR(20),
    Apellido2 NVARCHAR(20),
    Edad INT,
    Peso INT,
    Altura INT
);

CREATE TABLE Atencion (
    IDDoctor INT,
    NumeroPaciente INT,
    Diagnostico NVARCHAR(255),
    Fecha DATE,
    PRIMARY KEY (IDDoctor, NumeroPaciente),
    FOREIGN KEY (IDDoctor) REFERENCES Doctor(IDDoctor),
    FOREIGN KEY (NumeroPaciente) REFERENCES Paciente(NumeroPaciente)
);