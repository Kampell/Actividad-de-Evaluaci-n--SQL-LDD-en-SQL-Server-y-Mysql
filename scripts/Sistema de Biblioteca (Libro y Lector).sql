CREATE TABLE Libro (
    NumeroLibro INT PRIMARY KEY,
    Titulo NVARCHAR(255),
    Autor NVARCHAR(255),
    Cantidad INT,
    ISBN INT
);

CREATE TABLE Lector (
    NumeroLector INT PRIMARY KEY,
    NumeroMembresia INT,
    Nombre NVARCHAR(100),
    Apellido1 NVARCHAR(100),
    Apellido2 NVARCHAR(100)
);

CREATE TABLE Presta (
    NumeroLibro INT,
    NumeroLector INT,
    PRIMARY KEY (NumeroLibro, NumeroLector),
    FOREIGN KEY (NumeroLibro) REFERENCES Libro(NumeroLibro),
    FOREIGN KEY (NumeroLector) REFERENCES Lector(NumeroLector)
);