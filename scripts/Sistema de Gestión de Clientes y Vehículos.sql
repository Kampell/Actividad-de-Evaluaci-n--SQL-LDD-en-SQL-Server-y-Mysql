CREATE TABLE Clientes (
    NumeroCliente INT PRIMARY KEY,
    Nombre NVARCHAR(100),
    Apellido1 NVARCHAR(100),
    Apellido2 NVARCHAR(100),
    CURP NVARCHAR(18),
    Telefono NCHAR(12),
    Calle NVARCHAR(50),
    Ciudad NVARCHAR(20),
    Numero INT
);

CREATE TABLE Sucursal (
    NumeroSucursal INT PRIMARY KEY,
    Nombre NVARCHAR(20),
    Ubicacion NVARCHAR(25)
);

CREATE TABLE Vehiculo (
    NumeroVehiculo INT PRIMARY KEY,
    Placa NVARCHAR(8),
    Marca NVARCHAR(15),
    Modelo NVARCHAR(20),
    Anio INT,
    NumeroCliente INT,
    NumeroSucursal INT,
    FOREIGN KEY (NumeroCliente) REFERENCES Clientes(NumeroCliente),
    FOREIGN KEY (NumeroSucursal) REFERENCES Sucursal(NumeroSucursal)
);