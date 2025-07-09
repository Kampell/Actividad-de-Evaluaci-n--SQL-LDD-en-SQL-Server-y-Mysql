CREATE TABLE IMAGEN (
    IDImagen INT PRIMARY KEY,
    Ruta NVARCHAR(255),
    Tipo NVARCHAR(50)
);

CREATE TABLE PACIENTE (
    IDPaciente INT PRIMARY KEY,
    Nombre NVARCHAR(100),
    Apellido1 NVARCHAR(100),
    Apellido2 NVARCHAR(100),
    CURP NVARCHAR(18),
    Correo NVARCHAR(100),
    NumeroTelefono NVARCHAR(20),
    Colonia NVARCHAR(100),
    Calle NVARCHAR(100)
);

CREATE TABLE TRATAMIENTO (
    IDTratamiento INT PRIMARY KEY,
    Estatus NVARCHAR(50),
    Nombre NVARCHAR(100),
    Costo DECIMAL(10, 2),
    Duracion INT
);

CREATE TABLE MATERIAL (
    IDMaterial INT PRIMARY KEY,
    Nombre NVARCHAR(100),
    Stock INT,
    Descripcion NVARCHAR(255),
    UnidadMedida NVARCHAR(50)
);

CREATE TABLE CONSULTORIO (
    IDConsultorio INT PRIMARY KEY,
    Ubicacion NVARCHAR(100),
    Piso INT,
    Numero INT
);

CREATE TABLE ESPECIALIDAD (
    IDEspecialidad INT PRIMARY KEY,
    NombreEspecialidad NVARCHAR(100)
);

CREATE TABLE HISTORIAL (
    IDHistorial INT PRIMARY KEY,
    Diagnostico NVARCHAR(255),
    Observaciones NVARCHAR(MAX),
    IDImagen INT,
    FOREIGN KEY (IDImagen) REFERENCES IMAGEN(IDImagen)
);

CREATE TABLE ODONTOLOGO (
    IDOdontologo INT PRIMARY KEY,
    CedulaProfesional NVARCHAR(50),
    Nombre NVARCHAR(100),
    Apellido1 NVARCHAR(100),
    Apellido2 NVARCHAR(100)
);

CREATE TABLE CITA (
    IDCita INT PRIMARY KEY,
    Estatus NVARCHAR(50),
    Motivo NVARCHAR(255),
    Fecha DATE
);

CREATE TABLE FACTURA (
    IDPago INT PRIMARY KEY,
    FechaPago DATE,
    EstadoPago NVARCHAR(50)
);

CREATE TABLE ESTA (
    IDHistorialClinico INT,
    IDPacienteAplicante INT,
    PRIMARY KEY (IDHistorialClinico, IDPacienteAplicante),
    FOREIGN KEY (IDHistorialClinico) REFERENCES HISTORIAL(IDHistorial),
    FOREIGN KEY (IDPacienteAplicante) REFERENCES PACIENTE(IDPaciente)
);

CREATE TABLE USA (
    IDConsultorio INT,
    IDOdontologo INT,
    Horario NVARCHAR(100),
    PRIMARY KEY (IDConsultorio, IDOdontologo),
    FOREIGN KEY (IDConsultorio) REFERENCES CONSULTORIO(IDConsultorio),
    FOREIGN KEY (IDOdontologo) REFERENCES ODONTOLOGO(IDOdontologo)
);

CREATE TABLE TIENE (
    IDOdontologo INT,
    IDEspecialidad INT,
    PRIMARY KEY (IDOdontologo, IDEspecialidad),
    FOREIGN KEY (IDOdontologo) REFERENCES ODONTOLOGO(IDOdontologo),
    FOREIGN KEY (IDEspecialidad) REFERENCES ESPECIALIDAD(IDEspecialidad)
);

CREATE TABLE APLICACION_TRATAMIENTO (
    IDAplicacionTratamiento INT PRIMARY KEY,
    Observaciones NVARCHAR(MAX),
    FechaAplicacion DATE,
    IDOdontologo INT,
    IDPaciente INT,
    IDTratamiento INT,
    FOREIGN KEY (IDOdontologo) REFERENCES ODONTOLOGO(IDOdontologo),
    FOREIGN KEY (IDPaciente) REFERENCES PACIENTE(IDPaciente),
    FOREIGN KEY (IDTratamiento) REFERENCES TRATAMIENTO(IDTratamiento)
);

CREATE TABLE PAGO (
    IDPago INT,
    IDAplicacionTratamiento INT,
    PRIMARY KEY (IDPago, IDAplicacionTratamiento),
    FOREIGN KEY (IDPago) REFERENCES FACTURA(IDPago),
    FOREIGN KEY (IDAplicacionTratamiento) REFERENCES APLICACION_TRATAMIENTO(IDAplicacionTratamiento)
);

CREATE TABLE SESIONES (
    IDSesion INT PRIMARY KEY,
    IDAplicacionTratamiento INT,
    IDCita INT,
    FOREIGN KEY (IDAplicacionTratamiento) REFERENCES APLICACION_TRATAMIENTO(IDAplicacionTratamiento),
    FOREIGN KEY (IDCita) REFERENCES CITA(IDCita)
);

CREATE TABLE NECESITA (
    IDTratamiento INT,
    IDMaterial INT,
    PRIMARY KEY (IDTratamiento, IDMaterial),
    FOREIGN KEY (IDTratamiento) REFERENCES TRATAMIENTO(IDTratamiento),
    FOREIGN KEY (IDMaterial) REFERENCES MATERIAL(IDMaterial)
);

CREATE TABLE DETALLE_SESION_TRATAMIENTO (
    IDSesionTratamiento INT PRIMARY KEY,
    Observacion NVARCHAR(MAX),
    DuracionReal INT,
    Fecha DATE
);

CREATE TABLE UTILIZA (
    IDSesionTratamiento INT,
    IDMaterial INT,
    PRIMARY KEY (IDSesionTratamiento, IDMaterial),
    FOREIGN KEY (IDSesionTratamiento) REFERENCES SESIONES(IDSesion),
    FOREIGN KEY (IDMaterial) REFERENCES MATERIAL(IDMaterial)
);