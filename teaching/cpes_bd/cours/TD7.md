# TD7 : Création et édition de tables

## Utilisation de SQLite

On utilisera le site https://sqliteonline.com/

## Création de table

```sql
CREATE TABLE Tab(
    attribut1 INT,
    attribut2 TEXT,
    attribut3 INT NOT NULL,
    attribut4 INT PRIMARY KEY
)
```

## Supprimer une table

```sql
DROP TABLE nom_table
```

## Rajouter des valeurs

```sql
INSERT INTO Tab
VALUES
(0,"test"),
(2,2020)
```

## Rajouter une clef étrangère

A la création de la table il faut rajouter : 

```sql
FOREIGN KEY(attribut) REFERENCES AutreTab(autre_attribut)
```

Pour SQLite il faut lancer cette commande avant d'utiliser les clefs étrangères :

```sql
PRAGMA foreign_keys = ON
```

## Suppression en cascade

```sql
FOREIGN KEY(attribut) REFERENCES AutreTab(autre_attribut) ON DELETE CASCADE
```


## Restriction de suppression

```sql
FOREIGN KEY(attribut) REFERENCES AutreTab(autre_attribut) ON DELETE RESTRICT
```