# TD3 : fonctions d'agrégation, GROUP BY

## ORDER BY : trier

La requête suivante permet de trier les lignes d'une table `Tab` selon l'attribut `attribut`.

```sql
SELECT * FROM Tab ORDER BY attribut;
```

Pour trier en ordre décroissant on rajoute le mot clef DESC

```sql
SELECT * FROM Tab ORDER BY attribut DESC;
```

## Questions

Dans la base de données `cinema.odb`, quelles requêtes permettent de trouver les informations suivantes :

1. Trier les cinémas par ordre de nombre de salles croissantes pui par ordre de nombre de salles décroissantes.

```sql solution
SELECT * FROM Cinemas ORDER BY NbSalles
```

2. Trier les projections par horaire croissant.

```sql solution
SELECT * FROM Cinemas ORDER BY NbSalles DESC
```



## COUNT

La requête suivante compte le nombre de lignes de la table `Tab` :

```sql
SELECT COUNT(*) FROM Tab
```

Si l'on veut compter le nombre de lignes de cette table dont l'attribut `attribut` est différent de `NULL`,on utilise la requête suivante :

```sql
SELECT COUNT(attribut) FROM tab
```

Si l'on veut compter le nombre de lignes de cette table dont l'attribut `attribut` est différent de `NULL` et que l'on ne veut pas compter les doublons, on utilise la requête suivante :

```sql
SELECT COUNT(DISTINCT attribut) FROM Tab
```

On peut utiliser COUNT conjointement avec tous les autres mots clefs vus précédemment. Par exemple avec WHERE on peut compter le nombre de lignes dont un attribut est égal à une certaine valeur :

```sql
SELECT COUNT(*) FROM Tab WHERE attribut = valeur
```

## Questions

3. Combien y a t-il de cinémas ?

```sql solution
SELECT COUNT(*) FROM Cinemas
```

4. Combien y a t-il de villes qui possèdent un cinéma ?

```sql solution
SELECT COUNT(DISTINCT Ville) FROM Cinemas
```

5. Combien y a t-il de cinéma qui ont 20 salles exactement ?

```sql solution
SELECT COUNT(*) FROM Cinemas WHERE NbSalles = 20
```

6. Combien y a t-il de marques de cinéma qui possèdent un cinéma qui a au moins 20 salles ?

```sql solution
SELECT COUNT(DISTINCT Marque) FROM Cinemas WHERE NbSalles >= 20
```

7. Combien y a t-il de films qui ont eu une avant première ?

```sql solution
SELECT COUNT(DerniereAP) FROM Films
```

## MAX et MIN

La requête suivante permet de calculer le maximum d'un attribut dans une table :

```sql
SELECT MAX(attribut) FROM Tab
```

On peut utiliser ce mot clef conjointement avec un WHERE pour afficher des informations qui permettent de savoir quelle ligne réalise le maximum :

```sql
SELECT * FROM Tab WHERE attribut = (SELECT MAX(attribut) FROM Tab)
```

La requête MIN est analogue.

## Questions

8. Quel est le plus grand nombre de salles dans les cinémas ?

```sql solution
SELECT MAX(NbSalles) FROM Cinemas
```


9.  Quels sont les ID des cinémas qui ont le plus grand nombre de salles ?

```sql solution
SELECT ID FROM Cinemas WHERE NbSalles = (SELECT MAX(NbSalles) FROM Cinemas)
```

10. Quels sont les ID des cinémas qui ont le moins grand nombre de salles ?

```sql solution
SELECT ID FROM Cinemas WHERE NbSalles = (SELECT MIN(NbSalles) FROM Cinemas)
```

11. Quels sont les films qui sont projetés le plus tôt dans la journée ?

```sql solution
SELECT IdFilm FROM Projections WHERE Horaire = (SELECT MIN(Horaire) FROM Projections)
```

## AVG : Average

La requête suivante permet de calculer la moyenne d'un attribut dans une table :

```sql
SELECT AVG(attribut) FROM Table
```

## Questions

12. Quelle est la moyenne du nombre de salles des cinémas ?

```sql solution
SELECT AVG(NbSalles) FROM Cinemas
```

13. Quels cinémas ont moins de salles que la moyenne ?

```sql solution
SELECT * FROM Cinemas WHERE NbSalles < (SELECT AVG(NbSalles) FROM Cinemas)
```

14. Quelle est la moyenne des dates de sorties des films ?

```sql solution
SELECT AVG(Annee) FROM Films
```

## SUM : Somme

La requête suivante permet de calculer la somme d'un attribut dans une table :

```sql
SELECT SUM(attribut) FROM Tab
```

## Questions

15. Quelle est le nombre total de salles des cinémas ?

```sql solution
SELECT SUM(NbSalles) FROM Cinemas
```

## GROUP BY

Les précédentes fonctions : COUNT, MAX, MIN, AVG et SUM sont appelées fonctions d'agrégation. Pour ces fonctions là, on peut demander à calculer ces quantités sur `attribut_numerique` pour chaque groupe de lignes ayant en commun une certaine valeur pour un autre attribut `attribut_groupe`.

```sql
SELECT FONCTION(attribut_numerique), attribut_groupe FROM Table GROUP BY attribut_groupe
```

## Questions

16. Combien y a t-il de salles dans chaque ville ?

```sql solution
SELECT Ville,SUM(NbSalles)
FROM Cinemas
GROUP BY Ville
```

17. Combien de cinémas y a t-il de chaque marque ?

```sql solution
SELECT Marque,SUM(NbSalles)
FROM Cinemas
GROUP BY Marque
```

18. Quel est l'id du film le plus projeté ?

```sql solution
SELECT IdFilm FROM 
(SELECT COUNT(*) AS NbProjections,IdFilm FROM Projections GROUP BY IdFilm) 
WHERE NbProjections = (
    SELECT MAX(NbProjections) FROM (SELECT COUNT(*) AS NbProjections,IdFilm FROM Projections GROUP BY IdFilm)
    ) 
```

19. Combien y a t-il de films projetés le lundi, le mardi, .... ?

```sql solution
SELECT COUNT(*), Jour FROM Projections 
GROUP BY Jour
```

20. Combien de films chaque réalisateur a fait ?

```sql solution
SELECT Realisateur,COUNT(*)
FROM Films
GROUP BY Realisateur
```

## Cas d'étude : schéma Produit, Achat, Client

Dans la base de données `pac.odb`, quelles requêtes permettent de trouver les informations suivantes :

21. Quel est la somme des quantités en stock des produits ?

```sql solution
SELECT SUM(Quantite)
FROM Produits
```

22. Quels sont les NP des produits ayant le moins de quantité en stock ?

```sql solution
SELECT NP
FROM Produits
WHERE Quantite = (
    SELECT MIN(Quantite)
    FROM Produits
)
```

23. Combien y a t-il de produits rouges ?

```sql solution
SELECT COUNT(*)
FROM Produits
WHERE Couleur = 'Rouge'
```

24. Quel est la quantité en stock des produits rouges ?

```sql solution
SELECT SUM(Quantite)
FROM Produits
WHERE Couleur = 'Rouge'
```

25. Quels sont les quantités en stock des produits pour chaque couleur ?

```sql solution
SELECT Couleur, SUM(Quantite)
FROM Produits
GROUP BY Couleur
```

26. Quelle est la moyenne des quantités achetés ?

```sql solution
SELECT AVG(Quantite)
FROM Achats
```

27. Quelle quantité le client NCLI=101 a t-il acheté ?

```sql solution
SELECT SUM(Quantite)
From Achats
WHERE NCLI = 101
```

28. Quelles quantités les clients ont-il achetés par client ? Afficher les noms des clients.

```sql solution
SELECT Nom, SUM(Quantite)
FROM Achats
JOIN Clients
ON Achats.NCLI = Clients.NCLI
GROUP BY NCLI, Nom
```

ou

```sql solution
SELECT Nom
FROM Clients
JOIN (
    SELECT NCLI, SUM(Quantite) AS QuantiteAchetee
    FROM Achats
    GROUP BY NCLI
) AS Tab
ON Clients.NCLI = Tab.NCLI
```


29.  Quel est le nom du client qui a le moins acheté ?

```sql solution
SELECT Nom
FROM Clients
JOIN (
    SELECT NCLI, SUM(Quantite) AS QuantiteAchetee
    FROM Achats
    GROUP BY NCLI
    ) AS Tab
ON Clients.NCLI = Tab.NCLI
WHERE QuantiteAchetee = (SELECT MIN(QuantiteAchetee) FROM (
    SELECT NCLI, SUM(Quantite) AS QuantiteAchetee
    FROM Achats
    GROUP BY NCLI
))
```

30. Quel est le nom du client qui a acheté le plus d'objets de couleur Bleu ?
  
```sql solution
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
```
