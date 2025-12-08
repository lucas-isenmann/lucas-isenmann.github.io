
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

## Exercice 2 : Modélisation

Modéliser la situation suivante en décrivant les tables et les clés primaires et étrangères.
Des astronautes vont dans des stations spatiales.
On doit pouvoir répondre aux questions suivantes :

- quels sont les noms des astronautes ?
- quels sont les noms des stations ?
- combien de stations a visitées tel astronaute ?
- combien d'astronautes sont venus visité telle station ?

## Exercice 3 : Bibliotheques

La base de données `bibliotheques.odb` possède les tables suivantes :

Abonnements :
- id
- idBibli
- idAbonne
- annee

Abonnes :
- id
- nom
- age

Refs :
- id
- titre
- restriction

Bibliotheques :
- id
- nom
- ville

Exemplaires :
- id
- idRef
- idBibli
- idAbonne (NULL si pas emprunté)
- etat

quelles requêtes permettent de répondre aux questions suivantes :

1. Combien y a t-il de bibliothèques dans la base de données ?


2. Combien y a t-il de bibliothèques à Montpellier ?


3. Combien y a t-il d'abonnées dans la base de données ?


4. Combien y a t-il d'abonnées de moins de 12 ans ?


5. Afficher la liste des livres triée par ordre alphabétique par rapport au nom.


6. Combien y a t-il d'exemplaires pour la référence 2 ?


7. Quels sont les identifiants des références qui sont à la biliothèques 4 et qui ne sont pas empruntés ? On pourra utiliser `IS NULL` pour savoir si l'attribut isAbonne est nul (au lieu de faire `= NULL`).


8. Quels sont les identifiants des références qui ont au moins 1 exemplaire emprunté ?


9. Afficher les identifiants des bibliothèques avec le nombre d'exemplaires dans chacune.


10. Quelle est la bibliothèque qui a le plus d'exemplaires ?


1. Quels sont les noms des abonnés qui ont emprunté un exemplaire de la référence ayant pour identifiant 9 ?


12. Quels sont les abonnements qui sont de l'année avant 2023 ?


13. Quels sont les identifiants des bibliothèques auxquelles l'abonné 4 a il était abonné ?


14. Quels sont les noms des bibliothèques auxquelles l'abonné 'Dubois' a il été abonné ?


15. Quels sont les noms des abonnés qui ont au moins 1 emprunt en cours ?


16. Afficher les identifiants des bibliothèques qui ont 2 abonnés ou moins en 2023.


17. Combien chaque bibliothèque a d'exemplaire en bon état ?


18. Combien y a t-il d'emprunts qui ne respectent pas les restrictions d'age qu'un abonné de moins de 12 ne peut pas normalement emprunter un livre restreint ?

