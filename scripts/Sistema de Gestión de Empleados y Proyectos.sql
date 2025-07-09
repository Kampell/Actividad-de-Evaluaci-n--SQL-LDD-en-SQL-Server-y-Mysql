CREATE TABLE Departamento (
    NumeroDepartamento INT PRIMARY KEY,
    NombreDepartamento NVARCHAR(20),
    FechaInicio DATE
);

CREATE TABLE UbicacionDepartamento (
    NumeroDepartamento INT,
    Ubicacion NVARCHAR(20),
    PRIMARY KEY (NumeroDepartamento, Ubicacion),
    FOREIGN KEY (NumeroDepartamento) REFERENCES Departamento(NumeroDepartamento)
);

CREATE TABLE Proyecto (
    NumeroProyecto INT PRIMARY KEY,
    Nombre NVARCHAR(30),
    Ubicacion NVARCHAR(20),
    NumeroDepartamento INT,
    FOREIGN KEY (NumeroDepartamento) REFERENCES Departamento(NumeroDepartamento)
);

CREATE TABLE Empleado (
    SSN INT PRIMARY KEY,
    PrimerNombre NVARCHAR(20),
    Apellido NVARCHAR(20),
    Direccion NVARCHAR(100),
    FechaNacimiento DATE,
    Salario INT,
    Sexo NCHAR(1),
    NumeroDepartamentoFK INT,
    SupervisorFK INT,
    FOREIGN KEY (NumeroDepartamentoFK) REFERENCES Departamento(NumeroDepartamento),
    FOREIGN KEY (SupervisorFK) REFERENCES Empleado(SSN)
);

CREATE TABLE Dependiente (
    SSN INT,
    Nombre NVARCHAR(50),
    Relacion NVARCHAR(20),
    Sexo NCHAR(1),
    FechaNacimiento DATE,
    PRIMARY KEY (SSN, Nombre),
    FOREIGN KEY (SSN) REFERENCES Empleado(SSN)
);

CREATE TABLE TRABAJA_EN (
    SSN INT,
    NumeroProyecto INT,
    Horas INT,
    PRIMARY KEY (SSN, NumeroProyecto),
    FOREIGN KEY (SSN) REFERENCES Empleado(SSN),
    FOREIGN KEY (NumeroProyecto) REFERENCES Proyecto(NumeroProyecto)
);