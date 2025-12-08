#!/bin/bash 
rm -rf sujet/

if (( $# == 0 )); then
    echo "Relancer le script en rajoutant votre numéro d'étudiant.e"
    exit
fi

r=$1
a=23321
b=43988
m=46773

nextrandom(){
r=$(( ($a*$r+$b) %$m))
return $r
}




mkdir sujet
mkdir sujet/ex1

touch sujet/$1.txt

cp villes.csv sujet/ex1

# ---

mkdir sujet/ex2
mkdir sujet/ex2/villes
touch sujet/ex2/villes/lyon.txt
mkdir sujet/ex2/pays
touch sujet/ex2/pays/senegal.txt
mkdir sujet/ex2/villes/capitales
touch sujet/ex2/villes/capitales/paris.txt
mkdir sujet/ex2/villes/prefectures
touch sujet/ex2/villes/prefectures/caen.txt
mkdir sujet/ex2/pays/microetat
touch sujet/ex2/pays/microetat/lichtenstein.txt

mv sujet/ex2/pays/microetat/lichtenstein.txt sujet/ex2/villes
mv sujet/ex2/pays/senegal.txt sujet/ex2/villes/prefectures
mv sujet/ex2/villes/capitales/paris.txt sujet/ex2/villes
mv sujet/ex2/villes/prefectures/caen.txt sujet/ex2/pays/microetat
mv sujet/ex2/villes/lyon.txt sujet/ex2/pays

# EX3

path=sujet/ex3

mkdir $path

for i in {1..10}
do
   touch $path/$i.txt
   nextrandom
   if  ((1 + $r %2 == 1)); then
      chmod u+w $path/$i.txt
   else
      chmod u-w $path/$i.txt
   fi
   nextrandom
   if  ((1 + $r %2 == 1)); then
      chmod u+x $path/$i.txt
   else
      chmod u-x $path/$i.txt
   fi
   nextrandom
   if  ((1 + $r %2 == 1)); then
      chmod u+r $path/$i.txt
   else
      chmod u-r $path/$i.txt
   fi
   nextrandom
   if  ((1 + $r %2 == 1)); then
      chmod o+w $path/$i.txt
   else
      chmod o-w $path/$i.txt
   fi
   nextrandom
   if  ((1 + $r %2 == 1)); then
      chmod o+x $path/$i.txt
   else
      chmod o-x $path/$i.txt
   fi
   nextrandom
   if  ((1 + $r %2 == 1)); then
      chmod o+r $path/$i.txt
   else
      chmod o-r $path/$i.txt
   fi
done

ls -l $path

# EX4

path=sujet/ex4
mkdir $path
echo "test" > $path/test.txt

# EX 5

path=sujet/ex5
mkdir $path

for i in {1..10}
do
   touch $path/$i.txt
   touch $path/$i.csv
done


echo "Votre sujet a été généré dans le dossier sujet/"