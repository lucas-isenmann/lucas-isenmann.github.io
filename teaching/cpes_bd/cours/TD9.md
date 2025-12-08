# TD9 : Algèbre relationnelle

L'algèbre relationnelle est une formulation mathématiques des base de données relationnelles que nous avons vu en SQL. Toutes les opérations que l'on a vu en SQL peuvent être écrites en algèbre relationnelle et réciproquement. Certaines fois la traduction sera évidente mais ce n'est pas toujours le cas.

## Schémas, extensions et relations

Un "schéma" est un ensemble de noms d'"attributs" (ou de "champs"). On mentionne qu'un attribut est une clef primaire s'il est souligné. Les "domaines" des attributs sont les valeurs possibles que peuvent prendre cet attribut. En général on ne précise pas les domaines car on s'intéresse plus aux liens entre les relations.

Par exemple pour la table `Clients` SQL suivante : 

| ID | Nom | Age |
|-|-|-|
| 1 | Alice | 20 |
| 2 | Bob | 19 |
| 3 | Camille | 19 |

où ID est la clef primaire de type INT, Nom est de type TEXT et Age de type INT. Le schéma est "Clients(<ins>ID</ins>,Nom,Age)".

Une "relation" est décrite par un schéma et par son contenu (ensemble des "lignes" ou "enregistrements" ou "n-uplets") qu'on appelle "extension".

La "taille" d'une relation est le nombre de lignes dans son extension.

## Opérateur relationnel : la sélection

Etant donné une relation R et une formule F (formée de combinaisons de comparaisons et de connecteurs logiques) on définit :
$$
\sigma_F(R) = \{ r \in R \colon r \; \text{satisfait } F \}
$$
qui forme une nouvelle relation qui est l'ensemble des lignes de la relation $R$ qui satisfont la formule $F$.

Remarque mnémotechnique : $\sigma$ se lit "sigma" et correspond au "s" grec pour "sélection". 

Son équivalent en langage SQL est `WHERE`.

### Questions

$R$ désigne la relation "Clients" du paragraphe précédent.

1. Calculer la relation $\sigma_{ Age = 19}(R)$.

| ID | Nom | Age |
|-|-|-|
| 2 | Bob | 19 |
| 3 | Camille | 19 |

2. Calculer la relation $\sigma_{ Age \geq 19}(R)$.

| ID | Nom | Age |
|-|-|-|
| 1 | Alice | 20 |
| 2 | Bob | 19 |
| 3 | Camille | 19 |


3. Calculer la relation $\sigma_{ Age < 19}(R)$.

| ID | Nom | Age |
|-|-|-|


## Opérateur relationnel : la projection

Etant donné une relation $R$ et $A$ un ensemble de champs on définit $\pi_A(R)$ commen étant la restriction de la relation $R$ (et de ses données) aux champs de $A$.

Remarque mnémotechnique : $\pi$ correspond au "p" grec pour "projection".

Son équivalent en langage SQL est `SELECT`.

### Questions

$R$ désigne la relation "Clients" du paragraphe précédent.

4. Calculer la relation $\pi_{ ID, Nom}(R)$.

| ID | Nom | 
|-|-|
| 1 | Alice | 
| 2 | Bob | 
| 3 | Camille | 

5. Calculer la relation $\pi_{ Age }(R)$.

|  Age |
|-|
| 20 |
| 19 |
| 19 |

6. Calculer la relation $\pi_{ ID,Nom, Age}(R)$.

| ID | Nom | Age |
|-|-|-|
| 1 | Alice | 20 |
| 2 | Bob | 19 |
| 3 | Camille | 19 |

## Opérateurs ensemblistes : union, intersection et différence

Etant donné deux relations $R$ et $S$ ayant le même schéma, on définit les trois opérations suivantes : 

$$
R \cup S = \{ t \colon t \in R \text{ ou } t \in S\}
$$

$$
R \cap S = \{ t \colon t \in R \text{ et } t \in S\}
$$

$$
R - S = \{ t \colon t \in R \text{ et } t \not\in S\}
$$

Les trois opérations précédentes crée chacune une relation ayant le même schéma que $R$ et $S$.

### Exercices

On considère les relations suivantes : $R$ les clients ayant acheté un vélo

| ID | Nom | Age |
|-|-|-|
| 1 | Alice | 20 |
| 2 | Bob | 19 |
| 3 | Camille | 19 |

et $S$ les clients ayant acheté un trombone

| ID | Nom | Age |
|-|-|-|
| 3 | Camille | 19 |
| 4 | Jo | 20 |
| 5 | Cassiopée | 20 |

7. Calculer la relation $R \cup S$. À quoi cela correspond t-il en langage courant ?

| ID | Nom | Age |
|-|-|-|
| 1 | Alice | 20 |
| 2 | Bob | 19 |
| 3 | Camille | 19 |
| 4 | Jo | 20 |
| 5 | Cassiopée | 20 |

Cela correspond aux clients qui ont acheté un vélo ou un trombonne.




8. Calculer la relation $R \cap S$. À quoi cela correspond t-il en langage courant ?

| ID | Nom | Age |
|-|-|-|
| 3 | Camille | 19 |

Cela correspond aux clients qui ont achété un vélo et un trombonne.

9.  Calculer la relation $R - S$. À quoi cela correspond t-il en langage courant ?

| ID | Nom | Age |
|-|-|-|
| 1 | Alice | 20 |
| 2 | Bob | 19 |

Aux clients qui ont achetés un vélo mais pas un trombonne.

10.  Pour $R$ et $S$ deux relations ayant même schéma, quel est la taille de $R \cup S$ en fonction de $R$ et $S$ ? Et pour $R \cap S$ et $R - S$ ?

$|R \cup S| \le |R| + |S|$

$| R \cap S| \leq \min( |R|, |S|)$

$|R -S| \leq |R$

## Produit cartésien

Etant donné deux relations $R$ et $S$ (n'ayant pas forcément le même schéma) on définit la relation 

$$ 
R \times S = \{ (r,s) \colon r \in R \text{ et } s \in S\}
$$

### Exercices

11. Calculer le produit cartésien des deux relations suivantes :

Relation "Sandwichs" :

| ID | Sandwich | Prix |
|-|-|-|
| 1 | Végé | 3,5 |
| 2 | Panini | 4 |
| 3 | Muffuletta | 6,7 |

Relation "Sauces" :

| Sauce | Prix |
|-|-|
| Ketchup | 1,3 |
| Mystère | 1,6 |




| ID | Sandwich | Prix |
|-|-|-|
| 1 | Végé | 3,5 | Ketchup | 1,3 |
| 2 | Panini | 4 | Ketchup | 1,3 |
| 3 | Muffuletta | 6,7 | Ketchup | 1,3 |
| 1 | Végé | 3,5 | Mystère | 1,6 |
| 2 | Panini | 4 | Mystère | 1,6 |
| 3 | Muffuletta | 6,7 | Mystère | 1,6 |




12.  Calculer le produit cartésien entre les relations $R$ et $S$ du paragraphe précédent.

| Velos.ID | Velos.Nom | Velos.Age | Trombonne.ID | Trombonne.Nom | Trombonne.Age
|-|-|-|-|-|-|
| 1 | Alice | 20 | 3 | Camille | 19 |
| 2 | Bob | 19 | 3 | Camille | 19 |
| 3 | Camille | 19 | 3 | Camille | 19 |
| 1 | Alice | 20 | 3 | Camille | 19 |
| 2 | Bob | 19 | 4 | Jo | 20 |
| 3 | Camille | 19 | 5 | Cassiopée | 20 |
| 1 | Alice | 20 | 3 | Camille | 19 |
| 2 | Bob | 19 | 3 | 4 | Jo | 20 |
| 3 | Camille | 19 | 5 | Cassiopée | 20 |


13.  De manière générale, pour deux relations $R$ et $S$, quelle est la taille de $R \times S$ en fonction de $R$ et de $S$ ?

$|R \times S| = |R| \cdot |S|$