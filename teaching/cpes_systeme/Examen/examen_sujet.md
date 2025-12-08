# Examen

## Consignes

Extraire le fichier téléchargé si ce n'est pas déjà fait.
Penser à donner les droits d'éxecution aux scripts avec la commande :

```bash
chmod +x fichier.sh
```

Pour rendre votre travail :

- compresser le dossier Examen (clic droit + compresser)
- le rendre sur Moodle

---

## Exercice 1

Compléter les lignes commençant par `#` dans le fichier `ex1.sh` pour que ce script demande à l'utilisateur un nombre et affiche pair s'il est pair et affiche le double de ce nombre sinon.

## Exercice 2

Ecrire dans le fichier `ex2.sh` un script qui déplace tous les fichiers `.txt` du dossier `ex2` dans le dossier `ex2/chats` puis supprime le fichier `ex2/test.temp`.

## Exercice 3

Compléter les lignes commençant par `#` dans le fichier `ex3.sh` pour que ce script crée dans le dossier `ex3` des fichiers `1.txt`, `2.txt`, ... , `n.txt` où `n` est le paramètre fourni au script. Chaque fichier `i.txt` doit contentir le carré de `i`.

## Exercice 4

Le fichier `ex4/data.csv` contient les résultats des 10 derniers matchs du MHR. La première colonne contient le nom de l'adversaire, la seconde les points du MHR, la troisième les points de l'adversaire et la dernière contient "dom" si le match était à domicile et "ext" sinon.

Ecrire un script dans `ex4.sh` qui affiche les adversaires contre qui le MHR a perdu d'au plus 5 points.

Indication : il n'y a pas d'espaces dans le fichier de données donc pas de problème avec les guillemets "".

## Exercice 5

Ecrire un script dans `ex5.sh` qui affiche le nombre de fichiers dans le dossier spécifié en paramètre.

## Exercice 6

Ecrire un script dans le fichier `ex6.sh` qui crée un dictionnaire `tab` et qui donne une valeur aléatoire entre 0 et 100 à la clef `A` puis qui incrémente de 1 cette valeur. Finir en affichant la valeur de la clef `A`.
