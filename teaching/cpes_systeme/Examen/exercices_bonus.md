## Exercice 

Concaténer deux fichiers dans un troisième.
(Ou alors un nombre arbitraire en echo)

### Solution

```bash
while read ligne
do 
    echo $ligne >> $3
done < $1

while read ligne
do 
    echo $ligne >> $3
done < $2
```


## Exercice 5

Ecrire un script en complétant le fichier `ex.sh` qui demande à l'utilisateur de rentrer un nombre tant que ce nombre est strictement supérieur à 10.
On note `n` ce nombre obtenu. Afficher la valeur de `n+1000`.

## Solution 5

```bash
read n
while (( $n > 10 ))
do
    read n
done
echo $(( $n +1000 ))
```