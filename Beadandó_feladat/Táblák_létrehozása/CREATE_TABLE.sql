CREATE TABLE Tulajdonos (
    tulaj_id INT PRIMARY KEY,
    nev NVARCHAR(100) NOT NULL,
    email NVARCHAR(100),
    telefon NVARCHAR(20) NOT NULL,
    tipus NVARCHAR(20) CHECK (tipus IN ('Magánszemély', 'Cég')) NOT NULL
);

CREATE TABLE Kereskedo (
    kereskedo_id INT PRIMARY KEY,
    nev NVARCHAR(100) NOT NULL,
    email NVARCHAR(100) NOT NULL,
    eletkor INT CHECK (eletkor >= 18) NOT NULL,
    munkakezd DATE CHECK (munkakezd >= '1900-01-01' AND munkakezd <= GETDATE()) NOT NULL
);

CREATE TABLE Vevo (
    vevo_id INT PRIMARY KEY,
    nev NVARCHAR(100) NOT NULL,
    email NVARCHAR(100),
    telefon NVARCHAR(20) NOT NULL
);

CREATE TABLE Auto (
    auto_id INT PRIMARY KEY,
    marka NVARCHAR(50) NOT NULL,
    modell NVARCHAR(50) NOT NULL,
    kategoria NVARCHAR(20) NOT NULL,
    evjarat INT CHECK (evjarat >= 1900 AND evjarat <= YEAR(GETDATE())) NOT NULL,
    uzemanyag NVARCHAR(20) CHECK (uzemanyag IN ('Benzin', 'Dízel', 'Hibrid', 'Elektromos')) NOT NULL,
    sebvalto NVARCHAR(20) CHECK (sebvalto IN ('Manuális', 'Autómata')) NOT NULL,
    lista_ar DECIMAL(12,2) NOT NULL,
    regisztracio_datum DATE NOT NULL,
    regisztralta INT NOT NULL FOREIGN KEY REFERENCES Kereskedo(kereskedo_id),
);

CREATE TABLE Allapot (
    allapot_id INT IDENTITY(1,1) PRIMARY KEY,
    auto_id INT NOT NULL FOREIGN KEY REFERENCES Auto(auto_id),
    allapot NVARCHAR(50) CHECK (allapot IN ('Normál', 'Kitűnő', 'Megkímélt', 'Újszerű', 'Külső sérülés', 'Műszaki hibás', 'Törött volt')) NOT NULL,
    vizsgalat_datum DATE NOT NULL,
    km_ora INT NOT NULL
);

CREATE TABLE Ertekesites (
    ertekesites_id INT PRIMARY KEY,
    auto_id INT NOT NULL FOREIGN KEY REFERENCES Auto(auto_id),
    vevo_id INT NOT NULL FOREIGN KEY REFERENCES Vevo(vevo_id),
    kereskedo_id INT NOT NULL FOREIGN KEY REFERENCES Kereskedo(kereskedo_id),
    tulaj_id INT NOT NULL FOREIGN KEY REFERENCES Tulajdonos(tulaj_id),
    eladas_datum DATE NOT NULL,
    ar DECIMAL(12,2) NOT NULL
);
