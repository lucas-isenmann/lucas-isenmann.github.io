-- Exercice 1 : solutions


PRAGMA foreign_keys = ON;

CREATE TABLE Pokemons (
    Id INT PRIMARY KEY NOT NULL,
    Nom TEXT,
    Force INT NOT NULL,
    Defense INT NOT NULL
);

CREATE TABLE Dresseurs(
    Id INT PRIMARY KEY NOT NULL,
    Nom TEXT,
    IdPokemon1 INT, 
    IdPokemon2 INT,
    FOREIGN KEY(IdPokemon1) REFERENCES Pokemons(Id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    FOREIGN KEY(IdPokemon2) REFERENCES Pokemons(Id) ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE TABLE Arenes(
    Id INT PRIMARY KEY NOT NULL,
    Nom TEXT
);

CREATE TABLE Maitres(
    IdDresseur INT UNIQUE NOT NULL,
    IdArene INT UNIQUE NOT NULL,
    FOREIGN KEY(IdDresseur) REFERENCES Dresseurs(id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    FOREIGN KEY(IdArene) REFERENCES Arenes(id) ON DELETE RESTRICT ON UPDATE RESTRICT
);


INSERT INTO Pokemons
VALUES
(0,'Bulbizare',10,20),
(1,'Florizare',10,10),
(2,'Herbizare',10,20),
(3,'Salameche',10,5);

INSERT INTO Dresseurs
VALUES
(0,'Sacha',0,1),
(1,'Jo',0,NULL);

INSERT INTO Arenes
VALUES
(0,'Montpellier'),
(1,'Bordeaux');




