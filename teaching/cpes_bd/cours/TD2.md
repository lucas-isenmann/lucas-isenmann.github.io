# TD2 : SQL, Sélection, Projection, Jointure

## Sélection

Une *sélection* consiste à afficher une table `Tab`.

```sql
SELECT * FROM Tab
```

On peut demander à ne garder que les lignes qui valident une certaine condition du type `attribut = valeur`

```sql
SELECT * FROM Tab WHERE attribut = valeur
```

Si la valeur est un texte, il faut mettre des '...' autour (et pas des "...")

```sql
SELECT * FROM Tab WHERE attribut = 'Texte'
```

Pour les nombres on peut utiliser <= ou >=. Pour les chaines de caractères les <= et >= correspondent à l'ordre alphabétique.

On peut faire des conditions avec les opérateurs logiques AND et OR :

```sql
SELECT * FROM Tab WHERE attribut = valeur AND attribut2 = valeur2
```

## Questions

Quelles requêtes permettent de trouver les informations suivantes :

1. Quels cinémas ont au moins 20 salles ?

```sql solution
SELECT * FROM Cinemas WHERE nbSalles >= 20
```

2. Quels cinémas ont exactement 20 salles ?

```sql solution
SELECT * FROM Cinemas WHERE nbSalles = 20
```

3. Quels cinémas ont strictement moins de 20 salles ?

```sql solution
SELECT * FROM Cinemas WHERE nbSalles < 20
```

4. Combien de cinéma à Montpellier ont exactement 30 salles ?

```sql solution
SELECT * FROM Cinemas WHERE nbSalles = 30
```

5. Quels sont les cinémas à Lyon et à Montpellier ?

```sql solution
SELECT * FROM Cinemas WHERE ville = 'Lyon' AND ville = 'Montpellier'
```

6. Quelles sont les projections ayant lieu le samedi ?

```sql solution
SELECT * FROM Projections WHERE jour = 'Samedi'
```

7. Quels sont les projections qui projettent le film numéro 2 ?

```sql solution
SELECT * FROM Projections WHERE idFilm = 2
```

8. Quels projections sont faites dans le cinéma numéro 3 ?

```sql solution
SELECT * FROM Cinemas WHERE idCinema = 3
```

9. Quels sont les projections du film 4 ayant lieu un jeudi ?

```sql solution
SELECT * FROM Projections WHERE idFilm = 4 AND jour = 'Jeudi'
```

10. Quels projections ont lieu un jeudi ou après 21h ?

```sql solution
SELECT * FROM Cinemas WHERE jour = 'Jeudi' OR horaire >= '20:00'
```

## Projection

Une projection cache les colonnes non désirées pour n'afficher que les colonnes demandées. Il ne s'agit pas d'une suppression des données mais cela ressemble à la suppression de colonnes d'une table. La requete suivante affiche les colonnes `attribut1`, `attribut2` et `attribut3` de la table `Tab`.

```sql
SELECT attribut1, attribut2, attribut3 FROM Tab
```

11. Afficher la liste des années des films

```sql solution
SELECT annee FROM Films
```

12. Afficher la liste des réalisateurs des films

```sql solution
SELECT realisateur FROM Films
```

13. Afficher la liste des villes où il y a un cinéma qui a plus de 30 salles

```sql solution
SELECT ville FROM Cinemas WHERE nbSalles >= 30
```

## Jointure

Une jointure permet de joindre les données de deux tables et de les fusionner en une table.

```sql
SELECT * FROM Table1 JOIN Table2 ON Table1.attribut1 = Table2.attribut2
```

14. Afficher la jointure des tables Projections et Films

```sql solution
SELECT * FROM Projections
JOIN Films
ON Projectons.idFilm = Films.id
```

15.  Afficher les titres des films qui passent un Mardi

```sql solution
SELECT titre FROM Projections
JOIN Films
ON Projectons.idFilm = Films.id
WHERE jour = 'Mardi'
```

16. Afficher la colonne des réalisateurs des films qui passent à 20h

```sql solution
SELECT * FROM Projections
JOIN Films
ON Projectons.idFilm = Films.id
WHERE horaire = '20:00'
```

17. Afficher la jointure des tables Projections, Films et Cinemas

```sql solution
SELECT * FROM Projections
JOIN Films
ON Projectons.idFilm = Films.id
JOIN Cinemas
ON Projections.idCinema = Cinemas.id
```

18. Afficher la colonne des titres des films qui passent à Montpellier

```sql solution
SELECT titre FROM Projections
JOIN Films
ON Projectons.idFilm = Films.id
JOIN Cinemas
ON Projections.idCinema = Cinemas.id
WHERE Projections.ville = 'Montpellier'
```

19. Afficher la colonne des titres des films qui passent dans un Pathé les jeudis

```sql solution
SELECT titre FROM Projections
JOIN Films
ON Projectons.idFilm = Films.id
JOIN Cinemas
ON Projections.idCinema = Cinemas.id
WHERE Cinemas.marque = 'Pathé' AND jour = 'Jeudi'
```


## Cas d'étude : schéma Produit, Achat, Client

Répondre aux questions à partir du fichier `pac.odb`.

20. Afficher la liste les libellés des produits

```sql solution
SELECT Lib FROM Produits
```

21. Afficher la liste des noms des clients

```sql solution
SELECT Nom FROM Clients
```

22. Afficher tous les produits dont la quantité en stock est supérieure ou égale à 50

```sql solution
SELECT * FROM Produits
WHERE Quantite >= 50
```

23. Afficher tous les achats dont la quantité achetée est supérieure à 10

```sql solution
SELECT * FROM Achats
WHERE Quantite >= 10
```

24. Afficher les quantités en stock et les couleurs des lampes

```sql solution
SELECT Quantite, Couleur FROM Produits
WHERE Lib = 'Lampe'
```

25. Afficher les numéros des crayons de luxe dont la quantité en stock est supérieure à 20

```sql solution
SELECT NP FROM Produits
WHERE Lib = 'CrayonLuxe' AND Quantite >= 20
```

26. Afficher les numéros des clients ayant fait des achats de quantité supérieure à 10.

```sql solution
SELECT NCLI FROM Achats
WHERE Quantite >= 10
```

27. Dresser la liste des numéros des clients qui ont acheté des lampes.

```sql solution
SELECT NCLI FROM Achats
JOIN Produits
ON Achats.NP = Produits.NP
WHERE Lib = 'Lampe'
```

28. Afficher la liste des numéros des clients ayant acheté des lampes rouges

```sql solution
SELECT NCLI FROM Achats
JOIN Produits
ON Achats.NP = Produits.NP
WHERE Lib = 'Lampe' AND Couleur = 'Rouge'
```

28. Afficher la liste des produits (libellé) dont il existe un achat de quantité supérieure à 10.

```sql solution
SELECT Lib FROM Achats
JOIN Produits
ON Achats.NP = Produits.NP
WHERE Quantite >= 10
```

29. Afficher la liste des noms des clients qui ont acheté des crayons de luxe en quantité
supérieure à 2.

```sql solution
SELECT Nom FROM Achats
JOIN Produits
ON Achats.NP = Produits.NP
JOIN Clients
ON Achats.NCLI = Clients.NCLI
WHERE Lib = 'LampeLuxe' AND Achats.Quantite >= 2
```
