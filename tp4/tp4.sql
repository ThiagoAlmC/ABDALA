
CREATE TABLE Cliente (
    ID_Cliente VARCHAR(20) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    DNI VARCHAR(20) UNIQUE NOT NULL,
    Telefono VARCHAR(20),
    Email VARCHAR(100)
);

CREATE TABLE Coche (
    ID_Coche VARCHAR(20) PRIMARY KEY,
    Marca VARCHAR(50) NOT NULL,
    Modelo VARCHAR(50) NOT NULL,
    Num_garaje INT UNIQUE NOT NULL,
    Anio INT,
    Categoria VARCHAR(50)
);

CREATE TABLE Agencia (
    ID_Agencia VARCHAR(20) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Direccion VARCHAR(200),
    Telefono VARCHAR(20),
    Ciudad VARCHAR(100)
);

CREATE TABLE Reserva (
    ID_Reserva VARCHAR(20) PRIMARY KEY,
    ID_Cliente VARCHAR(20),
    ID_Agencia VARCHAR(20),
    Fecha_inicio DATE NOT NULL,
    Fecha_fin DATE NOT NULL,
    Costo_total DECIMAL(10, 2),
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente),
    FOREIGN KEY (ID_Agencia) REFERENCES Agencia(ID_Agencia)
);

CREATE TABLE Reserva_Coche (
    ID_Reserva VARCHAR(20),
    ID_Coche VARCHAR(20),
    PRIMARY KEY (ID_Reserva, ID_Coche),
    FOREIGN KEY (ID_Reserva) REFERENCES Reserva(ID_Reserva),
    FOREIGN KEY (ID_Coche) REFERENCES Coche(ID_Coche)
);