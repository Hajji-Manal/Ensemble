# Ensemble
Notre objectif est de définir une structure de données de type ensemble. Par exemple, on peut
considérer un ensemble d’entiers E1 composé des éléments 5, 10 et 7 que l’on notera {5, 10, 7},
comme en mathématiques. Dans un ensemble l’ordre des éléments n’a pas d’importance. Ainsi
{5, 10, 7} et {7, 5, 10} correspondent au même ensemble.
Un ensemble est équipé d’opérations qui permettent de :
1. Savoir si un ensemble est vide ou pas.
2. Obtenir la taille d’un ensemble (le nombre d’éléments qu’il contient).
3. Savoir si un élément est présent dans un ensemble.
4. Ajouter un élément dans un ensemble.
5. Supprimer un élément d’un ensemble.

Il existe aussi un sous-programme qui permet d’initialiser un ensemble (il est vide) et un sousprogramme qui permet de
détruire un ensemble (libérer les ressources qu’il utilise).

Ce nouveau type Ensemble et les sous-programmes associés seront définis dans un module.

Pour que ce module soit utilisable dans différents contextes, il faut permettre à ses utilisateurs de
choisir le type des éléments de l’ensemble (un ensemble d’entiers, de caractères, de dates, etc.).

Nous souhaitons avoir deux versions de ce module. La première, Ensembles_Tableau utilisera
un tableau pour stocker les éléments de l’ensemble. La seconde, Ensembles_Chainage, utilisera
l’allocation dynamique de mémoire 2 pour chaîner linéairement les éléments de l’ensemble.

L’objectif est donc de définir ces modules génériques, leurs programmes de test et un programme les utilisant.
