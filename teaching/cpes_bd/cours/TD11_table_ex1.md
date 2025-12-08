<style>
    @media print {
  .page-break { 
    page-break-before: always; 
  }
}
</style>

# Tables de l'exercice 1

## Table `Pokemons`

| Champ | Type | Clef | Spécifités |
|-|-|-|-|
| Id | entier | Clef primaire |
| Nom | texte | |
| Force | entier |
| Defense | entier |

<br>

<table><tr><th>Id</th><th>Nom</th><th>Force</th><th>Defense</th><tr><tr><td>0</td><td>Bulbizare</td><td>10</td><td>20</td></tr><tr><td>1</td><td>Florizare</td><td>10</td><td>10</td></tr><tr><td>2</td><td>Herbizare</td><td>10</td><td>20</td></tr><tr><td>3</td><td>Salameche</td><td>10</td><td>5</td></tr></table>

---



## Table `Dresseurs`

| Champ | Type | Clef |Spécifités |
|-|-|-|-|
| Id | entier | Clef primaire |
| Nom | texte | |
| IdPokemon1 | entier | Clef étrangère réf vers Id de Pokemons | NULL
| IdPokemon2 | entier | Clef étrangère réf vers Id de Pokemons | NULL

<br>

<table><tr><th>Id</th><th>Nom</th><th>IdPokemon1</th><th>IdPokemon2</th><tr><tr><td>0</td><td>Sacha</td><td>0</td><td>1</td></tr><tr><td>1</td><td>Jo</td><td>0</td><td>NULL</td></tr></table>


<div class="page-break"></div>

## Table `Arenes`

| Champ | Type | Clef |Spécifités |
|-|-|-|-|
| Id | entier | Clef primaire |
| Nom | texte | |

<br>

<table><tr><th>Id</th><th>Nom</th><tr><tr><td>0</td><td>Montpellier</td></tr><tr><td>1</td><td>Bordeaux</td></tr></table>

---

## Table `Maitres`

| Champ | Type | Clef |Spécifités |
|-|-|-|-|
| IdDresseur | entier | Clef étrangère réf vers Id de Dreseurs | UNIQUE
| IdArene | entier | Clef étrangère réf vers Id de Arenes | UNIQUE

<br>

<table><tr><th>IdDresseur</th><th>IdArene</th><tr><tr><td>0</td><td>0</td></tr></table>