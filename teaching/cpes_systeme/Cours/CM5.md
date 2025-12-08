# CM5 : Script Bash

---


C'est un langage orienté chaines de caractères très pratique pour faire des petites manipulations sur les fichiers et dossiers car on peut utiliser facilement toutes les commandes vus précédemment en même temps que les instructions classiques d'un langage de programmation.

Un script Bash est un fichier `.sh` auquel il faut rajouter les droits d'éxecution.
Pour le lancer on fait `./script.sh` dans la console.
Dedans on met sur chaque ligne des instructions comme `ls` ou `echo` qu'on a vu dans le cours précédent.

    echo Bonjour
    ls
    touch fichier.txt

Les paramètres du script sont les chaines de caractères après le `./script.sh`.
Par exemple pour `./script.sh banane poire pomme`, le premier paramètre est `banane` et peut être obtenu par `$1` dans le script, le second paramètre est `poire` et peut être obtenu par `$2` dans le script, etc ...
La variable `$#` contient le nombre de paramètres de l'éxecution du script.

    echo $1
    echo $2
    echo $#

Les commentaires sont précédés d'un `#`.

    # Script qui affiche Bonjour
    echo Bonjour

## Exercice 1

Ecrire un script qui efface la console puis qui affiche le contenu en liste du répértoire courant avec les fichiers cachés et avec les inodes.

    clear
    ls -ail

## Exercice 2

Ecrire un script qui à partir du premier paramètre qu'on note `param`, affiche "Bonjour param".

    echo Bonjour $1

## Exercice 3

Ecrire un script qui à partir du premier paramètre qu'on note `param`, crée un fichier param.txt contenant le texte "param".

    echo $1 > $1.txt

## Exercice 4

Ecrire un script qui à partir du premier paramètre qu'on note `nom`, crée un fichier vide 'nom.sh' auquel on rajoute le droit d'éxecution et qu'on ouvre dans codium.

    touch $1.sh
    chmod +x $1.sh
    codium $1.sh

---

# IF THEN ELSE

    if (( condition ))
    then

    elif (( condition ))
    then

    else

    fi

Pour faire une condition avec un et logique :

    cond1 && cond2


Pour faire une condition avec un ou logique :

    cond1 || cond2

Remarque : pour les conditions `0 <= $age <= 20` ne marche pas, il faut faire `0 <= $age && $age <= 20`.

## Exercice 5

Ecrire un script qui à partir du premier paramètre qu'on note `age`, affiche "majeur" si l'age est supérieur ou égal à 18 et "mineur" sinon.

    if (( $1 >= 18 ))
    then
        echo majeur
    else
        echo mineur
    fi

## Exercice 6

Ecrire un script qui à partir du premier paramètre qu'on note `note`, affiche "valide" si la note est comprise entre 0 et 19, affiche "bravo" si la note vaut 20 et "invalide" sinon.

    if (( 0 <= $1 && $1 <= 19 ))
    then  
        echo valide
    elif (( $1 == 20 ))
    then
        echo bravo
    else
        echo invalide
    fi

---

# VARIABLES

Pour définir une nouvelle variable on ne précède pas par le caractère `$`.
Pour l'utiliser on la précède d'un $.
Attention : il ne faut pas mettre d'espace autour du caractère `=`

    i=4
    echo $i


Pour faire des calculs avec les variables on utilise les doubles paranthèses précédées d'un `$` :

    j=5
    i=$(( 4 + $j ))
    echo $i

Le dernier script affiche 9.

Remarque il n'y a pas de nombres à virgule en Bash de base. Ainsi la division `/` entre deux nombres calcule la division entière.

    i=3
    j=2
    echo $(( $i / $j )) # affiche 1 alors qu'on attend à ce que ce soit 1.5



## Exercice 7

Ecrire un script qui à partir des deux paramètres notés `x` et `y`, calcule x+y dans une nouvelle variable puis l'affiche.

    x=$1
    y=$2
    s=$(( $x + $y ))
    echo $s


## Exercice 8

Ecrire un script qui étant donné le premier paramètre  noté `x` affiche les valeurs suivantes : x+10, x modulo 10, x*10

    x=$1
    echo $(( $x + 10 ))
    echo $(( $x % 10 ))
    echo $(( $x * 10 ))

---

# FOR

Faire une boucle `for` avec des bornes fixes :

    for i in {1..10}
    do
        echo $i
    done

Faire une boucle `for` avec des bornes qui dépendent d'autres variables :

    n=10
    for i in $(seq 1 $n)
    do
        echo $i
    done

Pour faire une boucle `for` qui parcourt les paramètres du script :

    for x in $@
    do
        echo $x
    done


## Exercice 9

Ecrire un script qui étant donné le premier paramètre noté `n` affiche les n premiers entiers carrés.

    n=$1
    for i in $(seq 1 $n)
    do
        echo $(( $i * $i ))
    done

## Exercice 10

Ecrire un script qui étant donné le premier paramètre noté `n` crée n fichiers textes notés de 1 à n, contenant le numéro du fichier. 

    n=$1
    for i in $(seq 1 $n)
    do
        echo $i > $i.txt
    done

## Exercice 11

Ecrire un script qui affiche la moyenne des notes passées en paramètres.

    s=0
    for x in $@
    do
        s=$(( $s + $x ))
    done
    echo $(( $s / $# ))





## Exercice 12

Ecrire un script qui étant donné le premier paramètre noté `n` crée un fichier "data.csv" contenant n lignes telles que chaque ligne contienne un couple x,y d'entiers au hasard entre 0 et 100.

Lancer le script avec 100 lignes de données et l'ouvrir avec LibreOffice Calc pour créer un diagramme XY à partir des deux premières colonnes.

Faire pareil en prenant x au hasard entre 0 et 100 et y valant x + un entier entre 0 et 10. 


    touch data.csv
    echo > data.csv
    n=$1
    for i in $(seq 1 $n)
    do
        x=$(( $RANDOM % 100 ))
        y=$(( $RANDOM % 100 ))
        echo $x,$y >> data.csv
    done

Le diagramme XY montre qu'il n'y a pas de corrélation entre x et y.

Deuxième cas :

    touch data.csv
    echo > data.csv
    n=$1
    for i in $(seq 1 $n)
    do
        x=$(( $RANDOM % 100 ))
        y=$(( $x + $RANDOM % 10 ))
        echo $x,$y >> data.csv
    done

Le diagramme XY montre qu'il y a une corrélation entre x et y.

---

# WHILE 

    j=4
    while (( $j < 10 ))
    do
        echo $j
        j=$(($j+1))
    done

Pour demander à ce que l'utilisateur rentre un nombre ou une chaine de caractères :

    read var



## Exercice 13

Ecrire le jeu du plus ou moins : l'ordinateur choisit un nombre au hasard entre 0 et 100. L'utilisateur doit rentrer des nombres dans la console jusqu'à ce qu'il tombe sur le bon nombre. L'ordinateur dit à chaque essai s'il est au dessus ou en dessous du nombre à deviner.

    cible=$(($RANDOM%100))
    read essai
    while (( $cible != $essai ))
    do
        if (($cible > $essai))
        then
            echo plus
        else
            echo moins
        fi
        read essai
    done
    echo Bravo !