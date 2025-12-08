# CM 2 : Taille et droits

---

## Éditer un texte en console avec nano

La commande suivante lance un éditeur en console du fichier spécifié :

    nano fichier.txt

Si le fichier existe, il l'ouvre. S'il n'existe pas il en crée un nouveau.
Les modifications à l'intérieur se font de la même manière qu'un éditeur de texte normal sauf que ce n'est pas faire pour utiliser la souris.

Pour sauvegarder il faut faire ^O (Control + 0) puis Entrée pour valider le nom du fichier.
Pour quitter il faut faire ^X.


## Stocker des informations

Avant l'informatique : on stockait par exemple des informations sur des morceaux de papiers avec des lettres.
Les disques vinyle (ou microsillon) permettait aussi de stocker du son avant l'avénement informatique : les ondes sonores sont directement gravés sur une sorte de plastique.

Avec l'informatique, on utilise une représentation "binaire" de l'information : par un 0 ou un 1.
Les CDs, à la différence des disques vinyles, utilisent cette représentation de l'information : des creux et tas microscopiques sont gravés sur leur surface et représente un 0 ou un 1.

Après avoir inventé cette représentation binaire, il fallait faire un choix arbitraire pour coder les lettres classiques et d'autres instructions classiques à l'aide de bits : 0 ou 1.
Il a ainsi été décidé de tout encoder avec des blocs de 8 bits qu'on appelle octet (byte en anglais) et de choisir la correspondance suivante :

    A = 01000001
    B = 01000010
    C = 01000011
    ...

Ainsi que des caractères spéciaux :

    espace = 00100000
    ! = 00100001
    retour à la ligne = 00001101

Pour compacter cette écriture binaire, on peut la convertir en écriture décimale (la lecture normale des nombres) en utilisant la règle suivante : en allant de droite à gauche, pour chaque 1 rencontré on ajoute 2^k au nombre final où k est la position du bit en partant de la droite (et k commence à 0).
Pour bien différencier l'écriture binaire de l'écriture décimale l'écriture binaire sera entouré de parenthèses et d'un _2 : (1000)_2 ne veut pas dire 1000 (mille).

Exemples :

    (01000001)_2 = 2^6 + 2^0 = 64 + 1 = 65
    (01000010)_2 = 2^6 + 2^1 = 64 + 2 = 66
    (01000011)_2 = 2^6 + 2^1 + 2^0 = 64 + 2 + 1 = 67

Ainsi les codes précédents en écriture décimale sont :

    A = (01000001)_2 = 65
    B = (01000010)_2 = 66
    C = (01000011)_2 = 67
    espace = (00100000)_2 = 32
    ! = (00100001)_2 = 33
    retour à la ligne = (00001010)_2 = 10

Pour obtenir l'écriture binaire à partir de l'écriture décimale d'un nombre "n" on cherche la plus grande puissance de 2 inférieur au nombre "n", on met un 1 dans l'écriture binaire à la position de l'exposant de la puissance précédente et on recommence en retirant la puissance de 2 à n. On s'arrête quand on arrive à 0.

Exemple :

    67
    2^6 = 64 est la plus grande puissance de 2 inférieur à 67
    on retire 64 à 67 :
    67 - 64 = 3
    on recommence avec 3 :
    2^1 = 2 est la plus grande puissance de 2 inférieur à 3
    on retire 2 à 3 :
    3 - 2 = 1
    on recommence avec 1 :
    2^0 est la plus grande puissance de 2 inférieur à 1
    on retire 1 à 1 :
    1 - 1 = 0
    On s'arrête quand on arrive à 0.
    On forme l'écriture binaire de 67 :
    (01000011)_2




## Fichiers textes et binaires

Un fichier *texte* est un fichier humainement compréhensible (même compliqué il doit avoir un manuel de décodage).
Un fichier *binaire* est un fichier qui n'est pas humainement compréhensible. Seul la machine sait le décoder (quand on a installé les logiciels adéquats).

Exemples de fichiers textes :
- .txt
- les fichiers de configuration
- les codes sources

Exemples de fichiers binaires :
- les images .jpg .png
- les vidéos .mp4
- les musiques .mp3 .wav .ogg
- les éxecutables (.exe sur Windows) (les éxecutables sur linux n'ont pas d'extension)

Les fichiers textes peuvent être lu avec la commande 'cat'.
Les fichiers binaires peuvent être "lu" avec la commande 'xxd' ou 'hexdump'.


### Avatanges/Inconvénients :

En général les avantages et inconvénients de ces deux types de fichiers sont les suivants :

Fichier texte
- facilement débogable
- plus volumineux
- plus lent à être utilisé par la machine

Fichier binaire
- quasi impossible à déboger
- plus léger 
- plus rapide


## Droits (ou permissions) d'un fichier

### Types de fichier 

Pour connaitre le type d'un fichier on fait

    ls -l

Le premier caractère indique le type du fichier :

    - est un fichier régulier
    d est un dossier
    l est un lien

Il y a d'autres types plus compliqués.

### Droits et types d'utilisateurs

- r = read = droit en lecture
- w = write = droit en écriture
- x = execute = droit en execution

Trois types d'utilisateurs :

- u = user = l'utilisateur
- g = group = groupe d'utilisateur
- o = others = les autres

Exemple pour un fichier :
    
    rwx r-x -w-

l'utilisateur peut : lire, modifier et éxecuter le fichier
Le groupe peut : lire et éxecuter le fichier
Les autres utilisateurs : uniquement modifier le fichier

Pour un dossier, les droits veulent dire autre chose.
- r veut dire qu'on peut lire le contenu du dossier (c'est à dire faire ls dedans).
- w veut dire qu'on peut créer des fichiers dedans
- x veut dire qu'on peut traverser le dossier à l'aide de cd

### Changer les droits

On utilise la commande

    chmod

suivie des droits que l'on modifie et du fichier considéré.

Exemples :

    chmod u+x fichier.txt
    chmod +r fichier.txt
    chmod o-w

Le premier rajoute le droit d'éxecution à l'utilisateur.
Le second rajoute le droit de lecture à tout le monde.
Le troisième enlève le droit d'écriture aux autres.