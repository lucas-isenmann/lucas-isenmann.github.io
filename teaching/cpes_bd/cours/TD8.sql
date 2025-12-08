PRAGMA foreign_keys = ON;

CREATE TABLE Produits (
    id INT PRIMARY KEY,
    nom TEXT,
    quantite INT,
    prix INT
);

CREATE TABLE Ressources(
    id INT PRIMARY KEY,
    nom TEXT,
    quantite INT
);

CREATE TABLE Utilisations(
    id INT PRIMARY KEY,
    idProduit INT,
    idRessource INT,
    quantite INT,
    FOREIGN KEY(idProduit) REFERENCES Produits(id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    FOREIGN KEY(idRessource) REFERENCES Ressources(id) ON DELETE RESTRICT ON UPDATE RESTRICT
);


CREATE TABLE Laborantins(
    id INT PRIMARY KEY,
    nom TEXT,
    prime INT
);

CREATE TABLE Materiels(
    id INT PRIMARY KEY,
    nom TEXT,
    etat TEXT,
    idLaborantin INT UNIQUE,
    FOREIGN KEY(idLaborantin) REFERENCES Laborantins(id) ON DELETE RESTRICT ON UPDATE RESTRICT
);




-- 1. Le laboratoire achète 10L de mercure, 10L de calcium, 10L de carbone

INSERT INTO Ressources
VALUES
(0,'mercure',10),
(1,'calcium',10),
(2,'carbone',10);

-- 2. Acheter 3 cuves et 1 bécher

INSERT INTO Materiels
VALUES
(0,'cuve','utilisable',NULL),
(1,'cuve','utilisable',NULL),
(2,'cuve','utilisable',NULL),
(3,'bécher','utilisable',NULL);


-- 3. Recruter 3 laborantins

INSERT INTO Laborantins
VALUES
(0,'Jean-Phénix',0),
(1,'Jean-Jean',0),
(2,'Jean-Eudes',0);

-- 4. Lancer la fabrication de 2L de détergent dans une cuve

UPDATE Ressources
SET quantite = 6
WHERE nom = 'mercure';

UPDATE Ressources
SET quantite = 8
WHERE nom = 'calcium';

UPDATE Materiels
SET etat = 'utilisé', idLaborantin = 0
WHERE id = 0;

-- 5. Lancer la fabrication de 3L de savon dans une autre cuve avec la formule : 1L de mercure, 1L de calcium, 1L de carbone + 2 cuves = 1L de savon

UPDATE Ressources
SET quantite = quantite - 3
WHERE nom = 'mercure' OR nom = 'calcium' OR nom = 'carbone';

UPDATE Materiels
SET etat = 'utilisé', idLaborantin = 1
WHERE id = 1;

UPDATE Materiels
SET etat = 'utilisé', idLaborantin = 2
WHERE id = 2;

-- 6. Une fois que la fabrication de détergent est faite, payer le laborantin et désaffecter la cuve et le laborantin

UPDATE Materiels
SET etat = 'sale', idLaborantin = NULL
WHERE id = 0;

UPDATE Laborantins
SET prime = prime + 1
WHERE id = 0;

INSERT INTO Produits
VALUES
(0,'détergent',2 ,5);

-- 7. Nettoyer les cuves sales

UPDATE Materiels
SET etat = 'utilisable'
WHERE etat = 'sale';

-- 8. Le savon est terminé

UPDATE Materiels
SET etat = 'sale', idLaborantin = NULL
WHERE id = 1 OR id = 2;

UPDATE Laborantins
SET prime = prime + 3
WHERE id = 1 OR id = 2;

INSERT INTO Produits
VALUES
(1, 'savon', 3, 10);

-- 9. Nettoyer les cuves sales

UPDATE Materiels
SET etat = 'utilisable'
WHERE etat = 'sale';
