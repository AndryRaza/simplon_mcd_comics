## Exercice 

``En utilisant les informations du MCD. Vous devez procéder aux corrections qui vous semblent nécessaires. Puis créer la base de données sous MySQL (voir mcd_comics.png) ``

## Table Comics

Un comics a un ISBN unique, et est stocké en varchar car je le considère comme une chaine de caractère de chiffres de longueur 13. 
Il a un titre, un résumé et une date de parution. 

### Relation 1-to-Many

- un comics appartient à UNE époque 
- un comics peut appartenir à UNE collection 
- un comics peut appartenir à UNE série (hors série d'où le peut) 
- un comics appartient à UN univers
- un comics est publié par UN éditeur 
- un comics est dessiné par UN dessinateur (source : google)

### Relation Many-To-Many

- un comics est écrit par UN ou PLUSIEURS éditeurs
- un comics possède UN ou PLUSIEURS personnages
- un comics possède ZERO ou PLUSIEURS récompenses ET une récompense peut être attribuée à plusieurs comics dans certains cas particuliers
- un comics peut être écrit par UN ou  plusieurs scénaristes 

## Nouvelles tables 

Deux nouvelles tables ont été créées pour les scénaristes et dessinateurs. Ceux-ci étaient des champs dans la table "comics". 

## Général

Les champs "description/descriptif" ont été modifiés en type "TEXT"
Les champs "dateparution/date" ont été modifiés en type "DATE" l'heure n'étant pas nécessaire. 
Les champs "annees" ont été modifiés en type "YEAR" pour une question de logique. 


## Schema 

<img src="test_concepteur.svg">