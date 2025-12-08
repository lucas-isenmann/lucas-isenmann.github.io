# CM3

## Redirections

Redirection de la sortie :

    >

Redirection de l'entrée :

    <

Pipe :

    |
    
La commande

    cut -d: -f1 fichier

    more

    sort

La commande wc affiche le nombre de lignes, de mots et la taille en octets d'un fichier passé par l'entrée.


### Exercice 

Dans le dossier TP3, créer un fichier qui contient "salut" avec la commande echo.

Avec la commande cat, créer une copie de ce fichier.

Créer un fichier contenant la liste de tous les fichiers avec la commande ls.

Utiliser wc pour avoir des informations sur le fichier lorem.txt. Combien y a t-il de mots dedans ?

Solutions :

echo "salut" > fichier.txt

cat fichier.txt > fichier2.txt

ls > list.txt

wc < lorem.txt 
il y a 469 mots

### Exercice

On souhaite lister le contenu de 2 dossiers de la machine dans un fichier files.txt :

    /etc/network/ (qui devrait exister)

    /var/lib/apt (qui devrait exister)

Le fichier files.txt devra contenir uniquement la liste des fichiers.

ls -l /etc/network /var/lib/apt /etc/fake-folder > files.txt

### Exercice 

Enchaînez en utilisant le mécanisme de tube : ls, sort, pr, more, avec les bons arguments et les options appropriées pour chaque commande, de façon à obtenir en une seule commande : la liste des fichiers de /dev (ls) dans l’ordre inverse des noms (sort) mise en page par pr sur 3 colonnes avec une largeur de ligne de 60 caractères, 40 lignes par page et un titre "jolie impression" affichés sur l’écran page par page
grâce à more.

Afficher le nom des fichiers de "type texte" de votre répertoire d’accueil. Idée : la commande file
fichier ... détermine le "type" de l’argument en examinant le début du contenu de l’argument. Es-
sayez : file * et file /usr/bin/a*.

De la même façon, affichez le nom des répertoires de votre répertoire d’accueil.

## GREP et expressions régulières

    grep "a" fichier

### Exercice

Créer un fichier contenant la liste de tous les fichiers du TP1 contenant "txt".


### Exercice 

A l'aide du fichier /usr/share/dict/french qui est une liste de mots français, créer un fichier contenant une liste de mots français contenant la lettre w.




## Processus

Lister tous les processus en cours :

    top

Arrêter un processus dont l'identifiant est ```pid``` :

    kill pid


### Exercice

Lancer la commande suivante dans un terminal :

    ls -R /

L'arrêter à l'aide d'un autre terminal (en identifiant son PID avec top et en l'arretant avec kill).

Lancer Firefox et l'arreter avec un terminal.


## Inodes

Pour créer un lien (en créant un nouveau fichier2)

    ln fichier1 fichier2

Lister les inodes des fichiers et dossiers :

    ls -li




### Exercice

Dans le dossier TP3, trouver les fichiers qui ont des clones.

Modifier le contenu d'un de ces fichiers et vérifier que le contenu de l'autre fichier a été modifié.

### Exercice

Créer un nouveau dossier 'exo_inode'.
Dedans créer une arborescence en créant 4 dossiers A, B, C, D tels que le dossier exo_inode ait 4 liens, A en ait 3, B en ait 2, C en ait 3, D en ait 2.

