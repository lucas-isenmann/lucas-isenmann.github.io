# TD5 : Révisions

## Exercice 1 : Modélisation

Modéliser la situation suivante en décrivant les tables et les clés primaires et étrangères.
Des licences à l'université sont formés de groupes d'étudiants.
On doit pouvoir répondre aux questions suivantes :

- quels sont les noms des étudiants ?
- quels sont les noms des groupes ?
- quels sont les noms des licences ?
- dans quel groupe appartient un étudiant ?
- dans quel licence appartient un groupe ?

### Solution

| Etudiants | |
|-|-|
| id | entier (clef primaire) |
| nom | texte |
| idGroupe | entier (clef étrangère vers id de Groupe)

| Groupes | |
|-|-|
| id | entier (clef primaire) |
| nom | texte |
| idLicence | entier (clef étrangère vers id de Licence)

| Licences | |
|-|-|
| id | entier (clef primaire) |
| nom | texte |


## Exercice 2 : Modélisation

Modéliser la situation suivante en décrivant les tables et les clés primaires et étrangères.
Des astronautes vont dans des stations spatiales.
On doit pouvoir répondre aux questions suivantes :

- quels sont les noms des astronautes ?
- quels sont les noms des stations ?
- combien de stations a visitées tel astronaute ?
- combien d'astronautes sont venus visité telle station ?

### Solution

| Stations | |
|-|-|
| id | entier (clef primaire) |
| nom | texte |

| Astronautes | |
|-|-|
| id | entier (clef primaire) |
| nom | texte |

| Visites | |
|-|-|
| idAstronaute | entier (clef étrangère vers id de Astronautes) |
| idStation | entier (clef étrangère vers id de Stations) |

## Exercice 3 : Bibliotheques

La base de données `bibliotheques.odb` possède les tables suivantes :

| Refs | |
|-|-| 
| id | entier (clef primaire)
| titre | texte
| restriction | entier

| Abonnes | |
|-|-|
| id | entier (clef primaire)
| nom | texte
| age | entier

| Bibliotheques | |
|-|-|
| id | entier (clef primaire)
| nom | texte
| ville | texte


| Abonnements | |
|-|-|
| id | entier (clef primaire) |
| idBibli | entier (clef étrangère vers id de Bibliotheques) |
| idAbonne | entier (clef étrangère vers id de Abonnes)
| annee | entier

| Exemplaires | |
|-|-|
| id | entier (clef primaire)
| idRef | entier (clef étrangère vers id de Refs)
| idBibli | entier (clef étrangère vers id de Bibliotheques)
| idAbonne | entier (clef étrangère vers id de Abonnes)
| etat | texte

 quelles requêtes permettent de répondre aux questions suivantes :

1. Combien y a t-il de bibliothèques dans la base de données ?

```sql solution
SELECT COUNT(*) FROM Bibliotheques
```

2. Combien y a t-il de bibliothèques à Montpellier ?
  
```sql solution
SELECT COUNT(*) FROM Bibliotheques
WHERE ville = 'Montpellier'
```

3. Combien y a t-il d'abonnées dans la base de données ?

```sql solution
SELECT COUNT(*) FROM Abonnes
```

4. Combien y a t-il d'abonnées de moins de 12 ans ?

```sql solution
SELECT COUNT(*) FROM Abonnes
WHERE age < 12
```

5. Afficher la liste des livres triée par ordre alphabétique par rapport au nom.

```sql solution
SELECT * FROM Refs
ORDER BY titre
```

6. Combien y a t-il d'exemplaires pour la référence 2 ?

```sql solution
SELECT COUNT(*) FROM Exemplaires
WHERE idRef = 2
```

7. Quels sont les identifiants des références qui sont à la biliothèques 4 et qui ne sont pas empruntés ? On pourra utiliser `IS NULL` pour savoir si l'attribut `idAbonne` est nul (au lieu de faire `= NULL`).

```sql solution
SELECT idRef FROM Exemplaires
WHERE idBibli = 4 AND idAbonne IS NULL
```

8. Quels sont les identifiants des références qui ont au moins 1 exemplaire emprunté ?


```sql solution
SELECT idRef FROM Exemplaires WHERE isAbonne IS NOT NULL
```

```sql solution
SELECT idRef FROM Exemplaires
GROUP BY idRef
HAVING COUNT(idAbonne) > 0
```

9. Afficher les identifiants des bibliothèques avec le nombre d'exemplaires dans chacune.

```sql solution
SELECT idBibli,COUNT(*) FROM Exemplaires
GROUP BY idBibli
```

10. Quelle est la bibliothèque qui a le plus d'exemplaires ?

```sql solution
SELECT idBibli FROM
( 
SELECT idBibli,COUNT(*) AS nbExemplaires FROM Exemplaires
GROUP BY idBibli
) 
WHERE nbExemplaires = (
    SELECT MAX(nbExemplaires) FROM 
    (SELECT idBibli,COUNT(*) AS nbExemplaires FROM Exemplaires
    GROUP BY idBibli)
)
```

1.  Quels sont les noms des abonnés qui ont emprunté un exemplaire de la référence ayant pour identifiant 9 ?

```sql solution
SELECT nom FROM Exemplaires 
JOIN Abonnes 
ON Exemplaires.idAbonne = Abonnes.id
WHERE idRef = 9
```

12. Quels sont les abonnements qui sont de l'année avant 2023 ?
  
```sql solution
SELECT * FROM Abonnements
WHERE annee < 2023
```

13. Quels sont les identifiants des bibliothèques auxquelles l'abonné 4 a il était abonné ?

```sql solution
SELECT idBibli FROM Abonnements
WHERE idAbonne = 4
```

14. Quels sont les noms des bibliothèques auxquelles l'abonné 'Dubois' a il été abonné ?

```sql solution
SELECT Bibliotheques.nom FROM Abonnements 
JOIN Bibliotheques 
ON Abonnements.idBibli = Bibliotheques.id
JOIN Abonnes
ON Abonnements.idAbonne = Abonnes.id
WHERE Abonnes.nom = 'Dubois'
```

15. Quels sont les noms des abonnés qui ont au moins 1 emprunt en cours ?

```sql solution
SELECT nom FROM Abonnes
WHERE EXISTS (
SELECT * FROM Exemplaires
WHERE Exemplaires.idAbonne = Abonnes.id
)
```

16. Afficher les identifiants des bibliothèques qui ont 2 abonnés ou moins en 2023.

```sql solution
SELECT idBibli 
FROM Abonnements
WHERE annee = 2023
GROUP BY idBibli
HAVING COUNT(*) <= 2
```

17. Combien chaque bibliothèque a d'exemplaires en bon état ? (Afficher l'identifiant de la bibliothèque)

```sql solution
SELECT idBibli,COUNT(*) FROM Exemplaires
WHERE etat = 'bon'
GROUP BY idBibli
```

18. Combien y a t-il d'emprunts qui ne respectent pas les restrictions d'age qu'un abonné de moins de 12 ne peut pas normalement emprunter un livre restreint ?

```sql solution
SELECT COUNT(*) FROM Exemplaires
JOIN Refs
ON Refs.id = Exemplaires.idRef
JOIN Abonnes
ON Abonnes.id = Exemplaires.idAbonne
WHERE age < 12 AND restriction = 1
```