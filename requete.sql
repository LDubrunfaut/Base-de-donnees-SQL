/* Le cavalier ayant obtenu la meilleure note de toutes les competitions de CSO ou Cross selon le choix, avec AUCUNE pénalité.*/
/* Requete 1 */

PREPARE meilleure_note_CSO_ou_CROSS(VARCHAR) AS
SELECT nomCavalier, prenomcavalier, note1, penalite
FROM participe JOIN cavalier ON (cavalier.idCavalier=participe.idcavalier)
WHERE note1 = (Select MAX(note1) 
FROM participe JOIN activite ON(participe.idActivite=activite.idActivite)
WHERE nomactivite = $1
AND penalite = 0
);

/* Plus simplement : */
/* Requete 2 */

PREPARE meilleure_note_CSO_ou_CROSS2(VARCHAR) AS
SELECT nomCavalier, prenomcavalier, note1, penalite
FROM participe, cavalier
WHERE cavalier.idCavalier=participe.idcavalier
AND note1 = (Select MAX(note1)
FROM participe, activite 
WHERE participe.idActivite=activite.idActivite
AND nomactivite = $1
AND penalite = 0
);

/* Le cavalier ayant obtenu le meilleure score (moyenne des 3 Notes) de toutes les competitions de Dressage. */
/* Requete 3 */

SELECT nomCavalier, prenomcavalier, total/3 AS Moyenne
FROM participe, cavalier
WHERE cavalier.idCavalier=participe.idcavalier
AND total = (Select MAX(total)
FROM participe, activite 
WHERE participe.idActivite=activite.idActivite
AND nomactivite = 'Dressage'
);

/* Le meilleure cavalier de Cross et à quelle compétition il a obtenu cette performance : */
/* Requete 4 */

SELECT nomCavalier, prenomcavalier, note1, penalite, nomCompetition
FROM cavalier JOIN participe ON (cavalier.idCavalier=participe.idcavalier) JOIN competition ON (participe.idCompetition=competition.idcompetition)
WHERE note1 = (Select MAX(note1) 
FROM participe JOIN activite ON(participe.idActivite=activite.idActivite)
WHERE nomactivite = 'Cross'
AND penalite = 0
);

/* ------------------------------------------------------------ */

/* Combien de cavalier(s) ont participé à la compétition saisie par l'utilisateur dans l'activité saisie par l'utilisateur.*/
/* Requete 5 */

PREPARE Nombre_participants(VARCHAR,VARCHAR) AS
SELECT COUNT(DISTINCT idCavalier)
FROM competition JOIN participe ON (participe.idCompetition = competition.idCompetition) JOIN activite ON (activite.idactivite = participe.idactivite)
WHERE nomCompetition = $1
AND nomactivite = $2;

/* Combien de juge(s) y-a-t-il dans la compétition saisie par l'utilisateur dans l'activité saisie par l'utilisateur.
Vérification pour l'organisateur qu'il n'y a pas de doublon.*/
/* Requete 6 */

PREPARE Nombre_juges(VARCHAR,VARCHAR) AS
SELECT COUNT(DISTINCT idjuge)
FROM rang JOIN activite ON (rang.idactivite = activite.idactivite) JOIN competition ON(competition.idcompetition = activite.idcompetition)
WHERE nomcompetition = $1
AND nomactivite = $2
;

/* -------------------------------------------------------------- */

/* La moyenne des notes attribuées par chaque juge, quel est la sévérité de chaque juge en moyenne sur les compétitions de Dressage */

/*(par convention on a définie note1 = juge du rang1, etc) */
/* Requete 7 */

SELECT AVG(note1) AS Moyenne_juge_1, AVG(note2) AS Moyenne_juge_2, AVG(note3) AS Moyenne_juge_3
FROM participe
WHERE idactivite = (Select idactivite
FROM activite
WHERE nomactivite ='Dressage'
LIMIT 1
);

/* Ou avec un join */
/* Requete 8 */

SELECT AVG(note1) AS Moyenne_juge_1, AVG(note2) AS Moyenne_juge_2, AVG(note3) AS Moyenne_juge_3
FROM participe JOIN activite ON (participe.idactivite=activite.idactivite)
WHERE nomactivite = 'Dressage';

/* La note la plus sévère de chaque juge dans les compétitions de Dressage.*/
/* Requete 9 */

SELECT MIN(note1) AS Note_juge_1, MIN(note2) AS Note_juge_2, MIN(note3) AS Note_juge_3
FROM participe
WHERE idactivite = (Select idactivite
FROM activite
WHERE nomactivite ='Dressage'
LIMIT 1
);

/* -------------------------------------------------------------- */


/* Afficher les participants (cavalier/cheval/centre) inscrits */
/* Requete 10 */

CREATE VIEW participants AS
SELECT nomcavalier, prenomcavalier, nomcheval, nomCentre
FROM cavalier LEFT JOIN centre ON (cavalier.idcentre = centre.idcentre)
GROUP BY nomCentre, nomcavalier, prenomcavalier, nomcheval
ORDER BY nomcentre;

/* Il est possible d'avoir des cavaliers sans centre d'où le left join */

/* -------------------------------------------------------------- */


/* Afficher le classement de la compétition de Cross du Complet de l été.*/
/* Requete 11 */

CREATE VIEW classement AS
SELECT DISTINCT nomCavalier, total
FROM cavalier, participe
WHERE (cavalier.idcavalier,total) IN (SELECT idcavalier,total
FROM participe
GROUP BY idcavalier, total, idcompetition, idactivite
HAVING idcompetition = (SELECT idcompetition
FROM competition
WHERE nomcompetition = 'Complet de l été')
AND idactivite = (SELECT idactivite
FROM activite
WHERE nomactivite = 'Cross'
LIMIT 1))
ORDER BY total desc;

/* Affiche le Podium de cette activité de la compétition Le Complet de l été */
/* Requete 12 */

CREATE VIEW podium AS
SELECT DISTINCT nomCavalier, total
FROM cavalier, participe
WHERE (cavalier.idcavalier, total) IN (SELECT idcavalier,total
FROM participe
GROUP BY idcavalier, total, idcompetition, idactivite
HAVING idcompetition = (SELECT idcompetition
FROM competition
WHERE nomcompetition = 'Complet de l été')
AND idactivite = (SELECT idactivite
FROM activite
WHERE nomactivite = 'Cross'
LIMIT 1))
ORDER BY total desc
LIMIT 3;

/* Ou à partir de la vue Classement :*/
/* Requete 13 */

CREATE VIEW podium AS
SELECT DISTINCT nomCavalier, total
FROM classement
LIMIT 3;

/* -------------------------------------------------------------- */

/* Gestion des utilisateurs 
	-> Inscrire un nouvel utilisateur : */
/* Requete 14 */
PREPARE Creation_Juge(VARCHAR,VARCHAR) AS
INSERT INTO JUGE(nomJuge, mdp) values ($1,$2);

/*
	-> Supression d un utilisateur : */
/* Requete 15 */

PREPARE Supression_juge(VARCHAR, VARCHAR) AS
DELETE FROM juge 
WHERE nomjuge = $1
AND mdp = $2
;

/* Ajout d'un participant */
/* Requete 16 */

PREPARE Creation_participant(INTEGER, VARCHAR, VARCHAR, INTEGER, VARCHAR, INTEGER) AS
insert into CAVALIER (idCavalier, nomCavalier, prenomCavalier, ageCavalier, nomCheval, idCentre) values($1,$2,$3,$4,$5,$6);

/* S'il n'est dans aucun centre il doit etre rentré manuellement idcentre = NULL */





