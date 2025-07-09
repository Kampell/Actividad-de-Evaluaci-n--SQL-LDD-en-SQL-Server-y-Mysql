CREATE TABLE Estudiante (
    IDAlumno INT PRIMARY KEY,
    Nombre NVARCHAR(30),
    NombrePila NVARCHAR(20),
    Apellido1 NVARCHAR(20),
    Apellido2 NVARCHAR(20),
    Matricula INT
);

CREATE TABLE Curso (
    IDCurso INT PRIMARY KEY,
    Nombre NVARCHAR(255),
    Codigo INT,
    NumeroCurso INT
);

CREATE TABLE Inscripcion (
    IDAlumno INT,
    IDCurso INT,
    PRIMARY KEY (IDAlumno, IDCurso),
    FOREIGN KEY (IDAlumno) REFERENCES Estudiante(IDAlumno),
    FOREIGN KEY (IDCurso) REFERENCES Curso(IDCurso)
);