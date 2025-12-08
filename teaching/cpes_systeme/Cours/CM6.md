# CM6

Parcourir toutes les entrées (c'est-à-dire les fichiers et dossiers) d'un dossier `dir` :

    for entree in $dir/*
    do
        # faire quelque chose
    done



Pour tester si une entrée est un dossier on peut utiliser la condition suivante :

    if [[ -d $entree ]] # d pour directory
    then 
        # ...
    fi

Pour tester si une entrée est un fichier on peut utiliser la condition suivante :

    if [[ -f $entree ]] # f pour file

Pour utiliser des commandes dans les tests : on a pas besoin des (( )) ni des [[ ]], on utilise juste le retour 0 ou 1 de la commande.

    if grep salut fichier.txt

Pour sauvegarder dans une variable le résultat d'une commande :

    a=$( grep // fichier.txt )




## Exercice 1

Ecrire un script qui copie tous les fichiers d'un dossier fourni en paramètre, le nom de la copie doit finir par `.save`.

## Solutions

    dir=$1
    for entree in $dir/*
    do
        if [[ -f entree ]]
        then
            cp $fichier $fichier.save
        fi
    done


## Exercice 2

Ecrire un script qui supprime tous les fichiers dont l'extension finit par `.save` du dossier en paramètre.

## Solutions

    dir=$1
    for entree in $dir/*
    do
        if [[ $entree == *.save ]]
        then
            rm $entree
        fi
    done


## Exercice 3

Réécrire l'exercice précédent en vérifiant qu'un paramètre a bien été fourni. Si aucun paramètre n'a été fourni, afficher "Pas de dossier spécifié" et quitter le script avec la commande `exit`.

## Exercice 4

Réécrire l'exercice précédent de sorte que si aucun paramètre n'a été fourni, on utilise le dossier courant à la place.


## Exercice 5

Ecrire un script qui supprime tous les fichiers du dossier en paramètre qui contienne `//`.

Réécrire ce script avec un second paramètre qui sera la chaine de caractères à chercher.

## Solutions

    for entree in $1/*
    do
        if grep -q // $entree
        then
            rm $entree
        fi
    done


## Exercice 6

Afficher le nom de tous les fichiers qui ont été modifiés il y a moins d'une heure dans le dossier en paramètre.

Indication : utiliser les commandes suivantes 

    date +%s # affiche le timestamp actuel
    date +%s -r fichier.txt # affiche le timestamp en secondes de la dernière modification

## Solutions

    for entree in $1/*
    do
        if [[ -f $entree ]]
        then
            t_actuel=$(date +%s)
            t_fichier=$(date +%s -r $entree)
            diff=$(( $t_actuel - $t_fichier ))
            if (( $diff <= 3600 ))
            then 
                echo $entree
            fi
        fi
    done

## Exercice 7

Ecrire un script qui pour chaque fichier du dossier en paramètre, supprime les lignes du fichier qui contienne `//`.
Indication : utiliser l'option `-v` de grep.

## Solutions

    for entree in $1/*
    do
        if [[ -f $entree ]]
        then
            grep -v // $entree > tmpfile 
            mv tmpfile $entree
        fi
    done


## Exercice 8

Ecrire un script qui affiche le nombre de fichiers du dossier en paramètre qui contienne plus de 10 caractères.

## Solutions

    c=0
    for entree in $1/*
    do
        if [[ -f $entree ]]
        then
            a=$(wc -c < $entree)
            if (( $a >= 10 ))
            then 
                c=$(( $c + 1))
            fi
        fi
    done
    echo $c


