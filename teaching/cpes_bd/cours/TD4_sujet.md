# TD4 : EXISTS et HAVING

## EXISTS

La requete suivante permet d'afficher les lignes de la table `Tab` qui vérifie qu'une certaine requête possiblement dans une autre table n'est pas vide.

```sql
SELECT *
FROM Tab
WHERE EXISTS (
    Requete
  )
```

## Questions

Dans la base de données `pac.odb` et `cinema.odb`, quelles requêtes permettent de trouver les informations suivantes :

- Les noms des produits qui ont été achetés au moins une fois.
- Les noms et identifiants des clients qui ont fait au moins un achat.
- les titres et identifiants des films qui sont projetés au moins une fois.
- les titres et identifiants des films qui sont projetés au moins le lundi.
- les identifiants des cinémas qui projettent au moins un film le jeudi et qui ont au moins 20 salles.

## HAVING

La commande HAVING est similaire à WHERE mais permet d'utiliser les fonctions d'agrégation (SUM, COUNT, MAX, MIN). La requête suivante permet d'afficher les lignes de la table `Tab` en les regroupant selon l'attribut `attribut_groupe` mais en ne gardant les groupes que si la condition de HAVING est respectée.

```sql
SELECT attribut_groupe, fonction1(attribut_numerique)
FROM Tab
GROUP BY attribut_groupe
HAVING fonction2(attribut_numerique) operateur valeur
```

## Questions

- afficher les identifiants des clients qui ont achetés au moins 20 en quantité total
- afficher les identifiants des produits qui ont été achetés en quantité totale au moins 20
- afficher les identifiants et la quantité totale achetée des produits dont toutes les commandes sont en quantité strictement inférieur à 10
- afficher les identifiants et le nombre de projetctions des films qui ont été projetés au moins 3 fois
- même question que précédemment mais on veut le titre des films en plus : afficher l'identifiant le titre et le nombre de projections des films qui ont été projetés au moins 3 fois
- afficher l'identifiant, la ville et le nombre de projections des cinémas qui projetent au moins 3 fois
