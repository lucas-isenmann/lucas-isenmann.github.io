# CM4 : Révisions

## Exercice 1

Placez vous dans le dossier TP4/ex1/.
En une ligne de commande déplacer le dossier corgi qui se trouve dans test et le déplacer dans le dossier ex1.

    mv test/corgi/ .

A partir du dossier TP4/ex1/, copier le fichier poeme.txt dans essai/ vers test/. 

    cp essai/poeme.txt test/

Dans le dossier poubelle/ supprimer tous les fichiers .txt en une commande.

    rm poubelle/*.txt 

## Exercice 2

Placez vous dans le dossier TP4/ex2/

Récupérer le fichier à l'adresse URL suivante à l'aide d'une commande

    https://www.data.gouv.fr/fr/datasets/r/55cd803a-998d-4a5c-9741-4cd0ee0a7699

    wget https://www.data.gouv.fr/fr/datasets/r/55cd803a-998d-4a5c-9741-4cd0ee0a7699

Renommer le fichier obtenu en prenoms.csv

    mv 55cd803a-998d-4a5c-9741-4cd0ee0a7699 prenoms.csv

Créer, en une ligne de commande, un fichier 'prenoms_a.txt' contenant tous les prenoms contenant la lettre 'a'.



A l'aide d'une commande et du fichier 'prenoms_a.txt', trouver le nombre de prenoms contenant la lettre 'a'.

    cut -d";" -f 1 prenoms.csv | grep a > prenoms_a.txt

A l'aide d'une commande et du fichier 'prenoms.csv', trouver le nombre de prenoms total dans cette base de données.

    wc prenoms.csv

Il y a 11628 lignes donc 11628 prénoms.


Quel est la proportion de prénoms qui contiennent la lettre 'a' ?

    wc prenoms_a.csv

Il y a 7266 prénoms qui contiennent 'a'. Donc la proporition de prénoms avec un 'a' est de 7266/11628 = 62%.

Créer un fichier contenant tous les prénoms qui commence par 'am'. (Indication : '| grep ^am' permet de filtrer les lignes qui commencent par 'am')

    cut -d";" -f 1 prenoms.csv | grep ^am > prenoms_am.txt

Créer un fichier contenant les prénoms d'origine hongroise (hungarian dans le fichier).

    grep hungarian prenoms.csv | cut -d";" -f 1 > prenoms_hongrois.txt


## Exercice 3

La commande 'ps ax' affiche la liste de tous les processus en cours.
Comment avec cette commande identifier le PID du logiciel 'thunderbird',  que vous aurez préalablement ouvert ?

    C'est la première colonne

Arreter le processus 'thunderbird'.

    kill 123456
    où 123456 est le PID de thunderbird

## Exercice 4

Dans le dossier TP4/, lancer la commande

    ./script.sh

Combien y a t-il de fichiers dans le dossier TP4/ex4/ que les autres utilisateurs peuvent modifier ?

    ls -l
    ---xrw--w- 1 ales ales 0 oct.   3 09:58 10.txt
    ----rw-rwx 1 ales ales 0 oct.   3 09:58 1.txt
    ----rw-r-- 1 ales ales 0 oct.   3 09:58 2.txt
    ----rw-rw- 1 ales ales 0 oct.   3 09:58 3.txt
    -r-xrw---x 1 ales ales 0 oct.   3 09:58 4.txt
    -r-xrw--w- 1 ales ales 0 oct.   3 09:58 5.txt
    ----rw--w- 1 ales ales 0 oct.   3 09:58 6.txt
    -rw-rw-rwx 1 ales ales 0 oct.   3 09:58 7.txt
    ----rw-rw- 1 ales ales 0 oct.   3 09:58 8.txt
    ----rw---- 1 ales ales 0 oct.   3 09:58 9.txt

    Il y a 7 fichiers que les autres utilisateurs peuvent lancer. (C'est la derniere colonne)

Ajouter les droits de lecture aux autres utilisateurs à tous les fichiers du dossier TP4/ex4/.

    chmod o+r *.txt

## Exercice 5

Combien y a t-il de fichiers qui ont 1 lien dans le dossier TP4/ex5/ ?

    ls -li
    540232 -rw-rw-r-- 1 ales ales 0 oct.   3 09:58 10.txt
    540230 -rw-rw-r-- 2 ales ales 0 oct.   3 09:58 1.txt
    540224 -rw-rw-r-- 1 ales ales 0 oct.   3 09:58 2.txt
    540223 -rw-rw-r-- 3 ales ales 0 oct.   3 09:58 3.txt
    540226 -rw-rw-r-- 1 ales ales 0 oct.   3 09:58 4.txt
    540227 -rw-rw-r-- 1 ales ales 0 oct.   3 09:58 5.txt
    540223 -rw-rw-r-- 3 ales ales 0 oct.   3 09:58 6.txt
    540223 -rw-rw-r-- 3 ales ales 0 oct.   3 09:58 7.txt
    540230 -rw-rw-r-- 2 ales ales 0 oct.   3 09:58 8.txt
    540231 -rw-rw-r-- 1 ales ales 0 oct.   3 09:58 9.txt

    Il y a 5 fichiers qui ont 1 lien.

Quels sont les groupes de fichiers qui sont en fait les mêmes ?

    540230 -rw-rw-r-- 2 ales ales 0 oct.   3 09:58 1.txt
    540230 -rw-rw-r-- 2 ales ales 0 oct.   3 09:58 8.txt

et

    540223 -rw-rw-r-- 3 ales ales 0 oct.   3 09:58 3.txt
    540223 -rw-rw-r-- 3 ales ales 0 oct.   3 09:58 6.txt
    540223 -rw-rw-r-- 3 ales ales 0 oct.   3 09:58 7.txt

montre que 1.txt et 8.txt sont les mêmes fichiers et 3.txt, 6.txt et 7.txt sont aussi un même fichier.


## Exercice 6

Dans le dossier TP4/ex6/.

Aller dans le dossier TP4/ex6/comestible/, afficher le contenu de 'pomme.txt' (en une seule commande donc sans se déplacer). Afficher le contenu de 'hydrogene.txt' (pareil).

    cat fruits/pomme.txt
    cat ../elements/hydrogene.txt 


Aller dans le dossier TP4/ex6/comestible/fruits/, afficher le contenu de 'tomate.txt' (pareil). Afficher le contenu de 'helium.txt' (pareil).

    cat ../legumes/tomate.txt 
    cat ../../elements/helium.txt 

## Exercice 7

Dans le dossier TP4/ex7/.
A l'aide d'une commande, créer un fichier qui l'affichage du contenu du dossier TP4/ex7/ et de ses sous-dossiers.

    ls -R > contenu.txt



## Exercice 8

Trouver le mot code à partir des indices dans le dossier TP4/ex8/

    ls -Ra

donne

    .:
    .  ..  comestible  elements

    ./comestible:
    .  ..  fruits  legumes

    ./comestible/fruits:
    .  ..  poire.txt  pomme.txt

    ./comestible/legumes:
    .  ..  .cachette  poireau.txt  tomate.txt
    ls: impossible d'ouvrir le répertoire './comestible/legumes/.cachette': Permission non accordée

    ./elements:
    .  ..  helium.txt  hydrogene.txt

On voit qu'il y a un dossier caché '.cachette' dans comestible/legumes/.
Il faut lui donner les droits pour y aller :

    chmod +rwx comestible/legumes/.cachette/

On y a va :

    cd comestible/legumes/.cachette/
    ls -a   

donne :

    .  ..  .cachette2

On va dans .cachette2 :

    cd .cachette2/

qui nous retourne une erreur :

    bash: cd: .cachette2/: Permission non accordée

On lui donne les droits :

    chmod +rwx .cachette2

On y va :

    cd .cachette2
    ls -a

Affiche :

    .  ..  .indice.txt

On affiche le fichier caché .indice.txt :

    cat .indice.txt

qui nous retourne une erreur :

    cat: .indice.txt: Permission non accordée

On lui donne les droits :

    chmod +rwx .indice.txt

Maintenant on peut l'afficher :

    cat .indice.txt

Le mot code est ROUTE.