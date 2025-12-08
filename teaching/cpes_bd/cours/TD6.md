# TD6 : création de bases de données sur Libre Office Base

Ouvrir Libre Office Base. Créer une nouvelle base de données (laisser coché le champ "HSQLBD intégré") que l'on appelera `astro`. 

Cliquer sur "Créer une table en mode Ébauche" pour créer la première table `Stations`. Ajouter les champs suivants : 

| Nom de champ | Type de champ |
|-|-|
| id | Integer [INTEGER] |
| nom | Texte [VARCHAR] |

Cliquer sur sauvegarder. Choisir le nom "Stations" et confirmer. Une erreur s'affiche précisant qu'il n'y a pas de clef primaire.
Il faut en effet préciser au logiciel que le champ `id` doit être considérer comme une clef primaire.

Pour cela il faut cliquer sur la ligne du champ `id` et en dans la fenêtre du bas intitulée "Propriétés du champ" et choisir "Oui" dans "Valeur automatique". Ainsi le champ `id` est maintenant une clef primaire et il sera automatiquement complété lorsque l'on rentrera des données dans la table.

Il est aussi possible de juste spécifier que le champ est une clef primaire sans un faire un champ automatique en faisant clic droit sur la flèche verte à gauche de `id` pour sélectionner "clé primaire".

Faire de même pour créer la table `Astronautes` :

| Astronautes | | |
|-|-|-|
| id | Integer [INTEGER] | Valeur automatique |
| nom | Texte [VARCHAR] | |

On va maintenant rentrer des données dans ces deux tables. Pour cela faire double clic sur la table "Astronautes". Puis rentrer au hasard des informations sur plusieurs astronautes en appuyer sur "Entrée" pour confirmer. On voit que le champ `id` se complète automatiquement et ne peut être modifié.

De même rentrer quelques données pour la table `Stations`.

Effectuer les requêtes suivantes :

- Afficher tous les astronautes
- Afficher tous les astronautes dont le nom est dans l'ordre alphabétique au dessus de 'T'

Rentrer la table suivante :

| Visites | | |
|-|-|-|
| id | Integer [INTEGER] | Valeur automatique |
| idAstronaute | Integer [INTEGER] | Entrée requise |
| idStation | Integer [INTEGER] | Entrée requise |

"Entrée requise" signifie que le champ ne peut être nul. Essayer de rentrer une ligne qui comporte un tel champ nul et voir que cela provoque une erreur.

Rentrer quelques données au hasard pour cette table.

Rajouter le champ `anee` de type Integer à la table `Visites` en faisant "éditer la table". Compléter les données de la table en conséquences.

Rajouter le champ `age` de type Integer à la table `Astronautes`. Compléter les données de la table en conséquences.

Modifier les données de tel sorte que :
- tous les astronautes qui ont visité la station 0 ont 40 ans
- toutes les stations visitées par l'astronaute 1 l'ont été en 2018

Vérifier le avec des requêtes SQL.

# Exercice 

Créer la base de données de la situation suivante. On veut créer une base de données des étudiants de l'université. Chaque étudiant fait partie d'un groupe qui fait lui même partie d'un groupe.

Les tables à créer sont les suivantes :

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

Remplir la base de données avec des données de sorte que : 

- il y a  exactement 3 étudiants dans le groupe d'identifiant 0
- il y a 3 groupes dans la licence d'identifiant 1

Quelles requêtes permettent de vérifier cela ?
