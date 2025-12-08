# Examen - HAS251I - Solutions

Date : 12/06/23. Durée : 2h. Bareme : 27 points. Toutes les questions sont sur 1 point.

## Exercice 1

Dans cet exercice on considère la base de données définie dans l'annexe.

1. En SQLite, quelle est la requête pour créer la table `Appartenances` (on suppose que les autres tables ont déjà été créées) ?

```sql solution
CREATE TABLE Appartenances(
    Id INT PRIMARY KEY NOT NULL,
    IdMusee INT NOT NULL,
    IdPeintre INT NOT NULL,
    Debut INT NOT NULL,
    Fin INT,
    FOREIGN KEY IdMusee REFERENCES(Musees.Id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    FOREIGN KEY IdPeintre REFERENCES(Peintres.Id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
```

2. En SQLite, on suppose que toutes les tables ont été créées et que la base de données est vide. Quelle est la requête pour insérer les 3 peintres dans la base de données ?

```sql solution
INSERT INTO Peintres
VALUES
(0,'De Vinci'),
(1,'Velasquez'),
(2,'Vigée Le Brun');
```

3. Est-il possible qu'un tableau soit réalisé par plusieurs peintres ?

Non, car la clef étrangère d'un tableau référence un seul peintre.

4. Dans cette base de données, est-il possible qu'un tableau ait appartenu à plusieurs musées en même temps ? Justifier si ce n'est pas le cas. Donner un exemple de données à insérer dans les tables.

Oui. Il suffit de rajouter une ligne avec les mêmes dates pour un tableau. Par exemple `(7,1,1,2000,NULL)`.

<!-- 5. Dans cette base de données, pourquoi un tableau a forcément un peintre associé ? Que faudrait-il changer pour qu'il soit possible qu'un tableau n'en ai pas forcément ?

```solution
    Car le champ IdPeintre est NOT NULL. Il faudrait changer cela en enlevant le NOT NULL.
``` -->

5. Dans cette base de données, comment justifier que l'attribut Debut de `Appartenances` est NOT NULL alors que `Fin` ne l'est pas ?

Car on sait à partir de quelle année un tableau est entré dans un musée mais s'il est actuellement dedans on ne sait pas quand il peut en sortir.

6. Quelle requête SQL permet de dresser la liste des titres des tableaux peints par le peintre numéro 2 ?

```sql solution
SELECT Titre FROM Tableaux
WHERE IdPeintre = 2
```

7. Quelle est la formule en algèbre relationnel de cette dernière requête ?

$ \pi_{Titre}( \sigma_{IdPeintre = 2}(Tableaux) )$

8. Quelle est la table résultat de cette dernière requête ?

| Titre |
|-|
| Portrait de l'impératrice | 
| Caroline Murat |


9.  Quelle requête SQL permet de dresser la liste des noms des peintres dont un tableau a appartenu au musée numéro 1 ? 

```sql solution
SELECT Peintres.Nom FROM Peintres
JOIN Tableaux
ON Peintres.Id = Tableaux.IdPeintre
JOIN Appartenances
ON Tableaux.Id = Appartenances.IdTableau
WHERE Appartenances.IdMusee = 1
```

10. Traduire la requête de la question 9 en algèbre relationnelle.

$\pi_{Peintres.Nom}(\sigma_{IdMusee = 1}( (Peintres \bowtie_{Peintres.Id = IdPeintre} Tableaux )\bowtie_{Tableaux.Id = IdTableau} Appartenances))$

11. Quelle est la relation $\sigma_{Ville = Brest \text{ et } Taille \geq 2000} (Musees)\cup \sigma_{Ville = Rouen}(Musees)$ ? (C'est-à-dire qu'il faut donner le résultat, pas la traduction en SQL)

| Id | Musee | Ville | Taille |
|---|--------------------|-|-|
| 2 | Musée de la Marine | Brest | 4000 |
| 0 | Musée des Beaux-Arts | Rouen | 2000 |
| 1 | Musée des Antiquités | Rouen | 300 |

12. Quelle est la relation $\sigma_{Annee \leq 1700}(Tableaux) \cap \sigma_{Annee \geq 1600}(Tableaux)$ ?
 
| Id | Titre | Annee | IdPeintre |
|-|-|-|-|
| 2 | La Tunique de Joseph | 1630 | 1
| 3 | Les Fileuses | 1657 | 1 

13. Quelle est la relation $\sigma_{Annee \geq 1700}(Tableaux) \times \sigma_{Taille \geq 2000}(Musees)$ ?

| Tableaux.Id | Titre | Annee | IdPeintre | Musees.Id | Nom | Ville | Taille |
|-|-|-|-|-|-|-|-|
| 4 | Portrait de l'impératrice | 1799 | 2 | 0 | Musée des Beaux-Arts | Rouen | 2000
| 5 | Caroline Murat | 1807 | 2  | 0 | Musée des Beaux-Arts | Rouen | 2000
| 4 | Portrait de l'impératrice | 1799 | 2 | 2 | Musée de la Marine | Brest | 4000
| 5 | Caroline Murat | 1807 | 2 | 2 | Musée de la Marine | Brest | 4000

<!-- 11. Quelle requête permet d'obtenir les numéros des tableaux qui été exposés en 1850 ?

```sql solution
SELECT IdTableau FROM Appartenances
WHERE Debut <= 1850 AND 1850 <= Fin
```

1.  Quelle requête permet de connaitre la somme des tailles de tous les musées ?

```sql solution
SELECT SUM(Taille) FROM Musees
```

13. Quelle requête permet de connaitre la somme des tailles de tous les musées de Rouen ?

```sql solution
SELECT SUM(Taille) FROM Musees
WHERE Ville = 'Rouen'
``` -->

14.  Quelle requête permet de connaitre par musée le nombre de tableaux qui y appartenaient en 1750 ? On affichera le numéro des musées et le nombre de tableaux.

```sql solution
SELECT IdMusee,COUNT(*) FROM Appartenances
WHERE Debut <= 1750 AND 1750 <= Fin
GROUP BY IdMusee
```


15. Quelle requête permet de connaitre le titre du plus vieux tableau ?

```sql solution
SELECT Titre FROM Tableaux
WHERE Annee = (SELECT MIN(Annee) FROM Tableaux)
```


16. Tous les tableaux actuellement dans les musées sortent de leur musée. Quelle requête permet de faire cela sur la table Appartenances (on mettra 2023 à l'année de sortie de ces tableaux) ?

```sql solution
UPDATE Appartenances
SET Fin = 2023
WHERE Fin IS NULL
```

17. Quelle requête permet de supprimer le tableau numéro 4 de la table Tableau ? Est ce que cela va provoquer une erreur (justifier) ?

```sql solution
DELETE FROM Tableaux
WHERE Id = 4
```

Cela va provoquer une erreur car le tableau numéro 4 est référéncé par la table Appartenances qui est en mode RESTRICT pour la suppression.

18. Quelle requête permet de supprimer toutes les appartenances du musée numéro 1 ? Est ce que cela va provoquer une erreur (justifier) ?

```sql solution
DELETE FROM Appartenances
WHERE IdMusee = 1
```

Cela ne va pas provoquer d'erreur car aucune autre table ne référence les Id de la table Appartenances.

19. Quelle requête permet de mettre à NULL les années des tableaux du peintre numéro 1 ? Est ce que cela va provoquer une erreur (justifier) ?

```sql solution
UPDATE Tableaux
SET Annee = NULL
WHERE IdPeintre = 1
```

Non car Annee n'est pas en NOT NULL.


20. Quelle requête permet de mettre à NULL l'attribut IdPeintre du tableau numéro 0 ? Est ce que cela va provoquer une erreur (justifier) ?

```sql solution
UPDATE Tableaux
SET IdPeintre = NULL
WHERE Id = 0
```

Cela va provoquer une erreur car IdPeintre est NOT NULL.


21. Ajouter le tableau "Portrait de musicien" fait par De Vinci en 1485 et ayant appartenu au musée des antiquités de Rouen entre 1800 et 1900. Choisir un Id correct.

```sql solution
INSERT INTO Tableaux
VALUES (6,'Portrait de musicien',1485, 0);

INSERT INTO Appartenances
VALUES (7,1,6,1800,1900);
```

## Exercice 2

On considère les schémas des tables suivantes : 

Table **Villes**
| Champ | Type | Clefs | Spécifités |
|-|-|-|-|
| Id | Entier | Clef primaire | NOT NULL |
| Nom | Texte | 
| IdRegion | Entier | Clef étrangère référençant Id de Regions |  NOT NULL |
| EstMetropole | Booléen |
| EstPrefecture | Booléen |

Table **Regions**
| Champ | Type | Clefs | Spécifités |
|-|-|-|-|
| Id | Entier | Clef primaire |  NOT NULL |
| Nom | Texte | 
| IdPrefecture | Entier | Clef étrangère référençant Id de Villes

Lesquelles de ces propriétés sont-elles forcément vérifiées par cette base de données ? Si c'est le cas il faut justifier. Si ce n'est pas le cas, donner un exemple de données à insérer dans la base pour que cela ne soit pas le cas.

1. Une ville appartient à exactement une région.

Oui car il n'y a qu'une clef étrangère IdRegion qui réfèrence Regions et cette clef est NOT NULL.

2. Une ville peut être une métropole.

Oui, grâce à l'attribut EstMetropole qui est un booléen.


3. Une région a au plus une préfecture (et peut donc ne pas en avoir).

Oui, car IdPrefecture n'est pas NOT NULL.

4. Si IdPrefecture d'une région référence vers une ville, alors cette ville est une préfecture.

Non pas forcément. Il peut y avoir la Ville (0,'Montpellier', 1, FALSE, FALSE) et la Region (1,'Occitanie', 0). Dans ce cas Montpellier n'est pas une préfecture pourtant la région Occitanie réfèrence Montpellier comme étant sa préfecture.

5. Si une ville est une préfecture alors l'IdPrefecture de la région de cette ville référence vers cette ville.

Non pas forcément. Il peut y avoir la Ville (0,'Montpellier', 2, FALSE, TRUE) et la Region (1,'Occitanie', 0). On voit que la région Occitanie réfèrence Montpellier comme étant sa préfecture mais Montpellier ne dit pas être la préfecture de l'Occitanie mais d'une autre région numéro 2.



### Question

6. Comment changer les tables pour qu'une ville ne puisse être préfecture de plusieurs régions en même temps ?

Il suffit de rajouter UNIQUE à l'attribut IdPrefecture.
