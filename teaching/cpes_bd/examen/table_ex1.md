# Tables Exercice 1

Rappel : si NOT NULL n'est pas spécifié, l'attribut peut être NULL.
<br>
Les clefs étrangères devront toutes utiliser la contrainte ON RESTRICT pour les  suppressions et les modifications.

## Table **Musees**

| Champ | Type | Clef | Spécifités |
|-|-|-|-|
| Id | entier | Clef primaire | NOT NULL
| Nom | texte | |
| Ville | texte |
| Taille | entier |

<br>

| <u>Id</u> | Nom | Ville | Taille |
|-|-|-|-|
| 0 | Musée des Beaux-Arts | Rouen | 2000 |
| 1 | Musée des Antiquités | Rouen | 300 |
| 2 | Musée de la Marine | Brest | 4000 |
| 3 | Musée des Beaux-Arts | Brest | 1500 |

---

## Table **Peintres**

| Champ | Type | Clef | Spécifités |
|-|-|-|-|
| Id | entier | Clef primaire | NOT NULL
| Nom | texte | |

<br>

| <u>Id</u> | Nom | 
|-|-|
| 0 | De Vinci | 
| 1 | Velasquez |
| 2 | Vigée Le Brun

---

## Table **Tableaux**

| Champ | Type | Clef | Spécifités |
|-|-|-|-|
| Id | entier | Clef primaire | NOT NULL
| Titre | texte | |
| Annee | entier | |
| IdPeintre | entier | Clef étrangère réf. Peintres(Id) | NOT NULL

<br>

| <u>Id</u> | Titre | Annee | IdPeintre
|-|-|-|-|
| 0 | La Joconde | 1503 | 0
| 1 | La Cène | 1495 | 0
| 2 | La Tunique de Joseph | 1630 | 1
| 3 | Les Fileuses | 1657 | 1
| 4 | Portrait de l'impératrice | 1799 | 2
| 5 | Caroline Murat | 1807 | 2

---

## Table **Appartenances**

| Champ | Type | Clef | Spécifités | Commentaires 
|-|-|-|-|-|
| Id | entier | Clef primaire | NOT NULL
| IdMusee | entier | Clef étrangère réf. Musees(Id) | NOT NULL
| IdTableau | entier | Clef étrangère réf. Tableaux(Id) | NOT NULL
| Debut | entier | | NOT NULL
| Fin | entier | | | Si NULL cela veut dire que le tableau y est actuellement.

<br>

| <u>Id</u> | IdMusee | IdTableau | Debut | Fin
|-|-|-|-|-|
| 0 | 0 | 1  | 2000 | NULL
| 1 | 0 | 2  | 1900 | 2000
| 2 | 1 | 0  | 1900 | 2000
| 3 | 1 | 1  | 1900 | 2000
| 4 | 3 | 4  | 1900 | 2000
| 5 | 4 | 4  | 1800 | 1900
| 6 | 4 | 2  | 1800 | 1900