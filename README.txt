_ "Une critique doit comporter au minimum une note ainsi qu'un texte détaillant l'avis de l'utilisateur "
	-> Du coups on va devoir mettre des commentaires.

_ Deux aspects :
	-> Consulter et ajouter de nouveaux objets (participants) / gérer les utilisateurs / ajouter des critiques.
	-> Faire des statistiques sur les notes / les utilisateurs.

Fonctionnalité :

_ Ordre SQL de gestion des utilisateurs ( inscription / radiation).
_ Ordre SQL de gestion de fond (ajout d'un nouveau participant / nouvelle compétition / nouveau centre équestre )
_ Consulter les objets :
	-> Les participants d'une compétition
	-> Les vainqueurs d'une compétition (podium)
_ Deux requetes statistiques sur les utilisateurs ou sur les notes :
	-> Moyenne des notes attribuées par chaque juge en Dressage.
	-> Meilleur note attribué par quel juge en Dressage ?

_ 1 requete sur trois table : OK
_ 1 requete avec fonction d'agrégat : OK
_ 1 requete avec COUNT : OK
_ 1 requete avec un GROUP BY .... HAVING : OK
_ 3 sous-requete de type différent : OK - OK - OK

En 10 minutes :
Vous devez rendre le au moment de la soutenance :
– votre modèle entité association, mis à jour si nécessaire,
– un schéma de vos tables,
– le script de création de vos tables,
– le script utilisé pour peupler vos tables de données,
– le code de vos requêtes. Chaque requête doit être précédée d’un commentaire qui explique
ce qu’elle fait.
Pour la soutenance, soyez prêts à répondre à des questions, concernant entre autres les contraintes
d’intégrité, les choix de modélisation, les points forts et les points faibles du travail réalisé, les
parties incomplètes, les améliorations qui restent à faire.
