# CM 1 : Arborescence, console et commandes

---

## Arborescence

### Chemins absolus

C'est la suite des dossiers qui permettent d'identifier l'emplacement d'un fichier ou d'un dossier.
Le dossier de départ s'appelle le dossier *racine* (ou *root*) en anglais, son chemin est simplement "/".

Attention ! Ne pas utiliser les antislashs \ qui sont utilisés sur Windows.

Exemples:

    /lib/apt/methods/
    /lib/apt/methods/file
    /var/log/auth.log


Les URL d'un site web reprennent la même notation : les chemins peuvent indiquer l'arborescence interne du site.

    https://www.umontpellier.fr/formation/admission-et-inscription/

### Chemins relatifs

Le dossier où l'on est :

    .

Le dossier parent :

    ..

Le dossier personnel :

    ~ 

Exemples :

    ./dossier/test/fichier.txt
    dossier/test/fichier.txt
    ../rep/exp/file.txt
    ~/ici/test.txt

---

## CLI et commandes

Interface : ce qui fait l'intermédiaire entre l'utilisateur et la machine.

Deux types : interface graphique et en ligne de commande

GUI = Graphical User Interface


CLI = Command Line Interface

en français on parle de *console* ou de *terminal*


### Avantage/Désavantage

GUI
- plus intuitif
- plus synthétique
- quand ça ne marche pas on ne voit pas ce qu'il se passe

CLI
- plus technique
- davantage de controle sur ce que l'on fait

En général tout ce que l'on peut faire avec un GUI peut être fait avec en CLI mais souvent c'est d'abord la partie CLI qui est implémenté car faire une interface graphique est un art à part entière.

---

## Commande

Une commande est une suite de mots séparés par des espaces avec des options précédées de tirets du 6.

Exemple :

    ls -lh

Une fois qu'on appuye sur Entrée la console affiche :

    moi@moi:~/TP1$ ls -lh
    total 12K
    drwxrwxr-x 2 moi moi 4,0K sept.  7 15:58 dossier
    -rw-rw-r-- 1 moi moi    7 sept.  6 15:40 fichier1.txt
    -rw-rw-r-- 1 moi moi   42 sept.  6 15:44 fichier2.txt

Le nom de la commande est souvent une abréviation anglaise.
Par exemple ls vient du verbe LiSt pour lister les fichiers dans un dossier.

Il y a beaucoup de commande déjà disponibles dans Linux mais on peut en télécharger d'autres ou fabriquer les siennes pour son utilisation (par exemple pour automatiser une tache répétitive).

### Manuel

toutes les commandes ont une documentation qu'on appelle "manuel" ou "man" en anglais.

Exemple : 

    man ls

Utilisation :
- flèches haut et bas pour parcourir la doc
- "q" pour quitter

---

## Astuces d'utilisation du terminal

Dans la documentation quand on voit ^C : le ^ est pour la touche Ctrl.

- Copier dans la console : le ^C, ^V ne marche pas dans la console. Il faut utiliser ^MajC et ^Maj V

- stopper la commande en cours d'éxecution si elle prend trop de temps (par exemple *find /*) :
    ^C

- noms de fichiers avec espace : mettre des "..." autour. Par exemple "Fichier fini.txt". Mieux vaut utiliser des tirets du bas (ou *underscore* en anglais) : Fichier_fini.txt.

- utiliser Tabulation pour compléter automatiquement un chemin

- flèches haut et bas pour naviguer dans l'historique des commandes lancées

---

## Commandes classiques

    ls : (LiSt) lister les fichier et dossiers du dossier courant
    cd : (Change Directory) aller dans le dossier spécifié
    mkdir : (MaKe DIRectory) créer un nouveau dossier
    rm : (ReMove) supprimer le fichier spécifié
    mv : (MoVe) déplacer un fichier ou un dossier, sert aussi à renommer
    cp : (CoPy) copier un fichier ou un dossier
    touch : créer un nouveau fichier
    cat : afficher le contenu du fichier dans la console
    pwd : (Print Working Directory) affiche le chemin absolu du dossier courant 
    nano : éditer un fichier
    clear : effacer le terminal

### Exemples d'utilisation

Copier le fichier *fichier.txt* dans le dossier *dossier/* qui se situe dans le même dossier où l'on se trouve.

    cp fichier.txt dossier/

On peut copier plusieurs fichiers en même temps en faisant

    cp fichier1.txt fichier2.txt dossier/

On peut copier tous les fichiers d'une même extension en même temps en faisant

    cp *.txt dossier/

l'étoile signifie "n'importe quel chaine de caractères".

