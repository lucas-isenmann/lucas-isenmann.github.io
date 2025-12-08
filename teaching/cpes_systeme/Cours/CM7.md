# CM7

## Exercice 1

Ecrire un script qui pour toutes les extensions présentes dans le dossier, crée un dossier par extension et déplace tous les fichiers ayant cette extension dans ce dossier.

```bash
for entree in $1/*
do
    if [[ -f $entree ]]
    then
        nom_fichier=$(echo $entree | cut -d / -f2)
        ext=$(echo $entree | cut -d "." -f2)
        mkdir $1/$ext
        mv $entree $1/$ext/$nom_fichier
    fi
done
```

# Dictionnaires

Un dictionnaire ou tableau associatif est un ensemble de clefs associées à des valeurs. Les clefs et les valeurs peuvent être des entiers ou des chaines de caractères. Il s'utilise en commençant par le déclarer :

```bash
declare -A tab
```

Pour définir une valeur :

```bash
tab[clef]=valeur
n=4
tab[$n]=bonjour
tab[0]=$(( 4 + 5 ))
```

Pour lire une valeur :

```bash
echo ${tab[txt]}
echo $(( tab[txt] ))
```

Pour parcourir toutes les clefs du dictionnaire on utilise le symbole `@` qu'on avait déjà vu pour parcourir tous les paramètres du script : 

```bash
for clef in ${!tab[@]}
do
    echo $clef
done
```

## Exercice 2

Ecrire un script qui crée un dictionnaire où l'entrée de la clef `a` vaut `2` et qui affiche la valeur de l'entrée a.

```bash
declare -A tab
tab[a]=2
echo ${tab[a]}
```

## Exercice 3

Ecrire un script qui crée un dictionnaire sur les clefs de 1 à 10 avec des nombres au hasard entre 0 et 100 et qui génère un fichier `.csv` contenant les entrées de ce dictionnaire sous la forme `clef,valeur` par ligne.

```bash
declare -A tab
touch data.csv
for i in {1..10}
do
    tab[$i]=$(( $RANDOM%100 ))
    echo $i,${tab[$i]} >> data.csv
don
```

## Exercice 4

Ecrire un script qui compte le nombre de fichiers du dossier en paramètre dont le nom contient un a et le nombre de fichiers dont le nom contient un b à l'aide d'un dictionnaire.

## Solution

```bash
declare -A compteur

compteur[a]=0
compteur[b]=0

for entree in $1/*
do
    if [[ -f $entree ]]
    then
        if grep a $entree
        then
            compteur["a"] +=1
        fi
        if grep b $entree
        then
            compteur["b"] +=1
        fi
    fi
done

echo ${compteur[a]}
echo ${compteur[b]}
```

## Exercice 5

Ecrire un script qui pour toutes les extensions présentes dans le dossier en paramètre, compte le nombre de fois qu'elles apparaissent.

## Solution

```bash
declare -A compteur

for entree in $1/*
do
    if [[ -f $entree ]]
    then
        ext=$(echo $entree | cut -d . -f 2)
        if [[ $ext != "" ]]
        then
            if [[ ${compteur[$ext]} ]]
            then 
                compteur[$ext]=$(( compteur[$ext] + 1)) # OU (( compteur[$ext] ++ ))
            else
                compteur[$ext]=1
            fi
        fi
    fi
done

for clef in ${!compteur[@]}
do
    echo $clef ${compteur[$clef]}
done
```


# Fonctions

On introduit une nouvelle fonction ainsi :

```bash
function ma_fonction {
    # ...
}
```

:warning: Attention il faut un espace entre le nom de la fonction et l'accolade ouvrante.

Les paramètres sont `$1 $2 ...` comme pour un script. Mais ces paramètres sont différents de ceux du script. 

En bash une fonction ne retourne pas de valeurs (comme en Python ou dans la plupart des autres langages) mais on fait des `echo`.

Exemple : 

```bash 
function addition {
    somme=$(( $1 + $2 ))
    echo $somme
}
```

Pour utiliser la fonction, on l'utilise comme une commande classique (`echo, ls, grep`) : 

```bash
addition 2 3
```


## Exercice 6

Ecrire un script qui calcule le carré d'un nombre fourni en paramètre en définissant une fonction. L'appeler sur le paramètre `3`.

### Solution

```bash
function carre {
    echo $(( $1*$1 ))
}
carre 3
```


## Exercice 7 (Bonus)

Cet exercice utilise la notion de récursivité est donc facultatif.

Ecrire un script qui calcule la factorielle d'un nombre fourni en paramètre en définissant une fonction récursive.

## Solution 

```bash
function factorial { 
    if (($1 == 1))
    then
        echo 1
    else
        prec=$(( $1 - 1 ))
        echo $(( $( factorial $prec ) * $1 ))
    fi
}
factorial 3
```


## Exercice 8 (Bonus)

Cet exercice utilise la notion de récursivité est donc facultatif.

Ecrire un script qui compte le nombre de fichiers contenus dans le dossier en paramètres et dans ses sous-dossiers.

## Solutions

```bash
c=0
function parcours {
    for entree in $1/*
    do
        if [[ -d $entree ]]
        then
            parcours $entree
        elif [[ -f $entree ]]
        then
            (( c++ ))
        fi
    done
}

parcours $1
echo $c
```
