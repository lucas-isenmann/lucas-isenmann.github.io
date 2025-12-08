
# ORDER BY

SELECT * FROM Cinemas ORDER BY NbSalles

SELECT * FROM Cinemas ORDER BY NbSalles DESC

# COUNT 

SELECT COUNT(*) FROM Cinemas

SELECT COUNT(DISTINCT Ville) FROM Cinemas

SELECT COUNT(*) FROM Cinemas WHERE NbSalles = 20

SELECT COUNT(DISTINCT Marque) FROM Cinemas WHERE NbSalles >= 20

SELECT COUNT(DerniereAP) FROM Films

# MAX MIN

SELECT MAX(NbSalles) FROM Cinemas

SELECT ID FROM Cinemas WHERE NbSalles = (SELECT MAX(NbSalles) FROM Cinemas)

SELECT ID FROM Cinemas WHERE NbSalles = (SELECT MIN(NbSalles) FROM Cinemas)

SELECT IdFilm FROM Projections WHERE Horaire = (SELECT MIN(Horaire) FROM Projections)

# AVG

SELECT AVG(NbSalles) FROM Cinemas

SELECT * FROM Cinemas WHERE NbSalles < (SELECT AVG(NbSalles) FROM Cinemas)

..

# GROUP BY


SELECT IdFilm FROM (SELECT COUNT(*) AS NbProjections,IdFilm FROM Projections GROUP BY IdFilm) WHERE NbProjections = (SELECT MAX(NbProjections) FROM (SELECT COUNT(*) AS NbProjections,IdFilm FROM Projections GROUP BY IdFilm)) 

SELECT COUNT(*), Jour FROM Projections GROUP BY Jour



# PAC


SELECT MIN(QuantiteTotale) FROM
(SELECT SUM(Quantite) AS QuantiteTotale,NCLI FROM Achats GROUP BY NCLI)



SELECT * FROM Achats AS Achats2
WHERE 
Achats2.Quantite =
(SELECT Quantite FROM 

(SELECT MAX(Quantite),NCLI FROM Achats GROUP BY NCLI)
WHERE NCLI = Achats2.NCLI
)



# Derniere Question

SELECT * FROM
(
    SELECT SUM(Achats.Quantite) AS QuantiteAchetee, Nom FROM Achats 
    JOIN Clients ON Achats.NCLI = Clients.NCLI 
    JOIN Produits ON Achats.NP = Produits.NP
    WHERE Produits.Couleur = 'Bleu'
    GROUP BY Nom
)
WHERE QuantiteAchetee = 
( SELECT MAX(QuantiteAchetee) FROM
    SELECT SUM(Achats.Quantite) AS QuantiteAchetee, Nom FROM Achats 
    JOIN Clients ON Achats.NCLI = Clients.NCLI 
    JOIN Produits ON Achats.NP = Produits.NP
    WHERE Produits.Couleur = 'Bleu'
    GROUP BY Nom
)

