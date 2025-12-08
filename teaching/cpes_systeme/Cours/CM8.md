# CM 8 

# Lire dans un fichier

De manière générale, si le résultat d'une commande est un texte avec des retours à la ligne, on peut parcourir toutes les lignes à l'aide d'un `for`.
En particulier on peut utiliser `cat` pour lire ligne par ligne un fichier.
Attention, cela ne marche pas si le fichier contient des espaces !

```bash
fichier=$(cat test.txt)
for ligne in $fichier
do
    echo $ligne
done
```

La méthode suivante marche pour tout type de fichier :

```bash
while read ligne
do 
    echo $ligne
done < test.txt
```

## Exercice 1

Ecrire un script qui crée un nouveau fichier `pokemons_forts.csv` qui ne conserve que les lignes du fichier `pokemons.csv` qui ont une force (la deuxième colonne) d'au moins 10.

## Solution

```bash
touch pokemons_forts.csv

for ligne in $(cat pokemons.csv)
do
    force=$(echo $ligne | cut -d , -f 2)
    if (( $force >= 10 ))
    then
        echo $ligne >> pokemons_forts.csv
    fi
done
```

## Exercice 2

Ecrire un script qui crée un nouveau fichier `villes_Agrandes.csv` qui ne conserve que les lignes du fichier `villes.csv` qui ont plus de 5 millions d'habitants et qui sont dans un pays dont le nom commence par la lettre `A`.

```bash
while read ligne
do 
    pop=$(echo "$ligne" | cut -d ";" -f 4)
    nom_pays=$(echo "$ligne" | cut -d ";" -f 2)
    if (( $pop >= 1000000 )) 2> erreur.txt && echo $nom_pays | grep ^A -q 
    then
        echo $ligne
    fi
done < villes.csv
```

## Exercice 3 (Bonus)

Ecrire un script qui à partir d'un fichier en paramètre, crée un nouveau fichier où les lignes entre les balises `<hide>` et `</hide>` sont supprimées.

## Solution

```bash
fichier=$1
nouveau_fichier=$fichier.new
echo "" > $nouveau_fichier

copier=1
for ligne in $(cat $fichier)
do
    if echo $ligne | grep \<HIDE\> -q
    then
        copier=0
    elif echo $ligne | grep \</HIDE\> -q
    then
        copier=1
    else
        echo $copier
        if (( $copier == 1 ))
        then
            echo $ligne >> $nouveau_fichier
        fi
    fi
done
```

---

# Révisions

## Exercice 4

Ecrire un script qui affiche les `n` premières puissances de 2 où `n` est le paramètre du script.

```bash
for i in $(seq 1 $1)
do
    echo $(( 2**$i ))
done
```

## Exercice 5

Ecrire un script qui à l'aide d'un dictionnaire compte le nombre de lignes d'un fichier en paramètre qui commencent par un A et celles qui commencent par un B.

```bash
declare -A tab
tab[A]=0
tab[B]=0

fichier=$(cat $1)

for ligne in $fichier
do
    if echo $ligne | grep ^A -q
    then
        tab[A]=$(( ${tab[A]}+1 ))
    fi
    if echo $ligne | grep ^B -q
    then
        tab[B]=$(( ${tab[B]}+1 ))
    fi
done

echo A : ${tab[A]}
echo B : ${tab[B]}
```

## Exercice 6

Ecrire une fonction `saluer` qui affiche `Bonjour prenom !` où `prenom` est le paramètre de la fonction.

Ecrire un script qui demande à l'utilisateur de saisir un prénom et de lancer `saluer` sur ce prénom jusqu'à ce qu'il commence par un `A`.

## Solution

```bash
function saluer  {
    echo Bonjour $1 !
}

read prenom
while [[ ! $(echo $prenom | grep ^A) ]]
do
    saluer $prenom
    read prenom
done
```



## Exercice 7

Ecrire un script qui génère un fichier `data.txt` contenant  `n` lignes aléatoires de `A` ou `B` où `n` est le paramètre passé au script.

## Solution

```bash
fichier=data.txt

for i in $(seq 1 10)
do
    if (( $RANDOM %2 == 0 ))
    then
        echo A >> $fichier
    else
        echo B >> $fichier
    fi
done
```


## Exercice 8 (Difficile)

Ecrire un Shifumi (pierre feuille ciseau) contre l'ordinateur en `n` manches gagnantes où `n` est le paramètre passé au script.

## Solution 

```bash
limite=$1
score_ordi=0
score_humain=0

while (( $score_ordi < $limite && $score_humain < $limite ))
do
    echo ---
    echo New Round
    

    read choix
    r=$(( $RANDOM %3 ))
    if (( $r == 0 ))
    then 
        echo Ordi: Pierre
    elif (( $r == 1 ))
    then
        echo Ordi: Feuille
    else
        echo Ordi: Ciseau
    fi


    if (( $choix == p ))
    then
        if (( $r == 0 ))
        then
            echo Egalité
        elif (( $r == 1 ))
        then
            score_ordi=$(( $score_ordi +1 ))
        else
            score_humain=$(( $score_humain +1))
        fi
    elif (( $choix == f ))
    then
        if (( $r == 0 ))
        then
            score_humain=$(( $score_humain +1))
        elif (( $r == 1 ))
        then
            echo Egalité
        else
            score_ordi=$(( $score_ordi +1 ))
        fi
    else
        if (( $r == 0 ))
        then
            score_ordi=$(( $score_ordi +1 ))
        elif (( $r == 1 ))
        then
            score_humain=$(( $score_humain +1))
        else
            echo Egalité
        fi
    fi

    echo $score_humain $score_ordi
done
```