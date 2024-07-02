CREATE TABLE CompaniaAerea (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE TipoAvion (
    id INT PRIMARY KEY AUTO_INCREMENT,
    modelo VARCHAR(100) NOT NULL
);

CREATE TABLE Pais (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Ciudad (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    pais_id INT,
    FOREIGN KEY (pais_id) REFERENCES Pais(id)
);

CREATE TABLE Aeropuerto (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    ciudad_id INT,
    FOREIGN KEY (ciudad_id) REFERENCES Ciudad(id)
);

CREATE TABLE Vuelo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    compania_id INT,
    tipo_avion_id INT,
    es_salida BOOLEAN,
    hora DATETIME,
    puerta VARCHAR(10),
    aeropuerto_origen_id INT,
    aeropuerto_destino_id INT,
    FOREIGN KEY (compania_id) REFERENCES CompaniaAerea(id),
    FOREIGN KEY (tipo_avion_id) REFERENCES TipoAvion(id),
    FOREIGN KEY (aeropuerto_origen_id) REFERENCES Aeropuerto(id),
    FOREIGN KEY (aeropuerto_destino_id) REFERENCES Aeropuerto(id)
);

CREATE TABLE Pasajero (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    edad INT
);

CREATE TABLE PasajeroVuelo (
    pasajero_id INT,
    vuelo_id INT,
    numero_asiento VARCHAR(10),
    PRIMARY KEY (pasajero_id, vuelo_id),
    FOREIGN KEY (pasajero_id) REFERENCES Pasajero(id),
    FOREIGN KEY (vuelo_id) REFERENCES Vuelo(id)
);