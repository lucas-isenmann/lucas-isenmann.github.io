# TD8 : Edition des valeurs

## Utilisation de SQLite

On utilisera le site https://sqliteonline.com/

## Suppression de lignes

```sql
DELETE FROM Tab
WHERE condition
```

## Mise à jour de lignes

```sql
UPDATE Tab
SET attribut1 = valeur1, attribut2 = valeur2
WHERE condition
```

## Etude de cas : laboratoire

Un laboratoire de chimie fabrique des produits à partir de ressources, de matériels réutilisables et de laborantins.
La base de donnée que vous devez créer doit permettre de noter les informations suivantes :

- les produits finis : le nom, la quantité en L en stock, le prix au L
- les ressources : le nom, la quantité en L en stock
- les matériels : le nom, son état : utilisable, utilisé, sale
- les laborantins : le nom, la prime en cours

La fabrication d'un produit se base sur une recette : par exemple 2L de mercure + 1L de calcium dans une cuve = 1L de détergent (prix : 5 euros)

Tout matériel doit être utilisé par exactement un laborantin.

Dès qu'un produit est terminé, les laborantins recoit une prime de 10% du prix de vente du produit.

Il vous est demandé de : 

- mettre en place les tables adéquates pour éviter les redondances et garantir la cohérence des données
- appliquer la liste des évènements suivante à la base de données à l'aide de requête SQL.

Liste des évènements :

- le laboratoire achète 10L de mercure, 10L de calcium, 10L de carbone
- acheter 3 cuves et 1 bécher
- recruter 3 laborantins
- lancer la fabrication de 2L de détergent dans une cuve
- lancer la fabrication de 3L de savon dans une autre cuve avec la formule : 1L de mercure, 1L de calcium, 1L de carbone + 2 cuves = 1L de savon
- une fois que la fabrication de détergent est faite, payer le laborantin et désaffecter la cuve et le laborantin
- nettoyer les cuves sales
- le savon est terminée
- nettoyer les cuves sales

